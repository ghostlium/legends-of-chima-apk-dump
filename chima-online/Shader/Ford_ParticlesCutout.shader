//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Transparent/Particles Cutout" {
Properties {
 _TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
 _MainTex ("Particle Texture", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  Cull Off
  AlphaTest Greater 0.5
  ColorMask RGB
  SetTexture [_MainTex] { ConstantColor [_TintColor] combine constant * primary double }
  SetTexture [_MainTex] { combine previous * texture }
 }
}
}