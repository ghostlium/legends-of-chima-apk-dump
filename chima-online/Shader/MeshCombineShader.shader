//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/MeshCombineShader" {
Properties {
 _Detail ("Base (RGB)", 2D) = "" {}
 _BaseMask ("Base (RGB)", 2D) = "" {}
 _Sticker ("Base (RGB)", 2D) = "" {}
 _StickerMask ("Base (RGB)", 2D) = "" {}
 _Color ("Main Color", Color) = (1,1,1,1)
 _Color1 ("Color 1", Color) = (1,1,1,1)
 _Color2 ("Color 2", Color) = (1,1,1,1)
 _Color3 ("Color 3", Color) = (1,1,1,1)
 _StickerColor ("Sticker Color", Color) = (1,1,1,1)
 _StickerColor2 ("Sticker Color 2", Color) = (1,1,1,1)
}
SubShader { 
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog { Mode Off }
  Blend One SrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mov oT0.xy, v1
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedgcclnnbgpijgpddakojponflfpghdgniabaaaaaaoeabaaaaadaaaaaa
cmaaaaaaiaaaaaaaniaaaaaaejfdeheoemaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfceeaaklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedmldjmmohbhmjmnnblgkeoagbliecmmbkabaaaaaalmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaageacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaabaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaabaaaaaadoaaaaabejfdeheoemaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaaebaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafaepfdejfeejepeoaafeeffiedepepfc
eeaaklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_Color]
Vector 1 [_Color1]
Vector 2 [_Color2]
Vector 3 [_Color3]
Vector 4 [_StickerColor]
Vector 5 [_StickerColor2]
SetTexture 0 [_BaseMask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_StickerMask] 2D 2
SetTexture 3 [_Sticker] 2D 3
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[6] = { program.local[0..5] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R2.xyz, fragment.texcoord[0], texture[2], 2D;
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R1, fragment.texcoord[0], texture[3], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R4.xyz, c[0];
ADD R4.xyz, -R4, c[1];
MAD R5.xyz, R3.x, R4, c[0];
ADD R4.xyz, -R5, c[2];
MAD R3.xyw, R3.y, R4.xyzz, R5.xyzz;
ADD R4.xyz, -R1, c[4];
ADD R5.xyz, -R3.xyww, c[3];
MAD R1.xyz, R2.z, R4, R1;
MAD R3.xyz, R3.z, R5, R3.xyww;
ADD R4.xyz, R0, -R3;
ADD R0.xyz, -R1, c[5];
MAD R3.xyz, R0.w, R4, R3;
MAD R0.xyz, R2.x, R0, R1;
ADD R0.xyz, R0, -R3;
MAD result.color.xyz, R1.w, R0, R3;
MOV result.color.w, R2.y;
END
# 20 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_Color]
Vector 1 [_Color1]
Vector 2 [_Color2]
Vector 3 [_Color3]
Vector 4 [_StickerColor]
Vector 5 [_StickerColor2]
SetTexture 0 [_BaseMask] 2D 0
SetTexture 1 [_Detail] 2D 1
SetTexture 2 [_StickerMask] 2D 2
SetTexture 3 [_Sticker] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl t0.xy
texld r0, t0, s0
texld r1, t0, s1
texld r3, t0, s2
texld r2, t0, s3
mov_pp r4.xyz, c1
add_pp r4.xyz, -c0, r4
mad_pp r4.xyz, r0.x, r4, c0
add_pp r5.xyz, -r4, c2
mad_pp r4.xyz, r0.y, r5, r4
add_pp r5.xyz, -r4, c3
mad_pp r4.xyz, r0.z, r5, r4
add_pp r0.xyz, -r2, c4
mad_pp r0.xyz, r3.z, r0, r2
add_pp r2.xyz, r1, -r4
add_pp r1.xyz, -r0, c5
mad_pp r2.xyz, r1.w, r2, r4
mad_pp r0.xyz, r3.x, r1, r0
add_pp r0.xyz, r0, -r2
mad_pp r0.xyz, r2.w, r0, r2
mov_pp r0.w, r3.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_BaseMask] 2D 1
SetTexture 1 [_Detail] 2D 0
SetTexture 2 [_StickerMask] 2D 3
SetTexture 3 [_Sticker] 2D 2
ConstBuffer "$Globals" 112
Vector 16 [_Color]
Vector 32 [_Color1]
Vector 48 [_Color2]
Vector 64 [_Color3]
Vector 80 [_StickerColor]
Vector 96 [_StickerColor2]
BindCB  "$Globals" 0
"ps_4_0
eefiecedohnhgghaeaheenemndhdnidfcdfdchpeabaaaaaaaiaeaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceiadaaaa
eaaaaaaancaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaeaaaaaaaaaaaaakhcaabaaaaaaaaaaaegiccaiaebaaaaaaaaaaaaaa
abaaaaaaegiccaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaa
dcaaaaajhcaabaaaaaaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaaaaaaaaajlcaabaaaabaaaaaaegaibaiaebaaaaaaaaaaaaaaegiicaaa
aaaaaaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaaaaaaaaajhcaabaaa
acaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
dcaaaaajhcaabaaaabaaaaaakgakbaaaadaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaa
aaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaadaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaabkaabaaaadaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaajhccabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_BaseMask] 2D 1
SetTexture 1 [_Detail] 2D 0
SetTexture 2 [_StickerMask] 2D 3
SetTexture 3 [_Sticker] 2D 2
ConstBuffer "$Globals" 112
Vector 16 [_Color]
Vector 32 [_Color1]
Vector 48 [_Color2]
Vector 64 [_Color3]
Vector 80 [_StickerColor]
Vector 96 [_StickerColor2]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedilpebplbchcamgpmnipiagdanamcbohcabaaaaaajiafaaaaaeaaaaaa
daaaaaaalmabaaaaamafaaaageafaaaaebgpgodjieabaaaaieabaaaaaaacpppp
eeabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaabaaaaaa
aaababaaadacacaaacadadaaaaaaabaaagaaaaaaaaaaaaaaaaacppppbpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaecaaaaadaaaacpia
aaaaoelaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaecaaaaadacaacpia
aaaaoelaacaioekaecaaaaadadaacpiaaaaaoelaadaioekaabaaaaacaeaaahia
aaaaoekaacaaaaadaeaachiaaeaaoeibabaaoekaaeaaaaaeaeaachiaaaaaaaia
aeaaoeiaaaaaoekabcaaaaaeafaachiaaaaaffiaacaaoekaaeaaoeiabcaaaaae
aeaachiaaaaakkiaadaaoekaafaaoeiabcaaaaaeaaaachiaabaappiaabaaoeia
aeaaoeiabcaaaaaeabaachiaadaakkiaaeaaoekaacaaoeiabcaaaaaeacaachia
adaaaaiaafaaoekaabaaoeiaabaaaaacabaaciiaadaaffiabcaaaaaeabaachia
acaappiaacaaoeiaaaaaoeiaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefc
eiadaaaaeaaaaaaancaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaaaaaaaakhcaabaaaaaaaaaaaegiccaiaebaaaaaa
aaaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
aaaaaaajhcaabaaaacaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaajhcaabaaaaaaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaaaaaaaajlcaabaaaabaaaaaaegaibaiaebaaaaaaaaaaaaaa
egiicaaaaaaaaaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaaaaaaaaaj
hcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaaaaaaaaaafaaaaaa
efaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaakgakbaaaadaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaabkaabaaa
adaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback Off
}