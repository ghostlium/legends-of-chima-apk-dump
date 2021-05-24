//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Reflective/BumpedSpecularRefractive" {
Properties {
 _Color ("Main Color", Color) = (1,1,1,0)
 _SpecColor ("Specular Color", Vector) = (0,0,0,0)
 _Shininess ("Shininess", Range(0.01,1)) = 0.078125
 _ReflectColor ("Reflection Color", Color) = (1,1,1,0)
 _BumpAmt ("Distortion", Range(0,128)) = 10
 _MainTex ("Base (RGB) Gloss (A)", 2D) = "white" {}
 _BumpMap ("Bumpmap", 2D) = "bump" {}
 _Cube ("cubemap", CUBE) = "_Skybox" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" }
 UsePass "FX/Glass/Stained BumpDistort/BASE"
 UsePass "Reflective/Bumped Unlit/BASE"
 Pass {
  Name "BASE"
  Tags { "LIGHTMODE"="Vertex" "QUEUE"="Transparent" }
  Lighting On
  SeparateSpecular On
  Material {
   Ambient (1,1,1,1)
   Diffuse [_Color]
   Specular [_SpecColor]
   Shininess 10
  }
  ZWrite Off
  Fog {
   Color [_AddFog]
  }
  Blend SrcAlpha One
  AlphaTest Greater 0
  SetTexture [_MainTex] { ConstantColor [_Color] combine texture * primary double, constant alpha }
 }
 UsePass "Alpha/BumpedSpecular/PPL"
}
Fallback "Reflective/BumpedSpecularSRC"
}