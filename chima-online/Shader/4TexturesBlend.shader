//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/4 Textures Blend" {
Properties {
 _Splat0 ("Layer 1", 2D) = "white" {}
 _Splat1 ("Layer 2", 2D) = "white" {}
 _Splat2 ("Layer 3", 2D) = "white" {}
 _Splat3 ("Layer 4", 2D) = "white" {}
 _Occlusion ("Occlusion (RGB)", 2D) = "white" {}
 _Control ("Control (RGBA)", 2D) = "white" {}
 _MainTex ("Never Used", 2D) = "white" {}
}
SubShader { 
 Tags { "RenderType"="Opaque" "SplatCount"="4" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "SplatCount"="4" }
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
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
Vector 17 [_Control_ST]
Vector 18 [_Splat0_ST]
Vector 19 [_Splat1_ST]
Vector 20 [_Splat2_ST]
Vector 21 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
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
ADD result.texcoord[4].xyz, R2, R1;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[21], c[21].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 31 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
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
Vector 16 [_Control_ST]
Vector 17 [_Splat0_ST]
Vector 18 [_Splat1_ST]
Vector 19 [_Splat2_ST]
Vector 20 [_Splat3_ST]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c15.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c21.x
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
add oT4.xyz, r2, r1
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r0
mad oT0.zw, v2.xyxy, c17.xyxy, c17
mad oT0.xy, v2, c16, c16.zwzw
mad oT1.zw, v2.xyxy, c19.xyxy, c19
mad oT1.xy, v2, c18, c18.zwzw
mad oT2.xy, v2, c20, c20.zwzw
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
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedjgemfkaadmkdmjejkmofdbkdjkfnkeoaabaaaaaapiafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefceeaeaaaaeaaaabaabbabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedmlgljpghmckbmdogodhoikoabmlcfaadabaaaaaajeaiaaaaaeaaaaaa
daaaaaaamiacaaaabeahaaaanmahaaaaebgpgodjjaacaaaajaacaaaaaaacpopp
cmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaacgaaahaaagaaaaaaaaaaacaaaaaaaeaaanaaaaaaaaaa
acaaamaaadaabbaaaaaaaaaaacaabeaaabaabeaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaae
aaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeeka
acaaoekaaeaaaaaeabaaadoaadaaoejaadaaoekaadaaookaaeaaaaaeabaaamoa
adaaeejaaeaaeekaaeaaoekaaeaaaaaeacaaadoaadaaoejaafaaoekaafaaooka
afaaaaadaaaaahiaacaaoejabeaappkaafaaaaadabaaahiaaaaaffiabcaaoeka
aeaaaaaeaaaaaliabbaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabdaaoeka
aaaakkiaaaaapeiaabaaaaacaaaaaiiabfaaaakaajaaaaadabaaabiaagaaoeka
aaaaoeiaajaaaaadabaaaciaahaaoekaaaaaoeiaajaaaaadabaaaeiaaiaaoeka
aaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaajaaoeka
acaaoeiaajaaaaadadaaaciaakaaoekaacaaoeiaajaaaaadadaaaeiaalaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffia
aaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacadaaahoa
aaaaoeiaaeaaaaaeaeaaahoaamaaoekaaaaappiaabaaoeiaafaaaaadaaaaapia
aaaaffjaaoaaoekaaeaaaaaeaaaaapiaanaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaapaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefceeaeaaaaeaaaabaabbabaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaa
adaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaa
aaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaabaaaaaacmaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [unity_LightmapST]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[9], c[9].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 10 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_LightmapST]
Vector 9 [_Control_ST]
Vector 10 [_Splat0_ST]
Vector 11 [_Splat1_ST]
Vector 12 [_Splat2_ST]
Vector 13 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
mad oT0.zw, v2.xyxy, c10.xyxy, c10
mad oT0.xy, v2, c9, c9.zwzw
mad oT1.zw, v2.xyxy, c12.xyxy, c12
mad oT1.xy, v2, c11, c11.zwzw
mad oT2.xy, v2, c13, c13.zwzw
mad oT3.xy, v3, c8, c8.zwzw
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
ConstBuffer "$Globals" 144
Vector 48 [unity_LightmapST]
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedldfhaonnnpkfhhmobnopjebgngdagdojabaaaaaaneadaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdiacaaaaeaaaabaa
ioaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaa
dcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaa
adaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaa
aiaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
adaaaaaakgiocaaaaaaaaaaaadaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 48 [unity_LightmapST]
Vector 64 [_Control_ST]
Vector 80 [_Splat0_ST]
Vector 96 [_Splat1_ST]
Vector 112 [_Splat2_ST]
Vector 128 [_Splat3_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedojdflokjnjkilkfegdbhanookchjhjciabaaaaaadaafaaaaaeaaaaaa
daaaaaaaiiabaaaamiadaaaajaaeaaaaebgpgodjfaabaaaafaabaaaaaaacpopp
baabaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaadaa
agaaabaaaaaaaaaaabaaaaaaaeaaahaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
aeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaadaaeeja
adaaeekaadaaoekaaeaaaaaeabaaadoaadaaoejaaeaaoekaaeaaookaaeaaaaae
abaaamoaadaaeejaafaaeekaafaaoekaaeaaaaaeacaaadoaadaaoejaagaaoeka
agaaookaaeaaaaaeacaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapia
aaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiappppaaaafdeieefcdiacaaaaeaaaabaaioaaaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaafaaaaaakgiocaaaaaaaaaaaafaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaaaaaaaaaaagaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaahaaaaaa
kgiocaaaaaaaaaaaahaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaalmccabaaa
adaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaadaaaaaakgiocaaaaaaaaaaa
adaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
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
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
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
ADD result.texcoord[4].xyz, R3, R2;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R2.w;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R1.w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
END
# 36 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
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
Vector 18 [_Control_ST]
Vector 19 [_Splat0_ST]
Vector 20 [_Splat1_ST]
Vector 21 [_Splat2_ST]
Vector 22 [_Splat3_ST]
"vs_2_0
def c23, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c17.w
dp3 r3.w, r0, c5
dp3 r2.w, r0, c6
dp3 r1.w, r0, c4
mov r1.x, r3.w
mov r1.y, r2.w
mov r1.z, c23.x
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
mul r1.xyz, r0.xyww, c23.y
mul r1.y, r1, c8.x
add oT4.xyz, r3, r2
mad oT5.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT3.z, r2.w
mov oT3.y, r3.w
mov oT3.x, r1.w
mad oT0.zw, v2.xyxy, c19.xyxy, c19
mad oT0.xy, v2, c18, c18.zwzw
mad oT1.zw, v2.xyxy, c21.xyxy, c21
mad oT1.xy, v2, c20, c20.zwzw
mad oT2.xy, v2, c22, c22.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedpfbcmmojomjkofcbfkkeallhamakpkjnabaaaaaaliagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcomaeaaaaeaaaabaadlabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
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
akaabaaaabaaaaaabkaabaiaebaaaaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaacaaaaaacmaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaak
ncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadp
aaaaaadpdgaaaaafmccabaaaagaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaa
agaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefieceddjkpjnhdohcfoefbdgjpkbcpjhggfgmlabaaaaaakmajaaaaaeaaaaaa
daaaaaaacaadaaaabeaiaaaanmaiaaaaebgpgodjoiacaaaaoiacaaaaaaacpopp
hiacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaahaa
afaaabaaaaaaaaaaabaaafaaabaaagaaaaaaaaaaacaacgaaahaaahaaaaaaaaaa
adaaaaaaaeaaaoaaaaaaaaaaadaaamaaadaabcaaaaaaaaaaadaabeaaabaabfaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaaadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaadaaeejaacaaeekaacaaoekaaeaaaaaeabaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaamoaadaaeejaaeaaeekaaeaaoekaaeaaaaaeacaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejabfaappkaafaaaaad
abaaahiaaaaaffiabdaaoekaaeaaaaaeaaaaaliabcaakekaaaaaaaiaabaakeia
aeaaaaaeaaaaahiabeaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabgaaaaka
ajaaaaadabaaabiaahaaoekaaaaaoeiaajaaaaadabaaaciaaiaaoekaaaaaoeia
ajaaaaadabaaaeiaajaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeia
ajaaaaadadaaabiaakaaoekaacaaoeiaajaaaaadadaaaciaalaaoekaacaaoeia
ajaaaaadadaaaeiaamaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeia
afaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaiaaaaaaaia
aaaappibabaaaaacadaaahoaaaaaoeiaaeaaaaaeaeaaahoaanaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaaaaaffjaapaaoekaaeaaaaaeaaaaapiaaoaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiabaaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiabbaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaagaaaaka
afaaaaadabaaaiiaabaaaaiabgaaffkaafaaaaadabaaafiaaaaapeiabgaaffka
acaaaaadafaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeiappppaaaa
fdeieefcomaeaaaaeaaaabaadlabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
dccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
gfaaaaadpccabaaaagaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadiaaaaai
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
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[16] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"vs_2_0
def c16, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.x
mul r1.y, r1, c8.x
mad oT4.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
mad oT0.zw, v2.xyxy, c12.xyxy, c12
mad oT0.xy, v2, c11, c11.zwzw
mad oT1.zw, v2.xyxy, c14.xyxy, c14
mad oT1.xy, v2, c13, c13.zwzw
mad oT2.xy, v2, c15, c15.zwzw
mad oT3.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 112 [unity_LightmapST]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedcidilloagbfjbpkfifgjboaodeophfhcabaaaaaajeaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcoaacaaaaeaaaabaaliaaaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaajaaaaaakgiocaaa
aaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaakgiocaaaaaaaaaaaalaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadcaaaaalmccabaaaadaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaaahaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 112 [unity_LightmapST]
Vector 128 [_Control_ST]
Vector 144 [_Splat0_ST]
Vector 160 [_Splat1_ST]
Vector 176 [_Splat2_ST]
Vector 192 [_Splat3_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedfpgihknopeempickoikaaoaionenoamhabaaaaaagaagaaaaaeaaaaaa
daaaaaaapiabaaaaoaaeaaaakiafaaaaebgpgodjmaabaaaamaabaaaaaaacpopp
heabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaahaa
agaaabaaaaaaaaaaabaaafaaabaaahaaaaaaaaaaacaaaaaaaeaaaiaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafamaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoa
adaaeejaadaaeekaadaaoekaaeaaaaaeabaaadoaadaaoejaaeaaoekaaeaaooka
aeaaaaaeabaaamoaadaaeejaafaaeekaafaaoekaaeaaaaaeacaaadoaadaaoeja
agaaoekaagaaookaaeaaaaaeacaaamoaaeaabejaabaabekaabaalekaafaaaaad
aaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaahaaaakaafaaaaadabaaaiia
abaaaaiaamaaaakaafaaaaadabaaafiaaaaapeiaamaaaakaacaaaaadadaaadoa
abaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacadaaamoaaaaaoeiappppaaaafdeieefcoaacaaaa
eaaaabaaliaaaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaa
abaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaadmccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaajaaaaaakgiocaaaaaaaaaaaajaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaakaaaaaaogikcaaaaaaaaaaaakaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaalaaaaaa
kgiocaaaaaaaaaaaalaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadcaaaaalmccabaaa
adaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaahaaaaaakgiocaaaaaaaaaaa
ahaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaamadaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
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
Vector 25 [_Control_ST]
Vector 26 [_Splat0_ST]
Vector 27 [_Splat1_ST]
Vector 28 [_Splat2_ST]
Vector 29 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[30] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..29] };
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
ADD result.texcoord[4].xyz, R0, R1;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[28].xyxy, c[28];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[27], c[27].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[29], c[29].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 61 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
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
Vector 24 [_Control_ST]
Vector 25 [_Splat0_ST]
Vector 26 [_Splat1_ST]
Vector 27 [_Splat2_ST]
Vector 28 [_Splat3_ST]
"vs_2_0
def c29, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
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
mov r4.w, c29.x
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
add r1, r2, c29.x
dp4 r2.z, r4, c18
dp4 r2.y, r4, c17
dp4 r2.x, r4, c16
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c29.y
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
add oT4.xyz, r0, r1
mov oT3.z, r3.x
mov oT3.y, r3.w
mov oT3.x, r4
mad oT0.zw, v2.xyxy, c25.xyxy, c25
mad oT0.xy, v2, c24, c24.zwzw
mad oT1.zw, v2.xyxy, c27.xyxy, c27
mad oT1.xy, v2, c26, c26.zwzw
mad oT2.xy, v2, c28, c28.zwzw
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
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedbgdfkoaidkmaeloagbkkndmbbkhipmfcabaaaaaaeiajaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcjeahaaaaeaaaabaaofabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaa
egiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
eeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaa
egaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedogckfbblfpklcjiggckldahcgkmkomkdabaaaaaaoianaaaaaeaaaaaa
daaaaaaammaeaaaagiamaaaadaanaaaaebgpgodjjeaeaaaajeaeaaaaaaacpopp
ceaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
afaaabaaaaaaaaaaabaaacaaaiaaagaaaaaaaaaaabaacgaaahaaaoaaaaaaaaaa
acaaaaaaaeaabfaaaaaaaaaaacaaamaaaeaabjaaaaaaaaaaacaabeaaabaabnaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafboaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaae
aaaaamoaadaaeejaacaaeekaacaaoekaaeaaaaaeabaaadoaadaaoejaadaaoeka
adaaookaaeaaaaaeabaaamoaadaaeejaaeaaeekaaeaaoekaaeaaaaaeacaaadoa
adaaoejaafaaoekaafaaookaafaaaaadaaaaahiaaaaaffjabkaaoekaaeaaaaae
aaaaahiabjaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiablaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaappjaaaaaoeiaacaaaaadabaaapia
aaaaffibahaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaadadaaapia
aaaaaaibagaaoekaacaaaaadaaaaapiaaaaakkibaiaaoekaaeaaaaaeacaaapia
adaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeia
ahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeia
acaakkiaahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiaboaaaakaaeaaaaae
acaaapiaacaaoeiaajaaoekaafaaaaiaafaaaaadafaaahiaacaaoejabnaappka
afaaaaadagaaahiaafaaffiabkaaoekaaeaaaaaeafaaaliabjaakekaafaaaaia
agaakeiaaeaaaaaeafaaahiablaaoekaafaakkiaafaapeiaafaaaaadabaaapia
abaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaae
aaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeia
alaaaaadaaaaapiaaaaaoeiaboaaffkaagaaaaacabaaabiaacaaaaiaagaaaaac
abaaaciaacaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiiaacaappia
afaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffiaalaaoeka
aeaaaaaeabaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaamaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeiaabaaaaac
afaaaiiaboaaaakaajaaaaadabaaabiaaoaaoekaafaaoeiaajaaaaadabaaacia
apaaoekaafaaoeiaajaaaaadabaaaeiabaaaoekaafaaoeiaafaaaaadacaaapia
afaacjiaafaakeiaajaaaaadadaaabiabbaaoekaacaaoeiaajaaaaadadaaacia
bcaaoekaacaaoeiaajaaaaadadaaaeiabdaaoekaacaaoeiaacaaaaadabaaahia
abaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiia
afaaaaiaafaaaaiaaaaappibabaaaaacadaaahoaafaaoeiaaeaaaaaeabaaahia
beaaoekaaaaappiaabaaoeiaacaaaaadaeaaahoaaaaaoeiaabaaoeiaafaaaaad
aaaaapiaaaaaffjabgaaoekaaeaaaaaeaaaaapiabfaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiabhaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabiaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefcjeahaaaaeaaaabaaofabaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
agaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaa
abaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaa
abaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaa
abaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaa
aaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaabaaaaaa
cjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaabaaaaaa
ckaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaabaaaaaa
claaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
cmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaa
egiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaa
acaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaa
afaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaaj
pcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaa
eeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaa
egaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaa
egaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
aaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaajaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
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
Vector 26 [_Control_ST]
Vector 27 [_Splat0_ST]
Vector 28 [_Splat1_ST]
Vector 29 [_Splat2_ST]
Vector 30 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[31] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..30] };
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
ADD result.texcoord[4].xyz, R4.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD result.texcoord[5].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[3].z, R3.x;
MOV result.texcoord[3].y, R3.w;
MOV result.texcoord[3].x, R4;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[29].xyxy, c[29];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[28], c[28].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[30], c[30].zwzw;
END
# 67 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
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
Vector 26 [_Control_ST]
Vector 27 [_Splat0_ST]
Vector 28 [_Splat1_ST]
Vector 29 [_Splat2_ST]
Vector 30 [_Splat3_ST]
"vs_2_0
def c31, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
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
mov r4.w, c31.x
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
add r1, r2, c31.x
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.y
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
mul r2.xyz, r0.xyww, c31.z
add oT4.xyz, r4.yzww, r1
mov r1.x, r2
mul r1.y, r2, c8.x
mad oT5.xy, r2.z, c9.zwzw, r1
mov oPos, r0
mov oT5.zw, r0
mov oT3.z, r3.x
mov oT3.y, r3.w
mov oT3.x, r4
mad oT0.zw, v2.xyxy, c27.xyxy, c27
mad oT0.xy, v2, c26, c26.zwzw
mad oT1.zw, v2.xyxy, c29.xyxy, c29
mad oT1.xy, v2, c28, c28.zwzw
mad oT2.xy, v2, c30, c30.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedemglpifheehoaiajblkccomjiggfnjmoabaaaaaaaiakaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcdmaiaaaaeaaaabaaapacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
afaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
kgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
afaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaan
pcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefieceddklmbcidfimfodjlknlbenldcjljcdamabaaaaaaaaapaaaaaeaaaaaa
daaaaaaaceafaaaagianaaaadaaoaaaaebgpgodjomaeaaaaomaeaaaaaaacpopp
haaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaahaa
afaaabaaaaaaaaaaabaaafaaabaaagaaaaaaaaaaacaaacaaaiaaahaaaaaaaaaa
acaacgaaahaaapaaaaaaaaaaadaaaaaaaeaabgaaaaaaaaaaadaaamaaaeaabkaa
aaaaaaaaadaabeaaabaaboaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapka
aaaaiadpaaaaaaaaaaaaaadpaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaaeaaaaaeaaaaamoaadaaeejaacaaeekaacaaoekaaeaaaaae
abaaadoaadaaoejaadaaoekaadaaookaaeaaaaaeabaaamoaadaaeejaaeaaeeka
aeaaoekaaeaaaaaeacaaadoaadaaoejaafaaoekaafaaookaafaaaaadaaaaahia
aaaaffjablaaoekaaeaaaaaeaaaaahiabkaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiabmaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappja
aaaaoeiaacaaaaadabaaapiaaaaaffibaiaaoekaafaaaaadacaaapiaabaaoeia
abaaoeiaacaaaaadadaaapiaaaaaaaibahaaoekaacaaaaadaaaaapiaaaaakkib
ajaaoekaaeaaaaaeacaaapiaadaaoeiaadaaoeiaacaaoeiaaeaaaaaeacaaapia
aaaaoeiaaaaaoeiaacaaoeiaahaaaaacaeaaabiaacaaaaiaahaaaaacaeaaacia
acaaffiaahaaaaacaeaaaeiaacaakkiaahaaaaacaeaaaiiaacaappiaabaaaaac
afaaabiabpaaaakaaeaaaaaeacaaapiaacaaoeiaakaaoekaafaaaaiaafaaaaad
afaaahiaacaaoejaboaappkaafaaaaadagaaahiaafaaffiablaaoekaaeaaaaae
afaaaliabkaakekaafaaaaiaagaakeiaaeaaaaaeafaaahiabmaaoekaafaakkia
afaapeiaafaaaaadabaaapiaabaaoeiaafaaffiaaeaaaaaeabaaapiaadaaoeia
afaaaaiaabaaoeiaaeaaaaaeaaaaapiaaaaaoeiaafaakkiaabaaoeiaafaaaaad
aaaaapiaaeaaoeiaaaaaoeiaalaaaaadaaaaapiaaaaaoeiabpaaffkaagaaaaac
abaaabiaacaaaaiaagaaaaacabaaaciaacaaffiaagaaaaacabaaaeiaacaakkia
agaaaaacabaaaiiaacaappiaafaaaaadaaaaapiaaaaaoeiaabaaoeiaafaaaaad
abaaahiaaaaaffiaamaaoekaaeaaaaaeabaaahiaalaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiaanaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiaaoaaoeka
aaaappiaaaaaoeiaabaaaaacafaaaiiabpaaaakaajaaaaadabaaabiaapaaoeka
afaaoeiaajaaaaadabaaaciabaaaoekaafaaoeiaajaaaaadabaaaeiabbaaoeka
afaaoeiaafaaaaadacaaapiaafaacjiaafaakeiaajaaaaadadaaabiabcaaoeka
acaaoeiaajaaaaadadaaaciabdaaoekaacaaoeiaajaaaaadadaaaeiabeaaoeka
acaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaafaaffia
afaaffiaaeaaaaaeaaaaaiiaafaaaaiaafaaaaiaaaaappibabaaaaacadaaahoa
afaaoeiaaeaaaaaeabaaahiabfaaoekaaaaappiaabaaoeiaacaaaaadaeaaahoa
aaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabhaaoekaaeaaaaaeaaaaapia
bgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabjaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabpaakkkaafaaaaadabaaafiaaaaapeia
bpaakkkaacaaaaadafaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacafaaamoaaaaaoeia
ppppaaaafdeieefcdmaiaaaaeaaaabaaapacaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
ahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaal
dccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaaeaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaabaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
hcaabaaaadaaaaaaegiccaaaadaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
adaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaaaaaaaaajpcaabaaaaeaaaaaa
fgafbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaa
afaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaa
egaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaajpcaabaaaagaaaaaaagaabaia
ebaaaaaaadaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaa
kgakbaiaebaaaaaaadaaaaaaegiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaa
afaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaaj
pcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaaegaobaaaagaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaa
egaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaaegaobaaaadaaaaaadcaaaaan
pcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaadaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaadaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
adaaaaaafgafbaaaabaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaabaaaaaaegacbaaaadaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaabaaaaaa
egacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaahhccabaaaafaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaagaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaagaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaa
laaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaa
lmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
agaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
MUL R2.xyz, R0.y, R2;
MAD R1.xyz, R0.x, R1, R2;
MAD R0.xyz, R0.z, R3, R1;
MAD R0.xyz, R4, R0.w, R0;
MUL R1.xyz, R0, R5;
MUL R0.xyz, R1, fragment.texcoord[4];
MUL R1.xyz, R1, c[1];
DP3 R0.w, fragment.texcoord[3], c[0];
MUL R1.xyz, R0.w, R1;
MAD result.color.xyz, R1, c[2].y, R0;
MOV result.color.w, c[2].x;
END
# 17 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c2, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r4, t0, s1
texld r5, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r1.xy, r0
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r0.xyz, r0, r4
mul_pp r1.xyz, r0, c1
dp3_pp r2.x, t3, c0
mul_pp r1.xyz, r2.x, r1
mul_pp r0.xyz, r0, t4
mov_pp r0.w, c2.y
mad_pp r0.xyz, r1, c2.x, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedmmnmmpeibngegklmabnogdbadblbgfhaabaaaaaahaaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcfaadaaaa
eaaaaaaaneaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaa
aeaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaafgafbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
agaabaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaakgakbaaaadaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaaiicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaaaaaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedbcheifbkibakmhecndbcoddaiflmeeejabaaaaaammagaaaaaeaaaaaa
daaaaaaaiiacaaaaoaafaaaajiagaaaaebgpgodjfaacaaaafaacaaaaaaacpppp
pmabaaaafeaaaaaaacaadmaaaaaafeaaaaaafeaaagaaceaaaaaafeaaaaaaaaaa
abababaaacacacaaadadadaaaeaeaeaaafafafaaaaaaabaaabaaaaaaaaaaaaaa
abaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaaadlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapka
bpaaaaacaaaaaajaafaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaacia
abaapplaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaecaaaaad
aaaacpiaaaaaoeiaaeaioekaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaad
acaacpiaabaaoelaadaioekaecaaaaadadaacpiaaaaaoelaaaaioekaecaaaaad
aeaacpiaacaaoelaafaioekaecaaaaadafaacpiaaaaaoelaabaioekaafaaaaad
acaachiaacaaoeiaadaaffiaaeaaaaaeabaachiaabaaoeiaadaaaaiaacaaoeia
aeaaaaaeaaaachiaaaaaoeiaadaakkiaabaaoeiaaeaaaaaeaaaachiaaeaaoeia
adaappiaaaaaoeiaafaaaaadaaaachiaafaaoeiaaaaaoeiaafaaaaadabaachia
aaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaaeaaoelaaiaaaaadaaaaciia
adaaoelaabaaoekaacaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachia
abaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaciiaacaaaakaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcfaadaaaaeaaaaaaaneaaaaaafjaaaaaeegiocaaa
aaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegiccaaa
abaaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"!!ARBfp1.0
PARAM c[1] = { { 0, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEX R1, fragment.texcoord[3], texture[6], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R3.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R6.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R5.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R4.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
MUL R3.xyz, R0.y, R3;
MAD R2.xyz, R0.x, R2, R3;
MAD R0.xyz, R0.z, R4, R2;
MAD R0.xyz, R5, R0.w, R0;
MUL R0.xyz, R0, R6;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MUL result.color.xyz, R0, c[0].y;
MOV result.color.w, c[0].x;
END
# 16 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c0, 8.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xy
texld r5, t0, s1
texld r1, t2, s5
texld r6, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r3.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r2.xy, r0
texld r4, r3, s2
texld r0, t3, s6
texld r2, r2, s4
texld r3, t1, s3
mul_pp r0.xyz, r0.w, r0
mul_pp r3.xyz, r6.y, r3
mad_pp r3.xyz, r6.x, r4, r3
mad_pp r2.xyz, r6.z, r2, r3
mad_pp r1.xyz, r1, r6.w, r2
mul_pp r1.xyz, r1, r5
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_4_0
eefiecednimidkpldgcggnnnfcdbemjnahkkhigbabaaaaaaceaeaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcbmadaaaaeaaaaaaamhaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaa
adaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [unity_Lightmap] 2D 6
"ps_4_0_level_9_1
eefiecedekigcnfhffgekjgmlaabbkfddjpibcmhabaaaaaafiagaaaaaeaaaaaa
daaaaaaagaacaaaaieafaaaaceagaaaaebgpgodjciacaaaaciacaaaaaaacpppp
oiabaaaaeaaaaaaaaaaaeaaaaaaaeaaaaaaaeaaaahaaceaaaaaaeaaaaaaaaaaa
abababaaacacacaaadadadaaaeaeaeaaafafafaaagagagaaaaacppppfbaaaaaf
aaaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapkabpaaaaacaaaaaajaafaiapka
bpaaaaacaaaaaajaagaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaacia
abaapplaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaabaaaaac
acaaadiaacaabllaecaaaaadaaaacpiaaaaaoeiaaeaioekaecaaaaadabaacpia
abaaoeiaacaioekaecaaaaadadaacpiaabaaoelaadaioekaecaaaaadaeaacpia
aaaaoelaaaaioekaecaaaaadafaacpiaacaaoelaafaioekaecaaaaadagaacpia
aaaaoelaabaioekaecaaaaadacaacpiaacaaoeiaagaioekaafaaaaadadaachia
adaaoeiaaeaaffiaaeaaaaaeabaachiaabaaoeiaaeaaaaiaadaaoeiaaeaaaaae
aaaachiaaaaaoeiaaeaakkiaabaaoeiaaeaaaaaeaaaachiaafaaoeiaaeaappia
aaaaoeiaafaaaaadaaaachiaagaaoeiaaaaaoeiaafaaaaadaaaaciiaacaappia
aaaaaakaafaaaaadabaachiaacaaoeiaaaaappiaafaaaaadaaaachiaaaaaoeia
abaaoeiaabaaaaacaaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcbmadaaaaeaaaaaaamhaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaa
adaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaadaaaaaaeghobaaaagaaaaaaaagabaaaagaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaamamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TXP R6.x, fragment.texcoord[5], texture[6], 2D;
MUL R2.xyz, R0.y, R2;
MAD R1.xyz, R0.x, R1, R2;
MAD R0.xyz, R0.z, R3, R1;
MAD R0.xyz, R4, R0.w, R0;
MUL R1.xyz, R0, R5;
MUL R0.xyz, R1, fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[3], c[0];
MUL R1.xyz, R1, c[1];
MUL R0.w, R0, R6.x;
MUL R1.xyz, R0.w, R1;
MAD result.color.xyz, R1, c[2].y, R0;
MOV result.color.w, c[2].x;
END
# 19 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c2, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texldp r6, t5, s6
texld r4, t0, s1
texld r5, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r1.xy, r0
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r1.xyz, r0, r4
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t3, c0
mul_pp r0.x, r0, r6
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t4
mov_pp r0.w, c2.y
mad_pp r0.xyz, r0, c2.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedgfniimfjdfkaegfbfeejipdedjfdfbnfabaaaaaapaaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcliadaaaaeaaaaaaaooaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaad
aagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaad
dcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gcbaaaadlcbabaaaagaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
efaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaa
adaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
acaaaaaafgafbaaaadaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaa
agaabaaaadaaaaaaegacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
aaaaaaaakgakbaaaadaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaaagaaaaaadcaaaaajhcaabaaa
aaaaaaaaegacbaaaabaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaai
hcaabaaaabaaaaaaegacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaadiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaaafaaaaaaaoaaaaahdcaabaaa
acaaaaaaegbabaaaagaaaaaapgbpbaaaagaaaaaaefaaaaajpcaabaaaacaaaaaa
egaabaaaacaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaabaaaaaaiicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegiccaaaabaaaaaaaaaaaaaaapaaaaahicaabaaa
aaaaaaaapgapbaaaaaaaaaaaagaabaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedendoieanobfhdbfloebcjondlpgcbgcgabaaaaaakeahaaaaaeaaaaaa
daaaaaaaoaacaaaakaagaaaahaahaaaaebgpgodjkiacaaaakiacaaaaaaacpppp
faacaaaafiaaaaaaacaaeaaaaaaafiaaaaaafiaaahaaceaaaaaafiaaagaaaaaa
aaababaaabacacaaacadadaaadaeaeaaaeafafaaafagagaaaaaaabaaabaaaaaa
aaaaaaaaabaaaaaaabaaabaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaaadlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaachlabpaaaaacaaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkabpaaaaacaaaaaajaaeaiapkabpaaaaacaaaaaajaafaiapkabpaaaaac
aaaaaajaagaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaaciaabaappla
abaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaagaaaaacaaaaaeia
afaapplaafaaaaadacaaadiaaaaakkiaafaaoelaecaaaaadaaaacpiaaaaaoeia
afaioekaecaaaaadabaacpiaabaaoeiaadaioekaecaaaaadadaacpiaabaaoela
aeaioekaecaaaaadaeaacpiaaaaaoelaabaioekaecaaaaadafaacpiaacaaoela
agaioekaecaaaaadagaacpiaaaaaoelaacaioekaecaaaaadacaacpiaacaaoeia
aaaioekaafaaaaadacaacoiaadaabliaaeaaffiaaeaaaaaeabaachiaabaaoeia
aeaaaaiaacaabliaaeaaaaaeaaaachiaaaaaoeiaaeaakkiaabaaoeiaaeaaaaae
aaaachiaafaaoeiaaeaappiaaaaaoeiaafaaaaadaaaachiaagaaoeiaaaaaoeia
afaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaaeaaoela
aiaaaaadaaaaciiaadaaoelaabaaoekaafaaaaadaaaaciiaacaaaaiaaaaappia
acaaaaadaaaaciiaaaaappiaaaaappiaaeaaaaaeaaaachiaabaaoeiaaaaappia
aaaaoeiaabaaaaacaaaaciiaacaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcliadaaaaeaaaaaaaooaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadlcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaafaaaaaaaoaaaaahdcaabaaaacaaaaaaegbabaaaagaaaaaapgbpbaaa
agaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaagaaaaaa
aagabaaaaaaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegiccaaa
abaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaaagaabaaa
acaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
SetTexture 7 [unity_Lightmap] 2D 7
"!!ARBfp1.0
PARAM c[1] = { { 0, 8, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R3.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R1, fragment.texcoord[3], texture[7], 2D;
TXP R7.x, fragment.texcoord[4], texture[6], 2D;
TEX R6.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R5.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R4.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R2.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
MUL R3.xyz, R0.y, R3;
MAD R2.xyz, R0.x, R2, R3;
MAD R0.xyz, R0.z, R4, R2;
MUL R2.xyz, R1.w, R1;
MUL R2.xyz, R2, c[0].y;
MUL R1.xyz, R1, R7.x;
MUL R1.xyz, R1, c[0].z;
MAD R0.xyz, R5, R0.w, R0;
MUL R3.xyz, R2, R7.x;
MIN R1.xyz, R2, R1;
MAX R1.xyz, R1, R3;
MUL R0.xyz, R0, R6;
MUL result.color.xyz, R0, R1;
MOV result.color.w, c[0].x;
END
# 22 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_ShadowMapTexture] 2D 6
SetTexture 7 [unity_Lightmap] 2D 7
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c0, 8.00000000, 2.00000000, 0.00000000, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xy
dcl t4
texld r4, t2, s5
texld r7, t0, s1
texld r2, t0, s0
texld r3, t1, s3
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.y, t1.w
mov r1.x, t1.z
texld r5, r1, s4
texld r6, r0, s2
texldp r1, t4, s6
texld r0, t3, s7
mul_pp r8.xyz, r0.w, r0
mul_pp r0.xyz, r0, r1.x
mul_pp r8.xyz, r8, c0.x
mul_pp r0.xyz, r0, c0.y
mul_pp r1.xyz, r8, r1.x
min_pp r0.xyz, r8, r0
max_pp r0.xyz, r0, r1
mul_pp r1.xyz, r2.y, r3
mad_pp r1.xyz, r2.x, r6, r1
mad_pp r1.xyz, r2.z, r5, r1
mad_pp r1.xyz, r4, r2.w, r1
mul_pp r1.xyz, r1, r7
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c0.z
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_ShadowMapTexture] 2D 0
SetTexture 7 [unity_Lightmap] 2D 7
"ps_4_0
eefiecedjoagpieimiekbjpklfdfecnanefacploabaaaaaadaafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaaeaaaa
eaaaaaaaaeabaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaa
adaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaa
adaaaaaaeghobaaaahaaaaaaaagabaaaahaaaaaadiaaaaahocaabaaaabaaaaaa
pgapbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaddaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
deaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_ShadowMapTexture] 2D 0
SetTexture 7 [unity_Lightmap] 2D 7
"ps_4_0_level_9_1
eefiecedgnohfkddafgojndhclhmcmoigcldoohkabaaaaaapmahaaaaaeaaaaaa
daaaaaaapiacaaaabaahaaaamiahaaaaebgpgodjmaacaaaamaacaaaaaaacpppp
hmacaaaaeeaaaaaaaaaaeeaaaaaaeeaaaaaaeeaaaiaaceaaaaaaeeaaagaaaaaa
aaababaaabacacaaacadadaaadaeaeaaaeafafaaafagagaaahahahaaaaacpppp
fbaaaaafaaaaapkaaaaaaaebaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaac
aaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkabpaaaaacaaaaaajaafaiapkabpaaaaacaaaaaajaagaiapkabpaaaaac
aaaaaajaahaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaaciaabaappla
abaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaagaaaaacaaaaaeia
adaapplaafaaaaadacaaadiaaaaakkiaadaaoelaabaaaaacadaaadiaacaablla
ecaaaaadaaaacpiaaaaaoeiaafaioekaecaaaaadabaacpiaabaaoeiaadaioeka
ecaaaaadaeaacpiaabaaoelaaeaioekaecaaaaadafaacpiaaaaaoelaabaioeka
ecaaaaadagaacpiaacaaoelaagaioekaecaaaaadahaacpiaaaaaoelaacaioeka
ecaaaaadacaacpiaacaaoeiaaaaioekaecaaaaadadaacpiaadaaoeiaahaioeka
afaaaaadacaacoiaaeaabliaafaaffiaaeaaaaaeabaachiaabaaoeiaafaaaaia
acaabliaaeaaaaaeaaaachiaaaaaoeiaafaakkiaabaaoeiaaeaaaaaeaaaachia
agaaoeiaafaappiaaaaaoeiaafaaaaadaaaachiaahaaoeiaaaaaoeiaacaaaaad
aaaaciiaacaaaaiaacaaaaiaafaaaaadabaachiaadaaoeiaaaaappiaafaaaaad
aaaaciiaadaappiaaaaaaakaafaaaaadacaacoiaadaabliaaaaappiaakaaaaad
adaachiaabaaoeiaacaabliaafaaaaadabaachiaacaaaaiaacaabliaalaaaaad
acaachiaadaaoeiaabaaoeiaafaaaaadaaaachiaaaaaoeiaacaaoeiaabaaaaac
aaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbaaeaaaa
eaaaaaaaaeabaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaad
aagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaa
afaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaafibiaaaeaahabaaa
ahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaaadaaaaaagcbaaaadlcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
aeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaa
adaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaaeaaaaaapgbpbaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaa
akaabaaaabaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaa
adaaaaaaeghobaaaahaaaaaaaagabaaaahaaaaaadiaaaaahocaabaaaabaaaaaa
pgapbaaaaaaaaaaaagajbaaaacaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
acaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaa
pgapbaaaaaaaaaaaddaaaaahocaabaaaabaaaaaafgaobaaaabaaaaaaagajbaaa
acaaaaaadiaaaaahhcaabaaaacaaaaaaagaabaaaabaaaaaaegacbaaaacaaaaaa
deaaaaahhcaabaaaabaaaaaajgahbaaaabaaaaaaegacbaaaacaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="Opaque" "SplatCount"="4" }
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
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT5.z, r0, c10
dp4 oT5.y, r0, c9
dp4 oT5.x, r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c12
mad oT0.zw, v2.xyxy, c15.xyxy, c15
mad oT0.xy, v2, c14, c14.zwzw
mad oT1.zw, v2.xyxy, c17.xyxy, c17
mad oT1.xy, v2, c16, c16.zwzw
mad oT2.xy, v2, c18, c18.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedfbofgjgpknhdkjdpbcieggopompmegdgabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedgjmcjpbfhgjkncehhefnodkodhoafmmnabaaaaaaceajaaaaaeaaaaaa
daaaaaaaneacaaaaimahaaaafeaiaaaaebgpgodjjmacaaaajmacaaaaaaacpopp
diacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
ajaaabaaaaaaaaaaabaaaaaaabaaakaaaaaaaaaaacaaaaaaaeaaalaaaaaaaaaa
acaaamaaaeaaapaaaaaaaaaaacaabeaaabaabdaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoa
adaaeejaagaaeekaagaaoekaaeaaaaaeabaaadoaadaaoejaahaaoekaahaaooka
aeaaaaaeabaaamoaadaaeejaaiaaeekaaiaaoekaaeaaaaaeacaaadoaadaaoeja
ajaaoekaajaaookaafaaaaadaaaaahiaacaaoejabdaappkaafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
adaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjabaaaoeka
aeaaaaaeaaaaahiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappjaaaaaoeiaacaaaaad
aeaaahoaaaaaoeibakaaoekaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaae
aaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefclaaeaaaaeaaaabaa
cmabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaa
aaaaaaaaaiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_Control_ST]
Vector 12 [_Splat0_ST]
Vector 13 [_Splat1_ST]
Vector 14 [_Splat2_ST]
Vector 15 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[10].w;
DP3 result.texcoord[3].z, R0, c[7];
DP3 result.texcoord[3].y, R0, c[6];
DP3 result.texcoord[3].x, R0, c[5];
MOV result.texcoord[4].xyz, c[9];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[12].xyxy, c[12];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[14].xyxy, c[14];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 14 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
Vector 9 [unity_Scale]
Vector 10 [_Control_ST]
Vector 11 [_Splat0_ST]
Vector 12 [_Splat1_ST]
Vector 13 [_Splat2_ST]
Vector 14 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c9.w
dp3 oT3.z, r0, c6
dp3 oT3.y, r0, c5
dp3 oT3.x, r0, c4
mov oT4.xyz, c8
mad oT0.zw, v2.xyxy, c11.xyxy, c11
mad oT0.xy, v2, c10, c10.zwzw
mad oT1.zw, v2.xyxy, c13.xyxy, c13
mad oT1.xy, v2, c12, c12.zwzw
mad oT2.xy, v2, c14, c14.zwzw
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
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedneeajnpeknaaklelmkplnleoimlefbihabaaaaaaieaeaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefcnaacaaaaeaaaabaaleaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 128
Vector 48 [_Control_ST]
Vector 64 [_Splat0_ST]
Vector 80 [_Splat1_ST]
Vector 96 [_Splat2_ST]
Vector 112 [_Splat3_ST]
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
eefiecedgjigbeoiieffbencoofahdechalcbcndabaaaaaaeeagaaaaaeaaaaaa
daaaaaaaomabaaaameaeaaaaimafaaaaebgpgodjleabaaaaleabaaaaaaacpopp
faabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
acaaamaaadaaalaaaaaaaaaaacaabeaaabaaaoaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaaeaaaaaeaaaaamoa
adaaeejaacaaeekaacaaoekaaeaaaaaeabaaadoaadaaoejaadaaoekaadaaooka
aeaaaaaeabaaamoaadaaeejaaeaaeekaaeaaoekaaeaaaaaeacaaadoaadaaoeja
afaaoekaafaaookaafaaaaadaaaaahiaacaaoejaaoaappkaafaaaaadabaaahia
aaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaiaabaakeiaaeaaaaae
adaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaiaaoeka
aeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aeaaahoaagaaoekappppaaaafdeieefcnaacaaaaeaaaabaaleaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaa
aaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadcaaaaaldccabaaaacaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaagaaaaaa
kgiocaaaaaaaaaaaagaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].w, R0, c[12];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT5.w, r0, c11
dp4 oT5.z, r0, c10
dp4 oT5.y, r0, c9
dp4 oT5.x, r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c12
mad oT0.zw, v2.xyxy, c15.xyxy, c15
mad oT0.xy, v2, c14, c14.zwzw
mad oT1.zw, v2.xyxy, c17.xyxy, c17
mad oT1.xy, v2, c16, c16.zwzw
mad oT2.xy, v2, c18, c18.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedbnkaobfggoihlmenikjoagfpicdcieobabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadpccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaagaaaaaaegiocaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedibkkfbapofgacpjmladeodgaflmclomaabaaaaaaceajaaaaaeaaaaaa
daaaaaaaneacaaaaimahaaaafeaiaaaaebgpgodjjmacaaaajmacaaaaaaacpopp
diacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
ajaaabaaaaaaaaaaabaaaaaaabaaakaaaaaaaaaaacaaaaaaaeaaalaaaaaaaaaa
acaaamaaaeaaapaaaaaaaaaaacaabeaaabaabdaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoa
adaaeejaagaaeekaagaaoekaaeaaaaaeabaaadoaadaaoejaahaaoekaahaaooka
aeaaaaaeabaaamoaadaaeejaaiaaeekaaiaaoekaaeaaaaaeacaaadoaadaaoeja
ajaaoekaajaaookaafaaaaadaaaaahiaacaaoejabdaappkaafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
adaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjabaaaoeka
aeaaaaaeaaaaahiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappjaaaaaoeiaacaaaaad
aeaaahoaaaaaoeibakaaoekaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaae
aaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaapia
aaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaapoaaeaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefclaaeaaaaeaaaabaa
cmabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadpccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaa
aaaaaaaaaiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaagaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[5].z, R0, c[11];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
ADD result.texcoord[4].xyz, -R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT5.z, r0, c10
dp4 oT5.y, r0, c9
dp4 oT5.x, r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
add oT4.xyz, -r0, c12
mad oT0.zw, v2.xyxy, c15.xyxy, c15
mad oT0.xy, v2, c14, c14.zwzw
mad oT1.zw, v2.xyxy, c17.xyxy, c17
mad oT1.xy, v2, c16, c16.zwzw
mad oT2.xy, v2, c18, c18.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedfbofgjgpknhdkjdpbcieggopompmegdgabaaaaaahmagaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagfaaaaadhccabaaaagaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaalaaaaaaogikcaaaaaaaaaaaalaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajhccabaaaafaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaa
abaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaa
kgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaagaaaaaaegiccaaa
aaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedgjmcjpbfhgjkncehhefnodkodhoafmmnabaaaaaaceajaaaaaeaaaaaa
daaaaaaaneacaaaaimahaaaafeaiaaaaebgpgodjjmacaaaajmacaaaaaaacpopp
diacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
ajaaabaaaaaaaaaaabaaaaaaabaaakaaaaaaaaaaacaaaaaaaeaaalaaaaaaaaaa
acaaamaaaeaaapaaaaaaaaaaacaabeaaabaabdaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoa
adaaeejaagaaeekaagaaoekaaeaaaaaeabaaadoaadaaoejaahaaoekaahaaooka
aeaaaaaeabaaamoaadaaeejaaiaaeekaaiaaoekaaeaaaaaeacaaadoaadaaoeja
ajaaoekaajaaookaafaaaaadaaaaahiaacaaoejabdaappkaafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
adaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahiaaaaaffjabaaaoeka
aeaaaaaeaaaaahiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappjaaaaaoeiaacaaaaad
aeaaahoaaaaaoeibakaaoekaafaaaaadaaaaapiaaaaaffjabaaaoekaaeaaaaae
aaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeafaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaaoaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaafdeieefclaaeaaaaeaaaabaa
cmabaaaafjaaaaaeegiocaaaaaaaaaaaamaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaaddccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagfaaaaadhccabaaaagaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaahaaaaaaogikcaaaaaaaaaaaahaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaiaaaaaakgiocaaa
aaaaaaaaaiaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaajaaaaaaogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaacaaaaaa
agbebaaaadaaaaaaagiecaaaaaaaaaaaakaaaaaakgiocaaaaaaaaaaaakaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaafaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaagaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaalmaaaaaaafaaaaaaaaaaaaaa
adaaaaaaagaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Control_ST]
Vector 16 [_Splat0_ST]
Vector 17 [_Splat1_ST]
Vector 18 [_Splat2_ST]
Vector 19 [_Splat3_ST]
"!!ARBvp1.0
PARAM c[20] = { program.local[0],
		state.matrix.mvp,
		program.local[5..19] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[5].y, R0, c[10];
DP4 result.texcoord[5].x, R0, c[9];
DP3 result.texcoord[3].z, R1, c[7];
DP3 result.texcoord[3].y, R1, c[6];
DP3 result.texcoord[3].x, R1, c[5];
MOV result.texcoord[4].xyz, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[16].xyxy, c[16];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[19], c[19].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_Control_ST]
Vector 15 [_Splat0_ST]
Vector 16 [_Splat1_ST]
Vector 17 [_Splat2_ST]
Vector 18 [_Splat3_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c13.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT5.y, r0, c9
dp4 oT5.x, r0, c8
dp3 oT3.z, r1, c6
dp3 oT3.y, r1, c5
dp3 oT3.x, r1, c4
mov oT4.xyz, c12
mad oT0.zw, v2.xyxy, c15.xyxy, c15
mad oT0.xy, v2, c14, c14.zwzw
mad oT1.zw, v2.xyxy, c17.xyxy, c17
mad oT1.xy, v2, c16, c16.zwzw
mad oT2.xy, v2, c18, c18.zwzw
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefiecedenkgcnjnhjnplildmhiibhheemldjndpabaaaaaaniafaaaaadaaaaaa
cmaaaaaapeaaaaaameabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheomiaaaaaaahaaaaaa
aiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaalmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaaamadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefcamaeaaaaeaaaabaaadabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
adaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
Vector 112 [_Control_ST]
Vector 128 [_Splat0_ST]
Vector 144 [_Splat1_ST]
Vector 160 [_Splat2_ST]
Vector 176 [_Splat3_ST]
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
eefieceddkfhjickpdfgjppfmfhinpieoodlgognabaaaaaadaaiaaaaaeaaaaaa
daaaaaaaieacaaaajiagaaaagaahaaaaebgpgodjemacaaaaemacaaaaaaacpopp
oiabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaadaa
ajaaabaaaaaaaaaaabaaaaaaabaaakaaaaaaaaaaacaaaaaaaeaaalaaaaaaaaaa
acaaamaaaeaaapaaaaaaaaaaacaabeaaabaabdaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjaaeaaaaaeaaaaadoaadaaoejaafaaoekaafaaookaaeaaaaaeaaaaamoa
adaaeejaagaaeekaagaaoekaaeaaaaaeabaaadoaadaaoejaahaaoekaahaaooka
aeaaaaaeabaaamoaadaaeejaaiaaeekaaiaaoekaaeaaaaaeacaaadoaadaaoeja
ajaaoekaajaaookaafaaaaadaaaaahiaacaaoejabdaappkaafaaaaadabaaahia
aaaaffiabaaaoekaaeaaaaaeaaaaaliaapaakekaaaaaaaiaabaakeiaaeaaaaae
adaaahoabbaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjabaaaoeka
aeaaaaaeaaaaapiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabbaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiabcaaoekaaaaappjaaaaaoeiaafaaaaad
abaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobkaaaaaaaiaabaaoeia
aeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaaeacaaamoaaeaabeka
aaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffjaamaaoekaaeaaaaaeaaaaapia
alaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaahoaakaaoeka
ppppaaaafdeieefcamaeaaaaeaaaabaaadabaaaafjaaaaaeegiocaaaaaaaaaaa
amaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
mccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaahaaaaaa
ogikcaaaaaaaaaaaahaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaadaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadcaaaaaldccabaaa
acaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaacaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaa
akaaaaaakgiocaaaaaaaaaaaakaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
adaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaadaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaalaaaaaa
ogikcaaaaaaaaaaaalaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaag
hccabaaaafaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaadamaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaa
adaaaaaaamadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
MUL R2.xyz, R0.y, R2;
MAD R1.xyz, R0.x, R1, R2;
MAD R0.xyz, R0.z, R3, R1;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MAD R0.xyz, R4, R0.w, R0;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.w, R1.x;
MUL R1.xyz, R0, R5;
MUL R0.xyz, R0.w, fragment.texcoord[4];
DP3 R0.x, fragment.texcoord[3], R0;
MUL R1.xyz, R1, c[0];
MOV result.color.w, c[1].x;
TEX R1.w, R1.w, texture[6], 2D;
MUL R0.x, R0, R1.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[1].y;
END
# 22 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r4, t0, s1
texld r5, t0, s0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mov r1.y, t0.w
mov r1.x, t0.z
mov r2.xy, r1
mov r1.y, t1.w
mov r1.x, t1.z
texld r6, r0, s6
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r1.xyz, r0, r5.w, r1
dp3_pp r0.x, t4, t4
mul_pp r1.xyz, r1, r4
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t4
dp3_pp r0.x, t3, r0
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r6
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbedfgpnajolifdcelgccbginfpejccbeabaaaaaaaeafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmmadaaaaeaaaaaaapdaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaa
abaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
pgapbaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeebbmffgfkajgfcnonjnncgfodlnffnlabaaaaaakeahaaaaaeaaaaaa
daaaaaaammacaaaakaagaaaahaahaaaaebgpgodjjeacaaaajeacaaaaaaacpppp
eiacaaaaemaaaaaaabaaeaaaaaaaemaaaaaaemaaahaaceaaaaaaemaaagaaaaaa
aaababaaabacacaaacadadaaadaeaeaaaeafafaaafagagaaaaaaabaaabaaaaaa
aaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaadlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaaiaafaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaaja
aeaiapkabpaaaaacaaaaaajaafaiapkabpaaaaacaaaaaajaagaiapkaabaaaaac
aaaaabiaabaakklaabaaaaacaaaaaciaabaapplaabaaaaacabaaabiaaaaakkla
abaaaaacabaaaciaaaaapplaaiaaaaadacaaaiiaafaaoelaafaaoelaabaaaaac
acaaadiaacaappiaecaaaaadaaaacpiaaaaaoeiaafaioekaecaaaaadabaacpia
abaaoeiaadaioekaecaaaaadadaacpiaabaaoelaaeaioekaecaaaaadaeaacpia
aaaaoelaabaioekaecaaaaadafaacpiaacaaoelaagaioekaecaaaaadagaacpia
aaaaoelaacaioekaecaaaaadacaacpiaacaaoeiaaaaioekaafaaaaadacaacoia
adaabliaaeaaffiaaeaaaaaeabaachiaabaaoeiaaeaaaaiaacaabliaaeaaaaae
aaaachiaaaaaoeiaaeaakkiaabaaoeiaaeaaaaaeaaaachiaafaaoeiaaeaappia
aaaaoeiaafaaaaadaaaachiaagaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeia
aaaaoekaceaaaaacabaachiaaeaaoelaaiaaaaadaaaaciiaadaaoelaabaaoeia
afaaaaadaaaaciiaacaaaaiaaaaappiaacaaaaadaaaaciiaaaaappiaaaaappia
afaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciiaabaaaakaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcmmadaaaaeaaaaaaapdaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaaagaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
fibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
agaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaadaaaaaa
egacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaa
abaaaaaapgapbaaaaaaaaaaaegbcbaaaafaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
agaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaagaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
lmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
lmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
MUL R2.xyz, R0.y, R2;
MAD R1.xyz, R0.x, R1, R2;
MAD R0.xyz, R0.z, R3, R1;
MAD R0.xyz, R4, R0.w, R0;
MUL R0.xyz, R0, R5;
MOV R1.xyz, fragment.texcoord[4];
MUL R0.xyz, R0, c[0];
DP3 R0.w, fragment.texcoord[3], R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 17 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
texld r4, t0, s1
texld r5, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r1.xy, r0
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r0.xyz, r0, r4
mov_pp r1.xyz, t4
mul_pp r0.xyz, r0, c0
dp3_pp r1.x, t3, r1
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhkjckapinkpljchndjjbfpglhefcmpjnabaaaaaadiaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbiadaaaa
eaaaaaaamgaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
fibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaa
gcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaafaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaafaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
ConstBuffer "$Globals" 128
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfcebfaboeiajlhjmejejaiampcgdmfbdabaaaaaaiaagaaaaaeaaaaaa
daaaaaaaheacaaaajeafaaaaemagaaaaebgpgodjdmacaaaadmacaaaaaaacpppp
peabaaaaeiaaaaaaabaadmaaaaaaeiaaaaaaeiaaagaaceaaaaaaeiaaaaaaaaaa
abababaaacacacaaadadadaaaeaeaeaaafafafaaaaaaabaaabaaaaaaaaaaaaaa
aaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaadla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapkabpaaaaacaaaaaajaafaiapka
abaaaaacaaaaabiaabaakklaabaaaaacaaaaaciaabaapplaabaaaaacabaaabia
aaaakklaabaaaaacabaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaeaioeka
ecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadacaacpiaabaaoelaadaioeka
ecaaaaadadaacpiaaaaaoelaaaaioekaecaaaaadaeaacpiaacaaoelaafaioeka
ecaaaaadafaacpiaaaaaoelaabaioekaafaaaaadacaachiaacaaoeiaadaaffia
aeaaaaaeabaachiaabaaoeiaadaaaaiaacaaoeiaaeaaaaaeaaaachiaaaaaoeia
adaakkiaabaaoeiaaeaaaaaeaaaachiaaeaaoeiaadaappiaaaaaoeiaafaaaaad
aaaachiaafaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaabaaaaac
abaaahiaadaaoelaaiaaaaadaaaaciiaabaaoeiaaeaaoelaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciia
abaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbiadaaaaeaaaaaaa
mgaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
afaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaadaaaaaa
egacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
afaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
diaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
SetTexture 7 [_LightTextureB0] 2D 7
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
RCP R0.x, fragment.texcoord[5].w;
MAD R6.xy, fragment.texcoord[5], R0.x, c[1].y;
DP3 R1.w, fragment.texcoord[5], fragment.texcoord[5];
MUL R1.xyz, R2.y, R1;
MOV result.color.w, c[1].x;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TEX R0.w, R6, texture[6], 2D;
TEX R1.w, R1.w, texture[7], 2D;
MAD R0.xyz, R2.x, R0, R1;
MAD R0.xyz, R2.z, R3, R0;
MAD R0.xyz, R4, R2.w, R0;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.xyz, R0, R5;
RSQ R1.x, R1.x;
SLT R2.x, c[1], fragment.texcoord[5].z;
MUL R0.w, R2.x, R0;
MUL R1.w, R0, R1;
MUL R1.xyz, R1.x, fragment.texcoord[4];
DP3 R0.w, fragment.texcoord[3], R1;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 28 instructions, 7 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
SetTexture 7 [_LightTextureB0] 2D 7
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5
texld r4, t0, s1
texld r5, t0, s0
dp3 r3.x, t5, t5
mov r3.xy, r3.x
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r1.xy, r0
rcp r0.x, t5.w
mad r0.xy, t5, r0.x, c1.x
texld r6, r3, s7
texld r7, r0, s6
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r0.xyz, r0, r4
mul_pp r2.xyz, r0, c0
dp3_pp r1.x, t4, t4
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t4
cmp r0.x, -t5.z, c1.y, c1.z
mul_pp r0.x, r0, r7.w
mul_pp r0.x, r0, r6
dp3_pp r1.x, t3, r1
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.w
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Splat0] 2D 4
SetTexture 3 [_Splat1] 2D 5
SetTexture 4 [_Splat2] 2D 6
SetTexture 5 [_Splat3] 2D 7
SetTexture 6 [_LightTexture0] 2D 0
SetTexture 7 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefieceddiiifjddhabpjnkllfkkkcdnponhhehaabaaaaaapiafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcmaaeaaaaeaaaaaaadaabaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaagaaaaaa
pgbpbaaaagaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaa
abeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaahaaaaaa
aagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagbjbaaaafaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaajgahbaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaadaaaaaafgafbaaaaeaaaaaadcaaaaajocaabaaaaaaaaaaa
agajbaaaacaaaaaaagaabaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaakgakbaaaaeaaaaaafgaobaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaa
dcaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaapgapbaaaaeaaaaaafgaobaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Splat0] 2D 4
SetTexture 3 [_Splat1] 2D 5
SetTexture 4 [_Splat2] 2D 6
SetTexture 5 [_Splat3] 2D 7
SetTexture 6 [_LightTexture0] 2D 0
SetTexture 7 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedceebflbmbjhkkdoicliakhcmnppoiiioabaaaaaapmaiaaaaaeaaaaaa
daaaaaaadaadaaaapiahaaaamiaiaaaaebgpgodjpiacaaaapiacaaaaaaacpppp
kiacaaaafaaaaaaaabaaeeaaaaaafaaaaaaafaaaaiaaceaaaaaafaaaagaaaaaa
ahababaaaaacacaaabadadaaacaeaeaaadafafaaaeagagaaafahahaaaaaaabaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaadlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaac
aaaaaajaaeaiapkabpaaaaacaaaaaajaafaiapkabpaaaaacaaaaaajaagaiapka
bpaaaaacaaaaaajaahaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaacia
abaapplaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaagaaaaac
aaaaaeiaafaapplaaeaaaaaeacaaadiaafaaoelaaaaakkiaabaaaakaaiaaaaad
adaaaiiaafaaoelaafaaoelaabaaaaacadaaadiaadaappiaecaaaaadaaaacpia
aaaaoeiaagaioekaecaaaaadabaacpiaabaaoeiaaeaioekaecaaaaadaeaacpia
abaaoelaafaioekaecaaaaadafaacpiaaaaaoelaacaioekaecaaaaadagaacpia
acaaoelaahaioekaecaaaaadahaacpiaaaaaoelaadaioekaecaaaaadacaacpia
acaaoeiaaaaioekaecaaaaadadaacpiaadaaoeiaabaioekaafaaaaadacaachia
aeaaoeiaafaaffiaaeaaaaaeabaachiaabaaoeiaafaaaaiaacaaoeiaaeaaaaae
aaaachiaaaaaoeiaafaakkiaabaaoeiaaeaaaaaeaaaachiaagaaoeiaafaappia
aaaaoeiaafaaaaadaaaachiaahaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeia
aaaaoekaafaaaaadaaaaciiaacaappiaadaaaaiafiaaaaaeaaaaciiaafaakklb
abaaffkaaaaappiaceaaaaacabaachiaaeaaoelaaiaaaaadabaacbiaadaaoela
abaaoeiaafaaaaadaaaaciiaaaaappiaabaaaaiaacaaaaadaaaaciiaaaaappia
aaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaabaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcmaaeaaaaeaaaaaaadaabaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fibiaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadpcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacafaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaagaaaaaa
pgbpbaaaagaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaagaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaa
abeaaaaaaaaaaaaackbabaaaagaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaahaaaaaa
aagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
abaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
eeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaa
fgafbaaaaaaaaaaaagbjbaaaafaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
aeaaaaaajgahbaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaa
aeaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaa
acaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaaeaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaadaaaaaafgafbaaaaeaaaaaadcaaaaajocaabaaaaaaaaaaa
agajbaaaacaaaaaaagaabaaaaeaaaaaafgaobaaaaaaaaaaadcaaaaajocaabaaa
aaaaaaaaagajbaaaabaaaaaakgakbaaaaeaaaaaafgaobaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaaahaaaaaa
dcaaaaajocaabaaaaaaaaaaaagajbaaaabaaaaaapgapbaaaaeaaaaaafgaobaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagajbaaa
abaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaa
ahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
lmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaadadaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
lmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaa
aaaaaaaaadaaaaaaagaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
SetTexture 7 [_LightTexture0] CUBE 7
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R0.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TEX R1.w, fragment.texcoord[5], texture[7], CUBE;
MUL R1.xyz, R2.y, R1;
MAD R0.xyz, R2.x, R0, R1;
DP3 R0.w, fragment.texcoord[5], fragment.texcoord[5];
MAD R0.xyz, R2.z, R3, R0;
MAD R0.xyz, R4, R2.w, R0;
DP3 R1.x, fragment.texcoord[4], fragment.texcoord[4];
MUL R0.xyz, R0, R5;
RSQ R1.x, R1.x;
MUL R0.xyz, R0, c[0];
MUL R1.xyz, R1.x, fragment.texcoord[4];
MOV result.color.w, c[1].x;
TEX R0.w, R0.w, texture[6], 2D;
MUL R1.w, R0, R1;
DP3 R0.w, fragment.texcoord[3], R1;
MUL R0.w, R0, R1;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 24 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTextureB0] 2D 6
SetTexture 7 [_LightTexture0] CUBE 7
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_cube s7
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xyz
texld r6, t5, s7
texld r4, t0, s1
texld r5, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
dp3 r0.x, t5, t5
mov r0.xy, r0.x
mov r1.y, t1.w
mov r1.x, t1.z
texld r7, r0, s6
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r0.xyz, r0, r4
mul_pp r2.xyz, r0, c0
dp3_pp r0.x, t4, t4
rsq_pp r0.x, r0.x
mul_pp r1.xyz, r0.x, t4
mul r0.x, r7, r6.w
dp3_pp r1.x, t3, r1
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Splat0] 2D 4
SetTexture 3 [_Splat1] 2D 5
SetTexture 4 [_Splat2] 2D 6
SetTexture 5 [_Splat3] 2D 7
SetTexture 6 [_LightTextureB0] 2D 1
SetTexture 7 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedhnhocmnfooffcdaojplebcieffkkekjcabaaaaaagaafaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcciaeaaaaeaaaaaaaakabaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafkaaaaadaagabaaaahaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
fibiaaaeaahabaaaafaaaaaaffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaa
fidaaaaeaahabaaaahaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaaagaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaaacaaaaaa
eghobaaaaeaaaaaaaagabaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaa
adaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaajhcaabaaa
abaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaadcaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaaaagabaaa
ahaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaadaaaaaa
egacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaagaaaaaaegbcbaaa
agaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaaaaaaaaaaeghobaaaagaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaagaaaaaaeghobaaa
ahaaaaaaaagabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaa
dkaabaaaacaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahhcaabaaa
abaaaaaaagaabaaaabaaaaaaegbcbaaaafaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaaeaaaaaaegacbaaaabaaaaaaapaaaaahicaabaaaaaaaaaaaagaabaaa
abaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_Control] 2D 2
SetTexture 1 [_Occlusion] 2D 3
SetTexture 2 [_Splat0] 2D 4
SetTexture 3 [_Splat1] 2D 5
SetTexture 4 [_Splat2] 2D 6
SetTexture 5 [_Splat3] 2D 7
SetTexture 6 [_LightTextureB0] 2D 1
SetTexture 7 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkoecjddafddfdemfhpljidinibkkafkjabaaaaaadaaiaaaaaeaaaaaa
daaaaaaapmacaaaacmahaaaapmahaaaaebgpgodjmeacaaaameacaaaaaaacpppp
heacaaaafaaaaaaaabaaeeaaaaaafaaaaaaafaaaaiaaceaaaaaafaaaahaaaaaa
agababaaaaacacaaabadadaaacaeaeaaadafafaaaeagagaaafahahaaaaaaabaa
abaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaadlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachla
bpaaaaacaaaaaaiaafaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkabpaaaaac
aaaaaajaaeaiapkabpaaaaacaaaaaajaafaiapkabpaaaaacaaaaaajaagaiapka
bpaaaaacaaaaaajaahaiapkaabaaaaacaaaaabiaabaakklaabaaaaacaaaaacia
abaapplaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaapplaaiaaaaad
acaaaiiaafaaoelaafaaoelaabaaaaacacaaadiaacaappiaecaaaaadaaaacpia
aaaaoeiaagaioekaecaaaaadabaacpiaabaaoeiaaeaioekaecaaaaadadaacpia
abaaoelaafaioekaecaaaaadaeaacpiaaaaaoelaacaioekaecaaaaadafaacpia
acaaoelaahaioekaecaaaaadagaacpiaaaaaoelaadaioekaecaaaaadacaaapia
acaaoeiaabaioekaecaaaaadahaaapiaafaaoelaaaaioekaafaaaaadacaacoia
adaabliaaeaaffiaaeaaaaaeabaachiaabaaoeiaaeaaaaiaacaabliaaeaaaaae
aaaachiaaaaaoeiaaeaakkiaabaaoeiaaeaaaaaeaaaachiaafaaoeiaaeaappia
aaaaoeiaafaaaaadaaaachiaagaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeia
aaaaoekaafaaaaadaaaaciiaacaaaaiaahaappiaceaaaaacabaachiaaeaaoela
aiaaaaadabaacbiaadaaoelaabaaoeiaafaaaaadaaaaciiaaaaappiaabaaaaia
acaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeia
abaaaaacaaaaciiaabaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
ciaeaaaaeaaaaaaaakabaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaa
afaaaaaafkaaaaadaagabaaaagaaaaaafkaaaaadaagabaaaahaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaae
aahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaafibiaaae
aahabaaaagaaaaaaffffaaaafidaaaaeaahabaaaahaaaaaaffffaaaagcbaaaad
pcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaa
gcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagcbaaaadhcbabaaa
agaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaa
aaaaaaaaogbkbaaaacaaaaaaeghobaaaaeaaaaaaaagabaaaagaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaeaaaaaa
efaaaaajpcaabaaaacaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaa
afaaaaaaefaaaaajpcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaa
adaaaaaadcaaaaajhcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaa
egacbaaaacaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaa
adaaaaaaegacbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaa
eghobaaaafaaaaaaaagabaaaahaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaa
abaaaaaapgapbaaaadaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadiaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaa
egbcbaaaagaaaaaaegbcbaaaagaaaaaaefaaaaajpcaabaaaabaaaaaapgapbaaa
aaaaaaaaeghobaaaagaaaaaaaagabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbcbaaaagaaaaaaeghobaaaahaaaaaaaagabaaaaaaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaabaaaaaahbcaabaaaabaaaaaa
egbcbaaaafaaaaaaegbcbaaaafaaaaaaeeaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaaabaaaaaaegbcbaaaafaaaaaa
baaaaaahbcaabaaaabaaaaaaegbcbaaaaeaaaaaaegacbaaaabaaaaaaapaaaaah
icaabaaaaaaaaaaaagaabaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaa
aaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
abeaaaaaaaaaaaaadoaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaagaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R2.xyz, fragment.texcoord[1], texture[3], 2D;
TEX R5.xyz, fragment.texcoord[0], texture[1], 2D;
TEX R4.xyz, fragment.texcoord[2], texture[5], 2D;
TEX R3.xyz, fragment.texcoord[1].zwzw, texture[4], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[2], 2D;
TEX R1.w, fragment.texcoord[5], texture[6], 2D;
MUL R2.xyz, R0.y, R2;
MAD R1.xyz, R0.x, R1, R2;
MAD R0.xyz, R0.z, R3, R1;
MAD R0.xyz, R4, R0.w, R0;
MUL R1.xyz, R0, R5;
MOV R0.xyz, fragment.texcoord[4];
DP3 R0.x, fragment.texcoord[3], R0;
MUL R1.xyz, R1, c[0];
MUL R0.x, R0, R1.w;
MUL R0.xyz, R0.x, R1;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, c[1].x;
END
# 19 instructions, 6 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_Control] 2D 0
SetTexture 1 [_Occlusion] 2D 1
SetTexture 2 [_Splat0] 2D 2
SetTexture 3 [_Splat1] 2D 3
SetTexture 4 [_Splat2] 2D 4
SetTexture 5 [_Splat3] 2D 5
SetTexture 6 [_LightTexture0] 2D 6
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c1, 2.00000000, 0.00000000, 0, 0
dcl t0
dcl t1
dcl t2.xy
dcl t3.xyz
dcl t4.xyz
dcl t5.xy
texld r6, t5, s6
texld r4, t0, s1
texld r5, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
mov r2.xy, r0
mov r0.y, t1.w
mov r0.x, t1.z
mov r1.xy, r0
texld r3, r2, s2
texld r0, t2, s5
texld r1, r1, s4
texld r2, t1, s3
mul_pp r2.xyz, r5.y, r2
mad_pp r2.xyz, r5.x, r3, r2
mad_pp r1.xyz, r5.z, r1, r2
mad_pp r0.xyz, r0, r5.w, r1
mul_pp r0.xyz, r0, r4
mul_pp r1.xyz, r0, c0
mov_pp r0.xyz, t4
dp3_pp r0.x, t3, r0
mul_pp r0.x, r0, r6.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.x
mov_pp r0.w, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedpmjoipcndhnackcfgajolgcbhdbpffhkabaaaaaajmaeaaaaadaaaaaa
cmaaaaaapmaaaaaadaabaaaaejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaalmaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaadadaaaalmaaaaaa
afaaaaaaaaaaaaaaadaaaaaaadaaaaaaamamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcgeadaaaaeaaaaaaanjaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaa
eghobaaaagaaaaaaaagabaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaafaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
pgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_Control] 2D 1
SetTexture 1 [_Occlusion] 2D 2
SetTexture 2 [_Splat0] 2D 3
SetTexture 3 [_Splat1] 2D 4
SetTexture 4 [_Splat2] 2D 5
SetTexture 5 [_Splat3] 2D 6
SetTexture 6 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 192
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedbohjlhlcmhkipmdgooameibpafagcbgpabaaaaaacaahaaaaaeaaaaaa
daaaaaaalaacaaaabmagaaaaomagaaaaebgpgodjhiacaaaahiacaaaaaaacpppp
cmacaaaaemaaaaaaabaaeaaaaaaaemaaaaaaemaaahaaceaaaaaaemaaagaaaaaa
aaababaaabacacaaacadadaaadaeaeaaaeafafaaafagagaaaaaaabaaabaaaaaa
aaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajaadaiapkabpaaaaacaaaaaajaaeaiapkabpaaaaacaaaaaaja
afaiapkabpaaaaacaaaaaajaagaiapkaabaaaaacaaaaabiaabaakklaabaaaaac
aaaaaciaabaapplaabaaaaacabaaabiaaaaakklaabaaaaacabaaaciaaaaappla
abaaaaacacaaadiaacaabllaecaaaaadaaaacpiaaaaaoeiaafaioekaecaaaaad
abaacpiaabaaoeiaadaioekaecaaaaadadaacpiaabaaoelaaeaioekaecaaaaad
aeaacpiaaaaaoelaabaioekaecaaaaadafaacpiaacaaoelaagaioekaecaaaaad
agaacpiaaaaaoelaacaioekaecaaaaadacaacpiaacaaoeiaaaaioekaafaaaaad
acaachiaadaaoeiaaeaaffiaaeaaaaaeabaachiaabaaoeiaaeaaaaiaacaaoeia
aeaaaaaeaaaachiaaaaaoeiaaeaakkiaabaaoeiaaeaaaaaeaaaachiaafaaoeia
aeaappiaaaaaoeiaafaaaaadaaaachiaagaaoeiaaaaaoeiaafaaaaadaaaachia
aaaaoeiaaaaaoekaabaaaaacabaaahiaadaaoelaaiaaaaadaaaaciiaabaaoeia
aeaaoelaafaaaaadaaaaciiaacaappiaaaaappiaacaaaaadaaaaciiaaaaappia
aaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaciiaabaaaaka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgeadaaaaeaaaaaaanjaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fkaaaaadaagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafkaaaaadaagabaaa
agaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaafibiaaaeaahabaaaafaaaaaa
ffffaaaafibiaaaeaahabaaaagaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaaddcbabaaaadaaaaaagcbaaaadmcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacaeaaaaaaefaaaaajpcaabaaaaaaaaaaaogbkbaaa
acaaaaaaeghobaaaaeaaaaaaaagabaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaacaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaaefaaaaaj
pcaabaaaadaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaafgafbaaaadaaaaaadcaaaaaj
hcaabaaaabaaaaaaegacbaaaabaaaaaaagaabaaaadaaaaaaegacbaaaacaaaaaa
dcaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaakgakbaaaadaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaadaaaaaaeghobaaaafaaaaaa
aagabaaaagaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaa
adaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaadaaaaaa
eghobaaaagaaaaaaaagabaaaaaaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
aeaaaaaaegbcbaaaafaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
pgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
miaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaalmaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaalmaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaadadaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaadaaaaaa
amamaaaalmaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaalmaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
}
Fallback "Diffuse"
}