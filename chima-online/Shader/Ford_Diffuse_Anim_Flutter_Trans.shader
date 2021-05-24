//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Animated/Diffuse Fluttering Trans" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Wind ("Wind params", Vector) = (1,1,1,1)
 _WindEdgeFlutter ("Wind edge fultter factor", Float) = 0.5
 _WindEdgeFlutterFreqScale ("Wind edge fultter freq scale", Float) = 0.5
 _BendingFactor ("Wind bending factor", Float) = 1
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_Wind]
Float 23 [_WindEdgeFlutter]
Float 24 [_WindEdgeFlutterFreqScale]
Float 25 [_BendingFactor]
Vector 26 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[29] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..26],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP4 R0.z, vertex.position, c[6];
DP4 R0.y, vertex.position, c[5];
MOV R0.x, c[24];
MAD R0.x, R0, c[13].y, R0.y;
ADD R0.y, R0.x, R0.z;
DP4 R0.z, vertex.position, c[7];
ADD R0.y, R0, R0.z;
MOV R0.x, c[0];
DP4 R0.z, R0.x, c[5];
DP3 R0.x, R0.x, c[8];
ADD R0.z, R0.y, R0;
ADD R0.w, R0.x, c[23].x;
MOV R0.y, R0.x;
DP3 R0.x, vertex.position, R0.w;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[27];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R1, R0, R1;
ADD R3.xy, R1.xzzw, R1.ywzw;
MOV R0.xyz, c[22];
DP3 R1.z, R0, c[11];
DP3 R1.x, R0, c[9];
DP3 R1.y, R0, c[10];
ADD R0.z, -vertex.color.w, c[0].x;
MUL R0.w, R0.z, c[25].x;
MUL R2.xyz, R3.y, R1;
MUL R0.xy, vertex.normal.xzzw, c[23].x;
MUL R0.xz, R0.xyyw, c[28].y;
MUL R2.xyz, R0.w, R2;
MUL R0.y, R0.w, c[28].x;
MUL R1.xyz, R0.w, R1;
RCP R1.w, c[21].w;
MAD R0.xyz, R3.xyxw, R0, R2;
MUL R1.xyz, R1, R1.w;
MUL R0.w, R0, c[22];
MAD R0.xyz, R0, R0.w, R1;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
ADD R0.xyz, vertex.position, R0;
MOV R0.w, vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[20];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
END
# 72 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
Vector 21 [_Wind]
Float 22 [_WindEdgeFlutter]
Float 23 [_WindEdgeFlutterFreqScale]
Float 24 [_BendingFactor]
Vector 25 [_MainTex_ST]
"vs_2_0
def c26, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c27, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c28, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mov r0, c4
dp4 r0.w, c26.x, r0
mov r1.xyz, c7
dp3 r1.x, c26.x, r1
mov r0.x, c12.y
dp4 r0.y, v0, c4
mad r0.y, c23.x, r0.x, r0
dp4 r0.x, v0, c5
add r0.x, r0.y, r0
dp4 r0.z, v0, c6
add r0.x, r0, r0.z
add r0.z, r0.x, r0.w
add r0.x, r1, c22
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c27
frc r0, r0
mad r0, r0, c26.y, c26.z
frc r0, r0
mad r0, r0, c26.y, c26.w
abs r0, r0
mad r1, -r0, c28.x, c28.y
mul r0, r0, r0
mul r1, r0, r1
add r3.xy, r1.xzzw, r1.ywzw
mov r0.xyz, c10
dp3 r1.z, c21, r0
mov r0.xyz, c9
dp3 r1.y, c21, r0
mov r2.xyz, c8
dp3 r1.x, c21, r2
add r0.z, -v5.w, c26.x
mul r0.w, r0.z, c24.x
mul r2.xyz, r3.y, r1
mul r0.xy, v2.xzzw, c22.x
mul r0.xz, r0.xyyw, c28.w
mul r2.xyz, r0.w, r2
mul r0.y, r0.w, c28.z
mul r1.xyz, r0.w, r1
rcp r1.w, c20.w
mad r0.xyz, r3.xyxw, r0, r2
mul r1.xyz, r1, r1.w
mul r0.w, r0, c21
mad r0.xyz, r0, r0.w, r1
mul r1.xyz, v2, c20.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
add r0.xyz, v0, r0
mov r0.w, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c26.x
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c18
dp4 r3.y, r1, c17
dp4 r3.x, r1, c16
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c19
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oD0, v5
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v3, c25, c25.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 64 [_Wind]
Float 80 [_WindEdgeFlutter]
Float 84 [_WindEdgeFlutterFreqScale]
Float 88 [_BendingFactor]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
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
eefiecedjlbppphnkjlaijkahincfaneobchpchbabaaaaaanabaaaaaaeaaaaaa
daaaaaaanmafaaaageapaaaacmbaaaaaebgpgodjkeafaaaakeafaaaaaaacpopp
deafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaa
adaaaaaaaeaaamaaaaaaaaaaadaaamaaahaabaaaaaaaaaaaadaabeaaabaabhaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkamnmmpmdpamaceldpaaaamado
mlkbefdofbaaaaafbjaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaaf
bkaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaafaaaaadaaaaahia
acaaoejabhaappkaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaalia
baaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeia
abaaaaacaaaaaiiabjaaaakaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaad
abaaaciaagaaoekaaaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaad
acaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaad
adaaaciaajaaoekaacaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaae
aaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaae
adaaahoaalaaoekaaaaappiaabaaoeiaafaaaaadaaaaahiaaaaaffjabbaaoeka
aeaaaaaeaaaaahiabaaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabcaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaappjaaaaaoeiaabaaaaac
abaaadiaacaaoekaaeaaaaaeaaaaabiaaeaaffkaabaaffiaaaaaaaiaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaabiaaaaakkiaaaaaaaiaabaaaaac
acaaabiabaaaaakaacaaaaadaaaaaciaacaaaaiabbaaaakaacaaaaadaaaaacia
aaaaffiabcaaaakaacaaaaadaaaaaciaaaaaffiabdaaaakaacaaaaadaaaaabia
aaaaffiaaaaaaaiaabaaaaacacaaabiabaaappkaabaaaaacacaaaciabbaappka
abaaaaacacaaaeiabcaappkaaiaaaaadacaaaciaacaaoeiabjaaaakaacaaaaad
aaaaaciaacaaffiaacaaaakaaiaaaaadacaaabiaaaaaoejaaaaaffiaacaaaaad
aaaaapiaaaaaaaiaacaafaiaafaaaaadaaaaapiaaaaaoeiabiaaoekabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabjaaffkabjaakkkabdaaaaac
aaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabjaaffkabjaappkacdaaaaac
aaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
aaaaoeiabkaaaakbbkaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeiaacaaaaad
aaaaadiaaaaaoniaaaaaoiiaacaaaaadaaaaaiiaafaappjbbjaaaakaafaaaaad
aaaaaiiaaaaappiaacaakkkaafaaaaadacaaaciaaaaaffiaaaaappiaabaaaaac
adaaahiaabaaoekaafaaaaadabaaaoiaadaaffiabfaajakaaeaaaaaeabaaaoia
beaajakaadaaaaiaabaaoeiaaeaaaaaeabaaaoiabgaajakaadaakkiaabaaoeia
afaaaaadadaaahiaaaaaffiaabaapjiaafaaaaadabaaaoiaaaaappiaabaaoeia
afaaaaadadaaahiaaaaappiaadaaoeiaafaaaaadaaaaaciaaaaappiaabaappka
afaaaaadaaaaaiiaabaaaaiabkaakkkaafaaaaadacaaafiaaaaappiaacaaoeja
abaaaaacaaaaaeiabkaappkaaeaaaaaeaaaaaniaaaaaceiaacaajeiaadaajeia
agaaaaacabaaabiabhaappkaafaaaaadabaaahiaabaaaaiaabaapjiaaeaaaaae
aaaaahiaaaaapiiaaaaaffiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaaaaaoeja
afaaaaadabaaapiaaaaaffiaanaaoekaaeaaaaaeabaaapiaamaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
apaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
iaajaaaaeaaaabaagaacaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
bcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaa
anaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaa
aoaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaa
apaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dgaaaaagbcaabaaaabaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakccaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaa
abaaaaaaakiacaaaaaaaaaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
aaaaaaaafgafbaaaaaaaaaaaaaaaaaahpcaabaaaaaaaaaaaagaabaaaaaaaaaaa
agafbaaaabaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaabaaaaaaegaobaia
ibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaa
egaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
aaaaaaaaigaabaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckiacaaaaaaaaaaaafaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaaeaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaoaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaiccaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaadiaaaaaiicaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
abaaaaaapgapbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagacbaaaaaaaaaaaagajbaaa
abaaaaaaagajbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
agaaaaaaogikcaaaaaaaaaaaagaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [unity_Scale]
Vector 15 [_Wind]
Float 16 [_WindEdgeFlutter]
Float 17 [_WindEdgeFlutterFreqScale]
Float 18 [_BendingFactor]
Vector 19 [unity_LightmapST]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { -0.5, 1, 2, 3 },
		state.matrix.mvp,
		program.local[5..20],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP4 R0.y, vertex.position, c[6];
