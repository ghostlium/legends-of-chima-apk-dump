//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Building_2UV_Scrolling" {
Properties {
 _ColorAtlas ("Color (RGB), Matcap_M (A) UV1", 2D) = "white" {}
 _Occlusion ("Occlusion (RGB) UV2", 2D) = "white" {}
 _Matcap ("Matcap (RGB)", 2D) = "black" {}
 _FeedbackColor ("Feedback Color", Color) = (0,0,0,1)
 _ScrollVelocityX ("Occlusion velocity", Float) = 1.5
}
SubShader { 
 Tags { "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  Fog { Mode Off }
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
Float 27 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[28] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[26].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
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
MUL R0.xyz, R0, vertex.attrib[14].w;
ADD result.texcoord[4].xyz, R3, R2;
MOV R1, c[18];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[27];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[17].y, vertex.texcoord[1];
END
# 40 instructions, 4 R-regs
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
Float 26 [_ScrollVelocityX]
"vs_2_0
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c25.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c20
dp4 r2.y, r0, c19
dp4 r2.x, r0, c18
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c23
dp4 r3.y, r1, c22
dp4 r3.x, r1, c21
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c24
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c17, r0
mov r0, c13
dp4 r3.y, c17, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c27.y, c27.y
mov r0.x, c16.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c26, r0, v4
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
Float 64 [_ScrollVelocityX]
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
eefiecedfkikliknimmgkkoekkjhghmkfnnglfheabaaaaaaeaalaaaaaeaaaaaa
daaaaaaaoaadaaaamaajaaaaiiakaaaaebgpgodjkiadaaaakiadaaaaaaacpopp
caadaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
acaacgaaahaaaeaaaaaaaaaaadaaaaaaaeaaalaaaaaaaaaaadaaaiaaadaaapaa
aaaaaaaaadaaamaaadaabcaaaaaaaaaaadaabaaaafaabfaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafbkaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaacia
acaaffkaaeaaaaaeaaaaaioaaaaaffiaabaaaakaaeaaaajaafaaaaadaaaaadia
acaaffjabaaaoekaaeaaaaaeaaaaadiaapaaoekaacaaaajaaaaaoeiaaeaaaaae
aaaaadiabbaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabkaaaaka
bkaaaakaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahiaaaaaffiabgaaoeka
aeaaaaaeabaaahiabfaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabhaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaappiaaaaaoeiaaiaaaaad
acaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahia
abaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaad
acaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoejabjaappkaafaaaaad
abaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabkaaffka
ajaaaaadabaaabiaaeaaoekaaaaaoeiaajaaaaadabaaaciaafaaoekaaaaaoeia
ajaaaaadabaaaeiaagaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeia
ajaaaaadadaaabiaahaaoekaacaaoeiaajaaaaadadaaaciaaiaaoekaacaaoeia
ajaaaaadadaaaeiaajaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeia
afaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaia
aaaaffibaeaaaaaeadaaahoaakaaoekaaaaaaaiaabaaoeiaafaaaaadaaaaapia
aaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaa
fdeieefcniafaaaaeaaaabaahgabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaa
abaaaaaabkiacaaaabaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaakbabaaa
aeaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaa
abaaaaaabkbabaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaadaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaadaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
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
adaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
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
Float 28 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[29] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..28] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[27].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
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
MOV result.position, R0;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[28];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[17].y, vertex.texcoord[1];
END
# 45 instructions, 4 R-regs
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
Float 28 [_ScrollVelocityX]
"vs_2_0
def c29, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c27.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c29.x
dp4 r2.z, r0, c22
dp4 r2.y, r0, c21
dp4 r2.x, r0, c20
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c25
dp4 r3.y, r1, c24
dp4 r3.x, r1, c23
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c26
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c19, r0
mov r0, c13
dp4 r3.y, c19, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c29.y
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c29.y, c29.y
mov r0.x, c16.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c18.zwzw, r1
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.y, v4
mad oT1.x, c28, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedddmllnpcjmcbhbpahonplmceobinhahlabaaaaaaeiamaaaaaeaaaaaa
daaaaaaadiaeaaaalaakaaaahialaaaaebgpgodjaaaeaaaaaaaeaaaaaaacpopp
gmadaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaaiaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaafaaabaaadaaaaaaaaaa
acaaaaaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaaadaaaaaaaeaaamaa
aaaaaaaaadaaaiaaadaabaaaaaaaaaaaadaaamaaadaabdaaaaaaaaaaadaabaaa
afaabgaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafblaaapkaaaaaaadpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaabaaaaacaaaaaciaacaaffkaaeaaaaaeaaaaaioaaaaaffiaabaaaaka
aeaaaajaafaaaaadaaaaadiaacaaffjabbaaoekaaeaaaaaeaaaaadiabaaaoeka
acaaaajaaaaaoeiaaeaaaaaeaaaaadiabcaaoekaacaakkjaaaaaoeiaaeaaaaae
abaaadoaaaaaoeiablaaaakablaaaakaabaaaaacaaaaapiaaeaaoekaafaaaaad
abaaahiaaaaaffiabhaaoekaaeaaaaaeabaaahiabgaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiabiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabjaaoeka
aaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahia
acaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjia
abaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoa
abaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
acaaoejabkaappkaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeaaaaalia
bdaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaaaaapeia
abaaaaacaaaaaiiablaaffkaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaad
abaaaciaagaaoekaaaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaad
acaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaad
adaaaciaajaaoekaacaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaae
aaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaalaaoekaaaaaaaia
abaaoeiaafaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaaeaaaaapiaamaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaaka
afaaaaadabaaaiiaabaaaaiablaaaakaafaaaaadabaaafiaaaaapeiablaaaaka
acaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefchaagaaaa
eaaaabaajmabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
afaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaa
abaaaaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakbabaaaaeaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaa
aeaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaa
ajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaa
acaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaadaaaaaa
akaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaa
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
acaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaf
icaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaa
abaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
egacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaa
abaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
bkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaa
cmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
acaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
Float 35 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[36] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..35] };
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[29];
DP4 R2.y, R4, c[28];
DP4 R2.x, R4, c[27];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[33];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[4].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[18];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[35];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[17].y, vertex.texcoord[1];
END
# 71 instructions, 5 R-regs
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
Float 34 [_ScrollVelocityX]
"vs_2_0
def c35, 0.50000000, 1.00000000, 0.00000000, 0
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
mov r4.w, c35.y
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
add r1, r2, c35.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.z
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
dp4 r2.z, r4, c28
dp4 r2.y, r4, c27
dp4 r2.x, r4, c26
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c17, r0
mov r0, c12
dp4 r3.x, c17, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c17, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c35.x, c35.x
mov r0.x, c16.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c34, r0, v4
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
Float 64 [_ScrollVelocityX]
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
eefiecedhigfkmeapfjdgacagakececlfodkammeabaaaaaaiibaaaaaaeaaaaaa
daaaaaaaniafaaaaaiapaaaanaapaaaaebgpgodjkaafaaaakaafaaaaaaacpopp
biafaaaaiiaaaaaaaiaaceaaaaaaieaaaaaaieaaaaaaceaaabaaieaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
acaaacaaaiaaaeaaaaaaaaaaacaacgaaahaaamaaaaaaaaaaadaaaaaaaeaabdaa
aaaaaaaaadaaaiaaadaabhaaaaaaaaaaadaaamaaajaabkaaaaaaaaaaaaaaaaaa
aaacpoppfbaaaaafcdaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapja
bpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaacia
acaaffkaaeaaaaaeaaaaaioaaaaaffiaabaaaakaaeaaaajaafaaaaadaaaaadia
acaaffjabiaaoekaaeaaaaaeaaaaadiabhaaoekaacaaaajaaaaaoeiaaeaaaaae
aaaaadiabjaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiacdaaaaka
cdaaaakaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahiaaaaaffiabpaaoeka
aeaaaaaeabaaahiaboaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiacaaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiacbaaoekaaaaappiaaaaaoeiaaiaaaaad
acaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahia
abaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaad
acaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffjablaaoekaaeaaaaae
aaaaahiabkaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappjaaaaaoeiaacaaaaadabaaapia
aaaakkibagaaoekaacaaaaadacaaapiaaaaaaaibaeaaoekaacaaaaadaaaaapia
aaaaffibafaaoekaafaaaaadadaaahiaacaaoejaccaappkaafaaaaadaeaaahia
adaaffiablaaoekaaeaaaaaeadaaaliabkaakekaadaaaaiaaeaakeiaaeaaaaae
adaaahiabmaaoekaadaakkiaadaapeiaafaaaaadaeaaapiaaaaaoeiaadaaffia
afaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaacaaoeiaacaaoeia
aaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeiaaeaaaaaeacaaapia
abaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeiaabaaoeiaaaaaoeia
ahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffiaahaaaaacabaaaeia
aaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaaciacdaaffkaaeaaaaae
aaaaapiaaaaaoeiaahaaoekaaeaaffiaafaaaaadabaaapiaabaaoeiaacaaoeia
alaaaaadabaaapiaabaaoeiacdaakkkaagaaaaacacaaabiaaaaaaaiaagaaaaac
acaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaacacaaaiiaaaaappia
afaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahiaaaaaffiaajaaoeka
aeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaakaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappiaaaaaoeiaabaaaaac
adaaaiiacdaaffkaajaaaaadabaaabiaamaaoekaadaaoeiaajaaaaadabaaacia
anaaoekaadaaoeiaajaaaaadabaaaeiaaoaaoekaadaaoeiaafaaaaadacaaapia
adaacjiaadaakeiaajaaaaadaeaaabiaapaaoekaacaaoeiaajaaaaadaeaaacia
baaaoekaacaaoeiaajaaaaadaeaaaeiabbaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffiaaeaaaaaeaaaaaiia
adaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabcaaoekaaaaappiaabaaoeia
acaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabeaaoeka
aeaaaaaeaaaaapiabdaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabfaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefcciajaaaa
eaaaabaaekacaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaa
abaaaaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaaakbabaaaaeaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaa
aeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaa
ajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaa
acaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaa
akaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
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
acaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaaibcaabaaaabaaaaaaegiocaaa
acaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
acaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
acaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaa
acaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaa
egiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaa
acaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
eeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaa
egaobaaaacaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaa
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
Float 36 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[37] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..36] };
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[30];
DP4 R2.y, R4, c[29];
DP4 R2.x, R4, c[28];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[34];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[4].xyz, R3, R1;
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
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[18].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[36];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[17].y, vertex.texcoord[1];
END
# 76 instructions, 5 R-regs
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
Float 36 [_ScrollVelocityX]
"vs_2_0
def c37, 0.50000000, 1.00000000, 0.00000000, 0
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
mov r4.w, c37.y
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
add r1, r2, c37.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c37.z
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
dp4 r2.z, r4, c30
dp4 r2.y, r4, c29
dp4 r2.x, r4, c28
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c19, r0
mov r0, c12
dp4 r3.x, c19, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c19, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c37.x
mov oPos, r0
mul r1.y, r1, c17.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c37.x, c37.x
mov r0.x, c16.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c18.zwzw, r1
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.y, v4
mad oT1.x, c36, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedmlipdjlkjnjmacdnofjadgcabpgadoobabaaaaaajabbaaaaaeaaaaaa
daaaaaaadaagaaaapiapaaaamabaaaaaebgpgodjpiafaaaapiafaaaaaaacpopp
geafaaaajeaaaaaaajaaceaaaaaajaaaaaaajaaaaaaaceaaabaajaaaaaaaaiaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaafaaabaaadaaaaaaaaaa
acaaaaaaabaaaeaaaaaaaaaaacaaacaaaiaaafaaaaaaaaaaacaacgaaahaaanaa
aaaaaaaaadaaaaaaaeaabeaaaaaaaaaaadaaaiaaadaabiaaaaaaaaaaadaaamaa
ajaablaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafceaaapkaaaaaaadpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaabaaaaacaaaaaciaacaaffkaaeaaaaaeaaaaaioaaaaaffiaabaaaaka
aeaaaajaafaaaaadaaaaadiaacaaffjabjaaoekaaeaaaaaeaaaaadiabiaaoeka
acaaaajaaaaaoeiaaeaaaaaeaaaaadiabkaaoekaacaakkjaaaaaoeiaaeaaaaae
abaaadoaaaaaoeiaceaaaakaceaaaakaabaaaaacaaaaapiaaeaaoekaafaaaaad
abaaahiaaaaaffiacaaaoekaaeaaaaaeabaaahiabpaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiacbaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaccaaoeka
aaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahia
acaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjia
abaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoa
abaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahia
aaaaffjabmaaoekaaeaaaaaeaaaaahiablaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiabnaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaboaaoekaaaaappja
aaaaoeiaacaaaaadabaaapiaaaaakkibahaaoekaacaaaaadacaaapiaaaaaaaib
afaaoekaacaaaaadaaaaapiaaaaaffibagaaoekaafaaaaadadaaahiaacaaoeja
cdaappkaafaaaaadaeaaahiaadaaffiabmaaoekaaeaaaaaeadaaaliablaakeka
adaaaaiaaeaakeiaaeaaaaaeadaaahiabnaaoekaadaakkiaadaapeiaafaaaaad
aeaaapiaaaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaae
aaaaapiaacaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaia
aeaaoeiaaeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapia
abaaoeiaabaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaacia
aaaaffiaahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaac
aeaaaciaceaaffkaaeaaaaaeaaaaapiaaaaaoeiaaiaaoekaaeaaffiaafaaaaad
abaaapiaabaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiaceaakkkaagaaaaac
acaaabiaaaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkia
agaaaaacacaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaad
abaaahiaaaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaamaaoeka
aaaappiaaaaaoeiaabaaaaacadaaaiiaceaaffkaajaaaaadabaaabiaanaaoeka
adaaoeiaajaaaaadabaaaciaaoaaoekaadaaoeiaajaaaaadabaaaeiaapaaoeka
adaaoeiaafaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiabaaaoeka
acaaoeiaajaaaaadaeaaaciabbaaoekaacaaoeiaajaaaaadaeaaaeiabcaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffia
adaaffiaaeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahia
bdaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaaaaaffjabfaaoekaaeaaaaaeaaaaapiabeaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiabgaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabhaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiia
abaaaaiaceaaaakaafaaaaadabaaafiaaaaapeiaceaaaakaacaaaaadaeaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoeja
abaaaaacaaaaaeoaaeaaffjappppaaaafdeieefcmaajaaaaeaaaabaahaacaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaaabaaaaaaaaaaaaaa
akiacaaaaaaaaaaaaiaaaaaaakbabaaaaeaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaaaeaaaaaadiaaaaai
dcaabaaaabaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaa
abaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaadaaaaaaakaaaaaakgbkbaaa
acaaaaaaegaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
acaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaa
acaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
acaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaa
egadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
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
Vector 48 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlolaalmllgdpkoeejgjclnicibldglkoabaaaaaafeafaaaaaeaaaaaa
daaaaaaapaabaaaagiaeaaaacaafaaaaebgpgodjliabaaaaliabaaaaaaacpppp
haabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaa
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
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
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
aaaaaaaaegiccaaaaaaaaaaaadaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
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
Vector 112 [_FeedbackColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedljppcjcfepcjlcfejbefmdeicganaallabaaaaaadaagaaaaaeaaaaaa
daaaaaaaemacaaaacmafaaaapmafaaaaebgpgodjbeacaaaabeacaaaaaaacpppp
miabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaadaaaaaa
aaababaaabacacaaacadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
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
egiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
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
egacbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadgaaaaaficcabaaaaaaaaaaa
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
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
  Fog { Mode Off }
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
Float 24 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[25] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..24] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[24];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[21].y, vertex.texcoord[1];
END
# 30 instructions, 3 R-regs
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
Float 23 [_ScrollVelocityX]
"vs_2_0
def c24, 0.50000000, 0, 0, 0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c21, r0
mov r0, c13
dp4 r3.y, c21, r0
mov r1, c12
dp4 r3.x, c21, r1
mad r0.xyz, r3, c22.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c24.x, c24.x
mov r0.x, c20.y
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c23, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedgmaobhckgmidahmcihmfgcmfionfeaboabaaaaaaciakaaaaaeaaaaaa
daaaaaaaheadaaaakiaiaaaahaajaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
maacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaa
aaaaaaaaadaaamaaajaaapaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaciaagaaffkaaeaaaaaeaaaaaioa
aaaaffiaafaaaakaaeaaaajaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaae
aaaaadiaamaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabiaaaakabiaaaakaabaaaaacaaaaapia
ahaaoekaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabgaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabhaappka
aaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffja
baaaoekaaeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeia
afaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoa
aeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaae
aaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefccmafaaaaeaaaabaa
elabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaaabaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakbabaaaaeaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
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
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Float 15 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..15] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[14];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[15];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[13].y, vertex.texcoord[1];
END
# 22 instructions, 3 R-regs
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
Float 14 [_ScrollVelocityX]
"vs_2_0
def c15, 0.50000000, 0, 0, 0
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
dp4 r3.z, c13, r0
mov r0, c9
dp4 r3.y, c13, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c13, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c15.x, c15.x
mov r0.x, c12.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c14, r0, v4
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
Float 64 [_ScrollVelocityX]
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
eefiecedemcbkbiboipgggijekdmdffeehfmglkdabaaaaaapaahaaaaaeaaaaaa
daaaaaaalmacaaaaiiagaaaafaahaaaaebgpgodjieacaaaaieacaaaaaaacpopp
beacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaaiaaadaaaiaaaaaaaaaaadaabaaaaeaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafapaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
abaaaaacaaaaaciaacaaffkaaeaaaaaeaaaaaioaaaaaffiaabaaaakaaeaaaaja
afaaaaadaaaaadiaacaaffjaajaaoekaaeaaaaaeaaaaadiaaiaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaakaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiaapaaaakaapaaaakaabaaaaacaaaaapiaadaaoekaafaaaaadabaaahia
aaaaffiaamaaoekaaeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffja
afaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
agaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefc
meadaaaaeaaaabaapbaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaaabaaaaaaaaaaaaaa
akiacaaaaaaaaaaaaeaaaaaaakbabaaaaeaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaaaeaaaaaadiaaaaai
dcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaa
aaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaakaaaaaakgbkbaaa
acaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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
Float 24 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[25] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..24] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
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
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].w, R0, c[20];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[24];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[21].y, vertex.texcoord[1];
END
# 31 instructions, 3 R-regs
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
Float 23 [_ScrollVelocityX]
"vs_2_0
def c24, 0.50000000, 0, 0, 0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c21, r0
mov r0, c13
dp4 r3.y, c21, r0
mov r1, c12
dp4 r3.x, c21, r1
mad r0.xyz, r3, c22.w, -v0
dp4 r0.w, v0, c11
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.z, v0, c10
dp4 oT4.w, r0, c19
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c24.x, c24.x
mov r0.x, c20.y
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c23, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedklihbkhcecpeemcffkbnmmgphbnmdledabaaaaaaciakaaaaaeaaaaaa
daaaaaaaheadaaaakiaiaaaahaajaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
maacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaa
aaaaaaaaadaaamaaajaaapaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaciaagaaffkaaeaaaaaeaaaaaioa
aaaaffiaafaaaakaaeaaaajaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaae
aaaaadiaamaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabiaaaakabiaaaakaabaaaaacaaaaapia
ahaaoekaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabgaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabhaappka
aaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffja
baaaoekaaeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeia
afaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaapoa
aeaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaae
aaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefccmafaaaaeaaaabaa
elabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadpccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaaabaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakbabaaaaeaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pccabaaaaeaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaa
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
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
Float 24 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[25] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..24] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[22];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[23].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].z, R0, c[19];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[24];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[21].y, vertex.texcoord[1];
END
# 30 instructions, 3 R-regs
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
Float 23 [_ScrollVelocityX]
"vs_2_0
def c24, 0.50000000, 0, 0, 0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c21, r0
mov r0, c13
dp4 r3.y, c21, r0
mov r1, c12
dp4 r3.x, c21, r1
mad r0.xyz, r3, c22.w, -v0
dp3 oT3.y, r0, r2
dp3 oT3.z, v2, r0
dp3 oT3.x, r0, v1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.z, r0, c18
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c24.x, c24.x
mov r0.x, c20.y
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c23, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedgmaobhckgmidahmcihmfgcmfionfeaboabaaaaaaciakaaaaaeaaaaaa
daaaaaaaheadaaaakiaiaaaahaajaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
maacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaa
aaaaaaaaadaaamaaajaaapaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaciaagaaffkaaeaaaaaeaaaaaioa
aaaaffiaafaaaakaaeaaaajaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaae
aaaaadiaamaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabiaaaakabiaaaakaabaaaaacaaaaapia
ahaaoekaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabgaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabhaappka
aaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffja
baaaoekaaeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
bbaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeia
afaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeadaaahoa
aeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaae
aaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaafdeieefccmafaaaaeaaaabaa
elabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaaabaaaaaabkiacaaaabaaaaaa
aaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakbabaaaaeaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaaabaaaaaabkbabaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaa
aaaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
pgipcaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
bccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaa
adaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
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
Float 23 [_ScrollVelocityX]
"!!ARBvp1.0
PARAM c[24] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..23] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[22];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
DP4 R0.w, vertex.position, c[12];
DP4 R0.z, vertex.position, c[11];
DP4 result.texcoord[4].y, R0, c[18];
DP4 result.texcoord[4].x, R0, c[17];
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
MOV R0.x, c[23];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
MOV result.texcoord[1].y, vertex.texcoord[1];
MAD result.texcoord[1].x, R0, c[21].y, vertex.texcoord[1];
END
# 28 instructions, 3 R-regs
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
Float 22 [_ScrollVelocityX]
"vs_2_0
def c23, 0.50000000, 0, 0, 0
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
dp4 r3.z, c21, r0
mov r0, c13
dp4 r3.y, c21, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c21, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
mad oT2.xy, r0, c23.x, c23.x
mov r0.x, c20.y
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
mov oT1.y, v4
mad oT1.x, c22, r0, v4
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
Float 128 [_ScrollVelocityX]
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
eefiecedikfmbmddjknadkgoboljipapglakkacjabaaaaaaoiajaaaaaeaaaaaa
daaaaaaagaadaaaagiaiaaaadaajaaaaebgpgodjciadaaaaciadaaaaaaacpopp
kmacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaaiaaadaaamaa
aaaaaaaaadaaamaaaiaaapaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaaciaagaaffkaaeaaaaaeaaaaaioa
aaaaffiaafaaaakaaeaaaajaafaaaaadaaaaadiaacaaffjaanaaoekaaeaaaaae
aaaaadiaamaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaoaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabhaaaakabhaaaakaabaaaaacaaaaapia
ahaaoekaafaaaaadabaaahiaaaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabgaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaaeaaaaapiaapaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bcaaoekaaaaappjaaaaaoeiaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaae
aaaaadiaabaaobkaaaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkia
aaaaoeiaaeaaaaaeabaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapia
aaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaaeoaaeaaffjappppaaaa
fdeieefcaaafaaaaeaaaabaaeaabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadmccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaleccabaaa
abaaaaaabkiacaaaabaaaaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaaakbabaaa
aeaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaficcabaaa
abaaaaaabkbabaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaacaaaaaa
agiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaadaaaaaaajaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaadaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaa
aaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaadaaaaaaakaaaaaakgbkbaaa
acaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaacaaaaaaaaaaaaaa
egiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
baaaaaaaagiacaaaacaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaacaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabdaaaaaapgipcaaa
acaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
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
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaaamadaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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