//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Particles/Additive Blink" {
Properties {
 _TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
 _MainTex ("Particle Texture", 2D) = "white" {}
 _InvFade ("Soft Particles Factor", Range(0.01,3)) = 1
 _Bias ("Bias", Float) = 0
 _TimeOnDuration ("ON duration", Float) = 0.5
 _TimeOffDuration ("OFF duration", Float) = 0.5
 _BlinkingTimeOffsScale ("Blinking time offset scale (seconds)", Float) = 5
 _NoiseAmount ("Noise amount (when zero, pulse wave is used)", Range(0,0.5)) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0.01
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "SOFTPARTICLES_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Float 6 [_Bias]
Float 7 [_TimeOnDuration]
Float 8 [_TimeOffDuration]
Float 9 [_BlinkingTimeOffsScale]
Float 10 [_NoiseAmount]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 0.25, 1, 0, 2 },
		state.matrix.mvp,
		program.local[5..11],
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
MUL R0.x, vertex.color.z, c[9];
ADD R0.w, R0.x, c[5].y;
ADD R1.w, vertex.color.x, R0;
RCP R0.x, c[7].x;
MUL R0.x, R1.w, R0;
MUL R0.x, R0, c[12].z;
MUL R0.y, R0.x, c[12].w;
MAD R0.z, R0.x, c[17].x, c[17].y;
ADD R0.x, R0.y, -c[0];
FRC R3.w, R0.x;
MUL R0.y, R0.z, c[12].w;
FRC R2.w, R0.y;
ADD R0.xyz, -R3.w, c[13];
ADD R1.xyz, -R2.w, c[13];
MUL R2.xyz, R1, R1;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[14].xyxw, c[14].zwzw;
MAD R1.xyz, R1, R0, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
MAD R1.xyz, R1, R0, c[16].xyxw;
MAD R3.xyz, R2, c[14].xyxw, c[14].zwzw;
MAD R3.xyz, R3, R2, c[15].xyxw;
MAD R3.xyz, R3, R2, c[15].zwzw;
MAD R1.xyz, R1, R0, c[13].wzww;
SLT R4.x, R3.w, c[0];
SGE R4.yz, R3.w, c[16].xzww;
MAD R3.xyz, R3, R2, c[16].xyxw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[13].wzww;
DP3 R3.w, R1, -R0;
MAD R0.xyz, R3, R2, c[13].wzww;
SLT R1.x, R2.w, c[0];
SGE R1.yz, R2.w, c[16].xzww;
DP3 R1.y, R1, c[13].wzww;
DP3 R0.y, R0, -R1;
MAD R0.z, R0.y, c[13].y, c[13].y;
MUL R0.z, R3.w, R0;
MOV R2.x, c[8];
ADD R0.x, R2, c[7];
MAD R1.x, R0.z, c[10], -c[10];
RCP R0.y, R0.x;
MUL R0.y, R1.w, R0;
ABS R0.z, R0.x;
ABS R0.y, R0;
FRC R0.x, R0.y;
MUL R0.y, R0.x, R0.z;
ADD R0.x, R1, c[0].y;
MOV R1.x, c[0];
ADD R0.z, -R0.y, -R0.y;
SLT R0.w, R0, -vertex.color.x;
MAD R0.y, R0.z, R0.w, R0;
MUL R1.x, R1, c[7];
RCP R0.z, R1.x;
MOV R0.w, c[12].y;
MUL R0.z, R0.y, R0;
MAD R1.x, R0.w, -c[7], c[7];
MAD R0.y, R0.w, -c[7].x, R0;
RCP R1.x, R1.x;
MUL R0.w, R0.y, R1.x;
MIN R0.z, R0, c[0].y;
MAX R0.y, R0.z, c[0].z;
MUL R0.z, -R0.y, c[0].w;
MIN R0.w, R0, c[0].y;
MAX R0.w, R0, c[0].z;
MUL R1.x, -R0.w, c[0].w;
ADD R0.z, R0, c[12].x;
MUL R0.y, R0, R0;
MUL R0.y, R0, R0.z;
MUL R0.z, R0.w, R0.w;
ADD R0.w, R1.x, c[12].x;
MAD R0.z, -R0, R0.w, c[0].y;
MOV R1.x, c[17].z;
SLT R0.w, c[10].x, R1.x;
MAD R0.y, R0, R0.z, -R0.x;
MAD R0.x, R0.y, R0.w, R0;
ADD R0.x, R0, c[6];
MUL result.color, vertex.color, R0.x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 82 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SOFTPARTICLES_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Float 5 [_Bias]
Float 6 [_TimeOnDuration]
Float 7 [_TimeOffDuration]
Float 8 [_BlinkingTimeOffsScale]
Float 9 [_NoiseAmount]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c12, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c13, 0.00000000, 0.01000000, 0.25000000, 0.75000000
def c14, 2.00000000, 3.00000000, 6.28318548, 0
def c15, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c16, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_color0 v1
dcl_texcoord0 v2
mul r0.x, v1.z, c8
add r2.x, r0, c4.y
add r2.y, v1.x, r2.x
rcp r0.x, c6.x
mul r0.x, r2.y, r0
mul r0.x, r0, c14.z
mad r0.y, r0.x, c16.x, c16
mad r0.x, r0, c15, c15.y
mad r0.y, r0, c15.x, c15
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c15.z, c15.w
sincos r1.xy, r0.x, c12.xyzw, c11.xyzw
mad r2.z, r0.y, c15, c15.w
sincos r0.xy, r2.z, c12.xyzw, c11.xyzw
mov r0.y, c6.x
mad r0.x, r0, c11.w, c11.w
mul r0.z, r1.y, r0.x
add r0.y, c7.x, r0
rcp r0.x, r0.y
mad r0.w, r0.z, c9.x, -c9.x
mul r0.z, r2.y, r0.x
add r0.x, r0.w, c11.z
abs r0.w, r0.y
abs r0.z, r0
frc r0.y, r0.z
mul r0.y, r0, r0.w
slt r0.w, r2.x, -v1.x
mov r0.z, c13.y
max r0.w, -r0, r0
slt r0.w, c13.x, r0
add r1.x, -r0.w, c11.z
mul r1.x, r0.y, r1
mad r1.x, r0.w, -r0.y, r1
slt r0.z, c9.x, r0
max r0.z, -r0, r0
slt r0.z, c13.x, r0
add r1.y, -r0.z, c11.z
mul r0.x, r1.y, r0
mov r0.y, c6.x
mad r1.y, c13.w, -r0, r1.x
mov r0.y, c13.w
mov r0.w, c6.x
mad r1.z, r0.y, -c6.x, c6.x
mul r0.y, c13.z, r0.w
rcp r0.w, r1.z
rcp r0.y, r0.y
mul r0.y, r1.x, r0
mul r0.w, r1.y, r0
min r0.w, r0, c11.z
max r0.w, r0, c13.x
mad r1.x, -r0.w, c14, c14.y
mul r0.w, r0, r0
min r0.y, r0, c11.z
max r0.y, r0, c13.x
mad r1.x, -r0.w, r1, c11.z
mad r0.w, -r0.y, c14.x, c14.y
mul r0.y, r0, r0
mul r0.y, r0, r0.w
mul r0.y, r0, r1.x
mad r0.x, r0.z, r0.y, r0
add r0.x, r0, c5
mul oD0, v1, r0.x
mad oT0.xy, v2, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 32 [_Bias]
Float 36 [_TimeOnDuration]
Float 40 [_TimeOffDuration]
Float 44 [_BlinkingTimeOffsScale]
Float 48 [_NoiseAmount]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedamenkimmgmgmdciajmilkhmoifocncmhabaaaaaaieagaaaaadaaaaaa
cmaaaaaajmaaaaaabaabaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafpaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafaepfdejfeejepeoaaedepemepfcaafeeffiedepepfceeaaepfdeheo
gmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagcaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfagphdgjhegjgpgoaa
edepemepfcaafeeffiedepepfceeaaklfdeieefcgmafaaaaeaaaabaaflabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
bcaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaackbabaaaabaaaaaabkiacaaa
abaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
abaaaaaaaaaaaaajccaabaaaaaaaaaaackiacaaaaaaaaaaaacaaaaaabkiacaaa
aaaaaaaaacaaaaaaaoaaaaahecaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaabnaaaaaiicaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaabkaaaaagecaabaaaaaaaaaaackaabaiaibaaaaaaaaaaaaaadhaaaaak
ecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaadiaaaaaldcaabaaaabaaaaaafgifcaaaaaaaaaaaacaaaaaaaceaaaaa
aaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaiaebaaaaaaabaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaakecaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaabaaaaaadicaaaah
kcaabaaaaaaaaaaakgakbaaaaaaaaaaafganbaaaaaaaaaaadcaaaaajecaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
dcaaaaajicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaa
aaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaaiecaabaaa
aaaaaaaaabeaaaaanlapmjeabkiacaaaaaaaaaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadipiccdpabeaaaaakhoigcecenaaaaagbcaabaaa
aaaaaaaaaanaaaaaakaabaaaaaaaaaaaenaaaaagaanaaaaaecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaaadpdiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaambcaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaa
akaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaadaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdbaaaaaiecaabaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaabeaaaaaaknhcddmdhaaaaajbcaabaaaaaaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahpccabaaa
abaaaaaaagaabaaaaaaaaaaaegbobaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SOFTPARTICLES_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 32 [_Bias]
Float 36 [_TimeOnDuration]
Float 40 [_TimeOffDuration]
Float 44 [_BlinkingTimeOffsScale]
Float 48 [_NoiseAmount]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfjgmlblhacpfjcohipjeembaiocjldiaabaaaaaaaialaaaaaeaaaaaa
daaaaaaalaaeaaaaceakaaaajeakaaaaebgpgodjhiaeaaaahiaeaaaaaaacpopp
cmaeaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaacaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafajaaapkaaaaaiadoaaaaeadpaaaaaaaaaaaaiadp
fbaaaaafakaaapkaaaaaaamaaaaaeaeaaaaaaadpidpjccdofbaaaaafalaaapka
nlapmjeanlapejmaphpnhpeakhoigcecfbaaaaafamaaapkaaknhcddmaaaaaaaa
aaaaaaaaaaaaaaaafbaaaaafanaaapkaabannalfgballglhklkkckdlijiiiidj
fbaaaaafaoaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaakiaabaaoekaaeaaaaaeaaaaabiaaaaappiaabaakkjaaeaaffkaacaaaaad
aaaaabiaaaaaaaiaabaaaajaagaaaaacaaaaaeiaabaaffkaafaaaaadaaaaaiia
aaaakkiaaaaaaaiaaeaaaaaeaaaaaeiaaaaaaaiaaaaakkiaakaakkkabdaaaaac
aaaaaeiaaaaakkiaaeaaaaaeaaaaaeiaaaaakkiaalaaaakaalaaffkacfaaaaae
abaaaciaaaaakkiaanaaoekaaoaaoekaaeaaaaaeaaaaaeiaaaaappiaalaakkka
alaappkaaeaaaaaeaaaaaeiaaaaakkiaakaappkaakaakkkabdaaaaacaaaaaeia
aaaakkiaaeaaaaaeaaaaaeiaaaaakkiaalaaaakaalaaffkacfaaaaaeacaaabia
aaaakkiaanaaoekaaoaaoekaaeaaaaaeaaaaaeiaacaaaaiaakaakkkaakaakkka
afaaaaadaaaaaeiaaaaakkiaabaaffiaaeaaaaaeaaaaaeiaacaaaakaaaaakkia
acaaaakbacaaaaadaaaaaeiaaaaakkiaajaappkaacaaaaadaaaaaiiaabaakkka
abaaffkaagaaaaacabaaabiaaaaappiaafaaaaadaaaaabiaaaaaaaiaabaaaaia
cdaaaaacabaaabiaaaaaaaiaanaaaaadaaaaabiaaaaaaaiaaaaaaaibbdaaaaac
abaaabiaabaaaaiabcaaaaaeacaaabiaaaaaaaiaabaaaaiaabaaaaibafaaaaad
aaaaadiaaaaaffiaajaaoekaaeaaaaaeaaaaaciaacaaaaiaaaaappiaaaaaffib
afaaaaadaaaaaiiaaaaappiaacaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaad
aaaaaciaaaaaaaiaaaaaffiaafaaaaadaaaaabiaaaaaaaiaaaaappiaalaaaaad
aaaaadiaaaaaoeiaajaakkkaakaaaaadaaaaadiaaaaaoeiaajaappkaaeaaaaae
aaaaaiiaaaaaffiaakaaaakaakaaffkaafaaaaadaaaaaciaaaaaffiaaaaaffia
aeaaaaaeaaaaaciaaaaappiaaaaaffibajaappkaaeaaaaaeaaaaaiiaaaaaaaia
akaaaakaakaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaaaiaafaaaaadaaaaabia
aaaaaaiaaaaappiaaeaaaaaeaaaaabiaaaaaaaiaaaaaffiaaaaakkibabaaaaac
abaaabiaacaaaakaamaaaaadaaaaaciaabaaaaiaamaaaakaaeaaaaaeaaaaabia
aaaaffiaaaaaaaiaaaaakkiaacaaaaadaaaaabiaaaaaaaiaabaaaakaafaaaaad
aaaaapoaaaaaaaiaabaaoejaaeaaaaaeabaaadoaacaaoejaadaaoekaadaaooka
afaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefcgmafaaaaeaaaabaaflabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
bcaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaackbabaaaabaaaaaabkiacaaa
abaaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
abaaaaaaaaaaaaajccaabaaaaaaaaaaackiacaaaaaaaaaaaacaaaaaabkiacaaa
aaaaaaaaacaaaaaaaoaaaaahecaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaabnaaaaaiicaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaabkaaaaagecaabaaaaaaaaaaackaabaiaibaaaaaaaaaaaaaadhaaaaak
ecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaadiaaaaaldcaabaaaabaaaaaafgifcaaaaaaaaaaaacaaaaaaaceaaaaa
aaaaiadoaaaaeadpaaaaaaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaiaebaaaaaaabaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaaaoaaaaakecaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaabaaaaaadicaaaah
kcaabaaaaaaaaaaakgakbaaaaaaaaaaafganbaaaaaaaaaaadcaaaaajecaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakecaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
dcaaaaajicaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaa
aaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaaiecaabaaa
aaaaaaaaabeaaaaanlapmjeabkiacaaaaaaaaaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaadipiccdpabeaaaaakhoigcecenaaaaagbcaabaaa
aaaaaaaaaanaaaaaakaabaaaaaaaaaaaenaaaaagaanaaaaaecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaaadpdiaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaambcaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaa
akaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaadaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdbaaaaaiecaabaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaabeaaaaaaknhcddmdhaaaaajbcaabaaaaaaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahpccabaaa
abaaaaaaagaabaaaaaaaaaaaegbobaaaabaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaacaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
doaaaaabejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaafpaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafaepfdej
feejepeoaaedepemepfcaafeeffiedepepfceeaaepfdeheogmaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaagcaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeef
fiedepepfceeaakl"
}
SubProgram "opengl " {
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Float 11 [_Bias]
Float 12 [_TimeOnDuration]
Float 13 [_TimeOffDuration]
Float 14 [_BlinkingTimeOffsScale]
Float 15 [_NoiseAmount]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 0.25, 1, 0, 2 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..16],
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
MUL R0.x, vertex.color.z, c[14];
ADD R0.w, R0.x, c[9].y;
ADD R1.w, vertex.color.x, R0;
RCP R0.x, c[12].x;
MUL R0.x, R1.w, R0;
MUL R0.x, R0, c[17].z;
MUL R0.y, R0.x, c[17].w;
MAD R0.z, R0.x, c[22].x, c[22].y;
ADD R0.x, R0.y, -c[0];
FRC R3.w, R0.x;
MUL R0.y, R0.z, c[17].w;
FRC R2.w, R0.y;
ADD R0.xyz, -R3.w, c[18];
ADD R1.xyz, -R2.w, c[18];
MUL R2.xyz, R1, R1;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[19].xyxw, c[19].zwzw;
MAD R1.xyz, R1, R0, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R3.xyz, R2, c[19].xyxw, c[19].zwzw;
MAD R3.xyz, R3, R2, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R1.xyz, R1, R0, c[18].wzww;
MAD R3.xyz, R3, R2, c[21].xyxw;
SLT R4.x, R3.w, c[0];
SGE R4.yz, R3.w, c[21].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[18].wzww;
DP3 R3.w, R1, -R0;
MAD R0.xyz, R3, R2, c[18].wzww;
SLT R1.x, R2.w, c[0];
SGE R1.yz, R2.w, c[21].xzww;
DP3 R1.y, R1, c[18].wzww;
DP3 R0.y, R0, -R1;
MOV R2.x, c[13];
MAD R0.z, R0.y, c[18].y, c[18].y;
ADD R0.x, R2, c[12];
RCP R0.y, R0.x;
MUL R0.z, R3.w, R0;
MAD R1.x, R0.z, c[15], -c[15];
DP4 R1.z, vertex.position, c[8];
MUL R0.y, R1.w, R0;
ABS R0.z, R0.x;
ABS R0.y, R0;
FRC R0.x, R0.y;
MUL R0.y, R0.x, R0.z;
ADD R0.x, R1, c[0].y;
MOV R1.x, c[0];
ADD R0.z, -R0.y, -R0.y;
SLT R0.w, R0, -vertex.color.x;
MAD R0.y, R0.z, R0.w, R0;
MUL R1.x, R1, c[12];
RCP R0.z, R1.x;
MOV R0.w, c[17].y;
MUL R0.z, R0.y, R0;
MAD R1.x, R0.w, -c[12], c[12];
MAD R0.y, R0.w, -c[12].x, R0;
RCP R1.x, R1.x;
MUL R0.w, R0.y, R1.x;
MIN R0.z, R0, c[0].y;
MAX R0.y, R0.z, c[0].z;
MUL R0.z, -R0.y, c[0].w;
MIN R0.w, R0, c[0].y;
MAX R0.w, R0, c[0].z;
MUL R1.x, -R0.w, c[0].w;
ADD R0.z, R0, c[17].x;
MUL R0.y, R0, R0;
MUL R0.y, R0, R0.z;
MUL R0.z, R0.w, R0.w;
ADD R0.w, R1.x, c[17].x;
MAD R0.z, -R0, R0.w, c[0].y;
MOV R1.x, c[22].z;
MAD R0.y, R0, R0.z, -R0.x;
SLT R0.w, c[15].x, R1.x;
MAD R0.x, R0.y, R0.w, R0;
ADD R0.z, R0.x, c[11].x;
MUL result.color, vertex.color, R0.z;
DP4 R0.x, vertex.position, c[5];
MOV R0.w, R1.z;
DP4 R0.y, vertex.position, c[6];
MUL R2.xyz, R0.xyww, c[18].y;
DP4 R0.z, vertex.position, c[7];
MOV result.position, R0;
DP4 R0.x, vertex.position, c[3];
MOV R1.x, R2;
MUL R1.y, R2, c[10].x;
ADD result.texcoord[1].xy, R1, R2.z;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MOV result.texcoord[1].z, -R0.x;
MOV result.texcoord[1].w, R1.z;
END
# 91 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Float 11 [_Bias]
Float 12 [_TimeOnDuration]
Float 13 [_TimeOffDuration]
Float 14 [_BlinkingTimeOffsScale]
Float 15 [_NoiseAmount]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c18, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c19, 0.00000000, 0.01000000, 0.25000000, 0.75000000
def c20, 2.00000000, 3.00000000, 6.28318548, 0
def c21, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c22, 0.63660002, 56.72719955, 0, 0
dcl_position0 v0
dcl_color0 v1
dcl_texcoord0 v2
mul r0.x, v1.z, c14
add r2.x, r0, c8.y
add r2.y, v1.x, r2.x
rcp r0.x, c12.x
mul r0.x, r2.y, r0
mul r0.x, r0, c20.z
mad r0.y, r0.x, c22.x, c22
mad r0.x, r0, c21, c21.y
mad r0.y, r0, c21.x, c21
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c21.z, c21.w
sincos r1.xy, r0.x, c18.xyzw, c17.xyzw
dp4 r1.w, v0, c7
mad r2.z, r0.y, c21, c21.w
sincos r0.xy, r2.z, c18.xyzw, c17.xyzw
mad r0.x, r0, c17.w, c17.w
mul r0.z, r1.y, r0.x
mov r0.y, c12.x
add r0.y, c13.x, r0
rcp r0.x, r0.y
mad r0.w, r0.z, c15.x, -c15.x
mul r0.z, r2.y, r0.x
add r0.x, r0.w, c17.z
abs r0.w, r0.y
abs r0.z, r0
frc r0.y, r0.z
mul r0.y, r0, r0.w
slt r0.w, r2.x, -v1.x
mov r0.z, c19.y
max r0.w, -r0, r0
slt r0.w, c19.x, r0
add r1.x, -r0.w, c17.z
mul r1.x, r0.y, r1
mad r1.x, r0.w, -r0.y, r1
slt r0.z, c15.x, r0
max r0.z, -r0, r0
slt r0.z, c19.x, r0
add r1.y, -r0.z, c17.z
mul r0.x, r1.y, r0
mov r0.y, c12.x
mad r1.y, c19.w, -r0, r1.x
mov r0.y, c19.w
mad r1.z, r0.y, -c12.x, c12.x
mov r0.w, c12.x
mul r0.y, c19.z, r0.w
rcp r0.w, r1.z
mul r0.w, r1.y, r0
rcp r0.y, r0.y
mul r0.y, r1.x, r0
min r0.w, r0, c17.z
max r0.w, r0, c19.x
mad r1.x, -r0.w, c20, c20.y
mul r0.w, r0, r0
min r0.y, r0, c17.z
mad r1.x, -r0.w, r1, c17.z
max r0.y, r0, c19.x
mad r0.w, -r0.y, c20.x, c20.y
mul r0.y, r0, r0
mul r0.y, r0, r0.w
mul r0.y, r0, r1.x
mad r0.x, r0.z, r0.y, r0
add r0.z, r0.x, c11.x
mul oD0, v1, r0.z
dp4 r0.x, v0, c4
mov r0.w, r1
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c17.w
mul r1.y, r1, c9.x
dp4 r0.z, v0, c6
mov oPos, r0
dp4 r0.x, v0, c2
mad oT1.xy, r1.z, c10.zwzw, r1
mad oT0.xy, v2, c16, c16.zwzw
mov oT1.z, -r0.x
mov oT1.w, r1
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 32 [_Bias]
Float 36 [_TimeOnDuration]
Float 40 [_TimeOffDuration]
Float 44 [_BlinkingTimeOffsScale]
Float 48 [_NoiseAmount]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedfeajebcmmonmimnabpjiaabifhphpecoabaaaaaaoeahaaaaadaaaaaa
cmaaaaaajmaaaaaaciabaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafpaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafaepfdejfeejepeoaaedepemepfcaafeeffiedepepfceeaaepfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaahkaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaahkaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeef
fiedepepfceeaaklfdeieefcleagaaaaeaaaabaaknabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaiaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaaddcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaalecaabaaaaaaaaaaa
dkiacaaaaaaaaaaaacaaaaaackbabaaaabaaaaaabkiacaaaabaaaaaaaaaaaaaa
aaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaakbabaaaabaaaaaaaaaaaaaj
bcaabaaaabaaaaaackiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaacaaaaaa
aoaaaaahccaabaaaabaaaaaackaabaaaaaaaaaaaakaabaaaabaaaaaabnaaaaai
ecaabaaaabaaaaaabkaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaabkaaaaag
ccaabaaaabaaaaaabkaabaiaibaaaaaaabaaaaaadhaaaaakccaabaaaabaaaaaa
ckaabaaaabaaaaaabkaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadiaaaaal
mcaabaaaabaaaaaafgifcaaaaaaaaaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadoaaaaeadpdcaaaaakicaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaaaabaaaaaaaoaaaaakccaabaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpckaabaaaabaaaaaadicaaaahfcaabaaaabaaaaaa
fgafbaaaabaaaaaaagadbaaaabaaaaaadcaaaaajccaabaaaabaaaaaackaabaaa
abaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahecaabaaaabaaaaaa
ckaabaaaabaaaaaackaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaackaabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajecaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
bkaabaaaabaaaaaaakaabaaaabaaaaaaaoaaaaaiccaabaaaabaaaaaaabeaaaaa
nlapmjeabkiacaaaaaaaaaaaacaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaabaaaaaadcaaaaajccaabaaaabaaaaaackaabaaaaaaaaaaa
abeaaaaadipiccdpabeaaaaakhoigcecenaaaaagecaabaaaaaaaaaaaaanaaaaa
ckaabaaaaaaaaaaaenaaaaagaanaaaaaccaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaajccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpdiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaa
dcaaaaamecaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaackaabaaaaaaaaaaa
akiacaiaebaaaaaaaaaaaaaaadaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaiadpdbaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaaaknhcddmdhaaaaajecaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaackaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaackaabaaa
aaaaaaaaakiacaaaaaaaaaaaacaaaaaadiaaaaahpccabaaaabaaaaaakgakbaaa
aaaaaaaaegbobaaaabaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaacaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaaficcabaaaadaaaaaadkaabaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaacaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
acaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaacaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaadgaaaaageccabaaaadaaaaaaakaabaiaebaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SOFTPARTICLES_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Float 32 [_Bias]
Float 36 [_TimeOnDuration]
Float 40 [_TimeOffDuration]
Float 44 [_BlinkingTimeOffsScale]
Float 48 [_NoiseAmount]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefieceddeidofblckgpnnhebfobgcppdgpmbgnpabaaaaaabianaaaaaeaaaaaa
daaaaaaagaafaaaabmamaaaaimamaaaaebgpgodjciafaaaaciafaaaaaaacpopp
naaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaacaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaabaaafaaabaaafaaaaaaaaaa
acaaaaaaaiaaagaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafaoaaapkaaaaaaadp
aaaaiadoaaaaeadpaaaaaaaafbaaaaafapaaapkaaaaaiadpaaaaaamaaaaaeaea
aknhcddmfbaaaaafbaaaapkanlapmjeanlapejmaphpnhpeakhoigcecfbaaaaaf
bbaaapkaidpjccdoaaaaaadpaaaaaaaaaaaaaaaafbaaaaafbcaaapkaabannalf
gballglhklkkckdlijiiiidjfbaaaaafbdaaapkaklkkkklmaaaaaaloaaaaiadp
aaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapia
agaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
afaaaakaafaaaaadabaaaiiaabaaaaiaaoaaaakaafaaaaadabaaafiaaaaapeia
aoaaaakaacaaaaadacaaadoaabaakkiaabaaomiaafaaaaadabaaabiaaaaaffja
alaakkkaaeaaaaaeabaaabiaakaakkkaaaaaaajaabaaaaiaaeaaaaaeabaaabia
amaakkkaaaaakkjaabaaaaiaaeaaaaaeabaaabiaanaakkkaaaaappjaabaaaaia
abaaaaacacaaaeoaabaaaaibabaaaaacabaaakiaabaaoekaaeaaaaaeabaaabia
abaappiaabaakkjaaeaaffkaacaaaaadabaaabiaabaaaaiaabaaaajaagaaaaac
abaaaeiaabaaffkaafaaaaadabaaaiiaabaakkiaabaaaaiaaeaaaaaeabaaaeia
abaaaaiaabaakkiaaoaaaakabdaaaaacabaaaeiaabaakkiaaeaaaaaeabaaaeia
abaakkiabaaaaakabaaaffkacfaaaaaeacaaaciaabaakkiabcaaoekabdaaoeka
aeaaaaaeabaaaeiaabaappiabaaakkkabaaappkaaeaaaaaeabaaaeiaabaakkia
bbaaaakabbaaffkabdaaaaacabaaaeiaabaakkiaaeaaaaaeabaaaeiaabaakkia
baaaaakabaaaffkacfaaaaaeadaaabiaabaakkiabcaaoekabdaaoekaaeaaaaae
abaaaeiaadaaaaiaaoaaaakaaoaaaakaafaaaaadabaaaeiaabaakkiaacaaffia
aeaaaaaeabaaaeiaacaaaakaabaakkiaacaaaakbacaaaaadabaaaeiaabaakkia
apaaaakaacaaaaadabaaaiiaabaakkkaabaaffkaagaaaaacacaaabiaabaappia
afaaaaadabaaabiaabaaaaiaacaaaaiacdaaaaacacaaabiaabaaaaiaanaaaaad
abaaabiaabaaaaiaabaaaaibbdaaaaacacaaabiaacaaaaiabcaaaaaeadaaabia
abaaaaiaacaaaaiaacaaaaibafaaaaadabaaadiaabaaffiaaoaaojkaaeaaaaae
abaaaciaadaaaaiaabaappiaabaaffibafaaaaadabaaaiiaabaappiaadaaaaia
agaaaaacabaaabiaabaaaaiaafaaaaadabaaaciaabaaaaiaabaaffiaafaaaaad
abaaabiaabaaaaiaabaappiaalaaaaadabaaadiaabaaoeiaaoaappkaakaaaaad
abaaadiaabaaoeiaapaaaakaaeaaaaaeabaaaiiaabaaffiaapaaffkaapaakkka
afaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaaciaabaappiaabaaffib
apaaaakaaeaaaaaeabaaaiiaabaaaaiaapaaffkaapaakkkaafaaaaadabaaabia
abaaaaiaabaaaaiaafaaaaadabaaabiaabaaaaiaabaappiaaeaaaaaeabaaabia
abaaaaiaabaaffiaabaakkibabaaaaacabaaaiiaapaappkaamaaaaadabaaacia
acaaaakaabaappiaaeaaaaaeabaaabiaabaaffiaabaaaaiaabaakkiaacaaaaad
abaaabiaabaaaaiaabaaaakaafaaaaadaaaaapoaabaaaaiaabaaoejaaeaaaaae
abaaadoaacaaoejaadaaoekaadaaookaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaaioaaaaappiappppaaaa
fdeieefcleagaaaaeaaaabaaknabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaiaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaaddcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaalecaabaaaaaaaaaaadkiacaaaaaaaaaaa
acaaaaaackbabaaaabaaaaaabkiacaaaabaaaaaaaaaaaaaaaaaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaakbabaaaabaaaaaaaaaaaaajbcaabaaaabaaaaaa
ckiacaaaaaaaaaaaacaaaaaabkiacaaaaaaaaaaaacaaaaaaaoaaaaahccaabaaa
abaaaaaackaabaaaaaaaaaaaakaabaaaabaaaaaabnaaaaaiecaabaaaabaaaaaa
bkaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaabkaaaaagccaabaaaabaaaaaa
bkaabaiaibaaaaaaabaaaaaadhaaaaakccaabaaaabaaaaaackaabaaaabaaaaaa
bkaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadiaaaaalmcaabaaaabaaaaaa
fgifcaaaaaaaaaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadoaaaaeadp
dcaaaaakicaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaadkaabaia
ebaaaaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaabkaabaaa
abaaaaaaaoaaaaakccaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpckaabaaaabaaaaaadicaaaahfcaabaaaabaaaaaafgafbaaaabaaaaaa
agadbaaaabaaaaaadcaaaaajccaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaaamaabeaaaaaaaaaeaeadiaaaaahecaabaaaabaaaaaackaabaaaabaaaaaa
ckaabaaaabaaaaaadcaaaaakccaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
ckaabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajecaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaackaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaaoaaaaaiccaabaaaabaaaaaaabeaaaaanlapmjeabkiacaaa
aaaaaaaaacaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
abaaaaaadcaaaaajccaabaaaabaaaaaackaabaaaaaaaaaaaabeaaaaadipiccdp
abeaaaaakhoigcecenaaaaagecaabaaaaaaaaaaaaanaaaaackaabaaaaaaaaaaa
enaaaaagaanaaaaaccaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaajccaabaaa
abaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaabaaaaaadcaaaaamecaabaaa
aaaaaaaaakiacaaaaaaaaaaaadaaaaaackaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaadaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaiadpdbaaaaaiccaabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaaabeaaaaa
aknhcddmdhaaaaajecaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
ckaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaa
aaaaaaaaacaaaaaadiaaaaahpccabaaaabaaaaaakgakbaaaaaaaaaaaegbobaaa
abaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaficcabaaa
adaaaaaadkaabaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaa
acaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaacaaaaaaaeaaaaaa
akbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
acaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaacaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaa
dgaaaaageccabaaaadaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheo
giaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaafjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaafpaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaafaepfdejfeejepeoaaedepem
epfcaafeeffiedepepfceeaaepfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaahkaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adamaaaahkaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
gphdgjhegjgpgoaaedepemepfcaafeeffiedepepfceeaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SOFTPARTICLES_OFF" }
Vector 0 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1, fragment.color.primary, c[0];
MUL R0, R1, R0;
MUL result.color, R0, c[1].x;
END
# 4 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SOFTPARTICLES_OFF" }
Vector 0 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 2.00000000, 0, 0, 0
dcl v0
dcl t0.xy
texld r0, t0, s0
mul r1, v0, c0
mul r0, r1, r0
mul r0, r0, c1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_TintColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmggfklilcgogoppahahdoojbcfakmpbiabaaaaaalmabaaaaadaaaaaa
cmaaaaaakaaaaaaaneaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaagcaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeeffiedepepfceeaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoaaaaaaaeaaaaaaa
diaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaah
pcaabaaaaaaaaaaaegbobaaaabaaaaaaegbobaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
pccabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SOFTPARTICLES_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_TintColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcnmimopbllpjfifjekfaphchkhconnkoabaaaaaaheacaaaaaeaaaaaa
daaaaaaaoeaaaaaammabaaaaeaacaaaaebgpgodjkmaaaaaakmaaaaaaaaacpppp
hiaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaadlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaabaaoela
aaaioekaafaaaaadabaaapiaaaaaoelaaaaaoekaacaaaaadabaaapiaabaaoeia
abaaoeiaafaaaaadaaaacpiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcoaaaaaaaeaaaaaaadiaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaaaaaaahpcaabaaaaaaaaaaaegbobaaaabaaaaaa
egbobaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaabejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaagcaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeeffiedepepfceeaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SOFTPARTICLES_ON" }
Vector 0 [_ZBufferParams]
Vector 1 [_TintColor]
Float 2 [_InvFade]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[4] = { program.local[0..2],
		{ 2 } };
