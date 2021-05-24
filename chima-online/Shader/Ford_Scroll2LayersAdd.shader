//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Scroll 2 Layers Add" {
Properties {
 _MainTex ("Base layer (RGB)", 2D) = "white" {}
 _DetailTex ("2nd layer (RGB)", 2D) = "white" {}
 _ScrollX ("Base layer Scroll speed X", Float) = 1
 _ScrollY ("Base layer Scroll speed Y", Float) = 0
 _Scroll2X ("2nd layer Scroll speed X", Float) = 1
 _Scroll2Y ("2nd layer Scroll speed Y", Float) = 0
 _Color ("Color", Color) = (1,1,1,1)
 _MMultiplier ("Layer Multiplier", Float) = 2
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
Program "vp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Vector 6 [_MainTex_ST]
Vector 7 [_DetailTex_ST]
Float 8 [_ScrollX]
Float 9 [_ScrollY]
Float 10 [_Scroll2X]
Float 11 [_Scroll2Y]
Float 12 [_MMultiplier]
Vector 13 [_Color]
"!!ARBvp1.0
PARAM c[14] = { program.local[0],
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
MOV R1, c[13];
MUL R1, R1, c[12].x;
MUL R1, R1, vertex.color;
MAD R0.zw, vertex.texcoord[0].xyxy, c[7].xyxy, c[7];
MOV R0.y, c[11].x;
MOV R0.x, c[10];
MUL R0.xy, R0, c[5];
FRC R0.xy, R0;
ADD result.texcoord[0].zw, R0, R0.xyxy;
MOV R0.y, c[9].x;
MOV R0.x, c[8];
MUL R0.xy, R0, c[5];
FRC R0.xy, R0;
MAD R0.zw, vertex.texcoord[0].xyxy, c[6].xyxy, c[6];
ADD result.texcoord[0].xy, R0.zwzw, R0;
MUL result.texcoord[1], R1, vertex.color.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Vector 5 [_MainTex_ST]
Vector 6 [_DetailTex_ST]
Float 7 [_ScrollX]
Float 8 [_ScrollY]
Float 9 [_Scroll2X]
Float 10 [_Scroll2Y]
Float 11 [_MMultiplier]
Vector 12 [_Color]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
mov r1.x, c11
mul r1, c12, r1.x
mul r1, r1, v2
mov r0.y, c10.x
mov r0.x, c9
mul r0.zw, r0.xyxy, c4.xyxy
mad r0.xy, v1, c6, c6.zwzw
frc r0.zw, r0
add oT0.zw, r0.xyxy, r0
mov r0.y, c8.x
mov r0.x, c7
mul r0.xy, r0, c4
frc r0.xy, r0
mad r0.zw, v1.xyxy, c5.xyxy, c5
add oT0.xy, r0.zwzw, r0
mul oT1, r1, v2.w
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
Float 56 [_Scroll2X]
Float 60 [_Scroll2Y]
Float 64 [_MMultiplier]
Vector 80 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmiebfihmfdlgaokgfpocanlneifkihmmabaaaaaapeadaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefciiacaaaaeaaaabaakcaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaj
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaegiecaaaabaaaaaaaaaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaa
egaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaaaaaaaah
mccabaaaabaaaaaakgaobaaaabaaaaaaagaebaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaadkbabaaaafaaaaaadiaaaaajpcaabaaaabaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegiocaaaaaaaaaaaafaaaaaadgaaaaafhcaabaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaafaaaaaa
dgaaaaafbcaabaaaabaaaaaadkbabaaaafaaaaaadiaaaaahpccabaaaacaaaaaa
agambaaaabaaaaaaegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
Float 56 [_Scroll2X]
Float 60 [_Scroll2Y]
Float 64 [_MMultiplier]
Vector 80 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedeapincegibeepeeponpfblcmhojkddokabaaaaaaleafaaaaaeaaaaaa
daaaaaaaomabaaaahmaeaaaaeeafaaaaebgpgodjleabaaaaleabaaaaaaacpopp
giabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaabaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadiaadaaoejaabaaoekaabaaooka
abaaaaacabaaapiaadaaoekaafaaaaadabaaapiaabaaoeiaagaaeekabdaaaaac
abaaapiaabaaoeiaacaaaaadaaaaadoaaaaaoeiaabaaoeiaaeaaaaaeaaaaadia
adaaoejaacaaoekaacaaookaacaaaaadaaaaamoaabaaoeiaaaaaeeiaabaaaaac
aaaaaiiaafaappjaabaaaaacabaaabiaaeaaaakaafaaaaadabaaapiaabaaaaia
afaaoekaabaaaaacaaaaahiaabaaoeiaafaaaaadaaaaapiaaaaaoeiaafaaoeja
abaaaaacabaaabiaafaappjaafaaaaadabaaapoaabaamaiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefciiacaaaaeaaaabaakcaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaa
abaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaegiecaaa
abaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaah
dccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaa
acaaaaaaaaaaaaahmccabaaaabaaaaaakgaobaaaabaaaaaaagaebaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaadkbabaaaafaaaaaadiaaaaajpcaabaaaabaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegiocaaaaaaaaaaaafaaaaaadgaaaaafhcaabaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaafaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaafaaaaaadiaaaaah
pccabaaaacaaaaaaagambaaaabaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Vector 5 [_Time]
Vector 6 [_MainTex_ST]
Vector 7 [_DetailTex_ST]
Float 8 [_ScrollX]
Float 9 [_ScrollY]
Float 10 [_Scroll2X]
Float 11 [_Scroll2Y]
Float 12 [_MMultiplier]
Vector 13 [_Color]
"!!ARBvp1.0
PARAM c[14] = { program.local[0],
		state.matrix.mvp,
		program.local[5..13] };
TEMP R0;
TEMP R1;
MOV R1, c[13];
MUL R1, R1, c[12].x;
MUL R1, R1, vertex.color;
MAD R0.zw, vertex.texcoord[0].xyxy, c[7].xyxy, c[7];
MOV R0.y, c[11].x;
MOV R0.x, c[10];
MUL R0.xy, R0, c[5];
FRC R0.xy, R0;
ADD result.texcoord[0].zw, R0, R0.xyxy;
MOV R0.y, c[9].x;
MOV R0.x, c[8];
MUL R0.xy, R0, c[5];
FRC R0.xy, R0;
MAD R0.zw, vertex.texcoord[0].xyxy, c[6].xyxy, c[6];
ADD result.texcoord[0].xy, R0.zwzw, R0;
MUL result.texcoord[1], R1, vertex.color.w;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 20 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 4 [_Time]
Vector 5 [_MainTex_ST]
Vector 6 [_DetailTex_ST]
Float 7 [_ScrollX]
Float 8 [_ScrollY]
Float 9 [_Scroll2X]
Float 10 [_Scroll2Y]
Float 11 [_MMultiplier]
Vector 12 [_Color]
"vs_2_0
dcl_position0 v0
dcl_texcoord0 v1
dcl_color0 v2
mov r1.x, c11
mul r1, c12, r1.x
mul r1, r1, v2
mov r0.y, c10.x
mov r0.x, c9
mul r0.zw, r0.xyxy, c4.xyxy
mad r0.xy, v1, c6, c6.zwzw
frc r0.zw, r0
add oT0.zw, r0.xyxy, r0
mov r0.y, c8.x
mov r0.x, c7
mul r0.xy, r0, c4
frc r0.xy, r0
mad r0.zw, v1.xyxy, c5.xyxy, c5
add oT0.xy, r0.zwzw, r0
mul oT1, r1, v2.w
dp4 oPos.w, v0, c3
dp4 oPos.z, v0, c2
dp4 oPos.y, v0, c1
dp4 oPos.x, v0, c0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
Float 56 [_Scroll2X]
Float 60 [_Scroll2Y]
Float 64 [_MMultiplier]
Vector 80 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0
eefiecedmiebfihmfdlgaokgfpocanlneifkihmmabaaaaaapeadaaaaadaaaaaa
cmaaaaaapeaaaaaageabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheogiaaaaaaadaaaaaa
aiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaacaaaaaaapaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklfdeieefciiacaaaaeaaaabaakcaaaaaafjaaaaaeegiocaaaaaaaaaaa
agaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaaeegiocaaaacaaaaaa
aeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaadaaaaaafpaaaaad
pcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaadpccabaaa
abaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaadiaaaaaipcaabaaa
aaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaakgbkbaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaaacaaaaaaadaaaaaa
pgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaaabaaaaaadiaaaaaj
pcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaegiecaaaabaaaaaaaaaaaaaa
bkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaahdccabaaaabaaaaaa
egaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaaaaaaaaaaegbabaaa
adaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaaacaaaaaaaaaaaaah
mccabaaaabaaaaaakgaobaaaabaaaaaaagaebaaaaaaaaaaadgaaaaaficaabaaa
aaaaaaaadkbabaaaafaaaaaadiaaaaajpcaabaaaabaaaaaaagiacaaaaaaaaaaa
aeaaaaaaegiocaaaaaaaaaaaafaaaaaadgaaaaafhcaabaaaaaaaaaaaegacbaaa
abaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaaafaaaaaa
dgaaaaafbcaabaaaabaaaaaadkbabaaaafaaaaaadiaaaaahpccabaaaacaaaaaa
agambaaaabaaaaaaegaobaaaaaaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 16 [_MainTex_ST]
Vector 32 [_DetailTex_ST]
Float 48 [_ScrollX]
Float 52 [_ScrollY]
Float 56 [_Scroll2X]
Float 60 [_Scroll2Y]
Float 64 [_MMultiplier]
Vector 80 [_Color]
ConstBuffer "UnityPerCamera" 128
Vector 0 [_Time]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerCamera" 1
BindCB  "UnityPerDraw" 2
"vs_4_0_level_9_1
eefiecedeapincegibeepeeponpfblcmhojkddokabaaaaaaleafaaaaaeaaaaaa
daaaaaaaomabaaaahmaeaaaaeeafaaaaebgpgodjleabaaaaleabaaaaaaacpopp
giabaaaaemaaaaaaadaaceaaaaaaeiaaaaaaeiaaaaaaceaaabaaeiaaaaaaabaa
afaaabaaaaaaaaaaabaaaaaaabaaagaaaaaaaaaaacaaaaaaaeaaahaaaaaaaaaa
aaaaaaaaaaacpoppbpaaaaacafaaaaiaaaaaapjabpaaaaacafaaadiaadaaapja
bpaaaaacafaaafiaafaaapjaaeaaaaaeaaaaadiaadaaoejaabaaoekaabaaooka
abaaaaacabaaapiaadaaoekaafaaaaadabaaapiaabaaoeiaagaaeekabdaaaaac
abaaapiaabaaoeiaacaaaaadaaaaadoaaaaaoeiaabaaoeiaaeaaaaaeaaaaadia
adaaoejaacaaoekaacaaookaacaaaaadaaaaamoaabaaoeiaaaaaeeiaabaaaaac
aaaaaiiaafaappjaabaaaaacabaaabiaaeaaaakaafaaaaadabaaapiaabaaaaia
afaaoekaabaaaaacaaaaahiaabaaoeiaafaaaaadaaaaapiaaaaaoeiaafaaoeja
abaaaaacabaaabiaafaappjaafaaaaadabaaapoaabaamaiaaaaaoeiaafaaaaad
aaaaapiaaaaaffjaaiaaoekaaeaaaaaeaaaaapiaahaaoekaaaaaaajaaaaaoeia
aeaaaaaeaaaaapiaajaaoekaaaaakkjaaaaaoeiaaeaaaaaeaaaaapiaakaaoeka
aaaappjaaaaaoeiaaeaaaaaeaaaaadmaaaaappiaaaaaoekaaaaaoeiaabaaaaac
aaaaammaaaaaoeiappppaaaafdeieefciiacaaaaeaaaabaakcaaaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaaabaaaaaaabaaaaaafjaaaaae
egiocaaaacaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaa
adaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaaabaaaaaa
gfaaaaadpccabaaaabaaaaaagfaaaaadpccabaaaacaaaaaagiaaaaacacaaaaaa
diaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaacaaaaaaabaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaaaaaaaaaagbabaaaaaaaaaaa
egaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaacaaaaaaacaaaaaa
kgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaaegiocaaa
acaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaabaaaaaaogikcaaaaaaaaaaa
abaaaaaadiaaaaajpcaabaaaabaaaaaaegiocaaaaaaaaaaaadaaaaaaegiecaaa
abaaaaaaaaaaaaaabkaaaaafpcaabaaaabaaaaaaegaobaaaabaaaaaaaaaaaaah
dccabaaaabaaaaaaegaabaaaaaaaaaaaegaabaaaabaaaaaadcaaaaaldcaabaaa
aaaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaacaaaaaaogikcaaaaaaaaaaa
acaaaaaaaaaaaaahmccabaaaabaaaaaakgaobaaaabaaaaaaagaebaaaaaaaaaaa
dgaaaaaficaabaaaaaaaaaaadkbabaaaafaaaaaadiaaaaajpcaabaaaabaaaaaa
agiacaaaaaaaaaaaaeaaaaaaegiocaaaaaaaaaaaafaaaaaadgaaaaafhcaabaaa
aaaaaaaaegacbaaaabaaaaaadiaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egbobaaaafaaaaaadgaaaaafbcaabaaaabaaaaaadkbabaaaafaaaaaadiaaaaah
pccabaaaacaaaaaaagambaaaabaaaaaaegaobaaaaaaaaaaadoaaaaabejfdeheo
maaaaaaaagaaaaaaaiaaaaaajiaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apapaaaakbaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapaaaaaakjaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaacaaaaaaahaaaaaalaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaadaaaaaaapadaaaalaaaaaaaabaaaaaaaaaaaaaaadaaaaaaaeaaaaaa
apaaaaaaljaaaaaaaaaaaaaaaaaaaaaaadaaaaaaafaaaaaaapapaaaafaepfdej
feejepeoaafeebeoehefeofeaaeoepfcenebemaafeeffiedepepfceeaaedepem
epfcaaklepfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaa
adaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
apaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaklklkl"
}
}
Program "fp" {
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
TEMP R0;
TEMP R1;
TEX R1, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R0, R0, R1;
MUL result.color, R0, fragment.texcoord[1];
END
# 4 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s1
add_pp r0, r1, r0
mul_pp r0, r0, t1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_4_0
eefiecedabanhpgokmigofgighhgopglopkhplbhabaaaaaamiabaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpaaaaaaaeaaaaaaadmaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_4_0_level_9_1
eefiecedmdhmhaebnjncgcigdclligoigibpfonfabaaaaaajmacaaaaaeaaaaaa
daaaaaaaaaabaaaapiabaaaagiacaaaaebgpgodjmiaaaaaamiaaaaaaaaacpppp
jmaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaabia
aaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaacaaaaadaaaacpiaaaaaoeiaabaaoeia
afaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcpaaaaaaaeaaaaaaadmaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaahpccabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadoaaaaabejfdeheogiaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"!!ARBfp1.0
TEMP R0;
TEMP R1;
TEX R1, fragment.texcoord[0].zwzw, texture[1], 2D;
TEX R0, fragment.texcoord[0], texture[0], 2D;
ADD R0, R0, R1;
MUL result.color, R0, fragment.texcoord[1];
END
# 4 instructions, 2 R-regs
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_2_0
dcl_2d s0
dcl_2d s1
dcl t0
dcl t1
texld r1, t0, s0
mov r0.y, t0.w
mov r0.x, t0.z
texld r0, r0, s1
add_pp r0, r1, r0
mul_pp r0, r0, t1
mov_pp oC0, r0
"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_4_0
eefiecedabanhpgokmigofgighhgopglopkhplbhabaaaaaamiabaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apapaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcpaaaaaaaeaaaaaaadmaaaaaa
fkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaaabaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaagcbaaaadpcbabaaa
abaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
acaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaaogbkbaaaabaaaaaaeghobaaa
abaaaaaaaagabaaaabaaaaaaaaaaaaahpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egaobaaaabaaaaaadiaaaaahpccabaaaaaaaaaaaegaobaaaaaaaaaaaegbobaaa
acaaaaaadoaaaaab"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_ON" }
SetTexture 0 [_MainTex] 2D 0
SetTexture 1 [_DetailTex] 2D 1
"ps_4_0_level_9_1
eefiecedmdhmhaebnjncgcigdclligoigibpfonfabaaaaaajmacaaaaaeaaaaaa
daaaaaaaaaabaaaapiabaaaagiacaaaaebgpgodjmiaaaaaamiaaaaaaaaacpppp
jmaaaaaacmaaaaaaaaaacmaaaaaacmaaaaaacmaaacaaceaaaaaacmaaaaaaaaaa
abababaaaaacppppbpaaaaacaaaaaaiaaaaaaplabpaaaaacaaaaaaiaabaacpla
bpaaaaacaaaaaajaaaaiapkabpaaaaacaaaaaajaabaiapkaabaaaaacaaaaabia
aaaakklaabaaaaacaaaaaciaaaaapplaecaaaaadaaaacpiaaaaaoeiaabaioeka
ecaaaaadabaacpiaaaaaoelaaaaioekaacaaaaadaaaacpiaaaaaoeiaabaaoeia
afaaaaadaaaacpiaaaaaoeiaabaaoelaabaaaaacaaaicpiaaaaaoeiappppaaaa
fdeieefcpaaaaaaaeaaaaaaadmaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaagcbaaaadpcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaaefaaaaajpcaabaaaaaaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaogbkbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaaaaaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaahpccabaaa
aaaaaaaaegaobaaaaaaaaaaaegbobaaaacaaaaaadoaaaaabejfdeheogiaaaaaa
adaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaapapaaaafmaaaaaaabaaaaaa
aaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfaepfdejfeejepeoaafeeffied
epepfceeaaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaa
aaaaaaaaadaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklkl"
}
}
 }
}
}