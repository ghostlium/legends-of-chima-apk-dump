//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Animated/Diffuse Animated Surface" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _WindX ("WaveX: XY = Min/Max Speeds, ZW = Min/Max Strength", Vector) = (3,6,0.005,0.01)
 _WindY ("WaveY: XY = Min/Max Speeds, ZW = Min/Max Strength", Vector) = (3,6,0.005,0.01)
 _WindZ ("WaveZ: XY = Min/Max Speeds, ZW = Min/Max Strength", Vector) = (3,6,0.005,0.01)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Geometry" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Transparent" }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_WindX]
Vector 19 [_WindY]
Vector 20 [_WindZ]
Vector 21 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..21],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R0.xyz, vertex.normal, c[17].w;
DP3 R1.w, R0, c[6];
DP3 R0.w, R0, c[7];
DP3 R5.x, R0, c[5];
MUL R1.x, R1.w, R1.w;
MOV R5.y, R1.w;
MOV R5.z, R0.w;
MOV R5.w, c[0];
MUL R2, R5.xyzz, R5.yzzx;
MAD R3.x, R5, R5, -R1;
DP4 R1.z, R2, c[15];
DP4 R1.y, R2, c[14];
DP4 R1.x, R2, c[13];
MUL R2.xyz, R3.x, c[16];
DP4 R0.z, R5, c[12];
DP4 R0.y, R5, c[11];
DP4 R0.x, R5, c[10];
ADD R0.xyz, R0, R1;
ADD result.texcoord[2].xyz, R0, R2;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R3.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[22];
MAX R0.y, R0, c[22].x;
ADD R2.w, R3, R0.y;
ADD R5.y, R3.w, R0.x;
MUL R0.y, R2.w, c[18];
MUL R0.x, R0.y, c[0].z;
ADD R0.x, R0, -c[22].w;
FRC R4.y, R0.x;
MUL R0.y, R5, c[19];
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[22].w;
FRC R4.w, R1.x;
ADD R0.xyz, -R4.y, c[22];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[22].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R4.w, c[22];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[23].xyxw;
MAD R1.xyz, R1, R0, c[23].zwzw;
MAD R1.xyz, R1, R0, c[24].xyxw;
MAD R1.xyz, R1, R0, c[24].zwzw;
ADD R3.xyz, R3, c[23].xyxw;
MAD R3.xyz, R3, R2, c[23].zwzw;
MAD R3.xyz, R3, R2, c[24].xyxw;
MAD R1.xyz, R1, R0, c[25].xyxw;
SGE R4.yz, R4.y, c[25].xzww;
DP3 R0.y, R4, c[25].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[24].zwzw;
MAD R0.xyz, R0, R2, c[25].xyxw;
MUL R3.x, R1, c[18].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R4.w, c[22].w;
SGE R1.yz, R4.w, c[25].xzww;
DP3 R1.y, R1, c[25].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[22];
ADD R0.x, R3.w, R2;
MUL R0.z, R0.x, c[20].y;
MUL R0.y, R0, c[19].w;
ADD R4.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[22].w;
FRC R4.y, R0;
MUL R0.x, R0, c[20];
MUL R0.x, R0, c[0].z;
ADD R1.x, R0, -c[22].w;
FRC R3.w, R1.x;
ADD R0.xyz, -R4.y, c[22];
MUL R0.xyz, R0, R0;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[22].w;
ADD R1.xyz, -R3.w, c[22];
ADD R3.xyz, R2, c[23].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[23].zwzw;
MAD R3.xyz, R3, R0, c[24].xyxw;
MAD R3.xyz, R3, R0, c[24].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[23].xyxw;
MAD R2.xyz, R2, R1, c[23].zwzw;
MAD R2.xyz, R2, R1, c[24].xyxw;
MAD R3.xyz, R3, R0, c[25].xyxw;
SGE R4.yz, R4.y, c[25].xzww;
DP3 R0.y, R4, c[25].xyxw;
MOV R0.xz, R4;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[24].zwzw;
MAD R0.xyz, R0, R1, c[25].xyxw;
MUL R3.x, R3, c[20].w;
SLT R1.x, R3.w, c[22].w;
SGE R1.yz, R3.w, c[25].xzww;
MOV R2.xz, R1;
DP3 R2.y, R1, c[25].xyxw;
DP3 R0.x, R0, -R2;
MUL R3.w, R0.x, c[20].z;
MUL R0.x, R2.w, c[18];
MUL R0.y, R5, c[19].x;
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[22].w;
FRC R4.y, R0;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[22].w;
FRC R2.w, R0.x;
ADD R0.xyz, -R4.y, c[22];
SLT R4.x, R4.y, c[22].w;
ADD R1.xyz, -R2.w, c[22];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[23].xyxw;
MAD R2.xyz, R2, R1, c[23].zwzw;
MAD R2.xyz, R2, R1, c[24].xyxw;
MUL R0.xyz, R0, R0;
ADD R4.w, R4, R3.x;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[23].xyxw;
MAD R3.xyz, R3, R0, c[23].zwzw;
MAD R3.xyz, R3, R0, c[24].xyxw;
MAD R3.xyz, R3, R0, c[24].zwzw;
MAD R2.xyz, R2, R1, c[24].zwzw;
MAD R3.xyz, R3, R0, c[25].xyxw;
SGE R4.yz, R4.y, c[25].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[25].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[25].xyxw;
SLT R1.x, R2.w, c[22].w;
SGE R1.yz, R2.w, c[25].xzww;
MOV R2.w, vertex.position;
MOV R2.xz, R1;
DP3 R2.y, R1, c[25].xyxw;
DP3 R0.x, R0, -R2;
MUL R0.y, R3.x, c[19].z;
MUL R0.x, R0, c[18].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R3.w;
ADD R0.x, R0, R4.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R2.xyz, R0.x, R0.y, vertex.position;
DP4 result.position.w, R2, c[4];
DP4 result.position.z, R2, c[3];
DP4 result.position.y, R2, c[2];
DP4 result.position.x, R2, c[1];
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R0.w;
MOV result.texcoord[1].y, R1.w;
MOV result.texcoord[1].x, R5;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[21], c[21].zwzw;
END
# 155 instructions, 6 R-regs
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
Vector 8 [_Time]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_WindX]
Vector 18 [_WindY]
Vector 19 [_WindZ]
Vector 20 [_MainTex_ST]
"vs_2_0
def c21, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c22, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c23, 0.00000000, 0.15915491, 0.50000000, 0
def c24, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r0.xyz, v2, c16.w
dp3 r2.w, r0, c5
dp3 r1.w, r0, c6
dp3 r3.x, r0, c4
mov r3.y, r2.w
mov r3.z, r1.w
mul r0, r3.xyzz, r3.yzzx
mov r3.w, c21.z
dp4 r2.z, r0, c14
dp4 r2.y, r0, c13
dp4 r2.x, r0, c12
dp4 r1.z, r3, c11
dp4 r1.y, r3, c10
dp4 r1.x, r3, c9
mul r3.y, r2.w, r2.w
mad r0.x, r3, r3, -r3.y
add r1.xyz, r1, r2
mul r2.xyz, r0.x, c15
mov r0, c4
dp4 r0.x, c21.z, r0
min r3.y, v0.z, c21.z
min r0.z, v0.y, c21
add oT2.xyz, r1, r2
add r0.x, r0, c8.y
max r0.y, r3, c23.x
add r3.y, r0.x, r0
max r0.z, r0, c23.x
min r0.y, v0.x, c21.z
max r0.y, r0, c23.x
add r1.y, r0.x, r0.z
add r1.x, r0, r0.y
mul r0.y, r1, c18
mul r0.x, r1, c17.y
mad r0.y, r0, c23, c23.z
frc r0.y, r0
mad r0.x, r0, c23.y, c23.z
frc r0.x, r0
mad r2.x, r0, c24, c24.y
mad r2.y, r0, c24.x, c24
sincos r0.xy, r2.y, c22.xyzw, c21.xyzw
sincos r4.xy, r2.x, c22.xyzw, c21.xyzw
mul r0.x, r4.y, c17.w
mul r0.y, r0, c18.w
add r2.x, r0, r0.y
mul r1.z, r3.y, c19.y
mad r0.y, r1.z, c23, c23.z
frc r0.y, r0
mul r0.x, r3.y, c19
mad r0.x, r0, c23.y, c23.z
frc r1.z, r0.x
mad r2.y, r0, c24.x, c24
sincos r0.xy, r2.y, c22.xyzw, c21.xyzw
mad r0.x, r1.z, c24, c24.y
sincos r4.xy, r0.x, c22.xyzw, c21.xyzw
mul r0.x, r0.y, c19.w
add r1.z, r2.x, r0.x
mul r0.y, r1, c18.x
mul r0.x, r1, c17
mad r0.y, r0, c23, c23.z
frc r0.y, r0
mad r0.x, r0, c23.y, c23.z
frc r0.x, r0
mul r2.x, r4.y, c19.z
mad r1.x, r0, c24, c24.y
mad r1.y, r0, c24.x, c24
sincos r0.xy, r1.y, c22.xyzw, c21.xyzw
sincos r4.xy, r1.x, c22.xyzw, c21.xyzw
mov r0.w, v0
mul r0.y, r0, c18.z
mul r0.x, r4.y, c17.z
add r0.x, r0, r0.y
add r0.x, r0, r2
add r0.x, r0, r1.z
add r0.y, -v5.w, c21.z
mad r0.xyz, r0.x, r0.y, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v5
mov oT1.z, r1.w
mov oT1.y, r2.w
mov oT1.x, r3
mad oT0.xy, v3, c20, c20.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedelkddflelbdmnmfondleedklloadpljhabaaaaaadeanaaaaaeaaaaaa
daaaaaaanmafaaaamialaaaajaamaaaaebgpgodjkeafaaaakeafaaaaaaacpopp
deafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaacgaaahaaagaaaaaaaaaa
adaaaaaaaeaaanaaaaaaaaaaadaaamaaaeaabbaaaaaaaaaaadaabeaaabaabfaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaaaaaidpjccdo
aaaaiadofbaaaaafbhaaapkalkajlglkkekkckdnaaaaaalpaaaaaaaafbaaaaaf
biaaapkanlapmjeanlapejmagdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaaeaaoekaaeaaookaafaaaaadaaaaahia
acaaoejabfaappkaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaalia
bbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeia
abaaaaacaaaaaiiabgaaaakaajaaaaadabaaabiaagaaoekaaaaaoeiaajaaaaad
abaaaciaahaaoekaaaaaoeiaajaaaaadabaaaeiaaiaaoekaaaaaoeiaafaaaaad
acaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaajaaoekaacaaoeiaajaaaaad
adaaaciaakaaoekaacaaoeiaajaaaaadadaaaeiaalaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaae
aaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaae
adaaahoaamaaoekaaaaappiaabaaoeiaabaaaaacaaaaabiabbaaaakaacaaaaad
aaaaabiaaaaaaaiabcaaaakaacaaaaadaaaaabiaaaaaaaiabdaaaakaacaaaaad
aaaaabiaaaaaaaiabeaaaakaacaaaaadaaaaabiaaaaaaaiaafaaffkaalaaaaad
aaaaaoiaaaaajajabgaaffkaakaaaaadaaaaaoiaaaaaoeiabgaaaakaacaaaaad
aaaaahiaaaaapjiaaaaaaaiaafaaaaadaaaaakiaaaaaffiaacaagakaaeaaaaae
aaaaakiaaaaaoeiabgaakkkabgaappkabdaaaaacaaaaakiaaaaaoeiaaeaaaaae
aaaaakiaaaaaoeiabiaaaakabiaaffkaafaaaaadaaaaakiaaaaaoeiaaaaaoeia
aeaaaaaeabaaadiaaaaaoniabiaakkkabiaappkaaeaaaaaeabaaadiaaaaaonia
abaaoeiabhaaaakaaeaaaaaeabaaadiaaaaaoniaabaaoeiabhaaffkaaeaaaaae
abaaadiaaaaaoniaabaaoeiabhaakkkaaeaaaaaeaaaaakiaaaaaoeiaabaagaia
bgaaaakaafaaaaadaaaaakiaaaaaoeiaacaaoikaafaaaaadabaaadiaaaaaaaia
abaaoekaafaaaaadaaaaafiaaaaakkiaadaanekaaeaaaaaeaaaaafiaaaaaoeia
bgaakkkabgaappkabdaaaaacaaaaafiaaaaaoeiaaeaaaaaeaaaaafiaaaaaoeia
biaaaakabiaaffkaafaaaaadaaaaafiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadia
abaaoeiabgaakkkabgaappkabdaaaaacabaaadiaabaaoeiaaeaaaaaeabaaadia
abaaoeiabiaaaakabiaaffkaafaaaaadabaaadiaabaaoeiaabaaoeiaaeaaaaae
abaaamiaabaaeeiabiaakkkabiaappkaaeaaaaaeabaaamiaabaaeeiaabaaoeia
bhaaaakaaeaaaaaeabaaamiaabaaeeiaabaaoeiabhaaffkaaeaaaaaeabaaamia
abaaeeiaabaaoeiabhaakkkaaeaaaaaeabaaadiaabaaoeiaabaaooiabgaaaaka
aeaaaaaeaaaaakiaabaagaiaabaaoikaaaaaoeiaaeaaaaaeabaaadiaaaaaoiia
biaakkkabiaappkaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabhaaaakaaeaaaaae
abaaadiaaaaaoiiaabaaoeiabhaaffkaaeaaaaaeabaaadiaaaaaoiiaabaaoeia
bhaakkkaaeaaaaaeaaaaafiaaaaaoeiaabaaneiabgaaaakaaeaaaaaeaaaaadia
aaaaoiiaadaaookaaaaaoniaacaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaad
aaaaaciaafaappjbbgaaaakaaeaaaaaeaaaaahiaaaaaaaiaaaaaffiaaaaaoeja
afaaaaadabaaapiaaaaaffiaaoaaoekaaeaaaaaeabaaapiaanaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
baaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
oeafaaaaeaaaabaahjabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
aeaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaa
adaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
abaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaaikcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaagkcaabaaa
aaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafganbaaa
aaaaaaaakgiocaaaaaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaaagaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaakgakbaaa
aaaaaaaaagibcaaaaaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaaaanaaaaa
agacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaaabaaaaaa
dcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaaafaaaaaa
fganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaaogikcaaa
aaaaaaaaahaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
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
hccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WindX]
Vector 11 [_WindY]
Vector 12 [_WindZ]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[19] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..14],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[15];
MAX R0.y, R0, c[15].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[10];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[11];
ADD R0.x, R0, -c[15].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[15].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[15];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[15].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[15];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
MAD R1.xyz, R1, R0, c[17].xyxw;
MAD R1.xyz, R1, R0, c[17].zwzw;
ADD R3.xyz, R3, c[16].xyxw;
MAD R3.xyz, R3, R2, c[16].zwzw;
MAD R3.xyz, R3, R2, c[17].xyxw;
MAD R1.xyz, R1, R0, c[18].xyxw;
SGE R4.yz, R4.y, c[18].xzww;
DP3 R0.y, R4, c[18].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[17].zwzw;
MAD R0.xyz, R0, R2, c[18].xyxw;
MUL R3.x, R1, c[10].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[15].w;
SGE R1.yz, R2.w, c[18].xzww;
DP3 R1.y, R1, c[18].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[15];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[12].y;
MUL R0.y, R0, c[11].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[15].w;
FRC R4.y, R0;
MUL R0.x, R0, c[12];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[15].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[15];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[15].w;
ADD R1.xyz, -R1.w, c[15];
ADD R3.xyz, R2, c[16].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[16].zwzw;
MAD R3.xyz, R3, R0, c[17].xyxw;
MAD R3.xyz, R3, R0, c[17].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[16].xyxw;
MAD R2.xyz, R2, R1, c[16].zwzw;
MAD R2.xyz, R2, R1, c[17].xyxw;
MAD R3.xyz, R3, R0, c[18].xyxw;
SGE R4.yz, R4.y, c[18].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[18].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[17].zwzw;
MAD R0.xyz, R0, R1, c[18].xyxw;
MUL R3.x, R3, c[12].w;
SLT R1.x, R1.w, c[15].w;
SGE R1.yz, R1.w, c[18].xzww;
MOV R2.xz, R1;
DP3 R2.y, R1, c[18].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[12].z;
MUL R0.y, R3.w, c[11].x;
MUL R0.x, R0.w, c[10];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[15].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[15].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[15];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[15];
ADD R2.xyz, R2, c[16].xyxw;
MAD R2.xyz, R2, R1, c[16].zwzw;
MAD R2.xyz, R2, R1, c[17].xyxw;
MAD R2.xyz, R2, R1, c[17].zwzw;
MUL R0.xyz, R0, R0;
ADD R2.w, R2, R3.x;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[16].xyxw;
MAD R3.xyz, R3, R0, c[16].zwzw;
MAD R3.xyz, R3, R0, c[17].xyxw;
MAD R3.xyz, R3, R0, c[17].zwzw;
MAD R3.xyz, R3, R0, c[18].xyxw;
MAD R1.xyz, R2, R1, c[18].xyxw;
SLT R4.x, R3.w, c[15].w;
SGE R4.yz, R3.w, c[18].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[18].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[18].xzww;
SLT R0.x, R0.w, c[15].w;
DP3 R2.y, R0, c[18].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MOV R0.w, vertex.position;
MUL R0.y, R3.x, c[11].z;
MUL R0.x, R0, c[10].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R0.xyz, R0.x, R0.y, vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[13], c[13].zwzw;
END
# 134 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WindX]
Vector 10 [_WindY]
Vector 11 [_WindZ]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
"vs_2_0
def c14, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c15, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c16, 0.00000000, 0.15915491, 0.50000000, 0
def c17, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0, c4
dp4 r0.x, c14.z, r0
min r1.x, v0.z, c14.z
min r0.z, v0.y, c14
add r0.x, r0, c8.y
max r0.y, r1.x, c16.x
add r2.w, r0.x, r0.y
max r0.z, r0, c16.x
min r0.y, v0.x, c14.z
max r0.y, r0, c16.x
add r2.x, r0, r0.y
add r2.y, r0.x, r0.z
mul r0.x, r2, c9.y
mul r0.y, r2, c10
mad r0.y, r0, c16, c16.z
frc r0.y, r0
mad r0.x, r0, c16.y, c16.z
frc r0.x, r0
mad r1.x, r0.y, c17, c17.y
mad r2.z, r0.x, c17.x, c17.y
sincos r0.xy, r1.x, c15.xyzw, c14.xyzw
sincos r1.xy, r2.z, c15.xyzw, c14.xyzw
mul r0.x, r1.y, c9.w
mul r0.y, r0, c10.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c11.y
mul r0.x, r2.w, c11
mad r0.x, r0, c16.y, c16.z
mad r0.y, r3.x, c16, c16.z
frc r0.y, r0
mad r1.y, r0, c17.x, c17
frc r1.x, r0
sincos r0.xy, r1.y, c15.xyzw, c14.xyzw
mad r0.x, r1, c17, c17.y
sincos r1.xy, r0.x, c15.xyzw, c14.xyzw
mul r0.x, r0.y, c11.w
add r2.z, r2, r0.x
mul r0.x, r2, c9
mul r0.y, r2, c10.x
mad r0.y, r0, c16, c16.z
frc r0.y, r0
mad r0.x, r0, c16.y, c16.z
frc r0.x, r0
mad r1.x, r0.y, c17, c17.y
mad r2.x, r0, c17, c17.y
sincos r0.xy, r1.x, c15.xyzw, c14.xyzw
mul r2.w, r1.y, c11.z
sincos r1.xy, r2.x, c15.xyzw, c14.xyzw
mov r0.w, v0
mul r0.y, r0, c10.z
mul r0.x, r1.y, c9.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c14.z
mad r0.xyz, r0.x, r0.y, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v5
mad oT0.xy, v3, c13, c13.zwzw
mad oT1.xy, v4, c12, c12.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbblhhifbkkmkineglappligoglfijmocabaaaaaapeajaaaaaeaaaaaa
daaaaaaamaaeaaaakaaiaaaagiajaaaaebgpgodjiiaeaaaaiiaeaaaaaaacpopp
daaeaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaafaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaaeaaalaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafapaaapkaaaaaiadp
aaaaaaaaidpjccdoaaaaiadofbaaaaafbaaaapkalkajlglkkekkckdnaaaaaalp
aaaaaaaafbaaaaafbbaaapkanlapmjeanlapejmagdibihlekblfmpdhbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaooka
aeaaaaaeaaaaamoaaeaabejaaeaabekaaeaalekaabaaaaacaaaaabiaalaaaaka
acaaaaadaaaaabiaaaaaaaiaamaaaakaacaaaaadaaaaabiaaaaaaaiaanaaaaka
acaaaaadaaaaabiaaaaaaaiaaoaaaakaacaaaaadaaaaabiaaaaaaaiaagaaffka
alaaaaadaaaaaoiaaaaajajaapaaffkaakaaaaadaaaaaoiaaaaaoeiaapaaaaka
acaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaadaaaaakiaaaaaffiaacaagaka
aeaaaaaeaaaaakiaaaaaoeiaapaakkkaapaappkabdaaaaacaaaaakiaaaaaoeia
aeaaaaaeaaaaakiaaaaaoeiabbaaaakabbaaffkaafaaaaadaaaaakiaaaaaoeia
aaaaoeiaaeaaaaaeabaaadiaaaaaoniabbaakkkabbaappkaaeaaaaaeabaaadia
aaaaoniaabaaoeiabaaaaakaaeaaaaaeabaaadiaaaaaoniaabaaoeiabaaaffka
aeaaaaaeabaaadiaaaaaoniaabaaoeiabaaakkkaaeaaaaaeaaaaakiaaaaaoeia
abaagaiaapaaaakaafaaaaadaaaaakiaaaaaoeiaacaaoikaafaaaaadabaaadia
aaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkiaadaanekaaeaaaaaeaaaaafia
aaaaoeiaapaakkkaapaappkabdaaaaacaaaaafiaaaaaoeiaaeaaaaaeaaaaafia
aaaaoeiabbaaaakabbaaffkaafaaaaadaaaaafiaaaaaoeiaaaaaoeiaaeaaaaae
abaaadiaabaaoeiaapaakkkaapaappkabdaaaaacabaaadiaabaaoeiaaeaaaaae
abaaadiaabaaoeiabbaaaakabbaaffkaafaaaaadabaaadiaabaaoeiaabaaoeia
aeaaaaaeabaaamiaabaaeeiabbaakkkabbaappkaaeaaaaaeabaaamiaabaaeeia
abaaoeiabaaaaakaaeaaaaaeabaaamiaabaaeeiaabaaoeiabaaaffkaaeaaaaae
abaaamiaabaaeeiaabaaoeiabaaakkkaaeaaaaaeabaaadiaabaaoeiaabaaooia
apaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoikaaaaaoeiaaeaaaaaeabaaadia
aaaaoiiabbaakkkabbaappkaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabaaaaaka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiabaaaffkaaeaaaaaeabaaadiaaaaaoiia
abaaoeiabaaakkkaaeaaaaaeaaaaafiaaaaaoeiaabaaneiaapaaaakaaeaaaaae
aaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaadaaaaabiaaaaaffiaaaaaaaia
acaaaaadaaaaaciaafaappjbapaaaakaaeaaaaaeaaaaahiaaaaaaaiaaaaaffia
aaaaoejaafaaaaadabaaapiaaaaaffiaaiaaoekaaeaaaaaeabaaapiaahaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaa
fdeieefcniadaaaaeaaaabaapgaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacacaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaaakiacaaaacaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaacaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaacaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaa
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaa
diaaaaaikcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaagaaaaaa
enaaaaagkcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaa
aaaaaaaafganbaaaaaaaaaaakgiocaaaaaaaaaaaagaaaaaadiaaaaaidcaabaaa
abaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaadiaaaaaifcaabaaa
aaaaaaaakgakbaaaaaaaaaaaagibcaaaaaaaaaaaahaaaaaaenaaaaagfcaabaaa
aaaaaaaaaanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaa
egaabaaaabaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaa
aaaaaaaaafaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaa
aaaaaaaaogikcaaaaaaaaaaaahaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
dkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaa
agaabaaaaaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaa
aaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
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
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_WindX]
Vector 20 [_WindY]
Vector 21 [_WindZ]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[27] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..22],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[23];
MAX R0.y, R0, c[23].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[19];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[20];
ADD R0.x, R0, -c[23].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[23].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[23];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[23].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[23];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[24].xyxw;
MAD R1.xyz, R1, R0, c[24].zwzw;
MAD R1.xyz, R1, R0, c[25].xyxw;
MAD R1.xyz, R1, R0, c[25].zwzw;
ADD R3.xyz, R3, c[24].xyxw;
MAD R3.xyz, R3, R2, c[24].zwzw;
MAD R3.xyz, R3, R2, c[25].xyxw;
MAD R1.xyz, R1, R0, c[26].xyxw;
SGE R4.yz, R4.y, c[26].xzww;
DP3 R0.y, R4, c[26].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[25].zwzw;
MAD R0.xyz, R0, R2, c[26].xyxw;
MUL R3.x, R1, c[19].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[23].w;
SGE R1.yz, R2.w, c[26].xzww;
DP3 R1.y, R1, c[26].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[23];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[21].y;
MUL R0.y, R0, c[20].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[23].w;
FRC R4.y, R0;
MUL R0.x, R0, c[21];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[23].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[23];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[23].w;
ADD R1.xyz, -R1.w, c[23];
ADD R3.xyz, R2, c[24].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[24].zwzw;
MAD R3.xyz, R3, R0, c[25].xyxw;
MAD R3.xyz, R3, R0, c[25].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[24].xyxw;
MAD R2.xyz, R2, R1, c[24].zwzw;
MAD R2.xyz, R2, R1, c[25].xyxw;
MAD R3.xyz, R3, R0, c[26].xyxw;
SGE R4.yz, R4.y, c[26].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[26].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[25].zwzw;
MAD R0.xyz, R0, R1, c[26].xyxw;
MUL R3.x, R3, c[21].w;
SLT R1.x, R1.w, c[23].w;
SGE R1.yz, R1.w, c[26].xzww;
ADD R2.w, R2, R3.x;
MOV R2.xz, R1;
DP3 R2.y, R1, c[26].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[21].z;
MUL R0.y, R3.w, c[20].x;
MUL R0.x, R0.w, c[19];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[23].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[23].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R3.w, c[23];
MUL R0.xyz, R0, R0;
MUL R3.xyz, R0, c[0].xyxw;
ADD R1.xyz, -R0.w, c[23];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R3.xyz, R3, c[24].xyxw;
MAD R3.xyz, R3, R0, c[24].zwzw;
MAD R3.xyz, R3, R0, c[25].xyxw;
MAD R3.xyz, R3, R0, c[25].zwzw;
ADD R2.xyz, R2, c[24].xyxw;
MAD R2.xyz, R2, R1, c[24].zwzw;
MAD R2.xyz, R2, R1, c[25].xyxw;
MAD R2.xyz, R2, R1, c[25].zwzw;
MAD R3.xyz, R3, R0, c[26].xyxw;
MAD R1.xyz, R2, R1, c[26].xyxw;
SLT R4.x, R3.w, c[23].w;
SGE R4.yz, R3.w, c[26].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[26].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[26].xzww;
SLT R0.x, R0.w, c[23].w;
DP3 R2.y, R0, c[26].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[20].z;
MUL R0.x, R0, c[19].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
MOV R1.w, vertex.position;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R1.xyz, R0.x, R0.y, vertex.position;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R1.xyz, vertex.normal, c[18].w;
MUL R2.xyz, R0.xyww, c[23].y;
MOV result.position, R0;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R3.w, R1, c[7];
MOV result.texcoord[3].zw, R0;
MUL R2.y, R2, c[10].x;
MOV R0.y, R2.w;
MOV R0.z, R3.w;
MUL R1, R0.xyzz, R0.yzzx;
ADD result.texcoord[3].xy, R2, R2.z;
MOV R0.w, c[0];
DP4 R2.z, R0, c[13];
DP4 R2.y, R0, c[12];
DP4 R2.x, R0, c[11];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[16];
DP4 R3.y, R1, c[15];
DP4 R3.x, R1, c[14];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[17];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R2.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 160 instructions, 5 R-regs
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
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_SHAr]
Vector 12 [unity_SHAg]
Vector 13 [unity_SHAb]
Vector 14 [unity_SHBr]
Vector 15 [unity_SHBg]
Vector 16 [unity_SHBb]
Vector 17 [unity_SHC]
Vector 18 [unity_Scale]
Vector 19 [_WindX]
Vector 20 [_WindY]
Vector 21 [_WindZ]
Vector 22 [_MainTex_ST]
"vs_2_0
def c23, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c24, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c25, 0.00000000, 0.15915491, 0.50000000, 0
def c26, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mov r0, c4
dp4 r0.x, c23.z, r0
min r1.x, v0.z, c23.z
min r0.z, v0.y, c23
add r0.x, r0, c8.y
max r0.y, r1.x, c25.x
add r2.z, r0.x, r0.y
max r0.z, r0, c25.x
min r0.y, v0.x, c23.z
max r0.y, r0, c25.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c20
mul r0.x, r2, c19.y
mad r0.y, r0, c25, c25.z
frc r0.y, r0
mad r0.x, r0, c25.y, c25.z
frc r0.x, r0
mul r2.w, r2.z, c21.y
mad r1.x, r0.y, c26, c26.y
mad r3.x, r0, c26, c26.y
sincos r0.xy, r1.x, c24.xyzw, c23.xyzw
sincos r1.xy, r3.x, c24.xyzw, c23.xyzw
mul r0.x, r1.y, c19.w
mul r0.y, r0, c20.w
add r3.x, r0, r0.y
mad r0.y, r2.w, c25, c25.z
mul r0.x, r2.z, c21
frc r0.y, r0
mad r0.x, r0, c25.y, c25.z
mad r1.y, r0, c26.x, c26
frc r1.x, r0
sincos r0.xy, r1.y, c24.xyzw, c23.xyzw
mad r0.x, r1, c26, c26.y
sincos r1.xy, r0.x, c24.xyzw, c23.xyzw
mul r0.x, r0.y, c21.w
add r2.z, r3.x, r0.x
mul r0.y, r2, c20.x
mul r0.x, r2, c19
mad r0.y, r0, c25, c25.z
frc r0.y, r0
mad r0.x, r0, c25.y, c25.z
frc r0.x, r0
mul r2.w, r1.y, c21.z
mad r1.x, r0.y, c26, c26.y
mad r2.x, r0, c26, c26.y
sincos r0.xy, r1.x, c24.xyzw, c23.xyzw
sincos r1.xy, r2.x, c24.xyzw, c23.xyzw
mov r1.w, v0
mov r0.w, c23.z
mul r0.y, r0, c20.z
mul r0.x, r1.y, c19.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
mul r2.xyz, v2, c18.w
dp3 r4.w, r2, c5
dp3 r5.x, r2, c6
add r0.y, -v5.w, c23.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r3.w, r1, c3
dp4 r3.x, r1, c0
dp4 r3.y, r1, c1
mul r0.xyz, r3.xyww, c23.w
mul r0.y, r0, c9.x
mad oT3.xy, r0.z, c10.zwzw, r0
dp3 r0.x, r2, c4
mov r0.y, r4.w
mov r0.z, r5.x
mul r2, r0.xyzz, r0.yzzx
dp4 r4.z, r0, c13
dp4 r4.y, r0, c12
dp4 r4.x, r0, c11
dp4 r0.w, r2, c16
dp4 r0.z, r2, c15
dp4 r0.y, r2, c14
mul r3.z, r4.w, r4.w
mad r2.w, r0.x, r0.x, -r3.z
dp4 r3.z, r1, c2
add r2.xyz, r4, r0.yzww
mul r4.xyz, r2.w, c17
add oT2.xyz, r2, r4
mov oPos, r3
mov oT3.zw, r3
mov oD0, v5
mov oT1.z, r5.x
mov oT1.y, r4.w
mov oT1.x, r0
mad oT0.xy, v3, c22, c22.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 144 [_WindX]
Vector 160 [_WindY]
Vector 176 [_WindZ]
Vector 192 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedcclmodiojopcgnmadpgcgcbcfgkbogbpabaaaaaadmaoaaaaaeaaaaaa
daaaaaaadeagaaaaliamaaaaiaanaaaaebgpgodjpmafaaaapmafaaaaaaacpopp
iaafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaajaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaacgaaahaaahaaaaaaaaaaadaaaaaaaeaaaoaaaaaaaaaaadaaamaaaeaabcaa
aaaaaaaaadaabeaaabaabgaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapka
aaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafbiaaapkalkajlglkkekkckdn
aaaaaalpaaaaaadpfbaaaaafbjaaapkanlapmjeanlapejmagdibihlekblfmpdh
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaaeaaoeka
aeaaookaafaaaaadaaaaahiaacaaoejabgaappkaafaaaaadabaaahiaaaaaffia
bdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahia
beaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabhaaaakaajaaaaadabaaabia
ahaaoekaaaaaoeiaajaaaaadabaaaciaaiaaoekaaaaaoeiaajaaaaadabaaaeia
ajaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabia
akaaoekaacaaoeiaajaaaaadadaaaciaalaaoekaacaaoeiaajaaaaadadaaaeia
amaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiia
aaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaac
acaaahoaaaaaoeiaaeaaaaaeadaaahoaanaaoekaaaaappiaabaaoeiaabaaaaac
aaaaabiabcaaaakaacaaaaadaaaaabiaaaaaaaiabdaaaakaacaaaaadaaaaabia
aaaaaaiabeaaaakaacaaaaadaaaaabiaaaaaaaiabfaaaakaacaaaaadaaaaabia
aaaaaaiaafaaffkaalaaaaadaaaaaoiaaaaajajabhaaffkaakaaaaadaaaaaoia
aaaaoeiabhaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaadaaaaakia
aaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiabhaakkkabhaappkabdaaaaac
aaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiabjaaaakabjaaffkaafaaaaad
aaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniabjaakkkabjaappka
aeaaaaaeabaaadiaaaaaoniaabaaoeiabiaaaakaaeaaaaaeabaaadiaaaaaonia
abaaoeiabiaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabiaakkkaaeaaaaae
aaaaakiaaaaaoeiaabaagaiabhaaaakaafaaaaadaaaaakiaaaaaoeiaacaaoika
afaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkiaadaaneka
aeaaaaaeaaaaafiaaaaaoeiabhaakkkabhaappkabdaaaaacaaaaafiaaaaaoeia
aeaaaaaeaaaaafiaaaaaoeiabjaaaakabjaaffkaafaaaaadaaaaafiaaaaaoeia
aaaaoeiaaeaaaaaeabaaadiaabaaoeiabhaakkkabhaappkabdaaaaacabaaadia
abaaoeiaaeaaaaaeabaaadiaabaaoeiabjaaaakabjaaffkaafaaaaadabaaadia
abaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiabjaakkkabjaappkaaeaaaaae
abaaamiaabaaeeiaabaaoeiabiaaaakaaeaaaaaeabaaamiaabaaeeiaabaaoeia
biaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiabiaakkkaaeaaaaaeabaaadia
abaaoeiaabaaooiabhaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoikaaaaaoeia
aeaaaaaeabaaadiaaaaaoiiabjaakkkabjaappkaaeaaaaaeabaaadiaaaaaoiia
abaaoeiabiaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabiaaffkaaeaaaaae
abaaadiaaaaaoiiaabaaoeiabiaakkkaaeaaaaaeaaaaafiaaaaaoeiaabaaneia
bhaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaadaaaaabia
aaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbbhaaaakaaeaaaaaeaaaaahia
aaaaaaiaaaaaffiaaaaaoejaafaaaaadabaaapiaaaaaffiaapaaoekaaeaaaaae
abaaapiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaappjaaaaaoeiaafaaaaadabaaabia
aaaaffiaagaaaakaafaaaaadabaaaiiaabaaaaiabiaappkaafaaaaadabaaafia
aaaapeiabiaappkaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoa
aaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefchmagaaaaeaaaabaa
jpabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacafaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaa
akiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaai
kcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaakaaaaaaenaaaaag
kcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaa
fganbaaaaaaaaaaakgiocaaaaaaaaaaaakaaaaaadiaaaaaidcaabaaaabaaaaaa
agaabaaaaaaaaaaaegiacaaaaaaaaaaaajaaaaaadiaaaaaifcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaagibcaaaaaaaaaaaalaaaaaaenaaaaagfcaabaaaaaaaaaaa
aanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaa
abaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaa
ajaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaa
ogikcaaaaaaaaaaaalaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaa
aaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
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
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
afaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [_WindX]
Vector 12 [_WindY]
Vector 13 [_WindZ]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[20] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..15],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[16];
MAX R0.y, R0, c[16].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[11];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[12];
ADD R0.x, R0, -c[16].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[16].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[16];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[16].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[16];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[17].xyxw;
MAD R1.xyz, R1, R0, c[17].zwzw;
MAD R1.xyz, R1, R0, c[18].xyxw;
MAD R1.xyz, R1, R0, c[18].zwzw;
ADD R3.xyz, R3, c[17].xyxw;
MAD R3.xyz, R3, R2, c[17].zwzw;
MAD R3.xyz, R3, R2, c[18].xyxw;
MAD R1.xyz, R1, R0, c[19].xyxw;
SGE R4.yz, R4.y, c[19].xzww;
DP3 R0.y, R4, c[19].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[18].zwzw;
MAD R0.xyz, R0, R2, c[19].xyxw;
MUL R3.x, R1, c[11].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[16].w;
SGE R1.yz, R2.w, c[19].xzww;
DP3 R1.y, R1, c[19].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[16];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[13].y;
MUL R0.y, R0, c[12].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[16].w;
FRC R4.y, R0;
MUL R0.x, R0, c[13];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[16].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[16];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[16].w;
ADD R1.xyz, -R1.w, c[16];
ADD R3.xyz, R2, c[17].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[17].zwzw;
MAD R3.xyz, R3, R0, c[18].xyxw;
MAD R3.xyz, R3, R0, c[18].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[17].xyxw;
MAD R2.xyz, R2, R1, c[17].zwzw;
MAD R2.xyz, R2, R1, c[18].xyxw;
MAD R3.xyz, R3, R0, c[19].xyxw;
SGE R4.yz, R4.y, c[19].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[18].zwzw;
MAD R0.xyz, R0, R1, c[19].xyxw;
MUL R3.x, R3, c[13].w;
SLT R1.x, R1.w, c[16].w;
SGE R1.yz, R1.w, c[19].xzww;
MOV R2.xz, R1;
DP3 R2.y, R1, c[19].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[13].z;
MUL R0.y, R3.w, c[12].x;
MUL R0.x, R0.w, c[11];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[16].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[16].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[16];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[16];
ADD R2.xyz, R2, c[17].xyxw;
MAD R2.xyz, R2, R1, c[17].zwzw;
MAD R2.xyz, R2, R1, c[18].xyxw;
MAD R2.xyz, R2, R1, c[18].zwzw;
MUL R0.xyz, R0, R0;
ADD R2.w, R2, R3.x;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[17].xyxw;
MAD R3.xyz, R3, R0, c[17].zwzw;
MAD R3.xyz, R3, R0, c[18].xyxw;
MAD R3.xyz, R3, R0, c[18].zwzw;
MAD R3.xyz, R3, R0, c[19].xyxw;
MAD R1.xyz, R2, R1, c[19].xyxw;
SLT R4.x, R3.w, c[16].w;
SGE R4.yz, R3.w, c[19].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[19].xzww;
SLT R0.x, R0.w, c[16].w;
DP3 R2.y, R0, c[19].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[12].z;
MUL R0.x, R0, c[11].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
MOV R1.w, vertex.position;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R1.xyz, R0.x, R0.y, vertex.position;
DP4 R0.w, R1, c[4];
DP4 R0.z, R1, c[3];
DP4 R0.x, R1, c[1];
DP4 R0.y, R1, c[2];
MUL R2.xyz, R0.xyww, c[16].y;
MUL R2.y, R2, c[10].x;
ADD result.texcoord[2].xy, R2, R2.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[14], c[14].zwzw;
END
# 139 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [_WindX]
Vector 12 [_WindY]
Vector 13 [_WindZ]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c17, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c18, 0.00000000, 0.15915491, 0.50000000, 0
def c19, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r0, c4
dp4 r0.x, c16.z, r0
min r1.x, v0.z, c16.z
min r0.z, v0.y, c16
add r0.x, r0, c8.y
max r0.y, r1.x, c18.x
add r2.w, r0.x, r0.y
max r0.z, r0, c18.x
min r0.y, v0.x, c16.z
max r0.y, r0, c18.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c12
mul r0.x, r2, c11.y
mad r0.y, r0, c18, c18.z
frc r0.y, r0
mad r0.x, r0, c18.y, c18.z
frc r0.x, r0
mad r1.x, r0.y, c19, c19.y
mad r2.z, r0.x, c19.x, c19.y
sincos r0.xy, r1.x, c17.xyzw, c16.xyzw
sincos r1.xy, r2.z, c17.xyzw, c16.xyzw
mul r0.x, r1.y, c11.w
mul r0.y, r0, c12.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c13.y
mul r0.x, r2.w, c13
mad r0.x, r0, c18.y, c18.z
mad r0.y, r3.x, c18, c18.z
frc r0.y, r0
mad r1.y, r0, c19.x, c19
frc r1.x, r0
sincos r0.xy, r1.y, c17.xyzw, c16.xyzw
mad r0.x, r1, c19, c19.y
sincos r1.xy, r0.x, c17.xyzw, c16.xyzw
mul r0.x, r0.y, c13.w
add r2.z, r2, r0.x
mul r0.y, r2, c12.x
mul r0.x, r2, c11
mad r0.y, r0, c18, c18.z
frc r0.y, r0
mad r0.x, r0, c18.y, c18.z
frc r0.x, r0
mad r1.x, r0.y, c19, c19.y
mad r2.x, r0, c19, c19.y
sincos r0.xy, r1.x, c17.xyzw, c16.xyzw
mul r2.w, r1.y, c13.z
sincos r1.xy, r2.x, c17.xyzw, c16.xyzw
mov r1.w, v0
mul r0.y, r0, c12.z
mul r0.x, r1.y, c11.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c16.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r2.xyz, r0.xyww, c16.w
mul r2.y, r2, c9.x
mad oT2.xy, r2.z, c10.zwzw, r2
mov oPos, r0
mov oT2.zw, r0
mov oD0, v5
mad oT0.xy, v3, c15, c15.zwzw
mad oT1.xy, v4, c14, c14.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 224
Vector 144 [_WindX]
Vector 160 [_WindY]
Vector 176 [_WindZ]
Vector 192 [unity_LightmapST]
Vector 208 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedcecjengoicjpajidbpnedbcldkendnofabaaaaaapmakaaaaaeaaaaaa
daaaaaaabiafaaaajaajaaaafiakaaaaebgpgodjoaaeaaaaoaaeaaaaaaacpopp
hmaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaajaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaabaaafaaabaaahaaaaaaaaaa
acaaaaaaaeaaaiaaaaaaaaaaacaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafbbaaapka
lkajlglkkekkckdnaaaaaalpaaaaaadpfbaaaaafbcaaapkanlapmjeanlapejma
gdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoa
adaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoaaeaabejaaeaabekaaeaaleka
abaaaaacaaaaabiaamaaaakaacaaaaadaaaaabiaaaaaaaiaanaaaakaacaaaaad
aaaaabiaaaaaaaiaaoaaaakaacaaaaadaaaaabiaaaaaaaiaapaaaakaacaaaaad
aaaaabiaaaaaaaiaagaaffkaalaaaaadaaaaaoiaaaaajajabaaaffkaakaaaaad
aaaaaoiaaaaaoeiabaaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaad
aaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiabaaakkkabaaappka
bdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiabcaaaakabcaaffka
afaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniabcaakkka
bcaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabbaaaakaaeaaaaaeabaaadia
aaaaoniaabaaoeiabbaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabbaakkka
aeaaaaaeaaaaakiaaaaaoeiaabaagaiabaaaaakaafaaaaadaaaaakiaaaaaoeia
acaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkia
adaanekaaeaaaaaeaaaaafiaaaaaoeiabaaakkkabaaappkabdaaaaacaaaaafia
aaaaoeiaaeaaaaaeaaaaafiaaaaaoeiabcaaaakabcaaffkaafaaaaadaaaaafia
aaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiabaaakkkabaaappkabdaaaaac
abaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiabcaaaakabcaaffkaafaaaaad
abaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiabcaakkkabcaappka
aeaaaaaeabaaamiaabaaeeiaabaaoeiabbaaaakaaeaaaaaeabaaamiaabaaeeia
abaaoeiabbaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiabbaakkkaaeaaaaae
abaaadiaabaaoeiaabaaooiabaaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoika
aaaaoeiaaeaaaaaeabaaadiaaaaaoiiabcaakkkabcaappkaaeaaaaaeabaaadia
aaaaoiiaabaaoeiabbaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabbaaffka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiabbaakkkaaeaaaaaeaaaaafiaaaaaoeia
abaaneiabaaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbbaaaaakaaeaaaaae
aaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadabaaapiaaaaaffiaajaaoeka
aeaaaaaeabaaapiaaiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaahaaaakaafaaaaadabaaaiiaabaaaaiabbaappkaafaaaaad
abaaafiaaaaapeiabbaappkaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
acaaamoaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefchaaeaaaa
eaaaabaabmabaaaafjaaaaaeegiocaaaaaaaaaaaaoaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacacaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaa
acaaaaaaamaaaaaaakiacaaaacaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaacaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaa
agbjbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaa
aaaaaaaadiaaaaaikcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaa
akaaaaaaenaaaaagkcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaai
kcaabaaaaaaaaaaafganbaaaaaaaaaaakgiocaaaaaaaaaaaakaaaaaadiaaaaai
dcaabaaaabaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaajaaaaaadiaaaaai
fcaabaaaaaaaaaaakgakbaaaaaaaaaaaagibcaaaaaaaaaaaalaaaaaaenaaaaag
fcaabaaaaaaaaaaaaanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaa
aanaaaaaegaabaaaabaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaa
kgiocaaaaaaaaaaaajaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
igaabaaaaaaaaaaaogikcaaaaaaaaaaaalaaaaaangafbaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaa
aaaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaa
aaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaanaaaaaaogikcaaaaaaaaaaaanaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaamaaaaaakgiocaaaaaaaaaaaamaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
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
Vector 9 [_Time]
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
Vector 26 [_WindX]
Vector 27 [_WindY]
Vector 28 [_WindZ]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[34] = { { 1, 0, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..29],
		{ 0, 0.5, 1, -1 },
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MUL R6.xyz, vertex.normal, c[25].w;
DP3 R6.w, R6, c[6];
DP3 R7.x, R6, c[5];
MOV R0.x, c[0];
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].x;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].x;
MAX R0.x, R0.z, c[0].y;
MAX R0.y, R0, c[0];
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[26];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R4.y, R0.x;
MUL R0.y, R3.w, c[27];
MAD R1.x, R0.y, c[0].z, -c[0].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[30];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[0].w;
MAD R1.xyz, R0, c[31].xyxw, c[31].zwzw;
MAD R1.xyz, R1, R0, c[32].xyxw;
MAD R1.xyz, R1, R0, c[32].zwzw;
MAD R1.xyz, R1, R0, c[33].xyxw;
ADD R2.xyz, -R2.w, c[30];
MUL R2.xyz, R2, R2;
MAD R3.xyz, R2, c[31].xyxw, c[31].zwzw;
MAD R3.xyz, R3, R2, c[32].xyxw;
MAD R3.xyz, R3, R2, c[32].zwzw;
MAD R1.xyz, R1, R0, c[30].wzww;
SGE R4.yz, R4.y, c[33].xzww;
DP3 R0.y, R4, c[30].wzww;
MOV R0.xz, R4;
DP3 R0.x, R1, -R0;
MAD R1.xyz, R3, R2, c[33].xyxw;
MUL R3.x, R0, c[26].w;
MAD R0.xyz, R1, R2, c[30].wzww;
MIN R2.x, vertex.position.z, c[0];
SLT R1.x, R2.w, c[0].w;
SGE R1.yz, R2.w, c[33].xzww;
DP3 R1.y, R1, c[30].wzww;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[0].y;
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[28].y;
MUL R0.y, R0, c[27].w;
ADD R2.w, R3.x, R0.y;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R4.y, R0;
MUL R0.x, R0, c[28];
MAD R0.x, R0, c[0].z, -c[0].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[30];
MUL R0.xyz, R1, R1;
MAD R2.xyz, R0, c[31].xyxw, c[31].zwzw;
MAD R3.xyz, R2, R0, c[32].xyxw;
MAD R3.xyz, R3, R0, c[32].zwzw;
MAD R3.xyz, R3, R0, c[33].xyxw;
SLT R4.x, R4.y, c[0].w;
ADD R1.xyz, -R1.w, c[30];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[31].xyxw, c[31].zwzw;
MAD R2.xyz, R2, R1, c[32].xyxw;
MAD R2.xyz, R2, R1, c[32].zwzw;
MAD R3.xyz, R3, R0, c[30].wzww;
SGE R4.yz, R4.y, c[33].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[30].wzww;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[33].xyxw;
MUL R3.x, R3, c[28].w;
MAD R0.xyz, R0, R1, c[30].wzww;
SLT R2.x, R1.w, c[0].w;
SGE R2.yz, R1.w, c[33].xzww;
ADD R2.w, R2, R3.x;
MOV R7.y, R6.w;
MOV R1.xz, R2;
DP3 R1.y, R2, c[30].wzww;
DP3 R0.x, R0, -R1;
MUL R1.w, R0.x, c[28].z;
MUL R0.y, R3.w, c[27].x;
MUL R0.x, R0.w, c[26];
MAD R0.y, R0, c[0].z, -c[0].w;
FRC R3.w, R0.y;
MAD R0.x, R0, c[0].z, -c[0].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R3.w, c[30];
MUL R0.xyz, R0, R0;
MAD R3.xyz, R0, c[31].xyxw, c[31].zwzw;
MAD R3.xyz, R3, R0, c[32].xyxw;
MAD R3.xyz, R3, R0, c[32].zwzw;
MAD R3.xyz, R3, R0, c[33].xyxw;
ADD R1.xyz, -R0.w, c[30];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[31].xyxw, c[31].zwzw;
MAD R2.xyz, R2, R1, c[32].xyxw;
MAD R2.xyz, R2, R1, c[32].zwzw;
MAD R2.xyz, R2, R1, c[33].xyxw;
MAD R2.xyz, R2, R1, c[30].wzww;
MAD R3.xyz, R3, R0, c[30].wzww;
SLT R4.x, R3.w, c[0].w;
SGE R4.yz, R3.w, c[33].xzww;
SLT R1.x, R0.w, c[0].w;
SGE R1.yz, R0.w, c[33].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[30].wzww;
DP3 R3.x, R3, -R0;
MOV R0.xz, R1;
DP3 R0.y, R1, c[30].wzww;
DP3 R0.x, R2, -R0;
MUL R0.y, R3.x, c[27].z;
MUL R0.x, R0, c[26].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
MOV R1.w, vertex.position;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].x;
MAD R1.xyz, R0.x, R0.y, vertex.position;
DP4 R0.x, R1, c[6];
ADD R3, -R0.x, c[11];
MUL R0, R3, R3;
DP4 R2.x, R1, c[5];
ADD R2, -R2.x, c[10];
MAD R4, R2, R2, R0;
DP4 R5.x, R1, c[7];
ADD R0, -R5.x, c[12];
MAD R4, R0, R0, R4;
MUL R3, R6.w, R3;
MAD R2, R7.x, R2, R3;
DP3 R3.x, R6, c[7];
MAD R0, R3.x, R0, R2;
MUL R5, R4, c[13];
MOV R7.z, R3.x;
RSQ R2.x, R4.x;
MOV R7.w, c[0].x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[15];
MAD R2.xyz, R0.x, c[14], R2;
MAD R0.xyz, R0.z, c[16], R2;
MAD R2.xyz, R0.w, c[17], R0;
MUL R0, R7.xyzz, R7.yzzx;
MUL R2.w, R6, R6;
DP4 R5.z, R0, c[23];
DP4 R5.y, R0, c[22];
DP4 R5.x, R0, c[21];
MAD R2.w, R7.x, R7.x, -R2;
DP4 R4.z, R7, c[20];
DP4 R4.y, R7, c[19];
DP4 R4.x, R7, c[18];
MUL R0.xyz, R2.w, c[24];
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
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
END
# 173 instructions, 8 R-regs
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
Vector 8 [_Time]
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
Vector 25 [_WindX]
Vector 26 [_WindY]
Vector 27 [_WindZ]
Vector 28 [_MainTex_ST]
"vs_2_0
def c29, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c30, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c31, 0.00000000, 0.15915491, 0.50000000, 0
def c32, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r4.xyz, v2, c24.w
dp3 r5.x, r4, c4
dp3 r4.w, r4, c5
dp3 r4.x, r4, c6
mov r0, c4
dp4 r0.x, c29.z, r0
min r1.x, v0.z, c29.z
min r0.z, v0.y, c29
mov r5.z, r4.x
add r0.x, r0, c8.y
max r0.y, r1.x, c31.x
add r2.z, r0.x, r0.y
max r0.z, r0, c31.x
min r0.y, v0.x, c29.z
max r0.y, r0, c31.x
add r2.x, r0, r0.z
add r2.y, r0.x, r0
mul r0.y, r2.x, c26
mul r0.x, r2.y, c25.y
mad r0.y, r0, c31, c31.z
frc r0.y, r0
mad r0.x, r0, c31.y, c31.z
frc r0.x, r0
mov r5.w, c29.z
mul r2.w, r2.z, c27.y
mad r1.x, r0.y, c32, c32.y
mad r3.x, r0, c32, c32.y
sincos r0.xy, r1.x, c30.xyzw, c29.xyzw
sincos r1.xy, r3.x, c30.xyzw, c29.xyzw
mul r0.x, r1.y, c25.w
mul r0.y, r0, c26.w
add r3.x, r0, r0.y
mad r0.y, r2.w, c31, c31.z
mul r0.x, r2.z, c27
frc r0.y, r0
mad r0.x, r0, c31.y, c31.z
mad r1.y, r0, c32.x, c32
frc r1.x, r0
sincos r0.xy, r1.y, c30.xyzw, c29.xyzw
mad r0.x, r1, c32, c32.y
sincos r1.xy, r0.x, c30.xyzw, c29.xyzw
mul r0.x, r0.y, c27.w
add r2.z, r3.x, r0.x
mul r0.y, r2.x, c26.x
mul r0.x, r2.y, c25
mad r0.y, r0, c31, c31.z
frc r0.y, r0
mad r0.x, r0, c31.y, c31.z
frc r0.x, r0
mul r2.w, r1.y, c27.z
mad r1.x, r0.y, c32, c32.y
mad r2.x, r0, c32, c32.y
sincos r0.xy, r1.x, c30.xyzw, c29.xyzw
sincos r1.xy, r2.x, c30.xyzw, c29.xyzw
mov r1.w, v0
mul r0.y, r0, c26.z
mul r0.x, r1.y, c25.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c29.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r0.y, r1, c5
add r2, -r0.y, c10
mul r3, r4.w, r2
dp4 r0.x, r1, c4
add r0, -r0.x, c9
mul r2, r2, r2
mad r3, r5.x, r0, r3
dp4 r5.y, r1, c6
mad r2, r0, r0, r2
add r0, -r5.y, c11
mad r2, r0, r0, r2
mad r0, r4.x, r0, r3
mul r3, r2, c12
mov r5.y, r4.w
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.w, r2.w
rsq r2.z, r2.z
mul r0, r0, r2
add r2, r3, c29.z
dp4 r3.z, r5, c19
dp4 r3.y, r5, c18
dp4 r3.x, r5, c17
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c31.x
mul r0, r0, r2
mul r2.xyz, r0.y, c14
mad r2.xyz, r0.x, c13, r2
mad r0.xyz, r0.z, c15, r2
mad r2.xyz, r0.w, c16, r0
mul r0, r5.xyzz, r5.yzzx
mul r2.w, r4, r4
dp4 r5.w, r0, c22
dp4 r5.z, r0, c21
dp4 r5.y, r0, c20
mad r2.w, r5.x, r5.x, -r2
mul r0.xyz, r2.w, c23
add r3.xyz, r3, r5.yzww
add r0.xyz, r3, r0
add oT2.xyz, r0, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
mov oT1.z, r4.x
mov oT1.y, r4.w
mov oT1.x, r5
mad oT0.xy, v3, c28, c28.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedeoepkaklkmhmdgpjgdknplhjmknglfbeabaaaaaaiibcaaaaaeaaaaaa
daaaaaaaoaahaaaabmbbaaaaoebbaaaaebgpgodjkiahaaaakiahaaaaaaacpopp
cmahaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaacaaaiaaagaaaaaaaaaa
acaacgaaahaaaoaaaaaaaaaaadaaaaaaaeaabfaaaaaaaaaaadaaamaaaeaabjaa
aaaaaaaaadaabeaaabaabnaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapka
aaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafbpaaapkalkajlglkkekkckdn
aaaaaalpaaaaaaaafbaaaaafcaaaapkanlapmjeanlapejmagdibihlekblfmpdh
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaaeaaoeka
aeaaookaabaaaaacaaaaabiabjaaaakaacaaaaadaaaaabiaaaaaaaiabkaaaaka
acaaaaadaaaaabiaaaaaaaiablaaaakaacaaaaadaaaaabiaaaaaaaiabmaaaaka
acaaaaadaaaaabiaaaaaaaiaafaaffkaalaaaaadaaaaaoiaaaaajajaboaaffka
akaaaaadaaaaaoiaaaaaoeiaboaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaia
afaaaaadaaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiaboaakkka
boaappkabdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiacaaaaaka
caaaffkaafaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaonia
caaakkkacaaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabpaaaakaaeaaaaae
abaaadiaaaaaoniaabaaoeiabpaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeia
bpaakkkaaeaaaaaeaaaaakiaaaaaoeiaabaagaiaboaaaakaafaaaaadaaaaakia
aaaaoeiaacaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafia
aaaakkiaadaanekaaeaaaaaeaaaaafiaaaaaoeiaboaakkkaboaappkabdaaaaac
aaaaafiaaaaaoeiaaeaaaaaeaaaaafiaaaaaoeiacaaaaakacaaaffkaafaaaaad
aaaaafiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiaboaakkkaboaappka
bdaaaaacabaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiacaaaaakacaaaffka
afaaaaadabaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiacaaakkka
caaappkaaeaaaaaeabaaamiaabaaeeiaabaaoeiabpaaaakaaeaaaaaeabaaamia
abaaeeiaabaaoeiabpaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiabpaakkka
aeaaaaaeabaaadiaabaaoeiaabaaooiaboaaaakaaeaaaaaeaaaaakiaabaagaia
abaaoikaaaaaoeiaaeaaaaaeabaaadiaaaaaoiiacaaakkkacaaappkaaeaaaaae
abaaadiaaaaaoiiaabaaoeiabpaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeia
bpaaffkaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabpaakkkaaeaaaaaeaaaaafia
aaaaoeiaabaaneiaboaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaonia
acaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbboaaaaka
aeaaaaaeaaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadabaaahiaaaaaffia
bkaaoekaaeaaaaaeabaaahiabjaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahia
blaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiabmaaoekaaaaappjaabaaoeia
acaaaaadacaaapiaabaaffibahaaoekaafaaaaadadaaapiaacaaoeiaacaaoeia
acaaaaadaeaaapiaabaaaaibagaaoekaacaaaaadabaaapiaabaakkibaiaaoeka
aeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeiaaeaaaaaeadaaapiaabaaoeia
abaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaiaahaaaaacafaaaciaadaaffia
ahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiiaadaappiaabaaaaacagaaabia
boaaaakaaeaaaaaeadaaapiaadaaoeiaajaaoekaagaaaaiaafaaaaadagaaahia
acaaoejabnaappkaafaaaaadahaaahiaagaaffiabkaaoekaaeaaaaaeagaaalia
bjaakekaagaaaaiaahaakeiaaeaaaaaeagaaahiablaaoekaagaakkiaagaapeia
afaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaaeacaaapiaaeaaoeiaagaaaaia
acaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkiaacaaoeiaafaaaaadabaaapia
afaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeiaboaaffkaagaaaaacacaaabia
adaaaaiaagaaaaacacaaaciaadaaffiaagaaaaacacaaaeiaadaakkiaagaaaaac
acaaaiiaadaappiaafaaaaadabaaapiaabaaoeiaacaaoeiaafaaaaadacaaahia
abaaffiaalaaoekaaeaaaaaeacaaahiaakaaoekaabaaaaiaacaaoeiaaeaaaaae
abaaahiaamaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahiaanaaoekaabaappia
abaaoeiaabaaaaacagaaaiiaboaaaakaajaaaaadacaaabiaaoaaoekaagaaoeia
ajaaaaadacaaaciaapaaoekaagaaoeiaajaaaaadacaaaeiabaaaoekaagaaoeia
afaaaaadadaaapiaagaacjiaagaakeiaajaaaaadaeaaabiabbaaoekaadaaoeia
ajaaaaadaeaaaciabcaaoekaadaaoeiaajaaaaadaeaaaeiabdaaoekaadaaoeia
acaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaaiiaagaaffiaagaaffia
aeaaaaaeaaaaaiiaagaaaaiaagaaaaiaaaaappibabaaaaacacaaahoaagaaoeia
aeaaaaaeacaaahiabeaaoekaaaaappiaacaaoeiaacaaaaadadaaahoaabaaoeia
acaaoeiaafaaaaadabaaapiaaaaaffiabgaaoekaaeaaaaaeabaaapiabfaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaapiabiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaa
fdeieefcdeajaaaaeaaaabaaenacaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaa
akiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaai
kcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaag
kcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaa
fganbaaaaaaaaaaakgiocaaaaaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaa
agaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaagibcaaaaaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaa
aanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaa
abaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaa
afaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaa
ogikcaaaaaaaaaaaahaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaa
aaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
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
icaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
aaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajpcaabaaaadaaaaaaagaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaa
egiocaaaacaaaaaaaeaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaa
egaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaaaaaaaaa
kgakbaaaabaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaadaaaaaa
egaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
acaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
aaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaadaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
ahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaah
hccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_ProjectionParams]
Vector 11 [unity_4LightPosX0]
Vector 12 [unity_4LightPosY0]
Vector 13 [unity_4LightPosZ0]
Vector 14 [unity_4LightAtten0]
Vector 15 [unity_LightColor0]
Vector 16 [unity_LightColor1]
Vector 17 [unity_LightColor2]
Vector 18 [unity_LightColor3]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Vector 27 [_WindX]
Vector 28 [_WindY]
Vector 29 [_WindZ]
Vector 30 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[35] = { { 1, 0, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..30],
		{ 0, 0.5, 1, -1 },
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
MUL R6.xyz, vertex.normal, c[26].w;
DP3 R6.w, R6, c[6];
DP3 R7.x, R6, c[5];
MOV R0.x, c[0];
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].x;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].x;
MAX R0.x, R0.z, c[0].y;
MAX R0.y, R0, c[0];
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[27];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R4.y, R0.x;
MUL R0.y, R3.w, c[28];
MAD R1.x, R0.y, c[0].z, -c[0].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[31];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[0].w;
MAD R1.xyz, R0, c[32].xyxw, c[32].zwzw;
MAD R1.xyz, R1, R0, c[33].xyxw;
MAD R1.xyz, R1, R0, c[33].zwzw;
MAD R1.xyz, R1, R0, c[34].xyxw;
ADD R2.xyz, -R2.w, c[31];
MUL R2.xyz, R2, R2;
MAD R3.xyz, R2, c[32].xyxw, c[32].zwzw;
MAD R3.xyz, R3, R2, c[33].xyxw;
MAD R3.xyz, R3, R2, c[33].zwzw;
MAD R1.xyz, R1, R0, c[31].wzww;
SGE R4.yz, R4.y, c[34].xzww;
DP3 R0.y, R4, c[31].wzww;
MOV R0.xz, R4;
DP3 R0.x, R1, -R0;
MAD R1.xyz, R3, R2, c[34].xyxw;
MUL R3.x, R0, c[27].w;
MAD R0.xyz, R1, R2, c[31].wzww;
MIN R2.x, vertex.position.z, c[0];
SLT R1.x, R2.w, c[0].w;
SGE R1.yz, R2.w, c[34].xzww;
DP3 R1.y, R1, c[31].wzww;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[0].y;
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[29].y;
MUL R0.y, R0, c[28].w;
ADD R2.w, R3.x, R0.y;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R4.y, R0;
MUL R0.x, R0, c[29];
MAD R0.x, R0, c[0].z, -c[0].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[31];
MUL R0.xyz, R1, R1;
MAD R2.xyz, R0, c[32].xyxw, c[32].zwzw;
MAD R3.xyz, R2, R0, c[33].xyxw;
MAD R3.xyz, R3, R0, c[33].zwzw;
MAD R3.xyz, R3, R0, c[34].xyxw;
SLT R4.x, R4.y, c[0].w;
ADD R1.xyz, -R1.w, c[31];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[32].xyxw, c[32].zwzw;
MAD R2.xyz, R2, R1, c[33].xyxw;
MAD R2.xyz, R2, R1, c[33].zwzw;
MAD R3.xyz, R3, R0, c[31].wzww;
SGE R4.yz, R4.y, c[34].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[31].wzww;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[34].xyxw;
MUL R3.x, R3, c[29].w;
MAD R0.xyz, R0, R1, c[31].wzww;
SLT R2.x, R1.w, c[0].w;
SGE R2.yz, R1.w, c[34].xzww;
ADD R2.w, R2, R3.x;
MOV R7.y, R6.w;
MOV R1.xz, R2;
DP3 R1.y, R2, c[31].wzww;
DP3 R0.x, R0, -R1;
MUL R1.w, R0.x, c[29].z;
MUL R0.y, R3.w, c[28].x;
MUL R0.x, R0.w, c[27];
MAD R0.y, R0, c[0].z, -c[0].w;
FRC R3.w, R0.y;
MAD R0.x, R0, c[0].z, -c[0].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R3.w, c[31];
MUL R0.xyz, R0, R0;
MAD R3.xyz, R0, c[32].xyxw, c[32].zwzw;
MAD R3.xyz, R3, R0, c[33].xyxw;
MAD R3.xyz, R3, R0, c[33].zwzw;
MAD R3.xyz, R3, R0, c[34].xyxw;
ADD R1.xyz, -R0.w, c[31];
MUL R1.xyz, R1, R1;
MAD R2.xyz, R1, c[32].xyxw, c[32].zwzw;
MAD R2.xyz, R2, R1, c[33].xyxw;
MAD R2.xyz, R2, R1, c[33].zwzw;
MAD R2.xyz, R2, R1, c[34].xyxw;
MAD R2.xyz, R2, R1, c[31].wzww;
MAD R3.xyz, R3, R0, c[31].wzww;
SLT R4.x, R3.w, c[0].w;
SGE R4.yz, R3.w, c[34].xzww;
SLT R1.x, R0.w, c[0].w;
SGE R1.yz, R0.w, c[34].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[31].wzww;
DP3 R3.x, R3, -R0;
MOV R0.xz, R1;
DP3 R0.y, R1, c[31].wzww;
DP3 R0.x, R2, -R0;
MUL R0.y, R3.x, c[28].z;
MUL R0.x, R0, c[27].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
MOV R1.w, vertex.position;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].x;
MAD R1.xyz, R0.x, R0.y, vertex.position;
DP4 R0.x, R1, c[6];
ADD R3, -R0.x, c[12];
MUL R0, R3, R3;
DP4 R2.x, R1, c[5];
ADD R2, -R2.x, c[11];
MUL R3, R6.w, R3;
MAD R4, R2, R2, R0;
MAD R2, R7.x, R2, R3;
DP3 R3.w, R6, c[7];
DP4 R5.x, R1, c[7];
ADD R0, -R5.x, c[13];
MAD R4, R0, R0, R4;
MAD R0, R3.w, R0, R2;
MUL R5, R4, c[14];
MOV R7.z, R3.w;
RSQ R2.x, R4.x;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[0].x;
MOV R7.w, c[0].x;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[16];
MAD R2.xyz, R0.x, c[15], R2;
MAD R0.xyz, R0.z, c[17], R2;
MAD R4.xyz, R0.w, c[18], R0;
MUL R0, R7.xyzz, R7.yzzx;
MUL R2.z, R6.w, R6.w;
DP4 R2.w, R1, c[4];
DP4 R2.x, R1, c[1];
DP4 R2.y, R1, c[2];
MUL R3.xyz, R2.xyww, c[31].y;
DP4 R6.z, R0, c[24];
DP4 R6.y, R0, c[23];
MAD R2.z, R7.x, R7.x, -R2;
DP4 R6.x, R0, c[22];
MUL R0.xyz, R2.z, c[25];
DP4 R2.z, R1, c[3];
DP4 R5.z, R7, c[21];
DP4 R5.y, R7, c[20];
DP4 R5.x, R7, c[19];
ADD R5.xyz, R5, R6;
ADD R0.xyz, R5, R0;
ADD result.texcoord[2].xyz, R0, R4;
MOV R0.x, R3;
MUL R0.y, R3, c[10].x;
ADD result.texcoord[3].xy, R0, R3.z;
MOV result.position, R2;
MOV result.texcoord[3].zw, R2;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
END
# 179 instructions, 8 R-regs
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
Vector 8 [_Time]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_4LightPosX0]
Vector 12 [unity_4LightPosY0]
Vector 13 [unity_4LightPosZ0]
Vector 14 [unity_4LightAtten0]
Vector 15 [unity_LightColor0]
Vector 16 [unity_LightColor1]
Vector 17 [unity_LightColor2]
Vector 18 [unity_LightColor3]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Vector 27 [_WindX]
Vector 28 [_WindY]
Vector 29 [_WindZ]
Vector 30 [_MainTex_ST]
"vs_2_0
def c31, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c32, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c33, 0.00000000, 0.15915491, 0.50000000, 0
def c34, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r4.xyz, v2, c26.w
dp3 r5.x, r4, c4
dp3 r4.w, r4, c5
dp3 r4.x, r4, c6
mov r0, c4
dp4 r0.x, c31.z, r0
min r1.x, v0.z, c31.z
min r0.z, v0.y, c31
mov r5.z, r4.x
add r0.x, r0, c8.y
max r0.y, r1.x, c33.x
add r2.z, r0.x, r0.y
max r0.z, r0, c33.x
min r0.y, v0.x, c31.z
max r0.y, r0, c33.x
add r2.x, r0, r0.z
add r2.y, r0.x, r0
mul r0.y, r2.x, c28
mul r0.x, r2.y, c27.y
mad r0.y, r0, c33, c33.z
frc r0.y, r0
mad r0.x, r0, c33.y, c33.z
frc r0.x, r0
mov r5.w, c31.z
mul r2.w, r2.z, c29.y
mad r1.x, r0.y, c34, c34.y
mad r3.x, r0, c34, c34.y
sincos r0.xy, r1.x, c32.xyzw, c31.xyzw
sincos r1.xy, r3.x, c32.xyzw, c31.xyzw
mul r0.x, r1.y, c27.w
mul r0.y, r0, c28.w
add r3.x, r0, r0.y
mad r0.y, r2.w, c33, c33.z
mul r0.x, r2.z, c29
frc r0.y, r0
mad r0.x, r0, c33.y, c33.z
mad r1.y, r0, c34.x, c34
frc r1.x, r0
sincos r0.xy, r1.y, c32.xyzw, c31.xyzw
mad r0.x, r1, c34, c34.y
sincos r1.xy, r0.x, c32.xyzw, c31.xyzw
mul r0.x, r0.y, c29.w
add r2.z, r3.x, r0.x
mul r0.y, r2.x, c28.x
mul r0.x, r2.y, c27
mad r0.y, r0, c33, c33.z
frc r0.y, r0
mad r0.x, r0, c33.y, c33.z
frc r0.x, r0
mul r2.w, r1.y, c29.z
mad r1.x, r0.y, c34, c34.y
mad r2.x, r0, c34, c34.y
sincos r0.xy, r1.x, c32.xyzw, c31.xyzw
sincos r1.xy, r2.x, c32.xyzw, c31.xyzw
mov r1.w, v0
mul r0.y, r0, c28.z
mul r0.x, r1.y, c27.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c31.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r0.y, r1, c5
add r2, -r0.y, c12
mul r3, r4.w, r2
dp4 r0.x, r1, c4
add r0, -r0.x, c11
mul r2, r2, r2
mad r3, r5.x, r0, r3
dp4 r5.y, r1, c6
mad r2, r0, r0, r2
add r0, -r5.y, c13
mad r2, r0, r0, r2
mad r0, r4.x, r0, r3
mul r3, r2, c14
mov r5.y, r4.w
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.w, r2.w
rsq r2.z, r2.z
mul r0, r0, r2
add r2, r3, c31.z
dp4 r3.z, r5, c21
dp4 r3.y, r5, c20
dp4 r3.x, r5, c19
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c33.x
mul r0, r0, r2
mul r2.xyz, r0.y, c16
mad r2.xyz, r0.x, c15, r2
mad r0.xyz, r0.z, c17, r2
mad r2.xyz, r0.w, c18, r0
mul r0, r5.xyzz, r5.yzzx
mul r2.w, r4, r4
dp4 r5.w, r0, c24
dp4 r5.z, r0, c23
dp4 r5.y, r0, c22
mad r2.w, r5.x, r5.x, -r2
mul r0.xyz, r2.w, c25
add r3.xyz, r3, r5.yzww
add r5.yzw, r3.xxyz, r0.xxyz
dp4 r0.w, r1, c3
dp4 r0.z, r1, c2
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mul r3.xyz, r0.xyww, c31.w
add oT2.xyz, r5.yzww, r2
mov r2.x, r3
mul r2.y, r3, c9.x
mad oT3.xy, r3.z, c10.zwzw, r2
mov oPos, r0
mov oT3.zw, r0
mov oD0, v5
mov oT1.z, r4.x
mov oT1.y, r4.w
mov oT1.x, r5
mad oT0.xy, v3, c30, c30.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Vector 144 [_WindX]
Vector 160 [_WindY]
Vector 176 [_WindZ]
Vector 192 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjmbmgfialplccfgomkmbhfmoaajopofnabaaaaaakmbdaaaaaeaaaaaa
daaaaaaadiaiaaaacibcaaaapabcaaaaebgpgodjaaaiaaaaaaaiaaaaaaacpopp
hiahaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaajaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaacaaaiaaahaaaaaaaaaaacaacgaaahaaapaaaaaaaaaaadaaaaaaaeaabgaa
aaaaaaaaadaaamaaaeaabkaaaaaaaaaaadaabeaaabaaboaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbpaaapkalkajlglkkekkckdnaaaaaalpaaaaaadpfbaaaaaf
caaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafcbaaapkanlapmjea
nlapejmagdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaaeaaoekaaeaaookaabaaaaacaaaaabiabkaaaakaacaaaaad
aaaaabiaaaaaaaiablaaaakaacaaaaadaaaaabiaaaaaaaiabmaaaakaacaaaaad
aaaaabiaaaaaaaiabnaaaakaacaaaaadaaaaabiaaaaaaaiaafaaffkaalaaaaad
aaaaaoiaaaaajajacaaaffkaakaaaaadaaaaaoiaaaaaoeiacaaaaakaacaaaaad
aaaaahiaaaaapjiaaaaaaaiaafaaaaadaaaaakiaaaaaffiaacaagakaaeaaaaae
aaaaakiaaaaaoeiacaaakkkacaaappkabdaaaaacaaaaakiaaaaaoeiaaeaaaaae
aaaaakiaaaaaoeiacbaaaakacbaaffkaafaaaaadaaaaakiaaaaaoeiaaaaaoeia
aeaaaaaeabaaadiaaaaaoniacbaakkkacbaappkaaeaaaaaeabaaadiaaaaaonia
abaaoeiabpaaaakaaeaaaaaeabaaadiaaaaaoniaabaaoeiabpaaffkaaeaaaaae
abaaadiaaaaaoniaabaaoeiabpaakkkaaeaaaaaeaaaaakiaaaaaoeiaabaagaia
caaaaakaafaaaaadaaaaakiaaaaaoeiaacaaoikaafaaaaadabaaadiaaaaaaaia
abaaoekaafaaaaadaaaaafiaaaaakkiaadaanekaaeaaaaaeaaaaafiaaaaaoeia
caaakkkacaaappkabdaaaaacaaaaafiaaaaaoeiaaeaaaaaeaaaaafiaaaaaoeia
cbaaaakacbaaffkaafaaaaadaaaaafiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadia
abaaoeiacaaakkkacaaappkabdaaaaacabaaadiaabaaoeiaaeaaaaaeabaaadia
abaaoeiacbaaaakacbaaffkaafaaaaadabaaadiaabaaoeiaabaaoeiaaeaaaaae
abaaamiaabaaeeiacbaakkkacbaappkaaeaaaaaeabaaamiaabaaeeiaabaaoeia
bpaaaakaaeaaaaaeabaaamiaabaaeeiaabaaoeiabpaaffkaaeaaaaaeabaaamia
abaaeeiaabaaoeiabpaakkkaaeaaaaaeabaaadiaabaaoeiaabaaooiacaaaaaka
aeaaaaaeaaaaakiaabaagaiaabaaoikaaaaaoeiaaeaaaaaeabaaadiaaaaaoiia
cbaakkkacbaappkaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabpaaaakaaeaaaaae
abaaadiaaaaaoiiaabaaoeiabpaaffkaaeaaaaaeabaaadiaaaaaoiiaabaaoeia
bpaakkkaaeaaaaaeaaaaafiaaaaaoeiaabaaneiacaaaaakaaeaaaaaeaaaaadia
aaaaoiiaadaaookaaaaaoniaacaaaaadaaaaabiaaaaaffiaaaaaaaiaacaaaaad
aaaaaciaafaappjbcaaaaakaaeaaaaaeaaaaahiaaaaaaaiaaaaaffiaaaaaoeja
afaaaaadabaaahiaaaaaffiablaaoekaaeaaaaaeabaaahiabkaaoekaaaaaaaia
abaaoeiaaeaaaaaeabaaahiabmaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahia
bnaaoekaaaaappjaabaaoeiaacaaaaadacaaapiaabaaffibaiaaoekaafaaaaad
adaaapiaacaaoeiaacaaoeiaacaaaaadaeaaapiaabaaaaibahaaoekaacaaaaad
abaaapiaabaakkibajaaoekaaeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeia
aeaaaaaeadaaapiaabaaoeiaabaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaia
ahaaaaacafaaaciaadaaffiaahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiia
adaappiaabaaaaacagaaabiacaaaaakaaeaaaaaeadaaapiaadaaoeiaakaaoeka
agaaaaiaafaaaaadagaaahiaacaaoejaboaappkaafaaaaadahaaahiaagaaffia
blaaoekaaeaaaaaeagaaaliabkaakekaagaaaaiaahaakeiaaeaaaaaeagaaahia
bmaaoekaagaakkiaagaapeiaafaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaae
acaaapiaaeaaoeiaagaaaaiaacaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkia
acaaoeiaafaaaaadabaaapiaafaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeia
caaaffkaagaaaaacacaaabiaadaaaaiaagaaaaacacaaaciaadaaffiaagaaaaac
acaaaeiaadaakkiaagaaaaacacaaaiiaadaappiaafaaaaadabaaapiaabaaoeia
acaaoeiaafaaaaadacaaahiaabaaffiaamaaoekaaeaaaaaeacaaahiaalaaoeka
abaaaaiaacaaoeiaaeaaaaaeabaaahiaanaaoekaabaakkiaacaaoeiaaeaaaaae
abaaahiaaoaaoekaabaappiaabaaoeiaabaaaaacagaaaiiacaaaaakaajaaaaad
acaaabiaapaaoekaagaaoeiaajaaaaadacaaaciabaaaoekaagaaoeiaajaaaaad
acaaaeiabbaaoekaagaaoeiaafaaaaadadaaapiaagaacjiaagaakeiaajaaaaad
aeaaabiabcaaoekaadaaoeiaajaaaaadaeaaaciabdaaoekaadaaoeiaajaaaaad
aeaaaeiabeaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaad
aaaaaiiaagaaffiaagaaffiaaeaaaaaeaaaaaiiaagaaaaiaagaaaaiaaaaappib
abaaaaacacaaahoaagaaoeiaaeaaaaaeacaaahiabfaaoekaaaaappiaacaaoeia
acaaaaadadaaahoaabaaoeiaacaaoeiaafaaaaadabaaapiaaaaaffiabhaaoeka
aeaaaaaeabaaapiabgaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabiaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiabjaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaagaaaakaafaaaaadabaaaiiaabaaaaiabpaappkaafaaaaad
abaaafiaaaaapeiabpaappkaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aeaaamoaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefcoiajaaaa
eaaaabaahkacaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacahaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaa
amaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaadaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaa
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaa
diaaaaaikcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaakaaaaaa
enaaaaagkcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaa
aaaaaaaafganbaaaaaaaaaaakgiocaaaaaaaaaaaakaaaaaadiaaaaaidcaabaaa
abaaaaaaagaabaaaaaaaaaaaegiacaaaaaaaaaaaajaaaaaadiaaaaaifcaabaaa
aaaaaaaakgakbaaaaaaaaaaaagibcaaaaaaaaaaaalaaaaaaenaaaaagfcaabaaa
aaaaaaaaaanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaa
egaabaaaabaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaa
aaaaaaaaajaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaa
aaaaaaaaogikcaaaaaaaaaaaalaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
dkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaa
agaabaaaaaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
acaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaadaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaacaaaaaadiaaaaah
pcaabaaaaeaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaabbaaaaaibcaabaaa
afaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaaeaaaaaabbaaaaaiccaabaaa
afaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaaeaaaaaabbaaaaaiecaabaaa
afaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaaeaaaaaaaaaaaaahhcaabaaa
adaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
acaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaa
diaaaaaihcaabaaaaeaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaaeaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajpcaabaaa
aeaaaaaaagaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaaj
pcaabaaaafaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
aaaaaaajpcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaa
aeaaaaaadiaaaaahpcaabaaaagaaaaaafgafbaaaacaaaaaaegaobaaaafaaaaaa
diaaaaahpcaabaaaafaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaafaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaaeaaaaaaagaabaaaacaaaaaaegaobaaa
agaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaaaaaaaaakgakbaaaacaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaafaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaaaaaaaaa
dcaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaibcaabaaaaaaaaaaabkaabaaa
abaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaafaaaaaa
kgaobaaaabaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaaaaaaaaamgaabaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
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
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R0, fragment.texcoord[2];
DP3 R0.w, fragment.texcoord[1], c[0];
MUL R0.xyz, R0, c[1];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1;
MOV result.color.w, c[2].x;
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
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c2
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t2
mov_pp r0.w, c2.z
mad_pp r0.xyz, r0, c2.y, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedlpbgijmcfcgpmjlmcgmoagdjacacdjefabaaaaaaoiadaaaaaeaaaaaa
daaaaaaahaabaaaabaadaaaaleadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
piaaaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioeka
aiaaaaadaaaaciiaacaaoelaabaaoekaalaaaaadabaaciiaaaaappiaacaaaaka
acaaaaadaaaaciiaabaappiaabaappiaafaaaaadaaaachiaaaaaoeiaabaaoela
afaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoela
aeaaaaaeaaaachiaabaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaciiaacaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcjiabaaaaeaaaaaaaggaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[1] = { { 1, 8 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[1], texture[1], 2D;
MUL R1.xyz, R1, fragment.color.primary;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[0].y;
MOV result.color.w, c[0].x;
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
def c0, 8.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0_level_9_1
eefiecedkibicgaifglobihipmphlmphdmcmhklgabaaaaaaeiadaaaaaeaaaaaa
daaaaaaadiabaaaaiiacaaaabeadaaaaebgpgodjaaabaaaaaaabaaaaaaacpppp
neaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaabllaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaciiaaaaappiaaaaaaakaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
abaachiaabaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaac
aaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefceiabaaaa
eaaaaaaafcaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
hnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R1.x, fragment.texcoord[3], texture[1], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.yzw, R0.xxyz, fragment.texcoord[2].xxyz;
DP3 R0.w, fragment.texcoord[1], c[0];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, R1.x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1.yzww;
MOV result.color.w, c[2].x;
END
# 11 instructions, 2 R-regs
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
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r0, t0, s0
texldp r3, t3, s1
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t2
mov_pp r0.w, c2.z
mad_pp r0.xyz, r0, c2.y, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedcpmaenlfhopjhibbiccaljifkndcmdkpabaaaaaameaeaaaaaeaaaaaa
daaaaaaammabaaaaneadaaaajaaeaaaaebgpgodjjeabaaaajeabaaaaaaacpppp
faabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadia
aaaappiaaeaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
aaaaoelaabaioekaaiaaaaadabaaciiaacaaoelaabaaoekaafaaaaadaaaacbia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaacaaaakaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoelaafaaaaad
abaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoelaaeaaaaae
aaaachiaabaaoeiaabaappiaaaaaoeiaabaaaaacaaaaciiaacaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcaaacaaaaeaaaaaaaiaaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 1, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0].y;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[0].z;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, fragment.color.primary;
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[0].x;
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
def c0, 8.00000000, 2.00000000, 1.00000000, 0
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
mov_pp r0.w, c0.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0_level_9_1
eefiecedifilegkcnjmnjkckgcjlkgpaemfmgnodabaaaaaaomaeaaaaaeaaaaaa
daaaaaaanaabaaaabeaeaaaaliaeaaaaebgpgodjjiabaaaajiabaaaaaaacpppp
giabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadia
aaaappiaacaaoelaabaaaaacabaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadacaacpiaaaaaoela
abaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
acaappiaafaaaaadabaaciiaabaappiaaaaaaakaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadadaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeiaafaaaaadaaaachiaacaaoeia
abaaoelaafaaaaadaaaachiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaaaaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdmacaaaaeaaaaaaaipaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Transparent" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [unity_LightShadowBias]
Vector 11 [_WindX]
Vector 12 [_WindY]
Vector 13 [_WindZ]
"!!ARBvp1.0
PARAM c[18] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..13],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[14];
MAX R0.y, R0, c[14].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[11];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[12];
ADD R0.x, R0, -c[14].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[14].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[14];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[14].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[14];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
MAD R1.xyz, R1, R0, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R2, c[15].zwzw;
MAD R3.xyz, R3, R2, c[16].xyxw;
MAD R1.xyz, R1, R0, c[17].xyxw;
SGE R4.yz, R4.y, c[17].xzww;
DP3 R0.y, R4, c[17].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[16].zwzw;
MAD R0.xyz, R0, R2, c[17].xyxw;
MUL R3.x, R1, c[11].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[14].w;
SGE R1.yz, R2.w, c[17].xzww;
DP3 R1.y, R1, c[17].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[14];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[13].y;
MUL R0.y, R0, c[12].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[14].w;
FRC R4.y, R0;
MUL R0.x, R0, c[13];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[14].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[14];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[14].w;
ADD R1.xyz, -R1.w, c[14];
ADD R3.xyz, R2, c[15].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[15].zwzw;
MAD R3.xyz, R3, R0, c[16].xyxw;
MAD R3.xyz, R3, R0, c[16].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[15].xyxw;
MAD R2.xyz, R2, R1, c[15].zwzw;
MAD R2.xyz, R2, R1, c[16].xyxw;
MAD R3.xyz, R3, R0, c[17].xyxw;
SGE R4.yz, R4.y, c[17].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[16].zwzw;
MAD R0.xyz, R0, R1, c[17].xyxw;
MUL R3.x, R3, c[13].w;
SLT R1.x, R1.w, c[14].w;
SGE R1.yz, R1.w, c[17].xzww;
MOV R2.xz, R1;
DP3 R2.y, R1, c[17].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[13].z;
MUL R0.y, R3.w, c[12].x;
MUL R0.x, R0.w, c[11];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[14].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[14].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[14];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[14];
ADD R2.xyz, R2, c[15].xyxw;
MAD R2.xyz, R2, R1, c[15].zwzw;
MAD R2.xyz, R2, R1, c[16].xyxw;
MAD R2.xyz, R2, R1, c[16].zwzw;
MUL R0.xyz, R0, R0;
ADD R2.w, R2, R3.x;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R0, c[15].zwzw;
MAD R3.xyz, R3, R0, c[16].xyxw;
MAD R3.xyz, R3, R0, c[16].zwzw;
MAD R1.xyz, R2, R1, c[17].xyxw;
MAD R3.xyz, R3, R0, c[17].xyxw;
SLT R4.x, R3.w, c[14].w;
SGE R4.yz, R3.w, c[17].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[17].xzww;
SLT R0.x, R0.w, c[14].w;
DP3 R2.y, R0, c[17].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MOV R0.w, vertex.position;
MUL R0.y, R3.x, c[12].z;
MUL R0.x, R0, c[11].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R0.xyz, R0.x, R0.y, vertex.position;
DP4 R1.x, R0, c[4];
DP4 R1.y, R0, c[3];
ADD R1.y, R1, c[10].x;
MAX R1.z, R1.y, -R1.x;
ADD R1.z, R1, -R1.y;
MAD result.position.z, R1, c[10].y, R1.y;
MOV result.position.w, R1.x;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
END
# 136 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [unity_LightShadowBias]
Vector 10 [_WindX]
Vector 11 [_WindY]
Vector 12 [_WindZ]
"vs_2_0
def c13, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, 0.00000000, 0.15915491, 0.50000000, 0
def c16, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c4
dp4 r0.x, c13.z, r0
min r1.x, v0.z, c13.z
min r0.z, v0.y, c13
add r0.x, r0, c8.y
max r0.y, r1.x, c15.x
add r2.w, r0.x, r0.y
max r0.z, r0, c15.x
min r0.y, v0.x, c13.z
max r0.y, r0, c15.x
add r2.x, r0, r0.y
add r2.y, r0.x, r0.z
mul r0.x, r2, c10.y
mul r0.y, r2, c11
mad r0.y, r0, c15, c15.z
frc r0.y, r0
mad r0.x, r0, c15.y, c15.z
frc r0.x, r0
mad r1.x, r0.y, c16, c16.y
mad r2.z, r0.x, c16.x, c16.y
sincos r0.xy, r1.x, c14.xyzw, c13.xyzw
sincos r1.xy, r2.z, c14.xyzw, c13.xyzw
mul r0.x, r1.y, c10.w
mul r0.y, r0, c11.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c12.y
mul r0.x, r2.w, c12
mad r0.x, r0, c15.y, c15.z
mad r0.y, r3.x, c15, c15.z
frc r0.y, r0
mad r1.y, r0, c16.x, c16
frc r1.x, r0
sincos r0.xy, r1.y, c14.xyzw, c13.xyzw
mad r0.x, r1, c16, c16.y
sincos r1.xy, r0.x, c14.xyzw, c13.xyzw
mul r0.x, r0.y, c12.w
add r2.z, r2, r0.x
mul r0.x, r2, c10
mul r0.y, r2, c11.x
mad r0.y, r0, c15, c15.z
frc r0.y, r0
mad r0.x, r0, c15.y, c15.z
frc r0.x, r0
mad r1.x, r0.y, c16, c16.y
mad r2.x, r0, c16, c16.y
sincos r0.xy, r1.x, c14.xyzw, c13.xyzw
mul r2.w, r1.y, c12.z
sincos r1.xy, r2.x, c14.xyzw, c13.xyzw
mov r1.w, v0
mul r0.y, r0, c11.z
mul r0.x, r1.y, c10.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c13.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r0.x, r1, c2
add r0.x, r0, c9
max r0.y, r0.x, c15.x
add r0.y, r0, -r0.x
mad r0.z, r0.y, c9.y, r0.x
dp4 r0.w, r1, c3
dp4 r0.x, r1, c0
dp4 r0.y, r1, c1
mov oPos, r0
mov oT0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "$Globals" 128
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecededdfdeijfpglfapljjcclhkgdnfjealiabaaaaaakaajaaaaaeaaaaaa
daaaaaaameaeaaaakeaiaaaagmajaaaaebgpgodjimaeaaaaimaeaaaaaaacpopp
ciaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaafaaabaaafaaaaaaaaaa
adaaaaaaaeaaagaaaaaaaaaaadaaamaaaeaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafapaaapka
nlapmjeanlapejmagdibihlekblfmpdhfbaaaaafbaaaapkalkajlglkkekkckdn
aaaaaalpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaafiaafaaapja
abaaaaacaaaaabiaakaaaakaacaaaaadaaaaabiaaaaaaaiaalaaaakaacaaaaad
aaaaabiaaaaaaaiaamaaaakaacaaaaadaaaaabiaaaaaaaiaanaaaakaacaaaaad
aaaaabiaaaaaaaiaaeaaffkaalaaaaadaaaaaoiaaaaajajaaoaaffkaakaaaaad
aaaaaoiaaaaaoeiaaoaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaad
aaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiaaoaakkkaaoaappka
bdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiaapaaaakaapaaffka
afaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniaapaakkka
apaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabaaaaakaaeaaaaaeabaaadia
aaaaoniaabaaoeiabaaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiabaaakkka
aeaaaaaeaaaaakiaaaaaoeiaabaagaiaaoaaaakaafaaaaadaaaaakiaaaaaoeia
acaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkia
adaanekaaeaaaaaeaaaaafiaaaaaoeiaaoaakkkaaoaappkabdaaaaacaaaaafia
aaaaoeiaaeaaaaaeaaaaafiaaaaaoeiaapaaaakaapaaffkaafaaaaadaaaaafia
aaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiaaoaakkkaaoaappkabdaaaaac
abaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiaapaaaakaapaaffkaafaaaaad
abaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiaapaakkkaapaappka
aeaaaaaeabaaamiaabaaeeiaabaaoeiabaaaaakaaeaaaaaeabaaamiaabaaeeia
abaaoeiabaaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiabaaakkkaaeaaaaae
abaaadiaabaaoeiaabaaooiaaoaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoika
aaaaoeiaaeaaaaaeabaaadiaaaaaoiiaapaakkkaapaappkaaeaaaaaeabaaadia
aaaaoiiaabaaoeiabaaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiabaaaffka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiabaaakkkaaeaaaaaeaaaaafiaaaaaoeia
abaaneiaaoaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbaoaaaakaaeaaaaae
aaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadabaaapiaaaaaffiaahaaoeka
aeaaaaaeabaaapiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaacaaaaad
aaaaaeiaaaaakkiaafaaaakaalaaaaadabaaabiaaaaakkiaaoaaffkaacaaaaad
abaaabiaaaaakkibabaaaaiaaeaaaaaeaaaaaemaafaaffkaabaaaaiaaaaakkia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaaimaaaaappia
ppppaaaafdeieefcniadaaaaeaaaabaapgaaaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
agaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagiaaaaac
acaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaa
adaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
abaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaaikcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaagkcaabaaa
aaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafganbaaa
aaaaaaaakgiocaaaaaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaaagaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaakgakbaaa
aaaaaaaaagibcaaaaaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaaaanaaaaa
agacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaaabaaaaaa
dcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaaafaaaaaa
fganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaaogikcaaa
aaaaaaaaahaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaackaabaaaaaaaaaaaakiacaaa
acaaaaaaafaaaaaadgaaaaaflccabaaaaaaaaaaaegambaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkiacaaaacaaaaaaafaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_LightPositionRange]
Vector 11 [_WindX]
Vector 12 [_WindY]
Vector 13 [_WindZ]
"!!ARBvp1.0
PARAM c[18] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.mvp,
		program.local[5..13],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[5];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[9].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[14];
