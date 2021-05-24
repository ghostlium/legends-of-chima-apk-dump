//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/SFX/Depth Write Only " {
SubShader { 
 Tags { "QUEUE"="Geometry+250" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
 Pass {
  Tags { "QUEUE"="Geometry+250" "IGNOREPROJECTOR"="False" "RenderType"="Opaque" }
  ZWrite Off
  ColorMask 0
  SetTexture [_Color] { combine texture }
 }
}
}