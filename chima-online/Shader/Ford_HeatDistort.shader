//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_HeatDistort" {
Properties {
 _Yspeed ("Y Speed", Float) = 0
 _Xspeed ("X_speed", Float) = 0
 _BumpAmt ("Distortion", Range(0,128)) = 10
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Tint Color (RGB)", 2D) = "white" {}
 _BumpMap ("Normalmap", 2D) = "bump" {}
}
SubShader { 
 LOD 500
 Tags { "QUEUE"="Transparent+100" "RenderType"="Transparent" }
 GrabPass {
  Name "BASE"
  Tags { "LIGHTMODE"="Always" }
 }
 Pass {
  Name "BASE"
  Tags { "LIGHTMODE"="Always" "QUEUE"="Transparent+100" "RenderType"="Transparent" }
  Cull Off
  Fog { Mode Off }
Program "vp" {
// Platform d3d11 had shader errors
//   <no keywords>
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 13 [_Time]
Float 14 [_Xspeed]
Float 15 [_Yspeed]
"!!ARBvp1.0
PARAM c[16] = { { 0, 0.5 },
		state.matrix.mvp,
		state.matrix.texture[1],
		state.matrix.texture[2],
		program.local[13..15] };
TEMP R0;
TEMP R1;
DP4 R1.z, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MOV R0.w, R1.z;
DP4 R0.z, vertex.position, c[3];
MOV R0.x, R1;
MOV R0.y, R1;
MOV result.position, R0;
MOV result.texcoord[0].zw, R0;
ADD R1.xy, R1.z, R1;
MOV R0.zw, c[0].x;
MOV R0.y, c[15].x;
MOV R0.x, c[14];
MAD R0.xy, R0, c[13], vertex.texcoord[0];
MOV result.color, vertex.color;
DP4 result.texcoord[1].y, R0, c[6];
DP4 result.texcoord[1].x, R0, c[5];
DP4 result.texcoord[2].y, R0, c[10];
DP4 result.texcoord[2].x, R0, c[9];
MUL result.texcoord[0].xy, R1, c[0].y;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_texture1]
Matrix 8 [glstate_matrix_texture2]
Vector 12 [_Time]
Float 13 [_Xspeed]
Float 14 [_Yspeed]
"vs_2_0
dcl_position0 v0
dcl_color0 v1
dcl_texcoord0 v2
def c15, 0.50000000, 0.00000000, 0, 0
dp4 r1.z, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mov r0.y, r1
mov r0.w, r1.z
dp4 r0.z, v0, c2
mov r0.x, r1
mov oPos, r0
mov oT0.zw, r0
mov r1.y, -r1
add r1.xy, r1.z, r1
mov r0.zw, c15.y
mov r0.y, c14.x
mov r0.x, c13
mad r0.xy, r0, c12, v2
mov oD0, v1
dp4 oT1.y, r0, c5
dp4 oT1.x, r0, c4
dp4 oT2.y, r0, c9
dp4 oT2.x, r0, c8
mul oT0.xy, r1, c15.x
"
}
}
Program "fp" {
// Platform d3d11 skipped due to earlier errors
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11 had shader errors
//   <no keywords>
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Vector 0 [_GrabTexture_TexelSize]
Vector 1 [_Color]
Float 2 [_BumpAmt]
SetTexture 0 [_GrabTexture] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_MainTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
OPTION ARB_fog_exp2;
PARAM c[4] = { program.local[0..2],
		{ 2, 1 } };
TEMP R0;
TEX R0.yw, fragment.texcoord[1], texture[1], 2D;
TEX R0.x, fragment.texcoord[2], texture[2], 2D;
MAD R0.zw, R0.xywy, c[3].x, -c[3].y;
MUL R0.zw, R0, c[2].x;
MUL R0.zw, R0, c[0].xyxy;
MUL R0.zw, R0, c[1].w;
MUL R0.zw, R0, fragment.color.primary.w;
MUL R0.xy, R0.zwzw, R0.x;
MOV R0.z, fragment.texcoord[0].w;
MAD R0.xy, R0, fragment.texcoord[0].z, fragment.texcoord[0];
TXP R0, R0.xyzz, texture[0], 2D;
MUL R0, R0, fragment.color.primary;
MUL result.color, R0, c[1];
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_GrabTexture_TexelSize]
Vector 1 [_Color]
Float 2 [_BumpAmt]
SetTexture 0 [_GrabTexture] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_MainTex] 2D 2
"ps_2_0
dcl_2d s2
dcl_2d s1
dcl_2d s0
def c3, 2.00000000, -1.00000000, 0, 0
dcl v0
dcl t0
dcl t1.xy
dcl t2.xy
texld r0, t2, s2
texld r1, t1, s1
mov r1.x, r1.w
mad_pp r1.xy, r1, c3.x, c3.y
mul r1.xy, r1, c2.x
mul r1.xy, r1, c0
mul r1.xy, r1, c1.w
mul r1.xy, r1, v0.w
mul r0.xy, r1, r0.x
mov r0.w, t0
mad r0.xy, r0, t0.z, t0
texldp r0, r0, s0
mul_pp r0, r0, v0
mul r0, r0, c1
mov_pp oC0, r0
"
}
}
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent+100" "RenderType"="Transparent" }
 Pass {
  Name "BASE"
  Tags { "QUEUE"="Transparent+100" "RenderType"="Transparent" }
  Blend Zero One
 }
}
}