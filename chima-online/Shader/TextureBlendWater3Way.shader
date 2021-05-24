//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Texture Blend Water 3 Way" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Texture1 (VC=0) Base (RGB) BlendMask (A)", 2D) = "white" {}
 _Color2 ("Secondary Color", Color) = (1,1,1,1)
 _SecTex ("Texture2 (VC=R) Base (RGB)", 2D) = "white" {}
 _Strength ("Blend Strength", Range(0.1,10)) = 4
 _Sharpness ("Blend Sharpness", Range(1,20)) = 1
 _Water ("Water Normalmap (VC=G)", 2D) = "bump" {}
 _Cube ("Reflection Cubemap (VC=G)", CUBE) = "black" {}
 _ReflectColor ("Reflection Color", Color) = (1,1,1,1)
 _ReflectIntensity ("Reflection Intensity", Float) = 1
 _WaveScale ("Secondary Wave scale", Float) = 0.2
 _WaveSpeedU ("Wave Speed U", Float) = 0
 _WaveSpeedV ("Wave Speed V", Float) = 0
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
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_SecTex_ST]
Vector 25 [_Water_ST]
"!!ARBvp1.0
PARAM c[26] = { { 2, 1 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R3.xw, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R3.x;
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R3.x, R3.x;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MAD R0.y, R0.x, R0.x, -R0;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.y, c[21];
ADD result.texcoord[5].xyz, R3, R2;
MOV R0.y, R3.w;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R0.xyz, R1.w, R0;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
ADD R1.xyz, -R1, c[13];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.w, R0, R1;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[0].x, R1;
MOV R1, c[14];
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
MUL R2.xyz, R2, vertex.attrib[14].w;
DP3 result.texcoord[4].y, R3, R2;
MOV result.texcoord[3].xyz, -R0;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, R3, vertex.attrib[14];
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 52 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_MainTex_ST]
Vector 23 [_SecTex_ST]
Vector 24 [_Water_ST]
"vs_2_0
def c25, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r1.xyz, v2, c21.w
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
dp3 r2.yw, r1, c5
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r4.z, r1, c19
dp4 r4.x, r1, c17
dp4 r4.y, r1, c18
dp4 r3.z, r0, c16
dp4 r3.y, r0, c15
dp4 r3.x, r0, c14
mov r2.z, r0
mov r2.x, r0
dp3 r3.w, r2, r2
rsq r0.y, r3.w
mul r0.z, r2.w, r2.w
add r3.xyz, r3, r4
mul r2.xyz, r0.y, r2
mad r0.w, r0.x, r0.x, -r0.z
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
add r1.xyz, -r1, c12
dp3 r0.y, r1, r1
rsq r0.y, r0.y
mul r0.xyz, r0.y, r1
mul r1.xyz, r0.w, c20
dp3 r0.w, r2, r0
add oT5.xyz, r3, r1
mul r2.xyz, r2, r0.w
mad r3.xyz, -r2, c25.y, r0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r4.z, c13, r0
mul r2.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r4.y, c13, r0
dp4 r4.x, c13, r1
dp3 oT4.y, r4, r2
mov oT3.xyz, -r3
dp3 oT4.z, v2, r4
dp3 oT4.x, r4, v1
mov oT2.xyz, v4
mad oT0.zw, v3.xyxy, c23.xyxy, c23
mad oT0.xy, v3, c22, c22.zwzw
mad oT1.xy, v3, c24, c24.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
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
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_SecTex_ST]
Vector 19 [_Water_ST]
"!!ARBvp1.0
PARAM c[20] = { { 2 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MUL R2.xyz, vertex.normal, c[15].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R1.xyz, -R0, c[13];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.z, R2, c[7];
DP3 R0.x, R2, c[5];
DP3 R0.y, R2, c[6];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R0, R1;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[0].x, R1;
MOV result.texcoord[3].xyz, -R0;
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 27 instructions, 3 R-regs
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
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_SecTex_ST]
Vector 17 [_Water_ST]
"vs_2_0
def c18, 2.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r2.xyz, v2, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r1.xyz, -r0, c12
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r0.z, r2, c6
dp3 r0.x, r2, c4
dp3 r0.y, r2, c5
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
dp3 r0.w, r0, r1
mul r0.xyz, r0, r0.w
mad r0.xyz, -r0, c18.x, r1
mov oT3.xyz, -r0
mov oT2.xyz, v5
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
mad oT1.xy, v3, c17, c17.zwzw
mad oT4.xy, v4, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_MainTex_ST]
Vector 25 [_SecTex_ST]
Vector 26 [_Water_ST]
"!!ARBvp1.0
PARAM c[27] = { { 2, 1, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[23].w;
DP3 R3.xw, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R3.x;
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R3.x, R3.x;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
MAD R0.y, R0.x, R0.x, -R0;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.y, c[22];
ADD result.texcoord[5].xyz, R3, R2;
MOV R0.y, R3.w;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MOV R2.xyz, vertex.attrib[14];
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MUL R0.xyz, R1.w, R0;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
ADD R1.xyz, -R1, c[13];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.w, R0, R1;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[0].x, R1;
MOV R1, c[15];
MOV result.texcoord[3].xyz, -R0;
DP4 R3.z, R1, c[11];
DP4 R3.y, R1, c[10];
DP4 R3.x, R1, c[9];
MUL R2.xyz, R2, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[4].y, R3, R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, R3, vertex.attrib[14];
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[26], c[26].zwzw;
END
# 57 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_MainTex_ST]
Vector 25 [_SecTex_ST]
Vector 26 [_Water_ST]
"vs_2_0
def c27, 1.00000000, 0.50000000, 2.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r1.xyz, v2, c23.w
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
dp3 r2.yw, r1, c5
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r4.z, r1, c21
dp4 r4.x, r1, c19
dp4 r4.y, r1, c20
dp4 r3.z, r0, c18
dp4 r3.y, r0, c17
dp4 r3.x, r0, c16
mov r2.z, r0
mov r2.x, r0
dp3 r3.w, r2, r2
rsq r0.y, r3.w
mul r0.z, r2.w, r2.w
add r3.xyz, r3, r4
mul r2.xyz, r0.y, r2
mad r0.w, r0.x, r0.x, -r0.z
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
add r1.xyz, -r1, c12
dp3 r0.y, r1, r1
rsq r0.y, r0.y
mul r0.xyz, r0.y, r1
mul r1.xyz, r0.w, c22
dp3 r0.w, r2, r0
add oT5.xyz, r3, r1
mul r2.xyz, r2, r0.w
mad r3.xyz, -r2, c27.z, r0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r4.x, c15, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.y
mul r1.y, r1, c13.x
dp3 oT4.y, r4, r2
mov oT3.xyz, -r3
dp3 oT4.z, v2, r4
dp3 oT4.x, r4, v1
mad oT6.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT6.zw, r0
mov oT2.xyz, v4
mad oT0.zw, v3.xyxy, c25.xyxy, c25
mad oT0.xy, v3, c24, c24.zwzw
mad oT1.xy, v3, c26, c26.zwzw
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
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 16 [unity_Scale]
Vector 17 [unity_LightmapST]
Vector 18 [_MainTex_ST]
Vector 19 [_SecTex_ST]
Vector 20 [_Water_ST]
"!!ARBvp1.0
PARAM c[21] = { { 2, 0.5 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
MUL R2.xyz, vertex.normal, c[16].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R1.xyz, -R0, c[13];
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.z, R2, c[7];
DP3 R0.x, R2, c[5];
DP3 R0.y, R2, c[6];
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R0, R1;
MUL R0.xyz, R0, R0.w;
MAD R2.xyz, -R0, c[0].x, R1;
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].y;
MUL R0.y, R0, c[14].x;
MOV result.texcoord[3].xyz, -R2;
ADD result.texcoord[5].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[5].zw, R1;
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 32 instructions, 3 R-regs
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
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_SecTex_ST]
Vector 19 [_Water_ST]
"vs_2_0
def c20, 0.50000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r2.xyz, v2, c15.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r1.xyz, -r0, c12
dp3 r0.w, r1, r1
rsq r0.w, r0.w
mul r1.xyz, r0.w, r1
dp3 r0.z, r2, c6
dp3 r0.x, r2, c4
dp3 r0.y, r2, c5
dp3 r1.w, r0, r0
rsq r1.w, r1.w
mul r0.xyz, r1.w, r0
dp3 r0.w, r0, r1
mul r0.xyz, r0, r0.w
mad r2.xyz, -r0, c20.y, r1
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c20.x
mul r0.y, r0, c13.x
mov oT3.xyz, -r2
mad oT5.xy, r0.z, c14.zwzw, r0
mov oPos, r1
mov oT5.zw, r1
mov oT2.xyz, v5
mad oT0.zw, v3.xyxy, c18.xyxy, c18
mad oT0.xy, v3, c17, c17.zwzw
mad oT1.xy, v3, c19, c19.zwzw
mad oT4.xy, v4, c16, c16.zwzw
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
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
Vector 31 [_MainTex_ST]
Vector 32 [_SecTex_ST]
Vector 33 [_Water_ST]
"!!ARBvp1.0
PARAM c[34] = { { 2, 1, 0 },
		state.matrix.mvp,
		program.local[5..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R3.xyz, vertex.normal, c[30].w;
DP3 R4.xy, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.xy, R3, c[7];
DP4 R6.xy, vertex.position, c[6];
ADD R2, -R6.x, c[16];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.x, R2;
ADD R1, -R3.w, c[15];
DP4 R4.zw, vertex.position, c[7];
MUL R2, R2, R2;
MOV R5.z, R3.x;
MOV R5.y, R4.x;
MOV R5.w, c[0].y;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.z, c[17];
MAD R0, R3.x, R1, R0;
MAD R2, R1, R1, R2;
MUL R1, R2, c[18];
ADD R1, R1, c[0].y;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[25];
DP4 R2.y, R5, c[24];
DP4 R2.x, R5, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R5.xyzz, R5.yzzx;
MUL R1.w, R4.x, R4.x;
DP4 R5.w, R0, c[28];
DP4 R5.z, R0, c[27];
DP4 R5.y, R0, c[26];
MAD R1.w, R5.x, R5.x, -R1;
ADD R2.xyz, R2, R5.yzww;
MUL R0.xyz, R1.w, c[29];
ADD R0.xyz, R2, R0;
ADD result.texcoord[5].xyz, R0, R1;
MOV R0.z, R3.y;
MOV R0.x, R5;
MOV R0.y, R4;
DP3 R0.w, R0, R0;
MOV R3.x, R6.y;
MOV R3.z, R4.w;
ADD R2.xyz, -R3.wxzw, c[13];
DP3 R1.x, R2, R2;
RSQ R1.x, R1.x;
MUL R2.xyz, R1.x, R2;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
DP3 R0.w, R1, R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, R1, R0.w;
MAD R1.xyz, -R1, c[0].x, R2;
MUL R3.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R3;
MOV R0, c[14];
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MUL R2.xyz, R2, vertex.attrib[14].w;
DP3 result.texcoord[4].y, R3, R2;
MOV result.texcoord[3].xyz, -R1;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, R3, vertex.attrib[14];
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[33], c[33].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 84 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 30 [_MainTex_ST]
Vector 31 [_SecTex_ST]
Vector 32 [_Water_ST]
"vs_2_0
def c33, 2.00000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r3.xyz, v2, c29.w
dp3 r4.xy, r3, c5
dp3 r5.x, r3, c4
dp3 r3.xy, r3, c6
dp4 r6.xy, v0, c5
add r2, -r6.x, c15
mul r0, r4.x, r2
dp4 r4.zw, v0, c6
dp4 r3.w, v0, c4
add r1, -r3.w, c14
mul r2, r2, r2
mov r5.y, r4.x
mov r5.z, r3.x
mov r5.w, c33.y
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.z, c16
mad r0, r3.x, r1, r0
mad r2, r1, r1, r2
mul r1, r2, c17
add r1, r1, c33.y
mov r3.x, r6.y
mov r3.z, r4.w
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c24
dp4 r2.y, r5, c23
dp4 r2.x, r5, c22
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.z
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r5.xyzz, r5.yzzx
dp4 r5.w, r0, c27
dp4 r5.z, r0, c26
dp4 r5.y, r0, c25
mul r1.w, r4.x, r4.x
mad r0.w, r5.x, r5.x, -r1
add r0.xyz, r2, r5.yzww
mul r2.xyz, r0.w, c28
add r0.xyz, r0, r2
add r6.xyz, -r3.wxzw, c12
add oT5.xyz, r0, r1
dp3 r1.w, r6, r6
mov r2.z, r3.y
rsq r1.w, r1.w
mul r3.xyz, r1.w, r6
mov r2.y, r4
mov r2.x, r5
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3 r0.w, r2, r3
mul r1.xyz, r2, r0.w
mad r2.xyz, -r1, c33.x, r3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r4.z, c13, r0
mul r3.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r4.y, c13, r0
dp4 r4.x, c13, r1
dp3 oT4.y, r4, r3
mov oT3.xyz, -r2
dp3 oT4.z, v2, r4
dp3 oT4.x, r4, v1
mov oT2.xyz, v4
mad oT0.zw, v3.xyxy, c31.xyxy, c31
mad oT0.xy, v3, c30, c30.zwzw
mad oT1.xy, v3, c32, c32.zwzw
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
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Vector 32 [_MainTex_ST]
Vector 33 [_SecTex_ST]
Vector 34 [_Water_ST]
"!!ARBvp1.0
PARAM c[35] = { { 2, 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..34] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
MUL R3.xyz, vertex.normal, c[31].w;
DP3 R4.xy, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.xy, R3, c[7];
DP4 R6.xy, vertex.position, c[6];
ADD R2, -R6.x, c[17];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.x, R2;
ADD R1, -R3.w, c[16];
DP4 R4.zw, vertex.position, c[7];
MUL R2, R2, R2;
MOV R5.z, R3.x;
MOV R5.y, R4.x;
MOV R5.w, c[0].y;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.z, c[18];
MAD R0, R3.x, R1, R0;
MAD R2, R1, R1, R2;
MUL R1, R2, c[19];
ADD R1, R1, c[0].y;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[26];
DP4 R2.y, R5, c[25];
DP4 R2.x, R5, c[24];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R5.xyzz, R5.yzzx;
MUL R1.w, R4.x, R4.x;
DP4 R5.w, R0, c[29];
DP4 R5.z, R0, c[28];
DP4 R5.y, R0, c[27];
MAD R1.w, R5.x, R5.x, -R1;
ADD R2.xyz, R2, R5.yzww;
MUL R0.xyz, R1.w, c[30];
ADD R0.xyz, R2, R0;
ADD result.texcoord[5].xyz, R0, R1;
MOV R0.z, R3.y;
MOV R0.x, R5;
MOV R0.y, R4;
DP3 R0.w, R0, R0;
MOV R3.x, R6.y;
MOV R3.z, R4.w;
ADD R2.xyz, -R3.wxzw, c[13];
DP3 R1.x, R2, R2;
RSQ R1.x, R1.x;
MUL R2.xyz, R1.x, R2;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
DP3 R0.w, R1, R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, R1, R0.w;
MAD R1.xyz, -R1, c[0].x, R2;
MUL R3.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R2.xyz, vertex.normal.yzxw, R0.zxyw, -R3;
MOV R0, c[15];
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
MUL R2.xyz, R2, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV result.texcoord[3].xyz, -R1;
MUL R1.xyz, R0.xyww, c[0].w;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[4].y, R3, R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, R3, vertex.attrib[14];
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[2].xyz, vertex.color;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 89 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [_WorldSpaceLightPos0]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [unity_Scale]
Vector 32 [_MainTex_ST]
Vector 33 [_SecTex_ST]
Vector 34 [_Water_ST]
"vs_2_0
def c35, 2.00000000, 1.00000000, 0.00000000, 0.50000000
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r3.xyz, v2, c31.w
dp3 r4.xy, r3, c5
dp3 r5.x, r3, c4
dp3 r3.xy, r3, c6
dp4 r6.xy, v0, c5
add r2, -r6.x, c17
mul r0, r4.x, r2
dp4 r4.zw, v0, c6
dp4 r3.w, v0, c4
add r1, -r3.w, c16
mul r2, r2, r2
mov r5.y, r4.x
mov r5.z, r3.x
mov r5.w, c35.y
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.z, c18
mad r0, r3.x, r1, r0
mad r2, r1, r1, r2
mul r1, r2, c19
add r1, r1, c35.y
mov r3.x, r6.y
mov r3.z, r4.w
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c26
dp4 r2.y, r5, c25
dp4 r2.x, r5, c24
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.z
mul r0, r0, r1
mul r1.xyz, r0.y, c21
mad r1.xyz, r0.x, c20, r1
mad r0.xyz, r0.z, c22, r1
mad r1.xyz, r0.w, c23, r0
mul r0, r5.xyzz, r5.yzzx
dp4 r5.w, r0, c29
dp4 r5.z, r0, c28
dp4 r5.y, r0, c27
mul r1.w, r4.x, r4.x
mad r0.w, r5.x, r5.x, -r1
add r0.xyz, r2, r5.yzww
mul r2.xyz, r0.w, c30
add r0.xyz, r0, r2
add r6.xyz, -r3.wxzw, c12
add oT5.xyz, r0, r1
dp3 r1.w, r6, r6
mov r2.z, r3.y
rsq r1.w, r1.w
mul r3.xyz, r1.w, r6
mov r2.y, r4
mov r2.x, r5
dp3 r0.w, r2, r2
rsq r0.w, r0.w
mul r2.xyz, r0.w, r2
dp3 r0.w, r2, r3
mul r1.xyz, r2, r0.w
mad r2.xyz, -r1, c35.x, r3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r4.z, c15, r0
mov r0, c9
dp4 r4.y, c15, r0
mul r3.xyz, r1, v1.w
mov r1, c8
dp4 r4.x, c15, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c35.w
mul r1.y, r1, c13.x
dp3 oT4.y, r4, r3
mov oT3.xyz, -r2
dp3 oT4.z, v2, r4
dp3 oT4.x, r4, v1
mad oT6.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT6.zw, r0
mov oT2.xyz, v4
mad oT0.zw, v3.xyxy, c33.xyxy, c33
mad oT0.xy, v3, c32, c32.zwzw
mad oT1.xy, v3, c34, c34.zwzw
"
}
}
Program "fp" {
// Platform d3d11 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_Color2]
Float 4 [_Sharpness]
Float 5 [_Strength]
Float 6 [_WaveScale]
Float 7 [_WaveSpeedU]
Float 8 [_WaveSpeedV]
Vector 9 [_ReflectColor]
Float 10 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
"!!ARBfp1.0
PARAM c[12] = { program.local[0..10],
		{ 2, 1, 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
MOV R0.y, c[8].x;
MOV R0.x, c[7];
MUL R0.zw, R0.xyxy, c[0].x;
MAD R0.zw, fragment.texcoord[1].xyxy, c[6].x, R0;
MAD R0.xy, R0, c[0].x, fragment.texcoord[1];
MUL R2.xyz, R2, c[3];
MOV result.color.w, c[11];
TEX R1.yw, R0.zwzw, texture[2], 2D;
TEX R0.yw, R0, texture[2], 2D;
MAD R1.xy, R1.wyzw, c[11].x, -c[11].y;
MAD R0.xy, R0.wyzw, c[11].x, -c[11].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[11].y;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[11].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R0.xyz, R0, c[11].z;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R0.xyz, fragment.texcoord[3], R0;
TEX R1.xyz, R0, texture[3], CUBE;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.w, R0, c[5].x;
MAD R1.w, R0, fragment.texcoord[2].x, fragment.texcoord[2].x;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R1, c[9];
MAD R0.w, R0, fragment.texcoord[2].y, fragment.texcoord[2].y;
ADD R2.xyz, R2, -R0;
POW_SAT R1.w, R1.w, c[4].x;
MAD R0.xyz, R1.w, R2, R0;
MUL R2.xyz, R0, fragment.texcoord[5];
MUL R0.xyz, R0, c[1];
MAX R1.w, fragment.texcoord[4].z, c[11];
MUL R0.xyz, R1.w, R0;
MAD R0.xyz, R0, c[11].x, R2;
MUL R1.xyz, R1, c[10].x;
POW_SAT R0.w, R0.w, c[4].x;
MAD result.color.xyz, R1, R0.w, R0;
END
# 46 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_Color2]
Float 4 [_Sharpness]
Float 5 [_Strength]
Float 6 [_WaveScale]
Float 7 [_WaveSpeedU]
Float 8 [_WaveSpeedV]
Vector 9 [_ReflectColor]
Float 10 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c11, 2.00000000, -1.00000000, 1.00000000, 0.50000000
def c12, 0.00000000, 0, 0, 0
dcl t0
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
mov r0.y, c8.x
mov r0.x, c7
mul r1.xy, r0, c0.x
mad r1.xy, t1, c6.x, r1
mad r0.xy, r0, c0.x, t1
texld r1, r1, s2
texld r0, r0, s2
mov r0.x, r0.w
mov r1.x, r1.w
mad_pp r2.xy, r1, c11.x, c11.y
mad_pp r3.xy, r0, c11.x, c11.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c11.z
rsq_pp r4.x, r0.x
add_pp r1.x, -r1, c11.z
rsq_pp r0.x, r1.x
rcp_pp r2.z, r4.x
rcp_pp r3.z, r0.x
add_pp r0.xyz, r3, r2
mul_pp r1.xyz, r0, c11.w
dp3_pp r0.x, r1, r1
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r1
add r1.xyz, t3, r0
mov r0.y, t0.w
mov r0.x, t0.z
mov_pp r0.w, c12.x
texld r5, r1, s3
texld r2, r0, s1
texld r3, t0, s0
mul_pp r0.x, r3.w, c5
mad_pp r1.x, r0, t2, t2
pow_pp_sat r4.x, r1.x, c4.x
mul r1.xyz, r2, c3
mul r3.xyz, r3, c2
add_pp r2.xyz, r1, -r3
mov_pp r1.x, r4.x
mad_pp r1.xyz, r1.x, r2, r3
mul_pp r3.xyz, r1, t5
mul_pp r2.xyz, r1, c1
max_pp r1.x, t4.z, c12
mul_pp r1.xyz, r1.x, r2
mad_pp r2.xyz, r1, c11.x, r3
mad_pp r0.x, r0, t2.y, t2.y
pow_pp_sat r1.x, r0.x, c4.x
mul_pp r0.xyz, r5, c9
mul_pp r3.xyz, r0, c10.x
mov_pp r0.x, r1.x
mad_pp r0.xyz, r3, r0.x, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_WaveScale]
Float 6 [_WaveSpeedU]
Float 7 [_WaveSpeedV]
Vector 8 [_ReflectColor]
Float 9 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [unity_Lightmap] 2D 4
"!!ARBfp1.0
PARAM c[12] = { program.local[0..9],
		{ 8, 2, 1, 0.5 },
		{ 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
MOV R0.y, c[7].x;
MOV R0.x, c[6];
MUL R0.zw, R0.xyxy, c[0].x;
MAD R0.zw, fragment.texcoord[1].xyxy, c[5].x, R0;
MAD R0.xy, R0, c[0].x, fragment.texcoord[1];
MUL R2.xyz, R2, c[2];
MOV result.color.w, c[11].x;
TEX R1.yw, R0.zwzw, texture[2], 2D;
TEX R0.yw, R0, texture[2], 2D;
MAD R1.xy, R1.wyzw, c[10].y, -c[10].z;
MAD R0.xy, R0.wyzw, c[10].y, -c[10].z;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[10].z;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[10];
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R0.xyz, R0, c[10].w;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R0.xyz, fragment.texcoord[3], R0;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R3.xyz, R0, texture[3], CUBE;
TEX R0, fragment.texcoord[4], texture[4], 2D;
MUL R1.w, R1, c[4].x;
MAD R2.w, R1, fragment.texcoord[2].x, fragment.texcoord[2].x;
MUL R1.xyz, R1, c[1];
MAD R1.w, R1, fragment.texcoord[2].y, fragment.texcoord[2].y;
ADD R2.xyz, R2, -R1;
POW_SAT R2.w, R2.w, c[3].x;
MAD R1.xyz, R2.w, R2, R1;
MUL R2.xyz, R3, c[8];
MUL R0.xyz, R0.w, R0;
POW_SAT R1.w, R1.w, c[3].x;
MUL R2.xyz, R2, c[9].x;
MUL R2.xyz, R2, R1.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[10].x, R2;
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_WaveScale]
Float 6 [_WaveSpeedU]
Float 7 [_WaveSpeedV]
Vector 8 [_ReflectColor]
Float 9 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [unity_Lightmap] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c10, 2.00000000, -1.00000000, 1.00000000, 0.50000000
def c11, 8.00000000, 0.00000000, 0, 0
dcl t0
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xy
mov r0.y, c7.x
mov r0.x, c6
mul r1.xy, r0, c0.x
mad r1.xy, t1, c5.x, r1
mad r0.xy, r0, c0.x, t1
texld r1, r1, s2
texld r0, r0, s2
mov r0.x, r0.w
mov r1.x, r1.w
mad_pp r2.xy, r1, c10.x, c10.y
mad_pp r3.xy, r0, c10.x, c10.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c10.z
rsq_pp r4.x, r0.x
rcp_pp r2.z, r4.x
add_pp r1.x, -r1, c10.z
rsq_pp r0.x, r1.x
rcp_pp r3.z, r0.x
add_pp r0.xyz, r3, r2
mul_pp r1.xyz, r0, c10.w
dp3_pp r0.x, r1, r1
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r1
add r1.xyz, t3, r0
mov r0.y, t0.w
mov r0.x, t0.z
mov_pp r0.w, c11.y
texld r6, r1, s3
texld r3, r0, s1
texld r2, t4, s4
texld r4, t0, s0
mul_pp r0.x, r4.w, c4
mad_pp r1.x, r0, t2.y, t2.y
pow_pp_sat r5.w, r1.x, c3.x
mul_pp r1.xyz, r6, c8
mul_pp r6.xyz, r1, c9.x
mov_pp r1.x, r5.w
mad_pp r0.x, r0, t2, t2
mul_pp r5.xyz, r6, r1.x
pow_pp_sat r1.w, r0.x, c3.x
mul r0.xyz, r3, c2
mul r4.xyz, r4, c1
add_pp r3.xyz, r0, -r4
mov_pp r0.x, r1.w
mad_pp r0.xyz, r0.x, r3, r4
mul_pp r1.xyz, r2.w, r2
mul_pp r0.xyz, r1, r0
mad_pp r0.xyz, r0, c11.x, r5
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_Color2]
Float 4 [_Sharpness]
Float 5 [_Strength]
Float 6 [_WaveScale]
Float 7 [_WaveSpeedU]
Float 8 [_WaveSpeedV]
Vector 9 [_ReflectColor]
Float 10 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"!!ARBfp1.0
PARAM c[12] = { program.local[0..10],
		{ 2, 1, 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
TXP R3.x, fragment.texcoord[6], texture[4], 2D;
MOV R0.y, c[8].x;
MOV R0.x, c[7];
MUL R0.zw, R0.xyxy, c[0].x;
MAD R0.zw, fragment.texcoord[1].xyxy, c[6].x, R0;
MAD R0.xy, R0, c[0].x, fragment.texcoord[1];
MUL R2.xyz, R2, c[3];
MOV result.color.w, c[11];
TEX R1.yw, R0.zwzw, texture[2], 2D;
TEX R0.yw, R0, texture[2], 2D;
MAD R1.xy, R1.wyzw, c[11].x, -c[11].y;
MAD R0.xy, R0.wyzw, c[11].x, -c[11].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[11].y;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[11].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R0.xyz, R0, c[11].z;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R0.xyz, fragment.texcoord[3], R0;
TEX R1.xyz, R0, texture[3], CUBE;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.w, R0, c[5].x;
MAD R1.w, R0, fragment.texcoord[2].x, fragment.texcoord[2].x;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R1, c[9];
MAD R0.w, R0, fragment.texcoord[2].y, fragment.texcoord[2].y;
ADD R2.xyz, R2, -R0;
POW_SAT R1.w, R1.w, c[4].x;
MAD R0.xyz, R1.w, R2, R0;
MUL R2.xyz, R0, fragment.texcoord[5];
MAX R1.w, fragment.texcoord[4].z, c[11];
MUL R0.xyz, R0, c[1];
MUL R1.w, R1, R3.x;
MUL R0.xyz, R1.w, R0;
MAD R0.xyz, R0, c[11].x, R2;
MUL R1.xyz, R1, c[10].x;
POW_SAT R0.w, R0.w, c[4].x;
MAD result.color.xyz, R1, R0.w, R0;
END
# 48 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_Color2]
Float 4 [_Sharpness]
Float 5 [_Strength]
Float 6 [_WaveScale]
Float 7 [_WaveSpeedU]
Float 8 [_WaveSpeedV]
Vector 9 [_ReflectColor]
Float 10 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
def c11, 2.00000000, -1.00000000, 1.00000000, 0.50000000
def c12, 0.00000000, 0, 0, 0
dcl t0
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
dcl t6
texldp r6, t6, s4
mov r0.y, c8.x
mov r0.x, c7
mul r1.xy, r0, c0.x
mad r1.xy, t1, c6.x, r1
mad r0.xy, r0, c0.x, t1
texld r1, r1, s2
texld r0, r0, s2
mov r0.x, r0.w
mov r1.x, r1.w
mad_pp r2.xy, r1, c11.x, c11.y
mad_pp r3.xy, r0, c11.x, c11.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c11.z
rsq_pp r4.x, r0.x
add_pp r1.x, -r1, c11.z
rsq_pp r0.x, r1.x
rcp_pp r2.z, r4.x
rcp_pp r3.z, r0.x
add_pp r0.xyz, r3, r2
mul_pp r1.xyz, r0, c11.w
dp3_pp r0.x, r1, r1
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r1
add r1.xyz, t3, r0
mov r0.y, t0.w
mov r0.x, t0.z
mov_pp r0.w, c12.x
texld r5, r1, s3
texld r2, r0, s1
texld r3, t0, s0
mul_pp r0.x, r3.w, c5
mad_pp r1.x, r0, t2, t2
pow_pp_sat r4.x, r1.x, c4.x
mul r1.xyz, r2, c3
mul r3.xyz, r3, c2
add_pp r2.xyz, r1, -r3
mov_pp r1.x, r4.x
mad_pp r1.xyz, r1.x, r2, r3
mul_pp r3.xyz, r1, t5
mul_pp r2.xyz, r1, c1
max_pp r1.x, t4.z, c12
mul_pp r1.x, r1, r6
mul_pp r1.xyz, r1.x, r2
mad_pp r2.xyz, r1, c11.x, r3
mad_pp r0.x, r0, t2.y, t2.y
pow_pp_sat r1.x, r0.x, c4.x
mul_pp r0.xyz, r5, c9
mul_pp r3.xyz, r0, c10.x
mov_pp r0.x, r1.x
mad_pp r0.xyz, r3, r0.x, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_WaveScale]
Float 6 [_WaveSpeedU]
Float 7 [_WaveSpeedV]
Vector 8 [_ReflectColor]
Float 9 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [_ShadowMapTexture] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"!!ARBfp1.0
PARAM c[12] = { program.local[0..9],
		{ 8, 2, 1, 0.5 },
		{ 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
TXP R4.x, fragment.texcoord[5], texture[4], 2D;
MOV R0.y, c[7].x;
MOV R0.x, c[6];
MUL R0.zw, R0.xyxy, c[0].x;
MAD R0.zw, fragment.texcoord[1].xyxy, c[5].x, R0;
MAD R0.xy, R0, c[0].x, fragment.texcoord[1];
MUL R2.xyz, R2, c[2];
MOV result.color.w, c[11].x;
TEX R1.yw, R0.zwzw, texture[2], 2D;
TEX R0.yw, R0, texture[2], 2D;
MAD R1.xy, R1.wyzw, c[10].y, -c[10].z;
MAD R0.xy, R0.wyzw, c[10].y, -c[10].z;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[10].z;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[10];
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R0.xyz, R0, c[10].w;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
ADD R0.xyz, fragment.texcoord[3], R0;
TEX R3.xyz, R0, texture[3], CUBE;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[5], 2D;
MUL R0.w, R0, c[4].x;
MAD R2.w, R0, fragment.texcoord[2].x, fragment.texcoord[2].x;
MUL R0.xyz, R0, c[1];
MAD R0.w, R0, fragment.texcoord[2].y, fragment.texcoord[2].y;
ADD R2.xyz, R2, -R0;
POW_SAT R2.w, R2.w, c[3].x;
MAD R0.xyz, R2.w, R2, R0;
MUL R2.xyz, R3, c[8];
MUL R3.xyz, R1.w, R1;
MUL R1.xyz, R1, R4.x;
MUL R3.xyz, R3, c[10].x;
MUL R1.xyz, R1, c[10].y;
POW_SAT R0.w, R0.w, c[3].x;
MUL R2.xyz, R2, c[9].x;
MUL R2.xyz, R2, R0.w;
MUL R4.xyz, R3, R4.x;
MIN R1.xyz, R3, R1;
MAX R1.xyz, R1, R4;
MAD result.color.xyz, R0, R1, R2;
END
# 51 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_Color2]
Float 3 [_Sharpness]
Float 4 [_Strength]
Float 5 [_WaveScale]
Float 6 [_WaveSpeedU]
Float 7 [_WaveSpeedV]
Vector 8 [_ReflectColor]
Float 9 [_ReflectIntensity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_Water] 2D 2
SetTexture 3 [_Cube] CUBE 3
SetTexture 4 [_ShadowMapTexture] 2D 4
SetTexture 5 [unity_Lightmap] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
dcl_2d s4
dcl_2d s5
def c10, 8.00000000, 2.00000000, -1.00000000, 1.00000000
def c11, 0.50000000, 0.00000000, 0, 0
dcl t0
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xy
dcl t5
texldp r7, t5, s4
mov r0.y, c7.x
mov r0.x, c6
mul r1.xy, r0, c0.x
mad r1.xy, t1, c5.x, r1
mad r0.xy, r0, c0.x, t1
texld r1, r1, s2
texld r0, r0, s2
mov r0.x, r0.w
mov r1.x, r1.w
mad_pp r2.xy, r1, c10.y, c10.z
mad_pp r3.xy, r0, c10.y, c10.z
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c10.w
rsq_pp r4.x, r0.x
rcp_pp r2.z, r4.x
add_pp r1.x, -r1, c10.w
rsq_pp r0.x, r1.x
rcp_pp r3.z, r0.x
add_pp r0.xyz, r3, r2
mul_pp r1.xyz, r0, c11.x
dp3_pp r0.x, r1, r1
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r1
add r1.xyz, t3, r0
mov r0.y, t0.w
mov r0.x, t0.z
mov_pp r0.w, c11.y
texld r5, r1, s3
texld r3, r0, s1
texld r2, t4, s5
texld r4, t0, s0
mul_pp r0.x, r4.w, c4
mad_pp r1.x, r0, t2.y, t2.y
mul_pp r6.xyz, r5, c8
pow_pp_sat r5.x, r1.x, c3.x
mul r4.xyz, r4, c1
mad_pp r0.x, r0, t2, t2
mov_pp r1.x, r5.x
pow_pp_sat r5.x, r0.x, c3.x
mul r0.xyz, r3, c2
mul_pp r6.xyz, r6, c9.x
add_pp r3.xyz, r0, -r4
mov_pp r0.x, r5.x
mad_pp r0.xyz, r0.x, r3, r4
mul_pp r3.xyz, r2.w, r2
mul_pp r3.xyz, r3, c10.x
mul_pp r2.xyz, r2, r7.x
mul_pp r2.xyz, r2, c10.y
mul_pp r1.xyz, r6, r1.x
mul_pp r4.xyz, r3, r7.x
min_pp r2.xyz, r3, r2
max_pp r2.xyz, r2, r4
mad_pp r0.xyz, r0, r2, r1
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}