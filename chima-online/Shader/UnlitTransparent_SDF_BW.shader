//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent SDF B&W" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("SDF Texture (A)", 2D) = "white" {}
 _Smoothness ("Smoothness", Range(0,1)) = 0.5
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
"!!ARBvp1.0
PARAM c[5] = { program.local[0],
		state.matrix.mvp };
MOV result.color, vertex.color;
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 6 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
mov oD0, v2
mov oT0.xy, v1
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0
eefiecedaecmkfackfdnjoikpcimidpmmfffmfhdabaaaaaaeiacaaaaadaaaaaa
cmaaaaaajmaaaaaabaabaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaagcaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaepfdeheo
gmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaagfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcdaabaaaaeaaaabaaemaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedebfponefkelienihfbfeflohfjhkefknabaaaaaadiadaaaaaeaaaaaa
daaaaaaabmabaaaafeacaaaameacaaaaebgpgodjoeaaaaaaoeaaaaaaaaacpopp
laaaaaaadeaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaabaadaaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjaafaaaaadaaaaapiaaaaaffja
acaaoekaaeaaaaaeaaaaapiaabaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
adaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaabaaoejaabaaaaacabaaapoaacaaoejappppaaaafdeieefc
daabaaaaeaaaabaaemaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaabaaaaaafpaaaaadpcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaabaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaacaaaaaadoaaaaabejfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaagcaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaafaepfdejfeejepeoaafeeffiedepepfceeaaedep
emepfcaaepfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaagfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Smoothness]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 2, 3 } };
TEMP R0;
TEX R0.w, fragment.texcoord[0], texture[0], 2D;
MOV R0.y, c[0].x;
MAD R0.x, R0.y, -c[1], c[1];
MAD R0.y, R0, c[1].x, -R0.x;
ADD R0.y, R0, c[1].x;
RCP R0.y, R0.y;
ADD R0.x, R0.w, -R0;
MUL_SAT R0.x, R0, R0.y;
MAD R0.y, -R0.x, c[1], c[1].z;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MUL result.color.w, fragment.color.primary, R0.x;
MOV result.color.xyz, fragment.color.primary;
END
# 13 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Smoothness]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, -0.50000000, 0.50000000, 2.00000000, 3.00000000
dcl t0.xy
dcl v0
texld r0, t0, s0
mov r0.x, c0
mad r0.x, r0, c1, -c1
mov r0.y, c1
mad r1.x, c0, r0.y, -r0
add r1.x, r1, c1.y
add r0.x, r0.w, -r0
rcp r1.x, r1.x
mul_sat r1.x, r0, r1
mad r0.x, -r1, c1.z, c1.w
mul r1.x, r1, r1
mul r0.x, r1, r0
mov r1.xyz, v0
mul r1.w, v0, r0.x
mov oC0, r1
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 32
Float 16 [_Smoothness]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlkfnibnnjpgkcbnomldapgamcdgmppppabaaaaaamiacaaaaadaaaaaa
cmaaaaaakaaaaaaaneaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaagfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcomabaaaaeaaaaaaa
hlaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaadcaaaaak
bcaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpdcaaaaalccaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaaadpaaaaaaaibcaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaaakaabaaaaaaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaai
ccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkaabaaaabaaaaaadicaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajccaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahiccabaaaaaaaaaaa
akaabaaaaaaaaaaadkbabaaaacaaaaaadgaaaaafhccabaaaaaaaaaaaegbcbaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 32
Float 16 [_Smoothness]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgpamfbnhijnhdebfklhhmcfgeeadeblfabaaaaaaciaeaaaaaeaaaaaa
daaaaaaaimabaaaaiaadaaaapeadaaaaebgpgodjfeabaaaafeabaaaaaaacpppp
caabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadpaaaaaama
aaaaeaeaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaajaaaaiapkaecaaaaadaaaaapiaaaaaoelaaaaioekaabaaaaac
aaaaabiaabaaaakaaeaaaaaeaaaaaciaaaaaaakaaaaaaaiaaaaaaaiaaeaaaaae
aaaaabiaaaaaaakaaaaaaaibaaaaaaiaacaaaaadaaaaaciaaaaaaaibaaaaffia
agaaaaacaaaaaciaaaaaffiaacaaaaadaaaaabiaaaaaaaibaaaappiaafaaaaad
aaaabbiaaaaaffiaaaaaaaiaaeaaaaaeaaaaaciaaaaaaaiaabaaffkaabaakkka
afaaaaadaaaaabiaaaaaaaiaaaaaaaiaafaaaaadaaaaabiaaaaaaaiaaaaaffia
afaaaaadaaaaaiiaaaaaaaiaabaapplaabaaaaacaaaaahiaabaaoelaabaaaaac
aaaiapiaaaaaoeiappppaaaafdeieefcomabaaaaeaaaaaaahlaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaadcaaaaakbcaabaaaaaaaaaaa
akiacaaaaaaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdcaaaaal
ccaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaaadpaaaaaaaibcaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
akaabaaaaaaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkaabaaaabaaaaaadicaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafhccabaaaaaaaaaaaegbcbaaaacaaaaaadoaaaaab
ejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
gfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
Fallback "Unlit/Transparent Colored"
}