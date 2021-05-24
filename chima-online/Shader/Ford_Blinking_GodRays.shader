//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Blinking GodRays" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _FadeOutDistNear ("Near fadeout dist", Float) = 10
 _FadeOutDistFar ("Far fadeout dist", Float) = 10000
 _Multiplier ("Color multiplier", Float) = 1
 _Bias ("Bias", Float) = 0
 _TimeOnDuration ("ON duration", Float) = 0.5
 _TimeOffDuration ("OFF duration", Float) = 0.5
 _BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
 _SizeGrowStartDist ("Size grow start dist", Float) = 5
 _SizeGrowEndDist ("Size grow end dist", Float) = 50
 _MaxGrowSize ("Max grow size", Float) = 2.5
 _NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0,0.5)) = 0
 _Color ("Color", Color) = (1,1,1,1)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 9 [_Time]
Float 10 [_FadeOutDistNear]
Float 11 [_FadeOutDistFar]
Float 12 [_Multiplier]
Float 13 [_Bias]
Float 14 [_TimeOnDuration]
Float 15 [_TimeOffDuration]
Float 16 [_BlinkingTimeOffsScale]
Float 17 [_SizeGrowStartDist]
Float 18 [_SizeGrowEndDist]
Float 19 [_MaxGrowSize]
Float 20 [_NoiseAmount]
Vector 21 [_Color]
"!!ARBvp1.0
PARAM c[29] = { { 0, 1, 0.2, 0.25 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..21],
		{ 0.75, 3, 2, 0.15915491 },
		{ 24.980801, -24.980801, 6.2831855, 0.5 },
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.63660002, 56.7272 },
		{ 0.0099999998 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.w, vertex.color.z, c[16].x;
ADD R1.w, R0, c[9].y;
RCP R0.x, c[14].x;
MUL R0.x, R1.w, R0;
MUL R0.x, R0, c[23].z;
MUL R0.y, R0.x, c[22].w;
MAD R0.z, R0.x, c[27], c[27].w;
ADD R0.x, R0.y, -c[0].w;
FRC R3.w, R0.x;
MUL R0.y, R0.z, c[22].w;
FRC R2.w, R0.y;
ADD R0.xyz, -R3.w, c[24];
ADD R1.xyz, -R2.w, c[24];
MUL R2.xyz, R1, R1;
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[23].xyxw;
MUL R3.xyz, R2, c[23].xyxw;
ADD R1.xyz, R1, c[25].xyxw;
MAD R1.xyz, R1, R0, c[25].zwzw;
MAD R1.xyz, R1, R0, c[26].xyxw;
MAD R1.xyz, R1, R0, c[26].zwzw;
ADD R3.xyz, R3, c[25].xyxw;
MAD R3.xyz, R3, R2, c[25].zwzw;
MAD R3.xyz, R3, R2, c[26].xyxw;
MAD R1.xyz, R1, R0, c[24].wzww;
SLT R4.x, R3.w, c[0].w;
SGE R4.yz, R3.w, c[27].xxyw;
MAD R3.xyz, R3, R2, c[26].zwzw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[24].wzww;
DP3 R3.w, R1, -R0;
MAD R0.xyz, R3, R2, c[24].wzww;
SLT R1.x, R2.w, c[0].w;
SGE R1.yz, R2.w, c[27].xxyw;
DP3 R1.y, R1, c[24].wzww;
DP3 R0.y, R0, -R1;
MAD R0.z, R0.y, c[23].w, c[23].w;
MUL R0.z, R3.w, R0;
MOV R2.x, c[15];
ADD R0.x, R2, c[14];
MAD R1.x, R0.z, c[20], -c[20];
RCP R0.y, R0.x;
MUL R0.y, R1.w, R0;
ABS R0.y, R0;
ABS R0.z, R0.x;
FRC R0.x, R0.y;
MUL R0.z, R0.x, R0;
ADD R0.x, R1, c[0].y;
ADD R1.x, -R0.z, -R0.z;
SLT R0.w, R0, -c[9].y;
MAD R0.z, R1.x, R0.w, R0;
MOV R0.y, c[0].w;
MUL R0.w, R0.y, c[14].x;
MOV R0.y, c[22].x;
MAD R1.x, R0.y, -c[14], c[14];
RCP R0.w, R0.w;
MAD R0.y, R0, -c[14].x, R0.z;
MUL R0.w, R0.z, R0;
RCP R1.x, R1.x;
MUL R0.z, R0.y, R1.x;
MIN R0.y, R0.w, c[0];
MAX R0.y, R0, c[0].x;
MAD R0.w, -R0.y, c[22].z, c[22].y;
MIN R0.z, R0, c[0].y;
MUL R0.y, R0, R0;
MUL R0.y, R0, R0.w;
MAX R0.z, R0, c[0].x;
MAD R0.w, -R0.z, c[22].z, c[22].y;
MUL R0.z, R0, R0;
MAD R0.z, -R0, R0.w, c[0].y;
MAD R1.w, R0.y, R0.z, -R0.x;
MOV R0.y, c[28].x;
SLT R0.w, c[20].x, R0.y;
MAD R0.x, R1.w, R0.w, R0;
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
DP3 R0.z, R1, R1;
RSQ R0.y, R0.z;
RCP R0.y, R0.y;
ADD R0.z, R0.y, -c[17].x;
ADD R0.x, R0, c[13];
MAX R0.z, R0, c[0].x;
RCP R0.w, c[18].x;
MUL R0.w, R0.z, R0;
ADD R0.z, R0.y, -c[11].x;
MIN R1.x, R0.w, c[0].y;
MAX R0.w, R0.z, c[0].x;
RCP R0.z, c[10].x;
MUL R0.y, R0, R0.z;
MUL R0.w, R0, c[0].z;
MIN R0.z, R0.w, c[0].y;
MIN R0.y, R0, c[0];
MAX R0.y, R0, c[0].x;
MAX R0.z, R0, c[0].x;
MUL R0.w, R0.y, R0.y;
ADD R0.z, -R0, c[0].y;
MUL R0.y, R0.z, R0.z;
MUL R0.z, R0.w, R0.w;
MUL R0.z, R0, R0.y;
MUL R0.y, R1.x, R1.x;
MUL R1, R0.z, c[21];
MUL R0.y, R0, c[19].x;
MUL R1, R1, c[12].x;
MOV R0.w, vertex.position;
MUL R0.y, R0, vertex.color.w;
MUL result.texcoord[1], R1, R0.x;
MUL R0.xyz, R0.y, vertex.normal;
ADD R0.xyz, R0, vertex.position;
DP4 result.position.w, R0, c[8];
DP4 result.position.z, R0, c[7];
DP4 result.position.y, R0, c[6];
DP4 result.position.x, R0, c[5];
MOV result.texcoord[0].xy, vertex.texcoord[0];
END
# 114 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Vector 8 [_Time]
Float 9 [_FadeOutDistNear]
Float 10 [_FadeOutDistFar]
Float 11 [_Multiplier]
Float 12 [_Bias]
Float 13 [_TimeOnDuration]
Float 14 [_TimeOffDuration]
Float 15 [_BlinkingTimeOffsScale]
Float 16 [_SizeGrowStartDist]
Float 17 [_SizeGrowEndDist]
Float 18 [_MaxGrowSize]
Float 19 [_NoiseAmount]
Vector 20 [_Color]
"vs_2_0
def c21, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c22, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c23, 0.00000000, 0.20000000, 0.25000000, 0.75000000
def c24, 0.01000000, 2.00000000, 3.00000000, 6.28318548
def c25, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c26, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mov r0.x, c13
add r0.z, c14.x, r0.x
mul r0.y, v3.z, c15.x
add r0.x, r0.y, c8.y
rcp r0.w, r0.z
mul r0.w, r0.x, r0
abs r0.w, r0
slt r0.y, r0, -c8
max r0.y, -r0, r0
slt r0.y, c23.x, r0
add r1.x, -r0.y, c21.z
abs r0.z, r0
frc r0.w, r0
mul r0.w, r0, r0.z
mov r0.z, c13.x
mul r1.y, c23.z, r0.z
mul r0.z, r0.w, r1.x
mad r0.z, r0.y, -r0.w, r0
rcp r1.x, r1.y
mul r0.w, r0.z, r1.x
mov r0.y, c23.w
mad r1.x, r0.y, -c13, c13
mov r0.y, c13.x
mad r0.y, c23.w, -r0, r0.z
rcp r1.x, r1.x
mul r0.z, r0.y, r1.x
min r0.w, r0, c21.z
max r0.y, r0.w, c23.x
min r0.w, r0.z, c21.z
mad r0.z, -r0.y, c24.y, c24
mul r0.y, r0, r0
mul r0.y, r0, r0.z
max r0.z, r0.w, c23.x
rcp r1.x, c13.x
mul r1.x, r0, r1
mul r0.w, r0.z, r0.z
mad r0.x, -r0.z, c24.y, c24.z
mad r0.x, -r0.w, r0, c21.z
mul r0.z, r1.x, c24.w
mul r2.x, r0.y, r0
mad r0.w, r0.z, c26.x, c26.y
mad r0.y, r0.w, c25.x, c25
mad r0.x, r0.z, c25, c25.y
frc r0.y, r0
frc r0.x, r0
mad r1.x, r0.y, c25.z, c25.w
mad r2.y, r0.x, c25.z, c25.w
sincos r0.xy, r1.x, c22.xyzw, c21.xyzw
sincos r1.xy, r2.y, c22.xyzw, c21.xyzw
mad r0.y, r0.x, c21.w, c21.w
mul r0.y, r1, r0
mad r0.y, r0, c19.x, -c19.x
add r1.x, r0.y, c21.z
mov r0.x, c24
slt r0.x, c19, r0
max r0.x, -r0, r0
slt r0.w, c23.x, r0.x
dp4 r0.z, v0, c2
dp4 r0.y, v0, c1
dp4 r0.x, v0, c0
dp3 r0.x, r0, r0
add r0.y, -r0.w, c21.z
mul r0.y, r0, r1.x
mad r0.y, r0.w, r2.x, r0
rsq r0.x, r0.x
rcp r0.z, r0.x
add r0.x, r0.y, c12
add r0.y, r0.z, -c16.x
rcp r0.w, c17.x
max r0.y, r0, c23.x
mul r0.y, r0, r0.w
add r0.w, r0.z, -c10.x
max r1.x, r0.w, c23
rcp r0.w, c9.x
mul r0.z, r0, r0.w
mul r1.x, r1, c23.y
min r0.w, r1.x, c21.z
min r0.y, r0, c21.z
min r0.z, r0, c21
max r0.w, r0, c23.x
max r0.z, r0, c23.x
add r0.w, -r0, c21.z
mul r0.z, r0, r0
mul r0.y, r0, r0
mul r0.y, r0, c18.x
mul r0.w, r0, r0
mul r0.z, r0, r0
mul r0.z, r0, r0.w
mul r1, r0.z, c20
mul r1, r1, c11.x
mov r0.w, v0
mul r0.y, r0, v3.w
mul oT1, r1, r0.x
mul r0.xyz, r0.y, v1
add r0.xyz, r0, v0
dp4 oPos.w, r0, c7
dp4 oPos.z, r0, c6
dp4 oPos.y, r0, c5
dp4 oPos.x, r0, c4
mov oT0.xy, v2
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Float 16 [_FadeOutDistNear]
Float 20 [_FadeOutDistFar]
Float 24 [_Multiplier]
Float 28 [_Bias]
Float 32 [_TimeOnDuration]
Float 36 [_TimeOffDuration]
Float 40 [_BlinkingTimeOffsScale]
Float 44 [_SizeGrowStartDist]
Float 48 [_SizeGrowEndDist]
Float 52 [_MaxGrowSize]
Float 56 [_NoiseAmount]
Vector 64 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedagaehomljchkcimnfppedallibhbkpebabaaaaaalmajaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapamaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcfaaiaaaaeaaaabaabeacaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aiaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadmcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaac
adaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaa
afaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaeaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
agaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaahaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaelaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkiacaiaebaaaaaaaaaaaaaaacaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaoaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkbabaaaafaaaaaa
dcaaaaajocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaacaaaaaaagbjbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaakgakbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaafgafbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaaaaaaaaajccaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaiaebaaaaaaaaaaaaaaabaaaaaaaocaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaamnmmemdoddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaakgikcaaaaaaaaaaaabaaaaaadcaaaaal
bcaabaaaabaaaaaackiacaaaaaaaaaaaacaaaaaackbabaaaafaaaaaabkiacaaa
abaaaaaaaaaaaaaaaaaaaaajccaabaaaabaaaaaabkiacaaaaaaaaaaaacaaaaaa
akiacaaaaaaaaaaaacaaaaaaaoaaaaahecaabaaaabaaaaaaakaabaaaabaaaaaa
bkaabaaaabaaaaaabnaaaaaiicaabaaaabaaaaaackaabaaaabaaaaaackaabaia
ebaaaaaaabaaaaaabkaaaaagecaabaaaabaaaaaackaabaiaibaaaaaaabaaaaaa
dhaaaaakecaabaaaabaaaaaadkaabaaaabaaaaaackaabaaaabaaaaaackaabaia
ebaaaaaaabaaaaaadiaaaaaldcaabaaaacaaaaaaagiacaaaaaaaaaaaacaaaaaa
aceaaaaaaaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaakicaabaaaabaaaaaa
ckaabaaaabaaaaaabkaabaaaabaaaaaabkaabaiaebaaaaaaacaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaaaoaaaaakecaabaaa
abaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaacaaaaaa
dicaaaahkcaabaaaabaaaaaakgakbaaaabaaaaaafganbaaaabaaaaaadcaaaaaj
ecaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaea
diaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaak
ecaabaaaabaaaaaackaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaiadpdcaaaaajicaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaama
abeaaaaaaaaaeaeadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaa
abaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaaaoaaaaai
ecaabaaaabaaaaaaabeaaaaanlapmjeaakiacaaaaaaaaaaaacaaaaaadiaaaaah
bcaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajecaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaadipiccdpabeaaaaakhoigcecenaaaaag
bcaabaaaabaaaaaaaanaaaaaakaabaaaabaaaaaaenaaaaagaanaaaaaecaabaaa
abaaaaaackaabaaaabaaaaaadcaaaaajecaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahbcaabaaaabaaaaaackaabaaa
abaaaaaaakaabaaaabaaaaaadcaaaaambcaabaaaabaaaaaackiacaaaaaaaaaaa
adaaaaaaakaabaaaabaaaaaackiacaiaebaaaaaaaaaaaaaaadaaaaaaaaaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadpdbaaaaaiecaabaaa
abaaaaaackiacaaaaaaaaaaaadaaaaaaabeaaaaaaknhcddmdhaaaaajbcaabaaa
abaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaai
bcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaabaaaaaadiaaaaah
pccabaaaacaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Float 16 [_FadeOutDistNear]
Float 20 [_FadeOutDistFar]
Float 24 [_Multiplier]
Float 28 [_Bias]
Float 32 [_TimeOnDuration]
Float 36 [_TimeOffDuration]
Float 40 [_BlinkingTimeOffsScale]
Float 44 [_SizeGrowStartDist]
Float 48 [_SizeGrowEndDist]
Float 52 [_MaxGrowSize]
Float 56 [_NoiseAmount]
Vector 64 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfaonhebcnkgfaiobkkmjlnhofbikhmgjabaaaaaababaaaaaaeaaaaaa
daaaaaaaiaagaaaaniaoaaaakaapaaaaebgpgodjeiagaaaaeiagaaaaaaacpopp
pmafaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaiaaagaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaoaaapkaaaaaaaaaaaaaiadpmnmmemdoaaaaaadp
fbaaaaafapaaapkaaaaaiadoaaaaeadpaaaaaamaaaaaeaeafbaaaaafbaaaapka
idpjccdoaaaaaadpaknhcddmaaaaaaaafbaaaaafbbaaapkanlapmjeanlapejma
phpnhpeakhoigcecfbaaaaafbcaaapkaabannalfgballglhklkkckdlijiiiidj
fbaaaaafbdaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaagaaaaacaaaaabiaacaaaakaabaaaaacabaaafiaacaaoeka
aeaaaaaeaaaaaciaabaakkiaafaakkjaafaaffkaafaaaaadaaaaaeiaaaaaaaia
aaaaffiaaeaaaaaeaaaaabiaaaaaffiaaaaaaaiaaoaappkabdaaaaacaaaaabia
aaaaaaiaaeaaaaaeaaaaabiaaaaaaaiabbaaaakabbaaffkacfaaaaaeacaaacia
aaaaaaiabcaaoekabdaaoekaaeaaaaaeaaaaabiaaaaakkiabbaakkkabbaappka
aeaaaaaeaaaaabiaaaaaaaiabaaaaakabaaaffkabdaaaaacaaaaabiaaaaaaaia
aeaaaaaeaaaaabiaaaaaaaiabbaaaakabbaaffkacfaaaaaeadaaabiaaaaaaaia
bcaaoekabdaaoekaaeaaaaaeaaaaabiaadaaaaiaaoaappkaaoaappkaafaaaaad
aaaaabiaaaaaaaiaacaaffiaaeaaaaaeaaaaabiaadaakkkaaaaaaaiaadaakkkb
acaaaaadaaaaabiaaaaaaaiaaoaaffkaacaaaaadaaaaaeiaacaaffkaacaaaaka
agaaaaacaaaaaiiaaaaakkiaafaaaaadaaaaaciaaaaappiaaaaaffiacdaaaaac
aaaaaiiaaaaaffiaanaaaaadaaaaaciaaaaaffiaaaaaffibbdaaaaacaaaaaiia
aaaappiabcaaaaaeabaaaciaaaaaffiaaaaappiaaaaappibafaaaaadaaaaakia
abaaaaiaapaagakaaeaaaaaeaaaaaiiaabaaffiaaaaakkiaaaaappibafaaaaad
aaaaaeiaaaaakkiaabaaffiaagaaaaacaaaaaciaaaaaffiaafaaaaadaaaaaiia
aaaaffiaaaaappiaafaaaaadaaaaaciaaaaaffiaaaaakkiaalaaaaadaaaaagia
aaaapeiaaoaaaakaakaaaaadaaaaagiaaaaaoeiaaoaaffkaaeaaaaaeaaaaaiia
aaaakkiaapaakkkaapaappkaafaaaaadaaaaaeiaaaaakkiaaaaakkiaaeaaaaae
aaaaaeiaaaaappiaaaaakkibaoaaffkaaeaaaaaeaaaaaiiaaaaaffiaapaakkka
apaappkaafaaaaadaaaaaciaaaaaffiaaaaaffiaafaaaaadaaaaaciaaaaaffia
aaaappiaaeaaaaaeaaaaaciaaaaaffiaaaaakkiaaaaaaaibabaaaaacaaaaaeia
adaakkkaamaaaaadaaaaaeiaaaaakkiabaaakkkaaeaaaaaeaaaaabiaaaaakkia
aaaaffiaaaaaaaiaacaaaaadaaaaabiaaaaaaaiaabaappkaafaaaaadaaaaaoia
aaaaffjaalaajakaaeaaaaaeaaaaaoiaakaajakaaaaaaajaaaaaoeiaaeaaaaae
aaaaaoiaamaajakaaaaakkjaaaaaoeiaaeaaaaaeaaaaaoiaanaajakaaaaappja
aaaaoeiaaiaaaaadaaaaaciaaaaapjiaaaaapjiaahaaaaacaaaaaciaaaaaffia
agaaaaacaaaaaciaaaaaffiaacaaaaadaaaaaeiaaaaaffiaabaaffkbalaaaaad
aaaaaeiaaaaakkiaaoaaaakaafaaaaadaaaaaeiaaaaakkiaaoaakkkaakaaaaad
aaaaaeiaaaaakkiaaoaaffkaacaaaaadaaaaaeiaaaaakkibaoaaffkaagaaaaac
aaaaaiiaabaaaakaafaaaaadaaaaamiaaaaaoeiaaaaageiaacaaaaadaaaaacia
aaaaffiaacaappkbalaaaaadaaaaakiaaaaaoeiaaoaaaakaakaaaaadaaaaaiia
aaaappiaaoaaffkaafaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaaaiia
aaaappiaaaaappiaafaaaaadaaaaaeiaaaaakkiaaaaappiaafaaaaadabaaapia
aaaakkiaaeaaoekaafaaaaadabaaapiaabaaoeiaabaakkkaafaaaaadabaaapoa
aaaaaaiaabaaoeiaagaaaaacaaaaabiaadaaaakaafaaaaadaaaaabiaaaaaaaia
aaaaffiaakaaaaadaaaaabiaaaaaaaiaaoaaffkaafaaaaadaaaaabiaaaaaaaia
aaaaaaiaafaaaaadaaaaabiaaaaaaaiaadaaffkaafaaaaadaaaaabiaaaaaaaia
afaappjaabaaaaacabaaahiaaaaaoejaaeaaaaaeaaaaahiaaaaaaaiaacaaoeja
abaaoeiaafaaaaadabaaapiaaaaaffiaahaaoekaaeaaaaaeabaaapiaagaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejappppaaaa
fdeieefcfaaiaaaaeaaaabaabeacaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaiaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadmcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacadaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaeaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaagaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaahaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaia
ebaaaaaaaaaaaaaaacaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaoaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaadaaaaaaddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkbabaaaafaaaaaadcaaaaaj
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaacaaaaaaagbjbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaakgakbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaafgafbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
pgapbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaaaaaaaaajccaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaiaebaaaaaaaaaaaaaaabaaaaaaaocaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaaaaaaaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
mnmmemdoddaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaakgikcaaaaaaaaaaaabaaaaaadcaaaaalbcaabaaa
abaaaaaackiacaaaaaaaaaaaacaaaaaackbabaaaafaaaaaabkiacaaaabaaaaaa
aaaaaaaaaaaaaaajccaabaaaabaaaaaabkiacaaaaaaaaaaaacaaaaaaakiacaaa
aaaaaaaaacaaaaaaaoaaaaahecaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaabnaaaaaiicaabaaaabaaaaaackaabaaaabaaaaaackaabaiaebaaaaaa
abaaaaaabkaaaaagecaabaaaabaaaaaackaabaiaibaaaaaaabaaaaaadhaaaaak
ecaabaaaabaaaaaadkaabaaaabaaaaaackaabaaaabaaaaaackaabaiaebaaaaaa
abaaaaaadiaaaaaldcaabaaaacaaaaaaagiacaaaaaaaaaaaacaaaaaaaceaaaaa
aaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaakicaabaaaabaaaaaackaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaiaebaaaaaaacaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaackaabaaaabaaaaaaaoaaaaakecaabaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaacaaaaaadicaaaah
kcaabaaaabaaaaaakgakbaaaabaaaaaafganbaaaabaaaaaadcaaaaajecaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakecaabaaa
abaaaaaackaabaiaebaaaaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
dcaaaaajicaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaamaabeaaaaa
aaaaeaeadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
diaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
ccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaaaoaaaaaiecaabaaa
abaaaaaaabeaaaaanlapmjeaakiacaaaaaaaaaaaacaaaaaadiaaaaahbcaabaaa
abaaaaaackaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajecaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaadipiccdpabeaaaaakhoigcecenaaaaagbcaabaaa
abaaaaaaaanaaaaaakaabaaaabaaaaaaenaaaaagaanaaaaaecaabaaaabaaaaaa
ckaabaaaabaaaaaadcaaaaajecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaaadpdiaaaaahbcaabaaaabaaaaaackaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaambcaabaaaabaaaaaackiacaaaaaaaaaaaadaaaaaa
akaabaaaabaaaaaackiacaiaebaaaaaaaaaaaaaaadaaaaaaaaaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadpdbaaaaaiecaabaaaabaaaaaa
ckiacaaaaaaaaaaaadaaaaaaabeaaaaaaknhcddmdhaaaaajbcaabaaaabaaaaaa
ckaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaaibcaabaaa
abaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaabaaaaaadiaaaaahpccabaaa
acaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapamaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
TEMP R0;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL result.color, R0, fragment.texcoord[1];
END
# 2 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
dcl t0.xy
dcl t1
texld r0, t0, s0
mul r0, r0, t1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedjhmegfpchcmhidddkpfpjaohcifccijlabaaaaaagmabaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjeaaaaaaeaaaaaaacfaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefieceddfakoapfnfihofoepfjeghcpigjmddmbabaaaaaapiabaaaaaeaaaaaa
daaaaaaaliaaaaaafeabaaaameabaaaaebgpgodjiaaaaaaaiaaaaaaaaaacpppp
fiaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaafaaaaadaaaacpia
aaaaoeiaabaaoelaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcjeaaaaaa
eaaaaaaacfaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaa
egaobaaaaaaaaaaaegbobaaaacaaaaaadoaaaaabejfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}