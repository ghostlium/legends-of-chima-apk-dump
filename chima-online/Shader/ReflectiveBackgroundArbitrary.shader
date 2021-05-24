//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "AngryBots/ReflectiveBackgroundArbitraryGeometry" {
Properties {
 _MainTex ("Base", 2D) = "white" {}
 _Normal ("Normal", 2D) = "bump" {}
 _Cube ("Cube", CUBE) = "black" {}
 _OneMinusReflectivity ("OneMinusReflectivity", Range(0,1)) = 0.05
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
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
TEMP R2;
TEMP R3;
TEMP R4;
MOV R1.w, c[10];
MUL R2.xyz, R1.w, c[5];
MUL R3.xyz, R1.w, c[6];
MUL R4.xyz, R1.w, c[7];
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R0.xyz, -R0, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R4;
MUL result.texcoord[5].xyz, R0.w, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R4;
DP3 result.texcoord[4].x, vertex.attrib[14], R4;
MOV result.texcoord[0].zw, c[0].x;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
"vs_2_0
def c11, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c4
mul r3.xyz, c9.w, r0
mov r1.xyz, c5
mul r4.xyz, c9.w, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r1.xyz, -r0, c8
mov r0.xyz, c6
mul r0.xyz, c9.w, r0
dp3 r0.w, r1, r1
rsq r0.w, r0.w
dp3 oT2.y, r3, r2
dp3 oT3.y, r2, r4
dp3 oT4.y, r2, r0
mul oT5.xyz, r0.w, r1
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp3 oT3.z, v2, r4
dp3 oT3.x, v1, r4
dp3 oT4.z, v2, r0
dp3 oT4.x, v1, r0
mov oT0.zw, c11.x
mad oT0.xy, v3, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedkffjhibokgahnhjoeinbhnbemhflaaphabaaaaaapeagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
afaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefceaafaaaaeaaaabaafaabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaaimccabaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
bccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
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
eefiecedfpfhfphejapbljlhbfhpndpodiobhnibabaaaaaadeakaaaaaeaaaaaa
daaaaaaagmadaaaaleaiaaaahmajaaaaebgpgodjdeadaaaadeadaaaaaaacpopp
naacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafamaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaakaaoeka
aaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibacaaoekaaiaaaaadaaaaaiia
aaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaadaeaaahoaaaaappia
aaaaoeiaabaaaaacaaaaabiaahaaaakaabaaaaacaaaaaciaaiaaaakaabaaaaac
aaaaaeiaajaaaakaafaaaaadaaaaahiaaaaaoeiaalaappkaaiaaaaadabaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahiaabaamjia
acaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaadabaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaabiaahaaffkaabaaaaacaaaaaciaaiaaffka
abaaaaacaaaaaeiaajaaffkaafaaaaadaaaaahiaaaaaoeiaalaappkaaiaaaaad
acaaaboaabaaoejaaaaaoeiaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaad
acaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaahaakkkaabaaaaacaaaaacia
aiaakkkaabaaaaacaaaaaeiaajaakkkaafaaaaadaaaaahiaaaaaoeiaalaappka
aiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaabaaoeiaaaaaoeia
aiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaamoaamaaaakappppaaaafdeieefceaafaaaaeaaaabaafaabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaaimccabaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
akiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
bccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
acaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { program.local[0],
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R1.w, c[10];
MUL R2.xyz, R1.w, c[5];
MUL R3.xyz, R1.w, c[6];
MUL R4.xyz, R1.w, c[7];
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R0.xyz, -R0, c[9];
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[3].y, R1, R3;
DP3 result.texcoord[4].y, R1, R4;
MUL result.texcoord[5].xyz, R0.w, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R4;
DP3 result.texcoord[4].x, vertex.attrib[14], R4;
MAD result.texcoord[0].zw, vertex.texcoord[1].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Vector 10 [unity_LightmapST]
Vector 11 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r0, v1.w
mov r0.xyz, c4
mul r3.xyz, c9.w, r0
mov r1.xyz, c5
mul r4.xyz, c9.w, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r1.xyz, -r0, c8
mov r0.xyz, c6
mul r0.xyz, c9.w, r0
dp3 r0.w, r1, r1
rsq r0.w, r0.w
dp3 oT2.y, r3, r2
dp3 oT3.y, r2, r4
dp3 oT4.y, r2, r0
mul oT5.xyz, r0.w, r1
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp3 oT3.z, v2, r4
dp3 oT3.x, v1, r4
dp3 oT4.z, v2, r0
dp3 oT4.x, v1, r0
mad oT0.zw, v4.xyxy, c10.xyxy, c10
mad oT0.xy, v3, c11, c11.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 64
Vector 32 [unity_LightmapST]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedholegebmpbdmllanobnolfjkllkaaabfabaaaaaaamahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
afaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcfiafaaaaeaaaabaafgabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaa
kgiocaaaaaaaaaaaacaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaaacaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
ckiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 64
Vector 32 [unity_LightmapST]
Vector 48 [_MainTex_ST]
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
eefiecedfnnmmojeadedkbiehepogmaddfohafmpabaaaaaaeiakaaaaaeaaaaaa
daaaaaaagiadaaaamiaiaaaajaajaaaaebgpgodjdaadaaaadaadaaaaaaacpopp
mmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaacaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaaeaaaiaaaaaaaaaaacaabeaaabaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaaeejaabaaeeka
abaaoekaafaaaaadaaaaahiaaaaaffjaajaaoekaaeaaaaaeaaaaahiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiaalaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibadaaoeka
aiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaad
aeaaahoaaaaappiaaaaaoeiaabaaaaacaaaaabiaaiaaaakaabaaaaacaaaaacia
ajaaaakaabaaaaacaaaaaeiaakaaaakaafaaaaadaaaaahiaaaaaoeiaamaappka
aiaaaaadabaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaad
acaaahiaabaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeia
aiaaaaadabaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaaiaaffkaabaaaaac
aaaaaciaajaaffkaabaaaaacaaaaaeiaakaaffkaafaaaaadaaaaahiaaaaaoeia
amaappkaaiaaaaadacaaaboaabaaoejaaaaaoeiaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaaiaakkka
abaaaaacaaaaaciaajaakkkaabaaaaacaaaaaeiaakaakkkaafaaaaadaaaaahia
aaaaoeiaamaappkaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoa
abaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefcfiafaaaaeaaaabaafgabaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaa
aaaaaaaaacaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgbpbaaaabaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
bkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
dgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaa
acaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaafaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Float 0 [_OneMinusReflectivity]
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 0.75, 1, 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[1].z, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[2], R0;
DP3 R1.z, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[3];
ADD R0.xyz, R1, fragment.texcoord[5];
MUL R1.xyz, R0, -fragment.texcoord[5];
DP3 R0.w, R1, c[1].w;
MAD R0.xyz, -R0, R0.w, -fragment.texcoord[5];
TEX R1, fragment.texcoord[0], texture[1], 2D;
TEX R0, R0, texture[2], CUBE;
ADD_SAT R2.x, R1.w, -c[0];
MAD R0, R0, R2.x, R1;
MUL result.color, R0, c[1].xxxy;
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Float 0 [_OneMinusReflectivity]
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c1, 2.00000000, -1.00000000, 1.00000000, 0.50000000
def c2, 0.75000000, 1.00000000, 0, 0
dcl t0.xy
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r0, t0, s0
mov r0.x, r0.w
mad_pp r1.xy, r0, c1.x, c1.y
mul_pp r0.xy, r1, r1
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.x, t2, r1
dp3_pp r0.z, r1, t4
dp3_pp r0.y, r1, t3
add_pp r0.xyz, r0, t5
mul_pp r1.xyz, r0, -t5
dp3_pp r1.x, r1, c1.w
mad_pp r0.xyz, -r0, r1.x, -t5
mov r0.w, c2.y
texld r2, r0, s2
texld r1, t0, s1
add_pp_sat r0.x, r1.w, -c0
mad_pp r1, r2, r0.x, r1
mov r0.xyz, c2.x
mul_pp r0, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedidjnmaemdbcpfofkkpnoknfipoieefieabaaaaaageaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefceeadaaaa
eaaaaaaanbaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaafaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaia
ebaaaaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaadkaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaakpccabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaeadpaaaaeadpaaaaeadpaaaaiadp
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaokchcjafajkaiaaiklklfbbeobocaffabaaaaaaleagaaaaaeaaaaaa
daaaaaaahmacaaaamiafaaaaiaagaaaaebgpgodjeeacaaaaeeacaaaaaaacpppp
aiacaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaaadpaaaaaaaa
aaaaaaaaaaaaaaaafbaaaaafadaaapkaaaaaeadpaaaaeadpaaaaeadpaaaaiadp
bpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajiacaiapka
ecaaaaadaaaacpiaaaaaoelaabaioekaaeaaaaaeabaacbiaaaaappiaabaaaaka
abaaffkaaeaaaaaeabaacciaaaaaffiaabaaaakaabaaffkafkaaaaaeabaadiia
abaaoeiaabaaoeiaabaakkkaacaaaaadabaaciiaabaappibabaappkaahaaaaac
abaaciiaabaappiaagaaaaacabaaceiaabaappiaaiaaaaadaaaacbiaabaaoela
abaaoeiaaiaaaaadaaaacciaacaaoelaabaaoeiaaiaaaaadaaaaceiaadaaoela
abaaoeiaacaaaaadaaaachiaaaaaoeiaaeaaoelaafaaaaadaaaachiaaaaaoeia
acaaaakaaiaaaaadaaaaciiaaeaaoelbaaaaoeiaacaaaaadaaaaciiaaaaappia
aaaappiaaeaaaaaeaaaachiaaaaaoeiaaaaappibaeaaoelbecaaaaadaaaacpia
aaaaoeiaacaioekaecaaaaadabaacpiaaaaaoelaaaaioekaacaaaaadacaadiia
abaappiaaaaaaakbaeaaaaaeaaaacpiaaaaaoeiaacaappiaabaaoeiaafaaaaad
aaaacpiaaaaaoeiaadaaoekaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
eeadaaaaeaaaaaaanbaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaafaaaaaaegacbaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaa
egbcbaiaebaaaaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaa
dkaabaaaabaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaak
pccabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaeadpaaaaeadpaaaaeadp
aaaaiadpdoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaafaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Float 0 [_OneMinusReflectivity]
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 2, 1, 0.5, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[0], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[1].x, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[2], R0;
DP3 R1.z, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[3];
ADD R0.xyz, R1, fragment.texcoord[5];
MUL R1.xyz, R0, -fragment.texcoord[5];
DP3 R0.w, R1, c[1].z;
MAD R0.xyz, -R0, R0.w, -fragment.texcoord[5];
ADD_SAT R3.x, R2.w, -c[0];
TEX R1, R0, texture[2], CUBE;
TEX R0, fragment.texcoord[0].zwzw, texture[3], 2D;
MAD R1, R1, R3.x, R2;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[1].w;
MOV result.color.w, R1;
END
# 23 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Float 0 [_OneMinusReflectivity]
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c1, 2.00000000, -1.00000000, 1.00000000, 0.50000000
def c2, 8.00000000, 0, 0, 0
dcl t0
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r0, t0, s0
mov r0.x, r0.w
mad_pp r1.xy, r0, c1.x, c1.y
mul_pp r0.xy, r1, r1
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c1.z
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.x, t2, r1
dp3_pp r0.z, r1, t4
dp3_pp r0.y, r1, t3
add_pp r0.xyz, r0, t5
mul_pp r1.xyz, r0, -t5
dp3_pp r1.x, r1, c1.w
mad_pp r1.xyz, -r0, r1.x, -t5
mov r0.y, t0.w
mov r0.x, t0.z
texld r2, r1, s2
texld r3, r0, s3
texld r1, t0, s1
add_pp_sat r0.x, r1.w, -c0
mad_pp r0, r2, r0.x, r1
mul_pp r1.xyz, r3.w, r3
mul_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedgpbkkekbggihlffnlgjhdjpjhdpcjmblabaaaaaaoeaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmeadaaaa
eaaaaaaapbaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaap
dcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaakhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegbcbaiaebaaaaaaafaaaaaaegacbaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaiaebaaaaaa
afaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaadkaabaaaabaaaaaa
akiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedccoklcnkndcdocnpmfolnadgfdhipmciabaaaaaaheahaaaaaeaaaaaa
daaaaaaalmacaaaaiiagaaaaeaahaaaaebgpgodjieacaaaaieacaaaaaaacpppp
eeacaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaabaaaaaa
aaababaaacacacaaadadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaaadp
aaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaia
abaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaajaadaiapkaecaaaaadaaaacpia
aaaaoelaabaioekaaeaaaaaeabaacbiaaaaappiaabaaaakaabaaffkaaeaaaaae
abaacciaaaaaffiaabaaaakaabaaffkafkaaaaaeabaadiiaabaaoeiaabaaoeia
abaakkkaacaaaaadabaaciiaabaappibabaappkaahaaaaacabaaciiaabaappia
agaaaaacabaaceiaabaappiaaiaaaaadaaaacbiaabaaoelaabaaoeiaaiaaaaad
aaaacciaacaaoelaabaaoeiaaiaaaaadaaaaceiaadaaoelaabaaoeiaacaaaaad
aaaachiaaaaaoeiaaeaaoelaafaaaaadaaaachiaaaaaoeiaacaaaakaaiaaaaad
aaaaciiaaeaaoelbaaaaoeiaacaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaae
aaaachiaaaaaoeiaaaaappibaeaaoelbabaaaaacabaacbiaaaaakklaabaaaaac
abaacciaaaaapplaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadacaacpia
aaaaoelaaaaioekaecaaaaadabaacpiaabaaoeiaadaioekaacaaaaadadaadiia
acaappiaaaaaaakbaeaaaaaeaaaacpiaaaaaoeiaadaappiaacaaoeiaafaaaaad
abaaciiaabaappiaacaaffkaafaaaaadabaachiaabaaoeiaabaappiaafaaaaad
aaaachiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
meadaaaaeaaaaaaapbaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaafaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaafaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaia
ebaaaaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaadkaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaafaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "AngryBots/Fallback"
}