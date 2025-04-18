#ifndef VOLUMETRIC_FOG_2_RAYMARCH
#define VOLUMETRIC_FOG_2_RAYMARCH 

sampler2D _MainTex;
sampler3D _DetailTex;
float jitter;
float _NoiseScale;
half4 _Color;

float3 _SunDir;
half _DeepObscurance;
half _LightDiffusionIntensity, _LightDiffusionPower;
float3 _WindDirection, _DetailWindDirection;
half4 _LightColor;
half  _Density;

half3 _ShadowData;
#define SHADOW_INTENSITY _ShadowData.x
#define SHADOW_CANCELLATION _ShadowData.y
#define SHADOW_MAX_DISTANCE _ShadowData.z

float3 _MaxDistanceData;
#define FOG_MAX_LENGTH _MaxDistanceData.x
#define FOG_MAX_LENGTH_FALLOFF_PRECOMPUTED _MaxDistanceData.y
#define FOG_MAX_LENGTH_FALLOFF _MaxDistanceData.z

float4 _BoundsBorder;
#define BORDER_SIZE_SPHERE _BoundsBorder.x
#define BORDER_START_SPHERE _BoundsBorder.y
#define BORDER_SIZE_BOX _BoundsBorder.xz
#define BORDER_START_BOX _BoundsBorder.yw

float3 _BoundsData;
#define BOUNDS_VERTICAL_OFFSET _BoundsData.x
#define BOUNDS_BOTTOM _BoundsData.y
#define BOUNDS_SIZE_Y _BoundsData.z


half4 _DetailData; // x = strength, y = offset, z = scale, w = importance
half4 _DetailColor;
#define DETAIL_STRENGTH _DetailData.x
#define DETAIL_OFFSET _DetailData.y
#define DETAIL_SCALE _DetailData.z
#define USE_BASE_NOISE _DetailData.w

float4 _RayMarchSettings;
  
#define FOG_STEPPING _RayMarchSettings.x
#define DITHERING _RayMarchSettings.y
#define JITTERING _RayMarchSettings.z
#define MIN_STEPPING _RayMarchSettings.w

float loop_t;

#include "PointLights.cginc"
#include "FogVoids.cginc"
#include "FogOfWar.cginc"
#include "FogDistance.cginc"
#include "Surface.cginc"

TEXTURE2D(_BlueNoise);
SAMPLER(sampler_BlueNoise_PointRepeat);
float4 _BlueNoise_TexelSize;

float3 _VFRTSize;
float2 uvScreen;

void SetJitter(float4 scrPos) {

    float2 screenSize = lerp(_ScreenParams.xy, _VFRTSize.xy, _VFRTSize.z);
    uvScreen = scrPos.xy / scrPos.w;
    float2 uv = uvScreen * screenSize;

    #if defined(FOG_BLUE_NOISE)
        float2 noiseUV = uv * _BlueNoise_TexelSize.xy;
        jitter =  SAMPLE_TEXTURE2D(_BlueNoise, sampler_BlueNoise_PointRepeat, noiseUV).r;
    #else
        //Jitter = frac(dot(float2(2.4084507, 3.2535211), (scrPos.xy / scrPos.w) * _ScreenParams.xy));
        const float3 magic = float3( 0.06711056, 0.00583715, 52.9829189 );
        jitter = frac( magic.z * frac( dot( uv, magic.xy ) ) );
    #endif
}


inline float3 ProjectOnPlane(float3 v, float3 planeNormal) {
    // assume plane normal has a modulus of 1
    float dt = dot(v, planeNormal);
	return v - planeNormal * dt;
}

inline float3 GetRayStart(float3 wpos) {
    float3 cameraPosition = GetCameraPositionWS();
    #if defined(ORTHO_SUPPORT)
	    float3 cameraForward = UNITY_MATRIX_V[2].xyz;
	    float3 rayStart = ProjectOnPlane(wpos - cameraPosition, cameraForward) + cameraPosition;
        return lerp(cameraPosition, rayStart, unity_OrthoParams.w);
    #else
        return cameraPosition;
    #endif
}

inline half Brightness(half3 color) {
    return max(color.r, max(color.g, color.b));
}


