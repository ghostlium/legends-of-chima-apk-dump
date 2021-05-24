//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_ChiUp Surface" {
Properties {
 _MainColor ("Color", Color) = (1,1,1,1)
 _FresnelColor ("Fresnel Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,1)) = 0.078125
 _EmissiveStrength ("Emissive Strength", Float) = 1
 _FresnelPower ("Fresnel Power", Range(0,3)) = 0.8
}
SubShader { 
 LOD 300
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent" "RenderType"="Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha
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
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
"!!ARBvp1.0
PARAM c[11] = { { 0, 1 },
		state.matrix.mvp,
		program.local[5..10] };
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
MOV result.texcoord[3].xyz, c[0].x;
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
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
"vs_2_0
def c10, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r1.xyz, v1, c9.w
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c10
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c10.y
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c10.y
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
"!!ARBvp1.0
PARAM c[12] = { { 0, 1, 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
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
MOV result.texcoord[3].xyz, c[0].x;
MAX result.texcoord[1].x, R0, c[0];
END
# 20 instructions, 2 R-regs
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
Vector 11 [unity_Scale]
"vs_2_0
def c12, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.z
mov oPos, r0
mul r1.y, r1, c9.x
mad oT4.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT4.zw, r0
dp4 r0.x, v0, c4
dp4 r0.z, v0, c6
dp4 r0.y, v0, c5
add oT0.xyz, -r0, c8
min r0.x, v0.z, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c12.y
max oT1.x, r0, c12.y
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
Vector 18 [unity_Scale]
"!!ARBvp1.0
PARAM c[19] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[18].w;
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[11];
DP3 R4.z, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.x, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[10];
DP4 R4.xy, vertex.position, c[7];
MUL R2, R2, R2;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[12];
MAD R2, R1, R1, R2;
MAD R0, R3.x, R1, R0;
MUL R1, R2, c[13];
ADD R1, R1, c[0].x;
MOV R5.z, R3.x;
MOV R5.y, R4.z;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.z, R1.z;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.w, R2.w;
RSQ R2.z, R2.z;
MUL R0, R0, R2;
MAX R0, R0, c[0].y;
RCP R1.w, R1.w;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[15];
MAD R1.xyz, R0.x, c[14], R1;
MAD R0.xyz, R0.z, c[16], R1;
MAD result.texcoord[3].xyz, R0.w, c[17], R0;
MIN R0.x, vertex.position.z, c[0];
MOV R3.x, R4.w;
MOV R3.y, R4;
MOV result.texcoord[2].xyz, R5;
ADD result.texcoord[0].xyz, -R3.wxyw, c[9];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MAX result.texcoord[1].x, R0, c[0].y;
END
# 45 instructions, 6 R-regs
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
Vector 17 [unity_Scale]
"vs_2_0
def c18, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mul r3.xyz, v1, c17.w
dp4 r4.zw, v0, c5
add r2, -r4.z, c10
dp3 r4.z, r3, c5
dp3 r5.x, r3, c4
dp3 r3.x, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c9
dp4 r4.xy, v0, c6
mul r2, r2, r2
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c11
mad r2, r1, r1, r2
mad r0, r3.x, r1, r0
mul r1, r2, c12
add r1, r1, c18.x
mov r5.z, r3.x
mov r5.y, r4.z
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.z, r1.z
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.w, r2.w
rsq r2.z, r2.z
mul r0, r0, r2
max r0, r0, c18.y
rcp r1.w, r1.w
mul r0, r0, r1
mul r1.xyz, r0.y, c14
mad r1.xyz, r0.x, c13, r1
mad r0.xyz, r0.z, c15, r1
mad oT3.xyz, r0.w, c16, r0
min r0.x, v0.z, c18
mov r3.x, r4.w
mov r3.y, r4
mov oT2.xyz, r5
add oT0.xyz, -r3.wxyw, c8
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
max oT1.x, r0, c18.y
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
Vector 19 [unity_Scale]
"!!ARBvp1.0
PARAM c[20] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[19].w;
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[12];
DP3 R4.z, R3, c[6];
DP3 R5.x, R3, c[5];
DP3 R3.x, R3, c[7];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[11];
DP4 R4.xy, vertex.position, c[7];
MUL R2, R2, R2;
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[13];
MAD R2, R1, R1, R2;
MAD R0, R3.x, R1, R0;
MUL R1, R2, c[14];
ADD R1, R1, c[0].x;
MOV R5.z, R3.x;
MOV R5.y, R4.z;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
MAX R0, R0, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MUL R1, R0, R1;
MUL R0.xyz, R1.y, c[16];
MAD R0.xyz, R1.x, c[15], R0;
MAD R1.xyz, R1.z, c[17], R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
MAD result.texcoord[3].xyz, R1.w, c[18], R1;
MOV result.position, R0;
MIN R0.x, vertex.position.z, c[0];
MUL R1.y, R2, c[10].x;
MOV R1.x, R2;
MOV R3.y, R4;
MOV R3.x, R4.w;
ADD result.texcoord[4].xy, R1, R2.z;
MOV result.texcoord[2].xyz, R5;
MOV result.texcoord[4].zw, R0;
ADD result.texcoord[0].xyz, -R3.wxyw, c[9];
MAX result.texcoord[1].x, R0, c[0].y;
END
# 51 instructions, 6 R-regs
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
Vector 19 [unity_Scale]
"vs_2_0
def c20, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
mul r3.xyz, v1, c19.w
dp4 r4.zw, v0, c5
add r2, -r4.z, c12
dp3 r4.z, r3, c5
dp3 r5.x, r3, c4
dp3 r3.x, r3, c6
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c11
dp4 r4.xy, v0, c6
mul r2, r2, r2
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c13
mad r2, r1, r1, r2
mad r0, r3.x, r1, r0
mul r1, r2, c14
add r1, r1, c20.x
mov r5.z, r3.x
mov r5.y, r4.z
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
max r0, r0, c20.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
mul r1, r0, r1
mul r0.xyz, r1.y, c16
mad r0.xyz, r1.x, c15, r0
mad r1.xyz, r1.z, c17, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c20.z
mad oT3.xyz, r1.w, c18, r1
mov oPos, r0
min r0.x, v0.z, c20
mul r1.y, r2, c9.x
mov r1.x, r2
mov r3.y, r4
mov r3.x, r4.w
mad oT4.xy, r2.z, c10.zwzw, r1
mov oT2.xyz, r5
mov oT4.zw, r0
add oT0.xyz, -r3.wxyw, c8
max oT1.x, r0, c20.y
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
RSQ R2.x, R0.x;
MUL R0.xyz, R2.x, fragment.texcoord[0];
DP3_SAT R0.w, R0, fragment.texcoord[2];
MAD R2.xyz, R2.x, fragment.texcoord[0], c[0];
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R2.xyz, R2.w, R2;
DP3 R2.x, fragment.texcoord[2], R2;
MOV R0.xyz, c[4];
ADD R0.w, -R0, c[8].x;
DP3 R3.w, fragment.texcoord[2], c[0];
MOV R2.w, c[8].z;
POW R0.w, R0.w, c[6].x;
ADD R0.xyz, -R0, c[5];
MAD R0.xyz, R0.w, R0, c[4];
MUL R3.xyz, R0, c[1];
MAX R3.w, R3, c[8].y;
MUL R1.xyz, R1, c[1];
MUL R3.xyz, R3, R3.w;
MUL R2.y, R2.w, c[3].x;
MAX R2.x, R2, c[8].y;
POW R2.x, R2.x, R2.y;
MAD R1.xyz, R1, R2.x, R3;
MUL R1.xyz, R1, c[8].w;
MAD R1.xyz, R0, fragment.texcoord[3], R1;
MUL R1.w, R1, c[1];
MUL R0.xyz, R0, c[7].x;
MUL R1.w, R2.x, R1;
ADD result.color.xyz, R1, R0;
MAD result.color.w, R0, fragment.texcoord[1].x, R1;
END
# 32 instructions, 4 R-regs
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
dcl t1.x
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
mad_pp r3.xyz, r1.x, r3, c4
dp3_pp r2.x, t2, c0
mul_pp r4.xyz, r3, c1
max_pp r2.x, r2, c8.y
mul_pp r2.xyz, r4, r2.x
mov_pp r5.xyz, c1
mul_pp r4.xyz, c2, r5
mad r2.xyz, r4, r0.x, r2
mul r4.xyz, r2, c8.w
mov_pp r0.w, c1
mul_pp r2.x, c2.w, r0.w
mul r0.x, r0, r2
mad r0.w, r1.x, t1.x, r0.x
mad_pp r4.xyz, r3, t3, r4
mul r2.xyz, r3, c7.x
add_pp r0.xyz, r4, r2
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
DP3 R2.x, fragment.texcoord[2], c[0];
POW R2.w, R2.y, R1.w;
DP3_SAT R0.x, R0, fragment.texcoord[2];
ADD R1.w, -R0.x, c[8].x;
MOV R0.xyz, c[4];
MUL R0.w, R0, c[1];
MUL R0.w, R2, R0;
MAX R3.y, R2.x, c[8];
POW R1.w, R1.w, c[6].x;
ADD R0.xyz, -R0, c[5];
MAD R0.xyz, R1.w, R0, c[4];
MUL R2.xyz, R0, c[1];
MUL R2.xyz, R2, R3.y;
MUL R0.w, R3.x, R0;
MUL R3.y, R3.x, c[8].w;
MAD R1.xyz, R1, R2.w, R2;
MUL R1.xyz, R1, R3.y;
MAD R1.xyz, R0, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[7].x;
ADD result.color.xyz, R1, R0;
MAD result.color.w, R1, fragment.texcoord[1].x, R0;
END
# 35 instructions, 4 R-regs
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
dcl t1.x
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r6, t4, s0
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
add_pp r2.x, -r1, c8
mov r1.x, r0.x
pow_pp r0.x, r2.x, c6.x
mov_pp r2.xyz, c5
add_pp r2.xyz, -c4, r2
mad_pp r4.xyz, r0.x, r2, c4
dp3_pp r2.x, t2, c0
mul_pp r3.xyz, r4, c1
max_pp r2.x, r2, c8.y
mul_pp r2.xyz, r3, r2.x
mov_pp r5.xyz, c1
mul_pp r3.xyz, c2, r5
mad r5.xyz, r3, r1.x, r2
mov_pp r0.w, c1
mul_pp r2.x, c2.w, r0.w
mul r1.x, r1, r2
mul_pp r3.x, r6, c8.w
mul r3.xyz, r5, r3.x
mad_pp r2.xyz, r4, t3, r3
mul r1.x, r6, r1
mad r0.w, r0.x, t1.x, r1.x
mul r3.xyz, r4, c7.x
add_pp r0.xyz, r2, r3
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}