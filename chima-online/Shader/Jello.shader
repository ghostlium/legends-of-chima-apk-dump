//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Jello" {
Properties {
 _Ramp ("BRDF Ramp", 2D) = "white" {}
 _Cube ("Cubemap", CUBE) = "" {}
 _ColorTint ("Tint reflection", Color) = (0,0,0,1)
 _AlphaPower ("Alpha Power", Range(0,3)) = 1
 _ReflecPower ("Reflection Power", Range(1,8)) = 1
}
SubShader { 
 Tags { "QUEUE"="Transparent" "RenderType"="Tranparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent" "RenderType"="Tranparent" }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[15] = { { 1, 2, 0 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[0].z;
ADD result.texcoord[3].xyz, -R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c14, 1.00000000, 2.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c12
mov r1.w, c14.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c14.y, -r0
mul r1.xyz, v1, c13.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
mov o3.xyz, c14.z
add o4.xyz, -r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedmmphmidlgneijkbmklnnoglnfgnfgdjjabaaaaaammafaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdaaeaaaaeaaaabaa
amabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaaabaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaabaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaabaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaabaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaabaaaaaa
egiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [unity_LightmapST]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
MAD result.texcoord[1].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
def c15, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
mov r1.xyz, c12
mov r1.w, c15.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c15.y, -r0
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
mad o2.xy, v2, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 80 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedcbehoajlfgkagbapffbcmlpmnpnbjppfabaaaaaagaaeaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcpeacaaaaeaaaabaalnaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadoaaaaab
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 1, 2, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].w;
MOV result.position, R0;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[4].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
MOV result.texcoord[4].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[0].z, R2, c[7];
DP3 result.texcoord[0].y, R2, c[6];
DP3 result.texcoord[0].x, R2, c[5];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[0].z;
ADD result.texcoord[3].xyz, -R0, c[13];
END
# 30 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c16, 1.00000000, 2.00000000, 0.00000000, 0.50000000
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c12
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c16.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.w
mov o0, r0
mul r1.y, r1, c13.x
mad o5.xy, r1.z, c14.zwzw, r1
mul r1.xyz, v1, c15.w
mov o5.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o1.z, r2, c6
dp3 o1.y, r2, c5
dp3 o1.x, r2, c4
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
mov o3.xyz, c16.z
add o4.xyz, -r0, c12
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedoplhfempmpkcjchpejpkcbdkbneinlilabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcmiaeaaaaeaaaabaadcabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaaaaaaaaaaeaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabcaaaaaakgikcaaa
aaaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaabaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaabaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaai
icaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaabaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaabaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaaihccabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"3.0-!!ARBvp1.0
PARAM c[17] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[0].z, R2, c[7];
DP3 result.texcoord[0].y, R2, c[6];
DP3 result.texcoord[0].x, R2, c[5];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 22 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c17, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord1 v2
mov r1.xyz, c12
mov r1.w, c17.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c17.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.z
mul r1.y, r1, c13.x
dp3 o1.z, r2, c6
dp3 o1.y, r2, c5
dp3 o1.x, r2, c4
mad o3.xy, r1.z, c14.zwzw, r1
mov o0, r0
mov o3.zw, r0
mad o2.xy, v2, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 144 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedfoeeceljbhimfdmalipcoidmdgnhjmafabaaaaaabaafaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
imadaaaaeaaaabaaodaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
abaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaa
bdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaa
dcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
Float 1 [_AlphaPower]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 1, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R2.xyz, R0, c[0];
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.w;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R1.w, fragment.texcoord[1], R0;
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
MUL R0.w, R0, c[4].x;
ADD R0.y, R0.w, c[3].z;
MUL R0.x, R1.w, c[3].y;
TEX R0, R0, texture[1], 2D;
POW R1.x, R2.x, c[2].x;
POW R1.y, R2.y, c[2].x;
POW R1.z, R2.z, c[2].x;
ADD_SAT R0.xyz, R1, R0;
MAD result.color.xyz, R2, fragment.texcoord[2], R0;
ADD R0.x, -R1.w, c[3];
ADD R0.y, R2.x, R0.w;
POW R0.x, R0.x, c[1].x;
ADD result.color.w, R0.x, R0.y;
END
# 20 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
Float 1 [_AlphaPower]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c3, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c4, 1.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
texld r0.xyz, v0, s0
mul_pp r2.xyz, r0, c0
pow_pp r1, r2.x, c2.x
pow_pp r0, r2.y, c2.x
mov_pp r1.y, r0
pow_pp r0, r2.z, c2.x
dp3_pp r0.x, v3, v3
mov_pp r1.z, r0
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
dp3_pp r1.w, v1, r0
dp3_pp r0.w, v1, c3.xyxw
mul r0.x, r1.w, c3.z
mad r0.y, r0.w, c3.w, c3.x
texld r0, r0, s1
add_sat r0.xyz, r1, r0
mad_pp oC0.xyz, r2, v2, r0
add r2.w, -r1, c4.x
pow r1, r2.w, c1.x
add r0.x, r2, r0.w
mov r0.y, r1.x
add oC0.w, r0.y, r0.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
ConstBuffer "$Globals" 80
Vector 48 [_ColorTint]
Float 64 [_AlphaPower]
Float 68 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbadicmopglncadhhaldpihjnhcgdcgpiabaaaaaaamaeaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcaeadaaaaeaaaaaaambaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahbcaabaaaabaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdp
cpaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaakccaabaaaaaaaaaaaigbbbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaa
aaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadpefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaak
ccaabaaaaaaaaaaaakaabaaaacaaaaaaakiacaaaaaaaaaaaadaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
adaaaaaaaaaaaaahiccabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
cpaaaaafhcaabaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaafgifcaaaaaaaaaaaaeaaaaaabjaaaaafhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], CUBE;
TEX R0, fragment.texcoord[1], texture[1], 2D;
MUL R1.xyz, R1, c[0];
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 7 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c1, 8.00000000, 0.00000000, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xy
texld r1.xyz, v0, s0
texld r0, v1, s1
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1
mul_pp oC0.xyz, r0, c1.x
mov_pp oC0.w, c1.y
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 96
Vector 48 [_ColorTint]
BindCB  "$Globals" 0
"ps_4_0
eefiecedafiikgoalalngfmcadkicdjnagijoanjabaaaaaaciacaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfaabaaaaeaaaaaaafeaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
Float 1 [_AlphaPower]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Ramp] 2D 2
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 1, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R1.yzw, R0.xxyz, c[0].xxyz;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.w;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R2.w, fragment.texcoord[1], R0;
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
MUL R0.w, R0, c[4].x;
ADD R0.y, R0.w, c[3].z;
MUL R0.x, R2.w, c[3].y;
TEX R0, R0, texture[2], 2D;
POW R2.x, R1.y, c[2].x;
POW R2.y, R1.z, c[2].x;
POW R2.z, R1.w, c[2].x;
TXP R1.x, fragment.texcoord[4], texture[1], 2D;
ADD_SAT R0.xyz, R2, R0;
MUL R0.xyz, R0, R1.x;
MAD result.color.xyz, R1.yzww, fragment.texcoord[2], R0;
ADD R0.x, -R2.w, c[3];
ADD R0.y, R1, R0.w;
POW R0.x, R0.x, c[1].x;
ADD result.color.w, R0.x, R0.y;
END
# 22 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
Float 1 [_AlphaPower]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [_Ramp] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c3, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c4, 1.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
texld r0.xyz, v0, s0
mul_pp r2.xyz, r0, c0
pow_pp r1, r2.x, c2.x
pow_pp r0, r2.y, c2.x
dp3_pp r0.x, v3, v3
pow_pp r3, r2.z, c2.x
mov_pp r1.y, r0
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
dp3_pp r1.w, v1, r0
dp3_pp r0.w, v1, c3.xyxw
mul r0.x, r1.w, c3.z
mad r0.y, r0.w, c3.w, c3.x
texld r0, r0, s2
mov_pp r1.z, r3
add_sat r0.xyz, r1, r0
texldp r1.x, v4, s1
mul r0.xyz, r0, r1.x
mad_pp oC0.xyz, r2, v2, r0
add r2.w, -r1, c4.x
pow r1, r2.w, c1.x
add r0.x, r2, r0.w
mov r0.y, r1.x
add oC0.w, r0.y, r0.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [_Ramp] 2D 2
ConstBuffer "$Globals" 144
Vector 112 [_ColorTint]
Float 128 [_AlphaPower]
Float 132 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedomgfjllkpjkjhgeiimgdhencoejcfdbbabaaaaaakiaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefciiadaaaa
eaaaaaaaocaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahbcaabaaaabaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdp
cpaaaaafbcaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaakccaabaaaaaaaaaaaigbbbaaaacaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaajccaabaaaabaaaaaabkaabaaa
aaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadpefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaak
ccaabaaaaaaaaaaaakaabaaaacaaaaaaakiacaaaaaaaaaaaahaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaaegiccaaaaaaaaaaa
ahaaaaaaaaaaaaahiccabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
cpaaaaafhcaabaaaaaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegbcbaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaafgifcaaaaaaaaaaaaiaaaaaabjaaaaafhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
aoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"3.0-!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[2], texture[1], 2D;
TEX R0, fragment.texcoord[1], texture[2], 2D;
MUL R1.xyz, R0, R2.x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[1].y;
MUL R1.xyz, R1, c[1].z;
MIN R1.xyz, R0, R1;
MUL R2.xyz, R0, R2.x;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MAX R1.xyz, R1, R2;
MUL R0.xyz, R0, c[0];
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[1].x;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_ColorTint]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c1, 8.00000000, 2.00000000, 0.00000000, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xy
dcl_texcoord2 v2
texldp r2.x, v2, s1
texld r0, v1, s2
mul_pp r1.xyz, r0, r2.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c1.x
mul_pp r1.xyz, r1, c1.y
min_pp r1.xyz, r0, r1
mul_pp r2.xyz, r0, r2.x
texld r0.xyz, v0, s0
max_pp r1.xyz, r1, r2
mul_pp r0.xyz, r0, c0
mul_pp oC0.xyz, r0, r1
mov_pp oC0.w, c1.z
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 160
Vector 112 [_ColorTint]
BindCB  "$Globals" 0
"ps_4_0
eefiecedamgcgpkhegenghhhkjcphfocbnecmkjcabaaaaaadeadaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefceeacaaaaeaaaaaaajbaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
hcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
deaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaahaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "RenderType"="Tranparent" }
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
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[18];
ADD result.texcoord[3].xyz, -R0, c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c19, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c16
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c19.y, -r0
mul r1.xyz, v1, c18.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
add o3.xyz, -r0, c17
add o4.xyz, -r0, c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedobaglicmjighgoiokiodobgegjmhojbmabaaaaaaeeahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjaafaaaaeaaaabaageabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[16] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[15].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[14];
ADD result.texcoord[3].xyz, -R0, c[13];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c15, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c12
mov r1.w, c15.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c14.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c15.y, -r0
mul r1.xyz, v1, c14.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
mov o3.xyz, c13
add o4.xyz, -r0, c12
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedgahepchbkeghljbiionflobnbpaohhbnabaaaaaaneafaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdiaeaaaaeaaaabaa
aoabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaaaaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].w, R0, c[16];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[18];
ADD result.texcoord[3].xyz, -R0, c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c19, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c16
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c19.y, -r0
mul r1.xyz, v1, c18.w
dp4 r0.w, v0, c7
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 o5.w, r0, c15
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
add o3.xyz, -r0, c17
add o4.xyz, -r0, c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedegbifcgpnglnmojikjfpcoafogcmopmoabaaaaaaeeahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjaafaaaaeaaaabaageabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
afaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[18];
ADD result.texcoord[3].xyz, -R0, c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c19, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c16
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c19.y, -r0
mul r1.xyz, v1, c18.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o5.z, r0, c14
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
add o3.xyz, -r0, c17
add o4.xyz, -r0, c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedobaglicmjighgoiokiodobgegjmhojbmabaaaaaaeeahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjaafaaaaeaaaabaageabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
"3.0-!!ARBvp1.0
PARAM c[20] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[18];
ADD result.texcoord[3].xyz, -R0, c[17];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"vs_3_0
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c19, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
mov r1.xyz, c16
mov r1.w, c19.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c19.y, -r0
mul r1.xyz, v1, c18.w
dp3 o1.z, r0, c6
dp3 o1.y, r0, c5
dp3 o1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 o5.y, r0, c13
dp4 o5.x, r0, c12
dp3 o2.z, r1, c6
dp3 o2.y, r1, c5
dp3 o2.x, r1, c4
mov o3.xyz, c17
add o4.xyz, -r0, c16
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedechmnkgagipklaccbhgcnlncjcmfllbdabaaaaaadiahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcieafaaaaeaaaabaagbabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaaddccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaadaaaaaaegiccaaa
acaaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaa
abaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaaafaaaaaaegiacaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_ColorTint]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Ramp] 2D 2
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R0.xyz, R0, c[0];
POW R1.x, R0.x, c[2].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
POW R1.y, R0.y, c[2].x;
POW R1.z, R0.z, c[2].x;
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R0;
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
MUL R0.y, R0.w, c[4].x;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.x, R0, c[3].y;
ADD R0.y, R0, c[3].z;
TEX R0.xyz, R0, texture[2], 2D;
TEX R0.w, R0.w, texture[1], 2D;
ADD_SAT R0.xyz, R1, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[3].x;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_ColorTint]
Float 1 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Ramp] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c2, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c3, 0.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r0.xyz, v0, s0
mul_pp r1.xyz, r0, c0
pow_pp r0, r1.x, c1.x
pow_pp r2, r1.y, c1.x
mov_pp r2.x, r0
pow_pp r0, r1.z, c1.x
dp3_pp r1.x, v3, v3
rsq_pp r0.x, r1.x
mul_pp r1.xyz, r0.x, v3
dp3_pp r0.y, v1, r1
dp3_pp r0.x, v1, c2.xyxw
mad r1.y, r0.x, c2.w, c2.x
mul r1.x, r0.y, c2.z
dp3 r0.x, v4, v4
mov_pp r2.z, r0
texld r1.xyz, r1, s2
texld r0.x, r0.x, s1
add_sat r1.xyz, r2, r1
mul oC0.xyz, r1, r0.x
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Ramp] 2D 2
ConstBuffer "$Globals" 144
Vector 112 [_ColorTint]
Float 132 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbainenbkcfmbohokdcadahgadeicmoimabaaaaaaoaadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaacaaaa
eaaaaaaalaaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdpbaaaaaakecaabaaaaaaaaaaa
igbbbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaaj
ccaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadp
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaaiaaaaaabjaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
agaabaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_ColorTint]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R1.xyz, R0, c[0];
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R0;
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
MUL R0.w, R0, c[4].x;
POW R1.x, R1.x, c[2].x;
POW R1.y, R1.y, c[2].x;
ADD R0.y, R0.w, c[3].z;
MUL R0.x, R0, c[3].y;
TEX R0.xyz, R0, texture[1], 2D;
POW R1.z, R1.z, c[2].x;
ADD_SAT result.color.xyz, R1, R0;
MOV result.color.w, c[3].x;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_ColorTint]
Float 1 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
"ps_3_0
dcl_cube s0
dcl_2d s1
def c2, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c3, 0.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord3 v2.xyz
texld r0.xyz, v0, s0
mul_pp r1.xyz, r0, c0
pow_pp r0, r1.x, c1.x
pow_pp r2, r1.y, c1.x
mov_pp r1.x, r0
pow_pp r0, r1.z, c1.x
dp3_pp r1.w, v2, v2
rsq_pp r0.x, r1.w
mov_pp r1.y, r2
mul_pp r2.xyz, r0.x, v2
dp3_pp r0.x, v1, c2.xyxw
dp3_pp r0.w, v1, r2
mad r0.y, r0.x, c2.w, c2.x
mul r0.x, r0.w, c2.z
texld r2.xyz, r0, s1
mov_pp r1.z, r0
add_sat oC0.xyz, r1, r2
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_Ramp] 2D 1
ConstBuffer "$Globals" 80
Vector 48 [_ColorTint]
Float 68 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjnckkjepcjgjnjhcbdaccaaojflnadnpabaaaaaaeeadaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcdmacaaaaeaaaaaaaipaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadhcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdpbaaaaaakecaabaaaaaaaaaaa
igbbbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaaj
ccaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadp
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaaeaaaaaabjaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaacaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_ColorTint]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Ramp] 2D 3
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R0.xyz, R0, c[0];
POW R1.x, R0.x, c[2].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
POW R1.y, R0.y, c[2].x;
POW R1.z, R0.z, c[2].x;
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R0;
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
MUL R0.y, R0.w, c[4].x;
RCP R0.w, fragment.texcoord[4].w;
MAD R2.xy, fragment.texcoord[4], R0.w, c[3].z;
TEX R0.w, R2, texture[1], 2D;
SLT R2.x, c[3], fragment.texcoord[4].z;
MUL R0.x, R0, c[3].y;
ADD R0.y, R0, c[3].z;
TEX R0.xyz, R0, texture[3], 2D;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.w, R2.x, R0;
MUL R0.w, R0, R1;
ADD_SAT R0.xyz, R1, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[3].x;
END
# 25 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_ColorTint]
Float 1 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_Ramp] 2D 3
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.50000000, 0.00000000, 1.00000000, -0.50000000
def c3, 0.80000001, 0.30000001, 0.50000000, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
texld r0.xyz, v0, s0
mul_pp r1.xyz, r0, c0
pow_pp r0, r1.x, c1.x
pow_pp r2, r1.y, c1.x
mov_pp r2.x, r0
pow_pp r0, r1.z, c1.x
dp3_pp r1.x, v3, v3
rsq_pp r0.x, r1.x
mul_pp r1.xyz, r0.x, v3
mov_pp r2.z, r0
dp3_pp r0.x, v1, r1
dp3_pp r0.y, v1, c2.xwxw
rcp r0.z, v4.w
mad r3.xy, v4, r0.z, c2.x
mul r0.x, r0, c3
mad r0.y, r0, c3, c3.z
texld r1.xyz, r0, s3
dp3 r0.x, v4, v4
texld r0.w, r3, s1
cmp r0.y, -v4.z, c2, c2.z
texld r0.x, r0.x, s2
mul_pp r0.y, r0, r0.w
mul_pp r0.x, r0.y, r0
add_sat r1.xyz, r2, r1
mul oC0.xyz, r1, r0.x
mov_pp oC0.w, c2.y
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_Ramp] 2D 3
ConstBuffer "$Globals" 144
Vector 112 [_ColorTint]
Float 132 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhopcifghabecgidlimnfadllkkpmngdjabaaaaaaneaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleadaaaa
eaaaaaaaonaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaamnmmemdpbaaaaaakecaabaaaaaaaaaaaigbbbaaa
acaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaajccaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadpefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
ahaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaaiaaaaaabjaaaaafhcaabaaa
abaaaaaaegacbaaaabaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaapgbpbaaa
afaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaafaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_ColorTint]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Ramp] 2D 3
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R0.xyz, R0, c[0];
POW R1.x, R0.x, c[2].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
POW R1.y, R0.y, c[2].x;
POW R1.z, R0.z, c[2].x;
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R0;
MUL R0.w, R0, c[4].x;
ADD R0.y, R0.w, c[3].z;
MUL R0.x, R0, c[3].y;
TEX R0.xyz, R0, texture[3], 2D;
TEX R0.w, fragment.texcoord[4], texture[2], CUBE;
TEX R1.w, R1.w, texture[1], 2D;
MUL R0.w, R1, R0;
ADD_SAT R0.xyz, R1, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[3].x;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_ColorTint]
Float 1 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
SetTexture 3 [_Ramp] 2D 3
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c2, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c3, 0.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
texld r0.xyz, v0, s0
mul_pp r1.xyz, r0, c0
pow_pp r2, r1.y, c1.x
pow_pp r0, r1.x, c1.x
mov_pp r2.x, r0
pow_pp r0, r1.z, c1.x
dp3_pp r0.x, v3, v3
mov_pp r2.z, r0
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v3
dp3_pp r0.x, v1, r0
dp3_pp r0.w, v1, c2.xyxw
mad r0.y, r0.w, c2.w, c2.x
mul r0.x, r0, c2.z
texld r1.xyz, r0, s3
dp3 r0.x, v4, v4
texld r0.w, v4, s2
texld r0.x, r0.x, s1
mul r0.x, r0, r0.w
add_sat r1.xyz, r2, r1
mul oC0.xyz, r1, r0.x
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
SetTexture 3 [_Ramp] 2D 3
ConstBuffer "$Globals" 144
Vector 112 [_ColorTint]
Float 132 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedndoiggdnlnfiakelnblecfmjdllkmnnnabaaaaaadmaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbmadaaaa
eaaaaaaamhaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaamnmmemdpbaaaaaakecaabaaaaaaaaaaaigbbbaaa
acaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaajccaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadpefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaa
ahaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaaiaaaaaabjaaaaafhcaabaaa
abaaaaaaegacbaaaabaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaa
dkaabaaaacaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_ColorTint]
Float 2 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Ramp] 2D 2
"3.0-!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0, 0.80000001, 0.5, -0.5 },
		{ 0.30000001 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], CUBE;
