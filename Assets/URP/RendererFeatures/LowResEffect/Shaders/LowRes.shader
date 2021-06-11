Shader "PostEffect/LowRes"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
    }

    SubShader
    {
        Cull Off
        ZWrite Off
        ZTest Always

        Tags
        {
            "RenderPipeline" = "UniversalPipeline"
        }

        Pass
        {
            HLSLPROGRAM
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x
            #pragma target 2.0

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/SpaceTransforms.hlsl"

            #pragma vertex Vert
            #pragma fragment Frag

            TEXTURE2D_X(_MainTex);
            SAMPLER(sampler_MainTex);
            
            int _Height;
            int _Width;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f Vert(appdata v)
            {
                v2f o;
                o.vertex = TransformObjectToHClip(v.vertex);
                o.uv = v.uv;
                return o;
            }

            half4 Frag(v2f i) : SV_Target
            {
                float2 uv = i.uv;
                uv.x *= _Width;
                uv.y *= _Height;
                uv.xy = round(uv.xy);
                uv.x /= _Width;
                uv.y /= _Height;
                return SAMPLE_TEXTURE2D_X(_MainTex, sampler_MainTex, uv);
            }
            ENDHLSL
        }
    }

    FallBack "Hidden/Universal Render Pipeline/FallbackError"
}