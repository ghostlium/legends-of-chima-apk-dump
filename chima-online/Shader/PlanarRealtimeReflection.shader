//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "AngryBots/PlanarRealtimeReflection" {
Properties {
 _MainTex ("Base", 2D) = "white" {}
 _ReflectionTex ("Internal reflection", 2D) = "black" {}
 _CubeReflTex ("Cube", CUBE) = "black" {}
 _Normals ("Normal", 2D) = "bump" {}
}
SubShader { 
 LOD 400
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
Vector 13 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R1.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
MOV R0.z, c[11].w;
MUL R2.xyz, R0.z, c[6];
MUL R4.xyz, R1, vertex.attrib[14].w;
MUL R1.xyz, R0.z, c[5];
DP4 R0.w, vertex.position, c[4];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R3.xyz, R0.xyww, c[0].x;
MUL R3.y, R3, c[10].x;
ADD result.texcoord[1].xy, R3, R3.z;
MUL R3.xyz, R0.z, c[7];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[2].y, R1, R4;
DP3 result.texcoord[3].y, R4, R2;
DP3 result.texcoord[4].y, R4, R3;
DP4 R4.z, vertex.position, c[7];
DP4 R4.x, vertex.position, c[5];
DP4 R4.y, vertex.position, c[6];
ADD R4.xyz, -R4, c[9];
DP3 R1.w, R4, R4;
MOV result.position, R0;
RSQ R0.x, R1.w;
MOV result.texcoord[1].zw, R0;
MUL result.texcoord[5].xyz, R0.x, R4;
DP3 result.texcoord[2].z, vertex.normal, R1;
DP3 result.texcoord[2].x, R1, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, vertex.attrib[14], R2;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[6].xy, vertex.texcoord[1], c[13], c[13].zwzw;
END
# 35 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
Vector 13 [unity_LightmapST]
"vs_2_0
def c14, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r2.xyz, v1
mov r3.xyz, c6
mul r3.xyz, c11.w, r3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c14.x
mul r1.y, r1, c9.x
mad oT1.xy, r1.z, c10.zwzw, r1
mov r1.xyz, v1
mul r2.xyz, v2.zxyw, r2.yzxw
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mul r4.xyz, r2, v1.w
mov r1.xyz, c4
mul r1.xyz, c11.w, r1
mov r2.xyz, c5
mul r2.xyz, c11.w, r2
dp3 oT2.y, r1, r4
dp3 oT3.y, r4, r2
dp3 oT4.y, r4, r3
dp4 r4.z, v0, c6
dp4 r4.x, v0, c4
dp4 r4.y, v0, c5
add r4.xyz, -r4, c8
dp3 r1.w, r4, r4
mov oPos, r0
rsq r0.x, r1.w
mov oT1.zw, r0
mul oT5.xyz, r0.x, r4
dp3 oT2.z, v2, r1
dp3 oT2.x, r1, v1
dp3 oT3.z, v2, r2
dp3 oT3.x, v1, r2
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
mad oT0.xy, v3, c12, c12.zwzw
mad oT6.xy, v4, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 48
Vector 16 [_MainTex_ST]
Vector 32 [unity_LightmapST]
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
"vs_4_0
eefiecediogbhdhnjpfihplgmggahncfbaghopicabaaaaaaoaahaaaaadaaaaaa
cmaaaaaapeaaaaaanmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaa
aiaaaaaamiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaneaaaaaaagaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaneaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
pmafaaaaeaaaabaahpabaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaa
aaaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaacaaaaaakgaobaaa
aaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
dgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaa
acaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
bkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
afaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 48
Vector 16 [_MainTex_ST]
Vector 32 [unity_LightmapST]
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
eefiecedapfopjblaanndiepafmociegieimjpiiabaaaaaahaalaaaaaeaaaaaa
daaaaaaalmadaaaamaajaaaaiiakaaaaebgpgodjieadaaaaieadaaaaaaacpopp
caadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaaeaaajaaaaaaaaaaacaabeaaabaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapia
afaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaapeia
aoaaaakaafaaaaadabaaaiiaabaaffiaaeaaaakaacaaaaadabaaadoaabaakkia
abaaomiaaeaaaaaeaaaaamoaaeaabejaacaabekaacaalekaabaaaaacabaaabia
ajaaaakaabaaaaacabaaaciaakaaaakaabaaaaacabaaaeiaalaaaakaafaaaaad
abaaahiaabaaoeiaanaappkaaiaaaaadacaaaboaabaaoejaabaaoeiaabaaaaac
acaaahiaabaaoejaafaaaaadadaaahiaacaamjiaacaancjaaeaaaaaeacaaahia
acaamjjaacaanciaadaaoeibafaaaaadacaaahiaacaaoeiaabaappjaaiaaaaad
acaaacoaacaaoeiaabaaoeiaaiaaaaadacaaaeoaacaaoejaabaaoeiaabaaaaac
abaaabiaajaaffkaabaaaaacabaaaciaakaaffkaabaaaaacabaaaeiaalaaffka
afaaaaadabaaahiaabaaoeiaanaappkaaiaaaaadadaaaboaabaaoejaabaaoeia
aiaaaaadadaaacoaacaaoeiaabaaoeiaaiaaaaadadaaaeoaacaaoejaabaaoeia
abaaaaacabaaabiaajaakkkaabaaaaacabaaaciaakaakkkaabaaaaacabaaaeia
alaakkkaafaaaaadabaaahiaabaaoeiaanaappkaaiaaaaadaeaaaboaabaaoeja
abaaoeiaaiaaaaadaeaaacoaacaaoeiaabaaoeiaaiaaaaadaeaaaeoaacaaoeja
abaaoeiaafaaaaadabaaahiaaaaaffjaakaaoekaaeaaaaaeabaaahiaajaaoeka
aaaaaajaabaaoeiaaeaaaaaeabaaahiaalaaoekaaaaakkjaabaaoeiaaeaaaaae
abaaahiaamaaoekaaaaappjaabaaoeiaacaaaaadabaaahiaabaaoeibadaaoeka
aiaaaaadabaaaiiaabaaoeiaabaaoeiaahaaaaacabaaaiiaabaappiaafaaaaad
afaaahoaabaappiaabaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaafdeieefc
pmafaaaaeaaaabaahpabaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaa
aaaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaacaaaaaakgaobaaa
aaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
dgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaaakiacaaa
acaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
bkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaagbcaabaaa
aaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaackiacaaa
acaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaaaoaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
afaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_Normals] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [_ReflectionTex] 2D 3
SetTexture 4 [_CubeReflTex] CUBE 4
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 2, 1, 0.1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R0.xy, R0.wyzw, c[0].x, -c[0].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.z, -R0, c[0].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.x, fragment.texcoord[2], R0;
DP3 R1.z, R0, fragment.texcoord[4];
DP3 R1.y, R0, fragment.texcoord[3];
DP3 R0.z, R1, -fragment.texcoord[5];
MUL R1.xyz, R1, R0.z;
RCP R0.z, fragment.texcoord[1].w;
MAD R2.xy, fragment.texcoord[1], R0.z, R0;
MAD R1.xyz, -R1, c[0].x, -fragment.texcoord[5];
TEX R0, R1, texture[4], CUBE;
TEX R3, R2, texture[3], 2D;
TEX R1, fragment.texcoord[6], texture[2], 2D;
TEX R2, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1.w, R1;
MUL R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0].w;
MOV R1.w, R2;
ADD R1, R1, R3;
MAD result.color, R0, c[0].z, R1;
END
# 25 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_Normals] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
SetTexture 3 [_ReflectionTex] 2D 3
SetTexture 4 [_CubeReflTex] CUBE 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
def c0, 2.00000000, -1.00000000, 1.00000000, 8.00000000
def c1, 0.10000000, 0, 0, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
dcl t6.xy
texld r0, t0, s0
mov r0.x, r0.w
mad_pp r2.xy, r0, c0.x, c0.y
mul_pp r0.xy, r2, r2
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c0.z
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r1.x, t2, r2
dp3_pp r1.z, r2, t4
dp3_pp r1.y, r2, t3
dp3_pp r0.x, r1, -t5
mul_pp r1.xyz, r1, r0.x
mad_pp r1.xyz, -r1, c0.x, -t5
rcp_pp r0.x, t1.w
mad_pp r0.xy, t1, r0.x, r2
texld r3, r1, s4
texld r0, r0, s3
texld r2, t6, s2
texld r1, t0, s1
mul_pp r2.xyz, r2.w, r2
mul_pp r1.xyz, r2, r1
mul_pp r1.xyz, r1, c0.w
add r0, r1, r0
mad r0, r3, c1.x, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_Normals] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 4
SetTexture 3 [_ReflectionTex] 2D 1
SetTexture 4 [_CubeReflTex] CUBE 3
"ps_4_0
eefiecedpoocgehglbchkecnmdepeflgfalhgfgnabaaaaaaeaafaaaaadaaaaaa
cmaaaaaabeabaaaaeiabaaaaejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaneaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaaneaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaaneaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcpaadaaaaeaaaaaaapmaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
lcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaa
egaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
afaaaaaaegacbaaaaaaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaiaebaaaaaa
agaaaaaaegacbaaaabaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaakgakbaia
ebaaaaaaaaaaaaaaegbcbaiaebaaaaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
egacbaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaaaoaaaaahmcaabaaa
aaaaaaaaagbebaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaa
acaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgapbaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaadaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaadaaaaaadcaaaaampccabaaaaaaaaaaaegaobaaaabaaaaaa
aceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdnegaobaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_Normals] 2D 2
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 4
SetTexture 3 [_ReflectionTex] 2D 1
SetTexture 4 [_CubeReflTex] CUBE 3
"ps_4_0_level_9_1
eefiecedplgcpkoendncmkaiokpolibeloepaephabaaaaaaoeahaaaaaeaaaaaa
daaaaaaanaacaaaamiagaaaalaahaaaaebgpgodjjiacaaaajiacaaaaaaacpppp
gaacaaaadiaaaaaaaaaadiaaaaaadiaaaaaadiaaafaaceaaaaaadiaaabaaaaaa
adababaaaaacacaaaeadadaaacaeaeaaaaacppppfbaaaaafaaaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafabaaapkaaaaaaaebmnmmmmdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajiadaiapkabpaaaaac
aaaaaajaaeaiapkaecaaaaadaaaacpiaaaaaoelaacaioekaaeaaaaaeabaacbia
aaaappiaaaaaaakaaaaaffkaaeaaaaaeabaacciaaaaaffiaaaaaaakaaaaaffka
fkaaaaaeabaadiiaabaaoeiaabaaoeiaaaaakkkaacaaaaadabaaciiaabaappib
aaaappkaahaaaaacabaaciiaabaappiaagaaaaacabaaceiaabaappiaaiaaaaad
aaaacbiaacaaoelaabaaoeiaaiaaaaadaaaacciaadaaoelaabaaoeiaaiaaaaad
aaaaceiaaeaaoelaabaaoeiaaiaaaaadaaaaciiaafaaoelbaaaaoeiaacaaaaad
aaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachiaaaaaoeiaaaaappibafaaoelb
agaaaaacaaaaaiiaabaapplaaeaaaaaeabaacdiaabaaoelaaaaappiaabaaoeia
abaaaaacacaacdiaaaaabllaecaaaaadaaaaapiaaaaaoeiaadaioekaecaaaaad
abaaapiaabaaoeiaabaioekaecaaaaadacaacpiaacaaoeiaaeaioekaecaaaaad
adaacpiaaaaaoelaaaaioekaafaaaaadacaaciiaacaappiaabaaaakaafaaaaad
acaachiaacaaoeiaacaappiaafaaaaadadaachiaacaaoeiaadaaoeiaacaaaaad
abaaapiaabaaoeiaadaaoeiaaeaaaaaeaaaacpiaaaaaoeiaabaaffkaabaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpaadaaaaeaaaaaaapmaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaae
aahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaapdcaabaaa
aaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaaiecaabaaaaaaaaaaa
egbcbaiaebaaaaaaagaaaaaaegacbaaaabaaaaaaaaaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaakgakbaiaebaaaaaaaaaaaaaaegbcbaiaebaaaaaaagaaaaaaefaaaaaj
pcaabaaaabaaaaaaegacbaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
aoaaaaahmcaabaaaaaaaaaaaagbebaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaa
diaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaaacaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaadaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaaaaaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadcaaaaampccabaaaaaaaaaaa
egaobaaaabaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdnegaobaaa
aaaaaaaadoaaaaabejfdeheooaaaaaaaaiaaaaaaaiaaaaaamiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaneaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaneaaaaaaagaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
neaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaaneaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaaneaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaaneaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
neaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [_MainTex_ST]
Vector 7 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[8] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..7] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
ADD result.texcoord[1].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[6], c[6].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[7], c[7].zwzw;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [_MainTex_ST]
Vector 7 [unity_LightmapST]
"vs_2_0
def c8, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c8.x
mul r1.y, r1, c4.x
mad oT1.xy, r1.z, c5.zwzw, r1
mov oPos, r0
mov oT1.zw, r0
mad oT0.xy, v1, c6, c6.zwzw
mad oT2.xy, v2, c7, c7.zwzw
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 48
Vector 16 [_MainTex_ST]
Vector 32 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbjiakomolbhdffbhchjnmackgkamnidoabaaaaaajmadaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
biacaaaaeaaaabaaigaaaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaa
diaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaadiaaaaai
icaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 48
Vector 16 [_MainTex_ST]
Vector 32 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedonolajphghljnefehbfidocafinlnigmabaaaaaaaiafaaaaaeaaaaaa
daaaaaaajiabaaaaliadaaaaiaaeaaaaebgpgodjgaabaaaagaabaaaaaaacpopp
beabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaabaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoa
aeaabejaacaabekaacaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaapeiaaiaaaakaafaaaaadabaaaiiaabaaffiaadaaaakaacaaaaadabaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaafdeieefcbiacaaaa
eaaaabaaigaaaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
abaaaaaaogikcaaaaaaaaaaaabaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaadiaaaaak
hcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaadiaaaaaiicaabaaa
abaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaahdccabaaa
acaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
heaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [_ReflectionTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[2], texture[1], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xyz, R1.w, R1;
TEX R2, R0, texture[2], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, R1;
MOV R1.w, R0;
MUL R1.xyz, R0, c[0].x;
MAD result.color, R2, R0.w, R1;
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
SetTexture 2 [_ReflectionTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xy
texld r1, t2, s1
texld r2, t0, s0
rcp_pp r0.x, t1.w
mul_pp r0.xy, t1, r0.x
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r2, r1
mul_pp r1.xyz, r1, c0.x
mov_pp r1.w, r2
texld r0, r0, s2
mad r0, r0, r2.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 2
SetTexture 2 [_ReflectionTex] 2D 1
"ps_4_0
eefiecedikidjgppgfbjfobmgghhofceeichfafaabaaaaaaiiacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcjiabaaaaeaaaaaaaggaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadlcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaapgapbaaaacaaaaaaegaobaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 2
SetTexture 2 [_ReflectionTex] 2D 1
"ps_4_0_level_9_1
eefiecednfbcghpjmegocpcdceklllikfpaibnnmabaaaaaamiadaaaaaeaaaaaa
daaaaaaagmabaaaaamadaaaajeadaaaaebgpgodjdeabaaaadeabaaaaaaacpppp
aeabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaaaaaaaaa
acababaaabacacaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
agaaaaacaaaaaiiaabaapplaafaaaaadaaaacdiaaaaappiaabaaoelaabaaaaac
abaacdiaaaaabllaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaadabaacpia
abaaoeiaacaioekaecaaaaadacaacpiaaaaaoelaaaaioekaafaaaaadabaaciia
abaappiaaaaaaakaafaaaaadabaachiaabaaoeiaabaappiaafaaaaadacaachia
abaaoeiaacaaoeiaaeaaaaaeaaaacpiaaaaaoeiaacaappiaacaaoeiaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcjiabaaaaeaaaaaaaggaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaaaaaaaaapgapbaaaacaaaaaa
egaobaaaacaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
Fallback "AngryBots/Fallback"
}