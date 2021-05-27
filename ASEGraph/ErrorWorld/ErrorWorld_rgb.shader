// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ErrorWorld/RGB"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_TextureSample2("Texture Sample 2", 2D) = "white" {}
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_TextureSample3("Texture Sample 3", 2D) = "white" {}
		_TextureSample4("Texture Sample 4", 2D) = "white" {}
		_speed("speed", Vector) = (0.84,9.54,0,0)
		_speed2("speed2", Vector) = (-2.34,-1.41,0,0)
		_BrightConstant("BrightConstant", Float) = -0.91
		_G_Offset("G_Offset", Float) = 0.41
		_TimeController("TimeController", Float) = 0.15
		_B_Offset("B_Offset", Float) = 0.34
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

		uniform sampler2D _TextureSample3;
		uniform float _B_Offset;
		uniform sampler2D _TextureSample0;
		uniform float2 _speed;
		uniform sampler2D _TextureSample2;
		uniform float2 _speed2;
		uniform float _BrightConstant;
		uniform float _TimeController;
		uniform sampler2D _TextureSample1;
		uniform sampler2D _TextureSample4;
		uniform float _G_Offset;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_TexCoord2 = i.uv_texcoord * float2( 0.1,1.56 ) + ( _Time.y * _speed );
			float2 uv_TexCoord12 = i.uv_texcoord * float2( 0.1,1.36 ) + ( _Time.y * _speed2 );
			float4 OriginOffset39 = ( ( tex2D( _TextureSample0, uv_TexCoord2 ) * tex2D( _TextureSample2, uv_TexCoord12 ) ) + ( _BrightConstant * saturate( ( _SinTime.w + _TimeController ) ) ) );
			float2 uv_TexCoord34 = i.uv_texcoord + saturate( ( _B_Offset * OriginOffset39 ) ).rg;
			float2 uv_TexCoord14 = i.uv_texcoord + saturate( OriginOffset39 ).rg;
			float2 uv_TexCoord36 = i.uv_texcoord + saturate( ( OriginOffset39 * _G_Offset ) ).rg;
			float4 appendResult44 = (float4(tex2D( _TextureSample3, uv_TexCoord34 ).r , tex2D( _TextureSample1, uv_TexCoord14 ).g , tex2D( _TextureSample4, uv_TexCoord36 ).b , 0.0));
			o.Albedo = appendResult44.xyz;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
78;6;1842;1053;1077.263;-300.5406;1.3;True;False
Node;AmplifyShaderEditor.CommentaryNode;55;-957.389,-17.18422;Inherit;False;1770.252;1177.529;;19;7;9;10;5;6;11;2;12;13;18;32;1;17;8;16;15;31;33;39;混合噪声;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector2Node;5;-880.3129,247.6375;Inherit;False;Property;_speed;speed;5;0;Create;True;0;0;0;False;0;False;0.84,9.54;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;10;-906.389,592.4023;Inherit;False;Property;_speed2;speed2;6;0;Create;True;0;0;0;False;0;False;-2.34,-1.41;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleTimeNode;9;-907.389,464.4018;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;7;-881.3129,119.6376;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-668.3889,501.4019;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-642.3127,156.6375;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-412.8154,1044.345;Inherit;False;Property;_TimeController;TimeController;10;0;Create;True;0;0;0;False;0;False;0.15;0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;15;-409.777,792.5657;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-260.2242,859.6303;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;-514.3124,57.63757;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,1.56;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-540.3885,402.4018;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0.1,1.36;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-116.056,630.7346;Inherit;False;Property;_BrightConstant;BrightConstant;7;0;Create;True;0;0;0;False;0;False;-0.91;0.35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-277.9324,32.81578;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;11e2e03c1823d3e428cde6d0c596003c;11e2e03c1823d3e428cde6d0c596003c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;33;-131.5168,817.3452;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;13;-304.0085,377.58;Inherit;True;Property;_TextureSample2;Texture Sample 2;1;0;Create;True;0;0;0;False;0;False;-1;11e2e03c1823d3e428cde6d0c596003c;11e2e03c1823d3e428cde6d0c596003c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;249.7433,598.1348;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-11.31271,177.6375;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;373.145,321.7343;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;588.8627,335.9551;Inherit;False;OriginOffset;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;24;1154.608,384.851;Inherit;False;Property;_B_Offset;B_Offset;11;0;Create;True;0;0;0;False;0;False;0.34;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;42;1108.928,837.9746;Inherit;False;39;OriginOffset;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;23;1130.064,979.8768;Inherit;False;Property;_G_Offset;G_Offset;9;0;Create;True;0;0;0;False;0;False;0.41;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;1139.885,678.9529;Inherit;False;39;OriginOffset;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;1326.248,885.8761;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;1328.649,527.0759;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;947.4606,100.3541;Inherit;True;39;OriginOffset;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;53;1377.883,380.3599;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;54;1432.983,756.5599;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;52;1208.783,184.6599;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;14;1409.422,162.8651;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;36;1564.433,820.367;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;34;1508.734,489.8674;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;37;1782.397,763.9398;Inherit;True;Property;_TextureSample4;Texture Sample 4;4;0;Create;True;0;0;0;False;0;False;-1;446893422365d40039e0760b89621e86;446893422365d40039e0760b89621e86;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;1678.986,132.9377;Inherit;True;Property;_TextureSample1;Texture Sample 1;2;0;Create;True;0;0;0;False;0;False;-1;446893422365d40039e0760b89621e86;446893422365d40039e0760b89621e86;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;35;1781.196,398.2402;Inherit;True;Property;_TextureSample3;Texture Sample 3;3;0;Create;True;0;0;0;False;0;False;-1;446893422365d40039e0760b89621e86;446893422365d40039e0760b89621e86;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;1139.909,1188.449;Inherit;False;Property;_R_Offset;R_Offset;8;0;Create;True;0;0;0;False;0;False;0.09;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;44;2094.477,444.6744;Inherit;True;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2384.077,114.3971;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ErrorWorld/RGB;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;56;-459.777,742.5657;Inherit;False;493.2602;252.0646;自动控制用这个;0;;1,1,1,1;0;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;6;0;7;0
WireConnection;6;1;5;0
WireConnection;31;0;15;4
WireConnection;31;1;32;0
WireConnection;2;1;6;0
WireConnection;12;1;11;0
WireConnection;1;1;2;0
WireConnection;33;0;31;0
WireConnection;13;1;12;0
WireConnection;17;0;18;0
WireConnection;17;1;33;0
WireConnection;8;0;1;0
WireConnection;8;1;13;0
WireConnection;16;0;8;0
WireConnection;16;1;17;0
WireConnection;39;0;16;0
WireConnection;45;0;42;0
WireConnection;45;1;23;0
WireConnection;46;0;24;0
WireConnection;46;1;41;0
WireConnection;53;0;46;0
WireConnection;54;0;45;0
WireConnection;52;0;40;0
WireConnection;14;1;52;0
WireConnection;36;1;54;0
WireConnection;34;1;53;0
WireConnection;37;1;36;0
WireConnection;3;1;14;0
WireConnection;35;1;34;0
WireConnection;44;0;35;1
WireConnection;44;1;3;2
WireConnection;44;2;37;3
WireConnection;0;0;44;0
ASEEND*/
//CHKSM=8D70C0D504B5D837B9F53807F2F4FA8F0613D19A