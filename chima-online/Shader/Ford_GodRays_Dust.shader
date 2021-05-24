//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/God Rays Dust" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Detail Texture", 2D) = "white" {}
 _DetailTexB ("Detail TextureB", 2D) = "white" {}
 _ScrollUvValues ("UV Scroll Speed //XY= Detail Texture  // ZW= Detail TextureB", Vector) = (0.25,0.1,0.2,0.05)
 _DifferentFloatValues (" X= Detail Tex Mul // Y= Detail TexB Mul  // Z= Fadeout Near Dist//W= Fadeout pow", Vector) = (10,15,20,4)
 _Color ("Color", Color) = (1,1,1,1)
 _FresnelPower ("Fresnel Transparency Power", Float) = 0.8
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Fog { Mode Off }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [unity_Scale]
Vector 16 [_Color]
Float 17 [_GodRaysMasterOpacity]
Vector 18 [_MainTex_ST]
Vector 19 [_DetailTex_ST]
Vector 20 [_DetailTexB_ST]
Vector 21 [_ScrollUvValues]
Vector 22 [_DifferentFloatValues]
Float 23 [_FresnelPower]
Float 24 [_VertAnimSpeed]
Float 25 [_VertAnimDisplacement]
"!!ARBvp1.0
PARAM c[30] = { { 0.15915491, 0.25, 24.980801, -24.980801 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..25],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
ADD R0.x, vertex.position, c[13];
MUL R0.x, R0, c[24];
MAD R0.x, R0, c[0], -c[0].y;
FRC R1.w, R0.x;
ADD R0.xyz, -R1.w, c[26];
MUL R1.xyz, R0, R0;
MUL R0.xyz, R1, c[0].zwzw;
ADD R0.xyz, R0, c[27].xyxw;
MAD R0.xyz, R0, R1, c[27].zwzw;
MAD R2.xyz, R0, R1, c[28].xyxw;
MAD R2.xyz, R2, R1, c[28].zwzw;
MOV R0.w, c[26].z;
MOV R0.xyz, c[14];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
MAD R2.xyz, R2, R1, c[26].wzww;
SLT R3.x, R1.w, c[0].y;
SGE R3.yz, R1.w, c[29].xxyw;
MOV R1.xz, R3;
DP3 R1.y, R3, c[26].wzww;
DP3 R1.z, R2, -R1;
RSQ R0.w, R0.w;
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MAD result.position.xy, R1.z, c[25].x, R1;
MUL R1.xyz, R0.w, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 R0.y, R0, R0;
DP3 R0.x, R1, vertex.normal;
RSQ R0.y, R0.y;
RCP R0.z, c[22].z;
RCP R0.y, R0.y;
MUL R0.y, R0, R0.z;
MIN R1.x, R0.y, c[26].z;
MAX R1.x, R1, c[26];
POW R1.z, R1.x, c[22].w;
POW R0.x, R0.x, c[23].x;
MUL R0, R0.x, c[16];
MUL R0, R0, c[17].x;
MOV R1.xy, c[13];
MUL result.texcoord[2], R0, R1.z;
MUL R0.xy, R1, c[21];
FRC R0.zw, R0.xyxy;
MAD R0.xy, vertex.texcoord[0], c[19], c[19].zwzw;
ADD result.texcoord[0].zw, R0.xyxy, R0;
MUL R1.xy, R1, c[21].zwzw;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[1], c[20], c[20].zwzw;
ADD result.texcoord[1].xy, R0, R0.zwzw;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[8];
DP4 result.position.z, vertex.position, c[7];
END
# 57 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_World2Object]
Vector 12 [_Time]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [_Color]
Float 16 [_GodRaysMasterOpacity]
Vector 17 [_MainTex_ST]
Vector 18 [_DetailTex_ST]
Vector 19 [_DetailTexB_ST]
Vector 20 [_ScrollUvValues]
Vector 21 [_DifferentFloatValues]
Float 22 [_FresnelPower]
Float 23 [_VertAnimSpeed]
Float 24 [_VertAnimDisplacement]
"vs_2_0
def c25, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c26, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c27, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c28, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c13
mov r1.w, c25.z
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c14.w, -v0
dp3 r0.w, r0, r0
rsq r0.w, r0.w
mul r0.xyz, r0.w, r0
dp3 r1.x, r0, v1
pow r0, r1.x, c22.x
mul r1, r0.x, c15
dp4 r0.z, v0, c2
dp4 r0.y, v0, c1
dp4 r0.x, v0, c0
dp3 r0.x, r0, r0
rsq r0.x, r0.x
mul r1, r1, c16.x
rcp r0.x, r0.x
rcp r0.y, c21.z
mul r0.y, r0.x, r0
min r0.y, r0, c25.z
add r0.x, v0, c12
mul r0.x, r0, c23
max r2.y, r0, c28.x
mad r2.x, r0, c27, c27.y
pow r0, r2.y, c21.w
frc r0.y, r2.x
mov r2.y, r0.x
mad r2.x, r0.y, c27.z, c27.w
sincos r0.xy, r2.x, c26.xyzw, c25.xyzw
dp4 r0.z, v0, c4
dp4 r0.w, v0, c5
mad oPos.xy, r0.y, c24.x, r0.zwzw
mov r0.xy, c20
mul oT2, r1, r2.y
mul r1.xy, c12, r0
mov r0.zw, c20
mul r0.xy, c12, r0.zwzw
mad r0.zw, v2.xyxy, c18.xyxy, c18
frc r1.xy, r1
add oT0.zw, r0, r1.xyxy
frc r0.zw, r0.xyxy
mad r0.xy, v3, c19, c19.zwzw
add oT1.xy, r0, r0.zwzw
mad oT0.xy, v2, c17, c17.zwzw
dp4 oPos.w, v0, c7
dp4 oPos.z, v0, c6
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 16 [_Color]
Float 32 [_GodRaysMasterOpacity]
Vector 48 [_MainTex_ST]
Vector 64 [_DetailTex_ST]
Vector 80 [_DetailTexB_ST]
Vector 96 [_ScrollUvValues]
Vector 112 [_DifferentFloatValues]
Float 128 [_FresnelPower]
Float 132 [_VertAnimSpeed]
Float 136 [_VertAnimDisplacement]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecednkclfonlodfdakcmciocmioefnkdelhbabaaaaaafaahaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
mmafaaaaeaaaabaahdabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaaaaaaaaaakiacaaa
abaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaa
aaaaaaaaaiaaaaaaenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakdccabaaa
aaaaaaaaagaabaaaaaaaaaaakgikcaaaaaaaaaaaaiaaaaaaegaabaaaabaaaaaa
dgaaaaafmccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaagaaaaaaegiecaaaabaaaaaa
aaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahmccabaaa
abaaaaaaagaebaaaaaaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaafaaaaaa
ogikcaaaaaaaaaaaafaaaaaaaaaaaaahdccabaaaacaaaaaaogakbaaaabaaaaaa
egaabaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaacaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaafaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaeaaaaaaagbabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaa
kgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaahaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaaaocaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaackiacaaa
aaaaaaaaahaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaai
bcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaaahaaaaaabjaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahpccabaaaadaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 16 [_Color]
Float 32 [_GodRaysMasterOpacity]
Vector 48 [_MainTex_ST]
Vector 64 [_DetailTex_ST]
Vector 80 [_DetailTexB_ST]
Vector 96 [_ScrollUvValues]
Vector 112 [_DifferentFloatValues]
Float 128 [_FresnelPower]
Float 132 [_VertAnimSpeed]
Float 136 [_VertAnimDisplacement]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefieceddiboojenjgmohmagieefdddmcpefgkgeabaaaaaaeialaaaaaeaaaaaa
daaaaaaaceaeaaaapiajaaaamaakaaaaebgpgodjomadaaaaomadaaaaaaacpopp
iiadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
aiaaabaaaaaaaaaaabaaaaaaabaaajaaaaaaaaaaabaaaeaaabaaakaaaaaaaaaa
acaaaaaaaiaaalaaaaaaaaaaacaabaaaafaabdaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbiaaapkaaaaaaaaaaaaaiadpidpjccdoaaaaaadpfbaaaaafbjaaapka
nlapmjeanlapejmaaaaaaaaaaaaaaaaafbaaaaafbkaaapkaabannalfgballglh
klkkckdlijiiiidjfbaaaaafblaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeaaaaadiaadaaoejaaeaaoekaaeaaookaabaaaaacabaaadia
ajaaoekaafaaaaadabaaapiaabaaeeiaagaaoekabdaaaaacabaaapiaabaaoeia
acaaaaadaaaaamoaaaaaeeiaabaaeeiaaeaaaaaeaaaaadiaaeaaoejaafaaoeka
afaaookaacaaaaadabaaadoaabaaooiaaaaaoeiaafaaaaadaaaaahiaaaaaffja
baaaoekaaeaaaaaeaaaaahiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
bbaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappjaaaaaoeia
aiaaaaadaaaaabiaaaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaac
aaaaabiaaaaaaaiaagaaaaacaaaaaciaahaakkkaafaaaaadaaaaabiaaaaaffia
aaaaaaiaalaaaaadaaaaabiaaaaaaaiabiaaaakaakaaaaadaaaaabiaaaaaaaia
biaaffkacaaaaaadabaaabiaaaaaaaiaahaappkaabaaaaacaaaaahiaakaaoeka
afaaaaadabaaaoiaaaaaffiabeaajakaaeaaaaaeaaaaaliabdaakekaaaaaaaia
abaaojiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahia
aaaaoeiabgaaoekaaeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbceaaaaac
acaaahiaaaaaoeiaaiaaaaadaaaaabiaacaaoeiaacaaoejacaaaaaadabaaacia
aaaaaaiaaiaaaakaafaaaaadaaaaapiaabaaffiaabaaoekaafaaaaadaaaaapia
aaaaoeiaacaaaakaafaaaaadacaaapoaabaaaaiaaaaaoeiaacaaaaadaaaaabia
aaaaaajaajaaaakaafaaaaadaaaaabiaaaaaaaiaaiaaffkaaeaaaaaeaaaaabia
aaaaaaiabiaakkkabiaappkabdaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaaabia
aaaaaaiabjaaaakabjaaffkacfaaaaaeabaaaciaaaaaaaiabkaaoekablaaoeka
afaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
aoaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadiaabaaffiaaiaakkkaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
ppppaaaafdeieefcmmafaaaaeaaaabaahdabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
aaaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaaiaaaaaaenaaaaagbcaabaaaaaaaaaaaaanaaaaa
akaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakdccabaaaaaaaaaaaagaabaaaaaaaaaaakgikcaaaaaaaaaaaaiaaaaaa
egaabaaaabaaaaaadgaaaaafmccabaaaaaaaaaaakgaobaaaabaaaaaadcaaaaal
dcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaagaaaaaa
egiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaa
aaaaaaahmccabaaaabaaaaaaagaebaaaaaaaaaaaagaebaaaabaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaaeaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaahdccabaaaacaaaaaa
ogakbaaaabaaaaaaegaabaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaacaaaaaa
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaa
aaaaaaaaacaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaafaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaeaaaaaa
agbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaagaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaahaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaelaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaaaocaaaaibcaabaaaabaaaaaaakaabaaa
abaaaaaackiacaaaaaaaaaaaahaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaaaaaaaaaa
ahaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahpccabaaa
adaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
heaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaheaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_DifferentFloatValues]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_DetailTexB] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { program.local[0] };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R2, fragment.texcoord[1], texture[2], 2D;
MUL R1, R0, R1;
MAD R1, R1, c[0].x, R0;
MUL R0, R2, R0;
MAD R0, R0, c[0].y, R1;
MUL result.color, R0, fragment.texcoord[2];
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_DifferentFloatValues]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_DetailTexB] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl t0
dcl t1.xy
dcl t2
texld r2, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.xy, r0
texld r0, t1, s2
texld r1, r1, s1
mul_pp r1, r2, r1
mad r1, r1, c0.x, r2
mul_pp r0, r0, r2
mad r0, r0, c0.y, r1
mul r0, r0, t2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_DetailTexB] 2D 2
ConstBuffer "$Globals" 144
Vector 112 [_DifferentFloatValues]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfelnbndlnelgilonfahddaahnonnjiflabaaaaaakiacaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcliabaaaaeaaaaaaagoaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaahaaaaaaegaobaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegaobaaaabaaaaaafgifcaaaaaaaaaaaahaaaaaa
egaobaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaa
adaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
SetTexture 2 [_DetailTexB] 2D 2
ConstBuffer "$Globals" 144
Vector 112 [_DifferentFloatValues]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedaddhgcmfipbpbilelalpabaeibknlaekabaaaaaaomadaaaaaeaaaaaa
daaaaaaahaabaaaadaadaaaaliadaaaaebgpgodjdiabaaaadiabaaaaaaacpppp
pmaaaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaahaaabaaaaaaaaaaaaaaaaacppppbpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
abaaaaacaaaaabiaaaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpia
aaaaoeiaabaioekaecaaaaadabaacpiaaaaaoelaaaaioekaecaaaaadacaacpia
abaaoelaacaioekaafaaaaadaaaaapiaaaaaoeiaabaaoeiaaeaaaaaeaaaaapia
aaaaoeiaaaaaaakaabaaoeiaafaaaaadabaaapiaabaaoeiaacaaoeiaaeaaaaae
aaaaapiaabaaoeiaaaaaffkaaaaaoeiaafaaaaadaaaacpiaaaaaoeiaacaaoela
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcliabaaaaeaaaaaaagoaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
pcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaagiacaaaaaaaaaaaahaaaaaa
egaobaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadcaaaaakpcaabaaaaaaaaaaaegaobaaaabaaaaaafgifcaaa
aaaaaaaaahaaaaaaegaobaaaaaaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaa
aaaaaaaaegbobaaaadaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}