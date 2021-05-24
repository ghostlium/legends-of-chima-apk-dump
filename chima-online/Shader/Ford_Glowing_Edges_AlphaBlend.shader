//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Ford_Glowing_Edges Alpha Blend" {
Properties {
 _MainTex ("Main Texture", 2D) = "black" {}
 _DetailTex ("Animated Texture", 2D) = "white" {}
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _InvFadeParemeter ("Glow effect Range", Range(0,1)) = 0.5
 _BaseOpacity ("Base Opacity", Range(0,4)) = 0.25
 _EdgeBlendOpacity ("Edge Blend Opacity", Range(0,4)) = 1
 _DetailTexOpacity ("Detail Texture Opacity", Range(0,1)) = 0.25
 _BaseColor ("Base Color", Color) = (0.54,0.95,0.99,0.5)
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
Float 4 [_DetailTexOpacity]
Float 5 [_EdgeBlendOpacity]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[7] = { program.local[0..5],
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[3], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MAD R0.w, R2.x, c[0].z, c[0];
RCP R0.w, R0.w;
ADD R0.w, R0, -fragment.texcoord[3].z;
MUL_SAT R0.w, R0, c[2].x;
ADD R0.w, -R0, c[6].x;
MUL R0.w, R0, c[5].x;
MUL R0.w, R0, c[1].x;
MAD R0.w, R0.x, c[3].x, R0;
MAD R0.xyz, R1, c[1], R0;
MAD R0.w, R1.x, c[4].x, R0;
ADD result.color.xyz, R0, c[1];
MUL result.color.w, R0, c[3].x;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ZBufferParams]
Vector 1 [_BaseColor]
Float 2 [_InvFadeParemeter]
Float 3 [_BaseOpacity]
Float 4 [_DetailTexOpacity]
Float 5 [_EdgeBlendOpacity]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 1.00000000, 0, 0, 0
dcl t0
dcl t3
texld r2, t0, s1
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.xy, r0
texld r1, r1, s2
texldp r0, t3, s0
mad r0.x, r0, c0.z, c0.w
rcp r0.x, r0.x
add r0.x, r0, -t3.z
mul_sat r0.x, r0, c2
add_pp r0.x, -r0, c6
mul r0.x, r0, c5
mul_pp r0.x, r0, c1
mad r0.x, r2, c3, r0
mad r0.x, r1, c4, r0
mad r2.xyz, r1, c1, r2
add r1.xyz, r2, c1
mul r1.w, r0.x, c3.x
mov_pp oC0, r1
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
Float 88 [_DetailTexOpacity]
Float 92 [_EdgeBlendOpacity]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedhmdhflkepmibmmkincjfipmkmdmhmihbabaaaaaaliadaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcoaacaaaaeaaaaaaaliaaaaaa
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
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaaakaabaaaabaaaaaabkiacaaaaaaaaaaaafaaaaaadcaaaaakbcaabaaa
aaaaaaaaakiacaaaaaaaaaaaaeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaacaaaaaackiacaaaaaaaaaaa
afaaaaaaakaabaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaacaaaaaa
agijcaaaaaaaaaaaaeaaaaaaagajbaaaabaaaaaaaaaaaaaihccabaaaaaaaaaaa
jgahbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaiiccabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
ConstBuffer "$Globals" 96
Vector 64 [_BaseColor]
Float 80 [_InvFadeParemeter]
Float 84 [_BaseOpacity]
Float 88 [_DetailTexOpacity]
Float 92 [_EdgeBlendOpacity]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedfjmcjlmehnmndajkoaiklcoccedcnilhabaaaaaakeafaaaaaeaaaaaa
daaaaaaabiacaaaaaaafaaaahaafaaaaebgpgodjoaabaaaaoaabaaaaaaacpppp
jiabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaaeaaacaaaaaaaaaaaaaaabaaahaaabaaacaaaaaaaaaa
aaacppppfbaaaaafadaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
abaapplaafaaaaadaaaaadiaaaaappiaabaaoelaabaaaaacabaaabiaaaaakkla
abaaaaacabaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
acaacpiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaacaioekaaeaaaaae
abaaaiiaacaakkkaaaaaaaiaacaappkaagaaaaacabaaciiaabaappiaacaaaaad
abaaaiiaabaappiaabaakklbafaaaaadabaadiiaabaappiaabaaaakaacaaaaad
abaaaiiaabaappibadaaaakaafaaaaadabaaaiiaabaappiaabaappkaafaaaaad
acaaaiiaacaaaaiaabaaffkaaeaaaaaeabaaaiiaaaaaaakaabaappiaacaappia
aeaaaaaeabaaaiiaabaaaaiaabaakkkaabaappiaaeaaaaaeaaaaahiaabaaoeia
aaaaoekaacaaoeiaacaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaaciia
abaappiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcoaacaaaa
eaaaaaaaliaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaaahaaaaaa
akaabaaaaaaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaaaaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaiaebaaaaaaacaaaaaadicaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaaaaaaaai
bcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaaiccaabaaaaaaaaaaaakaabaaaabaaaaaabkiacaaaaaaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaacaaaaaa
ckiacaaaaaaaaaaaafaaaaaaakaabaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaa
agajbaaaacaaaaaaagijcaaaaaaaaaaaaeaaaaaaagajbaaaabaaaaaaaaaaaaai
hccabaaaaaaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaai
iccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaadoaaaaab
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