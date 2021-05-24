//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Water Basic" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _ReflectColor ("Reflection Color", Color) = (1,1,1,1)
 _ReflectionIntensity ("Reflection Intensity", Float) = 1
 _Cube ("Reflection Cubemap", CUBE) = "" { TexGen CubeReflect }
 _BumpMap ("Wave Normalmap", 2D) = "bump" {}
 _RimPower ("Rim Power", Range(0.2,5)) = 3
 _WaveScale ("Wave scale", Float) = 0.07
 WaveSpeed ("Wave speed (map1 x,y; map2 x,y)", Vector) = (19,9,-16,-7)
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "BASE"
  Tags { "LIGHTMODE"="Always" "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" ATTR14
Matrix 5 [_Object2World]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [unity_Scale]
Float 11 [_WaveScale]
Vector 12 [_WaveOffset]
"!!ARBvp1.0
PARAM c[13] = { { 0.40000001, 0.44999999, 1 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.w, c[10];
MUL R2.xyz, R0.w, c[5];
MUL R3.xyz, R0.w, c[6];
MUL R4.xyz, R0.w, c[7];
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 result.texcoord[2].y, R2, R0;
DP3 result.texcoord[3].y, R0, R3;
DP3 result.texcoord[4].y, R0, R4;
MUL R0.xy, vertex.position, c[11].x;
RCP R0.z, c[10].w;
MAD R1, R0.xyxy, R0.z, c[12];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
ADD R0.xyz, -R0, c[9];
MUL result.texcoord[0], R1, c[0].xyzz;
MOV result.texcoord[1].xyz, -R0;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, R2, vertex.attrib[14];
DP3 result.texcoord[3].z, vertex.normal, R3;
DP3 result.texcoord[3].x, vertex.attrib[14], R3;
DP3 result.texcoord[4].z, vertex.normal, R4;
DP3 result.texcoord[4].x, vertex.attrib[14], R4;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 30 instructions, 5 R-regs
"
}
SubProgram "d3d9 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_WorldSpaceCameraPos]
Vector 9 [unity_Scale]
Float 10 [_WaveScale]
Vector 11 [_WaveOffset]
"vs_2_0
def c12, 0.40000001, 0.44999999, 1.00000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mov r1.xyz, c4
mul r2.xyz, c9.w, r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c6
mul r4.xyz, c9.w, r1
mov r3.xyz, c5
mul r3.xyz, c9.w, r3
dp3 oT2.y, r2, r0
dp3 oT3.y, r0, r3
dp3 oT4.y, r0, r4
mul r0.xy, v0, c10.x
rcp r0.z, c9.w
mad r1, r0.xyxy, r0.z, c11
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
add r0.xyz, -r0, c8
mul oT0, r1, c12.xyzz
mov oT1.xyz, -r0
dp3 oT2.z, v2, r2
dp3 oT2.x, r2, v1
dp3 oT3.z, v2, r3
dp3 oT3.x, v1, r3
dp3 oT4.z, v2, r4
dp3 oT4.x, v1, r4
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Float 32 [_WaveScale]
Vector 48 [_WaveOffset]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedlpcmhadkpkncgkfdiahodhkippceanicabaaaaaalmagaaaaadaaaaaa
cmaaaaaamaaaaaaahiabaaaaejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaahjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaaiaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaa
keaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaa
aaaaaaaaadaaaaaaadaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaa
aeaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefcdmafaaaa
eaaaabaaepabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaa
abaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaafpaaaaadpcbabaaa
aaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaaacaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaagfaaaaadhccabaaa
acaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaad
hccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
acaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegbebaaaaaaaaaaaagiacaaa
aaaaaaaaacaaaaaaaoaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaadaaaaaadiaaaaakpccabaaaabaaaaaaegaobaaaaaaaaaaaaceaaaaa
mnmmmmdoggggogdoaaaaiadpaaaaiadpdiaaaaaihcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaiaebaaaaaaaaaaaaaa
egiccaaaabaaaaaaaeaaaaaadgaaaaaghccabaaaacaaaaaaegacbaiaebaaaaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
akiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
dgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaa
aaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaabkiacaaa
acaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaa
acaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadgaaaaag
bcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaagccaabaaaaaaaaaaa
ckiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaackiacaaaacaaaaaa
aoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaapgipcaaaacaaaaaa
beaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaaegacbaaaaaaaaaaa
baaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaah
eccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Bind "vertex" Vertex
Bind "normal" Normal
Bind "tangent" TexCoord2
ConstBuffer "$Globals" 112
Float 32 [_WaveScale]
Vector 48 [_WaveOffset]
ConstBuffer "UnityPerCamera" 128
Vector 64 [_WorldSpaceCameraPos] 3
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
Vector 320 [unity_Scale]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedbighoiaconcjakiokjkejnjcoooakfkiabaaaaaapaajaaaaaeaaaaaa
daaaaaaagaadaaaakeaiaaaadiajaaaaebgpgodjciadaaaaciadaaaaaaacpopp
meacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaacaa
acaaabaaaaaaaaaaabaaaeaaabaaadaaaaaaaaaaacaaaaaaaeaaaeaaaaaaaaaa
acaaamaaaeaaaiaaaaaaaaaaacaabeaaabaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafanaaapkamnmmmmdoggggogdoaaaaiadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjaafaaaaad
aaaaahiaaaaaffjaajaaoekaaeaaaaaeaaaaahiaaiaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaahiaakaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaahiaalaaoeka
aaaappjaaaaaoeiaacaaaaadaaaaahiaaaaaoeibadaaoekaabaaaaacabaaahoa
aaaaoeibabaaaaacaaaaabiaaiaaaakaabaaaaacaaaaaciaajaaaakaabaaaaac
aaaaaeiaakaaaakaafaaaaadaaaaahiaaaaaoeiaamaappkaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaabaaoejaafaaaaadacaaahiaabaamjia
acaancjaaeaaaaaeabaaahiaacaamjjaabaanciaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaabaaaaacaaaaabiaaiaaffkaabaaaaacaaaaaciaajaaffka
abaaaaacaaaaaeiaakaaffkaafaaaaadaaaaahiaaaaaoeiaamaappkaaiaaaaad
adaaaboaabaaoejaaaaaoeiaaiaaaaadadaaacoaabaaoeiaaaaaoeiaaiaaaaad
adaaaeoaacaaoejaaaaaoeiaabaaaaacaaaaabiaaiaakkkaabaaaaacaaaaacia
ajaakkkaabaaaaacaaaaaeiaakaakkkaafaaaaadaaaaahiaaaaaoeiaamaappka
aiaaaaadaeaaaboaabaaoejaaaaaoeiaaiaaaaadaeaaacoaabaaoeiaaaaaoeia
aiaaaaadaeaaaeoaacaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaafaaoeka
aeaaaaaeaaaaapiaaeaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaagaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaahaaoekaaaaappjaaaaaoeiaaeaaaaae
aaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaafaaaaad
aaaaapiaaaaaeejaabaaaakaagaaaaacabaaabiaamaappkaaeaaaaaeaaaaapia
aaaaoeiaabaaaaiaacaaoekaafaaaaadaaaaapoaaaaaoeiaanaakekappppaaaa
fdeieefcdmafaaaaeaaaabaaepabaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
fjaaaaaeegiocaaaabaaaaaaafaaaaaafjaaaaaeegiocaaaacaaaaaabfaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaaabaaaaaa
gfaaaaadhccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaadhccabaaa
aeaaaaaagfaaaaadhccabaaaafaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaipcaabaaaaaaaaaaaegbebaaa
aaaaaaaaagiacaaaaaaaaaaaacaaaaaaaoaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaaaaaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiocaaaaaaaaaaaadaaaaaadiaaaaakpccabaaaabaaaaaaegaobaaa
aaaaaaaaaceaaaaamnmmmmdoggggogdoaaaaiadpaaaaiadpdiaaaaaihcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiccaaaacaaaaaaanaaaaaadcaaaaakhcaabaaa
aaaaaaaaegiccaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaaegacbaaaaaaaaaaa
dcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaa
egacbaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegiccaaaacaaaaaaapaaaaaa
pgbpbaaaaaaaaaaaegacbaaaaaaaaaaaaaaaaaajhcaabaaaaaaaaaaaegacbaia
ebaaaaaaaaaaaaaaegiccaaaabaaaaaaaeaaaaaadgaaaaaghccabaaaacaaaaaa
egacbaiaebaaaaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaaakiacaaaacaaaaaa
amaaaaaadgaaaaagccaabaaaaaaaaaaaakiacaaaacaaaaaaanaaaaaadgaaaaag
ecaabaaaaaaaaaaaakiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaa
egacbaaaaaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahbccabaaaadaaaaaa
egbcbaaaabaaaaaaegacbaaaaaaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaa
acaaaaaaegacbaaaaaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaa
cgbjbaaaacaaaaaadcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaa
abaaaaaaegacbaiaebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaa
abaaaaaapgbpbaaaabaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadgaaaaagbcaabaaaaaaaaaaabkiacaaaacaaaaaaamaaaaaa
dgaaaaagccaabaaaaaaaaaaabkiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaa
aaaaaaaabkiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaa
aaaaaaaapgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaaeaaaaaaegacbaaa
abaaaaaaegacbaaaaaaaaaaabaaaaaahbccabaaaaeaaaaaaegbcbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaaheccabaaaaeaaaaaaegbcbaaaacaaaaaaegacbaaa
aaaaaaaadgaaaaagbcaabaaaaaaaaaaackiacaaaacaaaaaaamaaaaaadgaaaaag
ccaabaaaaaaaaaaackiacaaaacaaaaaaanaaaaaadgaaaaagecaabaaaaaaaaaaa
ckiacaaaacaaaaaaaoaaaaaadiaaaaaihcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgipcaaaacaaaaaabeaaaaaabaaaaaahcccabaaaafaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaabaaaaaahbccabaaaafaaaaaaegbcbaaaabaaaaaaegacbaaa
aaaaaaaabaaaaaaheccabaaaafaaaaaaegbcbaaaacaaaaaaegacbaaaaaaaaaaa
doaaaaabejfdeheoimaaaaaaaeaaaaaaaiaaaaaagiaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapapaaaahbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apapaaaahjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaaiaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaklklklepfdeheolaaaaaaa
agaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
keaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaahaiaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaahaiaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahaiaaaa
keaaaaaaaeaaaaaaaaaaaaaaadaaaaaaafaaaaaaahaiaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Vector 0 [_ReflectColor]
Vector 1 [_Color]
Float 2 [_RimPower]
Float 3 [_ReflectionIntensity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_Cube] CUBE 1
"!!ARBfp1.0
PARAM c[5] = { program.local[0..3],
		{ 2, 1, 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.yw, fragment.texcoord[0].zwzw, texture[0], 2D;
TEX R0.yw, fragment.texcoord[0], texture[0], 2D;
MAD R1.xy, R1.wyzw, c[4].x, -c[4].y;
MUL R1.zw, R1.xyxy, R1.xyxy;
MAD R0.xy, R0.wyzw, c[4].x, -c[4].y;
ADD_SAT R1.z, R1, R1.w;
MUL R0.zw, R0.xyxy, R0.xyxy;
ADD_SAT R0.z, R0, R0.w;
ADD R0.w, -R1.z, c[4].y;
RSQ R0.w, R0.w;
ADD R0.z, -R0, c[4].y;
RSQ R0.z, R0.z;
DP3 R1.w, -fragment.texcoord[1], -fragment.texcoord[1];
RSQ R1.w, R1.w;
RCP R1.z, R0.w;
RCP R0.z, R0.z;
ADD R0.xyz, R0, R1;
MUL R0.xyz, R0, c[4].z;
DP3 R1.z, fragment.texcoord[4], R0;
DP3 R1.x, R0, fragment.texcoord[2];
DP3 R1.y, R0, fragment.texcoord[3];
DP3 R0.x, R1, fragment.texcoord[1];
MUL R0.xyz, R1, R0.x;
MAD R0.xyz, -R0, c[4].x, fragment.texcoord[1];
MUL R2.xyz, R1.w, -fragment.texcoord[1];
DP3_SAT R1.x, R1, R2;
ADD R1.x, -R1, c[4].y;
POW R1.x, R1.x, c[2].x;
TEX R0, R0, texture[1], CUBE;
MUL R0, R0, c[0];
MUL R0, R0, c[3].x;
MUL R0, R0, R1.x;
ADD result.color, R0, c[1];
END
# 33 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Vector 0 [_ReflectColor]
Vector 1 [_Color]
Float 2 [_RimPower]
Float 3 [_ReflectionIntensity]
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_Cube] CUBE 1
"ps_2_0
dcl_2d s0
dcl_cube s1
def c4, 2.00000000, -1.00000000, 1.00000000, 0.50000000
dcl t0
dcl t1.xyz
dcl t2.xyz
dcl t3.xyz
dcl t4.xyz
texld r1, t0, s0
mov r1.x, r1.w
mad_pp r1.xy, r1, c4.x, c4.y
mul_pp r3.xy, r1, r1
add_pp_sat r3.x, r3, r3.y
add_pp r3.x, -r3, c4.z
rsq_pp r3.x, r3.x
rcp_pp r1.z, r3.x
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s0
mov r0.x, r0.w
mad_pp r0.xy, r0, c4.x, c4.y
mul_pp r2.xy, r0, r0
add_pp_sat r2.x, r2, r2.y
add_pp r2.x, -r2, c4.z
rsq_pp r2.x, r2.x
rcp_pp r0.z, r2.x
add_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c4.w
dp3 r2.x, -t1, -t1
rsq r2.x, r2.x
dp3 r1.z, t4, r0
dp3 r1.y, r0, t3
dp3 r1.x, r0, t2
dp3 r0.x, r1, t1
mul r0.xyz, r1, r0.x
mul r2.xyz, r2.x, -t1
dp3_sat r1.x, r1, r2
add r1.x, -r1, c4.z
pow_pp r2.x, r1.x, c2.x
mad r0.xyz, -r0, c4.x, t1
texld r0, r0, s1
mul r1, r0, c0
mov_pp r0.x, r2.x
mul r1, r1, c3.x
mul r0, r1, r0.x
add_pp r0, r0, c1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Vector 64 [_ReflectColor]
Vector 80 [_Color]
Float 96 [_RimPower]
Float 100 [_ReflectionIntensity]
BindCB  "$Globals" 0
"ps_4_0
eefiecedlobpkkgmcndedmjgipimffkpdkeclpigabaaaaaalmafaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjmaeaaaa
eaaaaaaachabaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fidaaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaad
hcbabaaaacaaaaaagcbaaaadhcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaa
gcbaaaadhcbabaaaafaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
aaaaaaaadkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaa
egaabaaaabaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpelaaaaafecaabaaaabaaaaaadkaabaaaaaaaaaaaaaaaaaahhcaabaaa
aaaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaadiaaaaakhcaabaaaaaaaaaaa
egacbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaabaaaaaah
bcaabaaaabaaaaaaegbcbaaaadaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaa
abaaaaaaegbcbaaaaeaaaaaaegacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaa
egbcbaaaafaaaaaaegacbaaaaaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaa
acaaaaaaegacbaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaia
ebaaaaaaaaaaaaaaegbcbaaaacaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaa
aaaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaaegiocaaaaaaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaa
egaobaaaaaaaaaaafgifcaaaaaaaaaaaagaaaaaabaaaaaajicaabaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaaegbcbaiaebaaaaaaacaaaaaaeeaaaaaficaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaaihcaabaaaacaaaaaapgapbaaaabaaaaaa
egbcbaiaebaaaaaaacaaaaaabacaaaahbcaabaaaabaaaaaaegacbaaaacaaaaaa
egacbaaaabaaaaaaaaaaaaaibcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpcpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaai
bcaabaaaabaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaakpccabaaaaaaaaaaaegaobaaa
aaaaaaaaagaabaaaabaaaaaaegiocaaaaaaaaaaaafaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
SetTexture 0 [_BumpMap] 2D 0
SetTexture 1 [_Cube] CUBE 1
ConstBuffer "$Globals" 112
Vector 64 [_ReflectColor]
Vector 80 [_Color]
Float 96 [_RimPower]
Float 100 [_ReflectionIntensity]
BindCB  "$Globals" 0
"ps_4_0_level_9_1
eefiecedpkidgcomkfngabbclnhodpabifpjojmoabaaaaaajmaiaaaaaeaaaaaa
daaaaaaaamadaaaalaahaaaagiaiaaaaebgpgodjneacaaaaneacaaaaaaacpppp
jmacaaaadiaaaaaaabaacmaaaaaadiaaaaaadiaaacaaceaaaaaadiaaaaaaaaaa
abababaaaaaaaeaaadaaaaaaaaaaaaaaaaacppppfbaaaaafadaaapkaaaaaaaea
aaaaialpaaaaaaaaaaaaiadpfbaaaaafaeaaapkaaaaaaadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaahlabpaaaaac
aaaaaaiaacaaahlabpaaaaacaaaaaaiaadaaahlabpaaaaacaaaaaaiaaeaaahla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajiabaiapkaabaaaaacaaaaabia
aaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaaeaaaaaeacaacbiaaaaappiaadaaaaka
adaaffkaaeaaaaaeacaacciaaaaaffiaadaaaakaadaaffkafkaaaaaeacaadiia
acaaoeiaacaaoeiaadaakkkaacaaaaadacaaciiaacaappibadaappkaahaaaaac
acaaciiaacaappiaagaaaaacacaaceiaacaappiaaeaaaaaeaaaacbiaabaappia
adaaaakaadaaffkaaeaaaaaeaaaacciaabaaffiaadaaaakaadaaffkafkaaaaae
aaaadiiaaaaaoeiaaaaaoeiaadaakkkaacaaaaadaaaaciiaaaaappibadaappka
ahaaaaacaaaaciiaaaaappiaagaaaaacaaaaceiaaaaappiaacaaaaadaaaachia
acaaoeiaaaaaoeiaafaaaaadaaaachiaaaaaoeiaaeaaaakaaiaaaaadabaaabia
acaaoelaaaaaoeiaaiaaaaadabaaaciaadaaoelaaaaaoeiaaiaaaaadabaaaeia
aeaaoelaaaaaoeiaaiaaaaadabaaaiiaabaaoelaabaaoeiaacaaaaadabaaaiia
abaappiaabaappiaaeaaaaaeaaaaahiaabaaoeiaabaappibabaaoelaecaaaaad
aaaaapiaaaaaoeiaabaioekaafaaaaadaaaaapiaaaaaoeiaaaaaoekaafaaaaad
aaaaapiaaaaaoeiaacaaffkaceaaaaacacaaahiaabaaoelbaiaaaaadabaabbia
acaaoeiaabaaoeiaacaaaaadabaacbiaabaaaaibadaappkacaaaaaadacaacbia
abaaaaiaacaaaakaaeaaaaaeaaaacpiaaaaaoeiaacaaaaiaabaaoekaabaaaaac
aaaicpiaaaaaoeiappppaaaafdeieefcjmaeaaaaeaaaaaaachabaaaafjaaaaae
egiocaaaaaaaaaaaahaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafidaaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagcbaaaad
hcbabaaaadaaaaaagcbaaaadhcbabaaaaeaaaaaagcbaaaadhcbabaaaafaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaapdcaabaaa
aaaaaaaahgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaa
aceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaaapaaaaahicaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaaaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaaaaaaaaaadkaabaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaapdcaabaaaabaaaaaahgapbaaaabaaaaaaaceaaaaaaaaaaaea
aaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
apaaaaahicaabaaaaaaaaaaaegaabaaaabaaaaaaegaabaaaabaaaaaaddaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpelaaaaafecaabaaa
abaaaaaadkaabaaaaaaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaadiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaadpaaaaaaaabaaaaaahbcaabaaaabaaaaaaegbcbaaa
adaaaaaaegacbaaaaaaaaaaabaaaaaahccaabaaaabaaaaaaegbcbaaaaeaaaaaa
egacbaaaaaaaaaaabaaaaaahecaabaaaabaaaaaaegbcbaaaafaaaaaaegacbaaa
aaaaaaaabaaaaaahbcaabaaaaaaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaa
aaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaak
hcaabaaaaaaaaaaaegacbaaaabaaaaaaagaabaiaebaaaaaaaaaaaaaaegbcbaaa
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegacbaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaaegiocaaa
aaaaaaaaaeaaaaaadiaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaafgifcaaa
aaaaaaaaagaaaaaabaaaaaajicaabaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
egbcbaiaebaaaaaaacaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaaihcaabaaaacaaaaaapgapbaaaabaaaaaaegbcbaiaebaaaaaaacaaaaaa
bacaaaahbcaabaaaabaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaaaaaaaaai
bcaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpcpaaaaaf
bcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaaakaabaaa
abaaaaaaakiacaaaaaaaaaaaagaaaaaabjaaaaafbcaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaakpccabaaaaaaaaaaaegaobaaaaaaaaaaaagaabaaaabaaaaaa
egiocaaaaaaaaaaaafaaaaaadoaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapapaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahahaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaahahaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaaeaaaaaaahahaaaakeaaaaaaaeaaaaaa
aaaaaaaaadaaaaaaafaaaaaaahahaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "BASE"
  Tags { "LIGHTMODE"="Always" "RenderType"="Opaque" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "normal", Normal
  }
  SetTexture [_Cube] { ConstantColor [_ReflectColor] combine texture * constant }
 }
}
Fallback "VertexLit"
}