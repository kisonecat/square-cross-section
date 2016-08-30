#include "colors.inc"

camera {
  sky <0,0,1>
  direction <-1,0,0>
  right <-16/9,0,0>
  location <17,17,4>
  look_at <0,0,1.25>
  angle 22
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
        <0,1,0>,<0,0,0>,<2,1,0>,-2
    }

    // bound by abs(2x) - ( (3-y*y) - (y+1) ) }
    quadric
    {// A x2 + B y2 + C z2 + D xy + E xz + F yz + G x + H y + I z + J = 0 
        <0,1,0>,<0,0,0>,<-2,1,0>,-2
    }    
    quadric
    {// A x2 + B y2 + C z2 + D xy + E xz + F yz + G x + H y + I z + J = 0 
        <0,0,0>,<0,0,0>,<0,1,-1>,1
    }

  pigment { checker scale <10,0.04,10> translate <4,4,4>}
  rotate <0,0,360*clock>
}