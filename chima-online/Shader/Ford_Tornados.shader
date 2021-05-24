//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Tornados" {
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
 _MasterOpacity ("Master Opacity", Float) = 1
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
 _VertAnimSpeedB ("Vertical Vertex Animation Speed", Float) = 100
 _VertAnimDisplacementB ("Vertical Vertex Animation Displacement", Float) = 0.1
 _FresnelPower ("Fresnel Power", Float) = 3
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent-1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent-1" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
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
Float 12 [_DetailTexScaleUvs]
Float 13 [_VertAnimSpeed]
Float 14 [_VertAnimDisplacement]
Float 15 [_VertAnimSpeedB]
Float 16 [_VertAnimDisplacementB]
Float 17 [_FresnelPower]
Vector 18 [_MainTex_ST]
Vector 19 [_DetailTex_ST]
Float 20 [_ScrollX]
Float 21 [_ScrollY]
Float 22 [_Scroll2X]
Float 23 [_Scroll2Y]
"!!ARBvp1.0
PARAM c[28] = { { 0.15915491, 0.25, 24.980801, -24.980801 },
		state.matrix.mvp,
		program.local[5..23],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R1.w, c[24].z;
MOV R1.xyz, c[10];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MAD R1.xyz, R0, c[11].w, -vertex.position;
DP3 R0.x, R1, R1;
RSQ R0.y, R0.x;
MUL R1.xyz, R0.y, R1;
ADD R0.x, vertex.position.z, c[9].z;
MUL R0.x, R0, c[15];
MAD R0.y, R0.x, c[0].x, -c[0];
FRC R2.w, R0.y;
DP3 R1.w, R1, vertex.normal;
ADD R0.x, vertex.position, c[9];
MUL R0.x, R0, c[13];
MAD R0.w, R0.x, c[0].x, -c[0].y;
ADD R1.xyz, -R2.w, c[24];
MUL R0.xyz, R1, R1;
FRC R0.w, R0;
MUL R2.xyz, R0, c[0].zwzw;
ADD R1.xyz, -R0.w, c[24];
ADD R2.xyz, R2, c[25].xyxw;
MAD R3.xyz, R2, R0, c[25].zwzw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[26].xyxw;
MAD R3.xyz, R3, R0, c[26].zwzw;
MUL R2.xyz, R1, c[0].zwzw;
ADD R2.xyz, R2, c[25].xyxw;
MAD R2.xyz, R2, R1, c[25].zwzw;
MAD R3.xyz, R3, R0, c[24].wzww;
SLT R4.x, R2.w, c[0].y;
SGE R4.yz, R2.w, c[27].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[24].wzww;
DP3 R2.w, R3, -R0;
MAD R0.xyz, R2, R1, c[26].xyxw;
MAD R0.xyz, R0, R1, c[26].zwzw;
MAD R1.xyz, R0, R1, c[24].wzww;
MUL R2.x, R2.w, c[16];
SGE R0.yz, R0.w, c[27].xxyw;
SLT R0.x, R0.w, c[0].y;
DP3 R2.y, R0, c[24].wzww;
MUL R2.w, vertex.position, R2.x;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MAD R0.z, R0.x, c[14].x, R2.w;
POW R0.w, R1.w, c[17].x;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
ADD result.position.xy, R0, R0.z;
MOV R0.y, c[23].x;
MOV R0.x, c[22];
MUL result.texcoord[2], vertex.color.w, R0.w;
MUL R0.zw, R0.xyxy, c[9].xyxy;
MOV R0.y, c[21].x;
MOV R0.x, c[20];
MUL R1.xy, R0, c[9];
FRC R0.zw, R0;
MAD R0.xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[0].zw, R0.xyxy, c[12].x, R0;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[0], c[18], c[18].zwzw;
ADD result.texcoord[0].xy, R0, R0.zwzw;
MOV result.texcoord[1], vertex.color;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
END
# 67 instructions, 5 R-regs
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
Float 11 [_DetailTexScaleUvs]
Float 12 [_VertAnimSpeed]
Float 13 [_VertAnimDisplacement]
Float 14 [_VertAnimSpeedB]
Float 15 [_VertAnimDisplacementB]
Float 16 [_FresnelPower]
Vector 17 [_MainTex_ST]
Vector 18 [_DetailTex_ST]
Float 19 [_ScrollX]
Float 20 [_ScrollY]
Float 21 [_Scroll2X]
Float 22 [_Scroll2Y]
"vs_2_0
def c23, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c24, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c25, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mov r1.xyz, c9
mov r1.w, c23.z
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r0.xyz, r0, c10.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r1.x, r0, v1
pow r0, r1.x, c16.x
mov r0.z, r0.x
add r0.y, v0.z, c8.z
mul r0.x, r0.y, c14
mad r0.y, r0.x, c25.x, c25
frc r0.y, r0
add r0.x, v0, c8
mul r0.x, r0, c12
mad r1.y, r0, c25.z, c25.w
mad r1.x, r0, c25, c25.y
mul oT2, v3.w, r0.z
sincos r0.xy, r1.y, c24.xyzw, c23.xyzw
frc r0.x, r1
mad r1.x, r0, c25.z, c25.w
mul r1.y, r0, c15.x
sincos r0.xy, r1.x, c24.xyzw, c23.xyzw
mul r0.x, v0.w, r1.y
mad r0.z, r0.y, c13.x, r0.x
dp4 r0.y, v0, c1
dp4 r0.x, v0, c0
add oPos.xy, r0, r0.z
mov r0.w, c20.x
mov r0.z, c19.x
mul r1.xy, r0.zwzw, c8
mov r0.y, c22.x
mov r0.x, c21
mul r0.xy, r0, c8
frc r0.zw, r0.xyxy
mad r0.xy, v2, c18, c18.zwzw
mad oT0.zw, r0.xyxy, c11.x, r0
frc r0.zw, r1.xyxy
mad r0.xy, v2, c17, c17.zwzw
add oT0.xy, r0, r0.zwzw
mov oT1, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Float 48 [_DetailTexScaleUvs]
Float 52 [_VertAnimSpeed]
Float 56 [_VertAnimDisplacement]
Float 60 [_VertAnimSpeedB]
Float 64 [_VertAnimDisplacementB]
Float 68 [_FresnelPower]
Vector 80 [_MainTex_ST]
Vector 96 [_DetailTex_ST]
Float 112 [_ScrollX]
Float 116 [_ScrollY]
Float 120 [_Scroll2X]
Float 124 [_Scroll2Y]
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
eefiecedkikggbbbmadmpclokmmnjmcfmebdcecjabaaaaaacmagaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
kiaeaaaaeaaaabaackabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaaaaaaaaaidcaabaaaaaaaaaaaigbabaaaaaaaaaaaigiacaaa
abaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaadaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkbabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaabkaabaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaah
dccabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadgaaaaafmccabaaa
aaaaaaaakgaobaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadiaaaaajpcaabaaa
abaaaaaaegiocaaaaaaaaaaaahaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaakmccabaaa
abaaaaaaagaebaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaakgaobaaaabaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
acaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaaeaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahpccabaaaadaaaaaaagaabaaaaaaaaaaa
pgbpbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Float 48 [_DetailTexScaleUvs]
Float 52 [_VertAnimSpeed]
Float 56 [_VertAnimDisplacement]
Float 60 [_VertAnimSpeedB]
Float 64 [_VertAnimDisplacementB]
Float 68 [_FresnelPower]
Vector 80 [_MainTex_ST]
Vector 96 [_DetailTex_ST]
Float 112 [_ScrollX]
Float 116 [_ScrollY]
Float 120 [_Scroll2X]
Float 124 [_Scroll2Y]
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
eefiecedajfgiiiilbeknbekbmpfblbgodgnjoekabaaaaaagmajaaaaaeaaaaaa
daaaaaaagmadaaaabmaiaaaaoeaiaaaaebgpgodjdeadaaaadeadaaaaaaacpopp
naacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaaeaaaiaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbdaaapkaidpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafbbaaapka
abannalfgballglhklkkckdlijiiiidjfbaaaaafbcaaapkaklkkkklmaaaaaalo
aaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadia
adaaoejaadaaoekaadaaookaabaaaaacabaaadiaagaaoekaafaaaaadabaaapia
abaaeeiaafaaoekabdaaaaacabaaapiaabaaoeiaacaaaaadaaaaadoaaaaaoeia
abaaoeiaaeaaaaaeaaaaadiaadaaoejaaeaaoekaaeaaookaaeaaaaaeaaaaamoa
aaaaeeiaabaaaakaabaaoeiaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahia
aaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiaaoaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoeka
aeaaaaaeaaaaahiaaaaaoeiabaaappkaaaaaoejbceaaaaacabaaahiaaaaaoeia
aiaaaaadaaaaabiaabaaoeiaacaaoejacaaaaaadabaaabiaaaaaaaiaacaaffka
afaaaaadacaaapoaabaaaaiaafaappjaacaaaaadaaaaadiaaaaaoijaagaaoika
afaaaaadaaaaadiaaaaaoeiaabaaonkaaeaaaaaeaaaaadiaaaaaoeiabdaaaaka
bdaaffkabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabdaakkka
bdaappkacfaaaaaeabaaaciaaaaaffiabbaaoekabcaaoekacfaaaaaeacaaacia
aaaaaaiabbaaoekabcaaoekaafaaaaadaaaaabiaabaaffiaacaaaakaafaaaaad
aaaaabiaaaaaaaiaaaaappjaaeaaaaaeaaaaabiaacaaffiaabaakkkaaaaaaaia
afaaaaadabaaapiaaaaaffjaajaaoekaaeaaaaaeabaaapiaaiaaoekaaaaaaaja
abaaoeiaaeaaaaaeabaaapiaakaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapia
alaaoekaaaaappjaabaaoeiaacaaaaadaaaaadiaaaaaaaiaabaaoeiaaeaaaaae
aaaaadmaabaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaabaaoeiaabaaaaac
abaaapoaafaaoejappppaaaafdeieefckiaeaaaaeaaaabaackabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaaaaaaaaaidcaabaaa
aaaaaaaaigbabaaaaaaaaaaaigiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaadaaaaaaenaaaaagdcaabaaa
aaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkbabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckiacaaaaaaaaaaaadaaaaaabkaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaaaaaaaaaagaabaaaaaaaaaaa
egaabaaaabaaaaaadgaaaaafmccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaal
dcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaahaaaaaa
egiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
aaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaal
dcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadcaaaaakmccabaaaabaaaaaaagaebaaaaaaaaaaaagiacaaa
aaaaaaaaadaaaaaakgaobaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaaeaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
pccabaaaadaaaaaaagaabaaaaaaaaaaapgbpbaaaafaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Multiplier]
Float 1 [_BaseOpacity]
Float 2 [_DetailTexOpacity]
Vector 3 [_TintColor]
Float 4 [_MasterOpacity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[5] = { program.local[0..4] };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R0.w, R1.x, c[1].x;
MUL R1.yzw, R1.xxyz, c[3].xxyz;
MAD R1.xyz, R0, c[3], R1.yzww;
MAD R0.x, R0, c[2], R0.w;
MUL R1.xyz, R1, c[0].x;
MUL_SAT R0.x, R0, fragment.texcoord[2];
MUL result.color.xyz, R1, fragment.texcoord[1];
MUL result.color.w, R0.x, c[4].x;
END
# 10 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Multiplier]
Float 1 [_BaseOpacity]
Float 2 [_DetailTexOpacity]
Vector 3 [_TintColor]
Float 4 [_MasterOpacity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1.xyz
dcl t2.x
texld r2, t0, s0
mov r0.x, t0.z
mov r0.y, t0.w
texld r1, r0, s1
mul r0.x, r2, c1
mad r0.x, r1, c2, r0
mul r2.xyz, r2, c3
mad r2.xyz, r1, c3, r2
mul r1.xyz, r2, c0.x
mul_sat r0.x, r0, t2
mul r1.xyz, r1, t1
mul r1.w, r0.x, c4.x
mov_pp oC0, r1
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 128
Float 16 [_Multiplier]
Float 20 [_BaseOpacity]
Float 24 [_DetailTexOpacity]
Vector 32 [_TintColor]
Float 72 [_MasterOpacity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfbbcbnoodalginnfgaholnkapbclikcdabaaaaaammacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapabaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcnmabaaaaeaaaaaaahhaaaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadbcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
ocaabaaaaaaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaacaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaaacaaaaaa
fgaobaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaabaaaaaackiacaaa
aaaaaaaaabaaaaaaakaabaaaaaaaaaaadicaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaadaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaa
ckiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaajgahbaaaaaaaaaaa
agiacaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 128
Float 16 [_Multiplier]
Float 20 [_BaseOpacity]
Float 24 [_DetailTexOpacity]
Vector 32 [_TintColor]
Float 72 [_MasterOpacity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeeonhenlfjcaeppapdemopbgdajhifgdabaaaaaacmaeaaaaaeaaaaaa
daaaaaaaimabaaaahaadaaaapiadaaaaebgpgodjfeabaaaafeabaaaaaaacpppp
baabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaabaaacaaaaaaaaaaaaaaaaaaaeaaabaaacaaaaaaaaaaaaacpppp
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaabiaaaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeia
abaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaadabaaaoiaabaablia
abaablkaafaaaaadaaaaaiiaabaaaaiaaaaaffkaaeaaaaaeaaaaaiiaaaaaaaia
aaaakkkaaaaappiaaeaaaaaeaaaaahiaaaaaoeiaabaaoekaabaabliaafaaaaad
aaaaahiaaaaaoeiaaaaaaakaafaaaaadabaachiaaaaaoeiaabaaoelaafaaaaad
aaaabbiaaaaappiaacaaaalaafaaaaadabaaciiaaaaaaaiaacaakkkaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefcnmabaaaaeaaaaaaahhaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
bcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaaagajbaaaaaaaaaaaagijcaaaaaaaaaaaacaaaaaa
diaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaa
acaaaaaafgaobaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaabaaaaaa
ckiacaaaaaaaaaaaabaaaaaaakaabaaaaaaaaaaadicaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakbabaaaadaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
aaaaaaaackiacaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaajgahbaaa
aaaaaaaaagiacaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaacaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapabaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}