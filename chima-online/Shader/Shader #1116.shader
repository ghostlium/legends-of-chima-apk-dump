//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "VFX_Displaced_Additive" {
Properties {
 _Diffuse ("_Diffuse", 2D) = "white" {}
 _MainColor ("Main Color", Color) = (1,1,1,1)
 _Intensity ("_Intensity", Range(0,5)) = 1
 _Diffuse2 ("_Diffuse2", 2D) = "black" {}
 _SecondColor ("Second Color", Color) = (0,0,0,1)
 _Distortion ("_Distortion", 2D) = "black" {}
 _UScroll ("_U Scroll Speed", Float) = 0
 _VScroll ("_V Scroll Spedd", Float) = 0
 _U_Distortion ("_U_Distortion", Range(0,1)) = 0
 _V_Distortion ("_V_Distortion", Range(0,1)) = 0
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha One
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
eefieceddolmmcahcgjmjpiinclfhjokihhgamkaabaaaaaaaeacaaaaadaaaaaa
cmaaaaaakaaaaaaapiaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaaaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcaeabaaaa
eaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaacaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedlfkcgifjpgpncnfigmnbfdfbngenmafkabaaaaaanmacaaaaaeaaaaaa
daaaaaaaaeabaaaabaacaaaaieacaaaaebgpgodjmmaaaaaammaaaaaaaaacpopp
jiaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaacaaoeja
ppppaaaafdeieefcaeabaaaaeaaaabaaebaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaacaaaaaadoaaaaabejfdeheogmaaaaaaadaaaaaaaiaaaaaa
faaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaahaaaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfcee
aaklklklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_Time]
Vector 1 [_MainColor]
Vector 2 [_SecondColor]
Float 3 [_U_Distortion]
Float 4 [_V_Distortion]
Float 5 [_UScroll]
Float 6 [_VScroll]
Float 7 [_Intensity]
SetTexture 0 [_Distortion] 2D 0
SetTexture 1 [_Diffuse] 2D 1
SetTexture 2 [_Diffuse2] 2D 2
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 0.5, 1 } };
TEMP R0;
TEMP R1;
MOV R0.y, c[6].x;
MOV R0.x, c[5];
ADD R0.z, -fragment.texcoord[0].y, c[8].y;
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R0.xy, fragment.texcoord[0], R0;
TEX R0.x, R0, texture[0], 2D;
MUL R0.y, R0.x, c[4].x;
ADD R0.x, R0, -c[8];
MUL R0.x, R0, c[3];
MAD R0.xy, R0, R0.z, fragment.texcoord[0];
TEX R1, R0, texture[2], 2D;
TEX R0, R0, texture[1], 2D;
MUL R1, R1, c[2];
MUL R1.w, R1, c[2];
MUL R1.xyz, R1, R1.w;
MUL R0, R0, c[1];
MUL R0, R0, c[7].x;
MUL R0, R0, c[1].w;
MOV R1.w, c[8].y;
ADD result.color, R0, R1;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_Time]
Vector 1 [_MainColor]
Vector 2 [_SecondColor]
Float 3 [_U_Distortion]
Float 4 [_V_Distortion]
Float 5 [_UScroll]
Float 6 [_VScroll]
Float 7 [_Intensity]
SetTexture 0 [_Distortion] 2D 0
SetTexture 1 [_Diffuse] 2D 1
SetTexture 2 [_Diffuse2] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c8, -0.50000000, 1.00000000, 0, 0
dcl t0.xy
mov r1.x, c0
mov r0.x, c0
mul r0.y, c6.x, r1.x
mul r0.x, c5, r0
add r0.xy, t0, r0
texld r0, r0, s0
add r1.x, r0, c8
mul r1.y, r0.x, c4.x
mul r1.x, r1, c3
add r0.x, -t0.y, c8.y
mad r0.xy, r1, r0.x, t0
texld r1, r0, s2
texld r0, r0, s1
mul r2, r1, c2
mul r1, r0, c1
mul r0.x, r2.w, c2.w
mul r1, r1, c7.x
mul_pp r0.xyz, r2, r0.x
mul r1, r1, c1.w
mov_pp r0.w, c8.y
add_pp r0, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_Distortion] 2D 2
SetTexture 1 [_Diffuse] 2D 0
SetTexture 2 [_Diffuse2] 2D 1
ConstBuffer "$Globals" 80
Vector 16 [_MainColor]
Vector 32 [_SecondColor]
Float 48 [_U_Distortion]
Float 52 [_V_Distortion]
Float 56 [_UScroll]
Float 60 [_VScroll]
Float 64 [_Intensity]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedmdbfnkddodfiiimhdmbgejggeenmbpgcabaaaaaahiadaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcliacaaaa
eaaaaaaakoaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaal
dcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaogikcaaaaaaaaaaaadaaaaaa
egbabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaalpdiaaaaaidcaabaaaabaaaaaabgafbaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaaaaaaaaibcaabaaaaaaaaaaabkbabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaaegaabaaaabaaaaaaagaabaaa
aaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaadgaaaaafhcaabaaaacaaaaaa
egacbaaaabaaaaaadgaaaaagicaabaaaacaaaaaadkiacaaaaaaaaaaaacaaaaaa
diaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaacaaaaaa
diaaaaahbcaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaacaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpdcaaaaakpccabaaaaaaaaaaaegaobaaaaaaaaaaa
pgipcaaaaaaaaaaaabaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_Distortion] 2D 2
SetTexture 1 [_Diffuse] 2D 0
SetTexture 2 [_Diffuse2] 2D 1
ConstBuffer "$Globals" 80
Vector 16 [_MainColor]
Vector 32 [_SecondColor]
Float 48 [_U_Distortion]
Float 52 [_V_Distortion]
Float 56 [_UScroll]
Float 60 [_VScroll]
Float 64 [_Intensity]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefieceddpgpdimdiehobfaahaonihlpdmffpjfiabaaaaaahaafaaaaaeaaaaaa
daaaaaaaceacaaaaoeaeaaaadmafaaaaebgpgodjomabaaaaomabaaaaaaacpppp
keabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaabaaaaaa
acababaaaaacacaaaaaaabaaaeaaaaaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaa
aaacppppfbaaaaafafaaapkaaaaaaalpaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaabaaaaacaaaaamiaacaaoekaafaaaaadaaaaabia
aaaakkiaaeaaaakaafaaaaadaaaaaciaaaaappiaaeaaaakaacaaaaadaaaaadia
aaaaoeiaaaaaoelaecaaaaadaaaaapiaaaaaoeiaacaioekaacaaaaadaaaaacia
aaaaaaiaafaaaakaafaaaaadabaaaciaaaaaaaiaacaaffkaafaaaaadabaaabia
aaaaffiaacaaaakaacaaaaadaaaaabiaaaaafflbafaaffkaaeaaaaaeaaaaadia
abaaoeiaaaaaaaiaaaaaoelaecaaaaadabaaapiaaaaaoeiaabaioekaecaaaaad
aaaaapiaaaaaoeiaaaaioekaafaaaaadaaaaapiaaaaaoeiaaaaaoekaafaaaaad
aaaaapiaaaaaoeiaadaaaakaabaaaaacacaaahiaabaaoeiaabaaaaacacaaaiia
abaappkaafaaaaadacaacpiaacaaoeiaabaaoekaafaaaaadacaaaiiaabaappia
acaappiaafaaaaadabaachiaacaappiaacaaoeiaabaaaaacabaaciiaafaaffka
aeaaaaaeaaaacpiaaaaaoeiaaaaappkaabaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcliacaaaaeaaaaaaakoaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaadcaaaaaldcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaa
ogikcaaaaaaaaaaaadaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaalpdiaaaaaidcaabaaaabaaaaaa
bgafbaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaaibcaabaaaaaaaaaaa
bkbabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajdcaabaaaaaaaaaaa
egaabaaaabaaaaaaagaabaaaaaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
dgaaaaafhcaabaaaacaaaaaaegacbaaaabaaaaaadgaaaaagicaabaaaacaaaaaa
dkiacaaaaaaaaaaaacaaaaaadiaaaaaipcaabaaaacaaaaaaegaobaaaacaaaaaa
egiocaaaaaaaaaaaacaaaaaadiaaaaahbcaabaaaabaaaaaadkaabaaaabaaaaaa
dkaabaaaacaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaakpccabaaa
aaaaaaaaegaobaaaaaaaaaaapgipcaaaaaaaaaaaabaaaaaaegaobaaaabaaaaaa
doaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}