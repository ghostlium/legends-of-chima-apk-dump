//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Waterfall" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _BlendTex ("Blend Texture (RGB)", 2D) = "white" {}
 _SparkTex ("Sparkle Texture (RGB)", 2D) = "black" {}
 _BgColor ("Background Color", Color) = (0.1,0.5,0.9,0.3)
 _MainColor ("Main Color", Color) = (1,1,1,1)
 _SparkPower ("Sparkles atenuation", Range(0.1,8)) = 3
 _TestSpeed ("Speed", Vector) = (0.5,3,0.5,3)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent+1" "RenderType"="Tranparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent+1" "RenderType"="Tranparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
// Platform d3d11 had shader errors
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
// Platform d3d11_9x had shader errors
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_MainTex_ST]
Vector 19 [_BlendTex_ST]
Vector 20 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[16];
ADD R2.xyz, R2, R3;
ADD result.texcoord[5].xyz, R2, R1;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
ADD result.texcoord[2].xyz, -R1, c[9];
MOV result.texcoord[4].z, R2.w;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[3].x, vertex.color.w;
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_MainTex_ST]
Vector 18 [_BlendTex_ST]
Vector 19 [_SparkTex_ST]
"vs_2_0
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c16.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c20.x
dp4 r2.z, r0, c11
dp4 r2.y, r0, c10
dp4 r2.x, r0, c9
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c14
dp4 r3.y, r1, c13
dp4 r3.x, r1, c12
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c15
add r2.xyz, r2, r3
add oT5.xyz, r2, r1
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
add oT2.xyz, -r1, c8
mov oT4.z, r2.w
mov oT4.y, r3.w
mov oT4.x, r0
mad oT0.zw, v2.xyxy, c18.xyxy, c18
mad oT0.xy, v2, c17, c17.zwzw
mad oT1.xy, v2, c19, c19.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT3.x, v3.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
Vector 13 [_BlendTex_ST]
Vector 14 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[2].xyz, -R0, c[9];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[3].x, vertex.color.w;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [unity_LightmapST]
Vector 11 [_MainTex_ST]
Vector 12 [_BlendTex_ST]
Vector 13 [_SparkTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
mul r1.xyz, v1, c9.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT2.xyz, -r0, c8
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
mad oT0.zw, v2.xyxy, c12.xyxy, c12
mad oT0.xy, v2, c11, c11.zwzw
mad oT1.xy, v2, c13, c13.zwzw
mad oT5.xy, v3, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT3.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BlendTex_ST]
Vector 21 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[18].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.w, R0, c[5];
MOV R1.x, R3.w;
MOV R1.y, R2.w;
MOV R1.z, c[0].x;
MUL R0, R1.wxyy, R1.xyyw;
DP4 R2.z, R1.wxyz, c[13];
DP4 R2.y, R1.wxyz, c[12];
DP4 R2.x, R1.wxyz, c[11];
DP4 R1.z, R0, c[16];
DP4 R1.y, R0, c[15];
DP4 R1.x, R0, c[14];
MUL R3.x, R3.w, R3.w;
MAD R0.x, R1.w, R1.w, -R3;
ADD R3.xyz, R2, R1;
MUL R2.xyz, R0.x, c[17];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
MOV result.texcoord[6].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[5].xyz, R3, R2;
ADD result.texcoord[6].xy, R1, R1.z;
ADD result.texcoord[2].xyz, -R0, c[9];
MOV result.texcoord[4].z, R2.w;
MOV result.texcoord[4].y, R3.w;
MOV result.texcoord[4].x, R1.w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
ABS result.texcoord[3].x, vertex.color.w;
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BlendTex_ST]
Vector 21 [_SparkTex_ST]
"vs_2_0
def c22, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r0.xyz, v1, c18.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c22.x
mul r0, r1.wxyy, r1.xyyw
dp4 r2.z, r1.wxyz, c13
dp4 r2.y, r1.wxyz, c12
dp4 r2.x, r1.wxyz, c11
dp4 r1.z, r0, c16
dp4 r1.y, r0, c15
dp4 r1.x, r0, c14
mul r3.x, r3.w, r3.w
mad r0.x, r1.w, r1.w, -r3
add r3.xyz, r2, r1
mul r2.xyz, r0.x, c17
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c22.y
mov oPos, r0
mul r1.y, r1, c9.x
mov oT6.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT5.xyz, r3, r2
mad oT6.xy, r1.z, c10.zwzw, r1
add oT2.xyz, -r0, c8
mov oT4.z, r2.w
mov oT4.y, r3.w
mov oT4.x, r1.w
mad oT0.zw, v2.xyxy, c20.xyxy, c20
mad oT0.xy, v2, c19, c19.zwzw
mad oT1.xy, v2, c21, c21.zwzw
abs oT3.x, v3.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_BlendTex_ST]
Vector 15 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[6].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.texcoord[6].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[2].xyz, -R0, c[9];
DP3 result.texcoord[4].z, R1, c[7];
DP3 result.texcoord[4].y, R1, c[6];
DP3 result.texcoord[4].x, R1, c[5];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[12], c[12].zwzw;
ABS result.texcoord[3].x, vertex.color.w;
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
Vector 14 [_BlendTex_ST]
Vector 15 [_SparkTex_ST]
"vs_2_0
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.x
mov oPos, r0
mul r1.y, r1, c9.x
mad oT6.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT6.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT2.xyz, -r0, c8
dp3 oT4.z, r1, c6
dp3 oT4.y, r1, c5
dp3 oT4.x, r1, c4
mad oT0.zw, v2.xyxy, c14.xyxy, c14
mad oT0.xy, v2, c13, c13.zwzw
mad oT1.xy, v2, c15, c15.zwzw
mad oT5.xy, v3, c12, c12.zwzw
abs oT3.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_MainTex_ST]
Vector 27 [_BlendTex_ST]
Vector 28 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..28] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[25].w;
DP3 R5.x, R3, c[5];
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[11];
DP3 R4.z, R3, c[6];
DP3 R3.z, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[10];
DP4 R4.xy, vertex.position, c[7];
MUL R2, R2, R2;
MOV R5.y, R4.z;
MOV R5.z, R3;
MOV R5.w, c[0].x;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[12];
MAD R2, R1, R1, R2;
MAD R0, R3.z, R1, R0;
MUL R1, R2, c[13];
ADD R1, R1, c[0].x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[20];
DP4 R2.y, R5, c[19];
DP4 R2.x, R5, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[15];
MAD R1.xyz, R0.x, c[14], R1;
MAD R0.xyz, R0.z, c[16], R1;
MAD R1.xyz, R0.w, c[17], R0;
MUL R0, R5.xyzz, R5.yzzx;
MUL R1.w, R4.z, R4.z;
DP4 R5.w, R0, c[23];
DP4 R5.z, R0, c[22];
DP4 R5.y, R0, c[21];
MAD R1.w, R5.x, R5.x, -R1;
MUL R0.xyz, R1.w, c[24];
ADD R2.xyz, R2, R5.yzww;
ADD R0.xyz, R2, R0;
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[5].xyz, R0, R1;
ADD result.texcoord[2].xyz, -R3.wxyw, c[9];
MOV result.texcoord[4].z, R3;
MOV result.texcoord[4].y, R4.z;
MOV result.texcoord[4].x, R5;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[28], c[28].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[3].x, vertex.color.w;
END
# 63 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_4LightPosX0]
Vector 10 [unity_4LightPosY0]
Vector 11 [unity_4LightPosZ0]
Vector 12 [unity_4LightAtten0]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightColor2]
Vector 16 [unity_LightColor3]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_MainTex_ST]
Vector 26 [_BlendTex_ST]
Vector 27 [_SparkTex_ST]
"vs_2_0
def c28, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r3.xyz, v1, c24.w
dp3 r5.x, r3, c4
dp4 r4.zw, v0, c5
add r2, -r4.z, c10
dp3 r4.z, r3, c5
dp3 r3.z, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c9
dp4 r4.xy, v0, c6
mul r2, r2, r2
mov r5.y, r4.z
mov r5.z, r3
mov r5.w, c28.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c11
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c12
add r1, r1, c28.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c19
dp4 r2.y, r5, c18
dp4 r2.x, r5, c17
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c28.y
mul r0, r0, r1
mul r1.xyz, r0.y, c14
mad r1.xyz, r0.x, c13, r1
mad r0.xyz, r0.z, c15, r1
mad r1.xyz, r0.w, c16, r0
mul r0, r5.xyzz, r5.yzzx
mul r1.w, r4.z, r4.z
dp4 r5.w, r0, c22
dp4 r5.z, r0, c21
dp4 r5.y, r0, c20
mad r1.w, r5.x, r5.x, -r1
mul r0.xyz, r1.w, c23
add r2.xyz, r2, r5.yzww
add r0.xyz, r2, r0
mov r3.x, r4.w
mov r3.y, r4
add oT5.xyz, r0, r1
add oT2.xyz, -r3.wxyw, c8
mov oT4.z, r3
mov oT4.y, r4.z
mov oT4.x, r5
mad oT0.zw, v2.xyxy, c26.xyxy, c26
mad oT0.xy, v2, c25, c25.zwzw
mad oT1.xy, v2, c27, c27.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT3.x, v3.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_4LightPosX0]
Vector 12 [unity_4LightPosY0]
Vector 13 [unity_4LightPosZ0]
Vector 14 [unity_4LightAtten0]
Vector 15 [unity_LightColor0]
Vector 16 [unity_LightColor1]
Vector 17 [unity_LightColor2]
Vector 18 [unity_LightColor3]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Vector 27 [_MainTex_ST]
Vector 28 [_BlendTex_ST]
Vector 29 [_SparkTex_ST]
"!!ARBvp1.0
PARAM c[30] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..29] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[26].w;
DP3 R5.x, R3, c[5];
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[12];
DP3 R4.z, R3, c[6];
DP3 R3.z, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[11];
DP4 R4.xy, vertex.position, c[7];
MUL R2, R2, R2;
MOV R5.y, R4.z;
MOV R5.z, R3;
MOV R5.w, c[0].x;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[13];
MAD R2, R1, R1, R2;
MAD R0, R3.z, R1, R0;
MUL R1, R2, c[14];
ADD R1, R1, c[0].x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[21];
DP4 R2.y, R5, c[20];
DP4 R2.x, R5, c[19];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[16];
MAD R1.xyz, R0.x, c[15], R1;
MAD R0.xyz, R0.z, c[17], R1;
MAD R1.xyz, R0.w, c[18], R0;
MUL R0, R5.xyzz, R5.yzzx;
MUL R1.w, R4.z, R4.z;
DP4 R5.w, R0, c[24];
DP4 R5.z, R0, c[23];
DP4 R5.y, R0, c[22];
MAD R1.w, R5.x, R5.x, -R1;
MUL R0.xyz, R1.w, c[25];
ADD R2.xyz, R2, R5.yzww;
ADD R5.yzw, R2.xxyz, R0.xxyz;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
ADD result.texcoord[5].xyz, R5.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[10].x;
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[6].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
ADD result.texcoord[2].xyz, -R3.wxyw, c[9];
MOV result.texcoord[4].z, R3;
MOV result.texcoord[4].y, R4.z;
MOV result.texcoord[4].x, R5;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[28].xyxy, c[28];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[27], c[27].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[29], c[29].zwzw;
ABS result.texcoord[3].x, vertex.color.w;
END
# 69 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_4LightPosX0]
Vector 12 [unity_4LightPosY0]
Vector 13 [unity_4LightPosZ0]
Vector 14 [unity_4LightAtten0]
Vector 15 [unity_LightColor0]
Vector 16 [unity_LightColor1]
Vector 17 [unity_LightColor2]
Vector 18 [unity_LightColor3]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Vector 27 [_MainTex_ST]
Vector 28 [_BlendTex_ST]
Vector 29 [_SparkTex_ST]
"vs_2_0
def c30, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r3.xyz, v1, c26.w
dp3 r5.x, r3, c4
dp4 r4.zw, v0, c5
add r2, -r4.z, c12
dp3 r4.z, r3, c5
dp3 r3.z, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c11
dp4 r4.xy, v0, c6
mul r2, r2, r2
mov r5.y, r4.z
mov r5.z, r3
mov r5.w, c30.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c13
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c14
add r1, r1, c30.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c21
dp4 r2.y, r5, c20
dp4 r2.x, r5, c19
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c16
mad r1.xyz, r0.x, c15, r1
mad r0.xyz, r0.z, c17, r1
mad r1.xyz, r0.w, c18, r0
mul r0, r5.xyzz, r5.yzzx
mul r1.w, r4.z, r4.z
dp4 r5.w, r0, c24
dp4 r5.z, r0, c23
dp4 r5.y, r0, c22
mad r1.w, r5.x, r5.x, -r1
mul r0.xyz, r1.w, c25
add r2.xyz, r2, r5.yzww
add r5.yzw, r2.xxyz, r0.xxyz
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c30.z
add oT5.xyz, r5.yzww, r1
mov r1.x, r2
mul r1.y, r2, c9.x
mov r3.x, r4.w
mov r3.y, r4
mad oT6.xy, r2.z, c10.zwzw, r1
mov oPos, r0
mov oT6.zw, r0
add oT2.xyz, -r3.wxyw, c8
mov oT4.z, r3
mov oT4.y, r4.z
mov oT4.x, r5
mad oT0.zw, v2.xyxy, c28.xyxy, c28
mad oT0.xy, v2, c27, c27.zwzw
mad oT1.xy, v2, c29, c29.zwzw
abs oT3.x, v3.w
"
}
}
Program "fp" {
// Platform d3d11 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 0.5, 1, 0.19995117 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0, c[0];
MAD R2.xy, R0.wzzw, c[3].wzzw, fragment.texcoord[0].zwzw;
MAD R0.zw, R0.xyxy, c[3].xyxy, fragment.texcoord[1].xyxy;
DP3 R2.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.w, R2.w;
MUL R4.xyz, R2.w, fragment.texcoord[2];
DP3_SAT R2.w, R4, fragment.texcoord[4];
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R1, R0.zwzw, texture[2], 2D;
TEX R2.xyz, R2, texture[1], 2D;
TEX R0, R0, texture[0], 2D;
ADD R3.xyz, R0.xzyw, -R2;
MAD R3.xyz, R0.w, R3, R2;
MUL_SAT R0.xyz, R0, R0.w;
ADD R2.x, -R2.w, c[5].y;
POW R2.x, R2.x, c[4].x;
MUL R2.y, R1.w, R2.x;
MUL R0.xyz, R0, c[5].x;
MAD R0.xyz, R1.w, R2.x, R0;
ADD R2.x, R0.w, R2.z;
MUL_SAT R1.xyz, R1, R2.y;
ADD R0.w, R0, c[1];
ADD R1.w, R1, R2.x;
ADD R0.w, R2.z, R0;
MAD R1.xyz, R1, c[2], R3;
MUL R0.xyz, R0, c[2];
ADD_SAT R1.w, R1, c[5].z;
MUL_SAT R0.w, R2, R0;
MUL R0.w, R0, R1;
MAD result.color.xyz, R1, fragment.texcoord[5], R0;
MUL result.color.w, R0, fragment.texcoord[3].x;
END
# 31 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c5, 1.00000000, 0.19995117, 0.50000000, 0
dcl t0
dcl t1.xy
dcl t2.xyz
dcl t3.x
dcl t4.xyz
dcl t5.xyz
mov r2.xy, c3
mov r0.zw, c3
mad r3.xy, c0, r2, t1
mov r1.xy, c3
mad r2.xy, c0, r1, t0
mov r0.y, t0.w
mov r0.x, t0.z
mad r0.xy, c0.wzyx, r0.wzyx, r0
texld r1, r3, s2
texld r3, r0, s1
texld r2, r2, s0
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t4
add_pp r4.x, -r0, c5
pow_pp r5.y, r4.x, c4.x
mov r4.yz, r2.wzyx
mov r4.x, r2
add_pp r4.xyz, r4, -r3
mul_pp_sat r2.xyz, r2, r2.w
mad_pp r4.xyz, r2.w, r4, r3
mov_pp r3.x, r5.y
mul_pp r5.x, r1.w, r3
mul_pp_sat r1.xyz, r1, r5.x
mad r1.xyz, r1, c2, r4
mul_pp r2.xyz, r2, c5.z
mad_pp r2.xyz, r1.w, r3.x, r2
add r3.x, r2.w, c1.w
add r5.x, r3.z, r3
add_pp r4.x, r2.w, r3.z
add_pp r4.x, r1.w, r4
add_pp_sat r3.x, r4, c5.y
mul_sat r0.x, r0, r5
mul_pp r0.x, r0, r3
mul_pp r0.w, r0.x, t3.x
mul r2.xyz, r2, c2
mad_pp r0.xyz, r1, t5, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 0.5, 1, 0.19995117, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R2, fragment.texcoord[5], texture[3], 2D;
MOV R1, c[0];
MAD R3.xy, R1.wzzw, c[3].wzzw, fragment.texcoord[0].zwzw;
DP3 R3.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R3.w, R3.w;
MUL R4.xyz, R3.w, fragment.texcoord[2];
DP3_SAT R3.w, R4, fragment.texcoord[4];
ADD R4.w, -R3, c[5].y;
MAD R0.zw, R1.xyxy, c[3].xyxy, fragment.texcoord[1].xyxy;
MAD R0.xy, R1, c[3], fragment.texcoord[0];
POW R4.w, R4.w, c[4].x;
MUL R2.xyz, R2.w, R2;
TEX R1, R0.zwzw, texture[2], 2D;
TEX R0, R0, texture[0], 2D;
TEX R3.xyz, R3, texture[1], 2D;
ADD R4.xyz, R0.xzyw, -R3;
MAD R4.xyz, R0.w, R4, R3;
MUL_SAT R0.xyz, R0, R0.w;
MUL R3.x, R1.w, R4.w;
MUL_SAT R1.xyz, R1, R3.x;
MUL R0.xyz, R0, c[5].x;
MAD R0.xyz, R1.w, R4.w, R0;
MAD R1.xyz, R1, c[2], R4;
MUL R1.xyz, R2, R1;
ADD R2.x, R0.w, R3.z;
MUL R0.xyz, R0, c[2];
ADD R0.w, R0, c[1];
ADD R1.w, R1, R2.x;
ADD R0.w, R3.z, R0;
ADD_SAT R1.w, R1, c[5].z;
MUL_SAT R0.w, R3, R0;
MUL R0.w, R0, R1;
MAD result.color.xyz, R1, c[5].w, R0;
MUL result.color.w, R0, fragment.texcoord[3].x;
END
# 34 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c5, 1.00000000, 0.19995117, 0.50000000, 8.00000000
dcl t0
dcl t1.xy
dcl t2.xyz
dcl t3.x
dcl t4.xyz
dcl t5.xy
texld r5, t5, s3
mov r2.xy, c3
mad r2.xy, c0, r2, t1
mov r0.zw, c3
mov r0.y, t0.w
mov r0.x, t0.z
mad r1.xy, c0.wzyx, r0.wzyx, r0
mov r0.xy, c3
mad r0.xy, c0, r0, t0
texld r3, r0, s0
texld r6, r1, s1
texld r4, r2, s2
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t4
add_pp r1.x, -r0, c5
pow_pp r2.w, r1.x, c4.x
mov r1.yz, r3.wzyx
mov r1.x, r3
add_pp r7.xyz, r1, -r6
mov_pp r1.x, r2.w
mul_pp r2.x, r4.w, r1
mul_pp_sat r2.xyz, r4, r2.x
mad_pp r7.xyz, r3.w, r7, r6
mul_pp_sat r3.xyz, r3, r3.w
mul_pp r3.xyz, r3, c5.z
mad_pp r3.xyz, r4.w, r1.x, r3
add_pp r1.x, r3.w, r6.z
add_pp r1.x, r4.w, r1
mad r2.xyz, r2, c2, r7
mul_pp r4.xyz, r5.w, r5
mul_pp r4.xyz, r4, r2
add r2.x, r3.w, c1.w
add r2.x, r6.z, r2
add_pp_sat r1.x, r1, c5.y
mul_sat r0.x, r0, r2
mul_pp r0.x, r0, r1
mul_pp r0.w, r0.x, t3.x
mul r1.xyz, r3, c2
mad_pp r0.xyz, r4, c5.w, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 0.5, 1, 0.19995117 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0, c[0];
MAD R2.xy, R0.wzzw, c[3].wzzw, fragment.texcoord[0].zwzw;
MAD R0.zw, R0.xyxy, c[3].xyxy, fragment.texcoord[1].xyxy;
DP3 R2.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.w, R2.w;
MUL R4.xyz, R2.w, fragment.texcoord[2];
DP3_SAT R2.w, R4, fragment.texcoord[4];
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R1, R0.zwzw, texture[2], 2D;
TEX R2.xyz, R2, texture[1], 2D;
TEX R0, R0, texture[0], 2D;
ADD R3.xyz, R0.xzyw, -R2;
MAD R3.xyz, R0.w, R3, R2;
MUL_SAT R0.xyz, R0, R0.w;
ADD R2.x, -R2.w, c[5].y;
POW R2.x, R2.x, c[4].x;
MUL R2.y, R1.w, R2.x;
MUL R0.xyz, R0, c[5].x;
MAD R0.xyz, R1.w, R2.x, R0;
ADD R2.x, R0.w, R2.z;
MUL_SAT R1.xyz, R1, R2.y;
ADD R0.w, R0, c[1];
ADD R1.w, R1, R2.x;
ADD R0.w, R2.z, R0;
MAD R1.xyz, R1, c[2], R3;
MUL R0.xyz, R0, c[2];
ADD_SAT R1.w, R1, c[5].z;
MUL_SAT R0.w, R2, R0;
MUL R0.w, R0, R1;
MAD result.color.xyz, R1, fragment.texcoord[5], R0;
MUL result.color.w, R0, fragment.texcoord[3].x;
END
# 31 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c5, 1.00000000, 0.19995117, 0.50000000, 0
dcl t0
dcl t1.xy
dcl t2.xyz
dcl t3.x
dcl t4.xyz
dcl t5.xyz
mov r2.xy, c3
mov r0.zw, c3
mad r3.xy, c0, r2, t1
mov r1.xy, c3
mad r2.xy, c0, r1, t0
mov r0.y, t0.w
mov r0.x, t0.z
mad r0.xy, c0.wzyx, r0.wzyx, r0
texld r1, r3, s2
texld r3, r0, s1
texld r2, r2, s0
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t4
add_pp r4.x, -r0, c5
pow_pp r5.y, r4.x, c4.x
mov r4.yz, r2.wzyx
mov r4.x, r2
add_pp r4.xyz, r4, -r3
mul_pp_sat r2.xyz, r2, r2.w
mad_pp r4.xyz, r2.w, r4, r3
mov_pp r3.x, r5.y
mul_pp r5.x, r1.w, r3
mul_pp_sat r1.xyz, r1, r5.x
mad r1.xyz, r1, c2, r4
mul_pp r2.xyz, r2, c5.z
mad_pp r2.xyz, r1.w, r3.x, r2
add r3.x, r2.w, c1.w
add r5.x, r3.z, r3
add_pp r4.x, r2.w, r3.z
add_pp r4.x, r1.w, r4
add_pp_sat r3.x, r4, c5.y
mul_sat r0.x, r0, r5
mul_pp r0.x, r0, r3
mul_pp r0.w, r0.x, t3.x
mul r2.xyz, r2, c2
mad_pp r0.xyz, r1, t5, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [unity_Lightmap] 2D 4
"!!ARBfp1.0
PARAM c[7] = { program.local[0..4],
		{ 0.5, 1, 0.19995117, 8 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R2, fragment.texcoord[5], texture[4], 2D;
TXP R5.x, fragment.texcoord[6], texture[3], 2D;
MOV R1, c[0];
MAD R3.xy, R1.wzzw, c[3].wzzw, fragment.texcoord[0].zwzw;
DP3 R3.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R3.w, R3.w;
MUL R4.xyz, R3.w, fragment.texcoord[2];
DP3_SAT R3.w, R4, fragment.texcoord[4];
ADD R4.x, -R3.w, c[5].y;
MAD R0.zw, R1.xyxy, c[3].xyxy, fragment.texcoord[1].xyxy;
MAD R0.xy, R1, c[3], fragment.texcoord[0];
POW R4.w, R4.x, c[4].x;
TEX R1, R0.zwzw, texture[2], 2D;
TEX R0, R0, texture[0], 2D;
TEX R3.xyz, R3, texture[1], 2D;
ADD R4.xyz, R0.xzyw, -R3;
MUL R5.y, R1.w, R4.w;
MAD R4.xyz, R0.w, R4, R3;
MUL_SAT R1.xyz, R1, R5.y;
MAD R1.xyz, R1, c[2], R4;
MUL_SAT R4.xyz, R0, R0.w;
MUL R0.xyz, R2, R5.x;
MUL R2.xyz, R2.w, R2;
ADD R2.w, R0, R3.z;
MUL R4.xyz, R4, c[5].x;
MAD R4.xyz, R1.w, R4.w, R4;
ADD R0.w, R0, c[1];
ADD R1.w, R1, R2;
ADD R0.w, R3.z, R0;
MUL R2.xyz, R2, c[5].w;
MUL R0.xyz, R0, c[6].x;
MIN R0.xyz, R2, R0;
MUL R2.xyz, R2, R5.x;
MAX R0.xyz, R0, R2;
MUL R2.xyz, R4, c[2];
ADD_SAT R1.w, R1, c[5].z;
MUL_SAT R0.w, R3, R0;
MUL R0.w, R0, R1;
MAD result.color.xyz, R1, R0, R2;
MUL result.color.w, R0, fragment.texcoord[3].x;
END
# 40 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
Float 4 [_SparkPower]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
SetTexture 4 [unity_Lightmap] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c5, 1.00000000, 0.19995117, 0.50000000, 8.00000000
def c6, 2.00000000, 0, 0, 0
dcl t0
dcl t1.xy
dcl t2.xyz
dcl t3.x
dcl t4.xyz
dcl t5.xy
dcl t6
texld r3, t5, s4
texldp r8, t6, s3
mov r2.xy, c3
mad r2.xy, c0, r2, t1
mov r0.zw, c3
mov r0.y, t0.w
mov r0.x, t0.z
mad r1.xy, c0.wzyx, r0.wzyx, r0
mov r0.xy, c3
mad r0.xy, c0, r0, t0
texld r4, r0, s0
texld r6, r1, s1
texld r5, r2, s2
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t4
add_pp r1.x, -r0, c5
pow_pp r2.w, r1.x, c4.x
mov r1.yz, r4.wzyx
mov r1.x, r4
add_pp r7.xyz, r1, -r6
mov_pp r1.x, r2.w
mul_pp r2.x, r5.w, r1
mul_pp_sat r2.xyz, r5, r2.x
mul_pp r5.xyz, r3, r8.x
mad_pp r7.xyz, r4.w, r7, r6
mul_pp r3.xyz, r3.w, r3
mul_pp_sat r4.xyz, r4, r4.w
mul_pp r4.xyz, r4, c5.z
mad_pp r4.xyz, r5.w, r1.x, r4
add_pp r1.x, r4.w, r6.z
add_pp r1.x, r5.w, r1
mul_pp r3.xyz, r3, c5.w
mul_pp r5.xyz, r5, c6.x
min_pp r5.xyz, r3, r5
mul_pp r3.xyz, r3, r8.x
max_pp r5.xyz, r5, r3
add r3.x, r4.w, c1.w
add r3.x, r6.z, r3
add_pp_sat r1.x, r1, c5.y
mul_sat r0.x, r0, r3
mul_pp r0.x, r0, r1
mul_pp r0.w, r0.x, t3.x
mad r2.xyz, r2, c2, r7
mul r1.xyz, r4, c2
mad_pp r0.xyz, r2, r5, r1
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent+1" "RenderType"="Tranparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
// Platform d3d11 had shader errors
//   Keywords { "POINT" }
//   Keywords { "DIRECTIONAL" }
//   Keywords { "SPOT" }
//   Keywords { "POINT_COOKIE" }
//   Keywords { "DIRECTIONAL_COOKIE" }
// Platform d3d11_9x had shader errors
//   Keywords { "POINT" }
//   Keywords { "DIRECTIONAL" }
//   Keywords { "SPOT" }
//   Keywords { "POINT_COOKIE" }
//   Keywords { "DIRECTIONAL_COOKIE" }
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[0].x, vertex.color.w;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_color0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT0.x, v2.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
"!!ARBvp1.0
PARAM c[11] = { program.local[0],
		state.matrix.mvp,
		program.local[5..10] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[10].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[9];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[0].x, vertex.color.w;
END
# 10 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_color0 v2
mul r0.xyz, v1, c9.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c8
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT0.x, v2.w
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[3].w, R0, c[12];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[0].x, vertex.color.w;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_color0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT3.w, r0, c11
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT0.x, v2.w
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[0].x, vertex.color.w;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_color0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT0.x, v2.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[0].x, vertex.color.w;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_color0 v2
mul r1.xyz, v1, c13.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c12
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT0.x, v2.w
"
}
}
Program "fp" {
// Platform d3d11 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "POINT" }
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0 } };
MOV result.color, c[3].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0 } };
MOV result.color, c[3].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0 } };
MOV result.color, c[3].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0 } };
MOV result.color, c[3].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0 } };
MOV result.color, c[3].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}