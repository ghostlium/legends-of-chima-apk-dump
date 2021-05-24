//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_ObjectiveArrow" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _MatCap ("Matcap (RGB)", 2D) = "black" {}
 _ScrollVelocityX ("Detail velocity", Float) = 1
 _ScrollDelay ("Delay between scrolls", Float) = 1
 _DetailMul ("Detail multiplier", Float) = 0.5
 _DetailAngle ("Detail angle", Float) = 0
 _Opacity ("Opacity", Float) = 1
 _TintColor ("Color", Color) = (1,1,1,1)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Overlay+100" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Overlay+100" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZTest Always
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 9 [_Time]
Float 10 [_ScrollVelocityX]
Float 11 [_ScrollDelay]
Float 12 [_DetailAngle]
"!!ARBvp1.0
PARAM c[17] = { { 0.5, 24.980801, -24.980801, 0.15915491 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..12],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
MUL R0.x, R0, c[12];
FRC R1.w, R0.x;
ADD R0.w, R0.x, -c[16].z;
FRC R0.w, R0;
ADD R0.xyz, -R1.w, c[13];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].yzyw;
ADD R2.xyz, -R0.w, c[13];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].yzyw;
ADD R1.xyz, R1, c[14].xyxw;
MAD R1.xyz, R1, R0, c[14].zwzw;
MAD R1.xyz, R1, R0, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
ADD R3.xyz, R3, c[14].xyxw;
MAD R3.xyz, R3, R2, c[14].zwzw;
MAD R3.xyz, R3, R2, c[15].xyxw;
MAD R1.xyz, R1, R0, c[13].wzww;
SLT R4.x, R1.w, c[16].z;
SGE R4.yz, R1.w, c[16].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[13].wzww;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[15].zwzw;
MAD R2.xyz, R1, R2, c[13].wzww;
MOV R1.w, R0.y;
SGE R1.yz, R0.w, c[16].xxyw;
SLT R1.x, R0.w, c[16].z;
DP3 R3.y, R1, c[13].wzww;
MOV R3.xz, R1;
DP3 R1.z, R2, -R3;
MOV R1.x, R0;
MUL R2.xy, vertex.texcoord[0].y, R1.zwzw;
MOV R1.y, -R1.z;
MOV R0.y, c[13].x;
MOV R0.x, c[10];
MUL R0.zw, R0.xyxy, c[9].y;
MAD R0.xy, vertex.texcoord[0].x, R1, R2;
FRC R0.zw, R0;
MAD R2.xy, R0.zwzw, c[11].x, R0;
MOV R2.z, c[11].x;
MUL R0.xy, R2.z, c[0].x;
DP3 R2.z, vertex.normal, c[6];
ADD result.texcoord[0].zw, R2.xyxy, -R0.xyxy;
DP3 R0.y, vertex.normal, c[5];
MUL R1.zw, R1, R2.z;
MAD R1.xy, R1, R0.y, R1.zwzw;
MUL R0.zw, R0, c[11].x;
MAD R0.zw, R1.xyxy, c[16].w, R0;
MOV R0.y, c[13].x;
ADD result.texcoord[1].xy, R0.zwzw, -R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 57 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Vector 8 [_Time]
Float 9 [_ScrollVelocityX]
Float 10 [_ScrollDelay]
Float 11 [_DetailAngle]
"vs_2_0
def c12, 0.00000000, 0.15915491, 0.50000000, 0.20000000
def c13, 6.28318501, -3.14159298, 0, 0
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, -0.02083333, -0.12500000, 1.00000000, 0.50000000
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r0.x, c11
mad r0.x, r0, c12.y, c12.z
frc r0.x, r0
mad r1.x, r0, c13, c13.y
sincos r0.xy, r1.x, c14.xyzw, c15.xyzw
mov r2.x, c12.z
mov r1.x, r0
mov r1.y, -r0
mul r1.zw, v2.y, r0.xyyx
dp3 r2.z, v1, c5
mul r2.xy, c10.x, r2.x
mov r0.w, c12.x
mov r0.z, c9.x
mul r0.zw, r0, c8.y
frc r0.zw, r0
mad r1.zw, v2.x, r1.xyxy, r1
mad r1.zw, r0, c10.x, r1
add oT0.zw, r1, -r2.xyxy
mul r0.xy, r0.yxzw, r2.z
dp3 r1.z, v1, c4
mad r0.xy, r1, r1.z, r0
mul r0.zw, r0, c10.x
mad r0.zw, r0.xyxy, c12.w, r0
mov r0.y, c12.x
mov r0.x, r2
add oT1.xy, r0.zwzw, -r0
mov oT0.xy, v2
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
}
Program "fp" {
// Platform d3d11_9x skipped due to earlier errors
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Float 0 [_DetailMul]
Float 1 [_Opacity]
Vector 2 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_MatCap] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0..2] };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
MAD R0.xyz, R1, c[0].x, R0;
MUL result.color.xyz, R0, c[2];
MOV result.color.w, c[1].x;
END
# 5 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_DetailMul]
Float 1 [_Opacity]
Vector 2 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_MatCap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0.xy
dcl t1.xy
texld r0, t1, s1
texld r1, t0, s0
mad r0.xyz, r0, c0.x, r1
mul r0.xyz, r0, c2
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
}
 }
}
Fallback "Diffuse"
}