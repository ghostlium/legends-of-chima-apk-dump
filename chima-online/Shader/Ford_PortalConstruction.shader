//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Portal Construction" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Detail Texture", 2D) = "white" {}
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _Scroll2X ("Detail layer Scroll speed X", Float) = 1
 _Scroll2Y ("Detail layer Scroll speed Y", Float) = 0
 _Multiplier ("Color multiplier", Float) = 1
 _TintColor ("Color", Color) = (1,1,1,1)
 _BaseOpacity ("Base Opacity", Float) = 0.5
 _DetailTexOpacity ("Detail Texture Opacity", Float) = 0.5
 _MasterOpacity ("Master Opacity", Float) = 1
 _FresnelPower ("Fresnel Power", Float) = 3
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
  Fog { Mode Off }
  Blend One One
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
Float 12 [_FresnelPower]
Vector 13 [_MainTex_ST]
Vector 14 [_DetailTex_ST]
Float 15 [_ScrollX]
Float 16 [_ScrollY]
Float 17 [_Scroll2X]
Float 18 [_Scroll2Y]
"!!ARBvp1.0
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[10];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MAD R0.xyz, R0, c[11].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.x, R0, vertex.normal;
POW R0.x, R0.x, c[12].x;
MUL result.texcoord[2], vertex.color.w, R0.x;
MOV R0.w, c[16].x;
MOV R0.z, c[15].x;
MUL R1.xy, R0.zwzw, c[9];
MOV R0.y, c[18].x;
MOV R0.x, c[17];
MUL R0.xy, R0, c[9];
FRC R0.zw, R0.xyxy;
MAD R0.xy, vertex.texcoord[0], c[14], c[14].zwzw;
ADD result.texcoord[0].zw, R0.xyxy, R0;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[0], c[13], c[13].zwzw;
ADD result.texcoord[0].xy, R0, R0.zwzw;
MOV result.texcoord[1], vertex.color;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
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
Float 11 [_FresnelPower]
Vector 12 [_MainTex_ST]
Vector 13 [_DetailTex_ST]
Float 14 [_ScrollX]
Float 15 [_ScrollY]
Float 16 [_Scroll2X]
Float 17 [_Scroll2Y]
"vs_2_0
def c18, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mov r1.xyz, c9
mov r1.w, c18.x
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r0.xyz, r0, c10.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r1.x, r0, v1
pow r0, r1.x, c11.x
mul oT2, v3.w, r0.x
mov r0.w, c15.x
mov r0.z, c14.x
mul r1.xy, r0.zwzw, c8
mov r0.y, c17.x
mov r0.x, c16
mul r0.xy, r0, c8
frc r0.zw, r0.xyxy
mad r0.xy, v2, c13, c13.zwzw
add oT0.zw, r0.xyxy, r0
frc r0.zw, r1.xyxy
mad r0.xy, v2, c12, c12.zwzw
add oT0.xy, r0, r0.zwzw
mov oT1, v3
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
ConstBuffer "$Globals" 112
Float 48 [_FresnelPower]
Vector 64 [_MainTex_ST]
Vector 80 [_DetailTex_ST]
Float 96 [_ScrollX]
Float 100 [_ScrollY]
Float 104 [_Scroll2X]
Float 108 [_Scroll2Y]
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
eefiecedklmjnpaecfipokpnkknkcfjiecngkjkhabaaaaaadeafaaaaadaaaaaa
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
laadaaaaeaaaabaaomaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaa
agaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaaaaaaaahmccabaaaabaaaaaakgaobaaaabaaaaaa
agaebaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaa
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahpccabaaaadaaaaaa
agaabaaaaaaaaaaapgbpbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 48 [_FresnelPower]
Vector 64 [_MainTex_ST]
Vector 80 [_DetailTex_ST]
Float 96 [_ScrollX]
Float 100 [_ScrollY]
Float 104 [_Scroll2X]
Float 108 [_Scroll2Y]
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
eefiecedliddnicheflajmkbaiohiobjciiibmmcabaaaaaagiahaaaaaeaaaaaa
daaaaaaagaacaaaabiagaaaaoaagaaaaebgpgodjciacaaaaciacaaaaaaacpopp
meabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadiaadaaoejaacaaoeka
acaaookaabaaaaacabaaapiaaeaaoekaafaaaaadabaaapiaabaaoeiaafaaeeka
bdaaaaacabaaapiaabaaoeiaacaaaaadaaaaadoaaaaaoeiaabaaoeiaaeaaaaae
aaaaadiaadaaoejaadaaoekaadaaookaacaaaaadaaaaamoaabaaoeiaaaaaeeia
abaaaaacaaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaae
aaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahiaaaaaoeia
apaappkaaaaaoejbceaaaaacabaaahiaaaaaoeiaaiaaaaadaaaaabiaabaaoeia
acaaoejacaaaaaadabaaabiaaaaaaaiaabaaaakaafaaaaadacaaapoaabaaaaia
afaappjaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaa
fdeieefclaadaaaaeaaaabaaomaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaagaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaa
egaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaa
abaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaahmccabaaaabaaaaaakgaobaaa
abaaaaaaagaebaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
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
adaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahpccabaaa
adaaaaaaagaabaaaaaaaaaaapgbpbaaaafaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
TEMP R2;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R2, R1, c[1].x;
MUL R1, R1, c[3];
MAD R2, R0, c[2].x, R2;
MAD R0, R0, c[3], R1;
MUL_SAT R1, R2, fragment.texcoord[2];
MUL R0, R0, c[0].x;
MUL R1, R1, c[4].x;
MUL R0, R0, fragment.texcoord[1];
MUL result.color, R0, R1;
END
# 11 instructions, 3 R-regs
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
dcl t1
dcl t2
texld r1, t0, s0
mul r2, r1, c3
mov r0.y, t0.w
mov r0.x, t0.z
mul r1, r1, c1.x
texld r0, r0, s1
mad r1, r0, c2.x, r1
mad r0, r0, c3, r2
mul_sat r1, r1, t2
mul r0, r0, c0.x
mul r1, r1, c4.x
mul r0, r0, t1
mul_pp r0, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 112
Float 16 [_Multiplier]
Float 20 [_BaseOpacity]
Float 24 [_DetailTexOpacity]
Vector 32 [_TintColor]
Float 52 [_MasterOpacity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedphdmohlfidmpeiibnemlkkclmgeaphnoabaaaaaaoiacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcpiabaaaaeaaaaaaahoaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaacaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaacaaaaaakgikcaaa
aaaaaaaaabaaaaaaegaobaaaaaaaaaaadicaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
fgifcaaaaaaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egbobaaaacaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 112
Float 16 [_Multiplier]
Float 20 [_BaseOpacity]
Float 24 [_DetailTexOpacity]
Vector 32 [_TintColor]
Float 52 [_MasterOpacity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedenliihpoincfddaippedokelffghmefmabaaaaaaemaeaaaaaeaaaaaa
daaaaaaajaabaaaajaadaaaabiaeaaaaebgpgodjfiabaaaafiabaaaaaaacpppp
caabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaabaaadaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaabiaaaaakklaabaaaaac
aaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaafaaaaadacaaapiaabaaoeiaabaaoekaafaaaaadabaaapia
abaaoeiaaaaaffkaaeaaaaaeabaaapiaaaaaoeiaaaaakkkaabaaoeiaaeaaaaae
aaaaapiaaaaaoeiaabaaoekaacaaoeiaafaaaaadaaaaapiaaaaaoeiaaaaaaaka
afaaaaadaaaacpiaaaaaoeiaabaaoelaafaaaaadabaabpiaabaaoeiaacaaoela
afaaaaadabaaapiaabaaoeiaacaaffkaafaaaaadaaaacpiaaaaaoeiaabaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpiabaaaaeaaaaaaahoaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaa
acaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegaobaaaacaaaaaaegiocaaa
aaaaaaaaacaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaa
acaaaaaakgikcaaaaaaaaaaaabaaaaaaegaobaaaaaaaaaaadicaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaadaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaafgifcaaaaaaaaaaaadaaaaaadiaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaagiacaaaaaaaaaaaabaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegbobaaaacaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}