#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

background{color White}

#default{ texture{ finish{ ambient 0.3 phong 0.3 phong_size 10 } } }

camera{ location <0,-0.36,-0.32>  look_at <0,0,0> }
light_source{ <-200,200,-200> rgb<1,1,1> }
global_settings{ ambient_light rgb 3 }

#declare T_AtomA = texture{pigment {rgb<0.55, 0.00, 0.00>} finish{phong 0.3}}
#declare T_AtomB = texture{pigment {rgb<0.00, 0.55, 0.00>} finish{phong 0.3}}
#declare T_AtomC = texture{pigment {rgb<0.00, 0.00, 0.55>} finish{phong 0.3}}
#declare T_Bond = texture{pigment {rgb<0.25, 0.25, 0.25>} finish{phong 0.3}}
#declare Lattice_Constant=0.1;
#declare Xmax=2;
#declare Ymax=2;
#declare Xmin=-2;
#declare Ymin=-2;
#declare Lattice_Scale=0.16;
#declare Bond_Scale=0.04;

// Place atoms at lattice points
#declare X=Xmin; #while(X<=Xmax)
  #declare Y=Ymin; #while(Y<=Ymax)
    sphere{ <X+Y*0.5,Y*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomA} }
    sphere{ <X+Lattice_Constant+Y*0.5,Y*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomB} }
    sphere{ <X+Lattice_Constant*2+Y*0.5,Y*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomC} }
    sphere{ <X+(Y+Lattice_Constant)*0.5,(Y+Lattice_Constant)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomC} }
    sphere{ <X+Lattice_Constant+(Y+Lattice_Constant)*0.5,(Y+Lattice_Constant)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomA} }
    sphere{ <X+Lattice_Constant*2+(Y+Lattice_Constant)*0.5,(Y+Lattice_Constant)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomB} }
    sphere{ <X+(Y+Lattice_Constant*2)*0.5,(Y+Lattice_Constant*2)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomB} }
    sphere{ <X+Lattice_Constant+(Y+Lattice_Constant*2)*0.5,(Y+Lattice_Constant*2)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomC} }
    sphere{ <X+Lattice_Constant*2+(Y+Lattice_Constant*2)*0.5,(Y+Lattice_Constant*2)*0.866,0>, Lattice_Constant*Lattice_Scale texture{T_AtomA} }
  #declare Y=Y+Lattice_Constant*3; #end
#declare X=X+Lattice_Constant*3; #end

// Place chemical bonds
#declare X=Xmin; #while(X<=Xmax)
  cylinder{ <X+Ymin*0.5,Ymin*0.866,0>, <X+Ymax*0.5,Ymax*0.866,0>, Lattice_Constant*Bond_Scale texture{T_Bond} }
#declare X=X+Lattice_Constant; #end

#declare X=Xmin; #while(X<=Xmax)
  cylinder{ <X-Ymin*0.5,Ymin*0.866,0>, <X-Ymax*0.5,Ymax*0.866,0>, Lattice_Constant*Bond_Scale texture{T_Bond} }
#declare X=X+Lattice_Constant; #end

#declare Y=Ymin; #while(Y<=Ymax)
  cylinder{ <Xmin+Y*0.5,Y*0.866,0>, <Xmax+Y*0.5,Y*0.866,0>, Lattice_Constant*Bond_Scale texture{T_Bond} }
#declare Y=Y+Lattice_Constant; #end
