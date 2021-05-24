//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Waterfall_LQ" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _BlendTex ("Blend Texture (RGB)", 2D) = "white" {}
 _BgColor ("Background Color", Color) = (0.1,0.5,0.9,0.3)
 _MainColor ("Main Color", Color) = (1,1,1,1)
 _TestSpeed ("Speed", Vector) = (0.5,3,0.5,3)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent-1" "RenderType"="Tranparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent-1" "RenderType"="Tranparent" }
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
"!!ARBvp1.0
PARAM c[20] = { { 1 },
		state.matrix.mvp,
		program.local[5..19] };
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
ADD result.texcoord[4].xyz, R2, R1;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R1, c[9];
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[2].x, vertex.color.w;
END
# 33 instructions, 4 R-regs
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
"vs_2_0
def c19, 1.00000000, 0, 0, 0
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
mov r0.w, c19.x
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
add oT4.xyz, r2, r1
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
add oT1.xyz, -r1, c8
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r0
mad oT0.zw, v2.xyxy, c18.xyxy, c18
mad oT0.xy, v2, c17, c17.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT2.x, v3.w
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
"!!ARBvp1.0
PARAM c[14] = { program.local[0],
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[2].x, vertex.color.w;
END
# 16 instructions, 2 R-regs
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
add oT1.xyz, -r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mad oT0.zw, v2.xyxy, c12.xyxy, c12
mad oT0.xy, v2, c11, c11.zwzw
mad oT4.xy, v3, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT2.x, v4.w
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
"!!ARBvp1.0
PARAM c[21] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
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
MOV result.texcoord[5].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[4].xyz, R3, R2;
ADD result.texcoord[5].xy, R1, R1.z;
ADD result.texcoord[1].xyz, -R0, c[9];
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1.w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
ABS result.texcoord[2].x, vertex.color.w;
END
# 38 instructions, 4 R-regs
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
"vs_2_0
def c21, 1.00000000, 0.50000000, 0, 0
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
mov r1.z, c21.x
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
mul r1.xyz, r0.xyww, c21.y
mov oPos, r0
mul r1.y, r1, c9.x
mov oT5.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT4.xyz, r3, r2
mad oT5.xy, r1.z, c10.zwzw, r1
add oT1.xyz, -r0, c8
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r1.w
mad oT0.zw, v2.xyxy, c20.xyxy, c20
mad oT0.xy, v2, c19, c19.zwzw
abs oT2.x, v3.w
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
"!!ARBvp1.0
PARAM c[15] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[5].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.texcoord[5].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[12], c[12].zwzw;
ABS result.texcoord[2].x, vertex.color.w;
END
# 21 instructions, 2 R-regs
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
"vs_2_0
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.x
mov oPos, r0
mul r1.y, r1, c9.x
mad oT5.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT5.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT1.xyz, -r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mad oT0.zw, v2.xyxy, c14.xyxy, c14
mad oT0.xy, v2, c13, c13.zwzw
mad oT4.xy, v3, c12, c12.zwzw
abs oT2.x, v4.w
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
"!!ARBvp1.0
PARAM c[28] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..27] };
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
ADD result.texcoord[4].xyz, R0, R1;
ADD result.texcoord[1].xyz, -R3.wxyw, c[9];
MOV result.texcoord[3].z, R3;
MOV result.texcoord[3].y, R4.z;
MOV result.texcoord[3].x, R5;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
ABS result.texcoord[2].x, vertex.color.w;
END
# 62 instructions, 6 R-regs
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
"vs_2_0
def c27, 1.00000000, 0.00000000, 0, 0
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
mov r5.w, c27.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c11
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c12
add r1, r1, c27.x
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
max r0, r0, c27.y
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
add oT4.xyz, r0, r1
add oT1.xyz, -r3.wxyw, c8
mov oT3.z, r3
mov oT3.y, r4.z
mov oT3.x, r5
mad oT0.zw, v2.xyxy, c26.xyxy, c26
mad oT0.xy, v2, c25, c25.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
abs oT2.x, v3.w
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
"!!ARBvp1.0
PARAM c[29] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..28] };
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
ADD result.texcoord[4].xyz, R5.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[10].x;
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
ADD result.texcoord[1].xyz, -R3.wxyw, c[9];
MOV result.texcoord[3].z, R3;
MOV result.texcoord[3].y, R4.z;
MOV result.texcoord[3].x, R5;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[28].xyxy, c[28];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[27], c[27].zwzw;
ABS result.texcoord[2].x, vertex.color.w;
END
# 68 instructions, 6 R-regs
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
"vs_2_0
def c29, 1.00000000, 0.00000000, 0.50000000, 0
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
mov r5.w, c29.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c13
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c14
add r1, r1, c29.x
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
max r0, r0, c29.y
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
mul r2.xyz, r0.xyww, c29.z
add oT4.xyz, r5.yzww, r1
mov r1.x, r2
mul r1.y, r2, c9.x
mov r3.x, r4.w
mov r3.y, r4
mad oT5.xy, r2.z, c10.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
add oT1.xyz, -r3.wxyw, c8
mov oT3.z, r3
mov oT3.y, r4.z
mov oT3.x, r5
mad oT0.zw, v2.xyxy, c28.xyxy, c28
mad oT0.xy, v2, c27, c27.zwzw
abs oT2.x, v3.w
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
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 0.19995117 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[0];
MAD R0.zw, R0.xywz, c[3].xywz, fragment.texcoord[0];
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R1.xyz, R0.zwzw, texture[1], 2D;
TEX R0, R0, texture[0], 2D;
ADD R0.xyz, R0.xzyw, -R1;
MAD R0.xyz, R0.w, R0, R1;
RSQ R1.x, R1.w;
MUL R2.xyz, R1.x, fragment.texcoord[1];
DP3_SAT R1.y, R2, fragment.texcoord[3];
ADD R1.x, R0.w, c[1].w;
ADD R1.x, R1.z, R1;
MUL_SAT R1.w, R1.y, R1.x;
ADD R2.x, -R1.y, c[4];
POW R1.y, R2.x, c[4].y;
ADD R1.x, R0.w, R1.z;
MUL R1.y, R0.w, R1;
ADD_SAT R0.w, R1.x, c[4].y;
MUL R0.w, R1, R0;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R1.y, c[2];
MAD result.color.xyz, R0, fragment.texcoord[4], R1;
MUL result.color.w, R0, fragment.texcoord[2].x;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c4, 1.00000000, 0.19995117, 0, 0
dcl t0
dcl t1.xyz
dcl t2.x
dcl t3.xyz
dcl t4.xyz
mov r0.xy, c3
mad r0.xy, c0, r0, t0
mov r0.zw, c3
mov r1.y, t0.w
mov r1.x, t0.z
mad r1.xy, c0.wzyx, r0.wzyx, r1
texld r2, r0, s0
texld r1, r1, s1
dp3 r0.x, t1, t1
rsq r0.x, r0.x
mul r0.xyz, r0.x, t1
dp3_sat r0.x, r0, t3
add_pp r4.x, -r0, c4
pow_pp r3.y, r4.x, c4.y
mov r2.yz, r2.wzyx
add_pp r2.xyz, r2, -r1
mad_pp r2.xyz, r2.w, r2, r1
mov_pp r1.x, r3.y
add_pp r3.x, r2.w, r1.z
add r4.x, r2.w, c1.w
add r4.x, r1.z, r4
mul_pp r1.x, r2.w, r1
mul r2.xyz, r2, c2
add_pp_sat r3.x, r3, c4.y
mul_sat r0.x, r0, r4
mul_pp r0.x, r0, r3
mul_pp r0.w, r0.x, t2.x
mul r1.xyz, r1.x, c2
mad_pp r0.xyz, r2, t4, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 0.19995117, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[4], texture[2], 2D;
MOV R0, c[0];
MAD R0.zw, R0.xywz, c[3].xywz, fragment.texcoord[0];
MUL R1.xyz, R1.w, R1;
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R2.xyz, R0.zwzw, texture[1], 2D;
TEX R0, R0, texture[0], 2D;
ADD R0.xyz, R0.xzyw, -R2;
MAD R0.xyz, R0.w, R0, R2;
MUL R0.xyz, R0, c[2];
DP3 R2.x, fragment.texcoord[1], fragment.texcoord[1];
RSQ R1.w, R2.x;
MUL R1.xyz, R1, R0;
MUL R0.xyz, R1.w, fragment.texcoord[1];
DP3_SAT R0.y, R0, fragment.texcoord[3];
ADD R1.w, R0, c[1];
ADD R0.x, R2.z, R1.w;
MUL_SAT R1.w, R0.y, R0.x;
ADD R0.z, -R0.y, c[4].x;
POW R0.y, R0.z, c[4].y;
ADD R0.x, R0.w, R2.z;
MUL R0.y, R0.w, R0;
ADD_SAT R0.w, R0.x, c[4].y;
MUL R0.xyz, R0.y, c[2];
MUL R0.w, R1, R0;
MAD result.color.xyz, R1, c[4].z, R0;
MUL result.color.w, R0, fragment.texcoord[2].x;
END
# 27 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 1.00000000, 0.19995117, 8.00000000, 0
dcl t0
dcl t1.xyz
dcl t2.x
dcl t3.xyz
dcl t4.xy
texld r2, t4, s2
mov r1.xy, c3
mad r1.xy, c0, r1, t0
mov r0.zw, c3
mul_pp r2.xyz, r2.w, r2
mov r0.y, t0.w
mov r0.x, t0.z
mad r0.xy, c0.wzyx, r0.wzyx, r0
texld r3, r0, s1
texld r1, r1, s0
dp3 r0.x, t1, t1
rsq r0.x, r0.x
mul r0.xyz, r0.x, t1
mov r1.yz, r1.wzyx
add_pp r4.xyz, r1, -r3
mad_pp r5.xyz, r1.w, r4, r3
dp3_sat r0.x, r0, t3
add_pp r1.x, -r0, c4
pow_pp r4.w, r1.x, c4.y
mov_pp r1.x, r4.w
mul r5.xyz, r5, c2
mul_pp r4.xyz, r2, r5
mul_pp r1.x, r1.w, r1
add r2.x, r1.w, c1.w
add_pp r3.x, r1.w, r3.z
add r2.x, r3.z, r2
add_pp_sat r3.x, r3, c4.y
mul_sat r0.x, r0, r2
mul_pp r0.x, r0, r3
mul_pp r0.w, r0.x, t2.x
mul r1.xyz, r1.x, c2
mad_pp r0.xyz, r4, c4.z, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 0.19995117 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[0];
MAD R0.zw, R0.xywz, c[3].xywz, fragment.texcoord[0];
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R1.xyz, R0.zwzw, texture[1], 2D;
TEX R0, R0, texture[0], 2D;
ADD R0.xyz, R0.xzyw, -R1;
MAD R0.xyz, R0.w, R0, R1;
RSQ R1.x, R1.w;
MUL R2.xyz, R1.x, fragment.texcoord[1];
DP3_SAT R1.y, R2, fragment.texcoord[3];
ADD R1.x, R0.w, c[1].w;
ADD R1.x, R1.z, R1;
MUL_SAT R1.w, R1.y, R1.x;
ADD R2.x, -R1.y, c[4];
POW R1.y, R2.x, c[4].y;
ADD R1.x, R0.w, R1.z;
MUL R1.y, R0.w, R1;
ADD_SAT R0.w, R1.x, c[4].y;
MUL R0.w, R1, R0;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R1.y, c[2];
MAD result.color.xyz, R0, fragment.texcoord[4], R1;
MUL result.color.w, R0, fragment.texcoord[2].x;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c4, 1.00000000, 0.19995117, 0, 0
dcl t0
dcl t1.xyz
dcl t2.x
dcl t3.xyz
dcl t4.xyz
mov r0.xy, c3
mad r0.xy, c0, r0, t0
mov r0.zw, c3
mov r1.y, t0.w
mov r1.x, t0.z
mad r1.xy, c0.wzyx, r0.wzyx, r1
texld r2, r0, s0
texld r1, r1, s1
dp3 r0.x, t1, t1
rsq r0.x, r0.x
mul r0.xyz, r0.x, t1
dp3_sat r0.x, r0, t3
add_pp r4.x, -r0, c4
pow_pp r3.y, r4.x, c4.y
mov r2.yz, r2.wzyx
add_pp r2.xyz, r2, -r1
mad_pp r2.xyz, r2.w, r2, r1
mov_pp r1.x, r3.y
add_pp r3.x, r2.w, r1.z
add r4.x, r2.w, c1.w
add r4.x, r1.z, r4
mul_pp r1.x, r2.w, r1
mul r2.xyz, r2, c2
add_pp_sat r3.x, r3, c4.y
mul_sat r0.x, r0, r4
mul_pp r0.x, r0, r3
mul_pp r0.w, r0.x, t2.x
mul r1.xyz, r1.x, c2
mad_pp r0.xyz, r2, t4, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 0.19995117, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TXP R3.x, fragment.texcoord[5], texture[2], 2D;
MOV R0, c[0];
MAD R2.xy, R0.wzzw, c[3].wzzw, fragment.texcoord[0].zwzw;
MAD R0.xy, R0, c[3], fragment.texcoord[0];
TEX R0, R0, texture[0], 2D;
TEX R2.xyz, R2, texture[1], 2D;
ADD R0.xyz, R0.xzyw, -R2;
MAD R0.xyz, R0.w, R0, R2;
MUL R2.xyw, R0.xyzz, c[2].xyzz;
MUL R0.xyz, R1, R3.x;
MUL R1.xyz, R1.w, R1;
DP3 R1.w, fragment.texcoord[1], fragment.texcoord[1];
MUL R1.xyz, R1, c[4].z;
MUL R0.xyz, R0, c[4].w;
MIN R0.xyz, R1, R0;
MUL R1.xyz, R1, R3.x;
RSQ R1.w, R1.w;
MAX R1.xyz, R0, R1;
MUL R0.xyz, R1.w, fragment.texcoord[1];
DP3_SAT R0.y, R0, fragment.texcoord[3];
ADD R1.w, R0, c[1];
ADD R0.x, R2.z, R1.w;
MUL_SAT R1.w, R0.y, R0.x;
ADD R0.z, -R0.y, c[4].x;
POW R0.y, R0.z, c[4].y;
ADD R0.x, R0.w, R2.z;
MUL R0.y, R0.w, R0;
ADD_SAT R0.w, R0.x, c[4].y;
MUL R0.xyz, R0.y, c[2];
MUL R0.w, R1, R0;
MAD result.color.xyz, R2.xyww, R1, R0;
MUL result.color.w, R0, fragment.texcoord[2].x;
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_BgColor]
Vector 2 [_MainColor]
Vector 3 [_TestSpeed]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 1.00000000, 0.19995117, 8.00000000, 2.00000000
dcl t0
dcl t1.xyz
dcl t2.x
dcl t3.xyz
dcl t4.xy
dcl t5
texldp r6, t5, s2
texld r2, t4, s3
mov r1.xy, c3
mad r1.xy, c0, r1, t0
mul_pp r5.xyz, r2.w, r2
mov r0.zw, c3
mov r0.y, t0.w
mov r0.x, t0.z
mad r0.xy, c0.wzyx, r0.wzyx, r0
texld r0, r0, s1
texld r1, r1, s0
mov r1.yz, r1.wzyx
add_pp r1.xyz, r1, -r0
mad_pp r1.xyz, r1.w, r1, r0
mul r3.xyz, r1, c2
dp3 r0.x, t1, t1
rsq r0.x, r0.x
mul r4.xyz, r0.x, t1
mul_pp r1.xyz, r2, r6.x
dp3_sat r0.x, r4, t3
mul_pp r4.xyz, r1, c4.w
add_pp r1.x, -r0, c4
pow_pp r2.y, r1.x, c4.y
mul_pp r1.xyz, r5, c4.z
min_pp r4.xyz, r1, r4
mul_pp r5.xyz, r1, r6.x
mov_pp r1.x, r2.y
max_pp r5.xyz, r4, r5
add_pp r4.x, r1.w, r0.z
mul_pp r1.x, r1.w, r1
add r2.x, r1.w, c1.w
add r2.x, r0.z, r2
add_pp_sat r4.x, r4, c4.y
mul_sat r0.x, r0, r2
mul_pp r0.x, r0, r4
mul_pp r0.w, r0.x, t2.x
mul r1.xyz, r1.x, c2
mad_pp r0.xyz, r3, r5, r1
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent-1" "RenderType"="Tranparent" }
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