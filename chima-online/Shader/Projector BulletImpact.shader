//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Projector/BulletImpact" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  ZWrite Off
  Fog {
   Color (1,1,1,1)
  }
  Blend DstColor Zero
  AlphaTest Greater 0
  ColorMask RGB
  Offset -1, -1
  SetTexture [_MainTex] { Matrix [_Projector] combine texture, one-texture alpha }
 }
}
}