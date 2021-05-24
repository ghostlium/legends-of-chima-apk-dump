//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Alpha Blend Flickering" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _GlowStrength ("Glow Strength", Float) = 1
 _Bias ("Bias", Float) = 0
 _TimeOnDuration ("ON duration", Float) = 0.5
 _TimeOffDuration ("OFF duration", Float) = 0.5
 _BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
 _NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0,0.5)) = 0
 _Color ("Color", Color) = (1,1,1,1)
 _FresnelPower ("Fresnel Power", Float) = 1.5
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Float 16 [_Bias]
Float 17 [_TimeOnDuration]
Float 18 [_TimeOffDuration]
Float 19 [_BlinkingTimeOffsScale]
Float 20 [_NoiseAmount]
Float 21 [_GlowStrength]
Vector 22 [_Color]
Float 23 [_FresnelPower]
"!!ARBvp1.0
PARAM c[30] = { { 1, 0.25, 0, 2 },
		state.matrix.mvp,
		program.local[5..23],
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
MOV R0.zw, c[0].xyxy;
MOV R0.x, c[19];
DP4 R2.w, R0.z, c[5];
ADD R1.w, R0.x, c[13].y;
ADD R3.w, R1, R2;
RCP R0.y, c[17].x;
MUL R0.x, R3.w, R0.y;
MUL R0.x, R0, c[24].z;
MAD R0.y, R0.x, c[29].x, c[29];
MUL R0.y, R0, c[24].w;
FRC R4.y, R0;
ADD R0.x, R2.w, R0;
MUL R0.x, R0, c[24].w;
ADD R1.x, R0, -c[0].y;
FRC R4.w, R1.x;
ADD R0.xyz, -R4.y, c[25];
MUL R0.xyz, R0, R0;
MAD R2.xyz, R0, c[26].xyxw, c[26].zwzw;
MAD R3.xyz, R2, R0, c[27].xyxw;
MAD R3.xyz, R3, R0, c[27].zwzw;
MAD R3.xyz, R3, R0, c[28].xyxw;
SLT R4.x, R4.y, c[0].y;
ADD R1.xyz, -R4.w, c[25];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[26].xyxw, c[26].zwzw;
MAD R2.xyz, R2, R1, c[27].xyxw;
MAD R2.xyz, R2, R1, c[27].zwzw;
MAD R3.xyz, R3, R0, c[25].wzww;
SGE R4.yz, R4.y, c[28].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[25].wzww;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[28].xyxw;
MAD R0.xyz, R0, R1, c[25].wzww;
SGE R1.yz, R4.w, c[28].xzww;
SLT R1.x, R4.w, c[0].y;
MOV R2.xz, R1;
DP3 R2.y, R1, c[25].wzww;
DP3 R0.x, R0, -R2;
MAD R3.x, R3, c[25].y, c[25].y;
MUL R0.x, R0, R3;
MAD R0.x, R0, c[20], -c[20];
ADD R1.x, R0, c[0];
MOV R0.x, c[18];
ADD R1.y, R0.x, c[17].x;
RCP R1.z, R1.y;
MUL R1.z, R3.w, R1;
MOV R4.xyz, c[14];
MOV R4.w, c[0].x;
ABS R2.x, R1.y;
ABS R1.z, R1;
FRC R1.y, R1.z;
MUL R1.y, R1, R2.x;
ADD R1.z, -R1.y, -R1.y;
SLT R1.w, R1, -R2;
MAD R1.y, R1.z, R1.w, R1;
MUL R1.z, R0.w, c[17].x;
MOV R0.w, c[24].y;
MAD R1.w, R0, -c[17].x, c[17].x;
RCP R1.z, R1.z;
MAD R0.w, R0, -c[17].x, R1.y;
MUL R1.z, R1.y, R1;
RCP R1.w, R1.w;
MUL R1.y, R0.w, R1.w;
MIN R0.w, R1.z, c[0].x;
MIN R1.y, R1, c[0].x;
MAX R1.z, R1.y, c[0];
MAX R0.w, R0, c[0].z;
MUL R1.y, -R0.w, c[0].w;
MUL R1.w, -R1.z, c[0];
ADD R1.y, R1, c[24].x;
MUL R0.w, R0, R0;
MUL R0.w, R0, R1.y;
MUL R1.y, R1.z, R1.z;
ADD R1.w, R1, c[24].x;
MAD R1.y, -R1, R1.w, c[0].x;
MAD R1.y, R0.w, R1, -R1.x;
MOV R0.w, c[29].z;
SLT R0.w, c[20].x, R0;
DP4 R0.z, R4, c[11];
DP4 R0.y, R4, c[10];
DP4 R0.x, R4, c[9];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R1.z, R0, R0;
RSQ R1.z, R1.z;
MUL R2.xyz, R1.z, R0;
MAD R0.x, R1.y, R0.w, R1;
DP3 R0.y, R2, vertex.normal;
POW R1.x, R0.y, c[23].x;
ADD R0.x, R0, c[16];
MUL R0, R0.x, c[22];
MIN R1.x, R1, c[0];
MUL result.texcoord[1], R0, c[21].x;
MAX result.texcoord[2], R1.x, c[0].z;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 99 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Float 15 [_Bias]
Float 16 [_TimeOnDuration]
Float 17 [_TimeOffDuration]
Float 18 [_BlinkingTimeOffsScale]
Float 19 [_NoiseAmount]
Float 20 [_GlowStrength]
Vector 21 [_Color]
Float 22 [_FresnelPower]
"vs_2_0
def c23, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c24, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c25, 0.01000000, 0.00000000, 0.25000000, 0.75000000
def c26, 2.00000000, 3.00000000, 6.28318548, 0
def c27, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c28, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r0, c4
dp4 r1.w, c23.z, r0
mov r0.x, c12.y
add r0.x, c18, r0
slt r0.y, r0.x, -r1.w
mov r0.z, c16.x
add r0.z, c17.x, r0
rcp r0.w, r0.z
add r2.x, r0, r1.w
max r0.y, -r0, r0
slt r0.x, c25.y, r0.y
mul r0.w, r2.x, r0
abs r0.y, r0.w
frc r0.y, r0
abs r0.z, r0
mul r0.z, r0.y, r0
add r0.w, -r0.x, c23.z
mov r0.y, c16.x
mul r0.w, r0.z, r0
mul r1.x, c25.z, r0.y
mad r0.y, r0.x, -r0.z, r0.w
rcp r0.z, r1.x
mov r0.x, c25.w
mad r0.w, r0.x, -c16.x, c16.x
mov r0.x, c16
mad r0.x, c25.w, -r0, r0.y
mul r0.z, r0.y, r0
rcp r0.w, r0.w
mul r0.y, r0.x, r0.w
min r0.x, r0.z, c23.z
min r0.y, r0, c23.z
max r0.z, r0.y, c25.y
max r0.x, r0, c25.y
mad r0.y, -r0.x, c26.x, c26
mul r0.x, r0, r0
mul r2.y, r0.x, r0
mov r0.w, c23.z
mad r0.y, -r0.z, c26.x, c26
mul r0.x, r0.z, r0.z
mad r2.z, -r0.x, r0.y, c23
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.x, r0, c8
dp4 r1.y, r0, c9
mad r0.xyz, r1, c14.w, -v0
dp3 r1.y, r0, r0
rsq r1.y, r1.y
mul r0.xyz, r1.y, r0
rcp r0.w, c16.x
mul r0.w, r2.x, r0
dp3 r1.y, r0, v1
mul r0.w, r0, c26.z
add r0.x, r1.w, r0.w
mad r0.y, r0.w, c28.x, c28
mad r0.x, r0, c27, c27.y
mad r0.y, r0, c27.x, c27
frc r0.y, r0
frc r0.x, r0
mul r1.x, r2.y, r2.z
mad r0.x, r0, c27.z, c27.w
sincos r2.xy, r0.x, c24.xyzw, c23.xyzw
mad r1.z, r0.y, c27, c27.w
sincos r0.xy, r1.z, c24.xyzw, c23.xyzw
mad r0.z, r0.x, c23.w, c23.w
mov r0.y, c25.x
slt r0.x, c19, r0.y
max r0.x, -r0, r0
slt r1.z, c25.y, r0.x
mul r0.y, r2, r0.z
mad r0.y, r0, c19.x, -c19.x
add r0.y, r0, c23.z
add r0.x, -r1.z, c23.z
mul r1.w, r0.x, r0.y
pow r0, r1.y, c22.x
mad r0.y, r1.z, r1.x, r1.w
mov r1.x, r0
add r0.y, r0, c15.x
mul r0, r0.y, c21
min r1.x, r1, c23.z
mul oT1, r0, c20.x
max oT2, r1.x, c25.y
mov oT0.xy, v2
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
ConstBuffer "$Globals" 80
Float 16 [_Bias]
Float 20 [_TimeOnDuration]
Float 24 [_TimeOffDuration]
Float 28 [_BlinkingTimeOffsScale]
Float 32 [_NoiseAmount]
Float 36 [_GlowStrength]
Vector 48 [_Color]
Float 64 [_FresnelPower]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedelppncldeobekkpfnfofppjkjhhkpcaiabaaaaaaciajaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
keahaaaaeaaaabaaojabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaa
akiacaaaacaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaacaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaacaaaaaaapaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaaaaaaaaaaa
abaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaaaoaaaaaiecaabaaaaaaaaaaaabeaaaaanlapmjea
bkiacaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaadipiccdpabeaaaaakhoigcecenaaaaagaanaaaaaecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaaadpenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaambcaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaaakaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaajecaabaaaaaaaaaaackiacaaaaaaaaaaa
abaaaaaabkiacaaaaaaaaaaaabaaaaaaaoaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaaaaaaaaabnaaaaaiicaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaabkaaaaagccaabaaaaaaaaaaabkaabaiaibaaaaaa
aaaaaaaadhaaaaakccaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadiaaaaaldcaabaaaabaaaaaafgifcaaaaaaaaaaa
abaaaaaaaceaaaaaaaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaakicaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaiaebaaaaaaabaaaaaa
diaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaak
ecaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaa
abaaaaaadicaaaahkcaabaaaaaaaaaaakgakbaaaaaaaaaaafganbaaaaaaaaaaa
dcaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaa
aaaaeaeadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaakecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdcaaaaajicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaamaabeaaaaaaaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
dbaaaaaiecaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaaabeaaaaaaknhcddm
dhaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaa
abaaaaaadiaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaaaaaaaaaa
adaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaa
acaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
aaaaaaaaaeaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaddaaaaak
pccabaaaadaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Float 16 [_Bias]
Float 20 [_TimeOnDuration]
Float 24 [_TimeOffDuration]
Float 28 [_BlinkingTimeOffsScale]
Float 32 [_NoiseAmount]
Float 36 [_GlowStrength]
Vector 48 [_Color]
Float 64 [_FresnelPower]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedalailogndohmpnlnmcckhbkhadmllegjabaaaaaadmapaaaaaeaaaaaa
daaaaaaaeaagaaaaomanaaaaleaoaaaaebgpgodjaiagaaaaaiagaaaaaaacpopp
keafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaajaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbeaaapkaaaaaaamaaaaaeaeanlapmjeanlapejmafbaaaaafbfaaapka
aaaaiadpaaaaiadoaaaaeadpaaaaaaaafbaaaaafbgaaapkaidpjccdoaaaaiado
gdibihlekblfmpdhfbaaaaafbhaaapkalkajlglkkekkckdnaaaaaalpidpjcclo
fbaaaaafbiaaapkaphpnhpeakhoigcecaknhcddmaaaaaaaafbaaaaafbjaaapka
abannalfgballglhklkkckdlijiiiidjfbaaaaafbkaaapkaklkkkklmaaaaaalo
aaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjaabaaaaacaaaaahiaagaaoekaafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiabbaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabcaaoeka
aeaaaaaeaaaaahiaaaaaoeiabdaappkaaaaaoejbceaaaaacabaaahiaaaaaoeia
aiaaaaadaaaaabiaabaaoeiaacaaoejaabaaaaacaaaaaciaaeaaaakabaaaaaac
aaaaapiaaaaafaiaakaaaaadacaaapoaaaaakkiabfaaaakaabaaaaacaaaaabia
alaaaakaacaaaaadaaaaabiaaaaaaaiaamaaaakaacaaaaadaaaaabiaaaaaaaia
anaaaakaacaaaaadaaaaabiaaaaaaaiaaoaaaakaabaaaaacaaaaakiaabaaoeka
acaaaaadaaaaaeiaaaaappiaafaaffkaacaaaaadaaaaaeiaaaaaaaiaaaaakkia
agaaaaacaaaaaiiaabaaffkaafaaaaadaaaaaiiaaaaappiaaaaakkiaaeaaaaae
aaaaabiaaaaappiabeaakkkaaaaaaaiaaeaaaaaeaaaaaiiaaaaappiabiaaaaka
biaaffkaaeaaaaaeaaaaaiiaaaaappiabhaappkbbhaakkkbbdaaaaacaaaaaiia
aaaappiaaeaaaaaeaaaaaiiaaaaappiabeaakkkabeaappkacfaaaaaeabaaabia
aaaappiabjaaoekabkaaoekaaeaaaaaeaaaaaiiaabaaaaiabhaakkkbbhaakkkb
aeaaaaaeaaaaabiaaaaaaaiabgaaaakabgaaffkabdaaaaacaaaaabiaaaaaaaia
aeaaaaaeaaaaabiaaaaaaaiabeaakkkabeaappkaafaaaaadaaaaabiaaaaaaaia
aaaaaaiaaeaaaaaeabaaabiaaaaaaaiabgaakkkabgaappkaaeaaaaaeabaaabia
aaaaaaiaabaaaaiabhaaaakaaeaaaaaeabaaabiaaaaaaaiaabaaaaiabhaaffka
aeaaaaaeabaaabiaaaaaaaiaabaaaaiabhaakkkaaeaaaaaeaaaaabiaaaaaaaia
abaaaaiabfaaaakaafaaaaadaaaaabiaaaaappiaaaaaaaiaaeaaaaaeaaaaabia
acaaaakaaaaaaaiaacaaaakbacaaaaadaaaaabiaaaaaaaiabfaaaakaacaaaaad
aaaaaiiaabaakkkaabaaffkaagaaaaacabaaabiaaaaappiaafaaaaadaaaaaeia
aaaakkiaabaaaaiacdaaaaacabaaabiaaaaakkiaanaaaaadaaaaaeiaaaaakkia
aaaakkibbdaaaaacabaaabiaabaaaaiabcaaaaaeacaaabiaaaaakkiaabaaaaia
abaaaaibafaaaaadaaaaagiaaaaaffiabfaaoekaaeaaaaaeaaaaaeiaacaaaaia
aaaappiaaaaakkibafaaaaadaaaaaiiaaaaappiaacaaaaiaagaaaaacaaaaacia
aaaaffiaafaaaaadaaaaaeiaaaaaffiaaaaakkiaafaaaaadaaaaaciaaaaaffia
aaaappiaalaaaaadaaaaagiaaaaaoeiabfaappkaakaaaaadaaaaagiaaaaaoeia
bfaaaakaaeaaaaaeaaaaaiiaaaaakkiabeaaaakabeaaffkaafaaaaadaaaaaeia
aaaakkiaaaaakkiaaeaaaaaeaaaaaeiaaaaappiaaaaakkibbfaaaakaaeaaaaae
aaaaaiiaaaaaffiabeaaaakabeaaffkaafaaaaadaaaaaciaaaaaffiaaaaaffia
afaaaaadaaaaaciaaaaaffiaaaaappiaaeaaaaaeaaaaaciaaaaaffiaaaaakkia
aaaaaaibabaaaaacabaaabiaacaaaakaamaaaaadaaaaaeiaabaaaaiabiaakkka
aeaaaaaeaaaaabiaaaaakkiaaaaaffiaaaaaaaiaacaaaaadaaaaabiaaaaaaaia
abaaaakaafaaaaadaaaaapiaaaaaaaiaadaaoekaafaaaaadabaaapoaaaaaoeia
acaaffkaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejappppaaaa
fdeieefckeahaaaaeaaaabaaojabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaaakiacaaaacaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaacaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaacaaaaaaapaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaaa
aaaaaaaaabaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaaiecaabaaaaaaaaaaaabeaaaaa
nlapmjeabkiacaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaadipiccdpabeaaaaakhoigcecenaaaaagaanaaaaaecaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaaadpenaaaaagbcaabaaaaaaaaaaaaanaaaaa
akaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaambcaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaaakaabaaa
aaaaaaaaakiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaajecaabaaaaaaaaaaackiacaaa
aaaaaaaaabaaaaaabkiacaaaaaaaaaaaabaaaaaaaoaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaaaaaaaaaaabnaaaaaiicaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaabkaaaaagccaabaaaaaaaaaaabkaabaia
ibaaaaaaaaaaaaaadhaaaaakccaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadiaaaaaldcaabaaaabaaaaaafgifcaaa
aaaaaaaaabaaaaaaaceaaaaaaaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaak
icaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaiaebaaaaaa
abaaaaaadiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
aoaaaaakecaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
akaabaaaabaaaaaadicaaaahkcaabaaaaaaaaaaakgakbaaaaaaaaaaafganbaaa
aaaaaaaadcaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaama
abeaaaaaaaaaeaeadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpdcaaaaajicaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
aaaaaaaadbaaaaaiecaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaaabeaaaaa
aknhcddmdhaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
aaaaaaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaaaaaaaaafgifcaaa
aaaaaaaaacaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ddaaaaakpccabaaaadaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpdoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
TEMP R0;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL result.color.w, R0, fragment.texcoord[2].x;
MUL result.color.xyz, R0, fragment.texcoord[1];
END
# 3 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
dcl t0.xy
dcl t1.xyz
dcl t2.x
texld r0, t0, s0
mul_pp r0.xyz, r0, t1
mul r0.w, r0, t2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedclpioegdpeglbaakpfedhcpldcigjagfabaaaaaakmabaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapabaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmaaaaaaeaaaaaaacpaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadbcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaacaaaaaadiaaaaahiccabaaaaaaaaaaadkaabaaaaaaaaaaa
akbabaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedehbllogfdnonlekhdfillaneedjkklccabaaaaaafeacaaaaaeaaaaaa
daaaaaaaneaaaaaajiabaaaacaacaaaaebgpgodjjmaaaaaajmaaaaaaaaacpppp
heaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoela
aaaioekaafaaaaadabaachiaaaaaoeiaabaaoelaafaaaaadabaaciiaaaaappia
acaaaalaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefclmaaaaaaeaaaaaaa
cpaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadbcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaahiccabaaa
aaaaaaaadkaabaaaaaaaaaaaakbabaaaadaaaaaadoaaaaabejfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapabaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}