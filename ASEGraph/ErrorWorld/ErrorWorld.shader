// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ErrorWorld/Origin"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample2("Texture Sample 0", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_speed("speed", Vector) = (0.84,9.54,0,0)
		_speed1("speed", Vector) = (-2.34,-1.41,0,0)
		_BrightConstant("BrightConstant", Float) = 0.35
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample1;
		uniform sampler2D _TextureSample0;
		uniform float2 _speed;
		uniform sampler2D _TextureSample2;
		uniform float2 _speed1;
		uniform float _BrightConstant;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord2 = i.uv_texcoord * float2( 0.1,1.56 ) + ( _Time.y * _speed );
			float2 uv_TexCoord12 = i.uv_texcoord * float2( 0.1,1.36 ) + ( _Time.y * _speed1 );
			float2 uv_TexCoord14 = i.uv_texcoord + ( ( ( tex2D( _TextureSample0, uv_TexCoord2 ) * tex2D( _TextureSample2, uv_TexCoord12 ) ) + _BrightConstant ) * abs( _SinTime.w ) ).rg;
			o.Albedo = tex2D( _TextureSample1, uv_TexCoord14 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
78;0;1842;1059;595.6136;187.0949;1.589362;True;False
Node;AmplifyShaderEditor.SimpleTimeNode;7;-444.3127,85.43756;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;5;-443.3127,213.4376;Inherit;False;Property;_speed;speed;3;0;Create;True;0;0;0;False;0;False;0.84,9.54;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleTimeNode;9;-470.3888,430.2019;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;10;-469.3888,558.202;Inherit;False;Property;_speed1;speed;4;0;Create;True;0;0;0;False;0;False;-2.34,-1.41;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-205.3127,122.4376;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-231.3888,467.202;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-77.31268,23.43756;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,1.56;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-103.3888,368.2019;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,1.36;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;132.9914,343.3801;Inherit;True;Property;_TextureSample2;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;-1;11e2e03c1823d3e428cde6d0c596003c;11e2e03c1823d3e428cde6d0c596003c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;159.0675,-1.384216;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;11e2e03c1823d3e428cde6d0c596003c;11e2e03c1823d3e428cde6d0c596003c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SinTimeNode;15;393.8224,762.265;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;425.6873,143.4376;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;18;378.9441,608.1342;Inherit;False;Property;_BrightConstant;BrightConstant;5;0;Create;True;0;0;0;False;0;False;0.35;0.35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;20;667.9441,786.1342;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;647.9441,423.1342;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;884.9441,523.1342;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;774.8224,104.265;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;1039.687,244.4376;Inherit;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;0;False;0;False;-1;446893422365d40039e0760b89621e86;446893422365d40039e0760b89621e86;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1400.474,55.49712;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ErrorWorld/Origin;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;7;0
WireConnection;6;1;5;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;2;1;6;0
WireConnection;12;1;11;0
WireConnection;13;1;12;0
WireConnection;1;1;2;0
WireConnection;8;0;1;0
WireConnection;8;1;13;0
WireConnection;20;0;15;4
WireConnection;16;0;8;0
WireConnection;16;1;18;0
WireConnection;17;0;16;0
WireConnection;17;1;20;0
WireConnection;14;1;17;0
WireConnection;3;1;14;0
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=9EA0103D9D3C7D56A9F8C97F4DAE56E11AFBE708