MAX R0.y, R0, c[14].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[11];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[12];
ADD R0.x, R0, -c[14].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[14].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[14];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[14].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[14];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
MAD R1.xyz, R1, R0, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R2, c[15].zwzw;
MAD R3.xyz, R3, R2, c[16].xyxw;
MAD R1.xyz, R1, R0, c[17].xyxw;
SGE R4.yz, R4.y, c[17].xzww;
DP3 R0.y, R4, c[17].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[16].zwzw;
MAD R0.xyz, R0, R2, c[17].xyxw;
MUL R3.x, R1, c[11].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[14].w;
SGE R1.yz, R2.w, c[17].xzww;
DP3 R1.y, R1, c[17].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[14];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[13].y;
MUL R0.y, R0, c[12].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[14].w;
FRC R4.y, R0;
MUL R0.x, R0, c[13];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[14].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[14];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[14].w;
ADD R1.xyz, -R1.w, c[14];
ADD R3.xyz, R2, c[15].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[15].zwzw;
MAD R3.xyz, R3, R0, c[16].xyxw;
MAD R3.xyz, R3, R0, c[16].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[15].xyxw;
MAD R2.xyz, R2, R1, c[15].zwzw;
MAD R2.xyz, R2, R1, c[16].xyxw;
MAD R3.xyz, R3, R0, c[17].xyxw;
SGE R4.yz, R4.y, c[17].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[16].zwzw;
MAD R0.xyz, R0, R1, c[17].xyxw;
MUL R3.x, R3, c[13].w;
SLT R1.x, R1.w, c[14].w;
SGE R1.yz, R1.w, c[17].xzww;
MOV R2.xz, R1;
DP3 R2.y, R1, c[17].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[13].z;
MUL R0.y, R3.w, c[12].x;
MUL R0.x, R0.w, c[11];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[14].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[14].w;
FRC R0.w, R0.x;
ADD R0.xyz, -R3.w, c[14];
ADD R1.xyz, -R0.w, c[14];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[15].xyxw;
MAD R2.xyz, R2, R1, c[15].zwzw;
MAD R2.xyz, R2, R1, c[16].xyxw;
MAD R2.xyz, R2, R1, c[16].zwzw;
MUL R0.xyz, R0, R0;
ADD R2.w, R2, R3.x;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R0, c[15].zwzw;
MAD R3.xyz, R3, R0, c[16].xyxw;
MAD R3.xyz, R3, R0, c[16].zwzw;
MAD R3.xyz, R3, R0, c[17].xyxw;
MAD R1.xyz, R2, R1, c[17].xyxw;
SLT R4.x, R3.w, c[14].w;
SGE R4.yz, R3.w, c[17].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[17].xzww;
SLT R0.x, R0.w, c[14].w;
DP3 R2.y, R0, c[17].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[12].z;
MUL R0.x, R0, c[11].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
MOV R1.w, vertex.position;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R1.xyz, R0.x, R0.y, vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
ADD result.texcoord[0].xyz, R0, -c[10];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
END
# 135 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_LightPositionRange]
Vector 10 [_WindX]
Vector 11 [_WindY]
Vector 12 [_WindZ]
"vs_2_0
def c13, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, 0.00000000, 0.15915491, 0.50000000, 0
def c16, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c4
dp4 r0.x, c13.z, r0
min r1.x, v0.z, c13.z
min r0.z, v0.y, c13
add r0.x, r0, c8.y
max r0.y, r1.x, c15.x
add r2.w, r0.x, r0.y
max r0.z, r0, c15.x
min r0.y, v0.x, c13.z
max r0.y, r0, c15.x
add r2.x, r0, r0.y
add r2.y, r0.x, r0.z
mul r0.x, r2, c10.y
mul r0.y, r2, c11
mad r0.y, r0, c15, c15.z
frc r0.y, r0
mad r0.x, r0, c15.y, c15.z
frc r0.x, r0
mad r1.x, r0.y, c16, c16.y
mad r2.z, r0.x, c16.x, c16.y
sincos r0.xy, r1.x, c14.xyzw, c13.xyzw
sincos r1.xy, r2.z, c14.xyzw, c13.xyzw
mul r0.x, r1.y, c10.w
mul r0.y, r0, c11.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c12.y
mul r0.x, r2.w, c12
mad r0.x, r0, c15.y, c15.z
mad r0.y, r3.x, c15, c15.z
frc r0.y, r0
mad r1.y, r0, c16.x, c16
frc r1.x, r0
sincos r0.xy, r1.y, c14.xyzw, c13.xyzw
mad r0.x, r1, c16, c16.y
sincos r1.xy, r0.x, c14.xyzw, c13.xyzw
mul r0.x, r0.y, c12.w
add r2.z, r2, r0.x
mul r0.x, r2, c10
mul r0.y, r2, c11.x
mad r0.y, r0, c15, c15.z
frc r0.y, r0
mad r0.x, r0, c15.y, c15.z
frc r0.x, r0
mad r1.x, r0.y, c16, c16.y
mad r2.x, r0, c16, c16.y
sincos r0.xy, r1.x, c14.xyzw, c13.xyzw
mul r2.w, r1.y, c12.z
sincos r1.xy, r2.x, c14.xyzw, c13.xyzw
mov r1.w, v0
mul r0.y, r0, c11.z
mul r0.x, r1.y, c10.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
add r0.x, r0, r2.z
add r0.y, -v5.w, c13.z
mad r1.xyz, r0.x, r0.y, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add oT0.xyz, r0, -c9
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "$Globals" 128
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedkhafmfpapodiklkchpaohalkhneppohdabaaaaaaamakaaaaaeaaaaaa
daaaaaaanmaeaaaaomaiaaaaleajaaaaebgpgodjkeaeaaaakeaeaaaaaaacpopp
eaaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaabaaabaaafaaaaaaaaaa
adaaaaaaaeaaagaaaaaaaaaaadaaamaaaeaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafapaaapka
lkajlglkkekkckdnaaaaaalpaaaaaaaafbaaaaafbaaaapkanlapmjeanlapejma
gdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaafiaafaaapja
abaaaaacaaaaabiaakaaaakaacaaaaadaaaaabiaaaaaaaiaalaaaakaacaaaaad
aaaaabiaaaaaaaiaamaaaakaacaaaaadaaaaabiaaaaaaaiaanaaaakaacaaaaad
aaaaabiaaaaaaaiaaeaaffkaalaaaaadaaaaaoiaaaaajajaaoaaffkaakaaaaad
aaaaaoiaaaaaoeiaaoaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaad
aaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiaaoaakkkaaoaappka
bdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiabaaaaakabaaaffka
afaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniabaaakkka
baaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaapaaaakaaeaaaaaeabaaadia
aaaaoniaabaaoeiaapaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaapaakkka
aeaaaaaeaaaaakiaaaaaoeiaabaagaiaaoaaaakaafaaaaadaaaaakiaaaaaoeia
acaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkia
adaanekaaeaaaaaeaaaaafiaaaaaoeiaaoaakkkaaoaappkabdaaaaacaaaaafia
aaaaoeiaaeaaaaaeaaaaafiaaaaaoeiabaaaaakabaaaffkaafaaaaadaaaaafia
aaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiaaoaakkkaaoaappkabdaaaaac
abaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiabaaaaakabaaaffkaafaaaaad
abaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiabaaakkkabaaappka
aeaaaaaeabaaamiaabaaeeiaabaaoeiaapaaaakaaeaaaaaeabaaamiaabaaeeia
abaaoeiaapaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiaapaakkkaaeaaaaae
abaaadiaabaaoeiaabaaooiaaoaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoika
aaaaoeiaaeaaaaaeabaaadiaaaaaoiiabaaakkkabaaappkaaeaaaaaeabaaadia
aaaaoiiaabaaoeiaapaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiaapaaffka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiaapaakkkaaeaaaaaeaaaaafiaaaaaoeia
abaaneiaaoaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbaoaaaakaaeaaaaae
aaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadabaaahiaaaaaffiaalaaoeka
aeaaaaaeabaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaamaaoeka
aaaakkiaabaaoeiaaeaaaaaeabaaahiaanaaoekaaaaappjaabaaoeiaacaaaaad
aaaaahoaabaaoeiaafaaoekbafaaaaadabaaapiaaaaaffiaahaaoekaaeaaaaae
abaaapiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
aiaeaaaaeaaaabaaacabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaae
egiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadicbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaaabaaaaaa
giaaaaacacaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaa
akiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaadaaaaaaapaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkiacaaaabaaaaaaaaaaaaaadgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaai
kcaabaaaaaaaaaaafgafbaaaaaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaag
kcaabaaaaaaaaaaaaanaaaaafganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaa
fganbaaaaaaaaaaakgiocaaaaaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaa
agaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaa
kgakbaaaaaaaaaaaagibcaaaaaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaa
aanaaaaaagacbaaaaaaaaaaaenaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaa
abaaaaaadcaaaaakkcaabaaaaaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaa
afaaaaaafganbaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaa
ogikcaaaaaaaaaaaahaaaaaangafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaa
aaaaaaaafgafbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaabaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaa
acaaaaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheofaaaaaaaacaaaaaa
aiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
"!!ARBfp1.0
PARAM c[1] = { { 0 } };
MOV result.color, c[0].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"ps_2_0
dcl t0.xyzw
rcp r0.x, t0.w
mul r0.x, t0.z, r0
mov_pp r0, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"ps_4_0_level_9_1
eefiecedddomjckbhjkfhaokccgpbcigcfdhmblaabaaaaaadmabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaaiabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaaepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"!!ARBfp1.0
PARAM c[3] = { program.local[0],
		{ 1, 255, 65025, 16581375 },
		{ 0.99900001, 0.0039215689 } };
