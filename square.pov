#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

background{color White}

#default{ texture{ finish{ ambient 0.3 phong 0.3 phong_size 10 } } }

camera{ location <0,-0.5,-0.5>  look_at <0,0,0> }
light_source{ <-200,200,-200> rgb<1,1,1> }
global_settings{ ambient_light rgb 3 }

#declare T_Atom = texture{pigment {rgb<0.75, 0.05, 0.05>} finish{phong 0.3}}
#declare T_Bond = texture{pigment {rgb<0.25, 0.25, 0.25>} finish{phong 0.3}}
#declare Lattice_Constant=0.1;
#declare Xmax=1;
#declare Ymax=1;
#declare Xmin=-1;
#declare Ymin=-1;

// Place atoms at lattice points
#declare X=Xmin; #while(X<=Xmax)
  #declare Y=Ymin; #while(Y<=Ymax)
    sphere{ <X,Y,0>, Lattice_Constant*0.16 texture{T_Atom} }
  #declare Y=Y+Lattice_Constant; #end
#declare X=X+Lattice_Constant; #end

// Place chemical bonds
#declare X=Xmin; #while(X<=Xmax)
  cylinder{ <X,Ymin,0>, <X,Ymax,0>, Lattice_Constant*0.04 texture{T_Bond} }
#declare X=X+Lattice_Constant; #end

#declare Y=Ymin; #while(Y<=Ymax)
  cylinder{ <Xmin,Y,0>, <Xmax,Y,0>, Lattice_Constant*0.04 texture{T_Bond} }
#declare Y=Y+Lattice_Constant; #end
