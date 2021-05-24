//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/God Rays Dust No Displace" {
Properties {
 _MainTex ("Base texture", 2D) = "white" {}
 _DetailTex ("Detail Texture", 2D) = "white" {}
 _DetailTexB ("Detail TextureB", 2D) = "white" {}
 _ScrollUvValues ("UV Scroll Speed //XY= Detail Texture  // ZW= Detail TextureB", Vector) = (0.25,0.1,0.2,0.05)
 _DifferentFloatValues (" X= Detail Tex Mul // Y= Detail TexB Mul  // Z= Fadeout Near Dist//W= Fadeout pow", Vector) = (10,15,20,4)
 _Color ("Color", Color) = (1,1,1,1)
 _FresnelPower ("Fresnel Transparency Power", Float) = 0.8
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
"!!ARBvp1.0
PARAM c[24] = { { 1, 0 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..23] };
TEMP R0;
TEMP R1;
MOV R1.w, c[0].x;
MOV R1.xyz, c[14];
DP4 R0.z, R1, c[11];
DP4 R0.x, R1, c[9];
DP4 R0.y, R1, c[10];
MAD R0.xyz, R0, c[15].w, -vertex.position;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
DP3 R0.y, R0, R0;
DP3 R0.x, R1, vertex.normal;
POW R0.x, R0.x, c[23].x;
MUL R1, R0.x, c[16];
RSQ R0.y, R0.y;
RCP R0.z, c[22].z;
RCP R0.y, R0.y;
MUL R0.y, R0, R0.z;
MIN R0.y, R0, c[0].x;
MAX R0.x, R0.y, c[0].y;
MOV R0.zw, c[13].xyxy;
MUL R1, R1, c[17].x;
POW R0.x, R0.x, c[22].w;
MUL result.texcoord[2], R1, R0.x;
MUL R0.xy, R0.zwzw, c[21];
MUL R1.xy, R0.zwzw, c[21].zwzw;
FRC R0.zw, R0.xyxy;
MAD R0.xy, vertex.texcoord[0], c[19], c[19].zwzw;
ADD result.texcoord[0].zw, R0.xyxy, R0;
FRC R0.zw, R1.xyxy;
MAD R0.xy, vertex.texcoord[1], c[20], c[20].zwzw;
ADD result.texcoord[1].xy, R0, R0.zwzw;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
DP4 result.position.w, vertex.position, c[8];
DP4 result.position.z, vertex.position, c[7];
DP4 result.position.y, vertex.position, c[6];
DP4 result.position.x, vertex.position, c[5];
END
# 39 instructions, 2 R-regs
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
"vs_2_0
def c23, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_normal0 v1
dcl_texcoord0 v2
dcl_texcoord1 v3
mov r1.w, c23.x
mov r1.xyz, c13
dp4 r0.z, r1, c10
dp4 r0.x, r1, c8
dp4 r0.y, r1, c9
mad r1.xyz, r0, c14.w, -v0
dp3 r0.x, r1, r1
rsq r0.w, r0.x
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
dp3 r1.w, r0, r0
mul r0.xyz, r0.w, r1
rsq r0.w, r1.w
dp3 r0.x, r0, v1
rcp r1.x, c21.z
rcp r0.w, r0.w
mul r0.w, r0, r1.x
pow r1, r0.x, c22.x
min r0.y, r0.w, c23.x
max r1.y, r0, c23
pow r0, r1.y, c21.w
mov r0.y, r1.x
mul r1, r0.y, c15
mul r1, r1, c16.x
mul oT2, r1, r0.x
mov r0.zw, c20
mov r0.xy, c20
mul r0.xy, c12, r0
mul r1.xy, c12, r0.zwzw
frc r0.zw, r0.xyxy
mad r0.xy, v2, c18, c18.zwzw
add oT0.zw, r0.xyxy, r0
frc r0.zw, r1.xyxy
mad r0.xy, v3, c19, c19.zwzw
add oT1.xy, r0, r0.zwzw
mad oT0.xy, v2, c17, c17.zwzw
dp4 oPos.w, v0, c7
dp4 oPos.z, v0, c6
dp4 oPos.y, v0, c5
dp4 oPos.x, v0, c4
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
eefiecedjiafkapeafbebmmgkffkppiecojnkaegabaaaaaalmagaaaaadaaaaaa
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
diafaaaaeaaaabaaeoabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaafjaaaaae
egiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaa
fpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
pccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
giaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
acaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaa
aaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaa
agaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaa
abaaaaaaaaaaaaahmccabaaaabaaaaaaagaebaaaaaaaaaaaagaebaaaabaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaaeaaaaaa
egiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaahdccabaaa
acaaaaaaogakbaaaabaaaaaaegaabaaaaaaaaaaadiaaaaajhcaabaaaaaaaaaaa
fgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaalhcaabaaa
aaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaaegacbaaa
aaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaakgikcaaa
abaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaabaaaaaah
icaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaaaaaaaaaa
egacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
acaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaabjaaaaafbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaagaabaaaaaaaaaaa
egiocaaaaaaaaaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
agiacaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaaaaaaaaaa
egiccaaaacaaaaaaafaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaa
aeaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaaabaaaaaa
egiccaaaacaaaaaaagaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaadcaaaaak
hcaabaaaabaaaaaaegiccaaaacaaaaaaahaaaaaapgbpbaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaaabaaaaaa
elaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaocaaaaibcaabaaaabaaaaaa
akaabaaaabaaaaaackiacaaaaaaaaaaaahaaaaaacpaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaadkiacaaa
aaaaaaaaahaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
pccabaaaadaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadoaaaaab"
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
eefiecedkmlmnecjpeeaikifblikddmjbmlobejmabaaaaaapaajaaaaaeaaaaaa
daaaaaaagaadaaaakaaiaaaagiajaaaaebgpgodjciadaaaaciadaaaaaaacpopp
meacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
aiaaabaaaaaaaaaaabaaaaaaabaaajaaaaaaaaaaabaaaeaaabaaakaaaaaaaaaa
acaaaaaaaiaaalaaaaaaaaaaacaabaaaafaabdaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbiaaapkaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoekaadaaookaaeaaaaae
aaaaadiaadaaoejaaeaaoekaaeaaookaabaaaaacabaaapiaagaaoekaafaaaaad
abaaapiaabaaoeiaajaaeekabdaaaaacabaaapiaabaaoeiaacaaaaadaaaaamoa
aaaaeeiaabaaeeiaaeaaaaaeaaaaadiaaeaaoejaafaaoekaafaaookaacaaaaad
abaaadoaabaaooiaaaaaoeiaafaaaaadaaaaahiaaaaaffjabaaaoekaaeaaaaae
aaaaahiaapaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaahiabbaaoekaaaaakkja
aaaaoeiaaeaaaaaeaaaaahiabcaaoekaaaaappjaaaaaoeiaaiaaaaadaaaaabia
aaaaoeiaaaaaoeiaahaaaaacaaaaabiaaaaaaaiaagaaaaacaaaaabiaaaaaaaia
agaaaaacaaaaaciaahaakkkaafaaaaadaaaaabiaaaaaffiaaaaaaaiaalaaaaad
aaaaabiaaaaaaaiabiaaaakaakaaaaadaaaaabiaaaaaaaiabiaaffkacaaaaaad
abaaabiaaaaaaaiaahaappkaabaaaaacaaaaahiaakaaoekaafaaaaadabaaaoia
aaaaffiabeaajakaaeaaaaaeaaaaaliabdaakekaaaaaaaiaabaaojiaaeaaaaae
aaaaahiabfaaoekaaaaakkiaaaaapeiaacaaaaadaaaaahiaaaaaoeiabgaaoeka
aeaaaaaeaaaaahiaaaaaoeiabhaappkaaaaaoejbceaaaaacacaaahiaaaaaoeia
aiaaaaadaaaaabiaacaaoeiaacaaoejacaaaaaadabaaaciaaaaaaaiaaiaaaaka
afaaaaadaaaaapiaabaaffiaabaaoekaafaaaaadaaaaapiaaaaaoeiaacaaaaka
afaaaaadacaaapoaabaaaaiaaaaaoeiaafaaaaadaaaaapiaaaaaffjaamaaoeka
aeaaaaaeaaaaapiaalaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaanaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaaoaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiappppaaaa
fdeieefcdiafaaaaeaaaabaaeoabaaaafjaaaaaeegiocaaaaaaaaaaaajaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadpccabaaa
adaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaa
egiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
aaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaagaaaaaaegiecaaaabaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaa
egaobaaaabaaaaaaaaaaaaahmccabaaaabaaaaaaagaebaaaaaaaaaaaagaebaaa
abaaaaaadcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
aeaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaaaaaaaaaaafaaaaaaaaaaaaah
dccabaaaacaaaaaaogakbaaaabaaaaaaegaabaaaaaaaaaaadiaaaaajhcaabaaa
aaaaaaaafgifcaaaabaaaaaaaeaaaaaaegiccaaaacaaaaaabbaaaaaadcaaaaal
hcaabaaaaaaaaaaaegiccaaaacaaaaaabaaaaaaaagiacaaaabaaaaaaaeaaaaaa
egacbaaaaaaaaaaadcaaaaalhcaabaaaaaaaaaaaegiccaaaacaaaaaabcaaaaaa
kgikcaaaabaaaaaaaeaaaaaaegacbaaaaaaaaaaaaaaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaaegiccaaaacaaaaaabdaaaaaadcaaaaalhcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaaegbcbaiaebaaaaaaaaaaaaaa
baaaaaahicaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaaaaaaaaaaeeaaaaaf
icaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaapgapbaaa
aaaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egbcbaaaacaaaaaacpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaai
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakiacaaaaaaaaaaaaiaaaaaabjaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaagaabaaa
aaaaaaaaegiocaaaaaaaaaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaagiacaaaaaaaaaaaacaaaaaadiaaaaaihcaabaaaabaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaafaaaaaadcaaaaakhcaabaaaabaaaaaaegiccaaa
acaaaaaaaeaaaaaaagbabaaaaaaaaaaaegacbaaaabaaaaaadcaaaaakhcaabaaa
abaaaaaaegiccaaaacaaaaaaagaaaaaakgbkbaaaaaaaaaaaegacbaaaabaaaaaa
dcaaaaakhcaabaaaabaaaaaaegiccaaaacaaaaaaahaaaaaapgbpbaaaaaaaaaaa
egacbaaaabaaaaaabaaaaaahbcaabaaaabaaaaaaegacbaaaabaaaaaaegacbaaa
abaaaaaaelaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaaaocaaaaibcaabaaa
abaaaaaaakaabaaaabaaaaaackiacaaaaaaaaaaaahaaaaaacpaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaa
dkiacaaaaaaaaaaaahaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahpccabaaaadaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaadoaaaaab
ejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
aaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
kjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaapadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaa
faepfdejfeejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfcee
aaedepemepfcaaklepfdeheoiaaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaa
abaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
abaaaaaaapaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaa
heaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
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