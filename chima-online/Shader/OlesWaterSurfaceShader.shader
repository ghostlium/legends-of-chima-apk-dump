//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Reflective/Bumped Specular Refractive" {
Properties {
 _TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
 _MainTex ("Base Texture", 2D) = "white" {}
 _HeightTex ("Bump Texture", 2D) = "bump" {}
 _FoamTex ("Foam Texture", 2D) = "white" {}
 _CubeTex ("_CubeTex", CUBE) = "white" {}
 _Refractivity ("_Refractivity", Range(0.1,100)) = 1
 _Ambient ("_Ambient", Range(0,1)) = 0.8
 _Shininess ("_Shininess", Range(0.1,60)) = 1
 _SpecColor ("Spec Color", Color) = (0.5,0.5,0.5,0.5)
 _Displacement ("_Displacement", Range(0,2)) = 1
 _DisplacementTiling ("_DisplacementTiling", Range(0.1,4)) = 1
 _InvFade ("_InvFade", Range(0.05,5)) = 1
 _InvFadeFoam ("_InvFadeFoam", Range(0.05,5)) = 1
 _FresnelPower ("_FresnelPower", Range(0.1,10)) = 2
 _Reflectivity ("_Reflectivity", Range(0,1)) = 0.8
 _ColorTextureOverlay ("_ColorTextureOverlay", Range(0,1)) = 0.75
 _WorldLightDir ("_WorldLightDir", Vector) = (0,0,0,1)
 _Speed ("_Speed", Range(0,10)) = 0.8
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 GrabPass {
 }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [unity_Scale]
Float 13 [_Displacement]
Float 14 [_DisplacementTiling]
Float 15 [_Speed]
Vector 16 [_MainTex_ST]
Vector 17 [_HeightTex_ST]
Vector 18 [_FoamTex_ST]
"3.0-!!ARBvp1.0
PARAM c[24] = { { 24.980801, -24.980801, 0.15915491, 0.5 },
		state.matrix.mvp,
		program.local[5..18],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 },
		{ 1.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xy, vertex.color;
ADD R0.xy, vertex.position.zyzw, R0;
ADD R0.xy, R0, -c[0].w;
MUL R0.xy, R0, R0;
ADD R0.x, R0, R0.y;
RSQ R0.x, R0.x;
MOV R1.w, vertex.position;
MOV R0.y, c[15].x;
RCP R0.x, R0.x;
MAD R0.x, R0.y, c[9].w, R0;
MUL R0.x, R0, c[14];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[19].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R0.w, c[19];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R1.xyz, R1, R0, c[21].zwzw;
MAD R1.xyz, R1, R0, c[22].xyxw;
SLT R2.x, R0.w, c[19].w;
SGE R2.yz, R0.w, c[22].xzww;
MOV R0.xz, R2;
DP3 R0.y, R2, c[22].xyxw;
DP3 R0.x, R1, -R0;
MUL R0.xyz, vertex.normal, R0.x;
MUL R0.xyz, R0, c[13].x;
MUL R0.xyz, R0, vertex.color.w;
MAD R1.xyz, R0, c[23].x, vertex.position;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[0].w;
MUL R2.y, R2, c[11].x;
ADD result.texcoord[2].xy, R2, R2.z;
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
ADD R1.xyz, -R2, c[10];
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV R0.w, c[12];
MUL R3.xyz, R0.w, c[7];
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, R0.w, c[6];
MOV result.texcoord[3].xyz, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MUL R0.xyz, R0.w, c[5];
DP3 result.texcoord[4].y, R0, R1;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[6].y, R1, R3;
MOV result.color.xyz, vertex.color;
DP3 result.texcoord[4].z, vertex.normal, R0;
DP3 result.texcoord[4].x, R0, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
DP3 result.texcoord[6].z, vertex.normal, R3;
DP3 result.texcoord[6].x, vertex.attrib[14], R3;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[18], c[18].zwzw;
MAD result.texcoord[7].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MOV result.color.w, c[19].z;
END
# 67 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [unity_Scale]
Float 13 [_Displacement]
Float 14 [_DisplacementTiling]
Float 15 [_Speed]
Vector 16 [_MainTex_ST]
Vector 17 [_HeightTex_ST]
Vector 18 [_FoamTex_ST]
"vs_3_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
dcl_position o0
dcl_color0 o1
dcl_texcoord0 o2
dcl_texcoord1 o3
dcl_texcoord2 o4
dcl_texcoord3 o5
dcl_texcoord4 o6
dcl_texcoord5 o7
dcl_texcoord6 o8
dcl_texcoord7 o9
def c19, -0.50000000, 0.15915491, 0.50000000, 1.50000000
def c20, 6.28318501, -3.14159298, 1.00000000, 0
mov r0.xy, v5
add r0.xy, v0.zyzw, r0
add r0.xy, r0, c19.x
mul r0.xy, r0, r0
add r0.x, r0, r0.y
rsq r0.x, r0.x
mov r1.w, v0
mov r0.y, c8.w
rcp r0.x, r0.x
mad r0.x, c15, r0.y, r0
mul r0.x, r0, c14
mad r0.x, r0, c19.y, c19.z
frc r0.x, r0
mad r1.x, r0, c20, c20.y
sincos r0.xy, r1.x
mul r0.xyz, v2, r0.y
mul r0.xyz, r0, c13.x
mul r0.xyz, r0, v5.w
mad r1.xyz, r0, c19.w, v0
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c19.z
mov o0, r0
mul r2.y, r2, c10.x
mov o4.zw, r0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add r0.xyz, -r0, c9
mov r1.xyz, v1
mov o5.xyz, -r0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0.xyz, c4
mul r3.xyz, c12.w, r0
mad o4.xy, r2.z, c11.zwzw, r2
mul r2.xyz, r1, v1.w
mov r1.xyz, c5
mul r1.xyz, c12.w, r1
mov r0.xyz, c6
mul r0.xyz, c12.w, r0
dp3 o6.y, r3, r2
dp3 o7.y, r2, r1
dp3 o8.y, r2, r0
mov o1.xyz, v5
dp3 o6.z, v2, r3
dp3 o6.x, r3, v1
dp3 o7.z, v2, r1
dp3 o7.x, v1, r1
dp3 o8.z, v2, r0
dp3 o8.x, v1, r0
mad o2.xy, v3, c16, c16.zwzw
mad o3.xy, v4, c18, c18.zwzw
mad o9.xy, v3, c17, c17.zwzw
mov o1.w, c20.z
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Float 64 [_Displacement]
Float 68 [_DisplacementTiling]
Float 128 [_Speed]
Vector 144 [_MainTex_ST]
Vector 160 [_HeightTex_ST]
Vector 176 [_FoamTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedophgjifliadkbeojpedhclagmnfdnlaiabaaaaaaneajaaaaadaaaaaa
cmaaaaaapeaaaaaabaacaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheobeabaaaaakaaaaaa
aiaaaaaapiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaaeabaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaakabaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaakabaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
amadaaaaakabaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaakabaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaakabaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaaakabaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahaiaaaaakabaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahaiaaaaakabaaaa
ahaaaaaaaaaaaaaaadaaaaaaaiaaaaaaadamaaaafdfgfpfagphdgjhegjgpgoaa
edepemepfcaafeeffiedepepfceeaaklfdeieefclmahaaaaeaaaabaaopabaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadmccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaad
hccabaaaahaaaaaagfaaaaaddccabaaaaiaaaaaagiaaaaacadaaaaaaaaaaaaah
dcaabaaaaaaaaaaaggbkbaaaaaaaaaaaegbabaaaafaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaelaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkiacaaa
abaaaaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaaeaaaaaaenaaaaag
bcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaagiacaaaaaaaaaaaaeaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaamadpaaaamadpaaaamadpaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaafaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadgaaaaafhccabaaaabaaaaaaegbcbaaaafaaaaaadgaaaaaf
iccabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaa
aaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadgaaaaaghccabaaa
aeaaaaaaegacbaiaebaaaaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaa
afaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaagaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaagaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaahaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaahaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaahaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadcaaaaaldccabaaaaiaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_ZBufferParams]
Vector 1 [_TintColor]
Vector 2 [_SpecColor]
Vector 3 [_GrabTexture_TexelSize]
Float 4 [_InvFade]
Float 5 [_InvFadeFoam]
Float 6 [_FresnelPower]
Float 7 [_Shininess]
Float 8 [_Ambient]
Float 9 [_Refractivity]
Float 10 [_Reflectivity]
Float 11 [_ColorTextureOverlay]
Vector 12 [_WorldLightDir]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_HeightTex] 2D 1
SetTexture 2 [_FoamTex] 2D 2
SetTexture 3 [_MainTex] 2D 3
SetTexture 4 [_GrabTexture] 2D 4
SetTexture 5 [_CubeTex] CUBE 5
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
OPTION ARB_fog_exp2;
OPTION ARB_fragment_program_shadow;
PARAM c[15] = { program.local[0..12],
		{ 1, 2, 0, 0.80000001 },
		{ 0.79627001, 0.20373, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R3.xy, R0.wyzw, c[13].y, -c[13].x;
MUL R0.xy, R3, R3;
ADD_SAT R0.x, R0, R0.y;
ADD R0.x, -R0, c[13];
RSQ R0.x, R0.x;
RCP R3.z, R0.x;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R0.z, fragment.texcoord[6], R3;
DP3 R0.x, R3, fragment.texcoord[4];
DP3 R0.y, R3, fragment.texcoord[5];
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, fragment.texcoord[3];
DP3 R0.w, -R0, R1;
MUL R2.xyz, -R0.w, R1;
MAD R0.xyz, -R2, c[13].y, R0;
DP3 R1.w, R0, R0;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R0;
MAX R0.y, R0.w, c[13].z;
TEX R0.x, R2, texture[5], CUBE;
ADD R2.w, R0.x, -c[14].z;
MUL R0.zw, R3.xyxy, c[3].xyxy;
ADD R0.y, -R0, c[13].w;
TXP R0.x, fragment.texcoord[2], texture[0], 2D;
MUL R0.zw, fragment.texcoord[2].z, R0;
POW R1.w, R0.y, c[6].x;
MAD R3.x, R0, c[0].z, c[0].w;
MUL R0.xy, R0.zwzw, c[9].x;
RCP R0.w, R3.x;
ADD R3.x, R0.w, -fragment.texcoord[2].z;
MOV R0.z, c[4].x;
MOV R0.w, c[5].x;
MUL_SAT R4.xy, R0.zwzw, R3.x;
MOV R3.x, c[13];
MOV R0.zw, fragment.texcoord[2];
MAD R0.xy, R4.y, R0, fragment.texcoord[2];
TXP R0.xyz, R0, texture[4], SHADOW2D;
ADD R3.x, -R3, c[10];
ADD_SAT R0.w, R4.y, R3.x;
MAD R3.xyz, R0.w, R2.w, -R0;
MAD R0.w, R1, c[14].x, c[14].y;
MAX R0.w, R0, c[13].z;
ADD R3.xyz, R3, c[14].z;
MAD R3.xyz, R0.w, R3, R0;
TEX R0, fragment.texcoord[0], texture[3], 2D;
MOV R1.w, c[13].x;
ADD R0, R0, -c[13].x;
MAD R0, R0, c[11].x, R1.w;
DP3 R1.w, R2, c[12];
TEX R2, fragment.texcoord[1], texture[2], 2D;
MUL R0.xyz, R0, R3;
ADD R0, R0, -R2;
MAD R0, R4.y, R0, R2;
POW R1.w, R1.w, c[7].x;
MAX R2.x, R1.w, c[13].z;
DP3 R1.w, R1, c[12];
MUL R1.xyz, R2.x, c[2];
MAX R1.w, R1, c[8].x;
MAD R0.xyz, R0, R1.w, R1;
MOV R1.xyz, c[13].x;
MUL R1.w, fragment.color.primary, R4.x;
MUL R1, R1, c[1];
MUL result.color, R1, R0;
END
# 67 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ZBufferParams]
Vector 1 [_TintColor]
Vector 2 [_SpecColor]
Vector 3 [_GrabTexture_TexelSize]
Float 4 [_InvFade]
Float 5 [_InvFadeFoam]
Float 6 [_FresnelPower]
Float 7 [_Shininess]
Float 8 [_Ambient]
Float 9 [_Refractivity]
Float 10 [_Reflectivity]
Float 11 [_ColorTextureOverlay]
Vector 12 [_WorldLightDir]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_HeightTex] 2D 1
SetTexture 2 [_FoamTex] 2D 2
SetTexture 3 [_MainTex] 2D 3
SetTexture 4 [_GrabTexture] 2D 4
SetTexture 5 [_CubeTex] CUBE 5
"ps_3_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_cube s5
def c13, 1.00000000, 2.00000000, -1.00000000, 0.00000000
def c14, 0.80000001, 0.79627001, 0.20373000, -0.75000000
def c15, 0.75000000, 0, 0, 0
dcl_color0 v0.xyzw
dcl_texcoord0 v1.xy
dcl_texcoord1 v2.xy
dcl_texcoord2 v3
dcl_texcoord3 v4.xyz
dcl_texcoord4 v5.xyz
dcl_texcoord5 v6.xyz
dcl_texcoord6 v7.xyz
texld r0.yw, v1, s1
mad_pp r3.xy, r0.wyzw, c13.y, c13.z
mul_pp r0.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c13
rsq_pp r0.x, r0.x
rcp_pp r3.z, r0.x
dp3 r0.w, v4, v4
dp3 r0.z, v7, r3
dp3 r0.x, r3, v5
dp3 r0.y, r3, v6
dp3_pp r1.x, r0, r0
rsq_pp r1.x, r1.x
mul_pp r2.xyz, r1.x, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, v4
dp3 r0.w, -r0, r2
mul r1.xyz, -r0.w, r2
mad r0.xyz, -r1, c13.y, r0
dp3 r1.x, r0, r0
max r0.w, r0, c13
rsq r1.x, r1.x
mul r1.xyz, r1.x, r0
dp3 r1.w, r1, c12
texld r1.x, r1, s5
add r2.w, -r0, c14.x
pow r0, r2.w, c6.x
mul r0.zw, r3.xyxy, c3.xyxy
mov r2.w, r0.x
mul r3.xy, v3.z, r0.zwzw
texldp r0.x, v3, s0
mad r0.z, r0.x, c0, c0.w
rcp r0.w, r0.z
add r1.y, r0.w, -v3.z
mul r0.xy, r3, c9.x
pow r3, r1.w, c7.x
mov_pp r0.z, c4.x
mov_pp r0.w, c5.x
mul_pp_sat r4.xy, r0.zwzw, r1.y
mov r1.y, c10.x
mov r0.zw, v3
mad r0.xy, r4.y, r0, v3
texldp r0.xyz, r0, s4
add r1.y, c13.z, r1
add_sat r0.w, r4.y, r1.y
add r1.x, r1, c14.w
mad r1.xyz, r0.w, r1.x, -r0
mad r0.w, r2, c14.y, c14.z
add r1.xyz, r1, c15.x
max r0.w, r0, c13
mad r0.xyz, r0.w, r1, r0
texld r1, v1, s3
mov_pp r0.w, c13.x
add_pp r1, r1, c13.z
mad_pp r1, r1, c11.x, r0.w
mul r1.xyz, r1, r0
texld r0, v2, s2
add r1, r1, -r0
mad r0, r4.y, r1, r0
mov r2.w, r3.x
max r1.x, r2.w, c13.w
dp3 r1.w, r2, c12
mul r1.xyz, r1.x, c2
max r1.w, r1, c8.x
mad r0.xyz, r0, r1.w, r1
mov r1.xyz, c13.x
mul r1.w, v0, r4.x
mul r1, r1, c1
mul oC0, r1, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_CameraDepthTexture] 2D 4
SetTexture 1 [_HeightTex] 2D 1
SetTexture 2 [_FoamTex] 2D 2
SetTexture 3 [_MainTex] 2D 0
SetTexture 4 [_GrabTexture] 2D 5
SetTexture 5 [_CubeTex] CUBE 3
ConstBuffer "$Globals" 192
Vector 16 [_TintColor]
Vector 32 [_SpecColor]
Vector 48 [_GrabTexture_TexelSize]
Float 72 [_InvFade]
Float 76 [_InvFadeFoam]
Float 80 [_FresnelPower]
Float 84 [_Shininess]
Float 88 [_Ambient]
Float 92 [_Refractivity]
Float 96 [_Reflectivity]
Float 100 [_ColorTextureOverlay]
Vector 112 [_WorldLightDir]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedgemdehhpchbodpcbgolchchibpcpfeldabaaaaaapaakaaaaadaaaaaa
cmaaaaaaeiabaaaahmabaaaaejfdeheobeabaaaaakaaaaaaaiaaaaaapiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaaeabaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaaakabaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaakabaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaamamaaaaakabaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaaakabaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaakabaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaakabaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaaakabaaaa
agaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaaakabaaaaahaaaaaaaaaaaaaa
adaaaaaaaiaaaaaaadaaaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeef
fiedepepfceeaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
gmajaaaaeaaaaaaaflacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafidaaaaeaahabaaaafaaaaaaffffaaaagcbaaaadicbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacafaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaa
aaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaa
agaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaahaaaaaa
egacbaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaadiaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaakgbkbaaa
adaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaapgipcaaaaaaaaaaa
afaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
eeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaakgakbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
ecaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakhcaabaaaadaaaaaa
egacbaaaabaaaaaakgakbaiaebaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaai
ecaabaaaaaaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaabaaaaaabaaaaaai
icaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaadeaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaamnmmemdpcpaaaaafecaabaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaa
akiacaaaaaaaaaaaafaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaafknieldpabeaaaaa
jjjofadobaaaaaahbcaabaaaabaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegacbaaa
abaaaaaaeghobaaaafaaaaaaaagabaaaadaaaaaabaaaaaaibcaabaaaabaaaaaa
egiccaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaacpaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaabkiacaaa
aaaaaaaaafaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaaaaaaaaak
hcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaealpaaaaealpaaaaealp
aaaaaaaaaaaaaaaiicaabaaaabaaaaaaakiacaaaaaaaaaaaagaaaaaaabeaaaaa
aaaaialpaoaaaaahdcaabaaaadaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaaaaaaaaaagabaaa
aeaaaaaadcaaaaalicaabaaaacaaaaaackiacaaaabaaaaaaahaaaaaaakaabaaa
adaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakicaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpdkaabaaaacaaaaaaaaaaaaaiicaabaaa
acaaaaaadkaabaaaacaaaaaackbabaiaebaaaaaaadaaaaaadicaaaaidcaabaaa
adaaaaaapgapbaaaacaaaaaaogikcaaaaaaaaaaaaeaaaaaaaacaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaabkaabaaaadaaaaaadcaaaaamhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaeadpaaaaeadpaaaaeadp
aaaaaaaadcaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaafgafbaaaadaaaaaa
egbabaaaadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaa
aagabaaaafaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaia
ebaaaaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaaaaaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdcaaaaanpcaabaaa
acaaaaaafgifcaaaaaaaaaaaagaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdiaaaaahhcaabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaaefaaaaajpcaabaaaaeaaaaaaogbkbaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaaaaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaiaebaaaaaaaeaaaaaadcaaaaajpcaabaaaacaaaaaafgafbaaaadaaaaaa
egaobaaaacaaaaaaegaobaaaaeaaaaaadiaaaaahicaabaaaadaaaaaaakaabaaa
adaaaaaadkbabaaaabaaaaaadcaaaaajhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaihcaabaaaadaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaa
adaaaaaaegiocaaaaaaaaaaaabaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaa
acaaaaaaegaobaaaaaaaaaaadoaaaaab"
}
}
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [unity_Scale]
Float 13 [_Displacement]
Float 14 [_DisplacementTiling]
Float 15 [_Speed]
Vector 16 [_MainTex_ST]
Vector 17 [_HeightTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 24.980801, -24.980801, 0.15915491, 0.5 },
		state.matrix.mvp,
		program.local[5..17],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 },
		{ 1.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xy, vertex.color;
ADD R0.xy, vertex.position.zyzw, R0;
ADD R0.xy, R0, -c[0].w;
MUL R0.xy, R0, R0;
ADD R0.x, R0, R0.y;
RSQ R0.x, R0.x;
MOV R1.w, vertex.position;
MOV R0.y, c[15].x;
RCP R0.x, R0.x;
MAD R0.x, R0.y, c[9].w, R0;
MUL R0.x, R0, c[14];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[18].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R0.w, c[18];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[19].xyxw;
MAD R1.xyz, R1, R0, c[19].zwzw;
MAD R1.xyz, R1, R0, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
SLT R2.x, R0.w, c[18].w;
SGE R2.yz, R0.w, c[21].xzww;
MOV R0.xz, R2;
DP3 R0.y, R2, c[21].xyxw;
DP3 R0.x, R1, -R0;
MUL R0.xyz, vertex.normal, R0.x;
MUL R0.xyz, R0, c[13].x;
MUL R0.xyz, R0, vertex.color.w;
MAD R1.xyz, R0, c[22].x, vertex.position;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[0].w;
MUL R2.y, R2, c[11].x;
ADD result.texcoord[2].xy, R2, R2.z;
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
ADD R1.xyz, -R2, c[10];
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV R0.w, c[12];
MUL R3.xyz, R0.w, c[7];
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, R0.w, c[6];
MOV result.texcoord[3].xyz, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MUL R0.xyz, R0.w, c[5];
DP3 result.texcoord[4].y, R0, R1;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[6].y, R1, R3;
MOV result.color.xyz, vertex.color;
DP3 result.texcoord[4].z, vertex.normal, R0;
DP3 result.texcoord[4].x, R0, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
DP3 result.texcoord[6].z, vertex.normal, R3;
DP3 result.texcoord[6].x, vertex.attrib[14], R3;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[7].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MOV result.color.w, c[18].z;
END
# 66 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [unity_Scale]
Float 13 [_Displacement]
Float 14 [_DisplacementTiling]
Float 15 [_Speed]
Vector 16 [_MainTex_ST]
Vector 17 [_HeightTex_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v4
def c18, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c19, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c20, -0.50000000, 0.15915491, 0.50000000, 1.50000000
def c21, 6.28318501, -3.14159298, 0, 0
mov r0.xy, v4
add r0.xy, v0.zyzw, r0
add r0.xy, r0, c20.x
mul r0.xy, r0, r0
add r0.x, r0, r0.y
rsq r0.x, r0.x
mov r1.w, v0
mov r0.y, c8.w
rcp r0.x, r0.x
mad r0.x, c15, r0.y, r0
mul r0.x, r0, c14
mad r0.x, r0, c20.y, c20.z
frc r0.x, r0
mad r1.x, r0, c21, c21.y
sincos r0.xy, r1.x, c19.xyzw, c18.xyzw
mul r0.xyz, v2, r0.y
mul r0.xyz, r0, c13.x
mul r0.xyz, r0, v4.w
mad r1.xyz, r0, c20.w, v0
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c18.w
mov oPos, r0
mul r2.y, r2, c10.x
mov oT2.zw, r0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add r0.xyz, -r0, c9
mov r1.xyz, v1
mov oT3.xyz, -r0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0.xyz, c4
mul r3.xyz, c12.w, r0
mad oT2.xy, r2.z, c11.zwzw, r2
mul r2.xyz, r1, v1.w
mov r1.xyz, c5
mul r1.xyz, c12.w, r1
mov r0.xyz, c6
mul r0.xyz, c12.w, r0
dp3 oT4.y, r3, r2
dp3 oT5.y, r2, r1
dp3 oT6.y, r2, r0
mov oD0.xyz, v4
dp3 oT4.z, v2, r3
dp3 oT4.x, r3, v1
dp3 oT5.z, v2, r1
dp3 oT5.x, v1, r1
dp3 oT6.z, v2, r0
dp3 oT6.x, v1, r0
mad oT0.xy, v3, c16, c16.zwzw
mad oT7.xy, v3, c17, c17.zwzw
mov oD0.w, c18.z
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Float 48 [_Displacement]
Float 52 [_DisplacementTiling]
Float 112 [_Speed]
Vector 128 [_MainTex_ST]
Vector 144 [_HeightTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkfmlnpedendmjaodakhcegdlplbkipagabaaaaaajaajaaaaadaaaaaa
cmaaaaaapeaaaaaabaacaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheobeabaaaaakaaaaaa
aiaaaaaapiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaaeabaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaakabaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaakabaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
amapaaaaakabaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaakabaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaakabaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaaakabaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahaiaaaaakabaaaaagaaaaaaaaaaaaaaadaaaaaaahaaaaaaahaiaaaaakabaaaa
ahaaaaaaaaaaaaaaadaaaaaaaiaaaaaaadamaaaafdfgfpfagphdgjhegjgpgoaa
edepemepfcaafeeffiedepepfceeaaklfdeieefchiahaaaaeaaaabaanoabaaaa
fjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaa
agaaaaaagfaaaaadhccabaaaahaaaaaagfaaaaaddccabaaaaiaaaaaagiaaaaac
adaaaaaaaaaaaaahdcaabaaaaaaaaaaaggbkbaaaaaaaaaaaegbabaaaafaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaa
aaaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaa
aaaaaaaadkiacaaaabaaaaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
adaaaaaaenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaamadpaaaamadpaaaamadpaaaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaafaaaaaaegbcbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafhccabaaaabaaaaaaegbcbaaa
afaaaaaadgaaaaaficcabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadiaaaaaiicaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaacaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaacaaaaaamgaabaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadgaaaaaghccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaagaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaagaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
ckiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaahaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaahaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaahaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dcaaaaaldccabaaaaiaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 160
Float 48 [_Displacement]
Float 52 [_DisplacementTiling]
Float 112 [_Speed]
Vector 128 [_MainTex_ST]
Vector 144 [_HeightTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedadbgkhjgelcmdkfakhcpcdpggkaniefkabaaaaaakeaoaaaaaeaaaaaa
daaaaaaaeaafaaaamaamaaaaiianaaaaebgpgodjaiafaaaaaiafaaaaaaacpopp
imaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
abaaabaaaaaaaaaaaaaaahaaadaaacaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaa
abaaaeaaacaaagaaaaaaaaaaacaaaaaaaeaaaiaaaaaaaaaaacaaamaaaeaaamaa
aaaaaaaaacaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapka
aaaaaalpidpjccdoaaaaaadpaaaamadpfbaaaaafbcaaapkanlapmjeanlapejma
aaaaiadpaaaaaaaafbaaaaafbdaaapkaabannalfgballglhklkkckdlijiiiidj
fbaaaaafbeaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeabaaadoaadaaoeja
adaaoekaadaaookaaeaaaaaeahaaadoaadaaoejaaeaaoekaaeaaookaabaaaaac
aaaaagiaaaaaoejaacaaaaadaaaaadiaaaaaogiaafaaoejaacaaaaadaaaaadia
aaaaoeiabbaaaakaafaaaaadaaaaadiaaaaaoeiaaaaaoeiaacaaaaadaaaaabia
aaaaffiaaaaaaaiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
abaaaaacaaaaaiiaafaappkaaeaaaaaeaaaaabiaaaaappiaacaaaakaaaaaaaia
afaaaaadaaaaabiaaaaaaaiaabaaffkaaeaaaaaeaaaaabiaaaaaaaiabbaaffka
bbaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaiabcaaaaka
bcaaffkacfaaaaaeabaaaciaaaaaaaiabdaaoekabeaaoekaafaaaaadaaaaahia
abaaffiaacaaoejaafaaaaadaaaaahiaaaaaoeiaabaaaakaafaaaaadaaaaahia
aaaaoeiaafaappjaaeaaaaaeaaaaahiaaaaaoeiabbaappkaaaaaoejaafaaaaad
abaaapiaaaaaffiaajaaoekaaeaaaaaeabaaapiaaiaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaakaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaapiaalaaoeka
aaaappjaabaaoeiaafaaaaadaaaaaiiaabaaffiaahaaaakaafaaaaadacaaaiia
aaaappiabbaakkkaafaaaaadacaaafiaabaapeiabbaakkkaacaaaaadacaaadoa
acaakkiaacaaomiaafaaaaadacaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeia
aeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeib
agaaoekaabaaaaacadaaahoaaaaaoeibabaaaaacaaaaabiaamaaaakaabaaaaac
aaaaaciaanaaaakaabaaaaacaaaaaeiaaoaaaakaafaaaaadaaaaahiaaaaaoeia
baaappkaaiaaaaadaeaaaboaabaaoejaaaaaoeiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaaiaaaaadaeaaacoaacaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaamaaffka
abaaaaacaaaaaciaanaaffkaabaaaaacaaaaaeiaaoaaffkaafaaaaadaaaaahia
aaaaoeiabaaappkaaiaaaaadafaaaboaabaaoejaaaaaoeiaaiaaaaadafaaacoa
acaaoeiaaaaaoeiaaiaaaaadafaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabia
amaakkkaabaaaaacaaaaaciaanaakkkaabaaaaacaaaaaeiaaoaakkkaafaaaaad
aaaaahiaaaaaoeiabaaappkaaiaaaaadagaaaboaabaaoejaaaaaoeiaaiaaaaad
agaaacoaacaaoeiaaaaaoeiaaiaaaaadagaaaeoaacaaoejaaaaaoeiaaeaaaaae
aaaaadmaabaappiaaaaaoekaabaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaac
acaaamoaabaaoeiaaeaaaaaeaaaaapoaafaacejabcaaokkabcaalpkappppaaaa
fdeieefchiahaaaaeaaaabaanoabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagfaaaaadhccabaaaahaaaaaa
gfaaaaaddccabaaaaiaaaaaagiaaaaacadaaaaaaaaaaaaahdcaabaaaaaaaaaaa
ggbkbaaaaaaaaaaaegbabaaaafaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkiacaaaabaaaaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaaenaaaaagbcaabaaaaaaaaaaa
aanaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaagiacaaa
aaaaaaaaadaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaamadpaaaamadpaaaamadpaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaafaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
dgaaaaafhccabaaaabaaaaaaegbcbaaaafaaaaaadgaaaaaficcabaaaabaaaaaa
abeaaaaaaaaaiadpdcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaiicaabaaaaaaaaaaa
bkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaacaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaacaaaaaaagadbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaa
adaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaacaaaaaa
mgaabaaaacaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaadgaaaaaghccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahcccabaaaagaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaagaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
agaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
ckiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
cccabaaaahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
ahaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaahaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadcaaaaaldccabaaaaiaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheobeabaaaaakaaaaaaaiaaaaaapiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaaeabaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaaakabaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
akabaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaamapaaaaakabaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaaakabaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaakabaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
akabaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaaakabaaaaagaaaaaa
aaaaaaaaadaaaaaaahaaaaaaahaiaaaaakabaaaaahaaaaaaaaaaaaaaadaaaaaa
aiaaaaaaadamaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeeffiedepep
fceeaakl"
}
}
Program "fp" {
// Platform d3d11_9x had shader errors
//   <no keywords>
SubProgram "opengl " {
Vector 0 [_TintColor]
Vector 1 [_SpecColor]
Float 2 [_FresnelPower]
Float 3 [_Shininess]
Float 4 [_Ambient]
Float 5 [_Reflectivity]
Float 6 [_ColorTextureOverlay]
Vector 7 [_WorldLightDir]
SetTexture 0 [_HeightTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_CubeTex] CUBE 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
OPTION ARB_fog_exp2;
PARAM c[10] = { program.local[0..7],
		{ 1, 2, 0, 0.80000001 },
		{ 0.79627001, 0.20373, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[8].y, -c[8].x;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[8].x;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.z, fragment.texcoord[6], R0;
DP3 R1.x, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[5];
DP3 R0.y, R1, R1;
RSQ R0.y, R0.y;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
MUL R2.xyz, R0.y, R1;
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R1.w, -R0, R2;
MUL R1.xyz, -R1.w, R2;
MAD R0.xyz, -R1, c[8].y, R0;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
DP3 R2.w, R1, c[7];
POW R2.w, R2.w, c[3].x;
TEX R3.x, R1, texture[2], CUBE;
TEX R0, fragment.texcoord[0], texture[1], 2D;
MAX R1.y, R1.w, c[8].z;
MOV R1.x, c[8];
ADD R1.w, -R1.y, c[8];
ADD R1.z, R3.x, -c[9];
POW R3.x, R1.w, c[2].x;
ADD_SAT R1.x, -R1, c[5];
MAD R3.x, R3, c[9], c[9].y;
MAX R3.x, R3, c[8].z;
MAD R1.xyz, R1.x, R1.z, c[9].z;
MOV R1.w, c[8].x;
ADD R1, R1, -c[8].xxxz;
MAD R1, R3.x, R1, c[8].xxxz;
MOV R3.x, c[8];
ADD R0, R0, -c[8].x;
MAD R0, R0, c[6].x, R3.x;
MUL R0, R0, R1;
MAX R1.x, R2.w, c[8].z;
DP3 R1.w, R2, c[7];
MUL R1.xyz, R1.x, c[1];
MAX R1.w, R1, c[4].x;
MAD R0.xyz, R0, R1.w, R1;
MOV R1.w, fragment.color.primary;
MOV R1.xyz, c[8].x;
MUL R1, R1, c[0];
MUL result.color, R1, R0;
END
# 51 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_TintColor]
Vector 1 [_SpecColor]
Float 2 [_FresnelPower]
Float 3 [_Shininess]
Float 4 [_Ambient]
Float 5 [_Reflectivity]
Float 6 [_ColorTextureOverlay]
Vector 7 [_WorldLightDir]
SetTexture 0 [_HeightTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_CubeTex] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c8, 1.00000000, 0.00000000, 2.00000000, -1.00000000
def c9, 0.80000001, 0.79627001, 0.20373000, -0.75000000
def c10, 0.75000000, -1.00000000, -0.00000000, 0
dcl v0.xyzw
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
dcl t6.xyz
texld r0, t0, s0
texld r4, t0, s1
mov r0.x, r0.w
mad_pp r1.xy, r0, c8.z, c8.w
mul_pp r0.xy, r1, r1
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c8
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3 r2.x, t3, t3
dp3 r0.z, t6, r1
dp3 r0.x, r1, t4
dp3 r0.y, r1, t5
dp3_pp r1.x, r0, r0
rsq_pp r1.x, r1.x
mul_pp r0.xyz, r1.x, r0
rsq r2.x, r2.x
mul r1.xyz, r2.x, t3
dp3 r2.x, -r1, r0
mul r3.xyz, -r2.x, r0
mad r1.xyz, -r3, c8.z, r1
dp3 r0.x, r0, c7
dp3 r3.x, r1, r1
rsq r3.x, r3.x
mul r1.xyz, r3.x, r1
add_pp r4, r4, c8.w
max r0.x, r0, c4
texld r3, r1, s2
dp3 r1.x, r1, c7
pow r5.x, r1.x, c3.x
max r1.x, r2, c8.y
add r1.x, -r1, c9
pow r2.x, r1.x, c2.x
add r1.x, r3, c9.w
mov r3.x, c5
add_sat r3.x, c8.w, r3
mad r3.xyz, r3.x, r1.x, c10.x
mad r1.x, r2.x, c9.y, c9.z
mov_pp r3.w, c8.x
mov r2.xyz, c10.y
mov r2.w, c10.z
add_pp r2, r3, r2
mov r3.xyz, c8.x
mov r3.w, c8.y
max r1.x, r1, c8.y
mad_pp r1, r1.x, r2, r3
mov r2.x, r5.x
mov_pp r3.x, c8
mad_pp r3, r4, c6.x, r3.x
mul r1, r3, r1
mov r0.w, r1
max r2.x, r2, c8.y
mul r2.xyz, r2.x, c1
mad r0.xyz, r1, r0.x, r2
mov r1.w, v0
mov r1.xyz, c8.x
mul r1, r1, c0
mul r0, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_HeightTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_CubeTex] CUBE 2
ConstBuffer "$Globals" 160
Vector 16 [_TintColor]
Vector 32 [_SpecColor]
Float 64 [_FresnelPower]
Float 68 [_Shininess]
Float 72 [_Ambient]
Float 80 [_Reflectivity]
Float 84 [_ColorTextureOverlay]
Vector 96 [_WorldLightDir]
BindCB  "$Globals" 0
"ps_4_0
eefieceddmemmmgebdockjbkpdkhncjfjppgolnnabaaaaaaeiaiaaaaadaaaaaa
cmaaaaaaeiabaaaahmabaaaaejfdeheobeabaaaaakaaaaaaaiaaaaaapiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaaeabaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaiaaaaakabaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaakabaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaamaaaaaaakabaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaakabaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaakabaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaakabaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaaakabaaaa
agaaaaaaaaaaaaaaadaaaaaaahaaaaaaahahaaaaakabaaaaahaaaaaaaaaaaaaa
adaaaaaaaiaaaaaaadaaaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeef
fiedepepfceeaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
meagaaaaeaaaaaaalbabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaadicbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagcbaaaadhcbabaaaahaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaa
egaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaa
egbcbaaaagaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
ahaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaa
aeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaak
hcaabaaaacaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaibcaabaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaaegacbaaa
aaaaaaaadeaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
aeaaaaaadeaaaaahccaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaamnmmemdp
cpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaabjaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
fknieldpabeaaaaajjjofadobaaaaaahecaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaacaaaaaaeeaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegacbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaabaaaaaai
ecaabaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaaegacbaaaabaaaaaacpaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackaabaaa
aaaaaaaabkiacaaaaaaaaaaaaeaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaakgakbaaaaaaaaaaaegiccaaaaaaaaaaa
acaaaaaaaaaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaealp
aaaaealpaaaaealpaaaaaaaaaacaaaaiecaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaaabeaaaaaaaaaialpdcaaaaamhcaabaaaacaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaaaceaaaaaaaaaialoaaaaialoaaaaialoaaaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaiadpdcaaaaampcaabaaaacaaaaaafgafbaaa
aaaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaaaaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdcaaaaanpcaabaaaadaaaaaafgifcaaaaaaaaaaa
afaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaadcaaaaaj
hcaabaaaacaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dgaaaaafbcaabaaaaaaaaaaaabeaaaaaaaaaiadpdgaaaaaficaabaaaaaaaaaaa
dkbabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaagambaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaa
aaaaaaaadoaaaaab"
}
}
 }
}
}