MUL R0.xyz, R0, c[0];
POW R1.x, R0.x, c[2].x;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
DP3 R0.w, fragment.texcoord[1], c[3].zwzw;
POW R1.y, R0.y, c[2].x;
POW R1.z, R0.z, c[2].x;
RSQ R0.x, R0.x;
MUL R0.xyz, R0.x, fragment.texcoord[3];
DP3 R0.x, fragment.texcoord[1], R0;
MUL R0.w, R0, c[4].x;
ADD R0.y, R0.w, c[3].z;
MUL R0.x, R0, c[3].y;
TEX R0.xyz, R0, texture[2], 2D;
TEX R0.w, fragment.texcoord[4], texture[1], 2D;
ADD_SAT R0.xyz, R1, R0;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[3].x;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_ColorTint]
Float 1 [_ReflecPower]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_Ramp] 2D 2
"ps_3_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c2, 0.50000000, -0.50000000, 0.80000001, 0.30000001
def c3, 0.00000000, 0, 0, 0
dcl_texcoord0 v0.xyz
dcl_texcoord1 v1.xyz
dcl_texcoord3 v2.xyz
dcl_texcoord4 v3.xy
texld r0.xyz, v0, s0
mul_pp r1.xyz, r0, c0
pow_pp r0, r1.x, c1.x
pow_pp r2, r1.y, c1.x
mov_pp r1.x, r0
pow_pp r0, r1.z, c1.x
dp3_pp r0.x, v2, v2
mov_pp r1.z, r0
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, v2
dp3_pp r0.x, v1, r0
dp3_pp r0.w, v1, c2.xyxw
mad r0.y, r0.w, c2.w, c2.x
mul r0.x, r0, c2.z
mov_pp r1.y, r2
texld r0.xyz, r0, s2
texld r0.w, v3, s1
add_sat r0.xyz, r1, r0
mul oC0.xyz, r0, r0.w
mov_pp oC0.w, c3.x
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_Ramp] 2D 2
ConstBuffer "$Globals" 144
Vector 112 [_ColorTint]
Float 132 [_ReflecPower]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjhcbfanhbhnphdjchgnkahmclhpabfgbabaaaaaameadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckeacaaaa
eaaaaaaakjaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaaddcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaamnmmemdpbaaaaaakecaabaaaaaaaaaaa
igbbbaaaacaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaalpaaaaaaaadcaaaaaj
ccaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaajkjjjjdoabeaaaaaaaaaaadp
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
aaaaaaaaahaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaafgifcaaaaaaaaaaaaiaaaaaabjaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaacaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaafaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaapgapbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
}
 }
}
Fallback "Diffuse"
}