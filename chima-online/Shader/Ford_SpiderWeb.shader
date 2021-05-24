//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_spiderWb" {
Properties {
 _MainTex ("Texture", 2D) = "gray" {}
 _BGTex ("BG Texture", 2D) = "white" {}
 _SurfaceDir ("Surface Direction ", 2D) = "white" {}
 _specOpac ("blend Mutiplier", Float) = 0.5
 _emission ("emission Power", Float) = 1
 _Parallax ("Height", Range(0,5)) = 0.02
 _rot ("rotation", Range(0,1)) = 0
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c9.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT1.xyz, -r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c11.x
mad oT0.xy, v2, c10, c10.zwzw
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfmpdknkcdilabgpfnjcgbdhffcaecgkaabaaaaaafiagaaaaaeaaaaaa
daaaaaaabaacaaaapaaeaaaaliafaaaaebgpgodjniabaaaaniabaaaaaaacpopp
heabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafamaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoejaalaappka
afaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappja
aaaaoeiaacaaaaadabaaahoaaaaaoeibacaaoekaafaaaaadaaaaapiaaaaaffja
aeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacadaaahoaamaaaakappppaaaafdeieefcniacaaaaeaaaabaalgaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
acaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaihccabaaaaeaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { { 0.5, 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.texcoord[4].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mov oPos, r0
mul r1.y, r1, c9.x
mad oT4.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT4.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT1.xyz, -r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c13.y
mad oT0.xy, v2, c12, c12.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedphlipfobjamfmnpdmmmildmbmcgifmaaabaaaaaafeahaaaaaeaaaaaa
daaaaaaafmacaaaaneafaaaajmagaaaaebgpgodjceacaaaaceacaaaaaaacpopp
maabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaaeaaaiaaaaaaaaaaacaabeaaabaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafanaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoejaamaappka
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaajaaoekaaeaaaaaeaaaaahiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappja
aaaaoeiaacaaaaadabaaahoaaaaaoeibacaaoekaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaiaanaaaaka
afaaaaadabaaafiaaaaapeiaanaaaakaacaaaaadaeaaadoaabaakkiaabaaomia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaeaaamoaaaaaoeiaabaaaaacadaaahoaanaaffkappppaaaafdeieefc
haadaaaaeaaaabaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaa
abaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaihccabaaa
aeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[10].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c9.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT1.xyz, -r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c11.x
mad oT0.xy, v2, c10, c10.zwzw
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfmpdknkcdilabgpfnjcgbdhffcaecgkaabaaaaaafiagaaaaaeaaaaaa
daaaaaaabaacaaaapaaeaaaaliafaaaaebgpgodjniabaaaaniabaaaaaaacpopp
heabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafamaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoejaalaappka
afaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappja
aaaaoeiaacaaaaadabaaahoaaaaaoeibacaaoekaafaaaaadaaaaapiaaaaaffja
aeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacadaaahoaamaaaakappppaaaafdeieefcniacaaaaeaaaabaalgaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
acaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaihccabaaaaeaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { { 0.5, 0 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[10].x;
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.texcoord[4].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[1].xyz, -R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mov oPos, r0
mul r1.y, r1, c9.x
mad oT4.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oT4.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT1.xyz, -r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c13.y
mad oT0.xy, v2, c12, c12.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedphlipfobjamfmnpdmmmildmbmcgifmaaabaaaaaafeahaaaaaeaaaaaa
daaaaaaafmacaaaaneafaaaajmagaaaaebgpgodjceacaaaaceacaaaaaaacpopp
maabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaaeaaaiaaaaaaaaaaacaabeaaabaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafanaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaacaaoejaamaappka
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaajaaoekaaeaaaaaeaaaaahiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappja
aaaaoeiaacaaaaadabaaahoaaaaaoeibacaaoekaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaiaanaaaaka
afaaaaadabaaafiaaaaapeiaanaaaakaacaaaaadaeaaadoaabaakkiaabaaomia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaeaaamoaaaaaoeiaabaaaaacadaaahoaanaaffkappppaaaafdeieefc
haadaaaaeaaaabaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaacaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaa
abaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaihccabaaa
aeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
Float 3 [_Parallax]
SetTexture 0 [_BGTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEX R1.x, fragment.texcoord[0], texture[1], 2D;
ADD R0.w, R1.x, c[2].x;
DP3 R0.x, fragment.texcoord[1].xzyw, fragment.texcoord[1].xzyw;
RSQ R0.x, R0.x;
MUL R0.xy, R0.x, fragment.texcoord[1].xzzw;
MAD R0.xy, R0, c[3].x, fragment.texcoord[0];
MAD R0.xy, fragment.texcoord[0], c[4].z, R0;
ADD R0.w, -R0, c[4].y;
MOV result.color.w, c[4].x;
TEX R0.xyz, R0, texture[0], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R0, fragment.texcoord[3];
DP3 R0.w, fragment.texcoord[2], c[0];
MUL R0.xyz, R0, c[1];
MAX R0.w, R0, c[4].x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[4].w, R1;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
Float 3 [_Parallax]
SetTexture 0 [_BGTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c4, 0.50000000, 1.00000000, 0.00000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
mov r1.yz, t1.wzyx
mov r0.yz, t1.wzyx
mov r1.x, t1
mov r0.x, t1
dp3 r0.x, r1, r0
mov r1.y, t1.z
mov r1.x, t1
rsq r0.x, r0.x
mul r0.xy, r0.x, r1
mad r0.xy, r0, c3.x, t0
mad r1.xy, t0, c4.x, r0
texld r0, t0, s1
texld r1, r1, s0
add r0.x, r0, c2
add r0.x, -r0, c4.y
mul_pp r1.xyz, r0.x, r1
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t2, c0
max_pp r0.x, r0, c4.z
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mov_pp r0.w, c4.z
mad_pp r0.xyz, r0, c4.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_BGTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Float 48 [_specOpac]
Float 56 [_Parallax]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedccjkpkmggpahaceikjbjkfhckopopkpnabaaaaaaniafaaaaaeaaaaaa
daaaaaaaeiacaaaaaeafaaaakeafaaaaebgpgodjbaacaaaabaacaaaaaaacpppp
maabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaabaaaaaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaamadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaafaaaaadaaaaaiiaabaaaalaabaaaalaaeaaaaae
aaaaabiaabaakklaabaakklaaaaappiaaeaaaaaeaaaaabiaabaafflaabaaffla
aaaaaaiaahaaaaacaaaaabiaaaaaaaiaafaaaaadabaaabiaaaaaaaiaabaaaala
afaaaaadabaaaciaaaaaaaiaabaakklaafaaaaadaaaaadiaaaaaoelaadaaaaka
aeaaaaaeaaaaadiaabaakkkaabaaoeiaaaaaoeiaecaaaaadaaaaapiaaaaaoeia
abaioekaecaaaaadabaaapiaaaaaoelaaaaioekaacaaaaadaaaaaiiaabaaaaia
abaaaakaacaaaaadaaaaaiiaaaaappibadaaffkaafaaaaadaaaachiaaaaaoeia
aaaappiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeia
adaaoelaaiaaaaadaaaaciiaacaaoelaacaaoekaacaaaaadabaaciiaaaaappia
aaaappiafiaaaaaeaaaaciiaaaaappiaabaappiaadaakkkaaeaaaaaeaaaachia
abaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaadaakkkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcleacaaaaeaaaaaaaknaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaigbabaaaacaaaaaa
diaaaaakmcaabaaaaaaaaaaaagbebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaamadpaaaamadpdcaaaaakdcaabaaaaaaaaaaakgikcaaaaaaaaaaaadaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaa
adaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
Float 3 [_Parallax]
SetTexture 0 [_BGTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 0, 1, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.x, fragment.texcoord[0], texture[1], 2D;
DP3 R0.x, fragment.texcoord[1].xzyw, fragment.texcoord[1].xzyw;
RSQ R0.x, R0.x;
MUL R0.xy, R0.x, fragment.texcoord[1].xzzw;
MAD R0.xy, R0, c[3].x, fragment.texcoord[0];
MAD R0.xy, fragment.texcoord[0], c[4].z, R0;
DP3 R1.w, fragment.texcoord[2], c[0];
MAX R1.w, R1, c[4].x;
MOV result.color.w, c[4].x;
TEX R2.xyz, R0, texture[0], 2D;
TXP R0.x, fragment.texcoord[4], texture[2], 2D;
ADD R0.y, R1.x, c[2].x;
ADD R0.y, -R0, c[4];
MUL R1.xyz, R0.y, R2;
MUL R0.yzw, R1.xxyz, fragment.texcoord[3].xxyz;
MUL R1.xyz, R1, c[1];
MUL R0.x, R1.w, R0;
MUL R1.xyz, R0.x, R1;
MAD result.color.xyz, R1, c[4].w, R0.yzww;
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
Float 3 [_Parallax]
SetTexture 0 [_BGTex] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c4, 0.50000000, 1.00000000, 0.00000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r3, t4, s2
mov r1.yz, t1.wzyx
mov r0.yz, t1.wzyx
mov r1.x, t1
mov r0.x, t1
dp3 r0.x, r1, r0
mov r1.y, t1.z
mov r1.x, t1
rsq r0.x, r0.x
mul r0.xy, r0.x, r1
mad r0.xy, r0, c3.x, t0
mad r0.xy, t0, c4.x, r0
texld r0, r0, s0
texld r1, t0, s1
add r1.x, r1, c2
add r1.x, -r1, c4.y
mul_pp r1.xyz, r1.x, r0
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t2, c0
max_pp r0.x, r0, c4.z
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mov_pp r0.w, c4.z
mad_pp r0.xyz, r0, c4.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_BGTex] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
Float 120 [_Parallax]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedcfnnhaeoengjmkhhfkmibaaakkekngmoabaaaaaalaagaaaaaeaaaaaa
daaaaaaakaacaaaameafaaaahmagaaaaebgpgodjgiacaaaagiacaaaaaaacpppp
beacaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
abaaaaaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaamadpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappia
aeaaoelaafaaaaadaaaaaeiaabaaaalaabaaaalaaeaaaaaeaaaaaeiaabaakkla
abaakklaaaaakkiaaeaaaaaeaaaaaeiaabaafflaabaafflaaaaakkiaahaaaaac
aaaaaeiaaaaakkiaafaaaaadabaaabiaaaaakkiaabaaaalaafaaaaadabaaacia
aaaakkiaabaakklaafaaaaadaaaaamiaaaaabllaadaaaakaaeaaaaaeabaaadia
abaakkkaabaaoeiaaaaabliaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaaapiaabaaoeiaacaioekaecaaaaadacaaapiaaaaaoelaabaioekaaiaaaaad
abaaciiaacaaoelaacaaoekaafaaaaadaaaaabiaaaaaaaiaabaappiaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiafiaaaaaeabaaciiaabaappiaaaaaaaiaadaakkka
acaaaaadaaaaabiaacaaaaiaabaaaakaacaaaaadaaaaabiaaaaaaaibadaaffka
afaaaaadaaaachiaabaaoeiaaaaaaaiaafaaaaadabaachiaaaaaoeiaaaaaoeka
afaaaaadaaaachiaaaaaoeiaadaaoelaaeaaaaaeaaaachiaabaaoeiaabaappia
aaaaoeiaabaaaaacaaaaaiiaadaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcbmadaaaaeaaaaaaamhaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaacaaaaaaegbcbaaaacaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahdcaabaaaaaaaaaaaagaabaaaaaaaaaaaigbabaaaacaaaaaa
diaaaaakmcaabaaaaaaaaaaaagbebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaamadpaaaamadpdcaaaaakdcaabaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaaiicaabaaa
aaaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaahaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaeaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaa
adaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
agaabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}