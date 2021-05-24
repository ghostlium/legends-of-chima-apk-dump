//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "AngryBots/RealtimeReflectionInWaterFlow" {
Properties {
 _MainTex ("Base", 2D) = "white" {}
 _Normal ("Normal", 2D) = "bump" {}
 _ReflectionTex ("_ReflectionTex", 2D) = "black" {}
 _FakeReflect ("Fake reflection", 2D) = "black" {}
 _DirectionUv ("Wet scroll direction (2 samples)", Vector) = (1,1,-0.2,-0.2)
 _TexAtlasTiling ("Tex atlas tiling", Vector) = (8,8,4,4)
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[15] = { { 0.60000002, 0.07, 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[11].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV R1, c[12];
MUL R1, R1, c[9].x;
MAD result.texcoord[1], vertex.texcoord[0].xyxy, c[13], R1;
MOV R1.x, c[0];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[7];
MAD R0.xy, R1.x, -c[10].xzzw, R0;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.60000002, 0.07000000, 0.50000000, 0
dcl_position0 v0
dcl_texcoord0 v1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.z
mov oPos, r0
mul r1.y, r1, c10.x
mad oT2.xy, r1.z, c11.zwzw, r1
mov r1.x, c8
mul r1, c12, r1.x
mad oT1, v1.xyxy, c13, r1
mov r1.xy, c9.xzzw
dp4 r0.x, v0, c4
dp4 r0.y, v0, c6
mad r0.xy, c15.x, -r1, r0
mov oT2.zw, r0
mul oT3.xy, r0, c15.y
mad oT0.xy, v1, c14, c14.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedecclnplfpfedmecoibmlbicgpfohclhoabaaaaaamiaeaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefccmadaaaaeaaaabaa
mlaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaaacaaaaaaanaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaandcaabaaa
abaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlpjkjjbjlpaaaaaaaa
aaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaaagaebaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaaagiacaaaabaaaaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaaegiocaaaaaaaaaaa
acaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgmioiodackijdhanpgdmemhhcbkcljieabaaaaaaniagaaaaaeaaaaaa
daaaaaaadmacaaaahaafaaaadiagaaaaebgpgodjaeacaaaaaeacaaaaaaacpopp
kaabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaabaaaeaaacaaafaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkajkjjbjlpcjfmipdnaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaabaaaaacaaaaabiaaeaaaakaafaaaaadaaaaapiaaaaaaaiaabaaoeka
aeaaaaaeabaaapoaadaaeejaacaaoekaaaaaoeiaafaaaaadaaaaadiaaaaaffja
amaaockaaeaaaaaeaaaaadiaalaaockaaaaaaajaaaaaoeiaaeaaaaaeaaaaadia
anaaockaaaaakkjaaaaaoeiaaeaaaaaeaaaaadiaaoaaockaaaaappjaaaaaoeia
abaaaaacabaaabiaapaaaakaaeaaaaaeaaaaadiaafaaockaabaaaaiaaaaaoeia
afaaaaadaaaaamoaaaaaeeiaapaaffkaafaaaaadaaaaapiaaaaaffjaaiaaoeka
aeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaapeiaapaakkkaafaaaaadabaaaiiaabaaffiaagaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefc
cmadaaaaeaaaabaamlaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaa
acaaaaaaanaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaigiacaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaandcaabaaaabaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlp
jkjjbjlpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaa
agaebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
agiacaaaabaaaaaaaaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaa
egiocaaaaaaaaaaaacaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaa
egadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaa
abaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
Vector 15 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[16] = { { 0.60000002, 0.07, 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[11].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV R1, c[12];
MUL R1, R1, c[9].x;
MAD result.texcoord[1], vertex.texcoord[0].xyxy, c[13], R1;
MOV R1.x, c[0];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[7];
MAD R0.xy, R1.x, -c[10].xzzw, R0;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
Vector 15 [unity_LightmapST]
"vs_2_0
def c16, 0.60000002, 0.07000000, 0.50000000, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.z
mov oPos, r0
mul r1.y, r1, c10.x
mad oT2.xy, r1.z, c11.zwzw, r1
mov r1.x, c8
mul r1, c12, r1.x
mad oT1, v1.xyxy, c13, r1
mov r1.xy, c9.xzzw
dp4 r0.x, v0, c4
dp4 r0.y, v0, c6
mad r0.xy, c16.x, -r1, r0
mov oT2.zw, r0
mul oT3.xy, r0, c16.y
mad oT0.xy, v1, c14, c14.zwzw
mad oT4.xy, v2, c15, c15.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
Vector 64 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedgfjcmbehkpfmkecdckafhbfdfaplccncabaaaaaaceafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
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
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefchaadaaaaeaaaabaanmaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaa
aaaaaaaaigiacaaaacaaaaaaanaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaigiacaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaandcaabaaaabaaaaaaigiacaaaabaaaaaaaeaaaaaa
aceaaaaajkjjbjlpjkjjbjlpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaak
mccabaaaabaaaaaaagaebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaacjfmipdn
cjfmipdndcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaabaaaaaaagiacaaaabaaaaaaaaaaaaaadcaaaaakpccabaaaacaaaaaa
egbebaaaadaaaaaaegiocaaaaaaaaaaaacaaaaaaegaobaaaabaaaaaadiaaaaak
hcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaadiaaaaaiicaabaaa
abaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaaeaaaaaa
egbabaaaaeaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
Vector 64 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedndlijaicbgclehcnhnnlmfpkhkjkjlnnabaaaaaafeahaaaaaeaaaaaa
daaaaaaafmacaaaaneafaaaajmagaaaaebgpgodjceacaaaaceacaaaaaaacpopp
maabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaaeaaacaaagaaaaaaaaaa
acaaaaaaaeaaaiaaaaaaaaaaacaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkajkjjbjlpcjfmipdnaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaadaaoekaadaaookaaeaaaaaeadaaadoaaeaaoejaaeaaoeka
aeaaookaabaaaaacaaaaabiaafaaaakaafaaaaadaaaaapiaaaaaaaiaabaaoeka
aeaaaaaeabaaapoaadaaeejaacaaoekaaaaaoeiaafaaaaadaaaaadiaaaaaffja
anaaockaaeaaaaaeaaaaadiaamaaockaaaaaaajaaaaaoeiaaeaaaaaeaaaaadia
aoaaockaaaaakkjaaaaaoeiaaeaaaaaeaaaaadiaapaaockaaaaappjaaaaaoeia
abaaaaacabaaabiabaaaaakaaeaaaaaeaaaaadiaagaaockaabaaaaiaaaaaoeia
afaaaaadaaaaamoaaaaaeeiabaaaffkaafaaaaadaaaaapiaaaaaffjaajaaoeka
aeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaapeiabaaakkkaafaaaaadabaaaiiaabaaffiaahaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefc
haadaaaaeaaaabaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaaacaaaaaaanaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaandcaabaaa
abaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlpjkjjbjlpaaaaaaaa
aaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaaagaebaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaaagiacaaaabaaaaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaaegiocaaaaaaaaaaa
acaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_FakeReflect] 2D 2
SetTexture 3 [_MainTex] 2D 3
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 2, 1, 0.024993896, 0.049987793 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1.yw, fragment.texcoord[1].zwzw, texture[0], 2D;
TEX R0.yw, fragment.texcoord[1], texture[0], 2D;
MAD R1.xy, R1.wyzw, c[0].x, -c[0].y;
MAD R0.xy, R0.wyzw, c[0].x, R1;
ADD R0.xy, R0, -c[0].y;
MUL R0.zw, R0.xyxy, c[0].z;
MAD R1.zw, R0, c[0].x, fragment.texcoord[3].xyxy;
RCP R0.x, fragment.texcoord[2].w;
MAD R1.xy, fragment.texcoord[2], R0.x, R0.zwzw;
MAD R0.xy, R0.zwzw, c[0].w, fragment.texcoord[0];
TEX R2, R1.zwzw, texture[2], 2D;
TEX R1, R1, texture[1], 2D;
TEX R0, R0, texture[3], 2D;
ADD R1, R1, R2;
MAD result.color, R0.w, R1, R0;
END
# 15 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_FakeReflect] 2D 2
SetTexture 3 [_MainTex] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, 2.00000000, -1.00000000, 0.02499390, 0.04998779
dcl t0.xy
dcl t1
dcl t2.xyzw
dcl t3.xy
texld r1, t1, s0
mov r1.x, r1.w
mov r0.y, t1.w
mov r0.x, t1.z
rcp_pp r2.x, t2.w
texld r0, r0, s0
mov r0.x, r0.w
mad_pp r0.xy, r0, c0.x, c0.y
mad_pp r0.xy, r1, c0.x, r0
add_pp r0.xy, r0, c0.y
mul_pp r0.xy, r0, c0.z
mad_pp r2.xy, t2, r2.x, r0
mad_pp r1.xy, r0, c0.x, t3
mad_pp r0.xy, r0, c0.w, t0
texld r2, r2, s1
texld r0, r0, s3
texld r1, r1, s2
add_pp r1, r2, r1
mad_pp r0, r0.w, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_FakeReflect] 2D 3
SetTexture 3 [_MainTex] 2D 0
"ps_4_0
eefiecedfgkecldpblhgbhjencfdkolaefeiefedabaaaaaapmadaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcpeacaaaaeaaaaaaalnaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaahgapbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
aoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaaadaaaaaadcaaaaam
mcaabaaaaaaaaaaaagaebaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmmmdm
mnmmmmdmkgaobaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaammcaabaaaaaaaaaaaagaebaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmemdnmnmmemdnkgbobaaaabaaaaaa
dcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaalnhkddkalnhkddk
aaaaaaaaaaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogakbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaajpccabaaaaaaaaaaa
pgapbaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_FakeReflect] 2D 3
SetTexture 3 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedlphbffiaocphccohanjdaoalfkbnbhikabaaaaaabiagaaaaaeaaaaaa
daaaaaaaeiacaaaaeeafaaaaoeafaaaaebgpgodjbaacaaaabaacaaaaaaacpppp
nmabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaadaaaaaa
aaababaaabacacaaacadadaaaaacppppfbaaaaafaaaaapkaaaaaaaeaaaaaialp
mnmmmmdmmnmmemdnfbaaaaafabaaapkaalnhkddkaaaaaaaaaaaaaaaaaaaaaaaa
bpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacplabpaaaaacaaaaaaia
acaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaac
aaaaaajaacaiapkabpaaaaacaaaaaajaadaiapkaabaaaaacaaaacbiaabaakkla
abaaaaacaaaacciaabaapplaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaad
abaacpiaabaaoelaabaioekaaeaaaaaeacaacbiaaaaappiaaaaaaakaaaaaffka
aeaaaaaeacaacciaaaaaffiaaaaaaakaaaaaffkaaeaaaaaeaaaacbiaabaappia
aaaaaakaaaaaffkaaeaaaaaeaaaacciaabaaffiaaaaaaakaaaaaffkaacaaaaad
aaaacdiaacaaoeiaaaaaoeiaafaaaaadaaaacmiaaaaabliaaaaakkkaagaaaaac
abaaabiaacaapplaaeaaaaaeabaacdiaacaaoelaabaaaaiaaaaabliaaeaaaaae
acaacdiaaaaaoeiaaaaappkaaaaabllaaeaaaaaeaaaacdiaaaaaoeiaabaaaaka
aaaaoelaecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadaaaacpiaaaaaoeia
aaaioekaecaaaaadacaaapiaacaaoeiaadaioekaacaaaaadabaacpiaabaaoeia
acaaoeiaaeaaaaaeaaaacpiaaaaappiaabaaoeiaaaaaoeiaabaaaaacaaaicpia
aaaaoeiappppaaaafdeieefcpeacaaaaeaaaaaaalnaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaa
aaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaa
eghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaahgapbaaa
abaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaegaabaaaaaaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaialpaaaaialp
aaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaa
adaaaaaadcaaaaammcaabaaaaaaaaaaaagaebaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaamnmmmmdmmnmmmmdmkgaobaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaammcaabaaa
aaaaaaaaagaebaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmemdnmnmmemdn
kgbobaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
alnhkddkalnhkddkaaaaaaaaaaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaaaaaaaaaogakbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaa
aaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadcaaaaaj
pccabaaaaaaaaaaapgapbaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_FakeReflect] 2D 2
SetTexture 3 [_MainTex] 2D 3
SetTexture 4 [unity_Lightmap] 2D 4
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[2] = { { 2, 1, 0.024993896, 0.049987793 },
		{ 8 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R1.yw, fragment.texcoord[1].zwzw, texture[0], 2D;
TEX R0.yw, fragment.texcoord[1], texture[0], 2D;
MAD R1.xy, R1.wyzw, c[0].x, -c[0].y;
MAD R0.xy, R0.wyzw, c[0].x, R1;
ADD R0.xy, R0, -c[0].y;
MUL R0.xy, R0, c[0].z;
MAD R3.xy, R0, c[0].x, fragment.texcoord[3];
RCP R1.x, fragment.texcoord[2].w;
MAD R1.xy, fragment.texcoord[2], R1.x, R0;
MAD R0.zw, R0.xyxy, c[0].w, fragment.texcoord[0].xyxy;
TEX R2, R1, texture[1], 2D;
TEX R1, fragment.texcoord[4], texture[4], 2D;
TEX R3, R3, texture[2], 2D;
TEX R0, R0.zwzw, texture[3], 2D;
MUL R1.xyz, R1.w, R1;
MUL R0.xyz, R0, R1;
ADD R2, R2, R3;
MOV R1.w, R0;
MUL R1.xyz, R0, c[1].x;
MAD result.color, R0.w, R2, R1;
END
# 20 instructions, 4 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_FakeReflect] 2D 2
SetTexture 3 [_MainTex] 2D 3
SetTexture 4 [unity_Lightmap] 2D 4
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c0, 2.00000000, -1.00000000, 0.02499390, 0.04998779
def c1, 8.00000000, 0, 0, 0
dcl t0.xy
dcl t1
dcl t2.xyzw
dcl t3.xy
dcl t4.xy
texld r1, t1, s0
mov r1.x, r1.w
mov r0.y, t1.w
mov r0.x, t1.z
texld r0, r0, s0
mov r0.x, r0.w
mad_pp r0.xy, r0, c0.x, c0.y
mad_pp r0.xy, r1, c0.x, r0
add_pp r0.xy, r0, c0.y
mul_pp r2.xy, r0, c0.z
mad_pp r1.xy, r2, c0.w, t0
rcp_pp r0.x, t2.w
mad_pp r0.xy, t2, r0.x, r2
mad_pp r2.xy, r2, c0.x, t3
texld r3, r0, s1
texld r1, r1, s3
texld r2, r2, s2
texld r0, t4, s4
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r1, r0
add_pp r2, r3, r2
mov_pp r0.w, r1
mul_pp r0.xyz, r0, c1.x
mad_pp r0, r1.w, r2, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_FakeReflect] 2D 3
SetTexture 3 [_MainTex] 2D 0
SetTexture 4 [unity_Lightmap] 2D 4
"ps_4_0
eefieceddlppcijkcfophmgjemnbflhipgdbbaheabaaaaaaleaeaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcjeadaaaa
eaaaaaaaofaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaa
aeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaa
ffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagcbaaaadlcbabaaa
adaaaaaagcbaaaaddcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaahgapbaaaaaaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaacaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaahgapbaaaabaaaaaaaceaaaaa
aaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaialpaaaaialpaaaaaaaaaaaaaaaa
aoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaaadaaaaaadcaaaaam
mcaabaaaaaaaaaaaagaebaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmmmdm
mnmmmmdmkgaobaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaammcaabaaaaaaaaaaaagaebaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmemdnmnmmemdnkgbobaaaabaaaaaa
dcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaalnhkddkalnhkddk
aaaaaaaaaaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaa
aaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
ogakbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaaaaaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahicaabaaa
abaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaaabaaaaaa
egacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaahhcaabaaaacaaaaaaegacbaaa
abaaaaaaegacbaaaacaaaaaadcaaaaajpccabaaaaaaaaaaapgapbaaaacaaaaaa
egaobaaaaaaaaaaaegaobaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_FakeReflect] 2D 3
SetTexture 3 [_MainTex] 2D 0
SetTexture 4 [unity_Lightmap] 2D 4
"ps_4_0_level_9_1
eefiecedjihlcnikliecphnibjanligbbckgpabcabaaaaaacmahaaaaaeaaaaaa
daaaaaaakeacaaaaeaagaaaapiagaaaaebgpgodjgmacaaaagmacaaaaaaacpppp
deacaaaadiaaaaaaaaaadiaaaaaadiaaaaaadiaaafaaceaaaaaadiaaadaaaaaa
aaababaaabacacaaacadadaaaeaeaeaaaaacppppfbaaaaafaaaaapkaaaaaaaea
aaaaialpmnmmmmdmmnmmemdnfbaaaaafabaaapkaalnhkddkaaaaaaebaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaacplabpaaaaacaaaaaaiaadaacdlabpaaaaacaaaaaajaaaaiapka
bpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaacaaaaaaja
adaiapkabpaaaaacaaaaaajaaeaiapkaabaaaaacaaaacbiaabaakklaabaaaaac
aaaacciaabaapplaecaaaaadaaaacpiaaaaaoeiaabaioekaecaaaaadabaacpia
abaaoelaabaioekaaeaaaaaeacaacbiaaaaappiaaaaaaakaaaaaffkaaeaaaaae
acaacciaaaaaffiaaaaaaakaaaaaffkaaeaaaaaeaaaacbiaabaappiaaaaaaaka
aaaaffkaaeaaaaaeaaaacciaabaaffiaaaaaaakaaaaaffkaacaaaaadaaaacdia
acaaoeiaaaaaoeiaafaaaaadaaaacmiaaaaabliaaaaakkkaagaaaaacabaaabia
acaapplaaeaaaaaeabaacdiaacaaoelaabaaaaiaaaaabliaaeaaaaaeacaacdia
aaaaoeiaaaaappkaaaaabllaaeaaaaaeaaaacdiaaaaaoeiaabaaaakaaaaaoela
ecaaaaadabaacpiaabaaoeiaacaioekaecaaaaadaaaacpiaaaaaoeiaaaaioeka
ecaaaaadacaaapiaacaaoeiaadaioekaecaaaaadadaacpiaadaaoelaaeaioeka
acaaaaadabaacpiaabaaoeiaacaaoeiaafaaaaadadaaciiaadaappiaabaaffka
afaaaaadacaachiaadaaoeiaadaappiaafaaaaadaaaachiaaaaaoeiaacaaoeia
aeaaaaaeaaaacpiaaaaappiaabaaoeiaaaaaoeiaabaaaaacaaaicpiaaaaaoeia
ppppaaaafdeieefcjeadaaaaeaaaaaaaofaaaaaafkaaaaadaagabaaaaaaaaaaa
fkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaa
adaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
fibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaaddcbabaaaaeaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaapdcaabaaaaaaaaaaa
hgapbaaaaaaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaaceaaaaa
aaaaialpaaaaialpaaaaaaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaa
hgapbaaaabaaaaaaaceaaaaaaaaaaaeaaaaaaaeaaaaaaaaaaaaaaaaaegaabaaa
aaaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaialp
aaaaialpaaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaa
pgbpbaaaadaaaaaadcaaaaammcaabaaaaaaaaaaaagaebaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaamnmmmmdmmnmmmmdmkgaobaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaam
mcaabaaaaaaaaaaaagaebaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmemdn
mnmmemdnkgbobaaaabaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaalnhkddkalnhkddkaaaaaaaaaaaaaaaaegbabaaaabaaaaaaefaaaaaj
pcaabaaaacaaaaaaegaabaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
efaaaaajpcaabaaaaaaaaaaaogakbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
adaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegbabaaaaeaaaaaaeghobaaaaeaaaaaaaagabaaa
aeaaaaaadiaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeb
diaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajpccabaaa
aaaaaaaapgapbaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "RenderType"="Opaque" }
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
"!!ARBvp1.0
PARAM c[15] = { { 0.60000002, 0.07, 0.5 },
		state.matrix.mvp,
		program.local[5..14] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[11].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV R1, c[12];
MUL R1, R1, c[9].x;
MAD result.texcoord[1], vertex.texcoord[0].xyxy, c[13], R1;
MOV R1.x, c[0];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[7];
MAD R0.xy, R1.x, -c[10].xzzw, R0;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
END
# 18 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
"vs_2_0
def c15, 0.60000002, 0.07000000, 0.50000000, 0
dcl_position0 v0
dcl_texcoord0 v1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c15.z
mov oPos, r0
mul r1.y, r1, c10.x
mad oT2.xy, r1.z, c11.zwzw, r1
mov r1.x, c8
mul r1, c12, r1.x
mad oT1, v1.xyxy, c13, r1
mov r1.xy, c9.xzzw
dp4 r0.x, v0, c4
dp4 r0.y, v0, c6
mad r0.xy, c15.x, -r1, r0
mov oT2.zw, r0
mul oT3.xy, r0, c15.y
mad oT0.xy, v1, c14, c14.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedecclnplfpfedmecoibmlbicgpfohclhoabaaaaaamiaeaaaaadaaaaaa
cmaaaaaapeaaaaaajeabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaaafaaaaaa
aiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaadaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefccmadaaaaeaaaabaa
mlaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaaeegiocaaaabaaaaaa
agaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaa
fpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaad
dccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaa
gfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaaacaaaaaaanaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaandcaabaaa
abaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlpjkjjbjlpaaaaaaaa
aaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaaagaebaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaaagiacaaaabaaaaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaaegiocaaaaaaaaaaa
acaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedgmioiodackijdhanpgdmemhhcbkcljieabaaaaaaniagaaaaaeaaaaaa
daaaaaaadmacaaaahaafaaaadiagaaaaebgpgodjaeacaaaaaeacaaaaaaacpopp
kaabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
adaaabaaaaaaaaaaabaaaaaaabaaaeaaaaaaaaaaabaaaeaaacaaafaaaaaaaaaa
acaaaaaaaeaaahaaaaaaaaaaacaaamaaaeaaalaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafapaaapkajkjjbjlpcjfmipdnaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjaaeaaaaaeaaaaadoaadaaoejaadaaoeka
adaaookaabaaaaacaaaaabiaaeaaaakaafaaaaadaaaaapiaaaaaaaiaabaaoeka
aeaaaaaeabaaapoaadaaeejaacaaoekaaaaaoeiaafaaaaadaaaaadiaaaaaffja
amaaockaaeaaaaaeaaaaadiaalaaockaaaaaaajaaaaaoeiaaeaaaaaeaaaaadia
anaaockaaaaakkjaaaaaoeiaaeaaaaaeaaaaadiaaoaaockaaaaappjaaaaaoeia
abaaaaacabaaabiaapaaaakaaeaaaaaeaaaaadiaafaaockaabaaaaiaaaaaoeia
afaaaaadaaaaamoaaaaaeeiaapaaffkaafaaaaadaaaaapiaaaaaffjaaiaaoeka
aeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaajaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaapeiaapaakkkaafaaaaadabaaaiiaabaaffiaagaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefc
cmadaaaaeaaaabaamlaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaagiaaaaacacaaaaaadiaaaaai
pcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
adaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaa
egaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaa
acaaaaaaanaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaa
agbabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaigiacaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaandcaabaaaabaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlp
jkjjbjlpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaa
agaebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaal
dccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaa
aaaaaaaaadaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaa
agiacaaaabaaaaaaaaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaa
egiocaaaaaaaaaaaacaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaa
egadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaaf
mccabaaaadaaaaaakgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaa
abaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaa
abaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaaaiaaaaaa
jiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaa
acaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaa
laaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeoehefeofe
aaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheojiaaaaaa
afaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
imaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaimaaaaaaadaaaaaa
aaaaaaaaadaaaaaaabaaaaaaamadaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaa
acaaaaaaapaaaaaaimaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaaapaaaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 5 [_Object2World]
Vector 9 [_Time]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_ProjectionParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
Vector 15 [unity_LightmapST]
"!!ARBvp1.0
PARAM c[16] = { { 0.60000002, 0.07, 0.5 },
		state.matrix.mvp,
		program.local[5..15] };
TEMP R0;
TEMP R1;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MOV result.position, R0;
MUL R1.y, R1, c[11].x;
ADD result.texcoord[2].xy, R1, R1.z;
MOV R1, c[12];
MUL R1, R1, c[9].x;
MAD result.texcoord[1], vertex.texcoord[0].xyxy, c[13], R1;
MOV R1.x, c[0];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[7];
MAD R0.xy, R1.x, -c[10].xzzw, R0;
MOV result.texcoord[2].zw, R0;
MUL result.texcoord[3].xy, R0, c[0].y;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
END
# 19 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Matrix 4 [_Object2World]
Vector 8 [_Time]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_ProjectionParams]
Vector 11 [_ScreenParams]
Vector 12 [_DirectionUv]
Vector 13 [_TexAtlasTiling]
Vector 14 [_MainTex_ST]
Vector 15 [unity_LightmapST]
"vs_2_0
def c16, 0.60000002, 0.07000000, 0.50000000, 0
dcl_position0 v0
dcl_texcoord0 v1
dcl_texcoord1 v2
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c16.z
mov oPos, r0
mul r1.y, r1, c10.x
mad oT2.xy, r1.z, c11.zwzw, r1
mov r1.x, c8
mul r1, c12, r1.x
mad oT1, v1.xyxy, c13, r1
mov r1.xy, c9.xzzw
dp4 r0.x, v0, c4
dp4 r0.y, v0, c6
mad r0.xy, c16.x, -r1, r0
mov oT2.zw, r0
mul oT3.xy, r0, c16.y
mad oT0.xy, v1, c14, c14.zwzw
mad oT4.xy, v2, c15, c15.zwzw
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
Vector 64 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedgfjcmbehkpfmkecdckafhbfdfaplccncabaaaaaaceafaaaaadaaaaaa
cmaaaaaapeaaaaaakmabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
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
aeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklfdeieefchaadaaaaeaaaabaanmaaaaaafjaaaaae
egiocaaaaaaaaaaaafaaaaaafjaaaaaeegiocaaaabaaaaaaagaaaaaafjaaaaae
egiocaaaacaaaaaabaaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaadpccabaaa
acaaaaaagfaaaaadpccabaaaadaaaaaagfaaaaaddccabaaaaeaaaaaagiaaaaac
acaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaaidcaabaaaabaaaaaafgbfbaaa
aaaaaaaaigiacaaaacaaaaaaanaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaamaaaaaaagbabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaa
abaaaaaaigiacaaaacaaaaaaaoaaaaaakgbkbaaaaaaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaapaaaaaapgbpbaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaandcaabaaaabaaaaaaigiacaaaabaaaaaaaeaaaaaa
aceaaaaajkjjbjlpjkjjbjlpaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaak
mccabaaaabaaaaaaagaebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaacjfmipdn
cjfmipdndcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaa
aaaaaaaaabaaaaaaagiacaaaabaaaaaaaaaaaaaadcaaaaakpccabaaaacaaaaaa
egbebaaaadaaaaaaegiocaaaaaaaaaaaacaaaaaaegaobaaaabaaaaaadiaaaaak
hcaabaaaabaaaaaaegadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaadgaaaaafmccabaaaadaaaaaakgaobaaaaaaaaaaadiaaaaaiicaabaaa
abaaaaaabkaabaaaabaaaaaaakiacaaaabaaaaaaafaaaaaaaaaaaaahdccabaaa
adaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadcaaaaaldccabaaaaeaaaaaa
egbabaaaaeaaaaaaegiacaaaaaaaaaaaaeaaaaaaogikcaaaaaaaaaaaaeaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
ConstBuffer "$Globals" 80
Vector 16 [_DirectionUv]
Vector 32 [_TexAtlasTiling]
Vector 48 [_MainTex_ST]
Vector 64 [unity_LightmapST]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
Vector 64 [_WorldSpaceCameraPos] 3
Vector 80 [_ProjectionParams]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 192 [_Object2World]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedndlijaicbgclehcnhnnlmfpkhkjkjlnnabaaaaaafeahaaaaaeaaaaaa
daaaaaaafmacaaaaneafaaaajmagaaaaebgpgodjceacaaaaceacaaaaaaacpopp
maabaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaabaa
aeaaabaaaaaaaaaaabaaaaaaabaaafaaaaaaaaaaabaaaeaaacaaagaaaaaaaaaa
acaaaaaaaeaaaiaaaaaaaaaaacaaamaaaeaaamaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafbaaaapkajkjjbjlpcjfmipdnaaaaaadpaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaaeaaaaae
aaaaadoaadaaoejaadaaoekaadaaookaaeaaaaaeadaaadoaaeaaoejaaeaaoeka
aeaaookaabaaaaacaaaaabiaafaaaakaafaaaaadaaaaapiaaaaaaaiaabaaoeka
aeaaaaaeabaaapoaadaaeejaacaaoekaaaaaoeiaafaaaaadaaaaadiaaaaaffja
anaaockaaeaaaaaeaaaaadiaamaaockaaaaaaajaaaaaoeiaaeaaaaaeaaaaadia
aoaaockaaaaakkjaaaaaoeiaaeaaaaaeaaaaadiaapaaockaaaaappjaaaaaoeia
abaaaaacabaaabiabaaaaakaaeaaaaaeaaaaadiaagaaockaabaaaaiaaaaaoeia
afaaaaadaaaaamoaaaaaeeiabaaaffkaafaaaaadaaaaapiaaaaaffjaajaaoeka
aeaaaaaeaaaaapiaaiaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaakkjaaaaaoeiaaeaaaaaeaaaaapiaalaaoekaaaaappjaaaaaoeiaafaaaaad
abaaahiaaaaapeiabaaakkkaafaaaaadabaaaiiaabaaffiaahaaaakaacaaaaad
acaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeia
abaaaaacaaaaammaaaaaoeiaabaaaaacacaaamoaaaaaoeiappppaaaafdeieefc
haadaaaaeaaaabaanmaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafjaaaaae
egiocaaaabaaaaaaagaaaaaafjaaaaaeegiocaaaacaaaaaabaaaaaaafpaaaaad
pcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaad
mccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagfaaaaadpccabaaaadaaaaaa
gfaaaaaddccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaa
fgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaak
pcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaa
aaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaapgbpbaaa
aaaaaaaaegaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaa
diaaaaaidcaabaaaabaaaaaafgbfbaaaaaaaaaaaigiacaaaacaaaaaaanaaaaaa
dcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaamaaaaaaagbabaaaaaaaaaaa
egaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaaacaaaaaaaoaaaaaa
kgbkbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaakdcaabaaaabaaaaaaigiacaaa
acaaaaaaapaaaaaapgbpbaaaaaaaaaaaegaabaaaabaaaaaadcaaaaandcaabaaa
abaaaaaaigiacaaaabaaaaaaaeaaaaaaaceaaaaajkjjbjlpjkjjbjlpaaaaaaaa
aaaaaaaaegaabaaaabaaaaaadiaaaaakmccabaaaabaaaaaaagaebaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaacjfmipdncjfmipdndcaaaaaldccabaaaabaaaaaa
egbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaaogikcaaaaaaaaaaaadaaaaaa
diaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaabaaaaaaagiacaaaabaaaaaa
aaaaaaaadcaaaaakpccabaaaacaaaaaaegbebaaaadaaaaaaegiocaaaaaaaaaaa
acaaaaaaegaobaaaabaaaaaadiaaaaakhcaabaaaabaaaaaaegadbaaaaaaaaaaa
aceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaadgaaaaafmccabaaaadaaaaaa
kgaobaaaaaaaaaaadiaaaaaiicaabaaaabaaaaaabkaabaaaabaaaaaaakiacaaa
abaaaaaaafaaaaaaaaaaaaahdccabaaaadaaaaaakgakbaaaabaaaaaamgaabaaa
abaaaaaadcaaaaaldccabaaaaeaaaaaaegbabaaaaeaaaaaaegiacaaaaaaaaaaa
aeaaaaaaogikcaaaaaaaaaaaaeaaaaaadoaaaaabejfdeheomaaaaaaaagaaaaaa
aiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapadaaaaljaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdejfeejepeoaafeebeo
ehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheo
laaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaa
apaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaakeaaaaaa
adaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaaadaaaaaa
apaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_MainTex] 2D 2
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 0.5, 0.099975586 } };
TEMP R0;
TEMP R1;
TEX R0.xy, fragment.texcoord[1], texture[0], 2D;
ADD R0.xy, R0, -c[0].x;
MUL R0.zw, R0.xyxy, c[0].y;
RCP R0.x, fragment.texcoord[2].w;
MAD R1.xy, fragment.texcoord[2], R0.x, R0.zwzw;
TEX R0, fragment.texcoord[0], texture[2], 2D;
TEX R1, R1, texture[1], 2D;
MAD result.color, R0.w, R1, R0;
END
# 8 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_MainTex] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, -0.50000000, 0.09997559, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyzw
texld r0, t1, s0
add_pp r0.xy, r0, c0.x
mul_pp r0.xy, r0, c0.y
rcp_pp r1.x, t2.w
mad_pp r1.xy, t2, r1.x, r0
texld r0, t0, s2
texld r1, r1, s1
mad_pp r0, r0.w, r1, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_MainTex] 2D 0
"ps_4_0
eefiecedjodgonaodfjlgblpodammhimhnfggbllabaaaaaakeacaaaaadaaaaaa
cmaaaaaammaaaaaaaaabaaaaejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amaaaaaaimaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaaimaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaa
feeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl
fdeieefcjmabaaaaeaaaaaaaghaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaa
adaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaamnmmmmdn
mnmmmmdnaaaaaaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadcaaaaaj
pccabaaaaaaaaaaapgapbaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_MainTex] 2D 0
"ps_4_0_level_9_1
eefiecedpaghbbndobfoglcfdcmncpmfcpdghpngabaaaaaaniadaaaaaeaaaaaa
daaaaaaagaabaaaaaeadaaaakeadaaaaebgpgodjciabaaaaciabaaaaaaacpppp
piaaaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaacaaaaaa
aaababaaabacacaaaaacppppfbaaaaafaaaaapkaaaaaaalpmnmmmmdnaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacplabpaaaaac
aaaaaaiaacaacplabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaecaaaaadaaaacpiaabaaoelaabaioekaacaaaaad
aaaacdiaaaaaoeiaaaaaaakaafaaaaadaaaacdiaaaaaoeiaaaaaffkaagaaaaac
aaaaaeiaacaapplaaeaaaaaeaaaacdiaacaaoelaaaaakkiaaaaaoeiaecaaaaad
aaaacpiaaaaaoeiaacaioekaecaaaaadabaacpiaaaaaoelaaaaioekaaeaaaaae
aaaacpiaabaappiaaaaaoeiaabaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcjmabaaaaeaaaaaaaghaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaad
lcbabaaaadaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaa
adaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaamnmmmmdn
mnmmmmdnaaaaaaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadcaaaaaj
pccabaaaaaaaaaaapgapbaaaabaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaa
doaaaaabejfdeheojiaaaaaaafaaaaaaaiaaaaaaiaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaaimaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaaimaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaaimaaaaaa
abaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaaimaaaaaaacaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapalaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
PARAM c[1] = { { 8, 0.5, 0.099975586 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R1, fragment.texcoord[4], texture[3], 2D;
TEX R0.xy, fragment.texcoord[1], texture[0], 2D;
ADD R0.xy, R0, -c[0].y;
MUL R0.zw, R0.xyxy, c[0].z;
RCP R0.x, fragment.texcoord[2].w;
MAD R0.xy, fragment.texcoord[2], R0.x, R0.zwzw;
MUL R1.xyz, R1.w, R1;
TEX R2, R0, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[2], 2D;
MUL R0.xyz, R0, R1;
MOV R1.w, R0;
MUL R1.xyz, R0, c[0].x;
MAD result.color, R0.w, R2, R1;
END
# 13 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 0
SetTexture 1 [_ReflectionTex] 2D 1
SetTexture 2 [_MainTex] 2D 2
SetTexture 3 [unity_Lightmap] 2D 3
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c0, -0.50000000, 0.09997559, 8.00000000, 0
dcl t0.xy
dcl t1.xy
dcl t2.xyzw
dcl t4.xy
texld r0, t1, s0
add_pp r0.xy, r0, c0.x
rcp_pp r1.x, t2.w
mul_pp r0.xy, r0, c0.y
mad_pp r0.xy, t2, r1.x, r0
texld r2, r0, s1
texld r0, t4, s3
texld r1, t0, s2
mul_pp r0.xyz, r0.w, r0
mul_pp r0.xyz, r1, r0
mul_pp r0.xyz, r0, c0.z
mov_pp r0.w, r1
mad_pp r0, r1.w, r2, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_MainTex] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0
eefieceddigdneaehpcmmgaglillhgnkklncpnmjabaaaaaafmadaaaaadaaaaaa
cmaaaaaaoeaaaaaabiabaaaaejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amaaaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaadaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaa
adaaaaaaaeaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcdmacaaaa
eaaaaaaaipaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaa
fkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaa
acaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaagcbaaaad
dcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaaefaaaaaj
pcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaapgbpbaaa
adaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaamnmmmmdn
mnmmmmdnaaaaaaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadiaaaaah
icaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaahhcaabaaa
abaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
egbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaa
acaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajpccabaaaaaaaaaaa
pgapbaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_Normal] 2D 1
SetTexture 1 [_ReflectionTex] 2D 2
SetTexture 2 [_MainTex] 2D 0
SetTexture 3 [unity_Lightmap] 2D 3
"ps_4_0_level_9_1
eefiecedmihdjkhiifgjgeidalokehpkfknboglhabaaaaaaomaeaaaaaeaaaaaa
daaaaaaalmabaaaaaaaeaaaaliaeaaaaebgpgodjieabaaaaieabaaaaaaacpppp
faabaaaadeaaaaaaaaaadeaaaaaadeaaaaaadeaaaeaaceaaaaaadeaaacaaaaaa
aaababaaabacacaaadadadaaaaacppppfbaaaaafaaaaapkaaaaaaalpmnmmmmdn
aaaaaaebaaaaaaaabpaaaaacaaaaaaiaaaaacplabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaaiaacaacplabpaaaaacaaaaaaiaadaacdlabpaaaaacaaaaaaja
aaaiapkabpaaaaacaaaaaajaabaiapkabpaaaaacaaaaaajaacaiapkabpaaaaac
aaaaaajaadaiapkaecaaaaadaaaacpiaabaaoelaabaioekaacaaaaadaaaacdia
aaaaoeiaaaaaaakaafaaaaadaaaacdiaaaaaoeiaaaaaffkaagaaaaacaaaaaeia
acaapplaaeaaaaaeaaaacdiaacaaoelaaaaakkiaaaaaoeiaecaaaaadaaaacpia
aaaaoeiaacaioekaecaaaaadabaacpiaadaaoelaadaioekaecaaaaadacaacpia
aaaaoelaaaaioekaafaaaaadabaaciiaabaappiaaaaakkkaafaaaaadabaachia
abaaoeiaabaappiaafaaaaadacaachiaabaaoeiaacaaoeiaaeaaaaaeaaaacpia
acaappiaaaaaoeiaacaaoeiaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
dmacaaaaeaaaaaaaipaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaaddcbabaaaacaaaaaagcbaaaadlcbabaaaadaaaaaa
gcbaaaaddcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacadaaaaaa
efaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaaaaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaalp
aaaaaalpaaaaaaaaaaaaaaaaaoaaaaahmcaabaaaaaaaaaaaagbebaaaadaaaaaa
pgbpbaaaadaaaaaadcaaaaamdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaa
mnmmmmdnmnmmmmdnaaaaaaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaabaaaaaaegbabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
diaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaebdiaaaaah
hcaabaaaabaaaaaaegacbaaaabaaaaaapgapbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegbabaaaabaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadiaaaaah
hcaabaaaacaaaaaaegacbaaaabaaaaaaegacbaaaacaaaaaadcaaaaajpccabaaa
aaaaaaaapgapbaaaacaaaaaaegaobaaaaaaaaaaaegaobaaaacaaaaaadoaaaaab
ejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadadaaaa
keaaaaaaadaaaaaaaaaaaaaaadaaaaaaabaaaaaaamaaaaaakeaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapadaaaakeaaaaaaacaaaaaaaaaaaaaaadaaaaaa
adaaaaaaapalaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaaadadaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
Fallback "AngryBots/Fallback"
}