//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Ford_Glass_Basic" {
Properties {
 _MainTex ("Texture", 2D) = "gray" {}
 _ParallaxSpec ("Fake Spec", 2D) = "white" {}
 _specOpac ("Spce Opacity", Float) = 2
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
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R3.w, R1, c[6];
DP3 R2.w, R1, c[7];
DP3 R0.w, R1, c[5];
MOV R0.x, R3.w;
MOV R0.y, R2.w;
MOV R0.z, c[0].y;
MUL R1, R0.wxyy, R0.xyyw;
DP4 R2.z, R0.wxyz, c[12];
DP4 R2.y, R0.wxyz, c[11];
DP4 R2.x, R0.wxyz, c[10];
DP4 R0.z, R1, c[15];
DP4 R0.y, R1, c[14];
DP4 R0.x, R1, c[13];
MUL R3.x, R3.w, R3.w;
MAD R1.x, R0.w, R0.w, -R3;
ADD R3.xyz, R2, R0;
MUL R2.xyz, R1.x, c[16];
DP4 R1.w, vertex.position, c[4];
DP4 R1.z, vertex.position, c[3];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
MUL R0.y, R0, c[9].x;
ADD result.texcoord[3].xyz, R3, R2;
ADD result.texcoord[1].xy, R0, R0.z;
MOV result.position, R1;
MOV result.texcoord[1].zw, R1;
MOV result.texcoord[2].z, R2.w;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R0.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 32 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
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
Vector 18 [_ParallaxSpec_ST]
"vs_2_0
def c19, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.w, r1, c4
mov r0.x, r3.w
mov r0.y, r2.w
mov r0.z, c19.y
mul r1, r0.wxyy, r0.xyyw
dp4 r2.z, r0.wxyz, c12
dp4 r2.y, r0.wxyz, c11
dp4 r2.x, r0.wxyz, c10
dp4 r0.z, r1, c15
dp4 r0.y, r1, c14
dp4 r0.x, r1, c13
mul r3.x, r3.w, r3.w
mad r1.x, r0.w, r0.w, -r3
add r3.xyz, r2, r0
mul r2.xyz, r1.x, c16
dp4 r1.w, v0, c3
dp4 r1.z, v0, c2
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c19.x
mul r0.y, r0, c8.x
add oT3.xyz, r3, r2
mad oT1.xy, r0.z, c9.zwzw, r0
mov oPos, r1
mov oT1.zw, r1
mov oT2.z, r2.w
mov oT2.y, r3.w
mov oT2.x, r0.w
mad oT0.xy, v2, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_ParallaxSpec_ST]
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
eefieceddnkcmhijbjaelpneiabcepoopboceankabaaaaaageaiaaaaaeaaaaaa
daaaaaaanaacaaaapmagaaaameahaaaaebgpgodjjiacaaaajiacaaaaaaacpopp
ciacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiabcaaaakaafaaaaadabaaafiaaaaapeiabcaaaakaacaaaaadabaaadoa
abaakkiaabaaomiaafaaaaadabaaahiaacaaoejabbaappkaafaaaaadacaaahia
abaaffiaapaaoekaaeaaaaaeabaaaliaaoaakekaabaaaaiaacaakeiaaeaaaaae
abaaahiabaaaoekaabaakkiaabaapeiaabaaaaacabaaaiiabcaaffkaajaaaaad
acaaabiaadaaoekaabaaoeiaajaaaaadacaaaciaaeaaoekaabaaoeiaajaaaaad
acaaaeiaafaaoekaabaaoeiaafaaaaadadaaapiaabaacjiaabaakeiaajaaaaad
aeaaabiaagaaoekaadaaoeiaajaaaaadaeaaaciaahaaoekaadaaoeiaajaaaaad
aeaaaeiaaiaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaad
abaaaiiaabaaffiaabaaffiaaeaaaaaeabaaaiiaabaaaaiaabaaaaiaabaappib
abaaaaacacaaahoaabaaoeiaaeaaaaaeadaaahoaajaaoekaabaappiaacaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaamoaaaaaoeiappppaaaafdeieefcceaeaaaaeaaaabaaajabaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaa
aeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaa
afaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaa
aaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaa
egiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaa
egiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaa
egiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaa
jgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaa
acaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaa
acaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaa
acaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaa
acaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
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
ADD result.texcoord[1].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
"vs_2_0
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c8.x
mad oT1.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oT1.zw, r0
mad oT0.xy, v2, c11, c11.zwzw
mad oT2.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedflkcbkcnhgibiiekbbkgddpjfhodbbicabaaaaaabiafaaaaaeaaaaaa
daaaaaaakiabaaaamiadaaaajaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpopp
ceabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
aiaaaakaafaaaaadabaaafiaaaaapeiaaiaaaakaacaaaaadabaaadoaabaakkia
abaaomiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoa
aaaaoeiappppaaaafdeieefcbiacaaaaeaaaabaaigaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
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
ADD result.texcoord[1].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
"vs_2_0
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c12.x
mul r1.y, r1, c8.x
mad oT1.xy, r1.z, c9.zwzw, r1
mov oPos, r0
mov oT1.zw, r0
mad oT0.xy, v2, c11, c11.zwzw
mad oT2.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedflkcbkcnhgibiiekbbkgddpjfhodbbicabaaaaaabiafaaaaaeaaaaaa
daaaaaaakiabaaaamiadaaaajaaeaaaaebgpgodjhaabaaaahaabaaaaaaacpopp
ceabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaafaaaaadaaaaapia
aaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappja
aaaaoeiaafaaaaadabaaabiaaaaaffiaadaaaakaafaaaaadabaaaiiaabaaaaia
aiaaaakaafaaaaadabaaafiaaaaapeiaaiaaaakaacaaaaadabaaadoaabaakkia
abaaomiaaeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoa
aaaaoeiappppaaaafdeieefcbiacaaaaeaaaabaaigaaaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaa
kgaobaaaaaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Vector 18 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..18] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, vertex.normal, c[17].w;
DP3 R4.x, R0, c[6];
DP3 R3.w, R0, c[7];
DP3 R2.w, R0, c[5];
MOV R2.x, R4;
MOV R2.y, R3.w;
MOV R2.z, c[0].y;
MUL R0, R2.wxyy, R2.xyyw;
DP4 R1.z, R2.wxyz, c[12];
DP4 R1.y, R2.wxyz, c[11];
DP4 R1.x, R2.wxyz, c[10];
DP4 R2.z, R0, c[15];
DP4 R2.y, R0, c[14];
DP4 R2.x, R0, c[13];
ADD R3.xyz, R1, R2;
MUL R1.w, R4.x, R4.x;
MAD R0.x, R2.w, R2.w, -R1.w;
MUL R2.xyz, R0.x, c[16];
DP4 R1.w, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[9].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
ADD result.texcoord[3].xyz, R3, R2;
MOV result.texcoord[1], R0;
MOV result.texcoord[4], R0;
MOV result.position, R1;
MOV result.texcoord[2].z, R3.w;
MOV result.texcoord[2].y, R4.x;
MOV result.texcoord[2].x, R2.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 34 instructions, 5 R-regs
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
Vector 18 [_ParallaxSpec_ST]
"vs_2_0
def c19, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r0.xyz, v1, c17.w
dp3 r4.x, r0, c5
dp3 r3.w, r0, c6
dp3 r2.w, r0, c4
mov r2.x, r4
mov r2.y, r3.w
mov r2.z, c19.y
mul r0, r2.wxyy, r2.xyyw
dp4 r1.z, r2.wxyz, c12
dp4 r1.y, r2.wxyz, c11
dp4 r1.x, r2.wxyz, c10
dp4 r2.z, r0, c15
dp4 r2.y, r0, c14
dp4 r2.x, r0, c13
add r3.xyz, r1, r2
mul r1.w, r4.x, r4.x
mad r0.x, r2.w, r2.w, -r1.w
mul r2.xyz, r0.x, c16
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c19.x
dp4 r1.z, v0, c2
mul r0.y, r0, c8.x
mad r0.xy, r0.z, c9.zwzw, r0
mov r0.zw, r1
add oT3.xyz, r3, r2
mov oT1, r0
mov oT4, r0
mov oPos, r1
mov oT2.z, r3.w
mov oT2.y, r4.x
mov oT2.x, r2.w
mad oT0.xy, v2, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_ParallaxSpec_ST]
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
eefiecedbhffoonlimlhhdldocbeebhbfpkphcpjabaaaaaanaaiaaaaaeaaaaaa
daaaaaaaoiacaaaafaahaaaabiaiaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
eaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejabbaappkaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
aaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabcaaffkaajaaaaadabaaabiaadaaoekaaaaaoeia
ajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeia
ajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffia
aeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeia
aeaaaaaeadaaahoaajaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
alaaoekaaeaaaaaeaaaaapiaakaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
amaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeia
abaaaaacaaaaammaabaaoeiaafaaaaadaaaaaciaaaaaffiaacaaaakaafaaaaad
aaaaafiaaaaapeiabcaaaakaafaaaaadaaaaaiiaaaaaffiabcaaaakaacaaaaad
abaaadiaaaaakkiaaaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaacaeaaapoa
abaaoeiappppaaaafdeieefcgaaeaaaaeaaaabaabiabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaafaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
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
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaadcaaaaakhccabaaaaeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[9].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[3], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 13 instructions, 2 R-regs
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
Vector 11 [_ParallaxSpec_ST]
"vs_2_0
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c12.x
dp4 r1.z, v0, c2
mul r0.y, r0, c8.x
mad r0.xy, r0.z, c9.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT3, r0
mov oPos, r1
mad oT0.xy, v2, c11, c11.zwzw
mad oT2.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [unity_LightmapST]
Vector 144 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedoodhdhfdpkppahfckgjnmjdjdjmhphblabaaaaaaieafaaaaaeaaaaaa
daaaaaaamaabaaaabmaeaaaaoeaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpopp
dmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaiaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaamma
abaaoeiaafaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeia
aiaaaakaafaaaaadaaaaaiiaaaaaffiaaiaaaakaacaaaaadabaaadiaaaaakkia
aaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaa
fdeieefcfeacaaaaeaaaabaajfaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aiaaaaaakgiocaaaaaaaaaaaaiaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_ProjectionParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[12] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[9].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[3], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[1], c[10], c[10].zwzw;
END
# 13 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [unity_LightmapST]
Vector 11 [_ParallaxSpec_ST]
"vs_2_0
def c12, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v2
dcl_texcoord1 v3
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c12.x
dp4 r1.z, v0, c2
mul r0.y, r0, c8.x
mad r0.xy, r0.z, c9.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT3, r0
mov oPos, r1
mad oT0.xy, v2, c11, c11.zwzw
mad oT2.xy, v3, c10, c10.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 128 [unity_LightmapST]
Vector 144 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedoodhdhfdpkppahfckgjnmjdjdjmhphblabaaaaaaieafaaaaaeaaaaaa
daaaaaaamaabaaaabmaeaaaaoeaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpopp
dmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaiaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaamma
abaaoeiaafaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeia
aiaaaakaafaaaaadaaaaaiiaaaaaffiaaiaaaakaacaaaaadabaaadiaaaaakkia
aaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaa
fdeieefcfeacaaaaeaaaabaajfaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaaaaaaaaaa
ajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aiaaaaaakgiocaaaaaaaaaaaaiaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
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
Vector 26 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[27] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
DP4 R2.z, R4, c[20];
DP4 R2.y, R4, c[19];
DP4 R2.x, R4, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
MUL R2.xyz, R0.xyww, c[0].x;
ADD result.texcoord[3].xyz, R4.yzww, R1;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD result.texcoord[1].xy, R1, R2.z;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MOV result.texcoord[2].z, R3.x;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
END
# 63 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
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
Vector 26 [_ParallaxSpec_ST]
"vs_2_0
def c27, 0.50000000, 1.00000000, 0.00000000, 0
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
mov r4.w, c27.y
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
add r1, r2, c27.y
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c27.z
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
mul r2.xyz, r0.xyww, c27.x
add oT3.xyz, r4.yzww, r1
mov r1.x, r2
mul r1.y, r2, c8.x
mad oT1.xy, r2.z, c9.zwzw, r1
mov oPos, r0
mov oT1.zw, r0
mov oT2.z, r3.x
mov oT2.y, r3.w
mov oT2.x, r4
mad oT0.xy, v2, c26, c26.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_ParallaxSpec_ST]
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
eefiecedgdeajoaipghfialnjkphaigllillkbhpabaaaaaalianaaaaaeaaaaaa
daaaaaaaneaeaaaafaamaaaabianaaaaebgpgodjjmaeaaaajmaeaaaaaaacpopp
caaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaeaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaaeaabgaa
aaaaaaaaadaabeaaabaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafblaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaapiaaaaaffjabdaaoekaaeaaaaaeaaaaapia
bcaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiabfaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
acaaaakaafaaaaadabaaaiiaabaaaaiablaaaakaafaaaaadabaaafiaaaaapeia
blaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaaaaaffja
bhaaoekaaeaaaaaeabaaahiabgaaoekaaaaaaajaabaaoeiaaeaaaaaeabaaahia
biaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiabjaaoekaaaaappjaabaaoeia
acaaaaadacaaapiaabaaffibaeaaoekaafaaaaadadaaapiaacaaoeiaacaaoeia
acaaaaadaeaaapiaabaaaaibadaaoekaacaaaaadabaaapiaabaakkibafaaoeka
aeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeiaaeaaaaaeadaaapiaabaaoeia
abaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaiaahaaaaacafaaaciaadaaffia
ahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiiaadaappiaabaaaaacagaaacia
blaaffkaaeaaaaaeadaaapiaadaaoeiaagaaoekaagaaffiaafaaaaadagaaahia
acaaoejabkaappkaafaaaaadahaaahiaagaaffiabhaaoekaaeaaaaaeagaaalia
bgaakekaagaaaaiaahaakeiaaeaaaaaeagaaahiabiaaoekaagaakkiaagaapeia
afaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaaeacaaapiaaeaaoeiaagaaaaia
acaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkiaacaaoeiaafaaaaadabaaapia
afaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeiablaakkkaagaaaaacacaaabia
adaaaaiaagaaaaacacaaaciaadaaffiaagaaaaacacaaaeiaadaakkiaagaaaaac
acaaaiiaadaappiaafaaaaadabaaapiaabaaoeiaacaaoeiaafaaaaadacaaahia
abaaffiaaiaaoekaaeaaaaaeacaaahiaahaaoekaabaaaaiaacaaoeiaaeaaaaae
abaaahiaajaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahiaakaaoekaabaappia
abaaoeiaabaaaaacagaaaiiablaaffkaajaaaaadacaaabiaalaaoekaagaaoeia
ajaaaaadacaaaciaamaaoekaagaaoeiaajaaaaadacaaaeiaanaaoekaagaaoeia
afaaaaadadaaapiaagaacjiaagaakeiaajaaaaadaeaaabiaaoaaoekaadaaoeia
ajaaaaadaeaaaciaapaaoekaadaaoeiaajaaaaadaeaaaeiabaaaoekaadaaoeia
acaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadabaaaiiaagaaffiaagaaffia
aeaaaaaeabaaaiiaagaaaaiaagaaaaiaabaappibabaaaaacacaaahoaagaaoeia
aeaaaaaeacaaahiabbaaoekaabaappiaacaaoeiaacaaaaadadaaahoaabaaoeia
acaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaafdeieefcheahaaaaeaaaabaa
nnabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaa
bfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaad
dcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaa
aaaaaaaaaeaaaaaadiaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaa
aaaaaaaaaaaaaaahdccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
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
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
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
Vector 26 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[27] = { { 0.5, 1, 0 },
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
MOV R4.w, c[0].y;
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
ADD R1, R2, c[0].y;
DP4 R2.z, R4, c[20];
DP4 R2.y, R4, c[19];
DP4 R2.x, R4, c[18];
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].z;
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
ADD result.texcoord[3].xyz, R4.yzww, R1;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R2.xyz, R0.xyww, c[0].x;
MOV R1.zw, R0;
MOV R1.x, R2;
MUL R1.y, R2, c[9].x;
ADD R1.xy, R1, R2.z;
MOV result.texcoord[1], R1;
MOV result.texcoord[4], R1;
MOV result.position, R0;
MOV result.texcoord[2].z, R3.x;
MOV result.texcoord[2].y, R3.w;
MOV result.texcoord[2].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[26], c[26].zwzw;
END
# 65 instructions, 5 R-regs
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
Vector 26 [_ParallaxSpec_ST]
"vs_2_0
def c27, 0.50000000, 1.00000000, 0.00000000, 0
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
mov r4.w, c27.y
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
add r1, r2, c27.y
dp4 r2.z, r4, c20
dp4 r2.y, r4, c19
dp4 r2.x, r4, c18
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c27.z
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
add oT3.xyz, r4.yzww, r1
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r2.xyz, r0.xyww, c27.x
mov r1.zw, r0
mov r1.x, r2
mul r1.y, r2, c8.x
mad r1.xy, r2.z, c9.zwzw, r1
mov oT1, r1
mov oT4, r1
mov oPos, r0
mov oT2.z, r3.x
mov oT2.y, r3.w
mov oT2.x, r4
mad oT0.xy, v2, c26, c26.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 128 [_ParallaxSpec_ST]
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
eefiecednobbfnojglfamicfhciaekeklipcbdpeabaaaaaaceaoaaaaaeaaaaaa
daaaaaaaomaeaaaakeamaaaagmanaaaaebgpgodjleaeaaaaleaeaaaaaaacpopp
diaeaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaaiaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaacaaaiaaadaaaaaaaaaa
acaacgaaahaaalaaaaaaaaaaadaaaaaaaeaabcaaaaaaaaaaadaaamaaaeaabgaa
aaaaaaaaadaabeaaabaabkaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafblaaapka
aaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaaaaaffjabhaaoekaaeaaaaaeaaaaahia
bgaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabiaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabjaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaaffib
aeaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaadadaaapiaaaaaaaib
adaaoekaacaaaaadaaaaapiaaaaakkibafaaoekaaeaaaaaeacaaapiaadaaoeia
adaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeiaahaaaaac
aeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkia
ahaaaaacaeaaaiiaacaappiaabaaaaacafaaaciablaaffkaaeaaaaaeacaaapia
acaaoeiaagaaoekaafaaffiaafaaaaadafaaahiaacaaoejabkaappkaafaaaaad
agaaahiaafaaffiabhaaoekaaeaaaaaeafaaaliabgaakekaafaaaaiaagaakeia
aeaaaaaeafaaahiabiaaoekaafaakkiaafaapeiaafaaaaadabaaapiaabaaoeia
afaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaaeaaaaapia
aaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeiaalaaaaad
aaaaapiaaaaaoeiablaakkkaagaaaaacabaaabiaacaaaaiaagaaaaacabaaacia
acaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiiaacaappiaafaaaaad
aaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffiaaiaaoekaaeaaaaae
abaaahiaahaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaakaaoekaaaaappiaaaaaoeiaabaaaaacafaaaiia
blaaffkaajaaaaadabaaabiaalaaoekaafaaoeiaajaaaaadabaaaciaamaaoeka
afaaoeiaajaaaaadabaaaeiaanaaoekaafaaoeiaafaaaaadacaaapiaafaacjia
afaakeiaajaaaaadadaaabiaaoaaoekaacaaoeiaajaaaaadadaaaciaapaaoeka
acaaoeiaajaaaaadadaaaeiabaaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiiaafaaaaia
afaaaaiaaaaappibabaaaaacacaaahoaafaaoeiaaeaaaaaeabaaahiabbaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabdaaoekaaeaaaaaeaaaaapiabcaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabfaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamia
aaaaoeiaabaaaaacaaaaammaabaaoeiaafaaaaadaaaaaciaaaaaffiaacaaaaka
afaaaaadaaaaafiaaaaapeiablaaaakaafaaaaadaaaaaiiaaaaaffiablaaaaka
acaaaaadabaaadiaaaaakkiaaaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaac
aeaaapoaabaaoeiappppaaaafdeieefclaahaaaaeaaaabaaomabaaaafjaaaaae
egiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaa
akiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaafaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaa
aaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaaabaaaaaaegiocaaaacaaaaaa
cgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaaabaaaaaaegiocaaaacaaaaaa
chaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaaabaaaaaaegiocaaaacaaaaaa
ciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaa
egakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaaegiocaaaacaaaaaacjaaaaaa
egaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaaegiocaaaacaaaaaackaaaaaa
egaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaaegiocaaaacaaaaaaclaaaaaa
egaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
adaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaacmaaaaaa
pgapbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaa
acaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaacaaaaaaaaaaaaajpcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaa
egiocaaaacaaaaaaadaaaaaadiaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaa
egaobaaaadaaaaaadiaaaaahpcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaa
adaaaaaaaaaaaaajpcaabaaaafaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaa
acaaaaaaacaaaaaaaaaaaaajpcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaa
egiocaaaacaaaaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaa
agaabaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaa
egaobaaaafaaaaaaegaobaaaafaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaa
acaaaaaaegaobaaaacaaaaaaegaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaaf
pcaabaaaadaaaaaaegaobaaaacaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaa
acaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpaoaaaaakpcaabaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpegaobaaaacaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaadaaaaaadeaaaaakpcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaa
acaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
agaaaaaaagaabaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
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
Float 2 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[3].z;
DP3 R0.w, fragment.texcoord[2], c[0];
MAX R0.w, R0, c[3].x;
MOV result.color.w, c[3].x;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, R1, texture[1], 2D;
MUL R0.xyz, -R0, c[2].x;
ADD R1.xyz, -R1, c[3].y;
ADD R0.xyz, R0, c[3].y;
MAD R0.xyz, -R0, R1, c[3].y;
MUL R0.xyz, R0, c[3].z;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[3].z, R1;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c3, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c3.x
mul r1.xyz, -r1, c2.x
add r1.xyz, r1, c3.y
texld r0, r0, s1
add r0.xyz, -r0, c3.y
mad r0.xyz, -r1, r0, c3.y
mul r1.xyz, r0, c3.x
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t2, c0
max_pp r0.x, r0, c3.z
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mov_pp r0.w, c3.z
mad_pp r0.xyz, r0, c3.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Float 48 [_specOpac]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedklbamaiknpbjclgceaonfmakhpppomooabaaaaaajaafaaaaaeaaaaaa
daaaaaaaamacaaaalmaeaaaafmafaaaaebgpgodjneabaaaaneabaaaaaaacpppp
ieabaaaafaaaaaaaadaacmaaaaaafaaaaaaafaaaacaaceaaaaaafaaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaabaaaaaa
abaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadia
aaaappiaabaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaecaaaaadaaaaapia
aaaaoeiaaaaioekaecaaaaadabaaapiaaaaaoelaabaioekaacaaaaadaaaaahia
aaaaoeibadaaaakaabaaaaacaaaaaiiaadaaaakaaeaaaaaeabaaahiaabaaoeia
abaaaakbaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaaoeibadaaaakaacaaaaad
aaaachiaaaaaoeiaaaaaoeiaafaaaaadabaachiaaaaaoeiaaaaaoekaafaaaaad
aaaachiaaaaaoeiaadaaoelaaiaaaaadaaaaciiaacaaoelaacaaoekaalaaaaad
abaaciiaaaaappiaadaaffkaacaaaaadaaaaciiaabaappiaabaappiaaeaaaaae
aaaachiaabaaoeiaaaaappiaaaaaoeiaabaaaaacaaaaaiiaadaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefckiacaaaaeaaaaaaakkaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadlcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaa
aaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaan
hcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaaiicaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaa
abaaaaaaaaaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaa
dcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[1].z;
MUL R1.xyz, -R1, c[0].x;
ADD R1.xyz, R1, c[1].y;
MOV result.color.w, c[1].x;
TEX R0, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, R2, texture[1], 2D;
ADD R2.xyz, -R2, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MUL R1.xyz, R1, c[1].z;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[1].w;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2.xy
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t2, s2
texld r1, r1, s1
mul_pp r0.xyz, r0.w, r0
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 96
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmlkgbjjkgaeabjmiajffjomhnngnbeljabaaaaaaaaafaaaaaeaaaaaa
daaaaaaaneabaaaaeeaeaaaammaeaaaaebgpgodjjmabaaaajmabaaaaaaacpppp
gaabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadia
aaaappiaabaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaabaaaaacabaaadia
aaaabllaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaadacaaapiaaaaaoela
abaioekaecaaaaadabaacpiaabaaoeiaacaioekaacaaaaadaaaaahiaaaaaoeib
abaaaakaabaaaaacaaaaaiiaabaaaakaaeaaaaaeacaaahiaacaaoeiaaaaaaakb
aaaappiaaeaaaaaeaaaaahiaacaaoeiaaaaaoeibabaaaakaacaaaaadaaaachia
aaaaoeiaaaaaoeiaafaaaaadaaaaciiaabaappiaabaaffkaafaaaaadabaachia
abaaoeiaaaaappiaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciia
abaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgiacaaaaeaaaaaaa
jkaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadlcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaal
hcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadcaaaaanhcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[1].z;
MUL R1.xyz, -R1, c[0].x;
ADD R1.xyz, R1, c[1].y;
MOV result.color.w, c[1].x;
TEX R0, fragment.texcoord[2], texture[2], 2D;
TEX R2.xyz, R2, texture[1], 2D;
ADD R2.xyz, -R2, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MUL R1.xyz, R1, c[1].z;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MUL result.color.xyz, R0, c[1].w;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [unity_Lightmap] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2.xy
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t2, s2
texld r1, r1, s1
mul_pp r0.xyz, r0.w, r0
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r0, r1
mul_pp r0.xyz, r0, c1.z
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [unity_Lightmap] 2D 2
ConstBuffer "$Globals" 96
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmlkgbjjkgaeabjmiajffjomhnngnbeljabaaaaaaaaafaaaaaeaaaaaa
daaaaaaaneabaaaaeeaeaaaammaeaaaaebgpgodjjmabaaaajmabaaaaaaacpppp
gaabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadia
aaaappiaabaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaabaaaaacabaaadia
aaaabllaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaadacaaapiaaaaaoela
abaioekaecaaaaadabaacpiaabaaoeiaacaioekaacaaaaadaaaaahiaaaaaoeib
abaaaakaabaaaaacaaaaaiiaabaaaakaaeaaaaaeacaaahiaacaaoeiaaaaaaakb
aaaappiaaeaaaaaeaaaaahiaacaaoeiaaaaaoeibabaaaakaacaaaaadaaaachia
aaaaoeiaaaaaoeiaafaaaaadaaaaciiaabaappiaabaaffkaafaaaaadabaachia
abaaoeiaaaaappiaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciia
abaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgiacaaaaeaaaaaaa
jkaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadlcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaal
hcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadcaaaaanhcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaaaaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaheaaaaaaacaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaheaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[4], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R0.xy, R0, c[3].z;
DP3 R0.w, fragment.texcoord[2], c[0];
MAX R0.w, R0, c[3].x;
MUL R0.w, R0, R2.x;
MOV result.color.w, c[3].x;
TEX R1.xyz, R0, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, -R0, c[2].x;
ADD R1.xyz, -R1, c[3].y;
ADD R0.xyz, R0, c[3].y;
MAD R0.xyz, -R0, R1, c[3].y;
MUL R0.xyz, R0, c[3].z;
MUL R1.xyz, R0, fragment.texcoord[3];
MUL R0.xyz, R0, c[1];
MUL R0.xyz, R0.w, R0;
MAD result.color.xyz, R0, c[3].z, R1;
END
# 19 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Float 2 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c3, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4
texldp r3, t4, s2
texld r1, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c3.x
mul r1.xyz, -r1, c2.x
add r1.xyz, r1, c3.y
texld r0, r0, s1
add r0.xyz, -r0, c3.y
mad r0.xyz, -r1, r0, c3.y
mul r1.xyz, r0, c3.x
mul_pp r2.xyz, r1, c1
dp3_pp r0.x, t2, c0
max_pp r0.x, r0, c3.z
mul_pp r0.x, r0, r3
mul_pp r0.xyz, r0.x, r2
mul_pp r1.xyz, r1, t3
mov_pp r0.w, c3.z
mad_pp r0.xyz, r0, c3.x, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedgbfjgfdaagiggbekofgjdcphgjkgldokabaaaaaagmagaaaaaeaaaaaa
daaaaaaagiacaaaaiaafaaaadiagaaaaebgpgodjdaacaaaadaacaaaaaaacpppp
nmabaaaafeaaaaaaadaadaaaaaaafeaaaaaafeaaadaaceaaaaaafeaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
abaaaaaaabaaacaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaia
aeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaafaaaaadaaaaadiaaaaappia
aeaaoelaagaaaaacaaaaaeiaabaapplaafaaaaadaaaaamiaaaaakkiaabaablla
acaaaaadabaaadiaaaaabliaaaaabliaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadabaaapiaabaaoeiaabaioekaecaaaaadacaaapiaaaaaoelaacaioeka
aiaaaaadabaaciiaacaaoelaacaaoekaafaaaaadacaaciiaaaaaaaiaabaappia
fiaaaaaeabaaciiaabaappiaacaappiaadaaffkaacaaaaadabaaciiaabaappia
abaappiaacaaaaadaaaaahiaabaaoeibadaaaakaabaaaaacaaaaaiiaadaaaaka
aeaaaaaeabaaahiaacaaoeiaabaaaakbaaaappiaaeaaaaaeaaaaahiaabaaoeia
aaaaoeibadaaaakaacaaaaadaaaachiaaaaaoeiaaaaaoeiaafaaaaadabaachia
aaaaoeiaaaaaoekaafaaaaadaaaachiaaaaaoeiaadaaoelaaeaaaaaeaaaachia
abaaoeiaabaappiaaaaaoeiaabaaaaacaaaaaiiaadaaffkaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcbaadaaaaeaaaaaaameaaaaaafjaaaaaeegiocaaa
aaaaaaaaaiaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadlcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
lcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabaaaaaai
ccaabaaaaaaaaaaaegbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaa
agbbbaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahgcaabaaaaaaaaaaafgagbaaa
aaaaaaaafgagbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaalocaabaaaaaaaaaaaagajbaia
ebaaaaaaabaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaiadpaaaaiadpefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
dcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaaaaaaaaaa
ahaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanocaabaaa
aaaaaaaaagajbaiaebaaaaaaabaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
fgaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaajgahbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaaagbjbaaa
aeaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaabaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapalaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R3.x, fragment.texcoord[3], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[1].z;
MOV result.color.w, c[1].x;
TEX R2.xyz, R1, texture[1], 2D;
TEX R0, fragment.texcoord[2], texture[3], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R3.yzw, R0.xxyz, R3.x;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, -R1, c[0].x;
MUL R0.xyz, R0, c[1].w;
MUL R3.yzw, R3, c[1].z;
MIN R3.yzw, R0.xxyz, R3;
MUL R0.xyz, R0, R3.x;
ADD R2.xyz, -R2, c[1].y;
ADD R1.xyz, R1, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MAX R0.xyz, R3.yzww, R0;
MUL R1.xyz, R1, c[1].z;
MUL result.color.xyz, R1, R0;
END
# 21 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2.xy
dcl t3
texldp r3, t3, s2
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t2, s3
texld r1, r1, s1
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
mul_pp r2.xyz, r0.w, r0
mul_pp r0.xyz, r0, r3.x
mul_pp r2.xyz, r2, c1.z
mul_pp r0.xyz, r0, c1.x
mul_pp r3.xyz, r2, r3.x
min_pp r0.xyz, r2, r0
max_pp r0.xyz, r0, r3
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 160
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkpmpbbenffhpcpaeacaopcccbgncadngabaaaaaakeagaaaaaeaaaaaa
daaaaaaagmacaaaanaafaaaahaagaaaaebgpgodjdeacaaaadeacaaaaaaacpppp
peabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaacaaaaaa
abababaaaaacacaaadadadaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadiaaaaappia
acaaoelaabaaaaacabaaadiaaaaabllaagaaaaacaaaaaeiaabaapplaafaaaaad
aaaaamiaaaaakkiaabaabllaacaaaaadacaaadiaaaaabliaaaaabliaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaadaioekaecaaaaad
acaaapiaacaaoeiaabaioekaecaaaaadadaaapiaaaaaoelaacaioekaacaaaaad
acaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaacaappiaafaaaaad
abaaciiaabaappiaabaaffkaafaaaaadabaachiaabaaoeiaabaappiaakaaaaad
aeaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaiaabaaoeiaalaaaaad
abaachiaaeaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeibabaaaakaabaaaaac
aaaaaiiaabaaaakaaeaaaaaeacaaahiaadaaoeiaaaaaaakbaaaappiaaeaaaaae
aaaaahiaacaaoeiaaaaaoeibabaaaakaacaaaaadaaaachiaaaaaoeiaaaaaoeia
afaaaaadaaaachiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaabaakkkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcfmadaaaaeaaaaaaanhaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaa
egacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaaaaaaaahdcaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaalhcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaaohcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TXP R3.x, fragment.texcoord[3], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[1].z;
MOV result.color.w, c[1].x;
TEX R2.xyz, R1, texture[1], 2D;
TEX R0, fragment.texcoord[2], texture[3], 2D;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R3.yzw, R0.xxyz, R3.x;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, -R1, c[0].x;
MUL R0.xyz, R0, c[1].w;
MUL R3.yzw, R3, c[1].z;
MIN R3.yzw, R0.xxyz, R3;
MUL R0.xyz, R0, R3.x;
ADD R2.xyz, -R2, c[1].y;
ADD R1.xyz, R1, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MAX R0.xyz, R3.yzww, R0;
MUL R1.xyz, R1, c[1].z;
MUL result.color.xyz, R1, R0;
END
# 21 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2.xy
dcl t3
texldp r3, t3, s2
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t2, s3
texld r1, r1, s1
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
mul_pp r2.xyz, r0.w, r0
mul_pp r0.xyz, r0, r3.x
mul_pp r2.xyz, r2, c1.z
mul_pp r0.xyz, r0, c1.x
mul_pp r3.xyz, r2, r3.x
min_pp r0.xyz, r2, r0
max_pp r0.xyz, r0, r3
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_ParallaxSpec] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_ShadowMapTexture] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 160
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkpmpbbenffhpcpaeacaopcccbgncadngabaaaaaakeagaaaaaeaaaaaa
daaaaaaagmacaaaanaafaaaahaagaaaaebgpgodjdeacaaaadeacaaaaaaacpppp
peabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaacaaaaaa
abababaaaaacacaaadadadaaaaaaahaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaagaaaaacaaaaaiiaacaapplaafaaaaadaaaaadiaaaaappia
acaaoelaabaaaaacabaaadiaaaaabllaagaaaaacaaaaaeiaabaapplaafaaaaad
aaaaamiaaaaakkiaabaabllaacaaaaadacaaadiaaaaabliaaaaabliaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaabaaoeiaadaioekaecaaaaad
acaaapiaacaaoeiaabaioekaecaaaaadadaaapiaaaaaoelaacaioekaacaaaaad
acaaciiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaacaappiaafaaaaad
abaaciiaabaappiaabaaffkaafaaaaadabaachiaabaaoeiaabaappiaakaaaaad
aeaachiaaaaabliaabaaoeiaafaaaaadaaaachiaaaaaaaiaabaaoeiaalaaaaad
abaachiaaeaaoeiaaaaaoeiaacaaaaadaaaaahiaacaaoeibabaaaakaabaaaaac
aaaaaiiaabaaaakaaeaaaaaeacaaahiaadaaoeiaaaaaaakbaaaappiaaeaaaaae
aaaaahiaacaaoeiaaaaaoeibabaaaakaacaaaaadaaaachiaaaaaoeiaaaaaoeia
afaaaaadaaaachiaabaaoeiaaaaaoeiaabaaaaacaaaaciiaabaakkkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcfmadaaaaeaaaaaaanhaaaaaafjaaaaae
egiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaa
aaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagajbaaaabaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaddaaaaahocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagajbaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadeaaaaahhcaabaaaaaaaaaaajgahbaaaaaaaaaaa
egacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaaaaaaaahdcaabaaaabaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaaaaaaaalhcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadcaaaaaohcaabaaaacaaaaaa
egacbaiaebaaaaaaacaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaaabaaaaaaegacbaiaebaaaaaa
acaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
abaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
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
Matrix 9 [_LightMatrix0]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[1].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 22 instructions, 2 R-regs
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.x
mov oPos, r0
mov oT1.zw, r0
mul r1.y, r1, c12.x
mad oT1.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1, c15.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c14
mad oT0.xy, v2, c16, c16.zwzw
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
Vector 128 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedeobhgongddjfifbkgkhlkbfamkpmobnbabaaaaaabiajaaaaaeaaaaaa
daaaaaaaaaadaaaajiahaaaagaaiaaaaebgpgodjmiacaaaamiacaaaaaaacpopp
emacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaaeaaamaa
aaaaaaaaadaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaanaaoekaaeaaaaaeabaaaliaamaakeka
abaaaaiaacaakeiaaeaaaaaeacaaahoaaoaaoekaabaakkiaabaapeiaafaaaaad
abaaahiaaaaaffjaanaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaahiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiaapaaoeka
aaaappjaabaaoeiaacaaaaadadaaahoaabaaoeibahaaoekaafaaaaadabaaapia
aaaaffjaanaaoekaaeaaaaaeabaaapiaamaaoekaaaaaaajaabaaoeiaaeaaaaae
abaaapiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapiaapaaoekaaaaappja
abaaoeiaafaaaaadacaaahiaabaaffiaacaaoekaaeaaaaaeacaaahiaabaaoeka
abaaaaiaacaaoeiaaeaaaaaeabaaahiaadaaoekaabaakkiaacaaoeiaaeaaaaae
aeaaahoaaeaaoekaabaappiaabaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaa
fdeieefcjaaeaaaaeaaaabaaceabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_ProjectionParams]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [unity_Scale]
Vector 12 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[13] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[9].x;
ADD result.texcoord[1].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[11].w;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[10];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
END
# 15 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_ProjectionParams]
Vector 9 [_ScreenParams]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [unity_Scale]
Vector 12 [_ParallaxSpec_ST]
"vs_2_0
def c13, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c13.x
mul r1.y, r1, c8.x
mad oT1.xy, r1.z, c9.zwzw, r1
mul r1.xyz, v1, c11.w
mov oPos, r0
mov oT1.zw, r0
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c10
mad oT0.xy, v2, c12, c12.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedihocebbhkbacaanaomokmpkmflcnbdbmabaaaaaacmagaaaaaeaaaaaa
daaaaaaaamacaaaameaeaaaaimafaaaaebgpgodjneabaaaaneabaaaaaaacpopp
geabaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaaaaaaabaaadaaaaaaaaaa
adaaaaaaaeaaaeaaaaaaaaaaadaaamaaadaaaiaaaaaaaaaaadaabeaaabaaalaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafamaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaapiaaaaaffjaafaaoekaaeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoeka
aaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffiaacaaaakaafaaaaadabaaaiia
abaaaaiaamaaaakaafaaaaadabaaafiaaaaapeiaamaaaakaacaaaaadabaaadoa
abaakkiaabaaomiaafaaaaadabaaahiaacaaoejaalaappkaafaaaaadacaaahia
abaaffiaajaaoekaaeaaaaaeabaaaliaaiaakekaabaaaaiaacaakeiaaeaaaaae
acaaahoaakaaoekaabaakkiaabaapeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiaabaaaaac
adaaahoaadaaoekappppaaaafdeieefclaacaaaaeaaaabaakmaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[1].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].w, R0, c[12];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 23 instructions, 2 R-regs
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.x
mov oPos, r0
mov oT1.zw, r0
mul r1.y, r1, c12.x
mad oT1.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1, c15.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.w, r0, c11
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c14
mad oT0.xy, v2, c16, c16.zwzw
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
Vector 128 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedjlclapinbpedhomeblfomcbkinccamkgabaaaaaabiajaaaaaeaaaaaa
daaaaaaaaaadaaaajiahaaaagaaiaaaaebgpgodjmiacaaaamiacaaaaaaacpopp
emacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaaeaaamaa
aaaaaaaaadaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaanaaoekaaeaaaaaeabaaaliaamaakeka
abaaaaiaacaakeiaaeaaaaaeacaaahoaaoaaoekaabaakkiaabaapeiaafaaaaad
abaaahiaaaaaffjaanaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaahiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiaapaaoeka
aaaappjaabaaoeiaacaaaaadadaaahoaabaaoeibahaaoekaafaaaaadabaaapia
aaaaffjaanaaoekaaeaaaaaeabaaapiaamaaoekaaaaaaajaabaaoeiaaeaaaaae
abaaapiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapiaapaaoekaaaaappja
abaaoeiaafaaaaadacaaapiaabaaffiaacaaoekaaeaaaaaeacaaapiaabaaoeka
abaaaaiaacaaoeiaaeaaaaaeacaaapiaadaaoekaabaakkiaacaaoeiaaeaaaaae
aeaaapoaaeaaoekaabaappiaacaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaa
fdeieefcjaaeaaaaeaaaabaaceabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[1].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
DP4 result.texcoord[4].z, R0, c[11];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
ADD result.texcoord[3].xyz, -R0, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 22 instructions, 2 R-regs
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.x
mov oPos, r0
mov oT1.zw, r0
mul r1.y, r1, c12.x
mad oT1.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1, c15.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
dp4 oT4.z, r0, c10
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
add oT3.xyz, -r0, c14
mad oT0.xy, v2, c16, c16.zwzw
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
Vector 128 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedeobhgongddjfifbkgkhlkbfamkpmobnbabaaaaaabiajaaaaaeaaaaaa
daaaaaaaaaadaaaajiahaaaagaaiaaaaebgpgodjmiacaaaamiacaaaaaaacpopp
emacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaaeaaamaa
aaaaaaaaadaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaanaaoekaaeaaaaaeabaaaliaamaakeka
abaaaaiaacaakeiaaeaaaaaeacaaahoaaoaaoekaabaakkiaabaapeiaafaaaaad
abaaahiaaaaaffjaanaaoekaaeaaaaaeabaaahiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaahiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaahiaapaaoeka
aaaappjaabaaoeiaacaaaaadadaaahoaabaaoeibahaaoekaafaaaaadabaaapia
aaaaffjaanaaoekaaeaaaaaeabaaapiaamaaoekaaaaaaajaabaaoeiaaeaaaaae
abaaapiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapiaapaaoekaaaaappja
abaaoeiaafaaaaadacaaahiaabaaffiaacaaoekaaeaaaaaeacaaahiaabaaoeka
abaaaaiaacaaoeiaaeaaaaaeabaaahiaadaaoekaabaakkiaacaaoeiaaeaaaaae
aeaaahoaaeaaoekaabaappiaabaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeiappppaaaa
fdeieefcjaaeaaaaeaaaabaaceabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaa
fjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaa
adaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaamaaaaaa
agbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaaaaaaaaaegiccaaaacaaaaaa
aaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaa
agaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaabejfdeheomaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaa
kbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaa
ljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeo
aafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaakl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_ProjectionParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MOV result.texcoord[1].zw, R0;
MUL R1.y, R1, c[13].x;
ADD result.texcoord[1].xy, R1, R1.z;
MUL R1.xyz, vertex.normal, c[15].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 result.texcoord[4].y, R0, c[10];
DP4 result.texcoord[4].x, R0, c[9];
DP3 result.texcoord[2].z, R1, c[7];
DP3 result.texcoord[2].y, R1, c[6];
DP3 result.texcoord[2].x, R1, c[5];
MOV result.texcoord[3].xyz, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
END
# 21 instructions, 2 R-regs
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
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c17.x
mov oPos, r0
mov oT1.zw, r0
mul r1.y, r1, c12.x
mad oT1.xy, r1.z, c13.zwzw, r1
mul r1.xyz, v1, c15.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 oT4.y, r0, c9
dp4 oT4.x, r0, c8
dp3 oT2.z, r1, c6
dp3 oT2.y, r1, c5
dp3 oT2.x, r1, c4
mov oT3.xyz, c14
mad oT0.xy, v2, c16, c16.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Matrix 48 [_LightMatrix0]
Vector 128 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedhapmobddegcdhdjhfjpilaanaedhbpadabaaaaaaceaiaaaaaeaaaaaa
daaaaaaalaacaaaakeagaaaagmahaaaaebgpgodjhiacaaaahiacaaaaaaacpopp
pmabaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaabaaahaaaaaaaaaaadaaaaaaaeaaaiaaaaaaaaaaadaaamaaaeaaamaa
aaaaaaaaadaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbbaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaaciaacaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoeja
afaaoekaafaaookaafaaaaadaaaaapiaaaaaffjaajaaoekaaeaaaaaeaaaaapia
aiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
agaaaakaafaaaaadabaaaiiaabaaaaiabbaaaakaafaaaaadabaaafiaaaaapeia
bbaaaakaacaaaaadabaaadoaabaakkiaabaaomiaafaaaaadabaaahiaacaaoeja
baaappkaafaaaaadacaaahiaabaaffiaanaaoekaaeaaaaaeabaaaliaamaakeka
abaaaaiaacaakeiaaeaaaaaeacaaahoaaoaaoekaabaakkiaabaapeiaafaaaaad
abaaapiaaaaaffjaanaaoekaaeaaaaaeabaaapiaamaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaapiaaoaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapiaapaaoeka
aaaappjaabaaoeiaafaaaaadacaaadiaabaaffiaacaaobkaaeaaaaaeabaaadia
abaaobkaabaaaaiaacaaoeiaaeaaaaaeabaaadiaadaaobkaabaakkiaabaaoeia
aeaaaaaeaaaaamoaaeaabekaabaappiaabaaeeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaamoaaaaaoeia
abaaaaacadaaahoaahaaoekappppaaaafdeieefcomadaaaaeaaaabaaplaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacadaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
anaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagbabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaai
dcaabaaaacaaaaaafgafbaaaabaaaaaaegiacaaaaaaaaaaaaeaaaaaadcaaaaak
dcaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaaabaaaaaaegaabaaa
acaaaaaadcaaaaakdcaabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaakgakbaaa
abaaaaaaegaabaaaabaaaaaadcaaaaakmccabaaaabaaaaaaagiecaaaaaaaaaaa
agaaaaaapgapbaaaabaaaaaaagaebaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaacaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaacaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R0.xy, R0, c[2].z;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.w, R1.w;
MOV result.color.w, c[2].x;
TEX R1.xyz, R0, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, R0.w, texture[2], 2D;
MUL R0.xyz, -R0, c[1].x;
ADD R1.xyz, -R1, c[2].y;
ADD R0.xyz, R0, c[2].y;
MAD R0.xyz, -R0, R1, c[2].y;
MUL R1.xyz, R1.w, fragment.texcoord[3];
MUL R0.xyz, R0, c[2].z;
DP3 R1.x, fragment.texcoord[2], R1;
MAX R1.x, R1, c[2];
MUL R0.xyz, R0, c[0];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 22 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
rcp r1.x, t1.w
mul r2.xy, t1, r1.x
dp3 r0.x, t4, t4
mov r1.xy, r0.x
mul r0.xy, r2, c2.x
texld r2, r1, s2
texld r0, r0, s1
texld r1, t0, s0
add r3.xyz, -r0, c2.y
mul r1.xyz, -r1, c1.x
add r1.xyz, r1, c2.y
dp3_pp r0.x, t3, t3
mad r1.xyz, -r1, r3, c2.y
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t3
dp3_pp r0.x, t2, r0
mul r1.xyz, r1, c2.x
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c2.z
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.x
mov_pp r0.w, c2.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_ParallaxSpec] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedojbfkkofcpjldhbgnnjijldpophmimkjabaaaaaagmagaaaaaeaaaaaa
daaaaaaafeacaaaaiaafaaaadiagaaaaebgpgodjbmacaaaabmacaaaaaaacpppp
neabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkaagaaaaac
aaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoelaacaaaaadaaaaadia
aaaaoeiaaaaaoeiaaiaaaaadabaaaiiaaeaaoelaaeaaoelaabaaaaacabaaadia
abaappiaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaadacaaapiaaaaaoela
acaioekaecaaaaadabaacpiaabaaoeiaaaaioekaacaaaaadaaaaahiaaaaaoeib
acaaaakaabaaaaacaaaaaiiaacaaaakaaeaaaaaeabaaaoiaacaabliaabaaaakb
aaaappiaaeaaaaaeaaaaahiaabaabliaaaaaoeibacaaaakaacaaaaadaaaachia
aaaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaceaaaaacacaachia
adaaoelaaiaaaaadaaaaciiaacaaoelaacaaoeiaafaaaaadabaacbiaabaaaaia
aaaappiafiaaaaaeaaaaciiaaaaappiaabaaaaiaacaaffkaacaaaaadaaaaciia
aaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaacaaaaaiia
acaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcceadaaaaeaaaaaaa
mjaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaa
gcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaa
afaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaalhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaa
aaaaaaaaahaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaan
hcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hcaabaaaabaaaaaapgapbaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahicaabaaa
aaaaaaaaegbcbaaaadaaaaaaegacbaaaabaaaaaadeaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaaagaabaaaabaaaaaa
eghobaaaacaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaa
aaaaaaaaagaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[2].z;
MOV result.color.w, c[2].x;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, R1, texture[1], 2D;
MUL R0.xyz, -R0, c[1].x;
ADD R1.xyz, -R1, c[2].y;
ADD R0.xyz, R0, c[2].y;
MAD R0.xyz, -R0, R1, c[2].y;
MOV R1.xyz, fragment.texcoord[3];
MUL R0.xyz, R0, c[2].z;
DP3 R0.w, fragment.texcoord[2], R1;
MUL R0.xyz, R0, c[0];
MAX R0.w, R0, c[2].x;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c2, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c2.x
mul r1.xyz, -r1, c1.x
add r1.xyz, r1, c2.y
texld r0, r0, s1
add r0.xyz, -r0, c2.y
mad r1.xyz, -r1, r0, c2.y
mov_pp r0.xyz, t3
dp3_pp r0.x, t2, r0
mul r1.xyz, r1, c2.x
mul_pp r1.xyz, r1, c0
max_pp r0.x, r0, c2.z
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.x
mov_pp r0.w, c2.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedifepnckdmmogcbofpidgmhmaeoomacdoabaaaaaaeeafaaaaaeaaaaaa
daaaaaaapiabaaaahaaeaaaabaafaaaaebgpgodjmaabaaaamaabaaaaaaacpppp
hmabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaaaacpppp
fbaaaaafacaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaia
aaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
agaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoelaacaaaaad
aaaaadiaaaaaoeiaaaaaoeiaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaad
abaaapiaaaaaoelaabaioekaacaaaaadaaaaahiaaaaaoeibacaaaakaabaaaaac
aaaaaiiaacaaaakaaeaaaaaeabaaahiaabaaoeiaabaaaakbaaaappiaaeaaaaae
aaaaahiaabaaoeiaaaaaoeibacaaaakaacaaaaadaaaachiaaaaaoeiaaaaaoeia
afaaaaadaaaachiaaaaaoeiaaaaaoekaabaaaaacabaaahiaacaaoelaaiaaaaad
aaaaciiaabaaoeiaadaaoelaalaaaaadabaacbiaaaaappiaacaaffkaacaaaaad
aaaaciiaabaaaaiaabaaaaiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaac
aaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefchaacaaaa
eaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
lcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaa
aaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaaa
aaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaa
aeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
aaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaah
hccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaa
iaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapalaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
RCP R0.z, fragment.texcoord[4].w;
MAD R2.xy, fragment.texcoord[4], R0.z, c[2].w;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R0.xy, R0, c[2].z;
DP3 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[2].x;
TEX R1.xyz, R0, texture[1], 2D;
TEX R0.w, R2, texture[2], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, R1.w, texture[3], 2D;
MUL R0.xyz, -R0, c[1].x;
ADD R1.xyz, -R1, c[2].y;
ADD R0.xyz, R0, c[2].y;
MAD R0.xyz, -R0, R1, c[2].y;
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
RSQ R1.x, R2.x;
MUL R1.xyz, R1.x, fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[2], R1;
SLT R1.y, c[2].x, fragment.texcoord[4].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R0, c[2].z;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 28 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
SetTexture 3 [_LightTextureB0] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 2.00000000, 1.00000000, 0.50000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c2.x
dp3 r2.x, t4, t4
rcp r1.x, t4.w
mad r1.xy, t4, r1.x, c2.z
mov r2.xy, r2.x
texld r3, r1, s2
texld r0, r0, s1
texld r2, r2, s3
texld r1, t0, s0
mul r1.xyz, -r1, c1.x
add r1.xyz, r1, c2.y
add r0.xyz, -r0, c2.y
mad r0.xyz, -r1, r0, c2.y
mul r0.xyz, r0, c2.x
mul_pp r3.xyz, r0, c0
dp3_pp r0.x, t3, t3
rsq_pp r1.x, r0.x
mul_pp r1.xyz, r1.x, t3
dp3_pp r1.x, t2, r1
cmp r0.x, -t4.z, c2.w, c2.y
mul_pp r0.x, r0, r3.w
mul_pp r0.x, r0, r2
max_pp r1.x, r1, c2.w
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r3
mul_pp r0.xyz, r0, c2.x
mov_pp r0.w, c2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_ParallaxSpec] 2D 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_LightTexture0] 2D 0
SetTexture 3 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkdhikeahegdckmpoghjmojkkbnjigbdcabaaaaaamaahaaaaaeaaaaaa
daaaaaaaleacaaaaneagaaaaimahaaaaebgpgodjhmacaaaahmacaaaaaaacpppp
daacaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaacaaaaaa
adababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaaadpaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaaplabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajaadaiapkaagaaaaacaaaaaiiaaeaapplaaeaaaaaeaaaaadia
aeaaoelaaaaappiaacaaffkaaiaaaaadabaaaiiaaeaaoelaaeaaoelaabaaaaac
abaaadiaabaappiaagaaaaacaaaaaeiaabaapplaafaaaaadaaaaamiaaaaakkia
abaabllaacaaaaadacaaadiaaaaabliaaaaabliaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadabaacpiaabaaoeiaabaioekaecaaaaadacaaapiaacaaoeia
acaioekaecaaaaadadaaapiaaaaaoelaadaioekaafaaaaadacaaciiaaaaappia
abaaaaiafiaaaaaeacaaciiaaeaakklbacaakkkaacaappiaceaaaaacaaaachia
adaaoelaaiaaaaadadaaciiaacaaoelaaaaaoeiaalaaaaadaaaacbiaadaappia
acaakkkaafaaaaadacaaciiaacaappiaaaaaaaiaacaaaaadacaaciiaacaappia
acaappiaacaaaaadaaaaahiaacaaoeibacaaaakaabaaaaacaaaaaiiaacaaaaka
aeaaaaaeabaaahiaadaaoeiaabaaaakbaaaappiaaeaaaaaeaaaaahiaabaaoeia
aaaaoeibacaaaakaacaaaaadaaaachiaaaaaoeiaaaaaoeiaafaaaaadaaaachia
aaaaoeiaaaaaoekaafaaaaadaaaachiaacaappiaaaaaoeiaabaaaaacaaaaaiia
acaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcbiaeaaaaeaaaaaaa
agabaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadbaaaaah
bcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaa
afaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaa
eghobaaaadaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaa
egbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaa
aaaaaaaaagaabaaaaaaaaaaaaoaaaaahgcaabaaaaaaaaaaaagbbbaaaacaaaaaa
pgbpbaaaacaaaaaaaaaaaaahgcaabaaaaaaaaaaafgagbaaaaaaaaaaafgagbaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaacaaaaaaaaaaaaalocaabaaaaaaaaaaaagajbaiaebaaaaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaiadpaaaaiadpaaaaiadpefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaadaaaaaadcaaaaaohcaabaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanocaabaaaaaaaaaaaagajbaia
ebaaaaaaabaaaaaafgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaafgaobaaaaaaaaaaa
diaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaa
diaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.w, fragment.texcoord[4], texture[3], CUBE;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R0.xy, R0, c[2].z;
DP3 R0.w, fragment.texcoord[4], fragment.texcoord[4];
DP3 R2.x, fragment.texcoord[3], fragment.texcoord[3];
MOV result.color.w, c[2].x;
TEX R1.xyz, R0, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R0.w, R0.w, texture[2], 2D;
MUL R0.xyz, -R0, c[1].x;
ADD R1.xyz, -R1, c[2].y;
ADD R0.xyz, R0, c[2].y;
MAD R0.xyz, -R0, R1, c[2].y;
RSQ R1.x, R2.x;
MUL R1.xyz, R1.x, fragment.texcoord[3];
DP3 R1.x, fragment.texcoord[2], R1;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R0, c[2].z;
MAX R0.w, R1.x, c[2].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 24 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
SetTexture 3 [_LightTexture0] CUBE 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_cube s3
def c2, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r3, t0, s0
rcp r0.x, t1.w
mul r1.xy, t1, r0.x
dp3 r0.x, t4, t4
mov r2.xy, r0.x
mul r1.xy, r1, c2.x
texld r0, t4, s3
texld r2, r2, s2
texld r1, r1, s1
mul r0.xyz, -r3, c1.x
add r1.xyz, -r1, c2.y
add r0.xyz, r0, c2.y
mad r0.xyz, -r0, r1, c2.y
mul r1.xyz, r0, c2.x
dp3_pp r0.x, t3, t3
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t3
dp3_pp r0.x, t2, r0
mul r2.x, r2, r0.w
max_pp r0.x, r0, c2.z
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.x
mov_pp r0.w, c2.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_ParallaxSpec] 2D 3
SetTexture 1 [_MainTex] 2D 2
SetTexture 2 [_LightTextureB0] 2D 1
SetTexture 3 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedclkimlkefnbajifagnipanapodfmpcomabaaaaaapeagaaaaaeaaaaaa
daaaaaaaiaacaaaaaiagaaaamaagaaaaebgpgodjeiacaaaaeiacaaaaaaacpppp
pmabaaaaemaaaaaaacaadeaaaaaaemaaaaaaemaaaeaaceaaaaaaemaaadaaaaaa
acababaaabacacaaaaadadaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaa
aaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaiaaeaaahlabpaaaaac
aaaaaajiaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapka
bpaaaaacaaaaaajaadaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadia
aaaappiaabaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaaiaaaaadabaaaiia
aeaaoelaaeaaoelaabaaaaacabaaadiaabaappiaecaaaaadaaaaapiaaaaaoeia
acaioekaecaaaaadacaaapiaaaaaoelaadaioekaecaaaaadabaaapiaabaaoeia
abaioekaecaaaaadadaaapiaaeaaoelaaaaioekaacaaaaadaaaaahiaaaaaoeib
acaaaakaabaaaaacaaaaaiiaacaaaakaaeaaaaaeabaaaoiaacaabliaabaaaakb
aaaappiaaeaaaaaeaaaaahiaabaabliaaaaaoeibacaaaakaacaaaaadaaaachia
aaaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaafaaaaadaaaaciia
abaaaaiaadaappiaceaaaaacabaachiaadaaoelaaiaaaaadabaacbiaacaaoela
abaaoeiaalaaaaadacaacbiaabaaaaiaacaaffkaafaaaaadaaaaciiaaaaappia
acaaaaiaacaaaaadaaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappia
aaaaoeiaabaaaaacaaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefciaadaaaaeaaaaaaaoaaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fidaaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
lcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaadaaaaaa
aagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
acaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
aoaaaaahgcaabaaaaaaaaaaaagbbbaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaah
gcaabaaaaaaaaaaafgagbaaaaaaaaaaafgagbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaajgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaal
ocaabaaaaaaaaaaaagajbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaaaaaaiadp
aaaaiadpaaaaiadpefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaadaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaagiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaadcaaaaanocaabaaaaaaaaaaaagajbaiaebaaaaaaabaaaaaafgaobaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaahocaabaaa
aaaaaaaafgaobaaaaaaaaaaafgaobaaaaaaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
TEX R0.w, fragment.texcoord[4], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R0.xy, R0, c[2].z;
MOV result.color.w, c[2].x;
TEX R1.xyz, R0, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, -R0, c[1].x;
ADD R1.xyz, -R1, c[2].y;
ADD R0.xyz, R0, c[2].y;
MAD R0.xyz, -R0, R1, c[2].y;
MOV R1.xyz, fragment.texcoord[3];
MUL R0.xyz, R0, c[2].z;
DP3 R1.x, fragment.texcoord[2], R1;
MAX R1.x, R1, c[2];
MUL R0.xyz, R0, c[0];
MUL R0.w, R1.x, R0;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[2].z;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c2, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2.xyz
dcl t3.xyz
dcl t4.xy
texld r2, t4, s2
texld r1, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c2.x
mul r1.xyz, -r1, c1.x
add r1.xyz, r1, c2.y
texld r0, r0, s1
add r0.xyz, -r0, c2.y
mad r0.xyz, -r1, r0, c2.y
mul r1.xyz, r0, c2.x
mov_pp r0.xyz, t3
dp3_pp r0.x, t2, r0
max_pp r0.x, r0, c2.z
mul_pp r1.xyz, r1, c0
mul_pp r0.x, r0, r2.w
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c2.x
mov_pp r0.w, c2.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_ParallaxSpec] 2D 2
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Float 112 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedkodapbpddloilaiaildogbebbjapnmboabaaaaaaoiafaaaaaeaaaaaa
daaaaaaadiacaaaapmaeaaaaleafaaaaebgpgodjaaacaaaaaaacaaaaaaacpppp
liabaaaaeiaaaaaaacaadaaaaaaaeiaaaaaaeiaaadaaceaaaaaaeiaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaaaahaaabaaabaaaaaaaaaa
aaacppppfbaaaaafacaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaac
aaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachla
bpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaabaapplaafaaaaad
aaaaadiaaaaappiaabaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaabaaaaac
abaaadiaaaaabllaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaadacaaapia
aaaaoelaacaioekaecaaaaadabaacpiaabaaoeiaaaaioekaacaaaaadaaaaahia
aaaaoeibacaaaakaabaaaaacaaaaaiiaacaaaakaaeaaaaaeabaaahiaacaaoeia
abaaaakbaaaappiaaeaaaaaeaaaaahiaabaaoeiaaaaaoeibacaaaakaacaaaaad
aaaachiaaaaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaaaaoekaabaaaaac
abaaahiaacaaoelaaiaaaaadaaaaciiaabaaoeiaadaaoelaafaaaaadabaacbia
abaappiaaaaappiafiaaaaaeaaaaciiaaaaappiaabaaaaiaacaaffkaacaaaaad
aaaaciiaaaaappiaaaaappiaafaaaaadaaaachiaaaaappiaaaaaoeiaabaaaaac
aaaaaiiaacaaffkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefclmacaaaa
eaaaaaaakpaaaaaafjaaaaaeegiocaaaaaaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaa
abaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaad
hcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaalhcaabaaa
aaaaaaaaegacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaacaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaa
agiacaaaaaaaaaaaahaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
dcaaaaanhcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaaaaaaaaaabaaaaaabaaaaaahicaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaaeaaaaaadeaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaapgapbaaaaaaaaaaa
pgapbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaapgapbaaaaaaaaaaaegacbaaa
aaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
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
Vector 9 [_ProjectionParams]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..18] };
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
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[9].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
ADD result.texcoord[3].xyz, R3, R2;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 30 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
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
Vector 18 [_ParallaxSpec_ST]
"vs_2_0
def c19, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c19.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c19.x
dp4 r1.z, v0, c2
mul r0.y, r0, c8.x
mad r0.xy, r0.z, c9.zwzw, r0
mov r0.zw, r1
add oT3.xyz, r3, r2
mov oT1, r0
mov oT2, r0
mov oPos, r1
mad oT0.xy, v2, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 64 [_ParallaxSpec_ST]
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
eefiecedanmojpcjcgdokhbpggddcpfmciamnpckabaaaaaaimaiaaaaaeaaaaaa
daaaaaaanmacaaaaceahaaaaomahaaaaebgpgodjkeacaaaakeacaaaaaaacpopp
deacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejabbaappkaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
aaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabcaaffkaajaaaaadabaaabiaadaaoekaaaaaoeia
ajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeia
ajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffia
aeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaajaaoeka
aaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapia
akaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaammaabaaoeia
afaaaaadaaaaaciaaaaaffiaacaaaakaafaaaaadaaaaafiaaaaapeiabcaaaaka
afaaaaadaaaaaiiaaaaaffiabcaaaakaacaaaaadabaaadiaaaaakkiaaaaaomia
abaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaafdeieefc
eaaeaaaaeaaaabaabaabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..16] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[8];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[7];
MUL R0.y, R0, c[13].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
ADD R0.xyz, R0, -c[14];
MUL result.texcoord[4].xyz, R0, c[14].w;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 22 instructions, 2 R-regs
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
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r1.w, v0, c7
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul r0.xyz, r1.xyww, c17.x
dp4 r1.z, v0, c6
mul r0.y, r0, c12.x
mad r0.xy, r0.z, c13.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT2, r0
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
add r0.xyz, r0, -c14
mul oT4.xyz, r0, c14.w
mov r0.x, c14.w
add r0.y, c17, -r0.x
dp4 r0.x, v0, c2
mov oPos, r1
mad oT0.xy, v1, c16, c16.zwzw
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
ConstBuffer "$Globals" 128
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
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
eefiecedloijchfpmhgooopbppefekomdlgfkpbjabaaaaaagmaiaaaaaeaaaaaa
daaaaaaalmacaaaaomagaaaaleahaaaaebgpgodjieacaaaaieacaaaaaaacpopp
caacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaahiaaaaaffjaaoaaoekaaeaaaaaeaaaaahiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiabaaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeiaaeaaoekb
afaaaaadadaaahoaaaaaoeiaaeaappkaafaaaaadaaaaabiaaaaaffjaakaakkka
aeaaaaaeaaaaabiaajaakkkaaaaaaajaaaaaaaiaaeaaaaaeaaaaabiaalaakkka
aaaakkjaaaaaaaiaaeaaaaaeaaaaabiaamaakkkaaaaappjaaaaaaaiaabaaaaac
aaaaaiiaaeaappkaacaaaaadaaaaaciaaaaappibbbaaffkaafaaaaadadaaaioa
aaaaffiaaaaaaaibafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapia
afaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaammaabaaoeia
afaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeiabbaaaaka
afaaaaadaaaaaiiaaaaaffiabbaaaakaacaaaaadabaaadiaaaaakkiaaaaaomia
abaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaafdeieefc
ciaeaaaaeaaaabaaakabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaae
egiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaa
aaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaadaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaa
abeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
Vector 7 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[8] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..7] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[5].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 13 instructions, 2 R-regs
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
Vector 7 [_ParallaxSpec_ST]
"vs_2_0
def c8, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c8.x
dp4 r1.z, v0, c2
mul r0.y, r0, c4.x
mad r0.xy, r0.z, c5.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT2, r0
mov oPos, r1
mad oT0.xy, v1, c7, c7.zwzw
mad oT3.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 128
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedmiacdkldlfocmpbdadbgkkomkolgpoonabaaaaaaieafaaaaaeaaaaaa
daaaaaaamaabaaaabmaeaaaaoeaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpopp
dmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaamma
abaaoeiaafaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeia
aiaaaakaafaaaaadaaaaaiiaaaaaffiaaiaaaakaacaaaaadabaaadiaaaaakkia
aaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaa
fdeieefcfeacaaaaeaaaabaajfaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
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
Vector 18 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 1 },
		state.matrix.mvp,
		program.local[5..18] };
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
MAD R0.x, R0, R0, -R0.y;
ADD R3.xyz, R2, R3;
MUL R2.xyz, R0.x, c[16];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[9].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
ADD result.texcoord[3].xyz, R3, R2;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 30 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
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
Vector 18 [_ParallaxSpec_ST]
"vs_2_0
def c19, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
mul r1.xyz, v1, c17.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c19.y
dp4 r2.z, r0, c12
dp4 r2.y, r0, c11
dp4 r2.x, r0, c10
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c15
dp4 r3.y, r1, c14
dp4 r3.x, r1, c13
dp4 r1.w, v0, c3
mad r0.x, r0, r0, -r0.y
add r3.xyz, r2, r3
mul r2.xyz, r0.x, c16
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c19.x
dp4 r1.z, v0, c2
mul r0.y, r0, c8.x
mad r0.xy, r0.z, c9.zwzw, r0
mov r0.zw, r1
add oT3.xyz, r3, r2
mov oT1, r0
mov oT2, r0
mov oPos, r1
mad oT0.xy, v2, c18, c18.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 64 [_ParallaxSpec_ST]
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
eefiecedanmojpcjcgdokhbpggddcpfmciamnpckabaaaaaaimaiaaaaaeaaaaaa
daaaaaaanmacaaaaceahaaaaomahaaaaebgpgodjkeacaaaakeacaaaaaaacpopp
deacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaafaaabaaacaaaaaaaaaaacaacgaaahaaadaaaaaaaaaa
adaaaaaaaeaaakaaaaaaaaaaadaaamaaadaaaoaaaaaaaaaaadaabeaaabaabbaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbcaaapkaaaaaaadpaaaaiadpaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejabbaappkaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
aaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiabaaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabcaaffkaajaaaaadabaaabiaadaaoekaaaaaoeia
ajaaaaadabaaaciaaeaaoekaaaaaoeiaajaaaaadabaaaeiaafaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaagaaoekaacaaoeia
ajaaaaadadaaaciaahaaoekaacaaoeiaajaaaaadadaaaeiaaiaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaciaaaaaffiaaaaaffia
aeaaaaaeaaaaabiaaaaaaaiaaaaaaaiaaaaaffibaeaaaaaeadaaahoaajaaoeka
aaaaaaiaabaaoeiaafaaaaadaaaaapiaaaaaffjaalaaoekaaeaaaaaeaaaaapia
akaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaammaabaaoeia
afaaaaadaaaaaciaaaaaffiaacaaaakaafaaaaadaaaaafiaaaaapeiabcaaaaka
afaaaaadaaaaaiiaaaaaffiabcaaaakaacaaaaadabaaadiaaaaakkiaaaaaomia
abaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaafdeieefc
eaaeaaaaeaaaabaabaabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
aaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaa
aaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaa
egadbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaa
aeaaaaaaegiccaaaacaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
doaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaa
apaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
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
Vector 16 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[17] = { { 0.5, 1 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..16] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[8];
DP4 R1.x, vertex.position, c[5];
DP4 R1.y, vertex.position, c[6];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[7];
MUL R0.y, R0, c[13].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
DP4 R0.z, vertex.position, c[11];
DP4 R0.x, vertex.position, c[9];
DP4 R0.y, vertex.position, c[10];
ADD R0.xyz, R0, -c[14];
MUL result.texcoord[4].xyz, R0, c[14].w;
MOV R0.x, c[0].y;
ADD R0.y, R0.x, -c[14].w;
DP4 R0.x, vertex.position, c[3];
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[15], c[15].zwzw;
MUL result.texcoord[4].w, -R0.x, R0.y;
END
# 22 instructions, 2 R-regs
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
Vector 16 [_ParallaxSpec_ST]
"vs_2_0
def c17, 0.50000000, 1.00000000, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r1.w, v0, c7
dp4 r1.x, v0, c4
dp4 r1.y, v0, c5
mul r0.xyz, r1.xyww, c17.x
dp4 r1.z, v0, c6
mul r0.y, r0, c12.x
mad r0.xy, r0.z, c13.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT2, r0
dp4 r0.z, v0, c10
dp4 r0.x, v0, c8
dp4 r0.y, v0, c9
add r0.xyz, r0, -c14
mul oT4.xyz, r0, c14.w
mov r0.x, c14.w
add r0.y, c17, -r0.x
dp4 r0.x, v0, c2
mov oPos, r1
mad oT0.xy, v1, c16, c16.zwzw
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
ConstBuffer "$Globals" 128
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
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
eefiecedloijchfpmhgooopbppefekomdlgfkpbjabaaaaaagmaiaaaaaeaaaaaa
daaaaaaalmacaaaaomagaaaaleahaaaaebgpgodjieacaaaaieacaaaaaaacpopp
caacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaabjaaabaaaeaaaaaaaaaa
adaaaaaaaiaaafaaaaaaaaaaadaaamaaaeaaanaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaaadpaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoaaeaabejaabaabeka
abaalekaafaaaaadaaaaahiaaaaaffjaaoaaoekaaeaaaaaeaaaaahiaanaaoeka
aaaaaajaaaaaoeiaaeaaaaaeaaaaahiaapaaoekaaaaakkjaaaaaoeiaaeaaaaae
aaaaahiabaaaoekaaaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeiaaeaaoekb
afaaaaadadaaahoaaaaaoeiaaeaappkaafaaaaadaaaaabiaaaaaffjaakaakkka
aeaaaaaeaaaaabiaajaakkkaaaaaaajaaaaaaaiaaeaaaaaeaaaaabiaalaakkka
aaaakkjaaaaaaaiaaeaaaaaeaaaaabiaamaakkkaaaaappjaaaaaaaiaabaaaaac
aaaaaiiaaeaappkaacaaaaadaaaaaciaaaaappibbbaaffkaafaaaaadadaaaioa
aaaaffiaaaaaaaibafaaaaadaaaaapiaaaaaffjaagaaoekaaeaaaaaeaaaaapia
afaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaaiaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaammaabaaoeia
afaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeiabbaaaaka
afaaaaadaaaaaiiaaaaaffiabbaaaakaacaaaaadabaaadiaaaaakkiaaaaaomia
abaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaafdeieefc
ciaeaaaaeaaaabaaakabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabkaaaaaafjaaaaae
egiocaaaadaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaadpccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaal
mccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaa
aaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaaaaaaaaaaakiacaaa
abaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaakgakbaaaabaaaaaa
mgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaadaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
adaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaadaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegiccaia
ebaaaaaaacaaaaaabjaaaaaadiaaaaaihccabaaaaeaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabjaaaaaadiaaaaaibcaabaaaaaaaaaaabkbabaaaaaaaaaaa
ckiacaaaadaaaaaaafaaaaaadcaaaaakbcaabaaaaaaaaaaackiacaaaadaaaaaa
aeaaaaaaakbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
ckiacaaaadaaaaaaagaaaaaackbabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
bcaabaaaaaaaaaaackiacaaaadaaaaaaahaaaaaadkbabaaaaaaaaaaaakaabaaa
aaaaaaaaaaaaaaajccaabaaaaaaaaaaadkiacaiaebaaaaaaacaaaaaabjaaaaaa
abeaaaaaaaaaiadpdiaaaaaiiccabaaaaeaaaaaabkaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheolaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaakeaaaaaa
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 5 [_ProjectionParams]
Vector 6 [unity_LightmapST]
Vector 7 [_ParallaxSpec_ST]
"!!ARBvp1.0
PARAM c[8] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..7] };
TEMP R0;
TEMP R1;
DP4 R1.w, vertex.position, c[4];
DP4 R1.x, vertex.position, c[1];
DP4 R1.y, vertex.position, c[2];
MUL R0.xyz, R1.xyww, c[0].x;
DP4 R1.z, vertex.position, c[3];
MUL R0.y, R0, c[5].x;
ADD R0.xy, R0, R0.z;
MOV R0.zw, R1;
MOV result.texcoord[1], R0;
MOV result.texcoord[2], R0;
MOV result.position, R1;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[7], c[7].zwzw;
MAD result.texcoord[3].xy, vertex.texcoord[1], c[6], c[6].zwzw;
END
# 13 instructions, 2 R-regs
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
Vector 7 [_ParallaxSpec_ST]
"vs_2_0
def c8, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r1.w, v0, c3
dp4 r1.x, v0, c0
dp4 r1.y, v0, c1
mul r0.xyz, r1.xyww, c8.x
dp4 r1.z, v0, c2
mul r0.y, r0, c4.x
mad r0.xy, r0.z, c5.zwzw, r0
mov r0.zw, r1
mov oT1, r0
mov oT2, r0
mov oPos, r1
mad oT0.xy, v1, c7, c7.zwzw
mad oT3.xy, v2, c6, c6.zwzw
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 128
Vector 64 [unity_LightmapST]
Vector 80 [_ParallaxSpec_ST]
ConstBuffer "UnityPerCamera" 128
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedmiacdkldlfocmpbdadbgkkomkolgpoonabaaaaaaieafaaaaaeaaaaaa
daaaaaaamaabaaaabmaeaaaaoeaeaaaaebgpgodjiiabaaaaiiabaaaaaaacpopp
dmabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaaeaa
acaaabaaaaaaaaaaabaaafaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafaiaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeia
aeaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaookaaeaaaaaeaaaaamoa
aeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffjaafaaoekaaeaaaaae
aaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacabaaamiaaaaaoeiaabaaaaacaaaaamma
abaaoeiaafaaaaadaaaaaciaaaaaffiaadaaaakaafaaaaadaaaaafiaaaaapeia
aiaaaakaafaaaaadaaaaaiiaaaaaffiaaiaaaakaacaaaaadabaaadiaaaaakkia
aaaaomiaabaaaaacabaaapoaabaaoeiaabaaaaacacaaapoaabaaoeiappppaaaa
fdeieefcfeacaaaaeaaaabaajfaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaa
abaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaa
afaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaadiaaaaaibcaabaaaabaaaaaabkaabaaa
aaaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpdiaaaaakfcaabaaaabaaaaaaagadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaaaaaaaaahdcaabaaaaaaaaaaa
kgakbaaaabaaaaaamgaabaaaabaaaaaadgaaaaafpccabaaaacaaaaaaegaobaaa
aaaaaaaadgaaaaafpccabaaaadaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.xyz, fragment.texcoord[2], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[1].z;
MOV result.color.w, c[1].x;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, R1, texture[1], 2D;
MUL R0.xyz, -R0, c[0].x;
ADD R1.xyz, -R1, c[1].y;
ADD R0.xyz, R0, c[1].y;
MAD R0.xyz, -R0, R1, c[1].y;
LG2 R1.x, R2.x;
LG2 R1.z, R2.z;
LG2 R1.y, R2.y;
ADD R1.xyz, -R1, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].z;
MUL result.color.xyz, R0, R1;
END
# 17 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xyz
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r1, r0, s1
texldp r0, t2, s2
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, t3
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 96
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjjglaipjcdofeljeicaiojjlfancklchabaaaaaahiafaaaaaeaaaaaa
daaaaaaabaacaaaakeaeaaaaeeafaaaaebgpgodjniabaaaaniabaaaaaaacpppp
jmabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaja
acaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoela
acaaaaadaaaaadiaaaaaoeiaaaaaoeiaagaaaaacaaaaaeiaacaapplaafaaaaad
abaaadiaaaaakkiaacaaoelaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaad
acaaapiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaacaioekaacaaaaad
aaaaahiaaaaaoeibabaaaakaabaaaaacaaaaaiiaabaaaakaaeaaaaaeacaaahia
acaaoeiaaaaaaakbaaaappiaaeaaaaaeaaaaahiaacaaoeiaaaaaoeibabaaaaka
acaaaaadaaaachiaaaaaoeiaaaaaoeiaapaaaaacacaacbiaabaaaaiaapaaaaac
acaacciaabaaffiaapaaaaacacaaceiaabaakkiaacaaaaadabaachiaacaaoeib
adaaoelaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciiaabaaffka
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcimacaaaaeaaaaaaakdaaaaaa
fjaaaaaeegiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaa
acaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaaaaaaaalhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaaohcaabaaaabaaaaaa
egacbaiaebaaaaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaaaaaaaaaaegacbaiaebaaaaaa
abaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
aaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1, fragment.texcoord[3], texture[3], 2D;
TXP R4.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R1.xyz, R1.w, R1;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[2].z;
DP4 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[2].x;
TEX R0, fragment.texcoord[3], texture[4], 2D;
TEX R3.xyz, R2, texture[1], 2D;
TEX R2.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].w;
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[2].w, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R0.xyz, R0.w, R1, R0;
MUL R1.xyz, -R2, c[0].x;
ADD R2.xyz, -R3, c[2].y;
ADD R1.xyz, R1, c[2].y;
MAD R1.xyz, -R1, R2, c[2].y;
LG2 R2.x, R4.x;
LG2 R2.y, R4.y;
LG2 R2.z, R4.z;
ADD R2.xyz, -R2, R0;
MUL R0.xyz, R1, c[2].z;
MUL result.color.xyz, R0, R2;
END
# 28 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c2, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xy
dcl t4
texldp r4, t2, s2
texld r1, t3, s4
texld r3, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r2.xy, r0, c2.x
mul r3.xyz, -r3, c0.x
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c2.z
add r3.xyz, r3, c2.y
texld r0, t3, s3
texld r2, r2, s1
add r2.xyz, -r2, c2.y
mad r2.xyz, -r3, r2, c2.y
mul_pp r3.xyz, r0.w, r0
dp4 r0.x, t4, t4
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r3.xyz, r3, c2.z, -r1
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r3, r1
log_pp r1.x, r4.x
log_pp r1.y, r4.y
log_pp r1.z, r4.z
add_pp r0.xyz, -r1, r0
mul r1.xyz, r2, c2.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 128
Float 48 [_specOpac]
Vector 96 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedmjkffpbdcbfalakdmjjlkpnldeacnbmbabaaaaaaaeaiaaaaaeaaaaaa
daaaaaaapmacaaaabiahaaaanaahaaaaebgpgodjmeacaaaameacaaaaaaacpppp
heacaaaafaaaaaaaacaadiaaaaaafaaaaaaafaaaafaaceaaaaaafaaaabaaaaaa
aaababaaacacacaaadadadaaaeaeaeaaaaaaadaaabaaaaaaaaaaaaaaaaaaagaa
abaaabaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaaaebaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkabpaaaaacaaaaaajaaeaiapkaajaaaaadaaaaaiiaadaaoelaadaaoela
ahaaaaacaaaaabiaaaaappiaagaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaadbia
aaaaaaiaabaakkkaabaappkaabaaaaacabaaadiaaaaabllaagaaaaacaaaaacia
acaapplaafaaaaadacaaadiaaaaaffiaacaaoelaagaaaaacaaaaaciaabaappla
afaaaaadaaaaagiaaaaaffiaabaanclaacaaaaadadaaadiaaaaamjiaaaaamjia
ecaaaaadaeaacpiaabaaoeiaaeaioekaecaaaaadabaacpiaabaaoeiaadaioeka
ecaaaaadacaacpiaacaaoeiaacaioekaecaaaaadadaaapiaadaaoeiaaaaioeka
ecaaaaadafaaapiaaaaaoelaabaioekaafaaaaadacaaciiaaeaappiaacaaffka
afaaaaadaaaacoiaaeaabliaacaappiaafaaaaadabaaciiaabaappiaacaaffka
aeaaaaaeabaachiaabaappiaabaaoeiaaaaablibaeaaaaaeaaaachiaaaaaaaia
abaaoeiaaaaabliaapaaaaacabaacbiaacaaaaiaapaaaaacabaacciaacaaffia
apaaaaacabaaceiaacaakkiaacaaaaadaaaachiaaaaaoeiaabaaoeibacaaaaad
abaaahiaadaaoeibacaaaakaabaaaaacaaaaaiiaacaaaakaaeaaaaaeacaaahia
afaaoeiaaaaaaakbaaaappiaaeaaaaaeabaaahiaacaaoeiaabaaoeibacaaaaka
acaaaaadabaachiaabaaoeiaabaaoeiaafaaaaadaaaachiaaaaaoeiaabaaoeia
abaaaaacaaaaciiaacaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
beaeaaaaeaaaaaaaafabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaa
aeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadlcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaahbcaabaaa
aaaaaaaaegbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaa
aaaaaaaaagaaaaaadkiacaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaabaaaaaa
ogbkbaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaa
abaaaaaaegacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaa
aaaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaah
dcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaacpaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaiaebaaaaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaa
acaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaabaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaabaaaaaaegacbaiaebaaaaaa
abaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaao
hcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaaabaaaaaa
egacbaiaebaaaaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapalaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[1].z;
MUL R1.xyz, -R1, c[0].x;
ADD R1.xyz, R1, c[1].y;
MOV result.color.w, c[1].x;
TEX R0, fragment.texcoord[3], texture[3], 2D;
TEX R2.xyz, R2, texture[1], 2D;
ADD R2.xyz, -R2, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MUL R0.xyz, R0.w, R0;
LG2 R2.x, R3.x;
LG2 R2.z, R3.z;
LG2 R2.y, R3.y;
MAD R0.xyz, R0, c[1].w, -R2;
MUL R1.xyz, R1, c[1].z;
MUL result.color.xyz, R1, R0;
END
# 19 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xy
texldp r3, t2, s2
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t3, s3
texld r1, r1, s1
mul_pp r0.xyz, r0.w, r0
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
log_pp r2.x, r3.x
log_pp r2.z, r3.z
log_pp r2.y, r3.y
mad_pp r0.xyz, r0, c1.z, -r2
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_OFF" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 128
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedffngejnkpmcknnddjimkbllpdklijmioabaaaaaabaagaaaaaeaaaaaa
daaaaaaaeeacaaaadmafaaaanmafaaaaebgpgodjamacaaaaamacaaaaaaacpppp
mmabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaabaaaaaa
aaababaaacacacaaadadadaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaabaaaaacaaaaadiaaaaabllaagaaaaacaaaaaeiaacaappla
afaaaaadabaaadiaaaaakkiaacaaoelaagaaaaacaaaaaeiaabaapplaafaaaaad
aaaaamiaaaaakkiaabaabllaacaaaaadacaaadiaaaaabliaaaaabliaecaaaaad
aaaacpiaaaaaoeiaadaioekaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaad
acaaapiaacaaoeiaaaaioekaecaaaaadadaaapiaaaaaoelaabaioekaafaaaaad
aaaaciiaaaaappiaabaaffkaapaaaaacaeaacbiaabaaaaiaapaaaaacaeaaccia
abaaffiaapaaaaacaeaaceiaabaakkiaaeaaaaaeaaaachiaaaaappiaaaaaoeia
aeaaoeibacaaaaadabaaahiaacaaoeibabaaaakaabaaaaacaaaaaiiaabaaaaka
aeaaaaaeacaaahiaadaaoeiaaaaaaakbaaaappiaaeaaaaaeabaaahiaacaaoeia
abaaoeibabaaaakaacaaaaadabaachiaabaaoeiaabaaoeiaafaaaaadaaaachia
aaaaoeiaabaaoeiaabaaaaacaaaaciiaabaakkkaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcpaacaaaaeaaaaaaalmaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaad
aagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaaaaaaaaa
egacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaa
aaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaan
hcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegacbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaa
pgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaacpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaaeb
dcaaaaakhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
jiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaimaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.xyz, fragment.texcoord[2], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R1.xy, R0, c[1].z;
MOV result.color.w, c[1].x;
TEX R0.xyz, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, R1, texture[1], 2D;
MUL R0.xyz, -R0, c[0].x;
ADD R1.xyz, -R1, c[1].y;
ADD R0.xyz, R0, c[1].y;
MAD R0.xyz, -R0, R1, c[1].y;
ADD R1.xyz, R2, fragment.texcoord[3];
MUL R0.xyz, R0, c[1].z;
MUL result.color.xyz, R0, R1;
END
# 14 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 2.00000000, 1.00000000, 0.00000000, 0
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xyz
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r1, r0, s1
texldp r0, t2, s2
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
add_pp r0.xyz, r0, t3
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1.z
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
ConstBuffer "$Globals" 96
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedcimihmacidnhjhkkjknmbacfidjmgdioabaaaaaadmafaaaaaeaaaaaa
daaaaaaaomabaaaagiaeaaaaaiafaaaaebgpgodjleabaaaaleabaaaaaaacpppp
hiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
aaababaaacacacaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaahla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaaja
acaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappiaabaaoela
acaaaaadaaaaadiaaaaaoeiaaaaaoeiaagaaaaacaaaaaeiaacaapplaafaaaaad
abaaadiaaaaakkiaacaaoelaecaaaaadaaaaapiaaaaaoeiaaaaioekaecaaaaad
acaaapiaaaaaoelaabaioekaecaaaaadabaacpiaabaaoeiaacaioekaacaaaaad
aaaaahiaaaaaoeibabaaaakaabaaaaacaaaaaiiaabaaaakaaeaaaaaeacaaahia
acaaoeiaaaaaaakbaaaappiaaeaaaaaeaaaaahiaacaaoeiaaaaaoeibabaaaaka
acaaaaadaaaachiaaaaaoeiaaaaaoeiaacaaaaadabaachiaabaaoeiaadaaoela
afaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaacaaaaciiaabaaffkaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcheacaaaaeaaaaaaajnaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaacaaaaaapgbpbaaaacaaaaaa
aaaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
aaaaaaalhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaaohcaabaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaadcaaaaanhcaabaaaaaaaaaaaegacbaiaebaaaaaaabaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaaaaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegbcbaaaaeaaaaaadiaaaaahhccabaaaaaaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaaaaadoaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaa
imaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"!!ARBfp1.0
PARAM c[3] = { program.local[0..1],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEX R1, fragment.texcoord[3], texture[3], 2D;
TXP R4.xyz, fragment.texcoord[2], texture[2], 2D;
MUL R1.xyz, R1.w, R1;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[2].z;
DP4 R1.w, fragment.texcoord[4], fragment.texcoord[4];
MOV result.color.w, c[2].x;
TEX R0, fragment.texcoord[3], texture[4], 2D;
TEX R3.xyz, R2, texture[1], 2D;
TEX R2.xyz, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, c[2].w;
RSQ R0.w, R1.w;
RCP R0.w, R0.w;
MAD R1.xyz, R1, c[2].w, -R0;
MAD_SAT R0.w, R0, c[1].z, c[1];
MAD R0.xyz, R0.w, R1, R0;
MUL R1.xyz, -R2, c[0].x;
ADD R2.xyz, -R3, c[2].y;
ADD R1.xyz, R1, c[2].y;
MAD R1.xyz, -R1, R2, c[2].y;
ADD R2.xyz, R4, R0;
MUL R0.xyz, R1, c[2].z;
MUL result.color.xyz, R0, R2;
END
# 25 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
Vector 1 [unity_LightmapFade]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c2, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xy
dcl t4
texldp r4, t2, s2
texld r1, t3, s4
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r0.xy, r0, c2.x
mul r2.xyz, -r2, c0.x
mul_pp r1.xyz, r1.w, r1
mul_pp r1.xyz, r1, c2.z
add r2.xyz, r2, c2.y
texld r3, r0, s1
texld r0, t3, s3
add r3.xyz, -r3, c2.y
mad r2.xyz, -r2, r3, c2.y
mul_pp r3.xyz, r0.w, r0
dp4 r0.x, t4, t4
rsq r0.x, r0.x
rcp r0.x, r0.x
mad_pp r3.xyz, r3, c2.z, -r1
mad_sat r0.x, r0, c1.z, c1.w
mad_pp r0.xyz, r0.x, r3, r1
add_pp r0.xyz, r4, r0
mul r1.xyz, r2, c2.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c2
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
SetTexture 4 [unity_LightmapInd] 2D 4
ConstBuffer "$Globals" 128
Float 48 [_specOpac]
Vector 96 [unity_LightmapFade]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedppbdpehggnjjacokcnnibljjagcgcnpcabaaaaaamiahaaaaaeaaaaaa
daaaaaaaniacaaaanmagaaaajeahaaaaebgpgodjkaacaaaakaacaaaaaaacpppp
faacaaaafaaaaaaaacaadiaaaaaafaaaaaaafaaaafaaceaaaaaafaaaabaaaaaa
aaababaaacacacaaadadadaaaeaeaeaaaaaaadaaabaaaaaaaaaaaaaaaaaaagaa
abaaabaaaaaaaaaaaaacppppfbaaaaafacaaapkaaaaaiadpaaaaaaebaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaac
aaaaaaiaacaaaplabpaaaaacaaaaaaiaadaaaplabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkabpaaaaacaaaaaajaaeaiapkaajaaaaadaaaaaiiaadaaoelaadaaoela
ahaaaaacaaaaabiaaaaappiaagaaaaacaaaaabiaaaaaaaiaaeaaaaaeaaaadbia
aaaaaaiaabaakkkaabaappkaabaaaaacabaaadiaaaaabllaagaaaaacaaaaacia
acaapplaafaaaaadacaaadiaaaaaffiaacaaoelaagaaaaacaaaaaciaabaappla
afaaaaadaaaaagiaaaaaffiaabaanclaacaaaaadadaaadiaaaaamjiaaaaamjia
ecaaaaadaeaacpiaabaaoeiaaeaioekaecaaaaadabaacpiaabaaoeiaadaioeka
ecaaaaadacaacpiaacaaoeiaacaioekaecaaaaadadaaapiaadaaoeiaaaaioeka
ecaaaaadafaaapiaaaaaoelaabaioekaafaaaaadacaaciiaaeaappiaacaaffka
afaaaaadaaaacoiaaeaabliaacaappiaafaaaaadabaaciiaabaappiaacaaffka
aeaaaaaeabaachiaabaappiaabaaoeiaaaaablibaeaaaaaeaaaachiaaaaaaaia
abaaoeiaaaaabliaacaaaaadaaaachiaaaaaoeiaacaaoeiaacaaaaadabaaahia
adaaoeibacaaaakaabaaaaacaaaaaiiaacaaaakaaeaaaaaeacaaahiaafaaoeia
aaaaaakbaaaappiaaeaaaaaeabaaahiaacaaoeiaabaaoeibacaaaakaacaaaaad
abaachiaabaaoeiaabaaoeiaafaaaaadaaaachiaaaaaoeiaabaaoeiaabaaaaac
aaaaciiaacaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcpmadaaaa
eaaaaaaappaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
lcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaadpcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabbaaaaahbcaabaaaaaaaaaaa
egbobaaaaeaaaaaaegbobaaaaeaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadccaaaalbcaabaaaaaaaaaaaakaabaaaaaaaaaaackiacaaaaaaaaaaa
agaaaaaadkiacaaaaaaaaaaaagaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaaaaaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaafgafbaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaaaebdcaaaaakhcaabaaaabaaaaaapgapbaaaabaaaaaa
egacbaaaabaaaaaajgahbaiaebaaaaaaaaaaaaaadcaaaaajhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaajgahbaaaaaaaaaaaaoaaaaahdcaabaaa
abaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaaefaaaaajpcaabaaaabaaaaaa
egaabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaaaoaaaaahdcaabaaaabaaaaaa
egbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaabaaaaaaegaabaaa
abaaaaaaegaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaaj
pcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaaohcaabaaaacaaaaaaegacbaiaebaaaaaaacaaaaaaagiacaaaaaaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaa
abaaaaaaegacbaiaebaaaaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaa
egacbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaabejfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapalaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 1, 2, 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.xyz, fragment.texcoord[0], texture[0], 2D;
TXP R3.xyz, fragment.texcoord[2], texture[2], 2D;
RCP R0.x, fragment.texcoord[1].w;
MUL R0.xy, fragment.texcoord[1], R0.x;
MUL R2.xy, R0, c[1].z;
MUL R1.xyz, -R1, c[0].x;
ADD R1.xyz, R1, c[1].y;
MOV result.color.w, c[1].x;
TEX R0, fragment.texcoord[3], texture[3], 2D;
TEX R2.xyz, R2, texture[1], 2D;
ADD R2.xyz, -R2, c[1].y;
MAD R1.xyz, -R1, R2, c[1].y;
MUL R0.xyz, R0.w, R0;
MAD R0.xyz, R0, c[1].w, R3;
MUL R1.xyz, R1, c[1].z;
MUL result.color.xyz, R1, R0;
END
# 16 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
Float 0 [_specOpac]
SetTexture 0 [_ParallaxSpec] 2D 0
SetTexture 1 [_MainTex] 2D 1
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c1, 2.00000000, 1.00000000, 8.00000000, 0.00000000
dcl t0.xy
dcl t1.xyzw
dcl t2
dcl t3.xy
texldp r3, t2, s2
texld r2, t0, s0
rcp r0.x, t1.w
mul r0.xy, t1, r0.x
mul r1.xy, r0, c1.x
mul r2.xyz, -r2, c0.x
add r2.xyz, r2, c1.y
texld r0, t3, s3
texld r1, r1, s1
mul_pp r0.xyz, r0.w, r0
add r1.xyz, -r1, c1.y
mad r1.xyz, -r2, r1, c1.y
mad_pp r0.xyz, r0, c1.z, r3
mul r1.xyz, r1, c1.x
mul_pp r0.xyz, r1, r0
mov_pp r0.w, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_ON" "HDR_LIGHT_PREPASS_ON" }
SetTexture 0 [_ParallaxSpec] 2D 1
SetTexture 1 [_MainTex] 2D 0
SetTexture 2 [_LightBuffer] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
ConstBuffer "$Globals" 128
Float 48 [_specOpac]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedjjkpjllblbmkffadbjkhiifpmjlkmploabaaaaaaneafaaaaaeaaaaaa
daaaaaaacaacaaaaaaafaaaakaafaaaaebgpgodjoiabaaaaoiabaaaaaaacpppp
kiabaaaaeaaaaaaaabaadeaaaaaaeaaaaaaaeaaaaeaaceaaaaaaeaaaabaaaaaa
aaababaaacacacaaadadadaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaaf
abaaapkaaaaaiadpaaaaaaebaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaapla
bpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaiaacaaaplabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaagaaaaacaaaaaiiaabaapplaafaaaaadaaaaadiaaaaappia
abaaoelaacaaaaadaaaaadiaaaaaoeiaaaaaoeiaagaaaaacaaaaaeiaacaappla
afaaaaadabaaadiaaaaakkiaacaaoelaabaaaaacacaaadiaaaaabllaecaaaaad
aaaaapiaaaaaoeiaaaaioekaecaaaaadadaaapiaaaaaoelaabaioekaecaaaaad
abaacpiaabaaoeiaacaioekaecaaaaadacaacpiaacaaoeiaadaioekaacaaaaad
aaaaahiaaaaaoeibabaaaakaabaaaaacaaaaaiiaabaaaakaaeaaaaaeadaaahia
adaaoeiaaaaaaakbaaaappiaaeaaaaaeaaaaahiaadaaoeiaaaaaoeibabaaaaka
acaaaaadaaaachiaaaaaoeiaaaaaoeiaafaaaaadaaaaciiaacaappiaabaaffka
aeaaaaaeabaachiaaaaappiaacaaoeiaabaaoeiaafaaaaadaaaachiaaaaaoeia
abaaoeiaabaaaaacaaaaciiaabaakkkaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcniacaaaaeaaaaaaalgaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egbabaaaacaaaaaapgbpbaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaalhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaaohcaabaaaabaaaaaaegacbaiaebaaaaaaabaaaaaaagiacaaaaaaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaadcaaaaanhcaabaaa
aaaaaaaaegacbaiaebaaaaaaabaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaaaaaaaaaaoaaaaahdcaabaaaabaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaogbkbaaaabaaaaaaeghobaaa
adaaaaaaaagabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaebdcaaaaajhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaa
acaaaaaaegacbaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaaaaadoaaaaab
ejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
imaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapalaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "Diffuse"
}