half4 SampleDensity(float3 wpos) {

    wpos.y -= BOUNDS_VERTICAL_OFFSET;
    float3 boundsCenter = _BoundsCenter;
    float3 boundsExtents = _BoundsExtents;

    SurfaceApply(boundsCenter, boundsExtents);

#if VF2_DETAIL_NOISE
    #if !defined(USE_WORLD_SPACE_NOISE)
        wpos.xyz -= boundsCenter;
    #endif
    half detail = tex3Dlod(_DetailTex, float4(wpos * DETAIL_SCALE - _DetailWindDirection, 0)).a;
    half4 density = _DetailColor;
    if (USE_BASE_NOISE) {
        #if defined(USE_WORLD_SPACE_NOISE)
            wpos.y -= boundsCenter.y;
        #endif
        wpos.y /= boundsExtents.y;
        density = tex2Dlod(_MainTex, float4(wpos.xz * _NoiseScale - _WindDirection.xz, 0, 0));
        density.a -= abs(wpos.y);
    }
    density.a += (detail + DETAIL_OFFSET) * DETAIL_STRENGTH;
#else
    #if defined(USE_WORLD_SPACE_NOISE) || VF2_CONSTANT_DENSITY
        wpos.y -= boundsCenter.y;
    #else
        wpos.xyz -= boundsCenter;
    #endif
    wpos.y /= boundsExtents.y;
    #if VF2_CONSTANT_DENSITY
        half4 density = half4(_DetailColor.rgb, 1.0);
    #else
        half4 density = tex2Dlod(_MainTex, float4(wpos.xz * _NoiseScale - _WindDirection.xz, 0, 0));
    #endif
    density.a -= abs(wpos.y);
#endif

    return density;
}


#define dot2(x) dot(x,x)

void AddFog(float3 rayStart, float3 wpos, float rs, half4 baseColor, inout half4 sum) {

   half4 density = SampleDensity(wpos);

   float3 rotatedWPos = wpos;
   #if defined(FOG_ROTATION)
        rotatedWPos = Rotate(rotatedWPos);
   #endif

   #if VF2_VOIDS
        density.a -= ApplyFogVoids(rotatedWPos);
   #endif

   #if defined(FOG_BORDER)
        #if VF2_SHAPE_SPHERE
            float3 delta = wpos - _BoundsCenter;
            float distSqr = dot2(delta);
            float border = 1.0 - saturate( (distSqr - BORDER_START_SPHERE) / BORDER_SIZE_SPHERE );
            density.a *= border * border;
        #else
            float2 dist2 = abs(wpos.xz - _BoundsCenter.xz);
            float2 border2 = saturate( (dist2 - BORDER_START_BOX) / BORDER_SIZE_BOX );
            float border = 1.0 - max(border2.x, border2.y);
            density.a *= border * border;
        #endif
   #endif

   if (density.a > 0) {
        half4 fgCol = baseColor * half4((1.0 - density.a * _DeepObscurance).xxx, density.a);
        #if VF2_RECEIVE_SHADOWS
            if (dot2(wpos - _WorldSpaceCameraPos) < SHADOW_MAX_DISTANCE) {
                half shadowAtten = GetLightAttenuation(rotatedWPos);
                fgCol.rgb *= lerp(1.0, shadowAtten, SHADOW_INTENSITY);
                #if defined(FOG_SHADOW_CANCELLATION)
                    fgCol.a *= lerp(1.0, shadowAtten, SHADOW_CANCELLATION);
                #endif
            }
        #endif
        #if VF2_NATIVE_LIGHTS
            #if USE_FORWARD_PLUS && !defined(FOG_FORWARD_PLUS_IGNORE_CLUSTERING)
                // additional directional lights
                #if defined(FOG_FORWARD_PLUS_ADDITIONAL_DIRECTIONAL_LIGHTS)
                    for (uint lightIndex = 0; lightIndex < URP_FP_DIRECTIONAL_LIGHTS_COUNT; lightIndex++) {
                        Light light = GetAdditionalLight(lightIndex, rotatedWPos, 1.0.xxxx);
                        fgCol.rgb += light.color * (light.distanceAttenuation * light.shadowAttenuation);
                    }
                #endif
                // clustered lights
                {
                    uint lightIndex;
                    ClusterIterator _urp_internal_clusterIterator = ClusterInit(uvScreen, rotatedWPos, 0);
                    [loop] while (ClusterNext(_urp_internal_clusterIterator, lightIndex)) { 
                        lightIndex += URP_FP_DIRECTIONAL_LIGHTS_COUNT;
                        Light light = GetAdditionalLight(lightIndex, rotatedWPos, 1.0.xxxx);
                        fgCol.rgb += light.color * (light.distanceAttenuation * light.shadowAttenuation);
                    }
                }
            #else
                #if USE_FORWARD_PLUS
                    uint additionalLightCount = min(URP_FP_PROBES_BEGIN, 8); // more than 8 lights is too slow for raymarching
                #else
                    uint additionalLightCount = GetAdditionalLightsCount();
                #endif
                for (uint i = 0; i < additionalLightCount; ++i) {
                    #if UNITY_VERSION >= 202030
                        Light light = GetAdditionalLight(i, rotatedWPos, 1.0.xxxx);
                    #else
                        Light light = GetAdditionalLight(i, rotatedWPos);
                    #endif
                    fgCol.rgb += light.color * (light.distanceAttenuation * light.shadowAttenuation);
                }
            #endif
        #endif
        #if VF2_LIGHT_COOKIE
            half3 cookieColor = SampleMainLightCookie(wpos);
            fgCol.rgb *= cookieColor;
            #if defined(V2F_LIGHT_COOKIE_CANCELLATION)
                fgCol.a *= Brightness(cookieColor);
            #endif
        #endif
		#if VF2_DEPTH_GRADIENT
			fgCol *= ApplyDepthGradient(rayStart, wpos);
		#endif
		#if VF2_HEIGHT_GRADIENT
			fgCol *= ApplyHeightGradient(wpos);
		#endif

        fgCol.rgb *= density.rgb * fgCol.aaa;
        #if VF2_FOW
            fgCol *= ApplyFogOfWar(rotatedWPos);
        #endif
		#if VF2_DISTANCE
			fgCol *= ApplyFogDistance(rayStart, wpos);
		#endif

        fgCol *= min(1.0, _Density * rs);
        sum += fgCol * (1.0 - sum.a);
   }
}

