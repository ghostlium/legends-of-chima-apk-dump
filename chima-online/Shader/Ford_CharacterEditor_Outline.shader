//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_CharacterEditor_Outline" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _Color1 ("Color1", Color) = (1,1,1,1)
 _Color2 ("Color2", Color) = (1,1,1,1)
 _Color3 ("Color3", Color) = (1,1,1,1)
 _Base_Mask ("Base_Mask UV1", 2D) = "black" {}
 _Detail ("Detail UV1", 2D) = "black" {}
 _Sticker ("Sticker UV1", 2D) = "black" {}
 _Sticker_Color1 ("Sticker_Color1 B", Color) = (1,1,1,1)
 _Sticker_Color2 ("Sticker_Color2 R", Color) = (1,1,1,1)
 _Sticker_Mask ("Sticker_Mask UV1", 2D) = "black" {}
 _Matcap1 ("Matcap1", 2D) = "black" {}
 _Occlusion ("Occlusion UV2", 2D) = "white" {}
 _GoodBad ("Good or Bad (0 or 1)", Float) = 1
}
SubShader { 
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 UsePass "Ford/Base_Passes/OUTLINE"
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ColorMask RGB
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
"!!ARBvp1.0
PARAM c[26] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[25].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[20];
DP4 R2.y, R0, c[19];
DP4 R2.x, R0, c[18];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[23];
DP4 R3.y, R1, c[22];
DP4 R3.x, R1, c[21];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[24];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
ADD result.texcoord[4].xyz, R3, R2;
MOV R1, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
"vs_2_0
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c24.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c23
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c13
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oD0, v5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c25.y, c25.y
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
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"!!ARBvp1.0
PARAM c[27] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[26].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[21];
DP4 R2.y, R0, c[20];
DP4 R2.x, R0, c[19];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[24];
DP4 R3.y, R1, c[23];
DP4 R3.x, R1, c[22];
MOV R1.xyz, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[25];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[18];
ADD result.texcoord[4].xyz, R3, R2;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.color, vertex.color;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"vs_2_0
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r1.xyz, v2, c26.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c21
dp4 r2.y, r0, c20
dp4 r2.x, r0, c19
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c24
dp4 r3.y, r1, c23
dp4 r3.x, r1, c22
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c25
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c13
dp4 r3.y, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.y
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oD0, v5
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c27.y, c27.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_4LightPosX0]
Vector 19 [unity_4LightPosY0]
Vector 20 [unity_4LightPosZ0]
Vector 21 [unity_4LightAtten0]
Vector 22 [unity_LightColor0]
Vector 23 [unity_LightColor1]
Vector 24 [unity_LightColor2]
Vector 25 [unity_LightColor3]
Vector 26 [unity_SHAr]
Vector 27 [unity_SHAg]
Vector 28 [unity_SHAb]
Vector 29 [unity_SHBr]
Vector 30 [unity_SHBg]
Vector 31 [unity_SHBb]
Vector 32 [unity_SHC]
Vector 33 [unity_Scale]
"!!ARBvp1.0
PARAM c[34] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[33].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[19];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[18];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[20];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[21];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[23];
MAD R1.xyz, R0.x, c[22], R1;
MAD R0.xyz, R0.z, c[24], R1;
MAD R1.xyz, R0.w, c[25], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[31];
DP4 R3.y, R0, c[30];
DP4 R3.x, R0, c[29];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[28];
DP4 R2.y, R4, c[27];
DP4 R2.x, R4, c[26];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[32];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[4].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[17];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 70 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [unity_Scale]
"vs_2_0
def c33, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r3.xyz, v2, c32.w
dp4 r0.x, v0, c9
add r1, -r0.x, c18
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c33.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c33.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.z
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c12
dp4 r3.x, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oD0, v5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c33.x, c33.x
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
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_4LightPosX0]
Vector 20 [unity_4LightPosY0]
Vector 21 [unity_4LightPosZ0]
Vector 22 [unity_4LightAtten0]
Vector 23 [unity_LightColor0]
Vector 24 [unity_LightColor1]
Vector 25 [unity_LightColor2]
Vector 26 [unity_LightColor3]
Vector 27 [unity_SHAr]
Vector 28 [unity_SHAg]
Vector 29 [unity_SHAb]
Vector 30 [unity_SHBr]
Vector 31 [unity_SHBg]
Vector 32 [unity_SHBb]
Vector 33 [unity_SHC]
Vector 34 [unity_Scale]
"!!ARBvp1.0
PARAM c[35] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..34] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[34].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[20];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[19];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[21];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[22];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[24];
MAD R1.xyz, R0.x, c[23], R1;
MAD R0.xyz, R0.z, c[25], R1;
MAD R1.xyz, R0.w, c[26], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[32];
DP4 R3.y, R0, c[31];
DP4 R3.x, R0, c[30];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[33];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[4].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[18];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.color, vertex.color;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 75 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_4LightPosX0]
Vector 20 [unity_4LightPosY0]
Vector 21 [unity_4LightPosZ0]
Vector 22 [unity_4LightAtten0]
Vector 23 [unity_LightColor0]
Vector 24 [unity_LightColor1]
Vector 25 [unity_LightColor2]
Vector 26 [unity_LightColor3]
Vector 27 [unity_SHAr]
Vector 28 [unity_SHAg]
Vector 29 [unity_SHAb]
Vector 30 [unity_SHBr]
Vector 31 [unity_SHBg]
Vector 32 [unity_SHBb]
Vector 33 [unity_SHC]
Vector 34 [unity_Scale]
"vs_2_0
def c35, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mul r3.xyz, v2, c34.w
dp4 r0.x, v0, c9
add r1, -r0.x, c20
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c19
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c35.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c21
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c22
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c35.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.z
mul r0, r0, r1
mul r1.xyz, r0.y, c24
mad r1.xyz, r0.x, c23, r1
mad r0.xyz, r0.z, c25, r1
mad r1.xyz, r0.w, c26, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c32
dp4 r3.y, r0, c31
dp4 r3.x, r0, c30
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c33
dp4 r2.z, r4, c29
dp4 r2.y, r4, c28
dp4 r2.x, r4, c27
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c12
dp4 r3.x, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c35.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oD0, v5
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c35.x, c35.x
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R2, fragment.texcoord[0], texture[2], 2D;
TEX R3, fragment.texcoord[0], texture[3], 2D;
TEX R4.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[2], texture[5], 2D;
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R7.xyz, R5.x, R6, c[1];
ADD R6.xyz, -R7, c[3];
MAD R7.xyz, R5.y, R6, R7;
ADD R6.xyz, -R3, c[5];
ADD R5.xyw, -R7.xyzz, c[4].xyzz;
MAD R3.xyz, R4.z, R6, R3;
MAD R5.xyz, R5.z, R5.xyww, R7;
ADD R6.xyz, R2, -R5;
ADD R2.xyz, -R3, c[6];
MAD R2.xyz, R4.x, R2, R3;
MAD R5.xyz, R2.w, R6, R5;
MUL R3.xyz, R1, R4.y;
ADD R2.xyz, R2, -R5;
MAD R2.xyz, R3.w, R2, R5;
MUL R1.xyz, R1, R2;
MUL R0.xyz, R0, R3;
MAD R2.xyz, R0, c[7].y, R1;
MUL R0.xyz, R1, fragment.color.primary;
MUL R1.xyz, R2, fragment.texcoord[4];
MUL R2.xyz, R2, c[0];
MAX R0.w, fragment.texcoord[3].z, c[7].x;
MUL R2.xyz, R0.w, R2;
MAD R1.xyz, R2, c[7].y, R1;
ADD result.color.xyz, R1, R0;
MOV result.color.w, c[7].z;
END
# 33 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c7, 0.00000000, 2.00000000, 1.00000000, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r0, t0, s1
texld r5, t2, s5
texld r4, t1, s0
texld r1, t0, s2
texld r3, t0, s4
texld r2, t0, s3
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r6.xyz, r0.z, r7, r6
add_pp r0.xyz, -r2, c5
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r6
add_pp r1.xyz, -r0, c6
mad_pp r0.xyz, r3.x, r1, r0
mad_pp r2.xyz, r1.w, r2, r6
add_pp r0.xyz, r0, -r2
mad_pp r0.xyz, r2.w, r0, r2
mul_pp r0.xyz, r4, r0
mul_pp r1.xyz, r4, r3.y
mul_pp r1.xyz, r5, r1
mad_pp r1.xyz, r1, c7.y, r0
mul_pp r2.xyz, r1, t4
mul_pp r1.xyz, r1, c0
max_pp r3.x, t3.z, c7
mul_pp r1.xyz, r3.x, r1
mad_pp r1.xyz, r1, c7.y, r2
mul r0.xyz, r0, v0
mov_pp r0.w, c7.z
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R2, fragment.texcoord[0], texture[2], 2D;
TEX R3, fragment.texcoord[0], texture[3], 2D;
TEX R4.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[2], texture[5], 2D;
TXP R6.x, fragment.texcoord[5], texture[6], 2D;
MOV R7.xyz, c[1];
ADD R7.xyz, -R7, c[2];
MAD R6.yzw, R5.x, R7.xxyz, c[1].xxyz;
ADD R7.xyz, -R6.yzww, c[3];
MAD R7.xyz, R5.y, R7, R6.yzww;
ADD R5.xyw, -R7.xyzz, c[4].xyzz;
MAD R5.xyz, R5.z, R5.xyww, R7;
ADD R7.xyz, R2, -R5;
ADD R6.yzw, -R3.xxyz, c[5].xxyz;
MAD R3.xyz, R4.z, R6.yzww, R3;
ADD R2.xyz, -R3, c[6];
MAX R0.w, fragment.texcoord[3].z, c[7].x;
MAD R2.xyz, R4.x, R2, R3;
MAD R5.xyz, R2.w, R7, R5;
ADD R2.xyz, R2, -R5;
MAD R3.xyz, R3.w, R2, R5;
MUL R2.xyz, R1, R4.y;
MUL R0.xyz, R0, R2;
MUL R1.xyz, R1, R3;
MAD R0.xyz, R0, c[7].y, R1;
MUL R2.xyz, R0, fragment.texcoord[4];
MUL R1.xyz, R1, fragment.color.primary;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R6.x;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[7].y, R2;
ADD result.color.xyz, R0, R1;
MOV result.color.w, c[7].z;
END
# 35 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c7, 0.00000000, 2.00000000, 1.00000000, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r0, t0, s1
texldp r8, t5, s6
texld r5, t2, s5
texld r4, t1, s0
texld r1, t0, s2
texld r3, t0, s4
texld r2, t0, s3
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r6.xyz, r0.z, r7, r6
add_pp r0.xyz, -r2, c5
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r6
add_pp r1.xyz, -r0, c6
mad_pp r2.xyz, r1.w, r2, r6
mad_pp r0.xyz, r3.x, r1, r0
add_pp r0.xyz, r0, -r2
mad_pp r0.xyz, r2.w, r0, r2
mul_pp r1.xyz, r4, r0
mul_pp r0.xyz, r4, r3.y
mul_pp r0.xyz, r5, r0
mad_pp r0.xyz, r0, c7.y, r1
mul_pp r3.xyz, r0, t4
mul_pp r2.xyz, r0, c0
max_pp r0.x, t3.z, c7
mul_pp r0.x, r0, r8
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c7.y, r3
mul r1.xyz, r1, v0
mov_pp r0.w, c7.z
add_pp r0.xyz, r0, r1
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
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
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..13] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[13];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mov r0, c9
dp4 r3.y, c12, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c12, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c13.x, c13.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[12];
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].w, R0, c[20];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp4 r0.w, v0, c11
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.z, v0, c10
dp4 oT4.w, r0, c19
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[22] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[21];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
"vs_2_0
def c21, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c20, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c21.x, c21.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R2, fragment.texcoord[0], texture[3], 2D;
TEX R4.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R3, fragment.texcoord[0], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[2], texture[5], 2D;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R7.xyz, R5.x, R6, c[1];
ADD R6.xyz, -R7, c[3];
MAD R7.xyz, R5.y, R6, R7;
ADD R6.xyz, -R2, c[5];
MAD R2.xyz, R4.z, R6, R2;
ADD R5.xyw, -R7.xyzz, c[4].xyzz;
MAD R5.xyz, R5.z, R5.xyww, R7;
ADD R3.xyz, R3, -R5;
ADD R6.xyz, -R2, c[6];
MAD R2.xyz, R4.x, R6, R2;
MAD R3.xyz, R3.w, R3, R5;
MUL R4.xyz, R0, R4.y;
ADD R2.xyz, R2, -R3;
MUL R1.xyz, R1, R4;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R1.xyz, R1, c[7].y;
MAD R2.xyz, R2.w, R2, R3;
MAD R0.xyz, R0, R2, R1;
RSQ R1.w, R1.w;
MUL R1.x, R1.w, fragment.texcoord[3].z;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[7];
MOV result.color.w, c[7].x;
TEX R0.w, R0.w, texture[6], 2D;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[7].y;
END
# 36 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r4, t2, s5
texld r5, t1, s0
texld r1, t0, s2
texld r3, t0, s4
texld r2, t0, s3
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
texld r8, r0, s6
texld r0, t0, s1
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r6.xyz, r0.z, r7, r6
add_pp r0.xyz, -r2, c5
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r6
add_pp r1.xyz, -r0, c6
mad_pp r0.xyz, r3.x, r1, r0
mad_pp r2.xyz, r1.w, r2, r6
add_pp r0.xyz, r0, -r2
mad_pp r2.xyz, r2.w, r0, r2
mul_pp r1.xyz, r5, r3.y
mul_pp r1.xyz, r4, r1
mul_pp r1.xyz, r1, c7.y
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
mad_pp r1.xyz, r5, r2, r1
max_pp r0.x, r0.z, c7
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r8
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c7.y
mov_pp r0.w, c7.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R4.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[3], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R1, fragment.texcoord[0], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R5.xyz, fragment.texcoord[2], texture[5], 2D;
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R6.xyz, R4.x, R6, c[1];
ADD R7.xyz, -R6, c[3];
MAD R6.xyz, R4.y, R7, R6;
ADD R7.xyz, -R6, c[4];
MAD R6.xyz, R4.z, R7, R6;
ADD R4.xyz, -R0, c[5];
ADD R1.xyz, R1, -R6;
MAD R0.xyz, R3.z, R4, R0;
MAD R4.xyz, R1.w, R1, R6;
ADD R1.xyz, -R0, c[6];
MAD R0.xyz, R3.x, R1, R0;
MUL R6.xyz, R2, R3.y;
MUL R1.xyz, R5, R6;
ADD R0.xyz, R0, -R4;
MUL R1.xyz, R1, c[7].y;
MAD R0.xyz, R0.w, R0, R4;
MAD R0.xyz, R2, R0, R1;
MUL R1.xyz, R0, c[0];
MAX R0.x, fragment.texcoord[3].z, c[7];
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[7].y;
MOV result.color.w, c[7].x;
END
# 30 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
texld r0, t0, s1
texld r3, t2, s5
texld r5, t1, s0
texld r4, t0, s4
texld r1, t0, s2
texld r2, t0, s3
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r0.xyz, r0.z, r7, r6
add_pp r6.xyz, r1, -r0
add_pp r1.xyz, -r2, c5
mad_pp r1.xyz, r4.z, r1, r2
mad_pp r2.xyz, r1.w, r6, r0
add_pp r0.xyz, -r1, c6
mad_pp r0.xyz, r4.x, r0, r1
add_pp r0.xyz, r0, -r2
mul_pp r1.xyz, r5, r4.y
mul_pp r1.xyz, r3, r1
mul_pp r1.xyz, r1, c7.y
mad_pp r0.xyz, r2.w, r0, r2
mad_pp r0.xyz, r5, r0, r1
mul_pp r1.xyz, r0, c0
max_pp r0.x, t3.z, c7
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c7.y
mov_pp r0.w, c7.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
SetTexture 7 [_LightTextureB0] 2D 7
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R4.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R2, fragment.texcoord[0], texture[3], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R3, fragment.texcoord[0], texture[2], 2D;
TEX R5.xyz, fragment.texcoord[2], texture[5], 2D;
RCP R0.x, fragment.texcoord[4].w;
MAD R6.xy, fragment.texcoord[4], R0.x, c[7].y;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[7].x;
TEX R1.w, R6, texture[6], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R0.w, R0.w, texture[7], 2D;
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R6.xyz, R4.x, R6, c[1];
ADD R7.xyz, -R6, c[3];
MAD R6.xyz, R4.y, R7, R6;
ADD R7.xyz, -R6, c[4];
MAD R6.xyz, R4.z, R7, R6;
ADD R4.xyz, -R2, c[5];
MAD R2.xyz, R1.z, R4, R2;
ADD R3.xyz, R3, -R6;
MAD R4.xyz, R3.w, R3, R6;
MUL R6.xyz, R0, R1.y;
ADD R3.xyz, -R2, c[6];
MAD R1.xyz, R1.x, R3, R2;
MUL R2.xyz, R5, R6;
ADD R1.xyz, R1, -R4;
MAD R1.xyz, R2.w, R1, R4;
MUL R2.xyz, R2, c[7].z;
MAD R0.xyz, R0, R1, R2;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R1.x;
SLT R1.y, c[7].x, fragment.texcoord[4].z;
MUL R1.y, R1, R1.w;
MUL R1.y, R1, R0.w;
MUL R1.x, R1, fragment.texcoord[3].z;
MAX R0.w, R1.x, c[7].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[7].z;
END
# 42 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
SetTexture 7 [_LightTextureB0] 2D 7
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c7, 0.00000000, 1.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4
texld r3, t2, s5
texld r5, t1, s0
texld r4, t0, s4
texld r2, t0, s3
dp3 r1.x, t4, t4
mov r1.xy, r1.x
rcp r0.x, t4.w
mad r0.xy, t4, r0.x, c7.z
texld r6, r0, s6
texld r8, r1, s7
texld r0, t0, s1
texld r1, t0, s2
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r0.xyz, r0.z, r7, r6
add_pp r6.xyz, r1, -r0
add_pp r1.xyz, -r2, c5
mad_pp r1.xyz, r4.z, r1, r2
mad_pp r2.xyz, r1.w, r6, r0
add_pp r0.xyz, -r1, c6
mad_pp r0.xyz, r4.x, r0, r1
add_pp r0.xyz, r0, -r2
mul_pp r1.xyz, r5, r4.y
mul_pp r1.xyz, r3, r1
mad_pp r0.xyz, r2.w, r0, r2
mul_pp r1.xyz, r1, c7.w
mad_pp r0.xyz, r5, r0, r1
mul_pp r2.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
cmp r1.x, -t4.z, c7, c7.y
mul_pp r1.x, r1, r6.w
mul_pp r0.x, r1, r8
max_pp r1.x, r0.z, c7
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c7.w
mov_pp r0.w, c7.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
SetTexture 7 [_LightTexture0] CUBE 7
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R2, fragment.texcoord[0], texture[3], 2D;
TEX R3, fragment.texcoord[0], texture[2], 2D;
TEX R4.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[2], texture[5], 2D;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R7.xyz, R5.x, R6, c[1];
ADD R6.xyz, -R7, c[3];
MAD R5.xyw, R5.y, R6.xyzz, R7.xyzz;
ADD R6.xyz, -R2, c[5];
ADD R7.xyz, -R5.xyww, c[4];
MAD R6.xyz, R4.z, R6, R2;
MAD R5.xyz, R5.z, R7, R5.xyww;
ADD R2.xyz, R3, -R5;
ADD R3.xyz, -R6, c[6];
MAD R3.xyz, R4.x, R3, R6;
MAD R2.xyz, R3.w, R2, R5;
MUL R4.xyz, R0, R4.y;
ADD R3.xyz, R3, -R2;
MAD R2.xyz, R2.w, R3, R2;
MUL R1.xyz, R1, R4;
MUL R1.xyz, R1, c[7].y;
MAD R0.xyz, R0, R2, R1;
DP3 R2.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.w;
MUL R1.x, R1, fragment.texcoord[3].z;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[7];
MOV result.color.w, c[7].x;
TEX R1.w, R0.w, texture[6], 2D;
TEX R0.w, fragment.texcoord[4], texture[7], CUBE;
MUL R0.w, R1, R0;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[7].y;
END
# 38 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
SetTexture 7 [_LightTexture0] CUBE 7
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_cube s7
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r6, t4, s7
texld r3, t2, s5
texld r5, t1, s0
texld r4, t0, s4
texld r1, t0, s2
texld r2, t0, s3
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
texld r8, r0, s6
texld r0, t0, s1
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r0.xyz, r0.z, r7, r6
add_pp r6.xyz, r1, -r0
add_pp r1.xyz, -r2, c5
mad_pp r1.xyz, r4.z, r1, r2
mad_pp r2.xyz, r1.w, r6, r0
add_pp r0.xyz, -r1, c6
mad_pp r0.xyz, r4.x, r0, r1
add_pp r0.xyz, r0, -r2
mul_pp r1.xyz, r5, r4.y
mul_pp r1.xyz, r3, r1
mad_pp r0.xyz, r2.w, r0, r2
mul_pp r1.xyz, r1, c7.y
mad_pp r0.xyz, r5, r0, r1
mul_pp r1.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
max_pp r2.x, r0.z, c7
mul r0.x, r8, r6.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c7.y
mov_pp r0.w, c7.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R4.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[3], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[4], 2D;
TEX R1, fragment.texcoord[0], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], 2D;
TEX R5.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R2.w, fragment.texcoord[4], texture[6], 2D;
MOV R6.xyz, c[1];
ADD R6.xyz, -R6, c[2];
MAD R6.xyz, R4.x, R6, c[1];
ADD R7.xyz, -R6, c[3];
MAD R6.xyz, R4.y, R7, R6;
ADD R7.xyz, -R6, c[4];
MAD R6.xyz, R4.z, R7, R6;
ADD R4.xyz, -R0, c[5];
ADD R1.xyz, R1, -R6;
MAD R0.xyz, R3.z, R4, R0;
MAD R4.xyz, R1.w, R1, R6;
ADD R1.xyz, -R0, c[6];
MAD R0.xyz, R3.x, R1, R0;
MUL R6.xyz, R2, R3.y;
MUL R1.xyz, R5, R6;
ADD R0.xyz, R0, -R4;
MUL R1.xyz, R1, c[7].y;
MAD R0.xyz, R0.w, R0, R4;
MAD R0.xyz, R2, R0, R1;
MUL R1.xyz, R0, c[0];
MAX R0.x, fragment.texcoord[3].z, c[7];
MUL R0.x, R0, R2.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[7].y;
MOV result.color.w, c[7].x;
END
# 32 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_Color1]
Vector 3 [_Color2]
Vector 4 [_Color3]
Vector 5 [_Sticker_Color1]
Vector 6 [_Sticker_Color2]
SetTexture 0 [_Occlusion] 2D 0
SetTexture 1 [_Base_Mask] 2D 1
SetTexture 2 [_Detail] 2D 2
SetTexture 3 [_Sticker] 2D 3
SetTexture 4 [_Sticker_Mask] 2D 4
SetTexture 5 [_Matcap1] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c7, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xy
texld r6, t4, s6
texld r0, t0, s1
texld r3, t2, s5
texld r5, t1, s0
texld r4, t0, s4
texld r1, t0, s2
texld r2, t0, s3
mov_pp r6.xyz, c2
add_pp r6.xyz, -c1, r6
mad_pp r6.xyz, r0.x, r6, c1
add_pp r7.xyz, -r6, c3
mad_pp r6.xyz, r0.y, r7, r6
add_pp r7.xyz, -r6, c4
mad_pp r0.xyz, r0.z, r7, r6
add_pp r6.xyz, r1, -r0
add_pp r1.xyz, -r2, c5
mad_pp r1.xyz, r4.z, r1, r2
mad_pp r2.xyz, r1.w, r6, r0
add_pp r0.xyz, -r1, c6
mad_pp r0.xyz, r4.x, r0, r1
add_pp r0.xyz, r0, -r2
mul_pp r1.xyz, r5, r4.y
mul_pp r1.xyz, r3, r1
mul_pp r1.xyz, r1, c7.y
mad_pp r0.xyz, r2.w, r0, r2
mad_pp r0.xyz, r5, r0, r1
mul_pp r1.xyz, r0, c0
max_pp r0.x, t3.z, c7
mul_pp r0.x, r0, r6.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c7.y
mov_pp r0.w, c7.x
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}