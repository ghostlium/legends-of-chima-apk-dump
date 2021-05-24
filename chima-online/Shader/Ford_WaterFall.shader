//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Waterfall" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _BlendTex ("Blend Texture (RGB)", 2D) = "white" {}
 _SparkTex ("Sparkle Texture (RGB)", 2D) = "black" {}
 _BgColor ("Background Color", Color) = (0.1,0.5,0.9,0.3)
 _WaterColor ("Water Color", Color) = (1,1,1,1)
 _SparkPower ("Sparkles atenuation", Float) = 3
 _TestSpeed ("UV Offset Speed", Vector) = (0.5,3,0.5,3)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent=1" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent=1" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 9 [_World2Object]
Vector 5 [_Time]
Vector 6 [_WorldSpaceCameraPos]
Vector 7 [unity_Scale]
Vector 8 [_MainTex_ST]
Vector 13 [_BlendTex_ST]
Vector 14 [_SparkTex_ST]
Vector 15 [_TestSpeed]
Float 16 [_SparkPower]
"!!ARBvp1.0
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[6];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[7].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R0, vertex.normal;
POW R0.x, R0.x, c[16].x;
MUL result.texcoord[2].w, vertex.color, R0.x;
MOV R0, c[5];
MAD R1.xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[0].zw, R0.xywz, c[15].xywz, R1.xyxy;
MAD R0.zw, vertex.texcoord[0].xyxy, c[8].xyxy, c[8];
MAD R1.xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[0].xy, R0, c[15], R0.zwzw;
MAD result.texcoord[1].xy, R0, c[15], R1;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 23 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
Vector 16 [_BlendTex_ST]
Vector 17 [_SparkTex_ST]
Vector 18 [_TestSpeed]
Float 19 [_SparkPower]
"vs_2_0
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mov r1.xyz, c13
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c14.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r1.x, r0, v1
pow r0, r1.x, c19.x
mul oT2.w, v3, r0.x
mad r0.zw, v2.xyxy, c16.xyxy, c16
mov r0.xy, c18.zwzw
mad oT0.zw, c12.xywz, r0.xyyx, r0
mad r0.zw, v2.xyxy, c15.xyxy, c15
mov r0.xy, c18
mad oT0.xy, c12, r0, r0.zwzw
mad r0.zw, v2.xyxy, c17.xyxy, c17
mov r0.xy, c18
mad oT1.xy, c12, r0, r0.zwzw
dp4 oPos.w, v0, c7
dp4 oPos.z, v0, c6
dp4 oPos.y, v0, c5
dp4 oPos.x, v0, c4
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 16 [_MainTex_ST]
Vector 32 [_BlendTex_ST]
Vector 48 [_SparkTex_ST]
Vector 96 [_TestSpeed]
Float 112 [_SparkPower]
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
eefiecedehcagodlohjlkfoofigjlgnjegipkmagabaaaaaagaafaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
nmadaaaaeaaaabaaphaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadiccabaaaadaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaa
ogikcaaaaaaaaaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegiacaaaaaaaaaaa
agaaaaaaegiacaaaabaaaaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaa
acaaaaaadcaaaaalmccabaaaabaaaaaapgilcaaaaaaaaaaaagaaaaaapgilcaaa
abaaaaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadcaaaaal
dccabaaaacaaaaaaegiacaaaaaaaaaaaagaaaaaaegiacaaaabaaaaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
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
akiacaaaaaaaaaaaahaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahiccabaaaadaaaaaaakaabaaaaaaaaaaadkbabaaaafaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 16 [_MainTex_ST]
Vector 32 [_BlendTex_ST]
Vector 48 [_SparkTex_ST]
Vector 96 [_TestSpeed]
Float 112 [_SparkPower]
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
eefiecedeplhmhmikghlbjanhdegnbgdglmihcljabaaaaaakiahaaaaaeaaaaaa
daaaaaaaheacaaaafiagaaaacaahaaaaebgpgodjdmacaaaadmacaaaaaaacpopp
mmabaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaabaa
adaaabaaaaaaaaaaaaaaagaaacaaaeaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
abaaaeaaabaaahaaaaaaaaaaacaaaaaaaeaaaiaaaaaaaaaaacaabaaaafaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadiaadaaoejaabaaoekaabaaookaabaaaaacabaaapiaaeaaoekaaeaaaaae
aaaaadoaabaaoeiaagaaoekaaaaaoeiaaeaaaaaeaaaaadiaadaaoejaacaaoeka
acaaookaaeaaaaaeaaaaamoaabaaleiaagaalekaaaaaeeiaaeaaaaaeaaaaadia
adaaoejaadaaoekaadaaookaaeaaaaaeabaaadoaabaaoeiaagaaoekaaaaaoeia
abaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaae
aaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeia
baaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaabaaoeia
acaaoejacaaaaaadabaaabiaaaaaaaiaafaaaakaafaaaaadacaaaioaabaaaaia
afaappjaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcnmadaaaaeaaaabaa
phaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadiccabaaaadaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegiacaaaaaaaaaaaagaaaaaaegiacaaa
abaaaaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaadcaaaaal
mccabaaaabaaaaaapgilcaaaaaaaaaaaagaaaaaapgilcaaaabaaaaaaaaaaaaaa
agaebaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadcaaaaaldccabaaaacaaaaaa
egiacaaaaaaaaaaaagaaaaaaegiacaaaabaaaaaaaaaaaaaaegaabaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaa
ahaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahiccabaaa
adaaaaaaakaabaaaaaaaaaaadkbabaaaafaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_BgColor]
Vector 1 [_WaterColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0..1],
		{ 0.19995117 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R1.w, fragment.texcoord[1], texture[2], 2D;
ADD R0.xyz, R0, -R1;
MAD R0.xyz, R0.w, R0, R1;
ADD R1.x, R0.w, R1.z;
ADD R0.xyz, R1.w, R0;
ADD R0.w, R0, c[0];
ADD R1.x, R1, R1.w;
ADD R0.w, R0, R1.z;
ADD_SAT R1.x, R1, c[2];
MUL_SAT R0.w, R0, fragment.texcoord[2];
MUL R0.w, R0, R1.x;
MUL result.color.xyz, R0, c[1];
MUL result.color.w, R0, fragment.texcoord[2];
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_BgColor]
Vector 1 [_WaterColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.19995117, 0, 0, 0
dcl t0
dcl t1.xy
dcl t2.xyzw
texld r2, t1, s2
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s1
add_pp r1.xyz, r1, -r0
mad_pp r1.xyz, r1.w, r1, r0
add_pp r2.xyz, r2.w, r1
add_pp r1.x, r1.w, r0.z
add r0.x, r1.w, c0.w
add_pp r1.x, r1, r2.w
add r0.x, r0, r0.z
add_pp_sat r1.x, r1, c2
mul_sat r0.x, r0, t2.w
mul_pp r0.x, r0, r1
mul r1.xyz, r2, c1
mul_pp r1.w, r0.x, t2
mov_pp oC0, r1
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
ConstBuffer "$Globals" 128
Vector 64 [_BgColor]
Vector 80 [_WaterColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmhjeliggghjcfdcmejicahjbdolongjaabaaaaaagiadaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefchiacaaaaeaaaaaaajoaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadicbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahbcaabaaaaaaaaaaadkaabaaaabaaaaaackaabaaaacaaaaaaaaaaaaah
bcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaaaacaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdoaaaaaaaiccaabaaaaaaaaaaa
dkaabaaaabaaaaaadkiacaaaaaaaaaaaaeaaaaaaaaaaaaahccaabaaaaaaaaaaa
ckaabaaaacaaaaaabkaabaaaaaaaaaaadicaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkbabaaaadaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaadkbabaaa
adaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaaihccabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BlendTex] 2D 1
SetTexture 2 [_SparkTex] 2D 2
ConstBuffer "$Globals" 128
Vector 64 [_BgColor]
Vector 80 [_WaterColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjogpiccadcibnbeffldmbajeacongajaabaaaaaacaafaaaaaeaaaaaa
daaaaaaaoeabaaaageaeaaaaomaeaaaaebgpgodjkmabaaaakmabaaaaaaacpppp
haabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaaeaaacaaaaaaaaaaaaaaaaacppppfbaaaaafacaaapka
mnmmemdoaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaadlabpaaaaacaaaaaaiaacaacplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaabaaaaacaaaaabia
aaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaecaaaaadacaacpiaabaaoelaacaioeka
acaaaaadaaaaaiiaabaappiaaaaappkaacaaaaadaaaaaiiaaaaakkiaaaaappia
afaaaaadaaaadiiaaaaappiaacaapplaacaaaaadacaacbiaaaaakkiaabaappia
bcaaaaaeadaachiaabaappiaabaaoeiaaaaaoeiaacaaaaadadaaciiaacaappia
acaaaaiaacaaaaadaaaaahiaacaappiaadaaoeiaafaaaaadabaachiaaaaaoeia
abaaoekaacaaaaadaaaadbiaadaappiaacaaaakaafaaaaadaaaacbiaaaaaaaia
aaaappiaafaaaaadabaaciiaaaaaaaiaacaapplaabaaaaacaaaicpiaabaaoeia
ppppaaaafdeieefchiacaaaaeaaaaaaajoaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadicbabaaaadaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
acaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaah
bcaabaaaaaaaaaaadkaabaaaabaaaaaackaabaaaacaaaaaaaaaaaaahbcaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaaaacaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaamnmmemdoaaaaaaaiccaabaaaaaaaaaaadkaabaaa
abaaaaaadkiacaaaaaaaaaaaaeaaaaaaaaaaaaahccaabaaaaaaaaaaackaabaaa
acaaaaaabkaabaaaaaaaaaaadicaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkbabaaaadaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaadkbabaaaadaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaaihccabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
doaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
}
}