DP4 R0.z, vertex.position, c[5];
MOV R0.x, c[17];
MAD R0.x, R0, c[13].y, R0.z;
ADD R0.z, R0.x, R0.y;
DP4 R0.y, vertex.position, c[7];
ADD R0.y, R0.z, R0;
MOV R0.x, c[0].y;
DP4 R0.z, R0.x, c[5];
DP3 R0.x, R0.x, c[8];
ADD R0.z, R0.y, R0;
ADD R0.w, R0.x, c[16].x;
MOV R0.y, R0.x;
DP3 R0.x, vertex.position, R0.w;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[21];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].x;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MAD R1, -R0, c[0].z, c[0].w;
MUL R0, R0, R0;
MUL R1, R0, R1;
ADD R3.xy, R1.xzzw, R1.ywzw;
MOV R0.xyz, c[15];
DP3 R1.z, R0, c[11];
DP3 R1.x, R0, c[9];
DP3 R1.y, R0, c[10];
ADD R0.z, -vertex.color.w, c[0].y;
MUL R0.w, R0.z, c[18].x;
MUL R2.xyz, R3.y, R1;
MUL R0.xy, vertex.normal.xzzw, c[16].x;
MUL R0.xz, R0.xyyw, c[22].y;
MUL R2.xyz, R0.w, R2;
MUL R0.y, R0.w, c[22].x;
MUL R1.xyz, R0.w, R1;
RCP R1.w, c[14].w;
MUL R0.w, R0, c[15];
MAD R0.xyz, R3.xyxw, R0, R2;
MUL R1.xyz, R1, R1.w;
MAD R0.xyz, R0, R0.w, R1;
MOV R0.w, vertex.position;
ADD R0.xyz, vertex.position, R0;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[19], c[19].zwzw;
END
# 51 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [unity_Scale]
Vector 14 [_Wind]
Float 15 [_WindEdgeFlutter]
Float 16 [_WindEdgeFlutterFreqScale]
Float 17 [_BendingFactor]
Vector 18 [unity_LightmapST]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c21, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c22, 2.00000000, 3.00000000, 0.30000001, 0.10000000
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0, c4
dp4 r0.w, c20.x, r0
mov r1.xyz, c7
dp3 r1.x, c20.x, r1
dp4 r0.y, v0, c4
mov r0.x, c12.y
mad r0.z, c16.x, r0.x, r0.y
dp4 r0.y, v0, c5
add r0.y, r0.z, r0
dp4 r0.x, v0, c6
add r0.x, r0.y, r0
add r0.z, r0.x, r0.w
add r0.x, r1, c15
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c21
frc r0, r0
mad r0, r0, c20.y, c20.z
frc r0, r0
mad r0, r0, c20.y, c20.w
abs r0, r0
mad r1, -r0, c22.x, c22.y
mul r0, r0, r0
mul r1, r0, r1
add r3.xy, r1.xzzw, r1.ywzw
mov r0.xyz, c10
dp3 r1.z, c14, r0
mov r0.xyz, c9
dp3 r1.y, c14, r0
mov r2.xyz, c8
dp3 r1.x, c14, r2
add r0.z, -v5.w, c20.x
mul r0.w, r0.z, c17.x
mul r2.xyz, r3.y, r1
mul r0.xy, v2.xzzw, c15.x
mul r0.xz, r0.xyyw, c22.w
mul r2.xyz, r0.w, r2
mul r0.y, r0.w, c22.z
mul r1.xyz, r0.w, r1
rcp r1.w, c13.w
mul r0.w, r0, c14
mad r0.xyz, r3.xyxw, r0, r2
mul r1.xyz, r1, r1.w
mad r0.xyz, r0, r0.w, r1
mov r0.w, v0
add r0.xyz, v0, r0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v5
mad oT0.xy, v3, c19, c19.zwzw
mad oT1.xy, v4, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 64 [_Wind]
Float 80 [_WindEdgeFlutter]
Float 84 [_WindEdgeFlutterFreqScale]
Float 88 [_BendingFactor]
Vector 96 [unity_LightmapST]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedikkegjmgfjcomlgbmcjagodlhhflbbklabaaaaaaleanaaaaaeaaaaaa
daaaaaaaniaeaaaagaamaaaacianaaaaebgpgodjkaaeaaaakaaeaaaaaaacpopp
dmaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaamaaahaaakaaaaaaaaaaacaabeaaabaabbaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbcaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafbdaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbeaaapkaaaaaaaeaaaaaeaea
mnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaaeaaoekaaeaaookaaeaaaaaeaaaaamoa
aeaabejaadaabekaadaalekaafaaaaadaaaaahiaaaaaffjaalaaoekaaeaaaaae
aaaaahiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappjaaaaaoeiaabaaaaacabaaadia
acaaoekaaeaaaaaeaaaaabiaafaaffkaabaaffiaaaaaaaiaacaaaaadaaaaabia
aaaaffiaaaaaaaiaacaaaaadaaaaabiaaaaakkiaaaaaaaiaabaaaaacacaaabia
akaaaakaacaaaaadaaaaaciaacaaaaiaalaaaakaacaaaaadaaaaaciaaaaaffia
amaaaakaacaaaaadaaaaaciaaaaaffiaanaaaakaacaaaaadaaaaabiaaaaaffia
aaaaaaiaabaaaaacacaaabiaakaappkaabaaaaacacaaaciaalaappkaabaaaaac
acaaaeiaamaappkaaiaaaaadacaaaciaacaaoeiabcaaaakaacaaaaadaaaaacia
acaaffiaacaaaakaaiaaaaadacaaabiaaaaaoejaaaaaffiaacaaaaadaaaaapia
aaaaaaiaacaafaiaafaaaaadaaaaapiaaaaaoeiabdaaoekabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabcaaffkabcaakkkabdaaaaacaaaaapia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabcaaffkabcaappkacdaaaaacaaaaapia
aaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
beaaaakbbeaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeiaacaaaaadaaaaadia
aaaaoniaaaaaoiiaacaaaaadaaaaaiiaafaappjbbcaaaakaafaaaaadaaaaaiia
aaaappiaacaakkkaafaaaaadacaaaciaaaaaffiaaaaappiaabaaaaacadaaahia
abaaoekaafaaaaadabaaaoiaadaaffiaapaajakaaeaaaaaeabaaaoiaaoaajaka
adaaaaiaabaaoeiaaeaaaaaeabaaaoiabaaajakaadaakkiaabaaoeiaafaaaaad
adaaahiaaaaaffiaabaapjiaafaaaaadabaaaoiaaaaappiaabaaoeiaafaaaaad
adaaahiaaaaappiaadaaoeiaafaaaaadaaaaaciaaaaappiaabaappkaafaaaaad
aaaaaiiaabaaaaiabeaakkkaafaaaaadacaaafiaaaaappiaacaaoejaabaaaaac
aaaaaeiabeaappkaaeaaaaaeaaaaaniaaaaaceiaacaajeiaadaajeiaagaaaaac
abaaabiabbaappkaafaaaaadabaaahiaabaaaaiaabaapjiaaeaaaaaeaaaaahia
aaaapiiaaaaaffiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaaaaaoejaafaaaaad
abaaapiaaaaaffiaahaaoekaaeaaaaaeabaaapiaagaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaapiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefciaahaaaa
eaaaabaaoaabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadfcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacaeaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaa
bkiacaaaaaaaaaaaafaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaaakiacaaaacaaaaaaanaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaacaaaaaaaoaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaacaaaaaaapaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaaabaaaaaadkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaabaaaaaadkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaabaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaakccaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaai
ccaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaaaaaaaaaafaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaahpcaabaaa
aaaaaaaaagaabaaaaaaaaaaaagafbaaaabaaaaaadiaaaaakpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaabaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaa
dcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaah
dcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaa
aaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaaaaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
aaaaaaaaaeaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaaaoaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaa
adaaaaaadiaaaaaiccaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaa
aeaaaaaadiaaaaaiicaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaabeaaaaa
mnmmmmdndiaaaaahfcaabaaaabaaaaaapgapbaaaaaaaaaaaagbcbaaaacaaaaaa
dgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaa
agacbaaaaaaaaaaaagajbaaaabaaaaaaagajbaaaadaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaa
aaaaaaaaagaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
hnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_Wind]
Float 24 [_WindEdgeFlutter]
Float 25 [_WindEdgeFlutterFreqScale]
Float 26 [_BendingFactor]
Vector 27 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[30] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..27],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP4 R0.z, vertex.position, c[6];
DP4 R0.y, vertex.position, c[5];
MOV R0.x, c[25];
MAD R0.x, R0, c[13].y, R0.y;
ADD R0.y, R0.x, R0.z;
DP4 R0.z, vertex.position, c[7];
ADD R0.y, R0, R0.z;
MOV R0.x, c[0];
DP4 R0.z, R0.x, c[5];
DP3 R0.x, R0.x, c[8];
ADD R0.z, R0.y, R0;
ADD R0.w, R0.x, c[24].x;
MOV R0.y, R0.x;
DP3 R0.x, vertex.position, R0.w;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[28];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R1, R0, R1;
ADD R3.xy, R1.xzzw, R1.ywzw;
MOV R0.xyz, c[23];
DP3 R1.z, R0, c[11];
DP3 R1.x, R0, c[9];
DP3 R1.y, R0, c[10];
ADD R0.z, -vertex.color.w, c[0].x;
MUL R0.w, R0.z, c[26].x;
MUL R2.xyz, R3.y, R1;
MUL R0.xy, vertex.normal.xzzw, c[24].x;
MUL R0.xz, R0.xyyw, c[29].y;
MUL R2.xyz, R0.w, R2;
MUL R0.y, R0.w, c[29].x;
MUL R1.xyz, R0.w, R1;
RCP R1.w, c[22].w;
MUL R1.xyz, R1, R1.w;
MAD R0.xyz, R3.xyxw, R0, R2;
MUL R0.w, R0, c[23];
MAD R0.xyz, R0, R0.w, R1;
ADD R1.xyz, vertex.position, R0;
MOV R1.w, vertex.position;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R1.xyz, vertex.normal, c[22].w;
MUL R2.xyz, R0.xyww, c[29].z;
MOV result.position, R0;
DP3 R3.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R2.w, R1, c[7];
MOV result.texcoord[3].zw, R0;
MUL R2.y, R2, c[14].x;
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
ADD result.texcoord[3].xy, R2, R2.z;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[21];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[27], c[27].zwzw;
END
# 77 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_Wind]
Float 24 [_WindEdgeFlutter]
Float 25 [_WindEdgeFlutterFreqScale]
Float 26 [_BendingFactor]
Vector 27 [_MainTex_ST]
"vs_2_0
def c28, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c29, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c30, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c31, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mov r0, c4
dp4 r0.w, c28.x, r0
mov r1.xyz, c7
dp3 r1.x, c28.x, r1
mov r0.x, c12.y
dp4 r0.y, v0, c4
mad r0.y, c25.x, r0.x, r0
dp4 r0.x, v0, c5
add r0.x, r0.y, r0
dp4 r0.z, v0, c6
add r0.x, r0, r0.z
add r0.z, r0.x, r0.w
add r0.x, r1, c24
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c29
frc r0, r0
mad r0, r0, c28.y, c28.z
frc r0, r0
mad r0, r0, c28.y, c28.w
abs r0, r0
mad r1, -r0, c30.x, c30.y
mul r0, r0, r0
mul r1, r0, r1
add r3.xy, r1.xzzw, r1.ywzw
mov r0.xyz, c10
dp3 r1.z, c23, r0
mov r0.xyz, c9
dp3 r1.y, c23, r0
mov r2.xyz, c8
dp3 r1.x, c23, r2
add r0.z, -v5.w, c28.x
mul r0.w, r0.z, c26.x
mul r2.xyz, r3.y, r1
mul r0.xy, v2.xzzw, c24.x
mul r0.xz, r0.xyyw, c30.w
mul r2.xyz, r0.w, r2
mul r0.y, r0.w, c30.z
mul r1.xyz, r0.w, r1
rcp r1.w, c22.w
mul r1.xyz, r1, r1.w
mad r0.xyz, r3.xyxw, r0, r2
mul r0.w, r0, c23
mad r0.xyz, r0, r0.w, r1
add r1.xyz, v0, r0
mov r1.w, v0
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r1.xyz, v2, c22.w
mul r2.xyz, r0.xyww, c31.x
mov oPos, r0
dp3 r3.w, r1, c5
dp3 r0.x, r1, c4
dp3 r2.w, r1, c6
mov oT3.zw, r0
mul r2.y, r2, c13.x
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mad oT3.xy, r2.z, c14.zwzw, r2
mov r0.w, c28.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c21
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oD0, v5
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v3, c27, c27.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 128 [_Wind]
Float 144 [_WindEdgeFlutter]
Float 148 [_WindEdgeFlutterFreqScale]
Float 152 [_BendingFactor]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
eefiecedcegkcgbgmnlibojendmipbghgdbjochfabaaaaaanibbaaaaaeaaaaaa
daaaaaaadeagaaaafebaaaaabmbbaaaaebgpgodjpmafaaaapmafaaaaaaacpopp
iaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaiaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaabaaafaaabaaafaaaaaaaaaa
acaacgaaahaaagaaaaaaaaaaadaaaaaaaeaaanaaaaaaaaaaadaaamaaahaabbaa
aaaaaaaaadaabeaaabaabiaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbkaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafblaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaafaaaaadaaaaahiaacaaoejabiaappkaafaaaaadabaaahiaaaaaffia
bcaaoekaaeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
bdaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabkaaaakaajaaaaadabaaabia
agaaoekaaaaaoeiaajaaaaadabaaaciaahaaoekaaaaaoeiaajaaaaadabaaaeia
aiaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabia
ajaaoekaacaaoeiaajaaaaadadaaaciaakaaoekaacaaoeiaajaaaaadadaaaeia
alaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiia
aaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaac
acaaahoaaaaaoeiaaeaaaaaeadaaahoaamaaoekaaaaappiaabaaoeiaafaaaaad
aaaaahiaaaaaffjabcaaoekaaeaaaaaeaaaaahiabbaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiabdaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabeaaoeka
aaaappjaaaaaoeiaabaaaaacabaaadiaacaaoekaaeaaaaaeaaaaabiaaeaaffka
abaaffiaaaaaaaiaacaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaabia
aaaakkiaaaaaaaiaabaaaaacacaaabiabbaaaakaacaaaaadaaaaaciaacaaaaia
bcaaaakaacaaaaadaaaaaciaaaaaffiabdaaaakaacaaaaadaaaaaciaaaaaffia
beaaaakaacaaaaadaaaaabiaaaaaffiaaaaaaaiaabaaaaacacaaabiabbaappka
abaaaaacacaaaciabcaappkaabaaaaacacaaaeiabdaappkaaiaaaaadacaaacia
acaaoeiabkaaaakaacaaaaadaaaaaciaacaaffiaacaaaakaaiaaaaadacaaabia
aaaaoejaaaaaffiaacaaaaadaaaaapiaaaaaaaiaacaafaiaafaaaaadaaaaapia
aaaaoeiabjaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
bkaaffkabkaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
bkaaffkabkaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiablaaaakbblaaffkaafaaaaadaaaaapia
aaaaoeiaacaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaacaaaaadaaaaaiia
afaappjbbkaaaakaafaaaaadaaaaaiiaaaaappiaacaakkkaafaaaaadacaaacia
aaaaffiaaaaappiaabaaaaacadaaahiaabaaoekaafaaaaadabaaaoiaadaaffia
bgaajakaaeaaaaaeabaaaoiabfaajakaadaaaaiaabaaoeiaaeaaaaaeabaaaoia
bhaajakaadaakkiaabaaoeiaafaaaaadadaaahiaaaaaffiaabaapjiaafaaaaad
abaaaoiaaaaappiaabaaoeiaafaaaaadadaaahiaaaaappiaadaaoeiaafaaaaad
aaaaaciaaaaappiaabaappkaafaaaaadaaaaaiiaabaaaaiablaakkkaafaaaaad
acaaafiaaaaappiaacaaoejaabaaaaacaaaaaeiablaappkaaeaaaaaeaaaaania
aaaaceiaacaajeiaadaajeiaagaaaaacabaaabiabiaappkaafaaaaadabaaahia
abaaaaiaabaapjiaaeaaaaaeaaaaahiaaaaapiiaaaaaffiaabaaoeiaacaaaaad
aaaaahiaaaaaoeiaaaaaoejaafaaaaadabaaapiaaaaaffiaaoaaoekaaeaaaaae
abaaapiaanaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaabia
aaaaffiaafaaaakaafaaaaadabaaaiiaabaaaaiabkaakkkbafaaaaadabaaafia
aaaapeiabkaakkkbacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoa
aaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefcbiakaaaaeaaaabaa
igacaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacafaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaalbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaabkiacaaaaaaaaaaa
ajaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaa
adaaaaaaanaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
adaaaaaaaoaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
adaaaaaaapaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagbcaabaaaabaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaabaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaa
dkiacaaaadaaaaaaaoaaaaaabaaaaaakccaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaahpcaabaaaaaaaaaaaagaabaaa
aaaaaaaaagafbaaaabaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaabaaaaaa
egaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaa
aaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaahdcaabaaaaaaaaaaa
ngafbaaaaaaaaaaaigaabaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaadkaabaaa
aaaaaaaackiacaaaaaaaaaaaajaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaa
aiaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaaiaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
aoaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaai
ccaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaadiaaaaai
icaabaaaaaaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaamnmmmmdndiaaaaah
fcaabaaaabaaaaaapgapbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaa
aaaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagacbaaaaaaaaaaa
agajbaaaabaaaaaaagajbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaa
aaaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaa
aaaaaaaaakaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [_Wind]
Float 17 [_WindEdgeFlutter]
Float 18 [_WindEdgeFlutterFreqScale]
Float 19 [_BendingFactor]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { -0.5, 1, 2, 3 },
		state.matrix.mvp,
		program.local[5..21],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
