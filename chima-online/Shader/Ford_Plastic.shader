//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Plastic" {
Properties {
 _Color ("Main Color", Color) = (0,0,0,1)
 _Matcap ("Matcap", 2D) = "black" {}
 _ColorAtlas ("Color Atlas", 2D) = "black" {}
 _FeedbackColor ("Feedback Color", Color) = (0,0,0,1)
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
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
"!!ARBvp1.0
PARAM c[26] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[25].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[20];
DP4 R2.y, R0, c[19];
DP4 R2.x, R0, c[18];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[23];
DP4 R3.y, R1, c[22];
DP4 R3.x, R1, c[21];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[24];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
ADD result.texcoord[3].xyz, R3, R2;
MOV R1, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[2].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
"vs_2_0
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c24.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c23
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c13
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT1, v3
mad oT0.xy, r0, c25.y, c25.y
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
Bind "tangent" TexCoord2
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
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedhijenpjcjkpeddcdoeflhcghbbdepnboabaaaaaagaakaaaaaeaaaaaa
daaaaaaajaadaaaapiaiaaaamaajaaaaebgpgodjfiadaaaafiadaaaaaaacpopp
oiacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaaaa
abaaabaaaaaaaaaaaaaacgaaahaaacaaaaaaaaaaabaaaaaaaeaaajaaaaaaaaaa
abaaaiaaadaaanaaaaaaaaaaabaaamaaadaabaaaaaaaaaaaabaabaaaafaabdaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaafaaaaadaaaaadiaacaaffja
aoaaoekaaeaaaaaeaaaaadiaanaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
apaaoekaacaakkjaaaaaoeiaaeaaaaaeaaaaadoaaaaaoeiabiaaaakabiaaaaka
abaaaaacaaaaapiaabaaoekaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaae
abaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoejabhaappkaafaaaaadabaaahia
aaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiabcaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabiaaffkaajaaaaad
abaaabiaacaaoekaaaaaoeiaajaaaaadabaaaciaadaaoekaaaaaoeiaajaaaaad
abaaaeiaaeaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaad
adaaabiaafaaoekaacaaoeiaajaaaaadadaaaciaagaaoekaacaaoeiaajaaaaad
adaaaeiaahaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffib
aeaaaaaeadaaahoaaiaaoekaaaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaadaaoejappppaaaafdeieefcgaafaaaaeaaaabaafiabaaaa
fjaaaaaeegiocaaaaaaaaaaacnaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiacaaaabaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
abaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaabaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaapdccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
aaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabcaaaaaakgikcaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
bdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
aaaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
aaaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
aaaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaaaaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaaaaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaaaaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapapaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
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
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[21];
DP4 R2.y, R0, c[20];
DP4 R2.x, R0, c[19];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[24];
DP4 R3.y, R1, c[23];
DP4 R3.x, R1, c[22];
MOV R1.xyz, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[25];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[18];
ADD result.texcoord[3].xyz, R3, R2;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[1], vertex.texcoord[0];
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
END
# 42 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"vs_2_0
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c26.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c21
dp4 r2.y, r0, c20
dp4 r2.x, r0, c19
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c24
dp4 r3.y, r1, c23
dp4 r3.x, r1, c22
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c25
mov r0.xyz, v1
add oT3.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c13
dp4 r3.y, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.y
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c17.zwzw, r1
mov oT1, v3
mov oT4.zw, r0
mad oT0.xy, r0, c27.y, c27.y
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
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
eefieceddfbpaebkkhgmglpldakjonelgnddgnpaabaaaaaahialaaaaaeaaaaaa
daaaaaaaoiadaaaapiajaaaamaakaaaaebgpgodjlaadaaaalaadaaaaaaacpopp
deadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaacgaaahaaadaaaaaaaaaa
acaaaaaaaeaaakaaaaaaaaaaacaaaiaaadaaaoaaaaaaaaaaacaaamaaadaabbaa
aaaaaaaaacaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
afaaaaadaaaaadiaacaaffjaapaaoekaaeaaaaaeaaaaadiaaoaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiabaaaoekaacaakkjaaaaaoeiaaeaaaaaeaaaaadoa
aaaaoeiabjaaaakabjaaaakaabaaaaacaaaaapiaacaaoekaafaaaaadabaaahia
aaaaffiabfaaoekaaeaaaaaeabaaahiabeaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabgaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
biaappkaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaaliabbaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabjaaffkaajaaaaadabaaabiaadaaoekaaaaaoeiaajaaaaadabaaacia
aeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaadadaaacia
ahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaajaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaakaafaaaaad
abaaaiiaabaaaaiabjaaaakaafaaaaadabaaafiaaaaapeiabjaaaakaacaaaaad
aeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacabaaapoa
adaaoejappppaaaafdeieefcaiagaaaaeaaaabaaicabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaapdccabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaa
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
adaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaabaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapapaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
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
"!!ARBvp1.0
PARAM c[34] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[33].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[19];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[18];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[20];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[21];
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
MUL R1.xyz, R0.y, c[23];
MAD R1.xyz, R0.x, c[22], R1;
MAD R0.xyz, R0.z, c[24], R1;
MAD R1.xyz, R0.w, c[25], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[31];
DP4 R3.y, R0, c[30];
DP4 R3.x, R0, c[29];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[28];
DP4 R2.y, R4, c[27];
DP4 R2.x, R4, c[26];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[32];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[17];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 68 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [unity_Scale]
"vs_2_0
def c33, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c32.w
dp4 r0.x, v0, c9
add r1, -r0.x, c18
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c33.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c33.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.z
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c12
dp4 r3.x, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT1, v3
mad oT0.xy, r0, c33.x, c33.x
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
Bind "tangent" TexCoord2
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
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedfpcgnomcehepmjfginplikcphlgbpfgeabaaaaaakiapaaaaaeaaaaaa
daaaaaaaiiafaaaaeaaoaaaaaiapaaaaebgpgodjfaafaaaafaafaaaaaaacpopp
oaaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaaaa
abaaabaaaaaaaaaaaaaaacaaaiaaacaaaaaaaaaaaaaacgaaahaaakaaaaaaaaaa
abaaaaaaaeaabbaaaaaaaaaaabaaaiaaadaabfaaaaaaaaaaabaaamaaajaabiaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaafaaaaadaaaaadiaacaaffja
bgaaoekaaeaaaaaeaaaaadiabfaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
bhaaoekaacaakkjaaaaaoeiaaeaaaaaeaaaaadoaaaaaoeiacbaaaakacbaaaaka
abaaaaacaaaaapiaabaaoekaafaaaaadabaaahiaaaaaffiabnaaoekaaeaaaaae
abaaahiabmaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaboaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabpaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffjabjaaoekaaeaaaaaeaaaaahia
biaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabkaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiablaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaakkib
aeaaoekaacaaaaadacaaapiaaaaaaaibacaaoekaacaaaaadaaaaapiaaaaaffib
adaaoekaafaaaaadadaaahiaacaaoejacaaappkaafaaaaadaeaaahiaadaaffia
bjaaoekaaeaaaaaeadaaaliabiaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahia
bkaaoekaadaakkiaadaapeiaafaaaaadaeaaapiaaaaaoeiaadaaffiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaacaaoeiaacaaoeiaaaaaoeia
aeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeiaaeaaaaaeacaaapiaabaaoeia
adaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeiaabaaoeiaaaaaoeiaahaaaaac
abaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffiaahaaaaacabaaaeiaaaaakkia
ahaaaaacabaaaiiaaaaappiaabaaaaacaeaaaciacbaaffkaaeaaaaaeaaaaapia
aaaaoeiaafaaoekaaeaaffiaafaaaaadabaaapiaabaaoeiaacaaoeiaalaaaaad
abaaapiaabaaoeiacbaakkkaagaaaaacacaaabiaaaaaaaiaagaaaaacacaaacia
aaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaacacaaaiiaaaaappiaafaaaaad
aaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaae
abaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappiaaaaaoeiaabaaaaacadaaaiia
cbaaffkaajaaaaadabaaabiaakaaoekaadaaoeiaajaaaaadabaaaciaalaaoeka
adaaoeiaajaaaaadabaaaeiaamaaoekaadaaoeiaafaaaaadacaaapiaadaacjia
adaakeiaajaaaaadaeaaabiaanaaoekaacaaoeiaajaaaaadaeaaaciaaoaaoeka
acaaoeiaajaaaaadaeaaaeiaapaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
aeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffiaaeaaaaaeaaaaaiiaadaaaaia
adaaaaiaaaaappibaeaaaaaeabaaahiabaaaoekaaaaappiaabaaoeiaacaaaaad
adaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabcaaoekaaeaaaaae
aaaaapiabbaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabdaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
adaaoejappppaaaafdeieefclaaiaaaaeaaaabaacmacaaaafjaaaaaeegiocaaa
aaaaaaaacnaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
pcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaa
abaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
abaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaa
abaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaa
egiccaaaabaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
baaaaaaaagiacaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaa
aaaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
abaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaabbaaaaaibcaabaaaabaaaaaaegiocaaaaaaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaaaaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaaaaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaaaaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaaaaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaaaaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaa
aaaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
aaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaaaaaaaaa
acaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaa
aaaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaa
aaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaa
adaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaa
egiocaaaaaaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
adaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaaaaaaaaaagaaaaaa
agaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapapaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
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
DP4 R3.z, R0, c[32];
DP4 R3.y, R0, c[31];
DP4 R3.x, R0, c[30];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[33];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[18];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[2].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.texcoord[1], vertex.texcoord[0];
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
END
# 73 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
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
"vs_2_0
def c35, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c34.w
dp4 r0.x, v0, c9
add r1, -r0.x, c20
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c19
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c35.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c21
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c22
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c35.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.z
mul r0, r0, r1
mul r1.xyz, r0.y, c24
mad r1.xyz, r0.x, c23, r1
mad r0.xyz, r0.z, c25, r1
mad r1.xyz, r0.w, c26, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c32
dp4 r3.y, r0, c31
dp4 r3.x, r0, c30
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c33
dp4 r2.z, r4, c29
dp4 r2.y, r4, c28
dp4 r2.x, r4, c27
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c12
dp4 r3.x, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c35.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c17.zwzw, r1
mov oT1, v3
mov oT4.zw, r0
mad oT0.xy, r0, c35.x, c35.x
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "UnityPerCamera" 128
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
eefiecedopjmpcnaddijchabaedmhhdpbngopnfpabaaaaaamabaaaaaaeaaaaaa
daaaaaaaoaafaaaaeaapaaaaaibaaaaaebgpgodjkiafaaaakiafaaaaaaacpopp
cmafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaa
abaacgaaahaaalaaaaaaaaaaacaaaaaaaeaabcaaaaaaaaaaacaaaiaaadaabgaa
aaaaaaaaacaaamaaajaabjaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
afaaaaadaaaaadiaacaaffjabhaaoekaaeaaaaaeaaaaadiabgaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiabiaaoekaacaakkjaaaaaoeiaaeaaaaaeaaaaadoa
aaaaoeiaccaaaakaccaaaakaabaaaaacaaaaapiaacaaoekaafaaaaadabaaahia
aaaaffiaboaaoekaaeaaaaaeabaaahiabnaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabpaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiacaaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
bkaaoekaaeaaaaaeaaaaahiabjaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
blaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibafaaoekaacaaaaadacaaapiaaaaaaaibadaaoeka
acaaaaadaaaaapiaaaaaffibaeaaoekaafaaaaadadaaahiaacaaoejacbaappka
afaaaaadaeaaahiaadaaffiabkaaoekaaeaaaaaeadaaaliabjaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiablaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaacia
ccaaffkaaeaaaaaeaaaaapiaaaaaoeiaagaaoekaaeaaffiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiaccaakkkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiaccaaffkaajaaaaadabaaabiaalaaoekaadaaoeia
ajaaaaadabaaaciaamaaoekaadaaoeiaajaaaaadabaaaeiaanaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaaoaaoekaacaaoeia
ajaaaaadaeaaaciaapaaoekaacaaoeiaajaaaaadaeaaaeiabaaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabbaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaakaafaaaaadabaaaiiaabaaaaia
ccaaaakaafaaaaadabaaafiaaaaapeiaccaaaakaacaaaaadaeaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacabaaapoaadaaoejappppaaaa
fdeieefcfiajaaaaeaaaabaafgacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
ahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaa
acaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaa
acaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaapdccabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
abaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaacaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaacaaaaaa
egaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaa
abaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaa
abaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaa
cmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaa
adaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaa
abaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaa
egiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaa
adaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaa
agaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaa
egaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaa
eeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaa
egaobaaaadaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaa
abaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
abaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapapaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
ADD R0.w, R0, c[1];
MUL R1.xyz, R1, R0.w;
ADD R0.xyz, R0, c[1];
MAD R0.xyz, R1, c[3].y, R0;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R0.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[2].z, c[3].x;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[3].y, R1;
ADD result.color.xyz, R0, c[2];
MOV result.color.w, c[3].z;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
texld r0, t1, s0
texld r1, t0, s1
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c3.y, r2
mul_pp r2.xyz, r0, t3
mul_pp r1.xyz, r0, c0
max_pp r0.x, t2.z, c3
mul_pp r0.xyz, r0.x, r1
mad_pp r0.xyz, r0, c3.y, r2
mov_pp r0.w, c3.z
add_pp r0.xyz, r0, c2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_Matcap] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Vector 48 [_Color]
Vector 64 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmcmgpbialhgjhppokhcbmgcbpjiahhhpabaaaaaaliaeaaaaaeaaaaaa
daaaaaaameabaaaaoeadaaaaieaeaaaaebgpgodjimabaaaaimabaaaaaaacpppp
eiabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaacaaabaaaaaaaaaaaaacpppp
fbaaaaafadaaapkaaaaaaaeaaaaaaaaaaaaaiadpaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaecaaaaadabaacpiaabaaoelaabaioeka
acaaaaadaaaaaiiaabaappiaabaappkaacaaaaadabaaahiaabaaoeiaabaaoeka
afaaaaadaaaaahiaaaaappiaaaaaoeiaaeaaaaaeaaaachiaaaaaoeiaadaaaaka
abaaoeiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeia
adaaoelaalaaaaadaaaaciiaacaakklaadaaffkaacaaaaadaaaaciiaaaaappia
aaaappiaaeaaaaaeaaaachiaabaaoeiaaaaappiaaaaaoeiaacaaaaadaaaachia
aaaaoeiaacaaoekaabaaaaacaaaaciiaadaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcbiacaaaaeaaaaaaaigaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaadgajbaaaabaaaaaadgijcaaa
aaaaaaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaa
abaaaaaadcaaaaamhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaaajgahbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaackbabaaa
adaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaaihccabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
TXP R2.x, fragment.texcoord[4], texture[2], 2D;
ADD R0.w, R0, c[1];
MUL R1.xyz, R1, R0.w;
ADD R0.xyz, R0, c[1];
MAD R0.xyz, R1, c[3].y, R0;
MUL R1.xyz, R0, fragment.texcoord[3];
MAX R0.w, fragment.texcoord[2].z, c[3].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R2.x;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[3].y, R1;
ADD result.color.xyz, R0, c[2];
MOV result.color.w, c[3].z;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
Vector 2 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c3, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r3, t4, s2
texld r0, t1, s0
texld r1, t0, s1
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c3.y, r2
mul_pp r2.xyz, r0, t3
mul_pp r1.xyz, r0, c0
max_pp r0.x, t2.z, c3
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mad_pp r0.xyz, r0, c3.y, r2
mov_pp r0.w, c3.z
add_pp r0.xyz, r0, c2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 112 [_Color]
Vector 128 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedomkfognjonfhbgpkannihdaecnflfflbabaaaaaajeafaaaaaeaaaaaa
daaaaaaacaacaaaakiaeaaaagaafaaaaebgpgodjoiabaaaaoiabaaaaaaacpppp
kaabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaacaaabaaaaaaaaaa
aaacppppfbaaaaafadaaapkaaaaaaaeaaaaaaaaaaaaaiadpaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaac
aaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappiaaeaaoelaecaaaaadaaaacpia
aaaaoeiaaaaioekaecaaaaadabaaapiaaaaaoelaabaioekaecaaaaadacaacpia
abaaoelaacaioekaafaaaaadabaaciiaaaaaaaiaacaakklafiaaaaaeabaaciia
acaakklaabaappiaadaaffkaacaaaaadabaaciiaabaappiaabaappiaacaaaaad
acaaaiiaacaappiaabaappkaacaaaaadaaaaahiaacaaoeiaabaaoekaafaaaaad
abaaahiaabaaoeiaacaappiaaeaaaaaeaaaachiaabaaoeiaadaaaakaaaaaoeia
afaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoela
aeaaaaaeaaaachiaabaaoeiaabaappiaaaaaoeiaacaaaaadaaaachiaaaaaoeia
acaaoekaabaaaaacaaaaciiaadaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefciaacaaaaeaaaaaaakaaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadeaaaaahccaabaaaaaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaaaaaaaaaipcaabaaaacaaaaaadgajbaaaacaaaaaadgijcaaaaaaaaaaa
ahaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagaabaaaacaaaaaa
dcaaaaamocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaea
aaaaaaeaaaaaaaeafgaobaaaacaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaaihccabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
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
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 27 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT3.z, r0, c18
dp4 oT3.y, r0, c17
dp4 oT3.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT1, v3
mad oT0.xy, r0, c22.x, c22.x
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
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjhifhaaabpbkpdcodofmmjhcnpelkjobabaaaaaafiajaaaaaeaaaaaa
daaaaaaaceadaaaapaahaaaaliaiaaaaebgpgodjomacaaaaomacaaaaaaacpopp
iiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaafaaaaadaaaaadiaacaaffjaalaaoekaaeaaaaaeaaaaadia
akaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaamaaoekaacaakkjaaaaaoeia
aeaaaaaeaaaaadoaaaaaoeiabgaaaakabgaaaakaabaaaaacaaaaapiaafaaoeka
afaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
beaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejb
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapia
agaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaadaaoeja
ppppaaaafdeieefcmeaeaaaaeaaaabaadbabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
fgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
aaaaaaaadcaaaaapdccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..13] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[13];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mov r0, c9
dp4 r3.y, c12, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c12, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT1, v3
mad oT0.xy, r0, c13.x, c13.x
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
Bind "tangent" TexCoord2
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecednkdhfglpppedkocconhphmelhehbaamoabaaaaaabaahaaaaaeaaaaaa
daaaaaaagmacaaaamaafaaaaiiagaaaaebgpgodjdeacaaaadeacaaaaaaacpopp
nmabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaaaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaaiaaadaaagaaaaaaaaaa
abaabaaaaeaaajaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaafaaaaad
aaaaadiaacaaffjaahaaoekaaeaaaaaeaaaaadiaagaaoekaacaaaajaaaaaoeia
aeaaaaaeaaaaadiaaiaaoekaacaakkjaaaaaoeiaaeaaaaaeaaaaadoaaaaaoeia
anaaaakaanaaaakaabaaaaacaaaaapiaabaaoekaafaaaaadabaaahiaaaaaffia
akaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
alaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaappiaaaaaoeia
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaadaaoeka
aeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaeaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
abaaapoaadaaoejappppaaaafdeieefcemadaaaaeaaaabaandaaaaaafjaaaaae
egiocaaaaaaaaaaaabaaaaaafjaaaaaeegiocaaaabaaaaaabeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaabaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaabaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaadaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaa
aaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
abaaaaaabcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapapaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
heaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[12];
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[3].w, R0, c[20];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp4 r0.w, v0, c11
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.z, v0, c10
dp4 oT3.w, r0, c19
dp4 oT3.z, r0, c18
dp4 oT3.y, r0, c17
dp4 oT3.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT1, v3
mad oT0.xy, r0, c22.x, c22.x
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
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedkcacnboachmgckdlcnnnbojpljdajdknabaaaaaafiajaaaaaeaaaaaa
daaaaaaaceadaaaapaahaaaaliaiaaaaebgpgodjomacaaaaomacaaaaaaacpopp
iiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaafaaaaadaaaaadiaacaaffjaalaaoekaaeaaaaaeaaaaadia
akaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaamaaoekaacaakkjaaaaaoeia
aeaaaaaeaaaaadoaaaaaoeiabgaaaakabgaaaakaabaaaaacaaaaapiaafaaoeka
afaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
beaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejb
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaad
abaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaapoaaeaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapia
agaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaadaaoeja
ppppaaaafdeieefcmeaeaaaaeaaaabaadbabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
fgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
aaaaaaaadcaaaaapdccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaeaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[3].z, R0, c[19];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 27 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
mul r2.xyz, r1, v1.w
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT3.z, r0, c18
dp4 oT3.y, r0, c17
dp4 oT3.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mov oT1, v3
mad oT0.xy, r0, c22.x, c22.x
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
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjhifhaaabpbkpdcodofmmjhcnpelkjobabaaaaaafiajaaaaaeaaaaaa
daaaaaaaceadaaaapaahaaaaliaiaaaaebgpgodjomacaaaaomacaaaaaaacpopp
iiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaafaaaaadaaaaadiaacaaffjaalaaoekaaeaaaaaeaaaaadia
akaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaamaaoekaacaakkjaaaaaoeia
aeaaaaaeaaaaadoaaaaaoeiabgaaaakabgaaaakaabaaaaacaaaaapiaafaaoeka
afaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
beaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejb
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapia
agaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaadaaoeja
ppppaaaafdeieefcmeaeaaaaeaaaabaadbabaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaadpcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
fgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaa
aaaaaaaadcaaaaapdccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[22] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[21];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[3].y, R0, c[18];
DP4 result.texcoord[3].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[1], vertex.texcoord[0];
MAD result.texcoord[0].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_WorldSpaceLightPos0]
"vs_2_0
def c21, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c20, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT3.y, r0, c17
dp4 oT3.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mov oT1, v3
mad oT0.xy, r0, c21.x, c21.x
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
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedhlfelnlbligmlamapodbnagandmmpdjhabaaaaaabiajaaaaaeaaaaaa
daaaaaaabaadaaaalaahaaaahiaiaaaaebgpgodjniacaaaaniacaaaaaaacpopp
heacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaaiaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaafaaaaadaaaaadiaacaaffjaalaaoekaaeaaaaaeaaaaadia
akaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaamaaoekaacaakkjaaaaaoeia
aeaaaaaeaaaaadoaaaaaoeiabfaaaakabfaaaakaabaaaaacaaaaapiaafaaoeka
afaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
beaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadia
abaaobkaaaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeia
aeaaaaaeaaaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffja
ahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaadaaoejappppaaaafdeieefcjiaeaaaaeaaaabaacgabaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaadpcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egaabaaaaaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaagaebaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
acaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaapdccabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
ADD R0.w, R0, c[1];
MUL R1.xyz, R1, R0.w;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.xyz, R0, c[1];
RSQ R0.w, R0.w;
MAD R0.xyz, R1, c[2].y, R0;
MUL R0.w, R0, fragment.texcoord[2].z;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[2].x;
MOV result.color.w, c[2].x;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
texld r2, t1, s0
texld r1, t0, s1
dp3 r0.x, t3, t3
mov r0.xy, r0.x
add_pp r2.xyz, r2, c1
mov_pp r0.w, c2.x
texld r3, r0, s2
add_pp r0.x, r2.w, c1.w
mul r1.xyz, r1, r0.x
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t2
mad r1.xyz, r1, c2.y, r2
max_pp r0.x, r0.z, c2
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkmbifdenbbckjobhknnakoghfajkmaglabaaaaaaheafaaaaaeaaaaaa
daaaaaaabmacaaaakaaeaaaaeaafaaaaebgpgodjoeabaaaaoeabaaaaaaacpppp
jmabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaaeaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaaiiaadaaoelaadaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaaapiaaaaaoelaabaioekaecaaaaadacaacpiaabaaoelaacaioekaaiaaaaad
abaaciiaacaaoelaacaaoelaahaaaaacabaaciiaabaappiaafaaaaadabaaciia
abaappiaacaakklaafaaaaadaaaacbiaaaaaaaiaabaappiafiaaaaaeabaaciia
abaappiaaaaaaaiaacaaffkaacaaaaadabaaciiaabaappiaabaappiaacaaaaad
acaaaiiaacaappiaabaappkaacaaaaadaaaaahiaacaaoeiaabaaoekaafaaaaad
abaaahiaabaaoeiaacaappiaaeaaaaaeaaaachiaabaaoeiaacaaaakaaaaaoeia
afaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappiaaaaaoeia
abaaaaacaaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
hmacaaaaeaaaaaaajpaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaaaadaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
aaaaaaaipcaabaaaacaaaaaadgajbaaaacaaaaaadgijcaaaaaaaaaaaahaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagaabaaaacaaaaaadcaaaaam
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaeaaaaaaaea
aaaaaaeafgaobaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
ADD R0.w, R0, c[1];
MUL R1.xyz, R1, R0.w;
ADD R0.xyz, R0, c[1];
MAD R0.xyz, R1, c[2].y, R0;
MUL R0.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[2].z, c[2].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
texld r0, t1, s0
texld r1, t0, s1
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c2.y, r2
mul_pp r1.xyz, r0, c0
max_pp r0.x, t2.z, c2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_Matcap] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Vector 48 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkmmibkmmoclckobfaihmipoigoblebplabaaaaaacaaeaaaaaeaaaaaa
daaaaaaajeabaaaageadaaaaomadaaaaebgpgodjfmabaaaafmabaaaaaaacpppp
biabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaeaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaaapiaaaaaoela
aaaioekaecaaaaadabaacpiaabaaoelaabaioekaacaaaaadaaaaaiiaabaappia
abaappkaacaaaaadabaaahiaabaaoeiaabaaoekaafaaaaadaaaaahiaaaaappia
aaaaoeiaaeaaaaaeaaaachiaaaaaoeiaacaaaakaabaaoeiaafaaaaadaaaachia
aaaaoeiaaaaaoekaalaaaaadaaaaciiaacaakklaacaaffkaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
acaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmiabaaaaeaaaaaaa
hcaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaaddcbabaaa
acaaaaaagcbaaaadecbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaaaaaaaaaipcaabaaaabaaaaaadgajbaaaabaaaaaa
dgijcaaaaaaaaaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
agaabaaaabaaaaaadcaaaaamhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaajgahbaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadeaaaaahicaabaaa
aaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[1], texture[0], 2D;
RCP R0.x, fragment.texcoord[3].w;
MAD R1.xy, fragment.texcoord[3], R0.x, c[2].z;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
ADD R2.w, R2, c[1];
MOV result.color.w, c[2].x;
TEX R1.w, R1, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, R0.w, texture[3], 2D;
ADD R1.xyz, R2, c[1];
MUL R0.xyz, R0, R2.w;
MAD R0.xyz, R0, c[2].y, R1;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
SLT R1.y, c[2].x, fragment.texcoord[3].z;
MUL R1.y, R1, R1.w;
MUL R1.y, R1, R0.w;
MUL R1.x, R1, fragment.texcoord[2].z;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3
dp3 r1.x, t3, t3
mov r1.xy, r1.x
rcp r0.x, t3.w
mad r0.xy, t3, r0.x, c2.x
texld r3, r1, s3
texld r2, r0, s2
texld r0, t1, s0
texld r1, t0, s1
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c2.w, r2
mul_pp r2.xyz, r0, c0
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t2
cmp r1.x, -t3.z, c2.y, c2.z
mul_pp r1.x, r1, r2.w
mul_pp r0.x, r1, r3
max_pp r1.x, r0.z, c2.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c2.w
mov_pp r0.w, c2.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_ColorAtlas] 2D 3
SetTexture 1 [_Matcap] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhhbfgikgdafoghaedelkahabkelechfhabaaaaaamiagaaaaaeaaaaaa
daaaaaaahmacaaaapeafaaaajeagaaaaebgpgodjeeacaaaaeeacaaaaaaacpppp
piabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaacaaaaaa
adababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaeaaaaaaadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
agaaaaacaaaaaiiaadaapplaaeaaaaaeaaaaadiaadaaoelaaaaappiaacaaffka
aiaaaaadabaaaiiaadaaoelaadaaoelaabaaaaacabaaadiaabaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaabaioekaecaaaaad
acaaapiaaaaaoelaacaioekaecaaaaadadaacpiaabaaoelaadaioekaafaaaaad
acaaaiiaaaaappiaabaaaaiaaiaaaaadaaaacbiaacaaoelaacaaoelaahaaaaac
aaaacbiaaaaaaaiaafaaaaadaaaacbiaaaaaaaiaacaakklaalaaaaadabaacbia
aaaaaaiaacaakkkaafaaaaadacaaciiaacaappiaabaaaaiafiaaaaaeacaaciia
adaakklbacaakkkaacaappiaacaaaaadacaaciiaacaappiaacaappiaacaaaaad
adaaaiiaadaappiaabaappkaacaaaaadaaaaahiaadaaoeiaabaaoekaafaaaaad
abaaahiaacaaoeiaadaappiaaeaaaaaeaaaachiaabaaoeiaacaaaakaaaaaoeia
afaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeia
abaaaaacaaaaaiiaacaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
haadaaaaeaaaaaaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaaddcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
aeaaaaaapgbpbaaaaeaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaaeaaaaaaabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
adaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
adaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaackbabaaaadaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaa
dgajbaaaacaaaaaadgijcaaaaaaaaaaaahaaaaaadiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaaagaabaaaacaaaaaadcaaaaamocaabaaaaaaaaaaafgaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaeaaaaaaaeaaaaaaaeafgaobaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[1], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R1.w, fragment.texcoord[3], texture[3], CUBE;
ADD R1.x, R2.w, c[1].w;
MUL R0.xyz, R0, R1.x;
ADD R1.xyz, R2, c[1];
MAD R0.xyz, R0, c[2].y, R1;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R2.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R2.x;
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, fragment.texcoord[2].z;
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[2], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[2].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s1
texld r2, t3, s3
dp3 r0.x, t3, t3
mov r0.xy, r0.x
texld r3, r0, s2
texld r0, t1, s0
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c2.y, r2
mul_pp r1.xyz, r0, c0
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t2
max_pp r2.x, r0.z, c2
mul r0.x, r3, r2.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 3
SetTexture 1 [_Matcap] 2D 2
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgjombedhilehdpnkejcacajggghfhcglabaaaaaapmafaaaaaeaaaaaa
daaaaaaaeiacaaaaciafaaaamiafaaaaebgpgodjbaacaaaabaacaaaaaaacpppp
meabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaadaaaaaa
acababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaeaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
aiaaaaadaaaaaiiaadaaoelaadaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaaapiaaaaaoeiaabaioekaecaaaaadabaaapiaadaaoelaaaaioekaecaaaaad
acaaapiaaaaaoelaacaioekaecaaaaadadaacpiaabaaoelaadaioekaafaaaaad
acaaciiaaaaaaaiaabaappiaaiaaaaadaaaacbiaacaaoelaacaaoelaahaaaaac
aaaacbiaaaaaaaiaafaaaaadaaaacbiaaaaaaaiaacaakklaalaaaaadabaacbia
aaaaaaiaacaaffkaafaaaaadacaaciiaacaappiaabaaaaiaacaaaaadacaaciia
acaappiaacaappiaacaaaaadadaaaiiaadaappiaabaappkaacaaaaadaaaaahia
adaaoeiaabaaoekaafaaaaadabaaahiaacaaoeiaadaappiaaeaaaaaeaaaachia
abaaoeiaacaaaakaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaacaappiaaaaaoeiaabaaaaacaaaaaiiaacaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcniacaaaaeaaaaaaalgaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaagaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaaabaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckbabaaaadaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaadaaaaaaaaaaaaaipcaabaaaacaaaaaadgajbaaaacaaaaaadgijcaaa
aaaaaaaaahaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagaabaaa
acaaaaaadcaaaaamocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaeaaaaaaaeaaaaaaaeafgaobaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R1.w, fragment.texcoord[3], texture[2], 2D;
ADD R0.w, R0, c[1];
MUL R1.xyz, R1, R0.w;
ADD R0.xyz, R0, c[1];
MAD R0.xyz, R1, c[2].y, R0;
MAX R0.w, fragment.texcoord[2].z, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].y;
MOV result.color.w, c[2].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Vector 1 [_Color]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyz
dcl t3.xy
texld r0, t1, s0
texld r1, t0, s1
texld r2, t3, s2
add_pp r2.xyz, r0, c1
add_pp r0.x, r0.w, c1.w
mul r0.xyz, r1, r0.x
mad r0.xyz, r0, c2.y, r2
mul_pp r1.xyz, r0, c0
max_pp r0.x, t2.z, c2
mul_pp r0.x, r0, r2.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.y
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 112 [_Color]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfbkfkkfbenijncfckdppfkfhammloejbabaaaaaameaeaaaaaeaaaaaa
daaaaaaaneabaaaapaadaaaajaaeaaaaebgpgodjjmabaaaajmabaaaaaaacpppp
feabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaaeaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaja
acaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadabaaapiaaaaaoelaabaioeka
ecaaaaadacaacpiaabaaoelaacaioekaecaaaaadaaaacpiaaaaaoeiaaaaioeka
acaaaaadabaaaiiaacaappiaabaappkaacaaaaadaaaaahiaacaaoeiaabaaoeka
afaaaaadabaaahiaabaappiaabaaoeiaaeaaaaaeaaaachiaabaaoeiaacaaaaka
aaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaaciiaaaaappia
acaakklafiaaaaaeaaaaciiaacaakklaaaaappiaacaaffkaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
acaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbeacaaaaeaaaaaaa
ifaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaaipcaabaaaabaaaaaa
dgajbaaaabaaaaaadgijcaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaagaabaaaabaaaaaadcaaaaamhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaajgahbaaaabaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadeaaaaahicaabaaaaaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
Fallback "Diffuse"
}