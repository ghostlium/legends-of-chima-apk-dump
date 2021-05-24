//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Chi Ball Opaque" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Animated Texture", 2D) = "white" {}
 _HighlightTex ("Highlight Texture", 2D) = "white" {}
 _DetailTexScaleUvs ("Detail layer Scale Uvs", Float) = 5
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _Scroll2X ("Detail layer Scroll speed X", Float) = 1
 _Scroll2Y ("Detail layer Scroll speed Y", Float) = 0
 _Multiplier ("Color multiplier", Float) = 1
 _FresnelPower ("Fresnel Power", Range(0,10)) = 0.8
 _GlowPower ("Glow Power", Float) = 1
 _Color ("Color", Color) = (1,1,1,1)
 _Bias ("Bias", Float) = 0
 _BaseOpacity ("Base Opacity", Float) = 0.5
 _DetailTexOpacity ("Detail Texture Opacity", Float) = 0.5
 _TimeOnDuration ("ON duration", Float) = 0.5
 _TimeOffDuration ("OFF duration", Float) = 0.5
 _BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
 _NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0,0.5)) = 0
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
 Pass {
  Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_World2Object]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [unity_Scale]
Float 12 [_Multiplier]
Float 13 [_Bias]
Float 14 [_TimeOnDuration]
Float 15 [_TimeOffDuration]
Float 16 [_BlinkingTimeOffsScale]
Float 17 [_NoiseAmount]
Float 18 [_BaseOpacity]
Vector 19 [_Color]
Float 20 [_FresnelPower]
Float 21 [_DetailTexScaleUvs]
Vector 22 [_MainTex_ST]
Vector 23 [_DetailTex_ST]
Float 24 [_ScrollX]
Float 25 [_ScrollY]
Float 26 [_Scroll2X]
Float 27 [_Scroll2Y]
"!!ARBvp1.0
PARAM c[34] = { { 1, 0.25, 0, 2 },
		state.matrix.mvp,
		program.local[5..27],
		{ 3, 0.75, 6.2831855, 0.15915491 },
		{ 0, 0.5, 1, -1 },
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -9, 0.75 },
		{ 0.63660002, 56.7272, 0.0099999998 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.w, vertex.color.z, c[16].x;
ADD R1.w, R0, c[9].y;
RCP R0.x, c[14].x;
MUL R0.x, R1.w, R0;
MUL R0.x, R0, c[28].z;
MAD R0.y, R0.x, c[33].x, c[33];
MUL R0.y, R0, c[28].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[28].w;
ADD R0.x, R0, -c[0].y;
FRC R2.w, R0.x;
ADD R1.xyz, -R3.w, c[29];
MUL R0.xyz, R1, R1;
MAD R2.xyz, R0, c[30].xyxw, c[30].zwzw;
MAD R3.xyz, R2, R0, c[31].xyxw;
MAD R3.xyz, R3, R0, c[31].zwzw;
MAD R3.xyz, R3, R0, c[32].xyxw;
ADD R1.xyz, -R2.w, c[29];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[30].xyxw, c[30].zwzw;
MAD R2.xyz, R2, R1, c[31].xyxw;
MAD R2.xyz, R2, R1, c[31].zwzw;
MAD R3.xyz, R3, R0, c[29].wzww;
SLT R4.x, R3.w, c[0].y;
SGE R4.yz, R3.w, c[32].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[29].wzww;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[32].xyxw;
MAD R1.xyz, R0, R1, c[29].wzww;
SGE R0.yz, R2.w, c[32].xzww;
SLT R0.x, R2.w, c[0].y;
DP3 R2.y, R0, c[29].wzww;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MAD R3.x, R3, c[29].y, c[29].y;
MUL R0.x, R0, R3;
MAD R0.x, R0, c[17], -c[17];
ADD R1.x, R0, c[0];
MOV R0.x, c[15];
ADD R1.y, R0.x, c[14].x;
RCP R0.x, R1.y;
MUL R1.z, R1.w, R0.x;
MOV R2.xyz, c[10];
MOV R2.w, c[0].x;
ABS R1.w, R1.y;
ABS R1.z, R1;
FRC R1.y, R1.z;
MUL R1.y, R1, R1.w;
SLT R1.w, R0, -c[9].y;
ADD R1.z, -R1.y, -R1.y;
MAD R1.y, R1.z, R1.w, R1;
MOV R0.w, c[0].y;
MUL R1.z, R0.w, c[14].x;
MOV R0.w, c[28].y;
MAD R1.w, R0, -c[14].x, c[14].x;
RCP R1.z, R1.z;
MAD R0.w, R0, -c[14].x, R1.y;
MUL R1.z, R1.y, R1;
RCP R1.w, R1.w;
MUL R1.y, R0.w, R1.w;
MIN R0.w, R1.z, c[0].x;
MIN R1.y, R1, c[0].x;
MAX R1.z, R1.y, c[0];
MAX R0.w, R0, c[0].z;
MUL R1.y, -R0.w, c[0].w;
MUL R1.w, -R1.z, c[0];
ADD R1.y, R1, c[28].x;
MUL R0.w, R0, R0;
MUL R0.w, R0, R1.y;
MUL R1.y, R1.z, R1.z;
ADD R1.w, R1, c[28].x;
MAD R1.y, -R1, R1.w, c[0].x;
MAD R1.z, R0.w, R1.y, -R1.x;
MOV R0.w, c[33].z;
SLT R0.w, c[17].x, R0;
MAD R0.w, R1.z, R0, R1.x;
DP4 R0.z, R2, c[7];
DP4 R0.y, R2, c[6];
DP4 R0.x, R2, c[5];
MAD R0.xyz, R0, c[11].w, -vertex.position;
DP3 R1.y, R0, R0;
RSQ R1.y, R1.y;
MUL R0.xyz, R1.y, R0;
DP3 R0.x, R0, vertex.normal;
ADD R0.y, -R0.x, c[0].x;
ADD R1.y, R0.w, c[13].x;
POW R1.x, R0.y, c[20].x;
MOV R0.x, c[12];
MUL R0, R0.x, c[19];
MAD R0, R0, R1.x, c[18].x;
MUL result.texcoord[2], R0, R1.y;
MOV R0.y, c[27].x;
MOV R0.x, c[26];
MUL R0.zw, R0.xyxy, c[9].xyxy;
MOV R0.y, c[25].x;
MOV R0.x, c[24];
MUL R1.xy, R0, c[9];
FRC R0.zw, R0;
MAD R0.xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[0].zw, R0.xyxy, c[21].x, R0;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[0], c[22], c[22].zwzw;
ADD result.texcoord[0].xy, R0, R0.zwzw;
MOV result.texcoord[1].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 109 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_World2Object]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Float 11 [_Multiplier]
Float 12 [_Bias]
Float 13 [_TimeOnDuration]
Float 14 [_TimeOffDuration]
Float 15 [_BlinkingTimeOffsScale]
Float 16 [_NoiseAmount]
Float 17 [_BaseOpacity]
Vector 18 [_Color]
Float 19 [_FresnelPower]
Float 20 [_DetailTexScaleUvs]
Vector 21 [_MainTex_ST]
Vector 22 [_DetailTex_ST]
Float 23 [_ScrollX]
Float 24 [_ScrollY]
Float 25 [_Scroll2X]
Float 26 [_Scroll2Y]
"vs_2_0
def c27, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c28, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c29, 0.01000000, 0.00000000, 0.25000000, 0.75000000
def c30, 2.00000000, 3.00000000, 6.28318548, 0
def c31, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c32, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r2.y, v3.z, c15.x
mov r1.xyz, c9
mov r1.w, c27.z
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r0.xyz, r0, c10.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r0, v1
add r1.x, -r0, c27.z
pow r0, r1.x, c19.x
add r2.z, r2.y, c8.y
rcp r0.y, c13.x
mul r0.y, r2.z, r0
mul r0.y, r0, c30.z
mov r2.x, r0
mad r0.x, r0.y, c31, c31.y
mad r0.z, r0.y, c32.x, c32.y
mad r0.y, r0.z, c31.x, c31
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c31.z, c31.w
sincos r1.xy, r0.x, c28.xyzw, c27.xyzw
mad r2.w, r0.y, c31.z, c31
sincos r0.xy, r2.w, c28.xyzw, c27.xyzw
mov r0.y, c13.x
mad r0.x, r0, c27.w, c27.w
mul r0.z, r1.y, r0.x
add r0.y, c14.x, r0
rcp r0.x, r0.y
mad r0.w, r0.z, c16.x, -c16.x
mul r0.z, r2, r0.x
add r0.x, r0.w, c27.z
abs r0.w, r0.y
abs r0.z, r0
frc r0.y, r0.z
mul r0.y, r0, r0.w
slt r0.w, r2.y, -c8.y
mov r0.z, c29.x
max r0.w, -r0, r0
slt r0.w, c29.y, r0
add r1.x, -r0.w, c27.z
mul r1.x, r0.y, r1
mad r0.y, r0.w, -r0, r1.x
slt r0.z, c16.x, r0
max r0.z, -r0, r0
slt r0.z, c29.y, r0
add r1.y, -r0.z, c27.z
mul r0.x, r1.y, r0
mov r0.w, c13.x
mad r1.y, c29.w, -r0.w, r0
mov r0.w, c29
mad r1.z, r0.w, -c13.x, c13.x
mov r1.x, c13
mul r0.w, c29.z, r1.x
rcp r1.x, r1.z
rcp r0.w, r0.w
mul r0.y, r0, r0.w
mul r1.x, r1.y, r1
min r0.w, r1.x, c27.z
max r0.w, r0, c29.y
mad r1.x, -r0.w, c30, c30.y
mul r0.w, r0, r0
min r0.y, r0, c27.z
mad r1.x, -r0.w, r1, c27.z
max r0.y, r0, c29
mad r0.w, -r0.y, c30.x, c30.y
mul r0.y, r0, r0
mul r0.y, r0, r0.w
mul r0.y, r0, r1.x
mad r0.x, r0.z, r0.y, r0
mov r1, c18
mul r1, c11.x, r1
add r0.x, r0, c12
mad r1, r1, r2.x, c17.x
mul oT2, r1, r0.x
mov r0.y, c26.x
mov r0.x, c25
mul r0.zw, r0.xyxy, c8.xyxy
frc r1.xy, r0.zwzw
mad r0.zw, v2.xyxy, c22.xyxy, c22
mov r0.y, c24.x
mov r0.x, c23
mul r0.xy, r0, c8
mad oT0.zw, r0, c20.x, r1.xyxy
frc r0.zw, r0.xyxy
mad r0.xy, v2, c21, c21.zwzw
add oT0.xy, r0, r0.zwzw
mov oT1.xy, v2
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Float 16 [_Multiplier]
Float 20 [_Bias]
Float 24 [_TimeOnDuration]
Float 28 [_TimeOffDuration]
Float 32 [_BlinkingTimeOffsScale]
Float 36 [_NoiseAmount]
Float 40 [_BaseOpacity]
Vector 48 [_Color]
Float 64 [_FresnelPower]
Float 68 [_DetailTexScaleUvs]
Vector 80 [_MainTex_ST]
Vector 96 [_DetailTex_ST]
Float 128 [_ScrollX]
Float 132 [_ScrollY]
Float 136 [_Scroll2X]
Float 140 [_Scroll2Y]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedaigadfhffmdggbmdahkceokmdhjejaenabaaaaaaimajaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaeaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
aiaiaaaaeaaaabaaacacaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadecbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaa
aiaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaakmccabaaaabaaaaaaagaebaaaaaaaaaaa
fgifcaaaaaaaaaaaaeaaaaaakgaobaaaabaaaaaadgaaaaafdccabaaaacaaaaaa
egbabaaaadaaaaaadcaaaaalbcaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaa
ckbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
dkiacaaaaaaaaaaaabaaaaaackiacaaaaaaaaaaaabaaaaaaaoaaaaahecaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaabnaaaaaiicaabaaaaaaaaaaa
ckaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaabkaaaaagecaabaaaaaaaaaaa
ckaabaiaibaaaaaaaaaaaaaadhaaaaakecaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaadiaaaaaldcaabaaaabaaaaaa
kgikcaaaaaaaaaaaabaaaaaaaceaaaaaaaaaiadoaaaaeadpaaaaaaaaaaaaaaaa
dcaaaaakicaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaia
ebaaaaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaa
aaaaaaaaaoaaaaakecaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpakaabaaaabaaaaaadicaaaahkcaabaaaaaaaaaaakgakbaaaaaaaaaaa
fganbaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaamaabeaaaaaaaaaeaeadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaajicaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaaaaaaaaaaoaaaaaiecaabaaaaaaaaaaaabeaaaaanlapmjeackiacaaa
aaaaaaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaajecaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadipiccdp
abeaaaaakhoigcecenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaa
enaaaaagaanaaaaaecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaambcaabaaa
aaaaaaaabkiacaaaaaaaaaaaacaaaaaaakaabaaaaaaaaaaabkiacaiaebaaaaaa
aaaaaaaaacaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpdbaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaaacaaaaaaabeaaaaa
aknhcddmdhaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaabaaaaaadiaaaaajocaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
agijcaaaacaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaalocaabaaa
aaaaaaaaagijcaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaafgaobaaa
aaaaaaaaaaaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaacaaaaaa
bdaaaaaadcaaaaalocaabaaaaaaaaaaafgaobaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaaagbjbaiaebaaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaaiccaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaajpcaabaaaabaaaaaaagiacaaaaaaaaaaaabaaaaaaegiocaaaaaaaaaaa
adaaaaaadcaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaafgafbaaaaaaaaaaa
kgikcaaaaaaaaaaaacaaaaaadiaaaaahpccabaaaadaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Float 16 [_Multiplier]
Float 20 [_Bias]
Float 24 [_TimeOnDuration]
Float 28 [_TimeOffDuration]
Float 32 [_BlinkingTimeOffsScale]
Float 36 [_NoiseAmount]
Float 40 [_BaseOpacity]
Vector 48 [_Color]
Float 64 [_FresnelPower]
Float 68 [_DetailTexScaleUvs]
Vector 80 [_MainTex_ST]
Vector 96 [_DetailTex_ST]
Float 128 [_ScrollX]
Float 132 [_ScrollY]
Float 136 [_Scroll2X]
Float 140 [_Scroll2Y]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedddkhchgpfppfnjfecadgdijnelnccjghabaaaaaageapaaaaaeaaaaaa
daaaaaaaaeagaaaabeaoaaaanmaoaaaaebgpgodjmmafaaaammafaaaaaaacpopp
fmafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaabaa
agaaabaaaaaaaaaaaaaaaiaaabaaahaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaa
abaaaeaaabaaajaaaaaaaaaaacaaaaaaaeaaakaaaaaaaaaaacaabaaaafaaaoaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapkaaaaaiadpaaaaiadoaaaaeadp
aaaaaaaafbaaaaafbeaaapkaaaaaaamaaaaaeaeaaaaaaadpidpjccdofbaaaaaf
bfaaapkanlapmjeanlapejmaphpnhpeakhoigcecfbaaaaafbgaaapkaaknhcddm
aaaaaaaaaaaaaaaaaaaaaaaafbaaaaafbhaaapkaabannalfgballglhklkkckdl
ijiiiidjfbaaaaafbiaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadiaadaaoejaafaaoekaafaaooka
abaaaaacabaaadiaaiaaoekaafaaaaadacaaapiaabaaeeiaahaaoekabdaaaaac
acaaapiaacaaoeiaacaaaaadaaaaadoaaaaaoeiaacaaoeiaaeaaaaaeaaaaadia
adaaoejaagaaoekaagaaookaaeaaaaaeaaaaamoaaaaaeeiaaeaaffkaacaaoeia
agaaaaacaaaaabiaabaakkkaaeaaaaaeaaaaaciaacaaaakaafaakkjaabaaffia
afaaaaadaaaaaeiaaaaaaaiaaaaaffiaaeaaaaaeaaaaabiaaaaaffiaaaaaaaia
beaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaiabfaaaaka
bfaaffkacfaaaaaeabaaaciaaaaaaaiabhaaoekabiaaoekaaeaaaaaeaaaaabia
aaaakkiabfaakkkabfaappkaaeaaaaaeaaaaabiaaaaaaaiabeaappkabeaakkka
bdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaiabfaaaakabfaaffka
cfaaaaaeacaaabiaaaaaaaiabhaaoekabiaaoekaaeaaaaaeaaaaabiaacaaaaia
beaakkkabeaakkkaafaaaaadaaaaabiaaaaaaaiaabaaffiaaeaaaaaeaaaaabia
acaaffkaaaaaaaiaacaaffkbacaaaaadaaaaabiaaaaaaaiabdaaaakaacaaaaad
aaaaaeiaabaappkaabaakkkaagaaaaacaaaaaiiaaaaakkiaafaaaaadaaaaacia
aaaappiaaaaaffiacdaaaaacaaaaaiiaaaaaffiaanaaaaadaaaaaciaaaaaffia
aaaaffibbdaaaaacaaaaaiiaaaaappiabcaaaaaeabaaabiaaaaaffiaaaaappia
aaaappibabaaaaacacaaafiaabaaoekaafaaaaadaaaaakiaacaakkiabdaakeka
aeaaaaaeaaaaaiiaabaaaaiaaaaakkiaaaaappibafaaaaadaaaaaeiaaaaakkia
abaaaaiaagaaaaacaaaaaciaaaaaffiaafaaaaadaaaaaiiaaaaaffiaaaaappia
afaaaaadaaaaaciaaaaaffiaaaaakkiaalaaaaadaaaaagiaaaaapeiabdaappka
akaaaaadaaaaagiaaaaaoeiabdaaaakaaeaaaaaeaaaaaiiaaaaakkiabeaaaaka
beaaffkaafaaaaadaaaaaeiaaaaakkiaaaaakkiaaeaaaaaeaaaaaeiaaaaappia
aaaakkibbdaaaakaaeaaaaaeaaaaaiiaaaaaffiabeaaaakabeaaffkaafaaaaad
aaaaaciaaaaaffiaaaaaffiaafaaaaadaaaaaciaaaaaffiaaaaappiaaeaaaaae
aaaaaciaaaaaffiaaaaakkiaaaaaaaibabaaaaacabaaaciaacaaffkaamaaaaad
aaaaaeiaabaaffiabgaaaakaaeaaaaaeaaaaabiaaaaakkiaaaaaffiaaaaaaaia
acaaaaadaaaaabiaaaaaaaiaabaaffkaabaaaaacabaaahiaajaaoekaafaaaaad
aaaaaoiaabaaffiaapaajakaaeaaaaaeaaaaaoiaaoaajakaabaaaaiaaaaaoeia
aeaaaaaeaaaaaoiabaaajakaabaakkiaaaaaoeiaacaaaaadaaaaaoiaaaaaoeia
bbaajakaaeaaaaaeaaaaaoiaaaaaoeiabcaappkaaaaajajbceaaaaacabaaahia
aaaapjiaaiaaaaadaaaaaciaabaaoeiaacaaoejaacaaaaadaaaaaciaaaaaffib
bdaaaakacaaaaaadabaaabiaaaaaffiaaeaaaakaafaaaaadacaaapiaacaaaaia
adaaoekaaeaaaaaeabaaapiaacaaoeiaabaaaaiaacaakkkaafaaaaadacaaapoa
aaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapia
akaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaadoaadaaoeja
ppppaaaafdeieefcaiaiaaaaeaaaabaaacacaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadecbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaajpcaabaaaabaaaaaa
egiocaaaaaaaaaaaaiaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaa
abaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaakmccabaaaabaaaaaa
agaebaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaakgaobaaaabaaaaaadgaaaaaf
dccabaaaacaaaaaaegbabaaaadaaaaaadcaaaaalbcaabaaaaaaaaaaaakiacaaa
aaaaaaaaacaaaaaackbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaadkiacaaaaaaaaaaaabaaaaaackiacaaaaaaaaaaaabaaaaaa
aoaaaaahecaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaabnaaaaai
icaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaabkaaaaag
ecaabaaaaaaaaaaackaabaiaibaaaaaaaaaaaaaadhaaaaakecaabaaaaaaaaaaa
dkaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaadiaaaaal
dcaabaaaabaaaaaakgikcaaaaaaaaaaaabaaaaaaaceaaaaaaaaaiadoaaaaeadp
aaaaaaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaiaebaaaaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaaaaaaaaaaoaaaaakecaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpakaabaaaabaaaaaadicaaaahkcaabaaaaaaaaaaa
kgakbaaaaaaaaaaafganbaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaajicaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaaiecaabaaaaaaaaaaaabeaaaaa
nlapmjeackiacaaaaaaaaaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaadipiccdpabeaaaaakhoigcecenaaaaagbcaabaaaaaaaaaaaaanaaaaa
akaabaaaaaaaaaaaenaaaaagaanaaaaaecaabaaaaaaaaaaackaabaaaaaaaaaaa
dcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpdiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaambcaabaaaaaaaaaaabkiacaaaaaaaaaaaacaaaaaaakaabaaaaaaaaaaa
bkiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdbaaaaaiecaabaaaaaaaaaaabkiacaaaaaaaaaaa
acaaaaaaabeaaaaaaknhcddmdhaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaabaaaaaadiaaaaajocaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaagijcaaaacaaaaaabbaaaaaadcaaaaalocaabaaaaaaaaaaa
agijcaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaafgaobaaaaaaaaaaa
dcaaaaalocaabaaaaaaaaaaaagijcaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaafgaobaaaaaaaaaaaaaaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaacaaaaaabdaaaaaadcaaaaalocaabaaaaaaaaaaafgaobaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaaagbjbaiaebaaaaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaaegbcbaaaacaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaabjaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaajpcaabaaaabaaaaaaagiacaaaaaaaaaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaadcaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
fgafbaaaaaaaaaaakgikcaaaaaaaaaaaacaaaaaadiaaaaahpccabaaaadaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaeaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
iaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_DetailTexOpacity]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_HighlightTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0..1] };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TEX R1, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, c[1];
MAD R0, R0, c[0].x, R1;
MAD result.color, R0, fragment.texcoord[2], R2;
END
# 6 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_DetailTexOpacity]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_HighlightTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl t0
dcl t1.xy
dcl t2
texld r2, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.xy, r0
texld r0, t1, s2
texld r1, r1, s1
mul r1, r1, c1
mad r1, r1, c0.x, r2
mad r0, r1, t2, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_HighlightTex] 2D 2
ConstBuffer "$Globals" 144
Float 44 [_DetailTexOpacity]
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlkaomojcfddioiajfoohphldahngocilabaaaaaahaacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaapgipcaaaaaaaaaaaacaaaaaaegaobaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaa
adaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_HighlightTex] 2D 2
ConstBuffer "$Globals" 144
Float 44 [_DetailTexOpacity]
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbfpfhdnlahggiediomhpinbjdibgonpgabaaaaaajeadaaaaaeaaaaaa
daaaaaaafaabaaaaniacaaaagaadaaaaebgpgodjbiabaaaabiabaaaaaaacpppp
nmaaaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaacaaacaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
abaaaaacaaaaabiaaaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpia
aaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaecaaaaadacaacpia
abaaoelaacaioekaafaaaaadaaaaapiaaaaaoeiaabaaoekaaeaaaaaeaaaaapia
aaaaoeiaaaaappkaabaaoeiaaeaaaaaeaaaacpiaaaaaoeiaacaaoelaacaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefciaabaaaaeaaaaaaagaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
pcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaapgipcaaaaaaaaaaa
acaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaadaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}