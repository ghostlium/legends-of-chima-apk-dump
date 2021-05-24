//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Shockwave" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Animated Texture", 2D) = "white" {}
 _DetailTexScaleUvs ("Detail layer Scale Uvs", Float) = 5
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _Scroll2X ("Detail layer Scroll speed X", Float) = 1
 _Scroll2Y ("Detail layer Scroll speed Y", Float) = 0
 _Multiplier ("Color multiplier", Float) = 1
 _FresnelPower ("Fresnel Power", Float) = 0.8
 _TintColor ("Color", Color) = (1,1,1,1)
 _BaseOpacity ("Base Opacity", Float) = 0.5
 _MasterOpacity ("Master Opacity", Float) = 1
 _DetailTexOpacity ("Detail Texture Opacity", Float) = 0.5
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
 _VertAnimSpeedB ("Vertical Vertex Animation Speed", Float) = 100
 _VertAnimDisplacementB ("Vertical Vertex Animation Displacement", Float) = 0.1
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
  Blend SrcAlpha OneMinusSrcAlpha
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
Float 12 [_BaseOpacity]
Float 13 [_MasterOpacity]
Float 14 [_FresnelPower]
Float 15 [_DetailTexScaleUvs]
Float 16 [_VertAnimSpeed]
Float 17 [_VertAnimDisplacement]
Float 18 [_VertAnimSpeedB]
Float 19 [_VertAnimDisplacementB]
Vector 20 [_MainTex_ST]
Vector 21 [_DetailTex_ST]
Float 22 [_ScrollX]
Float 23 [_ScrollY]
Float 24 [_Scroll2X]
Float 25 [_Scroll2Y]
"!!ARBvp1.0
PARAM c[30] = { { 0.15915491, 0.25, 24.980801, -24.980801 },
		state.matrix.mvp,
		program.local[5..25],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MOV R1.w, c[26].z;
MOV R1.xyz, c[10];
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
MAD R1.xyz, R0, c[11].w, -vertex.position;
DP3 R0.x, R1, R1;
RSQ R0.y, R0.x;
MUL R4.xyz, R0.y, R1;
ADD R0.x, vertex.position.y, c[9].z;
MUL R0.y, R0.x, c[18].x;
MAD R0.y, R0, c[0].x, -c[0];
FRC R1.w, R0.y;
ADD R0.x, vertex.position.y, c[9];
MUL R0.x, R0, c[16];
MAD R0.x, R0, c[0], -c[0].y;
FRC R0.w, R0.x;
ADD R1.xyz, -R1.w, c[26];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].zwzw;
ADD R1.xyz, -R0.w, c[26];
ADD R3.xyz, R2, c[27].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[27].zwzw;
MAD R3.xyz, R3, R0, c[28].xyxw;
MAD R3.xyz, R3, R0, c[28].zwzw;
MUL R2.xyz, R1, c[0].zwzw;
ADD R2.xyz, R2, c[27].xyxw;
MAD R2.xyz, R2, R1, c[27].zwzw;
MAD R2.xyz, R2, R1, c[28].xyxw;
MAD R3.xyz, R3, R0, c[26].wzww;
SLT R5.x, R1.w, c[0].y;
SGE R5.yz, R1.w, c[29].xxyw;
MOV R0.xz, R5;
DP3 R0.y, R5, c[26].wzww;
DP3 R1.w, R3, -R0;
MAD R0.xyz, R2, R1, c[28].zwzw;
MAD R0.xyz, R0, R1, c[26].wzww;
SLT R1.x, R0.w, c[0].y;
SGE R1.yz, R0.w, c[29].xxyw;
MOV R2.xz, R1;
DP3 R2.y, R1, c[26].wzww;
DP3 R0.x, R0, -R2;
MUL R1.w, R1, c[19].x;
MAD R0.z, R0.x, c[17].x, R1.w;
DP3 R0.w, R4, vertex.normal;
DP4 R0.y, vertex.position, c[2];
DP4 R0.x, vertex.position, c[1];
ADD result.position.xy, R0, R0.z;
ADD R0.y, -R0.w, c[26].z;
MUL R0.x, vertex.color.w, c[12];
POW R0.y, R0.y, c[14].x;
MUL R0.x, R0, c[13];
MUL result.texcoord[1], R0.x, R0.y;
MOV R0.y, c[25].x;
MOV R0.x, c[24];
MUL R0.zw, R0.xyxy, c[9].xyxy;
MOV R0.y, c[23].x;
MOV R0.x, c[22];
MUL R1.xy, R0, c[9];
FRC R0.zw, R0;
MAD R0.xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[0].zw, R0.xyxy, c[15].x, R0;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[0], c[20], c[20].zwzw;
ADD result.texcoord[0].xy, R0, R0.zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
END
# 68 instructions, 6 R-regs
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
Float 11 [_BaseOpacity]
Float 12 [_MasterOpacity]
Float 13 [_FresnelPower]
Float 14 [_DetailTexScaleUvs]
Float 15 [_VertAnimSpeed]
Float 16 [_VertAnimDisplacement]
Float 17 [_VertAnimSpeedB]
Float 18 [_VertAnimDisplacementB]
Vector 19 [_MainTex_ST]
Vector 20 [_DetailTex_ST]
Float 21 [_ScrollX]
Float 22 [_ScrollY]
Float 23 [_Scroll2X]
Float 24 [_Scroll2Y]
"vs_2_0
def c25, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c26, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c27, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mov r1.xyz, c9
mov r1.w, c25.z
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
mad r0.xyz, r0, c10.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r0.x, r0, v1
add r1.x, -r0, c25.z
pow r0, r1.x, c13.x
mov r0.z, r0.x
mul r0.y, v3.w, c11.x
mul r0.y, r0, c12.x
add r0.x, v0.y, c8.z
mul oT1, r0.y, r0.z
mul r0.y, r0.x, c17.x
add r0.x, v0.y, c8
mad r0.y, r0, c27.x, c27
frc r0.y, r0
mul r0.x, r0, c15
mad r0.x, r0, c27, c27.y
mad r1.y, r0, c27.z, c27.w
frc r1.x, r0
sincos r0.xy, r1.y, c26.xyzw, c25.xyzw
mad r0.x, r1, c27.z, c27.w
sincos r1.xy, r0.x, c26.xyzw, c25.xyzw
mul r0.x, r0.y, c18
mad r0.z, r1.y, c16.x, r0.x
dp4 r0.y, v0, c1
dp4 r0.x, v0, c0
add oPos.xy, r0, r0.z
mov r0.w, c22.x
mov r0.z, c21.x
mul r1.xy, r0.zwzw, c8
mov r0.y, c24.x
mov r0.x, c23
mul r0.xy, r0, c8
frc r0.zw, r0.xyxy
mad r0.xy, v2, c20, c20.zwzw
mad oT0.zw, r0.xyxy, c14.x, r0
frc r0.zw, r1.xyxy
mad r0.xy, v2, c19, c19.zwzw
add oT0.xy, r0, r0.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 160
Float 40 [_BaseOpacity]
Float 44 [_MasterOpacity]
Float 80 [_FresnelPower]
Float 84 [_DetailTexScaleUvs]
Float 88 [_VertAnimSpeed]
Float 92 [_VertAnimDisplacement]
Float 96 [_VertAnimSpeedB]
Float 100 [_VertAnimDisplacementB]
Vector 112 [_MainTex_ST]
Vector 128 [_DetailTex_ST]
Float 144 [_ScrollX]
Float 148 [_ScrollY]
Float 152 [_Scroll2X]
Float 156 [_Scroll2Y]
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
eefiecedcahkhlgkbmbemkiklbgkiafkbeackeapabaaaaaabeakaaaaaeaaaaaa
daaaaaaaoiadaaaanmaiaaaakeajaaaaebgpgodjlaadaaaalaadaaaaaaacpopp
eaadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaacaa
abaaabaaaaaaaaaaaaaaafaaafaaacaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaa
abaaaeaaabaaaiaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaaacaabaaaafaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaiadpidpjccdoaaaaaadp
aaaaaaaafbaaaaafbdaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
beaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafbfaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadiaadaaoejaaeaaoekaaeaaookaabaaaaacabaaadiaahaaoekaafaaaaad
abaaapiaabaaeeiaagaaoekabdaaaaacabaaapiaabaaoeiaacaaaaadaaaaadoa
aaaaoeiaabaaoeiaaeaaaaaeaaaaadiaadaaoejaafaaoekaafaaookaaeaaaaae
aaaaamoaaaaaeeiaacaaffkaabaaoeiaabaaaaacaaaaahiaaiaaoekaafaaaaad
abaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaaliaanaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiaapaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
baaaoekaaeaaaaaeaaaaahiaaaaaoeiabbaappkaaaaaoejbceaaaaacabaaahia
aaaaoeiaaiaaaaadaaaaabiaabaaoeiaacaaoejaacaaaaadaaaaabiaaaaaaaib
bcaaaakacaaaaaadabaaabiaaaaaaaiaacaaaakaafaaaaadaaaaabiaafaappja
abaakkkaafaaaaadaaaaabiaaaaaaaiaabaappkaafaaaaadabaaapoaabaaaaia
aaaaaaiaacaaaaadaaaaadiaaaaaffjaahaaoikaafaaaaadaaaaaciaaaaaffia
adaaaakaafaaaaadaaaaabiaaaaaaaiaacaakkkaaeaaaaaeaaaaabiaaaaaaaia
bcaaffkabcaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabiaaaaaaaia
bdaaaakabdaaffkacfaaaaaeabaaaciaaaaaaaiabeaaoekabfaaoekaaeaaaaae
aaaaabiaaaaaffiabcaaffkabcaakkkabdaaaaacaaaaabiaaaaaaaiaaeaaaaae
aaaaabiaaaaaaaiabdaaaakabdaaffkacfaaaaaeacaaaciaaaaaaaiabeaaoeka
bfaaoekaafaaaaadaaaaabiaacaaffiaadaaffkaaeaaaaaeaaaaabiaabaaffia
acaappkaaaaaaaiaafaaaaadabaaapiaaaaaffjaakaaoekaaeaaaaaeabaaapia
ajaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaapiaalaaoekaaaaakkjaabaaoeia
aeaaaaaeabaaapiaamaaoekaaaaappjaabaaoeiaacaaaaadaaaaadiaaaaaaaia
abaaoeiaaeaaaaaeaaaaadmaabaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
abaaoeiappppaaaafdeieefcomaeaaaaeaaaabaadlabaaaafjaaaaaeegiocaaa
aaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
giaaaaacacaaaaaaaaaaaaaidcaabaaaaaaaaaaafgbfbaaaaaaaaaaaigiacaaa
abaaaaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaagaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
aaaaaaaaafaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaagaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaa
bkaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaahdccabaaaaaaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadgaaaaaf
mccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaj
pcaabaaaabaaaaaaegiocaaaaaaaaaaaajaaaaaaegiecaaaabaaaaaaaaaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaa
egaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaak
mccabaaaabaaaaaaagaebaaaaaaaaaaafgifcaaaaaaaaaaaafaaaaaakgaobaaa
abaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaaaaaaaaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkiacaaaaaaaaaaaacaaaaaadiaaaaah
pccabaaaacaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_DetailTexOpacity]
Vector 1 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0..1] };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
MUL R1.xyz, R1, c[1];
MUL R0.xyz, R0, c[1];
MAD result.color.xyz, R0, c[0].x, R1;
MOV result.color.w, fragment.texcoord[1].x;
END
# 6 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_DetailTexOpacity]
Vector 1 [_TintColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1.x
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mul r1.xyz, r1, c1
texld r0, r0, s1
mul r0.xyz, r0, c1
mad r0.xyz, r0, c0.x, r1
mov_pp r0.w, t1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
ConstBuffer "$Globals" 160
Float 48 [_DetailTexOpacity]
Vector 64 [_TintColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpioflojoaepmijgmgobjgofbccdgckfoabaaaaaabmadaaaaaeaaaaaa
daaaaaaacmabaaaahiacaaaaoiacaaaaebgpgodjpeaaaaaapeaaaaaaaaacpppp
lmaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaacaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaabaaaaacaaaaabiaaaaakklaabaaaaacaaaaaciaaaaapplaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaahiaaaaaoeiaabaaoekaafaaaaadabaaahiaabaaoeiaabaaoekaaeaaaaae
aaaachiaaaaaoeiaaaaaaakaabaaoeiaabaaaaacaaaaciiaabaaaalaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefceeabaaaaeaaaaaaafbaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadbcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaakbabaaaacaaaaaadoaaaaabejfdeheogiaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapabaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}