half GetDiffusionIntensity(float3 viewDir) {
    return pow(max(dot(viewDir, _SunDir.xyz), 0), _LightDiffusionPower) * _LightDiffusionIntensity;
}

half3 GetDiffusionColor(float3 viewDir) {
    half diffusion = 1.0 + GetDiffusionIntensity(viewDir);
    half3 diffusionColor = _LightColor.rgb * diffusion;
    return diffusionColor;
}

half4 GetFogColor(float3 rayStart, float3 viewDir, float t0, float t1) {

    t0 = min(t0 + jitter * JITTERING, t1);
    float len = t1 - t0;
    float rs = MIN_STEPPING + max(log(len), 0) / FOG_STEPPING;     // stepping ratio with atten detail with distance
    half4 sum = half4(0,0,0,0);
    half3 diffusionColor = GetDiffusionColor(viewDir);
    half4 lightColor = half4(diffusionColor, 1.0);

    float3 wpos = rayStart + viewDir * t0;
    float3 endPos = rayStart + viewDir * t1;
    SurfaceComputeEndPoints(wpos, endPos);

    rs = max(rs, 1.0 / MAX_ITERATIONS);

    viewDir *= rs;

    float energyStep = rs;
    rs /= len + 0.001;
    
    float t = 0;

    // Use this Unroll macro to support WebGL. Increase 50 value if needed.
    #if defined(WEBGL_COMPATIBILITY_MODE)
        UNITY_UNROLLX(50)
    #elif VF2_LIGHT_COOKIE
        UNITY_LOOP
    #endif
    while (t < 1.0) {
        loop_t = t;
        AddFog(rayStart, wpos, energyStep, lightColor, sum);
        if (sum.a > 0.99) {
            sum.a = 1.0;
            return sum;
        }
        t += rs;
        wpos += viewDir;
    }
    AddFog(rayStart, endPos, len * (rs - (t-1.0)), lightColor, sum);

    return sum;
}


#endif // VOLUMETRIC_FOG_2_RAYMARCH