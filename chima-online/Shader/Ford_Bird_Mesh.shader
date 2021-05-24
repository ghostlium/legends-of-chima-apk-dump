//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Bird Mesh Particles" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _EmissiveColor ("Emissive Color", Color) = (0,0,0,0)
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _Waves ("Wave1|Wave2: XY|ZW || Speed|Strength: XZ|YW", Vector) = (20,1.2,1,1)
 _Displace ("Displace Strength: XYZ || Overall Bending: W", Vector) = (0,1,0,1)
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [unity_SHAr]
Vector 11 [unity_SHAg]
Vector 12 [unity_SHAb]
Vector 13 [unity_SHBr]
Vector 14 [unity_SHBg]
Vector 15 [unity_SHBb]
Vector 16 [unity_SHC]
Vector 17 [unity_Scale]
Vector 18 [_Waves]
Vector 19 [_Displace]
Vector 20 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[25] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..20],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R1.xyz, vertex.normal, c[17].w;
DP3 R2.w, R1, c[6];
DP3 R1.w, R1, c[7];
DP3 R0.w, R1, c[5];
MUL R2.x, R2.w, R2.w;
MOV R0.x, R2.w;
MOV R0.y, R1.w;
MOV R0.z, c[21];
MUL R3, R0.wxyy, R0.xyyw;
DP4 R1.z, R0.wxyz, c[12];
DP4 R1.y, R0.wxyz, c[11];
DP4 R1.x, R0.wxyz, c[10];
DP4 R0.z, R3, c[15];
DP4 R0.y, R3, c[14];
DP4 R0.x, R3, c[13];
ADD R1.xyz, R1, R0;
MAD R2.x, R0.w, R0.w, -R2;
MUL R0.xyz, R2.x, c[16];
ADD result.texcoord[2].xyz, R1, R0;
ADD R2.x, vertex.color, c[9].y;
MUL R0.x, R2, c[18];
MUL R0.y, R2.x, c[18].z;
MAD R0.x, R0, c[0].z, -c[0].w;
FRC R4.y, R0.x;
MAD R0.y, R0, c[0].z, -c[0].w;
FRC R3.w, R0.y;
ADD R1.xyz, -R3.w, c[21];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R4.y, c[21];
MUL R0.xyz, R0, R0;
SLT R4.x, R4.y, c[0].w;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[22].xyxw;
MAD R1.xyz, R1, R0, c[22].zwzw;
MAD R1.xyz, R1, R0, c[23].xyxw;
MAD R1.xyz, R1, R0, c[23].zwzw;
ADD R3.xyz, R3, c[22].xyxw;
MAD R3.xyz, R3, R2, c[22].zwzw;
MAD R3.xyz, R3, R2, c[23].xyxw;
MAD R1.xyz, R1, R0, c[21].wzww;
SGE R4.yz, R4.y, c[24].xxyw;
MAD R3.xyz, R3, R2, c[23].zwzw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[21].wzww;
DP3 R4.x, R1, -R0;
MAD R0.xyz, R3, R2, c[21].wzww;
SLT R1.x, R3.w, c[0].w;
SGE R1.yz, R3.w, c[24].xxyw;
MOV R3.w, vertex.position;
MOV R2.xz, R1;
DP3 R2.y, R1, c[21].wzww;
DP3 R0.y, R0, -R2;
MUL R0.x, R4, c[18].y;
MUL R0.y, R0, c[18].w;
MUL R0.z, vertex.color.w, c[19].w;
MUL R0.x, R0, R0.y;
MUL R0.x, R0, R0.z;
MAD R3.xyz, R0.x, c[19], vertex.position;
DP4 result.position.w, R3, c[4];
DP4 result.position.z, R3, c[3];
DP4 result.position.y, R3, c[2];
DP4 result.position.x, R3, c[1];
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R1.w;
MOV result.texcoord[1].y, R2.w;
MOV result.texcoord[1].x, R0.w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
END
# 68 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [unity_SHAr]
Vector 10 [unity_SHAg]
Vector 11 [unity_SHAb]
Vector 12 [unity_SHBr]
Vector 13 [unity_SHBg]
Vector 14 [unity_SHBb]
Vector 15 [unity_SHC]
Vector 16 [unity_Scale]
Vector 17 [_Waves]
Vector 18 [_Displace]
Vector 19 [_MainTex_ST]
"vs_2_0
def c20, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c21, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c22, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
mul r1.xyz, v2, c16.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c20.z
dp4 r2.z, r0, c11
dp4 r2.y, r0, c10
dp4 r2.x, r0, c9
mul r0.y, r3.w, r3.w
dp4 r3.z, r1, c14
dp4 r3.y, r1, c13
dp4 r3.x, r1, c12
add r1.xyz, r2, r3
mad r0.y, r0.x, r0.x, -r0
mul r2.xyz, r0.y, c15
add r0.y, v5.x, c8
mul r0.z, r0.y, c17.x
mul r0.w, r0.y, c17.z
mad r0.y, r0.z, c22.x, c22
mad r0.z, r0.w, c22.x, c22.y
frc r0.y, r0
mad r0.y, r0, c22.z, c22.w
sincos r4.xy, r0.y, c21.xyzw, c20.xyzw
frc r0.z, r0
mad r0.z, r0, c22, c22.w
add oT2.xyz, r1, r2
sincos r1.xy, r0.z, c21.xyzw, c20.xyzw
mov r1.w, v0
mul r0.z, r1.y, c17.w
mul r0.y, r4, c17
mul r0.w, v5, c18
mul r0.y, r0, r0.z
mul r0.y, r0, r0.w
mad r1.xyz, r0.y, c18, v0
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v3, c19, c19.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedcniipbglinebfachjfpgdhkbdngibllcabaaaaaafaagaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefclaaeaaaa
eaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacaeaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaaagaaaaaa
enaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaagaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
dkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaadiaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
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
aaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedonklagbhllapjnjepemmcgjcilhecmehabaaaaaaoiajaaaaaeaaaaaa
daaaaaaameadaaaahmaiaaaaeeajaaaaebgpgodjimadaaaaimadaaaaaaacpopp
bmadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaagaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaacgaaahaaafaaaaaaaaaa
adaaaaaaaeaaamaaaaaaaaaaadaaamaaadaabaaaaaaaaaaaadaabeaaabaabdaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbeaaapkaidpjccdoaaaaaadpnlapmjea
nlapejmafbaaaaafbfaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaafbaaaaaf
bgaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafbhaaapkaklkkkklm
aaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaadaaoekaadaaookaafaaaaadaaaaahiaacaaoejabdaappka
afaaaaadabaaahiaaaaaffiabbaaoekaaeaaaaaeaaaaaliabaaakekaaaaaaaia
abaakeiaaeaaaaaeaaaaahiabcaaoekaaaaakkiaaaaapeiaabaaaaacaaaaaiia
bfaaaakaajaaaaadabaaabiaafaaoekaaaaaoeiaajaaaaadabaaaciaagaaoeka
aaaaoeiaajaaaaadabaaaeiaahaaoekaaaaaoeiaafaaaaadacaaapiaaaaacjia
aaaakeiaajaaaaadadaaabiaaiaaoekaacaaoeiaajaaaaadadaaaciaajaaoeka
acaaoeiaajaaaaadadaaaeiaakaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffiaaeaaaaaeaaaaaiiaaaaaaaia
aaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeiaaeaaaaaeadaaahoaalaaoeka
aaaappiaabaaoeiaacaaaaadaaaaabiaafaaaajaaeaaffkaafaaaaadaaaaadia
aaaaaaiaabaaoikaaeaaaaaeaaaaadiaaaaaoeiabeaaaakabeaaffkabdaaaaac
aaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabeaakkkabeaappkacfaaaaae
abaaaciaaaaaaaiabgaaoekabhaaoekacfaaaaaeacaaaciaaaaaffiabgaaoeka
bhaaoekaafaaaaadaaaaabiaacaaffiaabaappkaafaaaaadaaaaaciaabaaffia
abaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaaciaafaappja
acaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahiaaaaaaaia
acaaoekaaaaaoejaafaaaaadabaaapiaaaaaffiaanaaoekaaeaaaaaeabaaapia
amaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiaapaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoeja
ppppaaaafdeieefclaaeaaaaeaaaabaacmabaaaafjaaaaaeegiocaaaaaaaaaaa
ajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
cnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacaeaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaa
bkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
igiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaa
agaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaa
diaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaai
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
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_Time]
Vector 10 [_Waves]
Vector 11 [_Displace]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..13],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[9].y;
MUL R0.y, R0.x, c[10].x;
MUL R0.z, R0.x, c[10];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[14];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[14];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
MAD R1.xyz, R1, R0, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R2, c[15].zwzw;
MAD R3.xyz, R3, R2, c[16].xyxw;
MAD R1.xyz, R1, R0, c[14].wzww;
MAD R3.xyz, R3, R2, c[16].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[17].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[14].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[17].xxyw;
SLT R0.x, R0.w, c[0].w;
MAD R1.xyz, R3, R2, c[14].wzww;
MOV R0.w, vertex.position;
MOV R2.xz, R0;
DP3 R2.y, R0, c[14].wzww;
DP3 R0.y, R1, -R2;
MUL R0.y, R0, c[10].w;
MUL R0.x, R1.w, c[10].y;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[11].w;
MUL R0.x, R0, R0.z;
MAD R0.xyz, R0.x, c[11], vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 47 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_Time]
Vector 9 [_Waves]
Vector 10 [_Displace]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.x, v5, c8.y
mul r0.y, r0.x, c9.x
mul r0.z, r0.x, c9
mad r0.x, r0.y, c15, c15.y
mad r0.y, r0.z, c15.x, c15
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c15.z, c15.w
sincos r1.xy, r0.x, c14.xyzw, c13.xyzw
mad r2.x, r0.y, c15.z, c15.w
sincos r0.xy, r2.x, c14.xyzw, c13.xyzw
mov r0.w, v0
mul r0.y, r0, c9.w
mul r0.x, r1.y, c9.y
mul r0.x, r0, r0.y
mul r0.z, v5.w, c10.w
mul r0.x, r0, r0.z
mad r0.xyz, r0.x, c10, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v5
mad oT0.xy, v3, c12, c12.zwzw
mad oT1.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedpemikihdfhfingfidkcekenbflbopifbabaaaaaacmaeaaaaadaaaaaa
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
fdeieefckeacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaa
bkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
igiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaa
agaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaa
diaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjdjkjgoeapafboiioecobiicoofjnaicabaaaaaaieagaaaaaeaaaaaa
daaaaaaaieacaaaadaafaaaapiafaaaaebgpgodjemacaaaaemacaaaaaaacpopp
aaacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaagaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafamaaapkaidpjccdoaaaaaadpnlapmjeanlapejma
fbaaaaafakaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafalaaapka
klkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapja
aeaaaaaeaaaaadoaadaaoejaaeaaoekaaeaaookaaeaaaaaeaaaaamoaaeaabeja
adaabekaadaalekaacaaaaadaaaaabiaafaaaajaafaaffkaafaaaaadaaaaadia
aaaaaaiaabaaoikaaeaaaaaeaaaaadiaaaaaoeiaamaaaakaamaaffkabdaaaaac
aaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiaamaakkkaamaappkacfaaaaae
abaaaciaaaaaaaiaakaaoekaalaaoekacfaaaaaeacaaaciaaaaaffiaakaaoeka
alaaoekaafaaaaadaaaaabiaacaaffiaabaappkaafaaaaadaaaaaciaabaaffia
abaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaaciaafaappja
acaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahiaaaaaaaia
acaaoekaaaaaoejaafaaaaadabaaapiaaaaaffiaahaaoekaaeaaaaaeabaaapia
agaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoeja
ppppaaaafdeieefckeacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaagaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
ahaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 9 [_Time]
Vector 10 [_Waves]
Vector 11 [_Displace]
Vector 12 [unity_LightmapST]
Vector 13 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..13],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[9].y;
MUL R0.y, R0.x, c[10].x;
MUL R0.z, R0.x, c[10];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[14];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[14];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[15].xyxw;
MAD R1.xyz, R1, R0, c[15].zwzw;
MAD R1.xyz, R1, R0, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
ADD R3.xyz, R3, c[15].xyxw;
MAD R3.xyz, R3, R2, c[15].zwzw;
MAD R3.xyz, R3, R2, c[16].xyxw;
MAD R1.xyz, R1, R0, c[14].wzww;
MAD R3.xyz, R3, R2, c[16].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[17].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[14].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[17].xxyw;
SLT R0.x, R0.w, c[0].w;
MAD R1.xyz, R3, R2, c[14].wzww;
MOV R0.w, vertex.position;
MOV R2.xz, R0;
DP3 R2.y, R0, c[14].wzww;
DP3 R0.y, R1, -R2;
MUL R0.y, R0, c[10].w;
MUL R0.x, R1.w, c[10].y;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[11].w;
MUL R0.x, R0, R0.z;
MAD R0.xyz, R0.x, c[11], vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MOV result.color, vertex.color;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[13], c[13].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[1], c[12], c[12].zwzw;
END
# 47 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 8 [_Time]
Vector 9 [_Waves]
Vector 10 [_Displace]
Vector 11 [unity_LightmapST]
Vector 12 [_MainTex_ST]
"vs_2_0
def c13, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c14, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c15, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_texcoord0 v3
dcl_texcoord1 v4
dcl_color0 v5
add r0.x, v5, c8.y
mul r0.y, r0.x, c9.x
mul r0.z, r0.x, c9
mad r0.x, r0.y, c15, c15.y
mad r0.y, r0.z, c15.x, c15
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c15.z, c15.w
sincos r1.xy, r0.x, c14.xyzw, c13.xyzw
mad r2.x, r0.y, c15.z, c15.w
sincos r0.xy, r2.x, c14.xyzw, c13.xyzw
mov r0.w, v0
mul r0.y, r0, c9.w
mul r0.x, r1.y, c9.y
mul r0.x, r0, r0.y
mul r0.z, v5.w, c10.w
mul r0.x, r0, r0.z
mad r0.xyz, r0.x, c10, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mov oD0, v5
mad oT0.xy, v3, c12, c12.zwzw
mad oT1.xy, v4, c11, c11.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedpemikihdfhfingfidkcekenbflbopifbabaaaaaacmaeaaaaadaaaaaa
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
fdeieefckeacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaaakaaaaaa
fjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaa
bkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaa
igiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaa
agaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaa
diaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaaogikcaaa
aaaaaaaaajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaa
aaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 160
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [unity_LightmapST]
Vector 144 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedjdjkjgoeapafboiioecobiicoofjnaicabaaaaaaieagaaaaaeaaaaaa
daaaaaaaieacaaaadaafaaaapiafaaaaebgpgodjemacaaaaemacaaaaaaacpopp
aaacaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaagaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaacaaaaaaaeaaagaaaaaaaaaa
aaaaaaaaaaacpoppfbaaaaafamaaapkaidpjccdoaaaaaadpnlapmjeanlapejma
fbaaaaafakaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaafalaaapka
klkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjabpaaaaacafaaafiaafaaapja
aeaaaaaeaaaaadoaadaaoejaaeaaoekaaeaaookaaeaaaaaeaaaaamoaaeaabeja
adaabekaadaalekaacaaaaadaaaaabiaafaaaajaafaaffkaafaaaaadaaaaadia
aaaaaaiaabaaoikaaeaaaaaeaaaaadiaaaaaoeiaamaaaakaamaaffkabdaaaaac
aaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiaamaakkkaamaappkacfaaaaae
abaaaciaaaaaaaiaakaaoekaalaaoekacfaaaaaeacaaaciaaaaaffiaakaaoeka
alaaoekaafaaaaadaaaaabiaacaaffiaabaappkaafaaaaadaaaaaciaabaaffia
abaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaaciaafaappja
acaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahiaaaaaaaia
acaaoekaaaaaoejaafaaaaadabaaapiaaaaaffiaahaaoekaaeaaaaaeabaaapia
agaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkiaabaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoeja
ppppaaaafdeieefckeacaaaaeaaaabaakjaaaaaafjaaaaaeegiocaaaaaaaaaaa
akaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
dcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaagaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
ahaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaajaaaaaa
ogikcaaaaaaaaaaaajaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaa
agiecaaaaaaaaaaaaiaaaaaakgiocaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaa
aeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
heaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
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
Vector 26 [_Waves]
Vector 27 [_Displace]
Vector 28 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[33] = { { 0.15915491, 0.25, 24.980801, -24.980801 },
		state.matrix.mvp,
		program.local[5..28],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
TEMP R5;
TEMP R6;
TEMP R7;
ADD R0.x, vertex.color, c[9].y;
MUL R6.xyz, vertex.normal, c[25].w;
DP3 R6.w, R6, c[6];
DP3 R7.x, R6, c[5];
MOV R7.y, R6.w;
MUL R0.y, R0.x, c[26].x;
MUL R0.z, R0.x, c[26];
MAD R0.x, R0.y, c[0], -c[0].y;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].x, -c[0];
FRC R0.w, R0.y;
ADD R0.xyz, -R1.w, c[29];
MUL R1.xyz, R0, R0;
ADD R2.xyz, -R0.w, c[29];
MUL R2.xyz, R2, R2;
MUL R0.xyz, R1, c[0].zwzw;
MUL R3.xyz, R2, c[0].zwzw;
ADD R0.xyz, R0, c[30].xyxw;
MAD R0.xyz, R0, R1, c[30].zwzw;
MAD R0.xyz, R0, R1, c[31].xyxw;
MAD R0.xyz, R0, R1, c[31].zwzw;
ADD R3.xyz, R3, c[30].xyxw;
MAD R3.xyz, R3, R2, c[30].zwzw;
MAD R3.xyz, R3, R2, c[31].xyxw;
MAD R3.xyz, R3, R2, c[31].zwzw;
MAD R1.xyz, R0, R1, c[29].wzww;
MAD R2.xyz, R3, R2, c[29].wzww;
SLT R4.x, R1.w, c[0].y;
SGE R4.yz, R1.w, c[32].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[29].wzww;
DP3 R1.w, R1, -R0;
SLT R1.x, R0.w, c[0].y;
SGE R1.yz, R0.w, c[32].xxyw;
MOV R0.xz, R1;
DP3 R0.y, R1, c[29].wzww;
DP3 R0.y, R2, -R0;
MUL R0.x, R1.w, c[26].y;
MUL R0.y, R0, c[26].w;
MOV R1.w, vertex.position;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[27].w;
MUL R0.x, R0, R0.z;
MAD R1.xyz, R0.x, c[27], vertex.position;
DP4 R0.x, R1, c[6];
ADD R3, -R0.x, c[11];
MUL R0, R3, R3;
DP4 R2.x, R1, c[5];
ADD R2, -R2.x, c[10];
MAD R4, R2, R2, R0;
DP4 R5.x, R1, c[7];
ADD R0, -R5.x, c[12];
MAD R4, R0, R0, R4;
MUL R3, R6.w, R3;
MAD R2, R7.x, R2, R3;
DP3 R3.x, R6, c[7];
MAD R0, R3.x, R0, R2;
MUL R5, R4, c[13];
MOV R7.z, R3.x;
RSQ R2.x, R4.x;
MOV R7.w, c[29].z;
RSQ R2.y, R4.y;
RSQ R2.z, R4.z;
RSQ R2.w, R4.w;
MUL R0, R0, R2;
ADD R2, R5, c[29].z;
RCP R2.x, R2.x;
RCP R2.y, R2.y;
RCP R2.w, R2.w;
RCP R2.z, R2.z;
MAX R0, R0, c[29].x;
MUL R0, R0, R2;
MUL R2.xyz, R0.y, c[15];
MAD R2.xyz, R0.x, c[14], R2;
MAD R0.xyz, R0.z, c[16], R2;
MAD R2.xyz, R0.w, c[17], R0;
MUL R0, R7.xyzz, R7.yzzx;
MUL R2.w, R6, R6;
DP4 R5.z, R0, c[23];
DP4 R5.y, R0, c[22];
DP4 R5.x, R0, c[21];
MAD R2.w, R7.x, R7.x, -R2;
DP4 R4.z, R7, c[20];
DP4 R4.y, R7, c[19];
DP4 R4.x, R7, c[18];
MUL R0.xyz, R2.w, c[24];
ADD R4.xyz, R4, R5;
ADD R0.xyz, R4, R0;
ADD result.texcoord[2].xyz, R0, R2;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R6.w;
MOV result.texcoord[1].x, R7;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[28], c[28].zwzw;
END
# 98 instructions, 8 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
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
Vector 25 [_Waves]
Vector 26 [_Displace]
Vector 27 [_MainTex_ST]
"vs_2_0
def c28, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c29, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c30, 0.15915491, 0.50000000, 6.28318501, -3.14159298
def c31, 0.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c8.y
mul r4.xyz, v2, c24.w
dp3 r5.x, r4, c4
dp3 r4.w, r4, c5
dp3 r4.x, r4, c6
mov r5.z, r4.x
mov r5.w, c28.z
mul r0.y, r0.x, c25.x
mul r0.z, r0.x, c25
mad r0.x, r0.y, c30, c30.y
mad r0.y, r0.z, c30.x, c30
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c30.z, c30.w
sincos r1.xy, r0.x, c29.xyzw, c28.xyzw
mad r2.x, r0.y, c30.z, c30.w
sincos r0.xy, r2.x, c29.xyzw, c28.xyzw
mov r1.w, v0
mul r0.x, r1.y, c25.y
mul r0.y, r0, c25.w
mul r0.x, r0, r0.y
mul r0.z, v5.w, c26.w
mul r0.x, r0, r0.z
mad r1.xyz, r0.x, c26, v0
dp4 r0.y, r1, c5
add r2, -r0.y, c10
mul r3, r4.w, r2
dp4 r0.x, r1, c4
add r0, -r0.x, c9
mul r2, r2, r2
mad r3, r5.x, r0, r3
dp4 r5.y, r1, c6
mad r2, r0, r0, r2
add r0, -r5.y, c11
mad r2, r0, r0, r2
mad r0, r4.x, r0, r3
mul r3, r2, c12
mov r5.y, r4.w
rsq r2.x, r2.x
rsq r2.y, r2.y
rsq r2.w, r2.w
rsq r2.z, r2.z
mul r0, r0, r2
add r2, r3, c28.z
dp4 r3.z, r5, c19
dp4 r3.y, r5, c18
dp4 r3.x, r5, c17
rcp r2.x, r2.x
rcp r2.y, r2.y
rcp r2.w, r2.w
rcp r2.z, r2.z
max r0, r0, c31.x
mul r0, r0, r2
mul r2.xyz, r0.y, c14
mad r2.xyz, r0.x, c13, r2
mad r0.xyz, r0.z, c15, r2
mad r2.xyz, r0.w, c16, r0
mul r0, r5.xyzz, r5.yzzx
mul r2.w, r4, r4
dp4 r5.w, r0, c22
dp4 r5.z, r0, c21
dp4 r5.y, r0, c20
mad r2.w, r5.x, r5.x, -r2
mul r0.xyz, r2.w, c23
add r3.xyz, r3, r5.yzww
add r0.xyz, r3, r0
add oT2.xyz, r0, r2
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
mov oT1.z, r4.x
mov oT1.y, r4.w
mov oT1.x, r5
mad oT0.xy, v3, c27, c27.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0
eefiecedclankagohegbnnhnjbfojjpebpomealpabaaaaaakaajaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcaaaiaaaa
eaaaabaaaaacaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaacnaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacagaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaaagaaaaaa
enaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaagaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
dkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaadiaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaafgafbaaa
abaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaaabaaaaaa
dgaaaaafhccabaaaadaaaaaaegacbaaaabaaaaaadgaaaaaficaabaaaabaaaaaa
abeaaaaaaaaaiadpbbaaaaaibcaabaaaacaaaaaaegiocaaaacaaaaaacgaaaaaa
egaobaaaabaaaaaabbaaaaaiccaabaaaacaaaaaaegiocaaaacaaaaaachaaaaaa
egaobaaaabaaaaaabbaaaaaiecaabaaaacaaaaaaegiocaaaacaaaaaaciaaaaaa
egaobaaaabaaaaaadiaaaaahpcaabaaaadaaaaaajgacbaaaabaaaaaaegakbaaa
abaaaaaabbaaaaaibcaabaaaaeaaaaaaegiocaaaacaaaaaacjaaaaaaegaobaaa
adaaaaaabbaaaaaiccaabaaaaeaaaaaaegiocaaaacaaaaaackaaaaaaegaobaaa
adaaaaaabbaaaaaiecaabaaaaeaaaaaaegiocaaaacaaaaaaclaaaaaaegaobaaa
adaaaaaaaaaaaaahhcaabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaaeaaaaaa
diaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaabkaabaaaabaaaaaadcaaaaak
icaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadkaabaiaebaaaaaa
aaaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaacmaaaaaapgapbaaa
aaaaaaaaegacbaaaacaaaaaadiaaaaaihcaabaaaadaaaaaafgafbaaaaaaaaaaa
egiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaadaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaa
aaaaaaaaaaaaaaajpcaabaaaadaaaaaaagaabaiaebaaaaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaaaaaaaaajpcaabaaaaeaaaaaafgafbaiaebaaaaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaaaaaaaaajpcaabaaaaaaaaaaakgakbaiaebaaaaaa
aaaaaaaaegiocaaaacaaaaaaaeaaaaaadiaaaaahpcaabaaaafaaaaaafgafbaaa
abaaaaaaegaobaaaaeaaaaaadiaaaaahpcaabaaaaeaaaaaaegaobaaaaeaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaaeaaaaaaegaobaaaadaaaaaaegaobaaa
adaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaadaaaaaa
agaabaaaabaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaabaaaaaaegaobaaa
aaaaaaaakgakbaaaabaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaeaaaaaaeeaaaaafpcaabaaa
adaaaaaaegaobaaaaaaaaaaadcaaaaanpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiocaaaacaaaaaaafaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
aoaaaaakpcaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadp
egaobaaaaaaaaaaadiaaaaahpcaabaaaabaaaaaaegaobaaaabaaaaaaegaobaaa
adaaaaaadeaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaahaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaagaaaaaa
agaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaiaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaa
aaaaaaahhccabaaaaeaaaaaaegacbaaaaaaaaaaaegacbaaaacaaaaaadoaaaaab
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
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
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityLighting" 2
BindCB  "UnityPerDraw" 3
"vs_4_0_level_9_1
eefiecedkcnacelhkoccmegolnejiedbooajaocfabaaaaaadmapaaaaaeaaaaaa
daaaaaaamiafaaaanaanaaaajiaoaaaaebgpgodjjaafaaaajaafaaaaaaacpopp
beafaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaagaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaacaaaiaaafaaaaaaaaaa
acaacgaaahaaanaaaaaaaaaaadaaaaaaaeaabeaaaaaaaaaaadaaamaaaeaabiaa
aaaaaaaaadaabeaaabaabmaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbnaaapka
idpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafboaaapkaaaaaiadpaaaaaaaa
aaaaaaaaaaaaaaaafbaaaaafbpaaapkaabannalfgballglhklkkckdlijiiiidj
fbaaaaafcaaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaacaaaaad
aaaaabiaafaaaajaaeaaffkaafaaaaadaaaaadiaaaaaaaiaabaaoikaaeaaaaae
aaaaadiaaaaaoeiabnaaaakabnaaffkabdaaaaacaaaaadiaaaaaoeiaaeaaaaae
aaaaadiaaaaaoeiabnaakkkabnaappkacfaaaaaeabaaaciaaaaaaaiabpaaoeka
caaaoekacfaaaaaeacaaaciaaaaaffiabpaaoekacaaaoekaafaaaaadaaaaabia
acaaffiaabaappkaafaaaaadaaaaaciaabaaffiaabaaffkaafaaaaadaaaaabia
aaaaaaiaaaaaffiaafaaaaadaaaaaciaafaappjaacaappkaafaaaaadaaaaabia
aaaaffiaaaaaaaiaaeaaaaaeaaaaahiaaaaaaaiaacaaoekaaaaaoejaafaaaaad
abaaahiaaaaaffiabjaaoekaaeaaaaaeabaaahiabiaaoekaaaaaaaiaabaaoeia
aeaaaaaeabaaahiabkaaoekaaaaakkiaabaaoeiaaeaaaaaeabaaahiablaaoeka
aaaappjaabaaoeiaacaaaaadacaaapiaabaaffibagaaoekaafaaaaadadaaapia
acaaoeiaacaaoeiaacaaaaadaeaaapiaabaaaaibafaaoekaacaaaaadabaaapia
abaakkibahaaoekaaeaaaaaeadaaapiaaeaaoeiaaeaaoeiaadaaoeiaaeaaaaae
adaaapiaabaaoeiaabaaoeiaadaaoeiaahaaaaacafaaabiaadaaaaiaahaaaaac
afaaaciaadaaffiaahaaaaacafaaaeiaadaakkiaahaaaaacafaaaiiaadaappia
abaaaaacagaaabiaboaaaakaaeaaaaaeadaaapiaadaaoeiaaiaaoekaagaaaaia
afaaaaadagaaahiaacaaoejabmaappkaafaaaaadahaaahiaagaaffiabjaaoeka
aeaaaaaeagaaaliabiaakekaagaaaaiaahaakeiaaeaaaaaeagaaahiabkaaoeka
agaakkiaagaapeiaafaaaaadacaaapiaacaaoeiaagaaffiaaeaaaaaeacaaapia
aeaaoeiaagaaaaiaacaaoeiaaeaaaaaeabaaapiaabaaoeiaagaakkiaacaaoeia
afaaaaadabaaapiaafaaoeiaabaaoeiaalaaaaadabaaapiaabaaoeiaboaaffka
agaaaaacacaaabiaadaaaaiaagaaaaacacaaaciaadaaffiaagaaaaacacaaaeia
adaakkiaagaaaaacacaaaiiaadaappiaafaaaaadabaaapiaabaaoeiaacaaoeia
afaaaaadacaaahiaabaaffiaakaaoekaaeaaaaaeacaaahiaajaaoekaabaaaaia
acaaoeiaaeaaaaaeabaaahiaalaaoekaabaakkiaacaaoeiaaeaaaaaeabaaahia
amaaoekaabaappiaabaaoeiaabaaaaacagaaaiiaboaaaakaajaaaaadacaaabia
anaaoekaagaaoeiaajaaaaadacaaaciaaoaaoekaagaaoeiaajaaaaadacaaaeia
apaaoekaagaaoeiaafaaaaadadaaapiaagaacjiaagaakeiaajaaaaadaeaaabia
baaaoekaadaaoeiaajaaaaadaeaaaciabbaaoekaadaaoeiaajaaaaadaeaaaeia
bcaaoekaadaaoeiaacaaaaadacaaahiaacaaoeiaaeaaoeiaafaaaaadaaaaaiia
agaaffiaagaaffiaaeaaaaaeaaaaaiiaagaaaaiaagaaaaiaaaaappibabaaaaac
acaaahoaagaaoeiaaeaaaaaeacaaahiabdaaoekaaaaappiaacaaoeiaacaaaaad
adaaahoaabaaoeiaacaaoeiaafaaaaadabaaapiaaaaaffiabfaaoekaaeaaaaae
abaaapiabeaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaapiabgaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaapiabhaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejappppaaaafdeieefcaaaiaaaaeaaaabaaaaacaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaacnaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaagaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
ahaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
abaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
acaaaaaaegiocaaaacaaaaaacgaaaaaaegaobaaaabaaaaaabbaaaaaiccaabaaa
acaaaaaaegiocaaaacaaaaaachaaaaaaegaobaaaabaaaaaabbaaaaaiecaabaaa
acaaaaaaegiocaaaacaaaaaaciaaaaaaegaobaaaabaaaaaadiaaaaahpcaabaaa
adaaaaaajgacbaaaabaaaaaaegakbaaaabaaaaaabbaaaaaibcaabaaaaeaaaaaa
egiocaaaacaaaaaacjaaaaaaegaobaaaadaaaaaabbaaaaaiccaabaaaaeaaaaaa
egiocaaaacaaaaaackaaaaaaegaobaaaadaaaaaabbaaaaaiecaabaaaaeaaaaaa
egiocaaaacaaaaaaclaaaaaaegaobaaaadaaaaaaaaaaaaahhcaabaaaacaaaaaa
egacbaaaacaaaaaaegacbaaaaeaaaaaadiaaaaahicaabaaaaaaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaacaaaaaadiaaaaai
hcaabaaaadaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
adaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaadaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajpcaabaaaadaaaaaa
agaabaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaaaaaaaaajpcaabaaa
aeaaaaaafgafbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaaaaaaaaaj
pcaabaaaaaaaaaaakgakbaiaebaaaaaaaaaaaaaaegiocaaaacaaaaaaaeaaaaaa
diaaaaahpcaabaaaafaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaadiaaaaah
pcaabaaaaeaaaaaaegaobaaaaeaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
aeaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaegaobaaaaeaaaaaadcaaaaaj
pcaabaaaadaaaaaaegaobaaaadaaaaaaagaabaaaabaaaaaaegaobaaaafaaaaaa
dcaaaaajpcaabaaaabaaaaaaegaobaaaaaaaaaaakgakbaaaabaaaaaaegaobaaa
adaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaaeaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaaaaaaaaadcaaaaan
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaaacaaaaaaafaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaaaaaaaaadiaaaaahpcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaaabaaaaaa
egaobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaahaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaiaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaajaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaaegacbaaa
aaaaaaaaegacbaaaacaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
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
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R0, fragment.color.primary;
MUL R2.xyz, R1, fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MUL R1.xyz, R1, c[1];
MAX R1.w, R1, c[3].x;
MUL R1.xyz, R1.w, R1;
MAD R1.xyz, R1, c[3].y, R2;
MAD result.color.xyz, R0, c[2], R1;
MOV result.color.w, R0;
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s0
mul r2.xyz, r1, v0
mul_pp r3.xyz, r2, t2
dp3_pp r0.x, t1, c0
mul_pp r2.xyz, r2, c1
max_pp r0.x, r0, c3
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c3.y, r3
mad_pp r0.xyz, r1, c2, r0
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_EmissiveColor]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedlicecbjjmaimngojohgijjpndfceboomabaaaaaammacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
Vector 64 [_EmissiveColor]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedkfidpaibecbompfghgngfhpijhmcidmcabaaaaaaceaeaaaaaeaaaaaa
daaaaaaaieabaaaaemadaaaapaadaaaaebgpgodjemabaaaaemabaaaaaaacpppp
aaabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaaeaaabaaabaaaaaaaaaaabaaaaaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaaiaaaaadabaaciiaacaaoelaacaaoekaalaaaaad
acaaciiaabaappiaadaaaakaacaaaaadabaacbiaacaappiaacaappiaafaaaaad
abaacoiaaaaabliaabaabllaafaaaaadacaachiaabaabliaaaaaoekaafaaaaad
abaacoiaabaaoeiaadaabllaaeaaaaaeabaachiaacaaoeiaabaaaaiaabaablia
aeaaaaaeaaaachiaaaaaoeiaabaaoekaabaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
afaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaaeaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].x, R2;
MOV result.color.w, R0;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mad_pp r0.xyz, r0, c1.x, r2
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 160
Vector 64 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedifcbnkjheaddihkknjhepomccbeoflfnabaaaaaaheacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 160
Vector 64 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecednmaehiiiingfffomnfkjaedpcngapjocabaaaaaajeadaaaaaeaaaaaa
daaaaaaaemabaaaaneacaaaagaadaaaaebgpgodjbeabaaaabeabaaaaaaacpppp
nmaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaadaaaachia
aaaaoeiaaaaappiaafaaaaadacaachiaabaaoeiaabaaoelaafaaaaadadaachia
abaaoeiaaaaaoekaaeaaaaaeabaachiaacaaoeiaaaaaoeiaadaaoeiaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].x, R2;
MOV result.color.w, R0;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mad_pp r0.xyz, r0, c1.x, r2
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 160
Vector 64 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedifcbnkjheaddihkknjhepomccbeoflfnabaaaaaaheacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 160
Vector 64 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecednmaehiiiingfffomnfkjaedpcngapjocabaaaaaajeadaaaaaeaaaaaa
daaaaaaaemabaaaaneacaaaagaadaaaaebgpgodjbeabaaaabeabaaaaaaacpppp
nmaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaadaaaachia
aaaaoeiaaaaappiaafaaaaadacaachiaabaaoeiaabaaoelaafaaaaadadaachia
abaaoeiaaaaaoekaaeaaaaaeabaachiaacaaoeiaaaaaoeiaadaaoeiaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaaeaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_Waves]
Vector 17 [_Displace]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..18],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[13].y;
MUL R0.y, R0.x, c[16].x;
MUL R0.z, R0.x, c[16];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[19];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[19];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R1.xyz, R1, R0, c[21].zwzw;
ADD R3.xyz, R3, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R3.xyz, R3, R2, c[21].xyxw;
MAD R1.xyz, R1, R0, c[19].wzww;
MAD R3.xyz, R3, R2, c[21].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[22].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[22].xxyw;
MAD R1.xyz, R3, R2, c[19].wzww;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[19].wzww;
MOV R2.xz, R0;
DP3 R0.y, R1, -R2;
MUL R0.x, R1.w, c[16].y;
MUL R0.y, R0, c[16].w;
MOV R1.w, vertex.position;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[17].w;
MUL R0.x, R0, R0.z;
MAD R1.xyz, R0.x, c[17], vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[14];
MUL R0.xyz, vertex.normal, c[15].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 58 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_Time]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Waves]
Vector 16 [_Displace]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c19, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c20, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c12.y
mul r0.y, r0.x, c15.x
mul r0.z, r0.x, c15
mad r0.x, r0.y, c20, c20.y
mad r0.y, r0.z, c20.x, c20
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r1.xy, r0.x, c19.xyzw, c18.xyzw
mad r2.x, r0.y, c20.z, c20.w
sincos r0.xy, r2.x, c19.xyzw, c18.xyzw
mov r1.w, v0
mul r0.x, r1.y, c15.y
mul r0.y, r0, c15.w
mul r0.x, r0, r0.y
mul r0.z, v5.w, c16.w
mul r0.x, r0, r0.z
mad r1.xyz, r0.x, c16, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c13
mul r0.xyz, v2, c14.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
"vs_4_0
eefiecedpmngoedelckkkoomkicookjhgopeabklabaaaaaaneagaaaaadaaaaaa
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
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbmafaaaaeaaaabaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaa
akaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaakaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaalaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
eefiecedbencnhaipohnmgllaljckoihlncpfodeabaaaaaaieakaaaaaeaaaaaa
daaaaaaanmadaaaaaaajaaaamiajaaaaebgpgodjkeadaaaakeadaaaaaaacpopp
ciadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaadaaafaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaa
acaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaaaaaaaaaaadaaamaaaeaaaoaa
aaaaaaaaadaabeaaabaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
idpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafbdaaapkaabannalfgballglh
klkkckdlijiiiidjfbaaaaafbeaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoeka
ahaaookaafaaaaadaaaaahiaacaaoejabcaappkaafaaaaadabaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
baaaoekaaaaakkiaaaaapeiaacaaaaadaaaaabiaafaaaajaaiaaffkaafaaaaad
aaaaadiaaaaaaaiaafaaoikaaeaaaaaeaaaaadiaaaaaoeiabfaaaakabfaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabfaakkkabfaappka
cfaaaaaeabaaaciaaaaaaaiabdaaoekabeaaoekacfaaaaaeacaaaciaaaaaffia
bdaaoekabeaaoekaafaaaaadaaaaabiaacaaffiaafaappkaafaaaaadaaaaacia
abaaffiaafaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaacia
afaappjaagaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahia
aaaaaaiaagaaoekaaaaaoejaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
abaaahiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiabaaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappjaabaaoeiaacaaaaadadaaahoa
abaaoeibajaaoekaafaaaaadabaaapiaaaaaffiaapaaoekaaeaaaaaeabaaapia
aoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabaaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaapiabbaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffia
acaaoekaaeaaaaaeacaaahiaabaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahia
adaaoekaabaakkiaacaaoeiaaeaaaaaeaeaaahoaaeaaoekaabaappiaabaaoeia
afaaaaadabaaapiaaaaaffiaalaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
bmafaaaaeaaaabaaehabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaakaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaakaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
alaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceLightPos0]
Vector 11 [unity_Scale]
Vector 12 [_Waves]
Vector 13 [_Displace]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[19] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..14],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[9].y;
MUL R0.y, R0.x, c[12].x;
MUL R0.z, R0.x, c[12];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[15];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[15];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[16].xyxw;
MAD R1.xyz, R1, R0, c[16].zwzw;
MAD R1.xyz, R1, R0, c[17].xyxw;
MAD R1.xyz, R1, R0, c[17].zwzw;
ADD R3.xyz, R3, c[16].xyxw;
MAD R3.xyz, R3, R2, c[16].zwzw;
MAD R3.xyz, R3, R2, c[17].xyxw;
MAD R1.xyz, R1, R0, c[15].wzww;
MAD R3.xyz, R3, R2, c[17].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[18].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[15].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[18].xxyw;
SLT R0.x, R0.w, c[0].w;
MAD R1.xyz, R3, R2, c[15].wzww;
MOV R0.w, vertex.position;
MOV R2.xz, R0;
DP3 R2.y, R0, c[15].wzww;
DP3 R0.y, R1, -R2;
MUL R0.y, R0, c[12].w;
MUL R0.x, R1.w, c[12].y;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[13].w;
MUL R0.x, R0, R0.z;
MAD R0.xyz, R0.x, c[13], vertex.position;
DP4 result.position.w, R0, c[4];
DP4 result.position.z, R0, c[3];
DP4 result.position.y, R0, c[2];
DP4 result.position.x, R0, c[1];
MUL R0.xyz, vertex.normal, c[11].w;
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[10];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
END
# 51 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_Waves]
Vector 12 [_Displace]
Vector 13 [_MainTex_ST]
"vs_2_0
def c14, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c15, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c16, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c8.y
mul r0.y, r0.x, c11.x
mul r0.z, r0.x, c11
mad r0.x, r0.y, c16, c16.y
mad r0.y, r0.z, c16.x, c16
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c16.z, c16.w
sincos r1.xy, r0.x, c15.xyzw, c14.xyzw
mad r2.x, r0.y, c16.z, c16.w
sincos r0.xy, r2.x, c15.xyzw, c14.xyzw
mov r0.w, v0
mul r0.y, r0, c11.w
mul r0.x, r1.y, c11.y
mul r0.x, r0, r0.y
mul r0.z, v5.w, c12.w
mul r0.x, r0, r0.z
mad r0.xyz, r0.x, c12, v0
dp4 oPos.w, r0, c3
dp4 oPos.z, r0, c2
dp4 oPos.y, r0, c1
dp4 oPos.x, r0, c0
mul r0.xyz, v2, c10.w
mov oD0, v5
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c9
mad oT0.xy, v3, c13, c13.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
"vs_4_0
eefiecedibaodbdamnkomdogmkmjhpgbombdnlhaabaaaaaanmaeaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcdmadaaaa
eaaaabaampaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaa
adaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaaagaaaaaa
enaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaagaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
dkbabaaaafaaaaaadkiacaaaaaaaaaaaahaaaaaadiaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiccaaaaaaaaaaaahaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaaf
pccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaa
acaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaa
adaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaa
dgaaaaaghccabaaaaeaaaaaaegiccaaaacaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 144
Vector 96 [_Waves]
Vector 112 [_Displace]
Vector 128 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
eefiecednfjmjnelpihobbgembpllmkopkdloklnabaaaaaajiahaaaaaeaaaaaa
daaaaaaaoiacaaaacmagaaaapeagaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
eaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaagaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaacaaaaaaabaaafaaaaaaaaaa
adaaaaaaaeaaagaaaaaaaaaaadaaamaaadaaakaaaaaaaaaaadaabeaaabaaanaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbaaaapkaidpjccdoaaaaaadpnlapmjea
nlapejmafbaaaaafaoaaapkaabannalfgballglhklkkckdlijiiiidjfbaaaaaf
apaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaacafaaaaiaaaaaapja
bpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafia
afaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaafaaaaadaaaaahia
acaaoejaanaappkaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaaeaaaaalia
akaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoaamaaoekaaaaakkiaaaaapeia
acaaaaadaaaaabiaafaaaajaaeaaffkaafaaaaadaaaaadiaaaaaaaiaabaaoika
aeaaaaaeaaaaadiaaaaaoeiabaaaaakabaaaffkabdaaaaacaaaaadiaaaaaoeia
aeaaaaaeaaaaadiaaaaaoeiabaaakkkabaaappkacfaaaaaeabaaaciaaaaaaaia
aoaaoekaapaaoekacfaaaaaeacaaaciaaaaaffiaaoaaoekaapaaoekaafaaaaad
aaaaabiaacaaffiaabaappkaafaaaaadaaaaaciaabaaffiaabaaffkaafaaaaad
aaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaaciaafaappjaacaappkaafaaaaad
aaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahiaaaaaaaiaacaaoekaaaaaoeja
afaaaaadabaaapiaaaaaffiaahaaoekaaeaaaaaeabaaapiaagaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaaiaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
ajaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejaabaaaaacadaaahoa
afaaoekappppaaaafdeieefcdmadaaaaeaaaabaampaaaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaagaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaagaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
ahaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaahaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaa
ogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaa
acaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_Waves]
Vector 17 [_Displace]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..18],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[13].y;
MUL R0.y, R0.x, c[16].x;
MUL R0.z, R0.x, c[16];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[19];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[19];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R1.xyz, R1, R0, c[21].zwzw;
ADD R3.xyz, R3, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R3.xyz, R3, R2, c[21].xyxw;
MAD R1.xyz, R1, R0, c[19].wzww;
MAD R3.xyz, R3, R2, c[21].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[22].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[22].xxyw;
MAD R1.xyz, R3, R2, c[19].wzww;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[19].wzww;
MOV R2.xz, R0;
DP3 R0.y, R1, -R2;
MUL R0.x, R1.w, c[16].y;
MUL R0.y, R0, c[16].w;
MOV R1.w, vertex.position;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[17].w;
MUL R0.x, R0, R0.z;
MAD R1.xyz, R0.x, c[17], vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].w, R0, c[12];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[14];
MUL R0.xyz, vertex.normal, c[15].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 59 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_Time]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Waves]
Vector 16 [_Displace]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c19, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c20, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c12.y
mul r0.y, r0.x, c15.x
mul r0.z, r0.x, c15
mad r0.x, r0.y, c20, c20.y
mad r0.y, r0.z, c20.x, c20
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r1.xy, r0.x, c19.xyzw, c18.xyzw
mad r2.x, r0.y, c20.z, c20.w
sincos r0.xy, r2.x, c19.xyzw, c18.xyzw
mov r1.w, v0
mul r0.x, r1.y, c15.y
mul r0.y, r0, c15.w
mul r0.x, r0, r0.y
mul r0.z, v5.w, c16.w
mul r0.x, r0, r0.z
mad r1.xyz, r0.x, c16, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.w, r0, c11
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c13
mul r0.xyz, v2, c14.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
"vs_4_0
eefiecediniecnbdlihdkdipmeighnngohencegjabaaaaaaneagaaaaadaaaaaa
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
feeffiedepepfceeaaedepemepfcaaklfdeieefcbmafaaaaeaaaabaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaa
akaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaakaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaalaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
eefiecedkoodgobcjomjhkhipebdiafmejdfmlfcabaaaaaaieakaaaaaeaaaaaa
daaaaaaanmadaaaaaaajaaaamiajaaaaebgpgodjkeadaaaakeadaaaaaaacpopp
ciadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaadaaafaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaa
acaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaaaaaaaaaaadaaamaaaeaaaoaa
aaaaaaaaadaabeaaabaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
idpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafbdaaapkaabannalfgballglh
klkkckdlijiiiidjfbaaaaafbeaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoeka
ahaaookaafaaaaadaaaaahiaacaaoejabcaappkaafaaaaadabaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
baaaoekaaaaakkiaaaaapeiaacaaaaadaaaaabiaafaaaajaaiaaffkaafaaaaad
aaaaadiaaaaaaaiaafaaoikaaeaaaaaeaaaaadiaaaaaoeiabfaaaakabfaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabfaakkkabfaappka
cfaaaaaeabaaaciaaaaaaaiabdaaoekabeaaoekacfaaaaaeacaaaciaaaaaffia
bdaaoekabeaaoekaafaaaaadaaaaabiaacaaffiaafaappkaafaaaaadaaaaacia
abaaffiaafaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaacia
afaappjaagaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahia
aaaaaaiaagaaoekaaaaaoejaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
abaaahiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiabaaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappjaabaaoeiaacaaaaadadaaahoa
abaaoeibajaaoekaafaaaaadabaaapiaaaaaffiaapaaoekaaeaaaaaeabaaapia
aoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabaaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaapiabbaaoekaaaaappjaabaaoeiaafaaaaadacaaapiaabaaffia
acaaoekaaeaaaaaeacaaapiaabaaoekaabaaaaiaacaaoeiaaeaaaaaeacaaapia
adaaoekaabaakkiaacaaoeiaaeaaaaaeaeaaapoaaeaaoekaabaappiaacaaoeia
afaaaaadabaaapiaaaaaffiaalaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
bmafaaaaeaaaabaaehabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
pccabaaaafaaaaaagiaaaaacadaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaakaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaakaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
alaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaaaaaaaaa
aeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaafaaaaaa
egiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegaobaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_Waves]
Vector 17 [_Displace]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..18],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[13].y;
MUL R0.y, R0.x, c[16].x;
MUL R0.z, R0.x, c[16];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[19];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[19];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R1.xyz, R1, R0, c[21].zwzw;
ADD R3.xyz, R3, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R3.xyz, R3, R2, c[21].xyxw;
MAD R1.xyz, R1, R0, c[19].wzww;
MAD R3.xyz, R3, R2, c[21].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[22].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[22].xxyw;
MAD R1.xyz, R3, R2, c[19].wzww;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[19].wzww;
MOV R2.xz, R0;
DP3 R0.y, R1, -R2;
MUL R0.x, R1.w, c[16].y;
MUL R0.y, R0, c[16].w;
MOV R1.w, vertex.position;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[17].w;
MUL R0.x, R0, R0.z;
MAD R1.xyz, R0.x, c[17], vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
ADD result.texcoord[2].xyz, -R0, c[14];
MUL R0.xyz, vertex.normal, c[15].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 58 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_Time]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Waves]
Vector 16 [_Displace]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c19, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c20, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c12.y
mul r0.y, r0.x, c15.x
mul r0.z, r0.x, c15
mad r0.x, r0.y, c20, c20.y
mad r0.y, r0.z, c20.x, c20
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r1.xy, r0.x, c19.xyzw, c18.xyzw
mad r2.x, r0.y, c20.z, c20.w
sincos r0.xy, r2.x, c19.xyzw, c18.xyzw
mov r1.w, v0
mul r0.x, r1.y, c15.y
mul r0.y, r0, c15.w
mul r0.x, r0, r0.y
mul r0.z, v5.w, c16.w
mul r0.x, r0, r0.z
mad r1.xyz, r0.x, c16, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
add oT2.xyz, -r0, c13
mul r0.xyz, v2, c14.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
"vs_4_0
eefiecedpmngoedelckkkoomkicookjhgopeabklabaaaaaaneagaaaaadaaaaaa
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
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbmafaaaaeaaaabaaehabaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaac
adaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaa
akaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaakaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaalaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaaogikcaaaaaaaaaaaamaaaaaa
dgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaabaaaaaa
egbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaadiaaaaaihcaabaaaacaaaaaa
fgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaaklcaabaaaabaaaaaa
egiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaaegaibaaaacaaaaaadcaaaaak
hccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaabaaaaaaegadbaaa
abaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaabaaaaaaaaaaaaaj
hccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaaegiccaaaacaaaaaaaaaaaaaa
diaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
adaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaa
egacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaa
pgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
eefiecedbencnhaipohnmgllaljckoihlncpfodeabaaaaaaieakaaaaaeaaaaaa
daaaaaaanmadaaaaaaajaaaamiajaaaaebgpgodjkeadaaaakeadaaaaaaacpopp
ciadaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaadaaafaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaa
acaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaaaaaaaaaaadaaamaaaeaaaoaa
aaaaaaaaadaabeaaabaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
idpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafbdaaapkaabannalfgballglh
klkkckdlijiiiidjfbaaaaafbeaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoeka
ahaaookaafaaaaadaaaaahiaacaaoejabcaappkaafaaaaadabaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
baaaoekaaaaakkiaaaaapeiaacaaaaadaaaaabiaafaaaajaaiaaffkaafaaaaad
aaaaadiaaaaaaaiaafaaoikaaeaaaaaeaaaaadiaaaaaoeiabfaaaakabfaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabfaakkkabfaappka
cfaaaaaeabaaaciaaaaaaaiabdaaoekabeaaoekacfaaaaaeacaaaciaaaaaffia
bdaaoekabeaaoekaafaaaaadaaaaabiaacaaffiaafaappkaafaaaaadaaaaacia
abaaffiaafaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaacia
afaappjaagaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahia
aaaaaaiaagaaoekaaaaaoejaafaaaaadabaaahiaaaaaffiaapaaoekaaeaaaaae
abaaahiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaahiabaaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaahiabbaaoekaaaaappjaabaaoeiaacaaaaadadaaahoa
abaaoeibajaaoekaafaaaaadabaaapiaaaaaffiaapaaoekaaeaaaaaeabaaapia
aoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabaaaoekaaaaakkiaabaaoeia
aeaaaaaeabaaapiabbaaoekaaaaappjaabaaoeiaafaaaaadacaaahiaabaaffia
acaaoekaaeaaaaaeacaaahiaabaaoekaabaaaaiaacaaoeiaaeaaaaaeabaaahia
adaaoekaabaakkiaacaaoeiaaeaaaaaeaeaaahoaaeaaoekaabaappiaabaaoeia
afaaaaadabaaapiaaaaaffiaalaaoekaaeaaaaaeabaaapiaakaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefc
bmafaaaaeaaaabaaehabaaaafjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaae
egiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaae
egiocaaaadaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacadaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaa
afaaaaaabkiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaa
aaaaaaaaigiacaaaaaaaaaaaakaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaa
egaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaa
aaaaaaaaakaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaaiccaabaaaaaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaa
alaaaaaadiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaa
egbcbaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaa
adaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaa
agaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaacaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaadaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaabaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaabaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaabaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaabaaaaaa
egaibaaaacaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaabaaaaaaegadbaaaabaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaadaaaaaaanaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaaabaaaaaa
egiccaaaacaaaaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaaaaaaaaa
aeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhccabaaaafaaaaaa
egiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_Time]
Vector 14 [_WorldSpaceLightPos0]
Vector 15 [unity_Scale]
Vector 16 [_Waves]
Vector 17 [_Displace]
Vector 18 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[23] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..18],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.color, c[13].y;
MUL R0.y, R0.x, c[16].x;
MUL R0.z, R0.x, c[16];
MAD R0.x, R0.y, c[0].z, -c[0].w;
FRC R1.w, R0.x;
MAD R0.y, R0.z, c[0].z, -c[0].w;
FRC R0.w, R0.y;
ADD R1.xyz, -R0.w, c[19];
MUL R2.xyz, R1, R1;
MUL R3.xyz, R2, c[0].xyxw;
ADD R0.xyz, -R1.w, c[19];
MUL R0.xyz, R0, R0;
MUL R1.xyz, R0, c[0].xyxw;
ADD R1.xyz, R1, c[20].xyxw;
MAD R1.xyz, R1, R0, c[20].zwzw;
MAD R1.xyz, R1, R0, c[21].xyxw;
MAD R1.xyz, R1, R0, c[21].zwzw;
ADD R3.xyz, R3, c[20].xyxw;
MAD R3.xyz, R3, R2, c[20].zwzw;
MAD R3.xyz, R3, R2, c[21].xyxw;
MAD R1.xyz, R1, R0, c[19].wzww;
MAD R3.xyz, R3, R2, c[21].zwzw;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[22].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[19].wzww;
DP3 R1.w, R1, -R0;
SGE R0.yz, R0.w, c[22].xxyw;
MAD R1.xyz, R3, R2, c[19].wzww;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[19].wzww;
MOV R2.xz, R0;
DP3 R0.y, R1, -R2;
MUL R0.x, R1.w, c[16].y;
MUL R0.y, R0, c[16].w;
MOV R1.w, vertex.position;
MUL R0.x, R0, R0.y;
MUL R0.z, vertex.color.w, c[17].w;
MUL R0.x, R0, R0.z;
MAD R1.xyz, R0.x, c[17], vertex.position;
DP4 R0.z, R1, c[7];
DP4 R0.x, R1, c[5];
DP4 R0.y, R1, c[6];
DP4 R0.w, R1, c[8];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
MUL R0.xyz, vertex.normal, c[15].w;
DP4 result.position.w, R1, c[4];
DP4 result.position.z, R1, c[3];
DP4 result.position.y, R1, c[2];
DP4 result.position.x, R1, c[1];
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[14];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
END
# 57 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_Time]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_Waves]
Vector 16 [_Displace]
Vector 17 [_MainTex_ST]
"vs_2_0
def c18, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c19, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c20, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_normal0 v2
dcl_texcoord0 v3
dcl_color0 v5
add r0.x, v5, c12.y
mul r0.y, r0.x, c15.x
mul r0.z, r0.x, c15
mad r0.x, r0.y, c20, c20.y
mad r0.y, r0.z, c20.x, c20
frc r0.y, r0
frc r0.x, r0
mad r0.x, r0, c20.z, c20.w
sincos r1.xy, r0.x, c19.xyzw, c18.xyzw
mad r2.x, r0.y, c20.z, c20.w
sincos r0.xy, r2.x, c19.xyzw, c18.xyzw
mov r1.w, v0
mul r0.x, r1.y, c15.y
mul r0.y, r0, c15.w
mul r0.x, r0, r0.y
mul r0.z, v5.w, c16.w
mul r0.x, r0, r0.z
mad r1.xyz, r0.x, c16, v0
dp4 r0.z, r1, c6
dp4 r0.x, r1, c4
dp4 r0.y, r1, c5
dp4 r0.w, r1, c7
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
mul r0.xyz, v2, c14.w
dp4 oPos.w, r1, c3
dp4 oPos.z, r1, c2
dp4 oPos.y, r1, c1
dp4 oPos.x, r1, c0
mov oD0, v5
dp3 oT1.z, r0, c6
dp3 oT1.y, r0, c5
dp3 oT1.x, r0, c4
mov oT2.xyz, c13
mad oT0.xy, v3, c17, c17.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
"vs_4_0
eefiecedpceokancnledehgoelhgpopcmhfajnijabaaaaaadaagaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefchiaeaaaaeaaaabaaboabaaaa
fjaaaaaeegiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaac
acaaaaaaaaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaa
aaaaaaaadiaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaa
akaaaaaaenaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaakaaaaaadiaaaaah
bcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaadkbabaaaafaaaaaadkiacaaaaaaaaaaaalaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegiccaaaaaaaaaaaalaaaaaaegbcbaaaaaaaaaaadiaaaaai
pcaabaaaabaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaak
pcaabaaaabaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaa
aaaaaaaaegaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaa
fgafbaaaaaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaa
egiocaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaak
mccabaaaabaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
amaaaaaaogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaacaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 208
Matrix 48 [_LightMatrix0]
Vector 160 [_Waves]
Vector 176 [_Displace]
Vector 192 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
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
eefiecedpckokeloibfjdafglmfaaopjffackhljabaaaaaajaajaaaaaeaaaaaa
daaaaaaaimadaaaaamaiaaaaneaiaaaaebgpgodjfeadaaaafeadaaaaaaacpopp
niacaaaahmaaaaaaahaaceaaaaaahiaaaaaahiaaaaaaceaaabaahiaaaaaaadaa
aeaaabaaaaaaaaaaaaaaakaaadaaafaaaaaaaaaaabaaaaaaabaaaiaaaaaaaaaa
acaaaaaaabaaajaaaaaaaaaaadaaaaaaaeaaakaaaaaaaaaaadaaamaaaeaaaoaa
aaaaaaaaadaabeaaabaabcaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafbfaaapka
idpjccdoaaaaaadpnlapmjeanlapejmafbaaaaafbdaaapkaabannalfgballglh
klkkckdlijiiiidjfbaaaaafbeaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaahaaoeka
ahaaookaafaaaaadaaaaahiaacaaoejabcaappkaafaaaaadabaaahiaaaaaffia
apaaoekaaeaaaaaeaaaaaliaaoaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
baaaoekaaaaakkiaaaaapeiaacaaaaadaaaaabiaafaaaajaaiaaffkaafaaaaad
aaaaadiaaaaaaaiaafaaoikaaeaaaaaeaaaaadiaaaaaoeiabfaaaakabfaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiabfaakkkabfaappka
cfaaaaaeabaaaciaaaaaaaiabdaaoekabeaaoekacfaaaaaeacaaaciaaaaaffia
bdaaoekabeaaoekaafaaaaadaaaaabiaacaaffiaafaappkaafaaaaadaaaaacia
abaaffiaafaaffkaafaaaaadaaaaabiaaaaaaaiaaaaaffiaafaaaaadaaaaacia
afaappjaagaappkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaaeaaaaaeaaaaahia
aaaaaaiaagaaoekaaaaaoejaafaaaaadabaaapiaaaaaffiaapaaoekaaeaaaaae
abaaapiaaoaaoekaaaaaaaiaabaaoeiaaeaaaaaeabaaapiabaaaoekaaaaakkia
abaaoeiaaeaaaaaeabaaapiabbaaoekaaaaappjaabaaoeiaafaaaaadacaaadia
abaaffiaacaaobkaaeaaaaaeabaaadiaabaaobkaabaaaaiaacaaoeiaaeaaaaae
abaaadiaadaaobkaabaakkiaabaaoeiaaeaaaaaeaaaaamoaaeaabekaabaappia
abaaeeiaafaaaaadabaaapiaaaaaffiaalaaoekaaeaaaaaeabaaapiaakaaoeka
aaaaaaiaabaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaakkiaabaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoeka
aaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoaafaaoejaabaaaaac
adaaahoaajaaoekappppaaaafdeieefchiaeaaaaeaaaabaaboabaaaafjaaaaae
egiocaaaaaaaaaaaanaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaaabaaaaaafjaaaaaeegiocaaaadaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaa
aaaaaaaibcaabaaaaaaaaaaaakbabaaaafaaaaaabkiacaaaabaaaaaaaaaaaaaa
diaaaaaidcaabaaaaaaaaaaaagaabaaaaaaaaaaaigiacaaaaaaaaaaaakaaaaaa
enaaaaagdcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaangifcaaaaaaaaaaaakaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaiccaabaaaaaaaaaaa
dkbabaaaafaaaaaadkiacaaaaaaaaaaaalaaaaaadiaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiccaaaaaaaaaaaalaaaaaaegbcbaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgafbaaaaaaaaaaaegiocaaaadaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaadaaaaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaadaaaaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaadaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaadaaaaaaanaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
adaaaaaaamaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaadaaaaaaaoaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaadaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaa
aaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
agaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
aaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaa
abaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaamaaaaaa
ogikcaaaaaaaaaaaamaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaadaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaadaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaadaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaadaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaa
acaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R0, fragment.color.primary;
MUL R0.xyz, R0, c[0];
MOV result.color.w, R0;
TEX R1.w, R1.x, texture[1], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[1];
MUL R1.x, R1, R1.w;
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mul r1.xyz, r1, v0
mul_pp r1.xyz, r1, c0
mov_pp r0.w, r1
texld r2, r0, s1
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t2
dp3_pp r0.x, t1, r0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedilmbololgemadkahieicoalalaekdcpdabaaaaaadiadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
beacaaaaeaaaaaaaifaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedphkociphomdmgjpnadmjkahdjngiadghabaaaaaaliaeaaaaaeaaaaaa
daaaaaaakmabaaaamiadaaaaieaeaaaaebgpgodjheabaaaaheabaaaaaaacpppp
dmabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioekaceaaaaac
acaachiaadaaoelaaiaaaaadaaaacciaacaaoelaacaaoeiaafaaaaadaaaacbia
aaaaaaiaaaaaffiafiaaaaaeaaaacbiaaaaaffiaaaaaaaiaabaaaakaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaabllaafaaaaad
aaaacoiaaaaaoeiaaaaablkaafaaaaadabaachiaaaaaaaiaaaaabliaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefcbeacaaaaeaaaaaaaifaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[1];
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, R0;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mov_pp r1.xyz, t2
mul r0.xyz, r0, v0
dp3_pp r1.x, t1, r1
mul_pp r0.xyz, r0, c0
max_pp r1.x, r1, c1
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlbfgjnfhddpjbambomnkgomnoagbfoliabaaaaaagmacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcgaabaaaaeaaaaaaafiaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedonpbgaafimlodggidfcpmjcoagnpnijkabaaaaaajaadaaaaaeaaaaaa
daaaaaaafaabaaaaliacaaaafmadaaaaebgpgodjbiabaaaabiabaaaaaaacpppp
oeaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaja
aaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaabaaaaacabaaahiaacaaoela
aiaaaaadabaacbiaabaaoeiaadaaoelaalaaaaadacaaciiaabaaaaiaabaaaaka
acaaaaadabaacbiaacaappiaacaappiaafaaaaadabaacoiaaaaabliaabaablla
afaaaaadabaacoiaabaaoeiaaaaablkaafaaaaadaaaachiaabaaaaiaabaablia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgaabaaaaeaaaaaaafiaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RCP R0.x, fragment.texcoord[3].w;
MAD R0.xy, fragment.texcoord[3], R0.x, c[1].y;
MOV result.color.w, R2;
TEX R0.w, R0, texture[1], 2D;
TEX R1.w, R0.z, texture[2], 2D;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R0.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
SLT R1.y, c[1].x, fragment.texcoord[3].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R2, fragment.color.primary;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 20 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r2, t0, s0
dp3 r0.x, t3, t3
rcp r1.x, t3.w
mov r0.xy, r0.x
mad r1.xy, t3, r1.x, c1.x
mul r2.xyz, r2, v0
mul_pp r2.xyz, r2, c0
texld r0, r0, s2
texld r1, r1, s1
cmp r1.x, -t3.z, c1.y, c1.z
mul_pp r3.x, r1, r1.w
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
mul_pp r0.x, r3, r0
max_pp r1.x, r1, c1.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.w
mov_pp r0.w, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkbilahhdkgooecojppempkdcilgfiompabaaaaaacmaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aiadaaaaeaaaaaaamcaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaak
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaa
afaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaa
aeaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaa
deaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedocibmnckcjionhfpmpoaadoholkfpeinabaaaaaaamagaaaaaeaaaaaa
daaaaaaaamacaaaabmafaaaaniafaaaaebgpgodjneabaaaaneabaaaaaaacpppp
jiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaaeaaaaae
aaaaadiaaeaaoelaaaaappiaabaaaakaaiaaaaadabaaaiiaaeaaoelaaeaaoela
abaaaaacabaaadiaabaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
aaaacbiaaaaappiaabaaaaiafiaaaaaeaaaacbiaaeaakklbabaaffkaaaaaaaia
ceaaaaacabaachiaadaaoelaaiaaaaadaaaacciaacaaoelaabaaoeiaalaaaaad
abaacbiaaaaaffiaabaaffkaafaaaaadaaaacbiaaaaaaaiaabaaaaiaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaacaabliaabaabllaafaaaaad
aaaacoiaaaaaoeiaaaaablkaafaaaaadacaachiaaaaaaaiaaaaabliaabaaaaac
aaaicpiaacaaoeiappppaaaafdeieefcaiadaaaaeaaaaaaamcaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaa
agbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaai
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[2], CUBE;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
MOV result.color.w, R2;
TEX R0.w, R0.x, texture[1], 2D;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R0.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R2, fragment.color.primary;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 16 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r2, t3, s2
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
dp3_pp r2.x, t2, t2
rsq_pp r2.x, r2.x
mul_pp r2.xyz, r2.x, t2
mul r1.xyz, r1, v0
dp3_pp r2.x, t1, r2
mul_pp r1.xyz, r1, c0
max_pp r2.x, r2, c1
texld r0, r0, s1
mul r0.x, r0, r2.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedohlakkchopibhcjamahiailcflnnmlbaabaaaaaajeadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
haacaaaaeaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
acaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedglpdejmfnfipnpjfcjfgniigpcdbnbdbabaaaaaaeaafaaaaaeaaaaaa
daaaaaaaniabaaaafaaeaaaaamafaaaaebgpgodjkaabaaaakaabaaaaaaacpppp
geabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
abaaapiaaeaaoelaaaaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
aaaacbiaaaaaaaiaabaappiaceaaaaacabaachiaadaaoelaaiaaaaadaaaaccia
acaaoelaabaaoeiaalaaaaadabaacbiaaaaaffiaabaaaakaafaaaaadaaaacbia
aaaaaaiaabaaaaiaacaaaaadaaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoia
acaabliaabaabllaafaaaaadaaaacoiaaaaaoeiaaaaablkaafaaaaadacaachia
aaaaaaiaaaaabliaabaaaaacaaaicpiaacaaoeiappppaaaafdeieefchaacaaaa
eaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[1], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[1];
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, R1.w;
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, R0;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t3, s1
texld r1, t0, s0
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
mul r1.xyz, r1, v0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedakjnccmdmjocmajikkcoehmeijgccnemabaaaaaanaacaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
kmabaaaaeaaaaaaaglaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 208
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeonfndndlbelolliokjbpdhlddgbneneabaaaaaadeaeaaaaaeaaaaaa
daaaaaaajaabaaaaeeadaaaaaaaeaaaaebgpgodjfiabaaaafiabaaaaaaacpppp
caabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaablla
ecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioeka
abaaaaacaaaaahiaacaaoelaaiaaaaadaaaacbiaaaaaoeiaadaaoelaafaaaaad
aaaacciaaaaappiaaaaaaaiafiaaaaaeaaaacbiaaaaaaaiaaaaaffiaabaaaaka
acaaaaadaaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaablla
afaaaaadaaaacoiaaaaaoeiaaaaablkaafaaaaadabaachiaaaaaaaiaaaaablia
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefckmabaaaaeaaaaaaaglaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
agaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
abaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
doaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Blend SrcAlpha OneMinusSrcAlpha
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
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
Vector 17 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[18] = { { 1 },
		state.matrix.mvp,
		program.local[5..17] };
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
ADD result.texcoord[2].xyz, R2, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R2.w;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 28 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
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
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c15.w
dp3 r3.w, r1, c5
dp3 r2.w, r1, c6
dp3 r0.x, r1, c4
mov r0.y, r3.w
mov r0.z, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c17.x
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
add oT2.xyz, r2, r1
mov oD0, v3
mov oT1.z, r2.w
mov oT1.y, r3.w
mov oT1.x, r0
mad oT0.xy, v2, c16, c16.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedeggfniaafbedanhipaodginoedoefhiaabaaaaaaeiafaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefckiadaaaa
eaaaabaaokaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaak
hccabaaaaeaaaaaaegiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedggehcoalgeppkolhelbeifbedomgohbpabaaaaaakmahaaaaaeaaaaaa
daaaaaaajaacaaaaeaagaaaaaiahaaaaebgpgodjfiacaaaafiacaaaaaaacpopp
peabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaacgaaahaaacaaaaaaaaaaacaaaaaaaeaaajaaaaaaaaaa
acaaamaaadaaanaaaaaaaaaaacaabeaaabaabaaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbbaaapkaaaaaiadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoekaabaaookaafaaaaad
aaaaahiaacaaoejabaaappkaafaaaaadabaaahiaaaaaffiaaoaaoekaaeaaaaae
aaaaaliaanaakekaaaaaaaiaabaakeiaaeaaaaaeaaaaahiaapaaoekaaaaakkia
aaaapeiaabaaaaacaaaaaiiabbaaaakaajaaaaadabaaabiaacaaoekaaaaaoeia
ajaaaaadabaaaciaadaaoekaaaaaoeiaajaaaaadabaaaeiaaeaaoekaaaaaoeia
afaaaaadacaaapiaaaaacjiaaaaakeiaajaaaaadadaaabiaafaaoekaacaaoeia
ajaaaaadadaaaciaagaaoekaacaaoeiaajaaaaadadaaaeiaahaaoekaacaaoeia
acaaaaadabaaahiaabaaoeiaadaaoeiaafaaaaadaaaaaiiaaaaaffiaaaaaffia
aeaaaaaeaaaaaiiaaaaaaaiaaaaaaaiaaaaappibabaaaaacacaaahoaaaaaoeia
aeaaaaaeadaaahoaaiaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffja
akaaoekaaeaaaaaeaaaaapiaajaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
alaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaamaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefckiadaaaaeaaaabaaokaaaaaa
fjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaacnaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
giaaaaacaeaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
diaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaa
diaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaa
egaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaaegacbaaa
aaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaaibcaabaaa
abaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaaiccaabaaa
abaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaaiecaabaaa
abaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaahpcaabaaa
acaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaaadaaaaaa
egiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaaadaaaaaa
egiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaaadaaaaaa
egiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadcaaaaakhccabaaaaeaaaaaa
egiccaaaabaaaaaacmaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadamaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaa
imaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedlmnblmkdcnbkpkkjdllioipichfbdpafabaaaaaaceadaaaaadaaaaaa
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
fdeieefcjmabaaaaeaaaabaaghaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedfhhhbdfcibgmalknbfmgkfjkcnofoihlabaaaaaaeiaeaaaaaeaaaaaa
daaaaaaafaabaaaapeacaaaalmadaaaaebgpgodjbiabaaaabiabaaaaaaacpopp
niaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
aeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffja
aeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefcjmabaaaaeaaaabaaghaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadgaaaaaf
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedlmnblmkdcnbkpkkjdllioipichfbdpafabaaaaaaceadaaaaadaaaaaa
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
fdeieefcjmabaaaaeaaaabaaghaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaa
dcaaaaalmccabaaaabaaaaaaagbebaaaaeaaaaaaagiecaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 96
Vector 64 [unity_LightmapST]
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedfhhhbdfcibgmalknbfmgkfjkcnofoihlabaaaaaaeiaeaaaaaeaaaaaa
daaaaaaafaabaaaapeacaaaalmadaaaaebgpgodjbiabaaaabiabaaaaaaacpopp
niaaaaaaeaaaaaaaacaaceaaaaaadmaaaaaadmaaaaaaceaaabaadmaaaaaaaeaa
acaaabaaaaaaaaaaabaaaaaaaeaaadaaaaaaaaaaaaaaaaaaaaacpoppbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaacaaoekaacaaooka
aeaaaaaeaaaaamoaaeaabejaabaabekaabaalekaafaaaaadaaaaapiaaaaaffja
aeaaoekaaeaaaaaeaaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
afaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeia
aeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeia
abaaaaacabaaapoaafaaoejappppaaaafdeieefcjmabaaaaeaaaabaaghaaaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
afaaaaaaogikcaaaaaaaaaaaafaaaaaadcaaaaalmccabaaaabaaaaaaagbebaaa
aeaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaadgaaaaaf
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
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
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
Vector 25 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[26] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..25] };
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
ADD result.texcoord[2].xyz, R0, R1;
MOV result.color, vertex.color;
MOV result.texcoord[1].z, R3.x;
MOV result.texcoord[1].y, R3.w;
MOV result.texcoord[1].x, R4;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[25], c[25].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 58 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
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
Vector 24 [_MainTex_ST]
"vs_2_0
def c25, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
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
mov r4.w, c25.x
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
add r1, r2, c25.x
dp4 r2.z, r4, c18
dp4 r2.y, r4, c17
dp4 r2.x, r4, c16
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c25.y
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
add oT2.xyz, r0, r1
mov oD0, v3
mov oT1.z, r3.x
mov oT1.y, r3.w
mov oT1.x, r4
mad oT0.xy, v2, c24, c24.zwzw
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefieceddlodjlfjaknmhbaeoooomjlblhaoadkaabaaaaaajiaiaaaaadaaaaaa
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
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklfdeieefcpiagaaaa
eaaaabaaloabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaacnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaa
adaaaaaaegacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadp
bbaaaaaibcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaa
bbaaaaaiccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaa
bbaaaaaiecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaa
diaaaaahpcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaai
bcaabaaaadaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaai
ccaabaaaadaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaai
ecaabaaaadaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaa
aaaaaaaabkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaa
aoaaaaaakgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaa
egiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaaj
pcaabaaaadaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaa
diaaaaahpcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaah
pcaabaaaadaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaa
afaaaaaaagaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaaj
pcaabaaaacaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaa
dcaaaaajpcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaa
egaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaa
afaaaaaaegaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaa
egaobaaaacaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaa
acaaaaaadcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaa
afaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaa
acaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaak
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaa
diaaaaaihcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaa
kgakbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
abaaaaaaajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaa
aeaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedlmehbbfffgjclafaljgooddhiookilccabaaaaaaaaanaaaaaeaaaaaa
daaaaaaajeaeaaaajealaaaafmamaaaaebgpgodjfmaeaaaafmaeaaaaaaacpopp
omadaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaaeaa
abaaabaaaaaaaaaaabaaacaaaiaaacaaaaaaaaaaabaacgaaahaaakaaaaaaaaaa
acaaaaaaaeaabbaaaaaaaaaaacaaamaaaeaabfaaaaaaaaaaacaabeaaabaabjaa
aaaaaaaaaaaaaaaaaaacpoppfbaaaaafbkaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoeja
abaaoekaabaaookaafaaaaadaaaaahiaaaaaffjabgaaoekaaeaaaaaeaaaaahia
bfaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabhaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaahiabiaaoekaaaaappjaaaaaoeiaacaaaaadabaaapiaaaaaffib
adaaoekaafaaaaadacaaapiaabaaoeiaabaaoeiaacaaaaadadaaapiaaaaaaaib
acaaoekaacaaaaadaaaaapiaaaaakkibaeaaoekaaeaaaaaeacaaapiaadaaoeia
adaaoeiaacaaoeiaaeaaaaaeacaaapiaaaaaoeiaaaaaoeiaacaaoeiaahaaaaac
aeaaabiaacaaaaiaahaaaaacaeaaaciaacaaffiaahaaaaacaeaaaeiaacaakkia
ahaaaaacaeaaaiiaacaappiaabaaaaacafaaabiabkaaaakaaeaaaaaeacaaapia
acaaoeiaafaaoekaafaaaaiaafaaaaadafaaahiaacaaoejabjaappkaafaaaaad
agaaahiaafaaffiabgaaoekaaeaaaaaeafaaaliabfaakekaafaaaaiaagaakeia
aeaaaaaeafaaahiabhaaoekaafaakkiaafaapeiaafaaaaadabaaapiaabaaoeia
afaaffiaaeaaaaaeabaaapiaadaaoeiaafaaaaiaabaaoeiaaeaaaaaeaaaaapia
aaaaoeiaafaakkiaabaaoeiaafaaaaadaaaaapiaaeaaoeiaaaaaoeiaalaaaaad
aaaaapiaaaaaoeiabkaaffkaagaaaaacabaaabiaacaaaaiaagaaaaacabaaacia
acaaffiaagaaaaacabaaaeiaacaakkiaagaaaaacabaaaiiaacaappiaafaaaaad
aaaaapiaaaaaoeiaabaaoeiaafaaaaadabaaahiaaaaaffiaahaaoekaaeaaaaae
abaaahiaagaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaaiaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaajaaoekaaaaappiaaaaaoeiaabaaaaacafaaaiia
bkaaaakaajaaaaadabaaabiaakaaoekaafaaoeiaajaaaaadabaaaciaalaaoeka
afaaoeiaajaaaaadabaaaeiaamaaoekaafaaoeiaafaaaaadacaaapiaafaacjia
afaakeiaajaaaaadadaaabiaanaaoekaacaaoeiaajaaaaadadaaaciaaoaaoeka
acaaoeiaajaaaaadadaaaeiaapaaoekaacaaoeiaacaaaaadabaaahiaabaaoeia
adaaoeiaafaaaaadaaaaaiiaafaaffiaafaaffiaaeaaaaaeaaaaaiiaafaaaaia
afaaaaiaaaaappibabaaaaacacaaahoaafaaoeiaaeaaaaaeabaaahiabaaaoeka
aaaappiaabaaoeiaacaaaaadadaaahoaaaaaoeiaabaaoeiaafaaaaadaaaaapia
aaaaffjabcaaoekaaeaaaaaeaaaaapiabbaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiabdaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiabeaaoekaaaaappja
aaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaamma
aaaaoeiaabaaaaacabaaapoaafaaoejappppaaaafdeieefcpiagaaaaeaaaabaa
loabaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
cnaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacagaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaafhccabaaaadaaaaaa
egacbaaaaaaaaaaadgaaaaaficaabaaaaaaaaaaaabeaaaaaaaaaiadpbbaaaaai
bcaabaaaabaaaaaaegiocaaaabaaaaaacgaaaaaaegaobaaaaaaaaaaabbaaaaai
ccaabaaaabaaaaaaegiocaaaabaaaaaachaaaaaaegaobaaaaaaaaaaabbaaaaai
ecaabaaaabaaaaaaegiocaaaabaaaaaaciaaaaaaegaobaaaaaaaaaaadiaaaaah
pcaabaaaacaaaaaajgacbaaaaaaaaaaaegakbaaaaaaaaaaabbaaaaaibcaabaaa
adaaaaaaegiocaaaabaaaaaacjaaaaaaegaobaaaacaaaaaabbaaaaaiccaabaaa
adaaaaaaegiocaaaabaaaaaackaaaaaaegaobaaaacaaaaaabbaaaaaiecaabaaa
adaaaaaaegiocaaaabaaaaaaclaaaaaaegaobaaaacaaaaaaaaaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaaegacbaaaadaaaaaadiaaaaahicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaabaaaaaacmaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaa
dcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaacaaaaaaegiccaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegacbaaaacaaaaaaaaaaaaajpcaabaaa
adaaaaaafgafbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaadaaaaaadiaaaaah
pcaabaaaaeaaaaaafgafbaaaaaaaaaaaegaobaaaadaaaaaadiaaaaahpcaabaaa
adaaaaaaegaobaaaadaaaaaaegaobaaaadaaaaaaaaaaaaajpcaabaaaafaaaaaa
agaabaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaacaaaaaaaaaaaaajpcaabaaa
acaaaaaakgakbaiaebaaaaaaacaaaaaaegiocaaaabaaaaaaaeaaaaaadcaaaaaj
pcaabaaaaeaaaaaaegaobaaaafaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaa
dcaaaaajpcaabaaaaaaaaaaaegaobaaaacaaaaaakgakbaaaaaaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaegaobaaaafaaaaaaegaobaaaafaaaaaa
egaobaaaadaaaaaadcaaaaajpcaabaaaacaaaaaaegaobaaaacaaaaaaegaobaaa
acaaaaaaegaobaaaadaaaaaaeeaaaaafpcaabaaaadaaaaaaegaobaaaacaaaaaa
dcaaaaanpcaabaaaacaaaaaaegaobaaaacaaaaaaegiocaaaabaaaaaaafaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpaoaaaaakpcaabaaaacaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpegaobaaaacaaaaaadiaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaadaaaaaadeaaaaakpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaahpcaabaaaaaaaaaaaegaobaaaacaaaaaaegaobaaaaaaaaaaadiaaaaai
hcaabaaaacaaaaaafgafbaaaaaaaaaaaegiccaaaabaaaaaaahaaaaaadcaaaaak
hcaabaaaacaaaaaaegiccaaaabaaaaaaagaaaaaaagaabaaaaaaaaaaaegacbaaa
acaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaaaiaaaaaakgakbaaa
aaaaaaaaegacbaaaacaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaabaaaaaa
ajaaaaaapgapbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaahhccabaaaaeaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
jmaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaajfaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaaimaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[4] = { program.local[0..2],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R0, fragment.color.primary;
MUL R2.xyz, R1, fragment.texcoord[2];
DP3 R1.w, fragment.texcoord[1], c[0];
MUL R1.xyz, R1, c[1];
MAX R1.w, R1, c[3].x;
MUL R1.xyz, R1.w, R1;
MAD R1.xyz, R1, c[3].y, R2;
MAD result.color.xyz, R0, c[2], R1;
MOV result.color.w, R0;
END
# 10 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Vector 0 [_WorldSpaceLightPos0]
Vector 1 [_LightColor0]
Vector 2 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c3, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r1, t0, s0
mul r2.xyz, r1, v0
mul_pp r3.xyz, r2, t2
dp3_pp r0.x, t1, c0
mul_pp r2.xyz, r2, c1
max_pp r0.x, r0, c3
mul_pp r0.xyz, r0.x, r2
mad_pp r0.xyz, r0, c3.y, r3
mad_pp r0.xyz, r1, c2, r0
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Vector 48 [_EmissiveColor]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0
eefiecedonkjjbfkdlgfficgnhplfcppppndecjoabaaaaaammacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
Vector 48 [_EmissiveColor]
ConstBuffer "UnityLighting" 720
Vector 0 [_WorldSpaceLightPos0]
BindCB  "$Globals" 0
BindCB  "UnityLighting" 1
"ps_4_0_level_9_1
eefiecedjgbofmoalofdgdngijecdmjfebidlfcnabaaaaaaceaeaaaaaeaaaaaa
daaaaaaaieabaaaaemadaaaapaadaaaaebgpgodjemabaaaaemabaaaaaaacpppp
aaabaaaaemaaaaaaadaaciaaaaaaemaaaaaaemaaabaaceaaaaaaemaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaaaadaaabaaabaaaaaaaaaaabaaaaaaabaaacaa
aaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkaecaaaaad
aaaacpiaaaaaoelaaaaioekaaiaaaaadabaaciiaacaaoelaacaaoekaalaaaaad
acaaciiaabaappiaadaaaakaacaaaaadabaacbiaacaappiaacaappiaafaaaaad
abaacoiaaaaabliaabaabllaafaaaaadacaachiaabaabliaaaaaoekaafaaaaad
abaacoiaabaaoeiaadaabllaaeaaaaaeabaachiaacaaoeiaabaaaaiaabaablia
aeaaaaaeaaaachiaaaaaoeiaabaaoekaabaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcmaabaaaaeaaaaaaahaaaaaaafjaaaaaeegiocaaaaaaaaaaa
aeaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafkaaaaadaagabaaaaaaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaaibcaabaaaaaaaaaaa
egbcbaaaadaaaaaaegiccaaaabaaaaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaa
abaaaaaaagbjbaaaacaaaaaadiaaaaaihcaabaaaacaaaaaajgahbaaaaaaaaaaa
egiccaaaaaaaaaaaabaaaaaadiaaaaahocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agbjbaaaaeaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadcaaaaakhccabaaaaaaaaaaaegacbaaaabaaaaaa
egiccaaaaaaaaaaaadaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadoaaaaabejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].x, R2;
MOV result.color.w, R0;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mad_pp r0.xyz, r0, c1.x, r2
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 96
Vector 48 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedejlfnncoofgmlmppmjcpgimjpamlgkoeabaaaaaaheacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 96
Vector 48 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhcanonffeomoaheihmcechhhonjdmdeiabaaaaaajeadaaaaaeaaaaaa
daaaaaaaemabaaaaneacaaaagaadaaaaebgpgodjbeabaaaabeabaaaaaaacpppp
nmaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaadaaaachia
aaaaoeiaaaaappiaafaaaaadacaachiaabaaoeiaabaaoelaafaaaaadadaachia
abaaoeiaaaaaoekaaeaaaaaeabaachiaacaaoeiaaaaaoeiaadaaoeiaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1, fragment.texcoord[1], texture[1], 2D;
MUL R2.xyz, R0, c[0];
MUL R0.xyz, R0, fragment.color.primary;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R1, R0;
MAD result.color.xyz, R0, c[1].x, R2;
MOV result.color.w, R0;
END
# 8 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
Vector 0 [_EmissiveColor]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xy
texld r1, t0, s0
texld r0, t1, s1
mul_pp r2.xyz, r1, c0
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, v0
mul_pp r0.xyz, r0, r1
mad_pp r0.xyz, r0, c1.x, r2
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 96
Vector 48 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0
eefiecedejlfnncoofgmlmppmjcpgimjpamlgkoeabaaaaaaheacaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [unity_Lightmap] 2D 1
ConstBuffer "$Globals" 96
Vector 48 [_EmissiveColor]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedhcanonffeomoaheihmcechhhonjdmdeiabaaaaaajeadaaaaaeaaaaaa
daaaaaaaemabaaaaneacaaaagaadaaaaebgpgodjbeabaaaabeabaaaaaaacpppp
nmaaaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaadaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaeb
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaac
aaaaadiaaaaabllaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
aaaaoelaaaaioekaafaaaaadaaaaciiaaaaappiaabaaaakaafaaaaadaaaachia
aaaaoeiaaaaappiaafaaaaadacaachiaabaaoeiaabaaoelaafaaaaadadaachia
abaaoeiaaaaaoekaaeaaaaaeabaachiaacaaoeiaaaaaoeiaadaaoeiaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefciaabaaaaeaaaaaaagaaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaaaaaaaaaegacbaaaaaaaaaaapgapbaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegbcbaaaacaaaaaadiaaaaaihcaabaaa
abaaaaaaegacbaaaabaaaaaaegiccaaaaaaaaaaaadaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaacaaaaaa
egacbaaaaaaaaaaaegacbaaaabaaaaaadoaaaaabejfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
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
eefiecedbdjnnncdhfphgpkgdednapfefnhjoobcabaaaaaammafaaaaadaaaaaa
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
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
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
eefiecedojlkkihcaamekjfghbeabhhmdhmeaakaabaaaaaaeiaiaaaaaeaaaaaa
daaaaaaakiacaaaameagaaaaimahaaaaebgpgodjhaacaaaahaacaaaaaaacpopp
aaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappka
afaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappja
aaaaoeiaacaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffja
amaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeia
afaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoa
aeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaae
aaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejappppaaaafdeieefcbeaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
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
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceLightPos0]
Vector 10 [unity_Scale]
Vector 11 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[12] = { program.local[0],
		state.matrix.mvp,
		program.local[5..11] };
