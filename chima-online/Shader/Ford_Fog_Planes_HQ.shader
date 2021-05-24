//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Fog Planes HQ" {
Properties {
 _MainTex ("Main Texture", 2D) = "black" {}
 _SecondTextureUvsMul ("Second Texture UV Multiplier", Float) = 1
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _ScrollXB ("Detail TextureB Scroll Speed X", Float) = 1
 _ScrollYB ("Detail TextureB Scroll Speed Y", Float) = 1
 _MainTextureMul ("Main Texture Multiplier", Float) = 1
 _DetailTextureMul ("Detail Texture Multiplier", Float) = 1
 _InvFadeParemeter ("Edge blend effect Range", Range(0,1)) = 0.5
 _Color ("Color", Color) = (1,1,1,1)
 _VertAnimSpeed ("Vertex Animation Speed", Float) = 100
 _VertAnimDisplacement ("Vertex Animation Displacement", Float) = 0.1
 _VertAnimSpeedB ("Vertical Vertex Animation Speed", Float) = 100
 _VertAnimDisplacementB ("Vertical Vertex Animation Displacement", Float) = 0.1
}
SubShader { 
 LOD 200
 Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "RenderType"="Transparent" }
  ZWrite Off
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Vector 6 [_ProjectionParams]
Float 7 [_VertAnimSpeed]
Float 8 [_VertAnimDisplacement]
Float 9 [_VertAnimSpeedB]
Float 10 [_VertAnimDisplacementB]
Float 11 [_SecondTextureUvsMul]
Float 12 [_ScrollX]
Float 13 [_ScrollY]
Float 14 [_ScrollXB]
Float 15 [_ScrollYB]
Vector 16 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[21] = { { 24.980801, -24.980801, 0.15915491, 0.25 },
		state.matrix.mvp,
		program.local[5..16],
		{ 0, 0.5, 1, -1 },
		{ -60.145809, 60.145809, 85.453789, -85.453789 },
		{ -64.939346, 64.939346, 19.73921, -19.73921 },
		{ -9, 0.75 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
ADD R0.x, vertex.position, c[5];
MUL R0.x, R0, c[9];
MAD R0.y, R0.x, c[0].z, -c[0].w;
FRC R1.w, R0.y;
ADD R0.x, vertex.position.y, c[5];
MUL R0.x, R0, c[7];
MAD R0.w, R0.x, c[0].z, -c[0];
ADD R1.xyz, -R1.w, c[17];
MUL R0.xyz, R1, R1;
FRC R0.w, R0;
MUL R2.xyz, R0, c[0].xyxw;
ADD R1.xyz, -R0.w, c[17];
ADD R2.xyz, R2, c[18].xyxw;
MAD R3.xyz, R2, R0, c[18].zwzw;
MUL R1.xyz, R1, R1;
MAD R3.xyz, R3, R0, c[19].xyxw;
MAD R3.xyz, R3, R0, c[19].zwzw;
MUL R2.xyz, R1, c[0].xyxw;
ADD R2.xyz, R2, c[18].xyxw;
MAD R2.xyz, R2, R1, c[18].zwzw;
MAD R3.xyz, R3, R0, c[17].wzww;
SLT R4.x, R1.w, c[0].w;
SGE R4.yz, R1.w, c[20].xxyw;
MOV R0.xz, R4;
DP3 R0.y, R4, c[17].wzww;
DP3 R1.w, R3, -R0;
MAD R0.xyz, R2, R1, c[19].xyxw;
MAD R0.xyz, R0, R1, c[19].zwzw;
MAD R1.xyz, R0, R1, c[17].wzww;
MUL R1.w, R1, c[10].x;
SGE R0.yz, R0.w, c[20].xxyw;
SLT R0.x, R0.w, c[0].w;
DP3 R2.y, R0, c[17].wzww;
MOV R2.xz, R0;
DP3 R0.x, R1, -R2;
MUL R1.w, R1, vertex.color;
MAD R0.y, R0.x, c[8].x, R1.w;
DP4 R0.x, vertex.position, c[2];
ADD R0.y, R0.x, R0;
DP4 R0.x, vertex.position, c[1];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
MUL R1.xyz, R0.xyww, c[17].y;
MOV result.position, R0;
MUL R1.y, R1, c[6].x;
ADD result.texcoord[3].xy, R1, R1.z;
MOV R1.y, c[15].x;
MOV R1.x, c[14];
MUL R1.zw, R1.xyxy, c[5].xyxy;
MUL R1.xy, vertex.texcoord[0], c[11].x;
MAD R1.xy, R1, c[16], c[16].zwzw;
FRC R1.zw, R1;
ADD result.texcoord[0].zw, R1.xyxy, R1;
MOV R0.y, c[13].x;
MOV R0.x, c[12];
MUL R0.xy, R0, c[5];
FRC R0.xy, R0;
MAD R1.xy, vertex.texcoord[0], c[16], c[16].zwzw;
ADD result.texcoord[0].xy, R1, R0;
MOV result.texcoord[1], vertex.color.w;
MOV result.texcoord[3].zw, R0;
END
# 61 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Vector 5 [_ProjectionParams]
Vector 6 [_ScreenParams]
Float 7 [_VertAnimSpeed]
Float 8 [_VertAnimDisplacement]
Float 9 [_VertAnimSpeedB]
Float 10 [_VertAnimDisplacementB]
Float 11 [_SecondTextureUvsMul]
Float 12 [_ScrollX]
Float 13 [_ScrollY]
Float 14 [_ScrollXB]
Float 15 [_ScrollYB]
Vector 16 [_MainTex_ST]
"vs_2_0
def c17, -0.02083333, -0.12500000, 1.00000000, 0.50000000
def c18, -0.00000155, -0.00002170, 0.00260417, 0.00026042
def c19, 0.15915491, 0.50000000, 6.28318501, -3.14159298
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
add r0.x, v0, c4
mul r0.x, r0, c9
mad r0.y, r0.x, c19.x, c19
frc r0.y, r0
add r0.x, v0.y, c4
mul r0.x, r0, c7
mad r1.y, r0, c19.z, c19.w
mad r1.x, r0, c19, c19.y
sincos r0.xy, r1.y, c18.xyzw, c17.xyzw
frc r0.x, r1
mad r1.x, r0, c19.z, c19.w
mul r1.y, r0, c10.x
sincos r0.xy, r1.x, c18.xyzw, c17.xyzw
mul r0.x, r1.y, v2.w
mad r0.y, r0, c8.x, r0.x
dp4 r0.x, v0, c1
add r0.y, r0.x, r0
dp4 r0.x, v0, c0
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
mul r1.xyz, r0.xyww, c17.w
mov oPos, r0
mul r1.y, r1, c5.x
mad oT3.xy, r1.z, c6.zwzw, r1
mov r0.y, c13.x
mov r0.x, c12
mul r1.zw, r0.xyxy, c4.xyxy
mov r0.y, c15.x
mov r0.x, c14
mul r1.xy, r0, c4
mul r0.xy, v1, c11.x
frc r1.xy, r1
mad r0.xy, r0, c16, c16.zwzw
add oT0.zw, r0.xyxy, r1.xyxy
frc r1.xy, r1.zwzw
mad r0.xy, v1, c16, c16.zwzw
add oT0.xy, r0, r1
mov oT1, v2.w
mov oT3.zw, r0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 16 [_VertAnimSpeed]
Float 20 [_VertAnimDisplacement]
Float 24 [_VertAnimSpeedB]
Float 28 [_VertAnimDisplacementB]
Float 32 [_SecondTextureUvsMul]
Float 36 [_ScrollX]
Float 40 [_ScrollY]
Float 44 [_ScrollXB]
Float 48 [_ScrollYB]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedbcechgmjdmemojchjfnjkoehdbnjbcdcabaaaaaahaafaaaaadaaaaaa
cmaaaaaapeaaaaaahmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefc
omadaaaaeaaaabaaplaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaaaaaaaaai
dcaabaaaaaaaaaaabgbfbaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaadiaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaigiacaaaaaaaaaaaabaaaaaaenaaaaag
dcaabaaaaaaaaaaaaanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaangifcaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaadkbabaaaafaaaaaaakaabaaaaaaaaaaadiaaaaaipcaabaaa
abaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaabaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaa
aaaaaaaabkaabaaaabaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaa
diaaaaaibcaabaaaaaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaaj
ecaabaaaacaaaaaadkiacaaaaaaaaaaaacaaaaaaakiacaaaabaaaaaaaaaaaaaa
diaaaaajicaabaaaacaaaaaaakiacaaaaaaaaaaaadaaaaaabkiacaaaabaaaaaa
aaaaaaaabkaaaaafdcaabaaaacaaaaaaogakbaaaacaaaaaadiaaaaaimcaabaaa
acaaaaaaagbebaaaadaaaaaaagiacaaaaaaaaaaaacaaaaaadcaaaaalmcaabaaa
acaaaaaakgaobaaaacaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaa
aeaaaaaaaaaaaaahmccabaaaabaaaaaaagaebaaaacaaaaaakgaobaaaacaaaaaa
diaaaaajdcaabaaaacaaaaaajgifcaaaaaaaaaaaacaaaaaaegiacaaaabaaaaaa
aaaaaaaabkaaaaafdcaabaaaacaaaaaaegaabaaaacaaaaaadcaaaaalmcaabaaa
acaaaaaaagbebaaaadaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaa
aeaaaaaaaaaaaaahdccabaaaabaaaaaaegaabaaaacaaaaaaogakbaaaacaaaaaa
dgaaaaafpccabaaaacaaaaaapgbpbaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaa
agadbaaaabaaaaaaaceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
aaaaaaaamgaabaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Float 16 [_VertAnimSpeed]
Float 20 [_VertAnimDisplacement]
Float 24 [_VertAnimSpeedB]
Float 28 [_VertAnimDisplacementB]
Float 32 [_SecondTextureUvsMul]
Float 36 [_ScrollX]
Float 40 [_ScrollY]
Float 44 [_ScrollXB]
Float 48 [_ScrollYB]
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedpcgndjgildidclkpklmfgjlfdgcfkjmnabaaaaaahiaiaaaaaeaaaaaa
daaaaaaadeadaaaaciahaaaapaahaaaaebgpgodjpmacaaaapmacaaaaaaacpopp
keacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaafaaabaaagaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaidpjccdo
aaaaaadpnlapmjeanlapejmafbaaaaafalaaapkaabannalfgballglhklkkckdl
ijiiiidjfbaaaaafamaaapkaklkkkklmaaaaaaloaaaaiadpaaaaaadpbpaaaaac
afaaaaiaaaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaafiaafaaapja
abaaaaacaaaaadiaafaaoekaafaaaaadaaaaamiaaaaaeeiaacaajekabdaaaaac
aaaaamiaaaaaoeiaaeaaaaaeabaaadiaadaaoejaaeaaoekaaeaaookaacaaaaad
aaaaadoaaaaaooiaabaaoeiaafaaaaadaaaaaeiaaaaaaaiaacaappkaafaaaaad
aaaaaiiaaaaaffiaadaaaakabdaaaaacaaaaadiaaaaaooiaafaaaaadaaaaamia
adaaeejaacaaaakaaeaaaaaeaaaaamiaaaaaoeiaaeaaeekaaeaaoekaacaaaaad
aaaaamoaaaaaeeiaaaaaoeiaacaaaaadaaaaadiaaaaaobjaafaaaakaafaaaaad
aaaaadiaaaaaoeiaabaaoikaaeaaaaaeaaaaadiaaaaaoeiaanaaaakaanaaffka
bdaaaaacaaaaadiaaaaaoeiaaeaaaaaeaaaaadiaaaaaoeiaanaakkkaanaappka
cfaaaaaeabaaaciaaaaaffiaalaaoekaamaaoekacfaaaaaeacaaaciaaaaaaaia
alaaoekaamaaoekaafaaaaadaaaaabiaabaaffiaabaappkaafaaaaadaaaaabia
aaaaaaiaafaappjaaeaaaaaeaaaaabiaacaaffiaabaaffkaaaaaaaiaafaaaaad
abaaapiaaaaaffjaaiaaoekaaeaaaaaeabaaapiaahaaoekaaaaaaajaabaaoeia
aeaaaaaeabaaapiaajaaoekaaaaakkjaabaaoeiaaeaaaaaeabaaapiaakaalbka
aaaappjaabaalbiaacaaaaadabaaabiaaaaaaaiaabaaaaiaafaaaaadaaaaabia
abaaaaiaagaaaakaafaaaaadaaaaaiiaaaaaaaiaanaaffkaafaaaaadaaaaafia
abaaofiaanaaffkaaeaaaaaeaaaaadmaabaakkiaaaaaoekaabaaobiaacaaaaad
acaaadoaaaaakkiaaaaaomiaabaaaaacaaaaammaabaaleiaabaaaaacacaaamoa
abaaleiaabaaaaacabaaapoaafaappjappppaaaafdeieefcomadaaaaeaaaabaa
plaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaafpaaaaadicbabaaaafaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacadaaaaaaaaaaaaaidcaabaaaaaaaaaaa
bgbfbaaaaaaaaaaaagiacaaaabaaaaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaigiacaaaaaaaaaaaabaaaaaaenaaaaagdcaabaaaaaaaaaaa
aanaaaaaegaabaaaaaaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
ngifcaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkbabaaaafaaaaaaakaabaaaaaaaaaaadiaaaaaipcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaabaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaabaaaaaadcaaaaakpcaabaaa
abaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaabaaaaaa
dcaaaaakpcaabaaaabaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaabaaaaaaaaaaaaahccaabaaaabaaaaaaakaabaaaaaaaaaaabkaabaaa
abaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaabaaaaaadiaaaaaibcaabaaa
aaaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaadiaaaaahicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaajecaabaaaacaaaaaa
dkiacaaaaaaaaaaaacaaaaaaakiacaaaabaaaaaaaaaaaaaadiaaaaajicaabaaa
acaaaaaaakiacaaaaaaaaaaaadaaaaaabkiacaaaabaaaaaaaaaaaaaabkaaaaaf
dcaabaaaacaaaaaaogakbaaaacaaaaaadiaaaaaimcaabaaaacaaaaaaagbebaaa
adaaaaaaagiacaaaaaaaaaaaacaaaaaadcaaaaalmcaabaaaacaaaaaakgaobaaa
acaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaah
mccabaaaabaaaaaaagaebaaaacaaaaaakgaobaaaacaaaaaadiaaaaajdcaabaaa
acaaaaaajgifcaaaaaaaaaaaacaaaaaaegiacaaaabaaaaaaaaaaaaaabkaaaaaf
dcaabaaaacaaaaaaegaabaaaacaaaaaadcaaaaalmcaabaaaacaaaaaaagbebaaa
adaaaaaaagiecaaaaaaaaaaaaeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaaaaaaah
dccabaaaabaaaaaaegaabaaaacaaaaaaogakbaaaacaaaaaadgaaaaafpccabaaa
acaaaaaapgbpbaaaafaaaaaadiaaaaakfcaabaaaaaaaaaaaagadbaaaabaaaaaa
aceaaaaaaaaaaadpaaaaaaaaaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaabaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaaaaaaaaamgaabaaa
aaaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaa
laaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaa
aaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
afaaaaaaapaiaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaa
feeffiedepepfceeaaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaa
giaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_ZBufferParams]
Float 1 [_InvFadeParemeter]
Float 2 [_MainTextureMul]
Float 3 [_DetailTextureMul]
Vector 4 [_Color]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[5] = { program.local[0..4] };
TEMP R0;
TEMP R1;
TEMP R2;
TXP R2.x, fragment.texcoord[3], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0.xyz, fragment.texcoord[0], texture[1], 2D;
MAD R0.w, R2.x, c[0].z, c[0];
RCP R0.w, R0.w;
ADD R0.w, R0, -fragment.texcoord[3].z;
MUL R1.xyz, R1, c[3].x;
MAD R0.xyz, R0, c[2].x, R1;
MUL_SAT R0.w, R0, c[1].x;
MUL R0.w, R0.x, R0;
MUL result.color.w, R0, fragment.texcoord[1].x;
MUL result.color.xyz, R0, c[4];
END
# 12 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ZBufferParams]
Float 1 [_InvFadeParemeter]
Float 2 [_MainTextureMul]
Float 3 [_DetailTextureMul]
Vector 4 [_Color]
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1.x
dcl t3
texld r2, t0, s1
mov r0.y, t0.w
mov r0.x, t0.z
mov r1.xy, r0
texld r1, r1, s1
texldp r0, t3, s0
mad r0.x, r0, c0.z, c0.w
rcp r0.x, r0.x
add r0.x, r0, -t3.z
mul r1.xyz, r1, c3.x
mad r1.xyz, r2, c2.x, r1
mul_sat r0.x, r0, c1
mul r0.x, r1, r0
mul r1.xyz, r1, c4
mul r1.w, r0.x, t1.x
mov_pp oC0, r1
"
}
SubProgram "d3d11 " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
ConstBuffer "$Globals" 112
Float 80 [_InvFadeParemeter]
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0
eefiecedmnbhnkjagcmbledbgadakebnlfgmdgigabaaaaaaeiadaaaaadaaaaaa
cmaaaaaaleaaaaaaoiaaaaaaejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apabaaaaheaaaaaaadaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklklfdeieefcfiacaaaaeaaaaaaajgaaaaaafjaaaaaeegiocaaa
aaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
bcbabaaaacaaaaaagcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaa
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaaahaaaaaa
akaabaaaaaaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaaaaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaackbabaiaebaaaaaaadaaaaaadicaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
diaaaaaiocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaafaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
abaaaaaadcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaafgifcaaaaaaaaaaa
afaaaaaafgaobaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaaaaaaaaadiaaaaaihccabaaaaaaaaaaajgahbaaaaaaaaaaaegiccaaa
aaaaaaaaagaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_CameraDepthTexture] 2D 0
SetTexture 1 [_MainTex] 2D 1
ConstBuffer "$Globals" 112
Float 80 [_InvFadeParemeter]
Float 84 [_MainTextureMul]
Float 88 [_DetailTextureMul]
Vector 96 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 112 [_ZBufferParams]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
"ps_4_0_level_9_1
eefiecednipnacimimekodpdijemflonekldcpkmabaaaaaaoaaeaaaaaeaaaaaa
daaaaaaameabaaaaceaeaaaakmaeaaaaebgpgodjimabaaaaimabaaaaaaacpppp
eiabaaaaeeaaaaaaacaacmaaaaaaeeaaaaaaeeaaacaaceaaaaaaeeaaaaaaaaaa
abababaaaaaaafaaacaaaaaaaaaaaaaaabaaahaaabaaacaaaaaaaaaaaaacpppp
bpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaaplabpaaaaacaaaaaaia
acaaaplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaagaaaaac
aaaaaiiaacaapplaafaaaaadaaaaadiaaaaappiaacaaoelaabaaaaacabaaabia
aaaakklaabaaaaacabaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadabaacpiaabaaoeiaabaioekaecaaaaadacaacpiaaaaaoelaabaioeka
aeaaaaaeabaaaiiaacaakkkaaaaaaaiaacaappkaagaaaaacabaaciiaabaappia
acaaaaadabaaaiiaabaappiaacaakklbafaaaaadabaadiiaabaappiaaaaaaaka
afaaaaadaaaaahiaabaaoeiaaaaakkkaaeaaaaaeaaaaahiaacaaoeiaaaaaffka
aaaaoeiaafaaaaadaaaaaiiaabaappiaaaaaaaiaafaaaaadabaachiaaaaaoeia
abaaoekaafaaaaadabaaciiaaaaappiaabaaaalaabaaaaacaaaicpiaabaaoeia
ppppaaaafdeieefcfiacaaaaeaaaaaaajgaaaaaafjaaaaaeegiocaaaaaaaaaaa
ahaaaaaafjaaaaaeegiocaaaabaaaaaaaiaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaae
aahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadbcbabaaa
acaaaaaagcbaaaadpcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegbabaaaadaaaaaapgbpbaaaadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaalbcaabaaaaaaaaaaackiacaaaabaaaaaaahaaaaaaakaabaaa
aaaaaaaadkiacaaaabaaaaaaahaaaaaaaoaaaaakbcaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpakaabaaaaaaaaaaaaaaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaackbabaiaebaaaaaaadaaaaaadicaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaai
ocaabaaaaaaaaaaaagajbaaaabaaaaaakgikcaaaaaaaaaaaafaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaa
dcaaaaakocaabaaaaaaaaaaaagajbaaaabaaaaaafgifcaaaaaaaaaaaafaaaaaa
fgaobaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaaihccabaaaaaaaaaaajgahbaaaaaaaaaaaegiccaaaaaaaaaaa
agaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaakbabaaaacaaaaaa
doaaaaabejfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapabaaaaheaaaaaa
adaaaaaaaaaaaaaaadaaaaaaadaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
"
}
}
 }
}
Fallback "Transparent/Diffuse"
}