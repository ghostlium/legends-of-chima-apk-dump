//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_BlueprintV2" {
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
}
SubShader { 
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[14] = { { 0 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[3].xyz, c[0].x;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
"vs_2_0
def c13, 0.00000000, 0, 0, 0
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
mul r2.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r3.y, c12, r0
dp4 r3.x, c12, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT3.xyz, c13.x
mov oT0.xy, v3
mov oT1.xy, v4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[15] = { { 0.5, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[14];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[3].xyz, c[0].y;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
"vs_2_0
def c15, 0.50000000, 0.00000000, 0, 0
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
mul r1.xyz, r0.xyww, c15.x
mul r1.y, r1, c12.x
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mov oT3.xyz, c15.y
mov oT0.xy, v3
mov oT1.xy, v4
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R3.xyz, vertex.normal, c[22].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
DP3 R0.y, R3, c[6];
MUL R2, R1, R0.y;
DP3 R3.w, R3, c[5];
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MAD R2, R0, R3.w, R2;
MUL R1, R1, R1;
MAD R1, R0, R0, R1;
DP4 R3.w, vertex.position, c[7];
ADD R0, -R3.w, c[16];
MAD R1, R0, R0, R1;
DP3 R3.x, R3, c[7];
MAD R0, R0, R3.x, R2;
MUL R2, R1, c[17];
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.z, R1.z;
MAX R0, R0, c[0].x;
RCP R1.w, R1.w;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R2.xyz, R0.x, c[18], R1;
MAD R2.xyz, R0.z, c[20], R2;
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MAD result.texcoord[3].xyz, R0.w, c[21], R2;
MOV R0, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 50 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.00000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c21.w
dp4 r0.x, v0, c5
add r1, -r0.x, c14
dp3 r0.y, r3, c5
dp3 r3.w, r3, c4
mul r2, r1, r0.y
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mad r2, r0, r3.w, r2
mul r1, r1, r1
dp3 r3.x, r3, c6
mad r1, r0, r0, r1
dp4 r3.w, v0, c6
add r0, -r3.w, c15
mad r1, r0, r0, r1
mad r0, r0, r3.x, r2
mul r2, r1, c16
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c22.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c22.x
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r1.xyz, r0.z, c19, r1
mov r0.xyz, v1
mad oT3.xyz, r0.w, c20, r1
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
mov oT0.xy, v3
mov oT1.xy, v4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0, 1, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R3.xyz, vertex.normal, c[23].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R0.y, R3, c[6];
MUL R2, R1, R0.y;
DP3 R3.w, R3, c[5];
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MAD R2, R0, R3.w, R2;
MUL R1, R1, R1;
MAD R1, R0, R0, R1;
DP4 R3.w, vertex.position, c[7];
ADD R0, -R3.w, c[17];
MAD R1, R0, R0, R1;
DP3 R3.x, R3, c[7];
MAD R0, R0, R3.x, R2;
MUL R2, R1, c[18];
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.z, R1.z;
MAX R0, R0, c[0].x;
RCP R1.w, R1.w;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R2.xyz, R0.x, c[19], R1;
MAD R2.xyz, R0.z, c[21], R2;
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MAD result.texcoord[3].xyz, R0.w, c[22], R2;
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
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 55 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
Vector 23 [unity_Scale]
"vs_2_0
def c24, 0.00000000, 1.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c23.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r0.y, r3, c5
dp3 r3.w, r3, c4
mul r2, r1, r0.y
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mad r2, r0, r3.w, r2
mul r1, r1, r1
dp3 r3.x, r3, c6
mad r1, r0, r0, r1
dp4 r3.w, v0, c6
add r0, -r3.w, c17
mad r1, r0, r0, r1
mad r0, r0, r3.x, r2
mul r2, r1, c18
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c24.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c24.x
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r1.xyz, r0.z, c21, r1
mov r0.xyz, v1
mad oT3.xyz, r0.w, c22, r1
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
mul r1.xyz, r0.xyww, c24.z
mul r1.y, r1, c12.x
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
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
SetTexture 0 [_Base_Mask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_Sticker] 2D 2
SetTexture 3 [_Sticker_Mask] 2D 3
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[2], 2D;
TEX R2.xz, fragment.texcoord[0], texture[3], 2D;
MOV R4.xyz, c[1];
ADD R4.xyz, -R4, c[2];
MAD R5.xyz, R3.x, R4, c[1];
ADD R4.xyz, -R5, c[3];
MAD R5.xyz, R3.y, R4, R5;
ADD R4.xyz, -R1, c[5];
ADD R3.xyw, -R5.xyzz, c[4].xyzz;
MAD R1.xyz, R2.z, R4, R1;
MAD R3.xyz, R3.z, R3.xyww, R5;
ADD R4.xyz, R0, -R3;
MAD R3.xyz, R0.w, R4, R3;
ADD R0.xyz, -R1, c[6];
MAD R0.xyz, R2.x, R0, R1;
ADD R0.xyz, R0, -R3;
MAD R0.xyz, R1.w, R0, R3;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R2.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[2].z, c[7].x;
MUL R2.xyz, R0.w, R2;
MAD R1.xyz, R2, c[7].y, R1;
ADD result.color.xyz, R1, R0;
MOV result.color.w, c[7].z;
END
# 26 instructions, 6 R-regs
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
SetTexture 0 [_Base_Mask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_Sticker] 2D 2
SetTexture 3 [_Sticker_Mask] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c7, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s0
texld r1, t0, s1
texld r3, t0, s3
texld r2, t0, s2
mov_pp r4.xyz, c2
add_pp r4.xyz, -c1, r4
mad_pp r4.xyz, r0.x, r4, c1
add_pp r5.xyz, -r4, c3
mad_pp r4.xyz, r0.y, r5, r4
add_pp r5.xyz, -r4, c4
mad_pp r4.xyz, r0.z, r5, r4
add_pp r0.xyz, -r2, c5
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r4
add_pp r1.xyz, -r0, c6
mad_pp r0.xyz, r3.x, r1, r0
mad_pp r2.xyz, r1.w, r2, r4
add_pp r0.xyz, r0, -r2
mad_pp r0.xyz, r2.w, r0, r2
mul_pp r2.xyz, r0, t3
mul_pp r1.xyz, r0, c0
max_pp r3.x, t2.z, c7
mul_pp r1.xyz, r3.x, r1
mad_pp r1.xyz, r1, c7.y, r2
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
SetTexture 0 [_Base_Mask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_Sticker] 2D 2
SetTexture 3 [_Sticker_Mask] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[2], 2D;
TEX R2.xz, fragment.texcoord[0], texture[3], 2D;
TXP R4.x, fragment.texcoord[4], texture[4], 2D;
MOV R5.xyz, c[1];
ADD R5.xyz, -R5, c[2];
MAD R4.yzw, R3.x, R5.xxyz, c[1].xxyz;
ADD R5.xyz, -R4.yzww, c[3];
MAD R4.yzw, R3.y, R5.xxyz, R4;
ADD R5.xyz, -R1, c[5];
ADD R3.xyw, -R4.yzzw, c[4].xyzz;
MAD R1.xyz, R2.z, R5, R1;
MAD R3.xyz, R3.z, R3.xyww, R4.yzww;
ADD R5.xyz, R0, -R3;
MAD R3.xyz, R0.w, R5, R3;
ADD R0.xyz, -R1, c[6];
MAD R0.xyz, R2.x, R0, R1;
ADD R0.xyz, R0, -R3;
MAD R0.xyz, R1.w, R0, R3;
MAX R0.w, fragment.texcoord[2].z, c[7].x;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R2.xyz, R0, c[0];
MUL R0.w, R0, R4.x;
MUL R2.xyz, R0.w, R2;
MAD R1.xyz, R2, c[7].y, R1;
ADD result.color.xyz, R1, R0;
MOV result.color.w, c[7].z;
END
# 28 instructions, 6 R-regs
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
SetTexture 0 [_Base_Mask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_Sticker] 2D 2
SetTexture 3 [_Sticker_Mask] 2D 3
SetTexture 4 [_ShadowMapTexture] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c7, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t2.xyz
dcl t3.xyz
dcl t4
texld r3, t0, s3
texld r0, t0, s0
texldp r6, t4, s4
texld r1, t0, s1
texld r2, t0, s2
mov_pp r4.xyz, c2
add_pp r4.xyz, -c1, r4
mad_pp r4.xyz, r0.x, r4, c1
add_pp r5.xyz, -r4, c3
mad_pp r4.xyz, r0.y, r5, r4
add_pp r5.xyz, -r4, c4
mad_pp r4.xyz, r0.z, r5, r4
add_pp r0.xyz, -r2, c5
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r4
add_pp r1.xyz, -r0, c6
mad_pp r2.xyz, r1.w, r2, r4
mad_pp r0.xyz, r3.x, r1, r0
add_pp r0.xyz, r0, -r2
mad_pp r1.xyz, r2.w, r0, r2
mul_pp r3.xyz, r1, t3
mul_pp r2.xyz, r1, c0
max_pp r0.x, t2.z, c7
mul_pp r0.x, r0, r6
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c7.y, r3
mov_pp r0.w, c7.z
add_pp r0.xyz, r0, r1
mov_pp oC0, r0
"
}
}
 }
}
}