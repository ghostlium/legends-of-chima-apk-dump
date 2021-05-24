//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Animated/Diffuse Animated Vegetation" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _BendingFactor ("Wind bending factor", Float) = 1
}
SubShader { 
 LOD 500
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
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
Float 22 [_EdgeFlutterPrimary]
Float 23 [_EdgeFlutterController]
Float 24 [_EdgeFlutterFreqScalePrimary]
Float 25 [_EdgeFlutterFreqScaleController]
Vector 26 [_WindPrimary]
Vector 27 [_WindController]
Float 28 [_LerpToController]
Float 29 [_BendingFactor]
Vector 30 [_RadialWindOrigin]
Float 31 [_RadialWindForce]
Float 32 [_RadialWindFallof]
Float 33 [_RadialWindFreqMultiplier]
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
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[21].w;
ADD R2, R0, -c[30];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[32].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[36].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[31];
MUL R0.y, R0.x, c[33].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[24].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[22];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[35];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[31].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[26];
ADD R1.x, R2.w, c[23];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[25].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[35];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[29].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[22].x;
MUL R1.y, R2.w, c[36].x;
MUL R1.xz, R5.zyww, c[36].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[27];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[26], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R3.xyz, R2.w, R3;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[21].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[23].x;
MUL R4.xz, R4.xyyw, c[36].y;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.w, R2, c[27];
MUL R0.xyz, R0, c[21].w;
MAD R0.xyz, R1, R0.w, R0;
MUL R1.xyz, vertex.normal, c[21].w;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[28].x, R2;
DP3 R2.w, R1, c[6];
DP3 R3.w, R1, c[7];
ADD R0.xyz, vertex.position, R0;
MOV R0.w, vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
DP3 R0.x, R1, c[5];
MOV R0.y, R2.w;
MOV R0.z, R3.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[20];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R2.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[34], c[34].zwzw;
END
# 120 instructions, 6 R-regs
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
Float 21 [_EdgeFlutterPrimary]
Float 22 [_EdgeFlutterController]
Float 23 [_EdgeFlutterFreqScalePrimary]
Float 24 [_EdgeFlutterFreqScaleController]
Vector 25 [_WindPrimary]
Vector 26 [_WindController]
Float 27 [_LerpToController]
Float 28 [_BendingFactor]
Vector 29 [_RadialWindOrigin]
Float 30 [_RadialWindForce]
Float 31 [_RadialWindFallof]
Float 32 [_RadialWindFreqMultiplier]
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
mov r2.xyz, c7
dp3 r3.y, c34.x, r2
rcp r1.y, c31.x
mul r5.zw, v2.xyxz, c21.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c20.w
add r0, r0, -c29
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c34
max r1.x, r1, c37
add r3.x, -r1, c34
mul r1.x, r3, c30
mul r1.x, r1, c32
add r2.w, r1.x, c23.x
mov r1, c4
dp4 r1.x, c34.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c21
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c35
frc r1, r1
mad r1, r1, c34.y, c34.z
frc r1, r1
mad r1, r1, c34.y, c34.w
abs r1, r1
mad r2, -r1, c36.x, c36.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c34.x
mul r1, r0, c30.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c22.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c25
mov r0.w, c12.y
mad r1.xy, c24.x, r0.w, r1
mul r0, r1.xxyy, c35
add r1.w, -v5, c34.x
frc r0, r0
mad r0, r0, c34.y, c34.z
frc r0, r0
mad r0, r0, c34.y, c34.w
mul r2.w, r1, c28.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c36.x, c36.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c36.w
mul r1.y, r2.w, c36.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c26, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c25, r0
dp3 r5.y, c26, r0
dp3 r5.x, c26, r3
mul r0.xyz, r1.w, r5
mul r3.xyz, r2.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c20.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c22.x
mul r4.xz, r4.xyyw, c36.w
mul r0.w, r2, c26
mul r0.xyz, r2.w, r0
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c20.w
mad r0.xyz, r0, r0.w, r1
mul r1.xyz, v2, c20.w
add r0.xyz, r0, -r2
mad r0.xyz, r0, c27.x, r2
dp3 r2.w, r1, c5
dp3 r3.w, r1, c6
add r0.xyz, v0, r0
mov r0.w, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
dp3 r0.x, r1, c4
mov r0.y, r2.w
mov r0.z, r3.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c34.x
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c18
dp4 r3.y, r1, c17
dp4 r3.x, r1, c16
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c19
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oT1.z, r3.w
mov oT1.y, r2.w
mov oT1.x, r0
mad oT0.xy, v3, c33, c33.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 176
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
Vector 160 [_MainTex_ST]
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
eefiecedfpbmpngopmbegbhoafdnecjcfafpjnhdabaaaaaacibiaaaaaeaaaaaa
daaaaaaajeaiaaaanibgaaaakabhaaaaebgpgodjfmaiaaaafmaiaaaaaaacpopp
omahaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
ahaaabaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaaacaacgaaahaaajaaaaaaaaaa
adaaaaaaaeaabaaaaaaaaaaaadaaamaaahaabeaaaaaaaaaaadaabeaaabaablaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbmaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpfbaaaaafbnaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
boaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafbpaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaahaaoekaahaaookaafaaaaadaaaaahiaacaaoejablaappka
afaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeaaaaaliabeaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
bmaaaakaajaaaaadabaaabiaajaaoekaaaaaoeiaajaaaaadabaaaciaakaaoeka
aaaaoeiaajaaaaadabaaaeiaalaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaamaaoekaacaaoeiaajaaaaadadaaaciaanaaoeka
acaaoeiaajaaaaadadaaaeiaaoaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacabaaahoaaaaaoeiaaeaaaaaeacaaahoaapaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjabfaaoekaaeaaaaaeaaaaapia
beaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabhaaoekaaaaappjaaaaaoeiaabaaaaacabaaaiiablaappka
aeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaadaaaaaiiaaaaaoeia
aaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabiaaaaappiaafaaaaad
aaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaiaabaaaaiaagaaaaac
abaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaiaalaaaaadabaaabia
abaaaaiabmaaffkaakaaaaadabaaabiaabaaaaiabmaaaakaacaaaaadabaaabia
abaaaaibbmaaaakaafaaaaadabaaaciaabaaaaiaagaaaakaabaaaaacacaaapia
abaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkiaabaaaaacadaaabia
beaaaakaacaaaaadabaaaeiaadaaaaiabfaaaakaacaaaaadabaaaeiaabaakkia
bgaaaakaacaaaaadabaaaeiaabaakkiabhaaaakaaeaaaaaeabaaaciaaiaaffka
abaaffiaabaakkiaabaaaaacadaaabiabeaappkaabaaaaacadaaaciabfaappka
abaaaaacadaaaeiabgaappkaaiaaaaadadaaaeiaadaaoeiabmaaaakaacaaaaad
abaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoejaabaakkiaaiaaaaad
adaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaaiaaffkaacaappiaadaakaia
acaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapiaadaaoeiabnaaoeka
bdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiabmaakkkabmaappka
bdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiaboaaaakaboaaffka
cdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeiabnaaoekabdaaaaac
aeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabmaakkkabmaappkabdaaaaac
aeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiaboaaaakaboaaffkacdaaaaac
aeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeiaaeaaaaaeadaaapia
adaaoeiaboaaaakbboaakkkaafaaaaadadaaapiaadaaoeiaafaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiabmaaaakaafaaaaadaaaaapia
aaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeiaaeaaaaaeaaaaahia
aaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffiabjaaoekaaeaaaaae
adaaahiabiaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahiabkaaoekaaaaakkia
adaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaia
agaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkiaadaajaiaacaaaaad
abaaabiaafaappjbbmaaaakaafaaaaadabaaabiaabaaaaiaaeaaffkaafaaaaad
aaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaiaboaappkaafaaaaad
acaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfiaafaaaaadafaaacia
abaaaaiabpaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaiaaaaaoeiaabaaaaac
acaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaiaaaaaaaiaafaaaaad
aaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaiaabaaaaiaafaaaaad
abaaaoiaabaaoeiablaappkaaeaaaaaeaaaaahiaaaaapjiaaaaaaaiaabaapjia
afaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiaboaaaakb
boaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaadabaaaoiaadaaheia
adaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahiaadaaffiabjaaoeka
aeaaaaaeadaaaliabiaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahiabkaaoeka
adaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeiaafaaaaadadaaahia
abaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiablaappkaafaaaaadaeaaahia
abaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappkaaeaaaaaeabaaahia
abaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeiaaaaappiaadaaoeia
bcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeia
aaaaoejaafaaaaadabaaapiaaaaaffiabbaaoekaaeaaaaaeabaaapiabaaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaapiabdaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcdmaoaaaaeaaaabaa
ipadaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagiaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaa
adaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaaaiaaaaaabbaaaaah
ccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaaocaaaaiecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaajaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaa
aaaaaaaaajaaaaaackiacaaaaaaaaaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaag
bcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaakgakbaaaacaaaaaa
agiecaaaaaaaaaaaaeaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaaaaaaaaa
kgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaaaaaaaaapgapbaaa
aaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaaaaaaaaaapgipcaaa
aaaaaaaaaeaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaaacaaaaaaagaabaaa
aaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaakpcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaa
dcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaaaaaaaaah
ncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaa
bkiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaaaaaaaaaaaeaaaaaa
aceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaahpcaabaaaaeaaaaaa
cgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaaafaaaaaafgahbaaa
aeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaaabeaaaaajkjjjjdo
dcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaafaaaaaaagajbaaa
abaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaakccaabaaaaaaaaaaa
dkiacaaaaaaaaaaaafaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaiaibaaaaaaadaaaaaa
dcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaaaaaaaaaagaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaaaaaaaaaagaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaa
fgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaadkiacaaa
aaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaa
aaaaaaaaahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaacaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
Float 15 [_EdgeFlutterPrimary]
Float 16 [_EdgeFlutterController]
Float 17 [_EdgeFlutterFreqScalePrimary]
Float 18 [_EdgeFlutterFreqScaleController]
Vector 19 [_WindPrimary]
Vector 20 [_WindController]
Float 21 [_LerpToController]
Float 22 [_BendingFactor]
Vector 23 [_RadialWindOrigin]
Float 24 [_RadialWindForce]
Float 25 [_RadialWindFallof]
Float 26 [_RadialWindFreqMultiplier]
Vector 27 [unity_LightmapST]
Vector 28 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..28],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[14].w;
ADD R2, R0, -c[23];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[25].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[30].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[24];
MUL R0.y, R0.x, c[26].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[17].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[15];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[29];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[24].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[19];
ADD R1.x, R2.w, c[16];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[18].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[29];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[22].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
ABS R0, R0;
MUL R4.xyz, R2.w, R1;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[15].x;
MUL R1.xz, R5.zyww, c[30].y;
MUL R1.y, R2.w, c[30].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[20];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[19], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[14].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[16].x;
MUL R4.xz, R4.xyyw, c[30].y;
MUL R0.w, R2, c[20];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[14].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[21].x, R2;
MOV R0.w, vertex.position;
ADD R0.xyz, vertex.position, R0;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[28], c[28].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[27], c[27].zwzw;
END
# 99 instructions, 6 R-regs
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
Float 14 [_EdgeFlutterPrimary]
Float 15 [_EdgeFlutterController]
Float 16 [_EdgeFlutterFreqScalePrimary]
Float 17 [_EdgeFlutterFreqScaleController]
Vector 18 [_WindPrimary]
Vector 19 [_WindController]
Float 20 [_LerpToController]
Float 21 [_BendingFactor]
Vector 22 [_RadialWindOrigin]
Float 23 [_RadialWindForce]
Float 24 [_RadialWindFallof]
Float 25 [_RadialWindFreqMultiplier]
Vector 26 [unity_LightmapST]
Vector 27 [_MainTex_ST]
"vs_2_0
def c28, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c29, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c30, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c31, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r2.xyz, c7
dp3 r3.y, c28.x, r2
rcp r1.y, c24.x
mul r5.zw, v2.xyxz, c14.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c13.w
add r0, r0, -c22
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c28
max r1.x, r1, c31
add r3.x, -r1, c28
mul r1.x, r3, c23
mul r1.x, r1, c25
add r2.w, r1.x, c16.x
mov r1, c4
dp4 r1.x, c28.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c14
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c29
frc r1, r1
mad r1, r1, c28.y, c28.z
frc r1, r1
mad r1, r1, c28.y, c28.w
abs r1, r1
mad r2, -r1, c30.x, c30.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c28.x
mul r1, r0, c23.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c15.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c18
mov r0.w, c12.y
mad r1.xy, c17.x, r0.w, r1
mul r0, r1.xxyy, c29
add r1.w, -v5, c28.x
frc r0, r0
mad r0, r0, c28.y, c28.z
frc r0, r0
mad r0, r0, c28.y, c28.w
mul r2.w, r1, c21.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
abs r0, r0
mul r4.xyz, r2.w, r1
mul r1, r0, r0
mad r0, -r0, c30.x, c30.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c30.w
mul r1.y, r2.w, c30.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c19, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c18, r0
dp3 r5.y, c19, r0
dp3 r5.x, c19, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c13.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c15.x
mul r4.xz, r4.xyyw, c30.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mul r3.xyz, r2.w, r5
mul r0.w, r2, c19
mul r1.xyz, r3, c13.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c20.x, r2
mov r0.w, v0
add r0.xyz, v0, r0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mad oT0.xy, v3, c27, c27.zwzw
mad oT1.xy, v4, c26, c26.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 192
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
Vector 160 [unity_LightmapST]
Vector 176 [_MainTex_ST]
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
eefiecedalbhoeobhaldhakojdccbbjpibgnnopaabaaaaaaambfaaaaaeaaaaaa
daaaaaaajaahaaaanebdaaaajmbeaaaaebgpgodjfiahaaaafiahaaaaaaacpopp
peagaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
aiaaabaaaaaaaaaaabaaaaaaabaaajaaaaaaaaaaacaaaaaaaeaaakaaaaaaaaaa
acaaamaaahaaaoaaaaaaaaaaacaabeaaabaabfaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaiadpaaaaaaaaaaaaaaeaaaaaaalpfbaaaaafbhaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafbiaaapkaaaaaaaeaaaaaialp
aaaaeaeamnmmmmdnfbaaaaafbjaaapkajkjjjjdoaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaaiaaoekaaiaaookaaeaaaaaeaaaaamoaaeaabejaahaabeka
ahaalekaafaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapiaaoaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabbaaoekaaaaappjaaaaaoeiaabaaaaacabaaaiiabfaappkaaeaaaaae
aaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaadaaaaaiiaaaaaoeiaaaaaoeia
ahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabiaaaaappiaafaaaaadaaaaahia
aaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaiaabaaaaiaagaaaaacabaaacia
agaaffkaafaaaaadabaaabiaabaaffiaabaaaaiaalaaaaadabaaabiaabaaaaia
bgaaffkaakaaaaadabaaabiaabaaaaiabgaaaakaacaaaaadabaaabiaabaaaaib
bgaaaakaafaaaaadabaaaciaabaaaaiaagaaaakaabaaaaacacaaapiaabaaoeka
aeaaaaaeabaaaciaabaaffiaagaakkkaacaakkiaabaaaaacadaaabiaaoaaaaka
acaaaaadabaaaeiaadaaaaiaapaaaakaacaaaaadabaaaeiaabaakkiabaaaaaka
acaaaaadabaaaeiaabaakkiabbaaaakaaeaaaaaeabaaaciaajaaffkaabaaffia
abaakkiaabaaaaacadaaabiaaoaappkaabaaaaacadaaaciaapaappkaabaaaaac
adaaaeiabaaappkaaiaaaaadadaaaeiaadaaoeiabgaaaakaacaaaaadabaaamia
adaakkiaabaaeekaaiaaaaadadaaaciaaaaaoejaabaakkiaaiaaaaadadaaabia
aaaaoejaabaappiaaeaaaaaeaeaaapiaajaaffkaacaappiaadaakaiaacaaaaad
adaaapiaabaaffiaadaakfiaafaaaaadadaaapiaadaaoeiabhaaoekabdaaaaac
adaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiabgaakkkabgaappkabdaaaaac
adaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiabiaaaakabiaaffkacdaaaaac
adaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeiabhaaoekabdaaaaacaeaaapia
aeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabgaakkkabgaappkabdaaaaacaeaaapia
aeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabiaaaakabiaaffkacdaaaaacaeaaapia
aeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
biaaaakbbiaakkkaafaaaaadadaaapiaadaaoeiaafaaoeiaacaaaaadabaaaoia
adaaheiaadaacaiaabaaaaacaaaaaiiabgaaaakaafaaaaadaaaaapiaaaaaoeia
agaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeia
abaaaaiaacaaoekaafaaaaadadaaahiaaaaaffiabdaaoekaaeaaaaaeadaaahia
bcaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahiabeaaoekaaaaakkiaadaaoeia
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaac
aaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkiaadaajaiaacaaaaadabaaabia
afaappjbbgaaaakaafaaaaadabaaabiaabaaaaiaaeaaffkaafaaaaadaaaaaoia
aaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaiabiaappkaafaaaaadacaaapia
acaahciaacaakajaabaaaaacafaaafiaacaapfiaafaaaaadafaaaciaabaaaaia
bjaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaiaaaaaoeiaabaaaaacacaaacia
afaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaiaaaaaaaiaafaaaaadaaaaabia
abaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaiaabaaaaiaafaaaaadabaaaoia
abaaoeiabfaappkaaeaaaaaeaaaaahiaaaaapjiaaaaaaaiaabaapjiaafaaaaad
adaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabiaaaakbbiaakkka
afaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaadabaaaoiaadaaheiaadaacaia
abaaaaacadaaahiaadaaoekaafaaaaadaeaaahiaadaaffiabdaaoekaaeaaaaae
adaaaliabcaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahiabeaaoekaadaakkia
adaapeiaafaaaaadaeaaahiaabaakkiaadaaoeiaafaaaaadadaaahiaabaaaaia
adaaoeiaafaaaaadadaaahiaadaaoeiabfaappkaafaaaaadaeaaahiaabaaaaia
aeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappkaaeaaaaaeabaaahiaabaapjia
acaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeiaaaaappiaadaaoeiabcaaaaae
acaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeiaaaaaoeja
afaaaaadabaaapiaaaaaffiaalaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefcdmamaaaaeaaaabaaapadaaaa
fjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
fcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagiaaaaacagaaaaaaaaaaaaaj
bcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaaakiacaaaacaaaaaaanaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaacaaaaaaapaaaaaa
diaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegiocaiaebaaaaaa
aaaaaaaaaiaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaa
abaaaaaaaocaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaa
ajaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaalecaabaaaaaaaaaaa
ckaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaackiacaaaaaaaaaaaaeaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaacaaaaaadkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
acaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaa
aaaaaaaakgakbaaaacaaaaaaagiecaaaaaaaaaaaaeaaaaaabaaaaaahccaabaaa
acaaaaaaegbcbaaaaaaaaaaakgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaa
egbcbaaaaaaaaaaapgapbaaaaaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaa
abaaaaaaaaaaaaaapgipcaaaaaaaaaaaaeaaaaaaagakbaaaacaaaaaaaaaaaaah
pcaabaaaacaaaaaaagaabaaaaaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaap
pcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
adaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaajpcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaa
egaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaaeaaaaaaaaaaaaahncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaa
acaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgakbaaa
abaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaa
abaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaa
abaaaaaadkaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaa
agifcaaaaaaaaaaaaeaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdn
diaaaaahpcaabaaaaeaaaaaacgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaf
fcaabaaaafaaaaaafgahbaaaaeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaa
abaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agajbaaaafaaaaaaagajbaaaabaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaa
afaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
dcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaadkaabaaaabaaaaaa
bkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaa
egaobaiaibaaaaaaadaaaaaadcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaa
adaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaea
aaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaa
acaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaagaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
acaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaa
dkaabaaaabaaaaaadkiacaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaagiacaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaa
alaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
giaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaafmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
Float 23 [_EdgeFlutterPrimary]
Float 24 [_EdgeFlutterController]
Float 25 [_EdgeFlutterFreqScalePrimary]
Float 26 [_EdgeFlutterFreqScaleController]
Vector 27 [_WindPrimary]
Vector 28 [_WindController]
Float 29 [_LerpToController]
Float 30 [_BendingFactor]
Vector 31 [_RadialWindOrigin]
Float 32 [_RadialWindForce]
Float 33 [_RadialWindFallof]
Float 34 [_RadialWindFreqMultiplier]
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
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[22].w;
ADD R2, R0, -c[31];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[33].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[37].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[32];
MUL R0.y, R0.x, c[34].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[25].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[23];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[36];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[32].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[27];
ADD R1.x, R2.w, c[24];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[26].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[36];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[30].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[23].x;
MUL R1.y, R2.w, c[37].x;
MUL R1.xz, R5.zyww, c[37].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[28];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[27], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R3.xyz, R2.w, R3;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[22].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[24].x;
MUL R4.xz, R4.xyyw, c[37].y;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.w, R2, c[28];
MUL R0.xyz, R0, c[22].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[29].x, R2;
ADD R0.xyz, vertex.position, R0;
MOV R0.w, vertex.position;
DP4 R1.w, R0, c[4];
DP4 R1.z, R0, c[3];
DP4 R1.x, R0, c[1];
DP4 R1.y, R0, c[2];
MUL R2.xyz, R1.xyww, c[37].w;
MUL R2.y, R2, c[14].x;
ADD result.texcoord[3].xy, R2, R2.z;
MUL R2.xyz, vertex.normal, c[22].w;
DP3 R2.w, R2, c[6];
DP3 R3.w, R2, c[7];
DP3 R0.x, R2, c[5];
MOV R0.y, R2.w;
MOV R0.z, R3.w;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[17];
DP4 R2.y, R0, c[16];
DP4 R2.x, R0, c[15];
MOV result.position, R1;
MOV result.texcoord[3].zw, R1;
MUL R1, R0.xyzz, R0.yzzx;
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MAD R0.y, R0.x, R0.x, -R0;
MUL R1.xyz, R0.y, c[21];
ADD R2.xyz, R2, R3;
ADD result.texcoord[2].xyz, R2, R1;
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R2.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[35], c[35].zwzw;
END
# 125 instructions, 6 R-regs
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
Float 23 [_EdgeFlutterPrimary]
Float 24 [_EdgeFlutterController]
Float 25 [_EdgeFlutterFreqScalePrimary]
Float 26 [_EdgeFlutterFreqScaleController]
Vector 27 [_WindPrimary]
Vector 28 [_WindController]
Float 29 [_LerpToController]
Float 30 [_BendingFactor]
Vector 31 [_RadialWindOrigin]
Float 32 [_RadialWindForce]
Float 33 [_RadialWindFallof]
Float 34 [_RadialWindFreqMultiplier]
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
mov r2.xyz, c7
dp3 r3.y, c36.x, r2
rcp r1.y, c33.x
mul r5.zw, v2.xyxz, c23.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c22.w
add r0, r0, -c31
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c36
max r1.x, r1, c39
add r3.x, -r1, c36
mul r1.x, r3, c32
mul r1.x, r1, c34
add r2.w, r1.x, c25.x
mov r1, c4
dp4 r1.x, c36.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c23
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c37
frc r1, r1
mad r1, r1, c36.y, c36.z
frc r1, r1
mad r1, r1, c36.y, c36.w
abs r1, r1
mad r2, -r1, c38.x, c38.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c36.x
mul r1, r0, c32.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c24.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c27
mov r0.w, c12.y
mad r1.xy, c26.x, r0.w, r1
mul r0, r1.xxyy, c37
add r1.w, -v5, c36.x
frc r0, r0
mad r0, r0, c36.y, c36.z
frc r0, r0
mad r0, r0, c36.y, c36.w
mul r2.w, r1, c30.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c38.x, c38.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c38.w
mul r1.y, r2.w, c38.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c28, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c27, r0
dp3 r5.y, c28, r0
dp3 r5.x, c28, r3
mul r0.xyz, r1.w, r5
mul r3.xyz, r2.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c22.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c24.x
mul r4.xz, r4.xyyw, c38.w
mul r0.w, r2, c28
mul r0.xyz, r2.w, r0
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c22.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c29.x, r2
add r0.xyz, v0, r0
mov r0.w, v0
dp4 r1.w, r0, c3
dp4 r1.z, r0, c2
dp4 r1.x, r0, c0
dp4 r1.y, r0, c1
mul r2.xyz, r1.xyww, c39.y
mul r2.y, r2, c13.x
mad oT3.xy, r2.z, c14.zwzw, r2
mul r2.xyz, v2, c22.w
dp3 r2.w, r2, c5
dp3 r3.w, r2, c6
dp3 r0.x, r2, c4
mov r0.y, r2.w
mov r0.z, r3.w
mov r0.w, c36.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mov oPos, r1
mov oT3.zw, r1
mul r1, r0.xyzz, r0.yzzx
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
mad r0.y, r0.x, r0.x, -r0
mul r1.xyz, r0.y, c21
add r2.xyz, r2, r3
add oT2.xyz, r2, r1
mov oT1.z, r3.w
mov oT1.y, r2.w
mov oT1.x, r0
mad oT0.xy, v3, c35, c35.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 240
Float 128 [_EdgeFlutterPrimary]
Float 132 [_EdgeFlutterController]
Float 136 [_EdgeFlutterFreqScalePrimary]
Float 140 [_EdgeFlutterFreqScaleController]
Vector 144 [_WindPrimary]
Vector 160 [_WindController]
Float 176 [_LerpToController]
Float 180 [_BendingFactor]
Vector 192 [_RadialWindOrigin]
Float 208 [_RadialWindForce]
Float 212 [_RadialWindFallof]
Float 216 [_RadialWindFreqMultiplier]
Vector 224 [_MainTex_ST]
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
eefiecedmccnhjdjfaifgmaomfkolgckdangpajbabaaaaaadabjaaaaaeaaaaaa
daaaaaaaomaiaaaamibhaaaajabiaaaaebgpgodjleaiaaaaleaiaaaaaaacpopp
diaiaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaiaa
ahaaabaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaaabaaafaaabaaajaaaaaaaaaa
acaacgaaahaaakaaaaaaaaaaadaaaaaaaeaabbaaaaaaaaaaadaaamaaahaabfaa
aaaaaaaaadaabeaaabaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbnaaapka
aaaaiadpaaaaaaaaaaaaaaeaaaaaaalpfbaaaaafboaaapkamnmmpmdpamaceldp
aaaamadomlkbefdofbaaaaafbpaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdn
fbaaaaafcaaaapkajkjjjjdoaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoekaahaaookaafaaaaad
aaaaahiaacaaoejabmaappkaafaaaaadabaaahiaaaaaffiabgaaoekaaeaaaaae
aaaaaliabfaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabhaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabnaaaakaajaaaaadabaaabiaakaaoekaaaaaoeia
ajaaaaadabaaaciaalaaoekaaaaaoeiaajaaaaadabaaaeiaamaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaanaaoekaacaaoeia
ajaaaaadadaaaciaaoaaoekaacaaoeiaajaaaaadadaaaeiaapaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffia
aeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacabaaahoaaaaaoeia
aeaaaaaeacaaahoabaaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
bgaaoekaaeaaaaaeaaaaapiabfaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
bhaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabiaaoekaaaaappjaaaaaoeia
abaaaaacabaaaiiabmaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekb
ajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaac
abaaabiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabia
abaaaaiaabaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffia
abaaaaiaalaaaaadabaaabiaabaaaaiabnaaffkaakaaaaadabaaabiaabaaaaia
bnaaaakaacaaaaadabaaabiaabaaaaibbnaaaakaafaaaaadabaaaciaabaaaaia
agaaaakaabaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkka
acaakkiaabaaaaacadaaabiabfaaaakaacaaaaadabaaaeiaadaaaaiabgaaaaka
acaaaaadabaaaeiaabaakkiabhaaaakaacaaaaadabaaaeiaabaakkiabiaaaaka
aeaaaaaeabaaaciaaiaaffkaabaaffiaabaakkiaabaaaaacadaaabiabfaappka
abaaaaacadaaaciabgaappkaabaaaaacadaaaeiabhaappkaaiaaaaadadaaaeia
adaaoeiabnaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaacia
aaaaoejaabaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapia
aiaaffkaacaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaad
adaaapiaadaaoeiaboaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapia
adaaoeiabnaakkkabnaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapia
adaaoeiabpaaaakabpaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapia
aeaaoeiaboaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeia
bnaakkkabnaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeia
bpaaaakabpaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeia
adaaoeiaaeaaaaaeadaaapiaadaaoeiabpaaaakbbpaakkkaafaaaaadadaaapia
adaaoeiaafaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiia
bnaaaakaafaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappia
aaaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahia
aaaaffiabkaaoekaaeaaaaaeadaaahiabjaaoekaaaaaaaiaadaaoeiaaeaaaaae
adaaahiablaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeia
ahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoia
abaakkiaadaajaiaacaaaaadabaaabiaafaappjbbnaaaakaafaaaaadabaaabia
abaaaaiaaeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapia
acaafaiabpaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafia
acaapfiaafaaaaadafaaaciaabaaaaiacaaaaakaaeaaaaaeaaaaaoiaabaaoeia
afaajaiaaaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappka
abaaaaiaaaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoia
adaajaiaabaaaaiaafaaaaadabaaaoiaabaaoeiabmaappkaaeaaaaaeaaaaahia
aaaapjiaaaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaae
aeaaapiaaeaaoeiabpaaaakbbpaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeia
acaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaad
aeaaahiaadaaffiabkaaoekaaeaaaaaeadaaaliabjaakekaadaaaaiaaeaakeia
aeaaaaaeadaaahiablaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkia
adaaoeiaafaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeia
bmaappkaafaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaia
adaappkaaeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahia
abaaoeiaaaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeia
acaaaaadaaaaahiaacaaoeiaaaaaoejaafaaaaadabaaapiaaaaaffiabcaaoeka
aeaaaaaeabaaapiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabdaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaajaaaakaafaaaaadabaaaiiaabaaaaiabnaappkbafaaaaad
abaaafiaaaaapeiabnaappkbacaaaaadadaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
adaaamoaaaaaoeiappppaaaafdeieefcneaoaaaaeaaaabaalfadaaaafjaaaaae
egiocaaaaaaaaaaaapaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaa
akiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaaipcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaaamaaaaaa
bbaaaaahccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaaocaaaai
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaanaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaanaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckiacaaaaaaaaaaaanaaaaaackiacaaaaaaaaaaaaiaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
dgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
acaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaakgakbaaa
acaaaaaaagiecaaaaaaaaaaaaiaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaa
aaaaaaaakgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaaaaaaaaa
pgapbaaaaaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaaaaaaaaaa
pgipcaaaaaaaaaaaaiaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaaacaaaaaa
agaabaaaaaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaakpcaabaaa
adaaaaaaegaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaaegaobaaa
adaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaa
aaaaaaahncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaadgaaaaaf
icaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaagiacaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
elaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaa
abaaaaaabkiacaaaaaaaaaaaalaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaaaaaaaaaa
aiaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaahpcaabaaa
aeaaaaaacgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaaafaaaaaa
fgahbaaaaeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaaabeaaaaa
jkjjjjdodcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaafaaaaaa
agajbaaaabaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaakccaabaaa
aaaaaaaadkiacaaaaaaaaaaaajaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaiaibaaaaaa
adaaaaaadcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaaaaaaaaaakaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaaaaaaaaa
akaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaaaaaaaaaakaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaa
adaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkiacaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaaaaaaaaalaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aoaaaaaaogikcaaaaaaaaaaaaoaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaafhccabaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
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
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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
Float 16 [_EdgeFlutterPrimary]
Float 17 [_EdgeFlutterController]
Float 18 [_EdgeFlutterFreqScalePrimary]
Float 19 [_EdgeFlutterFreqScaleController]
Vector 20 [_WindPrimary]
Vector 21 [_WindController]
Float 22 [_LerpToController]
Float 23 [_BendingFactor]
Vector 24 [_RadialWindOrigin]
Float 25 [_RadialWindForce]
Float 26 [_RadialWindFallof]
Float 27 [_RadialWindFreqMultiplier]
Vector 28 [unity_LightmapST]
Vector 29 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..29],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[15].w;
ADD R2, R0, -c[24];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[26].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[31].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[25];
MUL R0.y, R0.x, c[27].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[18].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[16];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[30];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[25].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[20];
ADD R1.x, R2.w, c[17];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[19].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[30];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[23].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
ABS R0, R0;
MUL R4.xyz, R2.w, R1;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[16].x;
MUL R1.xz, R5.zyww, c[31].y;
MUL R1.y, R2.w, c[31].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[21];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[20], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[15].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[17].x;
MUL R4.xz, R4.xyyw, c[31].y;
MUL R0.w, R2, c[21];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[15].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[22].x, R2;
MOV R0.w, vertex.position;
ADD R0.xyz, vertex.position, R0;
DP4 R1.w, R0, c[4];
DP4 R1.z, R0, c[3];
DP4 R1.x, R0, c[1];
DP4 R1.y, R0, c[2];
MUL R2.xyz, R1.xyww, c[31].w;
MUL R2.y, R2, c[14].x;
ADD result.texcoord[2].xy, R2, R2.z;
MOV result.position, R1;
MOV result.texcoord[2].zw, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[29], c[29].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[28], c[28].zwzw;
END
# 104 instructions, 6 R-regs
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
Float 16 [_EdgeFlutterPrimary]
Float 17 [_EdgeFlutterController]
Float 18 [_EdgeFlutterFreqScalePrimary]
Float 19 [_EdgeFlutterFreqScaleController]
Vector 20 [_WindPrimary]
Vector 21 [_WindController]
Float 22 [_LerpToController]
Float 23 [_BendingFactor]
Vector 24 [_RadialWindOrigin]
Float 25 [_RadialWindForce]
Float 26 [_RadialWindFallof]
Float 27 [_RadialWindFreqMultiplier]
Vector 28 [unity_LightmapST]
Vector 29 [_MainTex_ST]
"vs_2_0
def c30, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c31, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c32, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c33, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
mov r2.xyz, c7
dp3 r3.y, c30.x, r2
rcp r1.y, c26.x
mul r5.zw, v2.xyxz, c16.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c15.w
add r0, r0, -c24
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c30
max r1.x, r1, c33
add r3.x, -r1, c30
mul r1.x, r3, c25
mul r1.x, r1, c27
add r2.w, r1.x, c18.x
mov r1, c4
dp4 r1.x, c30.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c16
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c31
frc r1, r1
mad r1, r1, c30.y, c30.z
frc r1, r1
mad r1, r1, c30.y, c30.w
abs r1, r1
mad r2, -r1, c32.x, c32.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c30.x
mul r1, r0, c25.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c17.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c20
mov r0.w, c12.y
mad r1.xy, c19.x, r0.w, r1
mul r0, r1.xxyy, c31
add r1.w, -v5, c30.x
frc r0, r0
mad r0, r0, c30.y, c30.z
frc r0, r0
mad r0, r0, c30.y, c30.w
mul r2.w, r1, c23.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
abs r0, r0
mul r4.xyz, r2.w, r1
mul r1, r0, r0
mad r0, -r0, c32.x, c32.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c32.w
mul r1.y, r2.w, c32.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c21, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c20, r0
dp3 r5.y, c21, r0
dp3 r5.x, c21, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c15.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c17.x
mul r4.xz, r4.xyyw, c32.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mul r3.xyz, r2.w, r5
mul r1.xyz, r3, c15.w
mul r0.w, r2, c21
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c22.x, r2
mov r0.w, v0
add r0.xyz, v0, r0
dp4 r1.w, r0, c3
dp4 r1.z, r0, c2
dp4 r1.x, r0, c0
dp4 r1.y, r0, c1
mul r2.xyz, r1.xyww, c33.y
mul r2.y, r2, c13.x
mad oT2.xy, r2.z, c14.zwzw, r2
mov oPos, r1
mov oT2.zw, r1
mad oT0.xy, v3, c29, c29.zwzw
mad oT1.xy, v4, c28, c28.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 256
Float 128 [_EdgeFlutterPrimary]
Float 132 [_EdgeFlutterController]
Float 136 [_EdgeFlutterFreqScalePrimary]
Float 140 [_EdgeFlutterFreqScaleController]
Vector 144 [_WindPrimary]
Vector 160 [_WindController]
Float 176 [_LerpToController]
Float 180 [_BendingFactor]
Vector 192 [_RadialWindOrigin]
Float 208 [_RadialWindForce]
Float 212 [_RadialWindFallof]
Float 216 [_RadialWindFreqMultiplier]
Vector 224 [unity_LightmapST]
Vector 240 [_MainTex_ST]
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
eefiecedaamoagmcjdkkifoccfgkkgongkkikbfkabaaaaaabebgaaaaaeaaaaaa
daaaaaaaoiahaaaamebeaaaaimbfaaaaebgpgodjlaahaaaalaahaaaaaaacpopp
eaahaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaiaa
aiaaabaaaaaaaaaaabaaaaaaabaaajaaaaaaaaaaabaaafaaabaaakaaaaaaaaaa
acaaaaaaaeaaalaaaaaaaaaaacaaamaaahaaapaaaaaaaaaaacaabeaaabaabgaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpfbaaaaafbiaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
bjaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafbkaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaaiaaoekaaiaaookaaeaaaaae
aaaaamoaaeaabejaahaabekaahaalekaafaaaaadaaaaapiaaaaaffjabaaaoeka
aeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaabaaaaac
abaaaiiabgaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaad
aaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaia
abaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaia
alaaaaadabaaabiaabaaaaiabhaaffkaakaaaaadabaaabiaabaaaaiabhaaaaka
acaaaaadabaaabiaabaaaaibbhaaaakaafaaaaadabaaaciaabaaaaiaagaaaaka
abaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkia
abaaaaacadaaabiaapaaaakaacaaaaadabaaaeiaadaaaaiabaaaaakaacaaaaad
abaaaeiaabaakkiabbaaaakaacaaaaadabaaaeiaabaakkiabcaaaakaaeaaaaae
abaaaciaajaaffkaabaaffiaabaakkiaabaaaaacadaaabiaapaappkaabaaaaac
adaaaciabaaappkaabaaaaacadaaaeiabbaappkaaiaaaaadadaaaeiaadaaoeia
bhaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoeja
abaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaajaaffka
acaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapia
adaaoeiabiaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
bhaakkkabhaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
bjaaaakabjaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeia
biaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabhaakkka
bhaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabjaaaaka
bjaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeia
aeaaaaaeadaaapiaadaaoeiabjaaaakbbjaakkkaafaaaaadadaaapiaadaaoeia
afaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiabhaaaaka
afaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffia
beaaoekaaeaaaaaeadaaahiabdaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahia
bfaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkia
adaajaiaacaaaaadabaaabiaafaappjbbhaaaakaafaaaaadabaaabiaabaaaaia
aeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaia
bjaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfia
afaaaaadafaaaciaabaaaaiabkaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaia
aaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaia
aaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaia
abaaaaiaafaaaaadabaaaoiaabaaoeiabgaappkaaeaaaaaeaaaaahiaaaaapjia
aaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aeaaoeiabjaaaakbbjaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahia
adaaffiabeaaoekaaeaaaaaeadaaaliabdaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiabfaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeia
afaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiabgaappka
afaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappka
aeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeia
aaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaad
aaaaahiaacaaoeiaaaaaoejaafaaaaadabaaapiaaaaaffiaamaaoekaaeaaaaae
abaaapiaalaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaabia
aaaaffiaakaaaakaafaaaaadabaaaiiaabaaaaiabhaappkbafaaaaadabaaafia
aaaapeiabhaappkbacaaaaadabaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoa
aaaaoeiappppaaaafdeieefcneamaaaaeaaaabaadfadaaaafjaaaaaeegiocaaa
aaaaaaaabaaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadfcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadicbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacagaaaaaa
aaaaaaajbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaaakiacaaaacaaaaaa
anaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaacaaaaaa
aoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaacaaaaaa
apaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaam
pcaabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegiocaia
ebaaaaaaaaaaaaaaamaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaabaaaaaa
egaobaaaabaaaaaaaocaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaa
aaaaaaaaanaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaiccaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiecaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaanaaaaaadcaaaaalecaabaaa
aaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaanaaaaaackiacaaaaaaaaaaa
aiaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaacaaaaaadkiacaaaacaaaaaaaoaaaaaabaaaaaakecaabaaaacaaaaaa
egacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaai
mcaabaaaaaaaaaaakgakbaaaacaaaaaaagiecaaaaaaaaaaaaiaaaaaabaaaaaah
ccaabaaaacaaaaaaegbcbaaaaaaaaaaakgakbaaaaaaaaaaabaaaaaahbcaabaaa
acaaaaaaegbcbaaaaaaaaaaapgapbaaaaaaaaaaadcaaaaalpcaabaaaadaaaaaa
fgifcaaaabaaaaaaaaaaaaaapgipcaaaaaaaaaaaaiaaaaaaagakbaaaacaaaaaa
aaaaaaahpcaabaaaacaaaaaaagaabaaaaaaaaaaafgakbaaaacaaaaaadiaaaaak
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaamnmmpmdp
amaceldpaaaamadomlkbefdobkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaa
dcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaaf
pcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialp
aaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaaeaaaaaaegaobaiaibaaaaaa
acaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaia
mbaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaaeaaaaaaaaaaaaahncaabaaaaaaaaaaafgahbaaaacaaaaaa
agacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaai
pcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaanaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaa
kgakbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaabaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaai
icaabaaaabaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaai
icaabaaaabaaaaaadkaabaaaabaaaaaabkiacaaaaaaaaaaaalaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaalpcaabaaa
aeaaaaaaagifcaaaaaaaaaaaaiaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdn
mnmmmmdndiaaaaahpcaabaaaaeaaaaaacgahbaaaaeaaaaaaagbkbaaaacaaaaaa
dgaaaaaffcaabaaaafaaaaaafgahbaaaaeaaaaaadiaaaaahccaabaaaafaaaaaa
dkaabaaaabaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagaobaaa
aaaaaaaaagajbaaaafaaaaaaagajbaaaabaaaaaadgaaaaafccaabaaaaeaaaaaa
bkaabaaaafaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaa
beaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaadkaabaaa
abaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
bkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaa
adaaaaaaegaobaiaibaaaaaaadaaaaaadcaaaabapcaabaaaadaaaaaaegaobaia
mbaaaaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaabaaaaaangafbaaaacaaaaaa
igaabaaaacaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaakaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaaaaaaaaaakaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaaaaaaaaaakaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaah
hcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaaiicaabaaa
aaaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagiacaaaaaaaaaaaalaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaapaaaaaaogikcaaaaaaaaaaaapaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaoaaaaaakgiocaaa
aaaaaaaaaoaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Float 30 [_EdgeFlutterPrimary]
Float 31 [_EdgeFlutterController]
Float 32 [_EdgeFlutterFreqScalePrimary]
Float 33 [_EdgeFlutterFreqScaleController]
Vector 34 [_WindPrimary]
Vector 35 [_WindController]
Float 36 [_LerpToController]
Float 37 [_BendingFactor]
Vector 38 [_RadialWindOrigin]
Float 39 [_RadialWindForce]
Float 40 [_RadialWindFallof]
Float 41 [_RadialWindFreqMultiplier]
Vector 42 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[45] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..42],
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
MOV R7.y, R6.w;
MOV R7.w, c[0].x;
RCP R1.y, c[40].x;
MUL R5.zw, vertex.normal.xyxz, c[30].x;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[29].w;
ADD R0, R0, -c[38];
DP4 R0.w, R0, R0;
RSQ R0.w, R0.w;
RCP R1.x, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.x, R1, R1;
MUL R1.x, R1, R1.y;
MIN R1.x, R1, c[0];
MAX R1.x, R1, c[44].z;
ADD R3.y, -R1.x, c[0].x;
MUL R1.x, R3.y, c[39];
MUL R1.y, R1.x, c[41].x;
MOV R1.x, c[0];
MOV R0.w, c[0].x;
MUL R0, R0, c[39].x;
DP3 R3.x, R1.x, c[8];
DP4 R1.z, R1.x, c[5];
ADD R1.y, R1, c[32].x;
MAD R1.z, R1.y, c[13].y, R1;
ADD R1.x, R3, c[30];
MOV R1.y, R3.x;
DP3 R1.x, vertex.position, R1.x;
ADD R1.xy, R1.z, R1;
MUL R1, R1.xxyy, c[43];
FRC R1, R1;
MAD R1, R1, c[0].y, c[0].z;
FRC R1, R1;
MAD R1, R1, c[0].y, -c[0].x;
ABS R2, R1;
MAD R1, -R2, c[0].y, c[0].w;
MUL R2, R2, R2;
MUL R1, R2, R1;
ADD R5.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R0, R0.w;
ADD R0.x, R3, c[31];
MOV R0.y, R3.x;
MAD R3.xyz, R3.y, R1, c[34];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.z, c[33].x;
DP3 R0.x, vertex.position, R0.x;
MAD R0.xy, R0.z, c[13].y, R0;
MUL R0, R0.xxyy, c[43];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R1, R0;
ADD R0.w, -vertex.color, c[0].x;
MAD R1, R1, c[0].y, -c[0].x;
MUL R2.w, R0, c[37].x;
MUL R0.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R0;
ABS R1, R1;
MUL R0, R1, R1;
MAD R1, -R1, c[0].y, c[0].w;
MUL R0, R0, R1;
MUL R1.xz, R5.zyww, c[44].y;
MUL R1.y, R2.w, c[44].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[35];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[34], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[29].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[31].x;
MUL R4.xz, R4.xyyw, c[44].y;
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R3.xyz, R0, c[29].w;
MUL R0.x, R2.w, c[35].w;
MAD R0.xyz, R1, R0.x, R3;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[36].x, R2;
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
MAX R0, R0, c[44].z;
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
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[42], c[42].zwzw;
END
# 150 instructions, 8 R-regs
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
Float 29 [_EdgeFlutterPrimary]
Float 30 [_EdgeFlutterController]
Float 31 [_EdgeFlutterFreqScalePrimary]
Float 32 [_EdgeFlutterFreqScaleController]
Vector 33 [_WindPrimary]
Vector 34 [_WindController]
Float 35 [_LerpToController]
Float 36 [_BendingFactor]
Vector 37 [_RadialWindOrigin]
Float 38 [_RadialWindForce]
Float 39 [_RadialWindFallof]
Float 40 [_RadialWindFreqMultiplier]
Vector 41 [_MainTex_ST]
"vs_2_0
def c42, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c43, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c44, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c45, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r6.xyz, v2, c28.w
dp3 r6.w, r6, c5
dp3 r7.x, r6, c4
mov r2.xyz, c7
dp3 r3.y, c42.x, r2
mov r7.y, r6.w
mul r5.zw, v2.xyxz, c29.x
mov r7.w, c42.x
rcp r1.x, c39.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c28.w
add r0, r0, -c37
dp4 r0.w, r0, r0
rsq r3.x, r0.w
rcp r0.w, r3.x
mul r0.w, r0, r0
mul r0.w, r0, r1.x
min r0.w, r0, c42.x
max r0.w, r0, c45.x
add r0.w, -r0, c42.x
mul r1.x, r0.w, c38
mul r1.x, r1, c40
add r2.w, r1.x, c31.x
mov r1, c4
dp4 r1.x, c42.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c29
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c43
frc r1, r1
mad r1, r1, c42.y, c42.z
frc r1, r1
mad r1, r1, c42.y, c42.w
abs r2, r1
mad r1, -r2, c44.x, c44.y
mul r2, r2, r2
mul r1, r2, r1
add r5.xy, r1.xzzw, r1.ywzw
mul r1.xyz, r3.x, r0
add r0.x, r3.y, c30
mov r1.w, c42.x
mul r1, r1, c38.x
mul r1.xyz, r1, r1.w
mov r0.y, r3
mad r3.xyz, r0.w, r1, c33
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mov r0.z, c12.y
dp3 r0.x, v0, r0.x
mad r0.xy, c32.x, r0.z, r0
mul r0, r0.xxyy, c43
frc r0, r0
mad r0, r0, c42.y, c42.z
frc r1, r0
add r0.w, -v5, c42.x
mad r1, r1, c42.y, c42.w
mul r2.w, r0, c36.x
mul r0.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r0
abs r1, r1
mul r0, r1, r1
mad r1, -r1, c44.x, c44.y
mul r0, r0, r1
mul r1.xz, r5.zyww, c44.w
mul r1.y, r2.w, c44.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c34, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c33, r0
dp3 r5.x, c34, r3
dp3 r5.y, c34, r0
mul r0.xyz, r1.w, r5
mul r3.xyz, r2.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c28.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c30.x
mul r4.xz, r4.xyyw, c44.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mov r1.w, v0
mul r1.xyz, r3, c28.w
mul r0.w, r2, c34
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c35.x, r2
add r1.xyz, v0, r0
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
add r2, r5, c42.x
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c45.x
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
mov oT1.z, r3.x
mov oT1.y, r6.w
mov oT1.x, r7
mad oT0.xy, v3, c41, c41.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 176
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
Vector 160 [_MainTex_ST]
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
eefiecedpgacjobajoampmgjciikkhdjchjobjneabaaaaaahmbnaaaaaeaaaaaa
daaaaaaajiakaaaacmbmaaaapebmaaaaebgpgodjgaakaaaagaakaaaaaaacpopp
oeajaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
ahaaabaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaaacaaacaaaiaaajaaaaaaaaaa
acaacgaaahaabbaaaaaaaaaaadaaaaaaaeaabiaaaaaaaaaaadaaamaaahaabmaa
aaaaaaaaadaabeaaabaacdaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafceaaapka
mnmmpmdpamaceldpaaaamadomlkbefdofbaaaaafcfaaapkaaaaaaaeaaaaaialp
aaaaeaeamnmmmmdnfbaaaaafcgaaapkajkjjjjdoaaaaaaaaaaaaaaaaaaaaaaaa
fbaaaaafchaaapkaaaaaiadpaaaaaaaaaaaaaaeaaaaaaalpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoekaahaaookaafaaaaad
aaaaapiaaaaaffjabnaaoekaaeaaaaaeaaaaapiabmaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaboaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabpaaoeka
aaaappjaaaaaoeiaabaaaaacabaaaiiacdaappkaaeaaaaaeaaaaapiaaaaaoeia
abaappiaafaaoekbajaaaaadaaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiia
aaaappiaagaaaaacabaaabiaaaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeia
afaaaaadabaaabiaabaaaaiaabaaaaiaagaaaaacabaaaciaagaaffkaafaaaaad
abaaabiaabaaffiaabaaaaiaalaaaaadabaaabiaabaaaaiachaaffkaakaaaaad
abaaabiaabaaaaiachaaaakaacaaaaadabaaabiaabaaaaibchaaaakaafaaaaad
abaaaciaabaaaaiaagaaaakaabaaaaacacaaapiaabaaoekaaeaaaaaeabaaacia
abaaffiaagaakkkaacaakkiaabaaaaacadaaabiabmaaaakaacaaaaadabaaaeia
adaaaaiabnaaaakaacaaaaadabaaaeiaabaakkiaboaaaakaacaaaaadabaaaeia
abaakkiabpaaaakaaeaaaaaeabaaaciaaiaaffkaabaaffiaabaakkiaabaaaaac
adaaabiabmaappkaabaaaaacadaaaciabnaappkaabaaaaacadaaaeiaboaappka
aiaaaaadadaaaeiaadaaoeiachaaaakaacaaaaadabaaamiaadaakkiaabaaeeka
aiaaaaadadaaaciaaaaaoejaabaakkiaaiaaaaadadaaabiaaaaaoejaabaappia
aeaaaaaeaeaaapiaaiaaffkaacaappiaadaakaiaacaaaaadadaaapiaabaaffia
adaakfiaafaaaaadadaaapiaadaaoeiaceaaoekabdaaaaacadaaapiaadaaoeia
aeaaaaaeadaaapiaadaaoeiachaakkkachaappkabdaaaaacadaaapiaadaaoeia
aeaaaaaeadaaapiaadaaoeiacfaaaakacfaaffkacdaaaaacadaaapiaadaaoeia
afaaaaadaeaaapiaaeaaoeiaceaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaae
aeaaapiaaeaaoeiachaakkkachaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaae
aeaaapiaaeaaoeiacfaaaakacfaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaad
afaaapiaadaaoeiaadaaoeiaaeaaaaaeadaaapiaadaaoeiacfaaaakbcfaakkka
afaaaaadadaaapiaadaaoeiaafaaoeiaacaaaaadabaaaoiaadaaheiaadaacaia
abaaaaacaaaaaiiachaaaakaafaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaad
aaaaahiaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoeka
afaaaaadadaaahiaaaaaffiacbaaoekaaeaaaaaeadaaahiacaaaoekaaaaaaaia
adaaoeiaaeaaaaaeadaaahiaccaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
afaaaaadaaaaaoiaabaakkiaadaajaiaacaaaaadabaaabiaafaappjbchaaaaka
afaaaaadabaaabiaabaaaaiaaeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaia
afaaaaadacaaapiaacaafaiacfaappkaafaaaaadacaaapiaacaahciaacaakaja
abaaaaacafaaafiaacaapfiaafaaaaadafaaaciaabaaaaiacgaaaakaaeaaaaae
aaaaaoiaabaaoeiaafaajaiaaaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaae
aaaaabiaacaappkaabaaaaiaaaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaia
afaaaaadabaaaoiaadaajaiaabaaaaiaafaaaaadabaaaoiaabaaoeiacdaappka
aeaaaaaeaaaaahiaaaaapjiaaaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeia
aeaaoeiaaeaaaaaeaeaaapiaaeaaoeiacfaaaakbcfaakkkaafaaaaadadaaapia
adaaoeiaaeaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacadaaahia
adaaoekaafaaaaadaeaaahiaadaaffiacbaaoekaaeaaaaaeadaaaliacaaakeka
adaaaaiaaeaakeiaaeaaaaaeadaaahiaccaaoekaadaakkiaadaapeiaafaaaaad
aeaaahiaabaakkiaadaaoeiaafaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaad
adaaahiaadaaoeiacdaappkaafaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaad
aaaaaiiaabaaaaiaadaappkaaeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeia
aeaaaaaeabaaahiaabaaoeiaaaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaaka
abaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeiaaaaaoejaafaaaaadabaaahia
aaaaffiabnaaoekaaeaaaaaeabaaahiabmaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaahiaboaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiabpaaoekaaaaappja
abaaoeiaacaaaaadacaaapiaabaaffibakaaoekaafaaaaadadaaapiaacaaoeia
acaaoeiaacaaaaadaeaaapiaabaaaaibajaaoekaacaaaaadabaaapiaabaakkib
alaaoekaaeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeiaaeaaaaaeadaaapia
abaaoeiaabaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaiaahaaaaacafaaacia
adaaffiaahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiiaadaappiaabaaaaac
agaaabiachaaaakaaeaaaaaeadaaapiaadaaoeiaamaaoekaagaaaaiaafaaaaad
agaaahiaacaaoejacdaappkaafaaaaadahaaahiaagaaffiabnaaoekaaeaaaaae
agaaaliabmaakekaagaaaaiaahaakeiaaeaaaaaeagaaahiaboaaoekaagaakkia
agaapeiaafaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaaeacaaapiaaeaaoeia
agaaaaiaacaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkiaacaaoeiaafaaaaad
abaaapiaafaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeiachaaffkaagaaaaac
acaaabiaadaaaaiaagaaaaacacaaaciaadaaffiaagaaaaacacaaaeiaadaakkia
agaaaaacacaaaiiaadaappiaafaaaaadabaaapiaabaaoeiaacaaoeiaafaaaaad
acaaahiaabaaffiaaoaaoekaaeaaaaaeacaaahiaanaaoekaabaaaaiaacaaoeia
aeaaaaaeabaaahiaapaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahiabaaaoeka
abaappiaabaaoeiaabaaaaacagaaaiiachaaaakaajaaaaadacaaabiabbaaoeka
agaaoeiaajaaaaadacaaaciabcaaoekaagaaoeiaajaaaaadacaaaeiabdaaoeka
agaaoeiaafaaaaadadaaapiaagaacjiaagaakeiaajaaaaadaeaaabiabeaaoeka
adaaoeiaajaaaaadaeaaaciabfaaoekaadaaoeiaajaaaaadaeaaaeiabgaaoeka
adaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaaiiaagaaffia
agaaffiaaeaaaaaeaaaaaiiaagaaaaiaagaaaaiaaaaappibabaaaaacabaaahoa
agaaoeiaaeaaaaaeacaaahiabhaaoekaaaaappiaacaaoeiaacaaaaadacaaahoa
abaaoeiaacaaoeiaafaaaaadabaaapiaaaaaffiabjaaoekaaeaaaaaeabaaapia
biaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabkaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiablaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcimbbaaaa
eaaaabaagdaeaaaafjaaaaaeegiocaaaaaaaaaaaalaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagiaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaa
akiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaaipcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaaaiaaaaaa
bbaaaaahccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaaocaaaai
ecaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaa
aaaaaaaaegacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaajaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckiacaaaaaaaaaaaajaaaaaackiacaaaaaaaaaaaaeaaaaaadcaaaaakbcaabaaa
aaaaaaaabkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaa
dgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaa
acaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaa
adaaaaaaaoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaakgakbaaa
acaaaaaaagiecaaaaaaaaaaaaeaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaa
aaaaaaaakgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaaaaaaaaa
pgapbaaaaaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaaaaaaaaaa
pgipcaaaaaaaaaaaaeaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaaacaaaaaa
agaabaaaaaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaakpcaabaaa
adaaaaaaegaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdo
bkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaaegaobaaa
adaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialp
diaaaaajpcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaa
acaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaa
aaaaaaahncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaadgaaaaaf
icaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaaegaobaaa
abaaaaaaagiacaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
elaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaadkbabaia
ebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaa
abaaaaaabkiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaaaaaaaaaa
aeaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaahpcaabaaa
aeaaaaaacgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaaafaaaaaa
fgahbaaaaeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaaabeaaaaa
jkjjjjdodcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaafaaaaaa
agajbaaaabaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaakccaabaaa
aaaaaaaadkiacaaaaaaaaaaaafaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaiaibaaaaaa
adaaaaaadcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaea
aaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaaaaaaaaaagaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaaaaaaaaa
agaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaa
adaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaa
pgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkiacaaaaaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaa
abaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
agiacaaaaaaaaaaaahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaacaaaaaaegacbaaaabaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajpcaabaaaadaaaaaaagaabaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaa
aaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaah
pcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaadaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Float 31 [_EdgeFlutterPrimary]
Float 32 [_EdgeFlutterController]
Float 33 [_EdgeFlutterFreqScalePrimary]
Float 34 [_EdgeFlutterFreqScaleController]
Vector 35 [_WindPrimary]
Vector 36 [_WindController]
Float 37 [_LerpToController]
Float 38 [_BendingFactor]
Vector 39 [_RadialWindOrigin]
Float 40 [_RadialWindForce]
Float 41 [_RadialWindFallof]
Float 42 [_RadialWindFreqMultiplier]
Vector 43 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[46] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..43],
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
MOV R7.y, R6.w;
MOV R7.w, c[0].x;
RCP R1.y, c[41].x;
MUL R5.zw, vertex.normal.xyxz, c[31].x;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[30].w;
ADD R0, R0, -c[39];
DP4 R0.w, R0, R0;
RSQ R0.w, R0.w;
RCP R1.x, R0.w;
MUL R0.xyz, R0.w, R0;
MUL R1.x, R1, R1;
MUL R1.x, R1, R1.y;
MIN R1.x, R1, c[0];
MAX R1.x, R1, c[45].z;
ADD R3.y, -R1.x, c[0].x;
MUL R1.x, R3.y, c[40];
MUL R1.y, R1.x, c[42].x;
MOV R1.x, c[0];
MOV R0.w, c[0].x;
MUL R0, R0, c[40].x;
DP3 R3.x, R1.x, c[8];
DP4 R1.z, R1.x, c[5];
ADD R1.y, R1, c[33].x;
MAD R1.z, R1.y, c[13].y, R1;
ADD R1.x, R3, c[31];
MOV R1.y, R3.x;
DP3 R1.x, vertex.position, R1.x;
ADD R1.xy, R1.z, R1;
MUL R1, R1.xxyy, c[44];
FRC R1, R1;
MAD R1, R1, c[0].y, c[0].z;
FRC R1, R1;
MAD R1, R1, c[0].y, -c[0].x;
ABS R2, R1;
MAD R1, -R2, c[0].y, c[0].w;
MUL R2, R2, R2;
MUL R1, R2, R1;
ADD R5.xy, R1.xzzw, R1.ywzw;
MUL R1.xyz, R0, R0.w;
ADD R0.x, R3, c[32];
MOV R0.y, R3.x;
MAD R3.xyz, R3.y, R1, c[35];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.z, c[34].x;
DP3 R0.x, vertex.position, R0.x;
MAD R0.xy, R0.z, c[13].y, R0;
MUL R0, R0.xxyy, c[44];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R1, R0;
ADD R0.w, -vertex.color, c[0].x;
MAD R1, R1, c[0].y, -c[0].x;
MUL R2.w, R0, c[38].x;
MUL R0.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R0;
ABS R1, R1;
MUL R0, R1, R1;
MAD R1, -R1, c[0].y, c[0].w;
MUL R0, R0, R1;
MUL R1.xz, R5.zyww, c[45].y;
MUL R1.y, R2.w, c[45].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[36];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[35], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[30].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[32].x;
MUL R4.xz, R4.xyyw, c[45].y;
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R3.xyz, R0, c[30].w;
MUL R0.x, R2.w, c[36].w;
MAD R0.xyz, R1, R0.x, R3;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[37].x, R2;
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
MAX R0, R0, c[45].z;
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
MUL R3.xyz, R2.xyww, c[45].w;
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
MOV result.texcoord[1].z, R3.w;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[43], c[43].zwzw;
END
# 156 instructions, 8 R-regs
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
Float 31 [_EdgeFlutterPrimary]
Float 32 [_EdgeFlutterController]
Float 33 [_EdgeFlutterFreqScalePrimary]
Float 34 [_EdgeFlutterFreqScaleController]
Vector 35 [_WindPrimary]
Vector 36 [_WindController]
Float 37 [_LerpToController]
Float 38 [_BendingFactor]
Vector 39 [_RadialWindOrigin]
Float 40 [_RadialWindForce]
Float 41 [_RadialWindFallof]
Float 42 [_RadialWindFreqMultiplier]
Vector 43 [_MainTex_ST]
"vs_2_0
def c44, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c45, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c46, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c47, 0.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r6.xyz, v2, c30.w
dp3 r6.w, r6, c5
dp3 r7.x, r6, c4
mov r2.xyz, c7
dp3 r3.y, c44.x, r2
mov r7.y, r6.w
mul r5.zw, v2.xyxz, c31.x
mov r7.w, c44.x
rcp r1.x, c41.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c30.w
add r0, r0, -c39
dp4 r0.w, r0, r0
rsq r3.x, r0.w
rcp r0.w, r3.x
mul r0.w, r0, r0
mul r0.w, r0, r1.x
min r0.w, r0, c44.x
max r0.w, r0, c47.x
add r0.w, -r0, c44.x
mul r1.x, r0.w, c40
mul r1.x, r1, c42
add r2.w, r1.x, c33.x
mov r1, c4
dp4 r1.x, c44.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c31
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c45
frc r1, r1
mad r1, r1, c44.y, c44.z
frc r1, r1
mad r1, r1, c44.y, c44.w
abs r2, r1
mad r1, -r2, c46.x, c46.y
mul r2, r2, r2
mul r1, r2, r1
add r5.xy, r1.xzzw, r1.ywzw
mul r1.xyz, r3.x, r0
add r0.x, r3.y, c32
mov r1.w, c44.x
mul r1, r1, c40.x
mul r1.xyz, r1, r1.w
mov r0.y, r3
mad r3.xyz, r0.w, r1, c35
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mov r0.z, c12.y
dp3 r0.x, v0, r0.x
mad r0.xy, c34.x, r0.z, r0
mul r0, r0.xxyy, c45
frc r0, r0
mad r0, r0, c44.y, c44.z
frc r1, r0
add r0.w, -v5, c44.x
mad r1, r1, c44.y, c44.w
mul r2.w, r0, c38.x
mul r0.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r0
abs r1, r1
mul r0, r1, r1
mad r1, -r1, c46.x, c46.y
mul r0, r0, r1
mul r1.xz, r5.zyww, c46.w
mul r1.y, r2.w, c46.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c36, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c35, r0
dp3 r5.x, c36, r3
dp3 r5.y, c36, r0
mul r0.xyz, r1.w, r5
mul r3.xyz, r2.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c30.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c32.x
mul r4.xz, r4.xyyw, c46.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mov r1.w, v0
mul r1.xyz, r3, c30.w
mul r0.w, r2, c36
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c37.x, r2
add r1.xyz, v0, r0
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
add r2, r5, c44.x
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c47.x
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
mul r3.xyz, r2.xyww, c47.y
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
mov oT1.z, r3.w
mov oT1.y, r6.w
mov oT1.x, r7
mad oT0.xy, v3, c43, c43.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 240
Float 128 [_EdgeFlutterPrimary]
Float 132 [_EdgeFlutterController]
Float 136 [_EdgeFlutterFreqScalePrimary]
Float 140 [_EdgeFlutterFreqScaleController]
Vector 144 [_WindPrimary]
Vector 160 [_WindController]
Float 176 [_LerpToController]
Float 180 [_BendingFactor]
Vector 192 [_RadialWindOrigin]
Float 208 [_RadialWindForce]
Float 212 [_RadialWindFallof]
Float 216 [_RadialWindFreqMultiplier]
Vector 224 [_MainTex_ST]
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
eefiecedfflkoipcldedaclaobmofnondbbkhnfnabaaaaaakaboaaaaaeaaaaaa
daaaaaaapaakaaaadibnaaaaaaboaaaaebgpgodjliakaaaaliakaaaaaaacpopp
daakaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaaiaa
ahaaabaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaaabaaafaaabaaajaaaaaaaaaa
acaaacaaaiaaakaaaaaaaaaaacaacgaaahaabcaaaaaaaaaaadaaaaaaaeaabjaa
aaaaaaaaadaaamaaahaabnaaaaaaaaaaadaabeaaabaaceaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafcfaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
cgaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafchaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaafbaaaaafciaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
ahaaoekaahaaookaafaaaaadaaaaapiaaaaaffjaboaaoekaaeaaaaaeaaaaapia
bnaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabpaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiacaaaoekaaaaappjaaaaaoeiaabaaaaacabaaaiiaceaappka
aeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaadaaaaaiiaaaaaoeia
aaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabiaaaaappiaafaaaaad
aaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaiaabaaaaiaagaaaaac
abaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaiaalaaaaadabaaabia
abaaaaiaciaaffkaakaaaaadabaaabiaabaaaaiaciaaaakaacaaaaadabaaabia
abaaaaibciaaaakaafaaaaadabaaaciaabaaaaiaagaaaakaabaaaaacacaaapia
abaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkiaabaaaaacadaaabia
bnaaaakaacaaaaadabaaaeiaadaaaaiaboaaaakaacaaaaadabaaaeiaabaakkia
bpaaaakaacaaaaadabaaaeiaabaakkiacaaaaakaaeaaaaaeabaaaciaaiaaffka
abaaffiaabaakkiaabaaaaacadaaabiabnaappkaabaaaaacadaaaciaboaappka
abaaaaacadaaaeiabpaappkaaiaaaaadadaaaeiaadaaoeiaciaaaakaacaaaaad
abaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoejaabaakkiaaiaaaaad
adaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaaiaaffkaacaappiaadaakaia
acaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapiaadaaoeiacfaaoeka
bdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiaciaakkkaciaappka
bdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeiacgaaaakacgaaffka
cdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeiacfaaoekabdaaaaac
aeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiaciaakkkaciaappkabdaaaaac
aeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiacgaaaakacgaaffkacdaaaaac
aeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeiaaeaaaaaeadaaapia
adaaoeiacgaaaakbcgaakkkaafaaaaadadaaapiaadaaoeiaafaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiaciaaaakaafaaaaadaaaaapia
aaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeiaaeaaaaaeaaaaahia
aaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffiaccaaoekaaeaaaaae
adaaahiacbaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahiacdaaoekaaaaakkia
adaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaia
agaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkiaadaajaiaacaaaaad
abaaabiaafaappjbciaaaakaafaaaaadabaaabiaabaaaaiaaeaaffkaafaaaaad
aaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaiacgaappkaafaaaaad
acaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfiaafaaaaadafaaacia
abaaaaiachaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaiaaaaaoeiaabaaaaac
acaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaiaaaaaaaiaafaaaaad
aaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaiaabaaaaiaafaaaaad
abaaaoiaabaaoeiaceaappkaaeaaaaaeaaaaahiaaaaapjiaaaaaaaiaabaapjia
afaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiacgaaaakb
cgaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaadabaaaoiaadaaheia
adaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahiaadaaffiaccaaoeka
aeaaaaaeadaaaliacbaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahiacdaaoeka
adaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeiaafaaaaadadaaahia
abaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiaceaappkaafaaaaadaeaaahia
abaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappkaaeaaaaaeabaaahia
abaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeiaaaaappiaadaaoeia
bcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeia
aaaaoejaafaaaaadabaaahiaaaaaffiaboaaoekaaeaaaaaeabaaahiabnaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaahiabpaaoekaaaaakkiaabaaoeiaaeaaaaae
abaaahiacaaaoekaaaaappjaabaaoeiaacaaaaadacaaapiaabaaffibalaaoeka
afaaaaadadaaapiaacaaoeiaacaaoeiaacaaaaadaeaaapiaabaaaaibakaaoeka
acaaaaadabaaapiaabaakkibamaaoekaaeaaaaaeadaaapiaaeaaoeiaaeaaoeia
adaaoeiaaeaaaaaeadaaapiaabaaoeiaabaaoeiaadaaoeiaahaaaaacafaaabia
adaaaaiaahaaaaacafaaaciaadaaffiaahaaaaacafaaaeiaadaakkiaahaaaaac
afaaaiiaadaappiaabaaaaacagaaabiaciaaaakaaeaaaaaeadaaapiaadaaoeia
anaaoekaagaaaaiaafaaaaadagaaahiaacaaoejaceaappkaafaaaaadahaaahia
agaaffiaboaaoekaaeaaaaaeagaaaliabnaakekaagaaaaiaahaakeiaaeaaaaae
agaaahiabpaaoekaagaakkiaagaapeiaafaaaaadacaaapiaacaaoeiaagaaffia
aeaaaaaeacaaapiaaeaaoeiaagaaaaiaacaaoeiaaeaaaaaeabaaapiaabaaoeia
agaakkiaacaaoeiaafaaaaadabaaapiaafaaoeiaabaaoeiaalaaaaadabaaapia
abaaoeiaciaaffkaagaaaaacacaaabiaadaaaaiaagaaaaacacaaaciaadaaffia
agaaaaacacaaaeiaadaakkiaagaaaaacacaaaiiaadaappiaafaaaaadabaaapia
abaaoeiaacaaoeiaafaaaaadacaaahiaabaaffiaapaaoekaaeaaaaaeacaaahia
aoaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahiabaaaoekaabaakkiaacaaoeia
aeaaaaaeabaaahiabbaaoekaabaappiaabaaoeiaabaaaaacagaaaiiaciaaaaka
ajaaaaadacaaabiabcaaoekaagaaoeiaajaaaaadacaaaciabdaaoekaagaaoeia
ajaaaaadacaaaeiabeaaoekaagaaoeiaafaaaaadadaaapiaagaacjiaagaakeia
ajaaaaadaeaaabiabfaaoekaadaaoeiaajaaaaadaeaaaciabgaaoekaadaaoeia
ajaaaaadaeaaaeiabhaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeia
afaaaaadaaaaaiiaagaaffiaagaaffiaaeaaaaaeaaaaaiiaagaaaaiaagaaaaia
aaaappibabaaaaacabaaahoaagaaoeiaaeaaaaaeacaaahiabiaaoekaaaaappia
acaaoeiaacaaaaadacaaahoaabaaoeiaacaaoeiaafaaaaadabaaapiaaaaaffia
bkaaoekaaeaaaaaeabaaapiabjaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapia
blaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapiabmaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaajaaaakaafaaaaadabaaaiiaabaaaaiaciaappkb
afaaaaadabaaafiaaaaapeiaciaappkbacaaaaadadaaadoaabaakkiaabaaomia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacadaaamoaaaaaoeiappppaaaafdeieefceabcaaaaeaaaabaajaaeaaaa
fjaaaaaeegiocaaaaaaaaaaaapaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacahaaaaaaaaaaaaajbcaabaaa
aaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaai
pcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaa
egaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaa
amaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaa
aocaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaanaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaanaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaa
aaaaaaaackiacaaaaaaaaaaaanaaaaaackiacaaaaaaaaaaaaiaaaaaadcaaaaak
bcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaag
ccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaa
dkiacaaaadaaaaaaaoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaa
kgakbaaaacaaaaaaagiecaaaaaaaaaaaaiaaaaaabaaaaaahccaabaaaacaaaaaa
egbcbaaaaaaaaaaakgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaa
aaaaaaaapgapbaaaaaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaa
aaaaaaaapgipcaaaaaaaaaaaaiaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaa
acaaaaaaagaabaaaaaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaa
acaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaa
dcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaak
pcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldpaaaamado
mlkbefdobkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaa
adaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaa
egaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialp
aaaaialpdiaaaaajpcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaia
ibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
aeaaaaaaaaaaaaahncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaa
egaobaaaabaaaaaaagiacaaaaaaaaaaaanaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaadaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaa
dkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaa
dkaabaaaabaaaaaabkiacaaaaaaaaaaaalaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaa
aaaaaaaaaiaaaaaaaceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaah
pcaabaaaaeaaaaaacgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaa
afaaaaaafgahbaaaaeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaa
abeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaa
afaaaaaaagajbaaaabaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaak
ccaabaaaaaaaaaaadkiacaaaaaaaaaaaajaaaaaadkaabaaaabaaaaaabkaabaaa
aaaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaa
dcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaajpcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaia
ibaaaaaaadaaaaaadcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaea
aaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaa
diaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaaakaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
aaaaaaaaakaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaaaaaaaaaakaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaadaaaaaafgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaa
acaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaa
egacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaa
abaaaaaadkiacaaaaaaaaaaaakaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaagiacaaaaaaaaaaaalaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaoaaaaaaogikcaaaaaaaaaaaaoaaaaaadiaaaaaihcaabaaaacaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaa
acaaaaaadgaaaaafhccabaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaa
acaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaaacaaaaaa
egakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
afaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaaeaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajpcaabaaaaeaaaaaaagaabaiaebaaaaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaafaaaaaafgafbaiaebaaaaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaahpcaabaaaagaaaaaa
fgafbaaaacaaaaaaegaobaaaafaaaaaadiaaaaahpcaabaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaagaabaaaacaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaaaaaaaaakgakbaaaacaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaafaaaaaaeeaaaaaf
pcaabaaaaeaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaaeaaaaaadeaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaacaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaahhccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaak
fcaabaaaaaaaaaaaagadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaaaadgaaaaafmccabaaaaeaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaa
aeaaaaaakgakbaaaaaaaaaaamgaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
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
MUL R1.xyz, R0, fragment.texcoord[2];
DP3 R0.w, fragment.texcoord[1], c[0];
MUL R0.xyz, R0, c[1];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1;
MOV result.color.w, c[2].x;
END
# 8 instructions, 2 R-regs
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
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s0
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
ConstBuffer "$Globals" 176
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefieceddodfgldaffddmbbgdcjpafpilbanlfjhabaaaaaaiiadaaaaaeaaaaaa
daaaaaaafeabaaaammacaaaafeadaaaaebgpgodjbmabaaaabmabaaaaaaacpppp
nmaaaaaaeaaaaaaaacaaciaaaaaaeaaaaaaaeaaaabaaceaaaaaaeaaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaaf
acaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaja
aaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaaiaaaaadaaaaciiaabaaoela
abaaoekaalaaaaadabaaciiaaaaappiaacaaaakaacaaaaadaaaaciiaabaappia
abaappiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeia
acaaoelaaeaaaaaeaaaachiaabaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaciia
acaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefchaabaaaaeaaaaaaa
fmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaaibcaabaaa
aaaaaaaaegbcbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaa
agajbaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
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
TEX R0, fragment.texcoord[1], texture[1], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[0].y;
MOV result.color.w, c[0].x;
END
# 6 instructions, 2 R-regs
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
dcl t1.xy
texld r0, t1, s1
texld r1, t0, s0
mul_pp r0.xyz, r0.w, r0
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
eefiecededolfbllgbjafmkgnccmmnnjgopbpcniabaaaaaaoiacaaaaaeaaaaaa
daaaaaaabmabaaaaeeacaaaaleacaaaaebgpgodjoeaaaaaaoeaaaaaaaaacpppp
liaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaaaaaaaka
afaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaadaaaachiaaaaaoeiaabaaoeia
abaaaaacaaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
caabaaaaeaaaaaaaeiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
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
MUL R1.yzw, R0.xxyz, fragment.texcoord[2].xxyz;
DP3 R0.w, fragment.texcoord[1], c[0];
MAX R0.w, R0, c[2].y;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, R1.x;
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[2].z, R1.yzww;
MOV result.color.w, c[2].x;
END
# 10 instructions, 2 R-regs
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
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r1, t0, s0
texldp r3, t3, s1
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
ConstBuffer "$Globals" 240
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefieceddmaghbdaadkjedncjbehfjinelnbmnmoabaaaaaageaeaaaaaeaaaaaa
daaaaaaalaabaaaajaadaaaadaaeaaaaebgpgodjhiabaaaahiabaaaaaaacpppp
deabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaachlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
agaaaaacaaaaaiiaadaapplaafaaaaadaaaaadiaaaaappiaadaaoelaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioekaaiaaaaad
abaaciiaabaaoelaabaaoekaafaaaaadaaaacbiaaaaaaaiaabaappiafiaaaaae
abaaciiaabaappiaaaaaaaiaacaaaakaacaaaaadabaaciiaabaappiaabaappia
afaaaaadaaaachiaabaaoeiaaaaaoekaafaaaaadabaachiaabaaoeiaacaaoela
aeaaaaaeaaaachiaaaaaoeiaabaappiaabaaoeiaabaaaaacaaaaciiaacaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcniabaaaaeaaaaaaahgaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
lcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabaaaaaai
ccaabaaaaaaaaaaaegbcbaaaacaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaaagajbaaaabaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaadaaaaaadcaaaaajhccabaaaaaaaaaaa
jgahbaaaaaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
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
TXP R3.x, fragment.texcoord[2], texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R2.w, R2;
MUL R2.xyz, R2, R3.x;
MUL R1.xyz, R1, c[0].y;
MUL R3.xyz, R1, R3.x;
MUL R2.xyz, R2, c[0].z;
MIN R1.xyz, R1, R2;
MAX R1.xyz, R1, R3;
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[0].x;
END
# 12 instructions, 4 R-regs
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
dcl t1.xy
dcl t2
texldp r1, t2, s1
texld r2, t0, s0
texld r0, t1, s2
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1.x
mul_pp r3.xyz, r3, c0.x
mul_pp r0.xyz, r0, c0.y
mul_pp r1.xyz, r3, r1.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r1
mul_pp r0.xyz, r2, r0
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
eefiecedbijcbcjgkcjdidohhiaaaolflddoklfkabaaaaaaimaeaaaaaeaaaaaa
daaaaaaaleabaaaanaadaaaafiaeaaaaebgpgodjhmabaaaahmabaaaaaaacpppp
emabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaaebaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
agaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoelaabaaaaac
abaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
abaaoeiaacaioekaecaaaaadacaacpiaaaaaoelaabaioekaacaaaaadacaaciia
aaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaacaappiaafaaaaadabaaciia
abaappiaaaaaaakaafaaaaadabaachiaabaaoeiaabaappiaakaaaaadadaachia
aaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaiaabaaoeiaalaaaaadabaachia
adaaoeiaaaaaoeiaafaaaaadaaaachiaabaaoeiaacaaoeiaabaaaaacaaaaciia
aaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbeacaaaaeaaaaaaa
ifaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
acaaaaaapgbpbaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
abaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaah
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Cull Off
  Fog { Mode Off }
  ColorMask RGB
  Offset 1, 1
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [unity_LightShadowBias]
Vector 15 [unity_Scale]
Float 16 [_EdgeFlutterPrimary]
Float 17 [_EdgeFlutterController]
Float 18 [_EdgeFlutterFreqScalePrimary]
Float 19 [_EdgeFlutterFreqScaleController]
Vector 20 [_WindPrimary]
Vector 21 [_WindController]
Float 22 [_LerpToController]
Float 23 [_BendingFactor]
Vector 24 [_RadialWindOrigin]
Float 25 [_RadialWindForce]
Float 26 [_RadialWindFallof]
Float 27 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[30] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..27],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[15].w;
ADD R2, R0, -c[24];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[26].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[29].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[25];
MUL R0.y, R0.x, c[27].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[18].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[16];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[28];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[25].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[20];
ADD R1.x, R2.w, c[17];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[19].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[28];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[23].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
ABS R0, R0;
MUL R4.xyz, R2.w, R1;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[16].x;
MUL R1.xz, R5.zyww, c[29].y;
MUL R1.y, R2.w, c[29].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[21];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[20], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[15].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[17].x;
MUL R4.xz, R4.xyyw, c[29].y;
MUL R0.w, R2, c[21];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[15].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[22].x, R2;
MOV R0.w, vertex.position;
ADD R0.xyz, vertex.position, R0;
DP4 R1.y, R0, c[4];
DP4 R1.x, R0, c[3];
ADD R1.x, R1, c[14];
MAX R1.z, R1.x, -R1.y;
ADD R1.z, R1, -R1.x;
MAD result.position.z, R1, c[14].y, R1.x;
MOV result.position.w, R1.y;
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
END
# 102 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [unity_LightShadowBias]
Vector 14 [unity_Scale]
Float 15 [_EdgeFlutterPrimary]
Float 16 [_EdgeFlutterController]
Float 17 [_EdgeFlutterFreqScalePrimary]
Float 18 [_EdgeFlutterFreqScaleController]
Vector 19 [_WindPrimary]
Vector 20 [_WindController]
Float 21 [_LerpToController]
Float 22 [_BendingFactor]
Vector 23 [_RadialWindOrigin]
Float 24 [_RadialWindForce]
Float 25 [_RadialWindFallof]
Float 26 [_RadialWindFreqMultiplier]
"vs_2_0
def c27, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c28, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c29, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c30, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c7
dp3 r3.y, c27.x, r2
rcp r1.y, c25.x
mul r5.zw, v2.xyxz, c15.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c14.w
add r0, r0, -c23
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c27
max r1.x, r1, c30
add r3.x, -r1, c27
mul r1.x, r3, c24
mul r1.x, r1, c26
add r2.w, r1.x, c17.x
mov r1, c4
dp4 r1.x, c27.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c15
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c28
frc r1, r1
mad r1, r1, c27.y, c27.z
frc r1, r1
mad r1, r1, c27.y, c27.w
abs r1, r1
mad r2, -r1, c29.x, c29.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c27.x
mul r1, r0, c24.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c16.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c19
mov r0.w, c12.y
mad r1.xy, c18.x, r0.w, r1
mul r0, r1.xxyy, c28
add r1.w, -v5, c27.x
frc r0, r0
mad r0, r0, c27.y, c27.z
frc r0, r0
mad r0, r0, c27.y, c27.w
mul r2.w, r1, c22.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
abs r0, r0
mul r4.xyz, r2.w, r1
mul r1, r0, r0
mad r0, -r0, c29.x, c29.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c29.w
mul r1.y, r2.w, c29.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c20, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c19, r0
dp3 r5.y, c20, r0
dp3 r5.x, c20, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c14.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c16.x
mul r4.xz, r4.xyyw, c29.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mul r3.xyz, r2.w, r5
mul r1.xyz, r3, c14.w
mul r0.w, r2, c20
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c21.x, r2
mov r0.w, v0
add r0.xyz, v0, r0
dp4 r1.x, r0, c2
add r1.x, r1, c13
max r1.y, r1.x, c30.x
add r1.y, r1, -r1.x
mad r1.z, r1.y, c13.y, r1.x
dp4 r1.w, r0, c3
dp4 r1.x, r0, c0
dp4 r1.y, r0, c1
mov oPos, r1
mov oT0, r1
"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "$Globals" 160
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityShadows" 416
Vector 80 [unity_LightShadowBias]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefieceddhkbpokppfnekmjnfnnkclnmodfhpicdabaaaaaaaabfaaaaaeaaaaaa
daaaaaaakaahaaaaaebeaaaammbeaaaaebgpgodjgiahaaaagiahaaaaaaacpopp
piagaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
agaaabaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaacaaafaaabaaaiaaaaaaaaaa
adaaaaaaaeaaajaaaaaaaaaaadaaamaaahaaanaaaaaaaaaaadaabeaaabaabeaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkamnmmpmdpamaceldpaaaamado
mlkbefdofbaaaaafbgaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaaf
bhaaapkajkjjjjdoaaaaaaaaaaaaaaaaaaaaaaaafbaaaaafbiaaapkaaaaaiadp
aaaaaaaaaaaaaaeaaaaaaalpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaabaaaaac
abaaaiiabeaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaad
aaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaia
abaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaia
alaaaaadabaaabiaabaaaaiabiaaffkaakaaaaadabaaabiaabaaaaiabiaaaaka
acaaaaadabaaabiaabaaaaibbiaaaakaafaaaaadabaaaciaabaaaaiaagaaaaka
abaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkia
abaaaaacadaaabiaanaaaakaacaaaaadabaaaeiaadaaaaiaaoaaaakaacaaaaad
abaaaeiaabaakkiaapaaaakaacaaaaadabaaaeiaabaakkiabaaaaakaaeaaaaae
abaaaciaahaaffkaabaaffiaabaakkiaabaaaaacadaaabiaanaappkaabaaaaac
adaaaciaaoaappkaabaaaaacadaaaeiaapaappkaaiaaaaadadaaaeiaadaaoeia
biaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoeja
abaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaahaaffka
acaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapia
adaaoeiabfaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
biaakkkabiaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
bgaaaakabgaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeia
bfaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabiaakkka
biaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabgaaaaka
bgaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeia
aeaaaaaeadaaapiaadaaoeiabgaaaakbbgaakkkaafaaaaadadaaapiaadaaoeia
afaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiabiaaaaka
afaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffia
bcaaoekaaeaaaaaeadaaahiabbaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahia
bdaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkia
adaajaiaacaaaaadabaaabiaafaappjbbiaaaakaafaaaaadabaaabiaabaaaaia
aeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaia
bgaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfia
afaaaaadafaaaciaabaaaaiabhaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaia
aaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaia
aaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaia
abaaaaiaafaaaaadabaaaoiaabaaoeiabeaappkaaeaaaaaeaaaaahiaaaaapjia
aaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aeaaoeiabgaaaakbbgaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahia
adaaffiabcaaoekaaeaaaaaeadaaaliabbaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiabdaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeia
afaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiabeaappka
afaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappka
aeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeia
aaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaad
aaaaahiaacaaoeiaaaaaoejaafaaaaadabaaapiaaaaaffiaakaaoekaaeaaaaae
abaaapiaajaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaacaaaaadaaaaaeia
aaaakkiaaiaaaakaalaaaaadabaaabiaaaaakkiabiaaffkaacaaaaadabaaabia
aaaakkibabaaaaiaaeaaaaaeaaaaaemaaiaaffkaabaaaaiaaaaakkiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaaimaaaaappiappppaaaa
fdeieefcfmamaaaaeaaaabaabhadaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaagaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
fcbabaaaacaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagiaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaa
amaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaaaiaaaaaabbaaaaahccaabaaa
aaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaaocaaaaiecaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaa
ajaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaa
ajaaaaaackiacaaaaaaaaaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaa
abaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaa
acaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaa
adaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaa
baaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaakgakbaaaacaaaaaaagiecaaa
aaaaaaaaaeaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaaaaaaaaakgakbaaa
aaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaaaaaaaaapgapbaaaaaaaaaaa
dcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaaaaaaaaaapgipcaaaaaaaaaaa
aeaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaaacaaaaaaagaabaaaaaaaaaaa
fgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaa
acaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaa
egaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaakpcaabaaaadaaaaaaegaobaaa
adaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaa
adaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalp
aaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaap
pcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaa
aeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaaba
pcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaaaaaaaaahncaabaaa
aaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaa
aaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
ccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaa
egacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaadkbabaiaebaaaaaaafaaaaaa
abeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaabkiacaaa
aaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaaaaaaaaaaaeaaaaaaaceaaaaa
mnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaahpcaabaaaaeaaaaaacgahbaaa
aeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaaafaaaaaafgahbaaaaeaaaaaa
diaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaaabeaaaaajkjjjjdodcaaaaaj
ncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaafaaaaaaagajbaaaabaaaaaa
dgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaa
aaaaaaaaafaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
igadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaajpcaabaaa
acaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaiaibaaaaaaadaaaaaadcaaaaba
pcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaah
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
abaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaaaaaaaaaagaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaaaaaaaaaagaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
aaaaaaaaagaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaa
agaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaa
egacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaaaaaaaa
ahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
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
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaa
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
Bind "normal" Normal
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_LightPositionRange]
Vector 15 [unity_Scale]
Float 16 [_EdgeFlutterPrimary]
Float 17 [_EdgeFlutterController]
Float 18 [_EdgeFlutterFreqScalePrimary]
Float 19 [_EdgeFlutterFreqScaleController]
Vector 20 [_WindPrimary]
Vector 21 [_WindController]
Float 22 [_LerpToController]
Float 23 [_BendingFactor]
Vector 24 [_RadialWindOrigin]
Float 25 [_RadialWindForce]
Float 26 [_RadialWindFallof]
Float 27 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[30] = { { 1, 2, -0.5, 3 },
		state.matrix.mvp,
		program.local[5..27],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R0, R0, c[15].w;
ADD R2, R0, -c[24];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[26].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[29].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[25];
MUL R0.y, R0.x, c[27].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[8];
DP4 R0.z, R0.x, c[5];
ADD R0.y, R0, c[18].x;
MAD R0.z, R0.y, c[13].y, R0;
ADD R0.x, R2.w, c[16];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[28];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[25].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[20];
ADD R1.x, R2.w, c[17];
DP3 R2.z, R3, c[11];
DP3 R2.y, R3, c[10];
DP3 R2.x, R3, c[9];
MOV R0.w, c[19].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[13].y, R1;
MUL R0, R1.xxyy, c[28];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[23].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
ABS R0, R0;
MUL R4.xyz, R2.w, R1;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[16].x;
MUL R1.xz, R5.zyww, c[29].y;
MUL R1.y, R2.w, c[29].x;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[21];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[20], R0;
DP3 R0.z, R3, c[11];
DP3 R0.x, R3, c[9];
DP3 R0.y, R3, c[10];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[15].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[17].x;
MUL R4.xz, R4.xyyw, c[29].y;
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MAD R1.xyz, R1.zwzw, R4, R3;
MOV R1.w, vertex.position;
MUL R0.xyz, R0, c[15].w;
MUL R0.w, R2, c[21];
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[22].x, R2;
ADD R1.xyz, vertex.position, R0;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
ADD result.texcoord[0].xyz, R0, -c[14];
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
END
# 101 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_LightPositionRange]
Vector 14 [unity_Scale]
Float 15 [_EdgeFlutterPrimary]
Float 16 [_EdgeFlutterController]
Float 17 [_EdgeFlutterFreqScalePrimary]
Float 18 [_EdgeFlutterFreqScaleController]
Vector 19 [_WindPrimary]
Vector 20 [_WindController]
Float 21 [_LerpToController]
Float 22 [_BendingFactor]
Vector 23 [_RadialWindOrigin]
Float 24 [_RadialWindForce]
Float 25 [_RadialWindFallof]
Float 26 [_RadialWindFreqMultiplier]
"vs_2_0
def c27, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c28, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c29, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c30, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c7
dp3 r3.y, c27.x, r2
rcp r1.y, c25.x
mul r5.zw, v2.xyxz, c15.x
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r0, r0, c14.w
add r0, r0, -c23
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c27
max r1.x, r1, c30
add r3.x, -r1, c27
mul r1.x, r3, c24
mul r1.x, r1, c26
add r2.w, r1.x, c17.x
mov r1, c4
dp4 r1.x, c27.x, r1
mad r1.z, r2.w, c12.y, r1.x
add r1.x, r3.y, c15
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c28
frc r1, r1
mad r1, r1, c27.y, c27.z
frc r1, r1
mad r1, r1, c27.y, c27.w
abs r1, r1
mad r2, -r1, c29.x, c29.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c27.x
mul r1, r0, c24.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c16.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c19
mov r0.w, c12.y
mad r1.xy, c18.x, r0.w, r1
mul r0, r1.xxyy, c28
add r1.w, -v5, c27.x
frc r0, r0
mad r0, r0, c27.y, c27.z
frc r0, r0
mad r0, r0, c27.y, c27.w
mul r2.w, r1, c22.x
dp3 r2.z, r3, c10
dp3 r2.y, r3, c9
dp3 r2.x, r3, c8
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
abs r0, r0
mul r4.xyz, r2.w, r1
mul r1, r0, r0
mad r0, -r0, c29.x, c29.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c29.w
mul r1.y, r2.w, c29.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c10
dp3 r5.z, c20, r0
mov r3.xyz, c8
mov r0.xyz, c9
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c19, r0
dp3 r5.y, c20, r0
dp3 r5.x, c20, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c14.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c16.x
mul r4.xz, r4.xyyw, c29.w
mov r4.y, r1
mul r0.xyz, r2.w, r0
mad r0.xyz, r1.zwzw, r4, r0
mul r3.xyz, r2.w, r5
mov r1.w, v0
mul r1.xyz, r3, c14.w
mul r0.w, r2, c20
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c21.x, r2
add r1.xyz, v0, r0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
add oT0.xyz, r0, -c13
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
Bind "normal" Normal
ConstBuffer "$Globals" 160
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 16 [_LightPositionRange]
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
eefiecediailkkiabljihejjalblejhddejmnbmgabaaaaaagmbfaaaaaeaaaaaa
daaaaaaaliahaaaaembeaaaabebfaaaaebgpgodjiaahaaaaiaahaaaaaaacpopp
baahaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
agaaabaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaacaaabaaabaaaiaaaaaaaaaa
adaaaaaaaeaaajaaaaaaaaaaadaaamaaahaaanaaaaaaaaaaadaabeaaabaabeaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpfbaaaaafbgaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
bhaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafbiaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaapiaaaaaffjaaoaaoeka
aeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaabaaaaac
abaaaiiabeaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaad
aaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaia
abaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaia
alaaaaadabaaabiaabaaaaiabfaaffkaakaaaaadabaaabiaabaaaaiabfaaaaka
acaaaaadabaaabiaabaaaaibbfaaaakaafaaaaadabaaaciaabaaaaiaagaaaaka
abaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkia
abaaaaacadaaabiaanaaaakaacaaaaadabaaaeiaadaaaaiaaoaaaakaacaaaaad
abaaaeiaabaakkiaapaaaakaacaaaaadabaaaeiaabaakkiabaaaaakaaeaaaaae
abaaaciaahaaffkaabaaffiaabaakkiaabaaaaacadaaabiaanaappkaabaaaaac
adaaaciaaoaappkaabaaaaacadaaaeiaapaappkaaiaaaaadadaaaeiaadaaoeia
bfaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoeja
abaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaahaaffka
acaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapia
adaaoeiabgaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
bfaakkkabfaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
bhaaaakabhaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeia
bgaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabfaakkka
bfaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiabhaaaaka
bhaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeia
aeaaaaaeadaaapiaadaaoeiabhaaaakbbhaakkkaafaaaaadadaaapiaadaaoeia
afaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiabfaaaaka
afaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffia
bcaaoekaaeaaaaaeadaaahiabbaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahia
bdaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkia
adaajaiaacaaaaadabaaabiaafaappjbbfaaaakaafaaaaadabaaabiaabaaaaia
aeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaia
bhaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfia
afaaaaadafaaaciaabaaaaiabiaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaia
aaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaia
aaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaia
abaaaaiaafaaaaadabaaaoiaabaaoeiabeaappkaaeaaaaaeaaaaahiaaaaapjia
aaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aeaaoeiabhaaaakbbhaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahia
adaaffiabcaaoekaaeaaaaaeadaaaliabbaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiabdaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeia
afaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiabeaappka
afaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappka
aeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeia
aaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaad
aaaaahiaacaaoeiaaaaaoejaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaae
abaaahiaanaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiaapaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaahiabaaaoekaaaaappjaabaaoeiaacaaaaadaaaaahoa
abaaoeiaaiaaoekbafaaaaadabaaapiaaaaaffiaakaaoekaaeaaaaaeabaaapia
ajaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcimamaaaa
eaaaabaacdadaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaacaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadfcbabaaaacaaaaaa
fpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
hccabaaaabaaaaaagiaaaaacagaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaa
adaaaaaaamaaaaaaakiacaaaadaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaadaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaadaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegiocaiaebaaaaaaaaaaaaaaaiaaaaaabbaaaaah
ccaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaaocaaaaiecaabaaa
aaaaaaaabkaabaaaaaaaaaaabkiacaaaaaaaaaaaajaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaajaaaaaadcaaaaalecaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaa
aaaaaaaaajaaaaaackiacaaaaaaaaaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaa
bkiacaaaabaaaaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaag
bcaabaaaacaaaaaadkiacaaaadaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaa
dkiacaaaadaaaaaaanaaaaaadgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaa
aoaaaaaabaaaaaakecaabaaaacaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaaimcaabaaaaaaaaaaakgakbaaaacaaaaaa
agiecaaaaaaaaaaaaeaaaaaabaaaaaahccaabaaaacaaaaaaegbcbaaaaaaaaaaa
kgakbaaaaaaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaaaaaaaaapgapbaaa
aaaaaaaadcaaaaalpcaabaaaadaaaaaafgifcaaaabaaaaaaaaaaaaaapgipcaaa
aaaaaaaaaeaaaaaaagakbaaaacaaaaaaaaaaaaahpcaabaaaacaaaaaaagaabaaa
aaaaaaaafgakbaaaacaaaaaadiaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaa
egaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalp
aaaaaalpbkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaa
acaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaakpcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaamnmmpmdpamaceldpaaaamadomlkbefdobkaaaaaf
pcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaa
adaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalp
aaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaa
dcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaea
aaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialpaaaaialpaaaaialpdiaaaaaj
pcaabaaaaeaaaaaaegaobaiaibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaa
dcaaaabapcaabaaaacaaaaaaegaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaaeaaaaaaaaaaaaah
ncaabaaaaaaaaaaafgahbaaaacaaaaaaagacbaaaacaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaa
agiacaaaaaaaaaaaajaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaadkbabaiaebaaaaaa
afaaaaaaabeaaaaaaaaaiadpdiaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaa
bkiacaaaaaaaaaaaahaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaadiaaaaalpcaabaaaaeaaaaaaagifcaaaaaaaaaaaaeaaaaaa
aceaaaaamnmmmmdnmnmmmmdnmnmmmmdnmnmmmmdndiaaaaahpcaabaaaaeaaaaaa
cgahbaaaaeaaaaaaagbkbaaaacaaaaaadgaaaaaffcaabaaaafaaaaaafgahbaaa
aeaaaaaadiaaaaahccaabaaaafaaaaaadkaabaaaabaaaaaaabeaaaaajkjjjjdo
dcaaaaajncaabaaaaaaaaaaaagaobaaaaaaaaaaaagajbaaaafaaaaaaagajbaaa
abaaaaaadgaaaaafccaabaaaaeaaaaaabkaabaaaafaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaacaaaaaapgapbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaadcaaaaakccaabaaaaaaaaaaa
dkiacaaaaaaaaaaaafaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaadkaabaaaabaaaaaabkaabaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaigadbaaaaaaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaj
pcaabaaaacaaaaaaegaobaiaibaaaaaaadaaaaaaegaobaiaibaaaaaaadaaaaaa
dcaaaabapcaabaaaadaaaaaaegaobaiambaaaaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaea
diaaaaahpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaabaaaaaangafbaaaacaaaaaaigaabaaaacaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaaaaaaaaaagaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaaaaaaaaaagaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaa
fgafbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaabaaaaaadkiacaaa
aaaaaaaaagaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
aeaaaaaaegacbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaa
aaaaaaaaahaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
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
ahafaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaa
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
  Tags { "LIGHTMODE"="SHADOWCOLLECTOR" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Fog { Mode Off }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Matrix 29 [_World2Object]
Vector 33 [_Time]
Vector 34 [unity_Scale]
Float 35 [_EdgeFlutterPrimary]
Float 36 [_EdgeFlutterController]
Float 37 [_EdgeFlutterFreqScalePrimary]
Float 38 [_EdgeFlutterFreqScaleController]
Vector 39 [_WindPrimary]
Vector 40 [_WindController]
Float 41 [_LerpToController]
Float 42 [_BendingFactor]
Vector 43 [_RadialWindOrigin]
Float 44 [_RadialWindForce]
Float 45 [_RadialWindFallof]
Float 46 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[49] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..46],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[28];
DP4 R0.z, vertex.position, c[27];
DP4 R0.x, vertex.position, c[25];
DP4 R0.y, vertex.position, c[26];
MUL R0, R0, c[34].w;
ADD R2, R0, -c[43];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[45].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[48].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[44];
MUL R0.y, R0.x, c[46].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[28];
DP4 R0.z, R0.x, c[25];
ADD R0.y, R0, c[37].x;
MAD R0.z, R0.y, c[33].y, R0;
ADD R0.x, R2.w, c[35];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[44].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[39];
ADD R1.x, R2.w, c[36];
DP3 R2.z, R3, c[31];
DP3 R2.y, R3, c[30];
DP3 R2.x, R3, c[29];
MOV R0.w, c[38].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[33].y, R1;
MUL R0, R1.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[42].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[35].x;
MUL R1.y, R2.w, c[48].x;
MUL R1.xz, R5.zyww, c[48].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[40];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[39], R0;
DP3 R0.z, R3, c[31];
DP3 R0.x, R3, c[29];
DP3 R0.y, R3, c[30];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[34].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[36].x;
MUL R4.xz, R4.xyyw, c[48].y;
MUL R0.w, R2, c[40];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MOV R2.w, vertex.position;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[34].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[41].x, R2;
ADD R2.xyz, vertex.position, R0;
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
# 117 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Matrix 28 [_World2Object]
Vector 32 [_Time]
Vector 33 [unity_Scale]
Float 34 [_EdgeFlutterPrimary]
Float 35 [_EdgeFlutterController]
Float 36 [_EdgeFlutterFreqScalePrimary]
Float 37 [_EdgeFlutterFreqScaleController]
Vector 38 [_WindPrimary]
Vector 39 [_WindController]
Float 40 [_LerpToController]
Float 41 [_BendingFactor]
Vector 42 [_RadialWindOrigin]
Float 43 [_RadialWindForce]
Float 44 [_RadialWindFallof]
Float 45 [_RadialWindFreqMultiplier]
"vs_2_0
def c46, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c47, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c48, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c49, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c27
dp3 r3.y, c46.x, r2
rcp r1.y, c44.x
mul r5.zw, v2.xyxz, c34.x
dp4 r0.w, v0, c27
dp4 r0.z, v0, c26
dp4 r0.x, v0, c24
dp4 r0.y, v0, c25
mul r0, r0, c33.w
add r0, r0, -c42
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c46
max r1.x, r1, c49
add r3.x, -r1, c46
mul r1.x, r3, c43
mul r1.x, r1, c45
add r2.w, r1.x, c36.x
mov r1, c24
dp4 r1.x, c46.x, r1
mad r1.z, r2.w, c32.y, r1.x
add r1.x, r3.y, c34
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c47
frc r1, r1
mad r1, r1, c46.y, c46.z
frc r1, r1
mad r1, r1, c46.y, c46.w
abs r1, r1
mad r2, -r1, c48.x, c48.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c46.x
mul r1, r0, c43.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c35.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c38
mov r0.w, c32.y
mad r1.xy, c37.x, r0.w, r1
mul r0, r1.xxyy, c47
add r1.w, -v5, c46.x
frc r0, r0
mad r0, r0, c46.y, c46.z
frc r0, r0
mad r0, r0, c46.y, c46.w
mul r2.w, r1, c41.x
dp3 r2.z, r3, c30
dp3 r2.y, r3, c29
dp3 r2.x, r3, c28
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c48.x, c48.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c48.w
mul r1.y, r2.w, c48.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c30
dp3 r5.z, c39, r0
mov r3.xyz, c28
mov r0.xyz, c29
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c38, r0
dp3 r5.y, c39, r0
dp3 r5.x, c39, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c33.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c35.x
mul r4.xz, r4.xyyw, c48.w
mul r0.w, r2, c39
mul r0.xyz, r2.w, r0
mul r3.xyz, r2.w, r5
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c33.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c40.x, r2
add r2.xyz, v0, r0
mov r2.w, v0
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
Bind "normal" Normal
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Matrix 29 [_World2Object]
Vector 33 [_Time]
Vector 34 [unity_Scale]
Float 35 [_EdgeFlutterPrimary]
Float 36 [_EdgeFlutterController]
Float 37 [_EdgeFlutterFreqScalePrimary]
Float 38 [_EdgeFlutterFreqScaleController]
Vector 39 [_WindPrimary]
Vector 40 [_WindController]
Float 41 [_LerpToController]
Float 42 [_BendingFactor]
Vector 43 [_RadialWindOrigin]
Float 44 [_RadialWindForce]
Float 45 [_RadialWindFallof]
Float 46 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[49] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..46],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[28];
DP4 R0.z, vertex.position, c[27];
DP4 R0.x, vertex.position, c[25];
DP4 R0.y, vertex.position, c[26];
MUL R0, R0, c[34].w;
ADD R2, R0, -c[43];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[45].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[48].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[44];
MUL R0.y, R0.x, c[46].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[28];
DP4 R0.z, R0.x, c[25];
ADD R0.y, R0, c[37].x;
MAD R0.z, R0.y, c[33].y, R0;
ADD R0.x, R2.w, c[35];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[44].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[39];
ADD R1.x, R2.w, c[36];
DP3 R2.z, R3, c[31];
DP3 R2.y, R3, c[30];
DP3 R2.x, R3, c[29];
MOV R0.w, c[38].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[33].y, R1;
MUL R0, R1.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[42].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[35].x;
MUL R1.y, R2.w, c[48].x;
MUL R1.xz, R5.zyww, c[48].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[40];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[39], R0;
DP3 R0.z, R3, c[31];
DP3 R0.x, R3, c[29];
DP3 R0.y, R3, c[30];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[34].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[36].x;
MUL R4.xz, R4.xyyw, c[48].y;
MUL R0.w, R2, c[40];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MOV R2.w, vertex.position;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[34].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[41].x, R2;
ADD R2.xyz, vertex.position, R0;
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
# 117 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Matrix 28 [_World2Object]
Vector 32 [_Time]
Vector 33 [unity_Scale]
Float 34 [_EdgeFlutterPrimary]
Float 35 [_EdgeFlutterController]
Float 36 [_EdgeFlutterFreqScalePrimary]
Float 37 [_EdgeFlutterFreqScaleController]
Vector 38 [_WindPrimary]
Vector 39 [_WindController]
Float 40 [_LerpToController]
Float 41 [_BendingFactor]
Vector 42 [_RadialWindOrigin]
Float 43 [_RadialWindForce]
Float 44 [_RadialWindFallof]
Float 45 [_RadialWindFreqMultiplier]
"vs_2_0
def c46, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c47, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c48, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c49, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c27
dp3 r3.y, c46.x, r2
rcp r1.y, c44.x
mul r5.zw, v2.xyxz, c34.x
dp4 r0.w, v0, c27
dp4 r0.z, v0, c26
dp4 r0.x, v0, c24
dp4 r0.y, v0, c25
mul r0, r0, c33.w
add r0, r0, -c42
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c46
max r1.x, r1, c49
add r3.x, -r1, c46
mul r1.x, r3, c43
mul r1.x, r1, c45
add r2.w, r1.x, c36.x
mov r1, c24
dp4 r1.x, c46.x, r1
mad r1.z, r2.w, c32.y, r1.x
add r1.x, r3.y, c34
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c47
frc r1, r1
mad r1, r1, c46.y, c46.z
frc r1, r1
mad r1, r1, c46.y, c46.w
abs r1, r1
mad r2, -r1, c48.x, c48.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c46.x
mul r1, r0, c43.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c35.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c38
mov r0.w, c32.y
mad r1.xy, c37.x, r0.w, r1
mul r0, r1.xxyy, c47
add r1.w, -v5, c46.x
frc r0, r0
mad r0, r0, c46.y, c46.z
frc r0, r0
mad r0, r0, c46.y, c46.w
mul r2.w, r1, c41.x
dp3 r2.z, r3, c30
dp3 r2.y, r3, c29
dp3 r2.x, r3, c28
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c48.x, c48.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c48.w
mul r1.y, r2.w, c48.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c30
dp3 r5.z, c39, r0
mov r3.xyz, c28
mov r0.xyz, c29
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c38, r0
dp3 r5.y, c39, r0
dp3 r5.x, c39, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c33.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c35.x
mul r4.xz, r4.xyyw, c48.w
mul r0.w, r2, c39
mul r0.xyz, r2.w, r0
mul r3.xyz, r2.w, r5
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c33.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c40.x, r2
add r2.xyz, v0, r0
mov r2.w, v0
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
Bind "normal" Normal
ConstBuffer "$Globals" 160
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedpcehnlmomeaofbpjiodidmhfgciljonmabaaaaaaiabkaaaaaeaaaaaa
daaaaaaadmajaaaaaabjaaaamibjaaaaebgpgodjaeajaaaaaeajaaaaaaacpopp
jeaiaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
agaaabaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaacaaaiaabaaaaiaaaaaaaaaa
adaaaaaaaiaabiaaaaaaaaaaadaaamaaahaacaaaaaaaaaaaadaabeaaabaachaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafciaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpfbaaaaafcjaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
ckaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafclaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaapiaaaaaffjacbaaoeka
aeaaaaaeaaaaapiacaaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaccaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiacdaaoekaaaaappjaaaaaoeiaabaaaaac
abaaaiiachaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaad
aaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaia
abaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaia
alaaaaadabaaabiaabaaaaiaciaaffkaakaaaaadabaaabiaabaaaaiaciaaaaka
acaaaaadabaaabiaabaaaaibciaaaakaafaaaaadabaaaciaabaaaaiaagaaaaka
abaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkia
abaaaaacadaaabiacaaaaakaacaaaaadabaaaeiaadaaaaiacbaaaakaacaaaaad
abaaaeiaabaakkiaccaaaakaacaaaaadabaaaeiaabaakkiacdaaaakaaeaaaaae
abaaaciaahaaffkaabaaffiaabaakkiaabaaaaacadaaabiacaaappkaabaaaaac
adaaaciacbaappkaabaaaaacadaaaeiaccaappkaaiaaaaadadaaaeiaadaaoeia
ciaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoeja
abaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaahaaffka
acaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapia
adaaoeiacjaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
ciaakkkaciaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
ckaaaakackaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeia
cjaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiaciaakkka
ciaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiackaaaaka
ckaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeia
aeaaaaaeadaaapiaadaaoeiackaaaakbckaakkkaafaaaaadadaaapiaadaaoeia
afaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiaciaaaaka
afaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffia
cfaaoekaaeaaaaaeadaaahiaceaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahia
cgaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkia
adaajaiaacaaaaadabaaabiaafaappjbciaaaakaafaaaaadabaaabiaabaaaaia
aeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaia
ckaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfia
afaaaaadafaaaciaabaaaaiaclaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaia
aaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaia
aaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaia
abaaaaiaafaaaaadabaaaoiaabaaoeiachaappkaaeaaaaaeaaaaahiaaaaapjia
aaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aeaaoeiackaaaakbckaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahia
adaaffiacfaaoekaaeaaaaaeadaaaliaceaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiacgaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeia
afaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiachaappka
afaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappka
aeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeia
aaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaad
aaaaahiaacaaoeiaaaaaoejaafaaaaadaaaaaiiaaaaaffiabnaakkkaaeaaaaae
aaaaaiiabmaakkkaaaaaaaiaaaaappiaaeaaaaaeaaaaaiiaboaakkkaaaaakkia
aaaappiaaeaaaaaeaaaaaiiabpaakkkaaaaappjaaaaappiaabaaaaacaeaaaioa
aaaappibafaaaaadabaaapiaaaaaffiacbaaoekaaeaaaaaeabaaapiacaaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaccaaoekaaaaakkiaabaaoeiaaeaaaaae
abaaapiacdaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffiaajaaoeka
aeaaaaaeacaaahiaaiaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaakaaoeka
abaakkiaacaaoeiaaeaaaaaeaaaaahoaalaaoekaabaappiaacaaoeiaafaaaaad
acaaahiaabaaffiaanaaoekaaeaaaaaeacaaahiaamaaoekaabaaaaiaacaaoeia
aeaaaaaeacaaahiaaoaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahoaapaaoeka
abaappiaacaaoeiaafaaaaadacaaahiaabaaffiabbaaoekaaeaaaaaeacaaahia
baaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiabcaaoekaabaakkiaacaaoeia
aeaaaaaeacaaahoabdaaoekaabaappiaacaaoeiaafaaaaadacaaahiaabaaffia
bfaaoekaaeaaaaaeacaaahiabeaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahia
bgaaoekaabaakkiaacaaoeiaaeaaaaaeadaaahoabhaaoekaabaappiaacaaoeia
abaaaaacaeaaahoaabaaoeiaafaaaaadabaaapiaaaaaffiabjaaoekaaeaaaaae
abaaapiabiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabkaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiablaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
lmapaaaaeaaaabaaopadaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadfcbabaaa
acaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
agaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaa
adaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egiocaiaebaaaaaaaaaaaaaaaiaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaaaocaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkiacaaaaaaaaaaaajaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaai
ccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
ecaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaal
ecaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaackiacaaa
aaaaaaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaa
ckaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakecaabaaa
acaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaaimcaabaaaaaaaaaaakgakbaaaacaaaaaaagiecaaaaaaaaaaaaeaaaaaa
baaaaaahccaabaaaacaaaaaaegbcbaaaaaaaaaaakgakbaaaaaaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaaaaaaaaapgapbaaaaaaaaaaadcaaaaalpcaabaaa
adaaaaaafgifcaaaabaaaaaaaaaaaaaapgipcaaaaaaaaaaaaeaaaaaaagakbaaa
acaaaaaaaaaaaaahpcaabaaaacaaaaaaagaabaaaaaaaaaaafgakbaaaacaaaaaa
diaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaadaaaaaaegaobaaa
adaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaaeaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaaeaaaaaaaaaaaaahncaabaaaaaaaaaaafgahbaaa
acaaaaaaagacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaajaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
bcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
aaaaaaaiicaabaaaabaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadp
diaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaal
pcaabaaaaeaaaaaaagifcaaaaaaaaaaaaeaaaaaaaceaaaaamnmmmmdnmnmmmmdn
mnmmmmdnmnmmmmdndiaaaaahpcaabaaaaeaaaaaacgahbaaaaeaaaaaaagbkbaaa
acaaaaaadgaaaaaffcaabaaaafaaaaaafgahbaaaaeaaaaaadiaaaaahccaabaaa
afaaaaaadkaabaaaabaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagajbaaaafaaaaaaagajbaaaabaaaaaadgaaaaafccaabaaa
aeaaaaaabkaabaaaafaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaacaaaaaa
pgapbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaa
dkaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaa
abaaaaaabkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaajpcaabaaaacaaaaaaegaobaia
ibaaaaaaadaaaaaaegaobaiaibaaaaaaadaaaaaadcaaaabapcaabaaaadaaaaaa
egaobaiambaaaaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaabaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaa
agaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaagaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaaagaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
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
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaaaaaaaaaa
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
Bind "normal" Normal
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Matrix 29 [_World2Object]
Vector 33 [_Time]
Vector 34 [unity_Scale]
Float 35 [_EdgeFlutterPrimary]
Float 36 [_EdgeFlutterController]
Float 37 [_EdgeFlutterFreqScalePrimary]
Float 38 [_EdgeFlutterFreqScaleController]
Vector 39 [_WindPrimary]
Vector 40 [_WindController]
Float 41 [_LerpToController]
Float 42 [_BendingFactor]
Vector 43 [_RadialWindOrigin]
Float 44 [_RadialWindForce]
Float 45 [_RadialWindFallof]
Float 46 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[49] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..46],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[28];
DP4 R0.z, vertex.position, c[27];
DP4 R0.x, vertex.position, c[25];
DP4 R0.y, vertex.position, c[26];
MUL R0, R0, c[34].w;
ADD R2, R0, -c[43];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[45].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[48].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[44];
MUL R0.y, R0.x, c[46].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[28];
DP4 R0.z, R0.x, c[25];
ADD R0.y, R0, c[37].x;
MAD R0.z, R0.y, c[33].y, R0;
ADD R0.x, R2.w, c[35];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[44].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[39];
ADD R1.x, R2.w, c[36];
DP3 R2.z, R3, c[31];
DP3 R2.y, R3, c[30];
DP3 R2.x, R3, c[29];
MOV R0.w, c[38].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[33].y, R1;
MUL R0, R1.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[42].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[35].x;
MUL R1.y, R2.w, c[48].x;
MUL R1.xz, R5.zyww, c[48].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[40];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[39], R0;
DP3 R0.z, R3, c[31];
DP3 R0.x, R3, c[29];
DP3 R0.y, R3, c[30];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[34].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[36].x;
MUL R4.xz, R4.xyyw, c[48].y;
MUL R0.w, R2, c[40];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MOV R2.w, vertex.position;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[34].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[41].x, R2;
ADD R2.xyz, vertex.position, R0;
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
# 117 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NONATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Matrix 28 [_World2Object]
Vector 32 [_Time]
Vector 33 [unity_Scale]
Float 34 [_EdgeFlutterPrimary]
Float 35 [_EdgeFlutterController]
Float 36 [_EdgeFlutterFreqScalePrimary]
Float 37 [_EdgeFlutterFreqScaleController]
Vector 38 [_WindPrimary]
Vector 39 [_WindController]
Float 40 [_LerpToController]
Float 41 [_BendingFactor]
Vector 42 [_RadialWindOrigin]
Float 43 [_RadialWindForce]
Float 44 [_RadialWindFallof]
Float 45 [_RadialWindFreqMultiplier]
"vs_2_0
def c46, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c47, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c48, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c49, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c27
dp3 r3.y, c46.x, r2
rcp r1.y, c44.x
mul r5.zw, v2.xyxz, c34.x
dp4 r0.w, v0, c27
dp4 r0.z, v0, c26
dp4 r0.x, v0, c24
dp4 r0.y, v0, c25
mul r0, r0, c33.w
add r0, r0, -c42
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c46
max r1.x, r1, c49
add r3.x, -r1, c46
mul r1.x, r3, c43
mul r1.x, r1, c45
add r2.w, r1.x, c36.x
mov r1, c24
dp4 r1.x, c46.x, r1
mad r1.z, r2.w, c32.y, r1.x
add r1.x, r3.y, c34
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c47
frc r1, r1
mad r1, r1, c46.y, c46.z
frc r1, r1
mad r1, r1, c46.y, c46.w
abs r1, r1
mad r2, -r1, c48.x, c48.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c46.x
mul r1, r0, c43.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c35.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c38
mov r0.w, c32.y
mad r1.xy, c37.x, r0.w, r1
mul r0, r1.xxyy, c47
add r1.w, -v5, c46.x
frc r0, r0
mad r0, r0, c46.y, c46.z
frc r0, r0
mad r0, r0, c46.y, c46.w
mul r2.w, r1, c41.x
dp3 r2.z, r3, c30
dp3 r2.y, r3, c29
dp3 r2.x, r3, c28
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c48.x, c48.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c48.w
mul r1.y, r2.w, c48.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c30
dp3 r5.z, c39, r0
mov r3.xyz, c28
mov r0.xyz, c29
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c38, r0
dp3 r5.y, c39, r0
dp3 r5.x, c39, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c33.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c35.x
mul r4.xz, r4.xyyw, c48.w
mul r0.w, r2, c39
mul r0.xyz, r2.w, r0
mul r3.xyz, r2.w, r5
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c33.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c40.x, r2
add r2.xyz, v0, r0
mov r2.w, v0
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
Bind "normal" Normal
Matrix 9 [unity_World2Shadow0]
Matrix 13 [unity_World2Shadow1]
Matrix 17 [unity_World2Shadow2]
Matrix 21 [unity_World2Shadow3]
Matrix 25 [_Object2World]
Matrix 29 [_World2Object]
Vector 33 [_Time]
Vector 34 [unity_Scale]
Float 35 [_EdgeFlutterPrimary]
Float 36 [_EdgeFlutterController]
Float 37 [_EdgeFlutterFreqScalePrimary]
Float 38 [_EdgeFlutterFreqScaleController]
Vector 39 [_WindPrimary]
Vector 40 [_WindController]
Float 41 [_LerpToController]
Float 42 [_BendingFactor]
Vector 43 [_RadialWindOrigin]
Float 44 [_RadialWindForce]
Float 45 [_RadialWindFallof]
Float 46 [_RadialWindFreqMultiplier]
"!!ARBvp1.0
PARAM c[49] = { { 1, 2, -0.5, 3 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..46],
		{ 1.975, 0.79299998, 0.375, 0.193 },
		{ 0.30000001, 0.1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
DP4 R0.w, vertex.position, c[28];
DP4 R0.z, vertex.position, c[27];
DP4 R0.x, vertex.position, c[25];
DP4 R0.y, vertex.position, c[26];
MUL R0, R0, c[34].w;
ADD R2, R0, -c[43];
DP4 R0.x, R2, R2;
RSQ R3.y, R0.x;
RCP R0.x, R3.y;
RCP R0.y, c[45].x;
MUL R0.x, R0, R0;
MUL R0.x, R0, R0.y;
MIN R0.x, R0, c[0];
MAX R0.x, R0, c[48].z;
ADD R3.x, -R0, c[0];
MUL R0.x, R3, c[44];
MUL R0.y, R0.x, c[46].x;
MOV R0.x, c[0];
DP3 R2.w, R0.x, c[28];
DP4 R0.z, R0.x, c[25];
ADD R0.y, R0, c[37].x;
MAD R0.z, R0.y, c[33].y, R0;
ADD R0.x, R2.w, c[35];
MOV R0.y, R2.w;
DP3 R0.x, vertex.position, R0.x;
ADD R0.xy, R0.z, R0;
MUL R0, R0.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
ABS R0, R0;
MAD R1, -R0, c[0].y, c[0].w;
MUL R0, R0, R0;
MUL R0, R0, R1;
ADD R5.xy, R0.xzzw, R0.ywzw;
MUL R1.xyz, R3.y, R2;
MOV R1.w, c[0].x;
MUL R1, R1, c[44].x;
MUL R0.xyz, R1, R1.w;
MAD R3.xyz, R3.x, R0, c[39];
ADD R1.x, R2.w, c[36];
DP3 R2.z, R3, c[31];
DP3 R2.y, R3, c[30];
DP3 R2.x, R3, c[29];
MOV R0.w, c[38].x;
MOV R1.y, R2.w;
ADD R1.w, -vertex.color, c[0].x;
DP3 R1.x, vertex.position, R1.x;
MAD R1.xy, R0.w, c[33].y, R1;
MUL R0, R1.xxyy, c[47];
FRC R0, R0;
MAD R0, R0, c[0].y, c[0].z;
FRC R0, R0;
MAD R0, R0, c[0].y, -c[0].x;
MUL R2.w, R1, c[42].x;
MUL R1.xyz, R5.y, R2;
MUL R2.xyz, R2.w, R2;
MUL R4.xyz, R2.w, R1;
ABS R0, R0;
MUL R1, R0, R0;
MAD R0, -R0, c[0].y, c[0].w;
MUL R0, R1, R0;
MUL R5.zw, vertex.normal.xyxz, c[35].x;
MUL R1.y, R2.w, c[48].x;
MUL R1.xz, R5.zyww, c[48].y;
MAD R4.xyz, R5.xyxw, R1, R4;
ADD R1.zw, R0.xyxz, R0.xyyw;
DP3 R0.x, R3, R3;
MOV R3.xyz, c[40];
RSQ R0.w, R0.x;
RCP R0.w, R0.w;
MAD R0.w, R2, c[39], R0;
DP3 R0.z, R3, c[31];
DP3 R0.x, R3, c[29];
DP3 R0.y, R3, c[30];
MUL R3.xyz, R1.w, R0;
MUL R0.xyz, R2.w, R0;
MUL R0.w, R2, R0;
MUL R2.xyz, R2, c[34].w;
MAD R2.xyz, R4, R0.w, R2;
MUL R4.xy, vertex.normal.xzzw, c[36].x;
MUL R4.xz, R4.xyyw, c[48].y;
MUL R0.w, R2, c[40];
MUL R3.xyz, R2.w, R3;
MOV R4.y, R1;
MOV R2.w, vertex.position;
MAD R1.xyz, R1.zwzw, R4, R3;
MUL R0.xyz, R0, c[34].w;
MAD R0.xyz, R1, R0.w, R0;
ADD R0.xyz, R0, -R2;
MAD R0.xyz, R0, c[41].x, R2;
ADD R2.xyz, vertex.position, R0;
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
# 117 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_NATIVE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [unity_World2Shadow0]
Matrix 12 [unity_World2Shadow1]
Matrix 16 [unity_World2Shadow2]
Matrix 20 [unity_World2Shadow3]
Matrix 24 [_Object2World]
Matrix 28 [_World2Object]
Vector 32 [_Time]
Vector 33 [unity_Scale]
Float 34 [_EdgeFlutterPrimary]
Float 35 [_EdgeFlutterController]
Float 36 [_EdgeFlutterFreqScalePrimary]
Float 37 [_EdgeFlutterFreqScaleController]
Vector 38 [_WindPrimary]
Vector 39 [_WindController]
Float 40 [_LerpToController]
Float 41 [_BendingFactor]
Vector 42 [_RadialWindOrigin]
Float 43 [_RadialWindForce]
Float 44 [_RadialWindFallof]
Float 45 [_RadialWindFreqMultiplier]
"vs_2_0
def c46, 1.00000000, 2.00000000, -0.50000000, -1.00000000
def c47, 1.97500002, 0.79299998, 0.37500000, 0.19300000
def c48, 2.00000000, 3.00000000, 0.30000001, 0.10000000
def c49, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_color0 v5
mov r2.xyz, c27
dp3 r3.y, c46.x, r2
rcp r1.y, c44.x
mul r5.zw, v2.xyxz, c34.x
dp4 r0.w, v0, c27
dp4 r0.z, v0, c26
dp4 r0.x, v0, c24
dp4 r0.y, v0, c25
mul r0, r0, c33.w
add r0, r0, -c42
dp4 r0.w, r0, r0
rsq r0.w, r0.w
rcp r1.x, r0.w
mul r0.xyz, r0.w, r0
mul r1.x, r1, r1
mul r1.x, r1, r1.y
min r1.x, r1, c46
max r1.x, r1, c49
add r3.x, -r1, c46
mul r1.x, r3, c43
mul r1.x, r1, c45
add r2.w, r1.x, c36.x
mov r1, c24
dp4 r1.x, c46.x, r1
mad r1.z, r2.w, c32.y, r1.x
add r1.x, r3.y, c34
mov r1.y, r3
dp3 r1.x, v0, r1.x
add r1.xy, r1.z, r1
mul r1, r1.xxyy, c47
frc r1, r1
mad r1, r1, c46.y, c46.z
frc r1, r1
mad r1, r1, c46.y, c46.w
abs r1, r1
mad r2, -r1, c48.x, c48.y
mul r1, r1, r1
mul r1, r1, r2
add r5.xy, r1.xzzw, r1.ywzw
mov r0.w, c46.x
mul r1, r0, c43.x
mul r0.xyz, r1, r1.w
add r0.w, r3.y, c35.x
dp3 r1.x, v0, r0.w
mov r1.y, r3
mad r3.xyz, r3.x, r0, c38
mov r0.w, c32.y
mad r1.xy, c37.x, r0.w, r1
mul r0, r1.xxyy, c47
add r1.w, -v5, c46.x
frc r0, r0
mad r0, r0, c46.y, c46.z
frc r0, r0
mad r0, r0, c46.y, c46.w
mul r2.w, r1, c41.x
dp3 r2.z, r3, c30
dp3 r2.y, r3, c29
dp3 r2.x, r3, c28
mul r1.xyz, r5.y, r2
mul r2.xyz, r2.w, r2
mul r4.xyz, r2.w, r1
abs r0, r0
mul r1, r0, r0
mad r0, -r0, c48.x, c48.y
mul r0, r1, r0
mul r1.xz, r5.zyww, c48.w
mul r1.y, r2.w, c48.z
mad r4.xyz, r5.xyxw, r1, r4
add r1.zw, r0.xyxz, r0.xyyw
dp3 r0.w, r3, r3
mov r0.xyz, c30
dp3 r5.z, c39, r0
mov r3.xyz, c28
mov r0.xyz, c29
rsq r0.w, r0.w
rcp r0.w, r0.w
mad r0.w, r2, c38, r0
dp3 r5.y, c39, r0
dp3 r5.x, c39, r3
mul r0.xyz, r1.w, r5
mul r0.w, r2, r0
mul r2.xyz, r2, c33.w
mad r2.xyz, r4, r0.w, r2
mul r4.xy, v2.xzzw, c35.x
mul r4.xz, r4.xyyw, c48.w
mul r0.w, r2, c39
mul r0.xyz, r2.w, r0
mul r3.xyz, r2.w, r5
mov r4.y, r1
mad r0.xyz, r1.zwzw, r4, r0
mul r1.xyz, r3, c33.w
mad r0.xyz, r0, r0.w, r1
add r0.xyz, r0, -r2
mad r0.xyz, r0, c40.x, r2
add r2.xyz, v0, r0
mov r2.w, v0
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
Bind "normal" Normal
ConstBuffer "$Globals" 160
Float 64 [_EdgeFlutterPrimary]
Float 68 [_EdgeFlutterController]
Float 72 [_EdgeFlutterFreqScalePrimary]
Float 76 [_EdgeFlutterFreqScaleController]
Vector 80 [_WindPrimary]
Vector 96 [_WindController]
Float 112 [_LerpToController]
Float 116 [_BendingFactor]
Vector 128 [_RadialWindOrigin]
Float 144 [_RadialWindForce]
Float 148 [_RadialWindFallof]
Float 152 [_RadialWindFreqMultiplier]
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
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedpcehnlmomeaofbpjiodidmhfgciljonmabaaaaaaiabkaaaaaeaaaaaa
daaaaaaadmajaaaaaabjaaaamibjaaaaebgpgodjaeajaaaaaeajaaaaaaacpopp
jeaiaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
agaaabaaaaaaaaaaabaaaaaaabaaahaaaaaaaaaaacaaaiaabaaaaiaaaaaaaaaa
adaaaaaaaiaabiaaaaaaaaaaadaaamaaahaacaaaaaaaaaaaadaabeaaabaachaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafciaaapkaaaaaiadpaaaaaaaaaaaaaaea
aaaaaalpfbaaaaafcjaaapkamnmmpmdpamaceldpaaaamadomlkbefdofbaaaaaf
ckaaapkaaaaaaaeaaaaaialpaaaaeaeamnmmmmdnfbaaaaafclaaapkajkjjjjdo
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaafiaafaaapjaafaaaaadaaaaapiaaaaaffjacbaaoeka
aeaaaaaeaaaaapiacaaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaccaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiacdaaoekaaaaappjaaaaaoeiaabaaaaac
abaaaiiachaappkaaeaaaaaeaaaaapiaaaaaoeiaabaappiaafaaoekbajaaaaad
aaaaaiiaaaaaoeiaaaaaoeiaahaaaaacaaaaaiiaaaaappiaagaaaaacabaaabia
aaaappiaafaaaaadaaaaahiaaaaappiaaaaaoeiaafaaaaadabaaabiaabaaaaia
abaaaaiaagaaaaacabaaaciaagaaffkaafaaaaadabaaabiaabaaffiaabaaaaia
alaaaaadabaaabiaabaaaaiaciaaffkaakaaaaadabaaabiaabaaaaiaciaaaaka
acaaaaadabaaabiaabaaaaibciaaaakaafaaaaadabaaaciaabaaaaiaagaaaaka
abaaaaacacaaapiaabaaoekaaeaaaaaeabaaaciaabaaffiaagaakkkaacaakkia
abaaaaacadaaabiacaaaaakaacaaaaadabaaaeiaadaaaaiacbaaaakaacaaaaad
abaaaeiaabaakkiaccaaaakaacaaaaadabaaaeiaabaakkiacdaaaakaaeaaaaae
abaaaciaahaaffkaabaaffiaabaakkiaabaaaaacadaaabiacaaappkaabaaaaac
adaaaciacbaappkaabaaaaacadaaaeiaccaappkaaiaaaaadadaaaeiaadaaoeia
ciaaaakaacaaaaadabaaamiaadaakkiaabaaeekaaiaaaaadadaaaciaaaaaoeja
abaakkiaaiaaaaadadaaabiaaaaaoejaabaappiaaeaaaaaeaeaaapiaahaaffka
acaappiaadaakaiaacaaaaadadaaapiaabaaffiaadaakfiaafaaaaadadaaapia
adaaoeiacjaaoekabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
ciaakkkaciaappkabdaaaaacadaaapiaadaaoeiaaeaaaaaeadaaapiaadaaoeia
ckaaaakackaaffkacdaaaaacadaaapiaadaaoeiaafaaaaadaeaaapiaaeaaoeia
cjaaoekabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiaciaakkka
ciaappkabdaaaaacaeaaapiaaeaaoeiaaeaaaaaeaeaaapiaaeaaoeiackaaaaka
ckaaffkacdaaaaacaeaaapiaaeaaoeiaafaaaaadafaaapiaadaaoeiaadaaoeia
aeaaaaaeadaaapiaadaaoeiackaaaakbckaakkkaafaaaaadadaaapiaadaaoeia
afaaoeiaacaaaaadabaaaoiaadaaheiaadaacaiaabaaaaacaaaaaiiaciaaaaka
afaaaaadaaaaapiaaaaaoeiaagaaaakaafaaaaadaaaaahiaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaacaaoekaafaaaaadadaaahiaaaaaffia
cfaaoekaaeaaaaaeadaaahiaceaaoekaaaaaaaiaadaaoeiaaeaaaaaeadaaahia
cgaaoekaaaaakkiaadaaoeiaaiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaiaafaaaaadaaaaaoiaabaakkia
adaajaiaacaaaaadabaaabiaafaappjbciaaaakaafaaaaadabaaabiaabaaaaia
aeaaffkaafaaaaadaaaaaoiaaaaaoeiaabaaaaiaafaaaaadacaaapiaacaafaia
ckaappkaafaaaaadacaaapiaacaahciaacaakajaabaaaaacafaaafiaacaapfia
afaaaaadafaaaciaabaaaaiaclaaaakaaeaaaaaeaaaaaoiaabaaoeiaafaajaia
aaaaoeiaabaaaaacacaaaciaafaaffiaaeaaaaaeaaaaabiaacaappkaabaaaaia
aaaaaaiaafaaaaadaaaaabiaabaaaaiaaaaaaaiaafaaaaadabaaaoiaadaajaia
abaaaaiaafaaaaadabaaaoiaabaaoeiachaappkaaeaaaaaeaaaaahiaaaaapjia
aaaaaaiaabaapjiaafaaaaadadaaapiaaeaaoeiaaeaaoeiaaeaaaaaeaeaaapia
aeaaoeiackaaaakbckaakkkaafaaaaadadaaapiaadaaoeiaaeaaoeiaacaaaaad
abaaaoiaadaaheiaadaacaiaabaaaaacadaaahiaadaaoekaafaaaaadaeaaahia
adaaffiacfaaoekaaeaaaaaeadaaaliaceaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiacgaaoekaadaakkiaadaapeiaafaaaaadaeaaahiaabaakkiaadaaoeia
afaaaaadadaaahiaabaaaaiaadaaoeiaafaaaaadadaaahiaadaaoeiachaappka
afaaaaadaeaaahiaabaaaaiaaeaaoeiaafaaaaadaaaaaiiaabaaaaiaadaappka
aeaaaaaeabaaahiaabaapjiaacaaoeiaaeaaoeiaaeaaaaaeabaaahiaabaaoeia
aaaappiaadaaoeiabcaaaaaeacaaahiaaeaaaakaabaaoeiaaaaaoeiaacaaaaad
aaaaahiaacaaoeiaaaaaoejaafaaaaadaaaaaiiaaaaaffiabnaakkkaaeaaaaae
aaaaaiiabmaakkkaaaaaaaiaaaaappiaaeaaaaaeaaaaaiiaboaakkkaaaaakkia
aaaappiaaeaaaaaeaaaaaiiabpaakkkaaaaappjaaaaappiaabaaaaacaeaaaioa
aaaappibafaaaaadabaaapiaaaaaffiacbaaoekaaeaaaaaeabaaapiacaaaoeka
aaaaaaiaabaaoeiaaeaaaaaeabaaapiaccaaoekaaaaakkiaabaaoeiaaeaaaaae
abaaapiacdaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffiaajaaoeka
aeaaaaaeacaaahiaaiaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiaakaaoeka
abaakkiaacaaoeiaaeaaaaaeaaaaahoaalaaoekaabaappiaacaaoeiaafaaaaad
acaaahiaabaaffiaanaaoekaaeaaaaaeacaaahiaamaaoekaabaaaaiaacaaoeia
aeaaaaaeacaaahiaaoaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahoaapaaoeka
abaappiaacaaoeiaafaaaaadacaaahiaabaaffiabbaaoekaaeaaaaaeacaaahia
baaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahiabcaaoekaabaakkiaacaaoeia
aeaaaaaeacaaahoabdaaoekaabaappiaacaaoeiaafaaaaadacaaahiaabaaffia
bfaaoekaaeaaaaaeacaaahiabeaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaahia
bgaaoekaabaakkiaacaaoeiaaeaaaaaeadaaahoabhaaoekaabaappiaacaaoeia
abaaaaacaeaaahoaabaaoeiaafaaaaadabaaapiaaaaaffiabjaaoekaaeaaaaae
abaaapiabiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabkaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiablaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
lmapaaaaeaaaabaaopadaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabiaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadfcbabaaa
acaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadhccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
agaaaaaaaaaaaaajbcaabaaaaaaaaaaaakiacaaaadaaaaaaamaaaaaaakiacaaa
adaaaaaaanaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaaoaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaa
adaaaaaaapaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaampcaabaaaabaaaaaaegaobaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egiocaiaebaaaaaaaaaaaaaaaiaaaaaabbaaaaahccaabaaaaaaaaaaaegaobaaa
abaaaaaaegaobaaaabaaaaaaaocaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkiacaaaaaaaaaaaajaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaai
ccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
ecaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaajaaaaaadcaaaaal
ecaabaaaaaaaaaaackaabaaaaaaaaaaackiacaaaaaaaaaaaajaaaaaackiacaaa
aaaaaaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaabaaaaaaaaaaaaaa
ckaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaagbcaabaaaacaaaaaadkiacaaa
adaaaaaaamaaaaaadgaaaaagccaabaaaacaaaaaadkiacaaaadaaaaaaanaaaaaa
dgaaaaagecaabaaaacaaaaaadkiacaaaadaaaaaaaoaaaaaabaaaaaakecaabaaa
acaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaaimcaabaaaaaaaaaaakgakbaaaacaaaaaaagiecaaaaaaaaaaaaeaaaaaa
baaaaaahccaabaaaacaaaaaaegbcbaaaaaaaaaaakgakbaaaaaaaaaaabaaaaaah
bcaabaaaacaaaaaaegbcbaaaaaaaaaaapgapbaaaaaaaaaaadcaaaaalpcaabaaa
adaaaaaafgifcaaaabaaaaaaaaaaaaaapgipcaaaaaaaaaaaaeaaaaaaagakbaaa
acaaaaaaaaaaaaahpcaabaaaacaaaaaaagaabaaaaaaaaaaafgakbaaaacaaaaaa
diaaaaakpcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaamnmmpmdpamaceldp
aaaamadomlkbefdobkaaaaafpcaabaaaacaaaaaaegaobaaaacaaaaaadcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaea
aaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalpbkaaaaafpcaabaaa
acaaaaaaegaobaaaacaaaaaadcaaaaappcaabaaaacaaaaaaegaobaaaacaaaaaa
aceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaialpaaaaialp
aaaaialpaaaaialpdiaaaaakpcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaa
mnmmpmdpamaceldpaaaamadomlkbefdobkaaaaafpcaabaaaadaaaaaaegaobaaa
adaaaaaadcaaaaappcaabaaaadaaaaaaegaobaaaadaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaeaaaaaaaeaaceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaalp
bkaaaaafpcaabaaaadaaaaaaegaobaaaadaaaaaadcaaaaappcaabaaaadaaaaaa
egaobaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaeaaceaaaaa
aaaaialpaaaaialpaaaaialpaaaaialpdiaaaaajpcaabaaaaeaaaaaaegaobaia
ibaaaaaaacaaaaaaegaobaiaibaaaaaaacaaaaaadcaaaabapcaabaaaacaaaaaa
egaobaiambaaaaaaacaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaaeaaaaaaaaaaaaahncaabaaaaaaaaaaafgahbaaa
acaaaaaaagacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaaipcaabaaaabaaaaaaegaobaaaabaaaaaaagiacaaaaaaaaaaaajaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegacbaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagaabaaa
abaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
bcaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahccaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaafccaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
aaaaaaaiicaabaaaabaaaaaadkbabaiaebaaaaaaafaaaaaaabeaaaaaaaaaiadp
diaaaaaiicaabaaaabaaaaaadkaabaaaabaaaaaabkiacaaaaaaaaaaaahaaaaaa
diaaaaahhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaadiaaaaal
pcaabaaaaeaaaaaaagifcaaaaaaaaaaaaeaaaaaaaceaaaaamnmmmmdnmnmmmmdn
mnmmmmdnmnmmmmdndiaaaaahpcaabaaaaeaaaaaacgahbaaaaeaaaaaaagbkbaaa
acaaaaaadgaaaaaffcaabaaaafaaaaaafgahbaaaaeaaaaaadiaaaaahccaabaaa
afaaaaaadkaabaaaabaaaaaaabeaaaaajkjjjjdodcaaaaajncaabaaaaaaaaaaa
agaobaaaaaaaaaaaagajbaaaafaaaaaaagajbaaaabaaaaaadgaaaaafccaabaaa
aeaaaaaabkaabaaaafaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaacaaaaaa
pgapbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaadcaaaaakccaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaa
dkaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaa
abaaaaaabkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaigadbaaaaaaaaaaa
fgafbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaajpcaabaaaacaaaaaaegaobaia
ibaaaaaaadaaaaaaegaobaiaibaaaaaaadaaaaaadcaaaabapcaabaaaadaaaaaa
egaobaiambaaaaaaadaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaaaaaea
aceaaaaaaaaaeaeaaaaaeaeaaaaaeaeaaaaaeaeadiaaaaahpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaabaaaaaangafbaaa
acaaaaaaigaabaaaacaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaaaaaaaaa
agaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaaaaaaaaaagaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaaaaaaaaaagaaaaaa
egacbaaaacaaaaaadiaaaaahhcaabaaaadaaaaaafgafbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaadaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaabaaaaaadkiacaaaaaaaaaaaagaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaaeaaaaaaegacbaaaadaaaaaa
dcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaagiacaaaaaaaaaaaahaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
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
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahafaaaalaaaaaaaaaaaaaaa
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
Vector 2 [unity_Scale]
Vector 3 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { program.local[0],
		state.lightmodel.ambient,
		program.local[2..8],
		state.matrix.mvp };
TEMP R0;
MUL R0.xyz, vertex.normal, c[2].w;
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[1];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[3], c[3].zwzw;
DP4 result.position.w, vertex.position, c[12];
DP4 result.position.z, vertex.position, c[11];
DP4 result.position.y, vertex.position, c[10];
DP4 result.position.x, vertex.position, c[9];
END
# 11 instructions, 1 R-regs
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
Vector 8 [glstate_lightmodel_ambient]
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
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityPerFrame" 2
"vs_4_0
eefiecedgnflphobfelpebjekieknhnomfepobhdabaaaaaaneadaaaaadaaaaaa
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
abaaaaaabfaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
abaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
abaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
abaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaa
aeaaaaaaegiccaaaacaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
BindCB  "UnityPerFrame" 2
"vs_4_0_level_9_1
eefiecedgfjdecalgciihklbdpbfihidcdhhcjcaabaaaaaafmafaaaaaeaaaaaa
daaaaaaaleabaaaapaadaaaaliaeaaaaebgpgodjhmabaaaahmabaaaaaaacpopp
biabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaamaaadaaagaaaaaaaaaa
abaabeaaabaaajaaaaaaaaaaacaaaeaaabaaakaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaahiaacaaoejaajaappkaafaaaaadabaaahiaaaaaffia
ahaaoekaaeaaaaaeaaaaaliaagaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
aiaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaadaaoekaaeaaaaae
aaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejaabaaaaacadaaahoaakaaoekappppaaaafdeieefcdeacaaaaeaaaabaa
inaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
bfaaaaaafjaaaaaeegiocaaaacaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaacaaaaaaaeaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
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
Vector 2 [_ProjectionParams]
Vector 3 [unity_Scale]
Vector 4 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[13] = { { 0.5 },
		state.lightmodel.ambient,
		program.local[2..8],
		state.matrix.mvp };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[2].x;
ADD result.texcoord[3].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[3].w;
MOV result.position, R0;
MOV result.color, vertex.color;
MOV result.texcoord[3].zw, R0;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[1];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[4], c[4].zwzw;
END
# 16 instructions, 2 R-regs
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
Vector 8 [glstate_lightmodel_ambient]
Vector 9 [_ProjectionParams]
Vector 10 [_ScreenParams]
Vector 11 [unity_Scale]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mul r1.y, r1, c9.x
mad oT3.xy, r1.z, c10.zwzw, r1
mul r1.xyz, v1, c11.w
mov oPos, r0
mov oD0, v3
mov oT3.zw, r0
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c8
mad oT0.xy, v2, c12, c12.zwzw
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerFrame" 3
"vs_4_0
eefiecedplfhdhfckcgmfpfepfhhacgmambfklblabaaaaaajeaeaaaaadaaaaaa
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
feeffiedepepfceeaaedepemepfcaaklfdeieefcnmacaaaaeaaaabaalhaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaaghccabaaaaeaaaaaaegiccaaaadaaaaaaaeaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
ConstBuffer "UnityPerFrame" 208
Vector 64 [glstate_lightmodel_ambient]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
BindCB  "UnityPerFrame" 3
"vs_4_0_level_9_1
eefiecedjiblhcgihmdodebebijkamccgccilggfabaaaaaaimagaaaaaeaaaaaa
daaaaaaaceacaaaaaiafaaaanaafaaaaebgpgodjomabaaaaomabaaaaaaacpopp
hmabaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaahaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabeaaabaaakaaaaaaaaaaadaaaeaaabaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafamaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadabaaahia
aaaaffiaaiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaae
acaaahoaajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoeka
aeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaiaamaaaakaafaaaaad
abaaafiaaaaapeiaamaaaakaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aeaaamoaaaaaoeiaabaaaaacabaaapoaafaaoejaabaaaaacadaaahoaalaaoeka
ppppaaaafdeieefcnmacaaaaeaaaabaalhaaaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafjaaaaaeegiocaaaadaaaaaaafaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaadaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
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