TEMP R0;
MUL R0.xyz, vertex.normal, c[10].w;
MOV result.color, vertex.color;
DP3 result.texcoord[1].z, R0, c[7];
DP3 result.texcoord[1].y, R0, c[6];
DP3 result.texcoord[1].x, R0, c[5];
MOV result.texcoord[2].xyz, c[9];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[11], c[11].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 11 instructions, 1 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceLightPos0]
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
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedjodaicdkjoacgjipmcifaffkmoeffofaabaaaaaaneadaaaaadaaaaaa
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
eaaaabaainaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaa
aaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaa
egbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaa
acaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaa
acaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaa
agaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaa
acaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaa
aeaaaaaaegiccaaaabaaaaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
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
eefiecedeofloakdnebmjbhefmkdadelgakdkaapabaaaaaafmafaaaaaeaaaaaa
daaaaaaaleabaaaapaadaaaaliaeaaaaebgpgodjhmabaaaahmabaaaaaaacpopp
biabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaaeaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaamaaadaaahaaaaaaaaaaacaabeaaabaaakaaaaaaaaaaaaaaaaaaaaacpopp
bpaaaaacafaaaaiaaaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadia
adaaapjabpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadoaadaaoejaabaaoeka
abaaookaafaaaaadaaaaahiaacaaoejaakaappkaafaaaaadabaaahiaaaaaffia
aiaaoekaaeaaaaaeaaaaaliaahaakekaaaaaaaiaabaakeiaaeaaaaaeacaaahoa
ajaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaae
aaaaapiaadaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejaabaaaaacadaaahoaacaaoekappppaaaafdeieefcdeacaaaaeaaaabaa
inaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
abaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaa
afaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
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
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].w, R0, c[12];
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.w, r0, c11
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
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
eefiecedpabioecldmoobkngdadehlmehijkkmacabaaaaaammafaaaaadaaaaaa
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
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadpccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiocaaaaaaaaaaaaeaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpccabaaaafaaaaaaegiocaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egaobaaaabaaaaaadoaaaaab"
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
eefiecedkdmgloakibkpjaienbbeadjeelnnnnfbabaaaaaaeiaiaaaaaeaaaaaa
daaaaaaakiacaaaameagaaaaimahaaaaebgpgodjhaacaaaahaacaaaaaaacpopp
aaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappka
afaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappja
aaaaoeiaacaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffja
amaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeia
afaaaaadabaaapiaaaaaffiaacaaoekaaeaaaaaeabaaapiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeabaaapiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaapoa
aeaaoekaaaaappiaabaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaae
aaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejappppaaaafdeieefcbeaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
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
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP4 R0.w, vertex.position, c[8];
MOV result.color, vertex.color;
DP4 result.texcoord[3].z, R0, c[11];
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
ADD result.texcoord[2].xyz, -R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r0.w, v0, c7
mov oD0, v3
dp4 oT3.z, r0, c10
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
add oT2.xyz, -r0, c12
mad oT0.xy, v2, c14, c14.zwzw
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
eefiecedbdjnnncdhfphgpkgdednapfefnhjoobcabaaaaaammafaaaaadaaaaaa
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
adaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefcbeaeaaaaeaaaabaaafabaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaa
gfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaa
egiacaaaaaaaaaaaaiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaa
acaaaaaaegbobaaaafaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaa
pgipcaaaacaaaaaabeaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiccaaaacaaaaaaanaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaa
amaaaaaaagaabaaaaaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaa
egiccaaaacaaaaaaaoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaai
hcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaa
aaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaa
apaaaaaapgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaa
egacbaiaebaaaaaaaaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaa
aaaaaaaaegiccaaaaaaaaaaaaeaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
aaaaaaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhccabaaaafaaaaaaegiccaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaadoaaaaab"
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
eefiecedojlkkihcaamekjfghbeabhhmdhmeaakaabaaaaaaeiaiaaaaaeaaaaaa
daaaaaaakiacaaaameagaaaaimahaaaaebgpgodjhaacaaaahaacaaaaaaacpopp
aaacaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappka
afaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaahia
aaaaffjaamaaoekaaeaaaaaeaaaaahiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaahiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaaoaaoekaaaaappja
aaaaoeiaacaaaaadadaaahoaaaaaoeibagaaoekaafaaaaadaaaaapiaaaaaffja
amaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapia
anaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeia
afaaaaadabaaahiaaaaaffiaacaaoekaaeaaaaaeabaaahiaabaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaadaaoekaaaaakkiaabaaoeiaaeaaaaaeaeaaahoa
aeaaoekaaaaappiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaiaaoekaaeaaaaae
aaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaaeaaaaadma
aaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacabaaapoa
afaaoejappppaaaafdeieefcbeaeaaaaeaaaabaaafabaaaafjaaaaaeegiocaaa
aaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadhccabaaa
afaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadiaaaaaihcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaa
egiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegacbaaaaaaaaaaaaaaaaaajhccabaaaaeaaaaaaegacbaiaebaaaaaa
aaaaaaaaegiccaaaabaaaaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
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
apapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffied
epepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaakl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Matrix 9 [_LightMatrix0]
Vector 13 [_WorldSpaceLightPos0]
Vector 14 [unity_Scale]
Vector 15 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[16] = { program.local[0],
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
MUL R1.xyz, vertex.normal, c[14].w;
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MOV result.color, vertex.color;
DP4 result.texcoord[3].y, R0, c[10];
DP4 result.texcoord[3].x, R0, c[9];
DP3 result.texcoord[1].z, R1, c[7];
DP3 result.texcoord[1].y, R1, c[6];
DP3 result.texcoord[1].x, R1, c[5];
MOV result.texcoord[2].xyz, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 17 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "color" Color
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Matrix 8 [_LightMatrix0]
Vector 12 [_WorldSpaceLightPos0]
Vector 13 [unity_Scale]
Vector 14 [_MainTex_ST]
"vs_2_0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_color0 v3
mul r1.xyz, v1, c13.w
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mov oD0, v3
dp4 oT3.y, r0, c9
dp4 oT3.x, r0, c8
dp3 oT1.z, r1, c6
dp3 oT1.y, r1, c5
dp3 oT1.x, r1, c4
mov oT2.xyz, c12
mad oT0.xy, v2, c14, c14.zwzw
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
eefiecedahdocpbdigkddjnlfghagpoimnodifkjabaaaaaaciafaaaaadaaaaaa
cmaaaaaapeaaaaaalaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklfdeieefchaadaaaaeaaaabaanmaaaaaa
fjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaa
fjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
hcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaa
gfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
amaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaaegiacaaaaaaaaaaa
aeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaagaabaaa
aaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaakmccabaaaabaaaaaa
agiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaiaaaaaaogikcaaa
aaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaadiaaaaai
hcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaabeaaaaaadiaaaaai
hcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaak
lcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaaaaaaaaaaegaibaaa
abaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaaaoaaaaaakgakbaaa
aaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaaegiccaaaabaaaaaa
aaaaaaaadoaaaaab"
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
eefieceddjijpoghgnkmecohjggopbaicniignbaabaaaaaafeahaaaaaeaaaaaa
daaaaaaafiacaaaanaafaaaajiagaaaaebgpgodjcaacaaaacaacaaaaaaacpopp
laabaaaahaaaaaaaagaaceaaaaaagmaaaaaagmaaaaaaceaaabaagmaaaaaaadaa
aeaaabaaaaaaaaaaaaaaaiaaabaaafaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaacaabeaaabaaapaa
aaaaaaaaaaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaacia
acaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapjaaeaaaaae
aaaaadoaadaaoejaafaaoekaafaaookaafaaaaadaaaaahiaacaaoejaapaappka
afaaaaadabaaahiaaaaaffiaamaaoekaaeaaaaaeaaaaaliaalaakekaaaaaaaia
abaakeiaaeaaaaaeacaaahoaanaaoekaaaaakkiaaaaapeiaafaaaaadaaaaapia
aaaaffjaamaaoekaaeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaae
aaaaapiaanaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappja
aaaaoeiaafaaaaadabaaadiaaaaaffiaacaaobkaaeaaaaaeaaaaadiaabaaobka
aaaaaaiaabaaoeiaaeaaaaaeaaaaadiaadaaobkaaaaakkiaaaaaoeiaaeaaaaae
aaaaamoaaeaabekaaaaappiaaaaaeeiaafaaaaadaaaaapiaaaaaffjaaiaaoeka
aeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaac
abaaapoaafaaoejaabaaaaacadaaahoaagaaoekappppaaaafdeieefchaadaaaa
eaaaabaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaaeegiocaaa
abaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaa
abaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaad
hccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaanaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaapaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgafbaaaaaaaaaaa
egiacaaaaaaaaaaaaeaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaaaaaaaaaa
adaaaaaaagaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaaaaaaaaa
egiacaaaaaaaaaaaafaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaak
mccabaaaabaaaaaaagiecaaaaaaaaaaaagaaaaaapgapbaaaaaaaaaaaagaebaaa
aaaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aiaaaaaaogikcaaaaaaaaaaaaiaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaa
afaaaaaadiaaaaaihcaabaaaaaaaaaaaegbcbaaaacaaaaaapgipcaaaacaaaaaa
beaaaaaadiaaaaaihcaabaaaabaaaaaafgafbaaaaaaaaaaaegiccaaaacaaaaaa
anaaaaaadcaaaaaklcaabaaaaaaaaaaaegiicaaaacaaaaaaamaaaaaaagaabaaa
aaaaaaaaegaibaaaabaaaaaadcaaaaakhccabaaaadaaaaaaegiccaaaacaaaaaa
aoaaaaaakgakbaaaaaaaaaaaegadbaaaaaaaaaaadgaaaaaghccabaaaaeaaaaaa
egiccaaaabaaaaaaaaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoleaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahaiaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaedepemepfcaakl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R1.x, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.xyz, R0, fragment.color.primary;
MUL R0.xyz, R0, c[0];
MOV result.color.w, R0;
TEX R1.w, R1.x, texture[1], 2D;
DP3 R1.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R1.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[1];
MUL R1.x, R1, R1.w;
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 14 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
mul r1.xyz, r1, v0
mul_pp r1.xyz, r1, c0
mov_pp r0.w, r1
texld r2, r0, s1
dp3_pp r0.x, t2, t2
rsq_pp r0.x, r0.x
mul_pp r0.xyz, r0.x, t2
dp3_pp r0.x, t1, r0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r2
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedilmbololgemadkahieicoalalaekdcpdabaaaaaadiadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
beacaaaaeaaaaaaaifaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaa
eeaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaa
agaabaaaaaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaa
afaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaaagaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedphkociphomdmgjpnadmjkahdjngiadghabaaaaaaliaeaaaaaeaaaaaa
daaaaaaakmabaaaamiadaaaaieaeaaaaebgpgodjheabaaaaheabaaaaaaacpppp
dmabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaaiaaeaaahlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
aiaaaaadaaaaaiiaaeaaoelaaeaaoelaabaaaaacaaaaadiaaaaappiaecaaaaad
aaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioekaceaaaaac
acaachiaadaaoelaaiaaaaadaaaacciaacaaoelaacaaoeiaafaaaaadaaaacbia
aaaaaaiaaaaaffiafiaaaaaeaaaacbiaaaaaffiaaaaaaaiaabaaaakaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaabllaafaaaaad
aaaacoiaaaaaoeiaaaaablkaafaaaaadabaachiaaaaaaaiaaaaabliaabaaaaac
aaaicpiaabaaoeiappppaaaafdeieefcbeacaaaaeaaaaaaaifaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaa
egbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaaegbcbaaaaeaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaa
fgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaa
aaaaaaaaagaabaaaaaaaaaaaagaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaa
aaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaa
dkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaa
aaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaa
aaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
afaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepem
epfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MUL R0.xyz, R0, c[0];
MAX R1.x, R1, c[1];
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, R0;
END
# 9 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
"ps_2_0
dcl_2d s0
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
texld r0, t0, s0
mov_pp r1.xyz, t2
mul r0.xyz, r0, v0
dp3_pp r1.x, t1, r1
mul_pp r0.xyz, r0, c0
max_pp r1.x, r1, c1
mul_pp r0.xyz, r1.x, r0
mul_pp r0.xyz, r0, c1.y
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlbfgjnfhddpjbambomnkgomnoagbfoliabaaaaaagmacaaaaadaaaaaa
cmaaaaaanaaaaaaaaeabaaaaejfdeheojmaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaa
caaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgf
heaaklklfdeieefcgaabaaaaeaaaaaaafiaaaaaafjaaaaaeegiocaaaaaaaaaaa
acaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
SetTexture 0 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedonpbgaafimlodggidfcpmjcoagnpnijkabaaaaaajaadaaaaaeaaaaaa
daaaaaaafaabaaaaliacaaaafmadaaaaebgpgodjbiabaaaabiabaaaaaaacpppp
oeaaaaaadeaaaaaaabaaciaaaaaadeaaaaaadeaaabaaceaaaaaadeaaaaaaaaaa
aaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaacaaaaaaiaabaaapla
bpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaacaaaaaaja
aaaiapkaecaaaaadaaaacpiaaaaaoelaaaaioekaabaaaaacabaaahiaacaaoela
aiaaaaadabaacbiaabaaoeiaadaaoelaalaaaaadacaaciiaabaaaaiaabaaaaka
acaaaaadabaacbiaacaappiaacaappiaafaaaaadabaacoiaaaaabliaabaablla
afaaaaadabaacoiaabaaoeiaaaaablkaafaaaaadaaaachiaabaaaaiaabaablia
abaaaaacaaaicpiaaaaaoeiappppaaaafdeieefcgaabaaaaeaaaaaaafiaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
adaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaa
aaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaa
aaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheojmaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaajfaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapahaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahahaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 0.5, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RCP R0.x, fragment.texcoord[3].w;
MAD R0.xy, fragment.texcoord[3], R0.x, c[1].y;
MOV result.color.w, R2;
TEX R0.w, R0, texture[1], 2D;
TEX R1.w, R0.z, texture[2], 2D;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R0.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
SLT R1.y, c[1].x, fragment.texcoord[3].z;
MUL R0.w, R1.y, R0;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R2, fragment.color.primary;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].z;
END
# 20 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
SetTexture 2 [_LightTextureB0] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c1, 0.50000000, 0.00000000, 1.00000000, 2.00000000
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3
texld r2, t0, s0
dp3 r0.x, t3, t3
rcp r1.x, t3.w
mov r0.xy, r0.x
mad r1.xy, t3, r1.x, c1.x
mul r2.xyz, r2, v0
mul_pp r2.xyz, r2, c0
texld r0, r0, s2
texld r1, r1, s1
cmp r1.x, -t3.z, c1.y, c1.z
mul_pp r3.x, r1, r1.w
dp3_pp r1.x, t2, t2
rsq_pp r1.x, r1.x
mul_pp r1.xyz, r1.x, t2
dp3_pp r1.x, t1, r1
mul_pp r0.x, r3, r0
max_pp r1.x, r1, c1.y
mul_pp r0.x, r1, r0
mul_pp r0.xyz, r0.x, r2
mul_pp r0.xyz, r0, c1.w
mov_pp r0.w, r2
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedkbilahhdkgooecojppempkdcilgfiompabaaaaaacmaeaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
aiadaaaaeaaaaaaamcaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadpcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegbabaaaafaaaaaapgbpbaaaafaaaaaaaaaaaaak
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaaaackbabaaa
afaaaaaaabaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadp
diaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabaaaaaah
ccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaabaaaaaabaaaaaahccaabaaa
aaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaahocaabaaaaaaaaaaafgafbaaaaaaaaaaaagbjbaaa
aeaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaadaaaaaajgahbaaaaaaaaaaa
deaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaaapaaaaah
bcaabaaaaaaaaaaafgafbaaaaaaaaaaaagaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaah
ocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaa
agijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaa
jgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTexture0] 2D 0
SetTexture 2 [_LightTextureB0] 2D 1
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedocibmnckcjionhfpmpoaadoholkfpeinabaaaaaaamagaaaaaeaaaaaa
daaaaaaaamacaaaabmafaaaaniafaaaaebgpgodjneabaaaaneabaaaaaaacpppp
jiabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaabaaaaaa
acababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaagaaaaacaaaaaiiaaeaapplaaeaaaaae
aaaaadiaaeaaoelaaaaappiaabaaaakaaiaaaaadabaaaiiaaeaaoelaaeaaoela
abaaaaacabaaadiaabaappiaecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaad
abaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
aaaacbiaaaaappiaabaaaaiafiaaaaaeaaaacbiaaeaakklbabaaffkaaaaaaaia
ceaaaaacabaachiaadaaoelaaiaaaaadaaaacciaacaaoelaabaaoeiaalaaaaad
abaacbiaaaaaffiaabaaffkaafaaaaadaaaacbiaaaaaaaiaabaaaaiaacaaaaad
aaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaacaabliaabaabllaafaaaaad
aaaacoiaaaaaoeiaaaaablkaafaaaaadacaachiaaaaaaaiaaaaabliaabaaaaac
aaaicpiaacaaoeiappppaaaafdeieefcaiadaaaaeaaaaaaamcaaaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadpcbabaaaafaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaa
afaaaaaapgbpbaaaafaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaadbaaaaahbcaabaaa
aaaaaaaaabeaaaaaaaaaaaaackbabaaaafaaaaaaabaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaadkaabaaa
aaaaaaaaakaabaaaaaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaa
egbcbaaaafaaaaaaefaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaa
aeaaaaaaeeaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahocaabaaa
aaaaaaaafgafbaaaaaaaaaaaagbjbaaaaeaaaaaabaaaaaahccaabaaaaaaaaaaa
egbcbaaaadaaaaaajgahbaaaaaaaaaaadeaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaafgafbaaaaaaaaaaa
agaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaa
agbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaai
ocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaah
hccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheo
leaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R2, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[2], CUBE;
DP3 R0.x, fragment.texcoord[3], fragment.texcoord[3];
MOV result.color.w, R2;
TEX R0.w, R0.x, texture[1], 2D;
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
RSQ R1.x, R0.x;
MUL R1.xyz, R1.x, fragment.texcoord[2];
DP3 R1.x, fragment.texcoord[1], R1;
MUL R1.y, R0.w, R1.w;
MUL R0.xyz, R2, fragment.color.primary;
MAX R0.w, R1.x, c[1].x;
MUL R0.xyz, R0, c[0];
MUL R0.w, R0, R1.y;
MUL R0.xyz, R0.w, R0;
MUL result.color.xyz, R0, c[1].y;
END
# 16 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_cube s2
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
texld r2, t3, s2
texld r1, t0, s0
dp3 r0.x, t3, t3
mov r0.xy, r0.x
dp3_pp r2.x, t2, t2
rsq_pp r2.x, r2.x
mul_pp r2.xyz, r2.x, t2
mul r1.xyz, r1, v0
dp3_pp r2.x, t1, r2
mul_pp r1.xyz, r1, c0
max_pp r2.x, r2, c1
texld r0, r0, s1
mul r0.x, r0, r2.w
mul_pp r0.x, r2, r0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedohlakkchopibhcjamahiailcflnnmlbaabaaaaaajeadaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
haacaaaaeaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fidaaaaeaahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
baaaaaahbcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaa
egacbaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaaaabaaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaaefaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaa
aagabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaa
acaaaaaaapaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaa
fgaobaaaaaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaa
agaabaaaaaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
SetTexture 0 [_MainTex] 2D 2
SetTexture 1 [_LightTextureB0] 2D 1
SetTexture 2 [_LightTexture0] CUBE 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedglpdejmfnfipnpjfcjfgniigpcdbnbdbabaaaaaaeaafaaaaaeaaaaaa
daaaaaaaniabaaaafaaeaaaaamafaaaaebgpgodjkaabaaaakaabaaaaaaacpppp
geabaaaadmaaaaaaabaadaaaaaaadmaaaaaadmaaadaaceaaaaaadmaaacaaaaaa
abababaaaaacacaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapka
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaadlabpaaaaac
aaaaaaiaabaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachla
bpaaaaacaaaaaaiaaeaaahlabpaaaaacaaaaaajiaaaiapkabpaaaaacaaaaaaja
abaiapkabpaaaaacaaaaaajaacaiapkaaiaaaaadaaaaaiiaaeaaoelaaeaaoela
abaaaaacaaaaadiaaaaappiaecaaaaadaaaaapiaaaaaoeiaabaioekaecaaaaad
abaaapiaaeaaoelaaaaioekaecaaaaadacaacpiaaaaaoelaacaioekaafaaaaad
aaaacbiaaaaaaaiaabaappiaceaaaaacabaachiaadaaoelaaiaaaaadaaaaccia
acaaoelaabaaoeiaalaaaaadabaacbiaaaaaffiaabaaaakaafaaaaadaaaacbia
aaaaaaiaabaaaaiaacaaaaadaaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoia
acaabliaabaabllaafaaaaadaaaacoiaaaaaoeiaaaaablkaafaaaaadacaachia
aaaaaaiaaaaabliaabaaaaacaaaicpiaacaaoeiappppaaaafdeieefchaacaaaa
eaaaaaaajmaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafidaaaae
aahabaaaacaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadhcbabaaa
acaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaad
hcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaabaaaaaah
bcaabaaaaaaaaaaaegbcbaaaaeaaaaaaegbcbaaaaeaaaaaaeeaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egbcbaaaaeaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegacbaaa
aaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaa
baaaaaahccaabaaaaaaaaaaaegbcbaaaafaaaaaaegbcbaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaafgafbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
efaaaaajpcaabaaaacaaaaaaegbcbaaaafaaaaaaeghobaaaacaaaaaaaagabaaa
aaaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaadkaabaaaacaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaafgafbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaadadaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaadaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"!!ARBfp1.0
PARAM c[2] = { program.local[0],
		{ 0, 2 } };