TEMP R0;
TEMP R1;
TXP R1.x, fragment.texcoord[1], texture[0], 2D;
TEX R0, fragment.texcoord[0], texture[1], 2D;
MAD R1.x, R1, c[0].z, c[0].w;
RCP R1.x, R1.x;
ADD R1.x, R1, -fragment.texcoord[1].z;
MUL_SAT R1.w, R1.x, c[2].x;
MOV R1.xyz, fragment.color.primary;
MUL R1.w, fragment.color.primary, R1;
MUL R1, R1, c[1];
MUL R0, R1, R0;
MUL result.color, R0, c[3].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SOFTPARTICLES_ON" }
Vector 0 [_ZBufferParams]
Vector 1 [_TintColor]
Float 2 [_InvFade]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 2.00000000, 0, 0, 0
dcl v0
dcl t0.xy
dcl t1
texldp r0, t1, s0
texld r1, t0, s1
mad r0.x, r0, c0.z, c0.w
rcp r0.x, r0.x
add r0.x, r0, -t1.z
mul_sat r0.x, r0, c2
mov_pp r2.xyz, v0
mul_pp r2.w, v0, r0.x
mul r0, r2, c1
mul r0, r0, r1
mul r0, r0, c3.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SOFTPARTICLES_ON" }
SetTexture 0 [_CameraDepthTexture] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_TintColor]
Float 80 [_InvFade]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedffchehpdfakmbpbjfegipmhnjkendjfcabaaaaaabaadaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaahkaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaahkaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
gphdgjhegjgpgoaaedepemepfcaafeeffiedepepfceeaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcbmacaaaaeaaaaaaaihaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaa
ahaaaaaaakaabaaaaaaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaiaebaaaaaaadaaaaaa
dicaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaadkbabaaaabaaaaaadgaaaaaf
hcaabaaaaaaaaaaaegbcbaaaabaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiocaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SOFTPARTICLES_ON" }
SetTexture 0 [_CameraDepthTexture] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 96
Vector 16 [_TintColor]
Float 80 [_InvFade]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedbmokedjcgoodffeoedboemafipdhpfeoabaaaaaalmaeaaaaaeaaaaaa
daaaaaaaniabaaaapmadaaaaiiaeaaaaebgpgodjkaabaaaakaabaaaaaaacpppp
faabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaafaaabaaabaaaaaaaaaaabaaahaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaeaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
agaaaaacaaaaaiiaacaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaad
aaaaapiaaaaaoeiaabaioekaecaaaaadabaaapiaabaaoelaaaaioekaaeaaaaae
aaaaabiaacaakkkaaaaaaaiaacaappkaagaaaaacaaaaabiaaaaaaaiaacaaaaad
aaaaabiaaaaaaaiaacaakklbafaaaaadaaaabbiaaaaaaaiaabaaaakaafaaaaad
aaaacbiaaaaaaaiaaaaapplaafaaaaadaaaaabiaaaaaaaiaadaaaakaafaaaaad
aaaaaiiaaaaaaaiaaaaappkaabaaaaacacaaahiaaaaaoelaafaaaaadacaaahia
acaaoeiaaaaaoekaafaaaaadaaaaahiaacaaoeiaadaaaakaafaaaaadaaaacpia
abaaoeiaaaaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbmacaaaa
eaaaaaaaihaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaalbcaabaaa
aaaaaaaackiacaaaabaaaaaaahaaaaaaakaabaaaaaaaaaaadkiacaaaabaaaaaa
ahaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckbabaiaebaaaaaaadaaaaaadicaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaaaaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkbabaaaabaaaaaadgaaaaafhcaabaaaaaaaaaaaegbcbaaaabaaaaaaaaaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaah
pccabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaahkaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaahkaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapapaaaafdfgfpfagphdgjhegjgpgoaaedepemepfcaafeef
fiedepepfceeaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0.01
  ColorMask RGB
  SetTexture [_MainTex] { ConstantColor [_TintColor] combine constant * primary }
  SetTexture [_MainTex] { combine texture * previous double }
 }
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0.01
  ColorMask RGB
  SetTexture [_MainTex] { combine texture * primary }
 }
}
}