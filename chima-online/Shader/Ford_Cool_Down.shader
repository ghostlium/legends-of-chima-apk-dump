//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Effects/Cool Down" {
Properties {
 _WarningColor ("Warning Color", Color) = (1,1,1,1)
 _WarningColorValue ("Warning Color Value", Float) = 0
 _CoolDownBarColor1 ("Cool Down Bar Color1", Color) = (1,1,1,1)
 _CoolDownBarColor2 ("Cool Down Bar Color2", Color) = (1,1,1,1)
 _MainTex ("Base texture", 2D) = "white" {}
 _MasterOpacity ("Master Opacity", Float) = 1
 _OpacityUvMaskValue ("Opacity Mask Value", Float) = 0
 _EmissiveMul ("Emissive Multiplier", Float) = 1
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_SHAr]
Vector 15 [unity_SHAg]
Vector 16 [unity_SHAb]
Vector 17 [unity_SHBr]
Vector 18 [unity_SHBg]
Vector 19 [unity_SHBb]
Vector 20 [unity_SHC]
Vector 21 [unity_Scale]
"!!ARBvp1.0
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[21].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[16];
DP4 R2.y, R0, c[15];
DP4 R2.x, R0, c[14];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[19];
DP4 R3.y, R1, c[18];
DP4 R3.x, R1, c[17];
MOV R1.xyz, vertex.attrib[14];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[20];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[3].xyz, R3, R2;
MOV R1, c[13];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_SHAr]
Vector 14 [unity_SHAg]
Vector 15 [unity_SHAb]
Vector 16 [unity_SHBr]
Vector 17 [unity_SHBg]
Vector 18 [unity_SHBb]
Vector 19 [unity_SHC]
Vector 20 [unity_Scale]
"vs_2_0
def c21, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c20.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c21.x
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c18
dp4 r3.y, r1, c17
dp4 r3.x, r1, c16
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c19
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mul r2.xyz, r1, v1.w
mov r0, c9
mov r1, c8
dp4 r3.y, c12, r0
dp4 r3.x, c12, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedpgdcapnjpbbhjkkdkhipnobeikfchanlabaaaaaajeajaaaaaeaaaaaa
daaaaaaafaadaaaacmaiaaaapeaiaaaaebgpgodjbiadaaaabiadaaaaaaacpopp
leacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaaaa
abaaabaaaaaaaaaaaaaacgaaahaaacaaaaaaaaaaabaaaaaaaeaaajaaaaaaaaaa
abaaamaaadaaanaaaaaaaaaaabaabaaaafaabaaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbfaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaabaaoeka
afaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeabaaahiabaaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
bdaaoekaaaaappiaaaaaoeiaaiaaaaadabaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
abaaacoaabaaoeiaaaaaoeiaaiaaaaadabaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaahiaacaaoejabeaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaapaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabfaaaakaajaaaaadabaaabiaacaaoekaaaaaoeia
ajaaaaadabaaaciaadaaoekaaaaaoeiaajaaaaadabaaaeiaaeaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaafaaoekaacaaoeia
ajaaaaadadaaaciaagaaoekaacaaoeiaajaaaaadadaaaeiaahaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffia
aeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeacaaahoaaiaaoeka
aaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapia
ajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoeja
abaaaaacaaaaamoaaeaabejappppaaaafdeieefcneaeaaaaeaaaabaadfabaaaa
fjaaaaaeegiocaaaaaaaaaaacnaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaac
aeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaa
abaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaa
agiacaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaabaaaaaabcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaabaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaabaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaa
aaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaaaaaaaaacgaaaaaaegaobaaa
aaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaaaaaaaaachaaaaaaegaobaaa
aaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaaaaaaaaaciaaaaaaegaobaaa
aaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaa
bbaaaaaibcaabaaaadaaaaaaegiocaaaaaaaaaaacjaaaaaaegaobaaaacaaaaaa
bbaaaaaiccaabaaaadaaaaaaegiocaaaaaaaaaaackaaaaaaegaobaaaacaaaaaa
bbaaaaaiecaabaaaadaaaaaaegiocaaaaaaaaaaaclaaaaaaegaobaaaacaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaaaaaaaaacmaaaaaaagaabaaaaaaaaaaa
egacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 14 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, vertex.texcoord[1], c[14], c[14].zwzw;
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
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_LightmapST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, v4, c12, c12.zwzw
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
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedigfcdehloncgiphkgffnjcfnainekjogabaaaaaaamaeaaaaaeaaaaaa
daaaaaaadmabaaaalmacaaaaieadaaaaebgpgodjaeabaaaaaeabaaaaaaacpopp
meaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaaiaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
aeaaaaaeabaaadoaaeaaoejaabaaoekaabaaookaafaaaaadaaaaapiaaaaaffja
adaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
hiabaaaaeaaaabaafoaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 14 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[15] = { program.local[0],
		state.matrix.mvp,
		program.local[5..14] };
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, vertex.texcoord[1], c[14], c[14].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 7 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_LightmapST]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, v4, c12, c12.zwzw
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
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 144
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedigfcdehloncgiphkgffnjcfnainekjogabaaaaaaamaeaaaaaeaaaaaa
daaaaaaadmabaaaalmacaaaaieadaaaaebgpgodjaeabaaaaaeabaaaaaaacpopp
meaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaaiaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
aeaaaaaeabaaadoaaeaaoejaabaaoekaabaaookaafaaaaadaaaaapiaaaaaffja
adaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
aeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefc
hiabaaaaeaaaabaafoaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"!!ARBvp1.0
PARAM c[23] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
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
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[20];
DP4 R3.y, R1, c[19];
DP4 R3.x, R1, c[18];
MOV R1.xyz, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
ADD R3.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R2.xyz, R0.x, c[21];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1, c[14];
ADD result.texcoord[3].xyz, R3, R2;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 40 instructions, 4 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [unity_Scale]
"vs_2_0
def c23, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r1.xyz, v2, c22.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c23.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
mad r0.x, r0, r0, -r0.y
mul r1.xyz, r0.x, c21
add r2.xyz, r2, r3
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c14, r0
mov r0, c9
dp4 r3.y, c14, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c14, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c23.y
mul r1.y, r1, c12.x
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjaokhpmcahobhhbendfcafhfmkieagbaabaaaaaakmakaaaaaeaaaaaa
daaaaaaakiadaaaacmajaaaapeajaaaaebgpgodjhaadaaaahaadaaaaaaacpopp
aaadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaacgaaahaaadaaaaaaaaaa
acaaaaaaaeaaakaaaaaaaaaaacaaamaaadaaaoaaaaaaaaaaacaabaaaafaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbgaaapkaaaaaiadpaaaaaadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
abaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffiabcaaoekaaeaaaaae
abaaahiabbaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabdaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabeaaoekaaaaappiaaaaaoeiaaiaaaaadabaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaadabaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaacaaoejabfaappkaafaaaaadabaaahia
aaaaffiaapaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaae
aaaaahiabaaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiiabgaaaakaajaaaaad
abaaabiaadaaoekaaaaaoeiaajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaad
abaaaeiaafaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaad
adaaabiaagaaoekaacaaoeiaajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaad
adaaaeiaaiaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaad
aaaaaciaaaaaffiaaaaaffiaaeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffib
aeaaaaaeacaaahoaajaaoekaaaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffja
alaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
amaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeia
afaaaaadabaaabiaaaaaffiaabaaaakaafaaaaadabaaaiiaabaaaaiabgaaffka
afaaaaadabaaafiaaaaapeiabgaaffkaacaaaaadadaaadoaabaakkiaabaaomia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacadaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefchmafaaaaeaaaabaafpabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaa
aaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaa
acaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaal
hcaabaaaacaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaa
pgipcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaaacaaaaaa
egacbaaaabaaaaaaegacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaa
abaaaaaaegacbaaaacaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaaficaabaaa
abaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaa
cgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaa
chaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaa
ciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaa
egakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaa
egaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaa
egaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaa
egaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaa
aeaaaaaadiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaa
dcaaaaakbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaabkaabaia
ebaaaaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaacmaaaaaa
agaabaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaa
aeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 15 [unity_LightmapST]
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
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_LightmapST]
"vs_2_0
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.x
mul r1.y, r1, c12.x
mad oT3.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, v4, c14, c14.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 192 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgfdcoeclhlcgoahaobaemeaniikmamhnabaaaaaadmafaaaaaeaaaaaa
daaaaaaakmabaaaaneadaaaajmaeaaaaebgpgodjheabaaaaheabaaaaaaacpopp
ciabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaamaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafahaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeabaaadoaaeaaoejaabaaoekaabaaookaafaaaaadaaaaapia
aaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaia
ahaaaakaafaaaaadabaaafiaaaaapeiaahaaaakaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 15 [unity_LightmapST]
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
MUL R1.y, R1, c[13].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[3].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_LightmapST]
"vs_2_0
def c15, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.x
mul r1.y, r1, c12.x
mad oT3.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT3.zw, r0
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, v4, c14, c14.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 208
Vector 192 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgfdcoeclhlcgoahaobaemeaniikmamhnabaaaaaadmafaaaaaeaaaaaa
daaaaaaakmabaaaaneadaaaajmaeaaaaebgpgodjheabaaaaheabaaaaaaacpopp
ciabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaamaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafahaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeabaaadoaaeaaoejaabaaoekaabaaookaafaaaaadaaaaapia
aaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiiaabaaaaia
ahaaaakaafaaaaadabaaafiaaaaapeiaahaaaakaacaaaaadacaaadoaabaakkia
abaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacacaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadcaaaaaldccabaaaacaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaadaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_WorldSpaceLightPos0]
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
"!!ARBvp1.0
PARAM c[30] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..29] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[29].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[15];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[14];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[16];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[17];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[19];
MAD R1.xyz, R0.x, c[18], R1;
MAD R0.xyz, R0.z, c[20], R1;
MAD R1.xyz, R0.w, c[21], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[27];
DP4 R3.y, R0, c[26];
DP4 R3.x, R0, c[25];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[24];
DP4 R2.y, R4, c[23];
DP4 R2.x, R4, c[22];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[28];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[13];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R1;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 66 instructions, 5 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_WorldSpaceLightPos0]
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
"vs_2_0
def c29, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c28.w
dp4 r0.x, v0, c5
add r1, -r0.x, c14
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c13
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c29.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c15
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c16
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c29.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c29.y
mul r0, r0, r1
mul r1.xyz, r0.y, c18
mad r1.xyz, r0.x, c17, r1
mad r0.xyz, r0.z, c19, r1
mad r1.xyz, r0.w, c20, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c26
dp4 r3.y, r0, c25
dp4 r3.x, r0, c24
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c27
dp4 r2.z, r4, c23
dp4 r2.y, r4, c22
dp4 r2.x, r4, c21
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c12, r0
mul r2.xyz, r1, v1.w
mov r1, c9
mov r0, c8
dp4 r3.y, c12, r1
dp4 r3.x, c12, r0
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedaeclibemjgifdmkmdjojdphbaipkiaieabaaaaaanmaoaaaaaeaaaaaa
daaaaaaaeiafaaaaheanaaaadmaoaaaaebgpgodjbaafaaaabaafaaaaaaacpopp
kmaeaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaaaa
abaaabaaaaaaaaaaaaaaacaaaiaaacaaaaaaaaaaaaaacgaaahaaakaaaaaaaaaa
abaaaaaaaeaabbaaaaaaaaaaabaaamaaajaabfaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafboaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaabaaoeka
afaaaaadabaaahiaaaaaffiabkaaoekaaeaaaaaeabaaahiabjaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiablaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
bmaaoekaaaaappiaaaaaoeiaaiaaaaadabaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
abaaacoaabaaoeiaaaaaoeiaaiaaaaadabaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaahiaaaaaffjabgaaoekaaeaaaaaeaaaaahiabfaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiabhaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiabiaaoeka
aaaappjaaaaaoeiaacaaaaadabaaapiaaaaakkibaeaaoekaacaaaaadacaaapia
aaaaaaibacaaoekaacaaaaadaaaaapiaaaaaffibadaaoekaafaaaaadadaaahia
acaaoejabnaappkaafaaaaadaeaaahiaadaaffiabgaaoekaaeaaaaaeadaaalia
bfaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahiabhaaoekaadaakkiaadaapeia
afaaaaadaeaaapiaaaaaoeiaadaaffiaafaaaaadaaaaapiaaaaaoeiaaaaaoeia
aeaaaaaeaaaaapiaacaaoeiaacaaoeiaaaaaoeiaaeaaaaaeacaaapiaacaaoeia
adaaaaiaaeaaoeiaaeaaaaaeacaaapiaabaaoeiaadaakkiaacaaoeiaaeaaaaae
aaaaapiaabaaoeiaabaaoeiaaaaaoeiaahaaaaacabaaabiaaaaaaaiaahaaaaac
abaaaciaaaaaffiaahaaaaacabaaaeiaaaaakkiaahaaaaacabaaaiiaaaaappia
abaaaaacaeaaabiaboaaaakaaeaaaaaeaaaaapiaaaaaoeiaafaaoekaaeaaaaia
afaaaaadabaaapiaabaaoeiaacaaoeiaalaaaaadabaaapiaabaaoeiaboaaffka
agaaaaacacaaabiaaaaaaaiaagaaaaacacaaaciaaaaaffiaagaaaaacacaaaeia
aaaakkiaagaaaaacacaaaiiaaaaappiaafaaaaadaaaaapiaabaaoeiaacaaoeia
afaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaaeabaaahiaagaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
ajaaoekaaaaappiaaaaaoeiaabaaaaacadaaaiiaboaaaakaajaaaaadabaaabia
akaaoekaadaaoeiaajaaaaadabaaaciaalaaoekaadaaoeiaajaaaaadabaaaeia
amaaoekaadaaoeiaafaaaaadacaaapiaadaacjiaadaakeiaajaaaaadaeaaabia
anaaoekaacaaoeiaajaaaaadaeaaaciaaoaaoekaacaaoeiaajaaaaadaeaaaeia
apaaoekaacaaoeiaacaaaaadabaaahiaabaaoeiaaeaaoeiaafaaaaadaaaaaiia
adaaffiaadaaffiaaeaaaaaeaaaaaiiaadaaaaiaadaaaaiaaaaappibaeaaaaae
abaaahiabaaaoekaaaaappiaabaaoeiaacaaaaadacaaahoaaaaaoeiaabaaoeia
afaaaaadaaaaapiaaaaaffjabcaaoekaaeaaaaaeaaaaapiabbaaoekaaaaaaaja
aaaaoeiaaeaaaaaeaaaaapiabdaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapia
beaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcceaiaaaaeaaaabaaajacaaaafjaaaaaeegiocaaa
aaaaaaaacnaaaaaafjaaaaaeegiocaaaabaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacagaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaa
pgipcaaaabaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaa
egiccaaaabaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaaabaaaaaa
amaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaabaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaabbaaaaai
bcaabaaaabaaaaaaegiocaaaaaaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaaaaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaaaaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaaaaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaaaaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaaaaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaabaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
abaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaaaaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaaaaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaaaaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaaaaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaadaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
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
"!!ARBvp1.0
PARAM c[31] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..30] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[30].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[16];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[15];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[17];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[18];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[20];
MAD R1.xyz, R0.x, c[19], R1;
MAD R0.xyz, R0.z, c[21], R1;
MAD R1.xyz, R0.w, c[22], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[28];
DP4 R3.y, R0, c[27];
DP4 R3.x, R0, c[26];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[25];
DP4 R2.y, R4, c[24];
DP4 R2.x, R4, c[23];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[29];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[3].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0, c[14];
DP4 R2.z, R0, c[11];
DP4 R2.y, R0, c[10];
DP4 R2.x, R0, c[9];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 result.texcoord[2].y, R2, R1;
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 71 instructions, 5 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
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
"vs_2_0
def c31, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mul r3.xyz, v2, c30.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c31.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c31.x
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
add r2.xyz, r2, r3
add r2.xyz, r2, r0
mov r0.xyz, v1
add oT3.xyz, r2, r1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c10
dp4 r3.z, c14, r0
mov r0, c8
dp4 r3.x, c14, r0
mul r2.xyz, r1, v1.w
mov r1, c9
dp4 r3.y, c14, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c31.z
mul r1.y, r1, c12.x
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
mad oT4.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov oT4.zw, r0
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
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefieceddfhfeaokgemlkilbplgammecgjpbfbjfabaaaaaapeapaaaaaeaaaaaa
daaaaaaakaafaaaaheaoaaaadmapaaaaebgpgodjgiafaaaagiafaaaaaaacpopp
piaeaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaabaaacaaaiaaadaaaaaaaaaa
abaacgaaahaaalaaaaaaaaaaacaaaaaaaeaabcaaaaaaaaaaacaaamaaajaabgaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbpaaapkaaaaaiadpaaaaaaaaaaaaaadp
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
abaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffiablaaoekaaeaaaaae
abaaahiabkaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiabmaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiabnaaoekaaaaappiaaaaaoeiaaiaaaaadabaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaadabaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaahiaaaaaffjabhaaoekaaeaaaaaeaaaaahia
bgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaakkib
afaaoekaacaaaaadacaaapiaaaaaaaibadaaoekaacaaaaadaaaaapiaaaaaffib
aeaaoekaafaaaaadadaaahiaacaaoejaboaappkaafaaaaadaeaaahiaadaaffia
bhaaoekaaeaaaaaeadaaaliabgaakekaadaaaaiaaeaakeiaaeaaaaaeadaaahia
biaaoekaadaakkiaadaapeiaafaaaaadaeaaapiaaaaaoeiaadaaffiaafaaaaad
aaaaapiaaaaaoeiaaaaaoeiaaeaaaaaeaaaaapiaacaaoeiaacaaoeiaaaaaoeia
aeaaaaaeacaaapiaacaaoeiaadaaaaiaaeaaoeiaaeaaaaaeacaaapiaabaaoeia
adaakkiaacaaoeiaaeaaaaaeaaaaapiaabaaoeiaabaaoeiaaaaaoeiaahaaaaac
abaaabiaaaaaaaiaahaaaaacabaaaciaaaaaffiaahaaaaacabaaaeiaaaaakkia
ahaaaaacabaaaiiaaaaappiaabaaaaacaeaaabiabpaaaakaaeaaaaaeaaaaapia
aaaaoeiaagaaoekaaeaaaaiaafaaaaadabaaapiaabaaoeiaacaaoeiaalaaaaad
abaaapiaabaaoeiabpaaffkaagaaaaacacaaabiaaaaaaaiaagaaaaacacaaacia
aaaaffiaagaaaaacacaaaeiaaaaakkiaagaaaaacacaaaiiaaaaappiaafaaaaad
aaaaapiaabaaoeiaacaaoeiaafaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaae
abaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaacadaaaiia
bpaaaakaajaaaaadabaaabiaalaaoekaadaaoeiaajaaaaadabaaaciaamaaoeka
adaaoeiaajaaaaadabaaaeiaanaaoekaadaaoeiaafaaaaadacaaapiaadaacjia
adaakeiaajaaaaadaeaaabiaaoaaoekaacaaoeiaajaaaaadaeaaaciaapaaoeka
acaaoeiaajaaaaadaeaaaeiabaaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
aeaaoeiaafaaaaadaaaaaiiaadaaffiaadaaffiaaeaaaaaeaaaaaiiaadaaaaia
adaaaaiaaaaappibaeaaaaaeabaaahiabbaaoekaaaaappiaabaaoeiaacaaaaad
acaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaae
aaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaafaaaaadabaaabia
aaaaffiaabaaaakaafaaaaadabaaaiiaabaaaaiabpaakkkaafaaaaadabaaafia
aaaapeiabpaakkkaacaaaaadadaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacadaaamoa
aaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaa
fdeieefcmmaiaaaaeaaaabaaddacaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagiaaaaacahaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaaihcaabaaaacaaaaaa
egbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaadaaaaaa
fgafbaaaacaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaacaaaaaa
egiicaaaacaaaaaaamaaaaaaagaabaaaacaaaaaaegaibaaaadaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaaacaaaaaaegadbaaa
acaaaaaabbaaaaaibcaabaaaacaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaa
abaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaa
abaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaa
abaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaa
bbaaaaaibcaabaaaaeaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaadaaaaaa
bbaaaaaiccaabaaaaeaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaadaaaaaa
bbaaaaaiecaabaaaaeaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaadaaaaaa
aaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaah
icaabaaaabaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaaabaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaabaaaaaa
egacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgbfbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaa
adaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaadaaaaaa
aaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaa
adaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaa
diaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaaaaaaaaaj
pcaabaaaagaaaaaaagaabaiaebaaaaaaadaaaaaaegiocaaaabaaaaaaacaaaaaa
aaaaaaajpcaabaaaadaaaaaakgakbaiaebaaaaaaadaaaaaaegiocaaaabaaaaaa
aeaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaaadaaaaaakgakbaaa
abaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaagaaaaaa
egaobaaaagaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaaaeaaaaaa
egaobaaaadaaaaaadcaaaaanpcaabaaaadaaaaaaegaobaaaadaaaaaaegiocaaa
abaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaak
pcaabaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaa
adaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaaaeaaaaaa
deaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaadaaaaaaegaobaaa
abaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaabaaaaaaegiccaaaabaaaaaa
ahaaaaaadcaaaaakhcaabaaaadaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaa
abaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaabaaaaaa
aiaaaaaakgakbaaaabaaaaaaegacbaaaadaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaabaaaaaaajaaaaaapgapbaaaabaaaaaaegacbaaaabaaaaaaaaaaaaah
hccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaa
abaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadp
dgaaaaafmccabaaaaeaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaaeaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 128
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedffmoemihnjdebeaohgfnhkcgiigfojojabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedopfifaiohgmnbmbajhhjjpiijnmjgejdabaaaaaaimaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaafiaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedopfifaiohgmnbmbajhhjjpiijnmjgejdabaaaaaaimaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaafiaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 192
Vector 112 [_WarningColor]
Float 128 [_WarningColorValue]
Vector 144 [_CoolDownBarColor1]
Vector 160 [_CoolDownBarColor2]
Float 176 [_OpacityUvMaskValue]
Float 180 [_MasterOpacity]
Float 184 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeidildmgjmbfmjpheaekmijccpdgdmlnabaaaaaalmaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaaiiaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaahaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaalaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
alaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaajaaaaaaagijcaia
ebaaaaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaaegiccaaaaaaaaaaa
ahaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 208
Vector 112 [_WarningColor]
Float 128 [_WarningColorValue]
Vector 144 [_CoolDownBarColor1]
Vector 160 [_CoolDownBarColor2]
Float 176 [_OpacityUvMaskValue]
Float 180 [_MasterOpacity]
Float 184 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlnabdmblmibhobjhcneghdembdfpengfabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaahaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaalaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
alaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaajaaaaaaagijcaia
ebaaaaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaaegiccaaaaaaaaaaa
ahaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 208
Vector 112 [_WarningColor]
Float 128 [_WarningColorValue]
Vector 144 [_CoolDownBarColor1]
Vector 160 [_CoolDownBarColor2]
Float 176 [_OpacityUvMaskValue]
Float 180 [_MasterOpacity]
Float 184 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedlnabdmblmibhobjhcneghdembdfpengfabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaahaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaamaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaalaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
alaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaajaaaaaaagijcaia
ebaaaaaaaaaaaaaaakaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaakaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaalaaaaaaegiccaaaaaaaaaaa
ahaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaiaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaadaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Fog { Mode Off }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"!!ARBvp1.0
PARAM c[19] = { program.local[0],
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 3 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
"vs_2_0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedmohblhefkmgbnofiddogklednhacimpgabaaaaaaheaiaaaaaeaaaaaa
daaaaaaammacaaaaamahaaaaneahaaaaebgpgodjjeacaaaajeacaaaaaaacpopp
dmacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaamaaajaaakaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaafaaoekaafaaaaad
abaaahiaaaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabcaappkaaaaaoejbaiaaaaad
abaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahia
abaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaad
abaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeacaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcdiaeaaaaeaaaabaaaoabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_World2Object]
Vector 9 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[10] = { program.local[0],
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[9];
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 3 R-regs
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
Matrix 4 [_World2Object]
Vector 8 [_WorldSpaceLightPos0]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c6
dp4 r3.z, c8, r0
mul r2.xyz, r1, v1.w
mov r0, c5
mov r1, c4
dp4 r3.y, c8, r0
dp4 r3.x, c8, r1
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
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
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 256 [_World2Object]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedehjojpgcofjlplhmfkdincmhbfgjhhfmabaaaaaacmagaaaaaeaaaaaa
daaaaaaabeacaaaanmaeaaaakeafaaaaebgpgodjnmabaaaanmabaaaaaaacpopp
jaabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaaaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaabaaaaeaaagaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaabaaaaacaaaaapiaabaaoekaafaaaaadabaaahiaaaaaffiaahaaoeka
aeaaaaaeabaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaaiaaoeka
aaaakkiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappiaaaaaoeiaaiaaaaad
abaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahia
abaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaad
abaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaadaaoekaaeaaaaae
aaaaapiaacaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoa
adaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcmaacaaaaeaaaabaa
laaaaaaafjaaaaaeegiocaaaaaaaaaaaabaaaaaafjaaaaaeegiocaaaabaaaaaa
beaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaheaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"!!ARBvp1.0
PARAM c[19] = { program.local[0],
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 26 instructions, 3 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
"vs_2_0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp4 r0.w, v0, c7
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.w, r0, c15
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbiihdlbhjfgpgblhjmjcljojdmnknfmeabaaaaaaheaiaaaaaeaaaaaa
daaaaaaammacaaaaamahaaaaneahaaaaebgpgodjjeacaaaajeacaaaaaaacpopp
dmacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaamaaajaaakaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaafaaoekaafaaaaad
abaaahiaaaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabcaappkaaaaaoejbaiaaaaad
abaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahia
abaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaad
abaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaapia
aaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
abaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeacaaapoaaeaaoekaaaaappia
abaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcdiaeaaaaeaaaabaaaoabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
pccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaadaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
Vector 18 [unity_Scale]
"!!ARBvp1.0
PARAM c[19] = { program.local[0],
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[17];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[18].w, -vertex.position;
MUL R1.xyz, R1, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R0, R1;
DP3 result.texcoord[2].z, vertex.normal, R0;
DP3 result.texcoord[2].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 3 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
Vector 17 [unity_Scale]
"vs_2_0
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
mul r2.xyz, r1, v1.w
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mov r1, c8
dp4 r3.x, c16, r1
mad r0.xyz, r3, c17.w, -v0
dp3 oT2.y, r0, r2
dp3 oT2.z, v2, r0
dp3 oT2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT3.z, r0, c14
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedmohblhefkmgbnofiddogklednhacimpgabaaaaaaheaiaaaaaeaaaaaa
daaaaaaammacaaaaamahaaaaneahaaaaebgpgodjjeacaaaajeacaaaaaaacpopp
dmacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaamaaajaaakaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaafaaoekaafaaaaad
abaaahiaaaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaappiaaaaaoeiaaeaaaaaeaaaaahiaaaaaoeiabcaappkaaaaaoejbaiaaaaad
abaaaboaabaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahia
abaamjiaacaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaad
abaaahiaabaaoeiaabaappjaaiaaaaadabaaacoaabaaoeiaaaaaoeiaaiaaaaad
abaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaae
aaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaafaaaaadabaaahia
aaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaiaabaaoeiaaeaaaaae
aaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeacaaahoaaeaaoekaaaaappia
aaaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoekaaeaaaaaeaaaaapiaagaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefcdiaeaaaaeaaaabaaaoabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaa
abaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadhccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaa
abaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaa
cgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaajhcaabaaaabaaaaaafgifcaaa
abaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaaabaaaaaa
egiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegacbaaaabaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaa
aaaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 17 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[18] = { program.local[0],
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[17];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
DP3 result.texcoord[2].y, R2, R0;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 23 instructions, 3 R-regs
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
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 16 [_WorldSpaceLightPos0]
"vs_2_0
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
dp4 r3.z, c16, r0
mov r0, c9
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c8
dp4 r3.x, c16, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 oT2.y, r3, r2
dp3 oT2.z, v2, r3
dp3 oT2.x, r3, v1
dp4 oT3.y, r0, c13
dp4 oT3.x, r0, c12
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
ConstBuffer "$Globals" 192
Matrix 48 [_LightMatrix0]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Matrix 256 [_World2Object]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedcnfhpncpmfllejfepkbjeakldlcmdameabaaaaaadeaiaaaaaeaaaaaa
daaaaaaaliacaaaammagaaaajeahaaaaebgpgodjiaacaaaaiaacaaaaaaacpopp
ciacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaadaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
acaaamaaaiaaakaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaaeiaaeaaapjaabaaaaacaaaaapiaafaaoekaafaaaaad
abaaahiaaaaaffiaapaaoekaaeaaaaaeabaaahiaaoaaoekaaaaaaaiaabaaoeia
aeaaaaaeaaaaahiabaaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahiabbaaoeka
aaaappiaaaaaoeiaaiaaaaadabaaaboaabaaoejaaaaaoeiaabaaaaacabaaahia
abaaoejaafaaaaadacaaahiaabaamjiaacaancjaaeaaaaaeabaaahiaacaamjja
abaanciaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaadabaaacoa
abaaoeiaaaaaoeiaaiaaaaadabaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapia
aaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappja
aaaaoeiaafaaaaadabaaadiaaaaaffiaacaaoekaaeaaaaaeaaaaadiaabaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaoekaaaaakkiaaaaaoeiaaeaaaaae
acaaadoaaeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaahaaoeka
aeaaaaaeaaaaapiaagaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaaiaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcamaeaaaa
eaaaabaaadabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabeaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaa
egbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaaacaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaacaaaaaa
bcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaacaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaa
dcaaaaakdccabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaabaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0 } };
MOV result.color, c[2].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
"ps_4_0_level_9_1
eefiecedmagcfaoekpegpkppcplldhoenfeogcfnabaaaaaakiabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaheabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0 } };
MOV result.color, c[2].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
"ps_4_0_level_9_1
eefiecedbeiofonkeaklpjioeblomkmleabghbhcabaaaaaajaabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaafmabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaaaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0 } };
MOV result.color, c[2].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
"ps_4_0_level_9_1
eefiecedaimaohcmccfelceipfjfifbpajocpoofabaaaaaakiabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaheabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0 } };
MOV result.color, c[2].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
"ps_4_0_level_9_1
eefiecedmagcfaoekpegpkppcplldhoenfeogcfnabaaaaaakiabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaheabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0 } };
MOV result.color, c[2].x;
END
# 1 instructions, 0 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"ps_2_0
def c0, 0.00000000, 0, 0, 0
mov_pp r0, c0.x
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
"ps_4_0_level_9_1
eefiecedhihoeiplholpgndalfbljkgbagaacmpaabaaaaaakiabaaaaaeaaaaaa
daaaaaaajeaaaaaaneaaaaaaheabaaaaebgpgodjfmaaaaaafmaaaaaaaaacpppp
diaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaacaaaacpia
aaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcdiaaaaaaeaaaaaaa
aoaaaaaagfaaaaadpccabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [unity_Scale]
"!!ARBvp1.0
PARAM c[10] = { program.local[0],
		state.matrix.mvp,
		program.local[5..9] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2].xyz, R0, c[9].w;
