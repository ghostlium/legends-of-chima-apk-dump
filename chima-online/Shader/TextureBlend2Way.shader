//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Texture Blend 2 Way" {
Properties {
 _Color ("Primary Color", Color) = (1,1,1,1)
 _MainTex ("Primary Texture (VC=0) Base (RGB)", 2D) = "white" {}
 _Color2 ("Secondary Color", Color) = (1,1,1,1)
 _SecTex ("secondary Texture (VC=R) Base (RGB)", 2D) = "white" {}
 _Strength ("Blend Strength", Range(0.1,10)) = 4
 _Sharpness ("Blend Sharpness", Range(1,20)) = 1
 _UvScaleP ("Primary Uv scale offset", Range(0,2)) = 0.25
 _UvScaleS ("Secondary Uv scale offset", Range(0,2)) = 0.5
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
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
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[20];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[3].xyz, R3, R2;
MOV R1, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[1].xyz, vertex.color;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[0].z, vertex.position, c[7];
DP4 result.texcoord[0].y, vertex.position, c[6];
DP4 result.texcoord[0].x, vertex.position, c[5];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_color0 v3
mul r1.xyz, v2, c20.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c21.x
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c18
dp4 r3.y, r1, c17
dp4 r3.x, r1, c16
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c19
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mul r2.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r3.y, c12, r0
dp4 r3.x, c12, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT1.xyz, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
dp4 oT0.z, v0, c6
dp4 oT0.y, v0, c5
dp4 oT0.x, v0, c4
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 14 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MOV result.texcoord[1].xyz, vertex.color;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
DP4 result.texcoord[0].z, vertex.position, c[7];
DP4 result.texcoord[0].y, vertex.position, c[6];
DP4 result.texcoord[0].x, vertex.position, c[5];
END
# 9 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 12 [unity_LightmapST]
"vs_2_0
dcl_position0 v0
dcl_texcoord1 v3
dcl_color0 v4
mov oT1.xyz, v4
mad oT2.xy, v3, c12, c12.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
dp4 oT0.z, v0, c6
dp4 oT0.y, v0, c5
dp4 oT0.x, v0, c4
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MOV R1.xyz, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[21];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[14];
ADD result.texcoord[3].xyz, R3, R2;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[1].xyz, vertex.color;
DP4 result.texcoord[0].z, vertex.position, c[7];
DP4 result.texcoord[0].y, vertex.position, c[6];
DP4 result.texcoord[0].x, vertex.position, c[5];
END
# 42 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_color0 v3
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c21
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c14, r0
mov r0, c9
dp4 r3.y, c14, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c14, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c23.y
mul r1.y, r1, c12.x
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mov oT1.xyz, v3
dp4 oT0.z, v0, c6
dp4 oT0.y, v0, c5
dp4 oT0.x, v0, c4
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 15 [unity_LightmapST]
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
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[1].xyz, vertex.color;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.texcoord[0].z, vertex.position, c[7];
DP4 result.texcoord[0].y, vertex.position, c[6];
DP4 result.texcoord[0].x, vertex.position, c[5];
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_LightmapST]
"vs_2_0
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.x
mul r1.y, r1, c12.x
mad oT3.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mov oT1.xyz, v4
mad oT2.xy, v3, c14, c14.zwzw
dp4 oT0.z, v0, c6
dp4 oT0.y, v0, c5
dp4 oT0.x, v0, c4
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
"!!ARBvp1.0
PARAM c[30] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..29] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[29].w;
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[15];
DP3 R4.z, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.x, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[14];
MUL R2, R2, R2;
MOV R5.z, R3.x;
MOV R5.y, R4.z;
MOV R5.w, c[0].x;
MAD R0, R5.x, R1, R0;
DP4 R4.xy, vertex.position, c[7];
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[16];
MAD R2, R1, R1, R2;
MAD R0, R3.x, R1, R0;
MUL R1, R2, c[17];
ADD R1, R1, c[0].x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MAD R1.xyz, R0.w, c[21], R0;
MUL R0, R5.xyzz, R5.yzzx;
DP4 R3.z, R0, c[27];
DP4 R3.y, R0, c[26];
DP4 R3.x, R0, c[25];
MUL R1.w, R4.z, R4.z;
MAD R0.x, R5, R5, -R1.w;
DP4 R2.z, R5, c[24];
DP4 R2.y, R5, c[23];
DP4 R2.x, R5, c[22];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[28];
ADD R3.xyz, R2, R3;
ADD result.texcoord[3].xyz, R3, R1;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
MOV R3.x, R4.w;
MOV R3.y, R4;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xyz, R3.wxyw;
MOV result.texcoord[1].xyz, vertex.color;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 68 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_4LightPosX0]
Vector 14 [unity_4LightPosY0]
Vector 15 [unity_4LightPosZ0]
Vector 16 [unity_4LightAtten0]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
"vs_2_0
def c29, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_color0 v3
mul r3.xyz, v2, c28.w
dp4 r4.zw, v0, c5
add r2, -r4.z, c14
dp3 r4.z, r3, c5
dp3 r5.x, r3, c4
dp3 r3.x, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c13
mul r2, r2, r2
mov r5.z, r3.x
mov r5.y, r4.z
mov r5.w, c29.x
mad r0, r5.x, r1, r0
dp4 r4.xy, v0, c6
mad r2, r1, r1, r2
add r1, -r4.x, c15
mad r2, r1, r1, r2
mad r0, r3.x, r1, r0
mul r1, r2, c16
add r1, r1, c29.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c29.y
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mad r1.xyz, r0.w, c20, r0
mul r0, r5.xyzz, r5.yzzx
mul r1.w, r4.z, r4.z
dp4 r3.z, r0, c26
dp4 r3.y, r0, c25
dp4 r3.x, r0, c24
mad r1.w, r5.x, r5.x, -r1
mul r0.xyz, r1.w, c27
dp4 r2.z, r5, c23
dp4 r2.y, r5, c22
dp4 r2.x, r5, c21
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mul r2.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r3.y, c12, r0
dp4 r3.x, c12, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov r3.x, r4.w
mov r3.y, r4
mov oT0.xyz, r3.wxyw
mov oT1.xyz, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
"!!ARBvp1.0
PARAM c[31] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[16];
DP3 R4.z, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.x, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[15];
MUL R2, R2, R2;
MOV R5.z, R3.x;
MOV R5.y, R4.z;
MOV R5.w, c[0].x;
MAD R0, R5.x, R1, R0;
DP4 R4.xy, vertex.position, c[7];
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[17];
MAD R2, R1, R1, R2;
MAD R0, R3.x, R1, R0;
MUL R1, R2, c[18];
ADD R1, R1, c[0].x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R5.xyzz, R5.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R4.z, R4.z;
MAD R0.x, R5, R5, -R1.w;
DP4 R2.z, R5, c[25];
DP4 R2.y, R5, c[24];
DP4 R2.x, R5, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R3.xyz, R2, R3;
ADD result.texcoord[3].xyz, R3, R1;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[14];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[2].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[13].x;
MOV R3.x, R4.w;
MOV R3.y, R4;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[0].xyz, R3.wxyw;
MOV result.texcoord[1].xyz, vertex.color;
END
# 73 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
"vs_2_0
def c31, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_color0 v3
mul r3.xyz, v2, c30.w
dp4 r4.zw, v0, c5
add r2, -r4.z, c16
dp3 r4.z, r3, c5
dp3 r5.x, r3, c4
dp3 r3.x, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c15
mul r2, r2, r2
mov r5.z, r3.x
mov r5.y, r4.z
mov r5.w, c31.x
mad r0, r5.x, r1, r0
dp4 r4.xy, v0, c6
mad r2, r1, r1, r2
add r1, -r4.x, c17
mad r2, r1, r1, r2
mad r0, r3.x, r1, r0
mul r1, r2, c18
add r1, r1, c31.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r5.xyzz, r5.yzzx
mul r1.w, r4.z, r4.z
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r5.x, r5.x, -r1
mul r0.xyz, r1.w, c29
dp4 r2.z, r5, c25
dp4 r2.y, r5, c24
dp4 r2.x, r5, c23
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c14, r0
mov r0, c9
dp4 r3.y, c14, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c14, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c31.z
mul r1.y, r1, c12.x
mov r3.x, r4.w
mov r3.y, r4
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mov oT0.xyz, r3.wxyw
mov oT1.xyz, v3
"
}
}
Program "fp" {
// Platform d3d11 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_UvScaleP]
Float 6 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
MUL R0.xy, fragment.texcoord[0].xzzw, c[6].x;
MUL R1.xy, fragment.texcoord[0].xzzw, c[5].x;
MAD R0.w, fragment.texcoord[1].x, c[4].x, fragment.texcoord[1].x;
POW_SAT R0.w, R0.w, c[3].x;
MOV result.color.w, c[7].x;
TEX R0.xyz, R0, texture[1], 2D;
TEX R1.xyz, R1, texture[0], 2D;
MUL R1.xyz, R1, c[1];
MUL R0.xyz, R0, c[2];
ADD R0.xyz, R0, -R1;
MAD R0.xyz, R0.w, R0, R1;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R0.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[2].z, c[7].x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[7].y, R1;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_UvScaleP]
Float 6 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xyz
dcl t1.x
dcl t2.xyz
dcl t3.xyz
mov r0.y, t0.z
mov r0.x, t0
mul r1.xy, r0, c6.x
mov r0.y, t0.z
mov r0.x, t0
mul r0.xy, r0, c5.x
mov_pp r0.w, c7.x
texld r2, r0, s0
texld r3, r1, s1
mad_pp r0.x, t1, c4, t1
pow_pp_sat r1.w, r0.x, c3.x
mul r0.xyz, r3, c2
mul r2.xyz, r2, c1
add_pp r3.xyz, r0, -r2
mov_pp r0.x, r1.w
mad_pp r1.xyz, r0.x, r3, r2
mul_pp r2.xyz, r1, c0
max_pp r0.x, t2.z, c7
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mad_pp r0.xyz, r0, c7.y, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
Vector 1 [_Color2]
Float 2 [_Sharpness]
Float 3 [_Strength]
Float 4 [_UvScaleP]
Float 5 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[2], texture[2], 2D;
MUL R1.zw, fragment.texcoord[0].xyxz, c[5].x;
MUL R1.xy, fragment.texcoord[0].xzzw, c[4].x;
MUL R0.xyz, R0.w, R0;
MOV result.color.w, c[6].x;
TEX R2.xyz, R1.zwzw, texture[1], 2D;
TEX R1.xyz, R1, texture[0], 2D;
MAD R1.w, fragment.texcoord[1].x, c[3].x, fragment.texcoord[1].x;
MUL R1.xyz, R1, c[0];
MUL R2.xyz, R2, c[1];
ADD R2.xyz, R2, -R1;
POW_SAT R1.w, R1.w, c[2].x;
MAD R1.xyz, R1.w, R2, R1;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[6].y;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
Vector 1 [_Color2]
Float 2 [_Sharpness]
Float 3 [_Strength]
Float 4 [_UvScaleP]
Float 5 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 8.00000000, 0.00000000, 0, 0
dcl t0.xyz
dcl t1.x
dcl t2.xy
mov r1.y, t0.z
mov r1.x, t0
mul r2.xy, r1, c5.x
mov r0.y, t0.z
mov r0.x, t0
mul r0.xy, r0, c4.x
mov_pp r0.w, c6.y
texld r4, r0, s0
texld r3, r2, s1
texld r1, t2, s2
mad_pp r0.x, t1, c3, t1
pow_pp_sat r2.x, r0.x, c2.x
mul r0.xyz, r3, c1
mul r4.xyz, r4, c0
add_pp r3.xyz, r0, -r4
mov_pp r0.x, r2.x
mad_pp r0.xyz, r0.x, r3, r4
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c6.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_UvScaleP]
Float 6 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[4], texture[2], 2D;
MUL R0.zw, fragment.texcoord[0].xyxz, c[5].x;
MUL R0.xy, fragment.texcoord[0].xzzw, c[6].x;
MOV result.color.w, c[7].x;
TEX R1.xyz, R0.zwzw, texture[0], 2D;
TEX R0.xyz, R0, texture[1], 2D;
MAD R0.w, fragment.texcoord[1].x, c[4].x, fragment.texcoord[1].x;
MUL R1.xyz, R1, c[1];
MUL R0.xyz, R0, c[2];
ADD R0.xyz, R0, -R1;
POW_SAT R0.w, R0.w, c[3].x;
MAD R0.xyz, R0.w, R0, R1;
MUL R1.xyz, R0, fragment.texcoord[3];
MAX R0.w, fragment.texcoord[2].z, c[7].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R2.x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[7].y, R1;
END
# 18 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_UvScaleP]
Float 6 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xyz
dcl t1.x
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r4, t4, s2
mov r0.y, t0.z
mov r0.x, t0
mul r0.xy, r0, c5.x
mov r1.y, t0.z
mov r1.x, t0
mul r1.xy, r1, c6.x
mov_pp r0.w, c7.x
texld r2, r0, s0
texld r3, r1, s1
mad_pp r0.x, t1, c4, t1
pow_pp_sat r1.w, r0.x, c3.x
mul r0.xyz, r3, c2
mul r2.xyz, r2, c1
add_pp r3.xyz, r0, -r2
mov_pp r0.x, r1.w
mad_pp r1.xyz, r0.x, r3, r2
mul_pp r2.xyz, r1, c0
max_pp r0.x, t2.z, c7
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mad_pp r0.xyz, r0, c7.y, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
Vector 1 [_Color2]
Float 2 [_Sharpness]
Float 3 [_Strength]
Float 4 [_UvScaleP]
Float 5 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[2], texture[3], 2D;
TXP R4.x, fragment.texcoord[3], texture[2], 2D;
MUL R3.xyz, R0.w, R0;
MUL R0.xyz, R0, R4.x;
MUL R3.xyz, R3, c[6].y;
MUL R2.xy, fragment.texcoord[0].xzzw, c[5].x;
MUL R1.xy, fragment.texcoord[0].xzzw, c[4].x;
MUL R0.xyz, R0, c[6].z;
MAD R0.w, fragment.texcoord[1].x, c[3].x, fragment.texcoord[1].x;
MUL R4.xyz, R3, R4.x;
MIN R0.xyz, R3, R0;
MAX R0.xyz, R0, R4;
POW_SAT R0.w, R0.w, c[2].x;
MOV result.color.w, c[6].x;
TEX R1.xyz, R1, texture[0], 2D;
TEX R2.xyz, R2, texture[1], 2D;
MUL R1.xyz, R1, c[0];
MUL R2.xyz, R2, c[1];
ADD R2.xyz, R2, -R1;
MAD R1.xyz, R0.w, R2, R1;
MUL result.color.xyz, R1, R0;
END
# 21 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
Vector 1 [_Color2]
Float 2 [_Sharpness]
Float 3 [_Strength]
Float 4 [_UvScaleP]
Float 5 [_UvScaleS]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 8.00000000, 2.00000000, 0.00000000, 0
dcl t0.xyz
dcl t1.x
dcl t2.xy
dcl t3
texldp r5, t3, s2
mov r0.y, t0.z
mov r0.x, t0
mul r1.xy, r0, c5.x
mov r0.y, t0.z
mov r0.x, t0
mul r0.xy, r0, c4.x
texld r3, r0, s0
texld r2, r1, s1
texld r0, t2, s3
mul_pp r1.xyz, r0, r5.x
mul_pp r0.xyz, r0.w, r0
mul_pp r4.xyz, r1, c6.y
mul_pp r1.xyz, r0, c6.x
min_pp r4.xyz, r1, r4
mul_pp r5.xyz, r1, r5.x
mad_pp r0.x, t1, c3, t1
pow_pp_sat r1.x, r0.x, c2.x
mul r0.xyz, r2, c1
mul r3.xyz, r3, c0
add_pp r2.xyz, r0, -r3
mov_pp r0.x, r1.x
max_pp r4.xyz, r4, r5
mad_pp r0.xyz, r0.x, r2, r3
mul_pp r0.xyz, r0, r4
mov_pp r0.w, c6.z
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}