#include "colors.inc"
#include "glass.inc"
#include "golds.inc"
#include "metals.inc"
#include "stones.inc"
#include "woods.inc"

camera {
  sky <0,0,1>           //Don't change this
  direction <-1,0,0>    //Don't change this  
  right <-16/9,0,0>      //Don't change this
  location <17,17,4> //Camera location
  look_at <0,0,1.25>     //Where camera is pointing
  angle 22      //Angle of the view--increase to see more, decrease to see less
}

global_settings { ambient_light White*2 }

/*
light_source {
  <10,-10,20> 
  color White 
}

light_source {
  <9,-11,21>  
  color White
}
*/

  light_source {
    <10, -10, 20>
    color White*2
    area_light <5, 0, 0>, <0, 0, 5>, 5, 5
    adaptive 1
    jitter
  }

background { color White }

plane {
  <0,0,1>, -1.25            //This represents the plane 0x+0y+z=0
  pigment { color White }
}

intersection {

    quadric
    {// A x2 + B y2 + C z2 + D xy + E xz + F yz + G x + H y + I z + J = 0 
        <0,1,0>,<0,0,0>,<0,0,1>,-3
    }

    quadric
    {// A x2 + B y2 + C z2 + D xy + E xz + F yz + G x + H y + I z + J = 0 
        <0,0,0>,<0,0,0>,<0,1,-1>,1
    }
    
  quartic { // -y^4 - 2*y^3 + x^2 + 3*y^2 + 4*y - 4
    < 0,   0,   0,   0,   0,   0,   0,   0,   0,
      4,   0,   0,   0,   0,   0,   0,   0,   0,
      0,   0,  -1,   0,  -2,   0,   0,   3,   0,
      0,   0,   4,   0,   0,   0,   0,   -4 >
      //    sturm
  }
/*
isosurface {
    function { abs(x) - ( (3-y*y) - (y+1) ) }
    contained_by { box { <-4,-4,-4>, <4,4,4> } }
     threshold 0
     max_gradient 10
  }*/

pigment { checker scale <10,0.04,10> translate <4,4,4>}
rotate <0,0,360*clock>
  }