//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Water Basic Trans" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _Opacity ("Opacity", Float) = 1
 _BumpMap ("Wave Normalmap", 2D) = "bump" {}
 _UvAnimation ("Uv Animation: XY Bump, ZW Bump Copy", Vector) = (1,1,1,1)
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
//   Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 22 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1 },
		state.matrix.mvp,
		program.local[5..22] };
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 21 [_BumpMap_ST]
"vs_2_0
def c22, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r1.xyz, v2, c20.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.x
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
mad oT0.xy, v3, c21, c21.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 14 [unity_LightmapST]
Vector 15 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 7 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_LightmapST]
Vector 13 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mad oT0.xy, v3, c13, c13.zwzw
mad oT2.xy, v4, c12, c12.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v5.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 14 [unity_LightmapST]
Vector 15 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 7 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_LightmapST]
Vector 13 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mad oT0.xy, v3, c13, c13.zwzw
mad oT2.xy, v4, c12, c12.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v5.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 30 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[29].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[16];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[17];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
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
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[27];
DP4 R3.y, R0, c[26];
DP4 R3.x, R0, c[25];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[24];
DP4 R2.y, R4, c[23];
DP4 R2.x, R4, c[22];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[28];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 66 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 29 [_BumpMap_ST]
"vs_2_0
def c30, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r3.xyz, v2, c28.w
dp4 r0.x, v0, c5
add r1, -r0.x, c14
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c30.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c15
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c16
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.y
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mad r1.xyz, r0.w, c20, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c26
dp4 r3.y, r0, c25
dp4 r3.x, r0, c24
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c27
dp4 r2.z, r4, c23
dp4 r2.y, r4, c22
dp4 r2.x, r4, c21
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
mov r1, c9
mov r0, c8
dp4 r3.y, c12, r1
dp4 r3.x, c12, r0
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT0.xy, v3, c29, c29.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
MOV R1, c[3];
MUL R0.x, R1.w, c[0];
MUL R0.w, R1.y, c[0].x;
MUL R0.z, R1, c[0].x;
ADD R0.y, fragment.texcoord[0], R0.x;
ADD R0.x, fragment.texcoord[0], R0.z;
MUL R0.z, R1.x, c[0].x;
ADD R0.z, fragment.texcoord[0].x, R0;
ADD R0.w, fragment.texcoord[0].y, R0;
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R1.yw, R0.zwzw, texture[0], 2D;
TEX R0.w, R0, texture[0], 2D;
MOV R0.y, c[5].z;
MAD R1.xy, R1.wyzw, c[5].x, -c[5].y;
MAD R0.xy, R0.wyzw, c[5].x, -c[5].y;
MUL R0.zw, R1.xyxy, R1.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R0.xyxy, R0.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[5].y;
RSQ R1.z, R0.w;
ADD R0.z, -R0, c[5].y;
RSQ R0.w, R0.z;
RCP R0.z, R1.z;
RCP R1.z, R0.w;
ADD R0.xyz, R1, R0;
DP3 R0.x, R0, fragment.texcoord[2];
MOV R1.xyz, c[1];
MAX R0.w, R0.x, c[5].z;
MUL R0.xyz, R1, c[2];
MUL R1.xyz, fragment.texcoord[3], c[2];
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[5].x, R1;
END
# 33 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
"ps_2_0
dcl_2d s0
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0.xy
dcl t1.x
dcl t2.xyz
dcl t3.xyz
mov r1.x, c0
mul r1.x, c3.w, r1
add_pp r0.y, t0, r1.x
mov r0.x, c0
mul r0.x, c3.z, r0
add_pp r0.x, t0, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c3.y, r1
mul r2.x, c3, r2
add_pp r2.y, t0, r1.x
add_pp r2.x, t0, r2
texld r0, r0, s0
texld r1, r2, s0
mov_pp r0.y, c5.w
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c5.x, c5.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
mov r1.x, r1.w
mad_pp r1.xy, r1, c5.x, c5.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r2.x, -r2, c5.z
rsq_pp r2.x, r2.x
add_pp r3.x, -r3, c5.z
rsq_pp r3.x, r3.x
rcp_pp r0.z, r2.x
rcp_pp r1.z, r3.x
add_pp r0.xyz, r1, r0
dp3_pp r0.x, r0, t2
mov_pp r1.xyz, c2
mul_pp r2.xyz, c1, r1
max_pp r0.x, r0, c5.w
mul_pp r1.xyz, t3, c2
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c5.x, r1
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 1 [_Color]
Float 3 [_Opacity]
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 8 } };
TEMP R0;
TEX R0, fragment.texcoord[2], texture[1], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[1];
MUL result.color.xyz, R0, c[4].x;
MUL result.color.w, fragment.texcoord[1].x, c[3].x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Color]
Float 1 [_Opacity]
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s1
def c2, 8.00000000, 0, 0, 0
dcl t1.x
dcl t2.xy
texld r0, t2, s1
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c0
mul_pp r0.xyz, r0, c2.x
mul r0.w, t1.x, c1.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_UvAnimation]
Float 3 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..3],
		{ 2, 1, 0, 8 },
		{ -0.40824828, -0.70710677, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1, c[2];
MUL R0.x, R1.w, c[0];
MUL R0.w, R1.y, c[0].x;
MUL R0.z, R1, c[0].x;
ADD R0.y, fragment.texcoord[0], R0.x;
ADD R0.x, fragment.texcoord[0], R0.z;
MUL R0.z, R1.x, c[0].x;
ADD R0.z, fragment.texcoord[0].x, R0;
ADD R0.w, fragment.texcoord[0].y, R0;
MOV R2.y, c[4].z;
MUL result.color.w, fragment.texcoord[1].x, c[3].x;
TEX R3.yw, R0.zwzw, texture[0], 2D;
TEX R2.w, R0, texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[1], 2D;
TEX R1, fragment.texcoord[2], texture[2], 2D;
MAD R2.xy, R2.wyzw, c[4].x, -c[4].y;
MAD R3.xy, R3.wyzw, c[4].x, -c[4].y;
MUL R3.zw, R2.xyxy, R2.xyxy;
MUL R2.zw, R3.xyxy, R3.xyxy;
ADD_SAT R2.z, R2, R2.w;
ADD_SAT R3.z, R3, R3.w;
ADD R2.w, -R3.z, c[4].y;
RSQ R3.z, R2.w;
ADD R2.z, -R2, c[4].y;
RSQ R2.w, R2.z;
RCP R2.z, R3.z;
RCP R3.z, R2.w;
ADD R3.xyz, R3, R2;
DP3_SAT R2.z, R3, c[5];
DP3_SAT R2.y, R3, c[6];
DP3_SAT R2.x, R3, c[7];
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, R2;
DP3 R1.x, R1, c[4].w;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1.x;
MUL R0.xyz, R0, c[1];
MUL result.color.xyz, R0, c[4].w;
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Vector 2 [_UvAnimation]
Float 3 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, -0.40824828, -0.70710677, 0.57735026, 8.00000000
def c6, -0.40824831, 0.70710677, 0.57735026, 0
def c7, 0.81649655, 0.00000000, 0.57735026, 0
dcl t0.xy
dcl t1.x
dcl t2.xy
texld r3, t2, s1
mov r1.x, c0
mul r1.x, c2.w, r1
mov r0.x, c0
mov r2.x, c0
mul r2.x, c2.y, r2
add_pp r0.y, t0, r2.x
mul r0.x, c2.z, r0
add_pp r1.y, t0, r1.x
add_pp r1.x, t0, r0
mov r0.x, c0
mul r0.x, c2, r0
add_pp r0.x, t0, r0
texld r1, r1, s0
texld r0, r0, s0
texld r2, t2, s2
mov r0.x, r0.w
mov_pp r1.y, c4.w
mov_pp r1.x, r1.w
mad_pp r4.xy, r1, c4.x, c4.y
mad_pp r5.xy, r0, c4.x, c4.y
mul_pp r0.xy, r4, r4
add_pp_sat r0.x, r0, r0.y
mul_pp r1.xy, r5, r5
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c4.z
rsq_pp r0.x, r0.x
add_pp r1.x, -r1, c4.z
rsq_pp r1.x, r1.x
rcp_pp r4.z, r0.x
rcp_pp r5.z, r1.x
add_pp r1.xyz, r5, r4
dp3_pp_sat r0.z, r1, c5
dp3_pp_sat r0.y, r1, c6
dp3_pp_sat r0.x, r1, c7
mul_pp r1.xyz, r2.w, r2
mul_pp r0.xyz, r1, r0
dp3_pp r0.x, r0, c5.w
mul_pp r1.xyz, r3.w, r3
mul_pp r0.xyz, r1, r0.x
mul_pp r0.xyz, r0, c1
mul_pp r0.xyz, r0, c5.w
mul r0.w, t1.x, c3.x
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
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
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
Vector 18 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
mad oT0.xy, v3, c18, c18.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[11] = { program.local[0],
		state.matrix.mvp,
		program.local[5..10] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[9];
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 17 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c6
dp4 r3.z, c8, r0
mul r2.xyz, r1, v1.w
mov r0, c5
mov r1, c4
dp4 r3.y, c8, r0
dp4 r3.x, c8, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT0.xy, v3, c9, c9.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
Vector 18 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp4 r0.w, v0, c7
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.w, r0, c15
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
mad oT0.xy, v3, c18, c18.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
Vector 18 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
mad oT0.xy, v3, c18, c18.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[19] = { program.local[0],
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[17];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].x, vertex.color.w;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [_BumpMap_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c16, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
mad oT0.xy, v3, c17, c17.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.x, v4.w
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[3];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.w, R0, c[0].x;
MUL R0.z, R0, c[0].x;
ADD R0.y, fragment.texcoord[0], R0;
ADD R0.x, fragment.texcoord[0], R0;
ADD R0.w, fragment.texcoord[0].y, R0;
ADD R0.z, fragment.texcoord[0].x, R0;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R1.w, R0.zwzw, texture[0], 2D;
TEX R2.yw, R0, texture[0], 2D;
TEX R0.w, R1.x, texture[1], 2D;
MAD R0.xy, R2.wyzw, c[5].x, -c[5].y;
MUL R1.xy, R0, R0;
ADD_SAT R0.z, R1.x, R1.y;
MOV R1.y, c[5].z;
MAD R1.xy, R1.wyzw, c[5].x, -c[5].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.z, -R0, c[5].y;
RSQ R0.z, R0.z;
ADD R1.z, -R1, c[5].y;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.z, R1.z;
RSQ R1.w, R1.w;
RCP R1.z, R1.z;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R2.xyz, R1.w, fragment.texcoord[2];
DP3 R0.x, R0, R2;
MOV R1.xyz, c[1];
MAX R0.x, R0, c[5].z;
MUL R1.xyz, R1, c[2];
MUL R0.x, R0, R0.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[5].x;
END
# 38 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0.xy
dcl t1.x
dcl t2.xyz
dcl t3.xyz
dp3 r0.x, t3, t3
mov r3.xy, r0.x
mov r1.x, c0
mul r1.x, c3.w, r1
add_pp r0.y, t0, r1.x
mov r0.x, c0
mul r0.x, c3.z, r0
add_pp r0.x, t0, r0
mov r2.x, c0
mul r2.x, c3.y, r2
mov r1.x, c0
mul r1.x, c3, r1
add_pp r1.y, t0, r2.x
add_pp r1.x, t0, r1
texld r1, r1, s0
texld r4, r3, s1
texld r0, r0, s0
mov r0.y, r1
mov r0.x, r1.w
mad_pp r2.xy, r0, c5.x, c5.y
mul_pp r0.xy, r2, r2
add_pp_sat r0.x, r0, r0.y
mov_pp r0.y, c5.w
mov_pp r1.x, r0.w
mov_pp r1.y, r0
mad_pp r3.xy, r1, c5.x, c5.y
mul_pp r1.xy, r3, r3
add_pp r0.x, -r0, c5.z
rsq_pp r0.x, r0.x
add_pp_sat r1.x, r1, r1.y
rcp_pp r2.z, r0.x
add_pp r0.x, -r1, c5.z
rsq_pp r0.x, r0.x
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
rcp_pp r3.z, r0.x
mul_pp r0.xyz, r1.x, t2
add_pp r1.xyz, r2, r3
dp3_pp r0.x, r1, r0
mov_pp r1.xyz, c2
max_pp r0.x, r0, c5.w
mul_pp r1.xyz, c1, r1
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c5.x
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
MOV R1, c[3];
MUL R0.x, R1.w, c[0];
MUL R0.w, R1.y, c[0].x;
MUL R0.z, R1, c[0].x;
ADD R0.y, fragment.texcoord[0], R0.x;
ADD R0.x, fragment.texcoord[0], R0.z;
MUL R0.z, R1.x, c[0].x;
ADD R0.z, fragment.texcoord[0].x, R0;
ADD R0.w, fragment.texcoord[0].y, R0;
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R1.yw, R0.zwzw, texture[0], 2D;
TEX R0.w, R0, texture[0], 2D;
MOV R0.y, c[5].z;
MAD R1.xy, R1.wyzw, c[5].x, -c[5].y;
MAD R0.xy, R0.wyzw, c[5].x, -c[5].y;
MUL R0.zw, R1.xyxy, R1.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R0.xyxy, R0.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[5].y;
RSQ R1.z, R0.w;
ADD R0.z, -R0, c[5].y;
RSQ R0.w, R0.z;
RCP R0.z, R1.z;
RCP R1.z, R0.w;
ADD R0.xyz, R1, R0;
DP3 R0.x, R0, fragment.texcoord[2];
MOV R1.xyz, c[1];
MUL R1.xyz, R1, c[2];
MAX R0.x, R0, c[5].z;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[5].x;
END
# 32 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
"ps_2_0
dcl_2d s0
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0.xy
dcl t1.x
dcl t2.xyz
mov r1.x, c0
mul r1.x, c3.w, r1
add_pp r0.y, t0, r1.x
mov r0.x, c0
mul r0.x, c3.z, r0
add_pp r0.x, t0, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c3.y, r1
mul r2.x, c3, r2
add_pp r2.y, t0, r1.x
add_pp r2.x, t0, r2
texld r0, r0, s0
texld r1, r2, s0
mov_pp r0.y, c5.w
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c5.x, c5.y
mul_pp r2.xy, r0, r0
mov r1.x, r1.w
mad_pp r1.xy, r1, c5.x, c5.y
mul_pp r3.xy, r1, r1
add_pp_sat r2.x, r2, r2.y
add_pp_sat r3.x, r3, r3.y
add_pp r2.x, -r2, c5.z
add_pp r3.x, -r3, c5.z
rsq_pp r2.x, r2.x
rsq_pp r3.x, r3.x
rcp_pp r1.z, r3.x
rcp_pp r0.z, r2.x
add_pp r0.xyz, r1, r0
dp3_pp r0.x, r0, t2
mov_pp r1.xyz, c2
mul_pp r1.xyz, c1, r1
max_pp r0.x, r0, c5.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c5.x
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1, c[3];
MUL R0.x, R1.y, c[0];
ADD R0.w, fragment.texcoord[0].y, R0.x;
MUL R0.x, R1, c[0];
ADD R0.z, fragment.texcoord[0].x, R0.x;
MUL R0.x, R1.z, c[0];
MUL R0.y, R1.w, c[0].x;
ADD R1.y, fragment.texcoord[0], R0;
ADD R1.x, fragment.texcoord[0], R0;
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
RCP R0.y, fragment.texcoord[3].w;
MAD R0.xy, fragment.texcoord[3], R0.y, c[5].w;
MOV R2.y, c[5].z;
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R3.yw, R0.zwzw, texture[0], 2D;
TEX R2.w, R1, texture[0], 2D;
TEX R0.w, R0, texture[1], 2D;
TEX R1.w, R1.z, texture[2], 2D;
MAD R1.xy, R3.wyzw, c[5].x, -c[5].y;
MUL R0.xy, R1, R1;
ADD_SAT R0.z, R0.x, R0.y;
MAD R0.xy, R2.wyzw, c[5].x, -c[5].y;
MUL R2.xy, R0, R0;
ADD R0.z, -R0, c[5].y;
RSQ R0.z, R0.z;
ADD_SAT R2.x, R2, R2.y;
RCP R1.z, R0.z;
ADD R0.z, -R2.x, c[5].y;
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.z, R0.z;
RSQ R2.x, R2.x;
RCP R0.z, R0.z;
ADD R0.xyz, R1, R0;
MUL R2.xyz, R2.x, fragment.texcoord[2];
DP3 R0.x, R0, R2;
MAX R1.x, R0, c[5].z;
MOV R0.xyz, c[1];
SLT R1.y, c[5].z, fragment.texcoord[3].z;
MUL R0.w, R1.y, R0;
MUL R2.xyz, R0, c[2];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[5].x;
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c6, 0.50000000, 0, 0, 0
dcl t0.xy
dcl t1.x
dcl t2.xyz
dcl t3
rcp r1.x, t3.w
mad r3.xy, t3, r1.x, c6.x
dp3 r0.x, t3, t3
mov r4.xy, r0.x
mov r1.x, c0
mul r1.x, c3.w, r1
add_pp r2.y, t0, r1.x
mov r0.x, c0
mul r0.x, c3.z, r0
add_pp r2.x, t0, r0
mov r1.x, c0
mul r1.x, c3.y, r1
mov r0.x, c0
mul r0.x, c3, r0
add_pp r1.y, t0, r1.x
add_pp r1.x, t0, r0
texld r0, r3, s1
texld r1, r1, s0
texld r3, r2, s0
texld r4, r4, s2
mov_pp r3.y, c5.w
mov r0.y, r1
mov r0.x, r1.w
mad_pp r2.xy, r0, c5.x, c5.y
mul_pp r0.xy, r2, r2
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c5.z
rsq_pp r0.x, r0.x
mov_pp r1.y, r3
mov_pp r1.x, r3.w
mad_pp r3.xy, r1, c5.x, c5.y
mul_pp r1.xy, r3, r3
add_pp_sat r1.x, r1, r1.y
rcp_pp r2.z, r0.x
add_pp r0.x, -r1, c5.z
rsq_pp r0.x, r0.x
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
rcp_pp r3.z, r0.x
mul_pp r0.xyz, r1.x, t2
add_pp r1.xyz, r2, r3
dp3_pp r0.x, r1, r0
max_pp r0.x, r0, c5.w
mov_pp r2.xyz, c2
cmp r1.x, -t3.z, c5.w, c5.z
mul_pp r1.x, r1, r0.w
mul_pp r1.x, r1, r4
mul_pp r2.xyz, c1, r2
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c5.x
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.w, fragment.texcoord[3], texture[2], CUBE;
MOV R0, c[3];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.w, R0, c[0].x;
MUL R0.z, R0, c[0].x;
ADD R0.y, fragment.texcoord[0], R0;
ADD R0.x, fragment.texcoord[0], R0;
ADD R0.w, fragment.texcoord[0].y, R0;
ADD R0.z, fragment.texcoord[0].x, R0;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
MOV R2.y, c[5].z;
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R2.w, R0.zwzw, texture[0], 2D;
TEX R0.w, R1.x, texture[1], 2D;
TEX R3.yw, R0, texture[0], 2D;
MAD R1.xy, R3.wyzw, c[5].x, -c[5].y;
MUL R0.xy, R1, R1;
ADD_SAT R0.z, R0.x, R0.y;
MAD R0.xy, R2.wyzw, c[5].x, -c[5].y;
MUL R2.xy, R0, R0;
ADD R0.z, -R0, c[5].y;
RSQ R0.z, R0.z;
ADD_SAT R2.x, R2, R2.y;
RCP R1.z, R0.z;
ADD R0.z, -R2.x, c[5].y;
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.z, R0.z;
RSQ R2.x, R2.x;
RCP R0.z, R0.z;
ADD R0.xyz, R1, R0;
MUL R2.xyz, R2.x, fragment.texcoord[2];
DP3 R0.x, R0, R2;
MAX R1.x, R0, c[5].z;
MOV R0.xyz, c[1];
MUL R2.xyz, R0, c[2];
MUL R0.w, R0, R1;
MUL R0.x, R1, R0.w;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[5].x;
END
# 40 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0.xy
dcl t1.x
dcl t2.xyz
dcl t3.xyz
dp3 r0.x, t3, t3
mov r3.xy, r0.x
mov r1.x, c0
mul r1.x, c3.w, r1
mov r0.x, c0
mov r2.x, c0
mul r2.x, c3.y, r2
mul r0.x, c3.z, r0
add_pp r1.y, t0, r1.x
add_pp r1.x, t0, r0
mov r0.x, c0
mul r0.x, c3, r0
add_pp r2.y, t0, r2.x
add_pp r2.x, t0, r0
texld r1, r1, s0
texld r2, r2, s0
texld r4, r3, s1
texld r0, t3, s2
mov_pp r1.y, c5.w
mov_pp r1.x, r1.w
mad_pp r3.xy, r1, c5.x, c5.y
mul_pp r1.xy, r3, r3
add_pp_sat r1.x, r1, r1.y
mov r0.y, r2
mov r0.x, r2.w
mad_pp r2.xy, r0, c5.x, c5.y
mul_pp r0.xy, r2, r2
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c5.z
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
add_pp r0.x, -r1, c5.z
rsq_pp r0.x, r0.x
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
rcp_pp r3.z, r0.x
mul_pp r0.xyz, r1.x, t2
add_pp r1.xyz, r2, r3
dp3_pp r0.x, r1, r0
max_pp r0.x, r0, c5.w
mov_pp r2.xyz, c2
mul r1.x, r4, r0.w
mul_pp r2.xyz, c1, r2
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c5.x
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2.w, fragment.texcoord[3], texture[1], 2D;
MOV R0, c[3];
MUL R0.w, R0, c[0].x;
MUL R0.z, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.y, R0, c[0].x;
ADD R1.y, fragment.texcoord[0], R0.w;
ADD R1.x, fragment.texcoord[0], R0.z;
ADD R0.x, fragment.texcoord[0], R0;
ADD R0.y, fragment.texcoord[0], R0;
MUL result.color.w, fragment.texcoord[1].x, c[4].x;
TEX R1.w, R1, texture[0], 2D;
TEX R0.yw, R0, texture[0], 2D;
MAD R0.xy, R0.wyzw, c[5].x, -c[5].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
MOV R1.y, c[5].z;
MAD R1.xy, R1.wyzw, c[5].x, -c[5].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[5].y;
ADD R0.z, -R0, c[5].y;
RSQ R0.w, R0.w;
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
DP3 R0.x, R0, fragment.texcoord[2];
MOV R1.xyz, c[1];
MAX R0.x, R0, c[5].z;
MUL R1.xyz, R1, c[2];
MUL R0.x, R0, R2.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[5].x;
END
# 34 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Vector 3 [_UvAnimation]
Float 4 [_Opacity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0.xy
dcl t1.x
dcl t2.xyz
dcl t3.xy
mov r1.x, c0
mul r1.x, c3.w, r1
add_pp r2.y, t0, r1.x
mov r0.x, c0
mul r0.x, c3.z, r0
add_pp r2.x, t0, r0
mov r1.x, c0
mul r1.x, c3.y, r1
mov r0.x, c0
mul r0.x, c3, r0
add_pp r1.y, t0, r1.x
add_pp r1.x, t0, r0
texld r2, r2, s0
texld r1, r1, s0
texld r0, t3, s1
mov_pp r2.y, c5.w
mov_pp r0.y, r2
mov_pp r0.x, r2.w
mad_pp r2.xy, r0, c5.x, c5.y
mov r0.y, r1
mov r0.x, r1.w
mad_pp r3.xy, r0, c5.x, c5.y
mul_pp r0.xy, r2, r2
add_pp_sat r0.x, r0, r0.y
mul_pp r1.xy, r3, r3
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c5.z
rsq_pp r0.x, r0.x
add_pp r1.x, -r1, c5.z
rsq_pp r1.x, r1.x
rcp_pp r3.z, r1.x
rcp_pp r2.z, r0.x
add_pp r0.xyz, r3, r2
dp3_pp r0.x, r0, t2
max_pp r0.x, r0, c5.w
mul_pp r0.x, r0, r0.w
mov_pp r1.xyz, c2
mul_pp r1.xyz, c1, r1
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c5.x
mul r0.w, t1.x, c4.x
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}