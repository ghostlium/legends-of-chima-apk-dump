//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Water Runoff" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _BumpMap ("Bumpmap", 2D) = "bump" {}
 _BumpMapStrength ("Bumpmap Strength", Float) = 1
 _BumpMap2Strength ("Bumpmap copy Strength", Float) = 1
 _Cube ("Cubemap", CUBE) = "" {}
 _CubeMapBaseColor ("CubeMapBaseColor", Color) = (0,0,0,0)
 _Reflectionstrength ("Reflection Strength", Float) = 1
 _MasterOpacity ("Master Opacity", Float) = 1
 _UvAnimation ("Uv Animation: XY Bump, ZW Bump Copy", Vector) = (1,1,1,1)
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent-2" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent-2" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
Vector 24 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[22].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[21];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[22].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[22].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[22].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[22].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_MainTex_ST]
Vector 23 [_BumpMap_ST]
"vs_2_0
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c21.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c16
dp4 r2.y, r0, c15
dp4 r2.x, r0, c14
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c19
dp4 r3.y, r1, c18
dp4 r3.x, r1, c17
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c20
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c24.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c21.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c21.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c21.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c21.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c23.xyxy, c23
mad oT0.xy, v3, c22, c22.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 96 [_MainTex_ST]
Vector 112 [_BumpMap_ST]
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecednhkjiipjfbfhjeooddplnhifleklkokoabaaaaaamaapaaaaaeaaaaaa
daaaaaaafaafaaaaciaoaaaapaaoaaaaebgpgodjbiafaaaabiafaaaaaaacpopp
jmaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaagaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
acaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaaaaaaaaaaadaaamaaadaabaaa
aaaaaaaaadaabaaaafaabdaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapka
aaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeeja
acaaeekaacaaoekaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffia
beaaoekaaeaaaaaeaaaaaliabdaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bfaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabgaaoekaaeaaaaae
aaaaahiaaaaaoeiabhaappkaaaaaoejbafaaaaadabaaahiaaaaaffibbbaaoeka
aeaaaaaeaaaaaliabaaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabcaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiabaaaaaka
abaaaaacadaaaciabbaaaakaabaaaaacadaaaeiabcaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadabaaapoaabaaoeiabhaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiabaaaffkaabaaaaacadaaaciabbaaffkaabaaaaac
adaaaeiabcaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoa
abaaoeiabhaappkaabaaaaacabaaabiabaaakkkaabaaaaacabaaaciabbaakkka
abaaaaacabaaaeiabcaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
adaaapoaaaaaoeiabhaappkaabaaaaacaaaaapiaaeaaoekaafaaaaadabaaahia
aaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappia
aaaaoeiaaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaacaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
bhaappkaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabiaaaakaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaadabaaacia
agaaoekaaaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaadadaaacia
ajaaoekaacaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeafaaahoaalaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaaeaaaaapiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
apaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefcnaaiaaaaeaaaabaadeacaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaad
hccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaa
aaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaa
adaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaa
baaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaa
egaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaa
bkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
adaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaa
acaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaa
egacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaa
adaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaa
beaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaa
ckiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaipccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaa
aaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaagaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
agaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[15].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[15].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[15].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_2_0
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c13.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c13.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c13.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c13.w
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
mad oT4.xy, v4, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 96 [unity_LightmapST]
Vector 112 [_MainTex_ST]
Vector 128 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecedapadmhknmebljbiibknkidnkbhghjimhabaaaaaabmalaaaaaeaaaaaa
daaaaaaakmadaaaajmajaaaageakaaaaebgpgodjheadaaaaheadaaaaaaacpopp
baadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaagaa
adaaabaaaaaaaaaaabaaaeaaabaaaeaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaadaaeejaadaaeeka
adaaoekaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffiaanaaoeka
aeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahia
aaaaoeiabaaappkaaaaaoejbafaaaaadabaaahiaaaaaffibakaaoekaaeaaaaae
aaaaaliaajaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaalaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaajaaaakaabaaaaac
adaaaciaakaaaakaabaaaaacadaaaeiaalaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabaaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaajaaffkaabaaaaacadaaaciaakaaffkaabaaaaacadaaaeia
alaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
baaappkaabaaaaacabaaabiaajaakkkaabaaaaacabaaaciaakaakkkaabaaaaac
abaaaeiaalaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabaaappkaaeaaaaaeaeaaadoaaeaaoejaabaaoekaabaaookaafaaaaad
aaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcoiafaaaaeaaaabaahkabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaaddccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaa
kgiocaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaaeaaaaaaegaobaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaadcaaaaaldccabaaaafaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
Vector 18 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[19] = { { 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[15].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[15].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[15].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_2_0
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, v1.w, r0
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c13.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c13.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c13.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c13.w
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
mad oT4.xy, v4, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Vector 96 [unity_LightmapST]
Vector 112 [_MainTex_ST]
Vector 128 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecedapadmhknmebljbiibknkidnkbhghjimhabaaaaaabmalaaaaaeaaaaaa
daaaaaaakmadaaaajmajaaaageakaaaaebgpgodjheadaaaaheadaaaaaaacpopp
baadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaagaa
adaaabaaaaaaaaaaabaaaeaaabaaaeaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaadaaeejaadaaeeka
adaaoekaabaaaaacaaaaahiaaeaaoekaafaaaaadabaaahiaaaaaffiaanaaoeka
aeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahia
aaaaoeiabaaappkaaaaaoejbafaaaaadabaaahiaaaaaffibakaaoekaaeaaaaae
aaaaaliaajaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaalaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaajaaaakaabaaaaac
adaaaciaakaaaakaabaaaaacadaaaeiaalaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabaaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaajaaffkaabaaaaacadaaaciaakaaffkaabaaaaacadaaaeia
alaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
baaappkaabaaaaacabaaabiaajaakkkaabaaaaacabaaaciaakaakkkaabaaaaac
abaaaeiaalaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabaaappkaaeaaaaaeaeaaadoaaeaaoejaabaaoekaabaaookaafaaaaad
aaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcoiafaaaaeaaaabaahkabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaaddccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaa
kgiocaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaallcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaacaaaaaaaoaaaaaakgakbaia
ebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaa
abaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
akiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
dgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaa
bkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaacaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaaacaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaa
abaaaaaapgipcaaaacaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaackiacaaaacaaaaaaaoaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaaaeaaaaaaegaobaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaadcaaaaaldccabaaaafaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [unity_Scale]
Vector 31 [_MainTex_ST]
Vector 32 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[33] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
ADD result.texcoord[5].xyz, R3, R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[30].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[30].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[30].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[30].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 87 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_4LightPosX0]
Vector 15 [unity_4LightPosY0]
Vector 16 [unity_4LightPosZ0]
Vector 17 [unity_4LightAtten0]
Vector 18 [unity_LightColor0]
Vector 19 [unity_LightColor1]
Vector 20 [unity_LightColor2]
Vector 21 [unity_LightColor3]
Vector 22 [unity_SHAr]
Vector 23 [unity_SHAg]
Vector 24 [unity_SHAb]
Vector 25 [unity_SHBr]
Vector 26 [unity_SHBg]
Vector 27 [unity_SHBb]
Vector 28 [unity_SHC]
Vector 29 [unity_Scale]
Vector 30 [_MainTex_ST]
Vector 31 [_BumpMap_ST]
"vs_2_0
def c32, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c29.w
dp4 r0.x, v0, c5
add r1, -r0.x, c15
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c14
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c32.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c16
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c17
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.y
mul r0, r0, r1
mul r1.xyz, r0.y, c19
mad r1.xyz, r0.x, c18, r1
mad r0.xyz, r0.z, c20, r1
mad r1.xyz, r0.w, c21, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c27
dp4 r3.y, r0, c26
dp4 r3.x, r0, c25
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c28
dp4 r2.z, r4, c24
dp4 r2.y, r4, c23
dp4 r2.x, r4, c22
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r3, c8
mov r0.xyz, v1
add oT5.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c32.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c29.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c29.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c29.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c29.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c31.xyxy, c31
mad oT0.xy, v3, c30, c30.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 128
Vector 96 [_MainTex_ST]
Vector 112 [_BumpMap_ST]
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedpgmofaacgakkcmaccflnaggcphdbceilabaaaaaaaibfaaaaaeaaaaaa
daaaaaaaeiahaaaahabdaaaadibeaaaaebgpgodjbaahaaaabaahaaaaaaacpopp
jeagaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaagaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
acaaacaaaiaaafaaaaaaaaaaacaacgaaahaaanaaaaaaaaaaadaaaaaaaeaabeaa
aaaaaaaaadaaamaaajaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapka
aaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeeja
acaaeekaacaaoekaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffia
bnaaoekaaeaaaaaeaaaaaliabmaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
boaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabpaaoekaaeaaaaae
aaaaahiaaaaaoeiacaaappkaaaaaoejbafaaaaadabaaahiaaaaaffibbjaaoeka
aeaaaaaeaaaaaliabiaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliabkaakeka
aaaakkibaaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaacaaoeja
afaaaaadadaaahiaacaanciaabaamjjaaeaaaaaeacaaahiaacaamjiaabaancja
adaaoeibafaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiabiaaaaka
abaaaaacadaaaciabjaaaakaabaaaaacadaaaeiabkaaaakaaiaaaaadabaaacia
acaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeia
acaaoejaadaaoeiaafaaaaadabaaapoaabaaoeiacaaappkaabaaaaacabaaaiia
aaaaffiaabaaaaacadaaabiabiaaffkaabaaaaacadaaaciabjaaffkaabaaaaac
adaaaeiabkaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabia
abaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoa
abaaoeiacaaappkaabaaaaacabaaabiabiaakkkaabaaaaacabaaaciabjaakkka
abaaaaacabaaaeiabkaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaad
aaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaad
adaaapoaaaaaoeiacaaappkaabaaaaacaaaaapiaaeaaoekaafaaaaadabaaahia
aaaaffiabnaaoekaaeaaaaaeabaaahiabmaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaboaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabpaaoekaaaaappia
aaaaoeiaaiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaacaaoeia
aaaaoeiaaiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
bjaaoekaaeaaaaaeaaaaahiabiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
bkaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibahaaoekaacaaaaadacaaapiaaaaaaaibafaaoeka
acaaaaadaaaaapiaaaaaffibagaaoekaafaaaaadadaaahiaacaaoejacaaappka
afaaaaadaeaaahiaadaaffiabjaaoekaaeaaaaaeadaaaliabiaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiabkaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaabia
cbaaaakaaeaaaaaeaaaaapiaaaaaoeiaaiaaoekaaeaaaaiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiacbaaffkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiacbaaaakaajaaaaadabaaabiaanaaoekaadaaoeia
ajaaaaadabaaaciaaoaaoekaadaaoeiaajaaaaadabaaaeiaapaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiabaaaoekaacaaoeia
ajaaaaadaeaaaciabbaaoekaacaaoeiaajaaaaadaeaaaeiabcaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabdaaoeka
aaaappiaabaaoeiaacaaaaadafaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabfaaoekaaeaaaaaeaaaaapiabeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabgaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefccaamaaaaeaaaabaaaiadaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
diaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaia
ebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
adaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaadgaaaaaf
icaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaaakiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaaaaaaaaaa
dgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaabkiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaag
bcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaa
ckiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaaadaaaaaa
aoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
ecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipccabaaa
aeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahcccabaaaafaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
bccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaa
afaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
fgafbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
aeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaia
ebaaaaaaacaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaa
kgakbaiaebaaaaaaacaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaa
adaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaan
pcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaagaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.z, R0, c[0].x;
MUL R0.w, R0, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.z, fragment.texcoord[0], R0;
ADD R0.w, fragment.texcoord[0], R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R1.yw, R0.zwzw, texture[0], 2D;
TEX R0.yw, R0, texture[0], 2D;
MUL R1.z, R1.y, c[4].x;
MAD R1.xy, R1.wzzw, c[8].x, -c[8].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
MUL R0.z, R0.y, c[3].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.w, R0.z, R0;
ADD_SAT R1.z, R1, R1.w;
ADD R0.z, -R1, c[8].y;
RSQ R0.z, R0.z;
ADD R0.w, -R0, c[8].y;
RCP R1.z, R0.z;
RSQ R0.w, R0.w;
RCP R0.z, R0.w;
ADD R0.xyz, R0, R1;
DP3 R2.x, R0, fragment.texcoord[1];
DP3 R2.y, R0, fragment.texcoord[2];
DP3 R2.z, R0, fragment.texcoord[3];
MOV R1.x, fragment.texcoord[1].w;
MOV R1.z, fragment.texcoord[3].w;
MOV R1.y, fragment.texcoord[2].w;
DP3 R0.w, R2, R1;
MUL R2.xyz, R2, R0.w;
MAD R1.xyz, -R2, c[8].x, R1;
DP3 R0.w, R0, fragment.texcoord[4];
MAX R0.w, R0, c[8].z;
TEX R1.xyz, R1, texture[2], CUBE;
TEX R2.x, fragment.texcoord[0], texture[1], 2D;
ADD R1.xyz, R1, c[6];
MUL R2.yzw, R1.xxyz, c[2].x;
MUL R0.xyz, R2.yzww, c[1];
MUL R1.xyz, R2.yzww, fragment.texcoord[5];
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[8].x, R1;
MUL result.color.w, R2.x, c[5].x;
END
# 46 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r0.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c7.w, r1
mul r2.x, c7.z, r2
add_pp r0.x, t0.z, r0
add_pp r2.y, t0.w, r1.x
add_pp r2.x, t0.z, r2
texld r2, r2, s0
texld r1, r0, s0
mov_pp r0.w, r2
mov r2.z, t3.w
mul_pp r0.y, r2, c4.x
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c8.x, c8.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c8.z
rsq_pp r2.x, r2.x
rcp_pp r0.z, r2.x
mov r2.x, t1.w
mov r2.y, t2.w
mov_pp r1.x, r1.w
mul_pp r1.y, r1, c3.x
mad_pp r1.xy, r1, c8.x, c8.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c8.z
rsq_pp r3.x, r3.x
rcp_pp r1.z, r3.x
add_pp r0.xyz, r1, r0
dp3_pp r3.x, r0, t1
dp3_pp r3.y, r0, t2
dp3_pp r3.z, r0, t3
dp3 r1.x, r3, r2
dp3_pp r0.x, r0, t4
mul r1.xyz, r3, r1.x
mad r1.xyz, -r1, c8.x, r2
max_pp r0.x, r0, c8.w
texld r2, r1, s2
texld r1, t0, s1
add r2.xyz, r2, c6
mul r2.xyz, r2, c2.x
mul_pp r3.xyz, r2, c1
mul_pp r0.xyz, r0.x, r3
mul_pp r2.xyz, r2, t5
mad_pp r0.xyz, r0, c8.x, r2
mul r0.w, r1.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_BumpMap] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Float 48 [_Reflectionstrength]
Float 52 [_BumpMapStrength]
Float 56 [_BumpMap2Strength]
Float 60 [_MasterOpacity]
Vector 64 [_CubeMapBaseColor]
Vector 80 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefieceddbklblmblpckbkejgoimaieebmpnokababaaaaaapmajaaaaaeaaaaaa
daaaaaaameadaaaapiaiaaaamiajaaaaebgpgodjimadaaaaimadaaaaaaacpppp
diadaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaabaaaaaa
aaababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaadaaabaaaaaaaaaa
abaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaeaaaaaialp
aaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaaiaafaachlabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaabaaaaacaaaaaiiaaeaaaaka
aeaaaaaeaaaacbiaaaaappiaadaaaakaaaaakklaaeaaaaaeaaaacciaaaaappia
adaaffkaaaaapplaaeaaaaaeabaacbiaaaaappiaadaakkkaaaaakklaaeaaaaae
abaacciaaaaappiaadaappkaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaabaaoeiaabaioekaafaaaaadaaaacciaaaaaffiaabaaffka
abaaaaacaaaacbiaaaaappiaaeaaaaaeaaaacdiaaaaaoeiaafaaaakaafaaffka
fkaaaaaeaaaadiiaaaaaoeiaaaaaoeiaafaakkkaacaaaaadaaaaciiaaaaappib
afaappkaahaaaaacaaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaafaaaaad
abaacciaabaaffiaabaakkkaabaaaaacabaacbiaabaappiaaeaaaaaeabaacdia
abaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiiaabaaoeiaabaaoeiaafaakkka
acaaaaadaaaaciiaaaaappibafaappkaahaaaaacaaaaciiaaaaappiaagaaaaac
abaaceiaaaaappiaacaaaaadaaaachiaaaaaoeiaabaaoeiaaiaaaaadabaaabia
abaaoelaaaaaoeiaaiaaaaadabaaaciaacaaoelaaaaaoeiaaiaaaaadabaaaeia
adaaoelaaaaaoeiaaiaaaaadabaaciiaaaaaoeiaaeaaoelaalaaaaadaaaacbia
abaappiaafaakkkaacaaaaadabaaciiaaaaaaaiaaaaaaaiaabaaaaacaaaaabia
abaapplaabaaaaacaaaaaciaacaapplaabaaaaacaaaaaeiaadaapplaaiaaaaad
aaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
aaaaahiaabaaoeiaaaaappibaaaaoeiaecaaaaadaaaaapiaaaaaoeiaacaioeka
ecaaaaadacaacpiaaaaaoelaaaaioekaacaaaaadaaaaahiaaaaaoeiaacaaoeka
afaaaaadaaaachiaaaaaoeiaabaaaakaafaaaaadabaachiaaaaaoeiaaaaaoeka
afaaaaadaaaachiaaaaaoeiaafaaoelaaeaaaaaeaaaachiaabaaoeiaabaappia
aaaaoeiaafaaaaadaaaaciiaacaaaaiaabaappkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefccmafaaaaeaaaaaaaelabaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaadcaaaaalpcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaa
aaaaaaaaafaaaaaaogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
aaaaaaaadghjbaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogakbaaaaaaaaaaadghjbaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiccaabaaa
abaaaaaackaabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaa
dcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaa
acaaaaaadgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaa
acaaaaaadkbabaaaaeaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaiaebaaaaaa
aaaaaaaaagajbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaajgahbaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaaiocaabaaaaaaaaaaaagajbaaa
abaaaaaaagijcaaaaaaaaaaaaeaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagiacaaaaaaaaaaaadaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagbjbaaaagaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaaiiccabaaaaaaaaaaa
akaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapapaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Float 1 [_Reflectionstrength]
Float 2 [_BumpMapStrength]
Float 3 [_BumpMap2Strength]
Float 4 [_MasterOpacity]
Vector 5 [_CubeMapBaseColor]
Vector 6 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 2, 1, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2.x, fragment.texcoord[0], texture[1], 2D;
MOV R0, c[6];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R1.x, fragment.texcoord[0].z, R0;
ADD R1.y, fragment.texcoord[0].w, R0;
MUL R0.x, R0.z, c[0];
MUL R0.y, R0.w, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.y, fragment.texcoord[0].w, R0;
MUL result.color.w, R2.x, c[4].x;
TEX R0.yw, R0, texture[0], 2D;
TEX R1.yw, R1, texture[0], 2D;
MUL R0.z, R0.y, c[3].x;
MAD R0.xy, R0.wzzw, c[7].x, -c[7].y;
MOV R0.w, R1;
MUL R0.z, R1.y, c[2].x;
MAD R1.xy, R0.wzzw, c[7].x, -c[7].y;
MUL R0.zw, R1.xyxy, R1.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R0.xyxy, R0.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[7].y;
RSQ R1.z, R0.w;
ADD R0.z, -R0, c[7].y;
RSQ R0.w, R0.z;
RCP R0.z, R1.z;
RCP R1.z, R0.w;
ADD R0.xyz, R1, R0;
DP3 R1.x, fragment.texcoord[1], R0;
DP3 R1.y, R0, fragment.texcoord[2];
DP3 R1.z, R0, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
MAD R0.xyz, -R1, c[7].x, R0;
TEX R1.xyz, R0, texture[2], CUBE;
TEX R0, fragment.texcoord[4], texture[3], 2D;
ADD R1.xyz, R1, c[5];
MUL R1.xyz, R1, c[1].x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[7].z;
END
# 45 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_Time]
Float 1 [_Reflectionstrength]
Float 2 [_BumpMapStrength]
Float 3 [_BumpMap2Strength]
Float 4 [_MasterOpacity]
Vector 5 [_CubeMapBaseColor]
Vector 6 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c7, 2.00000000, -1.00000000, 1.00000000, 8.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xy
mov r1.x, c0
mul r1.x, c6.y, r1
add_pp r0.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c6, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c6.w, r1
mul r2.x, c6.z, r2
add_pp r0.x, t0.z, r0
add_pp r2.y, t0.w, r1.x
add_pp r2.x, t0.z, r2
texld r2, r2, s0
texld r1, r0, s0
mov_pp r0.w, r2
mul_pp r0.y, r2, c3.x
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c7.x, c7.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c7.z
rsq_pp r2.x, r2.x
mov_pp r1.x, r1.w
mul_pp r1.y, r1, c2.x
mad_pp r1.xy, r1, c7.x, c7.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c7.z
rsq_pp r3.x, r3.x
rcp_pp r0.z, r2.x
rcp_pp r1.z, r3.x
add_pp r0.xyz, r1, r0
dp3_pp r2.x, t1, r0
dp3_pp r2.y, r0, t2
dp3_pp r2.z, r0, t3
mov r0.x, t1.w
mov r0.z, t3.w
mov r0.y, t2.w
dp3 r1.x, r2, r0
mul r1.xyz, r2, r1.x
mad r0.xyz, -r1, c7.x, r0
texld r2, r0, s2
texld r1, t0, s1
texld r0, t4, s3
add r2.xyz, r2, c5
mul_pp r0.xyz, r0.w, r0
mul r2.xyz, r2, c1.x
mul_pp r0.xyz, r0, r2
mul_pp r0.xyz, r0, c7.w
mul r0.w, r1.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_BumpMap] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 144
Float 48 [_Reflectionstrength]
Float 52 [_BumpMapStrength]
Float 56 [_BumpMap2Strength]
Float 60 [_MasterOpacity]
Vector 64 [_CubeMapBaseColor]
Vector 80 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedkkmfgoeiclplcicbpibkjjdnaniaechoabaaaaaamaajaaaaaeaaaaaa
daaaaaaalaadaaaaneaiaaaaimajaaaaebgpgodjhiadaaaahiadaaaaaaacpppp
cmadaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaabaaaaaa
aaababaaacacacaaadadadaaaaaaadaaadaaaaaaaaaaaaaaabaaaaaaabaaadaa
aaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaeaaaaaialpaaaaaaaaaaaaiadp
fbaaaaafafaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaaiaaeaaadlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaaja
adaiapkaabaaaaacaaaaaiiaadaaaakaaeaaaaaeaaaacbiaaaaappiaacaaaaka
aaaakklaaeaaaaaeaaaacciaaaaappiaacaaffkaaaaapplaaeaaaaaeabaacbia
aaaappiaacaakkkaaaaakklaaeaaaaaeabaacciaaaaappiaacaappkaaaaappla
ecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaabaaoeiaabaioeka
afaaaaadaaaacciaaaaaffiaaaaaffkaabaaaaacaaaacbiaaaaappiaaeaaaaae
aaaacdiaaaaaoeiaaeaaaakaaeaaffkafkaaaaaeaaaadiiaaaaaoeiaaaaaoeia
aeaakkkaacaaaaadaaaaciiaaaaappibaeaappkaahaaaaacaaaaciiaaaaappia
agaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffiaaaaakkkaabaaaaac
abaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaaeaaaakaaeaaffkafkaaaaae
aaaadiiaabaaoeiaabaaoeiaaeaakkkaacaaaaadaaaaciiaaaaappibaeaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappiaacaaaaadaaaachia
aaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeiaaiaaaaadabaaacia
acaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeiaabaaaaacaaaaabia
abaapplaabaaaaacaaaaaciaacaapplaabaaaaacaaaaaeiaadaapplaaiaaaaad
aaaaaiiaaaaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
aaaaahiaabaaoeiaaaaappibaaaaoeiaecaaaaadaaaaapiaaaaaoeiaacaioeka
ecaaaaadabaacpiaaeaaoelaadaioekaecaaaaadacaacpiaaaaaoelaaaaioeka
acaaaaadaaaaahiaaaaaoeiaabaaoekaafaaaaadaaaachiaaaaaoeiaaaaaaaka
afaaaaadaaaaciiaabaappiaafaaaakaafaaaaadabaachiaabaaoeiaaaaappia
afaaaaadaaaachiaaaaaoeiaabaaoeiaafaaaaadaaaaciiaacaaaaiaaaaappka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbmafaaaaeaaaaaaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaa
gcbaaaaddcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
dcaaaaalpcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaa
afaaaaaaogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaa
dghjbaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaa
aaaaaaaadghjbaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaa
ckaabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
abaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaadcaaaaap
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaa
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaafbcaabaaaaaaaaaaa
dkbabaaaacaaaaaadgaaaaafccaabaaaaaaaaaaadkbabaaaadaaaaaadgaaaaaf
ecaabaaaaaaaaaaadkbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaa
aaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaagiacaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaadaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apapaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Time]
Float 1 [_Reflectionstrength]
Float 2 [_BumpMapStrength]
Float 3 [_BumpMap2Strength]
Float 4 [_MasterOpacity]
Vector 5 [_CubeMapBaseColor]
Vector 6 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[11] = { program.local[0..6],
		{ 2, 1, 8 },
		{ -0.40824828, -0.70710677, 0.57735026 },
		{ -0.40824831, 0.70710677, 0.57735026 },
		{ 0.81649655, 0, 0.57735026 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R3.x, fragment.texcoord[0], texture[1], 2D;
MOV R0, c[6];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R1.x, fragment.texcoord[0].z, R0;
ADD R1.y, fragment.texcoord[0].w, R0;
MUL R0.x, R0.z, c[0];
MUL R0.y, R0.w, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.y, fragment.texcoord[0].w, R0;
MUL result.color.w, R3.x, c[4].x;
TEX R0.yw, R0, texture[0], 2D;
TEX R1.yw, R1, texture[0], 2D;
MUL R0.z, R0.y, c[3].x;
MAD R0.xy, R0.wzzw, c[7].x, -c[7].y;
MOV R0.w, R1;
MUL R1.zw, R0.xyxy, R0.xyxy;
MUL R0.z, R1.y, c[2].x;
MAD R1.xy, R0.wzzw, c[7].x, -c[7].y;
MUL R0.zw, R1.xyxy, R1.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[7].y;
RSQ R1.z, R0.w;
ADD R0.z, -R0, c[7].y;
RSQ R0.w, R0.z;
RCP R0.z, R1.z;
RCP R1.z, R0.w;
ADD R4.xyz, R1, R0;
DP3 R1.x, R4, fragment.texcoord[1];
DP3 R1.y, R4, fragment.texcoord[2];
DP3 R1.z, R4, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
MAD R0.xyz, -R1, c[7].x, R0;
DP3_SAT R3.w, R4, c[8];
DP3_SAT R3.z, R4, c[9];
DP3_SAT R3.y, R4, c[10];
TEX R2.xyz, R0, texture[2], CUBE;
TEX R0, fragment.texcoord[4], texture[4], 2D;
TEX R1, fragment.texcoord[4], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R3.yzww;
DP3 R0.w, R0, c[7].z;
ADD R2.xyz, R2, c[5];
MUL R0.xyz, R1.w, R1;
MUL R2.xyz, R2, c[1].x;
MUL R0.xyz, R0, R0.w;
MUL R0.xyz, R0, R2;
MUL result.color.xyz, R0, c[7].z;
END
# 53 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_Time]
Float 1 [_Reflectionstrength]
Float 2 [_BumpMapStrength]
Float 3 [_BumpMap2Strength]
Float 4 [_MasterOpacity]
Vector 5 [_CubeMapBaseColor]
Vector 6 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c7, 2.00000000, -1.00000000, 1.00000000, 8.00000000
def c8, -0.40824828, -0.70710677, 0.57735026, 0
def c9, -0.40824831, 0.70710677, 0.57735026, 0
def c10, 0.81649655, 0.00000000, 0.57735026, 0
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xy
texld r5, t0, s1
mov r1.x, c0
mul r1.x, c6.y, r1
add_pp r2.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c6, r0
add_pp r2.x, t0.z, r0
mov r1.x, c0
mov r0.x, c0
mul r0.x, c6.w, r0
add_pp r1.y, t0.w, r0.x
mul r1.x, c6.z, r1
add_pp r1.x, t0.z, r1
texld r1, r1, s0
texld r0, r2, s0
mov_pp r1.x, r1.w
mul_pp r1.y, r1, c3.x
mad_pp r2.xy, r1, c7.x, c7.y
mov_pp r0.x, r0.w
mul_pp r0.y, r0, c2.x
mad_pp r3.xy, r0, c7.x, c7.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r1.x, r1, r1.y
add_pp_sat r0.x, r0, r0.y
add_pp r0.x, -r0, c7.z
rsq_pp r4.x, r0.x
add_pp r1.x, -r1, c7.z
rsq_pp r0.x, r1.x
rcp_pp r2.z, r4.x
rcp_pp r3.z, r0.x
add_pp r4.xyz, r3, r2
dp3_pp r2.x, r4, t1
dp3_pp r2.y, r4, t2
dp3_pp r2.z, r4, t3
mov r1.x, t1.w
mov r1.z, t3.w
mov r1.y, t2.w
dp3 r0.x, r2, r1
mul r0.xyz, r2, r0.x
mad r0.xyz, -r0, c7.x, r1
texld r2, r0, s2
texld r1, t4, s3
texld r0, t4, s4
mul_pp r0.xyz, r0.w, r0
add r2.xyz, r2, c5
mul r3.xyz, r2, c1.x
dp3_pp_sat r2.z, r4, c8
dp3_pp_sat r2.y, r4, c9
dp3_pp_sat r2.x, r4, c10
mul_pp r0.xyz, r0, r2
dp3_pp r0.x, r0, c7.w
mul_pp r1.xyz, r1.w, r1
mul_pp r0.xyz, r1, r0.x
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c7.w
mul r0.w, r5.x, c4.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_BumpMap] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 144
Float 48 [_Reflectionstrength]
Float 52 [_BumpMapStrength]
Float 56 [_BumpMap2Strength]
Float 60 [_MasterOpacity]
Vector 64 [_CubeMapBaseColor]
Vector 80 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedpkeioajmnamjdhcglhjekdnlnobdibggabaaaaaakialaaaaaeaaaaaa
daaaaaaahaaeaaaalmakaaaahealaaaaebgpgodjdiaeaaaadiaeaaaaaaacpppp
oiadaaaafaaaaaaaacaadiaaaaaafaaaaaaafaaaafaaceaaaaaafaaaabaaaaaa
aaababaaacacacaaadadadaaaeaeaeaaaaaaadaaadaaaaaaaaaaaaaaabaaaaaa
abaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaeaaaaaialpaaaaaaaa
aaaaiadpfbaaaaafafaaapkaaaaaaaebdkmnbddpaaaaaaaaolaffbdpfbaaaaaf
agaaapkaomafnblopdaedfdpdkmnbddpaaaaaaaafbaaaaafahaaapkaolafnblo
pdaedflpdkmnbddpaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaac
aaaaaaiaaeaaadlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaabaaaaacaaaaaiiaadaaaakaaeaaaaaeaaaacbiaaaaappiaacaaaaka
aaaakklaaeaaaaaeaaaacciaaaaappiaacaaffkaaaaapplaaeaaaaaeabaacbia
aaaappiaacaakkkaaaaakklaaeaaaaaeabaacciaaaaappiaacaappkaaaaappla
ecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaabaaoeiaabaioeka
afaaaaadaaaacciaaaaaffiaaaaaffkaabaaaaacaaaacbiaaaaappiaaeaaaaae
aaaacdiaaaaaoeiaaeaaaakaaeaaffkafkaaaaaeaaaadiiaaaaaoeiaaaaaoeia
aeaakkkaacaaaaadaaaaciiaaaaappibaeaappkaahaaaaacaaaaciiaaaaappia
agaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffiaaaaakkkaabaaaaac
abaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaaeaaaakaaeaaffkafkaaaaae
aaaadiiaabaaoeiaabaaoeiaaeaakkkaacaaaaadaaaaciiaaaaappibaeaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappiaacaaaaadaaaachia
aaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeiaaiaaaaadabaaacia
acaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeiaabaaaaacacaaabia
abaapplaabaaaaacacaaaciaacaapplaabaaaaacacaaaeiaadaapplaaiaaaaad
aaaaaiiaacaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
abaaahiaabaaoeiaaaaappibacaaoeiaecaaaaadabaaapiaabaaoeiaacaioeka
ecaaaaadacaacpiaaeaaoelaaeaioekaecaaaaadadaacpiaaeaaoelaadaioeka
ecaaaaadaeaacpiaaaaaoelaaaaioekaacaaaaadabaaahiaabaaoeiaabaaoeka
afaaaaadabaachiaabaaoeiaaaaaaakaaiaaaaadafaadbiaafaablkaaaaaoeia
aiaaaaadafaadciaagaaoekaaaaaoeiaaiaaaaadafaadeiaahaaoekaaaaaoeia
afaaaaadabaaciiaacaappiaafaaaakaafaaaaadaaaachiaacaaoeiaabaappia
aiaaaaadabaaciiaafaaoeiaaaaaoeiaafaaaaadadaaciiaadaappiaafaaaaka
afaaaaadaaaachiaadaaoeiaadaappiaafaaaaadaaaachiaabaappiaaaaaoeia
afaaaaadaaaachiaaaaaoeiaabaaoeiaafaaaaadaaaaciiaaeaaaaiaaaaappka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefceeagaaaaeaaaaaaajbabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaadpcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaad
dcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaal
pcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaafaaaaaa
ogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaadghjbaaa
aaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaa
dghjbaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaackaabaaa
abaaaaaabkiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaa
acaaaaaadgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaa
acaaaaaadkbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaagiacaaaaaaaaaaaadaaaaaaapcaaaakbcaabaaaacaaaaaaaceaaaaa
olaffbdpdkmnbddpaaaaaaaaaaaaaaaaigaabaaaaaaaaaaabacaaaakccaabaaa
acaaaaaaaceaaaaaomafnblopdaedfdpdkmnbddpaaaaaaaaegacbaaaaaaaaaaa
bacaaaakecaabaaaacaaaaaaaceaaaaaolafnblopdaedflpdkmnbddpaaaaaaaa
egacbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaafaaaaaaeghobaaa
aeaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaafaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaeb
diaaaaahocaabaaaaaaaaaaaagajbaaaacaaaaaafgafbaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadiaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaaiiccabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapapaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaadadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent-2" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 46 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecedpajahdegkcakpmnlfdnaopfkfnppgmhnabaaaaaajaaoaaaaaeaaaaaa
daaaaaaammaeaaaapiamaaaamaanaaaaebgpgodjjeaeaaaajeaeaaaaaaacpopp
ceaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoaadaaeejaagaaeeka
agaaoekaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbafaaaaadabaaahiaaaaaffibaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaapaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaanaaaakaabaaaaac
adaaaciaaoaaaakaabaaaaacadaaaeiaapaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabfaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaanaaffkaabaaaaacadaaaciaaoaaffkaabaaaaacadaaaeia
apaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
bfaappkaabaaaaacabaaabiaanaakkkaabaaaaacabaaaciaaoaakkkaabaaaaac
abaaaeiaapaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabfaappkaabaaaaacaaaaapiaaiaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejbaiaaaaadaeaaaboaabaaoeja
aaaaoeiaaiaaaaadaeaaacoaacaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcceaiaaaaeaaaabaaajacaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaa
agaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaa
akiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaa
aaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
bkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_MainTex_ST]
Vector 17 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[14];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[13];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[15].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[15].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[15].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
DP3 result.texcoord[4].y, R2, R1;
MUL result.texcoord[3], R0, c[15].w;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[17].xyxy, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
Vector 16 [_BumpMap_ST]
"vs_2_0
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c13, r0
mov r0, c9
dp4 r1.y, c13, r0
dp4 r1.x, c13, r3
mov r0.xyz, c12
mov r0.w, c17.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c14.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 oT4.y, r2, r1
mul oT3, r0, c14.w
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
mad oT0.zw, v3.xyxy, c16.xyxy, c16
mad oT0.xy, v3, c15, c15.zwzw
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
ConstBuffer "$Globals" 128
Vector 96 [_MainTex_ST]
Vector 112 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecedgeedanlnbogpeddnagnkkdnnfajbmjejabaaaaaageamaaaaaeaaaaaa
daaaaaaacaaeaaaaoeakaaaakmalaaaaebgpgodjoiadaaaaoiadaaaaaaacpopp
hiadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaagaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaabaaaeaaaaaaaaaa
adaaaaaaaeaaafaaaaaaaaaaadaaamaaadaaajaaaaaaaaaaadaabaaaafaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeeka
acaaoekaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaanaaoeka
aeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahia
aaaaoeiabaaappkaaaaaoejbafaaaaadabaaahiaaaaaffibakaaoekaaeaaaaae
aaaaaliaajaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaalaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaajaaaakaabaaaaac
adaaaciaakaaaakaabaaaaacadaaaeiaalaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabaaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaajaaffkaabaaaaacadaaaciaakaaffkaabaaaaacadaaaeia
alaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
baaappkaabaaaaacabaaabiaajaakkkaabaaaaacabaaaciaakaakkkaabaaaaac
abaaaeiaalaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabaaappkaabaaaaacaaaaapiaaeaaoekaafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappiaaaaaoeia
aiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaacaaoeiaaaaaoeia
aiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaagaaoeka
aeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefclmagaaaaeaaaabaakpabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaal
lcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaa
egambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaag
bcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaa
akiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaa
aoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaa
acaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaa
abaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
abaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaa
egacbaaaadaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaipccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.w, r0, c15
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefieceddnkmgcfpaeeolklfkiapakkohdlcpfcmabaaaaaajaaoaaaaaeaaaaaa
daaaaaaammaeaaaapiamaaaamaanaaaaebgpgodjjeaeaaaajeaeaaaaaaacpopp
ceaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoaadaaeejaagaaeeka
agaaoekaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbafaaaaadabaaahiaaaaaffibaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaapaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaanaaaakaabaaaaac
adaaaciaaoaaaakaabaaaaacadaaaeiaapaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabfaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaanaaffkaabaaaaacadaaaciaaoaaffkaabaaaaacadaaaeia
apaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
bfaappkaabaaaaacabaaabiaanaakkkaabaaaaacabaaaciaaoaakkkaabaaaaac
abaaaeiaapaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabfaappkaabaaaaacaaaaapiaaiaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejbaiaaaaadaeaaaboaabaaoeja
aaaaoeiaaiaaaaadaeaaacoaacaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoeka
aeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeafaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaad
aaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcceaiaaaaeaaaabaaajacaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaa
agaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaa
akiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaa
aaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
bkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[18];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R3.xyz, R2, c[19].w, -vertex.position;
MUL R1.xyz, vertex.attrib[14].w, R0;
MOV R0.xyz, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R2.xyz, R2, c[19].w, -vertex.position;
DP3 R0.y, R1, c[5];
DP3 R0.w, -R2, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R1, c[6];
DP3 R0.w, -R2, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[19].w;
DP3 R0.y, R1, c[7];
DP3 R0.w, -R2, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 46 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r2.xyz, v2.zxyw, r0.yzxw
mov r1, c10
dp4 r3.z, c17, r1
mov r1, c9
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r2
mov r2, c8
dp4 r3.y, c17, r1
mul r1.xyz, v1.w, r0
dp4 r3.x, c17, r2
mad r3.xyz, r3, c18.w, -v0
mov r0.xyz, c16
mov r0.w, c21.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r2.xyz, r2, c18.w, -v0
dp3 r0.y, r1, c4
dp3 r0.w, -r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c18.w
dp3 r0.y, r1, c5
dp3 r0.w, -r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c18.w
dp3 r0.y, r1, c6
dp3 r0.w, -r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r1, r3
dp3 oT4.z, v2, r3
dp3 oT4.x, v1, r3
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecedpajahdegkcakpmnlfdnaopfkfnppgmhnabaaaaaajaaoaaaaaeaaaaaa
daaaaaaammaeaaaapiamaaaamaanaaaaebgpgodjjeaeaaaajeaeaaaaaaacpopp
ceaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoaadaaeejaagaaeeka
agaaoekaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbafaaaaadabaaahiaaaaaffibaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaapaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaanaaaakaabaaaaac
adaaaciaaoaaaakaabaaaaacadaaaeiaapaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabfaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaanaaffkaabaaaaacadaaaciaaoaaffkaabaaaaacadaaaeia
apaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
bfaappkaabaaaaacabaaabiaanaakkkaabaaaaacabaaaciaaoaakkkaabaaaaac
abaaaeiaapaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabfaappkaabaaaaacaaaaapiaaiaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabfaappkaaaaaoejbaiaaaaadaeaaaboaabaaoeja
aaaaoeiaaiaaaaadaeaaacoaacaaoeiaaaaaoeiaaiaaaaadaeaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcceaiaaaaeaaaabaaajacaaaafjaaaaae
egiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaa
agaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
akaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaaaaaaaaaaegambaaaaaaaaaaa
dgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaadgaaaaagbcaabaaaadaaaaaa
akiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaaakiacaaaadaaaaaa
anaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaaadaaaaaaaoaaaaaabaaaaaah
ccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaacaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaficaabaaaabaaaaaabkaabaaa
aaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaa
bkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaa
adaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaa
diaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
pccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
Vector 21 [_BumpMap_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R2.xyz, vertex.attrib[14].w, R1;
MOV R0, c[18];
DP4 R1.z, R0, c[11];
DP4 R1.x, R0, c[9];
DP4 R1.y, R0, c[10];
MOV R0.xyz, c[17];
MOV R0.w, c[0].x;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R3.xyz, R3, c[19].w, -vertex.position;
DP3 R0.y, R2, c[5];
DP3 R0.w, -R3, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1], R0, c[19].w;
DP3 R0.y, R2, c[6];
DP3 R0.w, -R3, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2], R0, c[19].w;
DP3 R0.y, R2, c[7];
DP3 R0.w, -R3, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3], R0, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R2, R1;
DP3 result.texcoord[4].z, vertex.normal, R1;
DP3 result.texcoord[4].x, vertex.attrib[14], R1;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 44 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
Vector 20 [_BumpMap_ST]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, v1.w, r1
mov r3, c8
mov r0, c10
dp4 r1.z, c17, r0
mov r0, c9
dp4 r1.y, c17, r0
dp4 r1.x, c17, r3
mov r0.xyz, c16
mov r0.w, c21.x
dp4 r3.z, r0, c10
dp4 r3.x, r0, c8
dp4 r3.y, r0, c9
mad r3.xyz, r3, c18.w, -v0
dp3 r0.y, r2, c4
dp3 r0.w, -r3, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT1, r0, c18.w
dp3 r0.y, r2, c5
dp3 r0.w, -r3, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT2, r0, c18.w
dp3 r0.y, r2, c6
dp3 r0.w, -r3, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT3, r0, c18.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT4.y, r2, r1
dp3 oT4.z, v2, r1
dp3 oT4.x, v1, r1
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
mad oT0.zw, v3.xyxy, c20.xyxy, c20
mad oT0.xy, v3, c19, c19.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 160 [_MainTex_ST]
Vector 176 [_BumpMap_ST]
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
"vs_4_0_level_9_1
eefiecednminmgkojannjdlgokpmcoboamolpblbabaaaaaafaaoaaaaaeaaaaaa
daaaaaaaliaeaaaaliamaaaaiaanaaaaebgpgodjiaaeaaaaiaaeaaaaaaacpopp
baaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaacaaafaaaaaaaaaaabaaaeaaabaaahaaaaaaaaaa
acaaaaaaabaaaiaaaaaaaaaaadaaaaaaaeaaajaaaaaaaaaaadaaamaaajaaanaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoaadaaeejaagaaeeka
agaaoekaabaaaaacaaaaahiaahaaoekaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbafaaaaadabaaahiaaaaaffibaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaibabaakeiaaeaaaaaeaaaaaliaapaakekaaaaakkib
aaaaoeiaabaaaaacabaaaiiaaaaaaaiaabaaaaacacaaahiaabaaoejaafaaaaad
adaaahiaacaamjiaacaancjaaeaaaaaeacaaahiaacaamjjaacaanciaadaaoeib
afaaaaadacaaahiaacaaoeiaabaappjaabaaaaacadaaabiaanaaaakaabaaaaac
adaaaciaaoaaaakaabaaaaacadaaaeiaapaaaakaaiaaaaadabaaaciaacaaoeia
adaaoeiaaiaaaaadabaaabiaabaaoejaadaaoeiaaiaaaaadabaaaeiaacaaoeja
adaaoeiaafaaaaadabaaapoaabaaoeiabfaappkaabaaaaacabaaaiiaaaaaffia
abaaaaacadaaabiaanaaffkaabaaaaacadaaaciaaoaaffkaabaaaaacadaaaeia
apaaffkaaiaaaaadabaaaciaacaaoeiaadaaoeiaaiaaaaadabaaabiaabaaoeja
adaaoeiaaiaaaaadabaaaeiaacaaoejaadaaoeiaafaaaaadacaaapoaabaaoeia
bfaappkaabaaaaacabaaabiaanaakkkaabaaaaacabaaaciaaoaakkkaabaaaaac
abaaaeiaapaakkkaaiaaaaadaaaaaciaacaaoeiaabaaoeiaaiaaaaadaaaaabia
abaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeiaafaaaaadadaaapoa
aaaaoeiabfaappkaabaaaaacaaaaapiaaiaaoekaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeabaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeia
aiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaacaaoeiaaaaaoeia
aiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaad
abaaadiaaaaaffiaacaaoekaaeaaaaaeaaaaadiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaadiaadaaoekaaaaakkiaaaaaoeiaaeaaaaaeafaaadoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapia
ajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcpiahaaaa
eaaaabaapoabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaaddccabaaaagaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaa
aaaaaaaaalaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaadiaaaaajhcaabaaaabaaaaaafgafbaia
ebaaaaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaallcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaiaebaaaaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaallcaabaaaaaaaaaaaegiicaaaadaaaaaaaoaaaaaakgakbaiaebaaaaaa
aaaaaaaaegambaaaaaaaaaaadgaaaaaficaabaaaabaaaaaaakaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgbpbaaaabaaaaaa
dgaaaaagbcaabaaaadaaaaaaakiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
adaaaaaaakiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaadaaaaaaakiacaaa
adaaaaaaaoaaaaaabaaaaaahccaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaa
adaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaabaaaaaaegacbaaaadaaaaaa
baaaaaahecaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaadaaaaaadiaaaaai
pccabaaaacaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadgaaaaaf
icaabaaaabaaaaaabkaabaaaaaaaaaaadgaaaaagbcaabaaaadaaaaaabkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaadaaaaaabkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaadaaaaaabkiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaa
abaaaaaaegacbaaaacaaaaaaegacbaaaadaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaabaaaaaaegacbaaaadaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
acaaaaaaegacbaaaadaaaaaadiaaaaaipccabaaaadaaaaaaegaobaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaadgaaaaagbcaabaaaabaaaaaackiacaaaadaaaaaa
amaaaaaadgaaaaagccaabaaaabaaaaaackiacaaaadaaaaaaanaaaaaadgaaaaag
ecaabaaaabaaaaaackiacaaaadaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadiaaaaaipccabaaaaeaaaaaaegaobaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaa
acaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
dcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaa
abaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaabaaaaaaaaaaadcaaaaakdccabaaaagaaaaaaegiacaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaadamaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R1.x, fragment.texcoord[0].z, R0;
ADD R1.y, fragment.texcoord[0].w, R0;
MUL R0.x, R0.z, c[0];
MUL R0.y, R0.w, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R0.yw, R0, texture[0], 2D;
TEX R1.yw, R1, texture[0], 2D;
MUL R0.z, R0.y, c[4].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MOV R0.w, R1;
MUL R0.z, R1.y, c[3].x;
MUL R1.xy, R0, R0;
MAD R2.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R0.z, R0;
ADD_SAT R1.x, R1, R1.y;
ADD R0.z, -R1.x, c[8].y;
ADD R0.w, -R0, c[8].y;
RSQ R0.w, R0.w;
RSQ R0.z, R0.z;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
RCP R2.z, R0.w;
RCP R0.z, R0.z;
ADD R1.xyz, R2, R0;
DP3 R0.x, R1, fragment.texcoord[1];
DP3 R0.y, R1, fragment.texcoord[2];
DP3 R0.z, R1, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R0, R2;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[8].x, R2;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
RSQ R1.w, R1.w;
MUL R2.yzw, R1.w, fragment.texcoord[4].xxyz;
DP3 R1.x, R1, R2.yzww;
MAX R1.x, R1, c[8].z;
TEX R0.xyz, R0, texture[2], CUBE;
TEX R2.x, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, R0.w, texture[3], 2D;
ADD R0.xyz, R0, c[6];
MUL R0.xyz, R0, c[2].x;
MUL R0.xyz, R0, c[1];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[8].x;
MUL result.color.w, R2.x, c[5].x;
END
# 52 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r2.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
add_pp r2.x, t0.z, r0
mov r1.x, c0
mov r0.x, c0
mul r0.x, c7.w, r0
add_pp r1.y, t0.w, r0.x
mul r1.x, c7.z, r1
add_pp r1.x, t0.z, r1
texld r1, r1, s0
texld r0, r2, s0
mov_pp r0.x, r0.w
mul_pp r0.y, r0, c3.x
mad_pp r3.xy, r0, c8.x, c8.y
mul_pp r1.y, r1, c4.x
mov_pp r1.x, r1.w
mad_pp r2.xy, r1, c8.x, c8.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c8.z
rsq_pp r4.x, r0.x
rcp_pp r2.z, r4.x
add_pp r1.x, -r1, c8.z
rsq_pp r0.x, r1.x
rcp_pp r3.z, r0.x
add_pp r1.xyz, r3, r2
dp3_pp r3.x, r1, t1
dp3_pp r3.y, r1, t2
dp3_pp r3.z, r1, t3
mov r2.x, t1.w
mov r2.z, t3.w
mov r2.y, t2.w
dp3 r0.x, r3, r2
mul r3.xyz, r3, r0.x
mad r2.xyz, -r3, c8.x, r2
dp3 r0.x, t5, t5
mov r0.xy, r0.x
texld r3, r0, s3
texld r2, r2, s2
texld r4, t0, s1
dp3_pp r0.x, t4, t4
add r2.xyz, r2, c6
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r1, r0
mul r2.xyz, r2, c2.x
mul_pp r2.xyz, r2, c1
max_pp r0.x, r0, c8.w
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c8.x
mul r0.w, r4.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_BumpMap] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 3
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 112 [_Reflectionstrength]
Float 116 [_BumpMapStrength]
Float 120 [_BumpMap2Strength]
Float 124 [_MasterOpacity]
Vector 128 [_CubeMapBaseColor]
Vector 144 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedmjklncoiaifkogochdmeplpcpibhediaabaaaaaaniakaaaaaeaaaaaa
daaaaaaaaaaeaaaaneajaaaakeakaaaaebgpgodjmiadaaaamiadaaaaaaacpppp
haadaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
abababaaaaacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaa
aaaaaaaaabaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaji
adaiapkaabaaaaacaaaaaiiaaeaaaakaaeaaaaaeaaaacbiaaaaappiaadaaaaka
aaaakklaaeaaaaaeaaaacciaaaaappiaadaaffkaaaaapplaaeaaaaaeabaacbia
aaaappiaadaakkkaaaaakklaaeaaaaaeabaacciaaaaappiaadaappkaaaaappla
ecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadabaacpiaabaaoeiaacaioeka
afaaaaadaaaacciaaaaaffiaabaaffkaabaaaaacaaaacbiaaaaappiaaeaaaaae
aaaacdiaaaaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiiaaaaaoeiaaaaaoeia
afaakkkaacaaaaadaaaaciiaaaaappibafaappkaahaaaaacaaaaciiaaaaappia
agaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffiaabaakkkaabaaaaac
abaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaafaaaakaafaaffkafkaaaaae
aaaadiiaabaaoeiaabaaoeiaafaakkkaacaaaaadaaaaciiaaaaappibafaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappiaacaaaaadaaaachia
aaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeiaaiaaaaadabaaacia
acaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeiaabaaaaacacaaabia
abaapplaabaaaaacacaaaciaacaapplaabaaaaacacaaaeiaadaapplaaiaaaaad
aaaaaiiaacaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaae
abaaahiaabaaoeiaaaaappibacaaoeiaaiaaaaadacaaadiaafaaoelaafaaoela
ecaaaaadabaaapiaabaaoeiaadaioekaecaaaaadacaacpiaacaaoeiaaaaioeka
ecaaaaadadaacpiaaaaaoelaabaioekaacaaaaadabaaahiaabaaoeiaacaaoeka
afaaaaadabaachiaabaaoeiaabaaaakaafaaaaadabaachiaabaaoeiaaaaaoeka
ceaaaaacaeaachiaaeaaoelaaiaaaaadabaaciiaaaaaoeiaaeaaoeiaafaaaaad
aaaacbiaacaaaaiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaafaakkka
acaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaachiaabaappiaabaaoeia
afaaaaadaaaaciiaadaaaaiaabaappkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcmmafaaaaeaaaaaaahdabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaal
pcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaa
ogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaadghjbaaa
aaaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaa
dghjbaaaaaaaaaaaaagabaaaacaaaaaadiaaaaaiccaabaaaabaaaaaackaabaaa
abaaaaaabkiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaa
acaaaaaadgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaa
acaaaaaadkbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaagiacaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadeaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaafgafbaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
agaabaaaaaaaaaaaagaabaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaahaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apapaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.z, R0, c[0].x;
MUL R0.w, R0, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.z, fragment.texcoord[0], R0;
ADD R0.w, fragment.texcoord[0], R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R1.yw, R0.zwzw, texture[0], 2D;
TEX R0.yw, R0, texture[0], 2D;
MUL R1.z, R1.y, c[4].x;
MAD R1.xy, R1.wzzw, c[8].x, -c[8].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
MUL R0.z, R0.y, c[3].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[8].y;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[8].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R2.xyz, R0, R1;
DP3 R1.x, R2, fragment.texcoord[1];
DP3 R1.y, R2, fragment.texcoord[2];
DP3 R1.z, R2, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R1, R0;
MUL R1.xyz, R1, R0.w;
MAD R0.xyz, -R1, c[8].x, R0;
DP3 R0.w, R2, fragment.texcoord[4];
TEX R0.xyz, R0, texture[2], CUBE;
TEX R1.x, fragment.texcoord[0], texture[1], 2D;
ADD R0.xyz, R0, c[6];
MUL R0.xyz, R0, c[2].x;
MUL R2.xyz, R0, c[1];
MAX R0.x, R0.w, c[8].z;
MUL R0.xyz, R0.x, R2;
MUL result.color.xyz, R0, c[8].x;
MUL result.color.w, R1.x, c[5].x;
END
# 45 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r0.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c7.w, r1
mul r2.x, c7.z, r2
add_pp r0.x, t0.z, r0
add_pp r2.y, t0.w, r1.x
add_pp r2.x, t0.z, r2
texld r2, r2, s0
texld r1, r0, s0
mov_pp r0.w, r2
mov r2.z, t3.w
mul_pp r0.y, r2, c4.x
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c8.x, c8.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c8.z
rsq_pp r2.x, r2.x
rcp_pp r0.z, r2.x
mov r2.x, t1.w
mov r2.y, t2.w
mov_pp r1.x, r1.w
mul_pp r1.y, r1, c3.x
mad_pp r1.xy, r1, c8.x, c8.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c8.z
rsq_pp r3.x, r3.x
rcp_pp r1.z, r3.x
add_pp r0.xyz, r1, r0
dp3_pp r3.x, r0, t1
dp3_pp r3.y, r0, t2
dp3_pp r3.z, r0, t3
dp3_pp r0.x, r0, t4
dp3 r1.x, r3, r2
mul r1.xyz, r3, r1.x
mad r1.xyz, -r1, c8.x, r2
max_pp r0.x, r0, c8.w
texld r2, r1, s2
texld r1, t0, s1
add r2.xyz, r2, c6
mul r2.xyz, r2, c2.x
mul_pp r2.xyz, r2, c1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c8.x
mul r0.w, r1.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_BumpMap] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_Cube] CUBE 2
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Float 48 [_Reflectionstrength]
Float 52 [_BumpMapStrength]
Float 56 [_BumpMap2Strength]
Float 60 [_MasterOpacity]
Vector 64 [_CubeMapBaseColor]
Vector 80 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedenelccfhlhocohkafaghjkcahpighpfiabaaaaaajeajaaaaaeaaaaaa
daaaaaaakeadaaaakiaiaaaagaajaaaaebgpgodjgmadaaaagmadaaaaaaacpppp
biadaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaabaaaaaa
aaababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaadaaabaaaaaaaaaa
abaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaeaaaaaialp
aaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajiacaiapkaabaaaaacaaaaaiiaaeaaaakaaeaaaaaeaaaacbiaaaaappia
adaaaakaaaaakklaaeaaaaaeaaaacciaaaaappiaadaaffkaaaaapplaaeaaaaae
abaacbiaaaaappiaadaakkkaaaaakklaaeaaaaaeabaacciaaaaappiaadaappka
aaaapplaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaabaaoeia
abaioekaafaaaaadaaaacciaaaaaffiaabaaffkaabaaaaacaaaacbiaaaaappia
aeaaaaaeaaaacdiaaaaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiiaaaaaoeia
aaaaoeiaafaakkkaacaaaaadaaaaciiaaaaappibafaappkaahaaaaacaaaaciia
aaaappiaagaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffiaabaakkka
abaaaaacabaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaafaaaakaafaaffka
fkaaaaaeaaaadiiaabaaoeiaabaaoeiaafaakkkaacaaaaadaaaaciiaaaaappib
afaappkaahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappiaacaaaaad
aaaachiaaaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeiaaiaaaaad
abaaaciaacaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeiaaiaaaaad
abaaciiaaaaaoeiaaeaaoelaalaaaaadaaaacbiaabaappiaafaakkkaacaaaaad
abaaciiaaaaaaaiaaaaaaaiaabaaaaacaaaaabiaabaapplaabaaaaacaaaaacia
acaapplaabaaaaacaaaaaeiaadaapplaaiaaaaadaaaaaiiaaaaaoeiaabaaoeia
acaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappib
aaaaoeiaecaaaaadaaaaapiaaaaaoeiaacaioekaecaaaaadacaacpiaaaaaoela
aaaioekaacaaaaadaaaaahiaaaaaoeiaacaaoekaafaaaaadaaaachiaaaaaoeia
abaaaakaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappia
aaaaoeiaafaaaaadaaaaciiaacaaaaiaabaappkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcpmaeaaaaeaaaaaaadpabaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaalpcaabaaa
aaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaafaaaaaaogbobaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaadghjbaaaaaaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaadghjbaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaaiccaabaaaabaaaaaackaabaaaabaaaaaa
bkiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaa
abaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
elaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
ckaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaadcaaaaapdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaa
egbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaa
aeaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaaacaaaaaadgaaaaafccaabaaa
acaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaaacaaaaaadkbabaaaaeaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakocaabaaa
aaaaaaaaagajbaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaaagajbaaaacaaaaaa
efaaaaajpcaabaaaabaaaaaajgahbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaaaaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaa
aeaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagiacaaaaaaaaaaa
adaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaa
adaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapapaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R1.x, fragment.texcoord[0].z, R0;
ADD R1.y, fragment.texcoord[0].w, R0;
MUL R0.x, R0.z, c[0];
MUL R0.y, R0.w, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R0.yw, R0, texture[0], 2D;
TEX R1.yw, R1, texture[0], 2D;
MUL R0.z, R0.y, c[4].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.z, R1.y, c[3].x;
MUL R1.xy, R0, R0;
MOV R0.w, R1;
MAD R2.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R0.z, R0;
ADD_SAT R1.x, R1, R1.y;
ADD R0.z, -R1.x, c[8].y;
ADD R0.w, -R0, c[8].y;
RSQ R0.w, R0.w;
RSQ R0.z, R0.z;
RCP R2.z, R0.w;
RCP R0.z, R0.z;
ADD R1.xyz, R2, R0;
DP3 R0.x, R1, fragment.texcoord[1];
DP3 R0.y, R1, fragment.texcoord[2];
DP3 R0.z, R1, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R0, R2;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[8].x, R2;
RCP R0.w, fragment.texcoord[5].w;
MAD R2.xy, fragment.texcoord[5], R0.w, c[8].w;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
TEX R1.w, R2, texture[3], 2D;
TEX R0.xyz, R0, texture[2], CUBE;
TEX R2.x, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, R0.w, texture[4], 2D;
DP3 R2.y, fragment.texcoord[4], fragment.texcoord[4];
ADD R0.xyz, R0, c[6];
RSQ R2.y, R2.y;
MUL R0.xyz, R0, c[2].x;
MUL R2.yzw, R2.y, fragment.texcoord[4].xxyz;
DP3 R1.y, R1, R2.yzww;
SLT R1.x, c[8].z, fragment.texcoord[5].z;
MUL R1.x, R1, R1.w;
MUL R0.w, R1.x, R0;
MAX R1.x, R1.y, c[8].z;
MUL R0.xyz, R0, c[1];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[8].x;
MUL result.color.w, R2.x, c[5].x;
END
# 58 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_2d s4
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
def c9, 0.50000000, 0, 0, 0
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r2.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
add_pp r2.x, t0.z, r0
mov r1.x, c0
mov r0.x, c0
mul r0.x, c7.w, r0
add_pp r1.y, t0.w, r0.x
mul r1.x, c7.z, r1
add_pp r1.x, t0.z, r1
texld r1, r1, s0
texld r0, r2, s0
mov_pp r0.x, r0.w
mul_pp r0.y, r0, c3.x
mad_pp r3.xy, r0, c8.x, c8.y
mul_pp r1.y, r1, c4.x
mov_pp r1.x, r1.w
mad_pp r2.xy, r1, c8.x, c8.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c8.z
rsq_pp r4.x, r0.x
rcp_pp r2.z, r4.x
add_pp r1.x, -r1, c8.z
rsq_pp r0.x, r1.x
rcp_pp r3.z, r0.x
add_pp r1.xyz, r3, r2
dp3_pp r3.x, r1, t1
dp3_pp r3.y, r1, t2
dp3_pp r3.z, r1, t3
mov r2.x, t1.w
mov r2.z, t3.w
mov r2.y, t2.w
dp3 r0.x, r3, r2
mul r0.xyz, r3, r0.x
mad r2.xyz, -r0, c8.x, r2
dp3 r3.x, t5, t5
rcp r0.x, t5.w
mov r3.xy, r3.x
mad r0.xy, t5, r0.x, c9.x
texld r0, r0, s3
texld r2, r2, s2
texld r4, t0, s1
texld r3, r3, s4
dp3_pp r0.x, t4, t4
add r2.xyz, r2, c6
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r1, r0
mul r2.xyz, r2, c2.x
cmp r1.x, -t5.z, c8.w, c8.z
mul_pp r1.x, r1, r0.w
mul_pp r2.xyz, r2, c1
mul_pp r1.x, r1, r3
max_pp r0.x, r0, c8.w
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c8.x
mul r0.w, r4.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_BumpMap] 2D 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_Cube] CUBE 4
SetTexture 3 [_LightTexture0] 2D 0
SetTexture 4 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 112 [_Reflectionstrength]
Float 116 [_BumpMapStrength]
Float 120 [_BumpMap2Strength]
Float 124 [_MasterOpacity]
Vector 128 [_CubeMapBaseColor]
Vector 144 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedfppkfegcnagdelpejjhfbcblnhdhhbmnabaaaaaafaamaaaaaeaaaaaa
daaaaaaaieaeaaaaemalaaaabmamaaaaebgpgodjemaeaaaaemaeaaaaaaacpppp
paadaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaadaaaaaa
aeababaaabacacaaaaadadaaacaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpfbaaaaafagaaapkaaaaaaadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapka
bpaaaaacaaaaaajiaeaiapkaabaaaaacaaaaaiiaaeaaaakaaeaaaaaeaaaacbia
aaaappiaadaaaakaaaaakklaaeaaaaaeaaaacciaaaaappiaadaaffkaaaaappla
aeaaaaaeabaacbiaaaaappiaadaakkkaaaaakklaaeaaaaaeabaacciaaaaappia
adaappkaaaaapplaecaaaaadaaaacpiaaaaaoeiaadaioekaecaaaaadabaacpia
abaaoeiaadaioekaafaaaaadaaaacciaaaaaffiaabaaffkaabaaaaacaaaacbia
aaaappiaaeaaaaaeaaaacdiaaaaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiia
aaaaoeiaaaaaoeiaafaakkkaacaaaaadaaaaciiaaaaappibafaappkaahaaaaac
aaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffia
abaakkkaabaaaaacabaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaafaaaaka
afaaffkafkaaaaaeaaaadiiaabaaoeiaabaaoeiaafaakkkaacaaaaadaaaaciia
aaaappibafaappkaahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappia
acaaaaadaaaachiaaaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeia
aiaaaaadabaaaciaacaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeia
abaaaaacacaaabiaabaapplaabaaaaacacaaaciaacaapplaabaaaaacacaaaeia
adaapplaaiaaaaadaaaaaiiaacaaoeiaabaaoeiaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeabaaahiaabaaoeiaaaaappibacaaoeiaagaaaaacaaaaaiia
afaapplaaeaaaaaeacaaadiaafaaoelaaaaappiaagaaaakaaiaaaaadaaaaaiia
afaaoelaafaaoelaabaaaaacadaaadiaaaaappiaecaaaaadabaaapiaabaaoeia
aeaioekaecaaaaadacaacpiaacaaoeiaaaaioekaecaaaaadadaacpiaadaaoeia
abaioekaecaaaaadaeaacpiaaaaaoelaacaioekaacaaaaadabaaahiaabaaoeia
acaaoekaafaaaaadabaachiaabaaoeiaabaaaakaafaaaaadabaachiaabaaoeia
aaaaoekaceaaaaacacaachiaaeaaoelaaiaaaaadabaaciiaaaaaoeiaacaaoeia
alaaaaadaaaacbiaabaappiaafaakkkaafaaaaadabaaciiaacaappiaadaaaaia
fiaaaaaeabaaciiaafaakklbafaakkkaabaappiaafaaaaadabaaciiaaaaaaaia
abaappiaacaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaachiaabaappia
abaaoeiaafaaaaadaaaaciiaaeaaaaiaabaappkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcmaagaaaaeaaaaaaalaabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadpcbabaaa
adaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
pcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaadcaaaaal
pcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaaajaaaaaa
ogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaadghjbaaa
aaaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaa
dghjbaaaaaaaaaaaaagabaaaadaaaaaadiaaaaaiccaabaaaabaaaaaackaabaaa
abaaaaaabkiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaaabaaaaaaegaabaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaa
acaaaaaadgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaa
acaaaaaadkbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegacbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaagiacaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadeaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaa
agbbbaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakgcaabaaaaaaaaaaafgagbaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaa
acaaaaaajgafbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadbaaaaah
ccaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaa
dkaabaaaacaaaaaabkaabaaaaaaaaaaabaaaaaahecaabaaaaaaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaakgakbaaaaaaaaaaa
eghobaaaaeaaaaaaaagabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaacaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaadkiacaaa
aaaaaaaaahaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
ADD R1.x, fragment.texcoord[0].z, R0;
ADD R1.y, fragment.texcoord[0].w, R0;
MUL R0.x, R0.z, c[0];
MUL R0.y, R0.w, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R0.yw, R0, texture[0], 2D;
TEX R1.yw, R1, texture[0], 2D;
MUL R0.z, R0.y, c[4].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MOV R0.w, R1;
MUL R0.z, R1.y, c[3].x;
MUL R1.xy, R0, R0;
MAD R2.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R2.xyxy, R2.xyxy;
ADD_SAT R0.w, R0.z, R0;
ADD_SAT R1.x, R1, R1.y;
ADD R0.z, -R1.x, c[8].y;
ADD R0.w, -R0, c[8].y;
RSQ R0.w, R0.w;
RSQ R0.z, R0.z;
RCP R2.z, R0.w;
RCP R0.z, R0.z;
ADD R1.xyz, R2, R0;
DP3 R0.x, R1, fragment.texcoord[1];
DP3 R0.y, R1, fragment.texcoord[2];
DP3 R0.z, R1, fragment.texcoord[3];
MOV R2.x, fragment.texcoord[1].w;
MOV R2.z, fragment.texcoord[3].w;
MOV R2.y, fragment.texcoord[2].w;
DP3 R0.w, R0, R2;
MUL R0.xyz, R0, R0.w;
MAD R0.xyz, -R0, c[8].x, R2;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R2.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R2.y, R2.y;
MUL R2.yzw, R2.y, fragment.texcoord[4].xxyz;
DP3 R1.x, R1, R2.yzww;
MAX R1.x, R1, c[8].z;
TEX R0.xyz, R0, texture[2], CUBE;
TEX R2.x, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, R0.w, texture[3], 2D;
TEX R1.w, fragment.texcoord[5], texture[4], CUBE;
ADD R0.xyz, R0, c[6];
MUL R0.xyz, R0, c[2].x;
MUL R0.w, R0, R1;
MUL R0.xyz, R0, c[1];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[8].x;
MUL result.color.w, R2.x, c[5].x;
END
# 54 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
dcl_cube s4
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xyz
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r2.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
add_pp r2.x, t0.z, r0
mov r1.x, c0
mov r0.x, c0
mul r0.x, c7.w, r0
add_pp r1.y, t0.w, r0.x
mul r1.x, c7.z, r1
add_pp r1.x, t0.z, r1
texld r1, r1, s0
texld r0, r2, s0
mov_pp r0.x, r0.w
mul_pp r0.y, r0, c3.x
mad_pp r3.xy, r0, c8.x, c8.y
mul_pp r1.y, r1, c4.x
mov_pp r1.x, r1.w
mad_pp r2.xy, r1, c8.x, c8.y
mul_pp r0.xy, r2, r2
mul_pp r1.xy, r3, r3
add_pp_sat r0.x, r0, r0.y
add_pp_sat r1.x, r1, r1.y
add_pp r0.x, -r0, c8.z
rsq_pp r4.x, r0.x
rcp_pp r2.z, r4.x
add_pp r1.x, -r1, c8.z
rsq_pp r0.x, r1.x
rcp_pp r3.z, r0.x
add_pp r1.xyz, r3, r2
dp3_pp r3.x, r1, t1
dp3_pp r3.y, r1, t2
dp3_pp r3.z, r1, t3
mov r2.x, t1.w
mov r2.z, t3.w
mov r2.y, t2.w
dp3 r0.x, r3, r2
mul r3.xyz, r3, r0.x
mad r2.xyz, -r3, c8.x, r2
dp3 r0.x, t5, t5
mov r0.xy, r0.x
texld r3, r0, s3
texld r0, t5, s4
texld r2, r2, s2
texld r4, t0, s1
dp3_pp r0.x, t4, t4
add r2.xyz, r2, c6
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, r1, r0
mul r2.xyz, r2, c2.x
mul r1.x, r3, r0.w
max_pp r0.x, r0, c8.w
mul_pp r2.xyz, r2, c1
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c8.x
mul r0.w, r4.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_BumpMap] 2D 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_Cube] CUBE 4
SetTexture 3 [_LightTextureB0] 2D 1
SetTexture 4 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 112 [_Reflectionstrength]
Float 116 [_BumpMapStrength]
Float 120 [_BumpMap2Strength]
Float 124 [_MasterOpacity]
Vector 128 [_CubeMapBaseColor]
Vector 144 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedlhkjndlkijgmgnccafanlmmibjjhpjofabaaaaaagaalaaaaaeaaaaaa
daaaaaaacmaeaaaafmakaaaacmalaaaaebgpgodjpeadaaaapeadaaaaaaacpppp
jiadaaaafmaaaaaaadaadiaaaaaafmaaaaaafmaaafaaceaaaaaafmaaaeaaaaaa
adababaaabacacaaaaadadaaacaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapka
aaaaaaeaaaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaapla
bpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaahlabpaaaaacaaaaaaji
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkabpaaaaacaaaaaajiaeaiapkaabaaaaacaaaaaiiaaeaaaaka
aeaaaaaeaaaacbiaaaaappiaadaaaakaaaaakklaaeaaaaaeaaaacciaaaaappia
adaaffkaaaaapplaaeaaaaaeabaacbiaaaaappiaadaakkkaaaaakklaaeaaaaae
abaacciaaaaappiaadaappkaaaaapplaecaaaaadaaaacpiaaaaaoeiaadaioeka
ecaaaaadabaacpiaabaaoeiaadaioekaafaaaaadaaaacciaaaaaffiaabaaffka
abaaaaacaaaacbiaaaaappiaaeaaaaaeaaaacdiaaaaaoeiaafaaaakaafaaffka
fkaaaaaeaaaadiiaaaaaoeiaaaaaoeiaafaakkkaacaaaaadaaaaciiaaaaappib
afaappkaahaaaaacaaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaafaaaaad
abaacciaabaaffiaabaakkkaabaaaaacabaacbiaabaappiaaeaaaaaeabaacdia
abaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiiaabaaoeiaabaaoeiaafaakkka
acaaaaadaaaaciiaaaaappibafaappkaahaaaaacaaaaciiaaaaappiaagaaaaac
abaaceiaaaaappiaacaaaaadaaaachiaaaaaoeiaabaaoeiaaiaaaaadabaaabia
abaaoelaaaaaoeiaaiaaaaadabaaaciaacaaoelaaaaaoeiaaiaaaaadabaaaeia
adaaoelaaaaaoeiaabaaaaacacaaabiaabaapplaabaaaaacacaaaciaacaappla
abaaaaacacaaaeiaadaapplaaiaaaaadaaaaaiiaacaaoeiaabaaoeiaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeabaaahiaabaaoeiaaaaappibacaaoeia
aiaaaaadacaaadiaafaaoelaafaaoelaecaaaaadabaaapiaabaaoeiaaeaioeka
ecaaaaadacaaapiaacaaoeiaabaioekaecaaaaadadaaapiaafaaoelaaaaioeka
ecaaaaadaeaacpiaaaaaoelaacaioekaacaaaaadabaaahiaabaaoeiaacaaoeka
afaaaaadabaachiaabaaoeiaabaaaakaafaaaaadabaachiaabaaoeiaaaaaoeka
ceaaaaacadaachiaaeaaoelaaiaaaaadabaaciiaaaaaoeiaadaaoeiaalaaaaad
aaaacbiaabaappiaafaakkkaafaaaaadabaaciiaacaaaaiaadaappiaafaaaaad
abaaciiaaaaaaaiaabaappiaacaaaaadabaaciiaabaappiaabaappiaafaaaaad
aaaachiaabaappiaabaaoeiaafaaaaadaaaaciiaaeaaaaiaabaappkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcciagaaaaeaaaaaaaikabaaaafjaaaaae
egiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafidaaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaadpcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
aeaaaaaadcaaaaalpcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaa
aaaaaaaaajaaaaaaogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
aaaaaaaadghjbaaaaaaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogakbaaaaaaaaaaadghjbaaaaaaaaaaaaagabaaaadaaaaaadiaaaaaiccaabaaa
abaaaaaackaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaa
abaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaa
dcaaaaapdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaa
dkaabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
baaaaaahccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaah
ecaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaafbcaabaaa
acaaaaaadkbabaaaacaaaaaadgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaa
dgaaaaafecaabaaaacaaaaaadkbabaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaa
egacbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaiaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegbcbaaa
afaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaa
acaaaaaafgafbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbcbaaaagaaaaaaeghobaaaaeaaaaaaaagabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaaakaabaaaacaaaaaadkaabaaaadaaaaaaapaaaaah
bcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaaiiccabaaa
aaaaaaaaakaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaadoaaaaabejfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapapaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apapaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0, c[7];
MUL R0.y, R0, c[0].x;
MUL R0.x, R0, c[0];
MUL R0.z, R0, c[0].x;
MUL R0.w, R0, c[0].x;
ADD R0.x, fragment.texcoord[0].z, R0;
ADD R0.z, fragment.texcoord[0], R0;
ADD R0.w, fragment.texcoord[0], R0;
ADD R0.y, fragment.texcoord[0].w, R0;
TEX R1.yw, R0.zwzw, texture[0], 2D;
TEX R0.yw, R0, texture[0], 2D;
MUL R1.z, R1.y, c[4].x;
MAD R1.xy, R1.wzzw, c[8].x, -c[8].y;
MUL R0.z, R0.y, c[3].x;
MAD R0.xy, R0.wzzw, c[8].x, -c[8].y;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
MUL R1.zw, R1.xyxy, R1.xyxy;
ADD_SAT R1.z, R1, R1.w;
ADD R0.w, -R1.z, c[8].y;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[8].y;
RSQ R0.z, R0.z;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R1.xyz, R0, R1;
DP3 R2.x, R1, fragment.texcoord[1];
DP3 R2.y, R1, fragment.texcoord[2];
DP3 R2.z, R1, fragment.texcoord[3];
MOV R0.x, fragment.texcoord[1].w;
MOV R0.z, fragment.texcoord[3].w;
MOV R0.y, fragment.texcoord[2].w;
DP3 R0.w, R2, R0;
MUL R2.xyz, R2, R0.w;
MAD R0.xyz, -R2, c[8].x, R0;
TEX R2.xyz, R0, texture[2], CUBE;
TEX R0.x, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, fragment.texcoord[5], texture[3], 2D;
DP3 R0.y, R1, fragment.texcoord[4];
ADD R2.xyz, R2, c[6];
MUL R2.xyz, R2, c[2].x;
MAX R0.y, R0, c[8].z;
MUL R1.xyz, R2, c[1];
MUL R0.y, R0, R0.w;
MUL R1.xyz, R0.y, R1;
MUL result.color.xyz, R1, c[8].x;
MUL result.color.w, R0.x, c[5].x;
END
# 47 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Float 2 [_Reflectionstrength]
Float 3 [_BumpMapStrength]
Float 4 [_BumpMap2Strength]
Float 5 [_MasterOpacity]
Vector 6 [_CubeMapBaseColor]
Vector 7 [_UvAnimation]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
dcl_2d s3
def c8, 2.00000000, -1.00000000, 1.00000000, 0.00000000
dcl t0
dcl t1
dcl t2
dcl t3
dcl t4.xyz
dcl t5.xy
mov r1.x, c0
mul r1.x, c7.y, r1
add_pp r0.y, t0.w, r1.x
mov r0.x, c0
mul r0.x, c7, r0
mov r2.x, c0
mov r1.x, c0
mul r1.x, c7.w, r1
mul r2.x, c7.z, r2
add_pp r0.x, t0.z, r0
add_pp r2.y, t0.w, r1.x
add_pp r2.x, t0.z, r2
texld r2, r2, s0
texld r1, r0, s0
mov_pp r0.w, r2
mov r2.z, t3.w
mul_pp r0.y, r2, c4.x
mov_pp r0.x, r0.w
mad_pp r0.xy, r0, c8.x, c8.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c8.z
rsq_pp r2.x, r2.x
rcp_pp r0.z, r2.x
mov r2.x, t1.w
mov r2.y, t2.w
mov_pp r1.x, r1.w
mul_pp r1.y, r1, c3.x
mad_pp r1.xy, r1, c8.x, c8.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c8.z
rsq_pp r3.x, r3.x
rcp_pp r1.z, r3.x
add_pp r0.xyz, r1, r0
dp3_pp r3.x, r0, t1
dp3_pp r3.y, r0, t2
dp3_pp r3.z, r0, t3
dp3 r1.x, r3, r2
dp3_pp r0.x, r0, t4
mul r1.xyz, r3, r1.x
mad r1.xyz, -r1, c8.x, r2
max_pp r0.x, r0, c8.w
texld r3, r1, s2
texld r1, t0, s1
texld r2, t5, s3
add r2.xyz, r3, c6
mul r2.xyz, r2, c2.x
mul_pp r2.xyz, r2, c1
mul_pp r0.x, r0, r2.w
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c8.x
mul r0.w, r1.x, c5.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_BumpMap] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_Cube] CUBE 3
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 112 [_Reflectionstrength]
Float 116 [_BumpMapStrength]
Float 120 [_BumpMap2Strength]
Float 124 [_MasterOpacity]
Vector 128 [_CubeMapBaseColor]
Vector 144 [_UvAnimation]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecedflfnmolbmgpfbchgkclefdfihmbdfmboabaaaaaafeakaaaaaeaaaaaa
daaaaaaaoeadaaaafaajaaaacaakaaaaebgpgodjkmadaaaakmadaaaaaaacpppp
feadaaaafiaaaaaaadaadeaaaaaafiaaaaaafiaaaeaaceaaaaaafiaaadaaaaaa
abababaaaaacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaadaaabaa
aaaaaaaaabaaaaaaabaaaeaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaadlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaji
adaiapkaabaaaaacaaaaaiiaaeaaaakaaeaaaaaeaaaacbiaaaaappiaadaaaaka
aaaakklaaeaaaaaeaaaacciaaaaappiaadaaffkaaaaapplaaeaaaaaeabaacbia
aaaappiaadaakkkaaaaakklaaeaaaaaeabaacciaaaaappiaadaappkaaaaappla
ecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadabaacpiaabaaoeiaacaioeka
afaaaaadaaaacciaaaaaffiaabaaffkaabaaaaacaaaacbiaaaaappiaaeaaaaae
aaaacdiaaaaaoeiaafaaaakaafaaffkafkaaaaaeaaaadiiaaaaaoeiaaaaaoeia
afaakkkaacaaaaadaaaaciiaaaaappibafaappkaahaaaaacaaaaciiaaaaappia
agaaaaacaaaaceiaaaaappiaafaaaaadabaacciaabaaffiaabaakkkaabaaaaac
abaacbiaabaappiaaeaaaaaeabaacdiaabaaoeiaafaaaakaafaaffkafkaaaaae
aaaadiiaabaaoeiaabaaoeiaafaakkkaacaaaaadaaaaciiaaaaappibafaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacabaaceiaaaaappiaacaaaaadaaaachia
aaaaoeiaabaaoeiaaiaaaaadabaaabiaabaaoelaaaaaoeiaaiaaaaadabaaacia
acaaoelaaaaaoeiaaiaaaaadabaaaeiaadaaoelaaaaaoeiaaiaaaaadabaaciia
aaaaoeiaaeaaoelaabaaaaacaaaaabiaabaapplaabaaaaacaaaaaciaacaappla
abaaaaacaaaaaeiaadaapplaaiaaaaadaaaaaiiaaaaaoeiaabaaoeiaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaappibaaaaoeia
ecaaaaadaaaaapiaaaaaoeiaadaioekaecaaaaadacaacpiaafaaoelaaaaioeka
ecaaaaadadaacpiaaaaaoelaabaioekaacaaaaadaaaaahiaaaaaoeiaacaaoeka
afaaaaadaaaachiaaaaaoeiaabaaaakaafaaaaadaaaachiaaaaaoeiaaaaaoeka
afaaaaadaaaaciiaabaappiaacaappiafiaaaaaeaaaaciiaabaappiaaaaappia
afaakkkaacaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaafaaaaadaaaaciiaadaaaaiaabaappkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcgeafaaaaeaaaaaaafjabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
pcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaaddcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
dcaaaaalpcaabaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaaegiocaaaaaaaaaaa
ajaaaaaaogbobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaa
dghjbaaaaaaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaogakbaaa
aaaaaaaadghjbaaaaaaaaaaaaagabaaaacaaaaaadiaaaaaiccaabaaaabaaaaaa
ckaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaadcaaaaapdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaa
abaaaaaaegaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaadcaaaaap
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaa
aaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaa
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaabaaaaaah
ccaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaa
abaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaafaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaadgaaaaafbcaabaaaacaaaaaadkbabaaaacaaaaaa
dgaaaaafccaabaaaacaaaaaadkbabaaaadaaaaaadgaaaaafecaabaaaacaaaaaa
dkbabaaaaeaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaiaebaaaaaaaaaaaaaa
agajbaaaacaaaaaaefaaaaajpcaabaaaabaaaaaajgahbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaadaaaaaaaaaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaa
agijcaaaaaaaaaaaaiaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agiacaaaaaaaaaaaahaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaagaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaa
aaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaa
dkiacaaaaaaaaaaaahaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
agaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}