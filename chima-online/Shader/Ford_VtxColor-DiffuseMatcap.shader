//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_VtxColor-DiffuseMatcap" {
Properties {
 _Diffuse ("Diffuse (RGB), Matcap_M (A) UV1", 2D) = "white" {}
 _Matcap ("Matcap (RGB)", 2D) = "black" {}
}
SubShader { 
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
Program "vp" {
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
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
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
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[21];
DP4 R2.y, R0, c[20];
DP4 R2.x, R0, c[19];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[24];
DP4 R0.y, R1, c[23];
DP4 R0.x, R1, c[22];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[25];
ADD result.texcoord[3].xyz, R0, R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[26].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].y, R3, R1;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
"vs_2_0
def c26, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r1.xyz, v2, c25.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mov r0.w, c26.y
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c20
dp4 r2.y, r0, c19
dp4 r2.x, r0, c18
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c23
dp4 r0.y, r1, c22
dp4 r0.x, r1, c21
mul r1.xyz, r0.w, c24
add r0.xyz, r2, r0
add oT3.xyz, r0, r1
mov r0.w, c26.y
mov r0.xyz, c16
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c25.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c17, r0
mov r0, c13
dp4 r4.y, c17, r0
mov r1, c12
dp4 r4.x, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c26.x, c26.x
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
Vector 18 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..18] };
TEMP R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 10 instructions, 1 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oD0, v5
mov oT0.xy, v3
mad oT1.xy, r0, c17.x, c17.x
mad oT2.xy, v4, c16, c16.zwzw
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
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
"!!ARBvp1.0
PARAM c[28] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[27].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[22];
DP4 R2.y, R0, c[21];
DP4 R2.x, R0, c[20];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[25];
DP4 R0.y, R1, c[24];
DP4 R0.x, R1, c[23];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[26];
ADD result.texcoord[3].xyz, R0, R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[27].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV result.position, R0;
DP3 result.texcoord[2].y, R3, R1;
DP3 result.texcoord[4].y, R1, R2;
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.color, vertex.color;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
END
# 52 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
"vs_2_0
def c28, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r1.xyz, v2, c27.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mov r0.w, c28.y
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c22
dp4 r2.y, r0, c21
dp4 r2.x, r0, c20
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c25
dp4 r0.y, r1, c24
dp4 r0.x, r1, c23
mul r1.xyz, r0.w, c26
add r0.xyz, r2, r0
add oT3.xyz, r0, r1
mov r0.w, c28.y
mov r0.xyz, c16
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c27.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c19, r0
mov r0, c13
dp4 r4.y, c19, r0
mov r1, c12
dp4 r4.x, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c28.x
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mad oT5.xy, r1.z, c18.zwzw, r1
mov oD0, v4
mov oT5.zw, r0
mov oT0.xy, v3
mad oT1.xy, r0, c28.x, c28.x
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 17 [_ProjectionParams]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[19], c[19].zwzw;
END
# 15 instructions, 2 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_LightmapST]
"vs_2_0
def c19, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT3.xy, r1.z, c17.zwzw, r1
mov oD0, v5
mov oT3.zw, r0
mov oT0.xy, v3
mad oT1.xy, r0, c19.x, c19.x
mad oT2.xy, v4, c18, c18.zwzw
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
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
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[32];
DP4 R3.y, R0, c[31];
DP4 R3.x, R0, c[30];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[33];
MOV R1.w, c[0].y;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[3].xyz, R0, R1;
MOV R1.xyz, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[34].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[18];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP3 result.texcoord[2].y, R3, R0;
DP3 result.texcoord[4].y, R0, R2;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 78 instructions, 5 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
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
"vs_2_0
def c34, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r3.xyz, v2, c33.w
dp4 r0.x, v0, c9
add r1, -r0.x, c19
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c18
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c20
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c21
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.y
dp4 r2.z, r4, c28
dp4 r2.y, r4, c27
dp4 r2.x, r4, c26
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.z
mul r0, r0, r1
mul r1.xyz, r0.y, c23
mad r1.xyz, r0.x, c22, r1
mad r0.xyz, r0.z, c24, r1
mad r1.xyz, r0.w, c25, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c31
dp4 r3.y, r0, c30
dp4 r3.x, r0, c29
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c32
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add oT3.xyz, r0, r1
mov r1.w, c34.y
mov r1.xyz, c16
dp4 r0.z, r1, c14
dp4 r0.y, r1, c13
dp4 r0.x, r1, c12
mad r3.xyz, r0, c33.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c17, r0
mov r0, c12
dp4 r4.x, c17, r0
mov r1, c13
dp4 r4.y, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c34.x, c34.x
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
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
"!!ARBvp1.0
PARAM c[36] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..35] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[35].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[21];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[20];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[22];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[23];
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
MUL R1.xyz, R0.y, c[25];
MAD R1.xyz, R0.x, c[24], R1;
MAD R0.xyz, R0.z, c[26], R1;
MAD R1.xyz, R0.w, c[27], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[33];
DP4 R3.y, R0, c[32];
DP4 R3.x, R0, c[31];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[34];
MOV R1.w, c[0].y;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R4, c[30];
DP4 R2.y, R4, c[29];
DP4 R2.x, R4, c[28];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[3].xyz, R0, R1;
MOV R1.xyz, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[35].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[19];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP3 result.texcoord[2].y, R3, R0;
DP3 result.texcoord[4].y, R0, R2;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.color, vertex.color;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
END
# 83 instructions, 5 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
"vs_2_0
def c36, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mul r3.xyz, v2, c35.w
dp4 r0.x, v0, c9
add r1, -r0.x, c21
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c20
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c36.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c22
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c23
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c36.y
dp4 r2.z, r4, c30
dp4 r2.y, r4, c29
dp4 r2.x, r4, c28
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c36.z
mul r0, r0, r1
mul r1.xyz, r0.y, c25
mad r1.xyz, r0.x, c24, r1
mad r0.xyz, r0.z, c26, r1
mad r1.xyz, r0.w, c27, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c33
dp4 r3.y, r0, c32
dp4 r3.x, r0, c31
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c34
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add oT3.xyz, r0, r1
mov r1.w, c36.y
mov r1.xyz, c16
dp4 r0.z, r1, c14
dp4 r0.y, r1, c13
dp4 r0.x, r1, c12
mad r3.xyz, r0, c35.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c19, r0
mov r0, c12
dp4 r4.x, c19, r0
mov r1, c13
dp4 r4.y, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c36.x
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mad oT5.xy, r1.z, c18.zwzw, r1
mov oD0, v4
mov oT5.zw, r0
mov oT0.xy, v3
mad oT1.xy, r0, c36.x, c36.x
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0.w, R1;
MAX R1.w, fragment.texcoord[2].z, c[1].y;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, c[0];
MUL R1.xyz, R0, R1;
MAD R1.xyz, R1, c[1].z, R2;
MAD result.color.xyz, R0, fragment.texcoord[3], R1;
MOV result.color.w, c[1].x;
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 1.00000000, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s0
texld r1, t1, s1
mul_pp r1.xyz, r0.w, r1
max_pp r2.x, t2.z, c1
mul r0.xyz, r0, v0
mul_pp r2.xyz, r2.x, c0
mul_pp r2.xyz, r0, r2
mad_pp r1.xyz, r2, c1.y, r1
mov_pp r0.w, c1.z
mad_pp r0.xyz, r0, t3, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[1] = { { 1, 8 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[2], texture[1], 2D;
MUL R1.xyz, R1, fragment.color.primary;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[0].y;
MOV result.color.w, c[0].x;
END
# 7 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c0, 8.00000000, 1.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t2.xy
texld r1, t0, s0
texld r0, t2, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TXP R2.x, fragment.texcoord[5], texture[2], 2D;
MAX R1.w, fragment.texcoord[2].z, c[1].y;
MUL R2.yzw, R1.w, c[0].xxyz;
MUL R0.xyz, R0, fragment.color.primary;
MUL R2.xyz, R2.x, R2.yzww;
MUL R1.xyz, R0.w, R1;
MUL R2.xyz, R0, R2;
MAD R1.xyz, R2, c[1].z, R1;
MAD result.color.xyz, R0, fragment.texcoord[3], R1;
MOV result.color.w, c[1].x;
END
# 12 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 2.00000000, 1.00000000, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
dcl t5
texldp r3, t5, s2
texld r0, t0, s0
texld r1, t1, s1
mul_pp r1.xyz, r0.w, r1
max_pp r2.x, t2.z, c1
mul r0.xyz, r0, v0
mul_pp r2.xyz, r2.x, c0
mul_pp r2.xyz, r3.x, r2
mul_pp r2.xyz, r0, r2
mad_pp r1.xyz, r2, c1.y, r1
mov_pp r0.w, c1.z
mad_pp r0.xyz, r0, t3, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 1, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[2], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.x, fragment.texcoord[3], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0].y;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[0].z;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, fragment.color.primary;
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[0].x;
END
# 13 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 8.00000000, 2.00000000, 1.00000000, 0
dcl v0.xyz
dcl t0.xy
dcl t2.xy
dcl t3
texld r1, t0, s0
texldp r3, t3, s1
texld r0, t2, s2
mul_pp r2.xyz, r0, r3.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c0.x
mul_pp r2.xyz, r2, c0.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r3.x
max_pp r0.xyz, r2, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c0.z
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
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r2, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[13];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[15].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[14];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].y, R3, R1;
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.w, c15.y
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c14.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
mov r1, c8
dp4 r4.x, c13, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT3.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c15.x, c15.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP4 R0.w, vertex.position, c[12];
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].w, R0, c[20];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp4 r0.w, v0, c11
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.z, v0, c10
dp4 oT4.w, r0, c19
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r2, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r2, r3
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].y, R3, R1;
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R3;
DP3 result.texcoord[2].x, R3, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r4, r2
dp3 oT3.y, r2, r3
dp3 oT2.z, v2, r4
dp3 oT2.x, r4, v1
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
mov oD0, v4
mov oT0.xy, v3
mad oT1.xy, r0, c23.x, c23.x
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
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.x, R2.x;
MUL R2.x, R2, fragment.texcoord[2].z;
MAX R2.w, R2.x, c[1].x;
MUL R2.xyz, R0.w, R1;
MUL R1.xyz, R2.w, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MOV result.color.w, c[1].x;
TEX R1.w, R1.w, texture[2], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].y, R2;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 2.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t4.xyz
texld r2, t1, s1
texld r1, t0, s0
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mul_pp r2.xyz, r1.w, r2
mul r1.xyz, r1, v0
mov_pp r0.w, c1.x
texld r3, r0, s2
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t2
max_pp r0.x, r0.z, c1
mul_pp r0.xyz, r0.x, c0
mul_pp r0.xyz, r3.x, r0
mul_pp r0.xyz, r0, r1
mad_pp r0.xyz, r0, c1.y, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0.w, R1;
MUL R1.xyz, R0, fragment.color.primary;
MAX R0.w, fragment.texcoord[2].z, c[1].x;
MUL R0.xyz, R0.w, c[0];
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[1].y, R2;
MOV result.color.w, c[1].x;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
texld r1, t1, s1
texld r0, t0, s0
mul_pp r1.xyz, r0.w, r1
max_pp r2.x, t2.z, c1
mul r0.xyz, r0, v0
mul_pp r2.xyz, r2.x, c0
mul_pp r0.xyz, r2, r0
mad_pp r0.xyz, r0, c1.y, r1
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
RCP R0.x, fragment.texcoord[4].w;
MAD R1.xy, fragment.texcoord[4], R0.x, c[1].y;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[1].x;
TEX R1.w, R1, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R0.w, R0.w, texture[3], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.x, R1, fragment.texcoord[2].z;
MUL R0.xyz, R2.w, R0;
MAX R2.w, R1.x, c[1].x;
MUL R1.xyz, R2, fragment.color.primary;
MUL R2.xyz, R2.w, c[0];
SLT R2.w, c[1].x, fragment.texcoord[4].z;
MUL R1.w, R2, R1;
MUL R0.w, R1, R0;
MUL R2.xyz, R0.w, R2;
MUL R1.xyz, R2, R1;
MAD result.color.xyz, R1, c[1].z, R0;
END
# 21 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t4
texld r2, t0, s0
dp3 r1.x, t4, t4
mov r1.xy, r1.x
rcp r0.x, t4.w
mad r0.xy, t4, r0.x, c1.x
mul r2.xyz, r2, v0
texld r4, r1, s3
texld r1, r0, s2
texld r0, t1, s1
mul_pp r3.xyz, r2.w, r0
dp3_pp r0.x, t2, t2
rsq_pp r1.x, r0.x
mul_pp r0.z, r1.x, t2
max_pp r1.x, r0.z, c1.y
cmp r0.x, -t4.z, c1.y, c1.z
mul_pp r0.x, r0, r1.w
mul_pp r0.x, r0, r4
mul_pp r1.xyz, r1.x, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, r2
mad_pp r0.xyz, r0, c1.w, r3
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[1], 2D;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.x, R1, fragment.texcoord[2].z;
MUL R0.xyz, R2.w, R0;
MAX R2.w, R1.x, c[1].x;
MUL R1.xyz, R2, fragment.color.primary;
MUL R2.xyz, R2.w, c[0];
MOV result.color.w, c[1].x;
TEX R1.w, R0.w, texture[2], 2D;
TEX R0.w, fragment.texcoord[4], texture[3], CUBE;
MUL R0.w, R1, R0;
MUL R2.xyz, R0.w, R2;
MUL R1.xyz, R2, R1;
MAD result.color.xyz, R1, c[1].y, R0;
END
# 17 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c1, 0.00000000, 2.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t4.xyz
texld r1, t4, s3
texld r2, t0, s0
texld r3, t1, s1
dp3 r0.x, t4, t4
mov r0.xy, r0.x
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r3.xyz, r2.w, r3
mul r2.xyz, r2, v0
texld r0, r0, s2
mul_pp r0.z, r1.x, t2
max_pp r1.x, r0.z, c1
mul r0.x, r0, r1.w
mul_pp r1.xyz, r1.x, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, r2
mad_pp r0.xyz, r0, c1.y, r3
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R1.w, fragment.texcoord[4], texture[2], 2D;
MUL R2.xyz, R0.w, R1;
MAX R2.w, fragment.texcoord[2].z, c[1].x;
MUL R1.xyz, R2.w, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].y, R2;
MOV result.color.w, c[1].x;
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 2.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t4.xy
texld r1, t1, s1
texld r2, t0, s0
texld r0, t4, s2
mul r0.xyz, r2, v0
max_pp r3.x, t2.z, c1
mul_pp r2.xyz, r3.x, c0
mul_pp r2.xyz, r0.w, r2
mul_pp r1.xyz, r2.w, r1
mul_pp r0.xyz, r2, r0
mad_pp r0.xyz, r0, c1.y, r1
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [unity_Scale]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..13] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[9];
DP3 R0.x, vertex.attrib[14], c[9];
DP3 R0.z, vertex.normal, c[9];
MUL result.texcoord[2].xyz, R0, c[13].w;
DP3 R0.y, R1, c[10];
DP3 R0.x, vertex.attrib[14], c[10];
DP3 R0.z, vertex.normal, c[10];
MUL result.texcoord[3].xyz, R0, c[13].w;
DP3 R0.y, R1, c[11];
DP3 R0.x, vertex.attrib[14], c[11];
DP3 R0.z, vertex.normal, c[11];
MUL result.texcoord[4].xyz, R0, c[13].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [unity_Scale]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c8
dp3 r0.x, v1, c8
dp3 r0.z, v2, c8
mul oT2.xyz, r0, c12.w
dp3 r0.y, r1, c9
dp3 r0.x, v1, c9
dp3 r0.z, v2, c9
mul oT3.xyz, r0, c12.w
dp3 r0.y, r1, c10
dp3 r0.x, v1, c10
dp3 r0.z, v2, c10
mul oT4.xyz, r0, c12.w
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mad oT1.xy, r0, c13.x, c13.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
"!!ARBfp1.0
PARAM c[1] = { { 0, 0.5 } };
TEMP R0;
MOV R0.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].z;
MOV R0.y, fragment.texcoord[3].z;
MAD result.color.xyz, R0, c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
"ps_2_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
mov_pp r0.z, t4
mov_pp r0.x, t2.z
mov_pp r0.y, t3.z
mad_pp r0.xyz, r0, c0.x, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
//   Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[20];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[13].x;
ADD result.texcoord[2].xy, R0, R0.z;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[3].xyz, R3, R2;
MOV result.position, R1;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c21.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.y
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c20
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c22.x
mul r0.y, r0, c12.x
mad oT2.xy, r0.z, c13.zwzw, r0
dp3 r0.x, v1, c4
dp3 r0.y, v1, c5
add oT3.xyz, r3, r2
mov oPos, r1
mov oD0, v3
mov oT2.zw, r1
mov oT0.xy, v2
mad oT1.xy, r0, c22.x, c22.x
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 13 [_Object2World]
Vector 17 [_ProjectionParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[2].xy, R1, R1.z;
DP3 R0.x, vertex.normal, c[9];
DP3 R0.y, vertex.normal, c[10];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[18].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[15];
DP4 R1.x, vertex.position, c[13];
DP4 R1.y, vertex.position, c[14];
ADD R1.xyz, R1, -c[18];
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[18].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_Object2World]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"vs_2_0
def c20, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c20.x
mov oPos, r0
mul r1.y, r1, c16.x
mad oT2.xy, r1.z, c17.zwzw, r1
dp3 r0.x, v1, c8
dp3 r0.y, v1, c9
mad oT1.xy, r0, c20.x, c20.x
mov r0.x, c18.w
add r0.y, c20, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c14
dp4 r1.x, v0, c12
dp4 r1.y, v0, c13
add r1.xyz, r1, -c18
mov oD0, v4
mov oT2.zw, r0
mul oT4.xyz, r1, c18.w
mov oT0.xy, v2
mad oT3.xy, v3, c19, c19.zwzw
mul oT4.w, -r0.x, r0.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[20];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[13].x;
ADD result.texcoord[2].xy, R0, R0.z;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[3].xyz, R3, R2;
MOV result.position, R1;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c21.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.y
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c20
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c22.x
mul r0.y, r0, c12.x
mad oT2.xy, r0.z, c13.zwzw, r0
dp3 r0.x, v1, c4
dp3 r0.y, v1, c5
add oT3.xyz, r3, r2
mov oPos, r1
mov oD0, v3
mov oT2.zw, r1
mov oT0.xy, v2
mad oT1.xy, r0, c22.x, c22.x
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 13 [_Object2World]
Vector 17 [_ProjectionParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[2].xy, R1, R1.z;
DP3 R0.x, vertex.normal, c[9];
DP3 R0.y, vertex.normal, c[10];
MAD result.texcoord[1].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[18].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[15];
DP4 R1.x, vertex.position, c[13];
DP4 R1.y, vertex.position, c[14];
ADD R1.xyz, R1, -c[18];
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[18].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_Object2World]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"vs_2_0
def c20, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c20.x
mov oPos, r0
mul r1.y, r1, c16.x
mad oT2.xy, r1.z, c17.zwzw, r1
dp3 r0.x, v1, c8
dp3 r0.y, v1, c9
mad oT1.xy, r0, c20.x, c20.x
mov r0.x, c18.w
add r0.y, c20, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c14
dp4 r1.x, v0, c12
dp4 r1.y, v0, c13
add r1.xyz, r1, -c18
mov oD0, v4
mov oT2.zw, r0
mul oT4.xyz, r1, c18.w
mov oT0.xy, v2
mad oT3.xy, v3, c19, c19.zwzw
mul oT4.w, -r0.x, r0.y
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[1], 2D;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[3];
MUL R2.xyz, R0.w, R2;
MUL R0.xyz, R0, fragment.color.primary;
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[0].x;
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 1.00000000, 0, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2
dcl t3.xyz
texldp r0, t2, s2
texld r1, t0, s0
texld r2, t1, s1
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, t3
mul_pp r2.xyz, r1.w, r2
mul r1.xyz, r1, v0
mov_pp r0.w, c0.x
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[3], texture[4], 2D;
TEX R2, fragment.texcoord[3], texture[3], 2D;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R4.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[1].y;
DP4 R2.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MAD R2.xyz, R2, c[1].y, -R1;
MAD_SAT R1.w, R1, c[0].z, c[0];
MAD R1.xyz, R1.w, R2, R1;
LG2 R2.x, R3.x;
LG2 R2.y, R3.y;
LG2 R2.z, R3.z;
ADD R1.xyz, -R2, R1;
MUL R2.xyz, R0.w, R4;
MUL R0.xyz, R0, fragment.color.primary;
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[1].x;
END
# 22 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c1, 8.00000000, 1.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2
dcl t3.xy
dcl t4
texld r1, t0, s0
texld r3, t1, s1
texldp r2, t2, s2
texld r0, t3, s3
texld r4, t3, s4
mul_pp r5.xyz, r0.w, r0
mul_pp r4.xyz, r4.w, r4
mul_pp r4.xyz, r4, c1.x
dp4 r0.x, t4, t4
rsq r0.x, r0.x
rcp r0.x, r0.x
log_pp r2.x, r2.x
log_pp r2.y, r2.y
log_pp r2.z, r2.z
mad_pp r5.xyz, r5, c1.x, -r4
mad_sat r0.x, r0, c0.z, c0.w
mad_pp r0.xyz, r0.x, r5, r4
add_pp r0.xyz, -r2, r0
mul_pp r2.xyz, r1.w, r3
mul r1.xyz, r1, v0
mov_pp r0.w, c1.y
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R1.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[1], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R2.xyz, R0.w, R2;
ADD R1.xyz, R1, fragment.texcoord[3];
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[0].x;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 1.00000000, 0, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2
dcl t3.xyz
texldp r0, t2, s2
texld r1, t1, s1
texld r2, t0, s0
mul_pp r1.xyz, r2.w, r1
mul r2.xyz, r2, v0
add_pp r0.xyz, r0, t3
mov_pp r0.w, c0.x
mad_pp r0.xyz, r2, r0, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[3], texture[4], 2D;
TEX R2, fragment.texcoord[3], texture[3], 2D;
TEX R4.xyz, fragment.texcoord[1], texture[1], 2D;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[1].y;
DP4 R2.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MAD R2.xyz, R2, c[1].y, -R1;
MAD_SAT R1.w, R1, c[0].z, c[0];
MAD R1.xyz, R1.w, R2, R1;
ADD R1.xyz, R3, R1;
MUL R2.xyz, R0.w, R4;
MUL R0.xyz, R0, fragment.color.primary;
MAD result.color.xyz, R0, R1, R2;
MOV result.color.w, c[1].x;
END
# 19 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Diffuse] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c1, 8.00000000, 1.00000000, 0, 0
dcl v0.xyz
dcl t0.xy
dcl t1.xy
dcl t2
dcl t3.xy
dcl t4
texld r1, t0, s0
texld r3, t1, s1
texldp r2, t2, s2
texld r0, t3, s3
texld r4, t3, s4
mul_pp r5.xyz, r0.w, r0
dp4 r0.x, t4, t4
mul_pp r4.xyz, r4.w, r4
mul_pp r4.xyz, r4, c1.x
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r5.xyz, r5, c1.x, -r4
mad_sat r0.x, r0, c0.z, c0.w
mad_pp r0.xyz, r0.x, r5, r4
add_pp r0.xyz, r2, r0
mul_pp r2.xyz, r1.w, r3
mul r1.xyz, r1, v0
mov_pp r0.w, c1.y
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}