//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Surface_2Uvs_Glow" {
Properties {
 _ColorAtlas ("Color (RGB), Matcap_M (A) UV1", 2D) = "white" {}
 _Matcap ("Matcap (RGB)", 2D) = "black" {}
 _EmissiveStrength ("Emissive Strength", Float) = 0
 _EmissiveMul ("Emissive Multiplier", Float) = 1
 _EmissiveColor ("Emissive Color", Color) = (0,0,0,0)
 _Gloss ("Gloss", Float) = 0.25
 _Fresnel ("Fresnel", Float) = 5
 _Spec ("Spec", Float) = 0.5
 _FresnelIntensity ("Fresnel Intensity", Float) = 3
 _FeedbackColor ("Feedback Color", Color) = (0.098,0.098,0.098,1)
}
SubShader { 
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"!!ARBvp1.0
PARAM c[27] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[26].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[21];
DP4 R2.y, R0, c[20];
DP4 R2.x, R0, c[19];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[24];
DP4 R0.y, R1, c[23];
DP4 R0.x, R1, c[22];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[25];
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[26].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[18];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[5].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
"vs_2_0
def c26, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c25.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mov r0.w, c26.y
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c20
dp4 r2.y, r0, c19
dp4 r2.x, r0, c18
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c23
dp4 r0.y, r1, c22
dp4 r0.x, r1, c21
mul r1.xyz, r0.w, c24
add r0.xyz, r2, r0
add oT4.xyz, r0, r1
mov r0.w, c26.y
mov r0.xyz, c16
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c25.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c17, r0
mov r0, c13
dp4 r4.y, c17, r0
mov r1, c12
dp4 r4.x, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT5.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT5.z, v2, r3
dp3 oT5.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c26.x, c26.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjlcfnkponfeghcokfnedpbdbbeagkkifabaaaaaalaamaaaaaeaaaaaa
daaaaaaaemaeaaaabialaaaaoaalaaaaebgpgodjbeaeaaaabeaeaaaaaaacpopp
jiadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaacgaaahaaadaaaaaaaaaa
acaaaaaaaeaaakaaaaaaaaaaacaaaiaaadaaaoaaaaaaaaaaacaaamaaadaabbaa
aaaaaaaaacaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaapaaoekaaeaaaaae
aaaaadiaaoaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabaaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabjaaaakabjaaaakaabaaaaacaaaaapia
acaaoekaafaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeabaaahiabeaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabhaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
abaaaaacaaaaahiaabaaoekaafaaaaadacaaahiaaaaaffiabfaaoekaaeaaaaae
aaaaaliabeaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiabhaaoekaaeaaaaaeaaaaahiaaaaaoeia
biaappkaaaaaoejbaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
acaaoejabiaappkaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaalia
bbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeia
abaaaaacaaaaaiiabjaaffkaajaaaaadabaaabiaadaaoekaaaaaoeiaajaaaaad
abaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeiaafaaaaad
acaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaad
adaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaae
aaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaajaaoekaaaaaaaia
abaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcmeagaaaaeaaaabaalbabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaa
agbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaa
acaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
acaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
afaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 18 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..18] };
TEMP R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 10 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Vector 16 [unity_LightmapST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c17.x, c17.x
mad oT3.xy, v4, c16, c16.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedemhfpfgiielikmabdhcknodhbghaghlhabaaaaaageafaaaaaeaaaaaa
daaaaaaaliabaaaapmadaaaameaeaaaaebgpgodjiaabaaaaiaabaaaaaaacpopp
deabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaiaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaaiaaadaaagaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafajaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaahaaoeka
aeaaaaaeaaaaadiaagaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaiaaoeka
acaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiaajaaaakaajaaaakaaeaaaaae
abaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaadaaoeka
aeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaeaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcdmacaaaa
eaaaabaaipaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaalaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaagiaaaaacabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
abaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaabaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaamadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
"!!ARBvp1.0
PARAM c[28] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[27].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MOV R0.w, c[0].y;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[22];
DP4 R2.y, R0, c[21];
DP4 R2.x, R0, c[20];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[25];
DP4 R0.y, R1, c[24];
DP4 R0.x, R1, c[23];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[26];
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[27].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MOV result.position, R0;
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[5].y, R1, R2;
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 52 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
"vs_2_0
def c28, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c27.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mov r0.w, c28.y
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c22
dp4 r2.y, r0, c21
dp4 r2.x, r0, c20
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c25
dp4 r0.y, r1, c24
dp4 r0.x, r1, c23
mul r1.xyz, r0.w, c26
add r0.xyz, r2, r0
add oT4.xyz, r0, r1
mov r0.w, c28.y
mov r0.xyz, c16
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c27.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c19, r0
mov r0, c13
dp4 r4.y, c19, r0
mov r1, c12
dp4 r4.x, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c28.x
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT5.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT5.z, v2, r3
dp3 oT5.x, v1, r3
mad oT6.xy, r1.z, c18.zwzw, r1
mov oT6.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c28.x, c28.x
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedlaclhoaejjdglphiifbebaimiiedeekpabaaaaaakmanaaaaaeaaaaaa
daaaaaaajiaeaaaapmalaaaameamaaaaebgpgodjgaaeaaaagaaeaaaaaaacpopp
oeadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaabaacgaaahaaaeaaaaaaaaaa
acaaaaaaaeaaalaaaaaaaaaaacaaaiaaadaaapaaaaaaaaaaacaaamaaadaabcaa
aaaaaaaaacaabaaaafaabfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjabaaaoekaaeaaaaae
aaaaadiaapaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabbaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabkaaaakabkaaaakaabaaaaacaaaaapia
adaaoekaafaaaaadabaaahiaaaaaffiabgaaoekaaeaaaaaeabaaahiabfaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabiaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
abaaaaacaaaaahiaabaaoekaafaaaaadacaaahiaaaaaffiabgaaoekaaeaaaaae
aaaaaliabfaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiabhaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiabiaaoekaaeaaaaaeaaaaahiaaaaaoeia
bjaappkaaaaaoejbaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
acaaoejabjaappkaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
abaaaaacaaaaaiiabkaaffkaajaaaaadabaaabiaaeaaoekaaaaaoeiaajaaaaad
abaaaciaafaaoekaaaaaoeiaajaaaaadabaaaeiaagaaoekaaaaaoeiaafaaaaad
acaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaahaaoekaacaaoeiaajaaaaad
adaaaciaaiaaoekaacaaoeiaajaaaaadadaaaeiaajaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaae
aaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaakaaoekaaaaaaaia
abaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaaka
afaaaaadabaaaiiaabaaaaiabkaaaakaafaaaaadabaaafiaaaaapeiabkaaaaka
acaaaaadafaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcfmahaaaa
eaaaabaanhabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacagaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaa
egiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
abaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaacaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaa
adaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
acaaaaaaegadbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaa
diaaaaahpcaabaaaaeaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaai
bcaabaaaafaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaai
ccaabaaaafaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaai
ecaabaaaafaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaah
hcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaa
abaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaaabaaaaaa
akaabaaaacaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaacaaaaaabdaaaaaa
dcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaneaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaaneaaaaaa
agaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 17 [_ProjectionParams]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[19], c[19].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_LightmapST]
"vs_2_0
def c19, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT4.xy, r1.z, c17.zwzw, r1
mov oT4.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c19.x, c19.x
mad oT3.xy, v4, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 192 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedilgfkedaidlnbbcbbenakmgglhlcnfclabaaaaaahmagaaaaaeaaaaaa
daaaaaaabaacaaaapmaeaaaameafaaaaebgpgodjniabaaaaniabaaaaaaacpopp
iaabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaamaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaaiaaadaaahaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafakaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaad
aaaaadiaacaaffjaaiaaoekaaeaaaaaeaaaaadiaahaaoekaacaaaajaaaaaoeia
aeaaaaaeaaaaadiaajaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeia
akaaaakaakaaaakaaeaaaaaeabaaamoaaeaabejaabaabekaabaalekaafaaaaad
aaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiaakaaaakaafaaaaadabaaafiaaaaapeiaakaaaakaacaaaaadacaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoeja
abaaaaacaaaaamoaaeaabejappppaaaafdeieefcoeacaaaaeaaaabaaljaaaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaaalaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaa
agbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaacaaaaaaegiacaaa
acaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaa
acaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaaamaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaacaaaaaaamadaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_4LightPosX0]
Vector 20 [unity_4LightPosY0]
Vector 21 [unity_4LightPosZ0]
Vector 22 [unity_4LightAtten0]
Vector 23 [unity_LightColor0]
Vector 24 [unity_LightColor1]
Vector 25 [unity_LightColor2]
Vector 26 [unity_LightColor3]
Vector 27 [unity_SHAr]
Vector 28 [unity_SHAg]
Vector 29 [unity_SHAb]
Vector 30 [unity_SHBr]
Vector 31 [unity_SHBg]
Vector 32 [unity_SHBb]
Vector 33 [unity_SHC]
Vector 34 [unity_Scale]
"!!ARBvp1.0
PARAM c[35] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..34] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[34].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[20];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[19];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[21];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[22];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[24];
MAD R1.xyz, R0.x, c[23], R1;
MAD R0.xyz, R0.z, c[25], R1;
MAD R1.xyz, R0.w, c[26], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[32];
DP4 R3.y, R0, c[31];
DP4 R3.x, R0, c[30];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[33];
MOV R1.w, c[0].y;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[34].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[18];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP3 result.texcoord[3].y, R3, R0;
DP3 result.texcoord[5].y, R0, R2;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 78 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_4LightPosX0]
Vector 19 [unity_4LightPosY0]
Vector 20 [unity_4LightPosZ0]
Vector 21 [unity_4LightAtten0]
Vector 22 [unity_LightColor0]
Vector 23 [unity_LightColor1]
Vector 24 [unity_LightColor2]
Vector 25 [unity_LightColor3]
Vector 26 [unity_SHAr]
Vector 27 [unity_SHAg]
Vector 28 [unity_SHAb]
Vector 29 [unity_SHBr]
Vector 30 [unity_SHBg]
Vector 31 [unity_SHBb]
Vector 32 [unity_SHC]
Vector 33 [unity_Scale]
"vs_2_0
def c34, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c33.w
dp4 r0.x, v0, c9
add r1, -r0.x, c19
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c18
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c34.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c20
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c21
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c34.y
dp4 r2.z, r4, c28
dp4 r2.y, r4, c27
dp4 r2.x, r4, c26
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c34.z
mul r0, r0, r1
mul r1.xyz, r0.y, c23
mad r1.xyz, r0.x, c22, r1
mad r0.xyz, r0.z, c24, r1
mad r1.xyz, r0.w, c25, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c31
dp4 r3.y, r0, c30
dp4 r3.x, r0, c29
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c32
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add oT4.xyz, r0, r1
mov r1.w, c34.y
mov r1.xyz, c16
dp4 r0.z, r1, c14
dp4 r0.y, r1, c13
dp4 r0.x, r1, c12
mad r3.xyz, r0, c33.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c17, r0
mov r0, c12
dp4 r4.x, c17, r0
mov r1, c13
dp4 r4.y, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT5.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT5.z, v2, r3
dp3 oT5.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c34.x, c34.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedoneghiemhfloghmmcfeefedfnlhkpbmnabaaaaaapibbaaaaaeaaaaaa
daaaaaaaeeagaaaagabaaaaacibbaaaaebgpgodjamagaaaaamagaaaaaaacpopp
jaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaa
abaacgaaahaaalaaaaaaaaaaacaaaaaaaeaabcaaaaaaaaaaacaaaiaaadaabgaa
aaaaaaaaacaaamaaajaabjaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjabhaaoekaaeaaaaae
aaaaadiabgaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabiaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiaccaaaakaccaaaakaabaaaaacaaaaapia
acaaoekaafaaaaadabaaahiaaaaaffiaboaaoekaaeaaaaaeabaaahiabnaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabpaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiacaaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
abaaaaacaaaaahiaabaaoekaafaaaaadacaaahiaaaaaffiaboaaoekaaeaaaaae
aaaaaliabnaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiabpaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiacaaaoekaaeaaaaaeaaaaahiaaaaaoeia
cbaappkaaaaaoejbaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
aaaaffjabkaaoekaaeaaaaaeaaaaahiabjaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiablaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaappja
aaaaoeiaacaaaaadabaaapiaaaaakkibafaaoekaacaaaaadacaaapiaaaaaaaib
adaaoekaacaaaaadaaaaapiaaaaaffibaeaaoekaafaaaaadadaaahiaacaaoeja
cbaappkaafaaaaadaeaaahiaadaaffiabkaaoekaaeaaaaaeadaaaliabjaakeka
adaaaaiaaeaakeiaaeaaaaaeadaaahiablaaoekaadaakkiaadaapeiaafaaaaad
aeaaapiaaaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaacaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaia
aeaaoeiaaeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapia
abaaoeiaabaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaacia
aaaaffiaahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaac
aeaaaciaccaaffkaaeaaaaaeaaaaapiaaaaaoeiaagaaoekaaeaaffiaafaaaaad
abaaapiaabaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiaccaakkkaagaaaaac
acaaabiaaaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkia
agaaaaacacaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaad
abaaahiaaaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoeka
aaaappiaaaaaoeiaabaaaaacadaaaiiaccaaffkaajaaaaadabaaabiaalaaoeka
adaaoeiaajaaaaadabaaaciaamaaoekaadaaoeiaajaaaaadabaaaeiaanaaoeka
adaaoeiaafaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaaoaaoeka
acaaoeiaajaaaaadaeaaaciaapaaoekaacaaoeiaajaaaaadaeaaaeiabaaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffia
adaaffiaaeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahia
bbaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
ppppaaaafdeieefcbeakaaaaeaaaabaaifacaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacahaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaa
pgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaai
hcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaacaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
acaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaa
egiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaa
egaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaa
aeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaa
abaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaa
egiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaa
agaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaa
adaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaaf
pcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaa
adaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
adaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaa
egiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaa
agaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
aaaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
"!!ARBvp1.0
PARAM c[36] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..35] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[35].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[21];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[20];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[22];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[23];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[25];
MAD R1.xyz, R0.x, c[24], R1;
MAD R0.xyz, R0.z, c[26], R1;
MAD R1.xyz, R0.w, c[27], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[33];
DP4 R3.y, R0, c[32];
DP4 R3.x, R0, c[31];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[34];
MOV R1.w, c[0].y;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R4, c[30];
DP4 R2.y, R4, c[29];
DP4 R2.x, R4, c[28];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[4].xyz, R0, R1;
MOV R1.xyz, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[35].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[19];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP3 result.texcoord[3].y, R3, R0;
DP3 result.texcoord[5].y, R0, R2;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[5].z, vertex.normal, R2;
DP3 result.texcoord[5].x, vertex.attrib[14], R2;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.texcoord[6].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 83 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
"vs_2_0
def c36, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c35.w
dp4 r0.x, v0, c9
add r1, -r0.x, c21
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c20
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c36.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c22
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c23
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c36.y
dp4 r2.z, r4, c30
dp4 r2.y, r4, c29
dp4 r2.x, r4, c28
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c36.z
mul r0, r0, r1
mul r1.xyz, r0.y, c25
mad r1.xyz, r0.x, c24, r1
mad r0.xyz, r0.z, c26, r1
mad r1.xyz, r0.w, c27, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c33
dp4 r3.y, r0, c32
dp4 r3.x, r0, c31
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c34
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add oT4.xyz, r0, r1
mov r1.w, c36.y
mov r1.xyz, c16
dp4 r0.z, r1, c14
dp4 r0.y, r1, c13
dp4 r0.x, r1, c12
mad r3.xyz, r0, c35.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c19, r0
mov r0, c12
dp4 r4.x, c19, r0
mov r1, c13
dp4 r4.y, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c36.x
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT5.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT5.z, v2, r3
dp3 oT5.x, v1, r3
mad oT6.xy, r1.z, c18.zwzw, r1
mov oT6.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c36.x, c36.x
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
Vector 32 [unity_4LightPosX0]
Vector 48 [unity_4LightPosY0]
Vector 64 [unity_4LightPosZ0]
Vector 80 [unity_4LightAtten0]
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfpdmffogbcfnennhiepmgpkfildinoliabaaaaaapebcaaaaaeaaaaaa
daaaaaaajaagaaaaeebbaaaaambcaaaaebgpgodjfiagaaaafiagaaaaaaacpopp
nmafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaabaaadaaaaaaaaaaabaaacaaaiaaaeaaaaaaaaaa
abaacgaaahaaamaaaaaaaaaaacaaaaaaaeaabdaaaaaaaaaaacaaaiaaadaabhaa
aaaaaaaaacaaamaaajaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafcdaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjabiaaoekaaeaaaaae
aaaaadiabhaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabjaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiacdaaaakacdaaaakaabaaaaacaaaaapia
adaaoekaafaaaaadabaaahiaaaaaffiabpaaoekaaeaaaaaeabaaahiaboaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiacaaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiacbaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
abaaaaacaaaaahiaabaaoekaafaaaaadacaaahiaaaaaffiabpaaoekaaeaaaaae
aaaaaliaboaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahiacaaaoekaaaaakkia
aaaapeiaacaaaaadaaaaahiaaaaaoeiacbaaoekaaeaaaaaeaaaaahiaaaaaoeia
ccaappkaaaaaoejbaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
aaaaffjablaaoekaaeaaaaaeaaaaahiabkaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiabmaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappja
aaaaoeiaacaaaaadabaaapiaaaaakkibagaaoekaacaaaaadacaaapiaaaaaaaib
aeaaoekaacaaaaadaaaaapiaaaaaffibafaaoekaafaaaaadadaaahiaacaaoeja
ccaappkaafaaaaadaeaaahiaadaaffiablaaoekaaeaaaaaeadaaaliabkaakeka
adaaaaiaaeaakeiaaeaaaaaeadaaahiabmaaoekaadaakkiaadaapeiaafaaaaad
aeaaapiaaaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaacaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaia
aeaaoeiaaeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapia
abaaoeiaabaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaacia
aaaaffiaahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaac
aeaaaciacdaaffkaaeaaaaaeaaaaapiaaaaaoeiaahaaoekaaeaaffiaafaaaaad
abaaapiaabaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiacdaakkkaagaaaaac
acaaabiaaaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkia
agaaaaacacaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaakaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaalaaoeka
aaaappiaaaaaoeiaabaaaaacadaaaiiacdaaffkaajaaaaadabaaabiaamaaoeka
adaaoeiaajaaaaadabaaaciaanaaoekaadaaoeiaajaaaaadabaaaeiaaoaaoeka
adaaoeiaafaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaapaaoeka
acaaoeiaajaaaaadaeaaaciabaaaoekaacaaoeiaajaaaaadaeaaaeiabbaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffia
adaaffiaaeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahia
bcaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaaaaaffjabeaaoekaaeaaaaaeaaaaapiabdaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiabfaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabgaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiacdaaaakaafaaaaadabaaafiaaaaapeiacdaaaakaacaaaaadafaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoeja
abaaaaacaaaaamoaaeaabejappppaaaafdeieefckmakaaaaeaaaabaaklacaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacaiaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaacaaaaaa
egiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaa
egiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaa
abeaaaaaaaaaiadpdiaaaaaihcaabaaaadaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaaadaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaadaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaadaaaaaaegaibaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaadaaaaaaegadbaaaadaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaa
aeaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaa
egiocaaaabaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaa
egiocaaaabaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaa
egiocaaaabaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaa
egacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
acaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaacaaaaaa
akaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaabaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaaeaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaeaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaeaaaaaaaaaaaaajpcaabaaaafaaaaaa
fgafbaiaebaaaaaaaeaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaa
agaaaaaafgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaafaaaaaa
egaobaaaafaaaaaaegaobaaaafaaaaaaaaaaaaajpcaabaaaahaaaaaaagaabaia
ebaaaaaaaeaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaa
kgakbaiaebaaaaaaaeaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaa
agaaaaaaegaobaaaahaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaaeaaaaaakgakbaaaacaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaafaaaaaaegaobaaaahaaaaaaegaobaaaahaaaaaaegaobaaa
afaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
egaobaaaafaaaaaaeeaaaaafpcaabaaaafaaaaaaegaobaaaaeaaaaaadcaaaaan
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaeaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaeaaaaaadiaaaaahpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaafaaaaaadeaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaaeaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaa
aeaaaaaafgafbaaaacaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaa
aeaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaacaaaaaaegacbaaaaeaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaacaaaaaa
egacbaaaaeaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaajaaaaaa
pgapbaaaacaaaaaaegacbaaaacaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaa
egacbaaaacaaaaaaaaaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaa
abaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahaiaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Float 5 [_EmissiveStrength]
Float 6 [_EmissiveMul]
Vector 7 [_FeedbackColor]
Vector 8 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
"!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 10, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.xyz, R1, c[7];
RSQ R0.w, R0.w;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R0.w, fragment.texcoord[5], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV R0.x, c[9].w;
MUL R0.z, R0.x, c[3].x;
MAX R0.x, R0.y, c[9].z;
POW R0.y, R0.x, R0.z;
MAD R0.x, -R0.w, fragment.texcoord[5].z, c[9].y;
ADD R0.z, -R0.y, c[4].x;
POW R0.x, R0.x, c[2].x;
MAD R0.w, R0.x, R0.z, R0.y;
MOV R0.xyz, c[10];
DP3 R1.w, R0, c[0];
MUL R0.w, R0, R1;
MAX R2.x, fragment.texcoord[3].z, c[9].z;
MUL R0.xyz, R2.x, c[0];
MUL R0, R0, c[10].w;
MUL R0.w, R0, c[1].x;
MUL R2.xyz, R0, R0.w;
MUL R1.xyz, R1, c[9].x;
MAD R0.xyz, R1, R0, R2;
MOV R1.w, c[6].x;
ADD R0.w, fragment.texcoord[1].y, c[5].x;
MUL R2.xyz, R1.w, c[8];
SGE R0.w, R0, c[9].y;
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, fragment.texcoord[4], R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[9].y;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Float 5 [_EmissiveStrength]
Float 6 [_EmissiveMul]
Vector 7 [_FeedbackColor]
Vector 8 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
"ps_2_0
dcl_2d s0
def c9, 10.00000000, 1.00000000, 0.00000000, 128.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 2.00000000
def c11, -1.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r3, t0, s0
dp3_pp r0.x, t5, t5
rsq_pp r0.x, r0.x
mov_pp r1.xyz, t3
mad_pp r1.xyz, r0.x, t5, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
mov_pp r1.x, c3
max_pp r2.x, r0.z, c9.z
mul_pp r1.x, c9.w, r1
pow r4.x, r2.x, r1.x
mad_pp r0.x, -r0, t5.z, c9.y
pow_pp r1.w, r0.x, c2.x
mov r0.x, r4.x
add r2.x, -r0, c4
mad r0.x, r1.w, r2, r0
mov_pp r1.xyz, c0
dp3_pp r1.x, c10, r1
max_pp r2.x, t3.z, c9.z
mul_pp r2.xyz, r2.x, c0
mul r2.w, r0.x, r1.x
mul_pp r1, r2, c10.w
mul_pp r0.x, r1.w, c1
mul_pp r2.xyz, r3, c7
mul_pp r2.xyz, r2, c9.x
mul_pp r0.xyz, r1, r0.x
mad_pp r0.xyz, r2, r1, r0
mad_pp r1.xyz, r2, t4, r0
add r0.x, t1.y, c5
mov r2.xyz, c8
add r0.x, r0, c11
mul r2.xyz, c6.x, r2
cmp r0.x, r0, c9.y, c9.z
mul r0.xyz, r0.x, r2
mov_pp r0.w, c9.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Float 64 [_Gloss]
Float 68 [_Fresnel]
Float 72 [_Spec]
Float 76 [_FresnelIntensity]
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjaillchjkpcbnfbklbojdmobnaebiikfabaaaaaaniaiaaaaaeaaaaaa
daaaaaaaciadaaaaneahaaaakeaiaaaaebgpgodjpaacaaaapaacaaaaaaacpppp
laacaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaaeaaaeaaabaaaaaaaaaaaaacppppfbaaaaaf
afaaapkaaaaacaebaaaaialpaaaaaaaaaaaaaaedfbaaaaafagaaapkakoehgbdo
pepndedphdgijbdnaaaaaaeabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaaiaaaaadaaaaciia
aeaaoelaaeaaoelaahaaaaacaaaaciiaaaaappiaabaaaaacabaaahiaaeaaoela
aeaaaaaeabaachiaabaaoeiaaaaappiaacaaoelaaeaaaaaeaaaaaiiaaeaakkla
aaaappibafaaffkbcaaaaaadabaaciiaaaaappiaabaaffkaaiaaaaadaaaaciia
abaaoeiaabaaoeiaahaaaaacaaaaciiaaaaappiaafaaaaadaaaaciiaaaaappia
abaakkiaalaaaaadabaaabiaaaaappiaafaakkkaabaaaaacaaaaaiiaafaappka
afaaaaadaaaaaiiaaaaappiaabaakkkacaaaaaadacaaaiiaabaaaaiaaaaappia
bcaaaaaeaaaaaiiaabaappiaabaappkaacaappiaabaaaaacabaaahiaaaaaoeka
aiaaaaadabaacbiaabaaoeiaagaaoekaafaaaaadaaaaciiaaaaappiaabaaaaia
afaaaaadaaaaciiaaaaappiaabaaaakaacaaaaadaaaaciiaaaaappiaaaaappia
afaaaaadabaachiaacaakklaaaaaoekafiaaaaaeabaachiaacaakklaabaaoeia
afaakkkaafaaaaadabaachiaabaaoeiaagaappkaafaaaaadacaachiaaaaappia
abaaoeiaafaaaaadaaaachiaaaaaoeiaadaaoekaafaaaaadaaaachiaaaaaoeia
afaaaakaaeaaaaaeabaachiaaaaaoeiaabaaoeiaacaaoeiaaeaaaaaeaaaachia
aaaaoeiaadaaoelaabaaoeiaacaaaaadaaaaaiiaaaaakklaacaaaakaacaaaaad
aaaaaiiaaaaappiaafaaffkaabaaaaacabaaaciaacaaffkaafaaaaadabaachia
abaaffiaaeaaoekafiaaaaaeabaachiaaaaappiaabaaoeiaafaakkkaacaaaaad
aaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaaiiaafaaffkbabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefckeaeaaaaeaaaaaaacjabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaajocaabaaaaaaaaaaaagbjbaaaafaaaaaaagaabaaaaaaaaaaa
agbjbaaaadaaaaaadcaaaaakbcaabaaaaaaaaaaackbabaiaebaaaaaaafaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
aeaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaa
aaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
cpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaa
ckiacaaaaaaaaaaaaeaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaaaaaaaaajecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaa
aaaaaaaaaeaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaabaaaaaalccaabaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaa
ckbabaaaadaaaaaaabeaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaagaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
egiccaaaaaaaaaaaagaaaaaadiaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaacaebaaaacaebaaaacaebaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaacaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkbabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaabnaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpabaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajhcaabaaaabaaaaaa
fgifcaaaaaaaaaaaafaaaaaaegiccaaaaaaaaaaaahaaaaaadcaaaaajhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EmissiveStrength]
Float 1 [_EmissiveMul]
Vector 2 [_FeedbackColor]
Vector 3 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 8, 1, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[3], texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R1.w, R1;
MOV R1.w, c[1].x;
ADD R0.w, fragment.texcoord[1].y, c[0].x;
MUL R2.xyz, R1.w, c[3];
SGE R0.w, R0, c[4].y;
MUL R2.xyz, R0.w, R2;
MUL R1.xyz, R1, c[4].x;
MUL R0.xyz, R0, c[2];
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[4].z, R2;
MOV result.color.w, c[4].y;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EmissiveStrength]
Float 1 [_EmissiveMul]
Vector 2 [_FeedbackColor]
Vector 3 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c4, 8.00000000, -1.00000000, 1.00000000, 0.00000000
def c5, 10.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3.xy
texld r0, t3, s1
texld r1, t0, s0
mul_pp r0.xyz, r0.w, r0
mov r2.xyz, c3
mul_pp r0.xyz, r0, c4.x
mul_pp r1.xyz, r1, c2
mul_pp r1.xyz, r1, r0
add r0.x, t1.y, c0
add r0.x, r0, c4.y
mul r2.xyz, c1.x, r2
cmp r0.x, r0, c4.z, c4.w
mul r0.xyz, r0.x, r2
mov_pp r0.w, c4.z
mad_pp r0.xyz, r1, c5.x, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 144
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlpidlbkiiaoedcmanlebepkdbbbhlghhabaaaaaakiaeaaaaaeaaaaaa
daaaaaaakiabaaaaneadaaaaheaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
diabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaafaaadaaaaaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaeb
aaaaialpaaaaaaaaaaaaaaebbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaacaaaaad
aaaaaiiaaaaakklaaaaaaakaacaaaaadaaaaabiaaaaappiaadaaffkaabaaaaac
aaaaaciaaaaaffkaafaaaaadaaaacoiaaaaaffiaacaablkafiaaaaaeaaaachia
aaaaaaiaaaaabliaadaakkkaabaaaaacabaaadiaabaabllaecaaaaadabaacpia
abaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaaaaioekaafaaaaadaaaaciia
abaappiaadaappkaafaaaaadabaachiaabaaoeiaaaaappiaafaaaaadacaachia
acaaoeiaabaaoekaafaaaaadacaachiaacaaoeiaadaaaakaaeaaaaaeaaaachia
acaaoeiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaadaaffkbabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcceacaaaaeaaaaaaaijaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadmcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaaaaaaaibcaabaaa
aaaaaaaadkbabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaabnaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajocaabaaaaaaaaaaafgifcaaa
aaaaaaaaafaaaaaaagijcaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaebaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaaaaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaacaaaaaaamamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Float 5 [_EmissiveStrength]
Float 6 [_EmissiveMul]
Vector 7 [_FeedbackColor]
Vector 8 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[11] = { program.local[0..8],
		{ 10, 1, 0, 128 },
		{ 0.2199707, 0.70703125, 0.070983887, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R2.x, fragment.texcoord[6], texture[1], 2D;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.xyz, R1, c[7];
RSQ R0.w, R0.w;
MOV R0.xyz, fragment.texcoord[3];
MAD R0.xyz, R0.w, fragment.texcoord[5], R0;
DP3 R0.x, R0, R0;
RSQ R0.y, R0.x;
MUL R0.y, R0, R0.z;
MOV R0.x, c[9].w;
MUL R0.z, R0.x, c[3].x;
MAX R0.x, R0.y, c[9].z;
POW R0.y, R0.x, R0.z;
MAD R0.x, -R0.w, fragment.texcoord[5].z, c[9].y;
ADD R0.z, -R0.y, c[4].x;
POW R0.x, R0.x, c[2].x;
MAD R0.w, R0.x, R0.z, R0.y;
MOV R0.xyz, c[10];
DP3 R1.w, R0, c[0];
MUL R0.w, R0, R1;
MAX R2.y, fragment.texcoord[3].z, c[9].z;
MUL R0.xyz, R2.y, c[0];
MUL R0, R2.x, R0;
MUL R0, R0, c[10].w;
MUL R0.w, R0, c[1].x;
MUL R2.xyz, R0, R0.w;
MUL R1.xyz, R1, c[9].x;
MAD R0.xyz, R1, R0, R2;
MOV R1.w, c[6].x;
ADD R0.w, fragment.texcoord[1].y, c[5].x;
MUL R2.xyz, R1.w, c[8];
SGE R0.w, R0, c[9].y;
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, fragment.texcoord[4], R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[9].y;
END
# 37 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Float 5 [_EmissiveStrength]
Float 6 [_EmissiveMul]
Vector 7 [_FeedbackColor]
Vector 8 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c9, 10.00000000, 1.00000000, 0.00000000, 128.00000000
def c10, 0.21997070, 0.70703125, 0.07098389, 2.00000000
def c11, -1.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
dcl t6
texld r3, t0, s0
texldp r5, t6, s1
dp3_pp r0.x, t5, t5
rsq_pp r0.x, r0.x
mov_pp r1.xyz, t3
mad_pp r1.xyz, r0.x, t5, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
mov_pp r1.x, c3
max_pp r2.x, r0.z, c9.z
mul_pp r1.x, c9.w, r1
pow r4.w, r2.x, r1.x
mad_pp r0.x, -r0, t5.z, c9.y
pow_pp r2.w, r0.x, c2.x
mov r0.x, r4.w
add r1.x, -r0, c4
mad r0.x, r2.w, r1, r0
mov_pp r4.xyz, c0
dp3_pp r2.x, c10, r4
mul r0.w, r0.x, r2.x
max_pp r1.x, t3.z, c9.z
mul_pp r2.xyz, r3, c7
mul_pp r2.xyz, r2, c9.x
mul_pp r0.xyz, r1.x, c0
mul_pp r0, r5.x, r0
mul_pp r1, r0, c10.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mad_pp r0.xyz, r2, r1, r0
mad_pp r1.xyz, r2, t4, r0
add r0.x, t1.y, c5
mov r2.xyz, c8
add r0.x, r0, c11
mul r2.xyz, c6.x, r2
cmp r0.x, r0, c9.y, c9.z
mul r0.xyz, r0.x, r2
mov_pp r0.w, c9.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 128 [_Gloss]
Float 132 [_Fresnel]
Float 136 [_Spec]
Float 140 [_FresnelIntensity]
Float 144 [_EmissiveStrength]
Float 148 [_EmissiveMul]
Vector 160 [_FeedbackColor]
Vector 176 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbidpbcljabpinjagaglhkaakbjfomdghabaaaaaalmajaaaaaeaaaaaa
daaaaaaahaadaaaakaaiaaaaiiajaaaaebgpgodjdiadaaaadiadaaaaaaacpppp
peacaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaaeaaabaaaaaaaaaaaaacpppp
fbaaaaafafaaapkaaaaacaebaaaaialpaaaaaaaaaaaaaaedfbaaaaafagaaapka
koehgbdopepndedphdgijbdnaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaaiaaaaadaaaaciiaaeaaoelaaeaaoelaahaaaaacaaaacbiaaaaappia
abaaaaacabaaahiaaeaaoelaaeaaaaaeabaachiaabaaoeiaaaaaaaiaacaaoela
aeaaaaaeabaaaiiaaeaakklaaaaaaaibafaaffkbcaaaaaadaaaacbiaabaappia
abaaffkaaiaaaaadaaaacciaabaaoeiaabaaoeiaahaaaaacaaaacciaaaaaffia
afaaaaadaaaacciaaaaaffiaabaakkiaalaaaaadabaaabiaaaaaffiaafaakkka
abaaaaacaaaaaiiaafaappkaafaaaaadaaaaaciaaaaappiaabaakkkacaaaaaad
acaaaiiaabaaaaiaaaaaffiabcaaaaaeabaaabiaaaaaaaiaabaappkaacaappia
abaaaaacaaaaahiaaaaaoekaaiaaaaadaaaacbiaaaaaoeiaagaaoekaafaaaaad
aaaaciiaaaaaaaiaabaaaaiaagaaaaacabaaabiaafaapplaafaaaaadabaaadia
abaaaaiaafaaoelaecaaaaadabaacpiaabaaoeiaaaaioekaecaaaaadacaacpia
aaaaoelaabaioekaacaaaaadacaaciiaabaaaaiaabaaaaiaafaaaaadabaachia
acaakklaaaaaoekafiaaaaaeaaaachiaacaakklaabaaoeiaafaakkkaafaaaaad
aaaacpiaaaaaoeiaacaappiaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaad
abaachiaaaaappiaaaaaoeiaafaaaaadacaachiaacaaoeiaadaaoekaafaaaaad
acaachiaacaaoeiaafaaaakaaeaaaaaeaaaachiaacaaoeiaaaaaoeiaabaaoeia
aeaaaaaeaaaachiaacaaoeiaadaaoelaaaaaoeiaacaaaaadaaaaaiiaaaaakkla
acaaaakaacaaaaadaaaaaiiaaaaappiaafaaffkaabaaaaacabaaaciaacaaffka
afaaaaadabaachiaabaaffiaaeaaoekafiaaaaaeabaachiaaaaappiaabaaoeia
afaakkkaacaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciiaafaaffkb
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcciafaaaaeaaaaaaaekabaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaa
agbjbaaaafaaaaaaagaabaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaakbcaabaaa
aaaaaaaackbabaiaebaaaaaaafaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaackiacaaaaaaaaaaaaiaaaaaaabeaaaaa
aaaaaaeddiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaa
bjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaajecaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaadcaaaaajbcaabaaa
aaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaal
ccaabaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaceaaaaakoehgbdopepndedp
hdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
deaaaaahccaabaaaabaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgafbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadiaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaakhcaabaaa
acaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaebaaaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaegbcbaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaaaabaaaaaaakiacaaa
aaaaaaaaajaaaaaabnaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaajaaaaaaegiccaaaaaaaaaaa
alaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab
ejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaiaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadaaaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaaneaaaaaaagaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EmissiveStrength]
Float 1 [_EmissiveMul]
Vector 2 [_FeedbackColor]
Vector 3 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 8, 2, 10, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[3], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.x, fragment.texcoord[4], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[4].x;
ADD R0.w, fragment.texcoord[1].y, c[0].x;
MUL R2.xyz, R2, c[4].y;
MUL R3.xyz, R1, R3.x;
MIN R1.xyz, R1, R2;
MOV R1.w, c[1].x;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, c[2];
MUL R2.xyz, R1.w, c[3];
SGE R0.w, R0, c[4];
MUL R2.xyz, R0.w, R2;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[4].z, R2;
MOV result.color.w, c[4];
END
# 19 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_EmissiveStrength]
Float 1 [_EmissiveMul]
Vector 2 [_FeedbackColor]
Vector 3 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 8.00000000, 2.00000000, -1.00000000, 10.00000000
def c5, 1.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3.xy
dcl t4
texld r1, t0, s0
texldp r3, t4, s1
texld r0, t3, s2
mul_pp r2.xyz, r0, r3.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c4.x
mul_pp r2.xyz, r2, c4.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r3.x
max_pp r0.xyz, r2, r0
mul_pp r1.xyz, r1, c2
mul_pp r1.xyz, r1, r0
add r0.x, t1.y, c0
mov r2.xyz, c3
add r0.x, r0, c4.z
mul r2.xyz, c1.x, r2
cmp r0.x, r0, c5, c5.y
mul r0.xyz, r0.x, r2
mov_pp r0.w, c5.x
mad_pp r0.xyz, r1, c4.w, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 208
Float 144 [_EmissiveStrength]
Float 148 [_EmissiveMul]
Vector 160 [_FeedbackColor]
Vector 176 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedomfokjjbecmlfmlkgoecgbaecnkiamonabaaaaaaemagaaaaaeaaaaaa
daaaaaaaeaacaaaagaafaaaabiagaaaaebgpgodjaiacaaaaaiacaaaaaaacpppp
mmabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaajaaadaaaaaaaaaaaaaaaaacppppfbaaaaafadaaapka
aaaacaebaaaaialpaaaaaaaaaaaaaaebbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaabaaaaacabaaadiaabaablla
ecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaacaioeka
ecaaaaadacaacpiaaaaaoelaabaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaia
afaaaaadaaaacoiaabaabliaacaappiaafaaaaadabaaciiaabaappiaadaappka
afaaaaadabaachiaabaaoeiaabaappiaakaaaaadadaachiaaaaabliaabaaoeia
afaaaaadaaaachiaaaaaaaiaabaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeia
acaaaaadabaaaiiaaaaakklaaaaaaakaacaaaaadabaaaiiaabaappiaadaaffka
abaaaaacacaaaiiaaaaaffkaafaaaaadaaaachiaacaappiaacaaoekafiaaaaae
aaaachiaabaappiaaaaaoeiaadaakkkaafaaaaadacaachiaacaaoeiaabaaoeka
afaaaaadacaachiaacaaoeiaadaaaakaaeaaaaaeaaaachiaacaaoeiaabaaoeia
aaaaoeiaabaaaaacaaaaaiiaadaaffkbabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcbiadaaaaeaaaaaaamgaaaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadicbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaa
aaaaaaaiicaabaaaaaaaaaaadkbabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaa
bnaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpabaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaajhcaabaaa
abaaaaaafgifcaaaaaaaaaaaajaaaaaaegiccaaaaaaaaaaaalaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaak
hcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaeb
aaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
acaaaaaaamamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT5.z, r0, c18
dp4 oT5.y, r0, c17
dp4 oT5.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT4.y, r2, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecededdeeejbcefenejimpeblighldfnnbncabaaaaaakialaaaaaeaaaaaa
daaaaaaaoaadaaaabaakaaaaniakaaaaebgpgodjkiadaaaakiadaaaaaaacpopp
diadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaaiaaadaaalaaaaaaaaaaadaaamaaajaaaoaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjaamaaoekaaeaaaaaeaaaaadiaalaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaanaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiabhaaaakabhaaaakaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaahiaafaaoekaafaaaaadacaaahiaaaaaffia
bdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
beaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaae
aaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadadaaaboaabaaoejaaaaaoeia
aiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapiaaoaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaae
abaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkia
abaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcciagaaaaeaaaabaaikabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"!!ARBvp1.0
PARAM c[16] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..15] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[13];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[15].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[14];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_2_0
def c15, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.w, c15.y
mov r0.xyz, c12
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c14.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c13, r0
mov r0, c9
dp4 r4.y, c13, r0
mov r1, c8
dp4 r4.x, c13, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c15.x, c15.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedigaamfjfnlkaodnadgchemfnnlkaocaaabaaaaaagaajaaaaaeaaaaaa
daaaaaaaciadaaaaoaahaaaakiaiaaaaebgpgodjpaacaaaapaacaaaaaaacpopp
imacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaaiaaadaaahaaaaaaaaaaacaabaaaafaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
aiaaoekaaeaaaaaeaaaaadiaahaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
ajaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiaapaaaakaapaaaaka
abaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaae
abaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaahiaabaaoekaafaaaaadacaaahiaaaaaffia
alaaoekaaeaaaaaeaaaaaliaakaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
amaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaanaaoekaaeaaaaae
aaaaahiaaaaaoeiaaoaappkaaaaaoejbaiaaaaadadaaaboaabaaoejaaaaaoeia
aiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
aaaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
aaaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP4 R0.w, vertex.position, c[12];
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[5].w, R0, c[20];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp4 r0.w, v0, c11
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.z, v0, c10
dp4 oT5.w, r0, c19
dp4 oT5.z, r0, c18
dp4 oT5.y, r0, c17
dp4 oT5.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT4.y, r2, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedalajnohmgnjomponodgoeplbnfaiakpjabaaaaaakialaaaaaeaaaaaa
daaaaaaaoaadaaaabaakaaaaniakaaaaebgpgodjkiadaaaakiadaaaaaaacpopp
diadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaaiaaadaaalaaaaaaaaaaadaaamaaajaaaoaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjaamaaoekaaeaaaaaeaaaaadiaalaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaanaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiabhaaaakabhaaaakaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaahiaafaaoekaafaaaaadacaaahiaaaaaffia
bdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
beaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaae
aaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadadaaaboaabaaoejaaaaaoeia
aiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapiaaoaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaae
abaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkia
abaaoeiaaeaaaaaeaeaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcciagaaaaeaaaabaaikabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.x, R0, c[13];
DP4 R3.y, R0, c[14];
MAD R0.xyz, R3, c[23].w, -vertex.position;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[5].z, R0, c[19];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
mad r0.xyz, r4, c22.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT5.z, r0, c18
dp4 oT5.y, r0, c17
dp4 oT5.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT4.y, r2, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecededdeeejbcefenejimpeblighldfnnbncabaaaaaakialaaaaaeaaaaaa
daaaaaaaoaadaaaabaakaaaaniakaaaaebgpgodjkiadaaaakiadaaaaaaacpopp
diadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaaiaaadaaalaaaaaaaaaaadaaamaaajaaaoaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjaamaaoekaaeaaaaaeaaaaadiaalaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaanaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiabhaaaakabhaaaakaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaahiaafaaoekaafaaaaadacaaahiaaaaaffia
bdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaacaakeiaaeaaaaaeaaaaahia
beaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaae
aaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadadaaaboaabaaoejaaaaaoeia
aiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapiaaoaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaae
abaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkia
abaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcciagaaaaeaaaabaaikabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceCameraPos]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
"!!ARBvp1.0
PARAM c[24] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[21];
MOV R1.w, c[0].y;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MAD R2.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[15];
DP4 R3.y, R0, c[14];
DP4 R3.x, R0, c[13];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[5].y, R0, c[18];
DP4 result.texcoord[5].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R3, R1;
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, R3, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceCameraPos]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.w, c23.y
mov r0.xyz, c20
dp4 r1.z, r0, c14
dp4 r1.y, r0, c13
dp4 r1.x, r0, c12
mad r3.xyz, r1, c22.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c14
dp4 r4.z, c21, r0
mov r0, c13
dp4 r4.y, c21, r0
mov r1, c12
dp4 r4.x, c21, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT5.y, r0, c17
dp4 oT5.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r4, r2
dp3 oT4.y, r2, r3
dp3 oT3.z, v2, r4
dp3 oT3.x, r4, v1
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c23.x, c23.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedcnicphhfmcfpdjgegeipcompbladlkcaabaaaaaagialaaaaaeaaaaaa
daaaaaaammadaaaanaajaaaajiakaaaaebgpgodjjeadaaaajeadaaaaaaacpopp
ceadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaabaaaeaaabaaafaaaaaaaaaaacaaaaaaabaaagaaaaaaaaaa
adaaaaaaaeaaahaaaaaaaaaaadaaaiaaadaaalaaaaaaaaaaadaaamaaajaaaoaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjaamaaoekaaeaaaaaeaaaaadiaalaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaanaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiabhaaaakabhaaaakaabaaaaacaaaaapiaagaaoekaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeabaaahiabcaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaahiaafaaoeka
afaaaaadacaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaia
acaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaad
adaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaad
adaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaae
aaaaapiaaoaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaappjaaaaaoeiaafaaaaadabaaadia
aaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaiaabaaoeiaaeaaaaae
aaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeabaaamoaaeaabekaaaaappia
aaaaeeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcpmafaaaaeaaaabaahpabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakmccabaaaacaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
agaebaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaa
adaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
adaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaa
aeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaaeaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaacaaaaaaamadaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 1, 128, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.y, R1.x;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R2.xyz, R1.y, fragment.texcoord[3];
RSQ R1.w, R1.x;
MAD R1.xyz, R1.w, fragment.texcoord[4], R2;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].z;
MUL R1.z, R1.x, c[3].x;
MAX R1.x, R1.y, c[6];
POW R1.y, R1.x, R1.z;
MAD R1.x, -R1.w, fragment.texcoord[4].z, c[6].y;
ADD R1.z, -R1.y, c[4].x;
POW R1.x, R1.x, c[2].x;
MAD R1.w, R1.x, R1.z, R1.y;
MOV R1.xyz, c[7];
DP3 R2.x, R1, c[0];
MAX R2.y, R2.z, c[6].x;
MUL R1.w, R1, R2.x;
MUL R1.xyz, R2.y, c[0];
MUL R0.xyz, R0, c[5];
MOV result.color.w, c[6].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R1, R0.w, R1;
MUL R1, R1, c[6].w;
MUL R0.w, R1, c[1].x;
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[7].w, R2;
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c6, 1.00000000, 0.00000000, 128.00000000, 2.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 10.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r3, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
texld r5, r0, s1
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
dp3_pp r0.x, t4, t4
mul_pp r1.xyz, r1.x, t3
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t4, r1
dp3_pp r1.x, r2, r2
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r2
mov_pp r1.x, c3
max_pp r2.x, r0.z, c6.y
mul_pp r1.x, c6.z, r1
pow r4.w, r2.x, r1.x
mad_pp r0.x, -r0, t4.z, c6
pow_pp r2.w, r0.x, c2.x
mov r0.x, r4.w
add r1.x, -r0, c4
mad r0.x, r2.w, r1, r0
mov_pp r4.xyz, c0
dp3_pp r1.x, c7, r4
max_pp r2.x, r1.z, c6.y
mul r0.w, r0.x, r1.x
mul_pp r0.xyz, r2.x, c0
mul_pp r0, r5.x, r0
mul_pp r1, r0, c6.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mul_pp r2.xyz, r3, c5
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c7.w, r0
mov_pp r0.w, c6.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 128 [_Gloss]
Float 132 [_Fresnel]
Float 136 [_Spec]
Float 140 [_FresnelIntensity]
Vector 160 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpeefmgmingkeaimfefdkkghadedjbnphabaaaaaaomaiaaaaaeaaaaaa
daaaaaaacmadaaaaoiahaaaaliaiaaaaebgpgodjpeacaaaapeacaaaaaaacpppp
keacaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaaaaaaakaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaebaaaaaaaaaaaaaaed
aaaaiadpfbaaaaafaeaaapkakoehgbdopepndedphdgijbdnaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaaiaaaaadaaaaciiaadaaoelaadaaoelaahaaaaacaaaacbiaaaaappia
afaaaaadaaaacoiaaaaaaaiaadaabllaaeaaaaaeaaaaabiaadaakklaaaaaaaib
adaappkacaaaaaadabaaciiaaaaaaaiaabaaffkaaiaaaaadaaaacbiaacaaoela
acaaoelaahaaaaacaaaacbiaaaaaaaiaaeaaaaaeabaachiaacaaoelaaaaaaaia
aaaabliaafaaaaadaaaacbiaaaaaaaiaacaakklaaiaaaaadaaaacciaabaaoeia
abaaoeiaahaaaaacaaaacciaaaaaffiaafaaaaadaaaacciaaaaaffiaabaakkia
alaaaaadabaaabiaaaaaffiaadaaffkaabaaaaacaaaaaeiaadaakkkaafaaaaad
aaaaaciaaaaakkiaabaakkkacaaaaaadacaaaiiaabaaaaiaaaaaffiabcaaaaae
aaaaaciaabaappiaabaappkaacaappiaabaaaaacabaaahiaaaaaoekaaiaaaaad
aaaaceiaabaaoeiaaeaaoekaafaaaaadabaaciiaaaaakkiaaaaaffiaaiaaaaad
acaaabiaaeaaoelaaeaaoelaabaaaaacacaaadiaacaaaaiaecaaaaadacaacpia
acaaoeiaaaaioekaecaaaaadadaacpiaaaaaoelaabaioekaacaaaaadadaaciia
acaaaaiaacaaaaiaafaaaaadaaaacoiaaaaaaaiaaaaablkafiaaaaaeabaachia
aaaaaaiaaaaabliaadaaffkaafaaaaadaaaacpiaabaaoeiaadaappiaafaaaaad
aaaaciiaaaaappiaabaaaakaafaaaaadabaachiaaaaappiaaaaaoeiaafaaaaad
acaachiaadaaoeiaacaaoekaafaaaaadacaachiaacaaoeiaadaaaakaaeaaaaae
aaaachiaacaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaaaiiaadaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcleaeaaaaeaaaaaaacnabaaaafjaaaaae
egiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaaagaabaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckbabaiaebaaaaaaaeaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajocaabaaaaaaaaaaa
agbjbaaaadaaaaaaagaabaaaabaaaaaafgaobaaaaaaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackbabaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaagaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackiacaaaaaaaaaaa
aiaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaj
ecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaa
dcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
aaaaaaaabaaaaaalccaabaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaceaaaaa
koehgbdopepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaagaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaa
aiaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
akaaaaaadiaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaeb
aaaacaebaaaacaebaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 1, 128, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[3];
MAD R1.xyz, R0.w, fragment.texcoord[4], R1;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MAD R0.w, -R0, fragment.texcoord[4].z, c[6].y;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].z;
MUL R1.z, R1.x, c[3].x;
MAX R1.x, R1.y, c[6];
POW R1.x, R1.x, R1.z;
ADD R1.y, -R1.x, c[4].x;
POW R0.w, R0.w, c[2].x;
MAD R0.w, R0, R1.y, R1.x;
MOV R1.xyz, c[7];
DP3 R1.w, R1, c[0];
MAX R2.x, fragment.texcoord[3].z, c[6];
MUL R1.xyz, R2.x, c[0];
MUL R1.w, R0, R1;
MUL R1, R1, c[6].w;
MUL R0.w, R1, c[1].x;
MUL R0.xyz, R0, c[5];
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[7].w, R2;
MOV result.color.w, c[6].x;
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
"ps_2_0
dcl_2d s0
def c6, 1.00000000, 0.00000000, 128.00000000, 2.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 10.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
texld r3, t0, s0
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mov_pp r1.xyz, t3
mad_pp r1.xyz, r0.x, t4, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
mov_pp r1.x, c3
max_pp r2.x, r0.z, c6.y
mul_pp r1.x, c6.z, r1
pow r4.x, r2.x, r1.x
mad_pp r0.x, -r0, t4.z, c6
pow_pp r1.w, r0.x, c2.x
mov r0.x, r4.x
add r2.x, -r0, c4
mad r0.x, r1.w, r2, r0
mov_pp r1.xyz, c0
dp3_pp r1.x, c7, r1
max_pp r2.x, t3.z, c6.y
mul_pp r2.xyz, r2.x, c0
mul r2.w, r0.x, r1.x
mul_pp r1, r2, c6.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mul_pp r2.xyz, r3, c5
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c7.w, r0
mov_pp r0.w, c6.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_ColorAtlas] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Float 64 [_Gloss]
Float 68 [_Fresnel]
Float 72 [_Spec]
Float 76 [_FresnelIntensity]
Vector 96 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedopjgmgoagaafekfniolbdadgajogefcpabaaaaaahaahaaaaaeaaaaaa
daaaaaaaleacaaaaieagaaaadmahaaaaebgpgodjhmacaaaahmacaaaaaaacpppp
daacaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaaaaaaagaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaebaaaaaaaaaaaaaaedaaaaiadp
fbaaaaafaeaaapkakoehgbdopepndedphdgijbdnaaaaaaeabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaaiaaaaadaaaaciia
adaaoelaadaaoelaahaaaaacaaaaciiaaaaappiaabaaaaacabaaahiaadaaoela
aeaaaaaeabaachiaabaaoeiaaaaappiaacaaoelaaeaaaaaeaaaaaiiaadaakkla
aaaappibadaappkacaaaaaadabaaciiaaaaappiaabaaffkaaiaaaaadaaaaciia
abaaoeiaabaaoeiaahaaaaacaaaaciiaaaaappiaafaaaaadaaaaciiaaaaappia
abaakkiaalaaaaadabaaabiaaaaappiaadaaffkaabaaaaacaaaaaiiaadaakkka
afaaaaadaaaaaiiaaaaappiaabaakkkacaaaaaadacaaaiiaabaaaaiaaaaappia
bcaaaaaeaaaaaiiaabaappiaabaappkaacaappiaabaaaaacabaaahiaaaaaoeka
aiaaaaadabaacbiaabaaoeiaaeaaoekaafaaaaadaaaaciiaaaaappiaabaaaaia
afaaaaadaaaaciiaaaaappiaabaaaakaacaaaaadaaaaciiaaaaappiaaaaappia
afaaaaadabaachiaacaakklaaaaaoekafiaaaaaeabaachiaacaakklaabaaoeia
adaaffkaafaaaaadabaachiaabaaoeiaaeaappkaafaaaaadacaachiaaaaappia
abaaoeiaafaaaaadaaaachiaaaaaoeiaacaaoekaafaaaaadaaaachiaaaaaoeia
adaaaakaaeaaaaaeaaaachiaaaaaoeiaabaaoeiaacaaoeiaabaaaaacaaaaaiia
adaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmiadaaaaeaaaaaaa
pcaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajocaabaaa
aaaaaaaaagbjbaaaaeaaaaaaagaabaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaak
bcaabaaaaaaaaaaackbabaiaebaaaaaaaeaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaaeaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackiacaaaaaaaaaaaaeaaaaaa
abeaaaaaaaaaaaeddiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaa
aaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaajecaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaadcaaaaaj
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
baaaaaalccaabaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaackbabaaaadaaaaaaabeaaaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaagaaaaaa
diaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaeb
aaaacaebaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[9] = { program.local[0..5],
		{ 0, 0.5, 1, 128 },
		{ 0.2199707, 0.70703125, 0.070983887, 2 },
		{ 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
RCP R0.x, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.x, c[6].y;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
MOV result.color.w, c[6].x;
TEX R0.w, R1, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.z, texture[2], 2D;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.y, R1.x;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R2.xyz, R1.y, fragment.texcoord[3];
RSQ R2.w, R1.x;
MAD R1.xyz, R2.w, fragment.texcoord[4], R2;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MAD R2.w, -R2, fragment.texcoord[4].z, c[6].z;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].w;
MUL R1.z, R1.x, c[3].x;
MAX R1.x, R1.y, c[6];
POW R2.x, R1.x, R1.z;
MOV R1.xyz, c[7];
DP3 R1.x, R1, c[0];
ADD R2.y, -R2.x, c[4].x;
POW R2.w, R2.w, c[2].x;
MAD R2.x, R2.w, R2.y, R2;
MUL R2.w, R2.x, R1.x;
MAX R1.y, R2.z, c[6].x;
SLT R1.x, c[6], fragment.texcoord[5].z;
MUL R0.w, R1.x, R0;
MUL R0.w, R0, R1;
MUL R2.xyz, R1.y, c[0];
MUL R1, R0.w, R2;
MUL R1, R1, c[7].w;
MUL R0.w, R1, c[1].x;
MUL R0.xyz, R0, c[5];
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[8].x, R2;
END
# 39 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 0.00000000, 1.00000000, 0.50000000, 128.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 2.00000000
def c8, 10.00000000, 0, 0, 0
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r4, t0, s0
rcp r0.x, t5.w
dp3 r1.x, t5, t5
mov r1.xy, r1.x
mad r0.xy, t5, r0.x, c6.z
texld r0, r0, s1
texld r5, r1, s2
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
dp3_pp r0.x, t4, t4
mul_pp r1.xyz, r1.x, t3
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t4, r1
dp3_pp r1.x, r2, r2
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r2
mov_pp r1.x, c3
max_pp r2.x, r0.z, c6
mul_pp r1.x, c6.w, r1
pow r3.w, r2.x, r1.x
mad_pp r1.x, -r0, t4.z, c6.y
pow_pp r2.w, r1.x, c2.x
mov r0.x, r3.w
mov_pp r3.xyz, c0
add r1.x, -r0, c4
mad r0.x, r2.w, r1, r0
dp3_pp r3.x, c7, r3
max_pp r1.x, r1.z, c6
mul r1.w, r0.x, r3.x
cmp r0.x, -t5.z, c6, c6.y
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1.x, c0
mul_pp r0.x, r0, r5
mul_pp r0, r0.x, r1
mul_pp r1, r0, c7.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mul_pp r2.xyz, r4, c5
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c8.x, r0
mov_pp r0.w, c6.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 128 [_Gloss]
Float 132 [_Fresnel]
Float 136 [_Spec]
Float 140 [_FresnelIntensity]
Vector 160 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecediencjadbggfeoknbpclmdfcjadpmdempabaaaaaaciakaaaaaeaaaaaa
daaaaaaajaadaaaaceajaaaapeajaaaaebgpgodjfiadaaaafiadaaaaaaacpppp
aeadaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaa
aaaaakaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaebaaaaaadp
aaaaaaaaaaaaaaedfbaaaaafaeaaapkaaaaaiadphdgijbdnpepndedpkoehgbdo
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaaeaappla
aeaaaaaeaaaaadiaaeaaoelaaaaappiaadaaffkaaiaaaaadabaaaiiaaeaaoela
aeaaoelaabaaaaacabaaadiaabaappiaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadabaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaacaioeka
afaaaaadacaaaiiaaaaappiaabaaaaiaacaaaaadacaaciiaacaappiaacaappia
fiaaaaaeacaaciiaaeaakklbadaakkkaacaappiaaiaaaaadaaaacbiaadaaoela
adaaoelaahaaaaacaaaacbiaaaaaaaiaafaaaaadaaaacoiaaaaaaaiaadaablla
aeaaaaaeaaaaabiaadaakklaaaaaaaibaeaaaakacaaaaaadabaacbiaaaaaaaia
abaaffkaaiaaaaadaaaacbiaacaaoelaacaaoelaahaaaaacaaaacbiaaaaaaaia
aeaaaaaeadaachiaacaaoelaaaaaaaiaaaaabliaafaaaaadadaaciiaaaaaaaia
acaakklaaiaaaaadaaaacbiaadaaoeiaadaaoeiaahaaaaacaaaacbiaaaaaaaia
afaaaaadaaaacbiaaaaaaaiaadaakkiaalaaaaadabaaaciaaaaaaaiaadaakkka
abaaaaacaaaaaiiaadaappkaafaaaaadaaaaabiaaaaappiaabaakkkacaaaaaad
adaaabiaabaaffiaaaaaaaiabcaaaaaeaaaaabiaabaaaaiaabaappkaadaaaaia
abaaaaacabaaahiaaaaaoekaaiaaaaadaaaacciaabaaoeiaaeaablkaafaaaaad
aaaaciiaaaaaffiaaaaaaaiaafaaaaadabaachiaadaappiaaaaaoekafiaaaaae
aaaachiaadaappiaabaaoeiaadaakkkaafaaaaadaaaacpiaacaappiaaaaaoeia
afaaaaadaaaaciiaaaaappiaabaaaakaafaaaaadabaachiaaaaappiaaaaaoeia
afaaaaadacaachiaacaaoeiaacaaoekaafaaaaadacaachiaacaaoeiaadaaaaka
aeaaaaaeaaaachiaacaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaaaiiaadaakkka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcimafaaaaeaaaaaaagdabaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaaagaabaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckbabaiaebaaaaaaaeaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpcpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajocaabaaaaaaaaaaa
agbjbaaaadaaaaaaagaabaaaabaaaaaafgaobaaaaaaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaackbabaaaadaaaaaadeaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaagaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaa
aaaaaaaajgahbaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackiacaaaaaaaaaaa
aiaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaaj
ecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaa
dcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaa
aaaaaaaabaaaaaalccaabaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaceaaaaa
koehgbdopepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaa
pgbpbaaaafaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaa
abeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaacaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaabaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
acaaaaaadiaaaaahpcaabaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaa
diaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaeb
aaaacaebaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 1, 128, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[5], texture[2], CUBE;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.y, R1.x;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R2.xyz, R1.y, fragment.texcoord[3];
RSQ R2.w, R1.x;
MAD R1.xyz, R2.w, fragment.texcoord[4], R2;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MAD R2.w, -R2, fragment.texcoord[4].z, c[6].y;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].z;
MUL R1.z, R1.x, c[3].x;
MAX R1.x, R1.y, c[6];
POW R2.x, R1.x, R1.z;
MOV R1.xyz, c[7];
DP3 R1.x, R1, c[0];
ADD R2.y, -R2.x, c[4].x;
POW R2.w, R2.w, c[2].x;
MAD R2.x, R2.w, R2.y, R2;
MAX R1.y, R2.z, c[6].x;
MUL R2.w, R2.x, R1.x;
MUL R2.xyz, R1.y, c[0];
MUL R0.xyz, R0, c[5];
MOV result.color.w, c[6].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.w, R0, R1;
MUL R1, R0.w, R2;
MUL R1, R1, c[6].w;
MUL R0.w, R1, c[1].x;
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[7].w, R2;
END
# 35 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c6, 1.00000000, 0.00000000, 128.00000000, 2.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 10.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r4, t0, s0
dp3 r0.x, t5, t5
mov r1.xy, r0.x
texld r0, t5, s2
texld r5, r1, s1
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
dp3_pp r0.x, t4, t4
mul_pp r1.xyz, r1.x, t3
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t4, r1
dp3_pp r1.x, r2, r2
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r2
mov_pp r1.x, c3
max_pp r2.x, r0.z, c6.y
mul_pp r1.x, c6.z, r1
pow r3.w, r2.x, r1.x
mad_pp r1.x, -r0, t4.z, c6
pow_pp r2.w, r1.x, c2.x
mov r0.x, r3.w
mov_pp r3.xyz, c0
add r1.x, -r0, c4
mad r0.x, r2.w, r1, r0
dp3_pp r3.x, c7, r3
mul r1.w, r0.x, r3.x
max_pp r0.x, r1.z, c6.y
mul_pp r1.xyz, r0.x, c0
mul r0.x, r5, r0.w
mul_pp r0, r0.x, r1
mul_pp r1, r0, c6.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mul_pp r2.xyz, r4, c5
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c7.w, r0
mov_pp r0.w, c6.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 128 [_Gloss]
Float 132 [_Fresnel]
Float 136 [_Spec]
Float 140 [_FresnelIntensity]
Vector 160 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedldalmapcdlklemccojofimaefmandoelabaaaaaafmajaaaaaeaaaaaa
daaaaaaafmadaaaafiaiaaaaciajaaaaebgpgodjceadaaaaceadaaaaaaacpppp
naacaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaa
aaaaakaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaebaaaaaaaa
aaaaaaedaaaaiadpfbaaaaafaeaaapkakoehgbdopepndedphdgijbdnaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaciiaadaaoela
adaaoelaahaaaaacaaaacbiaaaaappiaafaaaaadaaaacoiaaaaaaaiaadaablla
aeaaaaaeaaaaabiaadaakklaaaaaaaibadaappkacaaaaaadabaaciiaaaaaaaia
abaaffkaaiaaaaadaaaacbiaacaaoelaacaaoelaahaaaaacaaaacbiaaaaaaaia
aeaaaaaeabaachiaacaaoelaaaaaaaiaaaaabliaafaaaaadaaaacbiaaaaaaaia
acaakklaaiaaaaadaaaacciaabaaoeiaabaaoeiaahaaaaacaaaacciaaaaaffia
afaaaaadaaaacciaaaaaffiaabaakkiaalaaaaadabaaabiaaaaaffiaadaaffka
abaaaaacaaaaaeiaadaakkkaafaaaaadaaaaaciaaaaakkiaabaakkkacaaaaaad
acaaaiiaabaaaaiaaaaaffiabcaaaaaeaaaaaciaabaappiaabaappkaacaappia
abaaaaacabaaahiaaaaaoekaaiaaaaadaaaaceiaabaaoeiaaeaaoekaafaaaaad
abaaciiaaaaakkiaaaaaffiaaiaaaaadacaaabiaaeaaoelaaeaaoelaabaaaaac
acaaadiaacaaaaiaecaaaaadacaaapiaacaaoeiaabaioekaecaaaaadadaaapia
aeaaoelaaaaioekaecaaaaadaeaacpiaaaaaoelaacaioekaafaaaaadaeaaciia
acaaaaiaadaappiaacaaaaadaeaaciiaaeaappiaaeaappiaafaaaaadaaaacoia
aaaaaaiaaaaablkafiaaaaaeabaachiaaaaaaaiaaaaabliaadaaffkaafaaaaad
aaaacpiaabaaoeiaaeaappiaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaad
abaachiaaaaappiaaaaaoeiaafaaaaadacaachiaaeaaoeiaacaaoekaafaaaaad
acaachiaacaaoeiaadaaaakaaeaaaaaeaaaachiaacaaoeiaaaaaoeiaabaaoeia
abaaaaacaaaaaiiaadaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
peaeaaaaeaaaaaaadnabaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaaagaabaaaaaaaaaaaagbjbaaaaeaaaaaa
dcaaaaakbcaabaaaaaaaaaaackbabaiaebaaaaaaaeaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaaiaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
dcaaaaajocaabaaaaaaaaaaaagbjbaaaadaaaaaaagaabaaaabaaaaaafgaobaaa
aaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaackbabaaaadaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaah
ccaabaaaaaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiecaabaaa
aaaaaaaackiacaaaaaaaaaaaaiaaaaaaabeaaaaaaaaaaaeddiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaaaaaaaajecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkiacaaaaaaaaaaaaiaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckaabaaaaaaaaaaabkaabaaaaaaaaaaabaaaaaalccaabaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaaaceaaaaakoehgbdopepndedphdgijbdnaaaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaa
agaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaacaaaaaadiaaaaahpcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaiicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaakhcaabaaaacaaaaaa
egacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaebaaaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 1, 128, 2 },
		{ 0.2199707, 0.70703125, 0.070983887, 10 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[5], texture[1], 2D;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R1.w, R1.w;
MOV R1.xyz, fragment.texcoord[3];
MAD R1.xyz, R1.w, fragment.texcoord[4], R1;
DP3 R1.x, R1, R1;
RSQ R1.y, R1.x;
MUL R1.y, R1, R1.z;
MOV R1.x, c[6].z;
MUL R1.z, R1.x, c[3].x;
MAX R1.x, R1.y, c[6];
POW R1.y, R1.x, R1.z;
MAD R1.x, -R1.w, fragment.texcoord[4].z, c[6].y;
ADD R1.z, -R1.y, c[4].x;
POW R1.x, R1.x, c[2].x;
MAD R1.w, R1.x, R1.z, R1.y;
MOV R1.xyz, c[7];
DP3 R2.x, R1, c[0];
MAX R2.y, fragment.texcoord[3].z, c[6].x;
MUL R1.w, R1, R2.x;
MUL R1.xyz, R2.y, c[0];
MUL R1, R0.w, R1;
MUL R1, R1, c[6].w;
MUL R0.w, R1, c[1].x;
MUL R0.xyz, R0, c[5];
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[7].w, R2;
MOV result.color.w, c[6].x;
END
# 30 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Gloss]
Float 2 [_Fresnel]
Float 3 [_Spec]
Float 4 [_FresnelIntensity]
Vector 5 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c6, 1.00000000, 0.00000000, 128.00000000, 2.00000000
def c7, 0.21997070, 0.70703125, 0.07098389, 10.00000000
dcl t0.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r0, t5, s1
texld r3, t0, s0
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mov_pp r1.xyz, t3
mad_pp r1.xyz, r0.x, t4, r1
dp3_pp r1.x, r1, r1
rsq_pp r2.x, r1.x
mul_pp r0.z, r2.x, r1
mov_pp r1.x, c3
max_pp r2.x, r0.z, c6.y
mul_pp r1.x, c6.z, r1
pow r4.w, r2.x, r1.x
mad_pp r0.x, -r0, t4.z, c6
pow_pp r2.w, r0.x, c2.x
mov r0.x, r4.w
add r1.x, -r0, c4
mad r0.x, r2.w, r1, r0
mov_pp r4.xyz, c0
dp3_pp r2.x, c7, r4
max_pp r1.x, t3.z, c6.y
mul r1.w, r0.x, r2.x
mul_pp r1.xyz, r1.x, c0
mul_pp r0, r0.w, r1
mul_pp r1, r0, c6.w
mul_pp r0.x, r1.w, c1
mul_pp r0.xyz, r1, r0.x
mul_pp r2.xyz, r3, c5
mul_pp r1.xyz, r2, r1
mad_pp r0.xyz, r1, c7.w, r0
mov_pp r0.w, c6.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 128 [_Gloss]
Float 132 [_Fresnel]
Float 136 [_Spec]
Float 140 [_FresnelIntensity]
Vector 160 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbhhhjeffkhfpmiceempmkidfcbcbambgabaaaaaaciaiaaaaaeaaaaaa
daaaaaaaomacaaaaceahaaaapeahaaaaebgpgodjleacaaaaleacaaaaaaacpppp
geacaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaaaaaaaaaaaaaaakaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaacaebaaaaaaaaaaaaaaed
aaaaiadpfbaaaaafaeaaapkakoehgbdopepndedphdgijbdnaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaaiaaaaadaaaaciiaadaaoelaadaaoelaahaaaaacaaaacbiaaaaappia
abaaaaacabaaahiaadaaoelaaeaaaaaeabaachiaabaaoeiaaaaaaaiaacaaoela
aeaaaaaeabaaaiiaadaakklaaaaaaaibadaappkacaaaaaadaaaacbiaabaappia
abaaffkaaiaaaaadaaaacciaabaaoeiaabaaoeiaahaaaaacaaaacciaaaaaffia
afaaaaadaaaacciaaaaaffiaabaakkiaalaaaaadabaaabiaaaaaffiaadaaffka
abaaaaacaaaaaeiaadaakkkaafaaaaadaaaaaciaaaaakkiaabaakkkacaaaaaad
acaaaiiaabaaaaiaaaaaffiabcaaaaaeabaaabiaaaaaaaiaabaappkaacaappia
abaaaaacaaaaahiaaaaaoekaaiaaaaadaaaacbiaaaaaoeiaaeaaoekaafaaaaad
aaaaciiaaaaaaaiaabaaaaiaabaaaaacabaaadiaabaabllaecaaaaadabaacpia
abaaoeiaaaaioekaecaaaaadacaacpiaaaaaoelaabaioekaacaaaaadacaaciia
abaappiaabaappiaafaaaaadabaachiaacaakklaaaaaoekafiaaaaaeaaaachia
acaakklaabaaoeiaadaaffkaafaaaaadaaaacpiaaaaaoeiaacaappiaafaaaaad
aaaaciiaaaaappiaabaaaakaafaaaaadabaachiaaaaappiaaaaaoeiaafaaaaad
acaachiaacaaoeiaacaaoekaafaaaaadacaachiaacaaoeiaadaaaakaaeaaaaae
aaaachiaacaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaaaiiaadaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcdaaeaaaaeaaaaaaaamabaaaafjaaaaae
egiocaaaaaaaaaaaalaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajocaabaaa
aaaaaaaaagbjbaaaaeaaaaaaagaabaaaaaaaaaaaagbjbaaaadaaaaaadcaaaaak
bcaabaaaaaaaaaaackbabaiaebaaaaaaaeaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaajgahbaaaaaaaaaaa
jgahbaaaaaaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaackiacaaaaaaaaaaaaiaaaaaa
abeaaaaaaaaaaaeddiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaa
aaaaaaaabjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaajecaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaadcaaaaaj
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
baaaaaalccaabaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaaceaaaaakoehgbdo
pepndedphdgijbdnaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaackbabaaaadaaaaaaabeaaaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaagaabaaaabaaaaaaegiccaaaaaaaaaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaaaaaaaahbcaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
diaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaakaaaaaa
diaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaeb
aaaacaebaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaacaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Vector 13 [unity_Scale]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..13] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[9];
DP3 R0.x, vertex.attrib[14], c[9];
DP3 R0.z, vertex.normal, c[9];
MUL result.texcoord[3].xyz, R0, c[13].w;
DP3 R0.y, R1, c[10];
DP3 R0.x, vertex.attrib[14], c[10];
DP3 R0.z, vertex.normal, c[10];
MUL result.texcoord[4].xyz, R0, c[13].w;
DP3 R0.y, R1, c[11];
DP3 R0.x, vertex.attrib[14], c[11];
DP3 R0.z, vertex.normal, c[11];
MUL result.texcoord[5].xyz, R0, c[13].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [unity_Scale]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c8
dp3 r0.x, v1, c8
dp3 r0.z, v2, c8
mul oT3.xyz, r0, c12.w
dp3 r0.y, r1, c9
dp3 r0.x, v1, c9
dp3 r0.z, v2, c9
mul oT4.xyz, r0, c12.w
dp3 r0.y, r1, c10
dp3 r0.x, v1, c10
dp3 r0.z, v2, c10
mul oT5.xyz, r0, c12.w
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c13.x, c13.x
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedjelghmojikcadlpapjomkmkfpabmpebfabaaaaaaiaajaaaaaeaaaaaa
daaaaaaaciadaaaaoiahaaaalaaiaaaaebgpgodjpaacaaaapaacaaaaaaacpopp
jiacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaaiaaadaaafaaaaaaaaaaaaaaamaaadaaaiaaaaaaaaaa
aaaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafamaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaagaaoekaaeaaaaaeaaaaadia
afaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaahaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiaamaaaakaamaaaakaabaaaaacaaaaahiaacaaoeja
afaaaaadabaaahiaaaaanciaabaamjjaaeaaaaaeaaaaahiaaaaamjiaabaancja
abaaoeibafaaaaadaaaaahiaaaaaoeiaabaappjaabaaaaacabaaabiaaiaaaaka
abaaaaacabaaaciaajaaaakaabaaaaacabaaaeiaakaaaakaaiaaaaadacaaacia
aaaaoeiaabaaoeiaaiaaaaadacaaabiaabaaoejaabaaoeiaaiaaaaadacaaaeia
acaaoejaabaaoeiaafaaaaadacaaahoaacaaoeiaalaappkaabaaaaacabaaabia
aiaaffkaabaaaaacabaaaciaajaaffkaabaaaaacabaaaeiaakaaffkaaiaaaaad
acaaaciaaaaaoeiaabaaoeiaaiaaaaadacaaabiaabaaoejaabaaoeiaaiaaaaad
acaaaeiaacaaoejaabaaoeiaafaaaaadadaaahoaacaaoeiaalaappkaabaaaaac
abaaabiaaiaakkkaabaaaaacabaaaciaajaakkkaabaaaaacabaaaeiaakaakkka
aiaaaaadaaaaaciaaaaaoeiaabaaoeiaaiaaaaadaaaaabiaabaaoejaabaaoeia
aiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadaeaaahoaaaaaoeiaalaappka
afaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapiaabaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
aeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcliaeaaaaeaaaabaacoabaaaafjaaaaaeegiocaaa
aaaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaaaaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaaaaaaaaa
ajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaaiaaaaaaagbabaaa
acaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
akaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaabaaaaaaakiacaaa
aaaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaaakiacaaaaaaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaaakiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaihccabaaaadaaaaaaegacbaaaacaaaaaa
pgipcaaaaaaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaabkiacaaaaaaaaaaa
amaaaaaadgaaaaagccaabaaaabaaaaaabkiacaaaaaaaaaaaanaaaaaadgaaaaag
ecaabaaaabaaaaaabkiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaacaaaaaapgipcaaa
aaaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaaaaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaackiacaaaaaaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaackiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaihccabaaaafaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaa
beaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_Spec]
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5 } };
TEMP R0;
MOV R0.z, fragment.texcoord[5];
MOV R0.x, fragment.texcoord[3].z;
MOV R0.y, fragment.texcoord[4].z;
MAD result.color.xyz, R0, c[1].x, c[1].x;
MOV result.color.w, c[0].x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_Spec]
"ps_2_0
def c1, 0.50000000, 0, 0, 0
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
mov_pp r0.z, t5
mov_pp r0.x, t3.z
mov_pp r0.y, t4.z
mad_pp r0.xyz, r0, c1.x, c1.x
mov_pp r0.w, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
ConstBuffer "$Globals" 128
Float 72 [_Spec]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpjfkekkcoibjjlihkgdgohcopaggkcolabaaaaaapeacaaaaaeaaaaaa
daaaaaaaaeabaaaapaabaaaamaacaaaaebgpgodjmmaaaaaammaaaaaaaaacpppp
jmaaaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaaeaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaac
aaaaaaiaaeaaahlaafaaaaadaaaacbiaacaakklaabaaaakaafaaaaadaaaaccia
adaakklaabaaaakaafaaaaadaaaaceiaaeaakklaabaaaakaacaaaaadaaaachia
aaaaoeiaabaaaakaabaaaaacaaaaciiaaaaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcoeaaaaaaeaaaaaaadjaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaagcbaaaadecbabaaaadaaaaaagcbaaaadecbabaaaaeaaaaaagcbaaaad
ecbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaadgaaaaaf
bcaabaaaaaaaaaaackbabaaaadaaaaaadgaaaaafccaabaaaaaaaaaaackbabaaa
aeaaaaaadgaaaaafecaabaaaaaaaaaaackbabaaaafaaaaaadcaaaaaphccabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaagiccabaaaaaaaaaaa
ckiacaaaaaaaaaaaaeaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaeaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaeaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[20];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[13].x;
ADD result.texcoord[3].xy, R0, R0.z;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[4].xyz, R3, R2;
MOV result.position, R1;
MOV result.texcoord[3].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r1.xyz, v1, c21.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.y
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c20
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c22.x
mul r0.y, r0, c12.x
mad oT3.xy, r0.z, c13.zwzw, r0
dp3 r0.x, v1, c4
dp3 r0.y, v1, c5
add oT4.xyz, r3, r2
mov oPos, r1
mov oT3.zw, r1
mov oT0.xy, v2
mov oT1.xy, v3
mad oT2.xy, r0, c22.x, c22.x
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedacccbhafcmhcejjecmndbkhmalkiipkbabaaaaaagiajaaaaaeaaaaaa
daaaaaaacaadaaaaoiahaaaalaaiaaaaebgpgodjoiacaaaaoiacaaaaaaacpopp
hiacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaaiaaadaaanaaaaaaaaaaacaaamaaadaabaaaaaaaaaaaacaabeaaabaabdaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
aoaaoekaaeaaaaaeaaaaadiaanaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
apaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabeaaaakabeaaaaka
afaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
amaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaakaafaaaaad
abaaaiiaabaaaaiabeaaaakaafaaaaadabaaafiaaaaapeiabeaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoejabdaappkaafaaaaad
acaaahiaabaaffiabbaaoekaaeaaaaaeabaaaliabaaakekaabaaaaiaacaakeia
aeaaaaaeabaaahiabcaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabeaaffka
ajaaaaadacaaabiaacaaoekaabaaoeiaajaaaaadacaaaciaadaaoekaabaaoeia
ajaaaaadacaaaeiaaeaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeia
ajaaaaadaeaaabiaafaaoekaadaaoeiaajaaaaadaeaaaciaagaaoekaadaaoeia
ajaaaaadaeaaaeiaahaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeia
afaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaia
abaaffibaeaaaaaeadaaahoaaiaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcmaaeaaaaeaaaabaadaabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
abaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 13 [_Object2World]
Vector 17 [_ProjectionParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[3].xy, R1, R1.z;
DP3 R0.x, vertex.normal, c[9];
DP3 R0.y, vertex.normal, c[10];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[18].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[15];
DP4 R1.x, vertex.position, c[13];
DP4 R1.y, vertex.position, c[14];
ADD R1.xyz, R1, -c[18];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[18].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[4].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_Object2World]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"vs_2_0
def c20, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c20.x
mov oPos, r0
mul r1.y, r1, c16.x
mad oT3.xy, r1.z, c17.zwzw, r1
dp3 r0.x, v1, c8
dp3 r0.y, v1, c9
mad oT2.xy, r0, c20.x, c20.x
mov r0.x, c18.w
add r0.y, c20, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c14
dp4 r1.x, v0, c12
dp4 r1.y, v0, c13
add r1.xyz, r1, -c18
mov oT3.zw, r0
mul oT5.xyz, r1, c18.w
mov oT0.xy, v2
mov oT1.xy, v3
mad oT4.xy, v3, c19, c19.zwzw
mul oT5.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedafcalpnjdfconcbibkddkgooafacnpmlabaaaaaafiajaaaaaeaaaaaa
daaaaaaaaaadaaaamaahaaaaiiaiaaaaebgpgodjmiacaaaamiacaaaaaaacpopp
geacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaabjaaabaaadaaaaaaaaaa
adaaaaaaalaaaeaaaaaaaaaaadaaamaaaeaaapaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbdaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaaeaaaaadia
amaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiabdaaaakabdaaaakaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaiabdaaaaka
afaaaaadabaaafiaaaaapeiabdaaaakaacaaaaadacaaadoaabaakkiaabaaomia
aeaaaaaeabaaamoaaeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffja
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaahia
bbaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiabcaaoekaaaaappjaabaaoeia
acaaaaadabaaahiaabaaoeiaadaaoekbafaaaaadadaaahoaabaaoeiaadaappka
afaaaaadabaaabiaaaaaffjaajaakkkaaeaaaaaeabaaabiaaiaakkkaaaaaaaja
abaaaaiaaeaaaaaeabaaabiaakaakkkaaaaakkjaabaaaaiaaeaaaaaeabaaabia
alaakkkaaaaappjaabaaaaiaabaaaaacabaaaciabdaaffkaacaaaaadabaaacia
abaaffiaadaappkbafaaaaadadaaaioaabaaffiaabaaaaibaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcliaeaaaaeaaaabaacoabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaa
fjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaa
egiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
abaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaiaaaaaa
kgiocaaaaaaaaaaaaiaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaacaaaaaaamadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[20];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[13].x;
ADD result.texcoord[3].xy, R0, R0.z;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
ADD result.texcoord[4].xyz, R3, R2;
MOV result.position, R1;
MOV result.texcoord[3].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r1.xyz, v1, c21.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c22.y
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c20
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c22.x
mul r0.y, r0, c12.x
mad oT3.xy, r0.z, c13.zwzw, r0
dp3 r0.x, v1, c4
dp3 r0.y, v1, c5
add oT4.xyz, r3, r2
mov oPos, r1
mov oT3.zw, r1
mov oT0.xy, v2
mov oT1.xy, v3
mad oT2.xy, r0, c22.x, c22.x
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 608 [unity_SHAr]
Vector 624 [unity_SHAg]
Vector 640 [unity_SHAb]
Vector 656 [unity_SHBr]
Vector 672 [unity_SHBg]
Vector 688 [unity_SHBb]
Vector 704 [unity_SHC]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedacccbhafcmhcejjecmndbkhmalkiipkbabaaaaaagiajaaaaaeaaaaaa
daaaaaaacaadaaaaoiahaaaalaaiaaaaebgpgodjoiacaaaaoiacaaaaaaacpopp
hiacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaaiaaadaaanaaaaaaaaaaacaaamaaadaabaaaaaaaaaaaacaabeaaabaabdaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
aoaaoekaaeaaaaaeaaaaadiaanaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
apaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabeaaaakabeaaaaka
afaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
amaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaakaafaaaaad
abaaaiiaabaaaaiabeaaaakaafaaaaadabaaafiaaaaapeiabeaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoejabdaappkaafaaaaad
acaaahiaabaaffiabbaaoekaaeaaaaaeabaaaliabaaakekaabaaaaiaacaakeia
aeaaaaaeabaaahiabcaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabeaaffka
ajaaaaadacaaabiaacaaoekaabaaoeiaajaaaaadacaaaciaadaaoekaabaaoeia
ajaaaaadacaaaeiaaeaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeia
ajaaaaadaeaaabiaafaaoekaadaaoeiaajaaaaadaeaaaciaagaaoekaadaaoeia
ajaaaaadaeaaaeiaahaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeia
afaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabiaabaaaaiaabaaaaia
abaaffibaeaaaaaeadaaahoaaiaaoekaabaaaaiaacaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcmaaeaaaaeaaaabaadaabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
abaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 13 [_Object2World]
Vector 17 [_ProjectionParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[20] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[13..19] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[3].xy, R1, R1.z;
DP3 R0.x, vertex.normal, c[9];
DP3 R0.y, vertex.normal, c[10];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[18].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[15];
DP4 R1.x, vertex.position, c[13];
DP4 R1.y, vertex.position, c[14];
ADD R1.xyz, R1, -c[18];
MOV result.texcoord[3].zw, R0;
MUL result.texcoord[5].xyz, R1, c[18].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[4].xy, vertex.texcoord[1], c[19], c[19].zwzw;
MUL result.texcoord[5].w, -R0.x, R0.y;
END
# 24 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_Object2World]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_ShadowFadeCenterAndType]
Vector 19 [unity_LightmapST]
"vs_2_0
def c20, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c20.x
mov oPos, r0
mul r1.y, r1, c16.x
mad oT3.xy, r1.z, c17.zwzw, r1
dp3 r0.x, v1, c8
dp3 r0.y, v1, c9
mad oT2.xy, r0, c20.x, c20.x
mov r0.x, c18.w
add r0.y, c20, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c14
dp4 r1.x, v0, c12
dp4 r1.y, v0, c13
add r1.xyz, r1, -c18
mov oT3.zw, r0
mul oT5.xyz, r1, c18.w
mov oT0.xy, v2
mov oT1.xy, v3
mad oT4.xy, v3, c19, c19.zwzw
mul oT5.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedafcalpnjdfconcbibkddkgooafacnpmlabaaaaaafiajaaaaaeaaaaaa
daaaaaaaaaadaaaamaahaaaaiiaiaaaaebgpgodjmiacaaaamiacaaaaaaacpopp
geacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaabjaaabaaadaaaaaaaaaa
adaaaaaaalaaaeaaaaaaaaaaadaaamaaaeaaapaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbdaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaaeaaaaadia
amaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiabdaaaakabdaaaakaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaiabdaaaaka
afaaaaadabaaafiaaaaapeiabdaaaakaacaaaaadacaaadoaabaakkiaabaaomia
aeaaaaaeabaaamoaaeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffja
baaaoekaaeaaaaaeabaaahiaapaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaahia
bbaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiabcaaoekaaaaappjaabaaoeia
acaaaaadabaaahiaabaaoeiaadaaoekbafaaaaadadaaahoaabaaoeiaadaappka
afaaaaadabaaabiaaaaaffjaajaakkkaaeaaaaaeabaaabiaaiaakkkaaaaaaaja
abaaaaiaaeaaaaaeabaaabiaakaakkkaaaaakkjaabaaaaiaaeaaaaaeabaaabia
alaakkkaaaaappjaabaaaaiaabaaaaacabaaaciabdaaffkaacaaaaadabaaacia
abaaffiaadaappkbafaaaaadadaaaioaabaaffiaabaaaaibaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcliaeaaaaeaaaabaacoabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaa
fjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaa
fgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaa
egiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
abaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaiaaaaaa
kgiocaaaaaaaaaaaaiaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaabjaaaaaa
diaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabjaaaaaa
diaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaaafaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaagaaaaaa
ckbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaa
aaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadpdiaaaaai
iccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaacaaaaaaamadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 10, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1, fragment.texcoord[3], texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
LG2 R0.w, R1.w;
MUL R0.w, -R0, c[0].x;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[4];
MUL R2.xyz, R1, R0.w;
MUL R0.xyz, R0, c[3];
MUL R0.xyz, R0, R1;
MOV R1.x, c[2];
ADD R0.w, fragment.texcoord[1].y, c[1].x;
MUL R1.xyz, R1.x, c[4];
SGE R0.w, R0, c[5].y;
MUL R1.xyz, R0.w, R1;
MAD R0.xyz, R0, c[5].x, R2;
ADD result.color.xyz, R0, R1;
MOV result.color.w, c[5].y;
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, -1.00000000, 1.00000000, 0.00000000, 10.00000000
dcl t0.xy
dcl t1.xy
dcl t3
dcl t4.xyz
texldp r0, t3, s1
texld r1, t0, s0
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r2.xyz, -r0, t4
log_pp r0.x, r0.w
mul_pp r0.x, -r0, c0
mul_pp r1.xyz, r1, c3
mul_pp r0.xyz, r2, r0.x
mul_pp r1.xyz, r1, r2
mad_pp r1.xyz, r1, c5.w, r0
add r0.x, t1.y, c1
mov r2.xyz, c4
add r0.x, r0, c5
mul r2.xyz, c2.x, r2
cmp r0.x, r0, c5.y, c5.z
mul r0.xyz, r0.x, r2
mov_pp r0.w, c5.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 144
Float 64 [_Gloss]
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmebdkfegcdokchgkilhcegbcelbfclpbabaaaaaajiafaaaaaeaaaaaa
daaaaaaabeacaaaakmaeaaaageafaaaaebgpgodjnmabaaaanmabaaaaaaacpppp
keabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaaeaaaaaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaacaeb
aaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadiaaaaappia
acaaoelaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoela
aaaioekaapaaaaacacaacbiaaaaaaaiaapaaaaacacaacciaaaaaffiaapaaaaac
acaaceiaaaaakkiaapaaaaacabaaciiaaaaappiaafaaaaadabaaciiaabaappib
aaaaaakaacaaaaadaaaachiaacaaoeibadaaoelaafaaaaadacaachiaabaappia
aaaaoeiaafaaaaadabaachiaabaaoeiaacaaoekaafaaaaadabaachiaabaaoeia
aeaaaakaaeaaaaaeaaaachiaabaaoeiaaaaaoeiaacaaoeiaacaaaaadaaaaaiia
aaaakklaabaaaakaacaaaaadaaaaaiiaaaaappiaaeaaffkaabaaaaacabaaacia
abaaffkaafaaaaadabaachiaabaaffiaadaaoekafiaaaaaeabaachiaaaaappia
abaaoeiaaeaakkkaacaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaaiia
aeaappkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcjaacaaaaeaaaaaaa
keaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaakhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaebaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaaf
pcaabaaaabaaaaaaegaobaaaabaaaaaadiaaaaajicaabaaaaaaaaaaadkaabaia
ebaaaaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaabnaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpabaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaa
afaaaaaaegiccaaaaaaaaaaaahaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 8, 10, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R0, fragment.texcoord[3], texture[1], 2D;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[6].x;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
LG2 R0.w, R0.w;
MAD R2.xyz, R2, c[6].x, -R1;
MAD_SAT R1.w, R1, c[5].z, c[5];
MAD R1.xyz, R1.w, R2, R1;
MOV R1.w, c[2].x;
MUL R0.w, -R0, c[0].x;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R0.xyz, -R0, R1;
MUL R1.xyz, R3, c[3];
MUL R1.xyz, R1, R0;
MUL R0.xyz, R0, R0.w;
ADD R0.w, fragment.texcoord[1].y, c[1].x;
MUL R2.xyz, R1.w, c[4];
SGE R0.w, R0, c[6].z;
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, c[6].y, R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[6].z;
END
# 30 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 8.00000000, -1.00000000, 1.00000000, 0.00000000
def c7, 10.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3
dcl t4.xy
dcl t5
texld r3, t0, s0
texldp r1, t3, s1
texld r2, t4, s2
texld r0, t4, s3
mul_pp r4.xyz, r0.w, r0
dp4 r0.x, t5, t5
rsq r0.x, r0.x
rcp r0.x, r0.x
mul_pp r4.xyz, r4, c6.x
mul_pp r2.xyz, r2.w, r2
mad_pp r2.xyz, r2, c6.x, -r4
mad_sat r0.x, r0, c5.z, c5.w
mad_pp r0.xyz, r0.x, r2, r4
mul_pp r2.xyz, r3, c3
log_pp r1.x, r1.x
log_pp r1.y, r1.y
log_pp r1.z, r1.z
add_pp r1.xyz, -r1, r0
log_pp r0.x, r1.w
mul_pp r0.x, -r0, c0
mul_pp r0.xyz, r1, r0.x
mul_pp r1.xyz, r2, r1
mad_pp r1.xyz, r1, c7.x, r0
add r0.x, t1.y, c1
mov r2.xyz, c4
add r0.x, r0, c6.y
mul r2.xyz, c2.x, r2
cmp r0.x, r0, c6.z, c6.w
mul r0.xyz, r0.x, r2
mov_pp r0.w, c6.z
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 176
Float 64 [_Gloss]
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
Vector 144 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgijkbgfbgenmegakpnncbafcdoldhkhfabaaaaaadaaiaaaaaeaaaaaa
daaaaaaaamadaaaacmahaaaapmahaaaaebgpgodjneacaaaaneacaaaaaaacpppp
iiacaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaaeaaaeaaaaaaaaaaaaaaaaaaajaaabaaaeaa
aaaaaaaaaaacppppfbaaaaafafaaapkaaaaacaebaaaaialpaaaaaaaaaaaaaaeb
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
ajaaaaadaaaaaiiaadaaoelaadaaoelaahaaaaacaaaaabiaaaaappiaagaaaaac
aaaaabiaaaaaaaiaaeaaaaaeaaaadbiaaaaaaaiaaeaakkkaaeaappkaabaaaaac
abaaadiaabaabllaagaaaaacaaaaaciaacaapplaafaaaaadacaaadiaaaaaffia
acaaoelaecaaaaadadaacpiaabaaoeiaadaioekaecaaaaadabaacpiaabaaoeia
acaioekaecaaaaadacaacpiaacaaoeiaabaioekaecaaaaadaeaacpiaaaaaoela
aaaioekaafaaaaadadaaciiaadaappiaafaappkaafaaaaadaaaacoiaadaablia
adaappiaafaaaaadabaaciiaabaappiaafaappkaaeaaaaaeabaachiaabaappia
abaaoeiaaaaablibaeaaaaaeaaaachiaaaaaaaiaabaaoeiaaaaabliaapaaaaac
abaacbiaacaaaaiaapaaaaacabaacciaacaaffiaapaaaaacabaaceiaacaakkia
apaaaaacaaaaciiaacaappiaafaaaaadaaaaciiaaaaappibaaaaaakaacaaaaad
aaaachiaaaaaoeiaabaaoeibafaaaaadabaachiaaaaappiaaaaaoeiaafaaaaad
acaachiaaeaaoeiaacaaoekaafaaaaadacaachiaacaaoeiaafaaaakaaeaaaaae
aaaachiaacaaoeiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaakklaabaaaaka
acaaaaadaaaaaiiaaaaappiaafaaffkaabaaaaacabaaaciaabaaffkaafaaaaad
abaachiaabaaffiaadaaoekafiaaaaaeabaachiaaaaappiaabaaoeiaafaakkka
acaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciiaafaaffkbabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcbiaeaaaaeaaaaaaaagabaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaaeaaaaaa
egbobaaaaeaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaadkiacaaa
aaaaaaaaajaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaacpaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaajicaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaakiacaaa
aaaaaaaaaeaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaa
aaaaaaaaagaaaaaadiaaaaakhcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaacaebaaaacaebaaaacaebaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaiicaabaaaaaaaaaaa
dkbabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaabnaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpabaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaa
afaaaaaaegiccaaaaaaaaaaaahaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"!!ARBfp1.0
PARAM c[6] = { program.local[0..4],
		{ 10, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R0, fragment.texcoord[3], texture[1], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R1.w, c[2].x;
MUL R0.w, R0, c[0].x;
ADD R0.xyz, R0, fragment.texcoord[4];
MUL R1.xyz, R1, c[3];
MUL R1.xyz, R1, R0;
MUL R0.xyz, R0, R0.w;
ADD R0.w, fragment.texcoord[1].y, c[1].x;
MUL R2.xyz, R1.w, c[4];
SGE R0.w, R0, c[5].y;
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, c[5].x, R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[5].y;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c5, -1.00000000, 1.00000000, 0.00000000, 10.00000000
dcl t0.xy
dcl t1.xy
dcl t3
dcl t4.xyz
texld r0, t0, s0
texldp r2, t3, s1
mul_pp r1.xyz, r0, c3
add_pp r2.xyz, r2, t4
mul_pp r0.x, r2.w, c0
mul_pp r0.xyz, r2, r0.x
mul_pp r1.xyz, r1, r2
mad_pp r1.xyz, r1, c5.w, r0
add r0.x, t1.y, c1
mov r2.xyz, c4
add r0.x, r0, c5
mul r2.xyz, c2.x, r2
cmp r0.x, r0, c5.y, c5.z
mul r0.xyz, r0.x, r2
mov_pp r0.w, c5.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
ConstBuffer "$Globals" 144
Float 64 [_Gloss]
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgbifcbnkikhndieaklkciefnegdecnkpabaaaaaaemafaaaaaeaaaaaa
daaaaaaaoeabaaaagaaeaaaabiafaaaaebgpgodjkmabaaaakmabaaaaaaacpppp
heabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaaeaaaaaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaacaeb
aaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadiaaaaappia
acaaoelaecaaaaadabaacpiaaaaaoelaaaaioekaecaaaaadaaaacpiaaaaaoeia
abaioekaafaaaaadabaachiaabaaoeiaacaaoekaafaaaaadabaachiaabaaoeia
aeaaaakaafaaaaadaaaaciiaaaaappiaaaaaaakaacaaaaadaaaachiaaaaaoeia
adaaoelaafaaaaadacaachiaaaaappiaaaaaoeiaaeaaaaaeaaaachiaabaaoeia
aaaaoeiaacaaoeiaacaaaaadaaaaaiiaaaaakklaabaaaakaacaaaaadaaaaaiia
aaaappiaaeaaffkaabaaaaacabaaaciaabaaffkaafaaaaadabaachiaabaaffia
adaaoekafiaaaaaeabaachiaaaaappiaabaaoeiaaeaakkkaacaaaaadaaaachia
aaaaoeiaabaaoeiaabaaaaacaaaaaiiaaeaappkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcheacaaaaeaaaaaaajnaaaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagcbaaaadlcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
agaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaacaeb
aaaacaebaaaacaebaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaa
akiacaaaaaaaaaaaaeaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egbcbaaaaeaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaaaabaaaaaaakiacaaa
aaaaaaaaafaaaaaabnaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaaegiccaaaaaaaaaaa
ahaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadaaaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"!!ARBfp1.0
PARAM c[7] = { program.local[0..5],
		{ 8, 10, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R0, fragment.texcoord[3], texture[1], 2D;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TEX R2, fragment.texcoord[4], texture[2], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R2.xyz, R2.w, R2;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, c[6].x;
DP4 R2.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R2.w;
RCP R1.w, R1.w;
MAD R2.xyz, R2, c[6].x, -R1;
MAD_SAT R1.w, R1, c[5].z, c[5];
MAD R1.xyz, R1.w, R2, R1;
ADD R0.xyz, R0, R1;
MUL R1.xyz, R3, c[3];
MOV R1.w, c[2].x;
MUL R0.w, R0, c[0].x;
MUL R1.xyz, R1, R0;
MUL R0.xyz, R0, R0.w;
ADD R0.w, fragment.texcoord[1].y, c[1].x;
MUL R2.xyz, R1.w, c[4];
SGE R0.w, R0, c[6].z;
MUL R2.xyz, R0.w, R2;
MAD R0.xyz, R1, c[6].y, R0;
ADD result.color.xyz, R0, R2;
MOV result.color.w, c[6].z;
END
# 26 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_Gloss]
Float 1 [_EmissiveStrength]
Float 2 [_EmissiveMul]
Vector 3 [_FeedbackColor]
Vector 4 [_EmissiveColor]
Vector 5 [unity_LightmapFade]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 8.00000000, -1.00000000, 1.00000000, 0.00000000
def c7, 10.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
dcl t3
dcl t4.xy
dcl t5
texld r2, t0, s0
texldp r1, t3, s1
texld r0, t4, s2
texld r3, t4, s3
mul_pp r4.xyz, r0.w, r0
dp4 r0.x, t5, t5
mul_pp r3.xyz, r3.w, r3
mul_pp r3.xyz, r3, c6.x
rsq r0.x, r0.x
rcp r0.x, r0.x
mul_pp r2.xyz, r2, c3
mad_pp r4.xyz, r4, c6.x, -r3
mad_sat r0.x, r0, c5.z, c5.w
mad_pp r0.xyz, r0.x, r4, r3
add_pp r1.xyz, r1, r0
mul_pp r0.x, r1.w, c0
mul_pp r0.xyz, r1, r0.x
mul_pp r1.xyz, r2, r1
mad_pp r1.xyz, r1, c7.x, r0
add r0.x, t1.y, c1
mov r2.xyz, c4
add r0.x, r0, c6.y
mul r2.xyz, c2.x, r2
cmp r0.x, r0, c6.z, c6.w
mul r0.xyz, r0.x, r2
mov_pp r0.w, c6.z
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_LightBuffer] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [unity_LightmapInd] 2D 3
ConstBuffer "$Globals" 176
Float 64 [_Gloss]
Float 80 [_EmissiveStrength]
Float 84 [_EmissiveMul]
Vector 96 [_FeedbackColor]
Vector 112 [_EmissiveColor]
Vector 144 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddbkgipmoanhgniobidacfacimeneoaejabaaaaaaoeahaaaaaeaaaaaa
daaaaaaanmacaaaaoaagaaaalaahaaaaebgpgodjkeacaaaakeacaaaaaaacpppp
fiacaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaaaaaaaaa
abababaaacacacaaadadadaaaaaaaeaaaeaaaaaaaaaaaaaaaaaaajaaabaaaeaa
aaaaaaaaaaacppppfbaaaaafafaaapkaaaaacaebaaaaialpaaaaaaaaaaaaaaeb
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
ajaaaaadaaaaaiiaadaaoelaadaaoelaahaaaaacaaaaabiaaaaappiaagaaaaac
aaaaabiaaaaaaaiaaeaaaaaeaaaadbiaaaaaaaiaaeaakkkaaeaappkaabaaaaac
abaaadiaabaabllaagaaaaacaaaaaciaacaapplaafaaaaadacaaadiaaaaaffia
acaaoelaecaaaaadadaacpiaabaaoeiaadaioekaecaaaaadabaacpiaabaaoeia
acaioekaecaaaaadacaacpiaacaaoeiaabaioekaecaaaaadaeaacpiaaaaaoela
aaaioekaafaaaaadadaaciiaadaappiaafaappkaafaaaaadaaaacoiaadaablia
adaappiaafaaaaadabaaciiaabaappiaafaappkaaeaaaaaeabaachiaabaappia
abaaoeiaaaaablibaeaaaaaeaaaachiaaaaaaaiaabaaoeiaaaaabliaacaaaaad
aaaachiaaaaaoeiaacaaoeiaafaaaaadaaaaciiaacaappiaaaaaaakaafaaaaad
abaachiaaaaappiaaaaaoeiaafaaaaadacaachiaaeaaoeiaacaaoekaafaaaaad
acaachiaacaaoeiaafaaaakaaeaaaaaeaaaachiaacaaoeiaaaaaoeiaabaaoeia
acaaaaadaaaaaiiaaaaakklaabaaaakaacaaaaadaaaaaiiaaaaappiaafaaffka
abaaaaacabaaaciaabaaffkaafaaaaadabaachiaabaaffiaadaaoekafiaaaaae
abaachiaaaaappiaabaaoeiaafaakkkaacaaaaadaaaachiaaaaaoeiaabaaoeia
abaaaaacaaaaciiaafaaffkbabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
pmadaaaaeaaaaaaappaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaa
abaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
pcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaah
bcaabaaaaaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
ckiacaaaaaaaaaaaajaaaaaadkiacaaaaaaaaaaaajaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaabaaaaaaakiacaaaaaaaaaaaaeaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaak
hcaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaacaebaaaacaebaaaacaeb
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaaaabaaaaaaakiacaaa
aaaaaaaaafaaaaaabnaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaaegiccaaaaaaaaaaa
ahaaaaaadcaaaaajhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaiaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
acaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
}