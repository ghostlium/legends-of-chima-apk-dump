//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Force Fields" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Detail Texture", 2D) = "white" {}
 _DetailTexScaleUvs ("Detail layer Scale Uvs", Float) = 5
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _Scroll2X ("Detail layer Scroll speed X", Float) = 1
 _Scroll2Y ("Detail layer Scroll speed Y", Float) = 0
 _Multiplier ("Color multiplier", Float) = 1
 _TintColor ("Color", Color) = (1,1,1,1)
 _BaseOpacity ("Base Opacity", Float) = 0.5
 _DetailTexOpacity ("Detail Texture Opacity", Float) = 0.5
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
 _VertAnimSpeedB ("Vertex Animation Speed B", Float) = 100
 _VertAnimDisplacementB ("Vertex Animation Displacement B", Float) = 0.1
 _FlickeringSpeed ("Flickering Bias", Float) = 1000
 _FlickeringBias ("Flickering Bias", Float) = 0.5
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent+1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent+1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Cull Off
  Blend One One
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Float 6 [_DetailTexScaleUvs]
Float 7 [_VertAnimSpeed]
Float 8 [_VertAnimDisplacement]
Float 9 [_VertAnimSpeedB]
Float 10 [_VertAnimDisplacementB]
Vector 11 [_MainTex_ST]
Vector 12 [_DetailTex_ST]
Float 13 [_ScrollX]
Float 14 [_ScrollY]
Float 15 [_Scroll2X]
Float 16 [_Scroll2Y]
"!!ARBvp1.0
PARAM c[21] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.099975586 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.position, c[5];
MUL R0.y, R0.x, c[7].x;
MUL R0.z, R0.x, c[9].x;
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[17];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[17];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[18].xyxw;
MAD R1.xyz, R1, R0, c[18].zwzw;
MAD R1.xyz, R1, R0, c[19].xyxw;
MAD R1.xyz, R1, R0, c[19].zwzw;
ADD R3.xyz, R3, c[18].xyxw;
MAD R3.xyz, R3, R2, c[18].zwzw;
MAD R3.xyz, R3, R2, c[19].xyxw;
MAD R1.xyz, R1, R0, c[17].wzww;
MAD R3.xyz, R3, R2, c[19].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[20].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[20].xxyw;
MAD R1.xyz, R3, R2, c[17].wzww;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[17].wzww;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
ADD R0.y, vertex.color.w, c[20].z;
MUL R0.x, R0, c[10];
MUL R0.z, R0.x, R0.y;
MUL R0.x, R1.w, c[8];
MAD R0.z, R0.x, R0.y, R0;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
ADD result.position.xy, R0, R0.z;
MOV R0.y, c[16].x;
MOV R0.x, c[15];
MUL R0.zw, R0.xyxy, c[5].xyxy;
MOV R0.y, c[14].x;
MOV R0.x, c[13];
MUL R1.xy, R0, c[5];
FRC R0.xy, R0.zwzw;
MAD R0.zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].zw, R0, c[6].x, R0.xyxy;
FRC R0.xy, R1;
MAD R0.zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
ADD result.texcoord[0].xy, R0.zwzw, R0;
MOV result.texcoord[1], vertex.color.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
END
# 56 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Float 5 [_DetailTexScaleUvs]
Float 6 [_VertAnimSpeed]
Float 7 [_VertAnimDisplacement]
Float 8 [_VertAnimSpeedB]
Float 9 [_VertAnimDisplacementB]
Vector 10 [_MainTex_ST]
Vector 11 [_DetailTex_ST]
Float 12 [_ScrollX]
Float 13 [_ScrollY]
Float 14 [_Scroll2X]
Float 15 [_Scroll2Y]
"vs_2_0
def c16, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c17, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c18, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c19, 0.09997559, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
add r0.x, v0, c4
mul r0.y, r0.x, c6.x
mul r0.z, r0.x, c8.x
mad r0.x, r0.y, c18, c18.y
mad r0.y, r0.z, c18.x, c18
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c18.z, c18.w
sincos r1.xy, r0.x, c17.xyzw, c16.xyzw
mad r2.x, r0.y, c18.z, c18.w
sincos r0.xy, r2.x, c17.xyzw, c16.xyzw
mul r0.x, r0.y, c9
add r0.z, v2.w, c19.x
mul r0.y, r0.x, r0.z
mul r0.x, r1.y, c7
mad r0.z, r0.x, r0, r0.y
dp4 r0.y, v0, c1
dp4 r0.x, v0, c0
add oPos.xy, r0, r0.z
mov r0.w, c13.x
mov r0.z, c12.x
mul r1.xy, r0.zwzw, c4
mov r0.y, c15.x
mov r0.x, c14
mul r0.xy, r0, c4
frc r0.zw, r0.xyxy
mad r0.xy, v1, c11, c11.zwzw
mad oT0.zw, r0.xyxy, c5.x, r0
frc r0.zw, r1.xyxy
mad r0.xy, v1, c10, c10.zwzw
add oT0.xy, r0, r0.zwzw
mov oT1, v2.w
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Float 64 [_DetailTexScaleUvs]
Float 68 [_VertAnimSpeed]
Float 72 [_VertAnimDisplacement]
Float 76 [_VertAnimSpeedB]
Float 80 [_VertAnimDisplacementB]
Vector 96 [_MainTex_ST]
Vector 112 [_DetailTex_ST]
Float 128 [_ScrollX]
Float 132 [_ScrollY]
Float 136 [_Scroll2X]
Float 140 [_Scroll2Y]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedembapgokhhjgneioiejnfmbmphinleoeabaaaaaakaaeaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdeadaaaaeaaaabaamnaaaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
icbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakbabaaaaaaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaagaabaaaaaaaaaaangifcaaaaaaaaaaaaeaaaaaaenaaaaagdcaabaaa
aaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaackiacaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaadkbabaaa
afaaaaaaabeaaaaamnmmmmdndiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaaaaaaaaahdccabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaa
dgaaaaafmccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaaiaaaaaaegiecaaaabaaaaaa
aaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaa
abaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dcaaaaakmccabaaaabaaaaaaagaebaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
kgaobaaaabaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaaafaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Float 64 [_DetailTexScaleUvs]
Float 68 [_VertAnimSpeed]
Float 72 [_VertAnimDisplacement]
Float 76 [_VertAnimSpeedB]
Float 80 [_VertAnimDisplacementB]
Vector 96 [_MainTex_ST]
Vector 112 [_DetailTex_ST]
Float 128 [_ScrollX]
Float 132 [_ScrollY]
Float 136 [_Scroll2X]
Float 140 [_Scroll2Y]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjcmgbcjnkbbabegalmphdcianiiafcciabaaaaaafaahaaaaaeaaaaaa
daaaaaaanmacaaaabiagaaaaoaagaaaaebgpgodjkeacaaaakeacaaaaaaacpopp
fiacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafalaaapkaidpjccdoaaaaaadpnlapmjeanlapejma
fbaaaaafamaaapkamnmmmmdnaaaaaaaaaaaaaaaaaaaaaaaafbaaaaafanaaapka
abannalfgballglhklkkckdlijiiiidjfbaaaaafaoaaapkaklkkkklmaaaaaalo
aaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadiaadaaoejaadaaoekaadaaooka
abaaaaacabaaadiaagaaoekaafaaaaadabaaapiaabaaeeiaafaaoekabdaaaaac
abaaapiaabaaoeiaacaaaaadaaaaadoaaaaaoeiaabaaoeiaaeaaaaaeaaaaadia
adaaoejaaeaaoekaaeaaookaaeaaaaaeaaaaamoaaaaaeeiaabaaaakaabaaoeia
acaaaaadaaaaabiaaaaaaajaagaaaakaafaaaaadaaaaadiaaaaaaaiaabaaonka
aeaaaaaeaaaaadiaaaaaoeiaalaaaakaalaaffkabdaaaaacaaaaadiaaaaaoeia
aeaaaaaeaaaaadiaaaaaoeiaalaakkkaalaappkacfaaaaaeabaaaciaaaaaaaia
anaaoekaaoaaoekacfaaaaaeacaaaciaaaaaffiaanaaoekaaoaaoekaafaaaaad
aaaaabiaacaaffiaacaaaakaafaaaaadaaaaaciaabaaffiaabaakkkaacaaaaad
aaaaaeiaafaappjaamaaaakaafaaaaadaaaaabiaaaaakkiaaaaaaaiaaeaaaaae
aaaaabiaaaaaffiaaaaakkiaaaaaaaiaafaaaaadabaaapiaaaaaffjaaiaaoeka
aeaaaaaeabaaapiaahaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaapiaajaaoeka
aaaakkjaabaaoeiaaeaaaaaeabaaapiaakaaoekaaaaappjaabaaoeiaacaaaaad
aaaaadiaaaaaaaiaabaaoeiaaeaaaaaeaaaaadmaabaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaabaaoeiaabaaaaacabaaapoaafaappjappppaaaafdeieefc
deadaaaaeaaaabaamnaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
aaaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaangifcaaaaaaaaaaaaeaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
aaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaaaaaaaaahecaabaaaaaaaaaaadkbabaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaah
dccabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadgaaaaafmccabaaa
aaaaaaaakgaobaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadiaaaaajpcaabaaa
abaaaaaaegiocaaaaaaaaaaaaiaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaakmccabaaa
abaaaaaaagaebaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaakgaobaaaabaaaaaa
dgaaaaafpccabaaaacaaaaaapgbpbaaaafaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
fmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_Time]
Float 1 [_Multiplier]
Float 2 [_BaseOpacity]
Float 3 [_DetailTexOpacity]
Vector 4 [_TintColor]
Float 5 [_FlickeringSpeed]
Float 6 [_FlickeringBias]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[8] = { program.local[0..6],
		{ 0.5, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R2, R0, c[4];
MOV R3.x, c[0];
MUL R3.x, R3, c[5];
MUL R2, R2, c[2].x;
MUL R1, R1, c[4];
MAD R1, R1, c[3].x, R2;
MUL R0, R1, R0;
SIN R3.x, R3.x;
ADD R2.x, R3, c[7].y;
MUL R1.x, R2, c[7];
MUL R0, R0, c[1].x;
ADD_SAT R1.x, R1, c[6];
MUL R0, R0, fragment.texcoord[1];
MUL result.color, R0, R1.x;
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_Time]
Float 1 [_Multiplier]
Float 2 [_BaseOpacity]
Float 3 [_DetailTexOpacity]
Vector 4 [_TintColor]
Float 5 [_FlickeringSpeed]
Float 6 [_FlickeringBias]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c7, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c8, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c9, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl t0
dcl t1
texld r3, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r2, r0, s1
mov r0.x, c5
mul r0.x, c0, r0
mad r0.x, r0, c9, c9.y
frc r0.x, r0
mad r0.x, r0, c9.z, c9.w
sincos r1.xy, r0.x, c8.xyzw, c7.xyzw
mul r0, r3, c4
mul r0, r0, c2.x
mul r2, r2, c4
mad r2, r2, c3.x, r0
add r0.x, r1.y, c7.z
mul r1, r2, r3
mul r0.x, r0, c7.w
mul r1, r1, c1.x
add_sat r0.x, r0, c6
mul r1, r1, t1
mul r0, r1, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 144
Float 16 [_Multiplier]
Float 36 [_BaseOpacity]
Float 40 [_DetailTexOpacity]
Vector 48 [_TintColor]
Float 84 [_FlickeringSpeed]
Float 88 [_FlickeringBias]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedghdjdffkjmdndcmlnnelgahcpbninimnabaaaaaacmadaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfeacaaaaeaaaaaaajfaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
fgifcaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
kgikcaaaaaaaaaaaacaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaagiacaaaaaaaaaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadiaaaaajbcaabaaaabaaaaaabkiacaaaaaaaaaaa
afaaaaaaakiacaaaabaaaaaaaaaaaaaaenaaaaagbcaabaaaabaaaaaaaanaaaaa
akaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaiadpdccaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaadp
ckiacaaaaaaaaaaaafaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 144
Float 16 [_Multiplier]
Float 36 [_BaseOpacity]
Float 40 [_DetailTexOpacity]
Vector 48 [_TintColor]
Float 84 [_FlickeringSpeed]
Float 88 [_FlickeringBias]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecediodcnddclplhbpjhgcejblohiadoklcgabaaaaaahaafaaaaaeaaaaaa
daaaaaaahaacaaaammaeaaaadmafaaaaebgpgodjdiacaaaadiacaaaaaaacpppp
oiabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaaaaaaaaa
abababaaaaaaabaaadaaaaaaaaaaaaaaaaaaafaaabaaadaaaaaaaaaaabaaaaaa
abaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaidpjccdoaaaaaadpnlapmjea
nlapejmafbaaaaafagaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaafbaaaaaf
ahaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafaiaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaabiaaaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeia
abaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaadaaaaapiaaaaaoeia
acaaoekaafaaaaadacaaapiaabaaoeiaacaaoekaafaaaaadacaaapiaacaaoeia
abaaffkaaeaaaaaeaaaaapiaaaaaoeiaabaakkkaacaaoeiaafaaaaadaaaaapia
abaaoeiaaaaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaaakaafaaaaadaaaaapia
aaaaoeiaabaaoelaabaaaaacabaaagiaadaaoekaafaaaaadabaaabiaabaaffia
aeaaaakaaeaaaaaeabaaabiaabaaaaiaafaaaakaafaaffkabdaaaaacabaaabia
abaaaaiaaeaaaaaeabaaabiaabaaaaiaafaakkkaafaappkacfaaaaaeacaaacia
abaaaaiaahaaoekaaiaaoekaacaaaaadabaaabiaacaaffiaagaaaakaaeaaaaae
abaabbiaabaaaaiaafaaffkaabaakkiaafaaaaadaaaacpiaaaaaoeiaabaaaaia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfeacaaaaeaaaaaaajfaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
fgifcaaaaaaaaaaaacaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
kgikcaaaaaaaaaaaacaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaabaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaagiacaaaaaaaaaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaacaaaaaadiaaaaajbcaabaaaabaaaaaabkiacaaaaaaaaaaa
afaaaaaaakiacaaaabaaaaaaaaaaaaaaenaaaaagbcaabaaaabaaaaaaaanaaaaa
akaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaiadpdccaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaadp
ckiacaaaaaaaaaaaafaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaadoaaaaabejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}