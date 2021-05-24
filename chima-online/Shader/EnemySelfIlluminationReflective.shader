//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "AngryBots/Character/EnemySelfIlluminationReflective" {
Properties {
 _MainTex ("Base (RGB) Gloss (A)", 2D) = "grey" {}
 _BumpMap ("Normalmap", 2D) = "bump" {}
 _Cube ("Cube", CUBE) = "black" {}
 _SelfIllumStrength ("_SelfIllumStrength", Range(0,1.5)) = 1
}
SubShader { 
 LOD 300
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
 Pass {
  Tags { "QUEUE"="Geometry" "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
  Lighting On
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_CameraToWorld]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightPosition0]
Vector 17 [unity_LightPosition1]
Vector 18 [unity_LightAtten0]
Vector 19 [unity_LightAtten1]
Vector 20 [unity_Scale]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, -1, 0, 1.75 },
		state.matrix.mvp,
		program.local[5..21],
		{ 0.19995117 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.xy, c[0];
MUL R1, R0.xxyx, c[17];
MUL R0, R0.xxyx, c[16];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP4 R1.z, vertex.position, c[7];
DP4 R1.y, vertex.position, c[6];
DP4 R1.x, vertex.position, c[5];
ADD R3.xyz, -R1, R2;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
ADD R0.xyz, R2, -R1;
DP3 R2.zw, R3, R3;
DP3 R4.x, R0, R0;
RSQ R1.w, R2.z;
RSQ R0.w, R4.x;
MUL R2.xyz, R0.w, R0;
MUL R3.xyz, R1.w, R3;
DP3 R0.y, vertex.normal, c[6];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.z, vertex.normal, c[7];
DP3 R0.w, R0, R2;
DP3 R0.z, R0, R3;
MIN R0.z, R0, c[0].x;
MOV R4.y, R2.w;
MAX R0.z, R0, c[0];
MOV R0.y, c[19].z;
MOV R0.x, c[18].z;
MAD R0.xy, R4, R0, c[0].x;
RCP R0.y, R0.y;
MUL R1.w, R0.z, R0.y;
MIN R0.y, R0.w, c[0].x;
RCP R0.z, R0.x;
MAX R0.x, R0.y, c[0].z;
MUL R0.x, R0, R0.z;
MUL R2.xyz, R1.w, c[15];
MUL R0.xyz, R0.x, c[14];
ADD R0.xyz, R0, R2;
MOV R2.xyz, vertex.attrib[14];
MOV R0.w, c[22].x;
MAD result.texcoord[0].xyz, R0, c[0].w, R0.w;
MUL R3.xyz, vertex.normal.zxyw, R2.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R2.zxyw, -R3;
MOV R0.w, c[20];
MUL R3.xyz, R0.w, c[6];
MUL R2.xyz, R0, vertex.attrib[14].w;
MUL R0.xyz, R0.w, c[5];
MUL R4.xyz, R0.w, c[7];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[5].y, R2, R4;
ADD result.texcoord[2].xyz, -R1, c[13];
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[5].z, vertex.normal, R4;
DP3 result.texcoord[5].x, vertex.attrib[14], R4;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[21], c[21].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 65 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_CameraToWorld]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightPosition0]
Vector 16 [unity_LightPosition1]
Vector 17 [unity_LightAtten0]
Vector 18 [unity_LightAtten1]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
"vs_2_0
def c21, 1.00000000, -1.00000000, 0.00000000, 0
def c22, 1.75000000, 0.19995117, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1, c16
mul r1, c21.xxyx, r1
mov r0, c15
mul r0, c21.xxyx, r0
dp4 r2.z, r1, c10
dp4 r2.y, r1, c9
dp4 r2.x, r1, c8
dp4 r1.z, v0, c6
dp4 r1.y, v0, c5
dp4 r1.x, v0, c4
add r3.xyz, -r1, r2
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
add r0.xyz, r2, -r1
dp3 r2.zw, r3, r3
dp3 r4.x, r0, r0
rsq r1.w, r2.z
rsq r0.w, r4.x
mul r2.xyz, r0.w, r0
mul r3.xyz, r1.w, r3
dp3 r0.y, v2, c5
dp3 r0.x, v2, c4
dp3 r0.z, v2, c6
dp3 r0.w, r0, r2
dp3 r0.z, r0, r3
mov r4.y, r2.w
min r0.z, r0, c21.x
mov r0.y, c18.z
mov r0.x, c17.z
mad r0.xy, r4, r0, c21.x
rcp r1.w, r0.y
max r0.y, r0.z, c21.z
mul r1.w, r0.y, r1
rcp r0.z, r0.x
min r0.y, r0.w, c21.x
max r0.x, r0.y, c21.z
mul r0.x, r0, r0.z
mul r2.xyz, r1.w, c14
mul r0.xyz, r0.x, c13
add r0.xyz, r0, r2
mov r2.xyz, v1
mad oT0.xyz, r0, c22.x, c22.y
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r2.yzxw
mad r2.xyz, v2.yzxw, r0.zxyw, -r2
mul r4.xyz, r2, v1.w
mov r0.xyz, c4
mul r3.xyz, c19.w, r0
mov r2.xyz, c5
mul r2.xyz, c19.w, r2
mov r0.xyz, c6
mul r0.xyz, c19.w, r0
dp3 oT3.y, r3, r4
dp3 oT4.y, r4, r2
dp3 oT5.y, r4, r0
add oT2.xyz, -r1, c12
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
dp3 oT4.z, v2, r2
dp3 oT4.x, v1, r2
dp3 oT5.z, v2, r0
dp3 oT5.x, v1, r0
mad oT1.xy, v3, c20, c20.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Matrix 48 [_CameraToWorld]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 224 [unity_LightPosition0]
Vector 240 [unity_LightPosition1]
Vector 256 [unity_LightPosition2]
Vector 272 [unity_LightPosition3]
Vector 288 [unity_LightPosition4]
Vector 304 [unity_LightPosition5]
Vector 320 [unity_LightPosition6]
Vector 336 [unity_LightPosition7]
Vector 352 [unity_LightAtten0]
Vector 368 [unity_LightAtten1]
Vector 384 [unity_LightAtten2]
Vector 400 [unity_LightAtten3]
Vector 416 [unity_LightAtten4]
Vector 432 [unity_LightAtten5]
Vector 448 [unity_LightAtten6]
Vector 464 [unity_LightAtten7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedmkfnicmaeomiecgeifkpjjccgfcleajkabaaaaaapeakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfcee
aaklklklfdeieefcciajaaaaeaaaabaaekacaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
biaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaal
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaialpaaaaiadpdiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaa
dkaabaaaaaaaaaaadiaaaaaiccaabaaaacaaaaaadkaabaaaaaaaaaaackiacaaa
acaaaaaabhaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaacaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
acaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaacaaaaaaegacbaaaadaaaaaabacaaaahbcaabaaaaaaaaaaa
egacbaaaadaaaaaaegacbaaaaaaaaaaadiaaaaalpcaabaaaaeaaaaaaegiocaaa
acaaaaaaaoaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialpaaaaiadpdiaaaaai
ocaabaaaaaaaaaaafgafbaaaaeaaaaaaagijcaaaaaaaaaaaaeaaaaaadcaaaaak
ocaabaaaaaaaaaaaagijcaaaaaaaaaaaadaaaaaaagaabaaaaeaaaaaafgaobaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaakgakbaaa
aeaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaa
agaaaaaapgapbaaaaeaaaaaafgaobaaaaaaaaaaaaaaaaaaiocaabaaaaaaaaaaa
agajbaiaebaaaaaaabaaaaaafgaobaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaa
egacbaiaebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahbcaabaaa
abaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaadiaaaaaibcaabaaaacaaaaaa
akaabaaaabaaaaaackiacaaaacaaaaaabgaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaa
abaaaaaabacaaaahccaabaaaaaaaaaaaegacbaaaadaaaaaajgahbaaaaaaaaaaa
aaaaaaakmcaabaaaaaaaaaaaagaebaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaiadpaaaaiadpaoaaaaakmcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpkgaobaaaaaaaaaaadiaaaaahdcaabaaaaaaaaaaalgapbaaa
aaaaaaaaegaabaaaaaaaaaaadiaaaaaincaabaaaaaaaaaaaagaabaaaaaaaaaaa
agijcaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
agaaaaaafgafbaaaaaaaaaaaigadbaaaaaaaaaaadcaaaaaphccabaaaabaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaoadpaaaaoadpaaaaoadpaaaaaaaaaceaaaaa
mnmmemdomnmmemdomnmmemdoaaaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadgaaaaag
bcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
akiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaadaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaah
cccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaadaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
afaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaadaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaabaaaaaah
cccabaaaagaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
agaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaagaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Matrix 48 [_CameraToWorld]
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
Vector 224 [unity_LightPosition0]
Vector 240 [unity_LightPosition1]
Vector 256 [unity_LightPosition2]
Vector 272 [unity_LightPosition3]
Vector 288 [unity_LightPosition4]
Vector 304 [unity_LightPosition5]
Vector 320 [unity_LightPosition6]
Vector 336 [unity_LightPosition7]
Vector 352 [unity_LightAtten0]
Vector 368 [unity_LightAtten1]
Vector 384 [unity_LightAtten2]
Vector 400 [unity_LightAtten3]
Vector 416 [unity_LightAtten4]
Vector 432 [unity_LightAtten5]
Vector 448 [unity_LightAtten6]
Vector 464 [unity_LightAtten7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedkeajhkojdhagokmmlajffbpdcjohppkiabaaaaaakibaaaaaaeaaaaaa
daaaaaaaoaafaaaabaapaaaaniapaaaaebgpgodjkiafaaaakiafaaaaaaacpopp
beafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaabaa
abaaabaaaaaaaaaaaaaaadaaaeaaacaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaagaaacaaahaaaaaaaaaaacaaaoaaacaaajaaaaaaaaaaacaabgaaacaaalaa
aaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaaeaabbaaaaaaaaaaadaabeaa
abaabfaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaialp
aaaaaaaaaaaaaaaafbaaaaafbhaaapkaaaaaoadpmnmmemdoaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaabaaaaacaaaaadiabgaaoekaafaaaaad
abaaapiaaaaabaiaakaaoekaafaaaaadacaaahiaabaaffiaadaaoekaaeaaaaae
acaaahiaacaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahiaaeaaoekaabaakkia
acaaoeiaaeaaaaaeabaaahiaafaaoekaabaappiaabaaoeiaafaaaaadacaaahia
aaaaffjabcaaoekaaeaaaaaeacaaahiabbaaoekaaaaaaajaacaaoeiaaeaaaaae
acaaahiabdaaoekaaaaakkjaacaaoeiaaeaaaaaeacaaahiabeaaoekaaaaappja
acaaoeiaacaaaaadabaaahiaabaaoeiaacaaoeibaiaaaaadaaaaaeiaabaaoeia
abaaoeiaahaaaaacaaaaaiiaaaaakkiaafaaaaadadaaaciaaaaakkiaamaakkka
afaaaaadabaaahiaaaaappiaabaaoeiaafaaaaadaeaaahiaacaaffjabcaaoeka
aeaaaaaeaeaaahiabbaaoekaacaaaajaaeaaoeiaaeaaaaaeaeaaahiabdaaoeka
acaakkjaaeaaoeiaaiaaaaadaaaaaeiaaeaaoeiaabaaoeiaalaaaaadaaaaaeia
aaaakkiabgaakkkaafaaaaadabaaapiaaaaabaiaajaaoekaafaaaaadaaaaalia
abaaffiaadaakekaaeaaaaaeaaaaaliaacaakekaabaaaaiaaaaaoeiaaeaaaaae
aaaaaliaaeaakekaabaakkiaaaaaoeiaaeaaaaaeaaaaaliaafaakekaabaappia
aaaaoeiaacaaaaadaaaaaliaacaakeibaaaaoeiaacaaaaadacaaahoaacaaoeib
agaaoekaaiaaaaadabaaabiaaaaapeiaaaaapeiaafaaaaadadaaabiaabaaaaia
alaakkkaahaaaaacabaaabiaabaaaaiaafaaaaadaaaaaliaaaaaoeiaabaaaaia
aiaaaaadaaaaabiaaeaaoeiaaaaapeiaalaaaaadaaaaabiaaaaaaaiabgaakkka
akaaaaadaaaaafiaaaaaoeiabgaaaakaacaaaaadaaaaakiaadaagaiabgaaaaka
agaaaaacaaaaaiiaaaaappiaagaaaaacaaaaaciaaaaaffiaafaaaaadaaaaabia
aaaaffiaaaaaaaiaafaaaaadaaaaaciaaaaappiaaaaakkiaafaaaaadaaaaaoia
aaaaffiaaiaajakaaeaaaaaeaaaaahiaahaaoekaaaaaaaiaaaaapjiaaeaaaaae
aaaaahoaaaaaoeiabhaaaakabhaaffkaaeaaaaaeabaaadoaadaaoejaabaaoeka
abaaookaabaaaaacaaaaabiabbaaaakaabaaaaacaaaaaciabcaaaakaabaaaaac
aaaaaeiabdaaaakaafaaaaadaaaaahiaaaaaoeiabfaappkaaiaaaaadadaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaabiabbaaffkaabaaaaacaaaaaciabcaaffka
abaaaaacaaaaaeiabdaaffkaafaaaaadaaaaahiaaaaaoeiabfaappkaaiaaaaad
aeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaabaaoeiaaaaaoeiaaiaaaaad
aeaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiabbaakkkaabaaaaacaaaaacia
bcaakkkaabaaaaacaaaaaeiabdaakkkaafaaaaadaaaaahiaaaaaoeiabfaappka
aiaaaaadafaaaboaabaaoejaaaaaoeiaaiaaaaadafaaacoaabaaoeiaaaaaoeia
aiaaaaadafaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcciajaaaaeaaaabaaekacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacafaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaalpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialp
aaaaiadpdiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaa
aaaaaaaadiaaaaaiccaabaaaacaaaaaadkaabaaaaaaaaaaackiacaaaacaaaaaa
bhaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaabaaaaaa
diaaaaaihcaabaaaadaaaaaafgbfbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaacaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaacaaaaaaegacbaaaadaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaa
adaaaaaaegacbaaaaaaaaaaadiaaaaalpcaabaaaaeaaaaaaegiocaaaacaaaaaa
aoaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialpaaaaiadpdiaaaaaiocaabaaa
aaaaaaaafgafbaaaaeaaaaaaagijcaaaaaaaaaaaaeaaaaaadcaaaaakocaabaaa
aaaaaaaaagijcaaaaaaaaaaaadaaaaaaagaabaaaaeaaaaaafgaobaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaakgakbaaaaeaaaaaa
fgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaaagaaaaaa
pgapbaaaaeaaaaaafgaobaaaaaaaaaaaaaaaaaaiocaabaaaaaaaaaaaagajbaia
ebaaaaaaabaaaaaafgaobaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaia
ebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaa
jgahbaaaaaaaaaaajgahbaaaaaaaaaaadiaaaaaibcaabaaaacaaaaaaakaabaaa
abaaaaaackiacaaaacaaaaaabgaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaa
bacaaaahccaabaaaaaaaaaaaegacbaaaadaaaaaajgahbaaaaaaaaaaaaaaaaaak
mcaabaaaaaaaaaaaagaebaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadp
aaaaiadpaoaaaaakmcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpkgaobaaaaaaaaaaadiaaaaahdcaabaaaaaaaaaaalgapbaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaaincaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaagaaaaaa
fgafbaaaaaaaaaaaigadbaaaaaaaaaaadcaaaaaphccabaaaabaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaoadpaaaaoadpaaaaoadpaaaaaaaaaceaaaaamnmmemdo
mnmmemdomnmmemdoaaaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadgaaaaagbcaabaaa
aaaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaa
aeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaa
bkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaabkiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaadaaaaaaaoaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaabaaaaaah
cccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaa
afaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaa
egbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaaaaaaaaackiacaaaadaaaaaaaoaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaabaaaaaahcccabaaa
agaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaagaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 2, 1, 0.25, 3 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[1], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[1].x, -c[1].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[1].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.z, R0, fragment.texcoord[5];
DP3 R1.y, R0, fragment.texcoord[4];
DP3 R0.x, R1, fragment.texcoord[2];
MUL R0.xyz, R1, R0.x;
MAD R1.xyz, -R0, c[1].x, fragment.texcoord[2];
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1, R1, texture[2], CUBE;
ADD_SAT R2.y, R0, -c[1].z;
ADD R2.x, -R0.w, c[1].y;
MUL R1, R1, R2.y;
MUL R1, R1, R2.x;
MAD R2.xyz, R0.w, c[0].x, fragment.texcoord[0];
MOV R0.w, c[1].y;
MUL R0.xyz, R0, R2;
MAD result.color, R1, c[1].w, R0;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c1, 2.00000000, -1.00000000, 1.00000000, -0.25000000
def c2, 3.00000000, 0, 0, 0
dcl t0.xyz
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r0, t1, s1
texld r2, t1, s0
mov r0.x, r0.w
mad_pp r0.xy, r0, c1.x, c1.y
mul_pp r1.xy, r0, r0
add_pp_sat r1.x, r1, r1.y
add_pp r1.x, -r1, c1.z
rsq_pp r1.x, r1.x
rcp_pp r0.z, r1.x
dp3_pp r1.x, t3, r0
dp3_pp r1.z, r0, t5
dp3_pp r1.y, r0, t4
dp3_pp r0.x, r1, t2
mul_pp r0.xyz, r1, r0.x
mad_pp r0.xyz, -r0, c1.x, t2
add_pp_sat r1.x, r2.y, c1.w
texld r3, r0, s2
mul_pp r1, r3, r1.x
add_pp r0.x, -r2.w, c1.z
mul_pp r0, r1, r0.x
mad_pp r1.xyz, r2.w, c0.x, t0
mov_pp r1.w, c1.z
mul_pp r1.xyz, r2, r1
mad_pp r0, r0, c2.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 32 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0
eefiecedobgecniinojifojngmfhcbicdelbmppkabaaaaaamiaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjaadaaaaeaaaaaaaoeaaaaaa
fjaaaaaeegiocaaaaaaaaaaaadaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaa
egacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaa
aaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaagaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegacbaaaabaaaaaaagaabaiaebaaaaaaaaaaaaaaegbcbaaaadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaacaaaahbcaabaaaacaaaaaabkaabaaa
abaaaaaaabeaaaaaaaaaialodiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
agaabaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpdcaaaaak
hcaabaaaadaaaaaapgapbaaaabaaaaaaagiacaaaaaaaaaaaacaaaaaaegbcbaaa
abaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
aaaaaaaibcaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
dcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaaegaobaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 2
SetTexture 2 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 32 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjnfocdmfhklgodbkjnbbjhogclagdddiabaaaaaadmahaaaaaeaaaaaa
daaaaaaakaacaaaadiagaaaaaiahaaaaebgpgodjgiacaaaagiacaaaaaaacpppp
cmacaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
acababaaabacacaaaaaaacaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaaaaaeaeaaaaaialo
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaachlabpaaaaacaaaaaaiaabaacdla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajiabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaacpiaabaaoela
acaioekaaeaaaaaeabaacbiaaaaappiaabaaaakaabaaffkaaeaaaaaeabaaccia
aaaaffiaabaaaakaabaaffkafkaaaaaeabaadiiaabaaoeiaabaaoeiaabaakkka
acaaaaadabaaciiaabaappibabaappkaahaaaaacabaaciiaabaappiaagaaaaac
abaaceiaabaappiaaiaaaaadaaaacbiaadaaoelaabaaoeiaaiaaaaadaaaaccia
aeaaoelaabaaoeiaaiaaaaadaaaaceiaafaaoelaabaaoeiaaiaaaaadaaaaciia
acaaoelaaaaaoeiaacaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachia
aaaaoeiaaaaappibacaaoelaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaad
abaacpiaabaaoelaaaaioekaafaaaaadaaaacpiaaaaaoeiaacaaaakaacaaaaad
acaadiiaabaaffiaacaaffkaafaaaaadaaaacpiaaaaaoeiaacaappiaabaaaaac
acaaciiaabaappkaaeaaaaaeadaachiaabaappiaaaaaaakaaaaaoelaafaaaaad
acaachiaabaaoeiaadaaoeiaacaaaaadabaacbiaabaappibabaappkaaeaaaaae
aaaacpiaaaaaoeiaabaaaaiaacaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcjaadaaaaeaaaaaaaoeaaaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaaaaaaaaa
hgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaagaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegacbaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaia
ebaaaaaaaaaaaaaaegbcbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaa
aaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeaefaaaaaj
pcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aacaaaahbcaabaaaacaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaialodiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaacaaaaaadgaaaaaficaabaaa
acaaaaaaabeaaaaaaaaaiadpdcaaaaakhcaabaaaadaaaaaapgapbaaaabaaaaaa
agiacaaaaaaaaaaaacaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaaaaaaaaaibcaabaaaabaaaaaadkaabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajpccabaaaaaaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfagphdgjhegjgpgoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 LOD 190
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
 Pass {
  Tags { "QUEUE"="Geometry" "RenderType"="Opaque" "Reflection"="RenderReflectionOpaque" }
  Lighting On
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_LightColor0]
Vector 11 [unity_LightColor1]
Vector 12 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { { 0.2, 2 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1, c[11];
ADD R1, R1, c[10];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R2.xyz, -R0, c[9];
DP3 R0.z, vertex.normal, c[7];
DP3 R0.y, vertex.normal, c[6];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.w, R0, R2;
MUL R0.xyz, R0, c[0].y;
MAD result.texcoord[2].xyz, -R0, R0.w, R2;
MUL result.texcoord[0], R1, c[0].x;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_LightColor0]
Vector 10 [unity_LightColor1]
Vector 11 [_MainTex_ST]
"vs_2_0
def c12, 0.20000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1, c9
add r1, c10, r1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r2.xyz, -r0, c8
dp3 r0.z, v1, c6
dp3 r0.y, v1, c5
dp3 r0.x, v1, c4
dp3 r0.w, r0, r2
mul r0.xyz, r0, c12.y
mad oT2.xyz, -r0, r0.w, r2
mul oT0, r1, c12.x
mad oT1.xy, v2, c11, c11.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefieceddjbaigpdomgofeamoikogonmcfpnmkbjabaaaaaahiaeaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffied
epepfceeaaklklklfdeieefceiadaaaaeaaaabaancaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaaiaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaaaaaaaaajpcaabaaaaaaaaaaaegiocaaa
acaaaaaaagaaaaaaegiocaaaacaaaaaaahaaaaaadiaaaaakpccabaaaabaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmemdomnmmemdomnmmemdomnmmemdodcaaaaal
dccabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaa
aaaaaaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
abaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Vector 16 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityLighting" 720
Vector 96 [unity_LightColor0]
Vector 112 [unity_LightColor1]
Vector 128 [unity_LightColor2]
Vector 144 [unity_LightColor3]
Vector 160 [unity_LightColor4]
Vector 176 [unity_LightColor5]
Vector 192 [unity_LightColor6]
Vector 208 [unity_LightColor7]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedphcambebmobhengjhhjdcocmmpgkgkfcabaaaaaakaagaaaaaeaaaaaa
daaaaaaafeacaaaakeafaaaabiagaaaaebgpgodjbmacaaaabmacaaaaaaacpopp
liabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaagaaacaaadaaaaaaaaaa
adaaaaaaaeaaafaaaaaaaaaaadaaamaaaeaaajaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafanaaapkamnmmemdoaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjaabaaaaac
aaaaapiaadaaoekaacaaaaadaaaaapiaaaaaoeiaaeaaoekaafaaaaadaaaaapoa
aaaaoeiaanaaaakaaeaaaaaeabaaadoaacaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaaaaaffjaakaaoekaaeaaaaaeaaaaahiaajaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaamaaoeka
aaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibacaaoekaafaaaaadabaaahia
abaaffjaakaaoekaaeaaaaaeabaaahiaajaaoekaabaaaajaabaaoeiaaeaaaaae
abaaahiaalaaoekaabaakkjaabaaoeiaaiaaaaadaaaaaiiaaaaaoeiaabaaoeia
acaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeacaaahoaabaaoeiaaaaappib
aaaaoeiaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefceiadaaaaeaaaabaa
ncaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaaiaaaaaafjaaaaaeegiocaaaadaaaaaa
baaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaad
dcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaaaaaaaaaj
pcaabaaaaaaaaaaaegiocaaaacaaaaaaagaaaaaaegiocaaaacaaaaaaahaaaaaa
diaaaaakpccabaaaabaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmemdomnmmemdo
mnmmemdomnmmemdodcaaaaaldccabaaaacaaaaaaegbabaaaacaaaaaaegiacaaa
aaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakhccabaaa
adaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
ahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaafaepfdej
feejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklklepfdeheoiaaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { program.local[0],
		{ 0.25, 1, 3 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[1], CUBE;
ADD_SAT R2.y, R0, -c[1].x;
MUL R1, R1, R2.y;
ADD R2.x, -R0.w, c[1].y;
MUL R1, R1, R2.x;
MUL R1, R1, c[1].z;
MAD R2, R0.w, c[0].x, fragment.texcoord[0];
MAD result.color, R2, R0, R1;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c1, -0.25000000, 1.00000000, 3.00000000, 0
dcl t0
dcl t1.xy
dcl t2.xyz
texld r1, t1, s0
texld r3, t2, s1
add_pp r0.x, -r1.w, c1.y
add_pp_sat r2.x, r1.y, c1
mul_pp r2, r3, r2.x
mul_pp r0, r2, r0.x
mul_pp r0, r0, c1.z
mad_pp r2, r1.w, c0.x, t0
mad_pp r0, r2, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 32 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeppbheekjmeeglhgifahpgenepjgikljabaaaaaakmacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
gphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefclmabaaaaeaaaaaaagpaaaaaafjaaaaaeegiocaaa
aaaaaaaaadaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbcbaaaadaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaaacaaaahbcaabaaaacaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaaialodiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaacaaaaaa
aaaaaaaibcaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaacaaaaaadcaaaaak
pcaabaaaacaaaaaapgapbaaaabaaaaaaagiacaaaaaaaaaaaacaaaaaaegbobaaa
abaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaabaaaaaa
egaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 32 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjnoefhpbcajockfpmolgjapkdhcilopbabaaaaaapaadaaaaaeaaaaaa
daaaaaaahaabaaaadeadaaaalmadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
aaabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaacaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaeaea
aaaaialoaaaaiadpaaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaia
abaacdlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajiabaiapkaecaaaaadaaaacpiaacaaoelaabaioekaecaaaaadabaacpia
abaaoelaaaaioekaafaaaaadaaaacpiaaaaaoeiaabaaaakaacaaaaadacaadiia
abaaffiaabaaffkaafaaaaadaaaacpiaaaaaoeiaacaappiaacaaaaadacaacbia
abaappibabaakkkaafaaaaadaaaacpiaaaaaoeiaacaaaaiaaeaaaaaeacaacpia
abaappiaaaaaaakaaaaaoelaaeaaaaaeaaaacpiaacaaoeiaabaaoeiaaaaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefclmabaaaaeaaaaaaagpaaaaaa
fjaaaaaeegiocaaaaaaaaaaaadaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbcbaaaadaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaaacaaaahbcaabaaaacaaaaaabkaabaaa
abaaaaaaabeaaaaaaaaaialodiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
agaabaaaacaaaaaaaaaaaaaibcaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaa
acaaaaaadcaaaaakpcaabaaaacaaaaaapgapbaaaabaaaaaaagiacaaaaaaaaaaa
acaaaaaaegbobaaaabaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaacaaaaaa
egaobaaaabaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}