DP3 R0.y, R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3].xyz, R0, c[9].w;
DP3 R0.y, R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[4].xyz, R0, c[9].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [unity_Scale]
"vs_2_0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul oT2.xyz, r0, c8.w
dp3 r0.y, r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul oT3.xyz, r0, c8.w
dp3 r0.y, r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul oT4.xyz, r0, c8.w
mov oT0.xy, v3
mov oT1.xy, v4
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
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" TexCoord2
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "UnityPerDraw" 0
"vs_4_0_level_9_1
eefiecedbgiijcckbfmnpmpenhflkndlanklciioabaaaaaaeaaiaaaaaeaaaaaa
daaaaaaaliacaaaamaagaaaaiiahaaaaebgpgodjiaacaaaaiaacaaaaaaacpopp
deacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaaaa
aeaaabaaaaaaaaaaaaaaamaaadaaafaaaaaaaaaaaaaabeaaabaaaiaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabiaabaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaabaaaaacaaaaahiaabaaoejaafaaaaadabaaahiaaaaamjiaacaancja
aeaaaaaeaaaaahiaacaamjjaaaaanciaabaaoeibafaaaaadaaaaahiaaaaaoeia
abaappjaabaaaaacabaaabiaafaaaakaabaaaaacabaaaciaagaaaakaabaaaaac
abaaaeiaahaaaakaaiaaaaadacaaaciaaaaaoeiaabaaoeiaaiaaaaadacaaabia
abaaoejaabaaoeiaaiaaaaadacaaaeiaacaaoejaabaaoeiaafaaaaadabaaahoa
acaaoeiaaiaappkaabaaaaacabaaabiaafaaffkaabaaaaacabaaaciaagaaffka
abaaaaacabaaaeiaahaaffkaaiaaaaadacaaaciaaaaaoeiaabaaoeiaaiaaaaad
acaaabiaabaaoejaabaaoeiaaiaaaaadacaaaeiaacaaoejaabaaoeiaafaaaaad
acaaahoaacaaoeiaaiaappkaabaaaaacabaaabiaafaakkkaabaaaaacabaaacia
agaakkkaabaaaaacabaaaeiaahaakkkaaiaaaaadaaaaaciaaaaaoeiaabaaoeia
aiaaaaadaaaaabiaabaaoejaabaaoeiaaiaaaaadaaaaaeiaacaaoejaabaaoeia
afaaaaadadaaahoaaaaaoeiaaiaappkaafaaaaadaaaaapiaaaaaffjaacaaoeka
aeaaaaaeaaaaapiaabaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaadaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaeaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
aaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejappppaaaafdeieefcaaaeaaaa
eaaaabaaaaabaaaafjaaaaaeegiocaaaaaaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
hccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacadaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
aaaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaaaaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
aaaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaa
agbebaaaaeaaaaaadiaaaaahhcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaa
egacbaiaebaaaaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgbpbaaaabaaaaaadgaaaaagbcaabaaaabaaaaaaakiacaaaaaaaaaaaamaaaaaa
dgaaaaagccaabaaaabaaaaaaakiacaaaaaaaaaaaanaaaaaadgaaaaagecaabaaa
abaaaaaaakiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaa
egacbaaaabaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaa
abaaaaaadiaaaaaihccabaaaacaaaaaaegacbaaaacaaaaaapgipcaaaaaaaaaaa
beaaaaaadgaaaaagbcaabaaaabaaaaaabkiacaaaaaaaaaaaamaaaaaadgaaaaag
ccaabaaaabaaaaaabkiacaaaaaaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaa
bkiacaaaaaaaaaaaaoaaaaaabaaaaaahccaabaaaacaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaacaaaaaaegbcbaaaabaaaaaaegacbaaa
abaaaaaabaaaaaahecaabaaaacaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
diaaaaaihccabaaaadaaaaaaegacbaaaacaaaaaapgipcaaaaaaaaaaabeaaaaaa
dgaaaaagbcaabaaaabaaaaaackiacaaaaaaaaaaaamaaaaaadgaaaaagccaabaaa
abaaaaaackiacaaaaaaaaaaaanaaaaaadgaaaaagecaabaaaabaaaaaackiacaaa
aaaaaaaaaoaaaaaabaaaaaahccaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaa
baaaaaahecaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadiaaaaai
hccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaaaaaaaaabeaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
}
Program "fp" {
SubProgram "opengl " {
"!!ARBfp1.0
PARAM c[1] = { { 0, 0.5 } };
TEMP R0;
MOV R0.z, fragment.texcoord[4];
MOV R0.x, fragment.texcoord[2].z;
MOV R0.y, fragment.texcoord[3].z;
MAD result.color.xyz, R0, c[0].y, c[0].y;
MOV result.color.w, c[0].x;
END
# 5 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
"ps_2_0
def c0, 0.50000000, 0.00000000, 0, 0
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
mov_pp r0.z, t4
mov_pp r0.x, t2.z
mov_pp r0.y, t3.z
mad_pp r0.xyz, r0, c0.x, c0.x
mov_pp r0.w, c0.y
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
"ps_4_0_level_9_1
eefiecednmjjoifjgdiananfhieokjjhmjheombaabaaaaaalmacaaaaaeaaaaaa
daaaaaaapiaaaaaanaabaaaaiiacaaaaebgpgodjmaaaaaaamaaaaaaaaaacpppp
jmaaaaaaceaaaaaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaaaceaaaaacpppp
fbaaaaafaaaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
abaaahlabpaaaaacaaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlaafaaaaad
aaaacbiaabaakklaaaaaaakaafaaaaadaaaacciaacaakklaaaaaaakaafaaaaad
aaaaceiaadaakklaaaaaaakaacaaaaadaaaachiaaaaaoeiaaaaaaakaabaaaaac
aaaaciiaaaaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcnaaaaaaa
eaaaaaaadeaaaaaagcbaaaadecbabaaaacaaaaaagcbaaaadecbabaaaadaaaaaa
gcbaaaadecbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacabaaaaaa
dgaaaaafbcaabaaaaaaaaaaackbabaaaacaaaaaadgaaaaafccaabaaaaaaaaaaa
ckbabaaaadaaaaaadgaaaaafecaabaaaaaaaaaaackbabaaaaeaaaaaadcaaaaap
hccabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaeaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaeaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaeaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "QUEUE"="Transparent" "IGNOREPROJECTOR"="False" "RenderType"="Transparent" }
  ZWrite Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
"!!ARBvp1.0
PARAM c[18] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[3].xyz, R3, R2;
ADD result.texcoord[2].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[2].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 29 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
"vs_2_0
def c18, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c18.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c18.x
mul r0.y, r0, c8.x
add oT3.xyz, r3, r2
mad oT2.xy, r0.z, c9.zwzw, r0
mov oPos, r1
mov oT2.zw, r1
mov oT0.xy, v2
mov oT1.xy, v3
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedomnbjlppgjcaaebohplhacdhammleiooabaaaaaaeaaiaaaaaeaaaaaa
daaaaaaamiacaaaaniagaaaakaahaaaaebgpgodjjaacaaaajaacaaaaaaacpopp
cmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapia
ajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
abaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaaoaaoekaaeaaaaaeabaaaliaanaakeka
abaaaaiaacaakeiaaeaaaaaeabaaahiaapaaoekaabaakkiaabaapeiaabaaaaac
abaaaiiabbaaffkaajaaaaadacaaabiaacaaoekaabaaoeiaajaaaaadacaaacia
adaaoekaabaaoeiaajaaaaadacaaaeiaaeaaoekaabaaoeiaafaaaaadadaaapia
abaacjiaabaakeiaajaaaaadaeaaabiaafaaoekaadaaoeiaajaaaaadaeaaacia
agaaoekaadaaoeiaajaaaaadaeaaaeiaahaaoekaadaaoeiaacaaaaadacaaahia
acaaoeiaaeaaoeiaafaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabia
abaaaaiaabaaaaiaabaaffibaeaaaaaeacaaahoaaiaaoekaabaaaaiaacaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcaiaeaaaaeaaaabaaacabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaf
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
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[16] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[14].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
"vs_2_0
def c16, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c16.x
mul r1.y, r1, c12.x
mad oT2.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov r0.x, c14.w
add r0.y, c16, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov oT2.zw, r0
mul oT4.xyz, r1, c14.w
mov oT0.xy, v1
mov oT1.xy, v2
mad oT3.xy, v2, c15, c15.zwzw
mul oT4.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfojcgifocnioleaejhedbmgcodkbhimbabaaaaaaceaiaaaaaeaaaaaa
daaaaaaakiacaaaakeagaaaagmahaaaaebgpgodjhaacaaaahaacaaaaaaacpopp
amacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaabjaaabaaadaaaaaaaaaa
adaaaaaaaiaaaeaaaaaaaaaaadaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaad
aaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiabaaaaakaafaaaaadabaaafiaaaaapeiabaaaaakaacaaaaadabaaadoa
abaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaabaaoekaabaaookaafaaaaad
abaaahiaaaaaffjaanaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaahiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiaapaaoeka
aaaappjaabaaoeiaacaaaaadabaaahiaabaaoeiaadaaoekbafaaaaadadaaahoa
abaaoeiaadaappkaafaaaaadabaaabiaaaaaffjaajaakkkaaeaaaaaeabaaabia
aiaakkkaaaaaaajaabaaaaiaaeaaaaaeabaaabiaakaakkkaaaaakkjaabaaaaia
aeaaaaaeabaaabiaalaakkkaaaaappjaabaaaaiaabaaaaacabaaaiiaadaappka
acaaaaadabaaaciaabaappibbaaaffkaafaaaaadadaaaioaabaaffiaabaaaaib
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcpeadaaaaeaaaabaapnaaaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaal
dccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaa
bjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
bjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadp
diaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[7] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..6] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [unity_LightmapST]
"vs_2_0
def c7, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c7.x
mul r1.y, r1, c4.x
mad oT2.xy, r1.z, c5.zwzw, r1
mov oPos, r0
mov oT2.zw, r0
mov oT0.xy, v1
mov oT1.xy, v2
mad oT3.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedglicbdigofmoaaafealoikgchkfhhdliabaaaaaadmafaaaaaeaaaaaa
daaaaaaakmabaaaaneadaaaajmaeaaaaebgpgodjheabaaaaheabaaaaaaacpopp
ciabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafahaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaaka
afaaaaadabaaaiiaabaaaaiaahaaaakaafaaaaadabaaafiaaaaapeiaahaaaaka
acaaaaadabaaadoaabaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaabaaoeka
abaaookaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaaddccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
"!!ARBvp1.0
PARAM c[18] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].y;
DP4 R2.z, R0, c[12];
DP4 R2.y, R0, c[11];
DP4 R2.x, R0, c[10];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[15];
DP4 R3.y, R1, c[14];
DP4 R3.x, R1, c[13];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[3].xyz, R3, R2;
ADD result.texcoord[2].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[2].zw, R1;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
END
# 29 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
"vs_2_0
def c18, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c18.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c18.x
mul r0.y, r0, c8.x
add oT3.xyz, r3, r2
mad oT2.xy, r0.z, c9.zwzw, r0
mov oPos, r1
mov oT2.zw, r1
mov oT0.xy, v2
mov oT1.xy, v3
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
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
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedomnbjlppgjcaaebohplhacdhammleiooabaaaaaaeaaiaaaaaeaaaaaa
daaaaaaamiacaaaaniagaaaakaahaaaaebgpgodjjaacaaaajaacaaaaaaacpopp
cmacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaapiaaaaaffjaakaaoekaaeaaaaaeaaaaapia
ajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
abaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaaoaaoekaaeaaaaaeabaaaliaanaakeka
abaaaaiaacaakeiaaeaaaaaeabaaahiaapaaoekaabaakkiaabaapeiaabaaaaac
abaaaiiabbaaffkaajaaaaadacaaabiaacaaoekaabaaoeiaajaaaaadacaaacia
adaaoekaabaaoeiaajaaaaadacaaaeiaaeaaoekaabaaoeiaafaaaaadadaaapia
abaacjiaabaakeiaajaaaaadaeaaabiaafaaoekaadaaoeiaajaaaaadaeaaacia
agaaoekaadaaoeiaajaaaaadaeaaaeiaahaaoekaadaaoeiaacaaaaadacaaahia
acaaoeiaaeaaoeiaafaaaaadabaaaciaabaaffiaabaaffiaaeaaaaaeabaaabia
abaaaaiaabaaaaiaabaaffibaeaaaaaeacaaahoaaiaaoekaabaaaaiaacaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcaiaeaaaaeaaaabaaacabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagiaaaaacaeaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaa
dgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaa
agahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaaf
mccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaf
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
bkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaabaaaaaa
cmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 9 [_Object2World]
Vector 13 [_ProjectionParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[16] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[14];
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[4].xyz, R1, c[14].w;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 21 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Matrix 8 [_Object2World]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_ShadowFadeCenterAndType]
Vector 15 [unity_LightmapST]
"vs_2_0
def c16, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c16.x
mul r1.y, r1, c12.x
mad oT2.xy, r1.z, c13.zwzw, r1
mov oPos, r0
mov r0.x, c14.w
add r0.y, c16, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c14
mov oT2.zw, r0
mul oT4.xyz, r1, c14.w
mov oT0.xy, v1
mov oT1.xy, v2
mad oT3.xy, v2, c15, c15.zwzw
mul oT4.w, -r0.x, r0.y
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityShadows" 416
Vector 400 [unity_ShadowFadeCenterAndType]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 64 [glstate_matrix_modelview0]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityShadows" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedfojcgifocnioleaejhedbmgcodkbhimbabaaaaaaceaiaaaaaeaaaaaa
daaaaaaakiacaaaakeagaaaagmahaaaaebgpgodjhaacaaaahaacaaaaaaacpopp
amacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaabjaaabaaadaaaaaaaaaa
adaaaaaaaiaaaeaaaaaaaaaaadaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaad
aaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiabaaaaakaafaaaaadabaaafiaaaaapeiabaaaaakaacaaaaadabaaadoa
abaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaabaaoekaabaaookaafaaaaad
abaaahiaaaaaffjaanaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaahiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiaapaaoeka
aaaappjaabaaoeiaacaaaaadabaaahiaabaaoeiaadaaoekbafaaaaadadaaahoa
abaaoeiaadaappkaafaaaaadabaaabiaaaaaffjaajaakkkaaeaaaaaeabaaabia
aiaakkkaaaaaaajaabaaaaiaaeaaaaaeabaaabiaakaakkkaaaaakkjaabaaaaia
aeaaaaaeabaaabiaalaakkkaaaaappjaabaaaaiaabaaaaacabaaaiiaadaappka
acaaaaadabaaaciaabaappibbaaaffkaafaaaaadadaaaioaabaaffiaabaaaaib
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoa
aeaabejappppaaaafdeieefcpeadaaaaeaaaabaapnaaaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaabkaaaaaafjaaaaaeegiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaaddccabaaaadaaaaaagfaaaaad
pccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
dccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaa
aeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaal
dccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaiaebaaaaaaacaaaaaa
bjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
bjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaackiacaaaadaaaaaa
afaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaaaeaaaaaaakbabaaa
aaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
agaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaaj
ccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaaabeaaaaaaaaaiadp
diaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[7] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..6] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[5].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[2].zw, R0;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[3].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 12 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_ProjectionParams]
Vector 5 [_ScreenParams]
Vector 6 [unity_LightmapST]
"vs_2_0
def c7, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c7.x
mul r1.y, r1, c4.x
mad oT2.xy, r1.z, c5.zwzw, r1
mov oPos, r0
mov oT2.zw, r0
mov oT0.xy, v1
mov oT1.xy, v2
mad oT3.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 176
Vector 128 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedglicbdigofmoaaafealoikgchkfhhdliabaaaaaadmafaaaaaeaaaaaa
daaaaaaakmabaaaaneadaaaajmaeaaaaebgpgodjheabaaaaheabaaaaaaacpopp
ciabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafahaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapiaadaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaaka
afaaaaadabaaaiiaabaaaaiaahaaaakaafaaaaadabaaafiaaaaapeiaahaaaaka
acaaaaadabaaadoaabaakkiaabaaomiaaeaaaaaeacaaadoaaeaaoejaabaaoeka
abaaookaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacabaaamoaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaac
aaaaamoaaeaabejappppaaaafdeieefccaacaaaaeaaaabaaiiaaaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaaddccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaafmccabaaa
abaaaaaaagbebaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadcaaaaaldccabaaaadaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
adamaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpboakmfpcfedjlnfafmaodlilaeeeenoabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 176
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfnbnikcdfanjpjknonciejhkplljdpkfabaaaaaalmaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaaiiaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadaaaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 176
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfbpknohnoffkeogfakoagaokaalkpkpnabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpboakmfpcfedjlnfafmaodlilaeeeenoabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 176
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfnbnikcdfanjpjknonciejhkplljdpkfabaaaaaalmaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaaiiaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadaaaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[8] = { program.local[0..6],
		{ 1 } };