TEMP R0;
TEMP R1;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.w, fragment.texcoord[3], texture[1], 2D;
MOV R1.xyz, fragment.texcoord[2];
MUL R0.xyz, R0, fragment.color.primary;
DP3 R1.x, fragment.texcoord[1], R1;
MAX R1.x, R1, c[1];
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, R1.w;
MUL R0.xyz, R1.x, R0;
MUL result.color.xyz, R0, c[1].y;
MOV result.color.w, R0;
END
# 11 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_LightTexture0] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
def c1, 0.00000000, 2.00000000, 0, 0
dcl t0.xy
dcl v0.xyz
dcl t1.xyz
dcl t2.xyz
dcl t3.xy
texld r0, t3, s1
texld r1, t0, s0
mov_pp r0.xyz, t2
dp3_pp r0.x, t1, r0
mul r1.xyz, r1, v0
max_pp r0.x, r0, c1
mul_pp r0.x, r0, r0.w
mul_pp r1.xyz, r1, c0
mul_pp r0.xyz, r0.x, r1
mul_pp r0.xyz, r0, c1.y
mov_pp r0.w, r1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0
eefiecedakjnccmdmjocmajikkcoehmeijgccnemabaaaaaanaacaaaaadaaaaaa
cmaaaaaaoiaaaaaabmabaaaaejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaknaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaa
abaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaedepemepfcaaklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefc
kmabaaaaeaaaaaaaglaaaaaafjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaad
aagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaa
adaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaa
deaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
apaaaaahbcaabaaaaaaaaaaaagaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahocaabaaaaaaaaaaaagajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaf
iccabaaaaaaaaaaadkaabaaaabaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaa
aaaaaaaaagijcaaaaaaaaaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaa
aaaaaaaajgahbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_LightTexture0] 2D 0
ConstBuffer "$Globals" 144
Vector 16 [_LightColor0]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedeonfndndlbelolliokjbpdhlddgbneneabaaaaaadeaeaaaaaeaaaaaa
daaaaaaajaabaaaaeeadaaaaaaaeaaaaebgpgodjfiabaaaafiabaaaaaaacpppp
caabaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaabaaaaaa
aaababaaaaaaabaaabaaaaaaaaaaaaaaaaacppppfbaaaaafabaaapkaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaia
abaaaplabpaaaaacaaaaaaiaacaachlabpaaaaacaaaaaaiaadaachlabpaaaaac
aaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaadiaaaaablla
ecaaaaadaaaacpiaaaaaoeiaaaaioekaecaaaaadabaacpiaaaaaoelaabaioeka
abaaaaacaaaaahiaacaaoelaaiaaaaadaaaacbiaaaaaoeiaadaaoelaafaaaaad
aaaacciaaaaappiaaaaaaaiafiaaaaaeaaaacbiaaaaaaaiaaaaaffiaabaaaaka
acaaaaadaaaacbiaaaaaaaiaaaaaaaiaafaaaaadaaaacoiaabaabliaabaablla
afaaaaadaaaacoiaaaaaoeiaaaaablkaafaaaaadabaachiaaaaaaaiaaaaablia
abaaaaacaaaicpiaabaaoeiappppaaaafdeieefckmabaaaaeaaaaaaaglaaaaaa
fjaaaaaeegiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadhcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaa
aeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaabaaaaaahbcaabaaa
aaaaaaaaegbcbaaaadaaaaaaegbcbaaaaeaaaaaadeaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
abaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaa
agaabaaaaaaaaaaapgapbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegbabaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadiaaaaahocaabaaaaaaaaaaa
agajbaaaabaaaaaaagbjbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaa
abaaaaaadiaaaaaiocaabaaaaaaaaaaafgaobaaaaaaaaaaaagijcaaaaaaaaaaa
abaaaaaadiaaaaahhccabaaaaaaaaaaaagaabaaaaaaaaaaajgahbaaaaaaaaaaa
doaaaaabejfdeheoleaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaknaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
epfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "VertexLit"
}