//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Loot/Ford_Loot_Building_2UVs" {
Properties {
 _ColorAtlas ("Color (RGB), Matcap_M (A) UV1", 2D) = "white" {}
 _Occlusion ("Occlusion (RGB) UV2", 2D) = "white" {}
 _Matcap ("Matcap (RGB)", 2D) = "black" {}
 _Gloss ("Gloss", Float) = 0.25
 _Fresnel ("Fresnel", Float) = 5
 _Spec ("Spec", Float) = 0.5
 _FeedbackColor ("Feedback Color", Color) = (0.098,0.098,0.098,1)
 _TransparentColor ("Transparent Color", Color) = (0,1,0,0.2)
 _FresnelIntensity ("Fresnel Intensity", Float) = 3
 _FresnelCol ("Fresnel Color", Vector) = (1,0.8,0.4,1)
}
SubShader { 
 Tags { "QUEUE"="Geometry+1" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 UsePass "Ford/Base_Passes/GHOST"
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+1" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
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
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_SHAr]
Vector 19 [unity_SHAg]
Vector 20 [unity_SHAb]
Vector 21 [unity_SHBr]
Vector 22 [unity_SHBg]
Vector 23 [unity_SHBb]
Vector 24 [unity_SHC]
Vector 25 [unity_Scale]
"!!ARBvp1.0
PARAM c[26] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..25] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[25].w;
DP3 R2.w, R1, c[10];
DP3 R0.x, R1, c[9];
DP3 R0.z, R1, c[11];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[20];
DP4 R2.y, R0, c[19];
DP4 R2.x, R0, c[18];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[23];
DP4 R3.y, R1, c[22];
DP4 R3.x, R1, c[21];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[24];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
ADD result.texcoord[4].xyz, R3, R2;
MOV R1, c[17];
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
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
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [unity_Scale]
"vs_2_0
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c24.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c25.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c23
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c13
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c25.y, c25.y
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
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedejopnmefilkihmokbbemdlomdilecjbnabaaaaaalmakaaaaaeaaaaaa
daaaaaaakiadaaaadmajaaaaaeakaaaaebgpgodjhaadaaaahaadaaaaaaacpopp
aaadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaaaa
abaaabaaaaaaaaaaaaaacgaaahaaacaaaaaaaaaaabaaaaaaaeaaajaaaaaaaaaa
abaaaiaaadaaanaaaaaaaaaaabaaamaaadaabaaaaaaaaaaaabaabaaaafaabdaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbiaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjaaoaaoekaaeaaaaaeaaaaadiaanaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiaapaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiabiaaaakabiaaaakaabaaaaacaaaaapiaabaaoekaafaaaaadabaaahia
aaaaffiabeaaoekaaeaaaaaeabaaahiabdaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiabfaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoeja
bhaappkaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaabaaaaac
aaaaaiiabiaaffkaajaaaaadabaaabiaacaaoekaaaaaoeiaajaaaaadabaaacia
adaaoekaaaaaoeiaajaaaaadabaaaeiaaeaaoekaaaaaoeiaafaaaaadacaaapia
aaaacjiaaaaakeiaajaaaaadadaaabiaafaaoekaacaaoeiaajaaaaadadaaacia
agaaoekaacaaoeiaajaaaaadadaaaeiaahaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabia
aaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaaiaaoekaaaaaaaiaabaaoeia
afaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
amaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcimafaaaaeaaaabaagdabaaaafjaaaaaeegiocaaa
aaaaaaaacnaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaa
agbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaa
abaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
abaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabcaaaaaakgikcaaa
aaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
abaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
abaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaaaaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaaaaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaaaaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
aaaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
aaaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
aaaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
aaaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Vector 17 [_ProjectionParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"!!ARBvp1.0
PARAM c[27] = { { 0.5, 1 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..26] };
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
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[25];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[18];
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
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 43 instructions, 4 R-regs
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
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_SHAr]
Vector 20 [unity_SHAg]
Vector 21 [unity_SHAb]
Vector 22 [unity_SHBr]
Vector 23 [unity_SHBg]
Vector 24 [unity_SHBb]
Vector 25 [unity_SHC]
Vector 26 [unity_Scale]
"vs_2_0
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c26.w
dp3 r2.w, r1, c9
dp3 r0.x, r1, c8
dp3 r0.z, r1, c10
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c21
dp4 r2.y, r0, c20
dp4 r2.x, r0, c19
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c24
dp4 r3.y, r1, c23
dp4 r3.x, r1, c22
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c25
mov r0.xyz, v1
add oT4.xyz, r1, r2
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c13
dp4 r3.y, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c27.y
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c27.y, c27.y
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
ConstBuffer "UnityPerCamera" 128
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
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedooafkigfhdpaljhgkpeenndjgggbhlhbabaaaaaanealaaaaaeaaaaaa
daaaaaaaaaaeaaaadmakaaaaaealaaaaebgpgodjmiadaaaamiadaaaaaaacpopp
emadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaacgaaahaaadaaaaaaaaaa
acaaaaaaaeaaakaaaaaaaaaaacaaaiaaadaaaoaaaaaaaaaaacaaamaaadaabbaa
aaaaaaaaacaabaaaafaabeaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbjaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaapaaoekaaeaaaaae
aaaaadiaaoaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabaaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiabjaaaakabjaaaakaabaaaaacaaaaapia
acaaoekaafaaaaadabaaahiaaaaaffiabfaaoekaaeaaaaaeabaaahiabeaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabgaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiabhaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaahiaacaaoejabiaappkaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaabaaaaacaaaaaiiabjaaffkaajaaaaadabaaabiaadaaoeka
aaaaoeiaajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoeka
aaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoeka
acaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffia
aaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoa
ajaaoekaaaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaabia
aaaaffiaabaaaakaafaaaaadabaaaiiaabaaaaiabjaaaakaafaaaaadabaaafia
aaaapeiabjaaaakaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcdeagaaaaeaaaabaainabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacafaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaa
acaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaa
acaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
acaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
abaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaa
egadbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
"!!ARBvp1.0
PARAM c[34] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..33] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[33].w;
DP4 R0.x, vertex.position, c[10];
ADD R1, -R0.x, c[19];
DP3 R3.w, R3, c[10];
DP3 R4.x, R3, c[9];
DP3 R3.x, R3, c[11];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[9];
ADD R0, -R0.x, c[18];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].y;
DP4 R4.y, vertex.position, c[11];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[20];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[21];
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
MUL R1.xyz, R0.y, c[23];
MAD R1.xyz, R0.x, c[22], R1;
MAD R0.xyz, R0.z, c[24], R1;
MAD R1.xyz, R0.w, c[25], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[31];
DP4 R3.y, R0, c[30];
DP4 R3.x, R0, c[29];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[28];
DP4 R2.y, R4, c[27];
DP4 R2.x, R4, c[26];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[32];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[4].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[17];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].y, R2, R1;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 5 R-regs
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
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [unity_Scale]
"vs_2_0
def c33, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c32.w
dp4 r0.x, v0, c9
add r1, -r0.x, c18
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c33.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c33.y
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.z
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c12
dp4 r3.x, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c33.x, c33.x
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
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedpekpclijdhgikjikpaobilpclheapaikabaaaaaaaebaaaaaaeaaaaaa
daaaaaaakaafaaaaieaoaaaaemapaaaaebgpgodjgiafaaaagiafaaaaaaacpopp
piaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaaaa
abaaabaaaaaaaaaaaaaaacaaaiaaacaaaaaaaaaaaaaacgaaahaaakaaaaaaaaaa
abaaaaaaaeaabbaaaaaaaaaaabaaaiaaadaabfaaaaaaaaaaabaaamaaajaabiaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafcbaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
afaaaaadaaaaadiaacaaffjabgaaoekaaeaaaaaeaaaaadiabfaaoekaacaaaaja
aaaaoeiaaeaaaaaeaaaaadiabhaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoa
aaaaoeiacbaaaakacbaaaakaabaaaaacaaaaapiaabaaoekaafaaaaadabaaahia
aaaaffiabnaaoekaaeaaaaaeabaaahiabmaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaboaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabpaaoekaaaaappia
aaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaacaaoeja
afaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahiaabaamjiaabaancja
acaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadacaaacoaabaaoeia
aaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffja
bjaaoekaaeaaaaaeaaaaahiabiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
bkaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaappjaaaaaoeia
acaaaaadabaaapiaaaaakkibaeaaoekaacaaaaadacaaapiaaaaaaaibacaaoeka
acaaaaadaaaaapiaaaaaffibadaaoekaafaaaaadadaaahiaacaaoejacaaappka
afaaaaadaeaaahiaadaaffiabjaaoekaaeaaaaaeadaaaliabiaakekaadaaaaia
aeaakeiaaeaaaaaeadaaahiabkaaoekaadaakkiaadaapeiaafaaaaadaeaaapia
aaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapia
acaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeia
aeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeia
abaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffia
ahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappiaabaaaaacaeaaacia
cbaaffkaaeaaaaaeaaaaapiaaaaaoeiaafaaoekaaeaaffiaafaaaaadabaaapia
abaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiacbaakkkaagaaaaacacaaabia
aaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaac
acaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahia
aaaaffiaahaaoekaaeaaaaaeabaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappia
aaaaoeiaabaaaaacadaaaiiacbaaffkaajaaaaadabaaabiaakaaoekaadaaoeia
ajaaaaadabaaaciaalaaoekaadaaoeiaajaaaaadabaaaeiaamaaoekaadaaoeia
afaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabiaanaaoekaacaaoeia
ajaaaaadaeaaaciaaoaaoekaacaaoeiaajaaaaadaeaaaeiaapaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffia
aeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaaeabaaahiabaaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabcaaoekaaeaaaaaeaaaaapiabbaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabdaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcnmaiaaaaeaaaabaadhacaaaafjaaaaaeegiocaaaaaaaaaaacnaaaaaa
fjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
pcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
abaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaa
abaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaa
diaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaaabaaaaaaajaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaaiaaaaaaagbabaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaakaaaaaa
kgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaa
aaaaaaaaegiccaaaabaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
abaaaaaabaaaaaaaagiacaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaabaaaaaabcaaaaaakgikcaaaaaaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabdaaaaaa
pgipcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaa
abaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaa
egacbaaaabaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaabbaaaaaibcaabaaaabaaaaaaegiocaaaaaaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaaaaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaaaaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaaaaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaaaaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaaaaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiccaaaabaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaabaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaa
egiocaaaaaaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaa
egaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
adaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaa
aaaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaa
egiocaaaaaaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaa
agaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaa
egaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaaf
pcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaa
acaaaaaaegiocaaaaaaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
acaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaaaaaaaaa
agaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaaaaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
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
"!!ARBvp1.0
PARAM c[35] = { { 0.5, 1, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..34] };
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
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[3].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 74 instructions, 5 R-regs
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
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
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
"vs_2_0
def c35, 0.50000000, 1.00000000, 0.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c34.w
dp4 r0.x, v0, c9
add r1, -r0.x, c20
dp3 r3.w, r3, c9
dp3 r4.x, r3, c8
dp3 r3.x, r3, c10
mul r2, r3.w, r1
dp4 r0.x, v0, c8
add r0, -r0.x, c19
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c35.y
dp4 r4.y, v0, c10
mad r1, r0, r0, r1
add r0, -r4.y, c21
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c22
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
mul r1.xyz, r0.y, c24
mad r1.xyz, r0.x, c23, r1
mad r0.xyz, r0.z, c25, r1
mad r1.xyz, r0.w, c26, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c32
dp4 r3.y, r0, c31
dp4 r3.x, r0, c30
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c33
dp4 r2.z, r4, c29
dp4 r2.y, r4, c28
dp4 r2.x, r4, c27
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT4.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c12
dp4 r3.x, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c13
dp4 r3.y, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c35.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oT5.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c35.x, c35.x
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
ConstBuffer "UnityPerCamera" 128
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
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedeholhefhfkbgfpchegpgekmmdimaoigaabaaaaaabmbbaaaaaeaaaaaa
daaaaaaapiafaaaaieapaaaaembaaaaaebgpgodjmaafaaaamaafaaaaaaacpopp
eeafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaa
abaacgaaahaaalaaaaaaaaaaacaaaaaaaeaabcaaaaaaaaaaacaaaiaaadaabgaa
aaaaaaaaacaaamaaajaabjaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafccaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjabhaaoekaaeaaaaae
aaaaadiabgaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiabiaaoekaacaakkja
aaaaoeiaaeaaaaaeabaaadoaaaaaoeiaccaaaakaccaaaakaabaaaaacaaaaapia
acaaoekaafaaaaadabaaahiaaaaaffiaboaaoekaaeaaaaaeabaaahiabnaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiabpaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiacaaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeia
abaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaae
abaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappja
aiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeia
afaaaaadaaaaahiaaaaaffjabkaaoekaaeaaaaaeaaaaahiabjaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
bmaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaakkibafaaoekaacaaaaad
acaaapiaaaaaaaibadaaoekaacaaaaadaaaaapiaaaaaffibaeaaoekaafaaaaad
adaaahiaacaaoejacbaappkaafaaaaadaeaaahiaadaaffiabkaaoekaaeaaaaae
adaaaliabjaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahiablaaoekaadaakkia
adaapeiaafaaaaadaeaaapiaaaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeia
aaaaoeiaaeaaaaaeaaaaapiaacaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapia
acaaoeiaadaaaaiaaeaaoeiaaeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeia
aeaaaaaeaaaaapiaabaaoeiaabaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaia
ahaaaaacabaaaciaaaaaffiaahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiia
aaaappiaabaaaaacaeaaaciaccaaffkaaeaaaaaeaaaaapiaaaaaoeiaagaaoeka
aeaaffiaafaaaaadabaaapiaabaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeia
ccaakkkaagaaaaacacaaabiaaaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaac
acaaaeiaaaaakkiaagaaaaacacaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeia
acaaoeiaafaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaacadaaaiiaccaaffkaajaaaaad
abaaabiaalaaoekaadaaoeiaajaaaaadabaaaciaamaaoekaadaaoeiaajaaaaad
abaaaeiaanaaoekaadaaoeiaafaaaaadacaaapiaadaacjiaadaakeiaajaaaaad
aeaaabiaaoaaoekaacaaoeiaajaaaaadaeaaaciaapaaoekaacaaoeiaajaaaaad
aeaaaeiabaaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaad
aaaaaiiaadaaffiaadaaffiaaeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappib
aeaaaaaeabaaahiabbaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeia
abaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabfaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaabaaaaka
afaaaaadabaaaiiaabaaaaiaccaaaakaafaaaaadabaaafiaaaaapeiaccaaaaka
acaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcieajaaaa
eaaaabaagbacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
dccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaa
agbebaaaaeaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaacaaaaaaegiacaaa
acaaaaaaajaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaa
acaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaabaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
acaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
acaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaabbaaaaaibcaabaaaacaaaaaa
egiocaaaabaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaa
egiocaaaabaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaa
egiocaaaabaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaa
jgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaa
abaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaa
abaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaa
abaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaa
fgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaa
adaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaia
ebaaaaaaadaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaabaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaabaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
aaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
ConstBuffer "$Globals" 64
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
ConstBuffer "$Globals" 128
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
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Geometry+1" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
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
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
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
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 3 R-regs
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
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
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
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
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
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjbfkacdejmpjlafdbejhgaifdnpggnpmabaaaaaaleajaaaaaeaaaaaa
daaaaaaadmadaaaadeaiaaaapmaiaaaaebgpgodjaeadaaaaaeadaaaaaaacpopp
kaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
alaaoekaaeaaaaaeaaaaadiaakaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
amaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabgaaaakabgaaaaka
abaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaae
abaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffja
ahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
paaeaaaaeaaaabaadmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[14] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..13] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[13];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 3 R-regs
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
Vector 12 [_WorldSpaceLightPos0]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
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
dp4 r3.z, c12, r0
mov r0, c9
dp4 r3.y, c12, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c12, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c13.x, c13.x
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
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedokbjmjciadhmgkeocngkmaaeocgnjnnfabaaaaaagmahaaaaaeaaaaaa
daaaaaaaieacaaaaaeagaaaammagaaaaebgpgodjemacaaaaemacaaaaaaacpopp
peabaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaaaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaaiaaadaaagaaaaaaaaaa
abaabaaaaeaaajaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaahaaoekaaeaaaaaeaaaaadia
agaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaiaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiaanaaaakaanaaaakaabaaaaacaaaaapiaabaaoeka
afaaaaadabaaahiaaaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
ppppaaaafdeieefchiadaaaaeaaaabaanoaaaaaafjaaaaaeegiocaaaaaaaaaaa
abaaaaaafjaaaaaeegiocaaaabaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
aaaaaaaafgbfbaaaacaaaaaaegiacaaaabaaaaaaajaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaabaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaabaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaaaaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaa
abaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaa
agiacaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaabaaaaaabcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
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
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 3 R-regs
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
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
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
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
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
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedhhbhgoikjeclhbkgpclalmgignohmnobabaaaaaaleajaaaaaeaaaaaa
daaaaaaadmadaaaadeaiaaaapmaiaaaaebgpgodjaeadaaaaaeadaaaaaaacpopp
kaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
alaaoekaaeaaaaaeaaaaadiaakaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
amaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabgaaaakabgaaaaka
abaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaae
abaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaapoaaeaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
ahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
paaeaaaaeaaaabaadmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadpccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaeaaaaaaegiocaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Vector 21 [_WorldSpaceLightPos0]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[21];
DP4 R2.z, R0, c[15];
DP4 R2.x, R0, c[13];
DP4 R2.y, R0, c[14];
MAD R0.xyz, R2, c[22].w, -vertex.position;
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
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 3 R-regs
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
Vector 20 [_WorldSpaceLightPos0]
Vector 21 [unity_Scale]
"vs_2_0
def c22, 0.50000000, 0, 0, 0
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
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mov r1, c12
dp4 r3.x, c20, r1
mad r0.xyz, r3, c21.w, -v0
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
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c22.x, c22.x
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjbfkacdejmpjlafdbejhgaifdnpggnpmabaaaaaaleajaaaaaeaaaaaa
daaaaaaadmadaaaadeaiaaaapmaiaaaaebgpgodjaeadaaaaaeadaaaaaaacpopp
kaacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaajaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbgaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
alaaoekaaeaaaaaeaaaaadiaakaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
amaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabgaaaakabgaaaaka
abaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaae
abaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeiaaeaaaaaeaaaaahia
aaaaoeiabfaappkaaaaaoejbaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoeka
aaaappjaaaaaoeiaafaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahia
abaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeia
aeaaaaaeadaaahoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffja
ahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
paaeaaaaeaaaabaadmabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaa
egiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaa
aiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaap
dccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
jgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Vector 21 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[22] = { { 0.5 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..21] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[21];
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
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 3 R-regs
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
Vector 20 [_WorldSpaceLightPos0]
"vs_2_0
def c21, 0.50000000, 0, 0, 0
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
dp4 r3.z, c20, r0
mov r0, c13
dp4 r3.y, c20, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c20, r1
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
dp4 r0.w, v0, c11
dp4 r0.z, v0, c10
dp4 oT4.y, r0, c17
dp4 oT4.x, r0, c16
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c21.x, c21.x
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedndmplpjfjlgjmhdfghopeajdolpmhhmaabaaaaaaheajaaaaaeaaaaaa
daaaaaaaciadaaaapeahaaaalmaiaaaaebgpgodjpaacaaaapaacaaaaaaacpopp
imacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaaiaaadaaakaaaaaaaaaaacaaamaaaiaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
alaaoekaaeaaaaaeaaaaadiaakaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
amaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiabfaaaakabfaaaaka
abaaaaacaaaaapiaafaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaae
abaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaoaaoekaaeaaaaaeaaaaapia
anaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabaaaoekaaaaappjaaaaaoeiaafaaaaadabaaadiaaaaaffia
acaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaiaabaaoeiaaeaaaaaeaaaaadia
adaaobkaaaaakkiaaaaaoeiaaeaaaaaeabaaamoaaeaabekaaaaappiaaaaaeeia
afaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
ajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcmeaeaaaaeaaaabaadbabaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadmccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakmccabaaaacaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
agaebaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaaacaaaaaaegiacaaa
acaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaacaaaaaaaiaaaaaa
agbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
acaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaadcaaaaapdccabaaa
acaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
jgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaa
acaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaa
fgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaabaaaaaah
cccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahbccabaaa
adaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaaheccabaaaadaaaaaa
egbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaacaaaaaa
amadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
ConstBuffer "$Globals" 128
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
ConstBuffer "$Globals" 64
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
ConstBuffer "$Globals" 128
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
ConstBuffer "$Globals" 128
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
ConstBuffer "$Globals" 128
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
 UsePass "Ford/Base_Passes/LOOT_GLOW"
}
Fallback "Diffuse"
}