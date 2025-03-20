using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using Pooling;
using UnityEngine;

// source: https://gist.github.com/MohHeader/270acd1224e35b89e9f411785ba43562

/*
Quadtree by Just a Pixel (Danny Goodayle) - http://www.justapixel.co.uk
Copyright (c) 2015
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

	// Any object that you insert into the tree must implement this interface
	public interface IQuadTreeObject
	{
		Vector2 GetPosition();
		void OnRemoved();
	}
	
	public sealed class QuadTree2<T> : IDisposable where T : IQuadTreeObject
	{
		private const int CapacityPerNode = 4;
		private const int MaxDepth = 8;
		
		private bool isDisposed = true;
		private int depth;
		private Rect bounds;
		private List<T> storedObjects;
		private QuadTree2<T>[] cells;
		private QuadTree2<T> parent;

		private QuadTree2() { }

		public bool IsLeaf() => !isDisposed && cells[0] == null;
		public bool IsDisposed() => isDisposed;
		
		public QuadTree2<T> Insert(T objectToInsert)
		{
			if (cells[0] != null)
			{
				var pos = objectToInsert.GetPosition();
				var iCell = GetCellToInsertObject(in pos);
				if (iCell > -1)
				{
					var cell = cells[iCell].Insert(objectToInsert);
					if (cell != null)
						return cell;
				}

				return null;
			}

			storedObjects.Add(objectToInsert);

			//Objects exceed the maximum count
			if (storedObjects.Count > CapacityPerNode && depth < MaxDepth)
			{
				//Split the quad into 4 sections
				if (cells[0] == null)
				{
					float subWidth = (bounds.width / 2f);
					float subHeight = (bounds.height / 2f);
					float x = bounds.x;
					float y = bounds.y;
					
					cells[0] = Create(this, new Rect(x + subWidth, y, subWidth, subHeight));
					cells[1] = Create(this, new Rect(x, y, subWidth, subHeight));
					cells[2] = Create(this, new Rect(x, y + subHeight, subWidth, subHeight));
					cells[3] = Create(this, new Rect(x + subWidth, y + subHeight, subWidth, subHeight));
				}

				//Reallocate this quads objects into its children
				var index0 = storedObjects.Count - 1;
				while (index0 >= 0)
				{
					var storedObj = storedObjects[index0];
					var pos = storedObj.GetPosition();
					int iCell = GetCellToInsertObject(in pos);
					if (iCell > -1)
					{
						cells[iCell].Insert(storedObj);
					}

					storedObjects.RemoveAt(index0);
					index0--;
				}

				for (var index1 = 0; index1 < cells.Length; index1++)
				{
					var c = cells[index1];
					if (c.storedObjects.Contains(objectToInsert))
						return c;
				}
			}
			
			return this;
		}
		
		public bool Remove(T objectToRemove)
		{
			if (ContainsLocation(objectToRemove.GetPosition()))
			{
				if (storedObjects.Remove(objectToRemove))
					objectToRemove.OnRemoved();
				
				if (cells[0] != null)
				{
					for (var index0 = 0; index0 <= 3; index0++)
					{
						var obj = cells[index0];
						if (obj.Remove(objectToRemove))
							return true;
					}
				}
				else if (parent != null)
					return parent.ClearEmptyLeafs();
			}
			
			return false;
		}

		private bool ClearEmptyLeafs()
		{
			bool any = false;
			for (var index0 = 0; index0 < cells.Length; index0++)
			{
				var cell = cells[index0];
				if (cell.storedObjects is { Count: > 0 })
				{
					any = true;
					break;
				}
			}

			if (!any)
			{
				Return(cells[0]);
				Return(cells[1]);
				Return(cells[2]);
				Return(cells[3]);

				cells[0] = null;
				cells[1] = null;
				cells[2] = null;
				cells[3] = null;

				parent?.ClearEmptyLeafs();

				return true;
			}

			return false;
		}

		public void RetrieveObjectsInAreaNoAlloc(Rect area, List<T> results)
		{
			if (RectOverlap(in bounds, in area))
			{
				for (var index0 = 0; index0 < storedObjects.Count; index0++)
				{
					var obj = storedObjects[index0];
					if (obj != null && area.Contains(obj.GetPosition()))
						results.Add(storedObjects[index0]);
				}

				if (cells[0] != null)
				{
					for (var index0 = 0; index0 < 4; index0++)
						cells[index0].RetrieveObjectsInAreaNoAlloc(area, results);
				}
			}
		}

		public void Dispose()
		{
			parent = default;
			bounds = default;
			depth = default;
			isDisposed = true;
			
			for (var index0 = 0; index0 < storedObjects.Count; index0++)
				storedObjects[index0].OnRemoved();
			storedObjects.Clear();
			ListPool.Return(storedObjects);
			storedObjects = default;
			
			for (var index0 = 0; index0 < cells.Length; index0++)
			{
				Return(cells[index0]);
				cells[index0] = null;
			}
			ArrayPool.Return(cells);
			cells = default;
		}

		public bool ContainsLocation(in Vector2 location)
		{
			return bounds.Contains(location);
		}

		private int GetCellToInsertObject(in Vector2 location)
		{
			for (int index0 = 0; index0 < 4; index0++)
			{
				if (cells[index0].ContainsLocation(in location))
					return index0;
			}

			return -1;
		}
		
		public void DrawDebug()
		{
			Gizmos.DrawLine(new Vector3(bounds.x, bounds.y, 0f),
				new Vector3(bounds.x, bounds.y + bounds.height, 0f));
			Gizmos.DrawLine(new Vector3(bounds.x, bounds.y, 0f),
				new Vector3(bounds.x + bounds.width, bounds.y, 0f));
			Gizmos.DrawLine(new Vector3(bounds.x + bounds.width, bounds.y, 0f),
				new Vector3(bounds.x + bounds.width, bounds.y + bounds.height, 0f));
			Gizmos.DrawLine(new Vector3(bounds.x, bounds.y + bounds.height, 0f),
				new Vector3(bounds.x + bounds.width, bounds.y + bounds.height, 0f));

			if (cells == null || cells.Length == 0 || cells[0] == null)
			{
				return;
			}

			for (var index0 = 0; index0 < cells.Length; index0++)
			{
				if (cells[index0] != null)
					cells[index0].DrawDebug();
			}
		}
		
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private static bool RectOverlap(in Rect a, in Rect b)
		{
			bool xOverlap = ValueInRange(a.x, b.x, b.x + b.width) ||
			                ValueInRange(b.x, a.x, a.x + a.width);

			bool yOverlap = ValueInRange(a.y, b.y, b.y + b.height) ||
			                ValueInRange(b.y, a.y, a.y + a.height);

			return xOverlap && yOverlap;
		}
		
		[MethodImpl(MethodImplOptions.AggressiveInlining)]
		private static bool ValueInRange(in float value, float min, float max)
		{
			return value >= min && value <= max;
		}
		
		public static QuadTree2<T> Create(QuadTree2<T> parent, Rect bounds)
		{
			var obj = Pool.Get();
			obj.parent = parent;
			obj.isDisposed = false;
			if (parent != null)
				obj.depth = parent.depth + 1;
			else obj.depth = 0;
			obj.bounds = bounds;
			obj.storedObjects = ListPool.Get();
			obj.cells = ArrayPool.Get();
			return obj;
		}
		
		public static void Return(QuadTree2<T> obj) => Pool.Return(obj);
		private static readonly GenericPool<QuadTree2<T>> Pool = new(() => new QuadTree2<T>());
		private static readonly GenericPoolUnreliable<List<T>> ListPool = new(() => new List<T>(CapacityPerNode));
		private static readonly GenericPoolUnreliable<QuadTree2<T>[]> ArrayPool = new(() => new QuadTree2<T>[4]);
	}