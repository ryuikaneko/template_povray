// https://codegolf.stackexchange.com/questions/28542/open-source-optical-lattice-clock

#version 3.7;
#include "colors.inc"
#include "functions.inc"                

background{color White}

//camera{ location <36,36,0>  look_at <0,-10,0> }
camera{ location <45,35,20>  look_at <0,-20,0> }
light_source{ <80,60,20> rgb<1,1,1> }
global_settings{ ambient_light rgb 3 }

isosurface{
  function{y/4+pow(cos(0.5*x)*cos(0.5*z),2)-0.5}
  contained_by{box{-22.5,23}}
//  max_gradient 2
  open
  texture{
    pigment{ color rgb<0.7,0.6,0.5>}
    finish { specular 0.2 phong 0.7 reflection 0.0}
  }
}
          
#macro sb(p) //position
  sphere{
    pi*p+y/3 1
    pigment{rgb<0.05,0.05,0.7>}
    //phong for the wide highlights, specular for the small ones.
    finish{phong .5 phong_size 5 specular 1 roughness .001}
  }
#end

#macro sr(p) //position
  sphere{
    pi*p+y/3 1
    pigment{rgb<0.7,0.05,0.05>}
    //phong for the wide highlights, specular for the small ones.
    finish{phong .5 phong_size 5 specular 1 roughness .001}
  }
#end

#macro sw(p) //position
  sphere{
    pi*p+y/3 1
    pigment{rgb<0.9,0.9,0.9> filter 0.9} // completely transparent: filter 1
    //phong for the wide highlights, specular for the small ones.
    finish{phong .5 phong_size 5 specular 1 roughness .001}
  }
#end

sb(<-6,0,-6>)
sb(<-6,0,-4>)
sb(<-6,0,-2>)
sb(<-6,0,0>)
sb(<-6,0,2>)
sb(<-6,0,4>)
sb(<-6,0,6>)
sb(<-4,0,-6>)
sb(<-4,0,-4>)
sb(<-4,0,-2>)
sb(<-4,0,0>)
sb(<-4,0,2>)
sb(<-4,0,4>)
sb(<-4,0,6>)
sb(<-2,0,-6>)
sb(<-2,0,-4>)
sb(<-2,0,-2>)
sb(<-2,0,0>)
sb(<-2,0,2>)
sb(<-2,0,4>)
sb(<-2,0,6>)
sb(<0,0,-6>)
sb(<0,0,-4>)
sb(<0,0,-2>)
sb(<0,0,0>)
sb(<0,0,2>)
sb(<0,0,4>)
sb(<0,0,6>)
sb(<2,0,-6>)
sb(<2,0,-4>)
sb(<2,0,-2>)
sb(<2,0,0>)
sb(<2,0,2>)
sb(<2,0,4>)
sb(<2,0,6>)
sb(<4,0,-6>)
//sb(<4,0,-4>)
sb(<4,0,-2>)
sb(<4,0,0>)
sb(<4,0,2>)
//sb(<4,0,4>)
sb(<4,0,6>)
sb(<6,0,-6>)
sb(<6,0,-4>)
sb(<6,0,-2>)
sb(<6,0,0>)
sb(<6,0,2>)
sb(<6,0,4>)
sb(<6,0,6>)

sr(<3.7,0.5,4.1>)
sr(<4.3,0.5,4.1>)

sw(<4,0.5,-4>)


// http://news.povray.org/povray.binaries.images/thread/%3C5b0c5d4e%40news.povray.org%3E/

#declare Rad = 1.0;
#declare Ball = sphere {<0,0,0>, Rad}
#declare Num = 25;
#for (N, 0, Num)
  object {Ball translate <3.7*pi,(0.5+0.15)*pi-N*N/100,(4+0.15)*pi-N*N/100> pigment {rgbt <1,0,0,0.9+0.1*N/Num>}
finish {specular 0.01} }
#end
#for (N, 0, Num)
  object {Ball translate <4.3*pi,(0.5+0.15)*pi-N*N/100,(4+0.15)*pi-N*N/100> pigment {rgbt <1,0,0,0.9+0.1*N/Num>}
finish {specular 0.01} }
#end

#declare Rad = 1.0;
#declare Ball = sphere {<0,0,0>, Rad}
#declare Num = 25;
#for (N, 0, Num)
  object {Ball translate <4*pi,(0.5+0.15)*pi-N*N/100,-(4+0.15)*pi+N*N/100> pigment {rgbt <0.0,0.0,0.0,0.96+0.04*N/Num>}
finish {specular 0.01} }
#end
