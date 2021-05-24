//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Loot/Ford_Loot_PlasticOcclusion" {
Properties {
 _ColorAtlas ("Color swatch", 2D) = "white" {}
 _Matcap ("Matcap", 2D) = "white" {}
 _Occlusion ("Occlusion (RGB)", 2D) = "white" {}
 _FresnelIntensity ("Fresnel Intensity", Float) = 1
 _FresnelCol ("Fresnel Color", Vector) = (1,0.8,0.4,1)
 _TransparentColor ("Transparent Color", Color) = (0,1,0,0.2)
}
SubShader { 
 Tags { "QUEUE"="Geometry+1" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 UsePass "Ford/Base_Passes/GHOST"
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "QUEUE"="Geometry+1" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ColorMask RGB
Program "vp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[18] = { { 0.5, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[17];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[4].xyz, c[0].y;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 3 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
"vs_2_0
def c17, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c13
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT4.xyz, c17.y
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c17.x, c17.x
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedcokejkoipojkgbclpoejjcpbangdopkoabaaaaaalmahaaaaaeaaaaaa
daaaaaaajaacaaaadmagaaaaaeahaaaaebgpgodjfiacaaaafiacaaaaaaacpopp
aaacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaaaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaaiaaadaaagaaaaaaaaaa
abaabaaaaeaaajaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaahaaoekaaeaaaaaeaaaaadia
agaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaiaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiaanaaaakaanaaaakaabaaaaacaaaaapiaabaaoeka
afaaaaadabaaahiaaaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
abaaaaacadaaahoaanaaffkappppaaaafdeieefckeadaaaaeaaaabaaojaaaaaa
fjaaaaaeegiocaaaaaaaaaaaabaaaaaafjaaaaaeegiocaaaabaaaaaabeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiacaaaabaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
abaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaabaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaihccabaaa
aeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
Vector 18 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[18];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[4].xyz, c[0].y;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 26 instructions, 3 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
"vs_2_0
def c19, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c13
dp4 r3.y, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oT5.zw, r0
mov oT4.xyz, c19.y
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c19.x, c19.x
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedkikdikcdegfmkhblcpmdoadmbhodidipabaaaaaaneaiaaaaaeaaaaaa
daaaaaaaoiacaaaadmahaaaaaeaiaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
emacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaaiaaadaaahaaaaaaaaaaacaabaaaaeaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
aiaaoekaaeaaaaaeaaaaadiaahaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
ajaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiaaoaaaakaaoaaaaka
abaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaae
abaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapia
adaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
abaaaakaafaaaaadabaaaiiaabaaaaiaaoaaaakaafaaaaadabaaafiaaaaapeia
aoaaaakaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejaabaaaaacadaaahoa
aoaaffkappppaaaafdeieefcemaeaaaaeaaaabaabdabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
abaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaaihccabaaaaeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [_World2Object]
Vector 17 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[18] = { { 0.5, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[17];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[4].xyz, c[0].y;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 21 instructions, 3 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_World2Object]
Vector 16 [_WorldSpaceLightPos0]
"vs_2_0
def c17, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c16, r0
mov r0, c13
dp4 r3.y, c16, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c16, r1
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mov oT4.xyz, c17.y
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c17.x, c17.x
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityLighting" 0
BindCB  "UnityPerDraw" 1
"vs_4_0_level_9_1
eefiecedcokejkoipojkgbclpoejjcpbangdopkoabaaaaaalmahaaaaaeaaaaaa
daaaaaaajaacaaaadmagaaaaaeahaaaaebgpgodjfiacaaaafiacaaaaaaacpopp
aaacaaaafiaaaaaaaeaaceaaaaaafeaaaaaafeaaaaaaceaaabaafeaaaaaaaaaa
abaaabaaaaaaaaaaabaaaaaaaeaaacaaaaaaaaaaabaaaiaaadaaagaaaaaaaaaa
abaabaaaaeaaajaaaaaaaaaaaaaaaaaaaaacpoppfbaaaaafanaaapkaaaaaaadp
aaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaiaaaaaapjabpaaaaacafaaabia
abaaapjabpaaaaacafaaaciaacaaapjabpaaaaacafaaadiaadaaapjabpaaaaac
afaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffjaahaaoekaaeaaaaaeaaaaadia
agaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadiaaiaaoekaacaakkjaaaaaoeia
aeaaaaaeabaaadoaaaaaoeiaanaaaakaanaaaakaabaaaaacaaaaapiaabaaoeka
afaaaaadabaaahiaaaaaffiaakaaoekaaeaaaaaeabaaahiaajaaoekaaaaaaaia
abaaoeiaaeaaaaaeaaaaahiaalaaoekaaaaakkiaabaaoeiaaeaaaaaeaaaaahia
amaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboaabaaoejaaaaaoeiaabaaaaac
abaaahiaacaaoejaafaaaaadacaaahiaabaanciaabaamjjaaeaaaaaeabaaahia
abaamjiaabaancjaacaaoeibafaaaaadabaaahiaabaaoeiaabaappjaaiaaaaad
acaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoaacaaoejaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaadaaoekaaeaaaaaeaaaaapiaacaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaaeaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaafaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiaabaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabeja
abaaaaacadaaahoaanaaffkappppaaaafdeieefckeadaaaaeaaaabaaojaaaaaa
fjaaaaaeegiocaaaaaaaaaaaabaaaaaafjaaaaaeegiocaaaabaaaaaabeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaafpaaaaadhcbabaaa
acaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaaaeaaaaaaghaaaaae
pccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaa
abaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaaadaaaaaagfaaaaad
hccabaaaaeaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpccabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaaadaaaaaadgaaaaaf
mccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaaaaaaaaaafgbfbaaa
acaaaaaaegiacaaaabaaaaaaajaaaaaadcaaaaakdcaabaaaaaaaaaaaegiacaaa
abaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaaaaaaaaadcaaaaakdcaabaaa
aaaaaaaaegiacaaaabaaaaaaakaaaaaakgbkbaaaacaaaaaaegaabaaaaaaaaaaa
dcaaaaapdccabaaaacaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaadiaaaaah
hcaabaaaaaaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaadcaaaaakhcaabaaa
aaaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaiaebaaaaaaaaaaaaaa
diaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaapgbpbaaaabaaaaaadiaaaaaj
hcaabaaaabaaaaaafgifcaaaaaaaaaaaaaaaaaaaegiccaaaabaaaaaabbaaaaaa
dcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaabaaaaaaaagiacaaaaaaaaaaa
aaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaaabaaaaaaegiccaaaabaaaaaa
bcaaaaaakgikcaaaaaaaaaaaaaaaaaaaegacbaaaabaaaaaadcaaaaalhcaabaaa
abaaaaaaegiccaaaabaaaaaabdaaaaaapgipcaaaaaaaaaaaaaaaaaaaegacbaaa
abaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaaaaaaaaaegacbaaaabaaaaaa
baaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaaabaaaaaabaaaaaah
eccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaabaaaaaadgaaaaaihccabaaa
aeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Bind "tangent" ATTR14
Matrix 13 [_World2Object]
Vector 17 [_ProjectionParams]
Vector 18 [_WorldSpaceLightPos0]
"!!ARBvp1.0
PARAM c[19] = { { 0.5, 0 },
		state.matrix.mvp,
		state.matrix.modelview[0].invtrans,
		program.local[9..18] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[18];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R2.z, R1, c[15];
DP4 R2.y, R1, c[14];
DP4 R2.x, R1, c[13];
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].x;
MOV result.position, R0;
MUL R1.y, R1, c[17].x;
DP3 R0.x, vertex.normal, c[5];
DP3 R0.y, vertex.normal, c[6];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.texcoord[5].zw, R0;
MOV result.texcoord[4].xyz, c[0].y;
MOV result.texcoord[0].xy, vertex.texcoord[0];
MOV result.texcoord[1].xy, vertex.texcoord[1];
MAD result.texcoord[2].xy, R0, c[0].x, c[0].x;
END
# 26 instructions, 3 R-regs
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
Matrix 4 [glstate_matrix_invtrans_modelview0]
Matrix 12 [_World2Object]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [_WorldSpaceLightPos0]
"vs_2_0
def c19, 0.50000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mov r0, c14
dp4 r3.z, c18, r0
mov r0, c13
dp4 r3.y, c18, r0
mul r2.xyz, r1, v1.w
mov r1, c12
dp4 r3.x, c18, r1
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c19.x
mov oPos, r0
mul r1.y, r1, c16.x
dp3 r0.x, v2, c4
dp3 r0.y, v2, c5
dp3 oT3.y, r3, r2
dp3 oT3.z, v2, r3
dp3 oT3.x, r3, v1
mad oT5.xy, r1.z, c17.zwzw, r1
mov oT5.zw, r0
mov oT4.xyz, c19.y
mov oT0.xy, v3
mov oT1.xy, v4
mad oT2.xy, r0, c19.x, c19.x
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
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
Matrix 128 [glstate_matrix_invtrans_modelview0]
Matrix 256 [_World2Object]
BindCB  "UnityPerCamera" 0
BindCB  "UnityLighting" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedkikdikcdegfmkhblcpmdoadmbhodidipabaaaaaaneaiaaaaaeaaaaaa
daaaaaaaoiacaaaadmahaaaaaeaiaaaaebgpgodjlaacaaaalaacaaaaaaacpopp
emacaaaageaaaaaaafaaceaaaaaagaaaaaaagaaaaaaaceaaabaagaaaaaaaafaa
abaaabaaaaaaaaaaabaaaaaaabaaacaaaaaaaaaaacaaaaaaaeaaadaaaaaaaaaa
acaaaiaaadaaahaaaaaaaaaaacaabaaaaeaaakaaaaaaaaaaaaaaaaaaaaacpopp
fbaaaaafaoaaapkaaaaaaadpaaaaaaaaaaaaaaaaaaaaaaaabpaaaaacafaaaaia
aaaaapjabpaaaaacafaaabiaabaaapjabpaaaaacafaaaciaacaaapjabpaaaaac
afaaadiaadaaapjabpaaaaacafaaaeiaaeaaapjaafaaaaadaaaaadiaacaaffja
aiaaoekaaeaaaaaeaaaaadiaahaaoekaacaaaajaaaaaoeiaaeaaaaaeaaaaadia
ajaaoekaacaakkjaaaaaoeiaaeaaaaaeabaaadoaaaaaoeiaaoaaaakaaoaaaaka
abaaaaacaaaaapiaacaaoekaafaaaaadabaaahiaaaaaffiaalaaoekaaeaaaaae
abaaahiaakaaoekaaaaaaaiaabaaoeiaaeaaaaaeaaaaahiaamaaoekaaaaakkia
abaaoeiaaeaaaaaeaaaaahiaanaaoekaaaaappiaaaaaoeiaaiaaaaadacaaaboa
abaaoejaaaaaoeiaabaaaaacabaaahiaacaaoejaafaaaaadacaaahiaabaancia
abaamjjaaeaaaaaeabaaahiaabaamjiaabaancjaacaaoeibafaaaaadabaaahia
abaaoeiaabaappjaaiaaaaadacaaacoaabaaoeiaaaaaoeiaaiaaaaadacaaaeoa
acaaoejaaaaaoeiaafaaaaadaaaaapiaaaaaffjaaeaaoekaaeaaaaaeaaaaapia
adaaoekaaaaaaajaaaaaoeiaaeaaaaaeaaaaapiaafaaoekaaaaakkjaaaaaoeia
aeaaaaaeaaaaapiaagaaoekaaaaappjaaaaaoeiaafaaaaadabaaabiaaaaaffia
abaaaakaafaaaaadabaaaiiaabaaaaiaaoaaaakaafaaaaadabaaafiaaaaapeia
aoaaaakaacaaaaadaeaaadoaabaakkiaabaaomiaaeaaaaaeaaaaadmaaaaappia
aaaaoekaaaaaoeiaabaaaaacaaaaammaaaaaoeiaabaaaaacaeaaamoaaaaaoeia
abaaaaacaaaaadoaadaaoejaabaaaaacaaaaamoaaeaabejaabaaaaacadaaahoa
aoaaffkappppaaaafdeieefcemaeaaaaeaaaabaabdabaaaafjaaaaaeegiocaaa
aaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaa
acaaaaaabeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaadpcbabaaaabaaaaaa
fpaaaaadhcbabaaaacaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaaddcbabaaa
aeaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaa
gfaaaaadmccabaaaabaaaaaagfaaaaaddccabaaaacaaaaaagfaaaaadhccabaaa
adaaaaaagfaaaaadhccabaaaaeaaaaaagfaaaaadpccabaaaafaaaaaagiaaaaac
adaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaa
egiocaaaacaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaaf
pccabaaaaaaaaaaaegaobaaaaaaaaaaadgaaaaafdccabaaaabaaaaaaegbabaaa
adaaaaaadgaaaaafmccabaaaabaaaaaaagbebaaaaeaaaaaadiaaaaaidcaabaaa
abaaaaaafgbfbaaaacaaaaaaegiacaaaacaaaaaaajaaaaaadcaaaaakdcaabaaa
abaaaaaaegiacaaaacaaaaaaaiaaaaaaagbabaaaacaaaaaaegaabaaaabaaaaaa
dcaaaaakdcaabaaaabaaaaaaegiacaaaacaaaaaaakaaaaaakgbkbaaaacaaaaaa
egaabaaaabaaaaaadcaaaaapdccabaaaacaaaaaaegaabaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaa
aaaaaaaadiaaaaahhcaabaaaabaaaaaajgbebaaaabaaaaaacgbjbaaaacaaaaaa
dcaaaaakhcaabaaaabaaaaaajgbebaaaacaaaaaacgbjbaaaabaaaaaaegacbaia
ebaaaaaaabaaaaaadiaaaaahhcaabaaaabaaaaaaegacbaaaabaaaaaapgbpbaaa
abaaaaaadiaaaaajhcaabaaaacaaaaaafgifcaaaabaaaaaaaaaaaaaaegiccaaa
acaaaaaabbaaaaaadcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabaaaaaaa
agiacaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaadcaaaaalhcaabaaaacaaaaaa
egiccaaaacaaaaaabcaaaaaakgikcaaaabaaaaaaaaaaaaaaegacbaaaacaaaaaa
dcaaaaalhcaabaaaacaaaaaaegiccaaaacaaaaaabdaaaaaapgipcaaaabaaaaaa
aaaaaaaaegacbaaaacaaaaaabaaaaaahcccabaaaadaaaaaaegacbaaaabaaaaaa
egacbaaaacaaaaaabaaaaaahbccabaaaadaaaaaaegbcbaaaabaaaaaaegacbaaa
acaaaaaabaaaaaaheccabaaaadaaaaaaegbcbaaaacaaaaaaegacbaaaacaaaaaa
dgaaaaaihccabaaaaeaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
diaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaafaaaaaa
diaaaaakncaabaaaabaaaaaaagahbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaaaa
aaaaaadpaaaaaadpdgaaaaafmccabaaaafaaaaaakgaobaaaaaaaaaaaaaaaaaah
dccabaaaafaaaaaakgakbaaaabaaaaaamgaabaaaabaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahahaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apadaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adamaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadamaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaiaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahaiaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[1], 2D;
MUL R2.xyz, R1, R2;
MUL R2.xyz, R0.w, R2;
MUL R2.xyz, R2, c[0].x;
MAD R0.xyz, R0, R1, R2;
MAD result.color.xyz, R0, fragment.texcoord[4], R0;
MOV result.color.w, c[0].y;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 2.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t4.xyz
texld r0, t1, s2
texld r1, t0, s0
texld r2, t2, s1
mul r2.xyz, r0, r2
mul r2.xyz, r1.w, r2
mul_pp r2.xyz, r2, c0.x
mad_pp r0.xyz, r1, r0, r2
mov_pp r0.w, c0.y
mad_pp r0.xyz, r0, t4, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"ps_4_0_level_9_1
eefiecednfnhdhalggjmlbkipkgmgopaebdfdegoabaaaaaadaaeaaaaaeaaaaaa
daaaaaaahmabaaaaeeadaaaapmadaaaaebgpgodjeeabaaaaeeabaaaaaaacpppp
beabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaaaaaaaaa
abababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadabaaapia
abaaoelaabaioekaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadacaacpia
aaaaoelaaaaioekaafaaaaadabaaahiaaaaaoeiaabaaoeiaafaaaaadabaachia
acaappiaabaaoeiaacaaaaadabaachiaabaaoeiaabaaoeiaaeaaaaaeaaaachia
acaaoeiaaaaaoeiaabaaoeiaaeaaaaaeaaaachiaaaaaoeiaadaaoelaaaaaoeia
abaaaaacaaaaciiaaaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
maabaaaaeaaaaaaahaaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaaddcbabaaa
acaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
aeaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabejfdeheolaaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaakeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaakeaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaakeaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaakeaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaaaaaakeaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"!!ARBfp1.0
PARAM c[1] = { { 2, 1 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, fragment.texcoord[1], texture[2], 2D;
TEX R2.xyz, fragment.texcoord[2], texture[1], 2D;
MUL R2.xyz, R1, R2;
MUL R2.xyz, R0.w, R2;
MUL R2.xyz, R2, c[0].x;
MAD R0.xyz, R0, R1, R2;
MAD result.color.xyz, R0, fragment.texcoord[4], R0;
MOV result.color.w, c[0].y;
END
# 9 instructions, 3 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c0, 2.00000000, 1.00000000, 0, 0
dcl t0.xy
dcl t1.xy
dcl t2.xy
dcl t4.xyz
texld r0, t1, s2
texld r1, t0, s0
texld r2, t2, s1
mul r2.xyz, r0, r2
mul r2.xyz, r1.w, r2
mul_pp r2.xyz, r2, c0.x
mad_pp r0.xyz, r1, r0, r2
mov_pp r0.w, c0.y
mad_pp r0.xyz, r0, t4, r0
mov_pp oC0, r0
"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" }
SetTexture 0 [_ColorAtlas] 2D 0
SetTexture 1 [_Matcap] 2D 1
SetTexture 2 [_Occlusion] 2D 2
"ps_4_0_level_9_1
eefiecediijiimhkglpgdjaiioagimlpnekajfohabaaaaaaeiaeaaaaaeaaaaaa
daaaaaaahmabaaaaeeadaaaabeaeaaaaebgpgodjeeabaaaaeeabaaaaaaacpppp
beabaaaadaaaaaaaaaaadaaaaaaadaaaaaaadaaaadaaceaaaaaadaaaaaaaaaaa
abababaaacacacaaaaacppppfbaaaaafaaaaapkaaaaaiadpaaaaaaaaaaaaaaaa
aaaaaaaabpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaaadlabpaaaaac
aaaaaaiaadaachlabpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapka
bpaaaaacaaaaaajaacaiapkaabaaaaacaaaaadiaaaaabllaecaaaaadabaaapia
abaaoelaabaioekaecaaaaadaaaacpiaaaaaoeiaacaioekaecaaaaadacaacpia
aaaaoelaaaaioekaafaaaaadabaaahiaaaaaoeiaabaaoeiaafaaaaadabaachia
acaappiaabaaoeiaacaaaaadabaachiaabaaoeiaabaaoeiaaeaaaaaeaaaachia
acaaoeiaaaaaoeiaabaaoeiaaeaaaaaeaaaachiaaaaaoeiaadaaoelaaaaaoeia
abaaaaacaaaaciiaaaaaaakaabaaaaacaaaicpiaaaaaoeiappppaaaafdeieefc
maabaaaaeaaaaaaahaaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaaddcbabaaa
acaaaaaagcbaaaadhcbabaaaaeaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
adaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaacaaaaaaeghobaaaabaaaaaa
aagabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
egacbaaaabaaaaaaefaaaaajpcaabaaaacaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadiaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
pgapbaaaacaaaaaaaaaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
aaaaaaaadcaaaaajhcaabaaaaaaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaa
egacbaaaaaaaaaaadcaaaaajhccabaaaaaaaaaaaegacbaaaaaaaaaaaegbcbaaa
aeaaaaaaegacbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabejfdeheomiaaaaaaahaaaaaaaiaaaaaalaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaalmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
adadaaaalmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaamamaaaalmaaaaaa
acaaaaaaaaaaaaaaadaaaaaaacaaaaaaadadaaaalmaaaaaaadaaaaaaaaaaaaaa
adaaaaaaadaaaaaaahaaaaaalmaaaaaaaeaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
ahahaaaalmaaaaaaafaaaaaaaaaaaaaaadaaaaaaafaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheocmaaaaaaabaaaaaa
aiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfe
gbhcghgfheaaklkl"
}
}
 }
 UsePass "Ford/Base_Passes/LOOT_GLOW"
}
Fallback "Diffuse"
}