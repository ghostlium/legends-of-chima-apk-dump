//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Glass_Basic" {
Properties {
 _MainTex ("Texture", 2D) = "white" {}
 _Cube ("Cubemap", CUBE) = "" {}
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.w, R1, c[5];
MOV R0.x, R3.w;
MOV R0.y, R2.w;
MOV R0.z, c[0].x;
MUL R1, R0.wxyy, R0.xyyw;
DP4 R2.z, R0.wxyz, c[16];
DP4 R2.y, R0.wxyz, c[15];
DP4 R2.x, R0.wxyz, c[14];
DP4 R0.z, R1, c[19];
DP4 R0.x, R1, c[17];
DP4 R0.y, R1, c[18];
ADD R2.xyz, R2, R0;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R1.xyz, R0, c[21].w, -vertex.position;
MUL R0.y, R3.w, R3.w;
MAD R1.w, R0, R0, -R0.y;
DP3 R0.x, vertex.normal, -R1;
MUL R0.xyz, vertex.normal, R0.x;
MAD R0.xyz, -R0, c[0].y, -R1;
MUL R3.xyz, R1.w, c[20];
ADD result.texcoord[3].xyz, R2, R3;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].z, R2.w;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R0.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 39 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
Vector 21 [_MainTex_ST]
"vs_2_0
def c22, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c20.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.w, r1, c4
mov r0.x, r3.w
mov r0.y, r2.w
mov r0.z, c22.x
mul r1, r0.wxyy, r0.xyyw
dp4 r2.z, r0.wxyz, c15
dp4 r2.y, r0.wxyz, c14
dp4 r2.x, r0.wxyz, c13
dp4 r0.z, r1, c18
dp4 r0.x, r1, c16
dp4 r0.y, r1, c17
add r2.xyz, r2, r0
mov r1.w, c22.x
mov r1.xyz, c12
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r1.xyz, r0, c20.w, -v0
mul r0.y, r3.w, r3.w
mad r1.w, r0, r0, -r0.y
dp3 r0.x, v1, -r1
mul r0.xyz, v1, r0.x
mad r0.xyz, -r0, c22.y, -r1
mul r3.xyz, r1.w, c19
add oT3.xyz, r2, r3
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.z, r2.w
mov oT2.y, r3.w
mov oT2.x, r0.w
mad oT0.xy, v2, c21, c21.zwzw
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
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedkebncnnhnghcalpohihcngaamaoelnknabaaaaaaaaakaaaaaeaaaaaa
daaaaaaafiadaaaajiaiaaaagaajaaaaebgpgodjcaadaaaacaadaaaaaaacpopp
laacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaaeaaaaalia
bbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabeaaoekaaeaaaaaeaaaaahiaaaaaoeiabfaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabaaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabfaappka
afaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
bgaaaakaajaaaaadabaaabiaadaaoekaaaaaoeiaajaaaaadabaaaciaaeaaoeka
aaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaagaaoekaacaaoeiaajaaaaadadaaaciaahaaoeka
acaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaajaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapia
akaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcdiafaaaa
eaaaabaaeoabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaf
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
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c16.y, -r0
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mad oT0.xy, v2, c15, c15.zwzw
mad oT2.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
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
eefiecedjmmjbfbdhkmhhphbgkibadibnfjeojpaabaaaaaammagaaaaaeaaaaaa
daaaaaaadmacaaaahmafaaaaeeagaaaaebgpgodjaeacaaaaaeacaaaaaaacpopp
kaabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaadaaaiaaaaaaaaaaacaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahia
aaaaoeiaapaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
diadaaaaeaaaabaamoaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [unity_Scale]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[14].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [unity_Scale]
Vector 14 [unity_LightmapST]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c13.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c16.y, -r0
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mad oT0.xy, v2, c15, c15.zwzw
mad oT2.xy, v3, c14, c14.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
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
eefiecedjmmjbfbdhkmhhphbgkibadibnfjeojpaabaaaaaammagaaaaaeaaaaaa
daaaaaaadmacaaaahmafaaaaeeagaaaaebgpgodjaeacaaaaaeacaaaaaaacpopp
kaabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaadaaaiaaaaaaaaaaacaabaaaafaaalaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoeka
acaaookaabaaaaacaaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahia
aaaaoeiaapaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefc
diadaaaaeaaaabaamoaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, vertex.normal, c[22].w;
DP3 R1.w, R0, c[6];
DP3 R0.w, R0, c[7];
DP3 R3.x, R0, c[5];
MOV R3.y, R1.w;
MOV R3.z, R0.w;
MUL R2, R3.xyzz, R3.yzzx;
MOV R3.w, c[0].x;
DP4 R0.z, R3, c[17];
DP4 R0.y, R3, c[16];
DP4 R0.x, R3, c[15];
DP4 R1.z, R2, c[20];
DP4 R1.x, R2, c[18];
DP4 R1.y, R2, c[19];
MOV R2.xyz, c[13];
ADD R1.xyz, R0, R1;
MOV R2.w, c[0].x;
DP4 R0.z, R2, c[11];
DP4 R0.x, R2, c[9];
DP4 R0.y, R2, c[10];
MAD R0.xyz, R0, c[22].w, -vertex.position;
DP3 R2.y, vertex.normal, -R0;
MUL R3.yzw, vertex.normal.xxyz, R2.y;
MAD R0.xyz, -R3.yzww, c[0].y, -R0;
MUL R2.x, R1.w, R1.w;
MAD R2.x, R3, R3, -R2;
MUL R2.xyz, R2.x, c[21];
ADD result.texcoord[3].xyz, R1, R2;
DP4 R2.w, vertex.position, c[4];
DP4 R2.z, vertex.position, c[3];
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP4 R2.x, vertex.position, c[1];
DP4 R2.y, vertex.position, c[2];
MUL R1.xyz, R2.xyww, c[0].z;
DP3 result.texcoord[1].x, R0, c[5];
MOV R0.x, R1;
MUL R0.y, R1, c[14].x;
ADD result.texcoord[4].xy, R0, R1.z;
MOV result.position, R2;
MOV result.texcoord[4].zw, R2;
MOV result.texcoord[2].z, R0.w;
MOV result.texcoord[2].y, R1.w;
MOV result.texcoord[2].x, R3;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 45 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c22.w
dp3 r1.w, r0, c5
dp3 r0.w, r0, c6
dp3 r3.x, r0, c4
mov r3.y, r1.w
mov r3.z, r0.w
mul r2, r3.xyzz, r3.yzzx
mov r3.w, c24.x
dp4 r0.z, r3, c17
dp4 r0.y, r3, c16
dp4 r0.x, r3, c15
dp4 r1.z, r2, c20
dp4 r1.x, r2, c18
dp4 r1.y, r2, c19
mov r2.xyz, c12
add r1.xyz, r0, r1
mov r2.w, c24.x
dp4 r0.z, r2, c10
dp4 r0.x, r2, c8
dp4 r0.y, r2, c9
mad r0.xyz, r0, c22.w, -v0
dp3 r2.y, v1, -r0
mul r3.yzw, v1.xxyz, r2.y
mad r0.xyz, -r3.yzww, c24.y, -r0
mul r2.x, r1.w, r1.w
mad r2.x, r3, r3, -r2
mul r2.xyz, r2.x, c21
add oT3.xyz, r1, r2
dp4 r2.w, v0, c3
dp4 r2.z, v0, c2
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp4 r2.x, v0, c0
dp4 r2.y, v0, c1
mul r1.xyz, r2.xyww, c24.z
dp3 oT1.x, r0, c4
mov r0.x, r1
mul r0.y, r1, c13.x
mad oT4.xy, r1.z, c14.zwzw, r0
mov oPos, r2
mov oT4.zw, r2
mov oT2.z, r0.w
mov oT2.y, r1.w
mov oT2.x, r3
mad oT0.xy, v2, c23, c23.zwzw
"
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
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedoajlchanhfifhblhjifpfllaelmgohicabaaaaaapmakaaaaaeaaaaaa
daaaaaaakeadaaaahmajaaaaeeakaaaaebgpgodjgmadaaaagmadaaaaaaacpopp
pmacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaahaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaacgaaahaaaeaaaaaaaaaa
adaaaaaaaeaaalaaaaaaaaaaadaaamaaadaaapaaaaaaaaaaadaabaaaafaabcaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaiadpaaaaaadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabgaappka
afaaaaadabaaahiaaaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabbaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
bhaaaakaajaaaaadabaaabiaaeaaoekaaaaaoeiaajaaaaadabaaaciaafaaoeka
aaaaoeiaajaaaaadabaaaeiaagaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaahaaoekaacaaoeiaajaaaaadadaaaciaaiaaoeka
acaaoeiaajaaaaadadaaaeiaajaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaakaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapia
alaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
adaaaakaafaaaaadabaaaiiaabaaaaiabhaaffkaafaaaaadabaaafiaaaaapeia
bhaaffkaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeia
ppppaaaafdeieefcnaafaaaaeaaaabaaheabaaaafjaaaaaeegiocaaaaaaaaaaa
aiaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
aaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
dkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaia
ebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
abaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaai
ccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaai
ecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaah
pcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaa
aeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaa
aeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaa
aeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaaakaabaaa
abaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, R2, c[7];
DP3 result.texcoord[1].y, R2, c[6];
DP3 result.texcoord[1].x, R2, c[5];
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c18.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c18.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c18.z
mul r1.y, r1, c13.x
dp3 oT1.z, r2, c6
dp3 oT1.y, r2, c5
dp3 oT1.x, r2, c4
mad oT3.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c17, c17.zwzw
mad oT2.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 112 [unity_LightmapST]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedhlcgbfjdehdillapjgocgkooncepgjjeabaaaaaaoaahaaaaaeaaaaaa
daaaaaaakaacaaaahiagaaaaeaahaaaaebgpgodjgiacaaaagiacaaaaaaacpopp
aeacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaahaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeaaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoaalaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaaka
afaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeiabbaaaaka
acaaaaadacaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaa
fdeieefcnaadaaaaeaaaabaapeaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, R2, c[7];
DP3 result.texcoord[1].y, R2, c[6];
DP3 result.texcoord[1].x, R2, c[5];
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c18.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c18.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c18.z
mul r1.y, r1, c13.x
dp3 oT1.z, r2, c6
dp3 oT1.y, r2, c5
dp3 oT1.x, r2, c4
mad oT3.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mad oT0.xy, v2, c17, c17.zwzw
mad oT2.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 112 [unity_LightmapST]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedhlcgbfjdehdillapjgocgkooncepgjjeabaaaaaaoaahaaaaaeaaaaaa
daaaaaaakaacaaaahiagaaaaeaahaaaaebgpgodjgiacaaaagiacaaaaaaacpopp
aeacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaahaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeaaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoaalaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaaka
afaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeiabbaaaaka
acaaaaadacaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaa
fdeieefcnaadaaaaeaaaabaapeaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
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
"!!ARBvp1.0
PARAM c[31] = { { 1, 2, 0 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[29].w;
DP3 R5.x, R3, c[7];
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MUL R1, R1, R1;
MOV R4.z, R5.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[16];
MAD R1, R0, R0, R1;
MAD R0, R5.x, R0, R2;
MUL R2, R1, c[17];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[24];
DP4 R2.y, R4, c[23];
DP4 R2.x, R4, c[22];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[21], R0;
DP4 R3.z, R1, c[27];
DP4 R3.x, R1, c[25];
DP4 R3.y, R1, c[26];
ADD R3.xyz, R2, R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.w, R3, R3;
MAD R1.w, R4.x, R4.x, -R0;
MAD R1.xyz, R2, c[29].w, -vertex.position;
DP3 R0.w, vertex.normal, -R1;
MUL R4.yzw, R1.w, c[28].xxyz;
MUL R2.xyz, vertex.normal, R0.w;
MAD R1.xyz, -R2, c[0].y, -R1;
ADD R3.xyz, R3, R4.yzww;
ADD result.texcoord[3].xyz, R3, R0;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].z, R5.x;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 69 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 29 [_MainTex_ST]
"vs_2_0
def c30, 1.00000000, 2.00000000, 0.00000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c28.w
dp3 r5.x, r3, c6
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp4 r0.x, v0, c5
add r1, -r0.x, c14
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mul r1, r1, r1
mov r4.z, r5.x
mov r4.w, c30.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c15
mad r1, r0, r0, r1
mad r0, r5.x, r0, r2
mul r2, r1, c16
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c30.x
dp4 r2.z, r4, c23
dp4 r2.y, r4, c22
dp4 r2.x, r4, c21
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.z
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mul r1, r4.xyzz, r4.yzzx
mad r0.xyz, r0.w, c20, r0
dp4 r3.z, r1, c26
dp4 r3.x, r1, c24
dp4 r3.y, r1, c25
add r3.xyz, r2, r3
mov r1.w, c30.x
mov r1.xyz, c12
dp4 r2.z, r1, c10
dp4 r2.y, r1, c9
dp4 r2.x, r1, c8
mul r0.w, r3, r3
mad r1.w, r4.x, r4.x, -r0
mad r1.xyz, r2, c28.w, -v0
dp3 r0.w, v1, -r1
mul r4.yzw, r1.w, c27.xxyz
mul r2.xyz, v1, r0.w
mad r1.xyz, -r2, c30.y, -r1
add r3.xyz, r3, r4.yzww
add oT3.xyz, r3, r0
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.z, r5.x
mov oT2.y, r3.w
mov oT2.x, r4
mad oT0.xy, v2, c29, c29.zwzw
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
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedhjpnplafjjankooghgnipbmciimikakhabaaaaaaeiapaaaaaeaaaaaa
daaaaaaafaafaaaaoaanaaaakiaoaaaaebgpgodjbiafaaaabiafaaaaaaacpopp
kiaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaajaabgaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiablaaoekaaeaaaaaeaaaaalia
bkaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabmaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabnaaoekaaeaaaaaeaaaaahiaaaaaoeiaboaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiabhaaoekaaeaaaaaeaaaaaliabgaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabiaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjabhaaoeka
aeaaaaaeaaaaahiabgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabiaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeiaacaaaaad
abaaapiaaaaaffibaeaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaad
adaaapiaaaaaaaibadaaoekaacaaaaadaaaaapiaaaaakkibafaaoekaaeaaaaae
acaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeia
acaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaac
aeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiabpaaaaka
aeaaaaaeacaaapiaacaaoeiaagaaoekaafaaaaiaafaaaaadafaaahiaacaaoeja
boaappkaafaaaaadagaaahiaafaaffiabhaaoekaaeaaaaaeafaaaliabgaakeka
afaaaaiaagaakeiaaeaaaaaeafaaahiabiaaoekaafaakkiaafaapeiaafaaaaad
abaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeia
aeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeia
aaaaoeiaalaaaaadaaaaapiaaaaaoeiabpaaffkaagaaaaacabaaabiaacaaaaia
agaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiia
acaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeabaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
ajaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappiaaaaaoeia
abaaaaacafaaaiiabpaaaakaajaaaaadabaaabiaalaaoekaafaaoeiaajaaaaad
abaaaciaamaaoekaafaaoeiaajaaaaadabaaaeiaanaaoekaafaaoeiaafaaaaad
acaaapiaafaacjiaafaakeiaajaaaaadadaaabiaaoaaoekaacaaoeiaajaaaaad
adaaaciaapaaoekaacaaoeiaajaaaaadadaaaeiabaaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaae
aaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacacaaahoaafaaoeiaaeaaaaae
abaaahiabbaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeia
afaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bfaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiappppaaaafdeieefciiaiaaaaeaaaabaaccacaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
aaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaa
aaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaa
kgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
afaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaa
adaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
adaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
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
Vector 31 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[32] = { { 1, 2, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
MUL R3.xyz, vertex.normal, c[30].w;
DP3 R5.x, R3, c[7];
DP3 R4.x, R3, c[5];
DP3 R3.w, R3, c[6];
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R5.x;
MOV R4.w, c[0].x;
MAD R2, R4.x, R0, R2;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R5.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MUL R1, R4.xyzz, R4.yzzx;
MAD R0.xyz, R0.w, c[22], R0;
DP4 R3.z, R1, c[28];
DP4 R3.x, R1, c[26];
DP4 R3.y, R1, c[27];
ADD R3.xyz, R2, R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.w, R3, R3;
MAD R1.w, R4.x, R4.x, -R0;
MAD R1.xyz, R2, c[30].w, -vertex.position;
DP3 R0.w, vertex.normal, -R1;
MUL R2.xyz, vertex.normal, R0.w;
MAD R1.xyz, -R2, c[0].y, -R1;
MUL R4.yzw, R1.w, c[29].xxyz;
ADD R3.xyz, R3, R4.yzww;
ADD result.texcoord[3].xyz, R3, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].w;
DP3 result.texcoord[1].x, R1, c[5];
MOV R1.x, R2;
MUL R1.y, R2, c[14].x;
ADD result.texcoord[4].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[2].z, R5.x;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
END
# 75 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 31 [_MainTex_ST]
"vs_2_0
def c32, 1.00000000, 2.00000000, 0.00000000, 0.50000000
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r3.xyz, v1, c30.w
dp3 r5.x, r3, c6
dp3 r4.x, r3, c4
dp3 r3.w, r3, c5
dp4 r0.x, v0, c5
add r1, -r0.x, c16
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r5.x
mov r4.w, c32.x
mad r2, r4.x, r0, r2
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r5.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c32.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.z
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mul r1, r4.xyzz, r4.yzzx
mad r0.xyz, r0.w, c22, r0
dp4 r3.z, r1, c28
dp4 r3.x, r1, c26
dp4 r3.y, r1, c27
add r3.xyz, r2, r3
mov r1.w, c32.x
mov r1.xyz, c12
dp4 r2.z, r1, c10
dp4 r2.y, r1, c9
dp4 r2.x, r1, c8
mul r0.w, r3, r3
mad r1.w, r4.x, r4.x, -r0
mad r1.xyz, r2, c30.w, -v0
dp3 r0.w, v1, -r1
mul r2.xyz, v1, r0.w
mad r1.xyz, -r2, c32.y, -r1
mul r4.yzw, r1.w, c29.xxyz
add r3.xyz, r3, r4.yzww
add oT3.xyz, r3, r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c32.w
dp3 oT1.x, r1, c4
mov r1.x, r2
mul r1.y, r2, c13.x
mad oT4.xy, r2.z, c14.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mov oT2.z, r5.x
mov oT2.y, r3.w
mov oT2.x, r4
mad oT0.xy, v2, c31, c31.zwzw
"
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
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedmemndcgdlmejmehljddaeabkekhnmalmabaaaaaaeebaaaaaaeaaaaaa
daaaaaaajmafaaaameaoaaaaimapaaaaebgpgodjgeafaaaageafaaaaaaacpopp
peaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaahaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaaacaaaiaaaeaaaaaaaaaa
acaacgaaahaaamaaaaaaaaaaadaaaaaaaeaabdaaaaaaaaaaadaaamaaajaabhaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafcaaaapkaaaaaiadpaaaaaaaaaaaaaadp
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabmaaoekaaeaaaaaeaaaaalia
blaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabnaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaboaaoekaaeaaaaaeaaaaahiaaaaaoeiabpaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiabiaaoekaaeaaaaaeaaaaaliabhaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabjaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjabiaaoeka
aeaaaaaeaaaaahiabhaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabjaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabkaaoekaaaaappjaaaaaoeiaacaaaaad
abaaapiaaaaaffibafaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaad
adaaapiaaaaaaaibaeaaoekaacaaaaadaaaaapiaaaaakkibagaaoekaaeaaaaae
acaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeia
acaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaac
aeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiacaaaaaka
aeaaaaaeacaaapiaacaaoeiaahaaoekaafaaaaiaafaaaaadafaaahiaacaaoeja
bpaappkaafaaaaadagaaahiaafaaffiabiaaoekaaeaaaaaeafaaaliabhaakeka
afaaaaiaagaakeiaaeaaaaaeafaaahiabjaaoekaafaakkiaafaapeiaafaaaaad
abaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeia
aeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeia
aaaaoeiaalaaaaadaaaaapiaaaaaoeiacaaaffkaagaaaaacabaaabiaacaaaaia
agaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiia
acaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffia
ajaaoekaaeaaaaaeabaaahiaaiaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahia
akaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappiaaaaaoeia
abaaaaacafaaaiiacaaaaakaajaaaaadabaaabiaamaaoekaafaaoeiaajaaaaad
abaaaciaanaaoekaafaaoeiaajaaaaadabaaaeiaaoaaoekaafaaoeiaafaaaaad
acaaapiaafaacjiaafaakeiaajaaaaadadaaabiaapaaoekaacaaoeiaajaaaaad
adaaaciabaaaoekaacaaoeiaajaaaaadadaaaeiabbaaoekaacaaoeiaacaaaaad
abaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaae
aaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacacaaahoaafaaoeiaaeaaaaae
abaaahiabcaaoekaaaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeia
afaaaaadaaaaapiaaaaaffjabeaaoekaaeaaaaaeaaaaapiabdaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
bgaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaad
abaaaiiaabaaaaiacaaakkkaafaaaaadabaaafiaaaaapeiacaaakkkaacaaaaad
aeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiappppaaaafdeieefc
caajaaaaeaaaabaaeiacaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
ahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
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
acaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaabaaaaaa
bkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaa
adaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaa
fgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaa
adaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaakgakbaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaadaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1, R0;
MUL R1.xyz, R1, c[2].y;
MUL R2.xyz, R1, fragment.texcoord[3];
DP3 R0.w, fragment.texcoord[2], c[0];
MUL R1.xyz, R1, c[1];
MAX R0.w, R0, c[2].x;
MUL R1.xyz, R0.w, R1;
MAD R1.xyz, R1, c[2].z, R2;
ADD result.color.xyz, R1, R0;
MOV result.color.w, c[2].x;
END
# 12 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c2, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r0, t0, s1
texld r1, t1, s0
mul r0.xyz, r0, r1
mul r2.xyz, r0, c2.x
mul_pp r3.xyz, r2, t3
dp3_pp r0.x, t2, c0
mul_pp r2.xyz, r2, c1
max_pp r0.x, r0, c2.y
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c2.z, r3
mov_pp r0.w, c2.y
add_pp r0.xyz, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedpdcpgpfdciaghppoaepjojggjoajmonjabaaaaaakiaeaaaaaeaaaaaa
daaaaaaalaabaaaaneadaaaaheaeaaaaebgpgodjhiabaaaahiabaaaaaaacpppp
deabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapka
ecaaaaadaaaaapiaaaaaoelaaaaioekaecaaaaadabaacpiaabaaoelaabaioeka
aiaaaaadaaaaciiaacaaoelaabaaoekaalaaaaadabaaciiaaaaappiaacaaffka
acaaaaadaaaaciiaabaappiaabaappiaafaaaaadaaaaahiaaaaaoeiaacaaaaka
afaaaaadaaaachiaabaaoeiaaaaaoeiaafaaaaadacaachiaaaaaoeiaaaaaoeka
afaaaaadaaaachiaaaaaoeiaadaaoelaaeaaaaaeaaaachiaacaaoeiaaaaappia
aaaaoeiaacaaaaadaaaachiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaacaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbmacaaaaeaaaaaaaihaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaai
bcaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaakocaabaaa
aaaaaaaaagajbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadp
efaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
aaaaaaahhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0].x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[0].y, R2;
MOV result.color.w, c[0].z;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c0, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xy
texld r0, t2, s2
texld r2, t1, s0
texld r1, t0, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
mul_pp r0.xyz, r0, r1
mov_pp r0.w, c0.z
mad_pp r0.xyz, r0, c0.y, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0_level_9_1
eefiecedljojlhagckjfhecemhpemnjbjgoihdniabaaaaaaoiadaaaaaeaaaaaa
daaaaaaagmabaaaacmadaaaaleadaaaaebgpgodjdeabaaaadeabaaaaaaacpppp
aeabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaebaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkabpaaaaacaaaaaajaacaiapka
abaaaaacaaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaad
abaaapiaaaaaoelaaaaioekaecaaaaadacaacpiaabaaoelaabaioekaafaaaaad
aaaaciiaaaaappiaaaaaffkaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
abaaahiaabaaoeiaaaaaaakaafaaaaadabaachiaacaaoeiaabaaoeiaaeaaaaae
aaaachiaabaaoeiaaaaaoeiaacaaoeiaabaaaaacaaaaciiaaaaakkkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcliabaaaaeaaaaaaagoaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1, R2;
MUL R1.xyz, R1, c[0].x;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[0].y, R2;
MOV result.color.w, c[0].z;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c0, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xy
texld r0, t2, s2
texld r2, t1, s0
texld r1, t0, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
mul_pp r0.xyz, r0, r1
mov_pp r0.w, c0.z
mad_pp r0.xyz, r0, c0.y, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
"ps_4_0_level_9_1
eefiecedljojlhagckjfhecemhpemnjbjgoihdniabaaaaaaoiadaaaaaeaaaaaa
daaaaaaagmabaaaacmadaaaaleadaaaaebgpgodjdeabaaaadeabaaaaaaacpppp
aeabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaebaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkabpaaaaacaaaaaajaacaiapka
abaaaaacaaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaad
abaaapiaaaaaoelaaaaioekaecaaaaadacaacpiaabaaoelaabaioekaafaaaaad
aaaaciiaaaaappiaaaaaffkaafaaaaadaaaachiaaaaaoeiaaaaappiaafaaaaad
abaaahiaabaaoeiaaaaaaakaafaaaaadabaachiaacaaoeiaabaaoeiaaeaaaaae
aaaachiaabaaoeiaaaaaoeiaacaaoeiaabaaaaacaaaaciiaaaaakkkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcliabaaaaeaaaaaaagoaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaebdiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TXP R2.x, fragment.texcoord[4], texture[2], 2D;
MUL R0.xyz, R0, R1;
MUL R0.xyz, R0, c[2].y;
MUL R2.yzw, R0.xxyz, fragment.texcoord[3].xxyz;
DP3 R0.w, fragment.texcoord[2], c[0];
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0, c[1];
MUL R0.w, R0, R2.x;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[2].z, R2.yzww;
ADD result.color.xyz, R0, R1;
MOV result.color.w, c[2].x;
END
# 14 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c2, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
texld r0, t0, s1
texldp r4, t4, s2
texld r1, t1, s0
mul r0.xyz, r0, r1
mul r0.xyz, r0, c2.x
mul_pp r3.xyz, r0, t3
mul_pp r2.xyz, r0, c1
dp3_pp r0.x, t2, c0
max_pp r0.x, r0, c2.y
mul_pp r0.x, r0, r4
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c2.z, r3
mov_pp r0.w, c2.y
add_pp r0.xyz, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedpkmabkjjgkbdmipcmmidbbholgnffnhpabaaaaaaieafaaaaaeaaaaaa
daaaaaaaamacaaaajiaeaaaafaafaaaaebgpgodjneabaaaaneabaaaaaaacpppp
imabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaagaaaaac
aaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappiaaeaaoelaecaaaaadaaaacpia
aaaaoeiaaaaioekaecaaaaadabaaapiaaaaaoelaabaioekaecaaaaadacaacpia
abaaoelaacaioekaaiaaaaadabaaciiaacaaoelaabaaoekaafaaaaadacaaciia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaacaappiaacaaffkaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaaahiaabaaoeiaacaaaakaafaaaaad
aaaachiaacaaoeiaaaaaoeiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaaaaaoeiaadaaoelaaeaaaaaeaaaachiaabaaoeiaabaappiaaaaaoeia
acaaaaadaaaachiaacaaoeiaaaaaoeiaabaaaaacaaaaciiaacaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcieacaaaaeaaaaaaakbaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
baaaaaaiccaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaa
deaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaak
ocaabaaaaaaaaaaaagajbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadp
aaaaaadpefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaa
abaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaaaeaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaaaaaaaaahhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 2, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[2], texture[3], 2D;
TXP R3.x, fragment.texcoord[3], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R3.yzw, R0.xxyz, R3.x;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, R2;
MUL R0.xyz, R0, c[0].y;
MUL R3.yzw, R3, c[0].z;
MIN R3.yzw, R0.xxyz, R3;
MUL R0.xyz, R0, R3.x;
MAX R0.xyz, R3.yzww, R0;
MUL R1.xyz, R1, c[0].x;
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[0];
END
# 15 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, 0.50000000, 8.00000000, 2.00000000, 0.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xy
dcl t3
texldp r4, t3, s2
texld r0, t2, s3
texld r1, t1, s0
texld r2, t0, s1
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r4.x
mul_pp r3.xyz, r3, c0.y
mul_pp r0.xyz, r0, c0.z
mul r2.xyz, r2, r1
mul_pp r4.xyz, r3, r4.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r4
mul r2.xyz, r2, c0.x
mov_pp r0.w, c0
mad_pp r0.xyz, r2, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0_level_9_1
eefiecedonhdiknahcodedcgocehpekfgaccbijlabaaaaaaimafaaaaaeaaaaaa
daaaaaaaaeacaaaaliaeaaaafiafaaaaebgpgodjmmabaaaammabaaaaaaacpppp
jiabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaacaaaaaa
abababaaaaacacaaadadadaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaeb
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaajaadaiapkaagaaaaac
aaaaaiiaacaapplaafaaaaadaaaaadiaaaaappiaacaaoelaabaaaaacabaaadia
aaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeia
adaioekaecaaaaadacaaapiaaaaaoelaabaioekaecaaaaadadaacpiaabaaoela
acaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
acaappiaafaaaaadabaaciiaabaappiaaaaaffkaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadaeaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaaeaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
aaaaaakaafaaaaadaaaachiaadaaoeiaaaaaoeiaaeaaaaaeaaaachiaaaaaoeia
abaaoeiaadaaoeiaabaaaaacaaaaciiaaaaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefckmacaaaaeaaaaaaaklaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 2, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[2], texture[3], 2D;
TXP R3.x, fragment.texcoord[3], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R3.yzw, R0.xxyz, R3.x;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, R2;
MUL R0.xyz, R0, c[0].y;
MUL R3.yzw, R3, c[0].z;
MIN R3.yzw, R0.xxyz, R3;
MUL R0.xyz, R0, R3.x;
MAX R0.xyz, R3.yzww, R0;
MUL R1.xyz, R1, c[0].x;
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[0];
END
# 15 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, 0.50000000, 8.00000000, 2.00000000, 0.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xy
dcl t3
texldp r4, t3, s2
texld r0, t2, s3
texld r1, t1, s0
texld r2, t0, s1
mul_pp r3.xyz, r0.w, r0
mul_pp r0.xyz, r0, r4.x
mul_pp r3.xyz, r3, c0.y
mul_pp r0.xyz, r0, c0.z
mul r2.xyz, r2, r1
mul_pp r4.xyz, r3, r4.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r4
mul r2.xyz, r2, c0.x
mov_pp r0.w, c0
mad_pp r0.xyz, r2, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0_level_9_1
eefiecedonhdiknahcodedcgocehpekfgaccbijlabaaaaaaimafaaaaaeaaaaaa
daaaaaaaaeacaaaaliaeaaaafiafaaaaebgpgodjmmabaaaammabaaaaaaacpppp
jiabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaacaaaaaa
abababaaaaacacaaadadadaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaeb
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaajaadaiapkaagaaaaac
aaaaaiiaacaapplaafaaaaadaaaaadiaaaaappiaacaaoelaabaaaaacabaaadia
aaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeia
adaioekaecaaaaadacaaapiaaaaaoelaabaioekaecaaaaadadaacpiaabaaoela
acaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaablia
acaappiaafaaaaadabaaciiaabaappiaaaaaffkaafaaaaadabaachiaabaaoeia
abaappiaakaaaaadaeaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaia
abaaoeiaalaaaaadabaachiaaeaaoeiaaaaaoeiaafaaaaadaaaaahiaacaaoeia
aaaaaakaafaaaaadaaaachiaadaaoeiaaaaaoeiaaeaaaaaeaaaachiaaaaaoeia
abaaoeiaadaaoeiaabaaaaacaaaaciiaaaaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefckmacaaaaeaaaaaaaklaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="Opaque" }
  ZWrite Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c16
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c20.y, -r0
mul r1.xyz, v1, c18.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
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
eefiecedghlkbknnooinjaicehlhccmmmpleaeomabaaaaaaieakaaaaaeaaaaaa
daaaaaaafiadaaaaaeajaaaammajaaaaebgpgodjcaadaaaacaadaaaaaaacpopp
lmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaabaaaaacaaaaahia
agaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
aoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefckeafaaaa
eaaaabaagjabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[17] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[15].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"vs_2_0
def c16, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c12
mov r1.w, c16.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c14.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c16.y, -r0
mul r1.xyz, v1, c14.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c13
mad oT0.xy, v2, c15, c15.zwzw
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
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
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
eefiecedojmkopobkfcljhemhocchmdeinnbignjabaaaaaalaahaaaaaeaaaaaa
daaaaaaahmacaaaaeiagaaaabaahaaaaebgpgodjeeacaaaaeeacaaaaaaacpopp
neabaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaadaaaiaaaaaaaaaaadaabaaaafaaalaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaabaaaaacaaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiaamaaoeka
aeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaanaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiaaoaaoekaaeaaaaaeaaaaahia
aaaaoeiaapaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
acaaoejaapaappkaafaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaalia
aiaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaakaaoekaaaaakkiaaaaapeia
afaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
ahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacadaaahoaadaaoekappppaaaafdeieefc
meadaaaaeaaaabaapbaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaaj
hcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
aaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].w, R0, c[16];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c16
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c20.y, -r0
mul r1.xyz, v1, c18.w
dp4 r0.w, v0, c7
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT4.w, r0, c15
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
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
eefieceddfochldklafdhhcnmfnifhblplbjcihoabaaaaaaieakaaaaaeaaaaaa
daaaaaaafiadaaaaaeajaaaammajaaaaebgpgodjcaadaaaacaadaaaaaaacpopp
lmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaabaaaaacaaaaahia
agaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
aoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoaaeaaoeka
aaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefckeafaaaa
eaaaabaagjabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
afaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[15];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c16
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c20.y, -r0
mul r1.xyz, v1, c18.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c14
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
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
eefiecedghlkbknnooinjaicehlhccmmmpleaeomabaaaaaaieakaaaaaeaaaaaa
daaaaaaafiadaaaaaeajaaaammajaaaaebgpgodjcaadaaaacaadaaaaaaacpopp
lmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaabaaaaacaaaaahia
agaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
aoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
anaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaappjaaaaaoeia
acaaaaadadaaahoaaaaaoeibahaaoekaafaaaaadaaaaapiaaaaaffjaanaaoeka
aeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoaaeaaoeka
aaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefckeafaaaa
eaaaabaagjabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
aaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaa
afaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Vector 19 [unity_Scale]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 1, 2 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[19].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R0.xyz, -R1, c[0].y, -R0;
MUL R1.xyz, vertex.normal, c[19].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].y, R0, c[14];
DP4 result.texcoord[4].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, 1.00000000, 2.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mov r1.xyz, c16
mov r1.w, c20.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c18.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r0.xyz, -r1, c20.y, -r0
mul r1.xyz, v1, c18.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT4.y, r0, c13
dp4 oT4.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c17
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 128
Matrix 48 [_LightMatrix0]
Vector 112 [_MainTex_ST]
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
eefiecedbfjlhbaakdnnfjahffcigbjmcpimbabjabaaaaaajaajaaaaaeaaaaaa
daaaaaaaaiadaaaabaaiaaaaniaiaaaaebgpgodjnaacaaaanaacaaaaaaacpopp
gmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaaacaaaaaaabaaahaaaaaaaaaa
adaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaabaaaaacaaaaahia
agaaoekaafaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahiaaaaaoeiabeaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
anaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
aoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabeaappkaafaaaaad
abaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaiaabaakeia
aeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffja
anaaoekaaeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeia
afaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaia
abaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeaaaaamoa
aeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaae
aaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacadaaahoa
ahaaoekappppaaaafdeieefcaaafaaaaeaaaabaaeaabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaa
dcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaa
ahaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaa
adaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabaaaaaaa
agiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaa
egiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaa
aaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaadaaaaaabdaaaaaa
dcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaadaaaaaabeaaaaaa
egbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaia
ebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaacaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R0.xyz, R0, R1;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].y;
DP3 R1.x, fragment.texcoord[2], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[1];
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[2], 2D;
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 16 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c1, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r2, t0, s1
texld r1, t1, s0
dp3 r0.x, t4, t4
mov r0.xy, r0.x
mul r1.xyz, r2, r1
mul r1.xyz, r1, c1.x
mul_pp r1.xyz, r1, c0
mov_pp r0.w, c1.y
texld r3, r0, s2
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t3
dp3_pp r0.x, t2, r0
max_pp r0.x, r0, c1.y
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedngfadghcpbpndijheioehpnfefoekcifabaaaaaafiafaaaaaeaaaaaa
daaaaaaaoiabaaaagmaeaaaaceafaaaaebgpgodjlaabaaaalaabaaaaaaacpppp
heabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajiacaiapkaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaaapiaaaaaoelaabaioekaecaaaaadacaacpiaabaaoelaacaioekaceaaaaac
adaachiaadaaoelaaiaaaaadabaaciiaacaaoelaadaaoeiaafaaaaadacaaciia
aaaaaaiaabaappiafiaaaaaeabaaciiaabaappiaacaappiaabaaffkaacaaaaad
abaaciiaabaappiaabaappiaafaaaaadaaaaahiaabaaoeiaabaaaakaafaaaaad
aaaachiaacaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaabaappiaaaaaoeiaabaaaaacaaaaaiiaabaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefchmacaaaaeaaaaaaajpaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaa
aaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaakocaabaaaaaaaaaaaagajbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadpefaaaaajpcaabaaa
abaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R0.xyz, R0, R1;
MOV R1.xyz, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].y;
DP3 R0.w, fragment.texcoord[2], R1;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[1].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
MOV result.color.w, c[1].x;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_cube s0
dcl_2d s1
def c1, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r0, t1, s0
texld r1, t0, s1
mul r1.xyz, r1, r0
mov_pp r0.xyz, t3
dp3_pp r0.x, t2, r0
mul r1.xyz, r1, c1.x
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c1.y
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmjceflglpenjilhefpmjeedhjfflfajnabaaaaaadaaeaaaaaeaaaaaa
daaaaaaaimabaaaafmadaaaapmadaaaaebgpgodjfeabaaaafeabaaaaaaacpppp
bmabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkaecaaaaadaaaaapiaaaaaoela
aaaioekaecaaaaadabaacpiaabaaoelaabaioekaafaaaaadaaaaahiaaaaaoeia
abaaaakaafaaaaadaaaachiaabaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeia
aaaaoekaabaaaaacabaaahiaacaaoelaaiaaaaadaaaaciiaabaaoeiaadaaoela
alaaaaadabaacbiaaaaappiaabaaffkaacaaaaadaaaaciiaabaaaaiaabaaaaia
afaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciiaabaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcmiabaaaaeaaaaaaahcaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
RCP R0.x, fragment.texcoord[4].w;
MAD R2.xy, fragment.texcoord[4], R0.x, c[1].y;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[1].x;
TEX R0.w, R2, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R1.w, R1.w, texture[3], 2D;
MUL R0.xyz, R0, R1;
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.x;
MUL R1.xyz, R1.x, fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[2], R1;
SLT R1.y, c[1].x, fragment.texcoord[4].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R0, c[1].y;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 22 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4
dp3 r1.x, t4, t4
mov r1.xy, r1.x
rcp r0.x, t4.w
mad r0.xy, t4, r0.x, c1.x
texld r2, r1, s3
texld r3, r0, s2
texld r0, t1, s0
texld r1, t0, s1
mul r0.xyz, r1, r0
mul r0.xyz, r0, c1.x
mul_pp r3.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
mul_pp r1.xyz, r1.x, t3
dp3_pp r1.x, t2, r1
cmp r0.x, -t4.z, c1.y, c1.z
mul_pp r0.x, r0, r3.w
mul_pp r0.x, r0, r2
max_pp r1.x, r1, c1.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r3
mul_pp r0.xyz, r0, c1.w
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_Cube] CUBE 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedblpgdajccmlbjhohlncjankbgdniopjmabaaaaaakmagaaaaaeaaaaaa
daaaaaaaeiacaaaamaafaaaahiagaaaaebgpgodjbaacaaaabaacaaaaaaacpppp
naabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaacaaaaaa
adababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajiadaiapka
agaaaaacaaaaaiiaaeaapplaaeaaaaaeaaaaadiaaeaaoelaaaaappiaabaaaaka
aiaaaaadabaaaiiaaeaaoelaaeaaoelaabaaaaacabaaadiaabaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaabaioekaecaaaaad
acaaapiaaaaaoelaacaioekaecaaaaadadaacpiaabaaoelaadaioekaafaaaaad
acaaciiaaaaappiaabaaaaiafiaaaaaeacaaciiaaeaakklbabaaffkaacaappia
ceaaaaacaaaachiaadaaoelaaiaaaaadadaaciiaacaaoelaaaaaoeiaalaaaaad
aaaacbiaadaappiaabaaffkaafaaaaadacaaciiaacaappiaaaaaaaiaacaaaaad
acaaciiaacaappiaacaappiaafaaaaadaaaaahiaacaaoeiaabaaaakaafaaaaad
aaaachiaadaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaacaappiaaaaaoeiaabaaaaacaaaaaiiaabaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefchaadaaaaeaaaaaaanmaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaa
afaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaa
aaaaaaaaagbjbaaaaeaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaa
jgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaadiaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaaaadpaaaaaadpefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R1.w, fragment.texcoord[4], texture[3], CUBE;
MUL R0.xyz, R0, R1;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.x;
MUL R1.xyz, R1.x, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].y;
DP3 R1.x, fragment.texcoord[2], R1;
MUL R0.xyz, R0, c[0];
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[2], 2D;
MUL R1.y, R0.w, R1.w;
MAX R0.w, R1.x, c[1].x;
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 18 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c1, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r2, t4, s3
texld r1, t0, s1
dp3 r0.x, t4, t4
mov r0.xy, r0.x
texld r3, r0, s2
texld r0, t1, s0
mul r0.xyz, r1, r0
mul r1.xyz, r0, c1.x
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t3
dp3_pp r0.x, t2, r0
mul_pp r1.xyz, r1, c0
mul r2.x, r3, r2.w
max_pp r0.x, r0, c1.y
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Cube] CUBE 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfknjjnegnphgkhbjfgmicmjgnjeenchaabaaaaaaoaafaaaaaeaaaaaa
daaaaaaabeacaaaapeaeaaaakmafaaaaebgpgodjnmabaaaanmabaaaaaaacpppp
jmabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaadaaaaaa
acababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajiadaiapka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaaapiaaaaaoeiaabaioekaecaaaaadabaaapiaaeaaoelaaaaioekaecaaaaad
acaaapiaaaaaoelaacaioekaecaaaaadadaacpiaabaaoelaadaioekaafaaaaad
acaaciiaaaaaaaiaabaappiaceaaaaacaaaachiaadaaoelaaiaaaaadadaaciia
acaaoelaaaaaoeiaalaaaaadaaaacbiaadaappiaabaaffkaafaaaaadacaaciia
acaappiaaaaaaaiaacaaaaadacaaciiaacaappiaacaappiaafaaaaadaaaaahia
acaaoeiaabaaaakaafaaaaadaaaachiaadaaoeiaaaaaoeiaafaaaaadaaaachia
aaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeiaabaaaaacaaaaaiia
abaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcniacaaaaeaaaaaaa
lgaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaafaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaaapaaaaahbcaabaaa
aaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaakocaabaaa
aaaaaaaaagajbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadp
efaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
adaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R0.w, fragment.texcoord[4], texture[2], 2D;
MUL R0.xyz, R0, R1;
MOV R1.xyz, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].y;
DP3 R1.x, fragment.texcoord[2], R1;
MAX R1.x, R1, c[1];
MUL R0.xyz, R0, c[0];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
MOV result.color.w, c[1].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c1, 0.50000000, 0.00000000, 2.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xy
texld r0, t1, s0
texld r2, t4, s2
texld r1, t0, s1
mul r0.xyz, r1, r0
mul r1.xyz, r0, c1.x
mov_pp r0.xyz, t3
dp3_pp r0.x, t2, r0
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c1.y
mul_pp r0.x, r0, r2.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Cube] CUBE 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedefpojgapdcnfjjlegoclknglakigodafabaaaaaaneaeaaaaaeaaaaaa
daaaaaaammabaaaaoiadaaaakaaeaaaaebgpgodjjeabaaaajeabaaaaaaacpppp
fiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaji
acaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadabaaapiaaaaaoelaabaioekaecaaaaadacaacpiaabaaoelaacaioeka
abaaaaacaaaaahiaacaaoelaaiaaaaadabaaciiaaaaaoeiaadaaoelaafaaaaad
acaaciiaaaaappiaabaappiafiaaaaaeabaaciiaabaappiaacaappiaabaaffka
acaaaaadabaaciiaabaappiaabaappiaafaaaaadaaaaahiaabaaoeiaabaaaaka
afaaaaadaaaachiaacaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoeka
afaaaaadaaaachiaabaappiaaaaaoeiaabaaaaacaaaaaiiaabaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcbeacaaaaeaaaaaaaifaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaakhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaapgapbaaaaaaaaaaapgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "RenderType"="Opaque" }
  Fog { Mode Off }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"!!ARBvp1.0
