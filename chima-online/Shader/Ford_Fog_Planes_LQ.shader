//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Fog Planes LQ" {
Properties {
 _MainTex ("Main Texture", 2D) = "black" {}
 _SecondTextureUvsMul ("Second Texture UV Multiplier", Float) = 1
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _ScrollXB ("Detail TextureB Scroll Speed X", Float) = 1
 _ScrollYB ("Detail TextureB Scroll Speed Y", Float) = 1
 _MainTextureMul ("Main Texture Multiplier", Float) = 1
 _DetailTextureMul ("Detail Texture Multiplier", Float) = 1
 _Color ("Color", Color) = (1,1,1,1)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Float 6 [_SecondTextureUvsMul]
Float 7 [_ScrollX]
Float 8 [_ScrollY]
Float 9 [_ScrollXB]
Float 10 [_ScrollYB]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { program.local[0],
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
MOV R0.y, c[8].x;
MOV R0.x, c[7];
MUL R1.xy, R0, c[5];
MOV R0.y, c[10].x;
MOV R0.x, c[9];
MUL R0.zw, R0.xyxy, c[5].xyxy;
MUL R0.xy, vertex.texcoord[0], c[6].x;
FRC R0.zw, R0;
MAD R0.xy, R0, c[11], c[11].zwzw;
ADD result.texcoord[0].zw, R0.xyxy, R0;
FRC R0.xy, R1;
MAD R0.zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
ADD result.texcoord[0].xy, R0.zwzw, R0;
MOV result.texcoord[1], vertex.color.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Float 5 [_SecondTextureUvsMul]
Float 6 [_ScrollX]
Float 7 [_ScrollY]
Float 8 [_ScrollXB]
Float 9 [_ScrollYB]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
mov r0.y, c7.x
mov r0.x, c6
mul r1.xy, r0, c4
mov r0.y, c9.x
mov r0.x, c8
mul r0.zw, r0.xyxy, c4.xyxy
mul r0.xy, v1, c5.x
frc r0.zw, r0
mad r0.xy, r0, c10, c10.zwzw
add oT0.zw, r0.xyxy, r0
frc r0.xy, r1
mad r0.zw, v1.xyxy, c10.xyxy, c10
add oT0.xy, r0.zwzw, r0
mov oT1, v2.w
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
ConstBuffer "$Globals" 112
Float 32 [_SecondTextureUvsMul]
Float 36 [_ScrollX]
Float 40 [_ScrollY]
Float 44 [_ScrollXB]
Float 48 [_ScrollYB]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednhddepkgkdlhofbaflnbbllggffjdicgabaaaaaaaeaeaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
iaacaaaaeaaaabaakaaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajecaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaa
akiacaaaabaaaaaaaaaaaaaadiaaaaajicaabaaaaaaaaaaaakiacaaaaaaaaaaa
adaaaaaabkiacaaaabaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaogakbaaa
aaaaaaaadiaaaaaimcaabaaaaaaaaaaaagbebaaaadaaaaaaagiacaaaaaaaaaaa
acaaaaaadcaaaaalmcaabaaaaaaaaaaakgaobaaaaaaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaahmccabaaaabaaaaaaagaebaaa
aaaaaaaakgaobaaaaaaaaaaadiaaaaajdcaabaaaaaaaaaaajgifcaaaaaaaaaaa
acaaaaaaegiacaaaabaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaa
aaaaaaaadcaaaaalmcaabaaaaaaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaa
aaaaaaaaogakbaaaaaaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 32 [_SecondTextureUvsMul]
Float 36 [_ScrollX]
Float 40 [_ScrollY]
Float 44 [_ScrollXB]
Float 48 [_ScrollYB]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedaloihgfdcmmhdhpncknegjjabflpfkhdabaaaaaaliafaaaaaeaaaaaa
daaaaaaaoaabaaaagiaeaaaadaafaaaaebgpgodjkiabaaaakiabaaaaaaacpopp
fmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaacaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaafiaafaaapjaabaaaaacaaaaaoiaabaaoekaafaaaaadaaaaadia
aaaaojiaaeaaoekabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeabaaadiaadaaoeja
adaaoekaadaaookaacaaaaadaaaaadoaaaaaoeiaabaaoeiaafaaaaadaaaaaeia
aaaappiaaeaaaakaabaaaaacaaaaaciaaeaaffkaafaaaaadaaaaaiiaaaaaffia
acaaaakabdaaaaacaaaaadiaaaaaooiaafaaaaadaaaaamiaadaaeejaabaaaaka
aeaaaaaeaaaaamiaaaaaoeiaadaaeekaadaaoekaacaaaaadaaaaamoaaaaaeeia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaappjappppaaaa
fdeieefciaacaaaaeaaaabaakaaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajecaabaaaaaaaaaaadkiacaaaaaaaaaaa
acaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaajicaabaaaaaaaaaaaakiacaaa
aaaaaaaaadaaaaaabkiacaaaabaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaa
ogakbaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaaagbebaaaadaaaaaaagiacaaa
aaaaaaaaacaaaaaadcaaaaalmcaabaaaaaaaaaaakgaobaaaaaaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaahmccabaaaabaaaaaa
agaebaaaaaaaaaaakgaobaaaaaaaaaaadiaaaaajdcaabaaaaaaaaaaajgifcaaa
aaaaaaaaacaaaaaaegiacaaaabaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaa
egaabaaaaaaaaaaadcaaaaalmcaabaaaaaaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaahdccabaaaabaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaa
afaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_MainTextureMul]
Float 1 [_DetailTextureMul]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0..2] };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[0], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R1, c[1].x;
MAD R0.xyz, R0, c[0].x, R1;
MUL result.color.w, R0.x, fragment.texcoord[1].x;
MUL result.color.xyz, R0, c[2];
END
# 6 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_MainTextureMul]
Float 1 [_DetailTextureMul]
Vector 2 [_Color]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
dcl t0
dcl t1.x
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s0
mul r0.xyz, r0, c1.x
mad r1.xyz, r1, c0.x, r0
mul r0.xyz, r1, c2
mul r0.w, r1.x, t1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 112
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedahcodchplcaemmlpkcinboglkaleggooabaaaaaacaacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apabaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcdaabaaaaeaaaaaaaemaaaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadbcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaaegacbaaaaaaaaaaa
diaaaaaihccabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaa
diaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaacaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 112
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbpnbmenpdgefhpbpjhangijbanmfleioabaaaaaabeadaaaaaeaaaaaa
daaaaaaacaabaaaafiacaaaaoaacaaaaebgpgodjoiaaaaaaoiaaaaaaaaacpppp
leaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaafaaacaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaajaaaaiapkaabaaaaacaaaaabiaaaaakkla
abaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaaaaaoelaaaaioekaafaaaaadaaaaahiaaaaaoeiaaaaakkkaaeaaaaae
aaaaahiaabaaoeiaaaaaffkaaaaaoeiaafaaaaadabaachiaaaaaoeiaabaaoeka
afaaaaadabaaciiaaaaaaaiaabaaaalaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcdaabaaaaeaaaaaaaemaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadbcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
kgikcaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaa
abaaaaaafgifcaaaaaaaaaaaafaaaaaaegacbaaaaaaaaaaadiaaaaaihccabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaahiccabaaa
aaaaaaaaakaabaaaaaaaaaaaakbabaaaacaaaaaadoaaaaabejfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapabaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Transparent/Diffuse"
}