TEMP R0;
TEMP R1;
TEX R0.xw, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, c[3];
ADD R0.y, fragment.texcoord[1], c[4].x;
SGE R0.y, R0, c[7].x;
ADD R1.w, R0, R0.y;
MUL R0.x, R0, R1.w;
ADD R0.z, -R0.w, c[7].x;
ADD R1.xyz, -R1, c[2];
MAD R1.xyz, R0.z, R1, c[3];
MUL R1.xyz, R1, c[6].x;
ADD R0.yzw, -R1.xxyz, c[0].xxyz;
MAD result.color.xyz, R0.yzww, c[1].x, R1;
MUL_SAT result.color.w, R0.x, c[5].x;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_WarningColor]
Float 1 [_WarningColorValue]
Vector 2 [_CoolDownBarColor1]
Vector 3 [_CoolDownBarColor2]
Float 4 [_OpacityUvMaskValue]
Float 5 [_MasterOpacity]
Float 6 [_EmissiveMul]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c7, -1.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xy
texld r2, t0, s0
add r1.x, t1.y, c4
mov_pp r3.xyz, c2
add r1.x, r1, c7
add_pp r0.x, -r2.w, c7.y
add_pp r3.xyz, -c3, r3
cmp r1.x, r1, c7.y, c7.z
mad_pp r3.xyz, r0.x, r3, c3
add r0.x, r2.w, r1
mul r0.x, r2, r0
mul r1.xyz, r3, c6.x
mul_sat r0.w, r0.x, c5.x
add_pp r2.xyz, -r1, c0
mad_pp r0.xyz, r2, c1.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 176
Vector 48 [_WarningColor]
Float 64 [_WarningColorValue]
Vector 80 [_CoolDownBarColor1]
Vector 96 [_CoolDownBarColor2]
Float 112 [_OpacityUvMaskValue]
Float 116 [_MasterOpacity]
Float 120 [_EmissiveMul]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedfbpknohnoffkeogfakoagaokaalkpkpnabaaaaaakeaeaaaaaeaaaaaa
daaaaaaakiabaaaanaadaaaahaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpppp
dmabaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaadaaafaaaaaaaaaaaaaaaaacppppfbaaaaafafaaapkaaaaaialpaaaaiadp
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaajaaaaiapka
ecaaaaadaaaacpiaaaaaoelaaaaioekaacaaaaadaaaaaciaaaaakklaaeaaaaka
acaaaaadaaaaaciaaaaaffiaafaaaakafiaaaaaeaaaaaciaaaaaffiaafaaffka
afaakkkaacaaaaadaaaaaciaaaaaffiaaaaappiaafaaaaadaaaaabiaaaaaaaia
aaaaffiaacaaaaadaaaaaciaaaaappibafaaffkaafaaaaadabaadiiaaaaaaaia
aeaaffkaabaaaaacacaaahiaadaaoekaacaaaaadacaaahiaacaaoeibacaaoeka
aeaaaaaeaaaaahiaaaaaffiaacaaoeiaadaaoekaafaaaaadacaachiaaaaaoeia
aeaakkkaabaaaaacaaaaaiiaaeaakkkaaeaaaaaeaaaaahiaaaaaoeiaaaaappib
aaaaoekaaeaaaaaeabaachiaabaaaakaaaaaoeiaacaaoeiaabaaaaacaaaicpia
abaaoeiappppaaaafdeieefccaacaaaaeaaaaaaaiiaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadicbabaaaabaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaadkbabaaa
abaaaaaaakiacaaaaaaaaaaaahaaaaaabnaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkaabaiaebaaaaaaabaaaaaaabeaaaaa
aaaaiadpdicaaaaiiccabaaaaaaaaaaaakaabaaaaaaaaaaabkiacaaaaaaaaaaa
ahaaaaaaaaaaaaakncaabaaaaaaaaaaaagijcaaaaaaaaaaaafaaaaaaagijcaia
ebaaaaaaaaaaaaaaagaaaaaadcaaaaakhcaabaaaaaaaaaaafgafbaaaaaaaaaaa
igadbaaaaaaaaaaaegiccaaaaaaaaaaaagaaaaaadiaaaaaihcaabaaaabaaaaaa
egacbaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaakgikcaaaaaaaaaaaahaaaaaaegiccaaaaaaaaaaa
adaaaaaadcaaaaakhccabaaaaaaaaaaaagiacaaaaaaaaaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaadaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
}
 }
}
}