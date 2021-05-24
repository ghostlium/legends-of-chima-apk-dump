//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "AngryBots/Character/CharacterSelfIlluminationReflective" {
Properties {
 _MainTex ("Base (RGB) Gloss (A)", 2D) = "grey" {}
 _BumpMap ("Normalmap", 2D) = "bump" {}
 _Cube ("Cube", CUBE) = "black" {}
 _SelfIllumStrength ("_SelfIllumStrength", Range(0,1.5)) = 1
 _RoomReflectionAmount ("RoomReflectionAmount", Range(0,3.5)) = 3
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
Matrix 16 [_CameraToWorld]
Vector 80 [_MainTex_ST]
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
eefiecedhaggiaaechogjgcabnkglkaoikcdgebnabaaaaaapeakaaaaadaaaaaa
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
agaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
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
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
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
ocaabaaaaaaaaaaafgafbaaaaeaaaaaaagijcaaaaaaaaaaaacaaaaaadcaaaaak
ocaabaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaaagaabaaaaeaaaaaafgaobaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaaadaaaaaakgakbaaa
aeaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaa
aeaaaaaapgapbaaaaeaaaaaafgaobaaaaaaaaaaaaaaaaaaiocaabaaaaaaaaaaa
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
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadgaaaaag
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
Matrix 16 [_CameraToWorld]
Vector 80 [_MainTex_ST]
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
eefiecedidndbgoeijfccodhpikmnmeoeakdbldkabaaaaaajmbaaaaaaeaaaaaa
daaaaaaaneafaaaaaeapaaaammapaaaaebgpgodjjmafaaaajmafaaaaaaacpopp
beafaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaabaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaagaaacaaahaaaaaaaaaa
acaaaoaaacaaajaaaaaaaaaaacaabgaaacaaalaaaaaaaaaaadaaaaaaaeaaanaa
aaaaaaaaadaaamaaaeaabbaaaaaaaaaaadaabeaaabaabfaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaialpaaaaaaaaaaaaaaaafbaaaaaf
bhaaapkaaaaaoadpmnmmemdoaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaabaaaaacaaaaadiabgaaoekaafaaaaadabaaapiaaaaabaiaakaaoeka
afaaaaadacaaahiaabaaffiaacaaoekaaeaaaaaeacaaahiaabaaoekaabaaaaia
acaaoeiaaeaaaaaeabaaahiaadaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahia
aeaaoekaabaappiaabaaoeiaafaaaaadacaaahiaaaaaffjabcaaoekaaeaaaaae
acaaahiabbaaoekaaaaaaajaacaaoeiaaeaaaaaeacaaahiabdaaoekaaaaakkja
acaaoeiaaeaaaaaeacaaahiabeaaoekaaaaappjaacaaoeiaacaaaaadabaaahia
abaaoeiaacaaoeibaiaaaaadaaaaaeiaabaaoeiaabaaoeiaahaaaaacaaaaaiia
aaaakkiaafaaaaadadaaaciaaaaakkiaamaakkkaafaaaaadabaaahiaaaaappia
abaaoeiaafaaaaadaeaaahiaacaaffjabcaaoekaaeaaaaaeaeaaahiabbaaoeka
acaaaajaaeaaoeiaaeaaaaaeaeaaahiabdaaoekaacaakkjaaeaaoeiaaiaaaaad
aaaaaeiaaeaaoeiaabaaoeiaalaaaaadaaaaaeiaaaaakkiabgaakkkaafaaaaad
abaaapiaaaaabaiaajaaoekaafaaaaadaaaaaliaabaaffiaacaakekaaeaaaaae
aaaaaliaabaakekaabaaaaiaaaaaoeiaaeaaaaaeaaaaaliaadaakekaabaakkia
aaaaoeiaaeaaaaaeaaaaaliaaeaakekaabaappiaaaaaoeiaacaaaaadaaaaalia
acaakeibaaaaoeiaacaaaaadacaaahoaacaaoeibagaaoekaaiaaaaadabaaabia
aaaapeiaaaaapeiaafaaaaadadaaabiaabaaaaiaalaakkkaahaaaaacabaaabia
abaaaaiaafaaaaadaaaaaliaaaaaoeiaabaaaaiaaiaaaaadaaaaabiaaeaaoeia
aaaapeiaalaaaaadaaaaabiaaaaaaaiabgaakkkaakaaaaadaaaaafiaaaaaoeia
bgaaaakaacaaaaadaaaaakiaadaagaiabgaaaakaagaaaaacaaaaaiiaaaaappia
agaaaaacaaaaaciaaaaaffiaafaaaaadaaaaabiaaaaaffiaaaaaaaiaafaaaaad
aaaaaciaaaaappiaaaaakkiaafaaaaadaaaaaoiaaaaaffiaaiaajakaaeaaaaae
aaaaahiaahaaoekaaaaaaaiaaaaapjiaaeaaaaaeaaaaahoaaaaaoeiabhaaaaka
bhaaffkaaeaaaaaeabaaadoaadaaoejaafaaoekaafaaookaabaaaaacaaaaabia
bbaaaakaabaaaaacaaaaaciabcaaaakaabaaaaacaaaaaeiabdaaaakaafaaaaad
aaaaahiaaaaaoeiabfaappkaaiaaaaadadaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
adaaacoaabaaoeiaaaaaoeiaaiaaaaadadaaaeoaacaaoejaaaaaoeiaabaaaaac
aaaaabiabbaaffkaabaaaaacaaaaaciabcaaffkaabaaaaacaaaaaeiabdaaffka
afaaaaadaaaaahiaaaaaoeiabfaappkaaiaaaaadaeaaaboaabaaoejaaaaaoeia
aiaaaaadaeaaacoaabaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeia
abaaaaacaaaaabiabbaakkkaabaaaaacaaaaaciabcaakkkaabaaaaacaaaaaeia
bdaakkkaafaaaaadaaaaahiaaaaaoeiabfaappkaaiaaaaadafaaaboaabaaoeja
aaaaoeiaaiaaaaadafaaacoaabaaoeiaaaaaoeiaaiaaaaadafaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcciajaaaaeaaaabaa
ekacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadhccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaalpcaabaaaaaaaaaaaegiocaaaacaaaaaa
apaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialpaaaaiadpdiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaa
acaaaaaadkaabaaaaaaaaaaackiacaaaacaaaaaabhaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaaadaaaaaa
fgbfbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaacaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaacaaaaaaegacbaaa
adaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaaaaaaaaa
diaaaaalpcaabaaaaeaaaaaaegiocaaaacaaaaaaaoaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaialpaaaaiadpdiaaaaaiocaabaaaaaaaaaaafgafbaaaaeaaaaaa
agijcaaaaaaaaaaaacaaaaaadcaaaaakocaabaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaaagaabaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaa
agijcaaaaaaaaaaaadaaaaaakgakbaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaak
ocaabaaaaaaaaaaaagijcaaaaaaaaaaaaeaaaaaapgapbaaaaeaaaaaafgaobaaa
aaaaaaaaaaaaaaaiocaabaaaaaaaaaaaagajbaiaebaaaaaaabaaaaaafgaobaaa
aaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaa
abaaaaaaaeaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaadiaaaaaibcaabaaaacaaaaaaakaabaaaabaaaaaackiacaaaacaaaaaa
bgaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabacaaaahccaabaaaaaaaaaaa
egacbaaaadaaaaaajgahbaaaaaaaaaaaaaaaaaakmcaabaaaaaaaaaaaagaebaaa
acaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaiadpaoaaaaakmcaabaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpkgaobaaaaaaaaaaa
diaaaaahdcaabaaaaaaaaaaalgapbaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaai
ncaabaaaaaaaaaaaagaabaaaaaaaaaaaagijcaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaagaaaaaafgafbaaaaaaaaaaaigadbaaa
aaaaaaaadcaaaaaphccabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaoadp
aaaaoadpaaaaoadpaaaaaaaaaceaaaaamnmmemdomnmmemdomnmmemdoaaaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaabaaaaaahbccabaaaaeaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaabkiacaaaadaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
ckiacaaaadaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaabaaaaaahcccabaaaagaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaagaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaagaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaiaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_RoomReflectionAmount]
Float 1 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0..1],
		{ 2, 1, 0.22497559 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[1], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[2].x, -c[2].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[2].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[3], R0;
DP3 R1.z, R0, fragment.texcoord[5];
DP3 R1.y, R0, fragment.texcoord[4];
DP3 R0.x, R1, fragment.texcoord[2];
MUL R0.xyz, R1, R0.x;
MAD R0.xyz, -R0, c[2].x, fragment.texcoord[2];
TEX R1, fragment.texcoord[1], texture[0], 2D;
TEX R0, R0, texture[2], CUBE;
MAD R2.xyz, R1.w, c[1].x, fragment.texcoord[0];
MUL R2.xyz, R1, R2;
MUL R0, R0, c[0].x;
MOV R2.w, R1;
ADD_SAT R1.x, R1.z, -c[2].z;
MAD result.color, R0, R1.x, R2;
END
# 21 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_RoomReflectionAmount]
Float 1 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c2, 2.00000000, -1.00000000, 1.00000000, -0.22497559
dcl t0.xyz
dcl t1.xy
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r0, t1, s1
mov r0.x, r0.w
mad_pp r0.xy, r0, c2.x, c2.y
mul_pp r1.xy, r0, r0
add_pp_sat r1.x, r1, r1.y
add_pp r1.x, -r1, c2.z
rsq_pp r1.x, r1.x
rcp_pp r0.z, r1.x
dp3_pp r1.x, t3, r0
dp3_pp r1.z, r0, t5
dp3_pp r1.y, r0, t4
dp3_pp r0.x, r1, t2
mul_pp r0.xyz, r1, r0.x
mad_pp r1.xyz, -r0, c2.x, t2
texld r0, t1, s0
texld r1, r1, s2
mad_pp r2.xyz, r0.w, c1.x, t0
mul_pp r2.xyz, r0, r2
mul_pp r1, r1, c0.x
mov_pp r2.w, r0
add_pp_sat r0.x, r0.z, c2.w
mad_pp r0, r1, r0.x, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 112
Float 96 [_RoomReflectionAmount]
Float 100 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpdhomdhicdpaejlkmnhjagmjcpopafjcabaaaaaaieaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcemadaaaaeaaaaaaandaaaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
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
acaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaapgapbaaaabaaaaaafgifcaaa
aaaaaaaaagaaaaaaegbcbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaaaacaaaahbcaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaagggggglodgaaaaaficaabaaaacaaaaaadkaabaaaabaaaaaadcaaaaaj
pccabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_BumpMap] 2D 1
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 112
Float 96 [_RoomReflectionAmount]
Float 100 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkoidejjoikdkgebpdncepgimbcakceffabaaaaaaniagaaaaaeaaaaaa
daaaaaaaiaacaaaaneafaaaakeagaaaaebgpgodjeiacaaaaeiacaaaaaaacpppp
amacaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaagaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafacaaapkaggggggloaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaachlabpaaaaacaaaaaaiaabaacdla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaecaaaaadaaaacpiaabaaoela
abaioekaaeaaaaaeabaacbiaaaaappiaabaaaakaabaaffkaaeaaaaaeabaaccia
aaaaffiaabaaaakaabaaffkafkaaaaaeabaadiiaabaaoeiaabaaoeiaabaakkka
acaaaaadabaaciiaabaappibabaappkaahaaaaacabaaciiaabaappiaagaaaaac
abaaceiaabaappiaaiaaaaadaaaacbiaadaaoelaabaaoeiaaiaaaaadaaaaccia
aeaaoelaabaaoeiaaiaaaaadaaaaceiaafaaoelaabaaoeiaaiaaaaadaaaaciia
acaaoelaaaaaoeiaacaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachia
aaaaoeiaaaaappibacaaoelaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaad
abaacpiaabaaoelaaaaioekaafaaaaadaaaacpiaaaaaoeiaaaaaaakaaeaaaaae
acaachiaabaappiaaaaaffkaaaaaoelaafaaaaadacaachiaabaaoeiaacaaoeia
acaaaaadabaadbiaabaakkiaacaaaakaabaaaaacacaaciiaabaappiaaeaaaaae
aaaacpiaaaaaoeiaabaaaaiaacaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcemadaaaaeaaaaaaandaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaa
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
aaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaagiacaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaa
acaaaaaapgapbaaaabaaaaaafgifcaaaaaaaaaaaagaaaaaaegbcbaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaacaaaah
bcaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaagggggglodgaaaaaficaabaaa
acaaaaaadkaabaaaabaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaa
agaabaaaabaaaaaaegaobaaaacaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahahaaaafdfgfpfagphdgjhegjgpgoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
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
Matrix 9 [_CameraToWorld]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightPosition0]
Vector 17 [unity_LightPosition1]
Vector 18 [unity_LightAtten0]
Vector 19 [unity_LightAtten1]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1, -1, 0, 1.75 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0.19995117, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
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
DP3 R3.w, R0, R0;
DP3 R2.zw, R3, R3;
RSQ R1.w, R2.z;
RSQ R0.w, R3.w;
MUL R2.xyz, R0.w, R0;
MUL R3.xyz, R1.w, R3;
DP3 R0.z, vertex.normal, c[7];
DP3 R0.y, vertex.normal, c[6];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.w, R0, R2;
DP3 R1.w, R0, R3;
MIN R0.w, R0, c[0].x;
MIN R2.z, R1.w, c[0].x;
MOV R3.x, R2.w;
ADD R1.xyz, -R1, c[13];
MOV R2.y, c[19].z;
MOV R2.x, c[18].z;
MAD R2.xy, R3.wxzw, R2, c[0].x;
RCP R1.w, R2.y;
MAX R2.y, R2.z, c[0].z;
MUL R2.y, R2, R1.w;
RCP R1.w, R2.x;
MAX R0.w, R0, c[0].z;
MUL R0.w, R0, R1;
MUL R3.xyz, R2.y, c[15];
MUL R2.xyz, R0.w, c[14];
MOV R0.w, c[21].x;
ADD R2.xyz, R2, R3;
MAD result.texcoord[0].xyz, R2, c[0].w, R0.w;
DP3 R0.w, R0, R1;
MUL R0.xyz, R0, c[21].y;
MAD result.texcoord[2].xyz, -R0, R0.w, R1;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 51 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
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
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, -1.00000000, 0.00000000, 2.00000000
def c21, 1.75000000, 0.19995117, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1, c16
mul r1, c20.xxyx, r1
mov r0, c15
mul r0, c20.xxyx, r0
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
dp3 r3.w, r0, r0
dp3 r2.zw, r3, r3
rsq r1.w, r2.z
rsq r0.w, r3.w
mul r2.xyz, r0.w, r0
mul r3.xyz, r1.w, r3
dp3 r0.z, v1, c6
dp3 r0.y, v1, c5
dp3 r0.x, v1, c4
dp3 r0.w, r0, r2
dp3 r1.w, r0, r3
min r0.w, r0, c20.x
min r2.z, r1.w, c20.x
mov r3.x, r2.w
add r1.xyz, -r1, c12
mov r2.y, c18.z
mov r2.x, c17.z
mad r2.xy, r3.wxzw, r2, c20.x
rcp r1.w, r2.y
max r2.y, r2.z, c20.z
mul r2.y, r2, r1.w
rcp r1.w, r2.x
max r0.w, r0, c20.z
mul r0.w, r0, r1
mul r3.xyz, r2.y, c14
mul r2.xyz, r0.w, c13
dp3 r0.w, r0, r1
add r2.xyz, r2, r3
mul r0.xyz, r0, c20.w
mad oT0.xyz, r2, c21.x, c21.y
mad oT2.xyz, -r0, r0.w, r1
mad oT1.xy, v2, c19, c19.zwzw
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
Matrix 16 [_CameraToWorld]
Vector 80 [_MainTex_ST]
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedejdlnlcemcaleipaobcddennipacnmpnabaaaaaabaaiaaaaadaaaaaa
cmaaaaaakaaaaaaaciabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfagphdgjhegjgpgoaafeeffied
epepfceeaaklklklfdeieefcoaagaaaaeaaaabaaliabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaabiaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaalpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialpaaaaiadpdiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaiaebaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaibcaabaaaacaaaaaadkaabaaaaaaaaaaackiacaaa
acaaaaaabgaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaalpcaabaaa
adaaaaaaegiocaaaacaaaaaaapaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaialp
aaaaiadpdiaaaaaihcaabaaaaeaaaaaafgafbaaaadaaaaaaegiccaaaaaaaaaaa
acaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaaaaaaaaaabaaaaaaagaabaaa
adaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaaaaaaaaa
adaaaaaakgakbaaaadaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaaaaaaaaaaeaaaaaapgapbaaaadaaaaaaegacbaaaadaaaaaaaaaaaaai
hcaabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaadaaaaaaaaaaaaaj
hcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaaegacbaaaadaaaaaadiaaaaai
ccaabaaaacaaaaaadkaabaaaaaaaaaaackiacaaaacaaaaaabhaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
aaaaaaaaegacbaaaadaaaaaaaaaaaaakdcaabaaaacaaaaaaegaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaaaaaaaaaaaaaaoaaaaakdcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaabaaaacaaaaaadiaaaaai
hcaabaaaaeaaaaaafgbfbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaeaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaabaaaaaaegacbaaa
aeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
abaaaaaaegacbaaaaeaaaaaabacaaaahicaabaaaaaaaaaaaegacbaaaaeaaaaaa
egacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaadkaabaaa
aaaaaaaadiaaaaaiocaabaaaacaaaaaapgapbaaaaaaaaaaaagijcaaaacaaaaaa
ahaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaaaaaaaaaa
diaaaaahbcaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaajgahbaaa
acaaaaaadcaaaaaphccabaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaoadp
aaaaoadpaaaaoadpaaaaaaaaaceaaaaamnmmemdomnmmemdomnmmemdoaaaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaacaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakhccabaaaadaaaaaaegacbaaaaeaaaaaaagaabaiaebaaaaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Matrix 16 [_CameraToWorld]
Vector 80 [_MainTex_ST]
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
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecediegkdbknggjafdcpmodbbgcfnnhehmjeabaaaaaahiamaaaaaeaaaaaa
daaaaaaajeaeaaaahmalaaaapaalaaaaebgpgodjfmaeaaaafmaeaaaaaaacpopp
oaadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaabaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaagaaacaaahaaaaaaaaaa
acaaaoaaacaaajaaaaaaaaaaacaabgaaacaaalaaaaaaaaaaadaaaaaaaeaaanaa
aaaaaaaaadaaamaaaeaabbaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
aaaaiadpaaaaialpaaaaaaaaaaaaaaaafbaaaaafbgaaapkaaaaaoadpmnmmemdo
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjaabaaaaacaaaaadiabfaaoekaafaaaaadabaaapia
aaaabaiaajaaoekaafaaaaadacaaahiaabaaffiaacaaoekaaeaaaaaeacaaahia
abaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahiaadaaoekaabaakkiaacaaoeia
aeaaaaaeabaaahiaaeaaoekaabaappiaabaaoeiaafaaaaadacaaahiaaaaaffja
bcaaoekaaeaaaaaeacaaahiabbaaoekaaaaaaajaacaaoeiaaeaaaaaeacaaahia
bdaaoekaaaaakkjaacaaoeiaaeaaaaaeacaaahiabeaaoekaaaaappjaacaaoeia
acaaaaadabaaahiaabaaoeiaacaaoeibaiaaaaadaaaaaeiaabaaoeiaabaaoeia
afaaaaadadaaabiaaaaakkiaalaakkkaahaaaaacaaaaaeiaaaaakkiaafaaaaad
abaaahiaaaaakkiaabaaoeiaafaaaaadaaaaapiaaaaabaiaakaaoekaafaaaaad
aeaaahiaaaaaffiaacaaoekaaeaaaaaeaeaaahiaabaaoekaaaaaaaiaaeaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaaeaaoeiaaeaaaaaeaaaaahiaaeaaoeka
aaaappiaaaaaoeiaacaaaaadaaaaahiaacaaoeibaaaaoeiaacaaaaadacaaahia
acaaoeibagaaoekaaiaaaaadaaaaaiiaaaaaoeiaaaaaoeiaafaaaaadadaaacia
aaaappiaamaakkkaahaaaaacaaaaaiiaaaaappiaafaaaaadaaaaahiaaaaappia
aaaaoeiaacaaaaadadaaadiaadaaoeiabfaaaakaagaaaaacaaaaaiiaadaaffia
agaaaaacabaaaiiaadaaaaiaafaaaaadadaaahiaabaaffjabcaaoekaaeaaaaae
adaaahiabbaaoekaabaaaajaadaaoeiaaeaaaaaeadaaahiabdaaoekaabaakkja
adaaoeiaaiaaaaadaaaaabiaadaaoeiaaaaaoeiaalaaaaadaaaaabiaaaaaaaia
bfaakkkaakaaaaadaaaaabiaaaaaaaiabfaaaakaafaaaaadaaaaabiaaaaappia
aaaaaaiaafaaaaadaaaaahiaaaaaaaiaaiaaoekaaiaaaaadaaaaaiiaadaaoeia
abaaoeiaalaaaaadaaaaaiiaaaaappiabfaakkkaakaaaaadaaaaaiiaaaaappia
bfaaaakaafaaaaadaaaaaiiaabaappiaaaaappiaaeaaaaaeaaaaahiaahaaoeka
aaaappiaaaaaoeiaaeaaaaaeaaaaahoaaaaaoeiabgaaaakabgaaffkaaeaaaaae
abaaadoaacaaoejaafaaoekaafaaookaaiaaaaadaaaaabiaacaaoeiaadaaoeia
acaaaaadaaaaabiaaaaaaaiaaaaaaaiaaeaaaaaeacaaahoaadaaoeiaaaaaaaib
acaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcoaagaaaaeaaaabaa
liabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaaeegiocaaaadaaaaaa
baaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaabaaaaaafpaaaaad
dcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaal
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaialpaaaaiadpdiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaibcaabaaaacaaaaaa
dkaabaaaaaaaaaaackiacaaaacaaaaaabgaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadiaaaaalpcaabaaaadaaaaaaegiocaaaacaaaaaaapaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaialpaaaaiadpdiaaaaaihcaabaaaaeaaaaaafgafbaaa
adaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaa
aaaaaaaaabaaaaaaagaabaaaadaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaaaaaaaaaadaaaaaakgakbaaaadaaaaaaegacbaaaaeaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaaaaaaaaaaeaaaaaapgapbaaaadaaaaaa
egacbaaaadaaaaaaaaaaaaaihcaabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaa
egacbaaaadaaaaaaaaaaaaajhcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaadaaaaaa
egacbaaaadaaaaaadiaaaaaiccaabaaaacaaaaaadkaabaaaaaaaaaaackiacaaa
acaaaaaabhaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaakdcaabaaa
acaaaaaaegaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaaaaaaaaaaaaa
aoaaaaakdcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaabaaaacaaaaaadiaaaaaihcaabaaaaeaaaaaafgbfbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaabaaaaaaegacbaaaaeaaaaaadcaaaaakhcaabaaaaeaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaabaaaaaaegacbaaaaeaaaaaabacaaaahicaabaaa
aaaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaacaaaaaadkaabaaaaaaaaaaadiaaaaaiocaabaaaacaaaaaapgapbaaa
aaaaaaaaagijcaaaacaaaaaaahaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaa
aeaaaaaaegacbaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaacaaaaaa
akaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaaaaaaaaajgahbaaaacaaaaaadcaaaaaphccabaaaabaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaoadpaaaaoadpaaaaoadpaaaaaaaaaceaaaaamnmmemdo
mnmmemdomnmmemdoaaaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaacaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegacbaaa
aeaaaaaaagaabaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
gmaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaafjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaagaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaafaepfdejfeejepeoaaeoepfc
enebemaafeeffiedepepfceeaaklklklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaahaiaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Float 0 [_RoomReflectionAmount]
Float 1 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[3] = { program.local[0..1],
		{ 0.22497559 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[1], texture[0], 2D;
TEX R1, fragment.texcoord[2], texture[1], CUBE;
MAD R2.xyz, R0.w, c[1].x, fragment.texcoord[0];
MUL R2.xyz, R0, R2;
MUL R1, R1, c[0].x;
MOV R2.w, R0;
ADD_SAT R0.x, R0.z, -c[2];
MAD result.color, R1, R0.x, R2;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Float 0 [_RoomReflectionAmount]
Float 1 [_SelfIllumStrength]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c2, -0.22497559, 0, 0, 0
dcl t0.xyz
dcl t1.xy
dcl t2.xyz
texld r1, t1, s0
texld r0, t2, s1
mad_pp r2.xyz, r1.w, c1.x, t0
mul_pp r2.xyz, r1, r2
mul_pp r0, r0, c0.x
mov_pp r2.w, r1
add_pp_sat r1.x, r1.z, c2
mad_pp r0, r0, r1.x, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 96 [_RoomReflectionAmount]
Float 100 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhgmiikpmkalhfkljfblaidnfojbjghjiabaaaaaahmacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahahaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
gphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcimabaaaaeaaaaaaagdaaaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaadhcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbcbaaaadaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaai
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaagaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaakhcaabaaaacaaaaaapgapbaaaabaaaaaafgifcaaaaaaaaaaaagaaaaaa
egbcbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaaaacaaaahbcaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaagggggglo
dgaaaaaficaabaaaacaaaaaadkaabaaaabaaaaaadcaaaaajpccabaaaaaaaaaaa
egaobaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Float 96 [_RoomReflectionAmount]
Float 100 [_SelfIllumStrength]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedleklachoahaceaddbbkjlnlkfckkneobabaaaaaakmadaaaaaeaaaaaa
daaaaaaafmabaaaapaacaaaahiadaaaaebgpgodjceabaaaaceabaaaaaaacpppp
omaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaagaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkagggggglo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaachlabpaaaaacaaaaaaia
abaacdlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajiabaiapkaecaaaaadaaaacpiaacaaoelaabaioekaecaaaaadabaacpia
abaaoelaaaaioekaafaaaaadaaaacpiaaaaaoeiaaaaaaakaaeaaaaaeacaachia
abaappiaaaaaffkaaaaaoelaafaaaaadacaachiaabaaoeiaacaaoeiaacaaaaad
abaadbiaabaakkiaabaaaakaabaaaaacacaaciiaabaappiaaeaaaaaeaaaacpia
aaaaoeiaabaaaaiaacaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
imabaaaaeaaaaaaagdaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbcbaaaadaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaagiacaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaa
pgapbaaaabaaaaaafgifcaaaaaaaaaaaagaaaaaaegbcbaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaaacaaaahbcaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaagggggglodgaaaaaficaabaaaacaaaaaa
dkaabaaaabaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaa
abaaaaaaegaobaaaacaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaahahaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
fdfgfpfagphdgjhegjgpgoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}