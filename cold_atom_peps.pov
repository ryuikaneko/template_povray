// https://codegolf.stackexchange.com/questions/28542/open-source-optical-lattice-clock

#version 3.7;
#include "colors.inc"
#include "functions.inc"                

background{color White}

//camera{ location <36,36,0>  look_at <0,-10,0> }
camera{ location <45,35,20>  look_at <0,-20,0> }
light_source{ <80,60,20> rgb<1,1,1> }
global_settings{ ambient_light rgb 3 }

#macro sb(p) //position
  sphere{
    pi*p+y/3 1.5
    pigment{rgb<0.05,0.05,0.7>}
    //phong for the wide highlights, specular for the small ones.
    finish{phong .5 phong_size 5 specular 1 roughness .001}
  }
#end

#macro sr(p) //position
  sphere{
    pi*p+y/3 1.5
    pigment{rgb<0.7,0.05,0.05>}
    //phong for the wide highlights, specular for the small ones.
    finish{phong .5 phong_size 5 specular 1 roughness .001}
  }
#end

#macro ck(p,q) //position
  cylinder{
    pi*p, pi*q, 0.25
    texture{
      pigment {rgb<0.05, 0.05, 0.05>} finish{phong 0.3}
    }
  }
#end

#macro cg(p,q) //position
  cylinder{
    pi*p, pi*q, 0.75
    texture{
      pigment {rgb<0.05, 0.35, 0.05>} finish{phong 0.3}
    }
  }
#end


#declare X=-6; #while(X<=6)
  #declare Y=-6; #while(Y<=6)
    #if ((X+Y)/4=int((X+Y)/4))
      sr(<X,0,Y>)
    #else
      sb(<X,0,Y>)
    #end
  #declare Y=Y+2; #end
#declare X=X+2; #end

#declare X=-6; #while(X<=6)
  #declare Y=-8; #while(Y<=6)
    ck(<X,0,Y>,<X,0,Y+2>)
  #declare Y=Y+2; #end
#declare X=X+2; #end

#declare X=-8; #while(X<=6)
  #declare Y=-6; #while(Y<=6)
    ck(<X,0,Y>,<X+2,0,Y>)
  #declare Y=Y+2; #end
#declare X=X+2; #end

#declare X=-6; #while(X<=6)
  #declare Y=-6; #while(Y<=6)
    cg(<X,0,Y>,<X,-1.5,Y>)
  #declare Y=Y+2; #end
#declare X=X+2; #end
