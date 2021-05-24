//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Ford/Hardsurface Heavy/Transparent Bump" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,1)
 _SpecColor ("Specular Color", Color) = (1,1,1,1)
 _Shininess ("Shininess", Range(0.01,3)) = 1.5
 _Gloss ("Gloss", Range(0,1)) = 0.5
 _Reflection ("Reflection", Range(0,1)) = 0.5
 _Cube ("Reflection Cubemap", CUBE) = "Black" { TexGen CubeReflect }
 _FrezPow ("Fresnel Reflection", Range(0,2)) = 0.25
 _FrezFalloff ("Fresnal/EdgeAlpha Falloff", Range(0,10)) = 4
 _EdgeAlpha ("Edge Alpha", Range(0,1)) = 0
 _Metalics ("Metalics", Range(0,1)) = 0.5
 _Density ("Density / Refraction", Range(0,1)) = 0.12
 _MainTex ("Diffuse(RGB) Alpha(A)", 2D) = "White" {}
 _BumpMap ("Normalmap", 2D) = "Bump" {}
}
SubShader { 
 Tags { "LIGHTMODE"="Always" "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Pass {
  Tags { "LIGHTMODE"="Always" "QUEUE"="Geometry" "IGNOREPROJECTOR"="true" }
  Cull Front
  ColorMask 0
 }
 UsePass "Hidden/Hardsurface Pro Back Transparent Bump/FORWARD"
 GrabPass {
  Tags { "LIGHTMODE"="Always" }
 }
 UsePass "Hidden/Hardsurface Pro ScreenSpace Refraction/SSREFRACTIONBUMP"
 UsePass "Hidden/Hardsurface Pro Front Transparent Bump/FORWARD"
 UsePass "Hidden/Hardsurface Pro ScreenSpace Reflection/SSREFLECTIONBUMP"
}
}