DP4 R0.y, vertex.position, c[6];
DP4 R0.z, vertex.position, c[5];
MOV R0.x, c[18];
MAD R0.x, R0, c[13].y, R0.z;
ADD R0.z, R0.x, R0.y;
DP4 R0.y, vertex.position, c[7];
ADD R0.y, R0.z, R0;
MOV R0.x, c[0].y;
DP4 R0.z, R0.x, c[5];
DP3 R0.x, R0.x, c[8];
ADD R0.z, R0.y, R0;
ADD R0.w, R0.x, c[17].x;
MOV R0.y, R0.x;
DP3 R0.x, vertex.position, R0.w;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[22];
FRC R0, R0;
MAD R0, R0, c[0].z, c[0].x;
FRC R0, R0;
MAD R0, R0, c[0].z, -c[0].y;
ABS R0, R0;
MAD R1, -R0, c[0].z, c[0].w;
MUL R0, R0, R0;
MUL R1, R0, R1;
ADD R3.xy, R1.xzzw, R1.ywzw;
MOV R0.xyz, c[16];
DP3 R1.z, R0, c[11];
DP3 R1.x, R0, c[9];
DP3 R1.y, R0, c[10];
ADD R0.z, -vertex.color.w, c[0].y;
MUL R0.w, R0.z, c[19].x;
MUL R2.xyz, R3.y, R1;
MUL R0.xy, vertex.normal.xzzw, c[17].x;
MUL R0.xz, R0.xyyw, c[23].y;
MUL R2.xyz, R0.w, R2;
MUL R0.y, R0.w, c[23].x;
MUL R1.xyz, R0.w, R1;
RCP R1.w, c[15].w;
MUL R1.xyz, R1, R1.w;
MOV R1.w, vertex.position;
MAD R0.xyz, R3.xyxw, R0, R2;
MUL R0.w, R0, c[16];
MAD R0.xyz, R0, R0.w, R1;
ADD R1.xyz, vertex.position, R0;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[23].z;
MUL R2.y, R2, c[14].x;
ADD result.texcoord[2].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[20], c[20].zwzw;
END
# 56 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [_Wind]
Float 17 [_WindEdgeFlutter]
Float 18 [_WindEdgeFlutterFreqScale]
Float 19 [_BendingFactor]
Vector 20 [unity_LightmapST]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c23, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c24, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c25, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0, c4
dp4 r0.w, c22.x, r0
mov r1.xyz, c7
dp3 r1.x, c22.x, r1
dp4 r0.y, v0, c4
mov r0.x, c12.y
mad r0.z, c18.x, r0.x, r0.y
dp4 r0.y, v0, c5
add r0.y, r0.z, r0
dp4 r0.x, v0, c6
add r0.x, r0.y, r0
add r0.z, r0.x, r0.w
add r0.x, r1, c17
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c23
frc r0, r0
mad r0, r0, c22.y, c22.z
frc r0, r0
mad r0, r0, c22.y, c22.w
abs r0, r0
mad r1, -r0, c24.x, c24.y
mul r0, r0, r0
mul r1, r0, r1
add r3.xy, r1.xzzw, r1.ywzw
mov r0.xyz, c10
dp3 r1.z, c16, r0
mov r0.xyz, c9
dp3 r1.y, c16, r0
mov r2.xyz, c8
dp3 r1.x, c16, r2
add r0.z, -v5.w, c22.x
mul r0.w, r0.z, c19.x
mul r2.xyz, r3.y, r1
mul r0.xy, v2.xzzw, c17.x
mul r0.xz, r0.xyyw, c24.w
mul r2.xyz, r0.w, r2
mul r0.y, r0.w, c24.z
mul r1.xyz, r0.w, r1
rcp r1.w, c15.w
mul r1.xyz, r1, r1.w
mov r1.w, v0
mad r0.xyz, r3.xyxw, r0, r2
mul r0.w, r0, c16
mad r0.xyz, r0, r0.w, r1
add r1.xyz, v0, r0
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c25.x
mul r2.y, r2, c13.x
mad oT2.xy, r2.z, c14.zwzw, r2
mov oPos, r0
mov oT2.zw, r0
mov oD0, v5
mad oT0.xy, v3, c21, c21.zwzw
mad oT1.xy, v4, c20, c20.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 128 [_Wind]
Float 144 [_WindEdgeFlutter]
Float 148 [_WindEdgeFlutterFreqScale]
Float 152 [_BendingFactor]
Vector 160 [unity_LightmapST]
Vector 176 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedeinpcnielafaappaggnbmacoiglofccfabaaaaaalmaoaaaaaeaaaaaa
daaaaaaadaafaaaafaanaaaabiaoaaaaebgpgodjpiaeaaaapiaeaaaaaaacpopp
iiaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaiaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaahaaalaaaaaaaaaaacaabeaaabaabcaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbdaaapkaaaaaiadpaaaaaaeaaaaaaalp
aaaaialpfbaaaaafbeaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
bfaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdobpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaaeaaoeka
aeaaookaaeaaaaaeaaaaamoaaeaabejaadaabekaadaalekaafaaaaadaaaaahia
aaaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappja
aaaaoeiaabaaaaacabaaadiaacaaoekaaeaaaaaeaaaaabiaafaaffkaabaaffia
aaaaaaiaacaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaabiaaaaakkia
aaaaaaiaabaaaaacacaaabiaalaaaakaacaaaaadaaaaaciaacaaaaiaamaaaaka
acaaaaadaaaaaciaaaaaffiaanaaaakaacaaaaadaaaaaciaaaaaffiaaoaaaaka
acaaaaadaaaaabiaaaaaffiaaaaaaaiaabaaaaacacaaabiaalaappkaabaaaaac
acaaaciaamaappkaabaaaaacacaaaeiaanaappkaaiaaaaadacaaaciaacaaoeia
bdaaaakaacaaaaadaaaaaciaacaaffiaacaaaakaaiaaaaadacaaabiaaaaaoeja
aaaaffiaacaaaaadaaaaapiaaaaaaaiaacaafaiaafaaaaadaaaaapiaaaaaoeia
beaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabdaaffka
bdaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiabdaaffka
bdaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiabfaaaakbbfaaffkaafaaaaadaaaaapiaaaaaoeia
acaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaacaaaaadaaaaaiiaafaappjb
bdaaaakaafaaaaadaaaaaiiaaaaappiaacaakkkaafaaaaadacaaaciaaaaaffia
aaaappiaabaaaaacadaaahiaabaaoekaafaaaaadabaaaoiaadaaffiabaaajaka
aeaaaaaeabaaaoiaapaajakaadaaaaiaabaaoeiaaeaaaaaeabaaaoiabbaajaka
adaakkiaabaaoeiaafaaaaadadaaahiaaaaaffiaabaapjiaafaaaaadabaaaoia
aaaappiaabaaoeiaafaaaaadadaaahiaaaaappiaadaaoeiaafaaaaadaaaaacia
aaaappiaabaappkaafaaaaadaaaaaiiaabaaaaiabfaakkkaafaaaaadacaaafia
aaaappiaacaaoejaabaaaaacaaaaaeiabfaappkaaeaaaaaeaaaaaniaaaaaceia
acaajeiaadaajeiaagaaaaacabaaabiabcaappkaafaaaaadabaaahiaabaaaaia
abaapjiaaeaaaaaeaaaaahiaaaaapiiaaaaaffiaabaaoeiaacaaaaadaaaaahia
aaaaoeiaaaaaoejaafaaaaadabaaapiaaaaaffiaaiaaoekaaeaaaaaeabaaapia
ahaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabdaakkkbafaaaaadabaaafiaaaaapeia
bdaakkkbacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefcbiaiaaaaeaaaabaaagacaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
fcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacaeaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaabkiacaaaabaaaaaa
aaaaaaaabkiacaaaaaaaaaaaajaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
ckaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaaa
acaaaaaaamaaaaaaakiacaaaacaaaaaaanaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaacaaaaaaapaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaaabaaaaaadkiacaaa
acaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaadkiacaaaacaaaaaaanaaaaaa
dgaaaaagecaabaaaabaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaakccaabaaa
abaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaaaaaaaaaajaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaah
pcaabaaaaaaaaaaaagaabaaaaaaaaaaaagafbaaaabaaaaaadiaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaabaaaaaaegaobaiaibaaaaaaaaaaaaaaegaobaiaibaaaaaa
aaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaiambaaaaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
aaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaaigaabaaaaaaaaaaaaaaaaaai
icaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaaaaaaaaaaiaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaaaaaaaaaaiaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaaaaaaaaaaiaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaaaoaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaaaaaaaaa
egacbaaaadaaaaaadiaaaaaiccaabaaaaaaaaaaadkaabaaaaaaaaaaadkiacaaa
aaaaaaaaaiaaaaaadiaaaaaiicaabaaaaaaaaaaaakiacaaaaaaaaaaaajaaaaaa
abeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaapgapbaaaaaaaaaaaagbcbaaa
acaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaa
aaaaaaaaagacbaaaaaaaaaaaagajbaaaabaaaaaaagajbaaaadaaaaaadcaaaaaj
hcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
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
Vector 30 [_Wind]
Float 31 [_WindEdgeFlutter]
Float 32 [_WindEdgeFlutterFreqScale]
Float 33 [_BendingFactor]
Vector 34 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[37] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..34],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MUL R6.xyz, vertex.normal, c[29].w;
DP3 R6.w, R6, c[6];
DP3 R7.x, R6, c[5];
MUL R2.zw, vertex.normal.xyxz, c[31].x;
MUL R3.xz, R2.zyww, c[36].y;
MOV R7.y, R6.w;
MOV R7.w, c[0].x;
DP4 R0.z, vertex.position, c[6];
DP4 R0.y, vertex.position, c[5];
MOV R0.x, c[32];
MAD R0.x, R0, c[13].y, R0.y;
ADD R0.x, R0, R0.z;
MOV R0.z, c[0].x;
DP4 R0.y, vertex.position, c[7];
ADD R0.x, R0, R0.y;
DP3 R0.w, R0.z, c[8];
DP4 R0.y, R0.z, c[5];
ADD R0.z, R0.x, R0.y;
ADD R0.x, R0.w, c[31];
MOV R0.y, R0.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[35];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R1, R0;
MAD R0, -R1, c[0].y, c[0].w;
MUL R1, R1, R1;
MUL R0, R1, R0;
ADD R2.xy, R0.xzzw, R0.ywzw;
MOV R1.xyz, c[30];
ADD R0.w, -vertex.color, c[0].x;
MUL R0.w, R0, c[33].x;
DP3 R0.z, R1, c[11];
DP3 R0.x, R1, c[9];
DP3 R0.y, R1, c[10];
MUL R1.xyz, R2.y, R0;
MUL R0.xyz, R0.w, R0;
MUL R3.y, R0.w, c[36].x;
MUL R1.xyz, R0.w, R1;
MAD R1.xyz, R2.xyxw, R3, R1;
RCP R1.w, c[29].w;
MUL R2.xyz, R0, R1.w;
MUL R0.x, R0.w, c[30].w;
MAD R0.xyz, R1, R0.x, R2;
ADD R1.xyz, vertex.position, R0;
MOV R1.w, vertex.position;
DP4 R0.x, R1, c[6];
ADD R3, -R0.x, c[15];
MUL R0, R3, R3;
DP4 R2.x, R1, c[5];
ADD R2, -R2.x, c[14];
MAD R4, R2, R2, R0;
DP4 R5.x, R1, c[7];
ADD R0, -R5.x, c[16];
MAD R4, R0, R0, R4;
MUL R3, R6.w, R3;
MAD R2, R7.x, R2, R3;
DP3 R3.x, R6, c[7];
MAD R0, R3.x, R0, R2;
MUL R5, R4, c[17];
MOV R7.z, R3.x;
RSQ R2.x, R4.x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[36].z;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[19];
MAD R2.xyz, R0.x, c[18], R2;
MAD R0.xyz, R0.z, c[20], R2;
MAD R2.xyz, R0.w, c[21], R0;
MUL R0, R7.xyzz, R7.yzzx;
MUL R2.w, R6, R6;
DP4 R5.z, R0, c[27];
DP4 R5.y, R0, c[26];
DP4 R5.x, R0, c[25];
MAD R2.w, R7.x, R7.x, -R2;
DP4 R4.z, R7, c[24];
DP4 R4.y, R7, c[23];
DP4 R4.x, R7, c[22];
MUL R0.xyz, R2.w, c[28];
ADD R4.xyz, R4, R5;
ADD R0.xyz, R4, R0;
ADD result.texcoord[2].xyz, R0, R2;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 102 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [unity_4LightPosX0]
Vector 14 [unity_4LightPosY0]
Vector 15 [unity_4LightPosZ0]
Vector 16 [unity_4LightAtten0]
Vector 17 [unity_LightColor0]
Vector 18 [unity_LightColor1]
Vector 19 [unity_LightColor2]
Vector 20 [unity_LightColor3]
Vector 21 [unity_SHAr]
Vector 22 [unity_SHAg]
Vector 23 [unity_SHAb]
Vector 24 [unity_SHBr]
Vector 25 [unity_SHBg]
Vector 26 [unity_SHBb]
Vector 27 [unity_SHC]
Vector 28 [unity_Scale]
Vector 29 [_Wind]
Float 30 [_WindEdgeFlutter]
Float 31 [_WindEdgeFlutterFreqScale]
Float 32 [_BendingFactor]
Vector 33 [_MainTex_ST]
"vs_2_0
def c34, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c35, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c36, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c37, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r6.xyz, v2, c28.w
dp3 r6.w, r6, c5
dp3 r7.x, r6, c4
mov r0, c4
dp4 r0.w, c34.x, r0
mov r1.xyz, c7
mov r7.y, r6.w
dp3 r1.x, c34.x, r1
mov r3.xyz, c8
mul r2.zw, v2.xyxz, c30.x
mov r7.w, c34.x
dp4 r0.y, v0, c4
mov r0.x, c12.y
mad r0.x, c31, r0, r0.y
dp4 r0.y, v0, c5
add r0.x, r0, r0.y
dp4 r0.z, v0, c6
add r0.x, r0, r0.z
add r0.z, r0.x, r0.w
add r0.x, r1, c30
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c35
frc r0, r0
mad r0, r0, c34.y, c34.z
frc r0, r0
mad r0, r0, c34.y, c34.w
abs r1, r0
mad r0, -r1, c36.x, c36.y
mul r1, r1, r1
mul r0, r1, r0
add r2.xy, r0.xzzw, r0.ywzw
dp3 r0.x, c29, r3
mov r1.xyz, c10
dp3 r0.z, c29, r1
mov r1.xyz, c9
dp3 r0.y, c29, r1
add r0.w, -v5, c34.x
mul r0.w, r0, c32.x
mul r1.xyz, r2.y, r0
mul r0.xyz, r0.w, r0
mul r3.xz, r2.zyww, c36.w
mul r3.y, r0.w, c36.z
mul r1.xyz, r0.w, r1
mad r1.xyz, r2.xyxw, r3, r1
rcp r1.w, c28.w
mul r2.xyz, r0, r1.w
mul r0.x, r0.w, c29.w
mad r0.xyz, r1, r0.x, r2
add r1.xyz, v0, r0
mov r1.w, v0
dp4 r0.x, r1, c5
add r3, -r0.x, c14
mul r0, r3, r3
dp4 r2.x, r1, c4
add r2, -r2.x, c13
mad r4, r2, r2, r0
dp4 r5.x, r1, c6
add r0, -r5.x, c15
mad r4, r0, r0, r4
mul r3, r6.w, r3
mad r2, r7.x, r2, r3
dp3 r3.x, r6, c6
mad r0, r3.x, r0, r2
mul r5, r4, c16
mov r7.z, r3.x
rsq r2.x, r4.x
rsq r2.y, r4.y
rsq r2.z, r4.z
rsq r2.w, r4.w
mul r0, r0, r2
add r2, r5, c34.x
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c37.x
mul r0, r0, r2
mul r2.xyz, r0.y, c18
mad r2.xyz, r0.x, c17, r2
mad r0.xyz, r0.z, c19, r2
mad r2.xyz, r0.w, c20, r0
mul r0, r7.xyzz, r7.yzzx
mul r2.w, r6, r6
dp4 r5.z, r0, c26
dp4 r5.y, r0, c25
dp4 r5.x, r0, c24
mad r2.w, r7.x, r7.x, -r2
dp4 r4.z, r7, c23
dp4 r4.y, r7, c22
dp4 r4.x, r7, c21
mul r0.xyz, r2.w, c27
add r4.xyz, r4, r5
add r0.xyz, r4, r0
add oT2.xyz, r0, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
mov oT1.z, r3.x
mov oT1.y, r6.w
mov oT1.x, r7
mad oT0.xy, v3, c33, c33.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 64 [_Wind]
Float 80 [_WindEdgeFlutter]
Float 84 [_WindEdgeFlutterFreqScale]
Float 88 [_BendingFactor]
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
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
eefiecedhmeoebmabjaldddlgjccajkgjlmffkmeabaaaaaadmbgaaaaaeaaaaaa
daaaaaaapiahaaaanabeaaaajibfaaaaebgpgodjmaahaaaamaahaaaaaaacpopp
eeahaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaacaaaiaaafaaaaaaaaaa
acaacgaaahaaanaaaaaaaaaaadaaaaaaaeaabeaaaaaaaaaaadaaamaaahaabiaa
aaaaaaaaadaabeaaabaabpaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafcaaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafcbaaapkaaaaaiadpaaaaaaea
aaaaaalpaaaaialpfbaaaaafccaaapkaaaaaaaeaaaaaeaeamnmmmmdnjkjjjjdo
fbaaaaafcdaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaafaaaaad
aaaaahiaaaaaffjabjaaoekaaeaaaaaeaaaaahiabiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiabkaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiablaaoeka
aaaappjaaaaaoeiaabaaaaacabaaadiaacaaoekaaeaaaaaeaaaaabiaaeaaffka
abaaffiaaaaaaaiaacaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaabia
aaaakkiaaaaaaaiaabaaaaacacaaabiabiaaaakaacaaaaadaaaaaciaacaaaaia
bjaaaakaacaaaaadaaaaaciaaaaaffiabkaaaakaacaaaaadaaaaaciaaaaaffia
blaaaakaacaaaaadaaaaabiaaaaaffiaaaaaaaiaabaaaaacacaaabiabiaappka
abaaaaacacaaaciabjaappkaabaaaaacacaaaeiabkaappkaaiaaaaadacaaacia
acaaoeiacbaaaakaacaaaaadaaaaaciaacaaffiaacaaaakaaiaaaaadacaaabia
aaaaoejaaaaaffiaacaaaaadaaaaapiaaaaaaaiaacaafaiaafaaaaadaaaaapia
aaaaoeiacaaaoekabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
cbaaffkacbaakkkabdaaaaacaaaaapiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeia
cbaaffkacbaappkacdaaaaacaaaaapiaaaaaoeiaafaaaaadacaaapiaaaaaoeia
aaaaoeiaaeaaaaaeaaaaapiaaaaaoeiaccaaaakbccaaffkaafaaaaadaaaaapia
aaaaoeiaacaaoeiaacaaaaadaaaaadiaaaaaoniaaaaaoiiaacaaaaadaaaaaiia
afaappjbcbaaaakaafaaaaadaaaaaiiaaaaappiaacaakkkaafaaaaadacaaacia
aaaaffiaaaaappiaabaaaaacadaaahiaabaaoekaafaaaaadabaaaoiaadaaffia
bnaajakaaeaaaaaeabaaaoiabmaajakaadaaaaiaabaaoeiaaeaaaaaeabaaaoia
boaajakaadaakkiaabaaoeiaafaaaaadadaaahiaaaaaffiaabaapjiaafaaaaad
abaaaoiaaaaappiaabaaoeiaafaaaaadadaaahiaaaaappiaadaaoeiaafaaaaad
aaaaaciaaaaappiaabaappkaafaaaaadaaaaaiiaabaaaaiaccaakkkaafaaaaad
acaaafiaaaaappiaacaaoejaabaaaaacaaaaaeiaccaappkaaeaaaaaeaaaaania
aaaaceiaacaajeiaadaajeiaagaaaaacabaaabiabpaappkaafaaaaadabaaahia
abaaaaiaabaapjiaaeaaaaaeaaaaahiaaaaapiiaaaaaffiaabaaoeiaacaaaaad
aaaaahiaaaaaoeiaaaaaoejaafaaaaadabaaahiaaaaaffiabjaaoekaaeaaaaae
abaaahiabiaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiabkaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaahiablaaoekaaaaappjaabaaoeiaacaaaaadacaaapia
abaaffibagaaoekaafaaaaadadaaapiaacaaoeiaacaaoeiaacaaaaadaeaaapia
abaaaaibafaaoekaacaaaaadabaaapiaabaakkibahaaoekaaeaaaaaeadaaapia
aeaaoeiaaeaaoeiaadaaoeiaaeaaaaaeadaaapiaabaaoeiaabaaoeiaadaaoeia
ahaaaaacafaaabiaadaaaaiaahaaaaacafaaaciaadaaffiaahaaaaacafaaaeia
adaakkiaahaaaaacafaaaiiaadaappiaabaaaaacagaaabiacbaaaakaaeaaaaae
adaaapiaadaaoeiaaiaaoekaagaaaaiaafaaaaadagaaahiaacaaoejabpaappka
afaaaaadahaaahiaagaaffiabjaaoekaaeaaaaaeagaaaliabiaakekaagaaaaia
ahaakeiaaeaaaaaeagaaahiabkaaoekaagaakkiaagaapeiaafaaaaadacaaapia
acaaoeiaagaaffiaaeaaaaaeacaaapiaaeaaoeiaagaaaaiaacaaoeiaaeaaaaae
abaaapiaabaaoeiaagaakkiaacaaoeiaafaaaaadabaaapiaafaaoeiaabaaoeia
alaaaaadabaaapiaabaaoeiacdaaaakaagaaaaacacaaabiaadaaaaiaagaaaaac
acaaaciaadaaffiaagaaaaacacaaaeiaadaakkiaagaaaaacacaaaiiaadaappia
afaaaaadabaaapiaabaaoeiaacaaoeiaafaaaaadacaaahiaabaaffiaakaaoeka
aeaaaaaeacaaahiaajaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahiaalaaoeka
abaakkiaacaaoeiaaeaaaaaeabaaahiaamaaoekaabaappiaabaaoeiaabaaaaac
agaaaiiacbaaaakaajaaaaadacaaabiaanaaoekaagaaoeiaajaaaaadacaaacia
aoaaoekaagaaoeiaajaaaaadacaaaeiaapaaoekaagaaoeiaafaaaaadadaaapia
agaacjiaagaakeiaajaaaaadaeaaabiabaaaoekaadaaoeiaajaaaaadaeaaacia
bbaaoekaadaaoeiaajaaaaadaeaaaeiabcaaoekaadaaoeiaacaaaaadacaaahia
acaaoeiaaeaaoeiaafaaaaadaaaaaiiaagaaffiaagaaffiaaeaaaaaeaaaaaiia
agaaaaiaagaaaaiaaaaappibabaaaaacacaaahoaagaaoeiaaeaaaaaeacaaahia
bdaaoekaaaaappiaacaaoeiaacaaaaadadaaahoaabaaoeiaacaaoeiaafaaaaad
abaaapiaaaaaffiabfaaoekaaeaaaaaeabaaapiabeaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaapiabgaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiabhaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefcnaamaaaa
eaaaabaadeadaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaalbcaabaaa
aaaaaaaabkiacaaaabaaaaaaaaaaaaaabkiacaaaaaaaaaaaafaaaaaaakaabaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaa
aaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaa
aaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaag
bcaabaaaabaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaabaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakccaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaabaaaaaa
akiacaaaaaaaaaaaafaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaaaaaaaa
fgafbaaaaaaaaaaaaaaaaaahpcaabaaaaaaaaaaaagaabaaaaaaaaaaaagafbaaa
abaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaabaaaaaaegaobaiaibaaaaaa
aaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaaegaobaia
mbaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaabaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaaaaaaaaaa
igaabaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaa
abeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaackiacaaa
aaaaaaaaafaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaaeaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaoaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaiccaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkiacaaaaaaaaaaaaeaaaaaadiaaaaaiicaabaaaaaaaaaaa
akiacaaaaaaaaaaaafaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaaabaaaaaa
pgapbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaaabeaaaaa
jkjjjjdodcaaaaajncaabaaaaaaaaaaaagacbaaaaaaaaaaaagajbaaaabaaaaaa
agajbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajpcaabaaaadaaaaaa
agaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
aeaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaaj
pcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaa
diaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaah
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaa
adaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaaaaaaaaadcaaaaan
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_ProjectionParams]
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
Vector 31 [_Wind]
Float 32 [_WindEdgeFlutter]
Float 33 [_WindEdgeFlutterFreqScale]
Float 34 [_BendingFactor]
Vector 35 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[38] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..35],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MUL R6.xyz, vertex.normal, c[30].w;
DP3 R6.w, R6, c[6];
DP3 R7.x, R6, c[5];
MUL R2.zw, vertex.normal.xyxz, c[32].x;
MUL R3.xz, R2.zyww, c[37].y;
MOV R7.y, R6.w;
MOV R7.w, c[0].x;
DP4 R0.z, vertex.position, c[6];
DP4 R0.y, vertex.position, c[5];
MOV R0.x, c[33];
MAD R0.x, R0, c[13].y, R0.y;
ADD R0.x, R0, R0.z;
MOV R0.z, c[0].x;
DP4 R0.y, vertex.position, c[7];
ADD R0.x, R0, R0.y;
DP3 R0.w, R0.z, c[8];
DP4 R0.y, R0.z, c[5];
ADD R0.z, R0.x, R0.y;
ADD R0.x, R0.w, c[32];
MOV R0.y, R0.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[36];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R1, R0;
MAD R0, -R1, c[0].y, c[0].w;
MUL R1, R1, R1;
MUL R0, R1, R0;
ADD R2.xy, R0.xzzw, R0.ywzw;
MOV R1.xyz, c[31];
ADD R0.w, -vertex.color, c[0].x;
MUL R0.w, R0, c[34].x;
DP3 R0.z, R1, c[11];
DP3 R0.x, R1, c[9];
DP3 R0.y, R1, c[10];
MUL R1.xyz, R2.y, R0;
MUL R0.xyz, R0.w, R0;
MUL R3.y, R0.w, c[37].x;
MUL R1.xyz, R0.w, R1;
MAD R1.xyz, R2.xyxw, R3, R1;
RCP R1.w, c[30].w;
MUL R2.xyz, R0, R1.w;
MUL R0.x, R0.w, c[31].w;
MAD R0.xyz, R1, R0.x, R2;
ADD R1.xyz, vertex.position, R0;
MOV R1.w, vertex.position;
DP4 R0.x, R1, c[6];
ADD R3, -R0.x, c[16];
MUL R0, R3, R3;
DP4 R2.x, R1, c[5];
ADD R2, -R2.x, c[15];
MUL R3, R6.w, R3;
MAD R4, R2, R2, R0;
MAD R2, R7.x, R2, R3;
DP3 R3.w, R6, c[7];
DP4 R5.x, R1, c[7];
ADD R0, -R5.x, c[17];
MAD R4, R0, R0, R4;
MAD R0, R3.w, R0, R2;
MUL R5, R4, c[18];
MOV R7.z, R3.w;
RSQ R2.x, R4.x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[37].z;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[20];
MAD R2.xyz, R0.x, c[19], R2;
MAD R0.xyz, R0.z, c[21], R2;
MAD R4.xyz, R0.w, c[22], R0;
MUL R0, R7.xyzz, R7.yzzx;
MUL R2.z, R6.w, R6.w;
DP4 R2.w, R1, c[4];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[37].w;
DP4 R6.z, R0, c[28];
DP4 R6.y, R0, c[27];
MAD R2.z, R7.x, R7.x, -R2;
DP4 R6.x, R0, c[26];
MUL R0.xyz, R2.z, c[29];
DP4 R2.z, R1, c[3];
DP4 R5.z, R7, c[25];
DP4 R5.y, R7, c[24];
DP4 R5.x, R7, c[23];
ADD R5.xyz, R5, R6;
ADD R0.xyz, R5, R0;
ADD result.texcoord[2].xyz, R0, R4;
MOV R0.x, R3;
MUL R0.y, R3, c[14].x;
ADD result.texcoord[3].xy, R0, R3.z;
MOV result.position, R2;
MOV result.texcoord[3].zw, R2;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[35], c[35].zwzw;
END
# 108 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
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
Vector 31 [_Wind]
Float 32 [_WindEdgeFlutter]
Float 33 [_WindEdgeFlutterFreqScale]
Float 34 [_BendingFactor]
Vector 35 [_MainTex_ST]
"vs_2_0
def c36, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c37, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c38, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c39, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r6.xyz, v2, c30.w
dp3 r6.w, r6, c5
dp3 r7.x, r6, c4
mov r0, c4
dp4 r0.w, c36.x, r0
mov r1.xyz, c7
mov r7.y, r6.w
dp3 r1.x, c36.x, r1
mov r3.xyz, c8
mul r2.zw, v2.xyxz, c32.x
mov r7.w, c36.x
dp4 r0.y, v0, c4
mov r0.x, c12.y
mad r0.x, c33, r0, r0.y
dp4 r0.y, v0, c5
add r0.x, r0, r0.y
dp4 r0.z, v0, c6
add r0.x, r0, r0.z
add r0.z, r0.x, r0.w
add r0.x, r1, c32
mov r0.y, r1.x
dp3 r0.x, v0, r0.x
add r0.xy, r0.z, r0
mul r0, r0.xxyy, c37
frc r0, r0
mad r0, r0, c36.y, c36.z
frc r0, r0
mad r0, r0, c36.y, c36.w
abs r1, r0
mad r0, -r1, c38.x, c38.y
mul r1, r1, r1
mul r0, r1, r0
add r2.xy, r0.xzzw, r0.ywzw
dp3 r0.x, c31, r3
mov r1.xyz, c10
dp3 r0.z, c31, r1
mov r1.xyz, c9
dp3 r0.y, c31, r1
add r0.w, -v5, c36.x
mul r0.w, r0, c34.x
mul r1.xyz, r2.y, r0
mul r0.xyz, r0.w, r0
mul r3.xz, r2.zyww, c38.w
mul r3.y, r0.w, c38.z
mul r1.xyz, r0.w, r1
mad r1.xyz, r2.xyxw, r3, r1
rcp r1.w, c30.w
mul r2.xyz, r0, r1.w
mul r0.x, r0.w, c31.w
mad r0.xyz, r1, r0.x, r2
add r1.xyz, v0, r0
mov r1.w, v0
dp4 r0.x, r1, c5
add r3, -r0.x, c16
mul r0, r3, r3
dp4 r2.x, r1, c4
add r2, -r2.x, c15
mul r3, r6.w, r3
mad r4, r2, r2, r0
mad r2, r7.x, r2, r3
dp3 r3.w, r6, c6
dp4 r5.x, r1, c6
add r0, -r5.x, c17
mad r4, r0, r0, r4
mad r0, r3.w, r0, r2
mul r5, r4, c18
mov r7.z, r3.w
rsq r2.x, r4.x
rsq r2.y, r4.y
rsq r2.z, r4.z
rsq r2.w, r4.w
mul r0, r0, r2
add r2, r5, c36.x
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c39.x
mul r0, r0, r2
mul r2.xyz, r0.y, c20
mad r2.xyz, r0.x, c19, r2
mad r0.xyz, r0.z, c21, r2
mad r4.xyz, r0.w, c22, r0
mul r0, r7.xyzz, r7.yzzx
mul r2.z, r6.w, r6.w
dp4 r2.w, r1, c3
dp4 r2.x, r1, c0
dp4 r2.y, r1, c1
mul r3.xyz, r2.xyww, c39.y
dp4 r6.z, r0, c28
dp4 r6.y, r0, c27
mad r2.z, r7.x, r7.x, -r2
dp4 r6.x, r0, c26
mul r0.xyz, r2.z, c29
dp4 r2.z, r1, c2
dp4 r5.z, r7, c25
dp4 r5.y, r7, c24
dp4 r5.x, r7, c23
add r5.xyz, r5, r6
add r0.xyz, r5, r0
add oT2.xyz, r0, r4
mov r0.x, r3
mul r0.y, r3, c13.x
mad oT3.xy, r3.z, c14.zwzw, r0
mov oPos, r2
mov oT3.zw, r2
mov oD0, v5
mov oT1.z, r3.w
mov oT1.y, r6.w
mov oT1.x, r7
mad oT0.xy, v3, c35, c35.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 128 [_Wind]
Float 144 [_WindEdgeFlutter]
Float 148 [_WindEdgeFlutterFreqScale]
Float 152 [_BendingFactor]
Vector 160 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
eefiecedjpaogedaplkbfafflpheiajlckkficgcabaaaaaagabhaaaaaeaaaaaa
daaaaaaafaaiaaaanmbfaaaakebgaaaaebgpgodjbiaiaaaabiaiaaaaaaacpopp
jaahaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaaiaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaabaaafaaabaaafaaaaaaaaaa
acaaacaaaiaaagaaaaaaaaaaacaacgaaahaaaoaaaaaaaaaaadaaaaaaaeaabfaa
aaaaaaaaadaaamaaahaabjaaaaaaaaaaadaabeaaabaacaaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafcbaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
ccaaapkaaaaaiadpaaaaaaeaaaaaaalpaaaaialpfbaaaaafcdaaapkaaaaaaaea
aaaaeaeamnmmmmdnjkjjjjdofbaaaaafceaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
adaaoekaadaaookaafaaaaadaaaaahiaaaaaffjabkaaoekaaeaaaaaeaaaaahia
bjaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabmaaoekaaaaappjaaaaaoeiaabaaaaacabaaadiaacaaoeka
aeaaaaaeaaaaabiaaeaaffkaabaaffiaaaaaaaiaacaaaaadaaaaabiaaaaaffia
aaaaaaiaacaaaaadaaaaabiaaaaakkiaaaaaaaiaabaaaaacacaaabiabjaaaaka
acaaaaadaaaaaciaacaaaaiabkaaaakaacaaaaadaaaaaciaaaaaffiablaaaaka
acaaaaadaaaaaciaaaaaffiabmaaaakaacaaaaadaaaaabiaaaaaffiaaaaaaaia
abaaaaacacaaabiabjaappkaabaaaaacacaaaciabkaappkaabaaaaacacaaaeia
blaappkaaiaaaaadacaaaciaacaaoeiaccaaaakaacaaaaadaaaaaciaacaaffia
acaaaakaaiaaaaadacaaabiaaaaaoejaaaaaffiaacaaaaadaaaaapiaaaaaaaia
acaafaiaafaaaaadaaaaapiaaaaaoeiacbaaoekabdaaaaacaaaaapiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiaccaaffkaccaakkkabdaaaaacaaaaapiaaaaaoeia
aeaaaaaeaaaaapiaaaaaoeiaccaaffkaccaappkacdaaaaacaaaaapiaaaaaoeia
afaaaaadacaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaaaaaoeiacdaaaakb
cdaaffkaafaaaaadaaaaapiaaaaaoeiaacaaoeiaacaaaaadaaaaadiaaaaaonia
aaaaoiiaacaaaaadaaaaaiiaafaappjbccaaaakaafaaaaadaaaaaiiaaaaappia
acaakkkaafaaaaadacaaaciaaaaaffiaaaaappiaabaaaaacadaaahiaabaaoeka
afaaaaadabaaaoiaadaaffiaboaajakaaeaaaaaeabaaaoiabnaajakaadaaaaia
abaaoeiaaeaaaaaeabaaaoiabpaajakaadaakkiaabaaoeiaafaaaaadadaaahia
aaaaffiaabaapjiaafaaaaadabaaaoiaaaaappiaabaaoeiaafaaaaadadaaahia
aaaappiaadaaoeiaafaaaaadaaaaaciaaaaappiaabaappkaafaaaaadaaaaaiia
abaaaaiacdaakkkaafaaaaadacaaafiaaaaappiaacaaoejaabaaaaacaaaaaeia
cdaappkaaeaaaaaeaaaaaniaaaaaceiaacaajeiaadaajeiaagaaaaacabaaabia
caaappkaafaaaaadabaaahiaabaaaaiaabaapjiaaeaaaaaeaaaaahiaaaaapiia
aaaaffiaabaaoeiaacaaaaadaaaaahiaaaaaoeiaaaaaoejaafaaaaadabaaahia
aaaaffiabkaaoekaaeaaaaaeabaaahiabjaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaahiablaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiabmaaoekaaaaappja
abaaoeiaacaaaaadacaaapiaabaaffibahaaoekaafaaaaadadaaapiaacaaoeia
acaaoeiaacaaaaadaeaaapiaabaaaaibagaaoekaacaaaaadabaaapiaabaakkib
aiaaoekaaeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeiaaeaaaaaeadaaapia
abaaoeiaabaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaiaahaaaaacafaaacia
adaaffiaahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiiaadaappiaabaaaaac
agaaabiaccaaaakaaeaaaaaeadaaapiaadaaoeiaajaaoekaagaaaaiaafaaaaad
agaaahiaacaaoejacaaappkaafaaaaadahaaahiaagaaffiabkaaoekaaeaaaaae
agaaaliabjaakekaagaaaaiaahaakeiaaeaaaaaeagaaahiablaaoekaagaakkia
agaapeiaafaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaaeacaaapiaaeaaoeia
agaaaaiaacaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkiaacaaoeiaafaaaaad
abaaapiaafaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeiaceaaaakaagaaaaac
acaaabiaadaaaaiaagaaaaacacaaaciaadaaffiaagaaaaacacaaaeiaadaakkia
agaaaaacacaaaiiaadaappiaafaaaaadabaaapiaabaaoeiaacaaoeiaafaaaaad
acaaahiaabaaffiaalaaoekaaeaaaaaeacaaahiaakaaoekaabaaaaiaacaaoeia
aeaaaaaeabaaahiaamaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahiaanaaoeka
abaappiaabaaoeiaabaaaaacagaaaiiaccaaaakaajaaaaadacaaabiaaoaaoeka
agaaoeiaajaaaaadacaaaciaapaaoekaagaaoeiaajaaaaadacaaaeiabaaaoeka
agaaoeiaafaaaaadadaaapiaagaacjiaagaakeiaajaaaaadaeaaabiabbaaoeka
adaaoeiaajaaaaadaeaaaciabcaaoekaadaaoeiaajaaaaadaeaaaeiabdaaoeka
adaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaaiiaagaaffia
agaaffiaaeaaaaaeaaaaaiiaagaaaaiaagaaaaiaaaaappibabaaaaacacaaahoa
agaaoeiaaeaaaaaeacaaahiabeaaoekaaaaappiaacaaoeiaacaaaaadadaaahoa
abaaoeiaacaaoeiaafaaaaadabaaapiaaaaaffiabgaaoekaaeaaaaaeabaaapia
bfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiabiaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
afaaaakaafaaaaadabaaaiiaabaaaaiaccaakkkbafaaaaadabaaafiaaaaapeia
ccaakkkbacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefcieanaaaaeaaaabaagbadaaaa
fjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
ahaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaal
bcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaa
akaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaajccaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaa
anaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaa
aoaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaadaaaaaa
apaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dgaaaaagbcaabaaaabaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakccaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaa
abaaaaaaakiacaaaaaaaaaaaajaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
aaaaaaaafgafbaaaaaaaaaaaaaaaaaahpcaabaaaaaaaaaaaagaabaaaaaaaaaaa
agafbaaaabaaaaaadiaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaappcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaappcaabaaaaaaaaaaa
egaobaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaabaaaaaaegaobaia
ibaaaaaaaaaaaaaaegaobaiaibaaaaaaaaaaaaaadcaaaabapcaabaaaaaaaaaaa
egaobaiambaaaaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaahdcaabaaaaaaaaaaangafbaaa
aaaaaaaaigaabaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckiacaaaaaaaaaaaajaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaaiaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaaiaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaaaaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaoaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaiccaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaaiaaaaaadiaaaaaiicaabaaa
aaaaaaaaakiacaaaaaaaaaaaajaaaaaaabeaaaaamnmmmmdndiaaaaahfcaabaaa
abaaaaaapgapbaaaaaaaaaaaagbcbaaaacaaaaaadgaaaaafecaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagacbaaaaaaaaaaaagajbaaa
abaaaaaaagajbaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
fgafbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaa
akaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaa
acaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
acaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaa
egadbaaaacaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaacaaaaaadgaaaaaf
icaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaa
acaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaa
egacbaaaafaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaa
acaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaaeaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajpcaabaaaaeaaaaaaagaabaiaebaaaaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaafgafbaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaa
kgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaahpcaabaaa
agaaaaaafgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaafaaaaaa
egaobaaaafaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaa
acaaaaaaegaobaaaaaaaaaaakgakbaaaacaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaafaaaaaa
eeaaaaafpcaabaaaaeaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
adaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadp
diaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaaaadgaaaaafmccabaaaafaaaaaakgaobaaaabaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
SLT R1.x, R0.w, c[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MUL R0.xyz, R0, fragment.color.primary;
MAX R1.w, R1, c[3].x;
MOV result.color.w, R0;
KIL -R1.x;
MUL R1.xyz, R0, fragment.texcoord[2];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[3].y, R1;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c3, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
add_pp r1.x, r0.w, -c2
cmp r1.x, r1, c3, c3.y
mov_pp r1, -r1.x
texkill r1.xyzw
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, t2
dp3_pp r0.x, t1, c0
mul_pp r1.xyz, r1, c1
max_pp r0.x, r0, c3
mul_pp r0.xyz, r0.x, r1
mad_pp r0.xyz, r0, c3.z, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
Float 112 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedoejapcbmeingkbkjibaickjbkiieognhabaaaaaaemaeaaaaaeaaaaaa
daaaaaaaiiabaaaaheadaaaabiaeaaaaebgpgodjfaabaaaafaabaaaaaaacpppp
aeabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaaabaaaaaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaacaaaaadabaacpiaaaaappiaabaaaakbebaaaaab
abaaapiaaiaaaaadabaacbiaacaaoelaacaaoekaalaaaaadacaaciiaabaaaaia
adaaaakaacaaaaadabaacbiaacaappiaacaappiaafaaaaadabaacoiaaaaablia
abaabllaafaaaaadacaachiaabaabliaaaaaoekaafaaaaadabaacoiaabaaoeia
adaabllaaeaaaaaeaaaachiaacaaoeiaabaaaaiaabaabliaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcoeabaaaaeaaaaaaahjaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaj
bcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaahaaaaaa
dbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaaanaaaead
akaabaaaabaaaaaabaaaaaaibcaabaaaabaaaaaaegbcbaaaadaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaaagajbaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegbcbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaaabaaaaaa
agaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
SLT R1.x, R0.w, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MOV result.color.w, R0;
KIL -R1.x;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[1].x;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 1.00000000, 8.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
add_pp r0.x, r1.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r2, -r0.x
mul r1.xyz, r1, v0
texld r0, t1, s1
texkill r2.xyzw
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 144
Float 128 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedekomofjoejlpikkkglbhobmhppkmbndgabaaaaaalmadaaaaaeaaaaaa
daaaaaaafaabaaaapmacaaaaiiadaaaaebgpgodjbiabaaaabiabaaaaaaacpppp
oaaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaiaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaacaaaaadabaacpiaaaaappiaaaaaaakbabaaaaac
acaaadiaaaaabllaebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaabaioeka
afaaaaadabaaciiaabaappiaabaaaakaafaaaaadabaachiaabaaoeiaabaappia
afaaaaadacaachiaaaaaoeiaabaaoelaafaaaaadaaaachiaabaaoeiaacaaoeia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefckeabaaaaeaaaaaaagjaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaaiaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R2.x, fragment.texcoord[3], texture[1], 2D;
SLT R1.x, R0.w, c[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MAX R1.w, R1, c[3].x;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.w, R1, R2.x;
MOV result.color.w, R0;
KIL -R1.x;
MUL R1.xyz, R0, fragment.texcoord[2];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[3].y, R1;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 0.00000000, 1.00000000, 2.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r0, t0, s0
mul r0.xyz, r0, v0
add_pp r1.x, r0.w, -c2
cmp r1.x, r1, c3, c3.y
mov_pp r1, -r1.x
mul_pp r3.xyz, r0, t2
mul_pp r2.xyz, r0, c1
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c3
texkill r1.xyzw
texldp r1, t3, s1
mul_pp r0.x, r0, r1
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c3.z, r3
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
Float 176 [_Cutoff]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecednfjmgfjppmfpiimneomcoekbjlhaibidabaaaaaaciafaaaaaeaaaaaa
daaaaaaaoeabaaaadiaeaaaapeaeaaaaebgpgodjkmabaaaakmabaaaaaaacpppp
fmabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaalaaabaaabaaaaaaaaaaabaaaaaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaapla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaecaaaaadaaaacpia
aaaaoelaabaioekaacaaaaadabaacpiaaaaappiaabaaaakbagaaaaacacaaaiia
aeaapplaafaaaaadacaaadiaacaappiaaeaaoelaebaaaaababaaapiaecaaaaad
abaacpiaacaaoeiaaaaioekaaiaaaaadabaacciaacaaoelaacaaoekaafaaaaad
abaacbiaabaaaaiaabaaffiafiaaaaaeabaacbiaabaaffiaabaaaaiaadaaaaka
acaaaaadabaacbiaabaaaaiaabaaaaiaafaaaaadabaacoiaaaaabliaabaablla
afaaaaadacaachiaabaabliaaaaaoekaafaaaaadabaacoiaabaaoeiaadaablla
aeaaaaaeaaaachiaacaaoeiaabaaaaiaabaabliaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcemacaaaaeaaaaaaajdaaaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
alaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaa
anaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaafaaaaaa
pgbpbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaabaaaaaaiccaabaaaabaaaaaaegbcbaaaadaaaaaa
egiccaaaabaaaaaaaaaaaaaadeaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaaaaaapaaaaahbcaabaaaabaaaaaafgafbaaaabaaaaaaagaabaaa
abaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiocaabaaaabaaaaaa
agajbaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaa
abaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
SLT R1.x, R0.w, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MOV result.color.w, R0;
KIL -R1.x;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[1].x;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[1].y;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL result.color.xyz, R0, R1;
END
# 15 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_Cutoff]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.00000000, 1.00000000, 8.00000000, 2.00000000
dcl t0.xy
dcl v0.xyz
dcl t1.xy
dcl t2
texldp r1, t2, s1
texld r2, t0, s0
add_pp r0.x, r2.w, -c0
cmp r0.x, r0, c1, c1.y
mov_pp r0, -r0.x
texkill r0.xyzw
texld r0, t1, s2
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1.x
mul_pp r3.xyz, r3, c1.z
mul_pp r0.xyz, r0, c1.w
mul_pp r1.xyz, r3, r1.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r1
mul r1.xyz, r2, v0
mul_pp r0.xyz, r1, r0
mov_pp r0.w, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 208
Float 192 [_Cutoff]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjobacahgkkepikbcjnladeedmijjgmpjabaaaaaagaafaaaaaeaaaaaa
daaaaaaaoiabaaaaiiaeaaaacmafaaaaebgpgodjlaabaaaalaabaaaaaaacpppp
heabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaamaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaecaaaaadaaaacpia
aaaaoelaabaioekaacaaaaadabaacpiaaaaappiaaaaaaakbagaaaaacacaaaiia
acaapplaafaaaaadacaaadiaacaappiaacaaoelaabaaaaacadaaadiaaaaablla
ebaaaaababaaapiaecaaaaadabaacpiaacaaoeiaaaaioekaecaaaaadacaacpia
adaaoeiaacaioekaacaaaaadabaacciaabaaaaiaabaaaaiaafaaaaadabaacoia
acaabliaabaaffiaafaaaaadacaaciiaacaappiaabaaaakaafaaaaadacaachia
acaaoeiaacaappiaakaaaaadadaachiaabaabliaacaaoeiaafaaaaadabaachia
abaaaaiaacaaoeiaalaaaaadacaachiaadaaoeiaabaaoeiaafaaaaadabaachia
aaaaoeiaabaaoelaafaaaaadaaaachiaacaaoeiaabaaoeiaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcjiacaaaaeaaaaaaakgaaaaaafjaaaaaeegiocaaa
aaaaaaaaanaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaaaaaaaajbcaabaaaabaaaaaadkaabaaaaaaaaaaaakiacaiaebaaaaaa
aaaaaaaaamaaaaaadbaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaaaaanaaaeadakaabaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaabaaaaaafgafbaaa
abaaaaaaagajbaaaacaaaaaadiaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaapgapbaaa
acaaaaaaddaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadeaaaaah
hcaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
jfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[16].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.x, R1, c[5];
MOV R0.y, R3.w;
MOV R0.z, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R0.y, R3.w, R3.w;
DP4 R3.z, R1, c[14];
DP4 R3.y, R1, c[13];
DP4 R3.x, R1, c[12];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[15];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_SHAr]
Vector 9 [unity_SHAg]
Vector 10 [unity_SHAb]
Vector 11 [unity_SHBr]
Vector 12 [unity_SHBg]
Vector 13 [unity_SHBb]
Vector 14 [unity_SHC]
Vector 15 [unity_Scale]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c15.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c17.x
dp4 r2.z, r0, c10
dp4 r2.y, r0, c9
dp4 r2.x, r0, c8
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c13
dp4 r3.y, r1, c12
dp4 r3.x, r1, c11
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c14
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oD0, v3
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v2, c16, c16.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedjkaecldpjganhlfhcjjpannnkdbaeammabaaaaaaeiafaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefckiadaaaa
eaaaabaaokaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedcdhgagdgplcncajjdelfmdbdncmbejmfabaaaaaakmahaaaaaeaaaaaa
daaaaaaajaacaaaaeaagaaaaaiahaaaaebgpgodjfiacaaaafiacaaaaaaacpopp
peabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejabaaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaapaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabbaaaakaajaaaaadabaaabiaacaaoekaaaaaoeia
ajaaaaadabaaaciaadaaoekaaaaaoeiaajaaaaadabaaaeiaaeaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaafaaoekaacaaoeia
ajaaaaadadaaaciaagaaoekaacaaoeiaajaaaaadadaaaeiaahaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffia
aeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeia
aeaaaaaeadaaahoaaiaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefckiadaaaaeaaaabaaokaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [unity_LightmapST]
Vector 10 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[11] = { program.local[0],
		state.matrix.mvp,
		program.local[5..10] };
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[9], c[9].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 7 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_LightmapST]
Vector 9 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
mov oD0, v4
mad oT0.xy, v2, c9, c9.zwzw
mad oT1.xy, v3, c8, c8.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefieceddbkhpekhmkgiaebipjnclclepfbjfakfabaaaaaaceadaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefcjmabaaaaeaaaabaaghaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaadaaaaaa
kgiocaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedikmnodmgcehbpilicpipodjabgpecbpnabaaaaaaeiaeaaaaaeaaaaaa
daaaaaaafaabaaaapeacaaaalmadaaaaebgpgodjbiabaaaabiabaaaaaaacpopp
niaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaadaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
aeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffja
aeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefcjmabaaaaeaaaabaaghaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[19] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[17].w;
DP3 R3.w, R0, c[6];
DP3 R2.w, R0, c[7];
DP3 R1.w, R0, c[5];
MOV R1.x, R3.w;
MOV R1.y, R2.w;
MOV R1.z, c[0].x;
MUL R0, R1.wxyy, R1.xyyw;
DP4 R2.z, R1.wxyz, c[12];
DP4 R2.y, R1.wxyz, c[11];
DP4 R2.x, R1.wxyz, c[10];
DP4 R1.z, R0, c[15];
DP4 R1.y, R0, c[14];
DP4 R1.x, R0, c[13];
MUL R3.x, R3.w, R3.w;
MAD R0.x, R1.w, R1.w, -R3;
ADD R3.xyz, R2, R1;
MUL R2.xyz, R0.x, c[16];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[2].xyz, R3, R2;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R1.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_MainTex_ST]
"vs_2_0
def c19, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r0.xyz, v1, c17.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c19.x
mul r0, r1.wxyy, r1.xyyw
dp4 r2.z, r1.wxyz, c12
dp4 r2.y, r1.wxyz, c11
dp4 r2.x, r1.wxyz, c10
dp4 r1.z, r0, c15
dp4 r1.y, r0, c14
dp4 r1.x, r0, c13
mul r3.x, r3.w, r3.w
mad r0.x, r1.w, r1.w, -r3
add r3.xyz, r2, r1
mul r2.xyz, r0.x, c16
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.y
mul r1.y, r1, c8.x
add oT2.xyz, r3, r2
mad oT3.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oD0, v3
mov oT3.zw, r0
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r1.w
mad oT0.xy, v2, c18, c18.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedkingnakigiccglhojkibkjccgocpbebmabaaaaaaaiagaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcfaaeaaaaeaaaabaabeabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedeehloachljjhimpoglogedpkdemddcjcabaaaaaameaiaaaaaeaaaaaa
daaaaaaaoiacaaaaeaahaaaaaiaiaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
eaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaahaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaiadpaaaaaadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaacaaoejabbaappkaafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabcaaaakaajaaaaad
abaaabiaadaaoekaaaaaoeiaajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaad
abaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaad
adaaabiaagaaoekaacaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaad
adaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappib
abaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaajaaoekaaaaappiaabaaoeia
afaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaad
abaaaiiaabaaaaiabcaaffkaafaaaaadabaaafiaaaaapeiabcaaffkaacaaaaad
aeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacabaaapoa
afaaoejappppaaaafdeieefcfaaeaaaaeaaaabaabeabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaa
bbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaa
bbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaa
abaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_MainTex_ST]
"vs_2_0
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dcl_color0 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c8.x
mad oT2.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oD0, v4
mov oT2.zw, r0
mad oT0.xy, v2, c11, c11.zwzw
mad oT1.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 112 [unity_LightmapST]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmocicahdkclpacnnoklchaoanifapannabaaaaaaoeadaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefceeacaaaa
eaaaabaajbaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 112 [unity_LightmapST]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedhekdlbggkiknjidmembbomjiochlipdhabaaaaaahiafaaaaaeaaaaaa
daaaaaaamaabaaaaamaeaaaaneaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpopp
dmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaahaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
aiaaaakaafaaaaadabaaafiaaaaapeiaaiaaaakaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaa
fdeieefceeacaaaaeaaaabaajbaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
adaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [unity_4LightPosX0]
Vector 10 [unity_4LightPosY0]
Vector 11 [unity_4LightPosZ0]
Vector 12 [unity_4LightAtten0]
Vector 13 [unity_LightColor0]
Vector 14 [unity_LightColor1]
Vector 15 [unity_LightColor2]
Vector 16 [unity_LightColor3]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[24].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[10];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[9];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[11];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[12];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[19];
DP4 R2.y, R4, c[18];
DP4 R2.x, R4, c[17];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[14];
MAD R1.xyz, R0.x, c[13], R1;
MAD R0.xyz, R0.z, c[15], R1;
MAD R1.xyz, R0.w, c[16], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[22];
DP4 R4.z, R0, c[21];
DP4 R4.y, R0, c[20];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[23];
ADD R2.xyz, R2, R4.yzww;
ADD R0.xyz, R2, R0;
ADD result.texcoord[2].xyz, R0, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 58 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_4LightPosX0]
Vector 9 [unity_4LightPosY0]
Vector 10 [unity_4LightPosZ0]
Vector 11 [unity_4LightAtten0]
Vector 12 [unity_LightColor0]
Vector 13 [unity_LightColor1]
Vector 14 [unity_LightColor2]
Vector 15 [unity_LightColor3]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [unity_Scale]
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r3.xyz, v1, c23.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c9
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c8
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c25.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c10
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c11
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c25.x
dp4 r2.z, r4, c18
dp4 r2.y, r4, c17
dp4 r2.x, r4, c16
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c25.y
mul r0, r0, r1
mul r1.xyz, r0.y, c13
mad r1.xyz, r0.x, c12, r1
mad r0.xyz, r0.z, c14, r1
mad r1.xyz, r0.w, c15, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c21
dp4 r4.z, r0, c20
dp4 r4.y, r0, c19
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c22
add r2.xyz, r2, r4.yzww
add r0.xyz, r2, r0
add oT2.xyz, r0, r1
mov oD0, v3
mov oT1.z, r3.x
mov oT1.y, r3.w
mov oT1.x, r4
mad oT0.xy, v2, c24, c24.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedpcbnpcifdcceihhoeneeklhndmnnfnlfabaaaaaajiaiaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcpiagaaaa
eaaaabaaloabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaj
pcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaa
diaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaa
afaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaaj
pcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaa
acaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
abaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaa
aeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfaookjaennpdbnmllnicgplihifbgmgcabaaaaaaaaanaaaaaeaaaaaa
daaaaaaajeaeaaaajealaaaafmamaaaaebgpgodjfmaeaaaafmaeaaaaaaacpopp
omadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaacaaaiaaacaaaaaaaaaaabaacgaaahaaakaaaaaaaaaa
acaaaaaaaeaabbaaaaaaaaaaacaaamaaaeaabfaaaaaaaaaaacaabeaaabaabjaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaaaaaffjabgaaoekaaeaaaaaeaaaaahia
bfaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabiaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaaffib
adaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaadadaaapiaaaaaaaib
acaaoekaacaaaaadaaaaapiaaaaakkibaeaaoekaaeaaaaaeacaaapiaadaaoeia
adaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeiaahaaaaac
aeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkia
ahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiabkaaaakaaeaaaaaeacaaapia
acaaoeiaafaaoekaafaaaaiaafaaaaadafaaahiaacaaoejabjaappkaafaaaaad
agaaahiaafaaffiabgaaoekaaeaaaaaeafaaaliabfaakekaafaaaaiaagaakeia
aeaaaaaeafaaahiabhaaoekaafaakkiaafaapeiaafaaaaadabaaapiaabaaoeia
afaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaaeaaaaapia
aaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeiaalaaaaad
aaaaapiaaaaaoeiabkaaffkaagaaaaacabaaabiaacaaaaiaagaaaaacabaaacia
acaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiiaacaappiaafaaaaad
aaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaae
abaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappiaaaaaoeiaabaaaaacafaaaiia
bkaaaakaajaaaaadabaaabiaakaaoekaafaaoeiaajaaaaadabaaaciaalaaoeka
afaaoeiaajaaaaadabaaaeiaamaaoekaafaaoeiaafaaaaadacaaapiaafaacjia
afaakeiaajaaaaadadaaabiaanaaoekaacaaoeiaajaaaaadadaaaciaaoaaoeka
acaaoeiaajaaaaadadaaaeiaapaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiiaafaaaaia
afaaaaiaaaaappibabaaaaacacaaahoaafaaoeiaaeaaaaaeabaaahiabaaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabcaaoekaaeaaaaaeaaaaapiabbaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabdaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefcpiagaaaaeaaaabaa
loabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..26] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[25].w;
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP3 R3.x, R3, c[7];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[10];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[12];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[13];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[20];
DP4 R2.y, R4, c[19];
DP4 R2.x, R4, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[15];
MAD R1.xyz, R0.x, c[14], R1;
MAD R0.xyz, R0.z, c[16], R1;
MAD R1.xyz, R0.w, c[17], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R4.w, R0, c[23];
DP4 R4.z, R0, c[22];
DP4 R4.y, R0, c[21];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[24];
ADD R2.xyz, R2, R4.yzww;
ADD R4.yzw, R2.xxyz, R0.xxyz;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].z;
ADD result.texcoord[2].xyz, R4.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD result.texcoord[3].xy, R1, R2.z;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
END
# 64 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_4LightPosX0]
Vector 11 [unity_4LightPosY0]
Vector 12 [unity_4LightPosZ0]
Vector 13 [unity_4LightAtten0]
Vector 14 [unity_LightColor0]
Vector 15 [unity_LightColor1]
Vector 16 [unity_LightColor2]
Vector 17 [unity_LightColor3]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Vector 26 [_MainTex_ST]
"vs_2_0
def c27, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r3.xyz, v1, c25.w
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp3 r3.x, r3, c6
dp4 r0.x, v0, c5
add r1, -r0.x, c11
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c10
mul r1, r1, r1
mov r4.z, r3.x
mov r4.w, c27.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c12
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c13
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c27.x
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c27.y
mul r0, r0, r1
mul r1.xyz, r0.y, c15
mad r1.xyz, r0.x, c14, r1
mad r0.xyz, r0.z, c16, r1
mad r1.xyz, r0.w, c17, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r4.w, r0, c23
dp4 r4.z, r0, c22
dp4 r4.y, r0, c21
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c24
add r2.xyz, r2, r4.yzww
add r4.yzw, r2.xxyz, r0.xxyz
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c27.z
add oT2.xyz, r4.yzww, r1
mov r1.x, r2
mul r1.y, r2, c8.x
mad oT3.xy, r2.z, c9.zwzw, r1
mov oPos, r0
mov oD0, v3
mov oT3.zw, r0
mov oT1.z, r3.x
mov oT1.y, r3.w
mov oT1.x, r4
mad oT0.xy, v2, c26, c26.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcobjbebkejbnnhlhiakombbnkgmnimjgabaaaaaafiajaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefckaahaaaaeaaaabaaoiabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
ahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
icaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
adaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaa
aeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaa
aaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaa
acaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaa
kgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
agaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaa
aeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
aeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaa
egaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
aaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 112 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedmiphmbkdaejokpainddgcbekcnphnbnoabaaaaaabiaoaaaaaeaaaaaa
daaaaaaaomaeaaaajeamaaaafmanaaaaebgpgodjleaeaaaaleaeaaaaaaacpopp
diaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaahaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaaeaabgaa
aaaaaaaaadaabeaaabaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafblaaapka
aaaaiadpaaaaaaaaaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapja
aeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaadaaaaahiaaaaaffja
bhaaoekaaeaaaaaeaaaaahiabgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
biaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaaffibaeaaoekaafaaaaadacaaapiaabaaoeiaabaaoeia
acaaaaadadaaapiaaaaaaaibadaaoekaacaaaaadaaaaapiaaaaakkibafaaoeka
aeaaaaaeacaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeia
aaaaoeiaacaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffia
ahaaaaacaeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabia
blaaaakaaeaaaaaeacaaapiaacaaoeiaagaaoekaafaaaaiaafaaaaadafaaahia
acaaoejabkaappkaafaaaaadagaaahiaafaaffiabhaaoekaaeaaaaaeafaaalia
bgaakekaafaaaaiaagaakeiaaeaaaaaeafaaahiabiaaoekaafaakkiaafaapeia
afaaaaadabaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaia
abaaoeiaaeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapia
aeaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeiablaaffkaagaaaaacabaaabia
acaaaaiaagaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaac
abaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahia
aaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappia
aaaaoeiaabaaaaacafaaaiiablaaaakaajaaaaadabaaabiaalaaoekaafaaoeia
ajaaaaadabaaaciaamaaoekaafaaoeiaajaaaaadabaaaeiaanaaoekaafaaoeia
afaaaaadacaaapiaafaacjiaafaakeiaajaaaaadadaaabiaaoaaoekaacaaoeia
ajaaaaadadaaaciaapaaoekaacaaoeiaajaaaaadadaaaeiabaaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffia
aeaaaaaeaaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacacaaahoaafaaoeia
aeaaaaaeabaaahiabbaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeia
abaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabfaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaaka
afaaaaadabaaaiiaabaaaaiablaakkkaafaaaaadabaaafiaaaaapeiablaakkka
acaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaac
abaaapoaafaaoejappppaaaafdeieefckaahaaaaeaaaabaaoiabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaf
hccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
adaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaaj
pcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaa
aaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaa
aeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaa
egaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
ahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R0, fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MUL R0.xyz, R0, c[1];
MAX R1.w, R1, c[2].x;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[2].y, R1;
MOV result.color.w, R0;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, t2
dp3_pp r0.x, t1, c0
mul_pp r1.xyz, r1, c1
max_pp r0.x, r0, c2
mul_pp r0.xyz, r0.x, r1
mad_pp r0.xyz, r0, c2.y, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedecapnhapbhigicddggmecmogapjeijgfabaaaaaakeacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcjiabaaaaeaaaaaaaggaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedjobannkchbgnmljkedmdnfeblodobifaabaaaaaanmadaaaaaeaaaaaa
daaaaaaageabaaaaaeadaaaakiadaaaaebgpgodjcmabaaaacmabaaaaaaacpppp
omaaaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioeka
aiaaaaadabaaciiaacaaoelaabaaoekaalaaaaadacaaciiaabaappiaacaaaaka
acaaaaadabaacbiaacaappiaacaappiaafaaaaadabaacoiaaaaabliaabaablla
afaaaaadacaachiaabaabliaaaaaoekaafaaaaadabaacoiaabaaoeiaadaablla
aeaaaaaeaaaachiaacaaoeiaabaaaaiaabaabliaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcjiabaaaaeaaaaaaaggaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
doaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[1] = { { 8 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[0].x;
MOV result.color.w, R0;
END
# 7 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c0, 8.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c0.x
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0
eefiecedhpfalnmcpfpgkoeaeooofhdoembkhmibabaaaaaadmacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefceiabaaaaeaaaaaaafcaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0_level_9_1
eefiecedgobfnkdimieepfgnpcpjpdiafmijankgabaaaaaadmadaaaaaeaaaaaa
daaaaaaacmabaaaahmacaaaaaiadaaaaebgpgodjpeaaaaaapeaaaaaaaaacpppp
miaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaabllaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaciiaaaaappiaaaaaaakaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
acaachiaabaaoeiaabaaoelaafaaaaadabaachiaaaaaoeiaacaaoeiaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefceiabaaaaeaaaaaaafcaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
ieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TXP R2.x, fragment.texcoord[3], texture[1], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R0, fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MAX R1.w, R1, c[2].x;
MUL R0.xyz, R0, c[1];
MUL R1.w, R1, R2.x;
MUL R0.xyz, R1.w, R0;
MAD result.color.xyz, R0, c[2].y, R1;
MOV result.color.w, R0;
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texldp r1, t3, s1
texld r0, t0, s0
mul r2.xyz, r0, v0
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r1
mul_pp r3.xyz, r2, c1
mul_pp r0.xyz, r0.x, r3
mul_pp r1.xyz, r2, t2
mad_pp r0.xyz, r0, c2.y, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedlaabhnknbpjeeanaebnmdghnofffoclhabaaaaaaceadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aaacaaaaeaaaaaaaiaaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaaiccaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefieceddifdanlfeplbdnhidmfbgpfngobjppndabaaaaaaliaeaaaaaeaaaaaa
daaaaaaamaabaaaamiadaaaaieaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpppp
eeabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadia
aaaappiaaeaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
aaaaoelaabaioekaaiaaaaadaaaacciaacaaoelaabaaoekaafaaaaadaaaacbia
aaaaaaiaaaaaffiafiaaaaaeaaaacbiaaaaaffiaaaaaaaiaacaaaakaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaabllaafaaaaad
acaachiaaaaabliaaaaaoekaafaaaaadaaaacoiaaaaaoeiaadaabllaaeaaaaae
abaachiaacaaoeiaaaaaaaiaaaaabliaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcaaacaaaaeaaaaaaaiaaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaaiccaabaaa
aaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0].x;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[0].y;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, fragment.color.primary;
MUL result.color.xyz, R0, R1;
MOV result.color.w, R0;
END
# 13 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 8.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
dcl t2
texld r1, t0, s0
texldp r3, t2, s1
texld r0, t1, s2
mul_pp r2.xyz, r0, r3.x
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r0, c0.x
mul_pp r2.xyz, r2, c0.y
min_pp r2.xyz, r0, r2
mul_pp r0.xyz, r0, r3.x
max_pp r0.xyz, r2, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r1, r0
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0
eefiecedjbdeieimbfhejllkkadpdagkpjfihkgpabaaaaaaeiadaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcdmacaaaaeaaaaaaaipaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
ddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0_level_9_1
eefiecedehhgcgmlmhfejdpdbmobbaloaokkjacbabaaaaaaoaaeaaaaaeaaaaaa
daaaaaaameabaaaaaiaeaaaakmaeaaaaebgpgodjimabaaaaimabaaaaaaacpppp
fmabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadia
aaaappiaacaaoelaabaaaaacabaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadacaacpiaaaaaoela
abaioekaacaaaaadaaaacciaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
aaaaffiaafaaaaadabaaciiaabaappiaaaaaaakaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadadaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeiaafaaaaadaaaachiaacaaoeia
abaaoelaafaaaaadacaachiaabaaoeiaaaaaoeiaabaaaaacaaaicpiaacaaoeia
ppppaaaafdeieefcdmacaaaaeaaaaaaaipaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
ddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
jfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednnkmbadljajhckiealepemkpdfeemcckabaaaaaammafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedaffkaniklkdekpgcpboelagpkdfoakadabaaaaaadmaiaaaaaeaaaaaa
daaaaaaajmacaaaaliagaaaaiaahaaaaebgpgodjgeacaaaageacaaaaaaacpopp
aaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
anaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjaamaaoekaaeaaaaae
aaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoa
aaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapia
alaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffia
acaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
adaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeia
afaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
beaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { program.local[0],
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[10].w;
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[9];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 11 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
Vector 10 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r0.xyz, v1, c9.w
mov oD0, v3
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c8
mad oT0.xy, v2, c10, c10.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedhbojedddbajfgkgpeekiflodfhgncochabaaaaaaneadaaaaadaaaaaa
cmaaaaaapeaaaaaajiabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcdeacaaaa
eaaaabaainaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedphgkdpmnkhcdppmpajcgjkpeadieammaabaaaaaafmafaaaaaeaaaaaa
daaaaaaaleabaaaapaadaaaaliaeaaaaebgpgodjhmabaaaahmabaaaaaaacpopp
biabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabeaaabaaakaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
ajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejaabaaaaacadaaahoaacaaoekappppaaaafdeieefcdeacaaaaeaaaabaa
inaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].w, R0, c[12];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.w, r0, c11
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedddeiclloneeldgbifechhdckjnpidflpabaaaaaammafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedlbldednnicfnoboehnghfhckonclgeojabaaaaaadmaiaaaaaeaaaaaa
daaaaaaajmacaaaaliagaaaaiaahaaaaebgpgodjgeacaaaageacaaaaaaacpopp
aaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
anaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjaamaaoekaaeaaaaae
aaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoa
aaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapia
alaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffia
acaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapia
adaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaaeaaoekaaaaappiaabaaoeia
afaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
beaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednnkmbadljajhckiealepemkpdfeemcckabaaaaaammafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedaffkaniklkdekpgcpboelagpkdfoakadabaaaaaadmaiaaaaaeaaaaaa
daaaaaaajmacaaaaliagaaaaiaahaaaaebgpgodjgeacaaaageacaaaaaaacpopp
aaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
anaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjaamaaoekaaeaaaaae
aaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoa
aaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapia
alaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffia
acaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
adaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoekaaaaappiaaaaaoeia
afaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
beaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
knaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.color, vertex.color;
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov oD0, v3
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c12
mad oT0.xy, v2, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedfkailgocfjfnkfonmdaaipfoiagpdlocabaaaaaaciafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefchaadaaaaeaaaabaanmaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaabaaaaaa
agiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaa
aaaaaaaaahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgnbbhbaoajpponeceikopcaoglnnkgmdabaaaaaaeiahaaaaaeaaaaaa
daaaaaaaemacaaaameafaaaaimagaaaaebgpgodjbeacaaaabeacaaaaaaacpopp
laabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaafaaaaadaaaaahiaacaaoejaapaappkaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
anaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaae
aaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaadia
aaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaiaabaaoeiaaeaaaaae
aaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeaaaaamoaaeaabekaaaaappia
aaaaeeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejaabaaaaac
adaaahoaagaaoekappppaaaafdeieefchaadaaaaeaaaabaanmaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[1];
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mul r1.xyz, r1, v0
mul_pp r1.xyz, r1, c0
mov_pp r0.w, c1.x
texld r2, r0, s1
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t2
dp3_pp r0.x, t1, r0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlicjoknkogeafeckhbhgpppjdmjakbnbabaaaaaadiadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
beacaaaaeaaaaaaaifaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaa
acaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedgmabibhofonmeipgloimebfpakcpapalabaaaaaameaeaaaaaeaaaaaa
daaaaaaaliabaaaaneadaaaajaaeaaaaebgpgodjiaabaaaaiaabaaaaaaacpppp
eiabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioekaceaaaaac
acaachiaadaaoelaaiaaaaadabaaciiaacaaoelaacaaoeiaafaaaaadaaaacbia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaabaaaakaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoelaafaaaaad
aaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappiaaaaaoeiaabaaaaac
aaaaciiaabaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbeacaaaa
eaaaaaaaifaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R0.w, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[1].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s0
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
mul r1.xyz, r1, v0
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c1
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedelgfmnnjgdnmphedkgmjeigoacogdalbabaaaaaagmacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcgaabaaaaeaaaaaaafiaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
abaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
acaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkkookkaoepiggnjeemnkddanidpnfdhkabaaaaaajmadaaaaaeaaaaaa
daaaaaaafmabaaaameacaaaagiadaaaaebgpgodjceabaaaaceabaaaaaaacpppp
paaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaja
aaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaafaaaaadaaaachiaaaaaoeia
abaaoelaafaaaaadaaaachiaaaaaoeiaaaaaoekaabaaaaacabaaahiaacaaoela
aiaaaaadaaaaciiaabaaoeiaadaaoelaalaaaaadabaacbiaaaaappiaabaaaaka
acaaaaadaaaaciiaabaaaaiaabaaaaiaafaaaaadaaaachiaaaaappiaaaaaoeia
abaaaaacaaaaaiiaabaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
gaabaaaaeaaaaaaafiaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[3].w;
MAD R1.xy, fragment.texcoord[3], R0.x, c[1].y;
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
MOV result.color.w, c[1].x;
TEX R0.w, R1, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.z, texture[2], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
SLT R1.y, c[1].x, fragment.texcoord[3].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R0, fragment.color.primary;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r2, t0, s0
dp3 r0.x, t3, t3
rcp r1.x, t3.w
mov r0.xy, r0.x
mad r1.xy, t3, r1.x, c1.x
mul r2.xyz, r2, v0
mul_pp r2.xyz, r2, c0
texld r0, r0, s2
texld r1, r1, s1
cmp r1.x, -t3.z, c1.y, c1.z
mul_pp r3.x, r1, r1.w
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
mul_pp r0.x, r3, r0
max_pp r1.x, r1, c1.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.w
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfickphnlpbomfcldfnfmfiimakjnkfooabaaaaaacmaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aiadaaaaeaaaaaaamcaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaak
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaa
afaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaa
aeaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaa
deaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedondljimjnokndhiabngpjhkpefkobopoabaaaaaabiagaaaaaeaaaaaa
daaaaaaabiacaaaaciafaaaaoeafaaaaebgpgodjoaabaaaaoaabaaaaaaacpppp
keabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaaeaaaaae
aaaaadiaaeaaoelaaaaappiaabaaaakaaiaaaaadabaaaiiaaeaaoelaaeaaoela
abaaaaacabaaadiaabaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
acaaciiaaaaappiaabaaaaiafiaaaaaeacaaciiaaeaakklbabaaffkaacaappia
ceaaaaacaaaachiaadaaoelaaiaaaaadaaaacbiaacaaoelaaaaaoeiaalaaaaad
abaacbiaaaaaaaiaabaaffkaafaaaaadacaaciiaacaappiaabaaaaiaacaaaaad
acaaciiaacaappiaacaappiaafaaaaadaaaachiaacaaoeiaabaaoelaafaaaaad
aaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeiaabaaaaac
aaaaaiiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcaiadaaaa
eaaaaaaamcaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
pcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaa
abaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
bcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[2], CUBE;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[1], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[1].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r2, t3, s2
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
dp3_pp r2.x, t2, t2
rsq_pp r2.x, r2.x
mul_pp r2.xyz, r2.x, t2
mul r1.xyz, r1, v0
dp3_pp r2.x, t1, r2
mul_pp r1.xyz, r1, c0
max_pp r2.x, r2, c1
texld r0, r0, s1
mul r0.x, r0, r2.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedeffphmeakhddablijlamokecdkpcpimgabaaaaaajeadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
haacaaaaeaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
acaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedghmdalgmkenfnilghgincpklohifkieaabaaaaaaemafaaaaaeaaaaaa
daaaaaaaoeabaaaafmaeaaaabiafaaaaebgpgodjkmabaaaakmabaaaaaaacpppp
haabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
abaaapiaaeaaoelaaaaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
acaaciiaaaaaaaiaabaappiaceaaaaacaaaachiaadaaoelaaiaaaaadaaaacbia
acaaoelaaaaaoeiaalaaaaadabaacbiaaaaaaaiaabaaaakaafaaaaadacaaciia
acaappiaabaaaaiaacaaaaadacaaciiaacaappiaacaappiaafaaaaadaaaachia
acaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachia
acaappiaaaaaoeiaabaaaaacaaaaciiaabaaaakaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefchaacaaaaeaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaa
abaaaaaadkaabaaaacaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaa
agbjbaaaacaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, fragment.texcoord[3], texture[1], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t3, s1
texld r1, t0, s0
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
mul r1.xyz, r1, v0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, c1.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedekciicnccofckideopiobbnnccbpjljcabaaaaaanaacaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
kmabaaaaeaaaaaaaglaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaai
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedolgmjfnkmmnbeonifpkkhdpfhfllhaemabaaaaaaeaaeaaaaaeaaaaaa
daaaaaaajmabaaaafaadaaaaamaeaaaaebgpgodjgeabaaaageabaaaaaaacpppp
cmabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaablla
ecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioeka
abaaaaacaaaaahiaacaaoelaaiaaaaadabaaciiaaaaaoeiaadaaoelaafaaaaad
aaaacbiaaaaappiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaabaaaaka
acaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoela
afaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaabaappiaaaaaoeia
abaaaaacaaaaciiaabaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
kmabaaaaeaaaaaaaglaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaai
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
}
Fallback "VertexLit"
}