//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Effects/Ford_Building_2UVs_Shimer_Outline" {
Properties {
 _ColorAtlas ("Color (RGB), Matcap_M (A) UV1", 2D) = "white" {}
 _Occlusion ("Occlusion (RGB) UV2", 2D) = "white" {}
 _Matcap ("Matcap (RGB)", 2D) = "black" {}
 _FeedbackColor ("Feedback Color", Color) = (0,0,0,1)
 _MatCapStrength ("Matcap Strength", Float) = 1
 _ScrollDelay ("Delay between scrolls", Float) = 1
 _DetailAngle ("Detail angle", Float) = 0
 _ScrollVelocityX ("Detail velocity", Float) = 1
 _GoodBad ("Good or Bad (0 or 1)", Float) = 1
 _TransparentColor ("Transparent Color", Color) = (1,1,1,0.3)
}
SubShader { 
 Tags { "QUEUE"="Geometry+11" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 UsePass "Ford/Base_Passes/OUTLINE"
 UsePass "Ford/Base_Passes/GHOST"
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+11" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
Float 27 [_DetailAngle]
Float 28 [_ScrollVelocityX]
Float 29 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[34] = { { 0.5, 24.980801, -24.980801, 0.15915491 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..29],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
MUL R0.x, R0, c[27];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[33].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[30];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].yzyw;
ADD R0.xyz, -R1.w, c[30];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].yzyw;
ADD R1.xyz, R1, c[31].xyxw;
MAD R1.xyz, R1, R0, c[31].zwzw;
MAD R1.xyz, R1, R0, c[32].xyxw;
MAD R1.xyz, R1, R0, c[32].zwzw;
ADD R3.xyz, R3, c[31].xyxw;
MAD R3.xyz, R3, R2, c[31].zwzw;
MAD R3.xyz, R3, R2, c[32].xyxw;
MAD R3.xyz, R3, R2, c[32].zwzw;
MAD R1.xyz, R1, R0, c[30].wzww;
SLT R4.x, R1.w, c[33].z;
SGE R4.yz, R1.w, c[33].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[30].wzww;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[30].wzww;
SGE R2.yz, R0.w, c[33].xxyw;
SLT R2.x, R0.w, c[33].z;
MOV R3.xz, R2;
DP3 R3.y, R2, c[30].wzww;
DP3 R1.x, R1, -R3;
MOV R1.y, R0;
MOV R1.z, R0.x;
DP3 R0.y, vertex.normal, c[6];
MUL R0.zw, R0.y, R1.xyxy;
MOV R1.w, -R1.x;
MOV R0.y, c[30].x;
MOV R0.x, c[28];
MUL R1.xy, R0, c[17].y;
DP3 R0.x, vertex.normal, c[5];
MAD R0.xy, R0.x, R1.zwzw, R0.zwzw;
MOV R0.z, c[29].x;
FRC R1.xy, R1;
MOV R0.w, c[30].x;
MUL R0.z, R0, c[0].x;
MAD R0.zw, R1.xyxy, c[29].x, -R0;
MUL R1.xyz, vertex.normal, c[26].w;
MAD result.texcoord[2].xy, R0, c[33].w, R0.zwzw;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[30].z;
DP4 R2.z, R0, c[21];
DP4 R2.y, R0, c[20];
DP4 R2.x, R0, c[19];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[24];
DP4 R3.y, R1, c[23];
DP4 R3.x, R1, c[22];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[25];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[4].xyz, R3, R2;
MOV R1, c[18];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R2, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 82 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
Float 26 [_DetailAngle]
Float 27 [_ScrollVelocityX]
Float 28 [_ScrollDelay]
"vs_2_0
def c29, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c30, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c31, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c32, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c25.w
dp3 r2.w, r1, c9
mov r0.y, r2.w
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.w, c31.z
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c20
dp4 r2.y, r0, c19
dp4 r2.x, r0, c18
mul r2.w, r2, r2
dp4 r0.w, r1, c23
dp4 r0.z, r1, c22
dp4 r0.y, r1, c21
mov r1.w, c26.x
mad r1.w, r1, c29.x, c29.y
frc r1.w, r1
add r1.xyz, r2, r0.yzww
mad r0.x, r0, r0, -r2.w
mul r2.xyz, r0.x, c24
add oT4.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r2.z, c17, r0
mov r0, c13
dp4 r2.y, c17, r0
mov r0, c12
dp4 r2.x, c17, r0
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mad r1.w, r1, c29.z, c29
sincos r0.xy, r1.w, c30.xyzw, c31.xyzw
dp3 r1.z, v2, c5
mov r0.w, c32.y
mov r0.z, c27.x
mul r0.zw, r0, c16.y
frc r1.xy, r0.zwzw
mov r0.z, c29.y
mov r0.w, c32.y
mul r0.z, c28.x, r0
mad r1.xy, r1, c28.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.z, r0.yxzw
dp3 r1.z, v2, c4
mad r0.xy, r1.z, r0.zwzw, r0
mad oT2.xy, r0, c32.x, r1
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
mov oT0.xy, v3
mov oT1.xy, v4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 80
Float 52 [_DetailAngle]
Float 56 [_ScrollVelocityX]
Float 60 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedbgioojegmgfchpinapgkibagpbokcockabaaaaaaeianaaaaaeaaaaaa
daaaaaaanmaeaaaamialaaaajaamaaaaebgpgodjkeaeaaaakeaeaaaaaaacpopp
bmaeaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
acaacgaaahaaaeaaaaaaaaaaadaaaaaaaeaaalaaaaaaaaaaadaaaiaaadaaapaa
aaaaaaaaadaaamaaadaabcaaaaaaaaaaadaabaaaafaabfaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbkaaapkaidpjccdoaaaaaadpnlapmjeanlapejmafbaaaaaf
blaaapkaaaaaaaaaaaaaaadpmnmmemdoaaaaiadpfbaaaaafbmaaapkaabannalf
gballglhklkkckdlijiiiidjfbaaaaafbnaaapkaklkkkklmaaaaaaloaaaaiadp
aaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
abaaaaacaaaaaoiaabaaoekaafaaaaadabaaabiaaaaakkiaacaaffkaabaaaaac
abaaaciablaaaakabdaaaaacaaaaafiaabaaneiaafaaaaadabaaadiaaaaappia
blaaobkaaeaaaaaeaaaaafiaabaappkaaaaaoeiaabaaneibaeaaaaaeaaaaacia
aaaaffiabkaaaakabkaaffkabdaaaaacaaaaaciaaaaaffiaaeaaaaaeaaaaacia
aaaaffiabkaakkkabkaappkacfaaaaaeabaaadiaaaaaffiabmaaoekabnaaoeka
afaaaaadacaaahiaacaaffjabaaanekaaeaaaaaeacaaahiaapaanekaacaaaaja
acaaoeiaaeaaaaaeacaaahiabbaanekaacaakkjaacaaoeiaafaaaaadabaaania
abaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffibabaappiaacaaaaad
acaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeiablaakkkaaaaaoiia
abaaaaacaaaaapiaadaaoekaafaaaaadabaaahiaaaaaffiabgaaoekaaeaaaaae
abaaahiabfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoejabjaappkaafaaaaadabaaahia
aaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiabeaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiablaappkaajaaaaad
abaaabiaaeaaoekaaaaaoeiaajaaaaadabaaaciaafaaoekaaaaaoeiaajaaaaad
abaaaeiaagaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaad
adaaabiaahaaoekaacaaoeiaajaaaaadadaaaciaaiaaoekaacaaoeiaajaaaaad
adaaaeiaajaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffib
aeaaaaaeadaaahoaakaaoekaaaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffja
amaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
oeagaaaaeaaaabaaljabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaj
bcaabaaaaaaaaaaackiacaaaaaaaaaaaadaaaaaabkiacaaaabaaaaaaaaaaaaaa
dgaaaaaikcaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaa
dkiacaaaaaaaaaaaadaaaaaaabeaaaaaaaaaaadpdcaaaaaldcaabaaaaaaaaaaa
pgipcaaaaaaaaaaaadaaaaaaegaabaaaaaaaaaaaogakbaiaebaaaaaaaaaaaaaa
diaaaaaimcaabaaaaaaaaaaafgbfbaaaacaaaaaaagiecaaaadaaaaaaajaaaaaa
dcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaa
kgaobaaaaaaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaakaaaaaa
kgbkbaaaacaaaaaakgaobaaaaaaaaaaaenaaaaaibcaabaaaabaaaaaabcaabaaa
acaaaaaabkiacaaaaaaaaaaaadaaaaaadgaaaaafecaabaaaabaaaaaaakaabaaa
abaaaaaadgaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaaapaaaaahbcaabaaa
acaaaaaaogakbaaaaaaaaaaajgafbaaaabaaaaaaenaaaaaibcaabaaaabaaaaaa
aanaaaaabkiacaiaebaaaaaaaaaaaaaaadaaaaaaapaaaaahccaabaaaacaaaaaa
ogakbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaamdccabaaaacaaaaaaegaabaaa
acaaaaaaaceaaaaamnmmemdomnmmemdoaaaaaaaaaaaaaaaaegaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
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
hccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
Float 28 [_DetailAngle]
Float 29 [_ScrollVelocityX]
Float 30 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[35] = { { 0.5, 24.980801, -24.980801, 0.15915491 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..30],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
MUL R0.x, R0, c[28];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[34].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[31];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].yzyw;
ADD R0.xyz, -R1.w, c[31];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].yzyw;
ADD R1.xyz, R1, c[32].xyxw;
MAD R1.xyz, R1, R0, c[32].zwzw;
MAD R1.xyz, R1, R0, c[33].xyxw;
MAD R1.xyz, R1, R0, c[33].zwzw;
ADD R3.xyz, R3, c[32].xyxw;
MAD R3.xyz, R3, R2, c[32].zwzw;
MAD R3.xyz, R3, R2, c[33].xyxw;
MAD R3.xyz, R3, R2, c[33].zwzw;
MAD R1.xyz, R1, R0, c[31].wzww;
SLT R4.x, R1.w, c[34].z;
SGE R4.yz, R1.w, c[34].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[31].wzww;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[31].wzww;
SGE R2.yz, R0.w, c[34].xxyw;
SLT R2.x, R0.w, c[34].z;
MOV R3.xz, R2;
DP3 R3.y, R2, c[31].wzww;
DP3 R1.x, R1, -R3;
MOV R1.y, R0;
MOV R1.z, R0.x;
DP3 R0.y, vertex.normal, c[6];
MUL R0.zw, R0.y, R1.xyxy;
MOV R1.w, -R1.x;
MOV R0.y, c[31].x;
MOV R0.x, c[29];
MUL R1.xy, R0, c[17].y;
DP3 R0.x, vertex.normal, c[5];
MAD R0.xy, R0.x, R1.zwzw, R0.zwzw;
MOV R0.z, c[30].x;
FRC R1.xy, R1;
MOV R0.w, c[31].x;
MUL R0.z, R0, c[0].x;
MAD R0.zw, R1.xyxy, c[30].x, -R0;
MUL R1.xyz, vertex.normal, c[27].w;
MAD result.texcoord[2].xy, R0, c[34].w, R0.zwzw;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[31].z;
DP4 R2.z, R0, c[22];
DP4 R2.y, R0, c[21];
DP4 R2.x, R0, c[20];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[25];
DP4 R3.y, R1, c[24];
DP4 R3.x, R1, c[23];
MOV R1.xyz, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[26];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[19];
ADD result.texcoord[4].xyz, R3, R2;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[18].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 87 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_SHAr]
Vector 21 [unity_SHAg]
Vector 22 [unity_SHAb]
Vector 23 [unity_SHBr]
Vector 24 [unity_SHBg]
Vector 25 [unity_SHBb]
Vector 26 [unity_SHC]
Vector 27 [unity_Scale]
Float 28 [_DetailAngle]
Float 29 [_ScrollVelocityX]
Float 30 [_ScrollDelay]
"vs_2_0
def c31, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c32, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c33, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c34, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c27.w
dp3 r2.w, r1, c9
mov r0.y, r2.w
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.w, c33.z
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c22
dp4 r2.y, r0, c21
dp4 r2.x, r0, c20
mul r2.w, r2, r2
dp4 r0.w, r1, c25
dp4 r0.z, r1, c24
dp4 r0.y, r1, c23
mov r1.w, c28.x
mad r1.w, r1, c31.x, c31.y
frc r1.w, r1
add r1.xyz, r2, r0.yzww
mad r0.x, r0, r0, -r2.w
mul r2.xyz, r0.x, c26
add oT4.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r2.z, c19, r0
mov r0, c13
dp4 r2.y, c19, r0
mov r0, c12
dp4 r2.x, c19, r0
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mad r1.w, r1, c31.z, c31
sincos r0.xy, r1.w, c32.xyzw, c33.xyzw
dp3 r1.z, v2, c5
mov r0.w, c34.y
mov r0.z, c29.x
mul r0.zw, r0, c16.y
frc r1.xy, r0.zwzw
mov r0.z, c31.y
mov r0.w, c34.y
mul r0.z, c30.x, r0
mad r1.xy, r1, c30.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.z, r0.yxzw
dp3 r1.z, v2, c4
mad r0.xy, r1.z, r0.zwzw, r0
mad oT2.xy, r0, c34.x, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c31.y
mul r1.y, r1, c17.x
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
mad oT5.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
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
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedaaiffpakjpddpfcgcdekkmbekapcmcniabaaaaaafaaoaaaaaeaaaaaa
daaaaaaadeafaaaaliamaaaaiaanaaaaebgpgodjpmaeaaaapmaeaaaaaaacpopp
giaeaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaahaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaafaaabaaadaaaaaaaaaa
acaaaaaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaa
aaaaaaaaadaaaiaaadaabaaaaaaaaaaaadaaamaaadaabdaaaaaaaaaaadaabaaa
afaabgaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafblaaapkaidpjccdoaaaaaadp
nlapmjeanlapejmafbaaaaafbmaaapkaaaaaaaaaaaaaaadpmnmmemdoaaaaiadp
fbaaaaafbnaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafboaaapka
klkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaoiaabaaoekaafaaaaadabaaabia
aaaakkiaacaaffkaabaaaaacabaaaciabmaaaakabdaaaaacaaaaafiaabaaneia
afaaaaadabaaadiaaaaappiabmaaobkaaeaaaaaeaaaaafiaabaappkaaaaaoeia
abaaneibaeaaaaaeaaaaaciaaaaaffiablaaaakablaaffkabdaaaaacaaaaacia
aaaaffiaaeaaaaaeaaaaaciaaaaaffiablaakkkablaappkacfaaaaaeabaaadia
aaaaffiabnaaoekaboaaoekaafaaaaadacaaahiaacaaffjabbaanekaaeaaaaae
acaaahiabaaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiabcaanekaacaakkja
acaaoeiaafaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaia
abaaffibabaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoa
acaaoeiabmaakkkaaaaaoiiaabaaaaacaaaaapiaaeaaoekaafaaaaadabaaahia
aaaaffiabhaaoekaaeaaaaaeabaaahiabgaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
bkaappkaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeaaaaaliabdaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabmaappkaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaadabaaacia
agaaoekaaaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaadadaaacia
ajaaoekaacaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaalaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaaeaaaaapiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
apaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaad
abaaaiiaabaaaaiablaaffkaafaaaaadabaaafiaaaaapeiablaaffkaacaaaaad
aeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefchmahaaaaeaaaabaa
npabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaajbcaabaaaabaaaaaa
ckiacaaaaaaaaaaaahaaaaaabkiacaaaabaaaaaaaaaaaaaadgaaaaaikcaabaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabkaaaaafdcaabaaa
abaaaaaaegaabaaaabaaaaaadiaaaaaiecaabaaaabaaaaaadkiacaaaaaaaaaaa
ahaaaaaaabeaaaaaaaaaaadpdcaaaaaldcaabaaaabaaaaaapgipcaaaaaaaaaaa
ahaaaaaaegaabaaaabaaaaaaogakbaiaebaaaaaaabaaaaaadiaaaaaimcaabaaa
abaaaaaafgbfbaaaacaaaaaaagiecaaaadaaaaaaajaaaaaadcaaaaakmcaabaaa
abaaaaaaagiecaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaakgaobaaaabaaaaaa
dcaaaaakmcaabaaaabaaaaaaagiecaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaa
kgaobaaaabaaaaaaenaaaaaibcaabaaaacaaaaaabcaabaaaadaaaaaabkiacaaa
aaaaaaaaahaaaaaadgaaaaafecaabaaaacaaaaaaakaabaaaacaaaaaadgaaaaaf
ccaabaaaacaaaaaaakaabaaaadaaaaaaapaaaaahbcaabaaaadaaaaaaogakbaaa
abaaaaaajgafbaaaacaaaaaaenaaaaaibcaabaaaacaaaaaaaanaaaaabkiacaia
ebaaaaaaaaaaaaaaahaaaaaaapaaaaahccaabaaaadaaaaaaogakbaaaabaaaaaa
egaabaaaacaaaaaadcaaaaamdccabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaa
mnmmemdomnmmemdoaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
acaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
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
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_4LightPosX0]
Vector 20 [unity_4LightPosY0]
Vector 21 [unity_4LightPosZ0]
Vector 22 [unity_4LightAtten0]
Vector 23 [unity_LightColor0]
Vector 24 [unity_LightColor1]
Vector 25 [unity_LightColor2]
Vector 26 [unity_LightColor3]
Vector 27 [unity_SHAr]
Vector 28 [unity_SHAg]
Vector 29 [unity_SHAb]
Vector 30 [unity_SHBr]
Vector 31 [unity_SHBg]
Vector 32 [unity_SHBb]
Vector 33 [unity_SHC]
Vector 34 [unity_Scale]
Float 35 [_DetailAngle]
Float 36 [_ScrollVelocityX]
Float 37 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[42] = { { 0.15915491, 0, 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..37],
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[34].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[20];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[19];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0];
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[21];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[22];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].w;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[24];
MAD R1.xyz, R0.x, c[23], R1;
MAD R0.xyz, R0.z, c[25], R1;
MAD R1.xyz, R0.w, c[26], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[32];
DP4 R3.y, R0, c[31];
DP4 R3.x, R0, c[30];
MUL R1.w, R3, R3;
ADD R0.xyz, R2, R3;
MAD R0.w, R4.x, R4.x, -R1;
MUL R2.xyz, R0.w, c[33];
ADD R2.xyz, R0, R2;
MOV R0.w, c[0].x;
MUL R0.x, R0.w, c[35];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[41].z;
FRC R0.w, R0.y;
ADD result.texcoord[4].xyz, R2, R1;
ADD R1.xyz, -R0.w, c[0].yzww;
MUL R2.xyz, R1, R1;
ADD R0.xyz, -R1.w, c[0].yzww;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[38].xyxw, c[38].zwzw;
MAD R1.xyz, R1, R0, c[39].xyxw;
MAD R1.xyz, R1, R0, c[39].zwzw;
MAD R1.xyz, R1, R0, c[40].xyxw;
MAD R3.xyz, R2, c[38].xyxw, c[38].zwzw;
MAD R3.xyz, R3, R2, c[39].xyxw;
MAD R3.xyz, R3, R2, c[39].zwzw;
MAD R3.xyz, R3, R2, c[40].xyxw;
MAD R1.xyz, R1, R0, c[40].zwzw;
MAD R2.xyz, R3, R2, c[40].zwzw;
SLT R4.x, R1.w, c[41].z;
SGE R4.yz, R1.w, c[41].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[40].zwzw;
DP3 R0.xy, R1, -R0;
SGE R1.yz, R0.w, c[41].xxyw;
SLT R1.x, R0.w, c[41].z;
MOV R0.w, R0.y;
MOV R3.xz, R1;
DP3 R3.y, R1, c[40].zwzw;
DP3 R0.z, R2, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R1.xy, R0.z, R0, R1;
MOV R0.y, c[0];
MOV R0.x, c[36];
MUL R1.zw, R0.xyxy, c[17].y;
FRC R2.xy, R1.zwzw;
MOV R0.w, c[37].x;
MOV R0.xyz, vertex.attrib[14];
MUL R1.z, R0.w, c[0];
MOV R1.w, c[0].y;
MAD R1.zw, R2.xyxy, c[37].x, -R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD result.texcoord[2].xy, R1, c[41].w, R1.zwzw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[18];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 110 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_4LightPosX0]
Vector 19 [unity_4LightPosY0]
Vector 20 [unity_4LightPosZ0]
Vector 21 [unity_4LightAtten0]
Vector 22 [unity_LightColor0]
Vector 23 [unity_LightColor1]
Vector 24 [unity_LightColor2]
Vector 25 [unity_LightColor3]
Vector 26 [unity_SHAr]
Vector 27 [unity_SHAg]
Vector 28 [unity_SHAb]
Vector 29 [unity_SHBr]
Vector 30 [unity_SHBg]
Vector 31 [unity_SHBb]
Vector 32 [unity_SHC]
Vector 33 [unity_Scale]
Float 34 [_DetailAngle]
Float 35 [_ScrollVelocityX]
Float 36 [_ScrollDelay]
"vs_2_0
def c37, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c38, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c39, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c40, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c33.w
dp4 r0.x, v0, c9
add r1, -r0.x, c19
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c18
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c39.z
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c20
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c21
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c39.z
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c40.y
mul r0, r0, r1
mul r1.xyz, r0.y, c23
mad r1.xyz, r0.x, c22, r1
mad r0.xyz, r0.z, c24, r1
mad r1.xyz, r0.w, c25, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c31
dp4 r3.y, r0, c30
dp4 r3.x, r0, c29
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c32
mov r1.w, c34.x
mad r1.w, r1, c37.x, c37.y
frc r1.w, r1
mad r1.w, r1, c37.z, c37
dp4 r2.z, r4, c28
dp4 r2.y, r4, c27
dp4 r2.x, r4, c26
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add oT4.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r2.z, c17, r0
mov r0, c13
dp4 r2.y, c17, r0
mov r0, c12
dp4 r2.x, c17, r0
sincos r0.xy, r1.w, c38.xyzw, c39.xyzw
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mov r0.w, c40.y
mov r0.z, c35.x
mul r0.zw, r0, c16.y
frc r1.xy, r0.zwzw
mov r0.z, c37.y
dp3 r1.z, v2, c5
mov r0.w, c40.y
mul r0.z, c36.x, r0
mad r1.xy, r1, c36.x, -r0.zwzw
mov r0.z, r0.x
mul r1.zw, r1.z, r0.xyyx
mov r0.w, -r0.y
dp3 r0.x, v2, c4
mad r0.xy, r0.x, r0.zwzw, r1.zwzw
mad oT2.xy, r0, c40.x, r1
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
mov oT0.xy, v3
mov oT1.xy, v4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 80
Float 52 [_DetailAngle]
Float 56 [_ScrollVelocityX]
Float 60 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedbpbecpdohmcmniliniildfiffcanfgcfabaaaaaajabcaaaaaeaaaaaa
daaaaaaaneagaaaababbaaaanibbaaaaebgpgodjjmagaaaajmagaaaaaaacpopp
beagaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
acaaacaaaiaaaeaaaaaaaaaaacaacgaaahaaamaaaaaaaaaaadaaaaaaaeaabdaa
aaaaaaaaadaaaiaaadaabhaaaaaaaaaaadaaamaaajaabkaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafcdaaapkaidpjccdoaaaaaadpnlapmjeanlapejmafbaaaaaf
ceaaapkaaaaaaaaaaaaaaadpmnmmemdoaaaaiadpfbaaaaafcfaaapkaabannalf
gballglhklkkckdlijiiiidjfbaaaaafcgaaapkaklkkkklmaaaaaaloaaaaiadp
aaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
abaaaaacaaaaaoiaabaaoekaafaaaaadabaaabiaaaaakkiaacaaffkaabaaaaac
abaaaciaceaaaakabdaaaaacaaaaafiaabaaneiaafaaaaadabaaadiaaaaappia
ceaaobkaaeaaaaaeaaaaafiaabaappkaaaaaoeiaabaaneibaeaaaaaeaaaaacia
aaaaffiacdaaaakacdaaffkabdaaaaacaaaaaciaaaaaffiaaeaaaaaeaaaaacia
aaaaffiacdaakkkacdaappkacfaaaaaeabaaadiaaaaaffiacfaaoekacgaaoeka
afaaaaadacaaahiaacaaffjabiaanekaaeaaaaaeacaaahiabhaanekaacaaaaja
acaaoeiaaeaaaaaeacaaahiabjaanekaacaakkjaacaaoeiaafaaaaadabaaania
abaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffibabaappiaacaaaaad
acaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeiaceaakkkaaaaaoiia
abaaaaacaaaaapiaadaaoekaafaaaaadabaaahiaaaaaffiabpaaoekaaeaaaaae
abaaahiaboaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiacaaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiacbaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffjablaaoekaaeaaaaaeaaaaahia
bkaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabnaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaakkib
agaaoekaacaaaaadacaaapiaaaaaaaibaeaaoekaacaaaaadaaaaapiaaaaaffib
afaaoekaafaaaaadadaaahiaacaaoejaccaappkaafaaaaadaeaaahiaadaaffia
blaaoekaaeaaaaaeadaaaliabkaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahia
bmaaoekaadaakkiaadaapeiaafaaaaadaeaaapiaaaaaoeiaadaaffiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaacaaoeiaacaaoeiaaaaaoeia
aeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeiaaeaaaaaeacaaapiaabaaoeia
adaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeiaabaaoeiaaaaaoeiaahaaaaac
abaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffiaahaaaaacabaaaeiaaaaakkia
ahaaaaacabaaaiiaaaaappiaabaaaaacaeaaaiiaceaappkaaeaaaaaeaaaaapia
aaaaoeiaahaaoekaaeaappiaafaaaaadabaaapiaabaaoeiaacaaoeiaalaaaaad
abaaapiaabaaoeiaceaaaakaagaaaaacacaaabiaaaaaaaiaagaaaaacacaaacia
aaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaacacaaaiiaaaaappiaafaaaaad
aaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaae
abaaahiaaiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappiaaaaaoeiaabaaaaacadaaaiia
ceaappkaajaaaaadabaaabiaamaaoekaadaaoeiaajaaaaadabaaaciaanaaoeka
adaaoeiaajaaaaadabaaaeiaaoaaoekaadaaoeiaafaaaaadacaaapiaadaacjia
adaakeiaajaaaaadaeaaabiaapaaoekaacaaoeiaajaaaaadaeaaaciabaaaoeka
acaaoeiaajaaaaadaeaaaeiabbaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
aeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffiaaeaaaaaeaaaaaiiaadaaaaia
adaaaaiaaaaappibaeaaaaaeabaaahiabcaaoekaaaaappiaabaaoeiaacaaaaad
adaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabeaaoekaaeaaaaae
aaaaapiabdaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcdeakaaaaeaaaabaa
inacaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaajbcaabaaaaaaaaaaa
ckiacaaaaaaaaaaaadaaaaaabkiacaaaabaaaaaaaaaaaaaadgaaaaaikcaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabkaaaaafdcaabaaa
aaaaaaaaegaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaadkiacaaaaaaaaaaa
adaaaaaaabeaaaaaaaaaaadpdcaaaaaldcaabaaaaaaaaaaapgipcaaaaaaaaaaa
adaaaaaaegaabaaaaaaaaaaaogakbaiaebaaaaaaaaaaaaaadiaaaaaimcaabaaa
aaaaaaaafgbfbaaaacaaaaaaagiecaaaadaaaaaaajaaaaaadcaaaaakmcaabaaa
aaaaaaaaagiecaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaakgaobaaaaaaaaaaa
dcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaa
kgaobaaaaaaaaaaaenaaaaaibcaabaaaabaaaaaabcaabaaaacaaaaaabkiacaaa
aaaaaaaaadaaaaaadgaaaaafecaabaaaabaaaaaaakaabaaaabaaaaaadgaaaaaf
ccaabaaaabaaaaaaakaabaaaacaaaaaaapaaaaahbcaabaaaacaaaaaaogakbaaa
aaaaaaaajgafbaaaabaaaaaaenaaaaaibcaabaaaabaaaaaaaanaaaaabkiacaia
ebaaaaaaaaaaaaaaadaaaaaaapaaaaahccaabaaaacaaaaaaogakbaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaamdccabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaa
mnmmemdomnmmemdoaaaaaaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaaaaaaaaa
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
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_Time]
Vector 18 [_ProjectionParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
Float 36 [_DetailAngle]
Float 37 [_ScrollVelocityX]
Float 38 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[43] = { { 0.15915491, 0, 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..38],
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[35].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[21];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[20];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0];
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[22];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[23];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].w;
DP4 R2.z, R4, c[30];
DP4 R2.y, R4, c[29];
DP4 R2.x, R4, c[28];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[25];
MAD R1.xyz, R0.x, c[24], R1;
MAD R0.xyz, R0.z, c[26], R1;
MAD R1.xyz, R0.w, c[27], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[33];
DP4 R3.y, R0, c[32];
DP4 R3.x, R0, c[31];
MUL R1.w, R3, R3;
ADD R0.xyz, R2, R3;
MAD R0.w, R4.x, R4.x, -R1;
MUL R2.xyz, R0.w, c[34];
ADD R2.xyz, R0, R2;
MOV R0.w, c[0].x;
MUL R0.x, R0.w, c[36];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[42].z;
FRC R0.w, R0.y;
ADD result.texcoord[4].xyz, R2, R1;
ADD R1.xyz, -R0.w, c[0].yzww;
MUL R2.xyz, R1, R1;
ADD R0.xyz, -R1.w, c[0].yzww;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[39].xyxw, c[39].zwzw;
MAD R1.xyz, R1, R0, c[40].xyxw;
MAD R1.xyz, R1, R0, c[40].zwzw;
MAD R1.xyz, R1, R0, c[41].xyxw;
MAD R3.xyz, R2, c[39].xyxw, c[39].zwzw;
MAD R3.xyz, R3, R2, c[40].xyxw;
MAD R3.xyz, R3, R2, c[40].zwzw;
MAD R3.xyz, R3, R2, c[41].xyxw;
MAD R1.xyz, R1, R0, c[41].zwzw;
MAD R2.xyz, R3, R2, c[41].zwzw;
SLT R4.x, R1.w, c[42].z;
SGE R4.yz, R1.w, c[42].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[41].zwzw;
DP3 R0.xy, R1, -R0;
SGE R1.yz, R0.w, c[42].xxyw;
SLT R1.x, R0.w, c[42].z;
MOV R0.w, R0.y;
MOV R3.xz, R1;
DP3 R3.y, R1, c[41].zwzw;
DP3 R0.z, R2, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R1.xy, R0.z, R0, R1;
MOV R0.y, c[0];
MOV R0.x, c[37];
MUL R1.zw, R0.xyxy, c[17].y;
FRC R2.xy, R1.zwzw;
MOV R0.w, c[38].x;
MOV R0.xyz, vertex.attrib[14];
MUL R1.z, R0.w, c[0];
MOV R1.w, c[0].y;
MAD R1.zw, R2.xyxy, c[38].x, -R1;
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD result.texcoord[2].xy, R1, c[42].w, R1.zwzw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[19];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[18].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 115 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_Time]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [_WorldSpaceLightPos0]
Vector 20 [unity_4LightPosX0]
Vector 21 [unity_4LightPosY0]
Vector 22 [unity_4LightPosZ0]
Vector 23 [unity_4LightAtten0]
Vector 24 [unity_LightColor0]
Vector 25 [unity_LightColor1]
Vector 26 [unity_LightColor2]
Vector 27 [unity_LightColor3]
Vector 28 [unity_SHAr]
Vector 29 [unity_SHAg]
Vector 30 [unity_SHAb]
Vector 31 [unity_SHBr]
Vector 32 [unity_SHBg]
Vector 33 [unity_SHBb]
Vector 34 [unity_SHC]
Vector 35 [unity_Scale]
Float 36 [_DetailAngle]
Float 37 [_ScrollVelocityX]
Float 38 [_ScrollDelay]
"vs_2_0
def c39, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c40, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c41, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c42, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c35.w
dp4 r0.x, v0, c9
add r1, -r0.x, c21
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c20
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c41.z
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c22
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c23
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c41.z
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c42.y
mul r0, r0, r1
mul r1.xyz, r0.y, c25
mad r1.xyz, r0.x, c24, r1
mad r0.xyz, r0.z, c26, r1
mad r1.xyz, r0.w, c27, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c33
dp4 r3.y, r0, c32
dp4 r3.x, r0, c31
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c34
mov r1.w, c36.x
mad r1.w, r1, c39.x, c39.y
frc r1.w, r1
mad r1.w, r1, c39.z, c39
dp4 r2.z, r4, c30
dp4 r2.y, r4, c29
dp4 r2.x, r4, c28
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add oT4.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r2.z, c19, r0
mov r0, c13
dp4 r2.y, c19, r0
mov r0, c12
dp4 r2.x, c19, r0
sincos r0.xy, r1.w, c40.xyzw, c41.xyzw
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mov r0.w, c42.y
mov r0.z, c37.x
mul r0.zw, r0, c16.y
frc r1.xy, r0.zwzw
mov r0.z, c39.y
dp3 r1.z, v2, c5
mul r1.zw, r1.z, r0.xyyx
mov r0.w, c42.y
mul r0.z, c38.x, r0
mad r1.xy, r1, c38.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
dp3 r0.x, v2, c4
mad r0.xy, r0.x, r0.zwzw, r1.zwzw
mad oT2.xy, r0, c42.x, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c39.y
mul r1.y, r1, c17.x
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
mad oT5.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
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
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedepakolpkdgdlahigglebdamidiagkcobabaaaaaajibdaaaaaeaaaaaa
daaaaaaacmahaaaaaabcaaaamibcaaaaebgpgodjpeagaaaapeagaaaaaaacpopp
gaagaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaahaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaafaaabaaadaaaaaaaaaa
acaaaaaaabaaaeaaaaaaaaaaacaaacaaaiaaafaaaaaaaaaaacaacgaaahaaanaa
aaaaaaaaadaaaaaaaeaabeaaaaaaaaaaadaaaiaaadaabiaaaaaaaaaaadaaamaa
ajaablaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafceaaapkanlapmjeanlapejma
aaaaiadpaaaaaaaafbaaaaafcfaaapkaaaaaaadpaaaaaaaaidpjccdomnmmemdo
fbaaaaafcgaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafchaaapka
klkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaoiaabaaoekaafaaaaadabaaabia
aaaakkiaacaaffkaabaaaaacabaaaciacfaaffkabdaaaaacaaaaafiaabaaneia
afaaaaadabaaadiaaaaappiacfaaoekaaeaaaaaeaaaaafiaabaappkaaaaaoeia
abaaneibaeaaaaaeaaaaaciaaaaaffiacfaakkkacfaaaakabdaaaaacaaaaacia
aaaaffiaaeaaaaaeaaaaaciaaaaaffiaceaaaakaceaaffkacfaaaaaeabaaadia
aaaaffiacgaaoekachaaoekaafaaaaadacaaahiaacaaffjabjaanekaaeaaaaae
acaaahiabiaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiabkaanekaacaakkja
acaaoeiaafaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaia
abaaffibabaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoa
acaaoeiacfaappkaaaaaoiiaabaaaaacaaaaapiaaeaaoekaafaaaaadabaaahia
aaaaffiacaaaoekaaeaaaaaeabaaahiabpaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiacbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaccaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
bmaaoekaaeaaaaaeaaaaahiablaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
bnaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaboaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibahaaoekaacaaaaadacaaapiaaaaaaaibafaaoeka
acaaaaadaaaaapiaaaaaffibagaaoekaafaaaaadadaaahiaacaaoejacdaappka
afaaaaadaeaaahiaadaaffiabmaaoekaaeaaaaaeadaaaliablaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiabnaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaaeia
ceaakkkaaeaaaaaeaaaaapiaaaaaoeiaaiaaoekaaeaakkiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiacfaaffkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiaceaakkkaajaaaaadabaaabiaanaaoekaadaaoeia
ajaaaaadabaaaciaaoaaoekaadaaoeiaajaaaaadabaaaeiaapaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiabaaaoekaacaaoeia
ajaaaaadaeaaaciabbaaoekaacaaoeiaajaaaaadaeaaaeiabcaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabdaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabfaaoekaaeaaaaaeaaaaapiabeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabgaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
cfaaaakaafaaaaadabaaafiaaaaapeiacfaaaakaacaaaaadaeaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcmmakaaaaeaaaabaaldacaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaajbcaabaaaabaaaaaackiacaaaaaaaaaaa
ahaaaaaabkiacaaaabaaaaaaaaaaaaaadgaaaaaikcaabaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabkaaaaafdcaabaaaabaaaaaaegaabaaa
abaaaaaadiaaaaaiecaabaaaabaaaaaadkiacaaaaaaaaaaaahaaaaaaabeaaaaa
aaaaaadpdcaaaaaldcaabaaaabaaaaaapgipcaaaaaaaaaaaahaaaaaaegaabaaa
abaaaaaaogakbaiaebaaaaaaabaaaaaadiaaaaaimcaabaaaabaaaaaafgbfbaaa
acaaaaaaagiecaaaadaaaaaaajaaaaaadcaaaaakmcaabaaaabaaaaaaagiecaaa
adaaaaaaaiaaaaaaagbabaaaacaaaaaakgaobaaaabaaaaaadcaaaaakmcaabaaa
abaaaaaaagiecaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaaabaaaaaa
enaaaaaibcaabaaaacaaaaaabcaabaaaadaaaaaabkiacaaaaaaaaaaaahaaaaaa
dgaaaaafecaabaaaacaaaaaaakaabaaaacaaaaaadgaaaaafccaabaaaacaaaaaa
akaabaaaadaaaaaaapaaaaahbcaabaaaadaaaaaaogakbaaaabaaaaaajgafbaaa
acaaaaaaenaaaaaibcaabaaaacaaaaaaaanaaaaabkiacaiaebaaaaaaaaaaaaaa
ahaaaaaaapaaaaahccaabaaaadaaaaaaogakbaaaabaaaaaaegaabaaaacaaaaaa
dcaaaaamdccabaaaacaaaaaaegaabaaaadaaaaaaaceaaaaamnmmemdomnmmemdo
aaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaa
egaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaa
abaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaa
abaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
dkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
cmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaa
adaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaa
abaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaa
egiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaa
adaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaa
agaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaa
egaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaa
eeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaa
egaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
abaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaa
abaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R3.xyz, R0.w, R1;
MUL R2.xyz, R2, R3;
MUL R2.xyz, R2, c[2].y;
MAD R0.xyz, R0, R1, R2;
MUL R1.xyz, R0, fragment.texcoord[4];
MUL R0.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[3].z, c[2].x;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[2].y, R1;
ADD result.color.xyz, R0, c[1];
MOV result.color.w, c[2].z;
END
# 14 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r0, t2, s2
texld r1, t1, s1
texld r2, t0, s0
mul_pp r3.xyz, r2.w, r1
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c2.y
mad_pp r0.xyz, r2, r1, r0
mul_pp r1.xyz, r0, t4
mul_pp r0.xyz, r0, c0
max_pp r2.x, t3.z, c2
mul_pp r0.xyz, r2.x, r0
mad_pp r0.xyz, r0, c2.y, r1
mov_pp r0.w, c2.z
add_pp r0.xyz, r0, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Vector 64 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedoekhnddlhelkoelfipcldepmmomebnmmabaaaaaafeafaaaaaeaaaaaa
daaaaaaapaabaaaagiaeaaaacaafaaaaebgpgodjliabaaaaliabaaaaaaacpppp
haabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaabaaaaacaaaaadiaaaaabllaecaaaaad
abaacpiaabaaoelaacaioekaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaad
acaacpiaaaaaoelaaaaioekaafaaaaadadaachiaaaaaoeiaacaappiaafaaaaad
abaachiaabaaoeiaadaaoeiaacaaaaadabaachiaabaaoeiaabaaoeiaaeaaaaae
aaaachiaacaaoeiaaaaaoeiaabaaoeiaafaaaaadabaachiaaaaaoeiaaaaaoeka
afaaaaadaaaachiaaaaaoeiaadaaoelaalaaaaadaaaaciiaacaakklaacaaaaka
acaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachiaabaaoeiaaaaappia
aaaaoeiaacaaaaadaaaachiaaaaaoeiaabaaoekaabaaaaacaaaaciiaacaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefchaacaaaaeaaaaaaajmaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaa
ckbabaaaadaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaaihccabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaeaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[2], 2D;
TXP R3.x, fragment.texcoord[5], texture[3], 2D;
MUL R3.yzw, R0.w, R1.xxyz;
MUL R2.xyz, R2, R3.yzww;
MUL R2.xyz, R2, c[2].y;
MAD R1.xyz, R0, R1, R2;
MUL R0.xyz, R1, fragment.texcoord[4];
MAX R0.w, fragment.texcoord[3].z, c[2].x;
MUL R1.xyz, R1, c[0];
MUL R0.w, R0, R3.x;
MUL R1.xyz, R0.w, R1;
MAD R0.xyz, R1, c[2].y, R0;
ADD result.color.xyz, R0, c[1];
MOV result.color.w, c[2].z;
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_FeedbackColor]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_ShadowMapTexture] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.00000000, 2.00000000, 1.00000000, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r0, t2, s2
texldp r4, t5, s3
texld r1, t1, s1
texld r2, t0, s0
mul_pp r3.xyz, r2.w, r1
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c2.y
mad_pp r0.xyz, r2, r1, r0
mul_pp r2.xyz, r0, t4
mul_pp r1.xyz, r0, c0
max_pp r0.x, t3.z, c2
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r1
mad_pp r0.xyz, r0, c2.y, r2
mov_pp r0.w, c2.z
add_pp r0.xyz, r0, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Matcap] 2D 3
SetTexture 3 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 128 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcpbklpkdnghmnkjbblekjhicdklcpdicabaaaaaadaagaaaaaeaaaaaa
daaaaaaaemacaaaacmafaaaapmafaaaaebgpgodjbeacaaaabeacaaaaaaacpppp
miabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaadaaaaaa
aaababaaabacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaaiaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajaadaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadia
aaaappiaaeaaoelaabaaaaacabaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadacaacpiaabaaoelaadaioekaecaaaaadabaacpiaabaaoeia
acaioekaecaaaaadadaacpiaaaaaoelaabaioekaafaaaaadabaaciiaaaaaaaia
acaakklafiaaaaaeabaaciiaacaakklaabaappiaacaaaakaacaaaaadabaaciia
abaappiaabaappiaafaaaaadaaaachiaabaaoeiaadaappiaafaaaaadaaaachia
aaaaoeiaacaaoeiaacaaaaadaaaachiaaaaaoeiaaaaaoeiaaeaaaaaeaaaachia
adaaoeiaabaaoeiaaaaaoeiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaaaaaoeiaadaaoelaaeaaaaaeaaaachiaabaaoeiaabaappiaaaaaoeia
acaaaaadaaaachiaaaaaoeiaabaaoekaabaaaaacaaaaciiaacaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcniacaaaaeaaaaaaalgaaaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaa
gcbaaaadecbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadeaaaaahccaabaaa
aaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
adaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaapgapbaaaacaaaaaaagajbaaaadaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaaaaaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaaagajbaaa
acaaaaaaagajbaaaadaaaaaafgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
jgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaaaaaaaaaihccabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaiadpdoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry+11" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
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
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Float 24 [_DetailAngle]
Float 25 [_ScrollVelocityX]
Float 26 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[31] = { { 0.15915491, 0, 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26],
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0];
MUL R0.x, R0, c[24];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[30].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[0].yzww;
MUL R2.xyz, R1, R1;
MAD R3.xyz, R2, c[27].xyxw, c[27].zwzw;
MAD R3.xyz, R3, R2, c[28].xyxw;
MAD R3.xyz, R3, R2, c[28].zwzw;
ADD R0.xyz, -R1.w, c[0].yzww;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[27].xyxw, c[27].zwzw;
MAD R1.xyz, R1, R0, c[28].xyxw;
MAD R1.xyz, R1, R0, c[28].zwzw;
MAD R1.xyz, R1, R0, c[29].xyxw;
MAD R3.xyz, R3, R2, c[29].xyxw;
MAD R1.xyz, R1, R0, c[29].zwzw;
SLT R4.x, R1.w, c[30].z;
SGE R4.yz, R1.w, c[30].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[29].zwzw;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[29].zwzw;
SGE R2.yz, R0.w, c[30].xxyw;
SLT R2.x, R0.w, c[30].z;
DP3 R3.y, R2, c[29].zwzw;
MOV R3.xz, R2;
MOV R0.w, R0.y;
MOV R1.w, c[26].x;
DP3 R0.z, R1, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R0.xy, R0.z, R0, R1;
MOV R1.xyz, vertex.attrib[14];
MOV R2.y, c[0];
MUL R2.x, R1.w, c[0].z;
MOV R0.w, c[0].y;
MOV R0.z, c[25].x;
MUL R0.zw, R0, c[21].y;
FRC R0.zw, R0;
MAD R0.zw, R0, c[26].x, -R2.xyxy;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
MAD result.texcoord[2].xy, R0, c[30].w, R0.zwzw;
MOV R0, c[22];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
Float 23 [_DetailAngle]
Float 24 [_ScrollVelocityX]
Float 25 [_ScrollDelay]
"vs_2_0
def c26, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c27, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c28, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c29, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r1, c12
mov r0, c14
dp4 r2.z, c21, r0
mov r0, c13
dp4 r2.y, c21, r0
dp4 r2.x, c21, r1
mad r1.xyz, r2, c22.w, -v0
mov r0.xyz, v1
mov r0.w, c23.x
mad r0.w, r0, c26.x, c26.y
frc r0.w, r0
mad r1.w, r0, c26.z, c26
mov r2.xyz, v1
mul r0.xyz, v2.zxyw, r0.yzxw
mad r0.xyz, v2.yzxw, r2.zxyw, -r0
mul r0.xyz, r0, v1.w
dp3 oT3.y, r1, r0
sincos r0.xy, r1.w, c27.xyzw, c28.xyzw
dp3 r1.w, v2, c5
mov r0.w, c29.y
mov r0.z, c24.x
mul r0.zw, r0, c20.y
frc r2.xy, r0.zwzw
mov r0.z, c26.y
mov r0.w, c29.y
mul r0.z, c25.x, r0
mad r2.xy, r2, c25.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.w, r0.yxzw
dp3 r1.w, v2, c4
mad r0.xy, r1.w, r0.zwzw, r0
mad oT2.xy, r0, c29.x, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp3 oT3.z, v2, r1
dp3 oT3.x, r1, v1
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjhgeagmlepblklgpepdifiachbnkoaafabaaaaaaceamaaaaaeaaaaaa
daaaaaaageaeaaaakeakaaaagmalaaaaebgpgodjcmaeaaaacmaeaaaaaaacpopp
lmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaaaaaaaaaaadaaamaaajaaapaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkaaaaaaadpaaaaaaaaidpjccdo
mnmmemdofbaaaaafbjaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
bkaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafblaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaaoiaafaaoekaafaaaaadabaaabiaaaaakkia
agaaffkaabaaaaacabaaaciabiaaffkabdaaaaacaaaaafiaabaaneiaafaaaaad
abaaadiaaaaappiabiaaoekaaeaaaaaeaaaaafiaafaappkaaaaaoeiaabaaneib
aeaaaaaeaaaaaciaaaaaffiabiaakkkabiaaaakabdaaaaacaaaaaciaaaaaffia
aeaaaaaeaaaaaciaaaaaffiabjaaaakabjaaffkacfaaaaaeabaaadiaaaaaffia
bkaaoekablaaoekaafaaaaadacaaahiaacaaffjaanaanekaaeaaaaaeacaaahia
amaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiaaoaanekaacaakkjaacaaoeia
afaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffib
abaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeia
biaappkaaaaaoiiaabaaaaacaaaaapiaahaaoekaafaaaaadabaaahiaaaaaffia
beaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbaiaaaaadacaaaboaabaaoeja
aaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjja
aeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeia
abaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaaeaaaaapiaapaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
ppppaaaafdeieefcdiagaaaaeaaaabaaioabaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaajbcaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaabkiacaaa
abaaaaaaaaaaaaaadgaaaaaikcaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaadpdcaaaaal
dcaabaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegaabaaaaaaaaaaaogakbaia
ebaaaaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaafgbfbaaaacaaaaaaagiecaaa
adaaaaaaajaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaaiaaaaaa
agbabaaaacaaaaaakgaobaaaaaaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaa
adaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaaaaaaaaaaenaaaaaibcaabaaa
abaaaaaabcaabaaaacaaaaaabkiacaaaaaaaaaaaahaaaaaadgaaaaafecaabaaa
abaaaaaaakaabaaaabaaaaaadgaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaa
apaaaaahbcaabaaaacaaaaaaogakbaaaaaaaaaaajgafbaaaabaaaaaaenaaaaai
bcaabaaaabaaaaaaaanaaaaabkiacaiaebaaaaaaaaaaaaaaahaaaaaaapaaaaah
ccaabaaaacaaaaaaogakbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaamdccabaaa
acaaaaaaegaabaaaacaaaaaaaceaaaaamnmmemdomnmmemdoaaaaaaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Float 15 [_DetailAngle]
Float 16 [_ScrollVelocityX]
Float 17 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[22] = { { 0.5, 24.980801, -24.980801, 0.15915491 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..17],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
MUL R0.x, R0, c[15];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[21].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[18];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].yzyw;
ADD R0.xyz, -R1.w, c[18];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].yzyw;
ADD R1.xyz, R1, c[19].xyxw;
MAD R1.xyz, R1, R0, c[19].zwzw;
MAD R1.xyz, R1, R0, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
ADD R3.xyz, R3, c[19].xyxw;
MAD R3.xyz, R3, R2, c[19].zwzw;
MAD R3.xyz, R3, R2, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R1.xyz, R1, R0, c[18].wzww;
SLT R4.x, R1.w, c[21].z;
SGE R4.yz, R1.w, c[21].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[18].wzww;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[18].wzww;
SGE R2.yz, R0.w, c[21].xxyw;
SLT R2.x, R0.w, c[21].z;
MOV R0.w, R0.y;
MOV R3.xz, R2;
DP3 R3.y, R2, c[18].wzww;
DP3 R0.z, R1, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R2.xy, R0.z, R0, R1;
MOV R0.z, c[17].x;
MOV R1.xyz, vertex.attrib[14];
MUL R0.z, R0, c[0].x;
MOV R0.y, c[18].x;
MOV R0.x, c[16];
MUL R0.xy, R0, c[13].y;
FRC R0.xy, R0;
MOV R0.w, c[18].x;
MAD R2.zw, R0.xyxy, c[17].x, -R0;
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MAD result.texcoord[2].xy, R2, c[21].w, R2.zwzw;
MOV R1, c[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R2, R0;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 63 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceLightPos0]
Float 14 [_DetailAngle]
Float 15 [_ScrollVelocityX]
Float 16 [_ScrollDelay]
"vs_2_0
def c17, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c18, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c19, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c20, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r2.z, c13, r0
mov r0, c9
dp4 r2.y, c13, r0
mov r0, c8
dp4 r2.x, c13, r0
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mov r1.w, c14.x
mad r1.w, r1, c17.x, c17.y
frc r1.w, r1
mad r1.w, r1, c17.z, c17
sincos r0.xy, r1.w, c18.xyzw, c19.xyzw
dp3 r1.z, v2, c5
mov r0.w, c20.y
mov r0.z, c15.x
mul r0.zw, r0, c12.y
frc r1.xy, r0.zwzw
mov r0.z, c17.y
mov r0.w, c20.y
mul r0.z, c16.x, r0
mad r1.xy, r1, c16.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.z, r0.yxzw
dp3 r1.z, v2, c4
mad r0.xy, r1.z, r0.zwzw, r0
mad oT2.xy, r0, c20.x, r1
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 80
Float 52 [_DetailAngle]
Float 56 [_ScrollVelocityX]
Float 60 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedajipgmlnfgkdkmgjgjepeljideijdfcnabaaaaaapiajaaaaaeaaaaaa
daaaaaaaliadaaaajaaiaaaafiajaaaaebgpgodjiaadaaaaiaadaaaaaaacpopp
baadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaaiaaadaaaiaaaaaaaaaaadaabaaaaeaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafapaaapkaaaaaaadpaaaaaaaaidpjccdo
mnmmemdofbaaaaafbaaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
bbaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafbcaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaaoiaabaaoekaafaaaaadabaaabiaaaaakkia
acaaffkaabaaaaacabaaaciaapaaffkabdaaaaacaaaaafiaabaaneiaafaaaaad
abaaadiaaaaappiaapaaoekaaeaaaaaeaaaaafiaabaappkaaaaaoeiaabaaneib
aeaaaaaeaaaaaciaaaaaffiaapaakkkaapaaaakabdaaaaacaaaaaciaaaaaffia
aeaaaaaeaaaaaciaaaaaffiabaaaaakabaaaffkacfaaaaaeabaaadiaaaaaffia
bbaaoekabcaaoekaafaaaaadacaaahiaacaaffjaajaanekaaeaaaaaeacaaahia
aiaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiaakaanekaacaakkjaacaaoeia
afaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffib
abaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeia
apaappkaaaaaoiiaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahiaaaaaffia
amaaoekaaeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
anaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappiaaaaaoeia
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaafaaoeka
aeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcnaaeaaaa
eaaaabaadeabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaajbcaabaaaaaaaaaaackiacaaaaaaaaaaa
adaaaaaabkiacaaaabaaaaaaaaaaaaaadgaaaaaikcaabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaa
aaaaaaaadiaaaaaiecaabaaaaaaaaaaadkiacaaaaaaaaaaaadaaaaaaabeaaaaa
aaaaaadpdcaaaaaldcaabaaaaaaaaaaapgipcaaaaaaaaaaaadaaaaaaegaabaaa
aaaaaaaaogakbaiaebaaaaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaafgbfbaaa
acaaaaaaagiecaaaadaaaaaaajaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaa
adaaaaaaaiaaaaaaagbabaaaacaaaaaakgaobaaaaaaaaaaadcaaaaakmcaabaaa
aaaaaaaaagiecaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaaaaaaaaaa
enaaaaaibcaabaaaabaaaaaabcaabaaaacaaaaaabkiacaaaaaaaaaaaadaaaaaa
dgaaaaafecaabaaaabaaaaaaakaabaaaabaaaaaadgaaaaafccaabaaaabaaaaaa
akaabaaaacaaaaaaapaaaaahbcaabaaaacaaaaaaogakbaaaaaaaaaaajgafbaaa
abaaaaaaenaaaaaibcaabaaaabaaaaaaaanaaaaabkiacaiaebaaaaaaaaaaaaaa
adaaaaaaapaaaaahccaabaaaacaaaaaaogakbaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaamdccabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaamnmmemdomnmmemdo
aaaaaaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
acaaaaaaaaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bdaaaaaapgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaa
adaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Float 24 [_DetailAngle]
Float 25 [_ScrollVelocityX]
Float 26 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[31] = { { 0.15915491, 0, 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26],
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0];
MUL R0.x, R0, c[24];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[30].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[0].yzww;
MUL R2.xyz, R1, R1;
MAD R3.xyz, R2, c[27].xyxw, c[27].zwzw;
MAD R3.xyz, R3, R2, c[28].xyxw;
MAD R3.xyz, R3, R2, c[28].zwzw;
ADD R0.xyz, -R1.w, c[0].yzww;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[27].xyxw, c[27].zwzw;
MAD R1.xyz, R1, R0, c[28].xyxw;
MAD R1.xyz, R1, R0, c[28].zwzw;
MAD R1.xyz, R1, R0, c[29].xyxw;
MAD R3.xyz, R3, R2, c[29].xyxw;
MAD R1.xyz, R1, R0, c[29].zwzw;
SLT R4.x, R1.w, c[30].z;
SGE R4.yz, R1.w, c[30].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[29].zwzw;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[29].zwzw;
SGE R2.yz, R0.w, c[30].xxyw;
SLT R2.x, R0.w, c[30].z;
DP3 R3.y, R2, c[29].zwzw;
MOV R3.xz, R2;
MOV R0.w, R0.y;
MOV R1.w, c[26].x;
DP3 R0.z, R1, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R0.xy, R0.z, R0, R1;
MOV R1.xyz, vertex.attrib[14];
MOV R2.y, c[0];
MUL R2.x, R1.w, c[0].z;
MOV R0.w, c[0].y;
MOV R0.z, c[25].x;
MUL R0.zw, R0, c[21].y;
FRC R0.zw, R0;
MAD R0.zw, R0, c[26].x, -R2.xyxy;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
MAD result.texcoord[2].xy, R0, c[30].w, R0.zwzw;
MOV R0, c[22];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[12];
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 result.texcoord[4].w, R0, c[20];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 70 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
Float 23 [_DetailAngle]
Float 24 [_ScrollVelocityX]
Float 25 [_ScrollDelay]
"vs_2_0
def c26, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c27, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c28, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c29, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r1, c12
mov r0, c14
dp4 r2.z, c21, r0
mov r0, c13
dp4 r2.y, c21, r0
dp4 r2.x, c21, r1
mad r1.xyz, r2, c22.w, -v0
mov r0.xyz, v1
mov r0.w, c23.x
mad r0.w, r0, c26.x, c26.y
frc r0.w, r0
mad r1.w, r0, c26.z, c26
mov r2.xyz, v1
mul r0.xyz, v2.zxyw, r0.yzxw
mad r0.xyz, v2.yzxw, r2.zxyw, -r0
mul r0.xyz, r0, v1.w
dp3 oT3.y, r1, r0
sincos r0.xy, r1.w, c27.xyzw, c28.xyzw
dp3 r1.w, v2, c5
mov r0.w, c29.y
mov r0.z, c24.x
mul r0.zw, r0, c20.y
frc r2.xy, r0.zwzw
mov r0.z, c26.y
mov r0.w, c29.y
mul r0.z, c25.x, r0
mad r2.xy, r2, c25.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.w, r0.yxzw
dp3 r1.w, v2, c4
mad r0.xy, r1.w, r0.zwzw, r0
mad oT2.xy, r0, c29.x, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp3 oT3.z, v2, r1
dp3 oT3.x, r1, v1
dp4 oT4.w, r0, c19
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedoldiecgpgkmcgmblnpfphajapchcfdkfabaaaaaaceamaaaaaeaaaaaa
daaaaaaageaeaaaakeakaaaagmalaaaaebgpgodjcmaeaaaacmaeaaaaaaacpopp
lmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaaaaaaaaaaadaaamaaajaaapaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkaaaaaaadpaaaaaaaaidpjccdo
mnmmemdofbaaaaafbjaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
bkaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafblaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaaoiaafaaoekaafaaaaadabaaabiaaaaakkia
agaaffkaabaaaaacabaaaciabiaaffkabdaaaaacaaaaafiaabaaneiaafaaaaad
abaaadiaaaaappiabiaaoekaaeaaaaaeaaaaafiaafaappkaaaaaoeiaabaaneib
aeaaaaaeaaaaaciaaaaaffiabiaakkkabiaaaakabdaaaaacaaaaaciaaaaaffia
aeaaaaaeaaaaaciaaaaaffiabjaaaakabjaaffkacfaaaaaeabaaadiaaaaaffia
bkaaoekablaaoekaafaaaaadacaaahiaacaaffjaanaanekaaeaaaaaeacaaahia
amaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiaaoaanekaacaakkjaacaaoeia
afaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffib
abaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeia
biaappkaaaaaoiiaabaaaaacaaaaapiaahaaoekaafaaaaadabaaahiaaaaaffia
beaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbaiaaaaadacaaaboaabaaoeja
aaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjja
aeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeia
abaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaaeaaaaapiaapaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoeka
aeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeadaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaad
aaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
ppppaaaafdeieefcdiagaaaaeaaaabaaioabaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaajbcaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaabkiacaaa
abaaaaaaaaaaaaaadgaaaaaikcaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaadpdcaaaaal
dcaabaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegaabaaaaaaaaaaaogakbaia
ebaaaaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaafgbfbaaaacaaaaaaagiecaaa
adaaaaaaajaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaaiaaaaaa
agbabaaaacaaaaaakgaobaaaaaaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaa
adaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaaaaaaaaaaenaaaaaibcaabaaa
abaaaaaabcaabaaaacaaaaaabkiacaaaaaaaaaaaahaaaaaadgaaaaafecaabaaa
abaaaaaaakaabaaaabaaaaaadgaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaa
apaaaaahbcaabaaaacaaaaaaogakbaaaaaaaaaaajgafbaaaabaaaaaaenaaaaai
bcaabaaaabaaaaaaaanaaaaabkiacaiaebaaaaaaaaaaaaaaahaaaaaaapaaaaah
ccaabaaaacaaaaaaogakbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaamdccabaaa
acaaaaaaegaabaaaacaaaaaaaceaaaaamnmmemdomnmmemdoaaaaaaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aeaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceLightPos0]
Vector 23 [unity_Scale]
Float 24 [_DetailAngle]
Float 25 [_ScrollVelocityX]
Float 26 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[31] = { { 0.15915491, 0, 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26],
		{ 24.980801, -24.980801, -60.145809, 60.145809 },
		{ 85.453789, -85.453789, -64.939346, 64.939346 },
		{ 19.73921, -19.73921, -1, 1 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0];
MUL R0.x, R0, c[24];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[30].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[0].yzww;
MUL R2.xyz, R1, R1;
MAD R3.xyz, R2, c[27].xyxw, c[27].zwzw;
MAD R3.xyz, R3, R2, c[28].xyxw;
MAD R3.xyz, R3, R2, c[28].zwzw;
ADD R0.xyz, -R1.w, c[0].yzww;
MUL R0.xyz, R0, R0;
MAD R1.xyz, R0, c[27].xyxw, c[27].zwzw;
MAD R1.xyz, R1, R0, c[28].xyxw;
MAD R1.xyz, R1, R0, c[28].zwzw;
MAD R1.xyz, R1, R0, c[29].xyxw;
MAD R3.xyz, R3, R2, c[29].xyxw;
MAD R1.xyz, R1, R0, c[29].zwzw;
SLT R4.x, R1.w, c[30].z;
SGE R4.yz, R1.w, c[30].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[29].zwzw;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[29].zwzw;
SGE R2.yz, R0.w, c[30].xxyw;
SLT R2.x, R0.w, c[30].z;
DP3 R3.y, R2, c[29].zwzw;
MOV R3.xz, R2;
MOV R0.w, R0.y;
MOV R1.w, c[26].x;
DP3 R0.z, R1, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R0.xy, R0.z, R0, R1;
MOV R1.xyz, vertex.attrib[14];
MOV R2.y, c[0];
MUL R2.x, R1.w, c[0].z;
MOV R0.w, c[0].y;
MOV R0.z, c[25].x;
MUL R0.zw, R0, c[21].y;
FRC R0.zw, R0;
MAD R0.zw, R0, c[26].x, -R2.xyxy;
MUL R2.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R2;
MAD result.texcoord[2].xy, R0, c[30].w, R0.zwzw;
MOV R0, c[22];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
Float 23 [_DetailAngle]
Float 24 [_ScrollVelocityX]
Float 25 [_ScrollDelay]
"vs_2_0
def c26, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c27, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c28, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c29, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r1, c12
mov r0, c14
dp4 r2.z, c21, r0
mov r0, c13
dp4 r2.y, c21, r0
dp4 r2.x, c21, r1
mad r1.xyz, r2, c22.w, -v0
mov r0.xyz, v1
mov r0.w, c23.x
mad r0.w, r0, c26.x, c26.y
frc r0.w, r0
mad r1.w, r0, c26.z, c26
mov r2.xyz, v1
mul r0.xyz, v2.zxyw, r0.yzxw
mad r0.xyz, v2.yzxw, r2.zxyw, -r0
mul r0.xyz, r0, v1.w
dp3 oT3.y, r1, r0
sincos r0.xy, r1.w, c27.xyzw, c28.xyzw
dp3 r1.w, v2, c5
mov r0.w, c29.y
mov r0.z, c24.x
mul r0.zw, r0, c20.y
frc r2.xy, r0.zwzw
mov r0.z, c26.y
mov r0.w, c29.y
mul r0.z, c25.x, r0
mad r2.xy, r2, c25.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.w, r0.yxzw
dp3 r1.w, v2, c4
mad r0.xy, r1.w, r0.zwzw, r0
mad oT2.xy, r0, c29.x, r2
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp3 oT3.z, v2, r1
dp3 oT3.x, r1, v1
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjhgeagmlepblklgpepdifiachbnkoaafabaaaaaaceamaaaaaeaaaaaa
daaaaaaageaeaaaakeakaaaagmalaaaaebgpgodjcmaeaaaacmaeaaaaaaacpopp
lmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaaaaaaaaaaadaaamaaajaaapaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkaaaaaaadpaaaaaaaaidpjccdo
mnmmemdofbaaaaafbjaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
bkaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafblaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaaoiaafaaoekaafaaaaadabaaabiaaaaakkia
agaaffkaabaaaaacabaaaciabiaaffkabdaaaaacaaaaafiaabaaneiaafaaaaad
abaaadiaaaaappiabiaaoekaaeaaaaaeaaaaafiaafaappkaaaaaoeiaabaaneib
aeaaaaaeaaaaaciaaaaaffiabiaakkkabiaaaakabdaaaaacaaaaaciaaaaaffia
aeaaaaaeaaaaaciaaaaaffiabjaaaakabjaaffkacfaaaaaeabaaadiaaaaaffia
bkaaoekablaaoekaafaaaaadacaaahiaacaaffjaanaanekaaeaaaaaeacaaahia
amaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiaaoaanekaacaakkjaacaaoeia
afaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffib
abaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeia
biaappkaaaaaoiiaabaaaaacaaaaapiaahaaoekaafaaaaadabaaahiaaaaaffia
beaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappiaaaaaoeia
aeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbaiaaaaadacaaaboaabaaoeja
aaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjja
aeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeia
abaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoeja
aaaaoeiaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaaeaaaaapiaapaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoeka
aeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoeka
aaaakkiaabaaoeiaaeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
ppppaaaafdeieefcdiagaaaaeaaaabaaioabaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaajbcaabaaaaaaaaaaackiacaaaaaaaaaaaahaaaaaabkiacaaa
abaaaaaaaaaaaaaadgaaaaaikcaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaai
ecaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaaabeaaaaaaaaaaadpdcaaaaal
dcaabaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaaegaabaaaaaaaaaaaogakbaia
ebaaaaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaafgbfbaaaacaaaaaaagiecaaa
adaaaaaaajaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaaadaaaaaaaiaaaaaa
agbabaaaacaaaaaakgaobaaaaaaaaaaadcaaaaakmcaabaaaaaaaaaaaagiecaaa
adaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaaaaaaaaaaenaaaaaibcaabaaa
abaaaaaabcaabaaaacaaaaaabkiacaaaaaaaaaaaahaaaaaadgaaaaafecaabaaa
abaaaaaaakaabaaaabaaaaaadgaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaa
apaaaaahbcaabaaaacaaaaaaogakbaaaaaaaaaaajgafbaaaabaaaaaaenaaaaai
bcaabaaaabaaaaaaaanaaaaabkiacaiaebaaaaaaaaaaaaaaahaaaaaaapaaaaah
ccaabaaaacaaaaaaogakbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaamdccabaaa
acaaaaaaegaabaaaacaaaaaaaceaaaaamnmmemdomnmmemdoaaaaaaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaa
abaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Matrix 17 [_LightMatrix0]
Vector 21 [_Time]
Vector 22 [_WorldSpaceLightPos0]
Float 23 [_DetailAngle]
Float 24 [_ScrollVelocityX]
Float 25 [_ScrollDelay]
"!!ARBvp1.0
PARAM c[30] = { { 0.5, 24.980801, -24.980801, 0.15915491 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..25],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75, 0.25, 0.2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.x, c[0].w;
MUL R0.x, R0, c[23];
FRC R1.w, R0.x;
ADD R0.y, R0.x, -c[29].z;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[26];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].yzyw;
ADD R0.xyz, -R1.w, c[26];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].yzyw;
ADD R1.xyz, R1, c[27].xyxw;
MAD R1.xyz, R1, R0, c[27].zwzw;
MAD R1.xyz, R1, R0, c[28].xyxw;
MAD R1.xyz, R1, R0, c[28].zwzw;
ADD R3.xyz, R3, c[27].xyxw;
MAD R3.xyz, R3, R2, c[27].zwzw;
MAD R3.xyz, R3, R2, c[28].xyxw;
MAD R3.xyz, R3, R2, c[28].zwzw;
MAD R1.xyz, R1, R0, c[26].wzww;
SLT R4.x, R1.w, c[29].z;
SGE R4.yz, R1.w, c[29].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[26].wzww;
DP3 R0.xy, R1, -R0;
MAD R1.xyz, R3, R2, c[26].wzww;
SGE R2.yz, R0.w, c[29].xxyw;
SLT R2.x, R0.w, c[29].z;
MOV R0.w, R0.y;
MOV R3.xz, R2;
DP3 R3.y, R2, c[26].wzww;
DP3 R0.z, R1, -R3;
DP3 R0.y, vertex.normal, c[6];
MUL R1.xy, R0.y, R0.zwzw;
MOV R0.y, -R0.z;
DP3 R0.z, vertex.normal, c[5];
MAD R2.xy, R0.z, R0, R1;
MOV R0.z, c[25].x;
MOV R1.xyz, vertex.attrib[14];
MOV R0.w, c[26].x;
MUL R0.z, R0, c[0].x;
MOV R0.y, c[26].x;
MOV R0.x, c[24];
MUL R0.xy, R0, c[21].y;
FRC R0.xy, R0;
MAD R2.zw, R0.xyxy, c[25].x, -R0;
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MAD result.texcoord[2].xy, R2, c[29].w, R2.zwzw;
MOV R1, c[22];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Matrix 16 [_LightMatrix0]
Vector 20 [_Time]
Vector 21 [_WorldSpaceLightPos0]
Float 22 [_DetailAngle]
Float 23 [_ScrollVelocityX]
Float 24 [_ScrollDelay]
"vs_2_0
def c25, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c26, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c27, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c28, 0.20000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r2.z, c21, r0
mov r0, c13
dp4 r2.y, c21, r0
mov r0, c12
dp4 r2.x, c21, r0
mul r1.xyz, r1, v1.w
dp3 oT3.y, r2, r1
mov r1.w, c22.x
mad r1.w, r1, c25.x, c25.y
frc r1.w, r1
mad r1.w, r1, c25.z, c25
sincos r0.xy, r1.w, c26.xyzw, c27.xyzw
dp3 r1.z, v2, c5
mov r0.w, c28.y
mov r0.z, c23.x
mul r0.zw, r0, c20.y
frc r1.xy, r0.zwzw
mov r0.z, c25.y
mov r0.w, c28.y
mul r0.z, c24.x, r0
mad r1.xy, r1, c24.x, -r0.zwzw
mov r0.z, r0.x
mov r0.w, -r0.y
mul r0.xy, r1.z, r0.yxzw
dp3 r1.z, v2, c4
mad r0.xy, r1.z, r0.zwzw, r0
mad oT2.xy, r0, c28.x, r1
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp3 oT3.z, v2, r2
dp3 oT3.x, r2, v1
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Float 116 [_DetailAngle]
Float 120 [_ScrollVelocityX]
Float 124 [_ScrollDelay]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedbjhhcdbcpoepcjhjmhnfjhlgfbahlldfabaaaaaaoealaaaaaeaaaaaa
daaaaaaafaaeaaaageakaaaacmalaaaaebgpgodjbiaeaaaabiaeaaaaaaacpopp
kiadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaaaaaaaaaaadaaamaaaiaaapaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaaaaaidpjccdo
mnmmemdofbaaaaafbiaaapkanlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaaf
bjaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafbkaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaabaaaaacaaaaaoiaafaaoekaafaaaaadabaaabiaaaaakkia
agaaffkaabaaaaacabaaaciabhaaffkabdaaaaacaaaaafiaabaaneiaafaaaaad
abaaadiaaaaappiabhaaoekaaeaaaaaeaaaaafiaafaappkaaaaaoeiaabaaneib
aeaaaaaeaaaaaciaaaaaffiabhaakkkabhaaaakabdaaaaacaaaaaciaaaaaffia
aeaaaaaeaaaaaciaaaaaffiabiaaaakabiaaffkacfaaaaaeabaaadiaaaaaffia
bjaaoekabkaaoekaafaaaaadacaaahiaacaaffjaanaanekaaeaaaaaeacaaahia
amaanekaacaaaajaacaaoeiaaeaaaaaeacaaahiaaoaanekaacaakkjaacaaoeia
afaaaaadabaaaniaabaabeiaacaajeiaaeaaaaaeacaaaciaacaaaaiaabaaffib
abaappiaacaaaaadacaaabiaabaakkiaabaaaaiaaeaaaaaeabaaadoaacaaoeia
bhaappkaaaaaoiiaabaaaaacaaaaapiaahaaoekaafaaaaadabaaahiaaaaaffia
beaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
bfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappiaaaaaoeia
aiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaad
acaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeib
afaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeia
aiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjabaaaoeka
aeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaad
abaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaiaabaaoeia
aeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeabaaamoaaeaabeka
aaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoeja
abaaaaacaaaaamoaaeaabejappppaaaafdeieefcamagaaaaeaaaabaaidabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaajbcaabaaaaaaaaaaackiacaaa
aaaaaaaaahaaaaaabkiacaaaabaaaaaaaaaaaaaadgaaaaaikcaabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabkaaaaafdcaabaaaaaaaaaaa
egaabaaaaaaaaaaadiaaaaaiecaabaaaaaaaaaaadkiacaaaaaaaaaaaahaaaaaa
abeaaaaaaaaaaadpdcaaaaaldcaabaaaaaaaaaaapgipcaaaaaaaaaaaahaaaaaa
egaabaaaaaaaaaaaogakbaiaebaaaaaaaaaaaaaadiaaaaaimcaabaaaaaaaaaaa
fgbfbaaaacaaaaaaagiecaaaadaaaaaaajaaaaaadcaaaaakmcaabaaaaaaaaaaa
agiecaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaakgaobaaaaaaaaaaadcaaaaak
mcaabaaaaaaaaaaaagiecaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaakgaobaaa
aaaaaaaaenaaaaaibcaabaaaabaaaaaabcaabaaaacaaaaaabkiacaaaaaaaaaaa
ahaaaaaadgaaaaafecaabaaaabaaaaaaakaabaaaabaaaaaadgaaaaafccaabaaa
abaaaaaaakaabaaaacaaaaaaapaaaaahbcaabaaaacaaaaaaogakbaaaaaaaaaaa
jgafbaaaabaaaaaaenaaaaaibcaabaaaabaaaaaaaanaaaaabkiacaiaebaaaaaa
aaaaaaaaahaaaaaaapaaaaahccaabaaaacaaaaaaogakbaaaaaaaaaaaegaabaaa
abaaaaaadcaaaaamdccabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaamnmmemdo
mnmmemdoaaaaaaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaak
mccabaaaacaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaaacaaaaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaacaaaaaaamadaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R3.xyz, R0.w, R1;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R2.xyz, R2, R3;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
MUL R2.xyz, R2, c[1].y;
RSQ R0.w, R0.w;
MAD R0.xyz, R0, R1, R2;
MUL R0.w, R0, fragment.texcoord[3].z;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[1].x;
MOV result.color.w, c[1].x;
TEX R1.w, R1.w, texture[3], 2D;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 18 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r1, t1, s1
texld r2, t0, s0
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mul_pp r3.xyz, r2.w, r1
texld r4, r0, s3
texld r0, t2, s2
mul_pp r0.xyz, r0, r3
mul_pp r3.xyz, r0, c1.x
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
mad_pp r1.xyz, r2, r1, r3
max_pp r0.x, r0.z, c1.y
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Matcap] 2D 3
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddipeffcjkdklcchoffhlelafhndcjadeabaaaaaaaeagaaaaaeaaaaaa
daaaaaaadmacaaaabiafaaaanaafaaaaebgpgodjaeacaaaaaeacaaaaaaacpppp
meabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaadaaaaaa
aaababaaabacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaabaaaaacaaaaadiaaaaablla
aiaaaaadabaaaiiaadaaoelaadaaoelaabaaaaacabaaadiaabaappiaecaaaaad
acaacpiaabaaoelaadaioekaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaad
adaacpiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaaaaioekaafaaaaad
abaacoiaaaaabliaadaappiaafaaaaadabaacoiaabaaoeiaacaabliaacaaaaad
abaacoiaabaaoeiaabaaoeiaaeaaaaaeaaaachiaadaaoeiaaaaaoeiaabaablia
afaaaaadaaaachiaaaaaoeiaaaaaoekaaiaaaaadaaaaciiaacaaoelaacaaoela
ahaaaaacaaaaciiaaaaappiaafaaaaadaaaaciiaaaaappiaacaakklaafaaaaad
abaacbiaabaaaaiaaaaappiafiaaaaaeaaaaciiaaaaappiaabaaaaiaabaaaaka
acaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeia
abaaaaacaaaaaiiaabaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
neacaaaaeaaaaaaalfaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaadiaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaa
acaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
baaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaackbabaaaadaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R3.xyz, R0.w, R1;
MUL R2.xyz, R2, R3;
MUL R2.xyz, R2, c[1].y;
MAD R0.xyz, R0, R1, R2;
MUL R0.xyz, R0, c[0];
MAX R0.w, fragment.texcoord[3].z, c[1].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 12 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
texld r0, t2, s2
texld r1, t1, s1
texld r2, t0, s0
mul_pp r3.xyz, r2.w, r1
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c1.x
mad_pp r0.xyz, r2, r1, r0
mul_pp r0.xyz, r0, c0
max_pp r1.x, t3.z, c1.y
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjgmaagifmfdbnppilagionfmiplocdgfabaaaaaalaaeaaaaaeaaaaaa
daaaaaaaleabaaaanmadaaaahmaeaaaaebgpgodjhmabaaaahmabaaaaaaacpppp
eaabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaadlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaabaaaaacaaaaadia
aaaabllaecaaaaadabaacpiaabaaoelaacaioekaecaaaaadaaaacpiaaaaaoeia
abaioekaecaaaaadacaacpiaaaaaoelaaaaioekaafaaaaadadaachiaaaaaoeia
acaappiaafaaaaadabaachiaabaaoeiaadaaoeiaacaaaaadabaachiaabaaoeia
abaaoeiaaeaaaaaeaaaachiaacaaoeiaaaaaoeiaabaaoeiaafaaaaadaaaachia
aaaaoeiaaaaaoekaalaaaaadaaaaciiaacaakklaabaaaakaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
abaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefccaacaaaaeaaaaaaa
iiaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
adaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaadeaaaaahicaabaaaaaaaaaaackbabaaa
adaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaeaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[2], texture[2], 2D;
RCP R0.x, fragment.texcoord[4].w;
MAD R3.xy, fragment.texcoord[4], R0.x, c[1].z;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[1].x;
TEX R0.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R1.w, R3, texture[3], 2D;
TEX R0.w, R0.w, texture[4], 2D;
MUL R3.xyz, R2.w, R0;
MUL R1.xyz, R1, R3;
MUL R1.xyz, R1, c[1].y;
MAD R0.xyz, R2, R0, R1;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R1.x;
SLT R1.y, c[1].x, fragment.texcoord[4].z;
MUL R1.y, R1, R1.w;
MUL R1.y, R1, R0.w;
MUL R1.x, R1, fragment.texcoord[3].z;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 24 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
SetTexture 4 [_LightTextureB0] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c1, 2.00000000, 0.50000000, 0.00000000, 1.00000000
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4
texld r2, t0, s0
dp3 r1.x, t4, t4
mov r1.xy, r1.x
rcp r0.x, t4.w
mad r0.xy, t4, r0.x, c1.y
texld r4, r1, s4
texld r3, r0, s3
texld r0, t2, s2
texld r1, t1, s1
mul_pp r3.xyz, r2.w, r1
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c1.x
mad_pp r0.xyz, r2, r1, r0
mul_pp r2.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
cmp r1.x, -t4.z, c1.z, c1.w
mul_pp r1.x, r1, r3.w
mul_pp r0.x, r1, r4
max_pp r1.x, r0.z, c1.z
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Matcap] 2D 4
SetTexture 3 [_LightTexture0] 2D 0
SetTexture 4 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhbnhfadnhbmfnljjpmffmdoihhkgpdbpabaaaaaafiahaaaaaeaaaaaa
daaaaaaajmacaaaagmagaaaaceahaaaaebgpgodjgeacaaaageacaaaaaaacpppp
caacaaaaeeaaaaaaabaadiaaaaaaeeaaaaaaeeaaafaaceaaaaaaeeaaadaaaaaa
aeababaaaaacacaaabadadaaacaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaacpppp
fbaaaaafabaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaagaaaaacaaaaaiiaadaapplaaeaaaaaeaaaaadiaadaaoelaaaaappia
abaaaakaaiaaaaadabaaaiiaadaaoelaadaaoelaabaaaaacabaaadiaabaappia
abaaaaacacaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaecaaaaadadaacpiaabaaoelaaeaioekaecaaaaad
acaacpiaacaaoeiaadaioekaecaaaaadaeaacpiaaaaaoelaacaioekaafaaaaad
acaaaiiaaaaappiaabaaaaiaaiaaaaadadaaciiaacaaoelaacaaoelaahaaaaac
adaaciiaadaappiaafaaaaadadaaciiaadaappiaacaakklaalaaaaadaaaacbia
adaappiaabaaffkaafaaaaadacaaciiaacaappiaaaaaaaiafiaaaaaeacaaciia
adaakklbabaaffkaacaappiaacaaaaadacaaciiaacaappiaacaappiaafaaaaad
aaaachiaacaaoeiaaeaappiaafaaaaadaaaachiaaaaaoeiaadaaoeiaacaaaaad
aaaachiaaaaaoeiaaaaaoeiaaeaaaaaeaaaachiaaeaaoeiaacaaoeiaaaaaoeia
afaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeia
abaaaaacaaaaaiiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
miadaaaaeaaaaaaapcaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadpcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaaeaaaaaapgbpbaaaaeaaaaaaaaaaaaakdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
dbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaaeaaaaaaabaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaa
aaaaaaaaeghobaaaaeaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaackbabaaaadaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaadaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaa
diaaaaahocaabaaaaaaaaaaapgapbaaaacaaaaaaagajbaaaadaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaaaaaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaa
agajbaaaacaaaaaaagajbaaaadaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R1.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R1.w, fragment.texcoord[4], texture[4], CUBE;
MUL R3.xyz, R2.w, R0;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R1.xyz, R1, R3;
MUL R1.xyz, R1, c[1].y;
MAD R0.xyz, R2, R0, R1;
DP3 R2.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.w;
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, fragment.texcoord[3].z;
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[3], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[1].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 20 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
SetTexture 4 [_LightTexture0] CUBE 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r1, t1, s1
texld r2, t0, s0
texld r3, t4, s4
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mul_pp r3.xyz, r2.w, r1
texld r4, r0, s3
texld r0, t2, s2
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c1.x
mad_pp r0.xyz, r2, r1, r0
mul_pp r1.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.z, r0.x, t3
max_pp r2.x, r0.z, c1.y
mul r0.x, r4, r3.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Matcap] 2D 4
SetTexture 3 [_LightTextureB0] 2D 1
SetTexture 4 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhpehlnjkdjkoifmccbjfoiogjlnamfcnabaaaaaaimagaaaaaeaaaaaa
daaaaaaagiacaaaakaafaaaafiagaaaaebgpgodjdaacaaaadaacaaaaaaacpppp
omabaaaaeeaaaaaaabaadiaaaaaaeeaaaaaaeeaaafaaceaaaaaaeeaaaeaaaaaa
adababaaaaacacaaabadadaaacaeaeaaaaaaabaaabaaaaaaaaaaaaaaaaacpppp
fbaaaaafabaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaaiaaaaadaaaaaiiaadaaoelaadaaoelaabaaaaacaaaaadiaaaaappia
abaaaaacabaaadiaaaaabllaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
acaaapiaadaaoelaaaaioekaecaaaaadadaacpiaabaaoelaaeaioekaecaaaaad
abaacpiaabaaoeiaadaioekaecaaaaadaeaacpiaaaaaoelaacaioekaafaaaaad
abaaciiaaaaaaaiaacaappiaaiaaaaadadaaciiaacaaoelaacaaoelaahaaaaac
adaaciiaadaappiaafaaaaadadaaciiaadaappiaacaakklaalaaaaadaaaacbia
adaappiaabaaaakaafaaaaadabaaciiaabaappiaaaaaaaiaacaaaaadabaaciia
abaappiaabaappiaafaaaaadaaaachiaabaaoeiaaeaappiaafaaaaadaaaachia
aaaaoeiaadaaoeiaacaaaaadaaaachiaaaaaoeiaaaaaoeiaaeaaaaaeaaaachia
aeaaoeiaabaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaabaappiaaaaaoeiaabaaaaacaaaaaiiaabaaaakaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcdaadaaaaeaaaaaaammaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafidaaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
aeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
efaaaaajpcaabaaaaaaaaaaaagaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaaeaaaaaaeghobaaaaeaaaaaa
aagabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackbabaaaadaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaadaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaa
pgapbaaaacaaaaaaagajbaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaaaaaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
fgaobaaaaaaaaaaadcaaaaajocaabaaaaaaaaaaaagajbaaaacaaaaaaagajbaaa
adaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R1.w, fragment.texcoord[4], texture[3], 2D;
MUL R3.xyz, R0.w, R1;
MUL R2.xyz, R2, R3;
MUL R2.xyz, R2, c[1].y;
MAD R0.xyz, R0, R1, R2;
MAX R0.w, fragment.texcoord[3].z, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 14 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Matcap] 2D 2
SetTexture 3 [_LightTexture0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t3.xyz
dcl t4.xy
texld r0, t2, s2
texld r1, t1, s1
texld r2, t0, s0
texld r3, t4, s3
mul_pp r3.xyz, r2.w, r1
mul_pp r0.xyz, r0, r3
mul_pp r0.xyz, r0, c1.x
mad_pp r0.xyz, r2, r1, r0
mul_pp r1.xyz, r0, c0
max_pp r0.x, t3.z, c1.y
mul_pp r0.x, r0, r3.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_ColorAtlas] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Matcap] 2D 3
SetTexture 3 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedicdnpafafegjbkhimhajdkffimnhbnflabaaaaaafeafaaaaaeaaaaaa
daaaaaaapeabaaaagiaeaaaacaafaaaaebgpgodjlmabaaaalmabaaaaaaacpppp
hmabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaadaaaaaa
aaababaaabacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaabaaaaacaaaaadiaaaaabllaabaaaaacabaaadiaabaablla
ecaaaaadacaacpiaabaaoelaadaioekaecaaaaadaaaacpiaaaaaoeiaacaioeka
ecaaaaadadaacpiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaaaaioeka
afaaaaadabaachiaaaaaoeiaadaappiaafaaaaadabaachiaabaaoeiaacaaoeia
acaaaaadabaachiaabaaoeiaabaaoeiaaeaaaaaeaaaachiaadaaoeiaaaaaoeia
abaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaaciiaabaappia
acaakklafiaaaaaeaaaaciiaacaakklaaaaappiaabaaaakaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
abaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgmacaaaaeaaaaaaa
jlaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
dcbabaaaacaaaaaagcbaaaadmcbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahhcaabaaaadaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadeaaaaah
icaabaaaaaaaaaaackbabaaaadaaaaaaabeaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaapgapbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaacaaaaaaamamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaeaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}