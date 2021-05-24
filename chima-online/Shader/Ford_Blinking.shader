//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Blinking" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _Multiplier ("Color multiplier", Float) = 1
 _Bias ("Bias", Float) = 0
 _TimeOnDuration ("ON duration", Float) = 0.5
 _TimeOffDuration ("OFF duration", Float) = 0.5
 _TransitionPower ("Transition Power", Float) = 1
 _BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
 _NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0,0.5)) = 0
 _Color ("Color", Color) = (1,1,1,1)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
 Pass {
  Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Opaque" }
  Lighting On
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Float 6 [_Multiplier]
Float 7 [_Bias]
Float 8 [_TimeOnDuration]
Float 9 [_TimeOffDuration]
Float 10 [_BlinkingTimeOffsScale]
Float 11 [_NoiseAmount]
Float 12 [_TransitionPower]
Vector 13 [_Color]
"!!ARBvp1.0
PARAM c[20] = { { 0.25, 0, 1, 0.75 },
		state.matrix.mvp,
		program.local[5..13],
		{ 3, 2, 24.980801, -24.980801 },
		{ 0, 0.5, 1, 0.15915491 },
		{ 6.2831855, -60.145809, 60.145809, 0.63660002 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 56.7272, 0.0099999998 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.w, vertex.color.y, c[10].x;
ADD R1.w, R0, c[5].y;
RCP R0.x, c[8].x;
MUL R0.x, R1.w, R0;
MUL R0.x, R0, c[16];
MUL R0.y, R0.x, c[16].w;
ADD R0.y, R0, c[19].z;
MUL R0.y, R0, c[15].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[15].w;
ADD R0.x, R0, -c[0];
FRC R2.w, R0.x;
ADD R1.xyz, -R3.w, c[15];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[14].zwzw;
ADD R3.xyz, R2, c[16].yzyw;
MAD R3.xyz, R3, R0, c[17].xyxw;
MAD R3.xyz, R3, R0, c[17].zwzw;
MAD R3.xyz, R3, R0, c[18].xyxw;
ADD R1.xyz, -R2.w, c[15];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[14].zwzw;
ADD R2.xyz, R2, c[16].yzyw;
MAD R2.xyz, R2, R1, c[17].xyxw;
MAD R2.xyz, R2, R1, c[17].zwzw;
MAD R3.xyz, R3, R0, c[18].zwzw;
SLT R4.x, R3.w, c[0];
SGE R4.yz, R3.w, c[19].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[18].zwzw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[18].xyxw;
MAD R1.xyz, R0, R1, c[18].zwzw;
SGE R0.yz, R2.w, c[19].xxyw;
SLT R0.x, R2.w, c[0];
DP3 R2.y, R0, c[18].zwzw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MAD R3.x, R3, c[15].y, c[15].y;
MUL R0.y, R0.x, R3.x;
MOV R0.x, c[9];
ADD R1.x, R0, c[8];
RCP R1.y, R1.x;
MAD R0.y, R0, c[11].x, -c[11].x;
ADD R0.z, R0.y, c[0];
MOV R0.xy, c[0].xwzw;
MUL R1.z, R0.x, c[8].x;
MUL R1.y, R1.w, R1;
ABS R0.x, R1.y;
ABS R1.x, R1;
FRC R0.x, R0;
MUL R0.x, R0, R1;
SLT R1.x, R0.w, -c[5].y;
ADD R0.w, -R0.x, -R0.x;
MAD R0.x, R0.w, R1, R0;
RCP R0.w, R1.z;
MUL R0.w, R0.x, R0;
MAD R1.x, R0.y, -c[8], c[8];
MAD R0.x, R0.y, -c[8], R0;
RCP R1.x, R1.x;
MUL R0.y, R0.x, R1.x;
MIN R0.x, R0.w, c[0].z;
MAX R0.x, R0, c[0].y;
MAD R0.w, -R0.x, c[14].y, c[14].x;
MUL R0.x, R0, R0;
MUL R0.w, R0.x, R0;
MIN R0.y, R0, c[0].z;
MAX R0.y, R0, c[0];
MUL R1.x, R0.y, R0.y;
MAD R0.y, -R0, c[14], c[14].x;
MAD R0.y, -R1.x, R0, c[0].z;
MOV R0.x, c[19].w;
MAD R0.y, R0.w, R0, -R0.z;
SLT R0.x, c[11], R0;
MAD R0.x, R0.y, R0, R0.z;
ADD R0.x, R0, c[7];
MOV R0.y, c[6].x;
POW R0.x, R0.x, c[12].x;
MUL R1, R0.y, c[13];
MUL result.texcoord[1], R1, R0.x;
MOV result.texcoord[2], vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 86 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Float 5 [_Multiplier]
Float 6 [_Bias]
Float 7 [_TimeOnDuration]
Float 8 [_TimeOffDuration]
Float 9 [_BlinkingTimeOffsScale]
Float 10 [_NoiseAmount]
Float 11 [_TransitionPower]
Vector 12 [_Color]
"vs_2_0
def c13, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, 0.00000000, 0.25000000, 0.75000000, 0.01000000
def c16, 2.00000000, 3.00000000, 6.28318548, 0
def c17, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c18, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
mul r2.x, v2.y, c9
add r2.y, r2.x, c4
rcp r0.x, c7.x
mul r0.x, r2.y, r0
mul r0.x, r0, c16.z
mad r0.y, r0.x, c18.x, c18
mad r0.x, r0, c17, c17.y
mad r0.y, r0, c17.x, c17
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c17.z, c17.w
sincos r1.xy, r0.x, c14.xyzw, c13.xyzw
mad r2.z, r0.y, c17, c17.w
sincos r0.xy, r2.z, c14.xyzw, c13.xyzw
mov r0.y, c7.x
mad r0.x, r0, c13.w, c13.w
mul r0.z, r1.y, r0.x
add r0.y, c8.x, r0
rcp r0.x, r0.y
mad r0.w, r0.z, c10.x, -c10.x
mul r0.z, r2.y, r0.x
add r0.x, r0.w, c13.z
abs r0.w, r0.y
abs r0.z, r0
frc r0.y, r0.z
mul r0.y, r0, r0.w
slt r0.w, r2.x, -c4.y
mov r0.z, c15.w
max r0.w, -r0, r0
slt r0.w, c15.x, r0
add r1.x, -r0.w, c13.z
mul r1.x, r0.y, r1
mad r1.x, r0.w, -r0.y, r1
slt r0.z, c10.x, r0
max r0.z, -r0, r0
slt r0.z, c15.x, r0
add r1.y, -r0.z, c13.z
mul r0.x, r1.y, r0
mov r0.y, c7.x
mad r1.y, c15.z, -r0, r1.x
mov r0.y, c15.z
mad r1.z, r0.y, -c7.x, c7.x
mov r0.w, c7.x
mul r0.y, c15, r0.w
rcp r0.w, r1.z
mul r0.w, r1.y, r0
rcp r0.y, r0.y
mul r0.y, r1.x, r0
min r0.w, r0, c13.z
max r0.w, r0, c15.x
mad r1.x, -r0.w, c16, c16.y
mul r0.w, r0, r0
min r0.y, r0, c13.z
mad r1.x, -r0.w, r1, c13.z
max r0.y, r0, c15.x
mad r0.w, -r0.y, c16.x, c16.y
mul r0.y, r0, r0
mul r0.y, r0, r0.w
mul r0.y, r0, r1.x
mad r0.x, r0.z, r0.y, r0
add r1.x, r0, c6
pow r0, r1.x, c11.x
mov r2.x, r0
mov r1, c12
mul r0, c5.x, r1
mul oT1, r0, r2.x
mov oT2, v2
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Float 16 [_Multiplier]
Float 20 [_Bias]
Float 24 [_TimeOnDuration]
Float 28 [_TimeOffDuration]
Float 32 [_BlinkingTimeOffsScale]
Float 36 [_NoiseAmount]
Float 40 [_TransitionPower]
Vector 48 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedepibiekaeodanhaahblmdmfkklmahndnabaaaaaaeiahaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
meafaaaaeaaaabaahbabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadcaaaaalbcaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaa
bkbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaa
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
aaaaaaaaabaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaacaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaajpcaabaaaabaaaaaaagiacaaa
aaaaaaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaadiaaaaahpccabaaaacaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaadaaaaaaegbobaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Float 16 [_Multiplier]
Float 20 [_Bias]
Float 24 [_TimeOnDuration]
Float 28 [_TimeOffDuration]
Float 32 [_BlinkingTimeOffsScale]
Float 36 [_NoiseAmount]
Float 40 [_TransitionPower]
Vector 48 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedknaandmhcdkdpggaefjniejcboeeoahhabaaaaaaoaalaaaaaeaaaaaa
daaaaaaameaeaaaajaakaaaafialaaaaebgpgodjimaeaaaaimaeaaaaaaacpopp
eaaeaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaabaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafajaaapkaaaaaiadoaaaaeadpaaaaaaaaaaaaiadp
fbaaaaafakaaapkaaaaaaamaaaaaeaeaaaaaaadpidpjccdofbaaaaafalaaapka
nlapmjeanlapejmaphpnhpeakhoigcecfbaaaaafamaaapkaaknhcddmaaaaaaaa
aaaaaaaaaaaaaaaafbaaaaafanaaapkaabannalfgballglhklkkckdlijiiiidj
fbaaaaafaoaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaagaaaaac
aaaaabiaabaakkkaabaaaaacabaaadiaacaaoekaaeaaaaaeaaaaaciaabaaaaia
afaaffjaaeaaffkaafaaaaadaaaaaeiaaaaaaaiaaaaaffiaaeaaaaaeaaaaabia
aaaaffiaaaaaaaiaakaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabia
aaaaaaiaalaaaakaalaaffkacfaaaaaeacaaaciaaaaaaaiaanaaoekaaoaaoeka
aeaaaaaeaaaaabiaaaaakkiaalaakkkaalaappkaaeaaaaaeaaaaabiaaaaaaaia
akaappkaakaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaia
alaaaakaalaaffkacfaaaaaeadaaabiaaaaaaaiaanaaoekaaoaaoekaaeaaaaae
aaaaabiaadaaaaiaakaakkkaakaakkkaafaaaaadaaaaabiaaaaaaaiaacaaffia
aeaaaaaeaaaaabiaacaaffkaaaaaaaiaacaaffkbacaaaaadaaaaabiaaaaaaaia
ajaappkaacaaaaadaaaaaeiaabaappkaabaakkkaagaaaaacaaaaaiiaaaaakkia
afaaaaadaaaaaciaaaaappiaaaaaffiacdaaaaacaaaaaiiaaaaaffiaanaaaaad
aaaaaciaaaaaffiaaaaaffibbdaaaaacaaaaaiiaaaaappiabcaaaaaeabaaabia
aaaaffiaaaaappiaaaaappibabaaaaacacaaafiaabaaoekaafaaaaadaaaaakia
acaakkiaajaagakaaeaaaaaeaaaaaiiaabaaaaiaaaaakkiaaaaappibafaaaaad
aaaaaeiaaaaakkiaabaaaaiaagaaaaacaaaaaciaaaaaffiaafaaaaadaaaaaiia
aaaaffiaaaaappiaafaaaaadaaaaaciaaaaaffiaaaaakkiaalaaaaadaaaaagia
aaaapeiaajaakkkaakaaaaadaaaaagiaaaaaoeiaajaappkaaeaaaaaeaaaaaiia
aaaakkiaakaaaakaakaaffkaafaaaaadaaaaaeiaaaaakkiaaaaakkiaaeaaaaae
aaaaaeiaaaaappiaaaaakkibajaappkaaeaaaaaeaaaaaiiaaaaaffiaakaaaaka
akaaffkaafaaaaadaaaaaciaaaaaffiaaaaaffiaafaaaaadaaaaaciaaaaaffia
aaaappiaaeaaaaaeaaaaaciaaaaaffiaaaaakkiaaaaaaaibamaaaaadaaaaaeia
abaaffiaamaaaakaaeaaaaaeaaaaabiaaaaakkiaaaaaffiaaaaaaaiaacaaaaad
aaaaabiaaaaaaaiaabaaffkacaaaaaadabaaabiaaaaaaaiaacaakkkaafaaaaad
aaaaapiaacaaaaiaadaaoekaafaaaaadabaaapoaabaaaaiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacacaaapoaafaaoeja
ppppaaaafdeieefcmeafaaaaeaaaabaahbabaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadcaaaaalbcaabaaaaaaaaaaaakiacaaa
aaaaaaaaacaaaaaabkbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaaj
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
aaaaaaaabkiacaaaaaaaaaaaabaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
acaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaajpcaabaaa
abaaaaaaagiacaaaaaaaaaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaadiaaaaah
pccabaaaacaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaa
adaaaaaaegbobaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
TEMP R0;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0, R0, fragment.texcoord[1];
MUL result.color, R0, fragment.texcoord[2];
END
# 3 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
dcl t0.xy
dcl t1
dcl t2
texld r0, t0, s0
mul r0, r0, t1
mul r0, r0, t2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedbbljkbgddcpkjpfaedgockghdhphodhjabaaaaaakmabaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmaaaaaaeaaaaaaacpaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedcaellkbjckaochnffoacmogpolhcldjbabaaaaaafeacaaaaaeaaaaaa
daaaaaaaneaaaaaajiabaaaacaacaaaaebgpgodjjmaaaaaajmaaaaaaaaacpppp
heaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoela
aaaioekaafaaaaadaaaaapiaaaaaoeiaabaaoelaafaaaaadaaaacpiaaaaaoeia
acaaoelaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefclmaaaaaaeaaaaaaa
cpaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadiaaaaahpccabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaadaaaaaadoaaaaabejfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}