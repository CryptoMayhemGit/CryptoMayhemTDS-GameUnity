// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "terrainPrototypeDEBUG_Shader"
{
	Properties
	{
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Enum(Checkboard,0,UV_World,1,DistanceRange,2,CustomLight,3,EdgeDetect,4,Texture,5)]_DEBUG_SLOT_1("DEBUG_SLOT_1", Range( 0 , 5)) = 4.461836
		[Enum(Checkboard,0,UV_World,1,DistanceRange,2,CustomLight,3,EdgeDetect,4,Texture,5)]_DEBUG_SLOT_2("DEBUG_SLOT_2", Range( 0 , 5)) = 0
		_DEBUG_LERP("DEBUG_LERP", Range( 0 , 1)) = 0
		[Header(GLOBAL PROPERTIES)][Header(.)]_globalProperties("", Color) = (0.2196079,0.2196079,0.2196079,0)
		_smoothness("smoothness", Range( 0 , 1)) = 1
		_metalic("metalic", Range( 0 , 1)) = 0
		_emsissionIntensity("emsissionIntensity", Range( -10 , 10)) = 0
		_UV_ratioX("UV_ratioX", Range( 0 , 1)) = 1
		_UV_ratioY("UV_ratioY", Range( 0 , 1)) = 1
		[Header(CHECKBOARD)][Header(.)]_checkboard("", Color) = (0.2196079,0.2196079,0.2196079,0)
		_checkboard_hint("checkboard_hint", Color) = (0.6550803,1,0.495283,1)
		[ToggleUI]_offsetCenteringCheckboard("offsetCenteringCheckboard", Range( 0 , 1)) = 0
		_offsetX_Checkboard("offsetX_Checkboard", Range( -1 , 1)) = 0
		_offsetY_Checkboard("offsetY_Checkboard", Range( -1 , 1)) = 0
		_scale_Checkboard("scale_Checkboard", Float) = 10
		_checkboardLerp("checkboardLerp", Range( 0 , 1)) = 1
		[Header(DISTANCE RANGE)][Header(.)]_distance("", Color) = (0.2196079,0.2196079,0.2196079,0)
		_distancePositionX("distancePositionX", Range( -500 , 500)) = 0
		_distancePositionY("distancePositionY", Range( -500 , 500)) = 0
		_distanceHardness("distanceHardness", Range( -1 , 1)) = 0
		_distanceRange("distanceRange", Float) = 1
		_distanceBorderSize("distanceBorderSize", Float) = 0.1
		[HDR]_distanceInnerColor("distanceInnerColor", Color) = (0.496,0.496,0.496,0)
		[HDR]_distanceBorderColor("distanceBorderColor", Color) = (0,1,0.8499999,0)
		_distanceBackgroundColor("distanceBackgroundColor", Color) = (0.25,0.25,0.25,0)
		[Header(LIGHT TEST_01)][Header(.)]_lightTest_01("", Color) = (0.2196079,0.2196079,0.2196079,0)
		_lightHardness("lightHardness", Float) = 0
		_lightRange("lightRange", Float) = 1
		_lightHeight("lightHeight", Float) = 0
		[Header(EDGE DETECT)][Header(.)]_EDGEDETECT("", Color) = (0.2196079,0.2196079,0.2196079,0)
		_visualizeCameraDepth("visualizeCameraDepth", Range( 0 , 1)) = 0
		_cameraDepthLenght("cameraDepthLenght", Float) = 100
		_cameraDepthOffset("cameraDepthOffset", Float) = 0
		_edgeHardness("edgeHardness", Float) = 0.25
		_edgeRange("edgeRange", Float) = 0.5
		[Header(TEXTURE)][Header(.)]_Color5("Color 5", Color) = (0.2196079,0.2196079,0.2196079,0)
		[IntRange][Enum(Value,0,Albedo,1,Roughness,2,Metalic,3,Normal,4)]_texture_DEBUG_SLOT_1("texture_DEBUG_SLOT_1", Range( 0 , 4)) = 0
		[IntRange][Enum(Value,0,Albedo,1,Roughness,2,Metalic,3,Normal,4)]_texture_DEBUG_SLOT_2("texture_DEBUG_SLOT_2", Range( 0 , 4)) = 1
		_texture_DEBUG_LERP("texture_DEBUG_LERP", Range( 0 , 1)) = 0
		_noiseScale("noiseScale", Float) = 5
		_noiseAnlge("noiseAnlge", Float) = 0
		_noiseSmoothness("noiseSmoothness", Range( 0 , 1)) = 0
		_noiseHardness("noiseHardness", Float) = 0
		_noiseRange("noiseRange", Float) = 1
		[Toggle]_textureSmoothnessOn("textureSmoothnessOn", Range( 0 , 1)) = 0
		_smoothnessHardness("smoothnessHardness", Float) = 0
		_smoothnessRange("smoothnessRange", Float) = 1
		[IntRange][Enum(Option1,0,Option2,1,Option3,2,Option4,3,Option5,4,Option6,5,grayscale,6)]_gradient_DEBUG_SLOT_1("gradient_DEBUG_SLOT_1", Range( 0 , 5)) = 0
		[IntRange][Enum(Option1,0,Option2,1,Option3,2,Option4,3,Option5,4,Option6,5,grayscale,6)]_gradient_DEBUG_SLOT_2("gradient_DEBUG_SLOT_2", Range( 0 , 5)) = 1
		_gradient_DEBUG_LERP("gradient_DEBUG_LERP", Range( 0 , 1)) = 0
		[Toggle]_gradientInvert("gradientInvert", Range( 0 , 1)) = 0
		[Toggle]_gradienMultiplyByValue("gradienMultiplyByValue", Range( 0 , 1)) = 0
		_HHue("[H] Hue", Range( 0 , 1)) = 0
		_SSaturation("[S] Saturation", Range( 0 , 1)) = 1
		_VValue("[V] Value", Range( -10 , 10)) = 0
		_emissionColor("emissionColor", Color) = (1,0,0,0)
		[Toggle]_textureEmissionOn("textureEmissionOn", Range( 0 , 1)) = 0
		_textureEmissionIntensity("textureEmissionIntensity", Float) = 2
		_valueSelect("valueSelect", Range( 0 , 1)) = 0
		_valueRange("valueRange", Range( 0 , 1)) = 1
		_valueRangeLower("valueRangeLower", Range( 0 , 1)) = 1
		_valueRangeHigher("valueRangeHigher", Range( 0 , 1)) = 1
		_hexScale("hexScale", Float) = 2
		_hexNoiseDistortionScale("hexNoiseDistortionScale", Float) = 15
		[ASEEnd]_hexDistortion("hexDistortion", Float) = 50

		[HideInInspector]_EmissionColor("Color", Color) = (1, 1, 1, 1)
		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector] [ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector] [ToggleUI]_SupportDecals("Boolean", Float) = 1
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 6
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 8
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 40
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 40
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 14
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 10
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector] [ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector] [ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] [ToggleUI] _ReceivesSSRTransparent("Boolean", Float) = 0
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector][ToggleUI]_AlphaToMask("Boolean", Float) = 0//New
        [HideInInspector][ToggleUI]_AlphaToMaskInspectorValue("Boolean", Float) = 0//New
		[HideInInspector] [ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector] [ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 1
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Int) = 0
		[HideInInspector] [ToggleUI] _EnableFogOnTransparent("Enable Fog On Transparent", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2
		[HideInInspector] [Enum(Front, 1, Back, 2)] _TransparentCullMode("Transparent Cull Mode", Float) = 2
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)]_OpaqueCullMode("Float", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4
		[HideInInspector] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Float) = 4
		[HideInInspector] [ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector] [ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector] [ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector] [ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector] [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
		[HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}//New
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}//New
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}//New
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 metal vulkan xboxone xboxseries playstation switch 
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
			//Virtual Texturing
			float4 VTPackedFeedback;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription //Distortion
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		
		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }
			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_GBUFFER
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment _ LIGHT_LAYERS
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif

			#pragma vertex Vert
			#pragma fragment Frag
			
			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

		    #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
				UNITY_DEFINE_INSTANCED_PROP(float, _UV_ratioX)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


					float2 voronoihash664( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi664( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash664( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash677( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi677( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash677( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash696( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi696( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash696( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			
			float4 SampleGradient( Gradient gradient, float time )
			{
				float3 color = gradient.colors[0].rgb;
				UNITY_UNROLL
				for (int c = 1; c < 8; c++)
				{
				float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, gradient.colorsLength-1));
				color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
				}
				#ifndef UNITY_COLORSPACE_GAMMA
				color = SRGBToLinear(color);
				#endif
				float alpha = gradient.alphas[0].x;
				UNITY_UNROLL
				for (int a = 1; a < 8; a++)
				{
				float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, gradient.alphasLength-1));
				alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
				}
				return float4(color, alpha);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			
					float2 voronoihash1063( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi1063( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash1063( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F2;
					}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif


				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif
				
				#ifdef _ALPHATEST_ON 
				builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(inputMesh.positionOS));
				float eyeDepth = -objectToViewPos.z;
				outputPackedVaryingsMeshToPS.ase_texcoord5.x = eyeDepth;
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.yz = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float DEBUG_SLOT_118 = _DEBUG_SLOT_1;
				int temp_output_8_0_g142 = (int)DEBUG_SLOT_118;
				float4 color7_g144 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g144 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float _UV_ratioX_Instance = UNITY_ACCESS_INSTANCED_PROP(terrainPrototypeDEBUG_Shader,_UV_ratioX);
				float2 appendResult194 = (float2(_UV_ratioX_Instance , _UV_ratioY));
				float2 UV_WORLD_MAPPING28 = ( (ase_worldPos).xz * appendResult194 );
				float offsetX_Checkboard86 = _offsetX_Checkboard;
				float offsetY_Checkboard87 = _offsetY_Checkboard;
				float2 appendResult96 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float scale_Checkboard85 = _scale_Checkboard;
				float2 offsetCentering130 = ( _offsetCenteringCheckboard == 1.0 ? float2( 0.25,0.25 ) : float2( 0,0 ) );
				float2 UV_checkboard1X1102 = (UV_WORLD_MAPPING28*0.5 + ( ( appendResult96 * scale_Checkboard85 ) + offsetCentering130 ));
				float2 FinalUV13_g144 = ( float2( 1,1 ) * ( 0.5 + UV_checkboard1X1102 ) );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (1.0).xx;
				float4 appendResult16_g144 = (float4(ddx( FinalUV13_g144 ) , ddy( FinalUV13_g144 )));
				float4 UVDerivatives17_g144 = appendResult16_g144;
				float4 break28_g144 = UVDerivatives17_g144;
				float2 appendResult19_g144 = (float2(break28_g144.x , break28_g144.z));
				float2 appendResult20_g144 = (float2(break28_g144.x , break28_g144.z));
				float dotResult24_g144 = dot( appendResult19_g144 , appendResult20_g144 );
				float2 appendResult21_g144 = (float2(break28_g144.y , break28_g144.w));
				float2 appendResult22_g144 = (float2(break28_g144.y , break28_g144.w));
				float dotResult23_g144 = dot( appendResult21_g144 , appendResult22_g144 );
				float2 appendResult25_g144 = (float2(dotResult24_g144 , dotResult23_g144));
				float2 derivativesLength29_g144 = sqrt( appendResult25_g144 );
				float2 temp_cast_4 = (-1.0).xx;
				float2 temp_cast_5 = (1.0).xx;
				float2 clampResult57_g144 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g144 + 0.25 ) ) - temp_cast_2 ) ) * 4.0 ) - temp_cast_3 ) * ( 0.35 / derivativesLength29_g144 ) ) , temp_cast_4 , temp_cast_5 );
				float2 break71_g144 = clampResult57_g144;
				float2 break55_g144 = derivativesLength29_g144;
				float4 lerpResult73_g144 = lerp( color7_g144 , color8_g144 , saturate( ( 0.5 + ( 0.5 * break71_g144.x * break71_g144.y * sqrt( saturate( ( 1.1 - max( break55_g144.x , break55_g144.y ) ) ) ) ) ) ));
				float4 checkboard1x181 = lerpResult73_g144;
				float4 color7_g148 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g148 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float2 appendResult45 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float2 UV_checkboardCustom92 = (UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + ( appendResult45 + offsetCentering130 ));
				float2 FinalUV13_g148 = ( float2( 1,1 ) * ( 0.5 + UV_checkboardCustom92 ) );
				float2 temp_cast_6 = (0.5).xx;
				float2 temp_cast_7 = (1.0).xx;
				float4 appendResult16_g148 = (float4(ddx( FinalUV13_g148 ) , ddy( FinalUV13_g148 )));
				float4 UVDerivatives17_g148 = appendResult16_g148;
				float4 break28_g148 = UVDerivatives17_g148;
				float2 appendResult19_g148 = (float2(break28_g148.x , break28_g148.z));
				float2 appendResult20_g148 = (float2(break28_g148.x , break28_g148.z));
				float dotResult24_g148 = dot( appendResult19_g148 , appendResult20_g148 );
				float2 appendResult21_g148 = (float2(break28_g148.y , break28_g148.w));
				float2 appendResult22_g148 = (float2(break28_g148.y , break28_g148.w));
				float dotResult23_g148 = dot( appendResult21_g148 , appendResult22_g148 );
				float2 appendResult25_g148 = (float2(dotResult24_g148 , dotResult23_g148));
				float2 derivativesLength29_g148 = sqrt( appendResult25_g148 );
				float2 temp_cast_8 = (-1.0).xx;
				float2 temp_cast_9 = (1.0).xx;
				float2 clampResult57_g148 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g148 + 0.25 ) ) - temp_cast_6 ) ) * 4.0 ) - temp_cast_7 ) * ( 0.35 / derivativesLength29_g148 ) ) , temp_cast_8 , temp_cast_9 );
				float2 break71_g148 = clampResult57_g148;
				float2 break55_g148 = derivativesLength29_g148;
				float4 lerpResult73_g148 = lerp( color7_g148 , color8_g148 , saturate( ( 0.5 + ( 0.5 * break71_g148.x * break71_g148.y * sqrt( saturate( ( 1.1 - max( break55_g148.x , break55_g148.y ) ) ) ) ) ) ));
				float4 checkboardCustom32 = lerpResult73_g148;
				float checkboardLerp108 = _checkboardLerp;
				float4 lerpResult83 = lerp( checkboard1x181 , checkboardCustom32 , checkboardLerp108);
				float4 lerpResult1140 = lerp( lerpResult83 , ( lerpResult83 * _checkboard_hint ) , _checkboard_hint.a);
				float4 CHECKBOARD106 = lerpResult1140;
				float4 temp_output_9_0_g142 = CHECKBOARD106;
				float pixelWidth111 =  1.0f / 2.0;
				float pixelHeight111 = 1.0f / 2.0;
				half2 pixelateduv111 = half2((int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).x / pixelWidth111) * pixelWidth111, (int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).y / pixelHeight111) * pixelHeight111);
				float2 normalizeResult114 = normalize( pixelateduv111 );
				float4 color148 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 UV_VISUALISATION137 = ( min( normalizeResult114 , float2( 10,10 ) ).x == 10.0 ? color148 : float4( normalizeResult114, 0.0 , 0.0 ) );
				float4 temp_output_10_0_g142 = UV_VISUALISATION137;
				float2 UV_WORLD_STATIC197 = (ase_worldPos).xz;
				float2 appendResult211 = (float2(_distancePositionX , _distancePositionY));
				float2 distancePosition293 = ( appendResult211 * float2( 2,2 ) );
				float temp_output_163_0 = distance( (UV_WORLD_STATIC197*2.0 + distancePosition293) , float2( 0,0 ) );
				float smoothstepResult171 = smoothstep( ( _distanceHardness * _distanceRange ) , _distanceRange , temp_output_163_0);
				float4 lerpResult179 = lerp( ( _distanceInnerColor * _distanceInnerColor.a ) , ( _distanceBorderColor * _distanceBorderColor.a ) , smoothstepResult171);
				float temp_output_177_0 = ( _distanceRange + _distanceBorderSize );
				float smoothstepResult175 = smoothstep( temp_output_177_0 , temp_output_177_0 , temp_output_163_0);
				float4 lerpResult183 = lerp( lerpResult179 , ( _distanceBackgroundColor * _distanceBackgroundColor.a ) , smoothstepResult175);
				float4 RADIUS_VISUALISATION161 = lerpResult183;
				float4 temp_output_11_0_g142 = RADIUS_VISUALISATION161;
				float lightHardness329 = ( _lightHardness * _lightRange );
				float lightRange331 = _lightRange;
				float2 break302 = -(UV_WORLD_STATIC197*2.0 + distancePosition293);
				float lightHeight324 = ( _lightHeight * 100.0 );
				float3 appendResult298 = (float3(break302.x , lightHeight324 , break302.y));
				float3 normalizeResult306 = normalize( appendResult298 );
				float dotResult254 = dot( normalWS , normalizeResult306 );
				float smoothstepResult288 = smoothstep( lightHardness329 , lightRange331 , dotResult254);
				float CUSTOM_LIGHT281 = smoothstepResult288;
				float4 temp_cast_17 = (CUSTOM_LIGHT281).xxxx;
				float4 temp_output_12_0_g142 = temp_cast_17;
				float edgeHardness434 = _edgeHardness;
				float edgeRange435 = _edgeRange;
				float cameraDepthLenght438 = _cameraDepthLenght;
				float cameraDepthOffset439 = _cameraDepthOffset;
				float eyeDepth = packedInput.ase_texcoord5.x;
				float cameraDepthFade415 = (( eyeDepth -_ProjectionParams.y - cameraDepthOffset439 ) / cameraDepthLenght438);
				float cameraDepthFade432 = cameraDepthFade415;
				float temp_output_425_0 = ( edgeRange435 * cameraDepthFade432 );
				float3 normalizedWorldNormal = normalize( normalWS );
				float3 temp_output_399_0 = ddx( normalizedWorldNormal );
				float dotResult396 = dot( temp_output_399_0 , temp_output_399_0 );
				float3 temp_output_398_0 = ddy( normalizedWorldNormal );
				float dotResult397 = dot( temp_output_398_0 , temp_output_398_0 );
				float ifLocalVar400 = 0;
				if( dotResult396 > dotResult397 )
				ifLocalVar400 = dotResult396;
				else if( dotResult396 < dotResult397 )
				ifLocalVar400 = dotResult397;
				float smoothstepResult404 = smoothstep( ( edgeHardness434 * temp_output_425_0 ) , temp_output_425_0 , sqrt( ifLocalVar400 ));
				float visualizeCameraDepth478 = _visualizeCameraDepth;
				float lerpResult475 = lerp( smoothstepResult404 , cameraDepthFade432 , visualizeCameraDepth478);
				float EDGE_DETECT430 = lerpResult475;
				float4 temp_cast_19 = (EDGE_DETECT430).xxxx;
				float4 temp_output_13_0_g142 = temp_cast_19;
				float texture_DEBUG_SLOT_1594 = _texture_DEBUG_SLOT_1;
				int temp_output_8_0_g143 = (int)texture_DEBUG_SLOT_1594;
				float noiseHardness584 = ( _noiseHardness * _noiseRange );
				float noiseRange586 = _noiseRange;
				float noiseScale370 = ( 1.0 / _noiseScale );
				float noiseAnlge372 = _noiseAnlge;
				float time664 = noiseAnlge372;
				float2 voronoiSmoothId664 = 0;
				float noiseSmoothness576 = ( _noiseSmoothness / 2.0 );
				float voronoiSmooth664 = noiseSmoothness576;
				float2 temp_output_672_0 = ( UV_WORLD_MAPPING28 * 1.0 );
				float2 coords664 = temp_output_672_0 * noiseScale370;
				float2 id664 = 0;
				float2 uv664 = 0;
				float fade664 = 0.5;
				float voroi664 = 0;
				float rest664 = 0;
				for( int it664 = 0; it664 <6; it664++ ){
				voroi664 += fade664 * voronoi664( coords664, time664, id664, uv664, voronoiSmooth664,voronoiSmoothId664 );
				rest664 += fade664;
				coords664 *= 2;
				fade664 *= 0.5;
				}//Voronoi664
				voroi664 /= rest664;
				float time677 = noiseAnlge372;
				float2 voronoiSmoothId677 = 0;
				float voronoiSmooth677 = noiseSmoothness576;
				float2 coords677 = ( temp_output_672_0 + float2( 713.317,379.371 ) ) * ( noiseScale370 / 5.376 );
				float2 id677 = 0;
				float2 uv677 = 0;
				float fade677 = 0.5;
				float voroi677 = 0;
				float rest677 = 0;
				for( int it677 = 0; it677 <4; it677++ ){
				voroi677 += fade677 * voronoi677( coords677, time677, id677, uv677, voronoiSmooth677,voronoiSmoothId677 );
				rest677 += fade677;
				coords677 *= 2;
				fade677 *= 0.5;
				}//Voronoi677
				voroi677 /= rest677;
				float blendOpSrc714 = voroi664;
				float blendOpDest714 = voroi677;
				float time696 = ( noiseAnlge372 + 739.736 );
				float2 voronoiSmoothId696 = 0;
				float2 coords696 = ( temp_output_672_0 + float2( 317.289,497.376 ) ) * ( noiseScale370 / 9.763 );
				float2 id696 = 0;
				float2 uv696 = 0;
				float fade696 = 0.5;
				float voroi696 = 0;
				float rest696 = 0;
				for( int it696 = 0; it696 <6; it696++ ){
				voroi696 += fade696 * voronoi696( coords696, time696, id696, uv696, 0,voronoiSmoothId696 );
				rest696 += fade696;
				coords696 *= 2;
				fade696 *= 0.5;
				}//Voronoi696
				voroi696 /= rest696;
				float blendOpSrc715 = (( blendOpDest714 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest714 ) * ( 1.0 - blendOpSrc714 ) ) : ( 2.0 * blendOpDest714 * blendOpSrc714 ) );
				float blendOpDest715 = voroi696;
				float lerpBlendMode715 = lerp(blendOpDest715,(( blendOpDest715 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest715 ) * ( 1.0 - blendOpSrc715 ) ) : ( 2.0 * blendOpDest715 * blendOpSrc715 ) ),-1.0);
				float temp_output_715_0 = lerpBlendMode715;
				float smoothstepResult578 = smoothstep( noiseHardness584 , noiseRange586 , temp_output_715_0);
				float textureValue592 = smoothstepResult578;
				float4 temp_cast_23 = (textureValue592).xxxx;
				float4 temp_output_9_0_g143 = temp_cast_23;
				float gradient_DEBUG_SLOT_1624 = _gradient_DEBUG_SLOT_1;
				int temp_output_8_0_g146 = (int)gradient_DEBUG_SLOT_1624;
				Gradient gradient46_g146 = NewGradient( 0, 2, 2, float4( 0.5, 0, 1, 0 ), float4( 0.5, 0.986376, 0.01362398, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradientInvert645 = _gradientInvert;
				float temp_output_40_0_g146 = textureValue592;
				float valueMap95_g146 = saturate( ( (float)(int)gradientInvert645 == 1.0 ? ( 1.0 - temp_output_40_0_g146 ) : temp_output_40_0_g146 ) );
				Gradient gradient57_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 1, 0 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient58_g146 = NewGradient( 0, 3, 2, float4( 0.5, 0, 1, 0 ), float4( 0, 1, 0.25, 0.5000076 ), float4( 1, 0.775, 0, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient56_g146 = NewGradient( 0, 4, 2, float4( 0.5, 0, 1, 0 ), float4( 1, 0, 0, 0.3300069 ), float4( 0.496063, 1, 0, 0.6599985 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient59_g146 = NewGradient( 0, 2, 2, float4( 1, 0, 0, 0 ), float4( 0, 0, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient60_g146 = NewGradient( 1, 8, 2, float4( 1, 0, 0, 0.1250019 ), float4( 1, 0.5, 0, 0.2500038 ), float4( 1, 1, 0, 0.3750057 ), float4( 0.5, 1, 0, 0.5000076 ), float4( 0, 1, 0, 0.6249943 ), float4( 0, 0.5, 1, 0.7499962 ), float4( 0, 0, 1, 0.8749981 ), float4( 1, 0, 0.5, 1 ), float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient65_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 0, 0 ), float4( 1, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradient_DEBUG_SLOT_2625 = _gradient_DEBUG_SLOT_2;
				int temp_output_28_0_g146 = (int)gradient_DEBUG_SLOT_2625;
				float gradient_DEBUG_LERP626 = _gradient_DEBUG_LERP;
				float4 lerpResult29_g146 = lerp( ( (float)temp_output_8_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , gradient_DEBUG_LERP626);
				float3 hsvTorgb76_g146 = RGBToHSV( lerpResult29_g146.rgb );
				float HHue654 = _HHue;
				float SSaturation655 = _SSaturation;
				float gradienMultiplyByValue725 = _gradienMultiplyByValue;
				float VValue656 = _VValue;
				float temp_output_80_0_g146 = VValue656;
				float3 hsvTorgb77_g146 = HSVToRGB( float3(( hsvTorgb76_g146.x + HHue654 ),( hsvTorgb76_g146.y * SSaturation655 ),( (float)(int)gradienMultiplyByValue725 == 1.0 ? ( valueMap95_g146 * ( temp_output_80_0_g146 + 1.0 ) ) : ( hsvTorgb76_g146.z + temp_output_80_0_g146 ) )) );
				float3 textureAlbedo606 = hsvTorgb77_g146;
				float4 temp_output_10_0_g143 = float4( textureAlbedo606 , 0.0 );
				float textureValueRaw607 = temp_output_715_0;
				float smoothstepResult751 = smoothstep( ( _smoothnessHardness * _smoothnessRange ) , _smoothnessRange , textureValueRaw607);
				float textureSmoothness759 = saturate( smoothstepResult751 );
				float4 temp_cast_46 = (textureSmoothness759).xxxx;
				float4 temp_output_11_0_g143 = temp_cast_46;
				float textureMetalic608 = temp_output_715_0;
				float4 temp_cast_48 = (textureMetalic608).xxxx;
				float4 temp_output_12_0_g143 = temp_cast_48;
				float4 temp_output_13_0_g143 = float4( 0,0,0,0 );
				float4 temp_output_14_0_g143 = float4( 0,0,0,0 );
				float texture_DEBUG_SLOT_2602 = _texture_DEBUG_SLOT_2;
				int temp_output_28_0_g143 = (int)texture_DEBUG_SLOT_2602;
				float texture_DEBUG_LERP598 = _texture_DEBUG_LERP;
				float4 lerpResult29_g143 = lerp( ( (float)temp_output_8_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_8_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_8_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_8_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_8_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_8_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_28_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_28_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_28_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_28_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_28_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , texture_DEBUG_LERP598);
				float4 TEXTURE480 = lerpResult29_g143;
				float4 temp_output_14_0_g142 = TEXTURE480;
				float DEBUG_SLOT_219 = _DEBUG_SLOT_2;
				int temp_output_28_0_g142 = (int)DEBUG_SLOT_219;
				float DEBUG_LERP21 = _DEBUG_LERP;
				float4 lerpResult29_g142 = lerp( ( (float)temp_output_8_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_8_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_8_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_8_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_8_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_8_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_28_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_28_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_28_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_28_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_28_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , DEBUG_LERP21);
				float _HEADER264 = min( ( _checkboard.r + _distance.r + _globalProperties.r + _lightTest_01.r + _EDGEDETECT.r + _Color5.r ) , 0.0 );
				float4 DEBUG14 = ( lerpResult29_g142 + _HEADER264 );
				
				float METALIC268 = _metalic;
				
				float emsissionIntensity59 = _emsissionIntensity;
				float3 hdEmission57 = ASEGetEmissionHDRColor(DEBUG14.xyz,emsissionIntensity59,0.0,GetInverseCurrentExposureMultiplier());
				float textureEmissionOn1056 = _textureEmissionOn;
				float time1063 = ( noiseAnlge372 + 673.167 );
				float2 voronoiSmoothId1063 = 0;
				float2 coords1063 = ( temp_output_672_0 + float2( -973.582,-137.987 ) ) * ( noiseScale370 / _hexNoiseDistortionScale );
				float2 id1063 = 0;
				float2 uv1063 = 0;
				float fade1063 = 0.5;
				float voroi1063 = 0;
				float rest1063 = 0;
				for( int it1063 = 0; it1063 <4; it1063++ ){
				voroi1063 += fade1063 * voronoi1063( coords1063, time1063, id1063, uv1063, 0,voronoiSmoothId1063 );
				rest1063 += fade1063;
				coords1063 *= 2;
				fade1063 *= 0.5;
				}//Voronoi1063
				voroi1063 /= rest1063;
				float2 temp_cast_67 = (( -_hexScale + ( _hexDistortion * ( voroi1063 - 0.5 ) ) )).xx;
				float2 break19_g145 = ( packedInput.ase_texcoord5.yz * temp_cast_67 );
				float temp_output_20_0_g145 = ( break19_g145.x * 1.5 );
				float2 appendResult14_g145 = (float2(temp_output_20_0_g145 , ( break19_g145.y + ( ( floor( temp_output_20_0_g145 ) % 2.0 ) * 0.5 ) )));
				float2 break12_g145 = abs( ( ( appendResult14_g145 % float2( 1,1 ) ) - float2( 0.5,0.5 ) ) );
				float smoothstepResult1_g145 = smoothstep( 0.0 , 3.0 , ( abs( ( max( ( ( break12_g145.x * 1.5 ) + break12_g145.y ) , ( break12_g145.y * 2.0 ) ) - 1.0 ) ) * 2.0 ));
				float smoothstepResult1130 = smoothstep( 0.0 , 0.5 , textureValue592);
				float lerpResult1123 = lerp( 0.0 , saturate( smoothstepResult1_g145 ) , smoothstepResult1130);
				float noiseEmissionValue1044 = lerpResult1123;
				float value44_g147 = noiseEmissionValue1044;
				float valueSelect808 = _valueSelect;
				float valueSelect41_g147 = valueSelect808;
				float valueRangeHigher973 = _valueRangeHigher;
				float valueRange906 = _valueRange;
				float valueRange39_g147 = ( 1.0 - valueRange906 );
				float valueRangeHigher30_g147 = ( 1.0 - ( valueRangeHigher973 * ( 1.0 - valueRange39_g147 ) ) );
				float valueRangeLower972 = _valueRangeLower;
				float valueRangeLower37_g147 = ( 1.0 - ( valueRangeLower972 * ( 1.0 - valueRange39_g147 ) ) );
				float ifLocalVar23_g147 = 0;
				if( value44_g147 > valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeHigher30_g147 ) ) * ( ( ( 1.0 - value44_g147 ) * ( 1.0 / ( 1.0 - valueSelect41_g147 ) ) ) - valueRangeHigher30_g147 ) );
				else if( value44_g147 == valueSelect41_g147 )
				ifLocalVar23_g147 = valueSelect41_g147;
				else if( value44_g147 < valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeLower37_g147 ) ) * ( ( value44_g147 * ( 1.0 / valueSelect41_g147 ) ) - valueRangeLower37_g147 ) );
				float textueEmmissionMask1043 = saturate( ifLocalVar23_g147 );
				float textureEmissionIntensity1051 = _textureEmissionIntensity;
				float3 hdEmission1049 = ASEGetEmissionHDRColor(( textueEmmissionMask1043 * _emissionColor ).rgb,ConvertEvToLuminance(textureEmissionIntensity1051),0.0,GetInverseCurrentExposureMultiplier());
				float3 textireEmission1054 = ( textureEmissionOn1056 == 1.0 ? hdEmission1049 : float3( 0,0,0 ) );
				float3 EMISSION61 = ( hdEmission57 + textireEmission1054 );
				
				float SMOOTHNESS270 = ( _textureSmoothnessOn == 1.0 ? textureSmoothness759 : _smoothness );
				
				surfaceDescription.Albedo = DEBUG14.xyz;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = METALIC268;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = EMISSION61;
				surfaceDescription.Smoothness = SMOOTHNESS270;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }
			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature _ EDITOR_VISUALIZATION
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
			

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma vertex Vert
			#pragma fragment Frag
			
			
			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        

			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
				UNITY_DEFINE_INSTANCED_PROP(float, _UV_ratioX)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				#ifdef EDITOR_VISUALIZATION
				float2 VizUV : TEXCOORD0;
				float4 LightCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

					float2 voronoihash664( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi664( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash664( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash677( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi677( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash677( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash696( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi696( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash696( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			
			float4 SampleGradient( Gradient gradient, float time )
			{
				float3 color = gradient.colors[0].rgb;
				UNITY_UNROLL
				for (int c = 1; c < 8; c++)
				{
				float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, gradient.colorsLength-1));
				color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
				}
				#ifndef UNITY_COLORSPACE_GAMMA
				color = SRGBToLinear(color);
				#endif
				float alpha = gradient.alphas[0].x;
				UNITY_UNROLL
				for (int a = 1; a < 8; a++)
				{
				float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, gradient.alphasLength-1));
				alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
				}
				return float4(color, alpha);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			
					float2 voronoihash1063( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi1063( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash1063( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F2;
					}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if SHADERPASS == SHADERPASS_LIGHT_TRANSPORT			
			#define SCENEPICKINGPASS
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/MetaPass.hlsl"

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				outputPackedVaryingsMeshToPS.ase_texcoord2.xyz = ase_worldPos;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldNormal;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(inputMesh.positionOS));
				float eyeDepth = -objectToViewPos.z;
				outputPackedVaryingsMeshToPS.ase_texcoord2.w = eyeDepth;
				
				outputPackedVaryingsMeshToPS.ase_texcoord4.xy = inputMesh.uv0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;
				outputPackedVaryingsMeshToPS.ase_texcoord4.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				outputPackedVaryingsMeshToPS.positionCS = UnityMetaVertexPosition(inputMesh.positionOS, inputMesh.uv1.xy, inputMesh.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);


				#ifdef EDITOR_VISUALIZATION
					float2 vizUV = 0;
					float4 lightCoord = 0;
					UnityEditorVizData(inputMesh.positionOS.xyz, inputMesh.uv0.xy, inputMesh.uv1.xy, inputMesh.uv2.xy, vizUV, lightCoord);

					outputPackedVaryingsMeshToPS.VizUV.xy = vizUV;
					outputPackedVaryingsMeshToPS.LightCoord = lightCoord;
				#endif

				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.uv3 = v.uv3;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.uv3 = patch[0].uv3 * bary.x + patch[1].uv3 * bary.y + patch[2].uv3 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float DEBUG_SLOT_118 = _DEBUG_SLOT_1;
				int temp_output_8_0_g142 = (int)DEBUG_SLOT_118;
				float4 color7_g144 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g144 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float3 ase_worldPos = packedInput.ase_texcoord2.xyz;
				float _UV_ratioX_Instance = UNITY_ACCESS_INSTANCED_PROP(terrainPrototypeDEBUG_Shader,_UV_ratioX);
				float2 appendResult194 = (float2(_UV_ratioX_Instance , _UV_ratioY));
				float2 UV_WORLD_MAPPING28 = ( (ase_worldPos).xz * appendResult194 );
				float offsetX_Checkboard86 = _offsetX_Checkboard;
				float offsetY_Checkboard87 = _offsetY_Checkboard;
				float2 appendResult96 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float scale_Checkboard85 = _scale_Checkboard;
				float2 offsetCentering130 = ( _offsetCenteringCheckboard == 1.0 ? float2( 0.25,0.25 ) : float2( 0,0 ) );
				float2 UV_checkboard1X1102 = (UV_WORLD_MAPPING28*0.5 + ( ( appendResult96 * scale_Checkboard85 ) + offsetCentering130 ));
				float2 FinalUV13_g144 = ( float2( 1,1 ) * ( 0.5 + UV_checkboard1X1102 ) );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (1.0).xx;
				float4 appendResult16_g144 = (float4(ddx( FinalUV13_g144 ) , ddy( FinalUV13_g144 )));
				float4 UVDerivatives17_g144 = appendResult16_g144;
				float4 break28_g144 = UVDerivatives17_g144;
				float2 appendResult19_g144 = (float2(break28_g144.x , break28_g144.z));
				float2 appendResult20_g144 = (float2(break28_g144.x , break28_g144.z));
				float dotResult24_g144 = dot( appendResult19_g144 , appendResult20_g144 );
				float2 appendResult21_g144 = (float2(break28_g144.y , break28_g144.w));
				float2 appendResult22_g144 = (float2(break28_g144.y , break28_g144.w));
				float dotResult23_g144 = dot( appendResult21_g144 , appendResult22_g144 );
				float2 appendResult25_g144 = (float2(dotResult24_g144 , dotResult23_g144));
				float2 derivativesLength29_g144 = sqrt( appendResult25_g144 );
				float2 temp_cast_4 = (-1.0).xx;
				float2 temp_cast_5 = (1.0).xx;
				float2 clampResult57_g144 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g144 + 0.25 ) ) - temp_cast_2 ) ) * 4.0 ) - temp_cast_3 ) * ( 0.35 / derivativesLength29_g144 ) ) , temp_cast_4 , temp_cast_5 );
				float2 break71_g144 = clampResult57_g144;
				float2 break55_g144 = derivativesLength29_g144;
				float4 lerpResult73_g144 = lerp( color7_g144 , color8_g144 , saturate( ( 0.5 + ( 0.5 * break71_g144.x * break71_g144.y * sqrt( saturate( ( 1.1 - max( break55_g144.x , break55_g144.y ) ) ) ) ) ) ));
				float4 checkboard1x181 = lerpResult73_g144;
				float4 color7_g148 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g148 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float2 appendResult45 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float2 UV_checkboardCustom92 = (UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + ( appendResult45 + offsetCentering130 ));
				float2 FinalUV13_g148 = ( float2( 1,1 ) * ( 0.5 + UV_checkboardCustom92 ) );
				float2 temp_cast_6 = (0.5).xx;
				float2 temp_cast_7 = (1.0).xx;
				float4 appendResult16_g148 = (float4(ddx( FinalUV13_g148 ) , ddy( FinalUV13_g148 )));
				float4 UVDerivatives17_g148 = appendResult16_g148;
				float4 break28_g148 = UVDerivatives17_g148;
				float2 appendResult19_g148 = (float2(break28_g148.x , break28_g148.z));
				float2 appendResult20_g148 = (float2(break28_g148.x , break28_g148.z));
				float dotResult24_g148 = dot( appendResult19_g148 , appendResult20_g148 );
				float2 appendResult21_g148 = (float2(break28_g148.y , break28_g148.w));
				float2 appendResult22_g148 = (float2(break28_g148.y , break28_g148.w));
				float dotResult23_g148 = dot( appendResult21_g148 , appendResult22_g148 );
				float2 appendResult25_g148 = (float2(dotResult24_g148 , dotResult23_g148));
				float2 derivativesLength29_g148 = sqrt( appendResult25_g148 );
				float2 temp_cast_8 = (-1.0).xx;
				float2 temp_cast_9 = (1.0).xx;
				float2 clampResult57_g148 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g148 + 0.25 ) ) - temp_cast_6 ) ) * 4.0 ) - temp_cast_7 ) * ( 0.35 / derivativesLength29_g148 ) ) , temp_cast_8 , temp_cast_9 );
				float2 break71_g148 = clampResult57_g148;
				float2 break55_g148 = derivativesLength29_g148;
				float4 lerpResult73_g148 = lerp( color7_g148 , color8_g148 , saturate( ( 0.5 + ( 0.5 * break71_g148.x * break71_g148.y * sqrt( saturate( ( 1.1 - max( break55_g148.x , break55_g148.y ) ) ) ) ) ) ));
				float4 checkboardCustom32 = lerpResult73_g148;
				float checkboardLerp108 = _checkboardLerp;
				float4 lerpResult83 = lerp( checkboard1x181 , checkboardCustom32 , checkboardLerp108);
				float4 lerpResult1140 = lerp( lerpResult83 , ( lerpResult83 * _checkboard_hint ) , _checkboard_hint.a);
				float4 CHECKBOARD106 = lerpResult1140;
				float4 temp_output_9_0_g142 = CHECKBOARD106;
				float pixelWidth111 =  1.0f / 2.0;
				float pixelHeight111 = 1.0f / 2.0;
				half2 pixelateduv111 = half2((int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).x / pixelWidth111) * pixelWidth111, (int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).y / pixelHeight111) * pixelHeight111);
				float2 normalizeResult114 = normalize( pixelateduv111 );
				float4 color148 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 UV_VISUALISATION137 = ( min( normalizeResult114 , float2( 10,10 ) ).x == 10.0 ? color148 : float4( normalizeResult114, 0.0 , 0.0 ) );
				float4 temp_output_10_0_g142 = UV_VISUALISATION137;
				float2 UV_WORLD_STATIC197 = (ase_worldPos).xz;
				float2 appendResult211 = (float2(_distancePositionX , _distancePositionY));
				float2 distancePosition293 = ( appendResult211 * float2( 2,2 ) );
				float temp_output_163_0 = distance( (UV_WORLD_STATIC197*2.0 + distancePosition293) , float2( 0,0 ) );
				float smoothstepResult171 = smoothstep( ( _distanceHardness * _distanceRange ) , _distanceRange , temp_output_163_0);
				float4 lerpResult179 = lerp( ( _distanceInnerColor * _distanceInnerColor.a ) , ( _distanceBorderColor * _distanceBorderColor.a ) , smoothstepResult171);
				float temp_output_177_0 = ( _distanceRange + _distanceBorderSize );
				float smoothstepResult175 = smoothstep( temp_output_177_0 , temp_output_177_0 , temp_output_163_0);
				float4 lerpResult183 = lerp( lerpResult179 , ( _distanceBackgroundColor * _distanceBackgroundColor.a ) , smoothstepResult175);
				float4 RADIUS_VISUALISATION161 = lerpResult183;
				float4 temp_output_11_0_g142 = RADIUS_VISUALISATION161;
				float lightHardness329 = ( _lightHardness * _lightRange );
				float lightRange331 = _lightRange;
				float3 ase_worldNormal = packedInput.ase_texcoord3.xyz;
				float2 break302 = -(UV_WORLD_STATIC197*2.0 + distancePosition293);
				float lightHeight324 = ( _lightHeight * 100.0 );
				float3 appendResult298 = (float3(break302.x , lightHeight324 , break302.y));
				float3 normalizeResult306 = normalize( appendResult298 );
				float dotResult254 = dot( ase_worldNormal , normalizeResult306 );
				float smoothstepResult288 = smoothstep( lightHardness329 , lightRange331 , dotResult254);
				float CUSTOM_LIGHT281 = smoothstepResult288;
				float4 temp_cast_17 = (CUSTOM_LIGHT281).xxxx;
				float4 temp_output_12_0_g142 = temp_cast_17;
				float edgeHardness434 = _edgeHardness;
				float edgeRange435 = _edgeRange;
				float cameraDepthLenght438 = _cameraDepthLenght;
				float cameraDepthOffset439 = _cameraDepthOffset;
				float eyeDepth = packedInput.ase_texcoord2.w;
				float cameraDepthFade415 = (( eyeDepth -_ProjectionParams.y - cameraDepthOffset439 ) / cameraDepthLenght438);
				float cameraDepthFade432 = cameraDepthFade415;
				float temp_output_425_0 = ( edgeRange435 * cameraDepthFade432 );
				float3 normalizedWorldNormal = normalize( ase_worldNormal );
				float3 temp_output_399_0 = ddx( normalizedWorldNormal );
				float dotResult396 = dot( temp_output_399_0 , temp_output_399_0 );
				float3 temp_output_398_0 = ddy( normalizedWorldNormal );
				float dotResult397 = dot( temp_output_398_0 , temp_output_398_0 );
				float ifLocalVar400 = 0;
				if( dotResult396 > dotResult397 )
				ifLocalVar400 = dotResult396;
				else if( dotResult396 < dotResult397 )
				ifLocalVar400 = dotResult397;
				float smoothstepResult404 = smoothstep( ( edgeHardness434 * temp_output_425_0 ) , temp_output_425_0 , sqrt( ifLocalVar400 ));
				float visualizeCameraDepth478 = _visualizeCameraDepth;
				float lerpResult475 = lerp( smoothstepResult404 , cameraDepthFade432 , visualizeCameraDepth478);
				float EDGE_DETECT430 = lerpResult475;
				float4 temp_cast_19 = (EDGE_DETECT430).xxxx;
				float4 temp_output_13_0_g142 = temp_cast_19;
				float texture_DEBUG_SLOT_1594 = _texture_DEBUG_SLOT_1;
				int temp_output_8_0_g143 = (int)texture_DEBUG_SLOT_1594;
				float noiseHardness584 = ( _noiseHardness * _noiseRange );
				float noiseRange586 = _noiseRange;
				float noiseScale370 = ( 1.0 / _noiseScale );
				float noiseAnlge372 = _noiseAnlge;
				float time664 = noiseAnlge372;
				float2 voronoiSmoothId664 = 0;
				float noiseSmoothness576 = ( _noiseSmoothness / 2.0 );
				float voronoiSmooth664 = noiseSmoothness576;
				float2 temp_output_672_0 = ( UV_WORLD_MAPPING28 * 1.0 );
				float2 coords664 = temp_output_672_0 * noiseScale370;
				float2 id664 = 0;
				float2 uv664 = 0;
				float fade664 = 0.5;
				float voroi664 = 0;
				float rest664 = 0;
				for( int it664 = 0; it664 <6; it664++ ){
				voroi664 += fade664 * voronoi664( coords664, time664, id664, uv664, voronoiSmooth664,voronoiSmoothId664 );
				rest664 += fade664;
				coords664 *= 2;
				fade664 *= 0.5;
				}//Voronoi664
				voroi664 /= rest664;
				float time677 = noiseAnlge372;
				float2 voronoiSmoothId677 = 0;
				float voronoiSmooth677 = noiseSmoothness576;
				float2 coords677 = ( temp_output_672_0 + float2( 713.317,379.371 ) ) * ( noiseScale370 / 5.376 );
				float2 id677 = 0;
				float2 uv677 = 0;
				float fade677 = 0.5;
				float voroi677 = 0;
				float rest677 = 0;
				for( int it677 = 0; it677 <4; it677++ ){
				voroi677 += fade677 * voronoi677( coords677, time677, id677, uv677, voronoiSmooth677,voronoiSmoothId677 );
				rest677 += fade677;
				coords677 *= 2;
				fade677 *= 0.5;
				}//Voronoi677
				voroi677 /= rest677;
				float blendOpSrc714 = voroi664;
				float blendOpDest714 = voroi677;
				float time696 = ( noiseAnlge372 + 739.736 );
				float2 voronoiSmoothId696 = 0;
				float2 coords696 = ( temp_output_672_0 + float2( 317.289,497.376 ) ) * ( noiseScale370 / 9.763 );
				float2 id696 = 0;
				float2 uv696 = 0;
				float fade696 = 0.5;
				float voroi696 = 0;
				float rest696 = 0;
				for( int it696 = 0; it696 <6; it696++ ){
				voroi696 += fade696 * voronoi696( coords696, time696, id696, uv696, 0,voronoiSmoothId696 );
				rest696 += fade696;
				coords696 *= 2;
				fade696 *= 0.5;
				}//Voronoi696
				voroi696 /= rest696;
				float blendOpSrc715 = (( blendOpDest714 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest714 ) * ( 1.0 - blendOpSrc714 ) ) : ( 2.0 * blendOpDest714 * blendOpSrc714 ) );
				float blendOpDest715 = voroi696;
				float lerpBlendMode715 = lerp(blendOpDest715,(( blendOpDest715 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest715 ) * ( 1.0 - blendOpSrc715 ) ) : ( 2.0 * blendOpDest715 * blendOpSrc715 ) ),-1.0);
				float temp_output_715_0 = lerpBlendMode715;
				float smoothstepResult578 = smoothstep( noiseHardness584 , noiseRange586 , temp_output_715_0);
				float textureValue592 = smoothstepResult578;
				float4 temp_cast_23 = (textureValue592).xxxx;
				float4 temp_output_9_0_g143 = temp_cast_23;
				float gradient_DEBUG_SLOT_1624 = _gradient_DEBUG_SLOT_1;
				int temp_output_8_0_g146 = (int)gradient_DEBUG_SLOT_1624;
				Gradient gradient46_g146 = NewGradient( 0, 2, 2, float4( 0.5, 0, 1, 0 ), float4( 0.5, 0.986376, 0.01362398, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradientInvert645 = _gradientInvert;
				float temp_output_40_0_g146 = textureValue592;
				float valueMap95_g146 = saturate( ( (float)(int)gradientInvert645 == 1.0 ? ( 1.0 - temp_output_40_0_g146 ) : temp_output_40_0_g146 ) );
				Gradient gradient57_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 1, 0 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient58_g146 = NewGradient( 0, 3, 2, float4( 0.5, 0, 1, 0 ), float4( 0, 1, 0.25, 0.5000076 ), float4( 1, 0.775, 0, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient56_g146 = NewGradient( 0, 4, 2, float4( 0.5, 0, 1, 0 ), float4( 1, 0, 0, 0.3300069 ), float4( 0.496063, 1, 0, 0.6599985 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient59_g146 = NewGradient( 0, 2, 2, float4( 1, 0, 0, 0 ), float4( 0, 0, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient60_g146 = NewGradient( 1, 8, 2, float4( 1, 0, 0, 0.1250019 ), float4( 1, 0.5, 0, 0.2500038 ), float4( 1, 1, 0, 0.3750057 ), float4( 0.5, 1, 0, 0.5000076 ), float4( 0, 1, 0, 0.6249943 ), float4( 0, 0.5, 1, 0.7499962 ), float4( 0, 0, 1, 0.8749981 ), float4( 1, 0, 0.5, 1 ), float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient65_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 0, 0 ), float4( 1, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradient_DEBUG_SLOT_2625 = _gradient_DEBUG_SLOT_2;
				int temp_output_28_0_g146 = (int)gradient_DEBUG_SLOT_2625;
				float gradient_DEBUG_LERP626 = _gradient_DEBUG_LERP;
				float4 lerpResult29_g146 = lerp( ( (float)temp_output_8_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , gradient_DEBUG_LERP626);
				float3 hsvTorgb76_g146 = RGBToHSV( lerpResult29_g146.rgb );
				float HHue654 = _HHue;
				float SSaturation655 = _SSaturation;
				float gradienMultiplyByValue725 = _gradienMultiplyByValue;
				float VValue656 = _VValue;
				float temp_output_80_0_g146 = VValue656;
				float3 hsvTorgb77_g146 = HSVToRGB( float3(( hsvTorgb76_g146.x + HHue654 ),( hsvTorgb76_g146.y * SSaturation655 ),( (float)(int)gradienMultiplyByValue725 == 1.0 ? ( valueMap95_g146 * ( temp_output_80_0_g146 + 1.0 ) ) : ( hsvTorgb76_g146.z + temp_output_80_0_g146 ) )) );
				float3 textureAlbedo606 = hsvTorgb77_g146;
				float4 temp_output_10_0_g143 = float4( textureAlbedo606 , 0.0 );
				float textureValueRaw607 = temp_output_715_0;
				float smoothstepResult751 = smoothstep( ( _smoothnessHardness * _smoothnessRange ) , _smoothnessRange , textureValueRaw607);
				float textureSmoothness759 = saturate( smoothstepResult751 );
				float4 temp_cast_46 = (textureSmoothness759).xxxx;
				float4 temp_output_11_0_g143 = temp_cast_46;
				float textureMetalic608 = temp_output_715_0;
				float4 temp_cast_48 = (textureMetalic608).xxxx;
				float4 temp_output_12_0_g143 = temp_cast_48;
				float4 temp_output_13_0_g143 = float4( 0,0,0,0 );
				float4 temp_output_14_0_g143 = float4( 0,0,0,0 );
				float texture_DEBUG_SLOT_2602 = _texture_DEBUG_SLOT_2;
				int temp_output_28_0_g143 = (int)texture_DEBUG_SLOT_2602;
				float texture_DEBUG_LERP598 = _texture_DEBUG_LERP;
				float4 lerpResult29_g143 = lerp( ( (float)temp_output_8_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_8_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_8_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_8_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_8_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_8_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_28_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_28_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_28_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_28_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_28_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , texture_DEBUG_LERP598);
				float4 TEXTURE480 = lerpResult29_g143;
				float4 temp_output_14_0_g142 = TEXTURE480;
				float DEBUG_SLOT_219 = _DEBUG_SLOT_2;
				int temp_output_28_0_g142 = (int)DEBUG_SLOT_219;
				float DEBUG_LERP21 = _DEBUG_LERP;
				float4 lerpResult29_g142 = lerp( ( (float)temp_output_8_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_8_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_8_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_8_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_8_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_8_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_28_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_28_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_28_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_28_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_28_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , DEBUG_LERP21);
				float _HEADER264 = min( ( _checkboard.r + _distance.r + _globalProperties.r + _lightTest_01.r + _EDGEDETECT.r + _Color5.r ) , 0.0 );
				float4 DEBUG14 = ( lerpResult29_g142 + _HEADER264 );
				
				float METALIC268 = _metalic;
				
				float emsissionIntensity59 = _emsissionIntensity;
				float3 hdEmission57 = ASEGetEmissionHDRColor(DEBUG14.xyz,emsissionIntensity59,0.0,GetInverseCurrentExposureMultiplier());
				float textureEmissionOn1056 = _textureEmissionOn;
				float time1063 = ( noiseAnlge372 + 673.167 );
				float2 voronoiSmoothId1063 = 0;
				float2 coords1063 = ( temp_output_672_0 + float2( -973.582,-137.987 ) ) * ( noiseScale370 / _hexNoiseDistortionScale );
				float2 id1063 = 0;
				float2 uv1063 = 0;
				float fade1063 = 0.5;
				float voroi1063 = 0;
				float rest1063 = 0;
				for( int it1063 = 0; it1063 <4; it1063++ ){
				voroi1063 += fade1063 * voronoi1063( coords1063, time1063, id1063, uv1063, 0,voronoiSmoothId1063 );
				rest1063 += fade1063;
				coords1063 *= 2;
				fade1063 *= 0.5;
				}//Voronoi1063
				voroi1063 /= rest1063;
				float2 temp_cast_67 = (( -_hexScale + ( _hexDistortion * ( voroi1063 - 0.5 ) ) )).xx;
				float2 break19_g145 = ( packedInput.ase_texcoord4.xy * temp_cast_67 );
				float temp_output_20_0_g145 = ( break19_g145.x * 1.5 );
				float2 appendResult14_g145 = (float2(temp_output_20_0_g145 , ( break19_g145.y + ( ( floor( temp_output_20_0_g145 ) % 2.0 ) * 0.5 ) )));
				float2 break12_g145 = abs( ( ( appendResult14_g145 % float2( 1,1 ) ) - float2( 0.5,0.5 ) ) );
				float smoothstepResult1_g145 = smoothstep( 0.0 , 3.0 , ( abs( ( max( ( ( break12_g145.x * 1.5 ) + break12_g145.y ) , ( break12_g145.y * 2.0 ) ) - 1.0 ) ) * 2.0 ));
				float smoothstepResult1130 = smoothstep( 0.0 , 0.5 , textureValue592);
				float lerpResult1123 = lerp( 0.0 , saturate( smoothstepResult1_g145 ) , smoothstepResult1130);
				float noiseEmissionValue1044 = lerpResult1123;
				float value44_g147 = noiseEmissionValue1044;
				float valueSelect808 = _valueSelect;
				float valueSelect41_g147 = valueSelect808;
				float valueRangeHigher973 = _valueRangeHigher;
				float valueRange906 = _valueRange;
				float valueRange39_g147 = ( 1.0 - valueRange906 );
				float valueRangeHigher30_g147 = ( 1.0 - ( valueRangeHigher973 * ( 1.0 - valueRange39_g147 ) ) );
				float valueRangeLower972 = _valueRangeLower;
				float valueRangeLower37_g147 = ( 1.0 - ( valueRangeLower972 * ( 1.0 - valueRange39_g147 ) ) );
				float ifLocalVar23_g147 = 0;
				if( value44_g147 > valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeHigher30_g147 ) ) * ( ( ( 1.0 - value44_g147 ) * ( 1.0 / ( 1.0 - valueSelect41_g147 ) ) ) - valueRangeHigher30_g147 ) );
				else if( value44_g147 == valueSelect41_g147 )
				ifLocalVar23_g147 = valueSelect41_g147;
				else if( value44_g147 < valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeLower37_g147 ) ) * ( ( value44_g147 * ( 1.0 / valueSelect41_g147 ) ) - valueRangeLower37_g147 ) );
				float textueEmmissionMask1043 = saturate( ifLocalVar23_g147 );
				float textureEmissionIntensity1051 = _textureEmissionIntensity;
				float3 hdEmission1049 = ASEGetEmissionHDRColor(( textueEmmissionMask1043 * _emissionColor ).rgb,ConvertEvToLuminance(textureEmissionIntensity1051),0.0,GetInverseCurrentExposureMultiplier());
				float3 textireEmission1054 = ( textureEmissionOn1056 == 1.0 ? hdEmission1049 : float3( 0,0,0 ) );
				float3 EMISSION61 = ( hdEmission57 + textireEmission1054 );
				
				float SMOOTHNESS270 = ( _textureSmoothnessOn == 1.0 ? textureSmoothness759 : _smoothness );
				
				surfaceDescription.Albedo = DEBUG14.xyz;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = METALIC268;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = EMISSION61;
				surfaceDescription.Smoothness = SMOOTHNESS270;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				UnityMetaInput metaInput;
				metaInput.Albedo = lightTransportData.diffuseColor.rgb;
				metaInput.Emission = lightTransportData.emissiveColor;
			#ifdef EDITOR_VISUALIZATION
				metaInput.VizUV = packedInput.VizUV;
				metaInput.LightCoord = packedInput.LightCoord;
			#endif
				res = UnityMetaFragment(metaInput);

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				float bias = max(abs(ddx(posInput.deviceDepth)), abs(ddy(posInput.deviceDepth))) * _SlopeScaleDepthBias;
				outputDepth += bias;
				#endif

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmesh.positionCS.z;

				#ifdef _ALPHATOMASK_ON
				depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
				#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS 1

			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag
			
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 

			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        

			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			int _ObjectId;
			int _PassValue;

			
			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						, out float4 outColor : SV_Target0
						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }
			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local_fragment _ _DISABLE_DECALS
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag
			
			//#define UNITY_MATERIAL_LIT

			
			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
				UNITY_DEFINE_INSTANCED_PROP(float, _UV_ratioX)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

					float2 voronoihash664( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi664( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash664( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash677( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi677( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash677( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash696( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi696( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash696( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				
				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif
			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_NORMAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target2
			#elif defined(WRITE_NORMAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_DECAL SV_Target1
			#else
			#define SV_TARGET_DECAL SV_Target0
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#if defined(SCENESELECTIONPASS) || defined(SCENEPICKINGPASS)
						, out float4 outColor : SV_Target0
						#else
							#ifdef WRITE_MSAA_DEPTH
							, out float4 depthColor : SV_Target0
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target1
								#endif
							#else
								#ifdef WRITE_NORMAL_BUFFER
								, out float4 outNormalBuffer : SV_Target0
								#endif
							#endif

							#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
							, out float4 outDecalBuffer : SV_TARGET_DECAL
							#endif
						#endif

						#if defined(_DEPTHOFFSET_ON) && !defined(SCENEPICKINGPASS)
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float noiseScale370 = ( 1.0 / _noiseScale );
				float noiseAnlge372 = _noiseAnlge;
				float time664 = noiseAnlge372;
				float2 voronoiSmoothId664 = 0;
				float noiseSmoothness576 = ( _noiseSmoothness / 2.0 );
				float voronoiSmooth664 = noiseSmoothness576;
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float _UV_ratioX_Instance = UNITY_ACCESS_INSTANCED_PROP(terrainPrototypeDEBUG_Shader,_UV_ratioX);
				float2 appendResult194 = (float2(_UV_ratioX_Instance , _UV_ratioY));
				float2 UV_WORLD_MAPPING28 = ( (ase_worldPos).xz * appendResult194 );
				float2 temp_output_672_0 = ( UV_WORLD_MAPPING28 * 1.0 );
				float2 coords664 = temp_output_672_0 * noiseScale370;
				float2 id664 = 0;
				float2 uv664 = 0;
				float fade664 = 0.5;
				float voroi664 = 0;
				float rest664 = 0;
				for( int it664 = 0; it664 <6; it664++ ){
				voroi664 += fade664 * voronoi664( coords664, time664, id664, uv664, voronoiSmooth664,voronoiSmoothId664 );
				rest664 += fade664;
				coords664 *= 2;
				fade664 *= 0.5;
				}//Voronoi664
				voroi664 /= rest664;
				float time677 = noiseAnlge372;
				float2 voronoiSmoothId677 = 0;
				float voronoiSmooth677 = noiseSmoothness576;
				float2 coords677 = ( temp_output_672_0 + float2( 713.317,379.371 ) ) * ( noiseScale370 / 5.376 );
				float2 id677 = 0;
				float2 uv677 = 0;
				float fade677 = 0.5;
				float voroi677 = 0;
				float rest677 = 0;
				for( int it677 = 0; it677 <4; it677++ ){
				voroi677 += fade677 * voronoi677( coords677, time677, id677, uv677, voronoiSmooth677,voronoiSmoothId677 );
				rest677 += fade677;
				coords677 *= 2;
				fade677 *= 0.5;
				}//Voronoi677
				voroi677 /= rest677;
				float blendOpSrc714 = voroi664;
				float blendOpDest714 = voroi677;
				float time696 = ( noiseAnlge372 + 739.736 );
				float2 voronoiSmoothId696 = 0;
				float2 coords696 = ( temp_output_672_0 + float2( 317.289,497.376 ) ) * ( noiseScale370 / 9.763 );
				float2 id696 = 0;
				float2 uv696 = 0;
				float fade696 = 0.5;
				float voroi696 = 0;
				float rest696 = 0;
				for( int it696 = 0; it696 <6; it696++ ){
				voroi696 += fade696 * voronoi696( coords696, time696, id696, uv696, 0,voronoiSmoothId696 );
				rest696 += fade696;
				coords696 *= 2;
				fade696 *= 0.5;
				}//Voronoi696
				voroi696 /= rest696;
				float blendOpSrc715 = (( blendOpDest714 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest714 ) * ( 1.0 - blendOpSrc714 ) ) : ( 2.0 * blendOpDest714 * blendOpSrc714 ) );
				float blendOpDest715 = voroi696;
				float lerpBlendMode715 = lerp(blendOpDest715,(( blendOpDest715 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest715 ) * ( 1.0 - blendOpSrc715 ) ) : ( 2.0 * blendOpDest715 * blendOpSrc715 ) ),-1.0);
				float temp_output_715_0 = lerpBlendMode715;
				float textureValueRaw607 = temp_output_715_0;
				float smoothstepResult751 = smoothstep( ( _smoothnessHardness * _smoothnessRange ) , _smoothnessRange , textureValueRaw607);
				float textureSmoothness759 = saturate( smoothstepResult751 );
				float SMOOTHNESS270 = ( _textureSmoothnessOn == 1.0 ? textureSmoothness759 : _smoothness );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = SMOOTHNESS270;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_MSAA_DEPTH	
					depthColor = packedInput.positionCS.z;
					#ifdef _ALPHATOMASK_ON
						depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

				#if defined(WRITE_NORMAL_BUFFER)
				EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
				DecalPrepassData decalPrepassData;
				decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
				decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
				EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }
			// DONE
			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
			#pragma multi_compile _ WRITE_DECAL_BUFFER

			#pragma vertex Vert
			#pragma fragment Frag
			
			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
				UNITY_DEFINE_INSTANCED_PROP(float, _UV_ratioX)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


					float2 voronoihash664( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi664( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash664( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash677( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi677( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash677( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash696( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi696( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash696( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				outputPackedVaryingsMeshToPS.ase_texcoord3.xyz = ase_worldPos;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				#if UNITY_REVERSED_Z
				VMESHpositionCS.z -= unity_MotionVectorsParams.z * VMESHpositionCS.w;
				#else
				VMESHpositionCS.z += unity_MotionVectorsParams.z * VMESHpositionCS.w;
				#endif

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						if (_TransparentCameraOnlyMotionVectors > 0)
						{
							previousPositionRWS = VMESHpositionRWS.xyz;
						}
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(WRITE_DECAL_BUFFER) && !defined(_DISABLE_DECALS)
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalPrepassBuffer.hlsl"
			#endif


			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(WRITE_DECAL_BUFFER) && defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target3
			#elif defined(WRITE_DECAL_BUFFER) || defined(WRITE_MSAA_DEPTH)
			#define SV_TARGET_NORMAL SV_Target2
			#else
			#define SV_TARGET_NORMAL SV_Target1
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_MSAA_DEPTH
					, out float4 depthColor : SV_Target0
					, out float4 outMotionVector : SV_Target1
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target2
						#endif
					#else
					, out float4 outMotionVector : SV_Target0
						#ifdef WRITE_DECAL_BUFFER
						, out float4 outDecalBuffer : SV_Target1
						#endif
					#endif

					#ifdef WRITE_NORMAL_BUFFER
					, out float4 outNormalBuffer : SV_TARGET_NORMAL
					#endif

					#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
					#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float noiseScale370 = ( 1.0 / _noiseScale );
				float noiseAnlge372 = _noiseAnlge;
				float time664 = noiseAnlge372;
				float2 voronoiSmoothId664 = 0;
				float noiseSmoothness576 = ( _noiseSmoothness / 2.0 );
				float voronoiSmooth664 = noiseSmoothness576;
				float3 ase_worldPos = packedInput.ase_texcoord3.xyz;
				float _UV_ratioX_Instance = UNITY_ACCESS_INSTANCED_PROP(terrainPrototypeDEBUG_Shader,_UV_ratioX);
				float2 appendResult194 = (float2(_UV_ratioX_Instance , _UV_ratioY));
				float2 UV_WORLD_MAPPING28 = ( (ase_worldPos).xz * appendResult194 );
				float2 temp_output_672_0 = ( UV_WORLD_MAPPING28 * 1.0 );
				float2 coords664 = temp_output_672_0 * noiseScale370;
				float2 id664 = 0;
				float2 uv664 = 0;
				float fade664 = 0.5;
				float voroi664 = 0;
				float rest664 = 0;
				for( int it664 = 0; it664 <6; it664++ ){
				voroi664 += fade664 * voronoi664( coords664, time664, id664, uv664, voronoiSmooth664,voronoiSmoothId664 );
				rest664 += fade664;
				coords664 *= 2;
				fade664 *= 0.5;
				}//Voronoi664
				voroi664 /= rest664;
				float time677 = noiseAnlge372;
				float2 voronoiSmoothId677 = 0;
				float voronoiSmooth677 = noiseSmoothness576;
				float2 coords677 = ( temp_output_672_0 + float2( 713.317,379.371 ) ) * ( noiseScale370 / 5.376 );
				float2 id677 = 0;
				float2 uv677 = 0;
				float fade677 = 0.5;
				float voroi677 = 0;
				float rest677 = 0;
				for( int it677 = 0; it677 <4; it677++ ){
				voroi677 += fade677 * voronoi677( coords677, time677, id677, uv677, voronoiSmooth677,voronoiSmoothId677 );
				rest677 += fade677;
				coords677 *= 2;
				fade677 *= 0.5;
				}//Voronoi677
				voroi677 /= rest677;
				float blendOpSrc714 = voroi664;
				float blendOpDest714 = voroi677;
				float time696 = ( noiseAnlge372 + 739.736 );
				float2 voronoiSmoothId696 = 0;
				float2 coords696 = ( temp_output_672_0 + float2( 317.289,497.376 ) ) * ( noiseScale370 / 9.763 );
				float2 id696 = 0;
				float2 uv696 = 0;
				float fade696 = 0.5;
				float voroi696 = 0;
				float rest696 = 0;
				for( int it696 = 0; it696 <6; it696++ ){
				voroi696 += fade696 * voronoi696( coords696, time696, id696, uv696, 0,voronoiSmoothId696 );
				rest696 += fade696;
				coords696 *= 2;
				fade696 *= 0.5;
				}//Voronoi696
				voroi696 /= rest696;
				float blendOpSrc715 = (( blendOpDest714 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest714 ) * ( 1.0 - blendOpSrc714 ) ) : ( 2.0 * blendOpDest714 * blendOpSrc714 ) );
				float blendOpDest715 = voroi696;
				float lerpBlendMode715 = lerp(blendOpDest715,(( blendOpDest715 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest715 ) * ( 1.0 - blendOpSrc715 ) ) : ( 2.0 * blendOpDest715 * blendOpSrc715 ) ),-1.0);
				float temp_output_715_0 = lerpBlendMode715;
				float textureValueRaw607 = temp_output_715_0;
				float smoothstepResult751 = smoothstep( ( _smoothnessHardness * _smoothnessRange ) , _smoothnessRange , textureValueRaw607);
				float textureSmoothness759 = saturate( smoothstepResult751 );
				float SMOOTHNESS270 = ( _textureSmoothnessOn == 1.0 ? textureSmoothness759 : _smoothness );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = SMOOTHNESS270;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );


				
				#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmeshPositionCS.z;
					#ifdef _ALPHATOMASK_ON
					depthColor.a = SharpenAlpha(builtinData.opacity, builtinData.alphaClipTreshold);
					#endif
				#endif

			
				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), outNormalBuffer);
				#endif

				#if defined(WRITE_DECAL_BUFFER)
					DecalPrepassData decalPrepassData;
					#ifdef _DISABLE_DECALS
					ZERO_INITIALIZE(DecalPrepassData, decalPrepassData);
					#else
					decalPrepassData.geomNormalWS = surfaceData.geomNormalWS;
					decalPrepassData.decalLayerMask = GetMeshRenderingDecalLayer();
					#endif
					EncodeIntoDecalPrepassBuffer(decalPrepassData, outDecalBuffer);
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }
			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_ColorMaskTransparentVel] 1

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

			#define SHADERPASS SHADERPASS_FORWARD
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH SHADOW_VERY_HIGH
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
			#pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#endif

			#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif

			#pragma vertex Vert
			#pragma fragment Frag
			
			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 

			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			// CBuffer must be declared before Material.hlsl since it internaly uses _BlendMode now
			CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
				UNITY_DEFINE_INSTANCED_PROP(float, _UV_ratioX)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			#define HAS_LIGHTLOOP
			#define SHADER_LIT 1
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			#include "Packages/com.unity.shadergraph/ShaderGraphLibrary/Functions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ASE_NEEDS_FRAG_RELATIVE_WORLD_POS
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_POSITION


			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS : TEXCOORD0;
				float3 normalWS : TEXCOORD1;
				float4 tangentWS : TEXCOORD2;
				float4 uv1 : TEXCOORD3;
				float4 uv2 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

					float2 voronoihash664( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi664( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash664( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash677( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi677( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash677( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 //		if( d<F1 ) {
						 //			F2 = F1;
						 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
						 //		} else if( d<F2 ) {
						 //			F2 = d;
						
						 //		}
						 	}
						}
						return F1;
					}
			
					float2 voronoihash696( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi696( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash696( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return (F2 + F1) * 0.5;
					}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			
			float4 SampleGradient( Gradient gradient, float time )
			{
				float3 color = gradient.colors[0].rgb;
				UNITY_UNROLL
				for (int c = 1; c < 8; c++)
				{
				float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, gradient.colorsLength-1));
				color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
				}
				#ifndef UNITY_COLORSPACE_GAMMA
				color = SRGBToLinear(color);
				#endif
				float alpha = gradient.alphas[0].x;
				UNITY_UNROLL
				for (int a = 1; a < 8; a++)
				{
				float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, gradient.alphasLength-1));
				alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
				}
				return float4(color, alpha);
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			
					float2 voronoihash1063( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi1063( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash1063( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F2;
					}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				bentNormalWS = surfaceData.normalWS;
				
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );


				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				#endif

				#ifdef _ALPHATEST_ON    
                    builtinData.alphaClipTreshold = surfaceDescription.AlphaClipThreshold;
                #endif

				#ifdef UNITY_VIRTUAL_TEXTURING
                builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
                #endif

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif

				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(inputMesh.positionOS));
				float eyeDepth = -objectToViewPos.z;
				outputPackedVaryingsMeshToPS.ase_texcoord7.x = eyeDepth;
				
				outputPackedVaryingsMeshToPS.ase_texcoord7.yz = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.positionRWS.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.normalWS.xyz = normalWS;
				outputPackedVaryingsMeshToPS.tangentWS.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.uv1.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.uv2.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = v.previousPositionOS;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = v.precomputedVelocity;
					#endif
				#endif
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
					#endif
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			#ifdef UNITY_VIRTUAL_TEXTURING
			#define VT_BUFFER_TARGET SV_Target1
			#define EXTRA_BUFFER_TARGET SV_Target2
			#else
			#define EXTRA_BUFFER_TARGET SV_Target1
			#endif

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						#ifdef UNITY_VIRTUAL_TEXTURING
							out float4 outVTFeedback : VT_BUFFER_TARGET,
						#endif
						out float4 outDiffuseLighting : EXTRA_BUFFER_TARGET,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
						#ifdef UNITY_VIRTUAL_TEXTURING
							,out float4 outVTFeedback : VT_BUFFER_TARGET
						#endif
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.positionRWS.xyz;
				float3 normalWS = packedInput.normalWS.xyz;
				float4 tangentWS = packedInput.tangentWS.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.uv1.xyzw;
				input.texCoord2 = packedInput.uv2.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float DEBUG_SLOT_118 = _DEBUG_SLOT_1;
				int temp_output_8_0_g142 = (int)DEBUG_SLOT_118;
				float4 color7_g144 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g144 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float3 ase_worldPos = GetAbsolutePositionWS( positionRWS );
				float _UV_ratioX_Instance = UNITY_ACCESS_INSTANCED_PROP(terrainPrototypeDEBUG_Shader,_UV_ratioX);
				float2 appendResult194 = (float2(_UV_ratioX_Instance , _UV_ratioY));
				float2 UV_WORLD_MAPPING28 = ( (ase_worldPos).xz * appendResult194 );
				float offsetX_Checkboard86 = _offsetX_Checkboard;
				float offsetY_Checkboard87 = _offsetY_Checkboard;
				float2 appendResult96 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float scale_Checkboard85 = _scale_Checkboard;
				float2 offsetCentering130 = ( _offsetCenteringCheckboard == 1.0 ? float2( 0.25,0.25 ) : float2( 0,0 ) );
				float2 UV_checkboard1X1102 = (UV_WORLD_MAPPING28*0.5 + ( ( appendResult96 * scale_Checkboard85 ) + offsetCentering130 ));
				float2 FinalUV13_g144 = ( float2( 1,1 ) * ( 0.5 + UV_checkboard1X1102 ) );
				float2 temp_cast_2 = (0.5).xx;
				float2 temp_cast_3 = (1.0).xx;
				float4 appendResult16_g144 = (float4(ddx( FinalUV13_g144 ) , ddy( FinalUV13_g144 )));
				float4 UVDerivatives17_g144 = appendResult16_g144;
				float4 break28_g144 = UVDerivatives17_g144;
				float2 appendResult19_g144 = (float2(break28_g144.x , break28_g144.z));
				float2 appendResult20_g144 = (float2(break28_g144.x , break28_g144.z));
				float dotResult24_g144 = dot( appendResult19_g144 , appendResult20_g144 );
				float2 appendResult21_g144 = (float2(break28_g144.y , break28_g144.w));
				float2 appendResult22_g144 = (float2(break28_g144.y , break28_g144.w));
				float dotResult23_g144 = dot( appendResult21_g144 , appendResult22_g144 );
				float2 appendResult25_g144 = (float2(dotResult24_g144 , dotResult23_g144));
				float2 derivativesLength29_g144 = sqrt( appendResult25_g144 );
				float2 temp_cast_4 = (-1.0).xx;
				float2 temp_cast_5 = (1.0).xx;
				float2 clampResult57_g144 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g144 + 0.25 ) ) - temp_cast_2 ) ) * 4.0 ) - temp_cast_3 ) * ( 0.35 / derivativesLength29_g144 ) ) , temp_cast_4 , temp_cast_5 );
				float2 break71_g144 = clampResult57_g144;
				float2 break55_g144 = derivativesLength29_g144;
				float4 lerpResult73_g144 = lerp( color7_g144 , color8_g144 , saturate( ( 0.5 + ( 0.5 * break71_g144.x * break71_g144.y * sqrt( saturate( ( 1.1 - max( break55_g144.x , break55_g144.y ) ) ) ) ) ) ));
				float4 checkboard1x181 = lerpResult73_g144;
				float4 color7_g148 = IsGammaSpace() ? float4(0.2,0.2,0.2,0) : float4(0.03310476,0.03310476,0.03310476,0);
				float4 color8_g148 = IsGammaSpace() ? float4(0.6980392,0.6980392,0.6980392,0) : float4(0.4452012,0.4452012,0.4452012,0);
				float2 appendResult45 = (float2(offsetX_Checkboard86 , offsetY_Checkboard87));
				float2 UV_checkboardCustom92 = (UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + ( appendResult45 + offsetCentering130 ));
				float2 FinalUV13_g148 = ( float2( 1,1 ) * ( 0.5 + UV_checkboardCustom92 ) );
				float2 temp_cast_6 = (0.5).xx;
				float2 temp_cast_7 = (1.0).xx;
				float4 appendResult16_g148 = (float4(ddx( FinalUV13_g148 ) , ddy( FinalUV13_g148 )));
				float4 UVDerivatives17_g148 = appendResult16_g148;
				float4 break28_g148 = UVDerivatives17_g148;
				float2 appendResult19_g148 = (float2(break28_g148.x , break28_g148.z));
				float2 appendResult20_g148 = (float2(break28_g148.x , break28_g148.z));
				float dotResult24_g148 = dot( appendResult19_g148 , appendResult20_g148 );
				float2 appendResult21_g148 = (float2(break28_g148.y , break28_g148.w));
				float2 appendResult22_g148 = (float2(break28_g148.y , break28_g148.w));
				float dotResult23_g148 = dot( appendResult21_g148 , appendResult22_g148 );
				float2 appendResult25_g148 = (float2(dotResult24_g148 , dotResult23_g148));
				float2 derivativesLength29_g148 = sqrt( appendResult25_g148 );
				float2 temp_cast_8 = (-1.0).xx;
				float2 temp_cast_9 = (1.0).xx;
				float2 clampResult57_g148 = clamp( ( ( ( abs( ( frac( ( FinalUV13_g148 + 0.25 ) ) - temp_cast_6 ) ) * 4.0 ) - temp_cast_7 ) * ( 0.35 / derivativesLength29_g148 ) ) , temp_cast_8 , temp_cast_9 );
				float2 break71_g148 = clampResult57_g148;
				float2 break55_g148 = derivativesLength29_g148;
				float4 lerpResult73_g148 = lerp( color7_g148 , color8_g148 , saturate( ( 0.5 + ( 0.5 * break71_g148.x * break71_g148.y * sqrt( saturate( ( 1.1 - max( break55_g148.x , break55_g148.y ) ) ) ) ) ) ));
				float4 checkboardCustom32 = lerpResult73_g148;
				float checkboardLerp108 = _checkboardLerp;
				float4 lerpResult83 = lerp( checkboard1x181 , checkboardCustom32 , checkboardLerp108);
				float4 lerpResult1140 = lerp( lerpResult83 , ( lerpResult83 * _checkboard_hint ) , _checkboard_hint.a);
				float4 CHECKBOARD106 = lerpResult1140;
				float4 temp_output_9_0_g142 = CHECKBOARD106;
				float pixelWidth111 =  1.0f / 2.0;
				float pixelHeight111 = 1.0f / 2.0;
				half2 pixelateduv111 = half2((int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).x / pixelWidth111) * pixelWidth111, (int)((UV_WORLD_MAPPING28*( ( 1.0 / scale_Checkboard85 ) / 2.0 ) + offsetCentering130).y / pixelHeight111) * pixelHeight111);
				float2 normalizeResult114 = normalize( pixelateduv111 );
				float4 color148 = IsGammaSpace() ? float4(0,0,0,0) : float4(0,0,0,0);
				float4 UV_VISUALISATION137 = ( min( normalizeResult114 , float2( 10,10 ) ).x == 10.0 ? color148 : float4( normalizeResult114, 0.0 , 0.0 ) );
				float4 temp_output_10_0_g142 = UV_VISUALISATION137;
				float2 UV_WORLD_STATIC197 = (ase_worldPos).xz;
				float2 appendResult211 = (float2(_distancePositionX , _distancePositionY));
				float2 distancePosition293 = ( appendResult211 * float2( 2,2 ) );
				float temp_output_163_0 = distance( (UV_WORLD_STATIC197*2.0 + distancePosition293) , float2( 0,0 ) );
				float smoothstepResult171 = smoothstep( ( _distanceHardness * _distanceRange ) , _distanceRange , temp_output_163_0);
				float4 lerpResult179 = lerp( ( _distanceInnerColor * _distanceInnerColor.a ) , ( _distanceBorderColor * _distanceBorderColor.a ) , smoothstepResult171);
				float temp_output_177_0 = ( _distanceRange + _distanceBorderSize );
				float smoothstepResult175 = smoothstep( temp_output_177_0 , temp_output_177_0 , temp_output_163_0);
				float4 lerpResult183 = lerp( lerpResult179 , ( _distanceBackgroundColor * _distanceBackgroundColor.a ) , smoothstepResult175);
				float4 RADIUS_VISUALISATION161 = lerpResult183;
				float4 temp_output_11_0_g142 = RADIUS_VISUALISATION161;
				float lightHardness329 = ( _lightHardness * _lightRange );
				float lightRange331 = _lightRange;
				float2 break302 = -(UV_WORLD_STATIC197*2.0 + distancePosition293);
				float lightHeight324 = ( _lightHeight * 100.0 );
				float3 appendResult298 = (float3(break302.x , lightHeight324 , break302.y));
				float3 normalizeResult306 = normalize( appendResult298 );
				float dotResult254 = dot( normalWS , normalizeResult306 );
				float smoothstepResult288 = smoothstep( lightHardness329 , lightRange331 , dotResult254);
				float CUSTOM_LIGHT281 = smoothstepResult288;
				float4 temp_cast_17 = (CUSTOM_LIGHT281).xxxx;
				float4 temp_output_12_0_g142 = temp_cast_17;
				float edgeHardness434 = _edgeHardness;
				float edgeRange435 = _edgeRange;
				float cameraDepthLenght438 = _cameraDepthLenght;
				float cameraDepthOffset439 = _cameraDepthOffset;
				float eyeDepth = packedInput.ase_texcoord7.x;
				float cameraDepthFade415 = (( eyeDepth -_ProjectionParams.y - cameraDepthOffset439 ) / cameraDepthLenght438);
				float cameraDepthFade432 = cameraDepthFade415;
				float temp_output_425_0 = ( edgeRange435 * cameraDepthFade432 );
				float3 normalizedWorldNormal = normalize( normalWS );
				float3 temp_output_399_0 = ddx( normalizedWorldNormal );
				float dotResult396 = dot( temp_output_399_0 , temp_output_399_0 );
				float3 temp_output_398_0 = ddy( normalizedWorldNormal );
				float dotResult397 = dot( temp_output_398_0 , temp_output_398_0 );
				float ifLocalVar400 = 0;
				if( dotResult396 > dotResult397 )
				ifLocalVar400 = dotResult396;
				else if( dotResult396 < dotResult397 )
				ifLocalVar400 = dotResult397;
				float smoothstepResult404 = smoothstep( ( edgeHardness434 * temp_output_425_0 ) , temp_output_425_0 , sqrt( ifLocalVar400 ));
				float visualizeCameraDepth478 = _visualizeCameraDepth;
				float lerpResult475 = lerp( smoothstepResult404 , cameraDepthFade432 , visualizeCameraDepth478);
				float EDGE_DETECT430 = lerpResult475;
				float4 temp_cast_19 = (EDGE_DETECT430).xxxx;
				float4 temp_output_13_0_g142 = temp_cast_19;
				float texture_DEBUG_SLOT_1594 = _texture_DEBUG_SLOT_1;
				int temp_output_8_0_g143 = (int)texture_DEBUG_SLOT_1594;
				float noiseHardness584 = ( _noiseHardness * _noiseRange );
				float noiseRange586 = _noiseRange;
				float noiseScale370 = ( 1.0 / _noiseScale );
				float noiseAnlge372 = _noiseAnlge;
				float time664 = noiseAnlge372;
				float2 voronoiSmoothId664 = 0;
				float noiseSmoothness576 = ( _noiseSmoothness / 2.0 );
				float voronoiSmooth664 = noiseSmoothness576;
				float2 temp_output_672_0 = ( UV_WORLD_MAPPING28 * 1.0 );
				float2 coords664 = temp_output_672_0 * noiseScale370;
				float2 id664 = 0;
				float2 uv664 = 0;
				float fade664 = 0.5;
				float voroi664 = 0;
				float rest664 = 0;
				for( int it664 = 0; it664 <6; it664++ ){
				voroi664 += fade664 * voronoi664( coords664, time664, id664, uv664, voronoiSmooth664,voronoiSmoothId664 );
				rest664 += fade664;
				coords664 *= 2;
				fade664 *= 0.5;
				}//Voronoi664
				voroi664 /= rest664;
				float time677 = noiseAnlge372;
				float2 voronoiSmoothId677 = 0;
				float voronoiSmooth677 = noiseSmoothness576;
				float2 coords677 = ( temp_output_672_0 + float2( 713.317,379.371 ) ) * ( noiseScale370 / 5.376 );
				float2 id677 = 0;
				float2 uv677 = 0;
				float fade677 = 0.5;
				float voroi677 = 0;
				float rest677 = 0;
				for( int it677 = 0; it677 <4; it677++ ){
				voroi677 += fade677 * voronoi677( coords677, time677, id677, uv677, voronoiSmooth677,voronoiSmoothId677 );
				rest677 += fade677;
				coords677 *= 2;
				fade677 *= 0.5;
				}//Voronoi677
				voroi677 /= rest677;
				float blendOpSrc714 = voroi664;
				float blendOpDest714 = voroi677;
				float time696 = ( noiseAnlge372 + 739.736 );
				float2 voronoiSmoothId696 = 0;
				float2 coords696 = ( temp_output_672_0 + float2( 317.289,497.376 ) ) * ( noiseScale370 / 9.763 );
				float2 id696 = 0;
				float2 uv696 = 0;
				float fade696 = 0.5;
				float voroi696 = 0;
				float rest696 = 0;
				for( int it696 = 0; it696 <6; it696++ ){
				voroi696 += fade696 * voronoi696( coords696, time696, id696, uv696, 0,voronoiSmoothId696 );
				rest696 += fade696;
				coords696 *= 2;
				fade696 *= 0.5;
				}//Voronoi696
				voroi696 /= rest696;
				float blendOpSrc715 = (( blendOpDest714 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest714 ) * ( 1.0 - blendOpSrc714 ) ) : ( 2.0 * blendOpDest714 * blendOpSrc714 ) );
				float blendOpDest715 = voroi696;
				float lerpBlendMode715 = lerp(blendOpDest715,(( blendOpDest715 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest715 ) * ( 1.0 - blendOpSrc715 ) ) : ( 2.0 * blendOpDest715 * blendOpSrc715 ) ),-1.0);
				float temp_output_715_0 = lerpBlendMode715;
				float smoothstepResult578 = smoothstep( noiseHardness584 , noiseRange586 , temp_output_715_0);
				float textureValue592 = smoothstepResult578;
				float4 temp_cast_23 = (textureValue592).xxxx;
				float4 temp_output_9_0_g143 = temp_cast_23;
				float gradient_DEBUG_SLOT_1624 = _gradient_DEBUG_SLOT_1;
				int temp_output_8_0_g146 = (int)gradient_DEBUG_SLOT_1624;
				Gradient gradient46_g146 = NewGradient( 0, 2, 2, float4( 0.5, 0, 1, 0 ), float4( 0.5, 0.986376, 0.01362398, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradientInvert645 = _gradientInvert;
				float temp_output_40_0_g146 = textureValue592;
				float valueMap95_g146 = saturate( ( (float)(int)gradientInvert645 == 1.0 ? ( 1.0 - temp_output_40_0_g146 ) : temp_output_40_0_g146 ) );
				Gradient gradient57_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 1, 0 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient58_g146 = NewGradient( 0, 3, 2, float4( 0.5, 0, 1, 0 ), float4( 0, 1, 0.25, 0.5000076 ), float4( 1, 0.775, 0, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient56_g146 = NewGradient( 0, 4, 2, float4( 0.5, 0, 1, 0 ), float4( 1, 0, 0, 0.3300069 ), float4( 0.496063, 1, 0, 0.6599985 ), float4( 0, 1, 1, 1 ), 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient59_g146 = NewGradient( 0, 2, 2, float4( 1, 0, 0, 0 ), float4( 0, 0, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient60_g146 = NewGradient( 1, 8, 2, float4( 1, 0, 0, 0.1250019 ), float4( 1, 0.5, 0, 0.2500038 ), float4( 1, 1, 0, 0.3750057 ), float4( 0.5, 1, 0, 0.5000076 ), float4( 0, 1, 0, 0.6249943 ), float4( 0, 0.5, 1, 0.7499962 ), float4( 0, 0, 1, 0.8749981 ), float4( 1, 0, 0.5, 1 ), float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				Gradient gradient65_g146 = NewGradient( 0, 2, 2, float4( 0, 0, 0, 0 ), float4( 1, 1, 1, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
				float gradient_DEBUG_SLOT_2625 = _gradient_DEBUG_SLOT_2;
				int temp_output_28_0_g146 = (int)gradient_DEBUG_SLOT_2625;
				float gradient_DEBUG_LERP626 = _gradient_DEBUG_LERP;
				float4 lerpResult29_g146 = lerp( ( (float)temp_output_8_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_8_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g146 == 0.0 ? SampleGradient( gradient46_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 1.0 ? SampleGradient( gradient57_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 2.0 ? SampleGradient( gradient58_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 3.0 ? SampleGradient( gradient56_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 4.0 ? SampleGradient( gradient59_g146, valueMap95_g146 ) : ( (float)temp_output_28_0_g146 == 5.0 ? SampleGradient( gradient60_g146, valueMap95_g146 ) : SampleGradient( gradient65_g146, valueMap95_g146 ) ) ) ) ) ) ) , gradient_DEBUG_LERP626);
				float3 hsvTorgb76_g146 = RGBToHSV( lerpResult29_g146.rgb );
				float HHue654 = _HHue;
				float SSaturation655 = _SSaturation;
				float gradienMultiplyByValue725 = _gradienMultiplyByValue;
				float VValue656 = _VValue;
				float temp_output_80_0_g146 = VValue656;
				float3 hsvTorgb77_g146 = HSVToRGB( float3(( hsvTorgb76_g146.x + HHue654 ),( hsvTorgb76_g146.y * SSaturation655 ),( (float)(int)gradienMultiplyByValue725 == 1.0 ? ( valueMap95_g146 * ( temp_output_80_0_g146 + 1.0 ) ) : ( hsvTorgb76_g146.z + temp_output_80_0_g146 ) )) );
				float3 textureAlbedo606 = hsvTorgb77_g146;
				float4 temp_output_10_0_g143 = float4( textureAlbedo606 , 0.0 );
				float textureValueRaw607 = temp_output_715_0;
				float smoothstepResult751 = smoothstep( ( _smoothnessHardness * _smoothnessRange ) , _smoothnessRange , textureValueRaw607);
				float textureSmoothness759 = saturate( smoothstepResult751 );
				float4 temp_cast_46 = (textureSmoothness759).xxxx;
				float4 temp_output_11_0_g143 = temp_cast_46;
				float textureMetalic608 = temp_output_715_0;
				float4 temp_cast_48 = (textureMetalic608).xxxx;
				float4 temp_output_12_0_g143 = temp_cast_48;
				float4 temp_output_13_0_g143 = float4( 0,0,0,0 );
				float4 temp_output_14_0_g143 = float4( 0,0,0,0 );
				float texture_DEBUG_SLOT_2602 = _texture_DEBUG_SLOT_2;
				int temp_output_28_0_g143 = (int)texture_DEBUG_SLOT_2602;
				float texture_DEBUG_LERP598 = _texture_DEBUG_LERP;
				float4 lerpResult29_g143 = lerp( ( (float)temp_output_8_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_8_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_8_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_8_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_8_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_8_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g143 == 0.0 ? temp_output_9_0_g143 : ( (float)temp_output_28_0_g143 == 1.0 ? temp_output_10_0_g143 : ( (float)temp_output_28_0_g143 == 2.0 ? temp_output_11_0_g143 : ( (float)temp_output_28_0_g143 == 3.0 ? temp_output_12_0_g143 : ( (float)temp_output_28_0_g143 == 4.0 ? temp_output_13_0_g143 : ( (float)temp_output_28_0_g143 == 5.0 ? temp_output_14_0_g143 : float4( 0,0,0,0 ) ) ) ) ) ) ) , texture_DEBUG_LERP598);
				float4 TEXTURE480 = lerpResult29_g143;
				float4 temp_output_14_0_g142 = TEXTURE480;
				float DEBUG_SLOT_219 = _DEBUG_SLOT_2;
				int temp_output_28_0_g142 = (int)DEBUG_SLOT_219;
				float DEBUG_LERP21 = _DEBUG_LERP;
				float4 lerpResult29_g142 = lerp( ( (float)temp_output_8_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_8_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_8_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_8_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_8_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_8_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , ( (float)temp_output_28_0_g142 == 0.0 ? temp_output_9_0_g142 : ( (float)temp_output_28_0_g142 == 1.0 ? temp_output_10_0_g142 : ( (float)temp_output_28_0_g142 == 2.0 ? temp_output_11_0_g142 : ( (float)temp_output_28_0_g142 == 3.0 ? temp_output_12_0_g142 : ( (float)temp_output_28_0_g142 == 4.0 ? temp_output_13_0_g142 : ( (float)temp_output_28_0_g142 == 5.0 ? temp_output_14_0_g142 : float4( 0,0,0,0 ) ) ) ) ) ) ) , DEBUG_LERP21);
				float _HEADER264 = min( ( _checkboard.r + _distance.r + _globalProperties.r + _lightTest_01.r + _EDGEDETECT.r + _Color5.r ) , 0.0 );
				float4 DEBUG14 = ( lerpResult29_g142 + _HEADER264 );
				
				float METALIC268 = _metalic;
				
				float emsissionIntensity59 = _emsissionIntensity;
				float3 hdEmission57 = ASEGetEmissionHDRColor(DEBUG14.xyz,emsissionIntensity59,0.0,GetInverseCurrentExposureMultiplier());
				float textureEmissionOn1056 = _textureEmissionOn;
				float time1063 = ( noiseAnlge372 + 673.167 );
				float2 voronoiSmoothId1063 = 0;
				float2 coords1063 = ( temp_output_672_0 + float2( -973.582,-137.987 ) ) * ( noiseScale370 / _hexNoiseDistortionScale );
				float2 id1063 = 0;
				float2 uv1063 = 0;
				float fade1063 = 0.5;
				float voroi1063 = 0;
				float rest1063 = 0;
				for( int it1063 = 0; it1063 <4; it1063++ ){
				voroi1063 += fade1063 * voronoi1063( coords1063, time1063, id1063, uv1063, 0,voronoiSmoothId1063 );
				rest1063 += fade1063;
				coords1063 *= 2;
				fade1063 *= 0.5;
				}//Voronoi1063
				voroi1063 /= rest1063;
				float2 temp_cast_67 = (( -_hexScale + ( _hexDistortion * ( voroi1063 - 0.5 ) ) )).xx;
				float2 break19_g145 = ( packedInput.ase_texcoord7.yz * temp_cast_67 );
				float temp_output_20_0_g145 = ( break19_g145.x * 1.5 );
				float2 appendResult14_g145 = (float2(temp_output_20_0_g145 , ( break19_g145.y + ( ( floor( temp_output_20_0_g145 ) % 2.0 ) * 0.5 ) )));
				float2 break12_g145 = abs( ( ( appendResult14_g145 % float2( 1,1 ) ) - float2( 0.5,0.5 ) ) );
				float smoothstepResult1_g145 = smoothstep( 0.0 , 3.0 , ( abs( ( max( ( ( break12_g145.x * 1.5 ) + break12_g145.y ) , ( break12_g145.y * 2.0 ) ) - 1.0 ) ) * 2.0 ));
				float smoothstepResult1130 = smoothstep( 0.0 , 0.5 , textureValue592);
				float lerpResult1123 = lerp( 0.0 , saturate( smoothstepResult1_g145 ) , smoothstepResult1130);
				float noiseEmissionValue1044 = lerpResult1123;
				float value44_g147 = noiseEmissionValue1044;
				float valueSelect808 = _valueSelect;
				float valueSelect41_g147 = valueSelect808;
				float valueRangeHigher973 = _valueRangeHigher;
				float valueRange906 = _valueRange;
				float valueRange39_g147 = ( 1.0 - valueRange906 );
				float valueRangeHigher30_g147 = ( 1.0 - ( valueRangeHigher973 * ( 1.0 - valueRange39_g147 ) ) );
				float valueRangeLower972 = _valueRangeLower;
				float valueRangeLower37_g147 = ( 1.0 - ( valueRangeLower972 * ( 1.0 - valueRange39_g147 ) ) );
				float ifLocalVar23_g147 = 0;
				if( value44_g147 > valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeHigher30_g147 ) ) * ( ( ( 1.0 - value44_g147 ) * ( 1.0 / ( 1.0 - valueSelect41_g147 ) ) ) - valueRangeHigher30_g147 ) );
				else if( value44_g147 == valueSelect41_g147 )
				ifLocalVar23_g147 = valueSelect41_g147;
				else if( value44_g147 < valueSelect41_g147 )
				ifLocalVar23_g147 = ( ( 1.0 / ( 1.0 - valueRangeLower37_g147 ) ) * ( ( value44_g147 * ( 1.0 / valueSelect41_g147 ) ) - valueRangeLower37_g147 ) );
				float textueEmmissionMask1043 = saturate( ifLocalVar23_g147 );
				float textureEmissionIntensity1051 = _textureEmissionIntensity;
				float3 hdEmission1049 = ASEGetEmissionHDRColor(( textueEmmissionMask1043 * _emissionColor ).rgb,ConvertEvToLuminance(textureEmissionIntensity1051),0.0,GetInverseCurrentExposureMultiplier());
				float3 textireEmission1054 = ( textureEmissionOn1056 == 1.0 ? hdEmission1049 : float3( 0,0,0 ) );
				float3 EMISSION61 = ( hdEmission57 + textireEmission1054 );
				
				float SMOOTHNESS270 = ( _textureSmoothnessOn == 1.0 ? textureSmoothness759 : _smoothness );
				
				surfaceDescription.Albedo = DEBUG14.xyz;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = METALIC268;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = EMISSION61;
				surfaceDescription.Smoothness = SMOOTHNESS270;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
				surfaceDescription.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = 0;
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

				bool viewMaterial = false;
				int bufferSize = _DebugViewMaterialArray[0].x;
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = _DebugViewMaterialArray[index].x;

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);

						GetPBRValidatorDebug(surfaceData, result);

						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
				#endif
					{
				#ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
					
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;
					
						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = 0;
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
				#endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
						if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
					}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef UNITY_VIRTUAL_TEXTURING
					outVTFeedback = builtinData.vtPackedFeedback;
				#endif
			}
			ENDHLSL
		}
				
		
        Pass
        {
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }
            
            Cull [_CullMode]
        
            HLSLPROGRAM
        
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999

        
			#pragma editor_sync_compilation	
			#pragma vertex Vert
			#pragma fragment Frag
		
            
			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC

        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
            
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
            #define VARYINGS_NEED_TANGENT_TO_WORLD
        
        
            #define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENEPICKINGPASS 1
            
        
			#define SHADER_UNLIT

            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
			float4 _SelectionID;
            
            CBUFFER_START( UnityPerMaterial )
			float4 _distanceBorderColor;
			float4 _Color5;
			float4 _globalProperties;
			float4 _distance;
			float4 _distanceBackgroundColor;
			float4 _checkboard;
			float4 _EDGEDETECT;
			float4 _distanceInnerColor;
			float4 _lightTest_01;
			float4 _emissionColor;
			float4 _checkboard_hint;
			float _texture_DEBUG_SLOT_2;
			float _texture_DEBUG_LERP;
			float _DEBUG_SLOT_2;
			float _DEBUG_LERP;
			float _smoothnessRange;
			float _smoothnessHardness;
			float _VValue;
			float _gradienMultiplyByValue;
			float _DEBUG_SLOT_1;
			float _metalic;
			float _emsissionIntensity;
			float _textureEmissionOn;
			float _hexScale;
			float _hexDistortion;
			float _hexNoiseDistortionScale;
			float _valueSelect;
			float _valueRangeHigher;
			float _valueRange;
			float _valueRangeLower;
			float _textureEmissionIntensity;
			float _SSaturation;
			float _HHue;
			float _gradientInvert;
			float _gradient_DEBUG_SLOT_2;
			float _UV_ratioY;
			float _offsetX_Checkboard;
			float _offsetY_Checkboard;
			float _scale_Checkboard;
			float _offsetCenteringCheckboard;
			float _checkboardLerp;
			float _distanceHardness;
			float _distanceRange;
			float _distancePositionX;
			float _distancePositionY;
			float _distanceBorderSize;
			float _lightHardness;
			float _lightRange;
			float _lightHeight;
			float _edgeHardness;
			float _edgeRange;
			float _cameraDepthLenght;
			float _cameraDepthOffset;
			float _visualizeCameraDepth;
			float _texture_DEBUG_SLOT_1;
			float _noiseHardness;
			float _noiseRange;
			float _noiseScale;
			float _noiseAnlge;
			float _noiseSmoothness;
			float _gradient_DEBUG_SLOT_1;
			float _textureSmoothnessOn;
			float _gradient_DEBUG_LERP;
			float _smoothness;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			UNITY_INSTANCING_BUFFER_START(terrainPrototypeDEBUG_Shader)
			UNITY_INSTANCING_BUFFER_END(terrainPrototypeDEBUG_Shader)

        
            
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Unlit/Unlit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        

			

			struct VertexInput
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 tangentWS : TEXCOORD1;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			
            struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};
        
        
            void GetSurfaceAndBuiltinData(SurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {    
                #ifdef LOD_FADE_CROSSFADE 
			        LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
        
                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				ZERO_BUILTIN_INITIALIZE(builtinData); 
				builtinData.opacity = surfaceDescription.Alpha;
        
				#if defined(DEBUG_DISPLAY)
					builtinData.renderingLayers = GetMeshRenderingLightLayer();
				#endif
        
                #ifdef _ALPHATEST_ON
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif

        
                ApplyDebugToBuiltinData(builtinData);
                
            }
        

			VertexOutput VertexFunction(VertexInput inputMesh  )
			{

				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =   defaultVertexValue ;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);
				
				o.positionCS = TransformWorldToHClip(positionRWS);
				o.normalWS.xyz =  normalWS;
				o.tangentWS.xyzw =  tangentWS;
		
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput Vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(	VertexOutput packedInput
						, out float4 outColor : SV_Target0	
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID(packedInput);
								
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;       
        
				input.tangentToWorld = BuildTangentToWorld(packedInput.tangentWS.xyzw, packedInput.normalWS.xyz);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold =  _AlphaCutoff;
				

				float3 V = float3(1.0, 1.0, 1.0); 
			
				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);
				outColor = _SelectionID;
			}

            ENDHLSL
        }

        Pass
        {
            Name "FullScreenDebug"
            Tags
            {
                "LightMode" = "FullScreenDebug"
            }
            
            Cull [_CullMode]
			ZTest LEqual
			ZWrite Off
        
            HLSLPROGRAM
        
			/*ase_pragma_before*/
        
			#pragma vertex Vert
			#pragma fragment Frag
			
            #pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ _DOUBLESIDED_ON
			#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
			#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
            
        
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" 
        	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" 
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" 
        
            
            #define ATTRIBUTES_NEED_NORMAL
            #define ATTRIBUTES_NEED_TANGENT
        
            #define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
        
			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define _ENERGY_CONSERVING_SPECULAR 1
        
			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
				#define OUTPUT_SPLIT_LIGHTING
			#endif
        
        
			#define HAVE_RECURSIVE_RENDERING

            #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
            #if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
                #define WRITE_NORMAL_BUFFER
            #endif
            #endif
        
            #ifndef DEBUG_DISPLAY
                
                #if !defined(_SURFACE_TYPE_TRANSPARENT)
                    #if SHADERPASS == SHADERPASS_FORWARD
                    #define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
                    #elif SHADERPASS == SHADERPASS_GBUFFER
                    #define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
                    #endif
                #endif
            #endif
        
            
            #if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
                #define _DEFERRED_CAPABLE_MATERIAL
            #endif
        
            
            #if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
                #define _WRITE_TRANSPARENT_MOTION_VECTOR
            #endif
        
            
            #include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
        	
        
            struct AttributesMesh
			{
				 float3 positionOS : POSITION;
				 float3 normalOS : NORMAL;
				 float4 tangentOS : TANGENT;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};

			struct VaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};

			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};

			struct SurfaceDescriptionInputs
			{
				 float3 TangentSpaceNormal;
			};

			struct PackedVaryingsMeshToPS
			{
				SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
			};
        
            PackedVaryingsMeshToPS PackVaryingsMeshToPS (VaryingsMeshToPS input)
			{
				PackedVaryingsMeshToPS output;
				ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}
        
			VaryingsMeshToPS UnpackVaryingsMeshToPS (PackedVaryingsMeshToPS input)
			{
				VaryingsMeshToPS output;
				output.positionCS = input.positionCS;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				return output;
			}
        
            struct VertexDescription
			{
				float3 Position;
				float3 Normal;
				float3 Tangent;
			};
        
			VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
			{
				VertexDescription description = (VertexDescription)0;
				description.Position = IN.ObjectSpacePosition;
				description.Normal = IN.ObjectSpaceNormal;
				description.Tangent = IN.ObjectSpaceTangent;
				return description;
			}
        
            struct SurfaceDescription
			{
				float3 BaseColor;
				float3 Emission;
				float Alpha;
				float3 BentNormal;
				float Smoothness;
				float Occlusion;
				float3 NormalTS;
				float Metallic;
			};
        
			SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
			{
				SurfaceDescription surface = (SurfaceDescription)0;
				surface.BaseColor = IsGammaSpace() ? float3(0.5, 0.5, 0.5) : SRGBToLinear(float3(0.5, 0.5, 0.5));
				surface.Emission = float3(0, 0, 0);
				surface.Alpha = 1;
				surface.BentNormal = IN.TangentSpaceNormal;
				surface.Smoothness = 0.5;
				surface.Occlusion = 1;
				surface.NormalTS = IN.TangentSpaceNormal;
				surface.Metallic = 0;
				return surface;
			}

			VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
			{
				VertexDescriptionInputs output;
				ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
				output.ObjectSpaceNormal =                          input.normalOS;
				output.ObjectSpaceTangent =                         input.tangentOS.xyz;
				output.ObjectSpacePosition =                        input.positionOS;
        
				return output;
			}
        
			AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters  )
			{
				VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
           
				VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);

				input.positionOS = vertexDescription.Position;
				input.normalOS = vertexDescription.Normal;
				input.tangentOS.xyz = vertexDescription.Tangent;
				return input;
			}
        
			FragInputs BuildFragInputs(VaryingsMeshToPS input)
			{
				FragInputs output;
				ZERO_INITIALIZE(FragInputs, output);
        
				output.tangentToWorld = k_identity3x3;
				output.positionSS = input.positionCS;       
        
				return output;
			}
        
        
			FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
			{
				UNITY_SETUP_INSTANCE_ID(input);
				VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
				return BuildFragInputs(unpacked);
			}


            SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
			{
				SurfaceDescriptionInputs output;
				ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
				#if defined(SHADER_STAGE_RAY_TRACING)
				#else
				#endif
				output.TangentSpaceNormal =                         float3(0.0f, 0.0f, 1.0f);        
				return output;
			}
        
			void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
        
				surfaceData.specularOcclusion = 1.0;
        
				surfaceData.baseColor =                 surfaceDescription.BaseColor;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;
        
				#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
					if (_EnableSSRefraction)
					{
        
						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif
        
            
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
        
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
        
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
        
                
					surfaceData.normalWS = float3(0, 1, 0);
				#endif
        
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
        
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif
        
				#ifdef _MATERIAL_FEATURE_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
        
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
                
                
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif
        
				#ifdef _DOUBLESIDED_ON
					float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
					float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
				#endif
        
            
				GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);
        
				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];
        
				surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    
        
        
				#if HAVE_DECALS
					if (_EnableDecals)
					{
						float alpha = 1.0;
						alpha = surfaceDescription.Alpha;
						DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
						ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
					}
				#endif
        
				bentNormalWS = surfaceData.normalWS;
        
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);
        
				#ifdef DEBUG_DISPLAY
					if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
					{
                    
						surfaceData.metallic = 0;
					}
        
					ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
            
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
                
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
                
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif
        
				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}
        
            void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
            {
                
                #if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
                #ifdef LOD_FADE_CROSSFADE 
                LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
                #endif
                #endif
        
                #ifndef SHADER_UNLIT
                #ifdef _DOUBLESIDED_ON
                    float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
                #else
                    float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
                #endif
        
                ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); 
                #endif 
        
                SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);
        
                SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);

                #ifdef _ALPHATEST_ON
                    float alphaCutoff = surfaceDescription.AlphaClipThreshold;
                    #if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
                    
                    #elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
                    
                    alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
                    #elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
                    
                    #endif
        
                    GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
                #endif
        
                #if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
                ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
                #endif
        
                #ifndef SHADER_UNLIT
                float3 bentNormalWS;
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);
        
                InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);
        
                #else
                BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);
        
                ZERO_BUILTIN_INITIALIZE(builtinData); 
                builtinData.opacity = surfaceDescription.Alpha;
        
                #if defined(DEBUG_DISPLAY)
                    builtinData.renderingLayers = GetMeshRenderingLightLayer();
                #endif
        
                #endif 
        
                #ifdef _ALPHATEST_ON
                    
                    builtinData.alphaClipTreshold = alphaCutoff;
                #endif
        
        
                builtinData.emissiveColor = surfaceDescription.Emission;

                #if _DEPTHOFFSET_ON
                builtinData.depthOffset = surfaceDescription.DepthOffset;
                #endif
        
                
                #if (SHADERPASS == SHADERPASS_DISTORTION)
                builtinData.distortion = surfaceDescription.Distortion;
                builtinData.distortionBlur = surfaceDescription.DistortionBlur;
                #endif
        
                #ifndef SHADER_UNLIT
                
                PostInitBuiltinData(V, posInput, surfaceData, builtinData);
                #else
                ApplyDebugToBuiltinData(builtinData);
                #endif
        
            }
        
			#define DEBUG_DISPLAY
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/FullScreenDebug.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

			PackedVaryingsType Vert(AttributesMesh inputMesh)
			{
				VaryingsType varyingsType;
				varyingsType.vmesh = VertMesh(inputMesh);
				return PackVaryingsType(varyingsType);
			}



			#if !defined(_DEPTHOFFSET_ON)
			[earlydepthstencil] 
			#endif
			void Frag(PackedVaryingsToPS packedInput)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				FragInputs input = UnpackVaryingsToFragInputs(packedInput);

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz);

			#ifdef PLATFORM_SUPPORTS_PRIMITIVE_ID_IN_PIXEL_SHADER
				if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_QUAD_OVERDRAW)
				{
					IncrementQuadOverdrawCounter(posInput.positionSS.xy, input.primitiveID);
				}
			#endif
			}

            ENDHLSL
        }
		
	}
	
	CustomEditor "Rendering.HighDefinition.LitShaderGraphGUI"
	
	
}
/*ASEBEGIN
Version=18934
409;1929;1846;563;5641.455;5739.334;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;472;-384,-1184;Inherit;False;1281.023;285.7938;HD EMISSION;6;61;57;60;62;1059;1060;;0,1,0.363184,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;467;-384,-1824;Inherit;False;1282.638;546.1376;DEBUG;13;14;263;12;265;165;138;7;381;10;8;267;9;481;;1,0.4029851,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;462;-3461,-1824;Inherit;False;2569.725;802.593;CHECKBOARD;13;80;103;81;22;31;83;106;105;109;104;32;1136;1140;;1,0,0.2532539,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;470;-3459,1376;Inherit;False;2564.852;420.7935;EDGE_DETECT;17;430;404;403;407;400;436;425;397;396;437;433;398;399;402;475;479;477;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;468;-3456,-416;Inherit;False;2561.862;797.6136;RADIUS_VISUALISATION;20;161;183;179;218;175;186;177;217;171;216;174;185;163;182;176;172;166;173;162;294;;0.6140351,0,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;469;-3461,480;Inherit;False;2563.704;544.7847;UV_WORLD_VISUALISATION;15;288;332;330;254;306;259;298;302;325;303;295;297;296;238;281;;1,0.7814207,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;466;-3458.377,-928;Inherit;False;2563.067;413.7455;UV_WORLD_VISUALISATION;14;137;144;154;148;146;114;111;156;126;160;124;117;123;125;;1,0.6611111,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1030;-6912,4352;Inherit;False;973;valueRangeHigher;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;582;-4720,-1728;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;597;-4992,-1280;Inherit;False;Property;_texture_DEBUG_LERP;texture_DEBUG_LERP;41;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;31;-3456,-1536;Inherit;False;92;UV_checkboardCustom;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1065;-6896,3584;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;673.167;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;397;-2912,1536;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;86;-4432,-3520;Inherit;False;offsetX_Checkboard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;664;-6672,2308.362;Inherit;True;0;1;5;0;6;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SimpleAddOpNode;698;-6880,3072;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;317.289,497.376;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;28;-4432,-3968;Inherit;False;UV_WORLD_MAPPING;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-4992,-2880;Inherit;False;Property;_distancePositionY;distancePositionY;19;0;Create;True;0;0;0;False;0;False;0;0;-500;500;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;629;-3472,4352;Inherit;False;625;gradient_DEBUG_SLOT_2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;716;-6880,3200;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;739.736;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;696;-6560,3072;Inherit;True;0;0;5;3;6;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.RangedFloatNode;26;-4992,-3584;Inherit;False;Property;_scale_Checkboard;scale_Checkboard;15;0;Create;True;0;0;0;False;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1066;-6895,3711;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;724;-4992,-896;Inherit;False;Property;_gradienMultiplyByValue;gradienMultiplyByValue;55;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-4992,-3200;Inherit;False;Property;_offsetCenteringCheckboard;offsetCenteringCheckboard;12;1;[ToggleUI];Create;True;2;Checkboard;.;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;-2416,-256;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;259;-3200,512;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BlendOpsNode;714;-6272,2304;Inherit;True;Overlay;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;131;-4736,-3200;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT2;0.25,0.25;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;297;-3200,832;Inherit;False;293;distancePosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;584;-4400,-1728;Inherit;False;noiseHardness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;85;-4416,-3584;Inherit;False;scale_Checkboard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-4992,-3520;Inherit;False;Property;_offsetX_Checkboard;offsetX_Checkboard;13;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;173;-2816,-192;Inherit;False;Property;_distanceRange;distanceRange;21;0;Create;True;0;0;0;False;0;False;1;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;628;-3472,4288;Inherit;False;624;gradient_DEBUG_SLOT_1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;620;-3472,4096;Inherit;False;592;textureValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;973;-6464,4672;Inherit;False;valueRangeHigher;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;972;-6464,4608;Inherit;False;valueRangeLower;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;906;-6448,4544;Inherit;False;valueRange;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1044;-5072,3456;Inherit;False;noiseEmissionValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;425;-2160,1664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;400;-2704,1408;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;114;-2560,-896;Inherit;False;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;185;-1920,-384;Inherit;False;Property;_distanceInnerColor;distanceInnerColor;23;1;[HDR];Create;True;0;0;0;False;0;False;0.496,0.496,0.496,0;0,0,0,0.5019608;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;571;-4432,-1600;Inherit;False;noiseNormalStrenght;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1064;-6896,3456;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;-973.582,-137.987;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-4992,-2944;Inherit;False;Property;_distancePositionX;distancePositionX;18;0;Create;True;0;0;0;False;0;False;0;0;-500;500;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;176;-2816,-128;Inherit;False;Property;_distanceBorderSize;distanceBorderSize;22;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;211;-4720,-2944;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-4432,-3456;Inherit;False;offsetY_Checkboard;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;580;-4992,-1664;Inherit;False;Property;_noiseRange;noiseRange;46;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;101;-4992,-320;Inherit;False;87;offsetY_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;441;-3456,1152;Inherit;False;438;cameraDepthLenght;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;671;-4592,-1792;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;680;-6880,2816;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;5.376;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;665;-7168,2304;Inherit;False;28;UV_WORLD_MAPPING;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;100;-4992,-384;Inherit;False;86;offsetX_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;372;-4400,-1856;Inherit;False;noiseAnlge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;587;-5792,2816;Inherit;False;584;noiseHardness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;661;-7168,2368;Inherit;False;372;noiseAnlge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;316;-4720,-2560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;148;-2432,-768;Inherit;False;Constant;_centerColor;centerColor;13;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.9470816,0,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;34;-4592,48;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;579;-4992,-1728;Inherit;False;Property;_noiseHardness;noiseHardness;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;94;-4992,-512;Inherit;False;28;UV_WORLD_MAPPING;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-4992,-256;Inherit;False;85;scale_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;576;-4416,-1792;Inherit;False;noiseSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1104;-5888,3456;Inherit;True;Hex Lattice;-1;;145;56d977fb137832a498dced8436cf6708;0;3;3;FLOAT2;3,3;False;2;FLOAT;1;False;4;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;672;-6896,2176;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;50;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;371;-4992,-1856;Inherit;False;Property;_noiseAnlge;noiseAnlge;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;586;-4400,-1664;Inherit;False;noiseRange;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;291;-4720,-2688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;677;-6672,2688;Inherit;True;0;1;5;0;4;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;663;-7168,2432;Inherit;False;370;noiseScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;163;-2416,-384;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;124;-3312,-768;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;762;-4340.032,-5245.587;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;615;-4992,-1344;Inherit;False;Property;_texture_DEBUG_SLOT_2;texture_DEBUG_SLOT_2;40;2;[IntRange];[Enum];Create;True;0;5;Value;0;Albedo;1;Roughness;2;Metalic;3;Normal;4;0;False;0;False;1;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;1063;-6559,3456;Inherit;True;0;1;1;1;4;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SimpleDivideOpNode;668;-4832,-1920;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;24;-4784,-3968;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;607;-5568,2304;Inherit;False;textureValueRaw;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;195;-4992,-4224;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleDivideOpNode;720;-6880,3328;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;9.763;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;681;-6880,2688;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;713.317,379.371;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-4992,-3456;Inherit;False;Property;_offsetY_Checkboard;offsetY_Checkboard;14;0;Create;True;0;0;0;False;0;False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;370;-4400,-1920;Inherit;False;noiseScale;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;25;-4992,-3968;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;193;-4992,-3776;Inherit;False;Property;_UV_ratioY;UV_ratioY;9;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;194;-4720,-3840;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;254;-2272,512;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;189;-4592,-3968;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-4576,176;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;562;-4992,-1792;Inherit;False;Property;_noiseSmoothness;noiseSmoothness;44;0;Create;True;0;0;0;False;0;False;0;0.45;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1122;-7168,3712;Inherit;False;Property;_hexNoiseDistortionScale;hexNoiseDistortionScale;67;0;Create;True;0;0;0;False;0;False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-4992,-2688;Inherit;False;Property;_lightHardness;lightHardness;29;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;289;-4992,-2624;Inherit;False;Property;_lightRange;lightRange;30;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;627;-3472,4416;Inherit;False;626;gradient_DEBUG_LERP;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;396;-2912,1408;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;659;-3472,4608;Inherit;False;656;VValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;604;-3456,3456;Inherit;False;592;textureValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;623;-4992,-1024;Inherit;False;Property;_gradient_DEBUG_LERP;gradient_DEBUG_LERP;53;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;405;-4992,-2432;Inherit;False;Property;_edgeHardness;edgeHardness;36;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;755;-4992,-5248;Inherit;False;607;textureValueRaw;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;432;-1088,1152;Inherit;False;cameraDepthFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;783;-6912,4480;Inherit;False;Property;_valueSelect;valueSelect;62;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;302;-2672,768;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SmoothstepOpNode;1130;-5520,3584;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;93;-4384,-512;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;0.5;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;1123;-5328,3456;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;646;-3472,4160;Inherit;False;645;gradientInvert;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-3472,4544;Inherit;False;655;SSaturation;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;598;-4432,-1280;Inherit;False;texture_DEBUG_LERP;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;146;-2416,-896;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;10,10;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;621;-4992,-1152;Inherit;False;Property;_gradient_DEBUG_SLOT_1;gradient_DEBUG_SLOT_1;51;2;[IntRange];[Enum];Create;True;0;7;Option1;0;Option2;1;Option3;2;Option4;3;Option5;4;Option6;5;grayscale;6;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;433;-2432,1664;Inherit;False;432;cameraDepthFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;295;-2992,768;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;2;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-3456,3904;Inherit;False;598;texture_DEBUG_LERP;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCPixelate;111;-2848,-896;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;4;False;2;FLOAT;4;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CameraDepthFade;415;-3152,1152;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;590;-4992,-1408;Inherit;False;Property;_texture_DEBUG_SLOT_1;texture_DEBUG_SLOT_1;39;2;[IntRange];[Enum];Create;True;0;5;Value;0;Albedo;1;Roughness;2;Metalic;3;Normal;4;0;False;0;False;0;0;0;4;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;595;-3456,3776;Inherit;False;594;texture_DEBUG_SLOT_1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;743;-4352,-4736;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;594;-4444.791,-1408;Inherit;False;texture_DEBUG_SLOT_1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-4992,-5440;Inherit;False;Property;_emsissionIntensity;emsissionIntensity;7;0;Create;True;0;0;0;False;0;False;0;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;726;-3472,4224;Inherit;False;725;gradienMultiplyByValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;626;-4432,-1024;Inherit;False;gradient_DEBUG_LERP;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1094;-5616,3456;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;970;-6912,4608;Inherit;False;Property;_valueRangeLower;valueRangeLower;64;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;166;-2608,-384;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;2;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;645;-4400,-960;Inherit;False;gradientInvert;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;435;-4400,-2368;Inherit;False;edgeRange;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;971;-6912,4672;Inherit;False;Property;_valueRangeHigher;valueRangeHigher;65;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;905;-6912,4544;Inherit;False;Property;_valueRange;valueRange;63;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DdxOpNode;399;-3184,1408;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NegateNode;303;-2800,768;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DdyOpNode;398;-3184,1472;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;753;-4992,-5184;Inherit;False;Property;_smoothnessHardness;smoothnessHardness;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;92;-4064,0;Inherit;False;UV_checkboardCustom;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;651;-4992,-768;Inherit;False;Property;_SSaturation;[S] Saturation;57;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;481;-384,-1472;Inherit;False;480;TEXTURE;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.BlendOpsNode;715;-5856,2304;Inherit;True;Overlay;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;325;-3200,896;Inherit;False;324;lightHeight;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;335;-4992,-1920;Inherit;False;Property;_noiseScale;noiseScale;42;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;474;-4992,-2240;Inherit;False;Property;_visualizeCameraDepth;visualizeCameraDepth;33;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;764;-3088,4096;Inherit;False;MultiSwitch_Gradient;-1;;146;187081bbc54d01a47b36d8a6dbc69342;0;9;40;FLOAT;0;False;72;INT;0;False;94;INT;0;False;8;INT;0;False;28;INT;0;False;30;FLOAT;0;False;78;FLOAT;0;False;79;FLOAT;0;False;80;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;177;-2528,-128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1140;-1504,-1280;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;754;-4720,-5120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;442;-3456,1216;Inherit;False;439;cameraDepthOffset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1039;-6912,4224;Inherit;False;906;valueRange;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;656;-4400,-704;Inherit;False;VValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;434;-4400,-2432;Inherit;False;edgeHardness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;658;-3472,4480;Inherit;False;654;HHue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;436;-2432,1536;Inherit;False;434;edgeHardness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1042;-6912,4096;Inherit;False;1044;noiseEmissionValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;655;-4400,-768;Inherit;False;SSaturation;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1026;-6912,4160;Inherit;False;808;valueSelect;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;407;-2032,1536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;751;-4624,-5248;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;216;-1648,-384;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;1024;-6320,4096;Inherit;True;valueSelectExtended;-1;;147;41cb360c9f553c444a89d9eb02252418;0;5;43;FLOAT;0;False;45;FLOAT;0.5;False;46;FLOAT;1;False;47;FLOAT;0.25;False;48;FLOAT;0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;186;-1920,128;Inherit;False;Property;_distanceBackgroundColor;distanceBackgroundColor;25;0;Create;True;0;0;0;False;0;False;0.25,0.25,0.25,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;182;-1920,-128;Inherit;False;Property;_distanceBorderColor;distanceBorderColor;24;1;[HDR];Create;True;0;0;0;False;0;False;0,1,0.8499999,0;4,0.627451,0,0.9019608;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;294;-2816,-320;Inherit;False;293;distancePosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;103;-3456,-1792;Inherit;False;102;UV_checkboard1X1;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;298;-2544,768;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-4992,-3328;Inherit;False;Property;_checkboardLerp;checkboardLerp;16;0;Create;True;0;0;0;False;0;False;1;0.95;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;171;-2192,-256;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;808;-6448,4480;Inherit;False;valueSelect;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;22;-3200,-1536;Inherit;True;Checkerboard;-1;;148;43dad715d66e03a4c8ad5f9564018081;0;4;1;FLOAT2;0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;608;-5552,2368;Inherit;False;textureMetalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;699;-7136,2112;Inherit;False;Constant;_Float11;Float 11;56;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;306;-2432,768;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1031;-6912,4288;Inherit;False;972;valueRangeLower;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;625;-4448,-1088;Inherit;False;gradient_DEBUG_SLOT_2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;162;-2816,-384;Inherit;False;197;UV_WORLD_STATIC;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;102;-4032,-512;Inherit;False;UV_checkboard1X1;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;624;-4448,-1152;Inherit;False;gradient_DEBUG_SLOT_1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;654;-4400,-832;Inherit;False;HHue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;324;-4400,-2560;Inherit;False;lightHeight;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;437;-2432,1600;Inherit;False;435;edgeRange;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;126;-3104,-896;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;156;-2832,-768;Inherit;False;Constant;_pixelateGrid;pixelateGrid;10;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;172;-2816,-256;Inherit;False;Property;_distanceHardness;distanceHardness;20;0;Create;True;0;0;0;False;0;False;0;0.95;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;88;-4992,192;Inherit;False;87;offsetY_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;662;-7168,2496;Inherit;False;576;noiseSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;269;1408,-1664;Inherit;False;268;METALIC;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;9;-384,-1792;Inherit;False;106;CHECKBOARD;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;430;-1072,1408;Inherit;False;EDGE_DETECT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;60;-384,-1088;Inherit;False;59;emsissionIntensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;479;-1536,1600;Inherit;False;478;visualizeCameraDepth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;218;-1648,128;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;179;-1408,-384;Inherit;False;3;0;COLOR;1,1,1,0;False;1;COLOR;1,1,1,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;-2176,704;Inherit;False;331;lightRange;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;480;-1072,3456;Inherit;False;TEXTURE;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-6912,4736;Inherit;False;Property;_textureEmissionIntensity;textureEmissionIntensity;61;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;589;-6016,-512;Inherit;False;Property;_Color5;Color 5;38;1;[Header];Create;True;2;TEXTURE;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;725;-4448,-896;Inherit;False;gradienMultiplyByValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;12;128,-1792;Inherit;False;DEBUG;-1;;142;7116090f4854264418707bae37ebb9e2;0;9;9;FLOAT4;0,0,0,0;False;10;FLOAT4;0,0,0,0;False;11;FLOAT4;0,0,0,0;False;12;FLOAT4;0,0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;8;INT;0;False;28;INT;0;False;30;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;19;-4400,-5696;Inherit;False;DEBUG_SLOT_2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-4400,-5760;Inherit;False;DEBUG_SLOT_1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;59;-4416,-5440;Inherit;False;emsissionIntensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;207;-6016,-1536;Inherit;False;Property;_distance;;17;1;[Header];Create;False;2;DISTANCE RANGE;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0.2196075,0.2196075,0.2196075,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;105;-3456,-1216;Inherit;False;32;checkboardCustom;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;208;-6016,-1280;Inherit;False;Property;_globalProperties;;3;1;[Header];Create;False;2;GLOBAL PROPERTIES;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0.2196073,0.2196073,0.2196073,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;97;-4448,-384;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;267;-384,-1600;Inherit;False;281;CUSTOM_LIGHT;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;144;-2048,-896;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;10;False;2;COLOR;0,0,0,0;False;3;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-1536,1536;Inherit;False;432;cameraDepthFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;21;-4400,-5632;Inherit;False;DEBUG_LERP;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;10;128,-1536;Inherit;False;18;DEBUG_SLOT_1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;-1104,-896;Inherit;False;UV_VISUALISATION;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1136;-1792,-1168;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NormalVertexDataNode;274;-4992,-4624;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;1043;-5856,4096;Inherit;False;textueEmmissionMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;161;-1120,-384;Inherit;False;RADIUS_VISUALISATION;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;281;-1088,512;Inherit;False;CUSTOM_LIGHT;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;618;-3456,3648;Inherit;False;608;textureMetalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;283;-6016,-1024;Inherit;False;Property;_lightTest_01;;26;1;[Header];Create;False;2;LIGHT TEST_01;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0.2196079,0.2196079,0.2196079,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;367;-9951.665,2638.404;Inherit;False;28;UV_WORLD_MAPPING;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;217;-1648,-128;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;329;-4400,-2688;Inherit;False;lightHardness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;331;-4400,-2624;Inherit;False;lightRange;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;108;-4400,-3328;Inherit;False;checkboardLerp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;602;-4448,-1344;Inherit;False;texture_DEBUG_SLOT_2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;154;-2272,-896;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;134;-4992,256;Inherit;False;130;offsetCentering;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;439;-4432,-2112;Inherit;False;cameraDepthOffset;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;603;-3456,3840;Inherit;False;602;texture_DEBUG_SLOT_2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;475;-1280,1408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;183;-1280,-256;Inherit;False;3;0;COLOR;1,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1055;-6912,4800;Inherit;False;Property;_textureEmissionOn;textureEmissionOn;60;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;334;-4992,-6016;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;381;-384,-1536;Inherit;False;430;EDGE_DETECT;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;265;496,-1664;Inherit;False;264;_HEADER;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1048;-64,-768;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1059;-384,-1024;Inherit;False;1054;textireEmission;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-4992,-5760;Inherit;False;Property;_DEBUG_SLOT_1;DEBUG_SLOT_1;0;1;[Enum];Create;True;3;O;DEBUG;O;6;Checkboard;0;UV_World;1;DistanceRange;2;CustomLight;3;EdgeDetect;4;Texture;5;0;False;0;False;4.461836;2;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;7;128,-1408;Inherit;False;21;DEBUG_LERP;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;549;-8951.56,2649.018;Inherit;True;Polar Coordinates;-1;;141;7dab8e02884cf104ebefaa2e788e4162;0;4;1;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1052;-384,-448;Inherit;False;1051;textureEmissionIntensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-4992,-5504;Inherit;False;Property;_metalic;metalic;6;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.HDEmissionNode;1049;160,-768;Inherit;False;EV100;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1045;-384,-704;Inherit;False;1043;textueEmmissionMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1056;-6464,4800;Inherit;False;textureEmissionOn;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;138;-384,-1728;Inherit;False;137;UV_VISUALISATION;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;8;128,-1472;Inherit;False;19;DEBUG_SLOT_2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;20;-4992,-5632;Inherit;False;Property;_DEBUG_LERP;DEBUG_LERP;2;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;263;544,-1792;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;760;-4992,-4928;Inherit;False;759;textureSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;268;-4400,-5504;Inherit;False;METALIC;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;197;-4416,-4224;Inherit;False;UV_WORLD_STATIC;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;350;-4448,-6016;Inherit;False;UV_textureCoordinates;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1116;-6000,3616;Inherit;False;2;2;0;FLOAT;2;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;264;-5424,-1792;Inherit;False;_HEADER;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HDEmissionNode;57;-96,-1152;Inherit;False;Luminance;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;14;720,-1792;Inherit;False;DEBUG;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;188;-4992,-4864;Inherit;False;Property;_smoothness;smoothness;4;0;Create;True;3;O;GLOBAL PROPERTIES;O;0;0;False;0;False;1;0.306;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1047;-384,-640;Inherit;False;Property;_emissionColor;emissionColor;59;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1057;-384,-768;Inherit;False;1056;textureEmissionOn;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;757;-4352,-4992;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1060;272,-1152;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;270;-4144,-4992;Inherit;False;SMOOTHNESS;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;61;720,-1152;Inherit;False;EMISSION;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Compare;1058;512,-768;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;758;-4992,-4992;Inherit;False;Property;_textureSmoothnessOn;textureSmoothnessOn;48;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;192;-4992,-3840;Inherit;False;InstancedProperty;_UV_ratioX;UV_ratioX;8;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;588;-5776,2880;Inherit;False;586;noiseRange;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;296;-3200,768;Inherit;False;197;UV_WORLD_STATIC;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1095;-5912.007,3792.181;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;196;-4784,-4224;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;605;-3456,3520;Inherit;False;606;textureAlbedo;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;96;-4720,-384;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1054;720,-768;Inherit;False;textireEmission;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1051;-6496,4736;Inherit;False;textureEmissionIntensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-4992,-2560;Inherit;False;Property;_lightHeight;lightHeight;31;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;91;-4992,0;Inherit;False;28;UV_WORLD_MAPPING;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;404;-1936,1408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;130;-4400,-3200;Inherit;False;offsetCentering;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;89;-4992,128;Inherit;False;86;offsetX_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;125;-3456,-832;Inherit;False;85;scale_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;83;-2960,-1280;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;45;-4720,176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;478;-4448,-2240;Inherit;False;visualizeCameraDepth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;417;-4992,-2112;Inherit;False;Property;_cameraDepthOffset;cameraDepthOffset;35;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;650;-4992,-832;Inherit;False;Property;_HHue;[H] Hue;56;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;287;-5616,-1792;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;644;-4992,-960;Inherit;False;Property;_gradientInvert;gradientInvert;54;1;[Toggle];Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;565;-4992,-1600;Inherit;False;Property;_noiseNormalStrenght;noiseNormalStrenght;47;0;Create;True;0;0;0;False;0;False;1;1000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;416;-4992,-2176;Inherit;False;Property;_cameraDepthLenght;cameraDepthLenght;34;0;Create;True;0;0;0;False;0;False;100;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;606;-1072,4096;Inherit;False;textureAlbedo;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;279;1408,-1728;Inherit;False;276;NORMAL;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;406;-4992,-2368;Inherit;False;Property;_edgeRange;edgeRange;37;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;752;-4992,-5120;Inherit;False;Property;_smoothnessRange;smoothnessRange;50;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;23;-4384,0;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;652;-4992,-704;Inherit;False;Property;_VValue;[V] Value;58;0;Create;True;0;0;0;False;0;False;0;0;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;402;-3456,1408;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SmoothstepOpNode;175;-2192,-128;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;123;-3456,-768;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;592;-5552,2560;Inherit;False;textureValue;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1119;-6384,3632;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;90;-4992,64;Inherit;False;85;scale_Checkboard;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1121;-6144,3456;Inherit;False;Property;_hexScale;hexScale;66;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1120;-6400,3456;Inherit;False;Property;_hexDistortion;hexDistortion;68;0;Create;True;0;0;0;False;0;False;50;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;32;-1104,-1536;Inherit;False;checkboardCustom;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;759;-4176,-5248;Inherit;False;textureSmoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;578;-5824,2560;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1.42;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;213;-4592,-2944;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;2,2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;488;-8780.787,3054.581;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;438;-4432,-2176;Inherit;False;cameraDepthLenght;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;550;-8936.053,2867.565;Inherit;False;372;noiseAnlge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;617;-3456,3584;Inherit;False;759;textureSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;227;224,0;Inherit;False;Constant;_Color3;Color 3;26;0;Create;True;0;0;0;False;0;False;0,0.7974176,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;622;-4992,-1088;Inherit;False;Property;_gradient_DEBUG_SLOT_2;gradient_DEBUG_SLOT_2;52;2;[IntRange];[Enum];Create;True;0;7;Option1;0;Option2;1;Option3;2;Option4;3;Option5;4;Option6;5;grayscale;6;0;False;0;False;1;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;-4592,-384;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;133;-4992,-192;Inherit;False;130;offsetCentering;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;361;-8956.787,3054.581;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;660;-7168,2176;Inherit;False;350;UV_textureCoordinates;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;293;-4416,-2944;Inherit;False;distancePosition;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;39;-4704,48;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1133;-5536,3712;Inherit;False;592;textureValue;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;1134;-6128,3520;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1114;-6128,3632;Inherit;False;2;2;0;FLOAT;1.03;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;109;-3456,-1152;Inherit;False;108;checkboardLerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;160;-3120,-768;Inherit;False;130;offsetCentering;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;278;-4992,-4736;Inherit;False;Property;_normal_ON;normal_ON;5;1;[IntRange];Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;330;-2176,640;Inherit;False;329;lightHardness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;288;-1936,512;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ObjSpaceLightDirHlpNode;238;-3456,768;Inherit;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.FunctionNode;596;-3072,3456;Inherit;False;DEBUG;-1;;143;7116090f4854264418707bae37ebb9e2;0;9;9;FLOAT4;0,0,0,0;False;10;FLOAT4;0,0,0,0;False;11;FLOAT4;0,0,0,0;False;12;FLOAT4;0,0,0,0;False;13;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;8;INT;0;False;28;INT;0;False;30;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;577;-9951.665,2830.404;Inherit;False;576;noiseSmoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;15;1408,-1792;Inherit;False;14;DEBUG;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;284;-5744,-1792;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;62;-384,-1152;Inherit;False;14;DEBUG;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;228;224,256;Inherit;False;Constant;_Color4;Color 4;26;0;Create;True;0;0;0;False;0;False;0.02863002,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;573;-9951.665,2574.404;Inherit;False;350;UV_textureCoordinates;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;505;-8284.787,3310.581;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;485;-9951.665,2702.404;Inherit;False;372;noiseAnlge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-4992,-5696;Inherit;False;Property;_DEBUG_SLOT_2;DEBUG_SLOT_2;1;1;[Enum];Create;True;0;6;Checkboard;0;UV_World;1;DistanceRange;2;CustomLight;3;EdgeDetect;4;Texture;5;0;False;0;False;0;3;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;498;-9004.787,3310.581;Inherit;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;104;-3456,-1280;Inherit;False;81;checkboard1x1;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TFHCIf;225;672,-128;Inherit;False;6;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;551;-8936.053,2931.565;Inherit;False;370;noiseScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;117;-3456,-896;Inherit;False;28;UV_WORLD_MAPPING;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.VoronoiNode;552;-8508.951,2704.765;Inherit;True;0;0;5;0;1;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.OneMinusNode;499;-8748.787,3310.581;Inherit;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;503;-8588.787,3310.581;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;1061;-5995.259,4113.67;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SqrtOpNode;403;-2544,1408;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;226;224,512;Inherit;False;Constant;_Color2;Color 2;26;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;230;224,-128;Inherit;False;Property;_ifEqual;ifEqual;27;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;495;-8447.788,3310.581;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ColorNode;204;-6016,-1792;Inherit;False;Property;_checkboard;;10;1;[Header];Create;False;2;CHECKBOARD;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0.2196073,0.2196073,0.2196073,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;271;1408,-1536;Inherit;False;270;SMOOTHNESS;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;443;-6016,-768;Inherit;False;Property;_EDGEDETECT;;32;1;[Header];Create;False;2;EDGE DETECT;.;0;0;False;0;False;0.2196079,0.2196079,0.2196079,0;0.2196079,0.2196079,0.2196079,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;342;-9455.665,2638.404;Inherit;True;0;1;5;0;1;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;165;-384,-1664;Inherit;False;161;RADIUS_VISUALISATION;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;80;-3200,-1792;Inherit;True;Checkerboard;-1;;144;43dad715d66e03a4c8ad5f9564018081;0;4;1;FLOAT2;0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT2;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;1137;-2048,-1152;Inherit;False;Property;_checkboard_hint;checkboard_hint;11;0;Create;True;0;0;0;False;0;False;0.6550803,1,0.495283,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;106;-1072,-1280;Inherit;False;CHECKBOARD;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;-4144,-4736;Inherit;False;NORMAL;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;229;224,-64;Inherit;False;Property;_threshold;threshold;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;487;-9951.665,2766.404;Inherit;False;370;noiseScale;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;63;1408,-1600;Inherit;False;61;EMISSION;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;81;-1072,-1792;Inherit;False;checkboard1x1;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;50;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;54;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;False;-1;255;False;-1;255;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;3;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;1135;1984,-1682;Float;False;False;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ScenePickingPass;0;11;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-30;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;52;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;56;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-28;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;48;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;47;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;55;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;51;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;53;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;False;True;True;True;True;True;0;True;-44;False;False;False;False;False;False;False;True;0;True;-23;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;49;320,-128;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;46;1984,-1792;Float;False;True;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;2;terrainPrototypeDEBUG_Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;7;d3d11;metal;vulkan;xboxone;xboxseries;playstation;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;False;False;False;False;False;True;True;0;True;-13;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;True;0;True;-14;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;42;Surface Type;0;0;  Rendering Pass;1;0;  Refraction Model;0;0;    Blending Mode;0;0;    Blend Preserves Specular;1;0;  Receive Fog;1;0;  Back Then Front Rendering;0;0;  Transparent Depth Prepass;0;0;  Transparent Depth Postpass;0;0;  Transparent Writes Motion Vector;0;0;  Distortion;0;0;    Distortion Mode;0;0;    Distortion Depth Test;1;0;  ZWrite;0;0;  Z Test;4;0;Double-Sided;0;0;Alpha Clipping;0;0;  Use Shadow Threshold;0;0;Material Type,InvertActionOnDeselection;0;0;  Energy Conserving Specular;1;0;  Transmission;1;0;Receive Decals;1;0;Receives SSR;1;0;Receive SSR Transparent;0;0;Motion Vectors;1;0;  Add Precomputed Velocity;0;0;Specular AA;0;0;Specular Occlusion Mode;1;0;Override Baked GI;0;0;Depth Offset;0;0;DOTS Instancing;0;0;LOD CrossFade;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,-1;0;  Type;0;0;  Tess;16,False,-1;0;  Min;10,False,-1;0;  Max;25,False,-1;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Vertex Position;1;0;0;12;True;True;True;True;True;True;False;False;False;False;True;True;False;;False;0
Node;AmplifyShaderEditor.CommentaryNode;471;-7335.016,-1644.182;Inherit;False;416.4006;413.3244;UV_WORLD_VISUALISATION;0;;0.7058824,0.4666667,0,1;0;0
WireConnection;582;0;579;0
WireConnection;582;1;580;0
WireConnection;1065;0;661;0
WireConnection;397;0;398;0
WireConnection;397;1;398;0
WireConnection;86;0;43;0
WireConnection;664;0;672;0
WireConnection;664;1;661;0
WireConnection;664;2;663;0
WireConnection;664;3;662;0
WireConnection;698;0;672;0
WireConnection;28;0;189;0
WireConnection;716;0;661;0
WireConnection;696;0;698;0
WireConnection;696;1;716;0
WireConnection;696;2;720;0
WireConnection;1066;0;663;0
WireConnection;1066;1;1122;0
WireConnection;174;0;172;0
WireConnection;174;1;173;0
WireConnection;714;0;664;0
WireConnection;714;1;677;0
WireConnection;131;0;132;0
WireConnection;584;0;582;0
WireConnection;85;0;26;0
WireConnection;973;0;971;0
WireConnection;972;0;970;0
WireConnection;906;0;905;0
WireConnection;1044;0;1123;0
WireConnection;425;0;437;0
WireConnection;425;1;433;0
WireConnection;400;0;396;0
WireConnection;400;1;397;0
WireConnection;400;2;396;0
WireConnection;400;4;397;0
WireConnection;114;0;111;0
WireConnection;571;0;565;0
WireConnection;1064;0;672;0
WireConnection;211;0;210;0
WireConnection;211;1;212;0
WireConnection;87;0;44;0
WireConnection;671;0;562;0
WireConnection;680;0;663;0
WireConnection;372;0;371;0
WireConnection;316;0;299;0
WireConnection;34;0;39;0
WireConnection;576;0;671;0
WireConnection;1104;3;1116;0
WireConnection;672;0;665;0
WireConnection;672;1;699;0
WireConnection;586;0;580;0
WireConnection;291;0;290;0
WireConnection;291;1;289;0
WireConnection;677;0;681;0
WireConnection;677;1;661;0
WireConnection;677;2;680;0
WireConnection;677;3;662;0
WireConnection;163;0;166;0
WireConnection;124;0;123;0
WireConnection;762;0;751;0
WireConnection;1063;0;1064;0
WireConnection;1063;1;1065;0
WireConnection;1063;2;1066;0
WireConnection;668;1;335;0
WireConnection;24;0;25;0
WireConnection;607;0;715;0
WireConnection;720;0;663;0
WireConnection;681;0;672;0
WireConnection;370;0;668;0
WireConnection;194;0;192;0
WireConnection;194;1;193;0
WireConnection;254;0;259;0
WireConnection;254;1;306;0
WireConnection;189;0;24;0
WireConnection;189;1;194;0
WireConnection;42;0;45;0
WireConnection;42;1;134;0
WireConnection;396;0;399;0
WireConnection;396;1;399;0
WireConnection;432;0;415;0
WireConnection;302;0;303;0
WireConnection;1130;0;1133;0
WireConnection;93;0;94;0
WireConnection;93;2;97;0
WireConnection;1123;1;1094;0
WireConnection;1123;2;1130;0
WireConnection;598;0;597;0
WireConnection;146;0;114;0
WireConnection;295;0;296;0
WireConnection;295;2;297;0
WireConnection;111;0;126;0
WireConnection;111;1;156;0
WireConnection;111;2;156;0
WireConnection;415;0;441;0
WireConnection;415;1;442;0
WireConnection;743;0;278;0
WireConnection;743;2;274;0
WireConnection;594;0;590;0
WireConnection;626;0;623;0
WireConnection;1094;0;1104;0
WireConnection;166;0;162;0
WireConnection;166;2;294;0
WireConnection;645;0;644;0
WireConnection;435;0;406;0
WireConnection;399;0;402;0
WireConnection;303;0;295;0
WireConnection;398;0;402;0
WireConnection;92;0;23;0
WireConnection;715;0;714;0
WireConnection;715;1;696;0
WireConnection;764;40;620;0
WireConnection;764;72;646;0
WireConnection;764;94;726;0
WireConnection;764;8;628;0
WireConnection;764;28;629;0
WireConnection;764;30;627;0
WireConnection;764;78;658;0
WireConnection;764;79;657;0
WireConnection;764;80;659;0
WireConnection;177;0;173;0
WireConnection;177;1;176;0
WireConnection;1140;0;83;0
WireConnection;1140;1;1136;0
WireConnection;1140;2;1137;4
WireConnection;754;0;753;0
WireConnection;754;1;752;0
WireConnection;656;0;652;0
WireConnection;434;0;405;0
WireConnection;655;0;651;0
WireConnection;407;0;436;0
WireConnection;407;1;425;0
WireConnection;751;0;755;0
WireConnection;751;1;754;0
WireConnection;751;2;752;0
WireConnection;216;0;185;0
WireConnection;216;1;185;4
WireConnection;1024;43;1042;0
WireConnection;1024;45;1026;0
WireConnection;1024;46;1039;0
WireConnection;1024;47;1031;0
WireConnection;1024;48;1030;0
WireConnection;298;0;302;0
WireConnection;298;1;325;0
WireConnection;298;2;302;1
WireConnection;171;0;163;0
WireConnection;171;1;174;0
WireConnection;171;2;173;0
WireConnection;808;0;783;0
WireConnection;22;1;31;0
WireConnection;608;0;715;0
WireConnection;306;0;298;0
WireConnection;625;0;622;0
WireConnection;102;0;93;0
WireConnection;624;0;621;0
WireConnection;654;0;650;0
WireConnection;324;0;316;0
WireConnection;126;0;117;0
WireConnection;126;1;124;0
WireConnection;126;2;160;0
WireConnection;430;0;475;0
WireConnection;218;0;186;0
WireConnection;218;1;186;4
WireConnection;179;0;216;0
WireConnection;179;1;217;0
WireConnection;179;2;171;0
WireConnection;480;0;596;0
WireConnection;725;0;724;0
WireConnection;12;9;9;0
WireConnection;12;10;138;0
WireConnection;12;11;165;0
WireConnection;12;12;267;0
WireConnection;12;13;381;0
WireConnection;12;14;481;0
WireConnection;12;8;10;0
WireConnection;12;28;8;0
WireConnection;12;30;7;0
WireConnection;19;0;17;0
WireConnection;18;0;16;0
WireConnection;59;0;58;0
WireConnection;97;0;135;0
WireConnection;97;1;133;0
WireConnection;144;0;154;0
WireConnection;144;2;148;0
WireConnection;144;3;114;0
WireConnection;21;0;20;0
WireConnection;137;0;144;0
WireConnection;1136;0;83;0
WireConnection;1136;1;1137;0
WireConnection;1043;0;1061;0
WireConnection;161;0;183;0
WireConnection;281;0;288;0
WireConnection;217;0;182;0
WireConnection;217;1;182;4
WireConnection;329;0;291;0
WireConnection;331;0;289;0
WireConnection;108;0;107;0
WireConnection;602;0;615;0
WireConnection;154;0;146;0
WireConnection;439;0;417;0
WireConnection;475;0;404;0
WireConnection;475;1;477;0
WireConnection;475;2;479;0
WireConnection;183;0;179;0
WireConnection;183;1;218;0
WireConnection;183;2;175;0
WireConnection;1048;0;1045;0
WireConnection;1048;1;1047;0
WireConnection;549;1;367;0
WireConnection;549;2;342;1
WireConnection;1049;0;1048;0
WireConnection;1049;1;1052;0
WireConnection;1056;0;1055;0
WireConnection;263;0;12;0
WireConnection;263;1;265;0
WireConnection;268;0;187;0
WireConnection;197;0;196;0
WireConnection;350;0;334;0
WireConnection;1116;0;1134;0
WireConnection;1116;1;1114;0
WireConnection;264;0;287;0
WireConnection;57;0;62;0
WireConnection;57;1;60;0
WireConnection;14;0;263;0
WireConnection;757;0;758;0
WireConnection;757;2;760;0
WireConnection;757;3;188;0
WireConnection;1060;0;57;0
WireConnection;1060;1;1059;0
WireConnection;270;0;757;0
WireConnection;61;0;1060;0
WireConnection;1058;0;1057;0
WireConnection;1058;2;1049;0
WireConnection;196;0;195;0
WireConnection;96;0;100;0
WireConnection;96;1;101;0
WireConnection;1054;0;1058;0
WireConnection;1051;0;1050;0
WireConnection;404;0;403;0
WireConnection;404;1;407;0
WireConnection;404;2;425;0
WireConnection;130;0;131;0
WireConnection;83;0;104;0
WireConnection;83;1;105;0
WireConnection;83;2;109;0
WireConnection;45;0;89;0
WireConnection;45;1;88;0
WireConnection;478;0;474;0
WireConnection;287;0;284;0
WireConnection;606;0;764;0
WireConnection;23;0;91;0
WireConnection;23;1;34;0
WireConnection;23;2;42;0
WireConnection;175;0;163;0
WireConnection;175;1;177;0
WireConnection;175;2;177;0
WireConnection;123;1;125;0
WireConnection;592;0;578;0
WireConnection;1119;0;1063;0
WireConnection;32;0;22;0
WireConnection;759;0;762;0
WireConnection;578;0;715;0
WireConnection;578;1;587;0
WireConnection;578;2;588;0
WireConnection;213;0;211;0
WireConnection;488;0;361;1
WireConnection;438;0;416;0
WireConnection;135;0;96;0
WireConnection;135;1;136;0
WireConnection;361;0;342;1
WireConnection;293;0;213;0
WireConnection;39;1;90;0
WireConnection;1134;0;1121;0
WireConnection;1114;0;1120;0
WireConnection;1114;1;1119;0
WireConnection;288;0;254;0
WireConnection;288;1;330;0
WireConnection;288;2;332;0
WireConnection;596;9;604;0
WireConnection;596;10;605;0
WireConnection;596;11;617;0
WireConnection;596;12;618;0
WireConnection;596;8;595;0
WireConnection;596;28;603;0
WireConnection;596;30;599;0
WireConnection;284;0;204;1
WireConnection;284;1;207;1
WireConnection;284;2;208;1
WireConnection;284;3;283;1
WireConnection;284;4;443;1
WireConnection;284;5;589;1
WireConnection;505;0;495;0
WireConnection;505;1;495;1
WireConnection;498;0;342;2
WireConnection;225;1;230;0
WireConnection;225;2;227;0
WireConnection;225;3;228;0
WireConnection;225;4;226;0
WireConnection;225;5;229;0
WireConnection;552;0;549;0
WireConnection;552;1;550;0
WireConnection;552;2;551;0
WireConnection;499;0;498;0
WireConnection;503;0;499;0
WireConnection;1061;0;1024;0
WireConnection;403;0;400;0
WireConnection;495;0;503;0
WireConnection;342;0;573;0
WireConnection;342;1;485;0
WireConnection;342;2;487;0
WireConnection;342;3;577;0
WireConnection;80;1;103;0
WireConnection;106;0;1140;0
WireConnection;276;0;743;0
WireConnection;81;0;80;0
WireConnection;46;0;15;0
WireConnection;46;4;269;0
WireConnection;46;6;63;0
WireConnection;46;7;271;0
ASEEND*/
//CHKSM=63B183BF2B1742A5FB5D356782B905F22B28CFA5