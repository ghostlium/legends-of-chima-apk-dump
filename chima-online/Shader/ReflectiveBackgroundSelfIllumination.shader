//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Self-Illumin/AngryBots/ReflectiveBackgroundSelfIllumination" {
Properties {
 _MainTex ("Base", 2D) = "white" {}
 _Cube ("Cube", CUBE) = "" {}
 _Normal ("Normal", 2D) = "bump" {}
 _EmissionLM ("Emission (Lightmapper)", Float) = 0
 _OneMinusReflectivity ("OneMinusReflectivity", Range(0,1)) = 0.1
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
 Pass {
  Tags { "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
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
PARAM c[12] = { program.local[0],
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
MUL result.texcoord[1].xyz, R0.w, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R4;
DP3 result.texcoord[4].x, vertex.attrib[14], R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 5 R-regs
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
mul oT1.xyz, r0.w, r1
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp3 oT3.z, v2, r4
dp3 oT3.x, v1, r4
dp3 oT4.z, v2, r0
dp3 oT4.x, v1, r0
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
eefiecedejnbmmnhiegaeeonfgapdneeofmgcgdlabaaaaaaneagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefccaafaaaaeaaaabaaeiabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
ckiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
afaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
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
eefiecedlcipakdlbbonajjekojjjogojecggkjpabaaaaaapaajaaaaaeaaaaaa
daaaaaaaeiadaaaahaaiaaaadiajaaaaebgpgodjbaadaaaabaadaaaaaaacpopp
kmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaaeaaahaaaaaaaaaaacaabeaaabaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaahiaaaaaffjaaiaaoekaaeaaaaaeaaaaahiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibacaaoeka
aiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaad
abaaahoaaaaappiaaaaaoeiaabaaaaacaaaaabiaahaaaakaabaaaaacaaaaacia
aiaaaakaabaaaaacaaaaaeiaajaaaakaafaaaaadaaaaahiaaaaaoeiaalaappka
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaad
acaaahiaabaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaahaaffkaabaaaaac
aaaaaciaaiaaffkaabaaaaacaaaaaeiaajaaffkaafaaaaadaaaaahiaaaaaoeia
alaappkaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaabaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaahaakkka
abaaaaacaaaaaciaaiaakkkaabaaaaacaaaaaeiaajaakkkaafaaaaadaaaaahia
aaaaoeiaalaappkaaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapia
aaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefccaafaaaaeaaaabaaeiabaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaa
afaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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
MUL result.texcoord[1].xyz, R0.w, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R4;
DP3 result.texcoord[4].x, vertex.attrib[14], R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[11], c[11].zwzw;
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
mul oT1.xyz, r0.w, r1
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp3 oT3.z, v2, r4
dp3 oT3.x, v1, r4
dp3 oT4.z, v2, r0
dp3 oT4.x, v1, r0
mad oT0.xy, v3, c11, c11.zwzw
mad oT5.xy, v4, c10, c10.zwzw
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
eefieceddochmnomldjnifaacloljkbbfaieeknmabaaaaaadaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcgeafaaaaeaaaabaafjabaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaa
adaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
acaaaaaakgiocaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
aeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaa
afaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadoaaaaab"
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
eefiecedmpkfkbahgnafkeekfndbndaldeleogncabaaaaaagmakaaaaaeaaaaaa
daaaaaaagiadaaaaneaiaaaajmajaaaaebgpgodjdaadaaaadaadaaaaaaacpopp
mmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaacaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaaeaaaiaaaaaaaaaaacaabeaaabaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaahiaaaaaffjaajaaoekaaeaaaaaeaaaaahiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiaalaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibadaaoeka
aiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaafaaaaad
abaaahoaaaaappiaaaaaoeiaabaaaaacaaaaabiaaiaaaakaabaaaaacaaaaacia
ajaaaakaabaaaaacaaaaaeiaakaaaakaafaaaaadaaaaahiaaaaaoeiaamaappka
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaad
acaaahiaabaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaaiaaffkaabaaaaac
aaaaaciaajaaffkaabaaaaacaaaaaeiaakaaffkaafaaaaadaaaaahiaaaaaoeia
amaappkaaiaaaaadadaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaabaaoeia
aaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaaiaakkka
abaaaaacaaaaaciaajaakkkaabaaaaacaaaaaeiaakaakkkaafaaaaadaaaaahia
aaaaoeiaamaappkaaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoa
abaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefcgeafaaaaeaaaabaafjabaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
akiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
aeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
ckiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
afaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
		{ 2, 1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[1].x, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[2], R0;
DP3 R1.z, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[3];
ADD R0.xyz, R1, fragment.texcoord[1];
MUL R1.xyz, R0, -fragment.texcoord[1];
DP3 R0.w, R1, c[1].z;
MAD R1.xyz, -R0, R0.w, -fragment.texcoord[1];
TEX R0, fragment.texcoord[0], texture[1], 2D;
TEX R1, R1, texture[2], CUBE;
ADD_SAT R2.x, R0.y, -c[0];
MAD R1, R1, R2.x, R0;
MUL R0.xyz, R0, R0.w;
MAD result.color.xyz, R0, c[1].x, R1;
MOV result.color.w, R1;
END
# 21 instructions, 3 R-regs
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
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r0, t0, s0
texld r2, t0, s1
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
add_pp r0.xyz, r0, t1
mul_pp r1.xyz, r0, -t1
dp3_pp r1.x, r1, c1.w
mad_pp r0.xyz, -r0, r1.x, -t1
texld r1, r0, s2
add_pp_sat r0.x, r2.y, -c0
mad_pp r0, r1, r0.x, r2
mul_pp r1.xyz, r2, r2.w
mad_pp r0.xyz, r1, c1.x, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 1
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedaefogapchmfochlfoolohkldnninhbmjabaaaaaajmaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefchmadaaaa
eaaaaaaanpaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaabkaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaamhccabaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 1
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhacgnjeckpabbojlbckgdkignabfbhcgabaaaaaaoiagaaaaaeaaaaaa
daaaaaaahiacaaaapmafaaaaleagaaaaebgpgodjeaacaaaaeaacaaaaaaacpppp
aeacaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaaadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaachlabpaaaaacaaaaaaiaabaachla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkabpaaaaac
aaaaaajaacaiapkaecaaaaadaaaacpiaaaaaoelaacaioekaaeaaaaaeabaacbia
aaaappiaabaaaakaabaaffkaaeaaaaaeabaacciaaaaaffiaabaaaakaabaaffka
fkaaaaaeabaadiiaabaaoeiaabaaoeiaabaakkkaacaaaaadabaaciiaabaappib
abaappkaahaaaaacabaaciiaabaappiaagaaaaacabaaceiaabaappiaaiaaaaad
aaaacbiaacaaoelaabaaoeiaaiaaaaadaaaacciaadaaoelaabaaoeiaaiaaaaad
aaaaceiaaeaaoelaabaaoeiaacaaaaadaaaachiaaaaaoeiaabaaoelaafaaaaad
aaaachiaaaaaoeiaacaaaakaaiaaaaadaaaaciiaabaaoelbaaaaoeiaacaaaaad
aaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachiaaaaaoeiaaaaappibabaaoelb
ecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioeka
acaaaaadacaadiiaabaaffiaaaaaaakbaeaaaaaeaaaacpiaaaaaoeiaacaappia
abaaoeiaafaaaaadabaachiaabaappiaabaaoeiaaeaaaaaeaaaachiaabaaoeia
abaaaakaaaaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefchmadaaaa
eaaaaaaanpaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaabkaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaamhccabaaaaaaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
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
TEX R2, fragment.texcoord[0], texture[1], 2D;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[1].x, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[2], R0;
DP3 R1.z, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[3];
ADD R0.xyz, R1, fragment.texcoord[1];
MUL R1.xyz, R0, -fragment.texcoord[1];
DP3 R0.w, R1, c[1].z;
MAD R0.xyz, -R0, R0.w, -fragment.texcoord[1];
ADD_SAT R3.w, R2.y, -c[0].x;
MUL R3.xyz, R2, R2.w;
TEX R1, R0, texture[2], CUBE;
TEX R0, fragment.texcoord[5], texture[3], 2D;
MAD R1, R1, R3.w, R2;
MUL R0.xyz, R0.w, R0;
MUL R2.xyz, R3, c[1].x;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[1].w, R2;
MOV result.color.w, R1;
END
# 25 instructions, 4 R-regs
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
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r0, t0, s0
texld r3, t5, s3
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
add_pp r0.xyz, r0, t1
mul_pp r1.xyz, r0, -t1
dp3_pp r1.x, r1, c1.w
mad_pp r0.xyz, -r0, r1.x, -t1
texld r2, r0, s2
texld r1, t0, s1
add_pp_sat r0.x, r1.y, -c0
mad_pp r0, r2, r0.x, r1
mul_pp r1.xyz, r1, r1.w
mul_pp r2.xyz, r3.w, r3
mul_pp r1.xyz, r1, c1.x
mul_pp r0.xyz, r2, r0
mad_pp r0.xyz, r0, c2.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 1
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedmenlpiilagmjeelckacahgfgnnchlpfbabaaaaaaeiafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaaeaaaaeaaaaaaaaeabaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
dcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaakhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegacbaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegbcbaia
ebaaaaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaabkaabaaa
abaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaapgapbaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 1
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 64
Float 16 [_OneMinusReflectivity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbienojfndomldohfajcjjjfkchddaboeabaaaaaapaahaaaaaeaaaaaa
daaaaaaaneacaaaaomagaaaalmahaaaaebgpgodjjmacaaaajmacaaaaaaacpppp
fmacaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaabaaaaaa
acababaaaaacacaaadadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaaadp
aaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaia
abaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaecaaaaadaaaacpia
aaaaoelaacaioekaaeaaaaaeabaacbiaaaaappiaabaaaakaabaaffkaaeaaaaae
abaacciaaaaaffiaabaaaakaabaaffkafkaaaaaeabaadiiaabaaoeiaabaaoeia
abaakkkaacaaaaadabaaciiaabaappibabaappkaahaaaaacabaaciiaabaappia
agaaaaacabaaceiaabaappiaaiaaaaadaaaacbiaacaaoelaabaaoeiaaiaaaaad
aaaacciaadaaoelaabaaoeiaaiaaaaadaaaaceiaaeaaoelaabaaoeiaacaaaaad
aaaachiaaaaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaacaaaakaaiaaaaad
aaaaciiaabaaoelbaaaaoeiaacaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaae
aaaachiaaaaaoeiaaaaappibabaaoelbabaaaaacabaacdiaaaaabllaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaaaaioekaecaaaaad
abaacpiaabaaoeiaadaioekaacaaaaadadaadiiaacaaffiaaaaaaakbaeaaaaae
aaaacpiaaaaaoeiaadaappiaacaaoeiaafaaaaadacaachiaacaappiaacaaoeia
acaaaaadacaachiaacaaoeiaacaaoeiaafaaaaadabaaciiaabaappiaacaaffka
afaaaaadabaachiaabaaoeiaabaappiaaeaaaaaeaaaachiaaaaaoeiaabaaoeia
acaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbaaeaaaaeaaaaaaa
aeabaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaa
aaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaiaebaaaaaaacaaaaaaegacbaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaa
egbcbaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaacaaaajbcaabaaaacaaaaaa
bkaabaaaabaaaaaaakiacaiaebaaaaaaaaaaaaaaabaaaaaadcaaaaajpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaagaabaaaacaaaaaaegaobaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgapbaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
 Pass {
  Tags { "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Vector 5 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[6] = { program.local[0],
		state.matrix.mvp,
		program.local[5] };
MAD result.texcoord[0].xy, vertex.texcoord[0], c[5], c[5].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 5 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
mad oT0.xy, v1, c4, c4.zwzw
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
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedjddnbeffmkchommgmjajdebhimhpkkkiabaaaaaaiaacaaaaadaaaaaa
cmaaaaaapeaaaaaaemabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefccmabaaaaeaaaabaaelaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedibplhkafcehjlhbpmefbndcigfekemdeabaaaaaagmadaaaaaeaaaaaa
daaaaaaabiabaaaaemacaaaabeadaaaaebgpgodjoaaaaaaaoaaaaaaaaaacpopp
kaaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapia
acaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefccmabaaaa
eaaaabaaelaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [unity_LightmapST]
Vector 6 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[7] = { program.local[0],
		state.matrix.mvp,
		program.local[5..6] };
MAD result.texcoord[0].xy, vertex.texcoord[0], c[6], c[6].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[5], c[5].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 6 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [unity_LightmapST]
Vector 5 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
mad oT0.xy, v1, c5, c5.zwzw
mad oT1.xy, v2, c4, c4.zwzw
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
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 64
Vector 32 [unity_LightmapST]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedajdonnmdilbhmimjgabmfiejkffkefolabaaaaaanmacaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefchaabaaaaeaaaabaafmaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 64
Vector 32 [unity_LightmapST]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedkdllbldnjfjdemlegcjgajhhpgkbpigeabaaaaaaoiadaaaaaeaaaaaa
daaaaaaadiabaaaalaacaaaahiadaaaaebgpgodjaaabaaaaaaabaaaaaaacpopp
maaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaacaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
aeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabeja
abaabekaabaalekaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapia
adaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefchaabaaaa
eaaaabaafmaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaa
kgiocaaaaaaaaaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
TEMP R0;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD result.color.xyz, R0, R0.w;
MOV result.color.w, R0;
END
# 3 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
dcl t0.xy
texld r1, t0, s0
mov_pp r0.w, r1
add_pp r0.xyz, r1, r1.w
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
"ps_4_0
eefiecedpifaokhkgndgcmdbcajnkacglbgokpkcabaaaaaafmabaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmaaaaaa
eaaaaaaachaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaaaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedagockclfemijekinojicdbhkfechlfnbabaaaaaanmabaaaaaeaaaaaa
daaaaaaakmaaaaaafaabaaaakiabaaaaebgpgodjheaaaaaaheaaaaaaaaacpppp
emaaaaaaciaaaaaaaaaaciaaaaaaciaaaaaaciaaabaaceaaaaaaciaaaaaaaaaa
aaacppppbpaaaaacaaaaaaiaaaaacdlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaacaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcjmaaaaaaeaaaaaaachaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaaaaaaaaadoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 8 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R1.xyz, R1.w, R1;
MAD R1.xyz, R1, c[0].x, R0.w;
MUL result.color.xyz, R0, R1;
MOV result.color.w, R0;
END
# 6 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c0, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xy
texld r0, t1, s1
texld r1, t0, s0
mul_pp r0.xyz, r0.w, r0
mad_pp r0.xyz, r0, c0.x, r1.w
mov_pp r0.w, r1
mul_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0
eefiecedooihgjnmffljnpbblfhdhjegiodafmknabaaaaaaaaacaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcciabaaaaeaaaaaaaekaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaebefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0_level_9_1
eefiecedcfnmjkpdjdnimoebpppfacffijmgkpbiabaaaaaaoiacaaaaaeaaaaaa
daaaaaaabeabaaaaeeacaaaaleacaaaaebgpgodjnmaaaaaanmaaaaaaaaacpppp
laaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaabaaaaacaaaacdiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaaaaaaaka
aeaaaaaeaaaachiaaaaappiaaaaaoeiaabaappiaafaaaaadabaachiaaaaaoeia
abaaoeiaabaaaaacaaaicpiaabaaoeiappppaaaafdeieefcciabaaaaeaaaaaaa
ekaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaebefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
doaaaaabejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
Fallback "AngryBots/Fallback"
}