PARAM c[10] = { program.local[0],
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[9].w;
DP3 result.texcoord[0].z, R0, c[7];
DP3 result.texcoord[0].y, R0, c[6];
DP3 result.texcoord[0].x, R0, c[5];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 8 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
mul r0.xyz, v1, c8.w
dp3 oT0.z, r0, c6
dp3 oT0.y, r0, c5
dp3 oT0.x, r0, c4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedfpmclfcoogjdlpcnlpgnljpcdonknacmabaaaaaaaaaeaaaaaeaaaaaa
daaaaaaafiabaaaaoaacaaaakiadaaaaebgpgodjcaabaaaacaabaaaaaaacpopp
neaaaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaamaaadaaafaaaaaaaaaaaaaabeaaabaaaiaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapja
afaaaaadaaaaahiaacaaoejaaiaappkaafaaaaadabaaahiaaaaaffiaagaaoeka
aeaaaaaeaaaaaliaafaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahoaahaaoeka
aaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaacaaoekaaeaaaaaeaaaaapia
abaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefciaabaaaa
eaaaabaagaaaaaaafjaaaaaeegiocaaaaaaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadhccabaaaabaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaaaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaaaaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaaaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaaaaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaaaaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaaaaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaabaaaaaa
egiccaaaaaaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapaaaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
"!!ARBfp1.0
PARAM c[1] = { { 0, 0.5 } };
MAD result.color.xyz, fragment.texcoord[0], c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 2 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
"ps_2_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl t0.xyz
mad_pp r0.xyz, t0, c0.x, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
"ps_4_0_level_9_1
eefiecedbcfagkfmhchaonghfjackccpkbjompokabaaaaaalmabaaaaaeaaaaaa
daaaaaaaleaaaaaadaabaaaaiiabaaaaebgpgodjhmaaaaaahmaaaaaaaaacpppp
fiaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaachlaaeaaaaaeaaaachiaaaaaoelaaaaaaakaaaaaaakaabaaaaacaaaaciia
aaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcheaaaaaaeaaaaaaa
bnaaaaaagcbaaaadhcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaadcaaaaap
hccabaaaaaaaaaaaegbcbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheofaaaaaaaacaaaaaaaiaaaaaa
diaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "RenderType"="Opaque" }
  ZWrite Off
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
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
MUL R0.z, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.x, R1, c[18];
DP4 R3.y, R1, c[19];
ADD R2.xyz, R2, R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
MAD R1.xyz, R3, c[22].w, -vertex.position;
MAD R0.w, R0.x, R0.x, -R0.z;
DP3 R0.y, vertex.normal, -R1;
MUL R0.xyz, vertex.normal, R0.y;
MAD R0.xyz, -R0, c[0].y, -R1;
MUL R3.xyz, R0.w, c[21];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
ADD result.texcoord[3].xyz, R2, R3;
MUL R2.xyz, R1.xyww, c[0].z;
DP3 result.texcoord[1].x, R0, c[5];
MOV R0.x, R2;
MUL R0.y, R2, c[14].x;
ADD result.texcoord[2].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[2].zw, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 41 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.z, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.x, r1, c18
dp4 r3.y, r1, c19
add r2.xyz, r2, r3
mov r1.w, c24.x
mov r1.xyz, c12
dp4 r3.z, r1, c10
dp4 r3.x, r1, c8
dp4 r3.y, r1, c9
mad r1.xyz, r3, c22.w, -v0
mad r0.w, r0.x, r0.x, -r0.z
dp3 r0.y, v1, -r1
mul r0.xyz, v1, r0.y
mad r0.xyz, -r0, c24.y, -r1
mul r3.xyz, r0.w, c21
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
add oT3.xyz, r2, r3
mul r2.xyz, r1.xyww, c24.z
dp3 oT1.x, r0, c4
mov r0.x, r2
mul r0.y, r2, c13.x
mad oT2.xy, r2.z, c14.zwzw, r0
mov oPos, r1
mov oT2.zw, r1
mad oT0.xy, v2, c23, c23.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedppnmeohfbjgolfdggmnhpdcilmheacepabaaaaaaliakaaaaaeaaaaaa
daaaaaaajiadaaaafaajaaaabiakaaaaebgpgodjgaadaaaagaadaaaaaaacpopp
paacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaacgaaahaaaeaaaaaaaaaa
adaaaaaaaeaaalaaaaaaaaaaadaaamaaadaaapaaaaaaaaaaadaabaaaafaabcaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaiabhaaaakaafaaaaad
abaaafiaaaaapeiabhaaaakaacaaaaadacaaadoaabaakkiaabaaomiaafaaaaad
abaaahiaacaaoejabgaappkaafaaaaadacaaahiaabaaffiabaaaoekaaeaaaaae
abaaaliaapaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiabbaaoekaabaakkia
abaapeiaabaaaaacabaaaiiabhaaffkaajaaaaadacaaabiaaeaaoekaabaaoeia
ajaaaaadacaaaciaafaaoekaabaaoeiaajaaaaadacaaaeiaagaaoekaabaaoeia
afaaaaadadaaapiaabaacjiaabaakeiaajaaaaadaeaaabiaahaaoekaadaaoeia
ajaaaaadaeaaaciaaiaaoekaadaaoeiaajaaaaadaeaaaeiaajaaoekaadaaoeia
acaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadabaaaciaabaaffiaabaaffia
aeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffibaeaaaaaeadaaahoaakaaoeka
abaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefclaafaaaa
eaaaabaagmabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 2, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[15];
DP4 R0.x, R1, c[13];
DP4 R0.y, R1, c[14];
MAD R0.xyz, R0, c[20].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[19].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[19];
DP3 result.texcoord[1].z, R2, c[11];
DP3 result.texcoord[1].y, R2, c[10];
DP3 result.texcoord[1].x, R2, c[9];
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[19].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
"vs_2_0
def c23, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c16
mov r1.w, c23.x
dp4 r0.z, r1, c14
dp4 r0.x, r1, c12
dp4 r0.y, r1, c13
mad r0.xyz, r0, c20.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c23.y, -r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c23.z
mul r1.y, r1, c17.x
mad oT2.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov r0.x, c19.w
add r0.y, c23.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c19
dp3 oT1.z, r2, c10
dp3 oT1.y, r2, c9
dp3 oT1.x, r2, c8
mov oT2.zw, r0
mul oT4.xyz, r1, c19.w
mad oT0.xy, v2, c22, c22.zwzw
mad oT3.xy, v3, c21, c21.zwzw
mul oT4.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
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
eefiecedofbggbfmoaalgbepobjlhkjekibkmacmabaaaaaalaakaaaaaeaaaaaa
daaaaaaaieadaaaadaajaaaapiajaaaaebgpgodjemadaaaaemadaaaaaaacpopp
oiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaabjaaabaaafaaaaaaaaaa
adaaaaaaaiaaagaaaaaaaaaaadaaamaaajaaaoaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbhaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabaaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaahaaoeka
aeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabhaaaakaafaaaaad
abaaafiaaaaapeiabhaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffjaapaaoeka
aeaaaaaeabaaahiaaoaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaahiabaaaoeka
aaaakkjaabaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappjaabaaoeiaacaaaaad
abaaahiaabaaoeiaafaaoekbafaaaaadadaaahoaabaaoeiaafaappkaafaaaaad
abaaabiaaaaaffjaalaakkkaaeaaaaaeabaaabiaakaakkkaaaaaaajaabaaaaia
aeaaaaaeabaaabiaamaakkkaaaaakkjaabaaaaiaaeaaaaaeabaaabiaanaakkka
aaaappjaabaaaaiaabaaaaacabaaaiiaafaappkaacaaaaadabaaaciaabaappib
bhaaffkaafaaaaadadaaaioaabaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeia
ppppaaaafdeieefckeafaaaaeaaaabaagjabaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bkaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, R2, c[7];
DP3 result.texcoord[1].y, R2, c[6];
DP3 result.texcoord[1].x, R2, c[5];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c18.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c18.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c18.z
mul r1.y, r1, c13.x
dp3 oT1.z, r2, c6
dp3 oT1.y, r2, c5
dp3 oT1.x, r2, c4
mad oT2.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT2.zw, r0
mad oT0.xy, v2, c17, c17.zwzw
mad oT3.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedfojiaciakclledhmgklodoklbnecoophabaaaaaaoaahaaaaaeaaaaaa
daaaaaaakaacaaaahiagaaaaeaahaaaaebgpgodjgiacaaaagiacaaaaaaacpopp
aeacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeaaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoaalaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaagaaoeka
aeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaad
abaaafiaaaaapeiabbaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaa
fdeieefcnaadaaaaeaaaabaapeaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
Vector 23 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[24] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..23] };
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
MUL R0.z, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.x, R1, c[18];
DP4 R3.y, R1, c[19];
ADD R2.xyz, R2, R3;
MOV R1.w, c[0].x;
MOV R1.xyz, c[13];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
MAD R1.xyz, R3, c[22].w, -vertex.position;
MAD R0.w, R0.x, R0.x, -R0.z;
DP3 R0.y, vertex.normal, -R1;
MUL R0.xyz, vertex.normal, R0.y;
MAD R0.xyz, -R0, c[0].y, -R1;
MUL R3.xyz, R0.w, c[21];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
ADD result.texcoord[3].xyz, R2, R3;
MUL R2.xyz, R1.xyww, c[0].z;
DP3 result.texcoord[1].x, R0, c[5];
MOV R0.x, R2;
MUL R0.y, R2, c[14].x;
ADD result.texcoord[2].xy, R0, R2.z;
MOV result.position, R1;
MOV result.texcoord[2].zw, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 41 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
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
Vector 23 [_MainTex_ST]
"vs_2_0
def c24, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c24.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.z, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.x, r1, c18
dp4 r3.y, r1, c19
add r2.xyz, r2, r3
mov r1.w, c24.x
mov r1.xyz, c12
dp4 r3.z, r1, c10
dp4 r3.x, r1, c8
dp4 r3.y, r1, c9
mad r1.xyz, r3, c22.w, -v0
mad r0.w, r0.x, r0.x, -r0.z
dp3 r0.y, v1, -r1
mul r0.xyz, v1, r0.y
mad r0.xyz, -r0, c24.y, -r1
mul r3.xyz, r0.w, c21
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
add oT3.xyz, r2, r3
mul r2.xyz, r1.xyww, c24.z
dp3 oT1.x, r0, c4
mov r0.x, r2
mul r0.y, r2, c13.x
mad oT2.xy, r2.z, c14.zwzw, r0
mov oPos, r1
mov oT2.zw, r1
mad oT0.xy, v2, c23, c23.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedppnmeohfbjgolfdggmnhpdcilmheacepabaaaaaaliakaaaaaeaaaaaa
daaaaaaajiadaaaafaajaaaabiakaaaaebgpgodjgaadaaaagaadaaaaaaacpopp
paacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaacgaaahaaaeaaaaaaaaaa
adaaaaaaaeaaalaaaaaaaaaaadaaamaaadaaapaaaaaaaaaaadaabaaaafaabcaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbhaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaac
aaaaahiaacaaoekaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaiabhaaaakaafaaaaad
abaaafiaaaaapeiabhaaaakaacaaaaadacaaadoaabaakkiaabaaomiaafaaaaad
abaaahiaacaaoejabgaappkaafaaaaadacaaahiaabaaffiabaaaoekaaeaaaaae
abaaaliaapaakekaabaaaaiaacaakeiaaeaaaaaeabaaahiabbaaoekaabaakkia
abaapeiaabaaaaacabaaaiiabhaaffkaajaaaaadacaaabiaaeaaoekaabaaoeia
ajaaaaadacaaaciaafaaoekaabaaoeiaajaaaaadacaaaeiaagaaoekaabaaoeia
afaaaaadadaaapiaabaacjiaabaakeiaajaaaaadaeaaabiaahaaoekaadaaoeia
ajaaaaadaeaaaciaaiaaoekaadaaoeiaajaaaaadaeaaaeiaajaaoekaadaaoeia
acaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadabaaaciaabaaffiaabaaffia
aeaaaaaeabaaabiaabaaaaiaabaaaaiaabaaffibaeaaaaaeadaaahoaakaaoeka
abaaaaiaacaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefclaafaaaa
eaaaabaagmabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaa
aaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
acaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_ProjectionParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 2, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[17];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[15];
DP4 R0.x, R1, c[13];
DP4 R0.y, R1, c[14];
MAD R0.xyz, R0, c[20].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[18].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[19].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[19];
DP3 result.texcoord[1].z, R2, c[11];
DP3 result.texcoord[1].y, R2, c[10];
DP3 result.texcoord[1].x, R2, c[9];
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[19].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[21], c[21].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 32 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceCameraPos]
Vector 17 [_ProjectionParams]
Vector 18 [_ScreenParams]
Vector 19 [unity_ShadowFadeCenterAndType]
Vector 20 [unity_Scale]
Vector 21 [unity_LightmapST]
Vector 22 [_MainTex_ST]
"vs_2_0
def c23, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c16
mov r1.w, c23.x
dp4 r0.z, r1, c14
dp4 r0.x, r1, c12
dp4 r0.y, r1, c13
mad r0.xyz, r0, c20.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c23.y, -r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c23.z
mul r1.y, r1, c17.x
mad oT2.xy, r1.z, c18.zwzw, r1
mov oPos, r0
mov r0.x, c19.w
add r0.y, c23.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c19
dp3 oT1.z, r2, c10
dp3 oT1.y, r2, c9
dp3 oT1.x, r2, c8
mov oT2.zw, r0
mul oT4.xyz, r1, c19.w
mad oT0.xy, v2, c22, c22.zwzw
mad oT3.xy, v3, c21, c21.zwzw
mul oT4.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
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
eefiecedofbggbfmoaalgbepobjlhkjekibkmacmabaaaaaalaakaaaaaeaaaaaa
daaaaaaaieadaaaadaajaaaapiajaaaaebgpgodjemadaaaaemadaaaaaaacpopp
oiacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaabjaaabaaafaaaaaaaaaa
adaaaaaaaiaaagaaaaaaaaaaadaaamaaajaaaoaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbhaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaalia
bcaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiabfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoabaaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaahaaoeka
aeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabhaaaakaafaaaaad
abaaafiaaaaapeiabhaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaafaaaaadabaaahiaaaaaffjaapaaoeka
aeaaaaaeabaaahiaaoaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaahiabaaaoeka
aaaakkjaabaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappjaabaaoeiaacaaaaad
abaaahiaabaaoeiaafaaoekbafaaaaadadaaahoaabaaoeiaafaappkaafaaaaad
abaaabiaaaaaffjaalaakkkaaeaaaaaeabaaabiaakaakkkaaaaaaajaabaaaaia
aeaaaaaeabaaabiaamaakkkaaaaakkjaabaaaaiaaeaaaaaeabaaabiaanaakkka
aaaappjaabaaaaiaabaaaaacabaaaiiaafaappkaacaaaaadabaaaciaabaappib
bhaaffkaafaaaaadadaaaioaabaaffiaabaaaaibaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeia
ppppaaaafdeieefckeafaaaaeaaaabaagjabaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bkaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaiaebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaa
aaaaaaaackiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaa
adaaaaaaaeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaackiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaa
bjaaaaaaabeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_ProjectionParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1, 2, 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R1.xyz, c[13];
MOV R1.w, c[0].x;
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, vertex.normal, -R0;
MUL R1.xyz, vertex.normal, R0.w;
MAD R2.xyz, -R1, c[0].y, -R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[14].x;
DP3 result.texcoord[1].z, R2, c[7];
DP3 result.texcoord[1].y, R2, c[6];
DP3 result.texcoord[1].x, R2, c[5];
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 23 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceCameraPos]
Vector 13 [_ProjectionParams]
Vector 14 [_ScreenParams]
Vector 15 [unity_Scale]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, 1.00000000, 2.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.xyz, c12
mov r1.w, c18.x
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r0.xyz, r0, c15.w, -v0
dp3 r0.w, v1, -r0
mul r1.xyz, v1, r0.w
mad r2.xyz, -r1, c18.y, -r0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c18.z
mul r1.y, r1, c13.x
dp3 oT1.z, r2, c6
dp3 oT1.y, r2, c5
dp3 oT1.x, r2, c4
mad oT2.xy, r1.z, c14.zwzw, r1
mov oPos, r0
mov oT2.zw, r0
mad oT0.xy, v2, c17, c17.zwzw
mad oT3.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 112
Vector 48 [unity_LightmapST]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
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
eefiecedfojiaciakclledhmgklodoklbnecoophabaaaaaaoaahaaaaaeaaaaaa
daaaaaaakaacaaaahiagaaaaeaahaaaaebgpgodjgiacaaaagiacaaaaaaacpopp
aeacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaadaaajaaaaaaaaaaacaabaaaafaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaac
aaaaahiaadaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeia
acaaaaadaaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappka
aaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappia
aaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahia
aaaaffiaakaaoekaaeaaaaaeaaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaae
abaaahoaalaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaagaaoeka
aeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaaeaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaad
abaaafiaaaaapeiabbaaaakaacaaaaadacaaadoaabaakkiaabaaomiaaeaaaaae
aaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaa
fdeieefcnaadaaaaeaaaabaapeaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaaadaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaa
acaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R1.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R2.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R2.xyz, R2, R0;
LG2 R1.x, R1.x;
LG2 R1.z, R1.z;
LG2 R1.y, R1.y;
ADD R1.xyz, -R1, fragment.texcoord[3];
MUL R2.xyz, R2, c[0].x;
MAD result.color.xyz, R2, R1, R0;
MOV result.color.w, c[0].y;
END
# 11 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c0, 0.50000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xyz
texldp r0, t2, s2
texld r2, t1, s0
texld r1, t0, s1
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, t3
mov_pp r0.w, c0.y
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
"ps_4_0_level_9_1
eefiecedfocmbmnodebpggdmnldnbkbdpmfjdgbkabaaaaaagaaeaaaaaeaaaaaa
daaaaaaakiabaaaaimadaaaacmaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
eaabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajiabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadaaaacpiaaaaaoeia
acaioekaecaaaaadabaaapiaaaaaoelaaaaioekaecaaaaadacaacpiaabaaoela
abaioekaapaaaaacadaacbiaaaaaaaiaapaaaaacadaacciaaaaaffiaapaaaaac
adaaceiaaaaakkiaacaaaaadaaaachiaadaaoeibadaaoelaafaaaaadabaaahia
abaaoeiaaaaaaakaafaaaaadabaachiaacaaoeiaabaaoeiaaeaaaaaeaaaachia
abaaoeiaaaaaoeiaacaaoeiaabaaaaacaaaaciiaaaaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcnmabaaaaeaaaaaaahhaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaafhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaa
aeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[3], texture[4], 2D;
TEX R1, fragment.texcoord[3], texture[3], 2D;
TEX R2.xyz, fragment.texcoord[0], texture[1], 2D;
TXP R4.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R3.xyz, fragment.texcoord[1], texture[0], CUBE;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[1].y;
DP4 R1.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[1].y, -R0;
MAD_SAT R0.w, R0, c[0].z, c[0];
MAD R0.xyz, R0.w, R1, R0;
MUL R1.xyz, R2, R3;
LG2 R2.x, R4.x;
LG2 R2.y, R4.y;
LG2 R2.z, R4.z;
ADD R0.xyz, -R2, R0;
MUL R1.xyz, R1, c[1].x;
MAD result.color.xyz, R1, R0, R3;
MOV result.color.w, c[1].z;
END
# 22 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c1, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xy
dcl t4
texldp r4, t2, s2
texld r2, t3, s4
texld r0, t3, s3
texld r1, t1, s0
texld r3, t0, s1
mul_pp r5.xyz, r0.w, r0
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c1.y
dp4 r0.x, t4, t4
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r5.xyz, r5, c1.y, -r2
mad_sat r0.x, r0, c0.z, c0.w
mad_pp r0.xyz, r0.x, r5, r2
log_pp r2.x, r4.x
log_pp r2.y, r4.y
log_pp r2.z, r4.z
add_pp r0.xyz, -r2, r0
mul r3.xyz, r3, r1
mul r2.xyz, r3, c1.x
mov_pp r0.w, c1.z
mad_pp r0.xyz, r2, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpnkjiffphgkjnkeccodaigmcefiidenoabaaaaaapmagaaaaaeaaaaaa
daaaaaaajeacaaaabaagaaaamiagaaaaebgpgodjfmacaaaafmacaaaaaaacpppp
biacaaaaeeaaaaaaabaadiaaaaaaeeaaaaaaeeaaafaaceaaaaaaeeaaabaaaaaa
aaababaaacacacaaadadadaaaeaeaeaaaaaaafaaabaaaaaaaaaaaaaaaaacpppp
fbaaaaafabaaapkaaaaaaadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaajaaaaadaaaaaiiaadaaoelaadaaoelaahaaaaacaaaaabiaaaaappia
agaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaadbiaaaaaaaiaaaaakkkaaaaappka
abaaaaacabaaadiaaaaabllaagaaaaacaaaaaciaacaapplaafaaaaadacaaadia
aaaaffiaacaaoelaecaaaaadadaacpiaabaaoeiaaeaioekaecaaaaadabaacpia
abaaoeiaadaioekaecaaaaadacaacpiaacaaoeiaacaioekaecaaaaadaeaaapia
aaaaoelaaaaioekaecaaaaadafaacpiaabaaoelaabaioekaafaaaaadacaaciia
adaappiaabaaffkaafaaaaadaaaacoiaadaabliaacaappiaafaaaaadabaaciia
abaappiaabaaffkaaeaaaaaeabaachiaabaappiaabaaoeiaaaaablibaeaaaaae
aaaachiaaaaaaaiaabaaoeiaaaaabliaapaaaaacabaacbiaacaaaaiaapaaaaac
abaacciaacaaffiaapaaaaacabaaceiaacaakkiaacaaaaadaaaachiaaaaaoeia
abaaoeibafaaaaadabaaahiaaeaaoeiaabaaaakaafaaaaadabaachiaafaaoeia
abaaoeiaaeaaaaaeaaaachiaabaaoeiaaaaaoeiaafaaoeiaabaaaaacaaaaciia
abaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcheadaaaaeaaaaaaa
nnaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaa
aeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaa
dkiacaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaa
fgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaafhcaabaaaabaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaia
ebaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaa
egbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R0, fragment.texcoord[3], texture[3], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1, R2;
MUL R0.xyz, R0.w, R0;
LG2 R3.x, R3.x;
LG2 R3.z, R3.z;
LG2 R3.y, R3.y;
MAD R0.xyz, R0, c[0].y, -R3;
MUL R1.xyz, R1, c[0].x;
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[0].z;
END
# 13 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xy
texldp r3, t2, s2
texld r0, t3, s3
texld r2, t1, s0
texld r1, t0, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
log_pp r3.x, r3.x
log_pp r3.z, r3.z
log_pp r3.y, r3.y
mad_pp r0.xyz, r0, c0.y, -r3
mov_pp r0.w, c0.z
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0_level_9_1
eefiecedjkmddgjjiaagmddapdbnkkbnhkkebcejabaaaaaapiaeaaaaaeaaaaaa
daaaaaaanmabaaaaceaeaaaameaeaaaaebgpgodjkeabaaaakeabaaaaaaacpppp
haabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaabaaaaaa
aaababaaacacacaaadadadaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaeb
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaji
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaabaaaaac
aaaaadiaaaaabllaagaaaaacaaaaaeiaacaapplaafaaaaadabaaadiaaaaakkia
acaaoelaecaaaaadaaaacpiaaaaaoeiaadaioekaecaaaaadabaacpiaabaaoeia
acaioekaecaaaaadacaaapiaaaaaoelaaaaioekaecaaaaadadaacpiaabaaoela
abaioekaafaaaaadaaaaciiaaaaappiaaaaaffkaapaaaaacaeaacbiaabaaaaia
apaaaaacaeaacciaabaaffiaapaaaaacaeaaceiaabaakkiaaeaaaaaeaaaachia
aaaappiaaaaaoeiaaeaaoeibafaaaaadabaaahiaacaaoeiaaaaaaakaafaaaaad
abaachiaadaaoeiaabaaoeiaaeaaaaaeaaaachiaabaaoeiaaaaaoeiaadaaoeia
abaaaaacaaaaciiaaaaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
eaacaaaaeaaaaaaajaaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafidaaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
cpaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaaaaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
diaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaacaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R0.xyz, R0, R1;
ADD R2.xyz, R2, fragment.texcoord[3];
MUL R0.xyz, R0, c[0].x;
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[0].y;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
def c0, 0.50000000, 0.00000000, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xyz
texldp r0, t2, s2
texld r2, t1, s0
texld r1, t0, s1
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
add_pp r0.xyz, r0, t3
mov_pp r0.w, c0.y
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
"ps_4_0_level_9_1
eefiecedlmeoomikficjemlkconggcphnnaknbikabaaaaaaceaeaaaaaeaaaaaa
daaaaaaaieabaaaafaadaaaapaadaaaaebgpgodjemabaaaaemabaaaaaaacpppp
bmabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaabaaaaaa
aaababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajiabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiia
acaapplaafaaaaadaaaaadiaaaaappiaacaaoelaecaaaaadaaaacpiaaaaaoeia
acaioekaecaaaaadabaaapiaaaaaoelaaaaioekaecaaaaadacaacpiaabaaoela
abaioekaacaaaaadaaaachiaaaaaoeiaadaaoelaafaaaaadabaaahiaabaaoeia
aaaaaakaafaaaaadabaachiaacaaoeiaabaaoeiaaeaaaaaeaaaachiaabaaoeia
aaaaoeiaacaaoeiaabaaaaacaaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcmeabaaaaeaaaaaaahbaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaa
egbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[3], texture[4], 2D;
TEX R1, fragment.texcoord[3], texture[3], 2D;
TEX R3.xyz, fragment.texcoord[1], texture[0], CUBE;
TXP R4.xyz, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[0], texture[1], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[1].y;
DP4 R1.w, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[1].y, -R0;
MAD_SAT R0.w, R0, c[0].z, c[0];
MAD R0.xyz, R0.w, R1, R0;
MUL R1.xyz, R2, R3;
ADD R0.xyz, R4, R0;
MUL R1.xyz, R1, c[1].x;
MAD result.color.xyz, R1, R0, R3;
MOV result.color.w, c[1].z;
END
# 19 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [unity_LightmapFade]
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c1, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xy
dcl t4
texldp r4, t2, s2
texld r2, t3, s4
texld r0, t3, s3
texld r1, t1, s0
texld r3, t0, s1
mul_pp r5.xyz, r0.w, r0
dp4 r0.x, t4, t4
mul_pp r2.xyz, r2.w, r2
mul_pp r2.xyz, r2, c1.y
rsq r0.x, r0.x
rcp r0.x, r0.x
mul r3.xyz, r3, r1
mul r3.xyz, r3, c1.x
mad_pp r5.xyz, r5, c1.y, -r2
mad_sat r0.x, r0, c0.z, c0.w
mad_pp r0.xyz, r0.x, r5, r2
add_pp r0.xyz, r4, r0
mov_pp r0.w, c1.z
mad_pp r0.xyz, r3, r0, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 112
Vector 80 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedofhchdaghmjgnhhacgpgcokpiinhbjfpabaaaaaamaagaaaaaeaaaaaa
daaaaaaahaacaaaaneafaaaaimagaaaaebgpgodjdiacaaaadiacaaaaaaacpppp
peabaaaaeeaaaaaaabaadiaaaaaaeeaaaaaaeeaaafaaceaaaaaaeeaaabaaaaaa
aaababaaacacacaaadadadaaaeaeaeaaaaaaafaaabaaaaaaaaaaaaaaaaacpppp
fbaaaaafabaaapkaaaaaaadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkaajaaaaadaaaaaiiaadaaoelaadaaoelaahaaaaacaaaaabiaaaaappia
agaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaadbiaaaaaaaiaaaaakkkaaaaappka
abaaaaacabaaadiaaaaabllaagaaaaacaaaaaciaacaapplaafaaaaadacaaadia
aaaaffiaacaaoelaecaaaaadadaacpiaabaaoeiaaeaioekaecaaaaadabaacpia
abaaoeiaadaioekaecaaaaadacaacpiaacaaoeiaacaioekaecaaaaadaeaaapia
aaaaoelaaaaioekaecaaaaadafaacpiaabaaoelaabaioekaafaaaaadacaaciia
adaappiaabaaffkaafaaaaadaaaacoiaadaabliaacaappiaafaaaaadabaaciia
abaappiaabaaffkaaeaaaaaeabaachiaabaappiaabaaoeiaaaaablibaeaaaaae
aaaachiaaaaaaaiaabaaoeiaaaaabliaacaaaaadaaaachiaaaaaoeiaacaaoeia
afaaaaadabaaahiaaeaaoeiaabaaaakaafaaaaadabaachiaafaaoeiaabaaoeia
aeaaaaaeaaaachiaabaaoeiaaaaaoeiaafaaoeiaabaaaaacaaaaciiaabaakkka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcfmadaaaaeaaaaaaanhaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafidaaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaae
aahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabbaaaaahbcaabaaaaaaaaaaaegbobaaaaeaaaaaa
egbobaaaaeaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadccaaaal
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaaafaaaaaadkiacaaa
aaaaaaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
aeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaabaaaaaa
abeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaafgafbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaa
aagabaaaadaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaa
jgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
adaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[1] = { { 0.5, 8, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[3], texture[3], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[0], CUBE;
TEX R1.xyz, fragment.texcoord[0], texture[1], 2D;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R1.xyz, R1, R2;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[0].y, R3;
MUL R1.xyz, R1, c[0].x;
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[0].z;
END
# 10 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_cube s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, 0.50000000, 8.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyz
dcl t2
dcl t3.xy
texldp r3, t2, s2
texld r0, t3, s3
texld r2, t1, s0
texld r1, t0, s1
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, r2
mul r1.xyz, r1, c0.x
mad_pp r0.xyz, r0, c0.y, r3
mov_pp r0.w, c0.z
mad_pp r0.xyz, r1, r0, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_Cube] CUBE 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0_level_9_1
eefiecedmkhnfbgnlkfcikpckepnlefilgglcilaabaaaaaalmaeaaaaaeaaaaaa
daaaaaaaliabaaaaoiadaaaaiiaeaaaaebgpgodjiaabaaaaiaabaaaaaaacpppp
emabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaabaaaaaa
aaababaaacacacaaadadadaaaaacppppfbaaaaafaaaaapkaaaaaaadpaaaaaaeb
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahla
bpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaji
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaagaaaaac
aaaaaiiaacaapplaafaaaaadaaaaadiaaaaappiaacaaoelaabaaaaacabaaadia
aaaabllaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadabaacpiaabaaoeia
adaioekaecaaaaadacaaapiaaaaaoelaaaaioekaecaaaaadadaacpiaabaaoela
abaioekaafaaaaadaaaaciiaabaappiaaaaaffkaaeaaaaaeaaaachiaaaaappia
abaaoeiaaaaaoeiaafaaaaadabaaahiaacaaoeiaaaaaaakaafaaaaadabaachia
adaaoeiaabaaoeiaaeaaaaaeaaaachiaabaaoeiaaaaaoeiaadaaoeiaabaaaaac
aaaaciiaaaaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcciacaaaa
eaaaaaaaikaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafidaaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaaj
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}