TEMP R0;
DP3 R0.x, fragment.texcoord[0], fragment.texcoord[0];
RSQ R0.x, R0.x;
RCP R0.x, R0.x;
MUL R0.x, R0, c[0].w;
MIN R0.x, R0, c[2];
MUL R0, R0.x, c[1];
FRC R0, R0;
MAD result.color, -R0.yzww, c[2].y, R0;
END
# 8 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Vector 0 [_LightPositionRange]
"ps_2_0
def c1, 0.99900001, 0.00392157, 0, 0
def c2, 1.00000000, 255.00000000, 65025.00000000, 16581375.00000000
dcl t0.xyz
dp3 r0.x, t0, t0
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r0.x, r0, c0.w
min r0.x, r0, c1
mul r0, r0.x, c2
frc r1, r0
mov r0.z, -r1.w
mov r0.xyw, -r1.yzxw
mad r0, r0, c1.y, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
BindCB  "UnityLighting" 0
"ps_4_0_level_9_1
eefiecedkcipmapbihhbabemebdmoeffkccjndjkabaaaaaacmadaaaaaeaaaaaa
daaaaaaaiaabaaaakaacaaaapiacaaaaebgpgodjeiabaaaaeiabaaaaaaacpppp
biabaaaadaaaaaaaabaaceaaaaaadaaaaaaadaaaaaaaceaaaaaadaaaaaaaabaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaibiaiadlaaaaaaaaaaaaaaaa
aaaaaaaafbaaaaafacaaapkahhlohplpaaljdolpaaaahklpaaaaaaiafbaaaaaf
adaaapkaaaaaiadpaaaahpedaaabhoehppachnelbpaaaaacaaaaaaiaaaaaahla
aiaaaaadaaaaaiiaaaaaoelaaaaaoelaahaaaaacaaaaabiaaaaappiaagaaaaac
aaaaabiaaaaaaaiaafaaaaadaaaaaciaaaaaaaiaaaaappkaabaaaaacabaaaiia
acaaaakaaeaaaaaeaaaaabiaaaaaaaiaaaaappkaabaappiaafaaaaadabaaapia
aaaaffiaadaaoekabdaaaaacabaaapiaabaaoeiafiaaaaaeaaaaapiaaaaaaaia
acaaoekbabaaoeiaaeaaaaaeabaacliaaaaamjiaabaaaakbaaaaoeiaaeaaaaae
abaaceiaaaaappiaabaaaakbaaaakkiaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefcbiabaaaaeaaaaaaaegaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
gcbaaaadhcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegbcbaaaabaaaaaaelaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkiacaaaaaaaaaaaabaaaaaaddaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaahhlohpdpdiaaaaakpcaabaaaaaaaaaaaagaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaahpedaaabhoehppachnelbkaaaaafpcaabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaanpccabaaaaaaaaaaajgapbaiaebaaaaaaaaaaaaaa
aceaaaaaibiaiadlibiaiadlibiaiadlibiaiadlegaobaaaaaaaaaaadoaaaaab
ejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCOLLECTOR"
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "QUEUE"="Geometry" "RenderType"="Transparent" }
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_WindX]
Vector 31 [_WindY]
Vector 32 [_WindZ]
"!!ARBvp1.0
PARAM c[37] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[25];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[29].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[33];
MAX R0.y, R0, c[33].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[30];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[31];
ADD R0.x, R0, -c[33].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[33].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[33];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[33].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[33];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[34].xyxw;
MAD R1.xyz, R1, R0, c[34].zwzw;
MAD R1.xyz, R1, R0, c[35].xyxw;
MAD R1.xyz, R1, R0, c[35].zwzw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R2, c[34].zwzw;
MAD R3.xyz, R3, R2, c[35].xyxw;
MAD R1.xyz, R1, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
DP3 R0.y, R4, c[36].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[35].zwzw;
MAD R0.xyz, R0, R2, c[36].xyxw;
MUL R3.x, R1, c[30].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[33].w;
SGE R1.yz, R2.w, c[36].xzww;
DP3 R1.y, R1, c[36].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[33];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[32].y;
MUL R0.y, R0, c[31].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R4.y, R0;
MUL R0.x, R0, c[32];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[33];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[33].w;
ADD R1.xyz, -R1.w, c[33];
ADD R3.xyz, R2, c[34].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R3.xyz, R3, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[35].zwzw;
MAD R0.xyz, R0, R1, c[36].xyxw;
MUL R3.x, R3, c[32].w;
SLT R1.x, R1.w, c[33].w;
SGE R1.yz, R1.w, c[36].xzww;
ADD R2.w, R2, R3.x;
MOV R2.xz, R1;
DP3 R2.y, R1, c[36].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[32].z;
MUL R0.y, R3.w, c[31].x;
MUL R0.x, R0.w, c[30];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[33];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[33];
MUL R0.xyz, R0, R0;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R2.xyz, R2, R1, c[35].zwzw;
MAD R3.xyz, R3, R0, c[36].xyxw;
MAD R1.xyz, R2, R1, c[36].xyxw;
SLT R4.x, R3.w, c[33].w;
SGE R4.yz, R3.w, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[36].xzww;
SLT R0.x, R0.w, c[33].w;
DP3 R2.y, R0, c[36].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[31].z;
MUL R0.x, R0, c[30].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R2.xyz, R0.x, R0.y, vertex.position;
MOV R2.w, vertex.position;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 151 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_WindX]
Vector 30 [_WindY]
Vector 31 [_WindZ]
"vs_2_0
def c32, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c33, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c34, 0.00000000, 0.15915491, 0.50000000, 0
def c35, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c24
dp4 r0.x, c32.z, r0
min r1.x, v0.z, c32.z
min r0.z, v0.y, c32
add r0.x, r0, c28.y
max r0.y, r1.x, c34.x
add r2.w, r0.x, r0.y
max r0.z, r0, c34.x
min r0.y, v0.x, c32.z
max r0.y, r0, c34.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c30
mul r0.x, r2, c29.y
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mad r1.x, r0.y, c35, c35.y
mad r2.z, r0.x, c35.x, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.z, c33.xyzw, c32.xyzw
mul r0.x, r1.y, c29.w
mul r0.y, r0, c30.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c31.y
mul r0.x, r2.w, c31
mad r0.x, r0, c34.y, c34.z
mad r0.y, r3.x, c34, c34.z
frc r0.y, r0
mad r1.y, r0, c35.x, c35
frc r1.x, r0
sincos r0.xy, r1.y, c33.xyzw, c32.xyzw
mad r0.x, r1, c35, c35.y
sincos r1.xy, r0.x, c33.xyzw, c32.xyzw
mul r0.x, r0.y, c31.w
add r2.z, r2, r0.x
mul r0.y, r2, c30.x
mul r0.x, r2, c29
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mul r2.w, r1.y, c31.z
mad r1.x, r0.y, c35, c35.y
mad r2.x, r0, c35, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.x, c33.xyzw, c32.xyzw
mul r0.y, r0, c30.z
mul r0.x, r1.y, c29.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
mov r2.w, v0
add r0.x, r0, r2.z
add r0.y, -v5.w, c32.z
mad r2.xyz, r0.x, r0.y, v0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_WindX]
Vector 31 [_WindY]
Vector 32 [_WindZ]
"!!ARBvp1.0
PARAM c[37] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[25];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[29].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[33];
MAX R0.y, R0, c[33].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[30];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[31];
ADD R0.x, R0, -c[33].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[33].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[33];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[33].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[33];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[34].xyxw;
MAD R1.xyz, R1, R0, c[34].zwzw;
MAD R1.xyz, R1, R0, c[35].xyxw;
MAD R1.xyz, R1, R0, c[35].zwzw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R2, c[34].zwzw;
MAD R3.xyz, R3, R2, c[35].xyxw;
MAD R1.xyz, R1, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
DP3 R0.y, R4, c[36].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[35].zwzw;
MAD R0.xyz, R0, R2, c[36].xyxw;
MUL R3.x, R1, c[30].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[33].w;
SGE R1.yz, R2.w, c[36].xzww;
DP3 R1.y, R1, c[36].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[33];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[32].y;
MUL R0.y, R0, c[31].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R4.y, R0;
MUL R0.x, R0, c[32];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[33];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[33].w;
ADD R1.xyz, -R1.w, c[33];
ADD R3.xyz, R2, c[34].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R3.xyz, R3, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[35].zwzw;
MAD R0.xyz, R0, R1, c[36].xyxw;
MUL R3.x, R3, c[32].w;
SLT R1.x, R1.w, c[33].w;
SGE R1.yz, R1.w, c[36].xzww;
ADD R2.w, R2, R3.x;
MOV R2.xz, R1;
DP3 R2.y, R1, c[36].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[32].z;
MUL R0.y, R3.w, c[31].x;
MUL R0.x, R0.w, c[30];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[33];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[33];
MUL R0.xyz, R0, R0;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R2.xyz, R2, R1, c[35].zwzw;
MAD R3.xyz, R3, R0, c[36].xyxw;
MAD R1.xyz, R2, R1, c[36].xyxw;
SLT R4.x, R3.w, c[33].w;
SGE R4.yz, R3.w, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[36].xzww;
SLT R0.x, R0.w, c[33].w;
DP3 R2.y, R0, c[36].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[31].z;
MUL R0.x, R0, c[30].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R2.xyz, R0.x, R0.y, vertex.position;
MOV R2.w, vertex.position;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 151 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_WindX]
Vector 30 [_WindY]
Vector 31 [_WindZ]
"vs_2_0
def c32, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c33, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c34, 0.00000000, 0.15915491, 0.50000000, 0
def c35, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c24
dp4 r0.x, c32.z, r0
min r1.x, v0.z, c32.z
min r0.z, v0.y, c32
add r0.x, r0, c28.y
max r0.y, r1.x, c34.x
add r2.w, r0.x, r0.y
max r0.z, r0, c34.x
min r0.y, v0.x, c32.z
max r0.y, r0, c34.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c30
mul r0.x, r2, c29.y
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mad r1.x, r0.y, c35, c35.y
mad r2.z, r0.x, c35.x, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.z, c33.xyzw, c32.xyzw
mul r0.x, r1.y, c29.w
mul r0.y, r0, c30.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c31.y
mul r0.x, r2.w, c31
mad r0.x, r0, c34.y, c34.z
mad r0.y, r3.x, c34, c34.z
frc r0.y, r0
mad r1.y, r0, c35.x, c35
frc r1.x, r0
sincos r0.xy, r1.y, c33.xyzw, c32.xyzw
mad r0.x, r1, c35, c35.y
sincos r1.xy, r0.x, c33.xyzw, c32.xyzw
mul r0.x, r0.y, c31.w
add r2.z, r2, r0.x
mul r0.y, r2, c30.x
mul r0.x, r2, c29
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mul r2.w, r1.y, c31.z
mad r1.x, r0.y, c35, c35.y
mad r2.x, r0, c35, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.x, c33.xyzw, c32.xyzw
mul r0.y, r0, c30.z
mul r0.x, r1.y, c29.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
mov r2.w, v0
add r0.x, r0, r2.z
add r0.y, -v5.w, c32.z
mad r2.xyz, r0.x, r0.y, v0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "$Globals" 128
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedamkllghbcaepmkkfnjmmabfnkkafopdcabaaaaaacaapaaaaaeaaaaaa
daaaaaaagaagaaaakaanaaaagiaoaaaaebgpgodjciagaaaaciagaaaaaaacpopp
meafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaiaabaaaafaaaaaaaaaa
adaaaaaaaiaabfaaaaaaaaaaadaaamaaaeaabnaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcbaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafccaaapka
lkajlglkkekkckdnaaaaaalpaaaaaaaafbaaaaafcdaaapkanlapmjeanlapejma
gdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaafiaafaaapja
abaaaaacaaaaabiabnaaaakaacaaaaadaaaaabiaaaaaaaiaboaaaakaacaaaaad
aaaaabiaaaaaaaiabpaaaakaacaaaaadaaaaabiaaaaaaaiacaaaaakaacaaaaad
aaaaabiaaaaaaaiaaeaaffkaalaaaaadaaaaaoiaaaaajajacbaaffkaakaaaaad
aaaaaoiaaaaaoeiacbaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaad
aaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiacbaakkkacbaappka
bdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiacdaaaakacdaaffka
afaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniacdaakkka
cdaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaccaaaakaaeaaaaaeabaaadia
aaaaoniaabaaoeiaccaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaccaakkka
aeaaaaaeaaaaakiaaaaaoeiaabaagaiacbaaaakaafaaaaadaaaaakiaaaaaoeia
acaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkia
adaanekaaeaaaaaeaaaaafiaaaaaoeiacbaakkkacbaappkabdaaaaacaaaaafia
aaaaoeiaaeaaaaaeaaaaafiaaaaaoeiacdaaaakacdaaffkaafaaaaadaaaaafia
aaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiacbaakkkacbaappkabdaaaaac
abaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiacdaaaakacdaaffkaafaaaaad
abaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiacdaakkkacdaappka
aeaaaaaeabaaamiaabaaeeiaabaaoeiaccaaaakaaeaaaaaeabaaamiaabaaeeia
abaaoeiaccaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiaccaakkkaaeaaaaae
abaaadiaabaaoeiaabaaooiacbaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoika
aaaaoeiaaeaaaaaeabaaadiaaaaaoiiacdaakkkacdaappkaaeaaaaaeabaaadia
aaaaoiiaabaaoeiaccaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiaccaaffka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiaccaakkkaaeaaaaaeaaaaafiaaaaaoeia
abaaneiacbaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbcbaaaakaaeaaaaae
aaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadaaaaaiiaaaaaffiabkaakkka
aeaaaaaeaaaaaiiabjaakkkaaaaaaaiaaaaappiaaeaaaaaeaaaaaiiablaakkka
aaaakkiaaaaappiaaeaaaaaeaaaaaiiabmaakkkaaaaappjaaaaappiaabaaaaac
aeaaaioaaaaappibafaaaaadabaaapiaaaaaffiaboaaoekaaeaaaaaeabaaapia
bnaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabpaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaapiacaaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffia
agaaoekaaeaaaaaeacaaahiaafaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahia
ahaaoekaabaakkiaacaaoeiaaeaaaaaeaaaaahoaaiaaoekaabaappiaacaaoeia
afaaaaadacaaahiaabaaffiaakaaoekaaeaaaaaeacaaahiaajaaoekaabaaaaia
acaaoeiaaeaaaaaeacaaahiaalaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahoa
amaaoekaabaappiaacaaoeiaafaaaaadacaaahiaabaaffiaaoaaoekaaeaaaaae
acaaahiaanaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaapaaoekaabaakkia
acaaoeiaaeaaaaaeacaaahoabaaaoekaabaappiaacaaoeiaafaaaaadacaaahia
abaaffiabcaaoekaaeaaaaaeacaaahiabbaaoekaabaaaaiaacaaoeiaaeaaaaae
acaaahiabdaaoekaabaakkiaacaaoeiaaeaaaaaeadaaahoabeaaoekaabaappia
acaaoeiaabaaaaacaeaaahoaabaaoeiaafaaaaadabaaapiaaaaaffiabgaaoeka
aeaaaaaeabaaapiabfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabhaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiabiaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcdiahaaaaeaaaabaamoabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaa
fjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
icbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaaaaaaaaaj
bcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaa
dgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaagkcaabaaaaaaaaaaaaanaaaaa
fganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafganbaaaaaaaaaaakgiocaaa
aaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaaagaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaakgakbaaaaaaaaaaaagibcaaa
aaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaaaanaaaaaagacbaaaaaaaaaaa
enaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaaabaaaaaadcaaaaakkcaabaaa
aaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaaafaaaaaafganbaaaaaaaaaaa
dcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaaogikcaaaaaaaaaaaahaaaaaa
ngafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
afaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_WindX]
Vector 31 [_WindY]
Vector 32 [_WindZ]
"!!ARBvp1.0
PARAM c[37] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[25];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[29].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[33];
MAX R0.y, R0, c[33].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[30];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[31];
ADD R0.x, R0, -c[33].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[33].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[33];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[33].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[33];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[34].xyxw;
MAD R1.xyz, R1, R0, c[34].zwzw;
MAD R1.xyz, R1, R0, c[35].xyxw;
MAD R1.xyz, R1, R0, c[35].zwzw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R2, c[34].zwzw;
MAD R3.xyz, R3, R2, c[35].xyxw;
MAD R1.xyz, R1, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
DP3 R0.y, R4, c[36].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[35].zwzw;
MAD R0.xyz, R0, R2, c[36].xyxw;
MUL R3.x, R1, c[30].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[33].w;
SGE R1.yz, R2.w, c[36].xzww;
DP3 R1.y, R1, c[36].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[33];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[32].y;
MUL R0.y, R0, c[31].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R4.y, R0;
MUL R0.x, R0, c[32];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[33];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[33].w;
ADD R1.xyz, -R1.w, c[33];
ADD R3.xyz, R2, c[34].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R3.xyz, R3, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[35].zwzw;
MAD R0.xyz, R0, R1, c[36].xyxw;
MUL R3.x, R3, c[32].w;
SLT R1.x, R1.w, c[33].w;
SGE R1.yz, R1.w, c[36].xzww;
ADD R2.w, R2, R3.x;
MOV R2.xz, R1;
DP3 R2.y, R1, c[36].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[32].z;
MUL R0.y, R3.w, c[31].x;
MUL R0.x, R0.w, c[30];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[33];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[33];
MUL R0.xyz, R0, R0;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R2.xyz, R2, R1, c[35].zwzw;
MAD R3.xyz, R3, R0, c[36].xyxw;
MAD R1.xyz, R2, R1, c[36].xyxw;
SLT R4.x, R3.w, c[33].w;
SGE R4.yz, R3.w, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[36].xzww;
SLT R0.x, R0.w, c[33].w;
DP3 R2.y, R0, c[36].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[31].z;
MUL R0.x, R0, c[30].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R2.xyz, R0.x, R0.y, vertex.position;
MOV R2.w, vertex.position;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 151 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_WindX]
Vector 30 [_WindY]
Vector 31 [_WindZ]
"vs_2_0
def c32, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c33, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c34, 0.00000000, 0.15915491, 0.50000000, 0
def c35, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c24
dp4 r0.x, c32.z, r0
min r1.x, v0.z, c32.z
min r0.z, v0.y, c32
add r0.x, r0, c28.y
max r0.y, r1.x, c34.x
add r2.w, r0.x, r0.y
max r0.z, r0, c34.x
min r0.y, v0.x, c32.z
max r0.y, r0, c34.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c30
mul r0.x, r2, c29.y
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mad r1.x, r0.y, c35, c35.y
mad r2.z, r0.x, c35.x, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.z, c33.xyzw, c32.xyzw
mul r0.x, r1.y, c29.w
mul r0.y, r0, c30.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c31.y
mul r0.x, r2.w, c31
mad r0.x, r0, c34.y, c34.z
mad r0.y, r3.x, c34, c34.z
frc r0.y, r0
mad r1.y, r0, c35.x, c35
frc r1.x, r0
sincos r0.xy, r1.y, c33.xyzw, c32.xyzw
mad r0.x, r1, c35, c35.y
sincos r1.xy, r0.x, c33.xyzw, c32.xyzw
mul r0.x, r0.y, c31.w
add r2.z, r2, r0.x
mul r0.y, r2, c30.x
mul r0.x, r2, c29
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mul r2.w, r1.y, c31.z
mad r1.x, r0.y, c35, c35.y
mad r2.x, r0, c35, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.x, c33.xyzw, c32.xyzw
mul r0.y, r0, c30.z
mul r0.x, r1.y, c29.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
mov r2.w, v0
add r0.x, r0, r2.z
add r0.y, -v5.w, c32.z
mad r2.xyz, r0.x, r0.y, v0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Vector 29 [_Time]
Vector 30 [_WindX]
Vector 31 [_WindY]
Vector 32 [_WindZ]
"!!ARBvp1.0
PARAM c[37] = { { 24.980801, -24.980801, 0.15915491, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..32],
		{ 0, 0.5, 1, 0.25 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -1, 1, -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
DP4 R0.x, R0.x, c[25];
MIN R0.y, vertex.position.x, c[0].w;
ADD R1.w, R0.x, c[29].y;
MIN R0.z, vertex.position.y, c[0].w;
MAX R0.x, R0.z, c[33];
MAX R0.y, R0, c[33].x;
ADD R0.w, R1, R0.y;
ADD R3.w, R1, R0.x;
MUL R0.y, R0.w, c[30];
MUL R0.x, R0.y, c[0].z;
MUL R0.y, R3.w, c[31];
ADD R0.x, R0, -c[33].w;
FRC R4.y, R0.x;
MUL R0.y, R0, c[0].z;
ADD R1.x, R0.y, -c[33].w;
FRC R2.w, R1.x;
ADD R0.xyz, -R4.y, c[33];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[33].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R2.xyz, -R2.w, c[33];
MUL R2.xyz, R2, R2;
MUL R3.xyz, R2, c[0].xyxw;
ADD R1.xyz, R1, c[34].xyxw;
MAD R1.xyz, R1, R0, c[34].zwzw;
MAD R1.xyz, R1, R0, c[35].xyxw;
MAD R1.xyz, R1, R0, c[35].zwzw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R2, c[34].zwzw;
MAD R3.xyz, R3, R2, c[35].xyxw;
MAD R1.xyz, R1, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
DP3 R0.y, R4, c[36].xyxw;
MOV R0.xz, R4;
DP3 R1.x, R1, -R0;
MAD R0.xyz, R3, R2, c[35].zwzw;
MAD R0.xyz, R0, R2, c[36].xyxw;
MUL R3.x, R1, c[30].w;
MIN R2.x, vertex.position.z, c[0].w;
SLT R1.x, R2.w, c[33].w;
SGE R1.yz, R2.w, c[36].xzww;
DP3 R1.y, R1, c[36].xyxw;
DP3 R0.y, R0, -R1;
MAX R2.x, R2, c[33];
ADD R0.x, R1.w, R2;
MUL R0.z, R0.x, c[32].y;
MUL R0.y, R0, c[31].w;
ADD R2.w, R3.x, R0.y;
MUL R0.y, R0.z, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R4.y, R0;
MUL R0.x, R0, c[32];
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R1.w, R0.x;
ADD R1.xyz, -R4.y, c[33];
MUL R0.xyz, R1, R1;
MUL R2.xyz, R0, c[0].xyxw;
SLT R4.x, R4.y, c[33].w;
ADD R1.xyz, -R1.w, c[33];
ADD R3.xyz, R2, c[34].xyxw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R3.xyz, R3, R0, c[36].xyxw;
SGE R4.yz, R4.y, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
MAD R0.xyz, R2, R1, c[35].zwzw;
MAD R0.xyz, R0, R1, c[36].xyxw;
MUL R3.x, R3, c[32].w;
SLT R1.x, R1.w, c[33].w;
SGE R1.yz, R1.w, c[36].xzww;
ADD R2.w, R2, R3.x;
MOV R2.xz, R1;
DP3 R2.y, R1, c[36].xyxw;
DP3 R0.x, R0, -R2;
MUL R1.w, R0.x, c[32].z;
MUL R0.y, R3.w, c[31].x;
MUL R0.x, R0.w, c[30];
MUL R0.y, R0, c[0].z;
ADD R0.y, R0, -c[33].w;
FRC R3.w, R0.y;
MUL R0.x, R0, c[0].z;
ADD R0.x, R0, -c[33].w;
FRC R0.w, R0.x;
ADD R1.xyz, -R0.w, c[33];
MUL R1.xyz, R1, R1;
MUL R2.xyz, R1, c[0].xyxw;
ADD R0.xyz, -R3.w, c[33];
MUL R0.xyz, R0, R0;
MUL R3.xyz, R0, c[0].xyxw;
ADD R3.xyz, R3, c[34].xyxw;
MAD R3.xyz, R3, R0, c[34].zwzw;
MAD R3.xyz, R3, R0, c[35].xyxw;
MAD R3.xyz, R3, R0, c[35].zwzw;
ADD R2.xyz, R2, c[34].xyxw;
MAD R2.xyz, R2, R1, c[34].zwzw;
MAD R2.xyz, R2, R1, c[35].xyxw;
MAD R2.xyz, R2, R1, c[35].zwzw;
MAD R3.xyz, R3, R0, c[36].xyxw;
MAD R1.xyz, R2, R1, c[36].xyxw;
SLT R4.x, R3.w, c[33].w;
SGE R4.yz, R3.w, c[36].xzww;
MOV R0.xz, R4;
DP3 R0.y, R4, c[36].xyxw;
DP3 R3.x, R3, -R0;
SGE R0.yz, R0.w, c[36].xzww;
SLT R0.x, R0.w, c[33].w;
DP3 R2.y, R0, c[36].xyxw;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R0.y, R3.x, c[31].z;
MUL R0.x, R0, c[30].z;
ADD R0.x, R0, R0.y;
ADD R0.x, R0, R1.w;
ADD R0.x, R0, R2.w;
ADD R0.y, -vertex.color.w, c[0].w;
MAD R2.xyz, R0.x, R0.y, vertex.position;
MOV R2.w, vertex.position;
DP4 R0.w, R2, c[3];
DP4 R1.w, R2, c[28];
DP4 R0.z, R2, c[27];
DP4 R0.x, R2, c[25];
DP4 R0.y, R2, c[26];
MOV R1.xyz, R0;
MOV R0.w, -R0;
DP4 result.texcoord[0].z, R1, c[11];
DP4 result.texcoord[0].y, R1, c[10];
DP4 result.texcoord[0].x, R1, c[9];
DP4 result.texcoord[1].z, R1, c[15];
DP4 result.texcoord[1].y, R1, c[14];
DP4 result.texcoord[1].x, R1, c[13];
DP4 result.texcoord[2].z, R1, c[19];
DP4 result.texcoord[2].y, R1, c[18];
DP4 result.texcoord[2].x, R1, c[17];
DP4 result.texcoord[3].z, R1, c[23];
DP4 result.texcoord[3].y, R1, c[22];
DP4 result.texcoord[3].x, R1, c[21];
MOV result.texcoord[4], R0;
DP4 result.position.w, R2, c[8];
DP4 result.position.z, R2, c[7];
DP4 result.position.y, R2, c[6];
DP4 result.position.x, R2, c[5];
END
# 151 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Vector 28 [_Time]
Vector 29 [_WindX]
Vector 30 [_WindY]
Vector 31 [_WindZ]
"vs_2_0
def c32, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c33, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c34, 0.00000000, 0.15915491, 0.50000000, 0
def c35, 6.28318501, -3.14159298, 0, 0
dcl_position0 v0
dcl_color0 v5
mov r0, c24
dp4 r0.x, c32.z, r0
min r1.x, v0.z, c32.z
min r0.z, v0.y, c32
add r0.x, r0, c28.y
max r0.y, r1.x, c34.x
add r2.w, r0.x, r0.y
max r0.z, r0, c34.x
min r0.y, v0.x, c32.z
max r0.y, r0, c34.x
add r2.y, r0.x, r0.z
add r2.x, r0, r0.y
mul r0.y, r2, c30
mul r0.x, r2, c29.y
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mad r1.x, r0.y, c35, c35.y
mad r2.z, r0.x, c35.x, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.z, c33.xyzw, c32.xyzw
mul r0.x, r1.y, c29.w
mul r0.y, r0, c30.w
add r2.z, r0.x, r0.y
mul r3.x, r2.w, c31.y
mul r0.x, r2.w, c31
mad r0.x, r0, c34.y, c34.z
mad r0.y, r3.x, c34, c34.z
frc r0.y, r0
mad r1.y, r0, c35.x, c35
frc r1.x, r0
sincos r0.xy, r1.y, c33.xyzw, c32.xyzw
mad r0.x, r1, c35, c35.y
sincos r1.xy, r0.x, c33.xyzw, c32.xyzw
mul r0.x, r0.y, c31.w
add r2.z, r2, r0.x
mul r0.y, r2, c30.x
mul r0.x, r2, c29
mad r0.y, r0, c34, c34.z
frc r0.y, r0
mad r0.x, r0, c34.y, c34.z
frc r0.x, r0
mul r2.w, r1.y, c31.z
mad r1.x, r0.y, c35, c35.y
mad r2.x, r0, c35, c35.y
sincos r0.xy, r1.x, c33.xyzw, c32.xyzw
sincos r1.xy, r2.x, c33.xyzw, c32.xyzw
mul r0.y, r0, c30.z
mul r0.x, r1.y, c29.z
add r0.x, r0, r0.y
add r0.x, r0, r2.w
mov r2.w, v0
add r0.x, r0, r2.z
add r0.y, -v5.w, c32.z
mad r2.xyz, r0.x, r0.y, v0
dp4 r0.w, r2, c2
dp4 r1.w, r2, c27
dp4 r0.z, r2, c26
dp4 r0.x, r2, c24
dp4 r0.y, r2, c25
mov r1.xyz, r0
mov r0.w, -r0
dp4 oT0.z, r1, c10
dp4 oT0.y, r1, c9
dp4 oT0.x, r1, c8
dp4 oT1.z, r1, c14
dp4 oT1.y, r1, c13
dp4 oT1.x, r1, c12
dp4 oT2.z, r1, c18
dp4 oT2.y, r1, c17
dp4 oT2.x, r1, c16
dp4 oT3.z, r1, c22
dp4 oT3.y, r1, c21
dp4 oT3.x, r1, c20
mov oT4, r0
dp4 oPos.w, r2, c7
dp4 oPos.z, r2, c6
dp4 oPos.y, r2, c5
dp4 oPos.x, r2, c4
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
ConstBuffer "$Globals" 128
Vector 80 [_WindX]
Vector 96 [_WindY]
Vector 112 [_WindZ]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Matrix 128 [unity_World2Shadow0]
Matrix 192 [unity_World2Shadow1]
Matrix 256 [unity_World2Shadow2]
Matrix 320 [unity_World2Shadow3]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedamkllghbcaepmkkfnjmmabfnkkafopdcabaaaaaacaapaaaaaeaaaaaa
daaaaaaagaagaaaakaanaaaagiaoaaaaebgpgodjciagaaaaciagaaaaaaacpopp
meafaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaiaabaaaafaaaaaaaaaa
adaaaaaaaiaabfaaaaaaaaaaadaaamaaaeaabnaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafcbaaapkaaaaaiadpaaaaaaaaidpjccdoaaaaiadofbaaaaafccaaapka
lkajlglkkekkckdnaaaaaalpaaaaaaaafbaaaaafcdaaapkanlapmjeanlapejma
gdibihlekblfmpdhbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaafiaafaaapja
abaaaaacaaaaabiabnaaaakaacaaaaadaaaaabiaaaaaaaiaboaaaakaacaaaaad
aaaaabiaaaaaaaiabpaaaakaacaaaaadaaaaabiaaaaaaaiacaaaaakaacaaaaad
aaaaabiaaaaaaaiaaeaaffkaalaaaaadaaaaaoiaaaaajajacbaaffkaakaaaaad
aaaaaoiaaaaaoeiacbaaaakaacaaaaadaaaaahiaaaaapjiaaaaaaaiaafaaaaad
aaaaakiaaaaaffiaacaagakaaeaaaaaeaaaaakiaaaaaoeiacbaakkkacbaappka
bdaaaaacaaaaakiaaaaaoeiaaeaaaaaeaaaaakiaaaaaoeiacdaaaakacdaaffka
afaaaaadaaaaakiaaaaaoeiaaaaaoeiaaeaaaaaeabaaadiaaaaaoniacdaakkka
cdaappkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaccaaaakaaeaaaaaeabaaadia
aaaaoniaabaaoeiaccaaffkaaeaaaaaeabaaadiaaaaaoniaabaaoeiaccaakkka
aeaaaaaeaaaaakiaaaaaoeiaabaagaiacbaaaakaafaaaaadaaaaakiaaaaaoeia
acaaoikaafaaaaadabaaadiaaaaaaaiaabaaoekaafaaaaadaaaaafiaaaaakkia
adaanekaaeaaaaaeaaaaafiaaaaaoeiacbaakkkacbaappkabdaaaaacaaaaafia
aaaaoeiaaeaaaaaeaaaaafiaaaaaoeiacdaaaakacdaaffkaafaaaaadaaaaafia
aaaaoeiaaaaaoeiaaeaaaaaeabaaadiaabaaoeiacbaakkkacbaappkabdaaaaac
abaaadiaabaaoeiaaeaaaaaeabaaadiaabaaoeiacdaaaakacdaaffkaafaaaaad
abaaadiaabaaoeiaabaaoeiaaeaaaaaeabaaamiaabaaeeiacdaakkkacdaappka
aeaaaaaeabaaamiaabaaeeiaabaaoeiaccaaaakaaeaaaaaeabaaamiaabaaeeia
abaaoeiaccaaffkaaeaaaaaeabaaamiaabaaeeiaabaaoeiaccaakkkaaeaaaaae
abaaadiaabaaoeiaabaaooiacbaaaakaaeaaaaaeaaaaakiaabaagaiaabaaoika
aaaaoeiaaeaaaaaeabaaadiaaaaaoiiacdaakkkacdaappkaaeaaaaaeabaaadia
aaaaoiiaabaaoeiaccaaaakaaeaaaaaeabaaadiaaaaaoiiaabaaoeiaccaaffka
aeaaaaaeabaaadiaaaaaoiiaabaaoeiaccaakkkaaeaaaaaeaaaaafiaaaaaoeia
abaaneiacbaaaakaaeaaaaaeaaaaadiaaaaaoiiaadaaookaaaaaoniaacaaaaad
aaaaabiaaaaaffiaaaaaaaiaacaaaaadaaaaaciaafaappjbcbaaaakaaeaaaaae
aaaaahiaaaaaaaiaaaaaffiaaaaaoejaafaaaaadaaaaaiiaaaaaffiabkaakkka
aeaaaaaeaaaaaiiabjaakkkaaaaaaaiaaaaappiaaeaaaaaeaaaaaiiablaakkka
aaaakkiaaaaappiaaeaaaaaeaaaaaiiabmaakkkaaaaappjaaaaappiaabaaaaac
aeaaaioaaaaappibafaaaaadabaaapiaaaaaffiaboaaoekaaeaaaaaeabaaapia
bnaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabpaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaapiacaaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffia
agaaoekaaeaaaaaeacaaahiaafaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahia
ahaaoekaabaakkiaacaaoeiaaeaaaaaeaaaaahoaaiaaoekaabaappiaacaaoeia
afaaaaadacaaahiaabaaffiaakaaoekaaeaaaaaeacaaahiaajaaoekaabaaaaia
acaaoeiaaeaaaaaeacaaahiaalaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahoa
amaaoekaabaappiaacaaoeiaafaaaaadacaaahiaabaaffiaaoaaoekaaeaaaaae
acaaahiaanaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaapaaoekaabaakkia
acaaoeiaaeaaaaaeacaaahoabaaaoekaabaappiaacaaoeiaafaaaaadacaaahia
abaaffiabcaaoekaaeaaaaaeacaaahiabbaaoekaabaaaaiaacaaoeiaaeaaaaae
acaaahiabdaaoekaabaakkiaacaaoeiaaeaaaaaeadaaahoabeaaoekaabaappia
acaaoeiaabaaaaacaeaaahoaabaaoeiaafaaaaadabaaapiaaaaaffiabgaaoeka
aeaaaaaeabaaapiabfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabhaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiabiaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcdiahaaaaeaaaabaamoabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaa
fjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
icbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadhccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaaaaaaaaaj
bcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaa
dgcaaaafocaabaaaaaaaaaaaagbjbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaagaabaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagiecaaaaaaaaaaaagaaaaaaenaaaaagkcaabaaaaaaaaaaaaanaaaaa
fganbaaaaaaaaaaadiaaaaaikcaabaaaaaaaaaaafganbaaaaaaaaaaakgiocaaa
aaaaaaaaagaaaaaadiaaaaaidcaabaaaabaaaaaaagaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaadiaaaaaifcaabaaaaaaaaaaakgakbaaaaaaaaaaaagibcaaa
aaaaaaaaahaaaaaaenaaaaagfcaabaaaaaaaaaaaaanaaaaaagacbaaaaaaaaaaa
enaaaaagdcaabaaaabaaaaaaaanaaaaaegaabaaaabaaaaaadcaaaaakkcaabaaa
aaaaaaaaagaebaaaabaaaaaakgiocaaaaaaaaaaaafaaaaaafganbaaaaaaaaaaa
dcaaaaakdcaabaaaaaaaaaaaigaabaaaaaaaaaaaogikcaaaaaaaaaaaahaaaaaa
ngafbaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaa
aaaaiadpdcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaajaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaiaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaakaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhccabaaaabaaaaaaegiccaaaacaaaaaaalaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaacaaaaaabdaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabfaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabeaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabgaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaabhaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadgaaaaafhccabaaa
afaaaaaaegacbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagiccabaaaafaaaaaaakaabaiaebaaaaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 0 [_ShadowMapTexture] 2D 0
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
SLT R1, fragment.texcoord[4].w, c[2];
SGE R0, fragment.texcoord[4].w, c[1];
MUL R0, R0, R1;
MUL R1.xyz, R0.y, fragment.texcoord[1];
MAD R1.xyz, R0.x, fragment.texcoord[0], R1;
MAD R0.xyz, R0.z, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[4].x;
TEX R0.x, R0, texture[0], 2D;
ADD R0.z, R0.x, -R0;
MOV R0.x, c[4];
CMP R1.x, R0.z, c[3], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[4].x;
MUL R0.xy, R0.y, c[4];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[4].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 0 [_ShadowMapTexture] 2D 0
"ps_2_0
dcl_2d s0
def c4, 1.00000000, 0.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c4.y, c4.x
cmp r0, r0, c4.x, c4.y
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r0.xyz, r0.z, t2, r1
mad r1.xyz, t3, r0.w, r0
mov r2.x, c3
mov r2.y, c4.z
texld r0, r1, s0
add r0.x, r0, -r1.z
cmp r0.x, r0, c4, r2
mul r1.x, -t4.w, c0.w
add r1.x, r1, c4
mov r2.x, c4
mul r2.xy, r1.x, r2
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c4.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c4.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 0 [_ShadowMapTexture] 2D 0
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[5] = { program.local[0..3],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
SLT R1, fragment.texcoord[4].w, c[2];
SGE R0, fragment.texcoord[4].w, c[1];
MUL R0, R0, R1;
MUL R1.xyz, R0.y, fragment.texcoord[1];
MAD R1.xyz, R0.x, fragment.texcoord[0], R1;
MAD R0.xyz, R0.z, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
MAD_SAT R1.y, fragment.texcoord[4].w, c[3].z, c[3].w;
MOV result.color.y, c[4].x;
TEX R0.x, R0, texture[0], SHADOW2D;
MOV R0.y, c[4].x;
ADD R0.w, R0.y, -c[3].x;
MAD R1.x, R0, R0.w, c[3];
MUL R0.z, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0.z, c[4].x;
MUL R0.xy, R0.y, c[4];
FRC R0.zw, R0.xyxy;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[4].z, R0.z;
ADD_SAT result.color.x, R1, R1.y;
MOV result.color.zw, R0.xyxy;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [_LightSplitsNear]
Vector 2 [_LightSplitsFar]
Vector 3 [_LightShadowData]
SetTexture 0 [_ShadowMapTexture] 2D 0
"ps_2_0
dcl_2d s0
def c4, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyzw
add r1, t4.w, -c2
add r0, t4.w, -c1
cmp r1, r1, c4.x, c4.y
cmp r0, r0, c4.y, c4.x
mul r0, r0, r1
mul r1.xyz, r0.y, t1
mad r1.xyz, r0.x, t0, r1
mad r0.xyz, r0.z, t2, r1
mad r0.xyz, t3, r0.w, r0
mul r1.x, -t4.w, c0.w
add r1.x, r1, c4.y
texld r2, r0, s0
mov r0.x, c3
add r0.x, c4.y, -r0
mad r0.x, r2, r0, c3
mul r2.xy, r1.x, c4.yzxw
mad_sat r1.x, t4.w, c3.z, c3.w
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c4.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c4
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 96 [_LightSplitsNear]
Vector 112 [_LightSplitsFar]
Vector 384 [_LightShadowData]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0_level_9_1
eefiecedphcelgomhcehbhmgdplfpphjcngdocfgabaaaaaaiiagaaaaafaaaaaa
deaaaaaaeaacaaaaimafaaaajmafaaaafeagaaaaebgpgodjaeacaaaaaeacaaaa
aaacppppliabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaa
aaaaaaaaaaaaafaaabaaaaaaaaaaaaaaabaaagaaacaaabaaaaaaaaaaabaabiaa
abaaadaaaaaaaaaaaaacppppfbaaaaafaeaaapkaaaaaaaaaaaaaiadpaaaahped
ibiaiadlbpaaaaacaaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaaiaaeaaapla
bpaaaaacaaaaaajaaaaiapkaacaaaaadaaaaapiaaeaapplaacaaoekbfiaaaaae
aaaaapiaaaaaoeiaaeaaaakaaeaaffkaacaaaaadabaaapiaaeaapplaabaaoekb
fiaaaaaeaaaaapiaabaaoeiaaaaaoeiaaeaaaakaafaaaaadabaaahiaaaaaffia
abaaoelaaeaaaaaeabaaahiaaaaaoelaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
acaaoelaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaadaaoelaaaaappiaaaaaoeia
ecaaaaadaaaacpiaaaaaoeiaaaaioekaabaaaaacaaaaaciaaeaaffkabcaaaaae
abaacbiaaaaaaaiaaaaaffiaadaaaakaaeaaaaaeaaaabbiaaeaapplaadaakkka
adaappkaacaaaaadabaadbiaaaaaaaiaabaaaaiaaeaaaaaeaaaaabiaaeaappla
aaaappkbaaaaffiaafaaaaadaaaaadiaaaaaaaiaaeaamjkabdaaaaacaaaaadia
aaaaoeiaaeaaaaaeabaaceiaaaaaffiaaeaappkbaaaaaaiaabaaaaacabaaciia
aaaaffiaabaaaaacabaaaciaaeaaffkaabaaaaacaaaicpiaabaaoeiappppaaaa
fdeieefceeadaaaaeaaaaaaanbaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaabjaaaaaafkaiaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaadhcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
icbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabnaaaaai
pcaabaaaaaaaaaaapgbpbaaaafaaaaaaegiocaaaabaaaaaaagaaaaaaabaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdbaaaaaipcaabaaaabaaaaaapgbpbaaaafaaaaaaegiocaaaabaaaaaa
ahaaaaaaabaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegbcbaaa
acaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaadaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaalbcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaghabaaaaaaaaaaaaagabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaaakiacaiaebaaaaaaabaaaaaabiaaaaaaabeaaaaaaaaaiadp
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaabiaaaaaadccaaaalccaabaaaaaaaaaaadkbabaaaafaaaaaackiacaaa
abaaaaaabiaaaaaadkiacaaaabaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaadkiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaak
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaa
aaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 0 [_ShadowMapTexture] 2D 0
"!!ARBfp1.0
PARAM c[9] = { program.local[0..7],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
ADD R0.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
DP3 R0.x, R0, R0;
ADD R1.xyz, fragment.texcoord[4], -c[2];
DP3 R0.y, R1, R1;
ADD R1.xyz, fragment.texcoord[4], -c[3];
DP3 R0.w, R2, R2;
DP3 R0.z, R1, R1;
SLT R2, R0, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[8].x;
TEX R0.x, R0, texture[0], 2D;
ADD R0.y, R0.x, -R0.z;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.x, c[8];
CMP R0.x, R0.y, c[6], R0;
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[8].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[8].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[8].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 0 [_ShadowMapTexture] 2D 0
"ps_2_0
dcl_2d s0
def c8, 1.00000000, 255.00000000, 0.00392157, 0.00000000
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c8.w, c8.x
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r0.xyz, r0.x, t0, r2
mad r0.xyz, r1.y, t2, r0
mad r1.xyz, t3, r1.z, r0
add r2.xyz, -t4, c7
texld r0, r1, s0
mov r1.x, c6
add r0.x, r0, -r1.z
cmp r0.x, r0, c8, r1
dp3 r1.x, r2, r2
mul r2.x, -t4.w, c0.w
rsq r1.x, r1.x
add r2.x, r2, c8
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
mul r2.xy, r2.x, c8
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c8.z, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c8.x
mov_pp oC0, r0
"
}
SubProgram "opengl " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 0 [_ShadowMapTexture] 2D 0
"!!ARBfp1.0
OPTION ARB_fragment_program_shadow;
PARAM c[9] = { program.local[0..7],
		{ 1, 255, 0.0039215689 } };
TEMP R0;
TEMP R1;
TEMP R2;
ADD R0.xyz, fragment.texcoord[4], -c[1];
ADD R2.xyz, fragment.texcoord[4], -c[4];
DP3 R0.x, R0, R0;
ADD R1.xyz, fragment.texcoord[4], -c[2];
DP3 R0.y, R1, R1;
ADD R1.xyz, fragment.texcoord[4], -c[3];
DP3 R0.w, R2, R2;
DP3 R0.z, R1, R1;
SLT R2, R0, c[5];
ADD_SAT R0.xyz, R2.yzww, -R2;
MUL R1.xyz, R0.x, fragment.texcoord[1];
MAD R1.xyz, R2.x, fragment.texcoord[0], R1;
MAD R1.xyz, R0.y, fragment.texcoord[2], R1;
MAD R0.xyz, fragment.texcoord[3], R0.z, R1;
ADD R1.xyz, -fragment.texcoord[4], c[7];
MOV result.color.y, c[8].x;
TEX R0.x, R0, texture[0], SHADOW2D;
DP3 R0.z, R1, R1;
RSQ R0.z, R0.z;
MOV R0.y, c[8].x;
ADD R0.y, R0, -c[6].x;
MAD R0.x, R0, R0.y, c[6];
MUL R0.y, -fragment.texcoord[4].w, c[0].w;
ADD R0.y, R0, c[8].x;
RCP R1.x, R0.z;
MUL R0.zw, R0.y, c[8].xyxy;
MAD_SAT R0.y, R1.x, c[6].z, c[6].w;
FRC R0.zw, R0;
ADD_SAT result.color.x, R0, R0.y;
MOV R0.y, R0.w;
MAD R0.x, -R0.w, c[8].z, R0.z;
MOV result.color.zw, R0.xyxy;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Vector 0 [_ProjectionParams]
Vector 1 [unity_ShadowSplitSpheres0]
Vector 2 [unity_ShadowSplitSpheres1]
Vector 3 [unity_ShadowSplitSpheres2]
Vector 4 [unity_ShadowSplitSpheres3]
Vector 5 [unity_ShadowSplitSqRadii]
Vector 6 [_LightShadowData]
Vector 7 [unity_ShadowFadeCenterAndType]
SetTexture 0 [_ShadowMapTexture] 2D 0
"ps_2_0
dcl_2d s0
def c8, 0.00000000, 1.00000000, 255.00000000, 0.00392157
dcl t0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
add r0.xyz, t4, -c1
add r2.xyz, t4, -c4
dp3 r0.x, r0, r0
add r1.xyz, t4, -c2
dp3 r0.y, r1, r1
add r1.xyz, t4, -c3
dp3 r0.z, r1, r1
dp3 r0.w, r2, r2
add r0, r0, -c5
cmp r0, r0, c8.x, c8.y
mov r1.x, r0.y
mov r1.z, r0.w
mov r1.y, r0.z
add_sat r1.xyz, r1, -r0
mul r2.xyz, r1.x, t1
mad r0.xyz, r0.x, t0, r2
mad r0.xyz, r1.y, t2, r0
mad r0.xyz, t3, r1.z, r0
add r1.xyz, -t4, c7
dp3 r1.x, r1, r1
rsq r1.x, r1.x
rcp r1.x, r1.x
mad_sat r1.x, r1, c6.z, c6.w
texld r2, r0, s0
mov r0.x, c6
add r0.x, c8.y, -r0
mad r0.x, r2, r0, c6
mul r2.x, -t4.w, c0.w
add r2.x, r2, c8.y
mul r2.xy, r2.x, c8.yzxw
frc r2.xy, r2
add_sat r0.x, r0, r1
mov r1.y, r2
mad r1.x, -r2.y, c8.w, r2
mov r0.w, r1.y
mov r0.z, r1.x
mov r0.y, c8
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
SetTexture 0 [_ShadowMapTexture] 2D 0
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 0 [unity_ShadowSplitSpheres0]
Vector 16 [unity_ShadowSplitSpheres1]
Vector 32 [unity_ShadowSplitSpheres2]
Vector 48 [unity_ShadowSplitSpheres3]
Vector 64 [unity_ShadowSplitSqRadii]
Vector 384 [_LightShadowData]
Vector 400 [unity_ShadowFadeCenterAndType]
BindCB  "UnityPerCamera" 0
BindCB  "UnityShadows" 1
"ps_4_0_level_9_1
eefiecednjimmkpkglhenecngjmdodgjnmhighkaabaaaaaaoiaiaaaaafaaaaaa
deaaaaaadaadaaaaomahaaaapmahaaaaleaiaaaaebgpgodjpeacaaaapeacaaaa
aaacppppkiacaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaa
aaaaaaaaaaaaafaaabaaaaaaaaaaaaaaabaaaaaaafaaabaaaaaaaaaaabaabiaa
acaaagaaaaaaaaaaaaacppppfbaaaaafaiaaapkaaaaaiadpaaaahpedibiaiadl
aaaaaaaafbaaaaafajaaapkaaaaaaaaaaaaaiadpaaaaaaiaaaaaialpbpaaaaac
aaaaaaiaaaaaahlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahla
bpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaja
aaaiapkaacaaaaadaaaaahiaaeaaoelaabaaoekbaiaaaaadaaaaabiaaaaaoeia
aaaaoeiaacaaaaadabaaahiaaeaaoelaacaaoekbaiaaaaadaaaaaciaabaaoeia
abaaoeiaacaaaaadabaaahiaaeaaoelaadaaoekbaiaaaaadaaaaaeiaabaaoeia
abaaoeiaacaaaaadabaaahiaaeaaoelaaeaaoekbaiaaaaadaaaaaiiaabaaoeia
abaaoeiaacaaaaadaaaaapiaaaaaoeiaafaaoekbfiaaaaaeabaaahiaaaaaoeia
ajaakkkaajaappkafiaaaaaeaaaaapiaaaaaoeiaajaaaakaajaaffkaacaaaaad
acaaadiaabaaoeiaaaaamjiaacaaaaadacaaaeiaabaakkiaaaaappiaalaaaaad
aaaaaoiaacaabliaajaaaakaafaaaaadabaaahiaaaaappiaabaaoelaaeaaaaae
abaaahiaaaaaoelaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaacaaoelaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaadaaoelaaaaaffiaabaaoeiaecaaaaadaaaacpia
aaaaoeiaaaaioekaabaaaaacaaaaaciaajaaffkabcaaaaaeabaacbiaaaaaaaia
aaaaffiaagaaaakaacaaaaadacaaahiaaeaaoelaahaaoekbaiaaaaadaaaaabia
acaaoeiaacaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
aeaaaaaeaaaabbiaaaaaaaiaagaakkkaagaappkaacaaaaadabaadbiaaaaaaaia
abaaaaiaaeaaaaaeaaaaabiaaeaapplaaaaappkbaaaaffiaafaaaaadaaaaadia
aaaaaaiaaiaaoekabdaaaaacaaaaadiaaaaaoeiaaeaaaaaeabaaceiaaaaaffia
aiaakkkbaaaaaaiaabaaaaacabaaciiaaaaaffiaabaaaaacabaacciaajaaffka
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefcleaeaaaaeaaaaaaacnabaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaabkaaaaaa
fkaiaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
hcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaaaaaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaacaaaaaabaaaaaahecaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaa
egiccaiaebaaaaaaabaaaaaaadaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaadbaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiocaaaabaaaaaaaeaaaaaadhaaaaaphcaabaaaabaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaaaaaaceaaaaaaaaaaaiaaaaaaaia
aaaaaaiaaaaaaaaaabaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaafgaobaaaaaaaaaaadeaaaaakocaabaaaaaaaaaaafgaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegbcbaaaacaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaaaaaaaaa
egbcbaaaadaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaa
aaaaaaaaegbcbaaaaeaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaehaaaaal
bcaabaaaaaaaaaaaegaabaaaaaaaaaaaaghabaaaaaaaaaaaaagabaaaaaaaaaaa
ckaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaaakiacaiaebaaaaaaabaaaaaa
biaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaabiaaaaaaaaaaaaajocaabaaaaaaaaaaa
agbjbaaaafaaaaaaagijcaiaebaaaaaaabaaaaaabjaaaaaabaaaaaahccaabaaa
aaaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaaelaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadccaaaalccaabaaaaaaaaaaabkaabaaaaaaaaaaackiacaaa
abaaaaaabiaaaaaadkiacaaaabaaaaaabiaaaaaaaacaaaahbccabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaadkbabaia
ebaaaaaaafaaaaaadkiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaak
dcaabaaaaaaaaaaaagaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaahpedaaaaaaaa
aaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakeccabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaabkaabaaaaaaaaaaadgaaaaafcccabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabfdegejdaaiaaaaaaiaaaaaaaaaaaaaaaejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaahahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Geometry" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "RenderType"="Opaque" }
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
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R0, fragment.texcoord[2];
DP3 R0.w, fragment.texcoord[1], c[0];
MUL R0.xyz, R0, c[1];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1;
MOV result.color.w, c[2].x;
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
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c2
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t2
mov_pp r0.w, c2.z
mad_pp r0.xyz, r0, c2.y, r1
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
eefiecedoebneldkaelpcmiklnnglhlpgmpfldfpabaaaaaakeacaaaaadaaaaaa
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
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
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
eefiecedlpbgijmcfcgpmjlmcgmoagdjacacdjefabaaaaaaoiadaaaaaeaaaaaa
daaaaaaahaabaaaabaadaaaaleadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
piaaaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaajaaaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioeka
aiaaaaadaaaaciiaacaaoelaabaaoekaalaaaaadabaaciiaaaaappiaacaaaaka
acaaaaadaaaaciiaabaappiaabaappiaafaaaaadaaaachiaaaaaoeiaabaaoela
afaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoela
aeaaaaaeaaaachiaabaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaciiaacaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcjiabaaaaeaaaaaaaggaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
baaaaaaibcaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[1] = { { 1, 8 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[1], texture[1], 2D;
MUL R1.xyz, R1, fragment.color.primary;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[0].y;
MOV result.color.w, c[0].x;
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
def c0, 8.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0
eefiecednmmjmmngfgeeogjmihdiaelbkjjakdigabaaaaaadmacaaaaadaaaaaa
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
egbcbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_4_0_level_9_1
eefiecedkibicgaifglobihipmphlmphdmcmhklgabaaaaaaeiadaaaaaeaaaaaa
daaaaaaadiabaaaaiiacaaaabeadaaaaebgpgodjaaabaaaaaaabaaaaaaacpppp
neaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaabllaecaaaaad
aaaacpiaaaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaad
aaaaciiaaaaappiaaaaaaakaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
abaachiaabaaoeiaabaaoelaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaac
aaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefceiabaaaa
eaaaaaaafcaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
hnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 1, 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R1.x, fragment.texcoord[3], texture[1], 2D;
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.yzw, R0.xxyz, fragment.texcoord[2].xxyz;
DP3 R0.w, fragment.texcoord[1], c[0];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, R1.x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1.yzww;
MOV result.color.w, c[2].x;
END
# 11 instructions, 2 R-regs
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
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r0, t0, s0
texldp r3, t3, s1
mul r1.xyz, r0, v0
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t1, c0
max_pp r0.x, r0, c2
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t2
mov_pp r0.w, c2.z
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
eefieceddjbeahhpiplkjfkhihdokmmanmghbcnlabaaaaaaceadaaaaadaaaaaa
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
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
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
eefiecedcpmaenlfhopjhibbiccaljifkndcmdkpabaaaaaameaeaaaaaeaaaaaa
daaaaaaammabaaaaneadaaaajaaeaaaaebgpgodjjeabaaaajeabaaaaaaacpppp
faabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadia
aaaappiaaeaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
aaaaoelaabaioekaaiaaaaadabaaciiaacaaoelaabaaoekaafaaaaadaaaacbia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaaaaaaaiaacaaaakaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaachiaabaaoeiaabaaoelaafaaaaad
abaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoelaaeaaaaae
aaaachiaabaaoeiaabaappiaaaaaoeiaabaaaaacaaaaciiaacaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcaaacaaaaeaaaaaaaiaaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabaaaaaaiccaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaa
aaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadiaaaaai
hcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_ShadowMapTexture] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 1, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[1], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0].y;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[0].z;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, fragment.color.primary;
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[0].x;
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
def c0, 8.00000000, 2.00000000, 1.00000000, 0
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
mov_pp r0.w, c0.z
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0
eefiecedkoehpokgignhnebnphgidgnpbpnkjigjabaaaaaaeiadaaaaadaaaaaa
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
abaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_ShadowMapTexture] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0_level_9_1
eefiecedifilegkcnjmnjkckgcjlkgpaemfmgnodabaaaaaaomaeaaaaaeaaaaaa
daaaaaaanaabaaaabeaeaaaaliaeaaaaebgpgodjjiabaaaajiabaaaaaaacpppp
giabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadia
aaaappiaacaaoelaabaaaaacabaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadacaacpiaaaaaoela
abaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
acaappiaafaaaaadabaaciiaabaappiaaaaaaakaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadadaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaadaaoeiaaaaaoeiaafaaaaadaaaachiaacaaoeia
abaaoelaafaaaaadaaaachiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaaaaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdmacaaaaeaaaaaaaipaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaa
diaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojmaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "VertexLit"
}