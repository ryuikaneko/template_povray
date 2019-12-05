#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

background{color White}

#default{ texture{ finish{ ambient 0.3 phong 0.3 phong_size 10 } } }

camera{ location <0,-0.36,-0.32>  look_at <0,0,0> }
//camera{ location <0,-0.40,-0.60>  look_at <0,0,0> }
light_source{ <-200,200,-200> rgb<1,1,1> }
global_settings{ ambient_light rgb 3 }

#declare T_Atom = texture{pigment {rgb<0.05, 0.05, 0.05>} finish{phong 0.3}}
#declare T_Bond = texture{pigment {rgb<0.25, 0.25, 0.25>} finish{phong 0.3}}
#declare T_DimerA = texture{pigment {rgb<0.55, 0.00, 0.00> transmit 0.5} finish{phong 0.3}}
#declare T_DimerB = texture{pigment {rgb<0.00, 0.55, 0.00> transmit 0.5} finish{phong 0.3}}
#declare T_DimerC = texture{pigment {rgb<0.00, 0.00, 0.55> transmit 0.5} finish{phong 0.3}}
#declare T_DimerD = texture{pigment {rgb<0.55, 0.00, 0.55> transmit 0.5} finish{phong 0.3}}
#declare Lattice_Constant=0.1;
#declare Xmax=2;
#declare Ymax=2;
#declare Xmin=-2;
#declare Ymin=-2;
#declare Lattice_Scale=0.16;
#declare Bond_Scale=0.04;
#declare Arrow_Scale=0.08;

#declare Rx = 5.40*Lattice_Constant*Lattice_Scale;
#declare Ry = 1.80*Lattice_Constant*Lattice_Scale;
#declare Rz = 1.80*Lattice_Constant*Lattice_Scale;

// Place atoms at lattice points
#declare X=Xmin; #while(X<=Xmax)
  #declare Y=Ymin; #while(Y<=Ymax)
    sphere{ <X,Y,0>, Lattice_Constant*Lattice_Scale texture{T_Atom} }
  #declare Y=Y+Lattice_Constant; #end
#declare X=X+Lattice_Constant; #end

// Place dimers at bonds
#declare X=Xmin; #while(X<0)
  #declare Y=Ymin; #while(Y<0)
    sphere{ o, 1 scale<Rx,Ry,Rz> translate <X-Lattice_Constant*0.5,Y,0> texture{T_DimerA} }
  #declare Y=Y+Lattice_Constant; #end
#declare X=X+Lattice_Constant*2; #end

#declare X=0; #while(X<=Xmax)
  #declare Y=Lattice_Constant; #while(Y<=Ymax)
    sphere{ o, 1 scale<Rx,Ry,Rz> translate <X+Lattice_Constant*0.5,Y,0> texture{T_DimerB} }
  #declare Y=Y+Lattice_Constant; #end
#declare X=X+Lattice_Constant*2; #end

#declare X=Xmin; #while(X<0)
  #declare Y=0; #while(Y<=Ymax)
    sphere{ o, 1 scale<Ry,Rx,Rz> translate <X,Y+Lattice_Constant*0.5,0> texture{T_DimerC} }
  #declare Y=Y+Lattice_Constant*2; #end
#declare X=X+Lattice_Constant; #end

#declare X=Lattice_Constant; #while(X<=Xmax)
  #declare Y=Ymin+Lattice_Constant; #while(Y<0)
    sphere{ o, 1 scale<Ry,Rx,Rz> translate <X,Y+Lattice_Constant*0.5,0> texture{T_DimerD} }
  #declare Y=Y+Lattice_Constant*2; #end
#declare X=X+Lattice_Constant; #end

// Place chemical bonds
#declare X=Xmin; #while(X<=Xmax)
  cylinder{ <X,Ymin,0>, <X,Ymax,0>, Lattice_Constant*Bond_Scale texture{T_Bond} }
#declare X=X+Lattice_Constant; #end

#declare Y=Ymin; #while(Y<=Ymax)
  cylinder{ <Xmin,Y,0>, <Xmax,Y,0>, Lattice_Constant*Bond_Scale texture{T_Bond} }
#declare Y=Y+Lattice_Constant; #end

// Place a spin
union {
cone { <6*Lattice_Constant*Arrow_Scale,0,0>,1.5*Lattice_Constant*Arrow_Scale,<10*Lattice_Constant*Arrow_Scale,0,0>,0  }
cylinder  { <-10*Lattice_Constant*Arrow_Scale,0,0>,<6*Lattice_Constant*Arrow_Scale,0,0>,0.5*Lattice_Constant*Arrow_Scale }
pigment { rgb<0,0,0> }
scale <0.9, 1.6, 1>
rotate 50*y+50*z
translate <0,0,0>
}
