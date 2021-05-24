//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Ford_Glowing_Edges_Add" {
Properties {
 _MainTex ("Main Texture", 2D) = "black" {}
 _DetailTex ("Animated Texture", 2D) = "white" {}
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _InvFadeParemeter ("Glow effect Range", Range(0,1)) = 0.5
 _BaseOpacity ("Base Opacity", Range(0,1)) = 0.25
 _BaseColor ("Base Color", Color) = (0.54,0.95,0.99,0.5)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend One One
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [_DetailTex_ST]
Float 12 [_ScrollX]
Float 13 [_ScrollY]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV R1.y, c[13].x;
MOV R1.x, c[12];
MUL R1.xy, R1, c[9];
MOV result.position, R0;
FRC R0.xy, R1;
MAD R1.xy, vertex.texcoord[0], c[11], c[11].zwzw;
ADD result.texcoord[0].zw, R1.xyxy, R0.xyxy;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [_DetailTex_ST]
Float 12 [_ScrollX]
Float 13 [_ScrollY]
"vs_2_0
def c14, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.x
mul r1.y, r1, c9.x
mad oT3.xy, r1.z, c10.zwzw, r1
mov r1.y, c13.x
mov r1.x, c12
mul r1.xy, r1, c8
mov oPos, r0
frc r0.xy, r1
mad r1.xy, v1, c11, c11.zwzw
add oT0.zw, r1.xyxy, r0.xyxy
mov oT3.zw, r0
mov oT0.xy, v1
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefieceddjkgejkhnildfnhoefjodddckfnpjmmiabaaaaaakiadaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdmacaaaaeaaaabaaipaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajdcaabaaa
abaaaaaaegiacaaaaaaaaaaaadaaaaaaegiacaaaabaaaaaaaaaaaaaabkaaaaaf
dcaabaaaabaaaaaaegaabaaaabaaaaaadcaaaaalmcaabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaaaaaaah
mccabaaaabaaaaaaagaebaaaabaaaaaakgaobaaaabaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedebdmmlnacbponejcgekgcaiknfmcfnaaabaaaaaafeafaaaaaeaaaaaa
daaaaaaaniabaaaabmaeaaaaoeaeaaaaebgpgodjkaabaaaakaabaaaaaaacpopp
eiabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaacaa
acaaabaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaabaaafaaabaaaeaaaaaaaaaa
acaaaaaaaeaaafaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafajaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadia
adaaapjaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaaka
afaaaaadabaaaiiaabaaaaiaajaaaakaafaaaaadabaaafiaaaaapeiaajaaaaka
acaaaaadabaaadoaabaakkiaabaaomiaabaaaaacabaaadiaacaaoekaafaaaaad
abaaadiaabaaoeiaadaaoekabdaaaaacabaaadiaabaaoeiaaeaaaaaeabaaamia
adaaeejaabaaeekaabaaoekaacaaaaadaaaaamoaabaaeeiaabaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
abaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejappppaaaafdeieefcdmacaaaa
eaaaabaaipaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajdcaabaaaabaaaaaaegiacaaaaaaaaaaa
adaaaaaaegiacaaaabaaaaaaaaaaaaaabkaaaaafdcaabaaaabaaaaaaegaabaaa
abaaaaaadcaaaaalmcaabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
acaaaaaakgiocaaaaaaaaaaaacaaaaaaaaaaaaahmccabaaaabaaaaaaagaebaaa
abaaaaaakgaobaaaabaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaafmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_ZBufferParams]
Vector 1 [_BaseColor]
Float 2 [_InvFadeParemeter]
Float 3 [_BaseOpacity]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[5] = { program.local[0..3],
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R2.x, fragment.texcoord[3], texture[0], 2D;
TEX R1, fragment.texcoord[0], texture[1], 2D;
TEX R0, fragment.texcoord[0].zwzw, texture[2], 2D;
MAD R2.x, R2, c[0].z, c[0].w;
RCP R2.x, R2.x;
ADD R2.x, R2, -fragment.texcoord[3].z;
MUL_SAT R3.x, R2, c[2];
MUL R2, R1, c[1];
ADD R3.x, -R3, c[4];
MUL R2, R2, c[3].x;
MUL R3, R3.x, c[1];
MAD R2, R3, c[3].x, R2;
MUL R0, R0, R1;
MAD result.color, R0, c[3].x, R2;
END
# 14 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ZBufferParams]
Vector 1 [_BaseColor]
Float 2 [_InvFadeParemeter]
Float 3 [_BaseOpacity]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 1.00000000, 0, 0, 0
dcl t0
dcl t3
texld r2, t0, s1
mul r3, r2, c1
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.xy, r0
mul r3, r3, c3.x
texldp r0, t3, s0
texld r1, r1, s2
mad r0.x, r0, c0.z, c0.w
rcp r0.x, r0.x
add r0.x, r0, -t3.z
mul_sat r0.x, r0, c2
add_pp r0.x, -r0, c4
mul_pp r0, r0.x, c1
mad r0, r0, c3.x, r3
mul_pp r1, r1, r2
mad r0, r1, c3.x, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
ConstBuffer "$Globals" 96
Vector 64 [_BaseColor]
Float 80 [_InvFadeParemeter]
Float 84 [_BaseOpacity]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedjdciflomdhngpndmpocogiciepodpjojabaaaaaaimadaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleacaaaaeaaaaaaaknaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaaahaaaaaaakaabaaaaaaaaaaa
dkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaackbabaiaebaaaaaaacaaaaaadicaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaipcaabaaa
acaaaaaaegaobaaaabaaaaaaegiocaaaaaaaaaaaaeaaaaaadiaaaaaipcaabaaa
acaaaaaaegaobaaaacaaaaaafgifcaaaaaaaaaaaafaaaaaadcaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaafgifcaaaaaaaaaaaafaaaaaaegaobaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpccabaaaaaaaaaaaegaobaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaa
egaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
ConstBuffer "$Globals" 96
Vector 64 [_BaseColor]
Float 80 [_InvFadeParemeter]
Float 84 [_BaseOpacity]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedgmfmblbahkfddgebogehggkmgiecafjeabaaaaaageafaaaaaeaaaaaa
daaaaaaaaeacaaaamaaeaaaadaafaaaaebgpgodjmmabaaaammabaaaaaaacpppp
ieabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaaeaaacaaaaaaaaaaaaaaabaaahaaabaaacaaaaaaaaaa
aaacppppfbaaaaafadaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
abaapplaafaaaaadaaaaadiaaaaappiaabaaoelaabaaaaacabaaabiaaaaakkla
abaaaaacabaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
acaacpiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaacaioekaaeaaaaae
aaaaabiaacaakkkaaaaaaaiaacaappkaagaaaaacaaaacbiaaaaaaaiaacaaaaad
aaaaabiaaaaaaaiaabaakklbafaaaaadaaaadbiaaaaaaaiaabaaaakaacaaaaad
aaaacbiaaaaaaaibadaaaakaafaaaaadaaaacpiaaaaaaaiaaaaaoekaafaaaaad
adaaapiaacaaoeiaaaaaoekaafaaaaadadaaapiaadaaoeiaabaaffkaaeaaaaae
aaaaapiaaaaaoeiaabaaffkaadaaoeiaafaaaaadabaaapiaacaaoeiaabaaoeia
aeaaaaaeaaaacpiaabaaoeiaabaaffkaaaaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcleacaaaaeaaaaaaaknaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaacaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaa
ckiacaaaabaaaaaaahaaaaaaakaabaaaaaaaaaaadkiacaaaabaaaaaaahaaaaaa
aoaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaia
ebaaaaaaacaaaaaadicaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaabaaaaaa
egiocaaaaaaaaaaaaeaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
fgifcaaaaaaaaaaaafaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
fgifcaaaaaaaaaaaafaaaaaaegaobaaaacaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadcaaaaakpccabaaaaaaaaaaa
egaobaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaaegaobaaaaaaaaaaadoaaaaab
ejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
fmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
Fallback "Transparent/Diffuse"
}