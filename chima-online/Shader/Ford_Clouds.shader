//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Clouds" {
Properties {
 _MainTex ("Main Texture", 2D) = "black" {}
 _DetailTex ("Animated Texture", 2D) = "white" {}
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _ScrollXB ("Detail TextureB Scroll Speed X", Float) = 1
 _ScrollYB ("Detail TextureB Scroll Speed Y", Float) = 1
 _MainTextureMul ("Main Texture Multiplier", Float) = 1
 _DetailTextureMul ("Detail Texture Multiplier", Float) = 1
 _InvFadeParemeter ("Edge blend effect Range", Range(0,1)) = 0.5
 _Color ("Color", Color) = (1,1,1,1)
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
 _VertAnimSpeedB ("Vertical Vertex Animation Speed", Float) = 100
 _VertAnimDisplacementB ("Vertical Vertex Animation Displacement", Float) = 0.1
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent-1" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent-1" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_Time]
Vector 6 [_ProjectionParams]
Float 7 [_VertAnimSpeed]
Float 8 [_VertAnimDisplacement]
Float 9 [_VertAnimSpeedB]
Float 10 [_VertAnimDisplacementB]
Float 11 [_ScrollX]
Float 12 [_ScrollY]
Float 13 [_ScrollXB]
Float 14 [_ScrollYB]
Vector 15 [_MainTex_ST]
Vector 16 [_DetailTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.position, c[5];
MUL R0.y, R0.x, c[9].x;
MAD R0.y, R0, c[0].z, -c[0].w;
FRC R1.w, R0.y;
ADD R1.xyz, -R1.w, c[17];
MUL R0.w, R0.x, c[7].x;
MUL R2.xyz, R1, R1;
MUL R0.xyz, R2, c[0].xyxw;
MAD R0.w, R0, c[0].z, -c[0];
FRC R0.w, R0;
ADD R1.xyz, -R0.w, c[17];
ADD R0.xyz, R0, c[18].xyxw;
MAD R0.xyz, R0, R2, c[18].zwzw;
MAD R0.xyz, R0, R2, c[19].xyxw;
MAD R3.xyz, R0, R2, c[19].zwzw;
MUL R1.xyz, R1, R1;
MUL R0.xyz, R1, c[0].xyxw;
MAD R3.xyz, R3, R2, c[17].wzww;
ADD R2.xyz, R0, c[18].xyxw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[20].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].wzww;
DP3 R1.w, R3, -R0;
MAD R0.xyz, R2, R1, c[18].zwzw;
MAD R0.xyz, R0, R1, c[19].xyxw;
MAD R0.xyz, R0, R1, c[19].zwzw;
MAD R0.xyz, R0, R1, c[17].wzww;
SLT R1.x, R0.w, c[0].w;
SGE R1.yz, R0.w, c[20].xxyw;
DP3 R1.y, R1, c[17].wzww;
MOV R2.y, c[14].x;
MOV R2.x, c[13];
MUL R2.xy, R2, c[5];
FRC R2.xy, R2;
MAD R2.zw, vertex.texcoord[1].xyxy, c[16].xyxy, c[16];
ADD R2.xy, R2.zwzw, R2;
MAD result.texcoord[0].zw, R1.w, c[10].x, R2.xyxy;
DP3 R1.w, R0, -R1;
MAD R0.zw, vertex.texcoord[0].xyxy, c[15].xyxy, c[15];
MOV R2.y, c[12].x;
MOV R2.x, c[11];
MUL R2.xy, R2, c[5];
FRC R0.xy, R2;
ADD R2.xy, R0.zwzw, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[17].y;
MUL R1.y, R1, c[6].x;
MAD result.texcoord[0].xy, R1.w, c[8].x, R2;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[1], vertex.color.w;
MOV result.texcoord[3].zw, R0;
END
# 56 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Vector 5 [_ProjectionParams]
Vector 6 [_ScreenParams]
Float 7 [_VertAnimSpeed]
Float 8 [_VertAnimDisplacement]
Float 9 [_VertAnimSpeedB]
Float 10 [_VertAnimDisplacementB]
Float 11 [_ScrollX]
Float 12 [_ScrollY]
Float 13 [_ScrollXB]
Float 14 [_ScrollYB]
Vector 15 [_MainTex_ST]
Vector 16 [_DetailTex_ST]
"vs_2_0
def c17, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c18, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c19, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dcl_color0 v3
add r1.z, v0.x, c4.x
mul r0.x, r1.z, c9
mad r0.x, r0, c19, c19.y
frc r0.x, r0
mad r2.w, r0.x, c19.z, c19
sincos r0.xy, r2.w, c18.xyzw, c17.xyzw
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r2.xyz, r1.xyww, c17.w
mul r0.w, r2.y, c5.x
mov r0.z, r2.x
mul r0.x, r1.z, c7
mad oT3.xy, r2.z, c6.zwzw, r0.zwzw
mad r0.x, r0, c19, c19.y
frc r0.x, r0
mad r1.z, r0.x, c19, c19.w
mad r0.zw, v2.xyxy, c16.xyxy, c16
mov r2.y, c14.x
mov r2.x, c13
mul r2.xy, r2, c4
frc r2.xy, r2
add r0.zw, r0, r2.xyxy
mad oT0.zw, r0.y, c10.x, r0
sincos r0.xy, r1.z, c18.xyzw, c17.xyzw
dp4 r1.z, v0, c2
mov r0.w, c12.x
mov r0.z, c11.x
mul r0.zw, r0, c4.xyxy
frc r2.xy, r0.zwzw
mad r0.zw, v1.xyxy, c15.xyxy, c15
add r0.zw, r0, r2.xyxy
mad oT0.xy, r0.y, c8.x, r0.zwzw
mov oPos, r1
mov oT1, v3.w
mov oT3.zw, r1
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 16 [_VertAnimSpeed]
Float 20 [_VertAnimDisplacement]
Float 24 [_VertAnimSpeedB]
Float 28 [_VertAnimDisplacementB]
Float 32 [_ScrollX]
Float 36 [_ScrollY]
Float 40 [_ScrollXB]
Float 44 [_ScrollYB]
Vector 48 [_MainTex_ST]
Vector 64 [_DetailTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedihojcmdcnpjbajhckliomlfgakhnhkcbabaaaaaaneaeaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
faadaaaaeaaaabaaneaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
diaaaaajpcaabaaaacaaaaaaegiocaaaaaaaaaaaacaaaaaaegiecaaaabaaaaaa
aaaaaaaabkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaaaaaaaaahdcaabaaa
abaaaaaaegaabaaaabaaaaaaegaabaaaacaaaaaaaaaaaaaiecaabaaaabaaaaaa
akbabaaaaaaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaaimcaabaaaabaaaaaa
kgakbaaaabaaaaaaagiicaaaaaaaaaaaabaaaaaaenaaaaagmcaabaaaabaaaaaa
aanaaaaakgaobaaaabaaaaaadcaaaaakdccabaaaabaaaaaakgakbaaaabaaaaaa
fgifcaaaaaaaaaaaabaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaabaaaaaa
egbabaaaaeaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
aaaaaaahdcaabaaaabaaaaaaogakbaaaacaaaaaaegaabaaaabaaaaaadcaaaaak
mccabaaaabaaaaaapgapbaaaabaaaaaapgipcaaaaaaaaaaaabaaaaaaagaebaaa
abaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaaafaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Float 16 [_VertAnimSpeed]
Float 20 [_VertAnimDisplacement]
Float 24 [_VertAnimSpeedB]
Float 28 [_VertAnimDisplacementB]
Float 32 [_ScrollX]
Float 36 [_ScrollY]
Float 40 [_ScrollXB]
Float 44 [_ScrollYB]
Vector 48 [_MainTex_ST]
Vector 64 [_DetailTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgijidbifdmachandeaehdmalmhmpgcflabaaaaaajaahaaaaaeaaaaaa
daaaaaaaoiacaaaaeaagaaaaaiahaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
fiacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaidpjccdo
aaaaaadpnlapmjeanlapejmafbaaaaafalaaapkaabannalfgballglhklkkckdl
ijiiiidjfbaaaaafamaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaacaaaaadaaaaabiaaaaaaajaafaaaakaafaaaaad
aaaaadiaaaaaaaiaabaaoikaaeaaaaaeaaaaadiaaaaaoeiaanaaaakaanaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiaanaakkkaanaappka
cfaaaaaeabaaaciaaaaaaaiaalaaoekaamaaoekacfaaaaaeacaaaciaaaaaffia
alaaoekaamaaoekaaeaaaaaeaaaaadiaadaaoejaadaaoekaadaaookaabaaaaac
adaaadiaafaaoekaafaaaaadadaaapiaadaaeeiaacaaoekabdaaaaacadaaapia
adaaoeiaacaaaaadaaaaadiaaaaaoeiaadaaoeiaaeaaaaaeaaaaadoaabaaffia
abaaffkaaaaaoeiaaeaaaaaeaaaaadiaaeaaoejaaeaaoekaaeaaookaacaaaaad
aaaaadiaadaaooiaaaaaoeiaaeaaaaaeaaaaamoaacaaffiaabaappkaaaaaeeia
afaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaagaaaakaafaaaaad
abaaaiiaabaaaaiaanaaffkaafaaaaadabaaafiaaaaapeiaanaaffkaacaaaaad
acaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacabaaapoa
afaappjappppaaaafdeieefcfaadaaaaeaaaabaaneaaaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldcaabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadiaaaaajpcaabaaaacaaaaaaegiocaaaaaaaaaaa
acaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaaaaaaaaahdcaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaacaaaaaa
aaaaaaaiecaabaaaabaaaaaaakbabaaaaaaaaaaaakiacaaaabaaaaaaaaaaaaaa
diaaaaaimcaabaaaabaaaaaakgakbaaaabaaaaaaagiicaaaaaaaaaaaabaaaaaa
enaaaaagmcaabaaaabaaaaaaaanaaaaakgaobaaaabaaaaaadcaaaaakdccabaaa
abaaaaaakgakbaaaabaaaaaafgifcaaaaaaaaaaaabaaaaaaegaabaaaabaaaaaa
dcaaaaaldcaabaaaabaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaaaaaaaaahdcaabaaaabaaaaaaogakbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaapgapbaaaabaaaaaapgipcaaa
aaaaaaaaabaaaaaaagaebaaaabaaaaaadgaaaaafpccabaaaacaaaaaapgbpbaaa
afaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
heaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_ZBufferParams]
Float 1 [_InvFadeParemeter]
Float 2 [_MainTextureMul]
Float 3 [_DetailTextureMul]
Vector 4 [_Color]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[5] = { program.local[0..4] };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[3], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1, c[3].x;
MAD R0.xyz, R0, c[2].x, R1;
MAD R0.w, R2.x, c[0].z, c[0];
RCP R0.w, R0.w;
ADD R0.w, R0, -fragment.texcoord[3].z;
MUL_SAT R0.w, R0, c[1].x;
MUL R0.w, R0.x, R0;
MUL R1.xyz, c[4], c[4];
MUL result.color.w, R0, fragment.texcoord[1].x;
ADD result.color.xyz, R0, R1;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ZBufferParams]
Float 1 [_InvFadeParemeter]
Float 2 [_MainTextureMul]
Float 3 [_DetailTextureMul]
Vector 4 [_Color]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl t0
dcl t1.x
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
mul r1.xyz, r1, c3.x
mad r1.xyz, r2, c2.x, r1
mul_sat r0.x, r0, c1
mul r0.x, r1, r0
mul_pp r2.xyz, c4, c4
add r1.xyz, r1, r2
mul r1.w, r0.x, t1.x
mov_pp oC0, r1
"
}
SubProgram "d3d11 " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
ConstBuffer "$Globals" 112
Float 80 [_InvFadeParemeter]
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedkbbmoipcgckenggocihmdhebipegnhfkabaaaaaahaadaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apabaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefciaacaaaaeaaaaaaakaaaaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadbcbabaaa
acaaaaaagcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaaahaaaaaaakaabaaa
aaaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackbabaiaebaaaaaaadaaaaaadicaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaai
ocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaa
fgaobaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaalhccabaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaaegiccaaa
aaaaaaaaagaaaaaajgahbaaaaaaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_DetailTex] 2D 2
ConstBuffer "$Globals" 112
Float 80 [_InvFadeParemeter]
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefieceddidkkplfbhlhcagplfjpmnkmdnjldhgjabaaaaaabmafaaaaaeaaaaaa
daaaaaaaniabaaaagaaeaaaaoiaeaaaaebgpgodjkaabaaaakaabaaaaaaacpppp
fiabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaafaaacaaaaaaaaaaaaaaabaaahaaabaaacaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadia
aaaappiaacaaoelaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaappla
ecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaacaioeka
ecaaaaadacaacpiaaaaaoelaabaioekaaeaaaaaeabaaaiiaacaakkkaaaaaaaia
acaappkaagaaaaacabaaciiaabaappiaacaaaaadabaaaiiaabaappiaacaakklb
afaaaaadabaadiiaabaappiaaaaaaakaafaaaaadaaaaahiaabaaoeiaaaaakkka
aeaaaaaeaaaaahiaacaaoeiaaaaaffkaaaaaoeiaafaaaaadaaaaaiiaabaappia
aaaaaaiaaeaaaaaeabaachiaabaaoekaabaaoekaaaaaoeiaafaaaaadabaaciia
aaaappiaabaaaalaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefciaacaaaa
eaaaaaaakaaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadbcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaa
ckiacaaaabaaaaaaahaaaaaaakaabaaaaaaaaaaadkiacaaaabaaaaaaahaaaaaa
aoaaaaakbcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
akaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaia
ebaaaaaaadaaaaaadicaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaa
kgikcaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaa
abaaaaaafgifcaaaaaaaaaaaafaaaaaafgaobaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaalhccabaaaaaaaaaaa
egiccaaaaaaaaaaaagaaaaaaegiccaaaaaaaaaaaagaaaaaajgahbaaaaaaaaaaa
diaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaacaaaaaadoaaaaab
ejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapabaaaaheaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Transparent/Diffuse"
}