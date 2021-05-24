//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Baked Vertex Color Lighting" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _SpecColor ("Spec Color", Color) = (1,1,1,1)
 _Emission ("Emmisive Color", Color) = (0,0,0,0)
 _Shininess ("Shininess", Range(0.01,1)) = 0.7
 _MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader { 
 Pass {
  Lighting On
  SeparateSpecular On
  Material {
   Ambient [_Color]
   Diffuse [_Color]
   Emission [_Emission]
   Specular [_SpecColor]
   Shininess [_Shininess]
  }
  SetTexture [_MainTex] { ConstantColor [_Color] combine texture * primary double, texture alpha * constant alpha }
 }
 Pass {
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  Fog {
   Color (0,0,0,0)
  }
  Blend One One
  SetTexture [_MainTex] { combine primary * texture }
  SetTexture [_MainTex] { ConstantColor [_Color] combine previous * constant }
 }
}
}