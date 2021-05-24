//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored Split Alpha FastZWrite" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
 _AlphaTex ("Alpha (RGB)", 2D) = "" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Cull Off
  Fog { Mode Off }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMaterial AmbientAndDiffuse
  SetTexture [_MainTex] { combine texture * primary }
  SetTexture [_AlphaTex] { combine previous, primary alpha * texture alpha }
 }
}
}