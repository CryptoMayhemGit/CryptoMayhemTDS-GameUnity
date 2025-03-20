using System.Collections.Generic;
using UnityEngine;

namespace Assets.Scripts.Inventory
{
    public class PlayerItems : CharacterComponent
    {
        [SerializeField] private Containers.PlayerContainer player = null;

        private readonly Dictionary<int, ConsumableItemInstance> itemInstances = new();

        public IEnumerable<ConsumableItemInstance> Items => itemInstances.Values;

        public override void OnSpawn()
        {
            base.OnSpawn();

            ConsumableItem item;
            for (var i = 0; i < player.Inventory.Items.Length; i++)
            {
                item = player.Inventory.Items[i];
                if (item != null)
                    itemInstances.Add(i, new(item));
            }
        }

        public override void OnDespawn()
        {
            base.OnDespawn();

            itemInstances.Clear();
        }

        public bool CanUse(int key)
        {
            var instance = itemInstances[key];
            return !(player.Cooldowns.Contains(instance) || !itemInstances[key].CanUse(player));
        }

        public void Use(int key)
        {
            var instance = itemInstances[key];
            instance.Use(player);

            player.Inventory.Items[key] = null;
            
            //for now one use is enough to remove item from eq! 
            //In further case we can use uses left to define if player should remove item only after all uses!
            RemoveItemAfterUse(key);
            
            player.Cooldowns.Add(instance);
        }

        private void RemoveItemAfterUse(int key) => player.Inventory.RemoveItemAfterUse(key);
    }
}