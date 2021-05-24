//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Glass_RimCube" {
Properties {
 _MainTex ("Texture", 2D) = "white" {}
 _Cube ("Cubemap", CUBE) = "" {}
 _RimPower ("Rim Power", Range(0.5,8)) = 3
 _cubeIntesity ("Reflection Power", Range(0,1)) = 1
 _emission ("emission Power", Range(0,3)) = 1
 _specPower ("spec power", Range(0,10)) = 0.5
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
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[4].xyz, R2, R3;
ADD result.texcoord[2].xyz, -R0, c[13];
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R0.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 43 instructions, 4 R-regs
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
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT4.xyz, r2, r3
add oT2.xyz, -r0, c12
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r0.w
mad oT0.xy, v2, c21, c21.zwzw
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
"vs_4_0
eefiecediobphgnmilepbhmgimejhiblhkdcmepfabaaaaaaleahaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcaaagaaaaeaaaabaaiaabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaa
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
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedcicfnljahmebjpmaolgfghdolepfigogabaaaaaadaalaaaaaeaaaaaa
daaaaaaakiadaaaalaajaaaahiakaaaaebgpgodjhaadaaaahaadaaaaaaacpopp
amadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaajaaaoaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbhaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaabaaaaacaaaaahiaacaaoekaafaaaaad
abaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
bfaaoekaaeaaaaaeaaaaahiaaaaaoeiabgaappkaaaaaoejbaiaaaaadaaaaaiia
aaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahia
acaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
aaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoabaaaoekaaaaakkia
aaaapeiaafaaaaadaaaaahiaaaaaffjaapaaoekaaeaaaaaeaaaaahiaaoaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiabaaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiabbaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibacaaoeka
afaaaaadaaaaahiaacaaoejabgaappkaafaaaaadabaaahiaaaaaffiaapaaoeka
aeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabaaaoeka
aaaakkiaaaaapeiaabaaaaacaaaaaiiabhaaaakaajaaaaadabaaabiaadaaoeka
aaaaoeiaajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoeka
aaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoeka
acaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffia
aaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacadaaahoa
aaaaoeiaaeaaaaaeaeaaahoaajaaoekaaaaappiaabaaoeiaafaaaaadaaaaapia
aaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefcaaagaaaaeaaaabaaiaabaaaafjaaaaaeegiocaaa
aaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaai
icaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaa
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
aaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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
MUL R1.xyz, vertex.normal, c[14].w;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD result.texcoord[2].xyz, -R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 2 R-regs
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
mul r1.xyz, v1, c13.w
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add oT2.xyz, -r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mad oT0.xy, v2, c15, c15.zwzw
mad oT4.xy, v3, c14, c14.zwzw
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
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
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
"vs_4_0
eefiecedkodlnmhnbjghnmbmapbikfpmphnilpciabaaaaaafaagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjmaeaaaaeaaaabaachabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaa
diaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaa
bbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
acaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaal
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
acaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
adaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
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
eefieceddcjajgkafbkfmfghggeobplbnajkeehiabaaaaaapiaiaaaaaeaaaaaa
daaaaaaaneacaaaahiahaaaaeaaiaaaaebgpgodjjmacaaaajmacaaaaaaacpopp
eeacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaeaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaajaaaiaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaabaaaaacaaaaahia
adaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
ajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
akaaoekaaaaakkiaaaaapeiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaaleka
afaaaaadaaaaahiaacaaoejabaaappkaafaaaaadabaaahiaaaaaffiaajaaoeka
aeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeiaaeaaaaaeadaaahoaakaaoeka
aaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjaajaaoekaaeaaaaaeaaaaahia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiaalaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeib
adaaoekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcjmaeaaaaeaaaabaa
chabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaa
aaaaaaaaaeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaaaeaaaaaa
egiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaa
baaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaaacaaaaaa
bdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaa
aeaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
ADD result.texcoord[4].xyz, R1, R2;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
DP4 R2.w, vertex.position, c[4];
DP4 R2.z, vertex.position, c[3];
DP4 R2.x, vertex.position, c[1];
DP4 R2.y, vertex.position, c[2];
MUL R1.xyz, R2.xyww, c[0].z;
MOV R0.x, R1;
MUL R0.y, R1, c[14].x;
ADD result.texcoord[5].xy, R0, R1.z;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.position, R2;
MOV result.texcoord[5].zw, R2;
ADD result.texcoord[2].xyz, -R0, c[13];
MOV result.texcoord[3].z, R0.w;
MOV result.texcoord[3].y, R1.w;
MOV result.texcoord[3].x, R3;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
END
# 49 instructions, 4 R-regs
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
add oT4.xyz, r1, r2
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
dp4 r2.w, v0, c3
dp4 r2.z, v0, c2
dp4 r2.x, v0, c0
dp4 r2.y, v0, c1
mul r1.xyz, r2.xyww, c24.z
mov r0.x, r1
mul r0.y, r1, c13.x
mad oT5.xy, r1.z, c14.zwzw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov oPos, r2
mov oT5.zw, r2
add oT2.xyz, -r0, c12
mov oT3.z, r0.w
mov oT3.y, r1.w
mov oT3.x, r3
mad oT0.xy, v2, c23, c23.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefiecedbemekoofphgcaohlcpkpifnjnoflbdbaabaaaaaageaiaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcjiagaaaaeaaaabaakgabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaf
hccabaaaaeaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
ccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
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
eefieceddofecekfhmibpkephgdlcadnbgjfpcfmabaaaaaacmamaaaaaeaaaaaa
daaaaaaapeadaaaajeakaaaafmalaaaaebgpgodjlmadaaaalmadaaaaaaacpopp
fiadaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaaeaaacaaacaaaaaaaaaaacaacgaaahaaaeaaaaaaaaaa
adaaaaaaaeaaalaaaaaaaaaaadaaamaaajaaapaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbiaaapkaaaaaiadpaaaaaadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaabaaaaacaaaaahiaacaaoekaafaaaaad
abaaahiaaaaaffiabeaaoekaaeaaaaaeaaaaaliabdaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiabfaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
bgaaoekaaeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbaiaaaaadaaaaaiia
aaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahia
acaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffiabaaaoekaaeaaaaae
aaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoabbaaoekaaaaakkia
aaaapeiaafaaaaadaaaaahiaaaaaffjabaaaoekaaeaaaaaeaaaaahiaapaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiabbaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiabcaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibacaaoeka
afaaaaadaaaaahiaacaaoejabhaappkaafaaaaadabaaahiaaaaaffiabaaaoeka
aeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkiaaaaapeiaabaaaaacaaaaaiiabiaaaakaajaaaaadabaaabiaaeaaoeka
aaaaoeiaajaaaaadabaaaciaafaaoekaaaaaoeiaajaaaaadabaaaeiaagaaoeka
aaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaahaaoeka
acaaoeiaajaaaaadadaaaciaaiaaoekaacaaoeiaajaaaaadadaaaeiaajaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffia
aaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacadaaahoa
aaaaoeiaaeaaaaaeaeaaahoaakaaoekaaaaappiaabaaoeiaafaaaaadaaaaapia
aaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
biaaffkaafaaaaadabaaafiaaaaapeiabiaaffkaacaaaaadafaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacafaaamoaaaaaoeiappppaaaafdeieefcjiagaaaaeaaaabaa
kgabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
diaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaa
bbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaa
abaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
adaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaai
hcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaal
hcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaia
ebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
egbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaa
abaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaa
acaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
diaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhccabaaa
adaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaabaaaaaa
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
abaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
MOV result.position, R0;
MUL R1.y, R1, c[14].x;
ADD result.texcoord[5].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
MOV result.texcoord[5].zw, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].z, R2, c[7];
DP3 result.texcoord[1].y, R2, c[6];
DP3 result.texcoord[1].x, R2, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 31 instructions, 3 R-regs
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
mov oPos, r0
mul r1.y, r1, c13.x
mad oT5.xy, r1.z, c14.zwzw, r1
mul r1.xyz, v1, c15.w
mov oT5.zw, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT1.z, r2, c6
dp3 oT1.y, r2, c5
dp3 oT1.x, r2, c4
add oT2.xyz, -r0, c12
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mad oT0.xy, v2, c17, c17.zwzw
mad oT4.xy, v3, c16, c16.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
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
"vs_4_0
eefiecedjeaiclkdfkcggmdgbeabbidnepjgnkokabaaaaaaaaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdeafaaaaeaaaabaaenabaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaa
aaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaia
ebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
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
eefieceddpigmdkpicaampmeopemnnkckhgbmllhabaaaaaaamakaaaaaeaaaaaa
daaaaaaadiadaaaaheaiaaaadmajaaaaebgpgodjaaadaaaaaaadaaaaaaacpopp
kiacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaiaa
acaaabaaaaaaaaaaabaaaeaaacaaadaaaaaaaaaaacaaaaaaaeaaafaaaaaaaaaa
acaaamaaajaaajaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaabaaaaacaaaaahiaadaaoekaafaaaaad
abaaahiaaaaaffiaaoaaoekaaeaaaaaeaaaaaliaanaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiaapaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeia
baaaoekaaeaaaaaeaaaaahiaaaaaoeiabbaappkaaaaaoejbaiaaaaadaaaaaiia
aaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahia
acaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffiaakaaoekaaeaaaaae
aaaaaliaajaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoaalaaoekaaaaakkia
aaaapeiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaahia
acaaoejabbaappkaafaaaaadabaaahiaaaaaffiaakaaoekaaeaaaaaeaaaaalia
ajaakekaaaaaaaiaabaakeiaaeaaaaaeadaaahoaalaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaakaaoekaaeaaaaaeaaaaahiaajaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaappjaaaaaoeiaacaaaaadacaaahoaaaaaoeibadaaoekaafaaaaad
aaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapiaafaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaaeaaaakaafaaaaadabaaaiia
abaaaaiabcaaaakaafaaaaadabaaafiaaaaapeiabcaaaakaacaaaaadaeaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeiappppaaaafdeieefcdeafaaaa
eaaaabaaenabaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaiaaaaaa
kgiocaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaaegiccaaa
acaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaa
acaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaa
acaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
abaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
abaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaa
abaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaafaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
DP3 R5.x, R3, c[5];
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[15];
DP3 R4.z, R3, c[6];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[14];
MUL R2, R2, R2;
MOV R5.y, R4.z;
MOV R5.w, c[0].x;
DP4 R4.xy, vertex.position, c[7];
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[16];
DP3 R4.x, R3, c[7];
MAD R2, R1, R1, R2;
MAD R0, R4.x, R1, R0;
MUL R1, R2, c[17];
ADD R1, R1, c[0].x;
MOV R5.z, R4.x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[24];
DP4 R2.y, R5, c[23];
DP4 R2.x, R5, c[22];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MUL R1, R5.xyzz, R5.yzzx;
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
MUL R0.w, R4.z, R4.z;
MAD R1.w, R5.x, R5.x, -R0;
MAD R1.xyz, R2, c[29].w, -vertex.position;
DP3 R0.w, vertex.normal, -R1;
MUL R5.yzw, R1.w, c[28].xxyz;
ADD R3.xyz, R3, R5.yzww;
ADD result.texcoord[4].xyz, R3, R0;
MUL R2.xyz, vertex.normal, R0.w;
MAD R1.xyz, -R2, c[0].y, -R1;
MOV R3.x, R4.w;
MOV R3.y, R4;
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R3.wxyw, c[13];
MOV result.texcoord[3].z, R4.x;
MOV result.texcoord[3].y, R4.z;
MOV result.texcoord[3].x, R5;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[30], c[30].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 72 instructions, 6 R-regs
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
dp3 r5.x, r3, c4
dp4 r4.zw, v0, c5
add r2, -r4.z, c14
dp3 r4.z, r3, c5
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c13
mul r2, r2, r2
mov r5.y, r4.z
mov r5.w, c30.x
dp4 r4.xy, v0, c6
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c15
dp3 r4.x, r3, c6
mad r2, r1, r1, r2
mad r0, r4.x, r1, r0
mul r1, r2, c16
add r1, r1, c30.x
mov r5.z, r4.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c23
dp4 r2.y, r5, c22
dp4 r2.x, r5, c21
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c30.z
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mul r1, r5.xyzz, r5.yzzx
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
mul r0.w, r4.z, r4.z
mad r1.w, r5.x, r5.x, -r0
mad r1.xyz, r2, c28.w, -v0
dp3 r0.w, v1, -r1
mul r5.yzw, r1.w, c27.xxyz
add r3.xyz, r3, r5.yzww
add oT4.xyz, r3, r0
mul r2.xyz, v1, r0.w
mad r1.xyz, -r2, c30.y, -r1
mov r3.x, r4.w
mov r3.y, r4
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r3.wxyw, c12
mov oT3.z, r4.x
mov oT3.y, r4.z
mov oT3.x, r5
mad oT0.xy, v2, c29, c29.zwzw
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
"vs_4_0
eefiecedjippjicejlgccekdmeljlpcckgnbgjdhabaaaaaagmakaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcliaiaaaaeaaaabaacoacaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaa
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
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaa
fgafbaaaabaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaia
ebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaafaaaaaaagaabaaaabaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaa
aeaaaaaaeeaaaaafpcaabaaaabaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaa
adaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaabaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
aaaaaaaaegaobaaaadaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaa
egacbaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedmjmnbhihmehiikdfgpdohlgleckomhfnabaaaaaakaapaaaaaeaaaaaa
daaaaaaagaafaaaacaaoaaaaoiaoaaaaebgpgodjciafaaaaciafaaaaaaacpopp
liaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
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
acaaahoaaaaaoeibacaaoekaacaaaaadabaaapiaaaaaffibaeaaoekaafaaaaad
acaaapiaabaaoeiaabaaoeiaacaaaaadadaaapiaaaaaaaibadaaoekaacaaaaad
aaaaapiaaaaakkibafaaoekaaeaaaaaeacaaapiaadaaoeiaadaaoeiaacaaoeia
aeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeiaahaaaaacaeaaabiaacaaaaia
ahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkiaahaaaaacaeaaaiia
acaappiaabaaaaacafaaabiabpaaaakaaeaaaaaeacaaapiaacaaoeiaagaaoeka
afaaaaiaafaaaaadafaaahiaacaaoejaboaappkaafaaaaadagaaahiaafaaffia
bhaaoekaaeaaaaaeafaaaliabgaakekaafaaaaiaagaakeiaaeaaaaaeafaaahia
biaaoekaafaakkiaafaapeiaafaaaaadabaaapiaabaaoeiaafaaffiaaeaaaaae
abaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaaeaaaaapiaaaaaoeiaafaakkia
abaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeia
bpaaffkaagaaaaacabaaabiaacaaaaiaagaaaaacabaaaciaacaaffiaagaaaaac
abaaaeiaacaakkiaagaaaaacabaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeia
abaaoeiaafaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaaeabaaahiaahaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaacafaaaiiabpaaaakaajaaaaad
abaaabiaalaaoekaafaaoeiaajaaaaadabaaaciaamaaoekaafaaoeiaajaaaaad
abaaaeiaanaaoekaafaaoeiaafaaaaadacaaapiaafaacjiaafaakeiaajaaaaad
adaaabiaaoaaoekaacaaoeiaajaaaaadadaaaciaapaaoekaacaaoeiaajaaaaad
adaaaeiabaaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiiaafaaaaiaafaaaaiaaaaappib
abaaaaacadaaahoaafaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappiaabaaoeia
acaaaaadaeaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoeka
aeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcliaiaaaaeaaaabaacoacaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaeaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
adaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaa
aeaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaa
bbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaa
bbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaa
diaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaai
bcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaai
ccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaai
ecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaabaaaaaaegaobaaa
adaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
aaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaa
acaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaa
abaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaa
egaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaa
abaaaaaaegaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaadaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaa
abaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaadaaaaaa
egaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
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
DP3 R5.x, R3, c[5];
DP4 R4.zw, vertex.position, c[6];
ADD R2, -R4.z, c[16];
DP3 R4.z, R3, c[6];
DP4 R3.w, vertex.position, c[5];
MUL R0, R4.z, R2;
ADD R1, -R3.w, c[15];
MUL R2, R2, R2;
MOV R5.y, R4.z;
MOV R5.w, c[0].x;
DP4 R4.xy, vertex.position, c[7];
MAD R0, R5.x, R1, R0;
MAD R2, R1, R1, R2;
ADD R1, -R4.x, c[17];
DP3 R4.x, R3, c[7];
MAD R2, R1, R1, R2;
MAD R0, R4.x, R1, R0;
MUL R1, R2, c[18];
ADD R1, R1, c[0].x;
MOV R5.z, R4.x;
RSQ R2.x, R2.x;
RSQ R2.y, R2.y;
RSQ R2.z, R2.z;
RSQ R2.w, R2.w;
MUL R0, R0, R2;
DP4 R2.z, R5, c[25];
DP4 R2.y, R5, c[24];
DP4 R2.x, R5, c[23];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MUL R1, R5.xyzz, R5.yzzx;
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
MUL R0.w, R4.z, R4.z;
MAD R1.w, R5.x, R5.x, -R0;
MAD R1.xyz, R2, c[30].w, -vertex.position;
DP3 R0.w, vertex.normal, -R1;
MUL R2.xyz, vertex.normal, R0.w;
MAD R1.xyz, -R2, c[0].y, -R1;
MUL R5.yzw, R1.w, c[29].xxyz;
ADD R3.xyz, R3, R5.yzww;
ADD result.texcoord[4].xyz, R3, R0;
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
MOV R3.x, R4.w;
MOV R3.y, R4;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
ADD result.texcoord[2].xyz, -R3.wxyw, c[13];
MOV result.texcoord[3].z, R4.x;
MOV result.texcoord[3].y, R4.z;
MOV result.texcoord[3].x, R5;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
END
# 78 instructions, 6 R-regs
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
dp3 r5.x, r3, c4
dp4 r4.zw, v0, c5
add r2, -r4.z, c16
dp3 r4.z, r3, c5
dp4 r3.w, v0, c4
mul r0, r4.z, r2
add r1, -r3.w, c15
mul r2, r2, r2
mov r5.y, r4.z
mov r5.w, c32.x
dp4 r4.xy, v0, c6
mad r0, r5.x, r1, r0
mad r2, r1, r1, r2
add r1, -r4.x, c17
dp3 r4.x, r3, c6
mad r2, r1, r1, r2
mad r0, r4.x, r1, r0
mul r1, r2, c18
add r1, r1, c32.x
mov r5.z, r4.x
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.z, r2.z
rsq r2.w, r2.w
mul r0, r0, r2
dp4 r2.z, r5, c25
dp4 r2.y, r5, c24
dp4 r2.x, r5, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c32.z
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mul r1, r5.xyzz, r5.yzzx
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
mul r0.w, r4.z, r4.z
mad r1.w, r5.x, r5.x, -r0
mad r1.xyz, r2, c30.w, -v0
dp3 r0.w, v1, -r1
mul r2.xyz, v1, r0.w
mad r1.xyz, -r2, c32.y, -r1
mul r5.yzw, r1.w, c29.xxyz
add r3.xyz, r3, r5.yzww
add oT4.xyz, r3, r0
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
mov r3.x, r4.w
mov r3.y, r4
mad oT5.xy, r2.z, c14.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
add oT2.xyz, -r3.wxyw, c12
mov oT3.z, r4.x
mov oT3.y, r4.z
mov oT3.x, r5
mad oT0.xy, v2, c31, c31.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefiecedcbnbbcjjifagfibdnllpbpigmagdkablabaaaaaabmalaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcfaajaaaaeaaaabaafeacaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaa
aeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaa
egiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaaegacbaaaabaaaaaa
pgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaacaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaacaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaaacaaaaaadgaaaaaf
hccabaaaaeaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaa
acaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaa
acaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaa
acaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaaacaaaaaaegakbaaaacaaaaaa
bbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaaeaaaaaa
bbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaaeaaaaaa
bbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaaeaaaaaa
aaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaaafaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaabaaaaaa
egiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaacaaaaaa
egaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaa
aeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaaabaaaaaaegiocaaa
acaaaaaaacaaaaaaaaaaaaajpcaabaaaabaaaaaakgakbaiaebaaaaaaabaaaaaa
egiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaa
agaabaaaacaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
agaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaa
egaobaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
abaaaaaaegaobaaaabaaaaaakgakbaaaacaaaaaaegaobaaaafaaaaaaeeaaaaaf
pcaabaaaacaaaaaaegaobaaaaeaaaaaadcaaaaanpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaaeaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaaeaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaa
egaobaaaacaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaa
aeaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaa
abaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_MainTex_ST]
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
eefiecedkjdjbpgkkelkokhhdfbcbgmglkomacodabaaaaaajmbaaaaaaeaaaaaa
daaaaaaakmafaaaaaeapaaaammapaaaaebgpgodjheafaaaaheafaaaaaaacpopp
aeafaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaiaa
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
acaaahoaaaaaoeibacaaoekaacaaaaadabaaapiaaaaaffibafaaoekaafaaaaad
acaaapiaabaaoeiaabaaoeiaacaaaaadadaaapiaaaaaaaibaeaaoekaacaaaaad
aaaaapiaaaaakkibagaaoekaaeaaaaaeacaaapiaadaaoeiaadaaoeiaacaaoeia
aeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeiaahaaaaacaeaaabiaacaaaaia
ahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkiaahaaaaacaeaaaiia
acaappiaabaaaaacafaaabiacaaaaakaaeaaaaaeacaaapiaacaaoeiaahaaoeka
afaaaaiaafaaaaadafaaahiaacaaoejabpaappkaafaaaaadagaaahiaafaaffia
biaaoekaaeaaaaaeafaaaliabhaakekaafaaaaiaagaakeiaaeaaaaaeafaaahia
bjaaoekaafaakkiaafaapeiaafaaaaadabaaapiaabaaoeiaafaaffiaaeaaaaae
abaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaaeaaaaapiaaaaaoeiaafaakkia
abaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeia
caaaffkaagaaaaacabaaabiaacaaaaiaagaaaaacabaaaciaacaaffiaagaaaaac
abaaaeiaacaakkiaagaaaaacabaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeia
abaaoeiaafaaaaadabaaahiaaaaaffiaajaaoekaaeaaaaaeabaaahiaaiaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaahiaalaaoekaaaaappiaaaaaoeiaabaaaaacafaaaiiacaaaaakaajaaaaad
abaaabiaamaaoekaafaaoeiaajaaaaadabaaaciaanaaoekaafaaoeiaajaaaaad
abaaaeiaaoaaoekaafaaoeiaafaaaaadacaaapiaafaacjiaafaakeiaajaaaaad
adaaabiaapaaoekaacaaoeiaajaaaaadadaaaciabaaaoekaacaaoeiaajaaaaad
adaaaeiabbaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiiaafaaaaiaafaaaaiaaaaappib
abaaaaacadaaahoaafaaoeiaaeaaaaaeabaaahiabcaaoekaaaaappiaabaaoeia
acaaaaadaeaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabeaaoeka
aeaaaaaeaaaaapiabdaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabfaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaappjaaaaaoeiaafaaaaad
abaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaiacaaakkkaafaaaaad
abaaafiaaaaapeiacaaakkkaacaaaaadafaaadoaabaakkiaabaaomiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
afaaamoaaaaaoeiappppaaaafdeieefcfaajaaaaeaaaabaafeacaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaa
abaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaal
hcaabaaaabaaaaaaegiccaaaadaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaadaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaaegiccaaaadaaaaaabdaaaaaadcaaaaalhcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaadaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaaiicaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaegbcbaaaacaaaaaa
aaaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaal
hcaabaaaabaaaaaaegbcbaaaacaaaaaapgapbaiaebaaaaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaa
adaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaajhccabaaaadaaaaaaegacbaia
ebaaaaaaabaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaaihcaabaaaacaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaa
acaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaacaaaaaadgaaaaaficaabaaa
acaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaacaaaaaadiaaaaahpcaabaaaaeaaaaaajgacbaaaacaaaaaa
egakbaaaacaaaaaabbaaaaaibcaabaaaafaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaaeaaaaaabbaaaaaiccaabaaaafaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaaeaaaaaabbaaaaaiecaabaaaafaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaaeaaaaaaaaaaaaahhcaabaaaadaaaaaaegacbaaaadaaaaaaegacbaaa
afaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaacaaaaaabkaabaaaacaaaaaa
dcaaaaakicaabaaaabaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadkaabaia
ebaaaaaaabaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaabaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaia
ebaaaaaaabaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaafaaaaaa
fgafbaaaacaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaa
aeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaiaebaaaaaa
abaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaabaaaaaakgakbaia
ebaaaaaaabaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaafaaaaaa
egaobaaaagaaaaaaagaabaaaacaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaabaaaaaakgakbaaaacaaaaaaegaobaaa
afaaaaaaeeaaaaafpcaabaaaacaaaaaaegaobaaaaeaaaaaadcaaaaanpcaabaaa
aeaaaaaaegaobaaaaeaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaeaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpegaobaaaaeaaaaaadiaaaaahpcaabaaaabaaaaaa
egaobaaaabaaaaaaegaobaaaacaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaaeaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Float 1 [_specPower]
Float 2 [_RimPower]
Float 3 [_cubeIntesity]
Float 4 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"!!ARBfp1.0
PARAM c[7] = { program.local[0..4],
		{ 0.5, 0, 48, 2 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], CUBE;
MAD R1.xyz, R1, c[3].x, R0;
MUL R1.xyz, R1, c[5].x;
ADD R2.xyz, R1, -R0;
MAD R0.xyz, R2, R0.w, R0;
DP3 R1.w, fragment.texcoord[3], c[0];
MAX R1.w, R1, c[5].y;
MUL R3.xyz, R0, R1.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MAD R2.xyz, R0.w, fragment.texcoord[2], c[0];
DP3 R0.w, R2, R2;
RSQ R0.w, R0.w;
MUL R2.xyz, R0.w, R2;
DP3 R0.w, fragment.texcoord[3], R2;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, fragment.texcoord[2];
DP3_SAT R1.w, fragment.texcoord[3], R4;
ADD R1.w, -R1, c[6].x;
MAX R0.w, R0, c[5].y;
MUL R1.w, R1, c[5];
POW R0.w, R0.w, c[5].z;
POW R1.w, R1.w, c[2].x;
MAD R2.xyz, R0.w, c[1].x, R3;
MUL R1.xyz, R1, R1.w;
MUL R2.xyz, R2, c[5].w;
MUL R1.xyz, R1, c[4].x;
MAD R0.xyz, R0, fragment.texcoord[4], R2;
ADD result.color.xyz, R0, R1;
MOV result.color.w, c[5].y;
END
# 32 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Float 1 [_specPower]
Float 2 [_RimPower]
Float 3 [_cubeIntesity]
Float 4 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c5, 0.50000000, 0.00000000, 48.00000000, 2.00000000
def c6, 1.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r1, t1, s1
texld r0, t0, s0
mad r1.xyz, r1, c3.x, r0
mul r2.xyz, r1, c5.x
add_pp r1.xyz, r2, -r0
mad_pp r3.xyz, r1, r0.w, r0
dp3_pp r1.x, t3, c0
max_pp r1.x, r1, c5.y
mul_pp r4.xyz, r3, r1.x
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mad_pp r5.xyz, r0.x, t2, c0
dp3_pp r0.x, r5, r5
rsq_pp r0.x, r0.x
dp3 r1.x, t2, t2
rsq r1.x, r1.x
mul r1.xyz, r1.x, t2
mul_pp r5.xyz, r0.x, r5
dp3_sat r0.x, t3, r1
dp3_pp r1.x, t3, r5
max_pp r1.x, r1, c5.y
pow r5.x, r1.x, c5.z
add r0.x, -r0, c6
mul r0.x, r0, c5.w
pow_pp r1.w, r0.x, c2.x
mov r0.x, r5.x
mad r4.xyz, r0.x, c1.x, r4
mov_pp r0.x, r1.w
mul r1.xyz, r4, c5.w
mul r0.xyz, r2, r0.x
mad_pp r1.xyz, r3, t4, r1
mul r0.xyz, r0, c4.x
mov_pp r0.w, c5.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 80
Float 48 [_specPower]
Float 52 [_RimPower]
Float 56 [_cubeIntesity]
Float 60 [_emission]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedbgacjmnlajbpdfcnhfajkdiibllpijpaabaaaaaaliafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjiaeaaaa
eaaaaaaacgabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaaagijcaaa
abaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegbcbaaa
adaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaadaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egiccaaaabaaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaakgikcaaaaaaaaaaaadaaaaaaegacbaaaacaaaaaadcaaaaanhcaabaaa
adaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
egacbaiaebaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaapgapbaaa
acaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaakgakbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 80
Float 48 [_specPower]
Float 52 [_RimPower]
Float 56 [_cubeIntesity]
Float 60 [_emission]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedjmldjdchbeoiaicgnjilpjhpfdjgblcpabaaaaaaeiaiaaaaaeaaaaaa
daaaaaaalmacaaaafmahaaaabeaiaaaaebgpgodjieacaaaaieacaaaaaaacpppp
eaacaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaiadpaaaaaadpaaaaaaaaaaaaeaecbpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajiabaiapkaaiaaaaadaaaaaiiaacaaoelaacaaoelaahaaaaac
aaaaabiaaaaappiaaeaaaaaeabaachiaacaaoelaaaaaaaiaabaaoekaafaaaaad
aaaaahiaaaaaaaiaacaaoelaaiaaaaadabaabiiaaaaaoeiaadaaoelaacaaaaad
abaaaiiaabaappibacaaaakaacaaaaadabaaciiaabaappiaabaappiacaaaaaad
aaaaabiaabaappiaaaaaffkaceaaaaacacaachiaabaaoeiaaiaaaaadaaaaccia
adaaoelaacaaoeiaalaaaaadabaaabiaaaaaffiaacaakkkacaaaaaadaaaaacia
abaaaaiaacaappkaafaaaaadaaaaaciaaaaaffiaaaaaaakaaiaaaaadaaaaceia
adaaoelaabaaoekaalaaaaadabaacbiaaaaakkiaacaakkkaecaaaaadacaaapia
abaaoelaabaioekaecaaaaadadaaapiaaaaaoelaaaaioekaaeaaaaaeabaaaoia
acaabliaaaaakkkaadaabliaaeaaaaaeacaaahiaabaabliaacaaffkaadaaoeib
afaaaaadabaaaoiaabaaoeiaacaaffkaafaaaaadabaaaoiaaaaaaaiaabaaoeia
aeaaaaaeacaachiaadaappiaacaaoeiaadaaoeiaaeaaaaaeaaaaahiaacaaoeia
abaaaaiaaaaaffiaacaaaaadaaaachiaaaaaoeiaaaaaoeiaaeaaaaaeaaaachia
acaaoeiaaeaaoelaaaaaoeiaaeaaaaaeaaaachiaabaabliaaaaappkaaaaaoeia
abaaaaacaaaaaiiaacaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
jiaeaaaaeaaaaaaacgabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaa
agijcaaaabaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egbcbaaaadaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaa
aeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaaeaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaadaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaakgikcaaaaaaaaaaaadaaaaaaegacbaaaacaaaaaadcaaaaan
hcaabaaaadaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
pgapbaaaacaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaafgafbaaaaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaacaaaaaaegbcbaaaafaaaaaaegacbaaaaaaaaaaadcaaaaak
hccabaaaaaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_RimPower]
Float 1 [_cubeIntesity]
Float 2 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0.5, 0, 8, 1 },
		{ 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1, fragment.texcoord[4], texture[2], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[1], CUBE;
MAD R2.xyz, R2, c[1].x, R0;
DP3 R2.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.w, R2.w;
MUL R3.xyz, R2.w, fragment.texcoord[2];
DP3_SAT R2.w, R3, fragment.texcoord[3];
MUL R2.xyz, R2, c[3].x;
ADD R3.xyz, R2, -R0;
ADD R2.w, -R2, c[3];
MUL R2.w, R2, c[4].x;
POW R2.w, R2.w, c[0].x;
MUL R2.xyz, R2, R2.w;
MAD R0.xyz, R3, R0.w, R0;
MUL R1.xyz, R1.w, R1;
MUL R2.xyz, R2, c[2].x;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[3].z, R2;
MOV result.color.w, c[3].y;
END
# 20 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_RimPower]
Float 1 [_cubeIntesity]
Float 2 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c3, 0.50000000, 1.00000000, 2.00000000, 8.00000000
def c4, 0.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xy
texld r1, t4, s2
texld r4, t1, s1
texld r2, t0, s0
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t3
add r0.x, -r0, c3.y
mul r0.x, r0, c3.z
pow_pp r3.w, r0.x, c0.x
mad r4.xyz, r4, c1.x, r2
mov_pp r0.x, r3.w
mul r3.xyz, r4, c3.x
mul r0.xyz, r3, r0.x
add_pp r3.xyz, r3, -r2
mad_pp r2.xyz, r3, r2.w, r2
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, r2
mul r0.xyz, r0, c2.x
mov_pp r0.w, c4.x
mad_pp r0.xyz, r1, c3.w, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 96
Float 52 [_RimPower]
Float 56 [_cubeIntesity]
Float 60 [_emission]
BindCB  "$Globals" 0
"ps_4_0
eefiecedoikcoeganafjaimcpodekkdkkikhmgfaabaaaaaaimaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgmadaaaa
eaaaaaaanlaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaadaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
aeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaadaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaa
abaaaaaakgikcaaaaaaaaaaaadaaaaaaagajbaaaacaaaaaadiaaaaakhcaabaaa
abaaaaaajgahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
dcaaaaanocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaadpaaaaaadpagajbaiaebaaaaaaacaaaaaadcaaaaajocaabaaaaaaaaaaa
pgapbaaaacaaaaaafgaobaaaaaaaaaaaagajbaaaacaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaabaaaaaapgipcaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaacaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahbcaabaaa
aaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaagaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaajgahbaaa
aaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 96
Float 52 [_RimPower]
Float 56 [_cubeIntesity]
Float 60 [_emission]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpimohijjkgnjoebcjhhlidlofjadpgbfabaaaaaaiiagaaaaaeaaaaaa
daaaaaaaciacaaaajmafaaaafeagaaaaebgpgodjpaabaaaapaabaaaaaaacpppp
leabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaaaaaaaaa
abababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaiadpaaaaaadpaaaaaaebaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkabpaaaaacaaaaaaja
acaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaacaioeka
ecaaaaadabaaapiaabaaoelaabaioekaecaaaaadacaaapiaaaaaoelaaaaioeka
afaaaaadaaaaciiaaaaappiaabaakkkaafaaaaadaaaachiaaaaaoeiaaaaappia
aeaaaaaeabaaahiaabaaoeiaaaaakkkaacaaoeiaaeaaaaaeadaaahiaabaaoeia
abaaffkaacaaoeibafaaaaadabaaahiaabaaoeiaabaaffkaaeaaaaaeacaachia
acaappiaadaaoeiaacaaoeiaceaaaaacadaaahiaacaaoelaaiaaaaadaaaabiia
adaaoeiaadaaoelaacaaaaadaaaaaiiaaaaappibabaaaakaacaaaaadaaaaciia
aaaappiaaaaappiacaaaaaadabaaaiiaaaaappiaaaaaffkaafaaaaadabaaahia
abaappiaabaaoeiaafaaaaadabaachiaabaaoeiaaaaappkaaeaaaaaeaaaachia
acaaoeiaaaaaoeiaabaaoeiaabaaaaacaaaaaiiaabaappkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcgmadaaaaeaaaaaaanlaaaaaafjaaaaaeegiocaaa
aaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaae
aahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaadaaaaaabacaaaahbcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegbcbaaaaeaaaaaaaaaaaaaibcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
adaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaadaaaaaa
agajbaaaacaaaaaadiaaaaakhcaabaaaabaaaaaajgahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaadcaaaaanocaabaaaaaaaaaaafgaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadpagajbaiaebaaaaaa
acaaaaaadcaaaaajocaabaaaaaaaaaaapgapbaaaacaaaaaafgaobaaaaaaaaaaa
agajbaaaacaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaa
adaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaadiaaaaahbcaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaagaabaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaaacaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Float 1 [_specPower]
Float 2 [_RimPower]
Float 3 [_cubeIntesity]
Float 4 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[7] = { program.local[0..4],
		{ 0.5, 0, 48, 2 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], CUBE;
TXP R3.x, fragment.texcoord[5], texture[2], 2D;
MAD R1.xyz, R1, c[3].x, R0;
MUL R1.xyz, R1, c[5].x;
ADD R2.xyz, R1, -R0;
MAD R0.xyz, R2, R0.w, R0;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.w, R1.w;
MAD R3.yzw, R1.w, fragment.texcoord[2].xxyz, c[0].xxyz;
DP3 R1.w, R3.yzww, R3.yzww;
RSQ R1.w, R1.w;
MUL R4.xyz, R1.w, R3.yzww;
DP3 R0.w, fragment.texcoord[3], c[0];
MAX R0.w, R0, c[5].y;
MUL R2.xyz, R0, R0.w;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MUL R3.yzw, R0.w, fragment.texcoord[2].xxyz;
DP3 R1.w, fragment.texcoord[3], R4;
DP3_SAT R0.w, fragment.texcoord[3], R3.yzww;
MAX R1.w, R1, c[5].y;
POW R1.w, R1.w, c[5].z;
MAD R2.xyz, R1.w, c[1].x, R2;
ADD R0.w, -R0, c[6].x;
MUL R0.w, R0, c[5];
POW R0.w, R0.w, c[2].x;
MUL R1.w, R3.x, c[5];
MUL R1.xyz, R1, R0.w;
MUL R2.xyz, R2, R1.w;
MUL R1.xyz, R1, c[4].x;
MAD R0.xyz, R0, fragment.texcoord[4], R2;
ADD result.color.xyz, R0, R1;
MOV result.color.w, c[5].y;
END
# 34 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Float 1 [_specPower]
Float 2 [_RimPower]
Float 3 [_cubeIntesity]
Float 4 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c5, 0.50000000, 0.00000000, 48.00000000, 2.00000000
def c6, 1.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r0, t1, s1
texldp r6, t5, s2
texld r1, t0, s0
mad r0.xyz, r0, c3.x, r1
mul r3.xyz, r0, c5.x
add_pp r2.xyz, r3, -r1
mad_pp r4.xyz, r2, r1.w, r1
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mad_pp r2.xyz, r0.x, t2, c0
dp3_pp r0.x, r2, r2
dp3_pp r1.x, t3, c0
max_pp r1.x, r1, c5.y
rsq_pp r0.x, r0.x
mul_pp r5.xyz, r4, r1.x
mul_pp r1.xyz, r0.x, r2
dp3 r0.x, t2, t2
rsq r2.x, r0.x
dp3_pp r1.x, t3, r1
max_pp r0.x, r1, c5.y
pow r1.w, r0.x, c5.z
mul r2.xyz, r2.x, t2
dp3_sat r0.x, t3, r2
add r0.x, -r0, c6
mul r0.x, r0, c5.w
pow_pp r2.x, r0.x, c2.x
mov_pp r0.x, r2.x
mul r0.xyz, r3, r0.x
mad r5.xyz, r1.w, c1.x, r5
mul_pp r1.x, r6, c5.w
mul r1.xyz, r5, r1.x
mad_pp r1.xyz, r4, t4, r1
mul r0.xyz, r0, c4.x
mov_pp r0.w, c5.y
add_pp r0.xyz, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 116 [_RimPower]
Float 120 [_cubeIntesity]
Float 124 [_emission]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedfcnlihejfnaphnfcalggnofjnkkcmplmabaaaaaafeagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbmafaaaaeaaaaaaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakocaabaaaaaaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaaagijcaaa
abaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaaegbcbaaa
adaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaacpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkiacaaaaaaaaaaaahaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaaaaaaaaaa
eeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egiccaaaabaaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaanhcaabaaa
adaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
egacbaiaebaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaaabaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaapgapbaaa
acaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaacaaaaaakgakbaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaacaaaaaaegbcbaaaafaaaaaaaoaaaaahdcaabaaaadaaaaaa
egbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaaegaabaaa
adaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
akaabaaaadaaaaaaakaabaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaaaaaaaaaa
egacbaaaabaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 116 [_RimPower]
Float 120 [_cubeIntesity]
Float 124 [_emission]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedpmlebnnknlifbpmcnomlaeikllndoigdabaaaaaadmajaaaaaeaaaaaa
daaaaaaabeadaaaadiaiaaaaaiajaaaaebgpgodjnmacaaaanmacaaaaaaacpppp
jeacaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
aaababaaabacacaaaaaaahaaabaaaaaaaaaaaaaaabaaaaaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaiadpaaaaaadpaaaaaaaaaaaaeaecbpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaia
afaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajiacaiapkaagaaaaacaaaaaiiaafaapplaafaaaaadaaaaadiaaaaappia
afaaoelaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaaapiaabaaoela
acaioekaecaaaaadacaaapiaaaaaoelaabaioekaacaaaaadabaaaiiaaaaaaaia
aaaaaaiaaiaaaaadaaaaabiaacaaoelaacaaoelaahaaaaacaaaaabiaaaaaaaia
aeaaaaaeadaachiaacaaoelaaaaaaaiaabaaoekaafaaaaadaaaaahiaaaaaaaia
acaaoelaaiaaaaadadaabiiaaaaaoeiaadaaoelaacaaaaadadaaaiiaadaappib
acaaaakaacaaaaadadaaciiaadaappiaadaappiacaaaaaadaaaaabiaadaappia
aaaaffkaceaaaaacaeaachiaadaaoeiaaiaaaaadaaaacciaadaaoelaaeaaoeia
alaaaaadadaaabiaaaaaffiaacaakkkacaaaaaadaaaaaciaadaaaaiaacaappka
afaaaaadaaaaaciaaaaaffiaaaaaaakaaiaaaaadaaaaceiaadaaoelaabaaoeka
alaaaaadadaacbiaaaaakkiaacaakkkaaeaaaaaeabaaahiaabaaoeiaaaaakkka
acaaoeiaaeaaaaaeadaaaoiaabaabliaacaaffkaacaablibafaaaaadabaaahia
abaaoeiaacaaffkaafaaaaadabaaahiaaaaaaaiaabaaoeiaaeaaaaaeacaachia
acaappiaadaabliaacaaoeiaaeaaaaaeaaaaahiaacaaoeiaadaaaaiaaaaaffia
afaaaaadacaachiaacaaoeiaaeaaoelaaeaaaaaeaaaachiaaaaaoeiaabaappia
acaaoeiaaeaaaaaeaaaachiaabaaoeiaaaaappkaaaaaoeiaabaaaaacaaaaaiia
acaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbmafaaaaeaaaaaaa
ehabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagbjbaaaadaaaaaaagaabaaaaaaaaaaa
agijcaaaabaaaaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egbcbaaaadaaaaaabacaaaahbcaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaa
aeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkiacaaaaaaaaaaaahaaaaaabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaajgahbaaaaaaaaaaajgahbaaa
aaaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaaeaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaabaaaaaaiecaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaan
hcaabaaaadaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaegacbaiaebaaaaaaacaaaaaadiaaaaakhcaabaaaabaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaajhcaabaaaacaaaaaa
pgapbaaaacaaaaaaegacbaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaacaaaaaakgakbaaaaaaaaaaafgafbaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaaegbcbaaaafaaaaaaaoaaaaahdcaabaaa
adaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaadaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhccabaaa
aaaaaaaaegacbaaaabaaaaaapgipcaaaaaaaaaaaahaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_RimPower]
Float 1 [_cubeIntesity]
Float 2 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[5] = { program.local[0..2],
		{ 0.5, 0, 8, 2 },
		{ 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R0, fragment.texcoord[4], texture[3], 2D;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[1], CUBE;
TXP R4.x, fragment.texcoord[5], texture[2], 2D;
MAD R2.xyz, R2, c[1].x, R1;
MUL R2.xyz, R2, c[3].x;
ADD R3.xyz, R2, -R1;
MAD R1.xyz, R3, R1.w, R1;
MUL R3.xyz, R0.w, R0;
DP3 R2.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.w, R2.w;
MUL R4.yzw, R2.w, fragment.texcoord[2].xxyz;
DP3_SAT R0.w, R4.yzww, fragment.texcoord[3];
ADD R0.w, -R0, c[4].x;
MUL R0.xyz, R0, R4.x;
MUL R0.w, R0, c[3];
POW R0.w, R0.w, c[0].x;
MUL R2.xyz, R2, R0.w;
MUL R3.xyz, R3, c[3].z;
MUL R0.xyz, R0, c[3].w;
MIN R0.xyz, R3, R0;
MUL R3.xyz, R3, R4.x;
MUL R2.xyz, R2, c[2].x;
MAX R0.xyz, R0, R3;
MAD result.color.xyz, R1, R0, R2;
MOV result.color.w, c[3].y;
END
# 26 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_RimPower]
Float 1 [_cubeIntesity]
Float 2 [_emission]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
def c3, 0.50000000, 1.00000000, 2.00000000, 8.00000000
def c4, 0.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xy
dcl t5
texld r2, t1, s1
texld r1, t0, s0
texldp r5, t5, s2
texld r3, t4, s3
dp3 r0.x, t2, t2
rsq r0.x, r0.x
mul r0.xyz, r0.x, t2
dp3_sat r0.x, r0, t3
add r0.x, -r0, c3.y
mul_pp r4.xyz, r3, r5.x
mul_pp r3.xyz, r3.w, r3
mul_pp r3.xyz, r3, c3.w
mul_pp r4.xyz, r4, c3.z
min_pp r4.xyz, r3, r4
mul_pp r3.xyz, r3, r5.x
mul r0.x, r0, c3.z
max_pp r4.xyz, r4, r3
pow_pp r3.w, r0.x, c0.x
mad r0.xyz, r2, c1.x, r1
mul r2.xyz, r0, c3.x
mov_pp r0.x, r3.w
add_pp r3.xyz, r2, -r1
mul r0.xyz, r2, r0.x
mad_pp r1.xyz, r3, r1.w, r1
mul r0.xyz, r0, c2.x
mov_pp r0.w, c4.x
mad_pp r0.xyz, r1, r4, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 160
Float 116 [_RimPower]
Float 120 [_cubeIntesity]
Float 124 [_emission]
BindCB  "$Globals" 0
"ps_4_0
eefiecedadaidbgfedhkgahdfmkoinhggfokmibeabaaaaaajiafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgaaeaaaaeaaaaaaabiabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaadaaaaaa
eeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaa
pgapbaaaaaaaaaaaegbcbaaaadaaaaaabacaaaahicaabaaaaaaaaaaaegacbaaa
abaaaaaaegbcbaaaaeaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaacpaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaai
icaabaaaaaaaaaaadkaabaaaaaaaaaaabkiacaaaaaaaaaaaahaaaaaabjaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegacbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaa
diaaaaakhcaabaaaadaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaaj
hcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaa
diaaaaahhcaabaaaacaaaaaapgapbaaaaaaaaaaaegacbaaaadaaaaaadiaaaaai
hcaabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaaaaaaaaaahaaaaaadcaaaaaj
hccabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 160
Float 116 [_RimPower]
Float 120 [_cubeIntesity]
Float 124 [_emission]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhdchdeejlmbadpbkdpencfoeghpegbfbabaaaaaacmaiaaaaaeaaaaaa
daaaaaaamaacaaaaciahaaaapiahaaaaebgpgodjiiacaaaaiiacaaaaaaacpppp
eiacaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaacaaaaaa
aaababaaabacacaaadadadaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaiadpaaaaaadpaaaaaaebaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaac
aaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkabpaaaaacaaaaaajaadaiapka
agaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappiaaeaaoelaabaaaaac
abaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
abaaoeiaadaioekaecaaaaadacaaapiaabaaoelaacaioekaecaaaaadadaaapia
aaaaoelaabaioekaacaaaaadacaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoia
abaabliaacaappiaafaaaaadabaaciiaabaappiaabaakkkaafaaaaadabaachia
abaaoeiaabaappiaakaaaaadaeaachiaaaaabliaabaaoeiaafaaaaadaaaachia
aaaaaaiaabaaoeiaalaaaaadabaachiaaeaaoeiaaaaaoeiaaeaaaaaeaaaaahia
acaaoeiaaaaakkkaadaaoeiaaeaaaaaeacaaahiaaaaaoeiaabaaffkaadaaoeib
afaaaaadaaaaahiaaaaaoeiaabaaffkaaeaaaaaeacaachiaadaappiaacaaoeia
adaaoeiaceaaaaacadaaahiaacaaoelaaiaaaaadaaaabiiaadaaoeiaadaaoela
acaaaaadaaaaaiiaaaaappibabaaaakaacaaaaadaaaaciiaaaaappiaaaaappia
caaaaaadabaaaiiaaaaappiaaaaaffkaafaaaaadaaaaahiaaaaaoeiaabaappia
afaaaaadaaaachiaaaaaoeiaaaaappkaaeaaaaaeaaaachiaacaaoeiaabaaoeia
aaaaoeiaabaaaaacaaaaciiaabaappkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcgaaeaaaaeaaaaaaabiabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadlcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaa
pgbpbaaaafaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
aaaaaaebdiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaa
ddaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
hcaabaaaabaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaegacbaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaadaaaaaaegbcbaaaadaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaadaaaaaa
bacaaaahicaabaaaaaaaaaaaegacbaaaabaaaaaaegbcbaaaaeaaaaaaaaaaaaai
icaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaacpaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaaiicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkiacaaaaaaaaaaaahaaaaaabjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaakgikcaaa
aaaaaaaaahaaaaaaegacbaaaacaaaaaadiaaaaakhcaabaaaadaaaaaaegacbaaa
abaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadcaaaaanhcaabaaa
abaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaa
egacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaahhcaabaaaacaaaaaapgapbaaa
aaaaaaaaegacbaaaadaaaaaadiaaaaaihcaabaaaacaaaaaaegacbaaaacaaaaaa
pgipcaaaaaaaaaaaahaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaaegacbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
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
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
ADD result.texcoord[4].xyz, -R0, c[17];
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
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
add oT4.xyz, -r0, c16
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefiecedccifkiiikdfpohcdcbabllgloabhcaijabaaaaaakaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcneafaaaaeaaaabaahfabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaj
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
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
eefiecedeblinniglfeoencjpehlpdlegdonbggdabaaaaaaoiakaaaaaeaaaaaa
daaaaaaaheadaaaafaajaaaabiakaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
mmacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaabaaaaacaaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoeka
aeaaaaaeaaaaaliabaaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahia
aaaaoeiabeaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
acaaoejabeaappkaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaanaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
apaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoaaaaaoeibahaaoekaacaaaaad
aeaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaae
aaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcneafaaaaeaaaabaa
hfabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[14];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 2 R-regs
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
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c13
add oT4.xyz, -r0, c12
mad oT0.xy, v2, c15, c15.zwzw
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
"vs_4_0
eefiecedjggjihjnnledcpnemmaifkloeneincffabaaaaaaeaagaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcimaeaaaaeaaaabaacdabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaa
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
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedaljfneeeaeoblbeobfhdiioakajiejhdabaaaaaaoaaiaaaaaeaaaaaa
daaaaaaammacaaaagaahaaaaciaiaaaaebgpgodjjeacaaaajeacaaaaaaacpopp
daacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaeaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaajaaaiaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaabaaaaacaaaaahia
acaaoekaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakeka
aaaaaaiaabaakeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkiaaaaapeiaacaaaaad
aaaaahiaaaaaoeiaapaaoekaaeaaaaaeaaaaahiaaaaaoeiabaaappkaaaaaoejb
aiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaadaaaaaiiaaaaappiaaaaappia
aeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeibafaaaaadabaaahiaaaaaffia
ajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeiaaeaaaaaeabaaahoa
akaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaacaaoejabaaappkaafaaaaad
abaaahiaaaaaffiaajaaoekaaeaaaaaeaaaaaliaaiaakekaaaaaaaiaabaakeia
aeaaaaaeacaaahoaakaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffja
ajaaoekaaeaaaaaeaaaaahiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahia
akaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaappjaaaaaoeia
acaaaaadaeaaahoaaaaaoeibacaaoekaafaaaaadaaaaapiaaaaaffjaafaaoeka
aeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
adaaahoaadaaoekappppaaaafdeieefcimaeaaaaeaaaabaacdabaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajhcaabaaa
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
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
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
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
ADD result.texcoord[4].xyz, -R0, c[17];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 31 instructions, 2 R-regs
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
dp4 oT5.w, r0, c15
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
add oT4.xyz, -r0, c16
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefiecedpabboeinobgffkkocbmgbogdfjffpjakabaaaaaakaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcneafaaaaeaaaabaahfabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaj
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
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
eefiecedokehekmijmigckfkaohgiofomppjdmmkabaaaaaaoiakaaaaaeaaaaaa
daaaaaaaheadaaaafaajaaaabiakaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
mmacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaabaaaaacaaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoeka
aeaaaaaeaaaaaliabaaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahia
aaaaoeiabeaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
acaaoejabeaappkaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaanaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
apaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoaaaaaoeibahaaoekaacaaaaad
aeaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaae
aaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaadabaaapia
aaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaapoaaeaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcneafaaaaeaaaabaa
hfabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[18];
ADD result.texcoord[4].xyz, -R0, c[17];
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
dp4 oT5.z, r0, c14
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c17
add oT4.xyz, -r0, c16
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefiecedccifkiiikdfpohcdcbabllgloabhcaijabaaaaaakaahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcneafaaaaeaaaabaahfabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaaj
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
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
acaaaaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
eefiecedeblinniglfeoencjpehlpdlegdonbggdabaaaaaaoiakaaaaaeaaaaaa
daaaaaaaheadaaaafaajaaaabiakaaaaebgpgodjdmadaaaadmadaaaaaaacpopp
mmacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaabaaaaacaaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoeka
aeaaaaaeaaaaaliabaaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahia
aaaaoeiabeaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
acaaoejabeaappkaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaanaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
apaaoekaaaaappjaaaaaoeiaacaaaaadadaaahoaaaaaoeibahaaoekaacaaaaad
aeaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffjaanaaoekaaeaaaaae
aaaaapiaamaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaalaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefcneafaaaaeaaaabaa
hfabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
afaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
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
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[18];
ADD result.texcoord[4].xyz, -R0, c[17];
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
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT5.y, r0, c13
dp4 oT5.x, r0, c12
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c17
add oT4.xyz, -r0, c16
mad oT0.xy, v2, c19, c19.zwzw
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
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
"vs_4_0
eefieceddnfjfialcfoipecdjdgbgboadcjmpjakabaaaaaajeahaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcmiafaaaaeaaaabaahcabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaa
abaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
abaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaaaaaaaaaafgifcaaaabaaaaaa
aeaaaaaaegiccaaaadaaaaaabbaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaa
adaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaadaaaaaabcaaaaaakgikcaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
adaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
adaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaegbcbaaaacaaaaaaaaaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgapbaiaebaaaaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaacaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaeaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_MainTex_ST]
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
eefiecedogefnejjblbahogaiegieomcfhnlpnpmabaaaaaaniakaaaaaeaaaaaa
daaaaaaahaadaaaaeaajaaaaaiakaaaaebgpgodjdiadaaaadiadaaaaaaacpopp
miacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaeaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaajaaamaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoeka
afaaookaabaaaaacaaaaahiaagaaoekaafaaaaadabaaahiaaaaaffiabbaaoeka
aeaaaaaeaaaaaliabaaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabcaaoeka
aaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabdaaoekaaeaaaaaeaaaaahia
aaaaoeiabeaappkaaaaaoejbaiaaaaadaaaaaiiaaaaaoeibacaaoejaacaaaaad
aaaaaiiaaaaappiaaaaappiaaeaaaaaeaaaaahiaacaaoejaaaaappibaaaaoeib
afaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaaliaamaakekaaaaaaaia
abaakeiaaeaaaaaeabaaahoaaoaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
acaaoejabeaappkaafaaaaadabaaahiaaaaaffiaanaaoekaaeaaaaaeaaaaalia
amaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaaoaaoekaaaaakkiaaaaapeia
afaaaaadaaaaahiaaaaaffjaanaaoekaaeaaaaaeaaaaahiaamaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahia
apaaoekaaaaappjaaaaaoeiaacaaaaadaeaaahoaaaaaoeibagaaoekaafaaaaad
aaaaapiaaaaaffjaanaaoekaaeaaaaaeaaaaapiaamaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaapaaoeka
aaaappjaaaaaoeiaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadia
abaaobkaaaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeia
aeaaaaaeaaaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffja
ajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
akaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacadaaahoaahaaoekappppaaaafdeieefcmiafaaaaeaaaabaahcabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaafaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaak
dcaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaa
aaaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaa
aaaaaaaaagaebaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadiaaaaajhcaabaaa
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
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaa
afaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 48, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], CUBE;
MAD R3.xyz, R1, c[1].x, R0;
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.x;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R3.xyz, R3, c[2].z;
ADD R3.xyz, R3, -R0;
MAD R0.xyz, R3, R0.w, R0;
MUL R1.xyz, R1.x, fragment.texcoord[3];
RSQ R2.x, R2.x;
MAD R2.xyz, R2.x, fragment.texcoord[4], R1;
DP3 R1.x, fragment.texcoord[2], R1;
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R2.xyz, R2.w, R2;
DP3 R0.w, fragment.texcoord[2], R2;
MAX R1.x, R1, c[2];
MAX R0.w, R0, c[2].x;
MUL R1.xyz, R0, R1.x;
POW R0.x, R0.w, c[2].y;
MAD R0.xyz, R0.x, c[0].x, R1;
MOV result.color.w, c[2].x;
TEX R1.w, R1.w, texture[2], 2D;
MUL R0.w, R1, c[2];
MUL result.color.xyz, R0, R0.w;
END
# 27 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c2, 0.00000000, 48.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r3, t1, s1
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mad r3.xyz, r3, c1.x, r1
mul r3.xyz, r3, c2.z
add_pp r3.xyz, r3, -r1
mad_pp r3.xyz, r3, r1.w, r1
mov_pp r0.w, c2.x
texld r5, r0, s2
dp3_pp r0.x, t3, t3
rsq_pp r2.x, r0.x
mul_pp r2.xyz, r2.x, t3
dp3_pp r1.x, t2, r2
max_pp r1.x, r1, c2
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mad_pp r4.xyz, r0.x, t4, r2
dp3_pp r0.x, r4, r4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r4
dp3_pp r0.x, t2, r0
max_pp r0.x, r0, c2
pow r2.x, r0.x, c2.y
mul_pp r3.xyz, r3, r1.x
mov r1.x, r2.x
mul_pp r0.x, r5, c2.w
mad r1.xyz, r1.x, c0.x, r3
mul r0.xyz, r1, r0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjmjoehhomehdmjinfklbalphoblogkkoabaaaaaacmafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpeadaaaaeaaaaaaapnaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaaj
hcaabaaaabaaaaaaegbcbaaaafaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaa
aaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaa
acaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegacbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaa
dcaaaaanhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaadpaaaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaa
pgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaa
abaaaaaapgapbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaaaaaaaaah
icaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcbaedackgcddjlkgenmhhdkplmnimdefabaaaaaahmahaaaaaeaaaaaa
daaaaaaahmacaaaahiagaaaaeiahaaaaebgpgodjeeacaaaaeeacaaaaaaacpppp
aiacaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
aaababaaabacacaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaeaecaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaahlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajiacaiapkaaiaaaaad
aaaaaiiaafaaoelaafaaoelaabaaaaacaaaaadiaaaaappiaecaaaaadabaaapia
abaaoelaacaioekaecaaaaadacaaapiaaaaaoelaabaioekaecaaaaadaaaacpia
aaaaoeiaaaaioekaaeaaaaaeaaaaaoiaabaabliaaaaakkkaacaabliaaeaaaaae
aaaaaoiaaaaaoeiaabaaaakaacaablibaeaaaaaeaaaacoiaacaappiaaaaaoeia
acaabliaaiaaaaadabaacbiaaeaaoelaaeaaoelaahaaaaacabaacbiaabaaaaia
ceaaaaacacaachiaadaaoelaaeaaaaaeabaachiaaeaaoelaabaaaaiaacaaoeia
aiaaaaadabaaciiaacaaoelaacaaoeiaalaaaaadacaacbiaabaappiaabaaffka
ceaaaaacadaachiaabaaoeiaaiaaaaadabaacbiaacaaoelaadaaoeiaalaaaaad
acaaaciaabaaaaiaabaaffkacaaaaaadabaaabiaacaaffiaabaakkkaafaaaaad
abaaabiaabaaaaiaaaaaaakaaeaaaaaeaaaaaoiaaaaaoeiaacaaaaiaabaaaaia
acaaaaadaaaaabiaaaaaaaiaaaaaaaiaafaaaaadaaaachiaaaaaaaiaaaaablia
abaaaaacaaaaciiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
peadaaaaeaaaaaaapnaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
jgahbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaeaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaakgikcaaaaaaaaaaa
ahaaaaaaegacbaaaacaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaegacbaiaebaaaaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 48, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], CUBE;
MAD R3.xyz, R1, c[1].x, R0;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MUL R3.xyz, R3, c[2].z;
ADD R3.xyz, R3, -R0;
MAD R0.xyz, R3, R0.w, R0;
MOV R1.xyz, fragment.texcoord[3];
RSQ R1.w, R1.w;
MAD R2.xyz, R1.w, fragment.texcoord[4], R1;
DP3 R1.x, fragment.texcoord[2], R1;
DP3 R1.w, R2, R2;
RSQ R1.w, R1.w;
MUL R2.xyz, R1.w, R2;
DP3 R0.w, fragment.texcoord[2], R2;
MAX R1.x, R1, c[2];
MUL R1.xyz, R0, R1.x;
MAX R0.w, R0, c[2].x;
POW R0.x, R0.w, c[2].y;
MAD R0.xyz, R0.x, c[0].x, R1;
MUL result.color.xyz, R0, c[2].w;
MOV result.color.w, c[2].x;
END
# 22 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c2, 0.00000000, 48.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r2, t1, s1
texld r1, t0, s0
dp3_pp r0.x, t4, t4
mad r2.xyz, r2, c1.x, r1
mul r2.xyz, r2, c2.z
add_pp r2.xyz, r2, -r1
mad_pp r2.xyz, r2, r1.w, r1
mov_pp r1.xyz, t3
rsq_pp r0.x, r0.x
mov_pp r3.xyz, t3
mad_pp r3.xyz, r0.x, t4, r3
dp3_pp r0.x, r3, r3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r3
dp3_pp r0.x, t2, r0
max_pp r0.x, r0, c2
pow r3.x, r0.x, c2.y
dp3_pp r1.x, t2, r1
max_pp r0.x, r1, c2
mul_pp r1.xyz, r2, r0.x
mov r0.x, r3.x
mad r0.xyz, r0.x, c0.x, r1
mul r0.xyz, r0, c2.w
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 80
Float 48 [_specPower]
Float 56 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbpaaadcancbccnnmlphighclhhgkkaekabaaaaaafeaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdeadaaaa
eaaaaaaamnaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
afaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaeaecbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaa
adaaaaaaagajbaaaacaaaaaadcaaaaanocaabaaaaaaaaaaafgaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadpagajbaiaebaaaaaaacaaaaaa
dcaaaaajocaabaaaaaaaaaaapgapbaaaacaaaaaafgaobaaaaaaaaaaaagajbaaa
acaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaabaaaaaaagaabaaaaaaaaaaa
aaaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 80
Float 48 [_specPower]
Float 56 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedihablnabhhglkpmlnonghpmocjlloncbabaaaaaafiagaaaaaeaaaaaa
daaaaaaadaacaaaagmafaaaaceagaaaaebgpgodjpiabaaaapiabaaaaaaacpppp
maabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadp
aaaaaaaaaaaaeaecaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapka
aiaaaaadaaaaciiaaeaaoelaaeaaoelaahaaaaacaaaacbiaaaaappiaabaaaaac
abaaahiaaeaaoelaaeaaaaaeaaaachiaabaaoeiaaaaaaaiaadaaoelaceaaaaac
abaachiaaaaaoeiaaiaaaaadaaaacbiaacaaoelaabaaoeiaalaaaaadabaaabia
aaaaaaiaabaaffkacaaaaaadaaaaabiaabaaaaiaabaakkkaafaaaaadaaaaabia
aaaaaaiaaaaaaakaecaaaaadabaaapiaabaaoelaabaioekaecaaaaadacaaapia
aaaaoelaaaaioekaaeaaaaaeaaaaaoiaabaabliaaaaakkkaacaabliaaeaaaaae
aaaaaoiaaaaaoeiaabaaaakaacaablibaeaaaaaeaaaacoiaacaappiaaaaaoeia
acaabliaabaaaaacabaaahiaacaaoelaaiaaaaadabaacbiaabaaoeiaadaaoela
alaaaaadacaacbiaabaaaaiaabaaffkaaeaaaaaeaaaaahiaaaaabliaacaaaaia
aaaaaaiaacaaaaadaaaachiaaaaaoeiaaaaaoeiaabaaaaacaaaaaiiaabaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdeadaaaaeaaaaaaamnaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaeaec
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaak
ocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaadaaaaaaagajbaaa
acaaaaaadcaaaaanocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaaaadpaaaaaadpagajbaiaebaaaaaaacaaaaaadcaaaaajocaabaaa
aaaaaaaapgapbaaaacaaaaaafgaobaaaaaaaaaaaagajbaaaacaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
jgahbaaaaaaaaaaaagaabaaaabaaaaaaagaabaaaaaaaaaaaaaaaaaahhccabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
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
Keywords { "SPOT" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 48, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[0], texture[0], 2D;
RCP R0.x, fragment.texcoord[5].w;
MAD R1.xy, fragment.texcoord[5], R0.x, c[2].z;
DP3 R1.z, fragment.texcoord[5], fragment.texcoord[5];
MOV result.color.w, c[2].x;
TEX R0.w, R1, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[1], CUBE;
TEX R1.w, R1.z, texture[3], 2D;
MAD R0.xyz, R0, c[1].x, R2;
MUL R3.xyz, R0, c[2].z;
ADD R3.xyz, R3, -R2;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R1.x;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.xyz, R0.x, fragment.texcoord[3];
MAD R2.xyz, R3, R2.w, R2;
RSQ R1.x, R1.x;
MAD R1.xyz, R1.x, fragment.texcoord[4], R0;
DP3 R3.w, R1, R1;
DP3 R3.x, fragment.texcoord[2], R0;
RSQ R2.w, R3.w;
MUL R0.xyz, R2.w, R1;
DP3 R1.x, fragment.texcoord[2], R0;
MAX R1.y, R3.x, c[2].x;
MUL R0.xyz, R2, R1.y;
SLT R1.y, c[2].x, fragment.texcoord[5].z;
MUL R0.w, R1.y, R0;
MAX R1.x, R1, c[2];
MUL R1.y, R0.w, R1.w;
POW R0.w, R1.x, c[2].y;
MUL R1.x, R1.y, c[2].w;
MAD R0.xyz, R0.w, c[0].x, R0;
MUL result.color.xyz, R0, R1.x;
END
# 33 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_2d s3
def c2, 0.00000000, 48.00000000, 0.50000000, 1.00000000
def c3, 2.00000000, 0, 0, 0
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5
rcp r1.x, t5.w
mad r2.xy, t5, r1.x, c2.z
dp3 r0.x, t5, t5
mov r1.xy, r0.x
texld r0, r2, s2
texld r5, r1, s3
texld r2, t1, s1
texld r1, t0, s0
mad r3.xyz, r2, c1.x, r1
dp3_pp r0.x, t3, t3
rsq_pp r2.x, r0.x
dp3_pp r0.x, t4, t4
mul r3.xyz, r3, c2.z
add_pp r3.xyz, r3, -r1
mul_pp r2.xyz, r2.x, t3
rsq_pp r0.x, r0.x
mad_pp r4.xyz, r0.x, t4, r2
dp3_pp r0.x, r4, r4
mad_pp r1.xyz, r3, r1.w, r1
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r0.x, r4
dp3_pp r0.x, t2, r2
dp3_pp r2.x, t2, r3
max_pp r3.x, r0, c2
max_pp r0.x, r2, c2
mul_pp r2.xyz, r1, r3.x
pow r1.w, r0.x, c2.y
cmp r0.x, -t5.z, c2, c2.w
mul_pp r0.x, r0, r0.w
mul_pp r0.x, r0, r5
mul_pp r0.x, r0, c3
mad r1.xyz, r1.w, c0.x, r2
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Cube] CUBE 3
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0
eefieceddclllbbkikkamchnkjdomohjamhgocgjabaaaaaaaeagaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmaeaaaaeaaaaaaaddabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
pcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaafaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaan
hcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaaaaaaaakdcaabaaaabaaaaaa
egaabaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
dbaaaaahicaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaaapaaaaahicaabaaaaaaaaaaa
pgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Cube] CUBE 3
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefieceddnkgoomnahbbnifanhigoegcimbbaeeaabaaaaaaliaiaaaaaeaaaaaa
daaaaaaaoaacaaaaleahaaaaieaiaaaaebgpgodjkiacaaaakiacaaaaaaacpppp
giacaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaacaaaaaa
adababaaaaacacaaabadadaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaadpaaaaaaaaaaaaeaecaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajiadaiapkaagaaaaacaaaaaiiaafaapplaaeaaaaaeaaaaadia
afaaoelaaaaappiaabaaaakaaiaaaaadabaaaiiaafaaoelaafaaoelaabaaaaac
abaaadiaabaappiaecaaaaadacaaapiaabaaoelaadaioekaecaaaaadadaaapia
aaaaoelaacaioekaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpia
abaaoeiaabaioekaaeaaaaaeaaaaahiaacaaoeiaaaaakkkaadaaoeiaaeaaaaae
aaaaahiaaaaaoeiaabaaaakaadaaoeibaeaaaaaeaaaachiaadaappiaaaaaoeia
adaaoeiaaiaaaaadabaacciaaeaaoelaaeaaoelaahaaaaacabaacciaabaaffia
ceaaaaacacaachiaadaaoelaaeaaaaaeadaachiaaeaaoelaabaaffiaacaaoeia
aiaaaaadadaaciiaacaaoelaacaaoeiaalaaaaadabaacciaadaappiaabaaffka
ceaaaaacacaachiaadaaoeiaaiaaaaadabaaceiaacaaoelaacaaoeiaalaaaaad
acaaabiaabaakkiaabaaffkacaaaaaadabaaaeiaacaaaaiaabaakkkaafaaaaad
abaaaeiaabaakkiaaaaaaakaaeaaaaaeaaaaahiaaaaaoeiaabaaffiaabaakkia
afaaaaadaaaaciiaaaaappiaabaaaaiafiaaaaaeaaaaciiaafaakklbabaaffka
aaaappiaacaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaabaaaaacaaaaaiiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcmmaeaaaaeaaaaaaaddabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
jgahbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaeaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaakgikcaaaaaaaaaaa
ahaaaaaaegacbaaaacaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaegacbaiaebaaaaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaagaaaaaapgbpbaaa
agaaaaaaaaaaaaakdcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaa
aaaaaaaackbabaaaagaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaa
aaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaa
efaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaaeghobaaaadaaaaaaaagabaaa
abaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 48, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R0.xyz, fragment.texcoord[1], texture[1], CUBE;
TEX R1.w, fragment.texcoord[5], texture[3], CUBE;
MAD R0.xyz, R0, c[1].x, R2;
MUL R3.xyz, R0, c[2].z;
ADD R3.xyz, R3, -R2;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R1.x;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.xyz, R0.x, fragment.texcoord[3];
MAD R2.xyz, R3, R2.w, R2;
RSQ R1.x, R1.x;
MAD R1.xyz, R1.x, fragment.texcoord[4], R0;
DP3 R3.w, R1, R1;
DP3 R3.x, fragment.texcoord[2], R0;
RSQ R2.w, R3.w;
MUL R0.xyz, R2.w, R1;
DP3 R1.x, fragment.texcoord[2], R0;
MAX R1.y, R3.x, c[2].x;
MUL R0.xyz, R2, R1.y;
MAX R1.x, R1, c[2];
MOV result.color.w, c[2].x;
TEX R0.w, R0.w, texture[2], 2D;
MUL R1.y, R0.w, R1.w;
POW R0.w, R1.x, c[2].y;
MUL R1.x, R1.y, c[2].w;
MAD R0.xyz, R0.w, c[0].x, R0;
MUL result.color.xyz, R0, R1.x;
END
# 29 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
dcl_cube s3
def c2, 0.00000000, 48.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r2, t1, s1
texld r1, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mad r3.xyz, r2, c1.x, r1
mul r3.xyz, r3, c2.z
add_pp r3.xyz, r3, -r1
mad_pp r1.xyz, r3, r1.w, r1
texld r5, r0, s2
texld r0, t5, s3
dp3_pp r0.x, t3, t3
rsq_pp r2.x, r0.x
dp3_pp r0.x, t4, t4
mul_pp r2.xyz, r2.x, t3
rsq_pp r0.x, r0.x
mad_pp r4.xyz, r0.x, t4, r2
dp3_pp r0.x, r4, r4
rsq_pp r0.x, r0.x
mul_pp r3.xyz, r0.x, r4
dp3_pp r0.x, t2, r2
dp3_pp r2.x, t2, r3
max_pp r3.x, r0, c2
max_pp r0.x, r2, c2
mul_pp r2.xyz, r1, r3.x
pow r1.w, r0.x, c2.y
mul r0.x, r5, r0.w
mul_pp r0.x, r0, c2.w
mad r1.xyz, r1.w, c0.x, r2
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Cube] CUBE 3
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedfgpnmofpnjkdiokbdanneekbbccdgabbabaaaaaagmafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdeaeaaaaeaaaaaaaanabaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafidaaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaad
hcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaadcaaaaajhcaabaaa
abaaaaaaegbcbaaaafaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaa
deaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaacpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaeaecbjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaaabaaaaaaegbcbaaaacaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaakhcaabaaaabaaaaaa
egacbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaaegacbaaaacaaaaaadcaaaaan
hcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaegacbaiaebaaaaaaacaaaaaadcaaaaajhcaabaaaabaaaaaapgapbaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaa
egacbaaaabaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
pgapbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbcbaaaagaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaapaaaaah
icaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaaacaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_Cube] CUBE 3
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedepadfkcahlpndnkahhpjfdeldfolflgjabaaaaaaoaahaaaaaeaaaaaa
daaaaaaakaacaaaanmagaaaakmahaaaaebgpgodjgiacaaaagiacaaaaaaacpppp
ciacaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaadaaaaaa
acababaaaaacacaaabadadaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaaadpaaaaaaaaaaaaeaecaaaaaaaabpaaaaacaaaaaaiaaaaaadla
bpaaaaacaaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaia
adaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaahlabpaaaaac
aaaaaajiaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajiadaiapkaecaaaaadaaaaapiaabaaoelaadaioekaecaaaaad
abaaapiaaaaaoelaacaioekaecaaaaadacaaapiaafaaoelaaaaioekaaeaaaaae
aaaaahiaaaaaoeiaaaaakkkaabaaoeiaaeaaaaaeaaaaahiaaaaaoeiaabaaaaka
abaaoeibaeaaaaaeaaaachiaabaappiaaaaaoeiaabaaoeiaaiaaaaadaaaaciia
aeaaoelaaeaaoelaahaaaaacaaaaciiaaaaappiaceaaaaacabaachiaadaaoela
aeaaaaaeacaachiaaeaaoelaaaaappiaabaaoeiaaiaaaaadaaaaciiaacaaoela
abaaoeiaalaaaaadabaacbiaaaaappiaabaaffkaceaaaaacadaachiaacaaoeia
aiaaaaadaaaaciiaacaaoelaadaaoeiaalaaaaadabaaaciaaaaappiaabaaffka
caaaaaadaaaaaiiaabaaffiaabaakkkaafaaaaadaaaaaiiaaaaappiaaaaaaaka
aeaaaaaeaaaaahiaaaaaoeiaabaaaaiaaaaappiaaiaaaaadabaaadiaafaaoela
afaaoelaecaaaaadabaaapiaabaaoeiaabaioekaafaaaaadaaaaciiaacaappia
abaaaaiaacaaaaadaaaaaiiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaabaaaaacaaaaciiaabaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcdeaeaaaaeaaaaaaaanabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaabaaaaaaegbcbaaaafaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
jgahbaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacpaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaeaecbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaakgikcaaaaaaaaaaa
ahaaaaaaegacbaaaacaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaegacbaiaebaaaaaaacaaaaaa
dcaaaaajhcaabaaaabaaaaaapgapbaaaacaaaaaaegacbaaaabaaaaaaegacbaaa
acaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
fgafbaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaagaaaaaaeghobaaa
adaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaaabaaaaaa
pgapbaaaacaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 48, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[1], CUBE;
TEX R1.w, fragment.texcoord[5], texture[2], 2D;
MAD R3.xyz, R1, c[1].x, R0;
DP3 R2.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R3.xyz, R3, c[2].z;
ADD R3.xyz, R3, -R0;
MAD R0.xyz, R3, R0.w, R0;
MOV R1.xyz, fragment.texcoord[3];
RSQ R2.x, R2.x;
MAD R2.xyz, R2.x, fragment.texcoord[4], R1;
DP3 R1.x, fragment.texcoord[2], R1;
DP3 R2.w, R2, R2;
RSQ R2.w, R2.w;
MUL R2.xyz, R2.w, R2;
DP3 R0.w, fragment.texcoord[2], R2;
MAX R1.x, R1, c[2];
MAX R0.w, R0, c[2].x;
MUL R1.xyz, R0, R1.x;
POW R0.x, R0.w, c[2].y;
MUL R0.w, R1, c[2];
MAD R0.xyz, R0.x, c[0].x, R1;
MUL result.color.xyz, R0, R0.w;
MOV result.color.w, c[2].x;
END
# 24 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Float 0 [_specPower]
Float 1 [_cubeIntesity]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_Cube] CUBE 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_cube s1
dcl_2d s2
def c2, 0.00000000, 48.00000000, 0.50000000, 2.00000000
dcl t0.xy
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r0, t5, s2
texld r2, t1, s1
texld r1, t0, s0
dp3_pp r0.x, t4, t4
mad r3.xyz, r2, c1.x, r1
mul r3.xyz, r3, c2.z
add_pp r3.xyz, r3, -r1
mad_pp r3.xyz, r3, r1.w, r1
mov_pp r1.xyz, t3
dp3_pp r1.x, t2, r1
max_pp r1.x, r1, c2
rsq_pp r0.x, r0.x
mov_pp r2.xyz, t3
mad_pp r2.xyz, r0.x, t4, r2
dp3_pp r0.x, r2, r2
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, r2
dp3_pp r0.x, t2, r0
max_pp r0.x, r0, c2
pow r2.x, r0.x, c2.y
mul_pp r0.x, r0.w, c2.w
mul_pp r3.xyz, r3, r1.x
mov r1.x, r2.x
mad r1.xyz, r1.x, c0.x, r3
mul r0.xyz, r1, r0.x
mov_pp r0.w, c2.x
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedccojjmadooaleeebiibjcpddhfhheapoabaaaaaaneaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmadaaaaeaaaaaaaohaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaa
afaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaeaecbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaa
ahaaaaaaagajbaaaacaaaaaadcaaaaanocaabaaaaaaaaaaafgaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaadpagajbaiaebaaaaaaacaaaaaa
dcaaaaajocaabaaaaaaaaaaapgapbaaaacaaaaaafgaobaaaaaaaaaaaagajbaaa
acaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadcaaaaaj
hcaabaaaaaaaaaaajgahbaaaaaaaaaaaagaabaaaabaaaaaaagaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_Cube] CUBE 2
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Float 112 [_specPower]
Float 120 [_cubeIntesity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedokcdpbaeilnpengnlhlcaobjohgohefdabaaaaaabeahaaaaaeaaaaaa
daaaaaaagmacaaaabaagaaaaoaagaaaaebgpgodjdeacaaaadeacaaaaaaacpppp
piabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
aaababaaabacacaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaeaecaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaahlabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajiacaiapkaaiaaaaadaaaaciiaaeaaoelaaeaaoela
ahaaaaacaaaacbiaaaaappiaabaaaaacabaaahiaaeaaoelaaeaaaaaeaaaachia
abaaoeiaaaaaaaiaadaaoelaceaaaaacabaachiaaaaaoeiaaiaaaaadaaaacbia
acaaoelaabaaoeiaalaaaaadabaaabiaaaaaaaiaabaaffkacaaaaaadaaaaabia
abaaaaiaabaakkkaafaaaaadaaaaabiaaaaaaaiaaaaaaakaabaaaaacabaaadia
aaaabllaecaaaaadacaaapiaabaaoelaacaioekaecaaaaadadaaapiaaaaaoela
abaioekaecaaaaadabaacpiaabaaoeiaaaaioekaaeaaaaaeaaaaaoiaacaablia
aaaakkkaadaabliaaeaaaaaeaaaaaoiaaaaaoeiaabaaaakaadaablibaeaaaaae
aaaacoiaadaappiaaaaaoeiaadaabliaabaaaaacabaaahiaacaaoelaaiaaaaad
abaacbiaabaaoeiaadaaoelaalaaaaadacaacbiaabaaaaiaabaaffkaaeaaaaae
aaaaahiaaaaabliaacaaaaiaaaaaaaiaacaaaaadaaaaaiiaabaappiaabaappia
afaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciiaabaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcjmadaaaaeaaaaaaaohaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaaegbcbaaaafaaaaaa
agaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaeaecbjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaahaaaaaaefaaaaajpcaabaaa
abaaaaaaegbcbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaahaaaaaa
agajbaaaacaaaaaadcaaaaanocaabaaaaaaaaaaafgaobaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaadpaaaaaadpaaaaaadpagajbaiaebaaaaaaacaaaaaadcaaaaaj
ocaabaaaaaaaaaaapgapbaaaacaaaaaafgaobaaaaaaaaaaaagajbaaaacaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaajgahbaaaaaaaaaaaagaabaaaabaaaaaaagaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaadkaabaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
lmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaalmaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}