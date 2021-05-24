//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Effects/Caustics" {
Properties {
 _MainTex ("Main Texture", 2D) = "white" {}
 _DetailTex ("Detail Texture", 2D) = "white" {}
 _Color ("Color", Color) = (1,1,1,1)
 _Multiplier ("Multiplier", Float) = 1
 _WaveUvs ("Wave Uvs X=Displace, YZ=Speed, W=Vert pos Presicion", Vector) = (0.05,100,100,100)
 _MoveUvs ("Move Uvs Speed : X/Y=Main, ZW=Detail", Vector) = (1,1,1,1)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  Blend One One
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_Time]
Vector 6 [_MainTex_ST]
Vector 7 [_DetailTex_ST]
Vector 8 [_WaveUvs]
Vector 9 [_MoveUvs]
"!!ARBvp1.0
PARAM c[14] = { { 0.15915491, 0.25, 24.980801, -24.980801 },
		state.matrix.mvp,
		program.local[5..9],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.xy, c[8].yzzw;
MUL R0.z, vertex.position.x, c[8].w;
MAD R0.z, R0.y, c[5].x, R0;
MUL R0.y, vertex.position, c[8].w;
MAD R0.x, R0, c[5], R0.y;
MAD R0.z, R0, c[0].x, -c[0].y;
FRC R1.w, R0.z;
MAD R0.x, R0, c[0], -c[0].y;
FRC R0.w, R0.x;
ADD R1.xyz, -R1.w, c[10];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].zwzw;
ADD R1.xyz, -R0.w, c[10];
ADD R3.xyz, R2, c[11].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[11].zwzw;
MAD R3.xyz, R3, R0, c[12].xyxw;
MAD R3.xyz, R3, R0, c[12].zwzw;
MUL R2.xyz, R1, c[0].zwzw;
ADD R2.xyz, R2, c[11].xyxw;
MAD R2.xyz, R2, R1, c[11].zwzw;
MAD R2.xyz, R2, R1, c[12].xyxw;
MAD R3.xyz, R3, R0, c[10].wzww;
SLT R4.x, R1.w, c[0].y;
SGE R4.yz, R1.w, c[13].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[10].wzww;
DP3 R1.w, R3, -R0;
MAD R0.xyz, R2, R1, c[12].zwzw;
MAD R1.xyz, R0, R1, c[10].wzww;
SGE R0.yz, R0.w, c[13].xxyw;
SLT R0.x, R0.w, c[0].y;
DP3 R2.y, R0, c[10].wzww;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R1.w, R1, c[8].x;
MAD R0.z, R0.x, c[8].x, R1.w;
MOV R1, c[9];
MAD R0.w, R1, c[5].x, R0.z;
MAD R0.xy, vertex.texcoord[1], c[7], c[7].zwzw;
MAD R1.z, R1, c[5].x, R0;
ADD result.texcoord[0].w, R0.y, R0;
MAD R0.w, R1.x, c[5].x, R0.z;
ADD result.texcoord[0].z, R0.x, R1;
MAD R0.xy, vertex.texcoord[0], c[6], c[6].zwzw;
MAD R0.z, R1.y, c[5].x, R0;
ADD result.texcoord[0].y, R0, R0.z;
ADD result.texcoord[0].x, R0, R0.w;
MOV result.texcoord[1], vertex.color.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 53 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Vector 5 [_MainTex_ST]
Vector 6 [_DetailTex_ST]
Vector 7 [_WaveUvs]
Vector 8 [_MoveUvs]
"vs_2_0
def c9, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c10, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c11, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dcl_color0 v3
mul r0.y, v0.x, c7.w
mov r0.x, c4
mad r0.x, c7.z, r0, r0.y
mad r0.z, r0.x, c11.x, c11.y
mul r0.y, v0, c7.w
mov r0.x, c4
mad r0.x, c7.y, r0, r0.y
frc r0.y, r0.z
mad r0.x, r0, c11, c11.y
mad r1.y, r0, c11.z, c11.w
frc r1.x, r0
sincos r0.xy, r1.y, c10.xyzw, c9.xyzw
mad r0.x, r1, c11.z, c11.w
sincos r1.xy, r0.x, c10.xyzw, c9.xyzw
mul r0.x, r0.y, c7
mad r0.x, r1.y, c7, r0
mov r0.z, c4.x
mad r1.x, c8.z, r0.z, r0
mad r0.zw, v2.xyxy, c6.xyxy, c6
mov r0.y, c4.x
mad r0.y, c8.w, r0, r0.x
add oT0.w, r0, r0.y
add oT0.z, r0, r1.x
mov r0.z, c4.x
mad r0.w, c8.x, r0.z, r0.x
mov r0.y, c4.x
mad r0.z, c8.y, r0.y, r0.x
mad r0.xy, v1, c5, c5.zwzw
add oT0.y, r0, r0.z
add oT0.x, r0, r0.w
mov oT1, v3.w
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
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Vector 64 [_WaveUvs]
Vector 80 [_MoveUvs]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjkjbfpkgffcmjjlhfmknfjfamdfmflhiabaaaaaabaaeaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefckeacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaabgbfbaaaaaaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaal
dcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaajgifcaaaaaaaaaaaaeaaaaaa
egaabaaaaaaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
aaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaal
pcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaafaaaaaa
agaabaaaaaaaaaaadcaaaaaldcaabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaaaaaaaaahdccabaaaabaaaaaa
egaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaaaaaaaah
mccabaaaabaaaaaakgaobaaaaaaaaaaaagaebaaaaaaaaaaadgaaaaafpccabaaa
acaaaaaapgbpbaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Vector 64 [_WaveUvs]
Vector 80 [_MoveUvs]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedpiccanjmodkfidgcjnbfpohfgmcdjllcabaaaaaamaagaaaaaeaaaaaa
daaaaaaanmacaaaaiiafaaaafaagaaaaebgpgodjkeacaaaakeacaaaaaaacpopp
emacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaabaa
acaaabaaaaaaaaaaaaaaaeaaacaaadaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaa
acaaaaaaaeaaagaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafakaaapkaidpjccdo
aaaaiadonlapmjeanlapejmafbaaaaafalaaapkagdibihlekblfmpdhlkajlglk
kekkckdnfbaaaaafamaaapkaaaaaaalpaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaafaaaaadaaaaadiaaaaaobjaadaappkaabaaaaac
abaaabiaafaaaakaaeaaaaaeaaaaadiaabaaaaiaadaaojkaaaaaoeiaaeaaaaae
aaaaadiaaaaaoeiaakaaaakaakaaffkabdaaaaacaaaaadiaaaaaoeiaaeaaaaae
aaaaadiaaaaaoeiaakaakkkaakaappkaafaaaaadaaaaadiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaamiaaaaaeeiaalaaaakaalaaffkaaeaaaaaeaaaaamiaaaaaeeia
aaaaoeiaalaakkkaaeaaaaaeaaaaamiaaaaaeeiaaaaaoeiaalaappkaaeaaaaae
aaaaamiaaaaaeeiaaaaaoeiaamaaaakaaeaaaaaeaaaaadiaaaaaoeiaaaaaooia
amaaffkaafaaaaadaaaaadiaaaaaoeiaadaaaakaacaaaaadaaaaabiaaaaaffia
aaaaaaiaaeaaaaaeaaaaapiaabaaaaiaaeaaoekaaaaaaaiaaeaaaaaeabaaadia
adaaoejaabaaoekaabaaookaacaaaaadaaaaadoaaaaaoeiaabaaoeiaaeaaaaae
aaaaadiaaeaaoejaacaaoekaacaaookaacaaaaadaaaaamoaaaaaoeiaaaaaeeia
afaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
ajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaappjappppaaaafdeieefc
keacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
bgbfbaaaaaaaaaaapgipcaaaaaaaaaaaaeaaaaaadcaaaaaldcaabaaaaaaaaaaa
agiacaaaabaaaaaaaaaaaaaajgifcaaaaaaaaaaaaeaaaaaaegaabaaaaaaaaaaa
enaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaaaaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalpcaabaaaaaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaafaaaaaaagaabaaaaaaaaaaa
dcaaaaaldcaabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaa
ogikcaaaaaaaaaaaabaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaaaaaaaahmccabaaaabaaaaaa
kgaobaaaaaaaaaaaagaebaaaaaaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaa
afaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaa
faaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Multiplier]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0..1] };
TEMP R0;
TEMP R1;
TEX R1, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R0, R0, R1;
MUL R0, R0, fragment.texcoord[1];
MUL R0, R0, c[1];
MUL result.color, R0, c[0].x;
END
# 6 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Multiplier]
Vector 1 [_Color]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s1
add_pp r0, r1, r0
mul_pp r0, r0, t1
mul r0, r0, c1
mul r0, r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 112
Float 48 [_Multiplier]
Vector 96 [_Color]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmboeofcjbnhapddofajkbpmmkdnbhjbdabaaaaaabiacaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceaabaaaaeaaaaaaafaaaaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaaaaaaaaaagaaaaaadiaaaaaipccabaaaaaaaaaaa
egaobaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 112
Float 48 [_Multiplier]
Vector 96 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlbihajljpakmfcglgmbmljmblmhimekbabaaaaaaceadaaaaaeaaaaaa
daaaaaaadiabaaaaiaacaaaapaacaaaaebgpgodjaaabaaaaaaabaaaaaaacpppp
lmaaaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaaaagaaabaaabaaaaaaaaaaaaacpppp
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaabiaaaaakklaabaaaaac
aaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaacaaaaadaaaacpiaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaoeiaabaaoelaafaaaaadaaaaapiaaaaaoeiaabaaoekaafaaaaadaaaacpia
aaaaoeiaaaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefceaabaaaa
eaaaaaaafaaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaagaaaaaadiaaaaai
pccabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaadoaaaaab
ejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
fmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
Fallback "Transparent/Diffuse"
}