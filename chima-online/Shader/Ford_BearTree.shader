//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_BearTree01" {
Properties {
 _MainTex ("Texture", 2D) = "gray" {}
 _SecTex ("Under texture", 2D) = "white" {}
 _blend ("blendTex ", 2D) = "white" {}
 _speed ("speed", Float) = 0
 _glow ("glow", Float) = 0
 _clampSpeed ("clampSpeed", Range(0,1)) = 0.5
 _edge ("edge softness", Range(0,1)) = 0.5
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
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
Vector 11 [_blend_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[9].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 11 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
Vector 9 [_MainTex_ST]
Vector 10 [_blend_ST]
"vs_2_0
def c11, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r0.xyz, v1, c8.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c11.x
mad oT0.zw, v3.xyxy, c10.xyxy, c10
mad oT0.xy, v2, c9, c9.zwzw
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
ConstBuffer "$Globals" 96
Vector 64 [_MainTex_ST]
Vector 80 [_blend_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedadechlldjbpjdphgmonhbbmhnddcejgcabaaaaaafiafaaaaaeaaaaaa
daaaaaaamiabaaaaaiaeaaaanaaeaaaaebgpgodjjaabaaaajaabaaaaaaacpopp
diabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaadaaahaaaaaaaaaa
abaabeaaabaaakaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaaeaaeejaacaaeeka
acaaoekaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
ajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaahoa
alaaaakappppaaaafdeieefcdiacaaaaeaaaabaaioaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
Vector 12 [_blend_ST]
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
MUL R1.y, R1, c[9].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[10].w;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[0].y;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
Vector 12 [_blend_ST]
"vs_2_0
def c13, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mul r1.y, r1, c8.x
mad oT3.xy, r1.z, c9.zwzw, r1
mul r1.xyz, v1, c10.w
mov oPos, r0
mov oT3.zw, r0
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c13.y
mad oT0.zw, v3.xyxy, c12.xyxy, c12
mad oT0.xy, v2, c11, c11.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [_MainTex_ST]
Vector 144 [_blend_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjdchndgcfnjdlbikiphpbbelfihnhplhabaaaaaahaagaaaaaeaaaaaa
daaaaaaacaacaaaaaiafaaaanaafaaaaebgpgodjoiabaaaaoiabaaaaaaacpopp
ieabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaadaaaiaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafamaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaaeaaeejaacaaeekaacaaoekaafaaaaadaaaaahiaacaaoejaalaappka
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
amaaaakaafaaaaadabaaafiaaaaapeiaamaaaakaacaaaaadadaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacadaaamoaaaaaoeiaabaaaaacacaaahoaamaaffkappppaaaa
fdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
Vector 11 [_blend_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[9].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[0].x;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 11 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
Vector 9 [_MainTex_ST]
Vector 10 [_blend_ST]
"vs_2_0
def c11, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r0.xyz, v1, c8.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c11.x
mad oT0.zw, v3.xyxy, c10.xyxy, c10
mad oT0.xy, v2, c9, c9.zwzw
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
ConstBuffer "$Globals" 96
Vector 64 [_MainTex_ST]
Vector 80 [_blend_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedadechlldjbpjdphgmonhbbmhnddcejgcabaaaaaafiafaaaaaeaaaaaa
daaaaaaamiabaaaaaiaeaaaanaaeaaaaebgpgodjjaabaaaajaabaaaaaaacpopp
diabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaabaaamaaadaaahaaaaaaaaaa
abaabeaaabaaakaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafalaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaaeaaeejaacaaeeka
acaaoekaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
ajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaahoa
alaaaakappppaaaafdeieefcdiacaaaaeaaaabaaioaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
Vector 12 [_blend_ST]
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
MUL R1.y, R1, c[9].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[10].w;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[0].y;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
Vector 12 [_blend_ST]
"vs_2_0
def c13, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mul r1.y, r1, c8.x
mad oT3.xy, r1.z, c9.zwzw, r1
mul r1.xyz, v1, c10.w
mov oPos, r0
mov oT3.zw, r0
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c13.y
mad oT0.zw, v3.xyxy, c12.xyxy, c12
mad oT0.xy, v2, c11, c11.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [_MainTex_ST]
Vector 144 [_blend_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjdchndgcfnjdlbikiphpbbelfihnhplhabaaaaaahaagaaaaaeaaaaaa
daaaaaaacaacaaaaaiafaaaanaafaaaaebgpgodjoiabaaaaoiabaaaaaaacpopp
ieabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaadaaaiaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafamaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaaeaaeejaacaaeekaacaaoekaafaaaaadaaaaahiaacaaoejaalaappka
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
amaaaakaafaaaaadabaaafiaaaaapeiaamaaaakaacaaaaadadaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacadaaamoaaaaaoeiaabaaaaacacaaahoaamaaffkappppaaaa
fdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_speed]
Float 3 [_glow]
Float 4 [_clampSpeed]
Float 5 [_edge]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_blend] 2D 2
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 0.2, 3 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R0.w, c[5].x;
ADD R1.w, R0, c[4].x;
ADD R0.w, -R0, c[4].x;
ADD R1.w, -R0, R1;
MOV R0.y, c[2].x;
MOV R0.x, c[6].y;
MUL R0.y, R0, c[6].z;
MUL R0.x, R0, c[2];
ADD R2.xy, fragment.texcoord[0].zwzw, -R0;
RCP R1.w, R1.w;
MOV result.color.w, c[6].x;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R2.x, R2, texture[2], 2D;
ADD R0.w, R2.x, -R0;
MUL_SAT R0.w, R0, R1;
MAD R1.w, -R0, c[6].y, c[6];
MUL R0.w, R0, R0;
MUL R0.w, R0, R1;
ADD R1.xyz, R1, -R0;
MAD R1.xyz, R0.w, R1, R0;
MUL R2.xyz, R1, c[1];
DP3 R1.w, fragment.texcoord[1], c[0];
ADD R0.w, -R0, c[7].x;
MAX R1.w, R1, c[6].x;
MUL R0.xyz, R0, R0.w;
MUL R2.xyz, R1.w, R2;
MUL R1.xyz, R1, fragment.texcoord[2];
MUL R0.xyz, R0, c[3].x;
MAD R1.xyz, R2, c[6].y, R1;
ADD result.color.xyz, R1, R0;
END
# 31 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_speed]
Float 3 [_glow]
Float 4 [_clampSpeed]
Float 5 [_edge]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_blend] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 0.00000000, 2.00000000, 0.20000000, 3.00000000
def c7, 1.00000000, 0, 0, 0
dcl t0
dcl t1.xyz
dcl t2.xyz
texld r3, t0, s0
texld r2, t0, s1
mov r0.z, c6
mov r0.x, c2
mov r1.x, t0.z
mov r1.y, t0.w
mul r0.y, c2.x, r0.z
mul r0.x, c6.y, r0
add r0.xy, r1, -r0
mov r1.x, c4
add r1.x, c5, r1
add_pp r3.xyz, r3, -r2
mov_pp r0.w, c6.x
texld r4, r0, s2
mov r0.x, c4
add r0.x, -c5, r0
add r1.x, -r0, r1
rcp r1.x, r1.x
add r0.x, r4, -r0
mul_sat r0.x, r0, r1
mad r1.x, -r0, c6.y, c6.w
mul r0.x, r0, r0
mul r0.x, r0, r1
mad_pp r3.xyz, r0.x, r3, r2
mul_pp r4.xyz, r3, c1
dp3_pp r1.x, t1, c0
max_pp r1.x, r1, c6
add_pp r0.x, -r0, c7
mul_pp r0.xyz, r2, r0.x
mul_pp r1.xyz, r1.x, r4
mul_pp r3.xyz, r3, t2
mad_pp r1.xyz, r1, c6.y, r3
mul r0.xyz, r0, c3.x
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_blend] 2D 2
ConstBuffer "$Globals" 96
Vector 16 [_LightColor0]
Float 48 [_speed]
Float 52 [_glow]
Float 56 [_clampSpeed]
Float 60 [_edge]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedpbjnokhlibbiddhmimphjiohckiepbchabaaaaaajaahaaaaaeaaaaaa
daaaaaaamiacaaaaneagaaaafmahaaaaebgpgodjjaacaaaajaacaaaaaaacpppp
dmacaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaaaaaaaaa
abababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaa
abaaaaaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaeamnmmemdo
aaaaaamaaaaaeaeafbaaaaafaeaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkaaiaaaaadaaaaciiaabaaoelaacaaoekaalaaaaadabaaciia
aaaappiaaeaaffkaacaaaaadaaaacbiaabaappiaabaappiaabaaaaacabaaabia
abaaaakaaeaaaaaeacaaabiaabaaaaiaadaaaakbaaaakklaaeaaaaaeacaaacia
abaaaaiaadaaffkbaaaapplaecaaaaadabaacpiaacaaoeiaacaioekaecaaaaad
acaacpiaaaaaoelaaaaioekaecaaaaadadaacpiaaaaaoelaabaioekaacaaaaad
acaaaiiaabaappkbabaakkkaacaaaaadadaaaiiaabaaaaiaacaappibacaaaaad
aaaaaciaabaappkaabaakkkaacaaaaadacaaaiiaacaappibaaaaffiaagaaaaac
acaaaiiaacaappiaafaaaaadacaabiiaacaappiaadaappiaaeaaaaaeadaaaiia
acaappiaadaakkkaadaappkaafaaaaadacaaaiiaacaappiaacaappiaafaaaaad
aaaacciaacaappiaadaappiaaeaaaaaeacaaciiaadaappiaacaappibaeaaaaka
bcaaaaaeabaachiaaaaaffiaacaaoeiaadaaoeiaafaaaaadaaaaaoiaadaablia
acaappiaafaaaaadacaachiaabaaoeiaaaaaoekaafaaaaadabaachiaabaaoeia
acaaoelaaeaaaaaeabaachiaacaaoeiaaaaaaaiaabaaoeiaaeaaaaaeaaaachia
aaaabliaabaaffkaabaaoeiaabaaaaacaaaaciiaaeaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcaeaeaaaaeaaaaaaaababaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaabaaaaaaibcaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaao
gcaabaaaaaaaaaaaagiacaiaebaaaaaaaaaaaaaaadaaaaaaaceaaaaaaaaaaaaa
aaaaaaeamnmmemdoaaaaaaaakgblbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
jgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaakccaabaaa
aaaaaaaadkiacaiaebaaaaaaaaaaaaaaadaaaaaackiacaaaaaaaaaaaadaaaaaa
aaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaakaabaaaabaaaaaa
aaaaaaajicaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaackiacaaaaaaaaaaa
adaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkaabaaa
aaaaaaaaaoaaaaakccaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpbkaabaaaaaaaaaaadicaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaamaabeaaaaaaaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaakccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaa
acaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaaaaaaaaa
jgahbaaaaaaaaaaafgifcaaaaaaaaaaaadaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_speed]
Float 3 [_glow]
Float 4 [_clampSpeed]
Float 5 [_edge]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_blend] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"!!ARBfp1.0
PARAM c[8] = { program.local[0..5],
		{ 0, 2, 0.2, 3 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R3.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R0.y, c[2].x;
MOV R0.x, c[6].y;
DP3 R2.w, fragment.texcoord[1], c[0];
MUL R0.y, R0, c[6].z;
MUL R0.x, R0, c[2];
ADD R0.xy, fragment.texcoord[0].zwzw, -R0;
MAX R2.w, R2, c[6].x;
MOV result.color.w, c[6].x;
TEX R1.x, R0, texture[2], 2D;
TXP R0.x, fragment.texcoord[3], texture[3], 2D;
MOV R0.y, c[5].x;
ADD R0.z, R0.y, c[4].x;
ADD R0.y, -R0, c[4].x;
ADD R0.z, -R0.y, R0;
ADD R0.y, R1.x, -R0;
RCP R0.z, R0.z;
MUL_SAT R0.y, R0, R0.z;
MAD R0.z, -R0.y, c[6].y, c[6].w;
MUL R0.y, R0, R0;
MUL R1.w, R0.y, R0.z;
ADD R1.xyz, R3, -R2;
MAD R1.xyz, R1.w, R1, R2;
MUL R0.yzw, R1.xxyz, c[1].xxyz;
ADD R1.w, -R1, c[7].x;
MUL R0.x, R2.w, R0;
MUL R2.xyz, R2, R1.w;
MUL R0.xyz, R0.x, R0.yzww;
MUL R1.xyz, R1, fragment.texcoord[2];
MUL R2.xyz, R2, c[3].x;
MAD R0.xyz, R0, c[6].y, R1;
ADD result.color.xyz, R0, R2;
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_speed]
Float 3 [_glow]
Float 4 [_clampSpeed]
Float 5 [_edge]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_SecTex] 2D 1
SetTexture 2 [_blend] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c6, 0.00000000, 2.00000000, 0.20000000, 3.00000000
def c7, 1.00000000, 0, 0, 0
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3
texldp r5, t3, s3
texld r3, t0, s0
texld r2, t0, s1
mov r0.z, c6
mov r0.x, c2
mov r1.x, t0.z
mov r1.y, t0.w
mul r0.y, c2.x, r0.z
mul r0.x, c6.y, r0
add r0.xy, r1, -r0
mov r1.x, c4
add r1.x, c5, r1
add_pp r3.xyz, r3, -r2
mov_pp r0.w, c6.x
texld r4, r0, s2
mov r0.x, c4
add r0.x, -c5, r0
add r1.x, -r0, r1
rcp r1.x, r1.x
add r0.x, r4, -r0
mul_sat r0.x, r0, r1
mad r1.x, -r0, c6.y, c6.w
mul r0.x, r0, r0
mul r0.x, r0, r1
mad_pp r3.xyz, r0.x, r3, r2
mul_pp r4.xyz, r3, c1
dp3_pp r1.x, t1, c0
max_pp r1.x, r1, c6
mul_pp r1.x, r1, r5
add_pp r0.x, -r0, c7
mul_pp r0.xyz, r2, r0.x
mul_pp r1.xyz, r1.x, r4
mul_pp r3.xyz, r3, t2
mad_pp r1.xyz, r1, c6.y, r3
mul r0.xyz, r0, c3.x
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_SecTex] 2D 2
SetTexture 2 [_blend] 2D 3
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 160
Vector 16 [_LightColor0]
Float 112 [_speed]
Float 116 [_glow]
Float 120 [_clampSpeed]
Float 124 [_edge]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedibnepejkmefinkinjdbkokbffcdddfhaabaaaaaagmaiaaaaaeaaaaaa
daaaaaaaceadaaaajiahaaaadiaiaaaaebgpgodjomacaaaaomacaaaaaaacpppp
jeacaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
aaababaaabacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaabaaaaaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaea
mnmmemdoaaaaaamaaaaaeaeafbaaaaafaeaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaachlabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkaagaaaaacaaaaaiiaadaapplaafaaaaadaaaaadiaaaaappiaadaaoela
abaaaaacabaaaiiaabaaaakaaeaaaaaeabaaabiaabaappiaadaaaakbaaaakkla
aeaaaaaeabaaaciaabaappiaadaaffkbaaaapplaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoeiaadaioekaecaaaaadacaacpiaaaaaoela
abaioekaecaaaaadadaacpiaaaaaoelaacaioekaaiaaaaadacaaciiaabaaoela
acaaoekaafaaaaadadaaciiaaaaaaaiaacaappiafiaaaaaeacaaciiaacaappia
adaappiaaeaaffkaacaaaaadacaaciiaacaappiaacaappiaacaaaaadadaaaiia
abaappkbabaakkkaacaaaaadaaaaabiaabaaaaiaadaappibacaaaaadaaaaacia
abaappkaabaakkkaacaaaaadadaaaiiaadaappibaaaaffiaagaaaaacadaaaiia
adaappiaafaaaaadadaabiiaaaaaaaiaadaappiaaeaaaaaeaaaaabiaadaappia
adaakkkaadaappkaafaaaaadadaaaiiaadaappiaadaappiaafaaaaadaaaaccia
aaaaaaiaadaappiaaeaaaaaeadaaciiaaaaaaaiaadaappibaeaaaakabcaaaaae
abaachiaaaaaffiaacaaoeiaadaaoeiaafaaaaadaaaaahiaadaaoeiaadaappia
afaaaaadacaachiaabaaoeiaaaaaoekaafaaaaadabaachiaabaaoeiaacaaoela
aeaaaaaeabaachiaacaaoeiaacaappiaabaaoeiaaeaaaaaeaaaachiaaaaaoeia
abaaffkaabaaoeiaabaaaaacaaaaciiaaeaaffkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcgmaeaaaaeaaaaaaablabaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadlcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaa
aeaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
dcaaaaaogcaabaaaaaaaaaaaagiacaiaebaaaaaaaaaaaaaaahaaaaaaaceaaaaa
aaaaaaaaaaaaaaeamnmmemdoaaaaaaaakgblbaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaajgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaak
ccaabaaaaaaaaaaadkiacaiaebaaaaaaaaaaaaaaahaaaaaackiacaaaaaaaaaaa
ahaaaaaaaaaaaaaiecaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaakaabaaa
abaaaaaaaaaaaaajicaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaackiacaaa
aaaaaaaaahaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dkaabaaaaaaaaaaaaoaaaaakccaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpbkaabaaaaaaaaaaadicaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaamaabeaaaaaaaaaeaeadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaacaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aaaaaaaajgahbaaaaaaaaaaafgifcaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}