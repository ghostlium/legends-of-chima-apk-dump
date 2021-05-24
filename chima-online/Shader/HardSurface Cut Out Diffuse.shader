//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Hardsurface/Cut Out/Diffuse" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _SpecColor ("Specular Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,3)) = 1.5
 _Gloss ("Gloss", Range(0,1)) = 0.5
 _Reflection ("Reflection", Range(0,1)) = 0.5
 _Cube ("Reflection Cubemap", CUBE) = "Black" { TexGen CubeReflect }
 _FrezPow ("Fresnel Reflection", Range(0,2)) = 0.25
 _FrezFalloff ("Fresnal/EdgeAlpha Falloff", Range(0,10)) = 4
 _Metalics ("Metalics", Range(0,1)) = 0.5
 _Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
 _MainTex ("Diffuse(RGB) Alpha(A)", 2D) = "White" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "LIGHTMODE"="Always" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  Cull Front
  AlphaTest Greater [_Cutoff]
  ColorMask 0
  SetTexture [_MainTex] { combine texture }
 }
 UsePass "Hidden/Hardsurface Pro Back Cut Out Diffuse/FORWARD"
 Pass {
  Tags { "LIGHTMODE"="Always" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  AlphaTest Greater [_Cutoff]
  ColorMask 0
  SetTexture [_MainTex] { combine texture }
 }
 UsePass "Hidden/Hardsurface Pro Front Cut Out Diffuse/FORWARD"
}
}