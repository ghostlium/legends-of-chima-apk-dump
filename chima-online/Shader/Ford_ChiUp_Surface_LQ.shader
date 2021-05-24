//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_ChiUp Surface_LQ" {
Properties {
 _MainColor ("Color", Color) = (1,1,1,1)
 _FresnelColor ("Fresnel Color", Color) = (1,1,1,1)
 _SpecColor ("Specular Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,1)) = 0.078125
 _EmissiveStrength ("Emissive Strength", Float) = 1
 _FresnelPower ("Fresnel Power", Range(0,3)) = 0.8
}
SubShader { 
 LOD 300
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
//   Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"!!ARBvp1.0
PARAM c[18] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..17] };
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
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
MAD R0.y, R0.x, R0.x, -R0;
MOV result.texcoord[2].x, R0;
MIN R0.x, vertex.position.z, c[0].y;
MUL R1.xyz, R0.y, c[16];
ADD R2.xyz, R2, R3;
ADD result.texcoord[3].xyz, R2, R1;
DP4 R1.z, vertex.position, c[7];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
ADD result.texcoord[0].xyz, -R1, c[9];
MOV result.texcoord[2].z, R2.w;
MOV result.texcoord[2].y, R3.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"vs_2_0
def c17, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c16.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c17.x
dp4 r2.z, r0, c11
dp4 r2.y, r0, c10
dp4 r2.x, r0, c9
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c14
dp4 r3.y, r1, c13
dp4 r3.x, r1, c12
mad r0.y, r0.x, r0.x, -r0
mov oT2.x, r0
min r0.x, v0.z, c17
mul r1.xyz, r0.y, c15
add r2.xyz, r2, r3
add oT3.xyz, r2, r1
dp4 r1.z, v0, c6
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
add oT0.xyz, -r1, c8
mov oT2.z, r2.w
mov oT2.y, r3.w
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c17.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Vector 11 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[12] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[0].xyz, -R0, c[9];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [unity_LightmapST]
"vs_2_0
def c11, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
mul r1.xyz, v1, c9.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c11
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mad oT3.xy, v2, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c11.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[16] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[14].w, -vertex.position;
DP3 result.texcoord[0].y, R0, R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 result.texcoord[0].z, vertex.normal, R0;
DP3 result.texcoord[0].x, R0, vertex.attrib[14];
MIN R0.x, vertex.position.z, c[0];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0].y;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
"vs_2_0
def c15, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c12
mov r0.w, c15.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r0.xyz, r2, c13.w, -v0
dp3 oT0.y, r0, r1
mul r1.xyz, v2, c13.w
dp3 oT0.z, v2, r0
dp3 oT0.x, r0, v1
min r0.x, v0.z, c15
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mad oT3.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c15.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"!!ARBvp1.0
PARAM c[19] = { { 0, 1, 0.5 },
		state.matrix.mvp,
		program.local[5..18] };
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
MOV R1.z, c[0].y;
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
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
MOV result.texcoord[4].zw, R0;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[0].xyz, -R0, c[9];
MIN R0.x, vertex.position.z, c[0].y;
ADD result.texcoord[3].xyz, R3, R2;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[2].z, R2.w;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R1.w;
MAX result.texcoord[1].x, R0, c[0];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"vs_2_0
def c19, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
mul r0.xyz, v1, c18.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c19.x
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
mul r1.xyz, r0.xyww, c19.z
mov oPos, r0
mul r1.y, r1, c9.x
mov oT4.zw, r0
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c19
add oT3.xyz, r3, r2
mad oT4.xy, r1.z, c10.zwzw, r1
mov oT2.z, r2.w
mov oT2.y, r3.w
mov oT2.x, r1.w
max oT1.x, r0, c19.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[13] = { { 0, 1, 0.5 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.texcoord[4].zw, R0;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[0].xyz, -R0, c[9];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[12], c[12].zwzw;
MAX result.texcoord[1].x, R0, c[0];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"vs_2_0
def c13, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.z
mov oPos, r0
mul r1.y, r1, c9.x
mad oT4.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT4.zw, r0
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c13
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mad oT3.xy, v2, c12, c12.zwzw
max oT1.x, r0, c13.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[15].w, -vertex.position;
DP3 result.texcoord[0].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
DP3 result.texcoord[0].z, vertex.normal, R2;
DP3 result.texcoord[0].x, R2, vertex.attrib[14];
MOV result.texcoord[4].zw, R0;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c12
mov r1.w, c17.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c15.w, -v0
dp3 oT0.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.z
mul r1.y, r1, c13.x
mad oT4.xy, r1.z, c14.zwzw, r1
mul r1.xyz, v2, c15.w
mov oPos, r0
min r0.x, v0.z, c17
dp3 oT0.z, v2, r2
dp3 oT0.x, r2, v1
mov oT4.zw, r0
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mad oT3.xy, v3, c16, c16.zwzw
max oT1.x, r0, c17.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"!!ARBvp1.0
PARAM c[26] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..25] };
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
ADD result.texcoord[3].xyz, R0, R1;
MIN R0.x, vertex.position.z, c[0];
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[0].xyz, -R3.wxyw, c[9];
MOV result.texcoord[2].z, R3;
MOV result.texcoord[2].y, R4.z;
MOV result.texcoord[2].x, R5;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0].y;
END
# 61 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"vs_2_0
def c25, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
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
mov r5.w, c25.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c11
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c12
add r1, r1, c25.x
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
max r0, r0, c25.y
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
add oT3.xyz, r0, r1
min r0.x, v0.z, c25
mov r3.x, r4.w
mov r3.y, r4
add oT0.xyz, -r3.wxyw, c8
mov oT2.z, r3
mov oT2.y, r4.z
mov oT2.x, r5
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c25.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"!!ARBvp1.0
PARAM c[27] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
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
ADD result.texcoord[3].xyz, R5.yzww, R1;
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
MOV R1.x, R2;
MUL R1.y, R2, c[10].x;
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[4].xy, R1, R2.z;
MOV result.texcoord[4].zw, R0;
ADD result.texcoord[0].xyz, -R3.wxyw, c[9];
MOV result.texcoord[2].z, R3;
MOV result.texcoord[2].y, R4.z;
MOV result.texcoord[2].x, R5;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 67 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
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
"vs_2_0
def c27, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
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
mov r5.w, c27.x
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c13
mad r2, r1, r1, r2
mad r0, r3.z, r1, r0
mul r1, r2, c14
add r1, r1, c27.x
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
max r0, r0, c27.y
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
mul r2.xyz, r0.xyww, c27.z
add oT3.xyz, r5.yzww, r1
mov oPos, r0
min r0.x, v0.z, c27
mov r1.x, r2
mul r1.y, r2, c9.x
mov r3.x, r4.w
mov r3.y, r4
mad oT4.xy, r2.z, c10.zwzw, r1
mov oT4.zw, r0
add oT0.xyz, -r3.wxyw, c8
mov oT2.z, r3
mov oT2.y, r4.z
mov oT2.x, r5
max oT1.x, r0, c27.y
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Float 3 [_Shininess]
Vector 4 [_MainColor]
Vector 5 [_FresnelColor]
Float 6 [_FresnelPower]
Float 7 [_EmissiveStrength]
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 1, 0, 128, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1, c[2];
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.w, R0.x;
MUL R0.xyz, R0.w, fragment.texcoord[0];
DP3_SAT R2.x, R0, fragment.texcoord[2];
MOV R0.xyz, c[4];
ADD R2.x, -R2, c[8];
DP3 R2.w, fragment.texcoord[2], c[0];
POW R2.x, R2.x, c[6].x;
ADD R0.xyz, -R0, c[5];
MAD R0.xyz, R2.x, R0, c[4];
MAD R2.xyz, R0.w, fragment.texcoord[0], c[0];
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
MUL R3.xyz, R0, c[1];
MAX R2.w, R2, c[8].y;
MOV R0.w, c[8].z;
DP3 R2.x, fragment.texcoord[2], R2;
MUL R2.y, R0.w, c[3].x;
MAX R0.w, R2.x, c[8].y;
POW R0.w, R0.w, R2.y;
MUL R1.w, R1, c[1];
MUL R1.xyz, R1, c[1];
MUL R3.xyz, R3, R2.w;
MAD R1.xyz, R1, R0.w, R3;
MUL R1.xyz, R1, c[8].w;
MAD R1.xyz, R0, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[7].x;
ADD result.color.xyz, R1, R0;
MAD result.color.w, R0, R1, c[8].x;
END
# 31 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Float 3 [_Shininess]
Vector 4 [_MainColor]
Vector 5 [_FresnelColor]
Float 6 [_FresnelPower]
Float 7 [_EmissiveStrength]
"ps_2_0
def c8, 1.00000000, 0.00000000, 128.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dp3_pp r0.x, t0, t0
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t0, c0
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, t2, r1
mov_pp r2.x, c3
mul_pp r3.xyz, r0.x, t0
max_pp r1.x, r1, c8.y
mul_pp r2.x, c8.z, r2
pow r0.x, r1.x, r2.x
dp3_pp_sat r1.x, r3, t2
add_pp r1.x, -r1, c8
pow_pp r2.w, r1.x, c6.x
mov_pp r1.xyz, c5
add_pp r3.xyz, -c4, r1
mov_pp r1.x, r2.w
mad_pp r2.xyz, r1.x, r3, c4
dp3_pp r1.x, t2, c0
mul_pp r3.xyz, r2, c1
max_pp r1.x, r1, c8.y
mul_pp r1.xyz, r3, r1.x
mov_pp r4.xyz, c1
mul_pp r3.xyz, c2, r4
mad r1.xyz, r3, r0.x, r1
mul r1.xyz, r1, c8.w
mad_pp r3.xyz, r2, t3, r1
mov_pp r0.w, c1
mul_pp r1.x, c2.w, r0.w
mad r0.w, r0.x, r1.x, c8.x
mul r2.xyz, r2, c7.x
add_pp r0.xyz, r3, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_MainColor]
Vector 1 [_FresnelColor]
Float 2 [_FresnelPower]
Float 3 [_EmissiveStrength]
SetTexture 0 [unity_Lightmap] 2D 0
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[3], texture[0], 2D;
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[0];
DP3_SAT R1.w, R1, fragment.texcoord[2];
MOV R1.xyz, c[0];
ADD R1.w, -R1, c[4].x;
ADD R1.xyz, -R1, c[1];
POW R1.w, R1.w, c[2].x;
MAD R1.xyz, R1.w, R1, c[0];
MUL R0.xyz, R0.w, R0;
MUL R2.xyz, R1, c[3].x;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[4].y, R2;
MOV result.color.w, c[4].x;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_MainColor]
Vector 1 [_FresnelColor]
Float 2 [_FresnelPower]
Float 3 [_EmissiveStrength]
SetTexture 0 [unity_Lightmap] 2D 0
"ps_2_0
dcl_2d s0
def c4, 1.00000000, 8.00000000, 0, 0
dcl t0.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t3, s0
mul_pp r0.xyz, r0.w, r0
dp3_pp r1.x, t0, t0
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t0
dp3_pp_sat r1.x, r1, t2
add_pp r1.x, -r1, c4
pow_pp r2.x, r1.x, c2.x
mov_pp r1.xyz, c1
add_pp r1.xyz, -c0, r1
mad_pp r1.xyz, r2.x, r1, c0
mul_pp r0.xyz, r0, r1
mul r1.xyz, r1, c3.x
mov_pp r0.w, c4.x
mad_pp r0.xyz, r0, c4.y, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [unity_Lightmap] 2D 0
SetTexture 1 [unity_LightmapInd] 2D 1
"!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 1, 8, 0, 128 },
		{ -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[3], texture[1], 2D;
TEX R0, fragment.texcoord[3], texture[0], 2D;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[6].y;
MUL R2.xyz, R1.y, c[9];
MAD R2.xyz, R1.x, c[8], R2;
MAD R1.xyz, R1.z, c[7], R2;
DP3 R1.w, R1, R1;
RSQ R2.x, R1.w;
DP3 R1.w, fragment.texcoord[0], fragment.texcoord[0];
MUL R1.xyz, R2.x, R1;
RSQ R2.x, R1.w;
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].w;
MUL R1.z, R1.x, c[1].x;
MAX R1.x, R1.y, c[6].z;
POW R1.w, R1.x, R1.z;
MUL R1.xyz, R0.w, R0;
MUL R0.xyz, R2.x, fragment.texcoord[0];
DP3_SAT R0.w, R0, fragment.texcoord[2];
MUL R1.xyz, R1, c[6].y;
MOV R0.xyz, c[2];
ADD R0.w, -R0, c[6].x;
MUL R2.xyz, R1, c[0];
ADD R0.xyz, -R0, c[3];
POW R0.w, R0.w, c[4].x;
MAD R0.xyz, R0.w, R0, c[2];
MUL R3.xyz, R0, c[5].x;
MUL R2.xyz, R2, R1.w;
MAD R0.xyz, R0, R1, R2;
ADD result.color.xyz, R0, R3;
MOV result.color.w, c[6].x;
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [unity_Lightmap] 2D 0
SetTexture 1 [unity_LightmapInd] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c6, 1.00000000, 8.00000000, 0.00000000, 128.00000000
def c7, -0.40824831, 0.70710677, 0.57735026, 0
def c8, 0.81649655, 0.00000000, 0.57735026, 0
def c9, -0.40824828, -0.70710677, 0.57735026, 0
dcl t0.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t3, s1
texld r3, t3, s0
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c6.y
mul r1.xyz, r0.y, c7
mad r1.xyz, r0.x, c8, r1
mad r2.xyz, r0.z, c9, r1
dp3 r0.x, r2, r2
rsq r1.x, r0.x
dp3_pp r0.x, t0, t0
mul r1.xyz, r1.x, r2
rsq_pp r0.x, r0.x
mad_pp r1.xyz, r0.x, t0, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
max_pp r2.x, r0.z, c6.z
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t2
mov_pp r1.x, c1
mul_pp r1.x, c6.w, r1
pow r4.w, r2.x, r1.x
mul_pp r2.xyz, r3.w, r3
mul_pp r2.xyz, r2, c6.y
mov r1.x, r4.w
mul_pp r3.xyz, r2, c0
add_pp r0.x, -r0, c6
mul r3.xyz, r3, r1.x
pow_pp r1.w, r0.x, c4.x
mov_pp r0.xyz, c3
add_pp r4.xyz, -c2, r0
mov_pp r0.x, r1.w
mad_pp r0.xyz, r0.x, r4, c2
mad_pp r1.xyz, r0, r2, r3
mul r0.xyz, r0, c5.x
mov_pp r0.w, c6.x
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Float 3 [_Shininess]
Vector 4 [_MainColor]
Vector 5 [_FresnelColor]
Float 6 [_FresnelPower]
Float 7 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 1, 0, 128, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R3.x, fragment.texcoord[4], texture[0], 2D;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.w, R0.x;
MAD R0.xyz, R1.w, fragment.texcoord[0], c[0];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
MOV R0, c[2];
DP3 R2.x, fragment.texcoord[2], R1;
MAX R2.y, R2.x, c[8];
MUL R1.xyz, R0, c[1];
MUL R0.xyz, R1.w, fragment.texcoord[0];
MOV R2.x, c[8].z;
MUL R1.w, R2.x, c[3].x;
POW R1.w, R2.y, R1.w;
DP3_SAT R0.x, R0, fragment.texcoord[2];
ADD R2.x, -R0, c[8];
DP3 R2.y, fragment.texcoord[2], c[0];
MOV R0.xyz, c[4];
MUL R0.w, R0, c[1];
MUL R0.w, R1, R0;
MAX R2.w, R2.y, c[8].y;
POW R2.x, R2.x, c[6].x;
ADD R0.xyz, -R0, c[5];
MAD R0.xyz, R2.x, R0, c[4];
MUL R2.xyz, R0, c[1];
MUL R2.xyz, R2, R2.w;
MUL R2.w, R3.x, c[8];
MAD R1.xyz, R1, R1.w, R2;
MUL R1.xyz, R1, R2.w;
MAD R1.xyz, R0, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[7].x;
ADD result.color.xyz, R1, R0;
MAD result.color.w, R3.x, R0, c[8].x;
END
# 34 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_SpecColor]
Float 3 [_Shininess]
Vector 4 [_MainColor]
Vector 5 [_FresnelColor]
Float 6 [_FresnelPower]
Float 7 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
"ps_2_0
dcl_2d s0
def c8, 1.00000000, 0.00000000, 128.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r5, t4, s0
dp3_pp r0.x, t0, t0
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t0, c0
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, t2, r1
mov_pp r2.x, c3
mul_pp r3.xyz, r0.x, t0
max_pp r1.x, r1, c8.y
mul_pp r2.x, c8.z, r2
pow r0.x, r1.x, r2.x
dp3_pp_sat r1.x, r3, t2
add_pp r1.x, -r1, c8
pow_pp r2.w, r1.x, c6.x
mov_pp r1.xyz, c5
add_pp r3.xyz, -c4, r1
mov_pp r1.x, r2.w
mad_pp r2.xyz, r1.x, r3, c4
dp3_pp r1.x, t2, c0
mul_pp r3.xyz, r2, c1
max_pp r1.x, r1, c8.y
mul_pp r1.xyz, r3, r1.x
mov_pp r4.xyz, c1
mul_pp r3.xyz, c2, r4
mad r3.xyz, r3, r0.x, r1
mul_pp r1.x, r5, c8.w
mul r3.xyz, r3, r1.x
mov_pp r0.w, c1
mul_pp r1.x, c2.w, r0.w
mul r0.x, r0, r1
mad r0.w, r5.x, r0.x, c8.x
mad_pp r3.xyz, r2, t3, r3
mul r1.xyz, r2, c7.x
add_pp r0.xyz, r3, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_MainColor]
Vector 1 [_FresnelColor]
Float 2 [_FresnelPower]
Float 3 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[3], texture[1], 2D;
TXP R3.x, fragment.texcoord[4], texture[0], 2D;
MUL R1.xyz, R0.w, R0;
DP3 R0.w, fragment.texcoord[0], fragment.texcoord[0];
MUL R0.xyz, R0, R3.x;
MUL R2.xyz, R1, c[4].y;
MUL R1.xyz, R0, c[4].z;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, fragment.texcoord[0];
DP3_SAT R0.w, R0, fragment.texcoord[2];
MIN R1.xyz, R2, R1;
MUL R2.xyz, R2, R3.x;
MOV R0.xyz, c[0];
ADD R0.w, -R0, c[4].x;
ADD R0.xyz, -R0, c[1];
POW R0.w, R0.w, c[2].x;
MAD R0.xyz, R0.w, R0, c[0];
MUL R3.xyz, R0, c[3].x;
MAX R1.xyz, R1, R2;
MAD result.color.xyz, R0, R1, R3;
MOV result.color.w, c[4].x;
END
# 21 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_MainColor]
Vector 1 [_FresnelColor]
Float 2 [_FresnelPower]
Float 3 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c4, 1.00000000, 8.00000000, 2.00000000, 0
dcl t0.xyz
dcl t2.xyz
dcl t3.xy
dcl t4
texldp r0, t4, s0
texld r1, t3, s1
mul_pp r2.xyz, r1, r0.x
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c4.y
dp3_pp r3.x, t0, t0
mul_pp r2.xyz, r2, c4.z
rsq_pp r3.x, r3.x
mul_pp r3.xyz, r3.x, t0
dp3_pp_sat r3.x, r3, t2
min_pp r2.xyz, r1, r2
mul_pp r0.xyz, r1, r0.x
add_pp r3.x, -r3, c4
pow_pp r1.w, r3.x, c2.x
mov_pp r3.xyz, c1
max_pp r0.xyz, r2, r0
add_pp r3.xyz, -c0, r3
mad_pp r1.xyz, r1.w, r3, c0
mul r2.xyz, r1, c3.x
mov_pp r0.w, c4.x
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 1, 8, 2, 0 },
		{ -0.40824828, -0.70710677, 0.57735026, 128 },
		{ 0.81649655, 0, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[3], texture[2], 2D;
TEX R1, fragment.texcoord[3], texture[1], 2D;
TXP R2.x, fragment.texcoord[4], texture[0], 2D;
MUL R0.xyz, R0.w, R0;
MUL R3.xyz, R0, c[6].y;
MUL R0.xyz, R3.y, c[9];
MAD R0.xyz, R3.x, c[8], R0;
MAD R0.xyz, R3.z, c[7], R0;
DP3 R0.w, R0, R0;
RSQ R2.y, R0.w;
DP3 R0.w, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.w, R0.w;
MUL R0.xyz, R2.y, R0;
MAD R0.xyz, R0.w, fragment.texcoord[0], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV R0.x, c[7].w;
MUL R0.z, R0.x, c[1].x;
MAX R0.x, R0.y, c[6].w;
POW R2.y, R0.x, R0.z;
MUL R0.xyz, R1, R2.x;
MUL R3.xyz, R1.w, R1;
MUL R1.xyz, R3, c[6].y;
MUL R3.xyz, R1, c[0];
MUL R0.xyz, R0, c[6].z;
MUL R3.xyz, R3, R2.y;
MIN R2.yzw, R1.xxyz, R0.xxyz;
MUL R0.xyz, R0.w, fragment.texcoord[0];
DP3_SAT R0.w, R0, fragment.texcoord[2];
MUL R1.xyz, R1, R2.x;
MOV R0.xyz, c[2];
ADD R0.w, -R0, c[6].x;
MAX R1.xyz, R2.yzww, R1;
ADD R0.xyz, -R0, c[3];
POW R0.w, R0.w, c[4].x;
MAD R0.xyz, R0.w, R0, c[2];
MUL R2.xyz, R0, c[5].x;
MAD R0.xyz, R0, R1, R3;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[6].x;
END
# 41 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_ShadowMapTexture] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 1.00000000, 8.00000000, 2.00000000, 0.00000000
def c7, -0.40824831, 0.70710677, 0.57735026, 128.00000000
def c8, 0.81649655, 0.00000000, 0.57735026, 0
def c9, -0.40824828, -0.70710677, 0.57735026, 0
dcl t0.xyz
dcl t2.xyz
dcl t3.xy
dcl t4
texldp r5, t4, s0
texld r0, t3, s2
texld r3, t3, s1
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c6.y
mul r1.xyz, r0.y, c7
mad r1.xyz, r0.x, c8, r1
mad r2.xyz, r0.z, c9, r1
dp3 r0.x, r2, r2
rsq r1.x, r0.x
dp3_pp r0.x, t0, t0
mul r1.xyz, r1.x, r2
rsq_pp r0.x, r0.x
mad_pp r1.xyz, r0.x, t0, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
max_pp r2.x, r0.z, c6.w
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t2
mov_pp r1.x, c1
mul_pp r1.x, c7.w, r1
pow r4.w, r2.x, r1.x
mul_pp r1.xyz, r3.w, r3
mul_pp r2.xyz, r3, r5.x
mul_pp r3.xyz, r1, c6.y
mul_pp r1.xyz, r2, c6.z
min_pp r1.xyz, r3, r1
mul_pp r2.xyz, r3, r5.x
max_pp r2.xyz, r1, r2
mov r1.x, r4.w
mul_pp r3.xyz, r3, c0
add_pp r0.x, -r0, c6
mul r3.xyz, r3, r1.x
pow_pp r1.w, r0.x, c4.x
mov_pp r0.xyz, c3
add_pp r4.xyz, -c2, r0
mov_pp r0.x, r1.w
mad_pp r0.xyz, r0.x, r4, c2
mad_pp r1.xyz, r0, r2, r3
mul r0.xyz, r0, c5.x
mov_pp r0.w, c6.x
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry" "RenderType"="Opaque" }
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
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
ADD result.texcoord[0].xyz, -R0, c[13];
ADD result.texcoord[3].xyz, -R0, c[14];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c14.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
add oT0.xyz, -r0, c12
add oT3.xyz, -r0, c13
min r0.x, v0.z, c15
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c15.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [unity_Scale]
"!!ARBvp1.0
PARAM c[12] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[11].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[0].xyz, -R0, c[9];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[10];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
"vs_2_0
def c11, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c10.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c11
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c9
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c11.y
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].w, R0, c[12];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
ADD result.texcoord[0].xyz, -R0, c[13];
ADD result.texcoord[3].xyz, -R0, c[14];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c14.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.w, r0, c11
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
add oT0.xyz, -r0, c12
add oT3.xyz, -r0, c13
min r0.x, v0.z, c15
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c15.y
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
ADD result.texcoord[0].xyz, -R0, c[13];
ADD result.texcoord[3].xyz, -R0, c[14];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c14.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
add oT0.xyz, -r0, c12
add oT3.xyz, -r0, c13
min r0.x, v0.z, c15
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c15.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.x, vertex.position, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
ADD result.texcoord[0].xyz, -R0, c[13];
MIN R0.x, vertex.position.z, c[0].y;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[14];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c14.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
add oT0.xyz, -r0, c12
min r0.x, v0.z, c15
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c13
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c15.y
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 128, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R0.x, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.w, R1.x;
MOV result.color.w, c[6].x;
TEX R0.w, R0.x, texture[0], 2D;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
MAD R1.xyz, R1.w, fragment.texcoord[0], R0;
DP3 R2.x, R1, R1;
RSQ R2.x, R2.x;
MUL R1.xyz, R2.x, R1;
DP3 R1.y, fragment.texcoord[2], R1;
MOV R1.x, c[6].y;
MAX R2.x, R1.y, c[6];
MUL R2.y, R1.x, c[2].x;
MUL R1.xyz, R1.w, fragment.texcoord[0];
POW R1.w, R2.x, R2.y;
DP3_SAT R2.x, fragment.texcoord[2], R1;
MOV R1.xyz, c[3];
ADD R2.x, -R2, c[6].z;
POW R2.x, R2.x, c[5].x;
ADD R1.xyz, -R1, c[4];
MAD R1.xyz, R2.x, R1, c[3];
DP3 R2.x, fragment.texcoord[2], R0;
MUL R0.xyz, R1, c[0];
MAX R2.x, R2, c[6];
MOV R1.xyz, c[1];
MUL R0.xyz, R0, R2.x;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0, c[6];
MAD R0.xyz, R1, R1.w, R0;
MUL result.color.xyz, R0, R0.w;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
"ps_2_0
dcl_2d s0
def c6, 0.00000000, 128.00000000, 1.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mov_pp r0.w, c6.x
texld r5, r0, s0
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
dp3_pp r0.x, t0, t0
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r1.x, t3
mad_pp r2.xyz, r0.x, t0, r3
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, t2, r1
mul_pp r4.xyz, r0.x, t0
mov_pp r2.x, c2
mul_pp r0.x, c6.y, r2
dp3_pp_sat r2.x, t2, r4
max_pp r1.x, r1, c6
pow r4.w, r1.x, r0.x
add_pp r0.x, -r2, c6.z
pow_pp r1.x, r0.x, c5.x
mov_pp r2.xyz, c4
mov r0.x, r4.w
add_pp r4.xyz, -c3, r2
dp3_pp r2.x, t2, r3
mad_pp r3.xyz, r1.x, r4, c3
max_pp r1.x, r2, c6
mul_pp r2.xyz, r3, c0
mul_pp r3.xyz, r2, r1.x
mov_pp r2.xyz, c0
mul_pp r2.xyz, c1, r2
mul_pp r1.x, r5, c6.w
mad r0.xyz, r2, r0.x, r3
mul r0.xyz, r0, r1.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 128, 1, 2 } };
TEMP R0;
TEMP R1;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
MOV R1.xyz, fragment.texcoord[3];
RSQ R0.x, R0.x;
MAD R0.yzw, R0.x, fragment.texcoord[0].xxyz, R1.xxyz;
DP3 R1.w, R0.yzww, R0.yzww;
RSQ R1.w, R1.w;
MUL R0.yzw, R1.w, R0;
DP3 R0.z, fragment.texcoord[2], R0.yzww;
MOV R0.y, c[6];
MUL R1.w, R0.y, c[2].x;
MAX R0.w, R0.z, c[6].x;
MUL R0.xyz, R0.x, fragment.texcoord[0];
POW R0.w, R0.w, R1.w;
DP3_SAT R1.w, fragment.texcoord[2], R0;
MOV R0.xyz, c[3];
ADD R1.w, -R1, c[6].z;
POW R1.w, R1.w, c[5].x;
ADD R0.xyz, -R0, c[4];
MAD R0.xyz, R1.w, R0, c[3];
DP3 R1.w, fragment.texcoord[2], R1;
MUL R1.xyz, R0, c[0];
MAX R1.w, R1, c[6].x;
MOV R0.xyz, c[1];
MUL R1.xyz, R1, R1.w;
MUL R0.xyz, R0, c[0];
MAD R0.xyz, R0, R0.w, R1;
MUL result.color.xyz, R0, c[6].w;
MOV result.color.w, c[6].x;
END
# 28 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
"ps_2_0
def c6, 0.00000000, 128.00000000, 1.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dp3_pp r0.x, t0, t0
rsq_pp r0.x, r0.x
mov_pp r1.xyz, t3
mad_pp r2.xyz, r0.x, t0, r1
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
dp3_pp r1.x, t2, r1
mul_pp r3.xyz, r0.x, t0
mov_pp r2.x, c2
mul_pp r0.x, c6.y, r2
dp3_pp_sat r2.x, t2, r3
max_pp r1.x, r1, c6
pow r3.w, r1.x, r0.x
add_pp r0.x, -r2, c6.z
pow_pp r1.w, r0.x, c5.x
mov r0.x, r3.w
mov_pp r2.xyz, c4
add_pp r3.xyz, -c3, r2
mad_pp r3.xyz, r1.w, r3, c3
mov_pp r2.xyz, t3
dp3_pp r1.x, t2, r2
mul_pp r2.xyz, r3, c0
max_pp r1.x, r1, c6
mul_pp r1.xyz, r2, r1.x
mov_pp r3.xyz, c0
mul_pp r2.xyz, c1, r3
mad r0.xyz, r2, r0.x, r1
mul r0.xyz, r0, c6.w
mov_pp r0.w, c6.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 128, 1, 0.5 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
DP3 R0.z, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RCP R0.x, fragment.texcoord[4].w;
MAD R0.xy, fragment.texcoord[4], R0.x, c[6].w;
RSQ R2.y, R1.x;
MOV result.color.w, c[6].x;
TEX R0.w, R0, texture[0], 2D;
TEX R1.w, R0.z, texture[1], 2D;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
MAD R1.xyz, R2.y, fragment.texcoord[0], R0;
DP3 R2.x, R1, R1;
RSQ R2.x, R2.x;
MUL R1.xyz, R2.x, R1;
DP3 R1.x, fragment.texcoord[2], R1;
MOV R2.x, c[6].y;
MUL R1.y, R2.x, c[2].x;
MAX R1.x, R1, c[6];
POW R2.x, R1.x, R1.y;
MUL R1.xyz, R2.y, fragment.texcoord[0];
DP3 R2.y, fragment.texcoord[2], R0;
DP3_SAT R1.x, fragment.texcoord[2], R1;
MOV R0.xyz, c[3];
ADD R1.x, -R1, c[6].z;
POW R1.x, R1.x, c[5].x;
ADD R0.xyz, -R0, c[4];
MAD R0.xyz, R1.x, R0, c[3];
MAX R1.x, R2.y, c[6];
MUL R0.xyz, R0, c[0];
MUL R1.xyz, R0, R1.x;
MOV R0.xyz, c[1];
SLT R2.y, c[6].x, fragment.texcoord[4].z;
MUL R0.w, R2.y, R0;
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, c[7].x;
MAD R0.xyz, R0, R2.x, R1;
MUL result.color.xyz, R0, R0.w;
END
# 39 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c6, 0.00000000, 128.00000000, 1.00000000, 0.50000000
def c7, 2.00000000, 0, 0, 0
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
rcp r1.x, t4.w
mad r2.xy, t4, r1.x, c6.w
dp3 r0.x, t4, t4
mov r1.xy, r0.x
texld r0, r2, s0
texld r5, r1, s1
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
mul_pp r4.xyz, r1.x, t3
dp3_pp r0.x, t0, t0
rsq_pp r1.x, r0.x
mad_pp r3.xyz, r1.x, t0, r4
dp3_pp r0.x, r3, r3
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r0.x, r3
cmp r2.x, -t4.z, c6, c6.z
mul_pp r2.x, r2, r0.w
mul_pp r2.x, r2, r5
mul_pp r0.x, r2, c7
dp3_pp r2.x, t2, r3
mov_pp r3.x, c2
mul_pp r5.xyz, r1.x, t0
max_pp r2.x, r2, c6
mul_pp r3.x, c6.y, r3
pow r1.w, r2.x, r3.x
dp3_pp_sat r2.x, t2, r5
add_pp r2.x, -r2, c6.z
pow_pp r3.w, r2.x, c5.x
mov_pp r2.xyz, c4
add_pp r5.xyz, -c3, r2
mov_pp r2.x, r3.w
mad_pp r3.xyz, r2.x, r5, c3
dp3_pp r2.x, t2, r4
mul_pp r3.xyz, r3, c0
max_pp r2.x, r2, c6
mul_pp r2.xyz, r3, r2.x
mov_pp r4.xyz, c0
mul_pp r3.xyz, c1, r4
mad r1.xyz, r3, r1.w, r2
mul r0.xyz, r1, r0.x
mov_pp r0.w, c6.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 128, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.w, fragment.texcoord[4], texture[1], CUBE;
DP3 R0.x, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R2.y, R1.x;
MOV result.color.w, c[6].x;
TEX R0.w, R0.x, texture[0], 2D;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
MAD R1.xyz, R2.y, fragment.texcoord[0], R0;
DP3 R2.x, R1, R1;
RSQ R2.x, R2.x;
MUL R1.xyz, R2.x, R1;
DP3 R1.x, fragment.texcoord[2], R1;
MOV R2.x, c[6].y;
MUL R0.w, R0, R1;
MUL R1.y, R2.x, c[2].x;
MAX R1.x, R1, c[6];
POW R2.x, R1.x, R1.y;
MUL R1.xyz, R2.y, fragment.texcoord[0];
DP3_SAT R1.x, fragment.texcoord[2], R1;
DP3 R2.y, fragment.texcoord[2], R0;
MOV R0.xyz, c[3];
ADD R1.x, -R1, c[6].z;
POW R1.x, R1.x, c[5].x;
ADD R0.xyz, -R0, c[4];
MAD R0.xyz, R1.x, R0, c[3];
MUL R0.xyz, R0, c[0];
MAX R1.x, R2.y, c[6];
MUL R1.xyz, R0, R1.x;
MOV R0.xyz, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, c[6];
MAD R0.xyz, R0, R2.x, R1;
MUL result.color.xyz, R0, R0.w;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTextureB0] 2D 0
SetTexture 1 [_LightTexture0] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c6, 0.00000000, 128.00000000, 1.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dp3 r0.x, t4, t4
mov r0.xy, r0.x
texld r5, r0, s0
texld r0, t4, s1
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
mul_pp r4.xyz, r1.x, t3
dp3_pp r0.x, t0, t0
rsq_pp r1.x, r0.x
mad_pp r3.xyz, r1.x, t0, r4
dp3_pp r0.x, r3, r3
rsq_pp r2.x, r0.x
mul_pp r2.xyz, r2.x, r3
dp3_pp r2.x, t2, r2
mov_pp r3.x, c2
mul r0.x, r5, r0.w
mul_pp r5.xyz, r1.x, t0
max_pp r2.x, r2, c6
mul_pp r3.x, c6.y, r3
pow r1.w, r2.x, r3.x
dp3_pp_sat r2.x, t2, r5
add_pp r2.x, -r2, c6.z
pow_pp r3.w, r2.x, c5.x
mov_pp r2.xyz, c4
add_pp r5.xyz, -c3, r2
mov_pp r2.x, r3.w
mad_pp r3.xyz, r2.x, r5, c3
dp3_pp r2.x, t2, r4
mul_pp r3.xyz, r3, c0
max_pp r2.x, r2, c6
mul_pp r2.xyz, r3, r2.x
mov_pp r4.xyz, c0
mul_pp r0.x, r0, c6.w
mul_pp r3.xyz, c1, r4
mad r1.xyz, r3, r1.w, r2
mul r0.xyz, r1, r0.x
mov_pp r0.w, c6.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 0, 128, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.w, fragment.texcoord[4], texture[0], 2D;
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.w, R1.x;
MOV R0.xyz, fragment.texcoord[3];
MAD R1.xyz, R1.w, fragment.texcoord[0], R0;
DP3 R2.x, R1, R1;
RSQ R2.x, R2.x;
MUL R1.xyz, R2.x, R1;
DP3 R1.y, fragment.texcoord[2], R1;
MOV R1.x, c[6].y;
MAX R2.x, R1.y, c[6];
MUL R2.y, R1.x, c[2].x;
MUL R1.xyz, R1.w, fragment.texcoord[0];
POW R1.w, R2.x, R2.y;
DP3_SAT R2.x, fragment.texcoord[2], R1;
MOV R1.xyz, c[3];
ADD R2.x, -R2, c[6].z;
POW R2.x, R2.x, c[5].x;
ADD R1.xyz, -R1, c[4];
MAD R1.xyz, R2.x, R1, c[3];
DP3 R2.x, fragment.texcoord[2], R0;
MUL R0.xyz, R1, c[0];
MAX R2.x, R2, c[6];
MOV R1.xyz, c[1];
MUL R0.xyz, R0, R2.x;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0, c[6];
MAD R0.xyz, R1, R1.w, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[6].x;
END
# 30 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_SpecColor]
Float 2 [_Shininess]
Vector 3 [_MainColor]
Vector 4 [_FresnelColor]
Float 5 [_FresnelPower]
SetTexture 0 [_LightTexture0] 2D 0
"ps_2_0
dcl_2d s0
def c6, 0.00000000, 128.00000000, 1.00000000, 2.00000000
dcl t0.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xy
texld r0, t4, s0
dp3_pp r0.x, t0, t0
mov_pp r1.xyz, t3
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t0, r1
dp3_pp r1.x, r2, r2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, r2
mul_pp r2.xyz, r0.x, t0
dp3_pp r1.x, t2, r1
dp3_pp_sat r3.x, t2, r2
mov_pp r0.x, c2
mul_pp r2.x, c6.y, r0
add_pp r0.x, -r3, c6.z
max_pp r1.x, r1, c6
pow r3.w, r1.x, r2.x
pow_pp r1.x, r0.x, c5.x
mov r0.x, r3.w
mov_pp r2.xyz, t3
mov_pp r3.xyz, c4
add_pp r3.xyz, -c3, r3
mad_pp r3.xyz, r1.x, r3, c3
dp3_pp r2.x, t2, r2
max_pp r1.x, r2, c6
mul_pp r2.xyz, r3, c0
mul_pp r3.xyz, r2, r1.x
mul_pp r1.x, r0.w, c6.w
mov_pp r2.xyz, c0
mul_pp r2.xyz, c1, r2
mad r0.xyz, r2, r0.x, r3
mul r0.xyz, r0, r1.x
mov_pp r0.w, c6.x
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry" "RenderType"="Opaque" }
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"!!ARBvp1.0
PARAM c[10] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[9].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MIN R0.x, vertex.position.z, c[0].y;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[0].x, R0, c[0];
END
# 10 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
"vs_2_0
def c9, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r0.xyz, v1, c8.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
min r0.x, v0.z, c9
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT0.x, r0, c9.y
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Float 0 [_Shininess]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5 } };
MAD result.color.xyz, fragment.texcoord[1], c[1].x, c[1].x;
MOV result.color.w, c[0].x;
END
# 2 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Shininess]
"ps_2_0
def c1, 0.50000000, 0, 0, 0
dcl t1.xyz
mad_pp r0.xyz, t1, c1.x, c1.x
mov_pp r0.w, c0.x
mov_pp oC0, r0
"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry" "RenderType"="Opaque" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
// Platform d3d11_9x had shader errors
//   Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
//   Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
//   Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R2.xyz, vertex.normal, c[22].w;
DP3 R2.w, R2, c[6];
DP3 R1.x, R2, c[5];
MOV R1.y, R2.w;
DP3 R1.z, R2, c[7];
MUL R0, R1.xyzz, R1.yzzx;
MOV R1.w, c[0].x;
DP4 R4.z, R0, c[20];
DP4 R4.x, R0, c[18];
DP4 R4.y, R0, c[19];
MUL R0.w, R2, R2;
MAD R0.w, R1.x, R1.x, -R0;
DP4 R3.z, R1, c[17];
DP4 R3.y, R1, c[16];
DP4 R3.x, R1, c[15];
ADD R3.xyz, R3, R4;
MUL R4.xyz, R0.w, c[21];
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[13];
ADD result.texcoord[4].xyz, R3, R4;
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[22].w, -vertex.position;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R4.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
DP3 result.texcoord[0].y, R3, R1;
DP3 result.texcoord[0].z, vertex.normal, R3;
DP3 result.texcoord[0].x, R3, vertex.attrib[14];
MUL R3.y, R4, c[14].x;
MOV R3.x, R4;
ADD result.texcoord[2].xy, R3, R4.z;
DP3 result.texcoord[3].y, R1, R2;
MOV result.texcoord[2].zw, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 46 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r2.xyz, v2, c22.w
dp3 r2.w, r2, c5
dp3 r0.x, r2, c4
mov r0.y, r2.w
dp3 r0.z, r2, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.x
dp4 r3.z, r0, c17
dp4 r3.y, r0, c16
dp4 r3.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r4.z, r1, c20
dp4 r4.y, r1, c19
dp4 r4.x, r1, c18
add r3.xyz, r3, r4
mul r4.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c12
add oT4.xyz, r3, r4
mov r0.w, c23.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c22.w, -v0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r4.xyz, r0.xyww, c23.z
mov oPos, r0
min r0.x, v0.z, c23
dp3 oT0.y, r3, r1
dp3 oT0.z, v2, r3
dp3 oT0.x, r3, v1
mul r3.y, r4, c13.x
mov r3.x, r4
mad oT2.xy, r4.z, c14.zwzw, r3
dp3 oT3.y, r1, r2
mov oT2.zw, r0
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
max oT1.x, r0, c23.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[22] = { { 1, 0, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[17];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R2.xyz, R2, c[20].w, -vertex.position;
DP3 result.texcoord[0].y, R2, R1;
DP3 result.texcoord[0].z, vertex.normal, R2;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R3.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[0].x, R2, vertex.attrib[14];
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MUL R2.y, R3, c[18].x;
MOV R2.x, R3;
ADD result.texcoord[2].xy, R2, R3.z;
MUL R2.xyz, vertex.normal, c[20].w;
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
ADD R0.xyz, R0, -c[19];
MUL result.texcoord[5].xyz, R0, c[19].w;
MOV R0.x, c[0];
ADD R0.z, R0.x, -c[19].w;
MIN R0.y, vertex.position.z, c[0].x;
DP4 R0.x, vertex.position, c[3];
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.z;
MAX result.texcoord[1].x, R0.y, c[0].y;
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c16
mov r0.w, c22.x
dp4 r2.z, r0, c14
dp4 r2.x, r0, c12
dp4 r2.y, r0, c13
mad r2.xyz, r2, c20.w, -v0
dp3 oT0.y, r2, r1
dp3 oT0.z, v2, r2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r3.xyz, r0.xyww, c22.z
dp3 oT0.x, r2, v1
mov oPos, r0
mov oT2.zw, r0
mul r2.y, r3, c17.x
mov r2.x, r3
mad oT2.xy, r3.z, c18.zwzw, r2
mul r2.xyz, v2, c20.w
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
add r0.xyz, r0, -c19
mul oT5.xyz, r0, c19.w
mov r0.y, c19.w
add r0.z, c22.x, -r0.y
min r0.x, v0.z, c22
dp4 r0.y, v0, c2
dp3 oT3.y, r1, r2
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
mad oT4.xy, v3, c21, c21.zwzw
mul oT5.w, -r0.y, r0.z
max oT1.x, r0, c22.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[13] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[9];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[7];
DP4 R2.x, R0, c[5];
DP4 R2.y, R0, c[6];
MAD R2.xyz, R2, c[11].w, -vertex.position;
DP3 result.texcoord[0].y, R2, R1;
DP3 result.texcoord[0].z, vertex.normal, R2;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R3.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[0].x, R2, vertex.attrib[14];
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
MUL R2.y, R3, c[10].x;
MOV R2.x, R3;
ADD result.texcoord[2].xy, R2, R3.z;
MUL R2.xyz, vertex.normal, c[11].w;
DP3 result.texcoord[3].y, R1, R2;
MOV result.texcoord[2].zw, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[12], c[12].zwzw;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 30 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"vs_2_0
def c13, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c8
mov r0.w, c13.x
dp4 r2.z, r0, c6
dp4 r2.x, r0, c4
dp4 r2.y, r0, c5
mad r2.xyz, r2, c11.w, -v0
dp3 oT0.y, r2, r1
dp3 oT0.z, v2, r2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r3.xyz, r0.xyww, c13.z
dp3 oT0.x, r2, v1
mov oPos, r0
min r0.x, v0.z, c13
mul r2.y, r3, c9.x
mov r2.x, r3
mad oT2.xy, r3.z, c10.zwzw, r2
mul r2.xyz, v2, c11.w
dp3 oT3.y, r1, r2
mov oT2.zw, r0
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
mad oT4.xy, v3, c12, c12.zwzw
max oT1.x, r0, c13.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R2.xyz, vertex.normal, c[22].w;
DP3 R2.w, R2, c[6];
DP3 R1.x, R2, c[5];
MOV R1.y, R2.w;
DP3 R1.z, R2, c[7];
MUL R0, R1.xyzz, R1.yzzx;
MOV R1.w, c[0].x;
DP4 R4.z, R0, c[20];
DP4 R4.x, R0, c[18];
DP4 R4.y, R0, c[19];
MUL R0.w, R2, R2;
MAD R0.w, R1.x, R1.x, -R0;
DP4 R3.z, R1, c[17];
DP4 R3.y, R1, c[16];
DP4 R3.x, R1, c[15];
ADD R3.xyz, R3, R4;
MUL R4.xyz, R0.w, c[21];
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[13];
ADD result.texcoord[4].xyz, R3, R4;
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[22].w, -vertex.position;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R4.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
DP3 result.texcoord[0].y, R3, R1;
DP3 result.texcoord[0].z, vertex.normal, R3;
DP3 result.texcoord[0].x, R3, vertex.attrib[14];
MUL R3.y, R4, c[14].x;
MOV R3.x, R4;
ADD result.texcoord[2].xy, R3, R4.z;
DP3 result.texcoord[3].y, R1, R2;
MOV result.texcoord[2].zw, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 46 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mul r2.xyz, v2, c22.w
dp3 r2.w, r2, c5
dp3 r0.x, r2, c4
mov r0.y, r2.w
dp3 r0.z, r2, c6
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.x
dp4 r3.z, r0, c17
dp4 r3.y, r0, c16
dp4 r3.x, r0, c15
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r4.z, r1, c20
dp4 r4.y, r1, c19
dp4 r4.x, r1, c18
add r3.xyz, r3, r4
mul r4.xyz, r0.w, c21
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c12
add oT4.xyz, r3, r4
mov r0.w, c23.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c22.w, -v0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r4.xyz, r0.xyww, c23.z
mov oPos, r0
min r0.x, v0.z, c23
dp3 oT0.y, r3, r1
dp3 oT0.z, v2, r3
dp3 oT0.x, r3, v1
mul r3.y, r4, c13.x
mov r3.x, r4
mad oT2.xy, r4.z, c14.zwzw, r3
dp3 oT3.y, r1, r2
mov oT2.zw, r0
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
max oT1.x, r0, c23.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[22] = { { 1, 0, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[17];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R2.xyz, R2, c[20].w, -vertex.position;
DP3 result.texcoord[0].y, R2, R1;
DP3 result.texcoord[0].z, vertex.normal, R2;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R3.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[0].x, R2, vertex.attrib[14];
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MUL R2.y, R3, c[18].x;
MOV R2.x, R3;
ADD result.texcoord[2].xy, R2, R3.z;
MUL R2.xyz, vertex.normal, c[20].w;
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
ADD R0.xyz, R0, -c[19];
MUL result.texcoord[5].xyz, R0, c[19].w;
MOV R0.x, c[0];
ADD R0.z, R0.x, -c[19].w;
MIN R0.y, vertex.position.z, c[0].x;
DP4 R0.x, vertex.position, c[3];
DP3 result.texcoord[3].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.z;
MAX result.texcoord[1].x, R0.y, c[0].y;
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
"vs_2_0
def c22, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c16
mov r0.w, c22.x
dp4 r2.z, r0, c14
dp4 r2.x, r0, c12
dp4 r2.y, r0, c13
mad r2.xyz, r2, c20.w, -v0
dp3 oT0.y, r2, r1
dp3 oT0.z, v2, r2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r3.xyz, r0.xyww, c22.z
dp3 oT0.x, r2, v1
mov oPos, r0
mov oT2.zw, r0
mul r2.y, r3, c17.x
mov r2.x, r3
mad oT2.xy, r3.z, c18.zwzw, r2
mul r2.xyz, v2, c20.w
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
add r0.xyz, r0, -c19
mul oT5.xyz, r0, c19.w
mov r0.y, c19.w
add r0.z, c22.x, -r0.y
min r0.x, v0.z, c22
dp4 r0.y, v0, c2
dp3 oT3.y, r1, r2
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
mad oT4.xy, v3, c21, c21.zwzw
mul oT5.w, -r0.y, r0.z
max oT1.x, r0, c22.y
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[13] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[9];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[7];
DP4 R2.x, R0, c[5];
DP4 R2.y, R0, c[6];
MAD R2.xyz, R2, c[11].w, -vertex.position;
DP3 result.texcoord[0].y, R2, R1;
DP3 result.texcoord[0].z, vertex.normal, R2;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R3.xyz, R0.xyww, c[0].z;
DP3 result.texcoord[0].x, R2, vertex.attrib[14];
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
MUL R2.y, R3, c[10].x;
MOV R2.x, R3;
ADD result.texcoord[2].xy, R2, R3.z;
MUL R2.xyz, vertex.normal, c[11].w;
DP3 result.texcoord[3].y, R1, R2;
MOV result.texcoord[2].zw, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[12], c[12].zwzw;
MAX result.texcoord[1].x, R0, c[0].y;
END
# 30 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [unity_LightmapST]
"vs_2_0
def c13, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord1 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c8
mov r0.w, c13.x
dp4 r2.z, r0, c6
dp4 r2.x, r0, c4
dp4 r2.y, r0, c5
mad r2.xyz, r2, c11.w, -v0
dp3 oT0.y, r2, r1
dp3 oT0.z, v2, r2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r3.xyz, r0.xyww, c13.z
dp3 oT0.x, r2, v1
mov oPos, r0
min r0.x, v0.z, c13
mul r2.y, r3, c9.x
mov r2.x, r3
mad oT2.xy, r3.z, c10.zwzw, r2
mul r2.xyz, v2, c11.w
dp3 oT3.y, r1, r2
mov oT2.zw, r0
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
mad oT4.xy, v3, c12, c12.zwzw
max oT1.x, r0, c13.y
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R0, fragment.texcoord[2], texture[0], 2D;
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[0];
DP3_SAT R1.w, R1, fragment.texcoord[3];
MOV R1.xyz, c[1];
ADD R1.w, -R1, c[5].x;
LG2 R0.w, R0.w;
POW R1.w, R1.w, c[3].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R1.w, R1, c[1];
MOV R1.w, c[5].x;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
ADD R0.xyz, -R0, fragment.texcoord[4];
MUL R2.xyz, R0, c[0];
MUL R2.xyz, R2, -R0.w;
MAD R0.xyz, R1, R0, R2;
MUL R1.xyz, R1, c[4].x;
ADD result.color.xyz, R0, R1;
MAD result.color.w, -R0, c[0], R1;
END
# 22 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
"ps_2_0
dcl_2d s0
def c5, 1.00000000, 0, 0, 0
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xyz
texldp r0, t2, s0
log_pp r1.x, r0.x
dp3_pp r0.x, t0, t0
log_pp r1.y, r0.y
log_pp r1.z, r0.z
add_pp r1.xyz, -r1, t4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t3
add_pp r0.x, -r0, c5
pow_pp r4.x, r0.x, c3.x
mov_pp r0.xyz, c2
mul_pp r2.xyz, r1, c0
log_pp r3.x, r0.w
mul_pp r2.xyz, r2, -r3.x
add_pp r0.xyz, -c1, r0
mad_pp r0.xyz, r4.x, r0, c1
mad_pp r1.xyz, r0, r1, r2
mov_pp r2.x, c5
mul r0.xyz, r0, c4.x
mad_pp r0.w, -r3.x, c0, r2.x
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R0, fragment.texcoord[2], texture[0], 2D;
TEX R1, fragment.texcoord[4], texture[1], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
MUL R1.xyz, R1.w, R1;
DP4 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R2.xyz, R2.w, R2;
MUL R2.xyz, R2, c[6].y;
RSQ R1.w, R1.w;
RCP R1.w, R1.w;
MAD R1.xyz, R1, c[6].y, -R2;
MAD_SAT R1.w, R1, c[5].z, c[5];
MAD R1.xyz, R1.w, R1, R2;
DP3 R1.w, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, fragment.texcoord[0];
DP3_SAT R1.w, R2, fragment.texcoord[3];
MOV R2.xyz, c[1];
ADD R1.w, -R1, c[6].x;
LG2 R0.w, R0.w;
POW R1.w, R1.w, c[3].x;
ADD R2.xyz, -R2, c[2];
MAD R2.xyz, R1.w, R2, c[1];
MOV R1.w, c[6].x;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R0.xyz, -R0, R1;
MUL R1.xyz, R0, c[0];
MUL R1.xyz, R1, -R0.w;
MAD R0.xyz, R2, R0, R1;
MUL R1.xyz, R2, c[4].x;
ADD result.color.xyz, R0, R1;
MAD result.color.w, -R0, c[0], R1;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 8.00000000, 1.00000000, 0, 0
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xy
dcl t5
texldp r0, t2, s0
texld r1, t4, s1
texld r2, t4, s2
mul_pp r2.xyz, r2.w, r2
dp4 r3.x, t5, t5
rsq r3.x, r3.x
rcp r3.x, r3.x
mul_pp r2.xyz, r2, c6.x
mul_pp r1.xyz, r1.w, r1
mad_pp r1.xyz, r1, c6.x, -r2
mad_sat r3.x, r3, c5.z, c5.w
mad_pp r1.xyz, r3.x, r1, r2
log_pp r2.x, r0.x
dp3_pp r0.x, t0, t0
log_pp r2.y, r0.y
log_pp r2.z, r0.z
add_pp r1.xyz, -r2, r1
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t3
add_pp r0.x, -r0, c6.y
pow_pp r4.x, r0.x, c3.x
mov_pp r0.xyz, c2
mul_pp r2.xyz, r1, c0
log_pp r3.x, r0.w
mul_pp r2.xyz, r2, -r3.x
add_pp r0.xyz, -c1, r0
mad_pp r0.xyz, r4.x, r0, c1
mad_pp r1.xyz, r0, r1, r2
mov_pp r2.y, c6
mul r0.xyz, r0, c4.x
mad_pp r0.w, -r3.x, c0, r2.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 1, 8, 0, 128 },
		{ -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R1, fragment.texcoord[2], texture[0], 2D;
TEX R0, fragment.texcoord[4], texture[1], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
MUL R2.xyz, R2.w, R2;
MUL R2.xyz, R2, c[6].y;
MUL R3.xyz, R2.y, c[9];
MAD R3.xyz, R2.x, c[8], R3;
MAD R2.xyz, R2.z, c[7], R3;
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R3.xyz, R2.w, R2;
DP3 R3.w, fragment.texcoord[0], fragment.texcoord[0];
RSQ R2.z, R3.w;
MAD R3.xyz, R2.z, fragment.texcoord[0], R3;
DP3 R2.x, R3, R3;
RSQ R2.w, R2.x;
MUL R2.w, R2, R3.z;
MOV R2.xy, c[6].xwzw;
MUL R0.xyz, R0.w, R0;
MUL R3.xyz, R0, c[6].y;
MUL R2.y, R2, c[1].x;
MAX R2.w, R2, c[6].z;
POW R3.w, R2.w, R2.y;
LG2 R1.x, R1.x;
LG2 R1.y, R1.y;
LG2 R1.z, R1.z;
LG2 R1.w, R1.w;
ADD R0, -R1, R3;
MUL R3.xyz, R2.z, fragment.texcoord[0];
DP3_SAT R1.w, R3, fragment.texcoord[3];
MUL R1.xyz, R0, c[0];
MOV R3.xyz, c[2];
ADD R1.w, -R1, c[6].x;
MUL R2.yzw, R0.w, R1.xxyz;
ADD R3.xyz, -R3, c[3];
POW R1.w, R1.w, c[4].x;
MAD R3.xyz, R1.w, R3, c[2];
MUL R1.xyz, R3, c[5].x;
MAD R0.xyz, R3, R0, R2.yzww;
ADD result.color.xyz, R0, R1;
MAD result.color.w, R0, c[0], R2.x;
END
# 41 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 8.00000000, -0.40824831, 0.70710677, 0.57735026
def c7, 0.81649655, 0.00000000, 0.57735026, 128.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 1.00000000
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xy
texld r3, t4, s1
texld r0, t4, s2
texldp r4, t2, s0
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r0, c6.x
mov r0.x, c6.y
mov r0.z, c6.w
mov r0.y, c6.z
mul r0.xyz, r1.y, r0
mad r0.xyz, r1.x, c7, r0
mad r2.xyz, r1.z, c8, r0
dp3 r0.x, r2, r2
rsq r1.x, r0.x
dp3_pp r0.x, t0, t0
mul r1.xyz, r1.x, r2
rsq_pp r0.x, r0.x
mad_pp r1.xyz, r0.x, t0, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
max_pp r2.x, r0.z, c7.y
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t3
mov_pp r1.x, c1
mul_pp r1.x, c7.w, r1
pow r5.x, r2.x, r1.x
mul_pp r2.xyz, r3.w, r3
mov r2.w, r5.x
log_pp r1.x, r4.x
log_pp r1.y, r4.y
log_pp r1.z, r4.z
mul_pp r2.xyz, r2, c6.x
log_pp r1.w, r4.w
add_pp r1, -r1, r2
mul_pp r2.xyz, r1, c0
mov_pp r0.w, c8
add_pp r0.x, -r0, c8.w
mul_pp r3.xyz, r1.w, r2
pow_pp r2.x, r0.x, c4.x
mov_pp r0.xyz, c3
add_pp r4.xyz, -c2, r0
mov_pp r0.x, r2.x
mad_pp r0.xyz, r0.x, r4, c2
mad_pp r1.xyz, r0, r1, r3
mul r0.xyz, r0, c5.x
mad_pp r0.w, r1, c0, r0
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R0, fragment.texcoord[2], texture[0], 2D;
ADD R0.xyz, R0, fragment.texcoord[4];
MUL R2.xyz, R0, c[0];
DP3 R1.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[0];
DP3_SAT R1.w, R1, fragment.texcoord[3];
MOV R1.xyz, c[1];
ADD R1.w, -R1, c[5].x;
POW R1.w, R1.w, c[3].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R1.w, R1, c[1];
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, R0, R2;
MUL R1.xyz, R1, c[4].x;
MOV R1.w, c[5].x;
ADD result.color.xyz, R0, R1;
MAD result.color.w, R0, c[0], R1;
END
# 18 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
"ps_2_0
dcl_2d s0
def c5, 1.00000000, 0, 0, 0
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xyz
texldp r0, t2, s0
add_pp r0.xyz, r0, t4
mul_pp r2.xyz, r0, c0
dp3_pp r1.x, t0, t0
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t0
dp3_pp_sat r1.x, r1, t3
add_pp r1.x, -r1, c5
pow_pp r3.x, r1.x, c3.x
mov_pp r1.xyz, c2
mul_pp r2.xyz, r0.w, r2
add_pp r1.xyz, -c1, r1
mad_pp r1.xyz, r3.x, r1, c1
mad_pp r0.xyz, r1, r0, r2
mov_pp r2.x, c5
mul r1.xyz, r1, c4.x
mad_pp r0.w, r0, c0, r2.x
add_pp r0.xyz, r0, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[4], texture[1], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TXP R0, fragment.texcoord[2], texture[0], 2D;
MUL R1.xyz, R1.w, R1;
DP4 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R2.xyz, R2.w, R2;
MUL R2.xyz, R2, c[6].y;
RSQ R1.w, R1.w;
RCP R1.w, R1.w;
MAD R1.xyz, R1, c[6].y, -R2;
MAD_SAT R1.w, R1, c[5].z, c[5];
MAD R1.xyz, R1.w, R1, R2;
ADD R1.xyz, R0, R1;
DP3 R1.w, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R1.w;
MUL R2.xyz, R1, c[0];
MUL R0.xyz, R0.x, fragment.texcoord[0];
DP3_SAT R1.w, R0, fragment.texcoord[3];
MOV R0.xyz, c[1];
ADD R1.w, -R1, c[6].x;
POW R1.w, R1.w, c[3].x;
ADD R0.xyz, -R0, c[2];
MAD R0.xyz, R1.w, R0, c[1];
MUL R2.xyz, R0.w, R2;
MAD R1.xyz, R0, R1, R2;
MUL R0.xyz, R0, c[4].x;
MOV R1.w, c[6].x;
ADD result.color.xyz, R1, R0;
MAD result.color.w, R0, c[0], R1;
END
# 29 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Vector 1 [_MainColor]
Vector 2 [_FresnelColor]
Float 3 [_FresnelPower]
Float 4 [_EmissiveStrength]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 8.00000000, 1.00000000, 0, 0
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xy
dcl t5
texldp r2, t2, s0
texld r1, t4, s1
texld r0, t4, s2
mul_pp r3.xyz, r0.w, r0
dp4 r0.x, t5, t5
mul_pp r1.xyz, r1.w, r1
mul_pp r3.xyz, r3, c6.x
mad_pp r4.xyz, r1, c6.x, -r3
rsq r0.x, r0.x
rcp r1.x, r0.x
dp3_pp r0.x, t0, t0
mad_sat r1.x, r1, c5.z, c5.w
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t3
mad_pp r1.xyz, r1.x, r4, r3
add_pp r2.xyz, r2, r1
mul_pp r1.xyz, r2, c0
add_pp r0.x, -r0, c6.y
mul_pp r3.xyz, r2.w, r1
pow_pp r1.w, r0.x, c3.x
mov_pp r0.xyz, c2
add_pp r4.xyz, -c1, r0
mov_pp r0.x, r1.w
mad_pp r1.xyz, r0.x, r4, c1
mad_pp r2.xyz, r1, r2, r3
mov_pp r0.y, c6
mad_pp r0.w, r2, c0, r0.y
mul r1.xyz, r1, c4.x
add_pp r0.xyz, r2, r1
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"!!ARBfp1.0
PARAM c[10] = { program.local[0..5],
		{ 1, 8, 0, 128 },
		{ -0.40824828, -0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TEX R1, fragment.texcoord[4], texture[1], 2D;
TXP R0, fragment.texcoord[2], texture[0], 2D;
MUL R2.xyz, R2.w, R2;
MUL R2.xyz, R2, c[6].y;
MUL R3.xyz, R2.y, c[9];
MAD R3.xyz, R2.x, c[8], R3;
MAD R2.xyz, R2.z, c[7], R3;
DP3 R2.w, R2, R2;
RSQ R3.x, R2.w;
MUL R1.xyz, R1.w, R1;
DP3 R2.w, fragment.texcoord[0], fragment.texcoord[0];
MUL R2.xyz, R3.x, R2;
RSQ R3.x, R2.w;
MAD R2.xyz, R3.x, fragment.texcoord[0], R2;
DP3 R2.x, R2, R2;
RSQ R2.x, R2.x;
MUL R2.y, R2.x, R2.z;
MOV R2.xw, c[6].wyzx;
MAX R2.y, R2, c[6].z;
MUL R2.x, R2, c[1];
POW R1.w, R2.y, R2.x;
MUL R1.xyz, R1, c[6].y;
ADD R0, R0, R1;
MUL R1.xyz, R3.x, fragment.texcoord[0];
DP3_SAT R1.w, R1, fragment.texcoord[3];
MUL R2.xyz, R0, c[0];
MOV R1.xyz, c[2];
ADD R1.w, -R1, c[6].x;
ADD R1.xyz, -R1, c[3];
POW R1.w, R1.w, c[4].x;
MAD R1.xyz, R1.w, R1, c[2];
MUL R2.xyz, R0.w, R2;
MUL R3.xyz, R1, c[5].x;
MAD R0.xyz, R1, R0, R2;
ADD result.color.xyz, R0, R3;
MAD result.color.w, R0, c[0], R2;
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_SpecColor]
Float 1 [_Shininess]
Vector 2 [_MainColor]
Vector 3 [_FresnelColor]
Float 4 [_FresnelPower]
Float 5 [_EmissiveStrength]
SetTexture 0 [_LightBuffer] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [unity_LightmapInd] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 8.00000000, -0.40824831, 0.70710677, 0.57735026
def c7, 0.81649655, 0.00000000, 0.57735026, 128.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 1.00000000
dcl t0.xyz
dcl t2
dcl t3.xyz
dcl t4.xy
texldp r4, t2, s0
texld r0, t4, s2
texld r3, t4, s1
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r0, c6.x
mov r0.x, c6.y
mov r0.z, c6.w
mov r0.y, c6.z
mul r0.xyz, r1.y, r0
mad r0.xyz, r1.x, c7, r0
mad r2.xyz, r1.z, c8, r0
dp3 r0.x, r2, r2
rsq r1.x, r0.x
dp3_pp r0.x, t0, t0
mul r1.xyz, r1.x, r2
rsq_pp r0.x, r0.x
mad_pp r1.xyz, r0.x, t0, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
max_pp r2.x, r0.z, c7.y
mul_pp r0.xyz, r0.x, t0
dp3_pp_sat r0.x, r0, t3
mov_pp r1.x, c1
mul_pp r1.x, c7.w, r1
pow r5.x, r2.x, r1.x
mul_pp r1.xyz, r3.w, r3
add_pp r0.x, -r0, c8.w
mov r1.w, r5.x
mul_pp r1.xyz, r1, c6.x
add_pp r1, r4, r1
mul_pp r2.xyz, r1, c0
mul_pp r3.xyz, r1.w, r2
pow_pp r2.x, r0.x, c4.x
mov_pp r0.xyz, c3
mov_pp r0.w, c8
add_pp r4.xyz, -c2, r0
mov_pp r0.x, r2.x
mad_pp r0.xyz, r0.x, r4, c2
mad_pp r1.xyz, r0, r1, r3
mul r0.xyz, r0, c5.x
mad_pp r0.w, r1, c0, r0
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}