$fn=100;

psu_height = 86;
psu_width = 150;
psu_length = 140;

baseWidth=15;
hingeLength=30;
baseThickness=3;
pivotRadius=5;
pinRadius=2;
pinTaper=0.25;
mountingHoleRadius=0;
mountingHoleCount=3;
mountingHoleEdgeOffset=4;
clearance=0.2;
tiny=0.005;
hingeHalfExtrudeLength=hingeLength/2-clearance/2;
mountingHoleMoveIncrement=(hingeLength-2*mountingHoleEdgeOffset)/
  (mountingHoleCount-1);
module hingeBaseProfile() {
  translate([pivotRadius,0,0]){
    square([baseWidth,baseThickness]);
  }
}

module hingeBodyHalf() {
  difference() {
    union() {
      linear_extrude(hingeHalfExtrudeLength){
        offset(1)offset(-2)offset(1){
          translate([0,pivotRadius,0]){
            circle(pivotRadius);
          }
          square([pivotRadius,pivotRadius]);
          hingeBaseProfile();
        }
      }
      linear_extrude(hingeLength){
        offset(1)offset(-1)hingeBaseProfile();
      }
    }
    plateHoles();
  }
}

module pin(rotateY, radiusOffset) {
  translate([0,pivotRadius,hingeHalfExtrudeLength+tiny]){
    rotate([0,rotateY,0]) {
      cylinder(
        h=hingeLength/2+clearance/2,
        r1=pinRadius+radiusOffset,
        r2=pinRadius+pinTaper+radiusOffset
      );
    }
  }
}

module hingeHalfFemale() {
  difference() {
    hingeBodyHalf();
    pin(rotateY=180, radiusOffset=clearance);
  }
}

module hingeHalfMale() {
  translate([0,0,hingeLength]) {
    rotate([0,180,0]) {
      hingeBodyHalf();
      pin(rotateY=0, radiusOffset=0);
    }
  }
}

module plateHoles() {
  for(i=[0:mountingHoleCount-1]){
    translate([
      baseWidth/2+pivotRadius,
      -baseThickness,
      i*mountingHoleMoveIncrement+mountingHoleEdgeOffset
    ]){
      rotate([-90,0,0]){
        cylinder(r=mountingHoleRadius,h=baseThickness*4);
      }
    }
  }
}

hingeHalfFemale();
hingeHalfMale();

translate([50, 0, 15])
cube(size = [psu_height, 10, 10], center = true);

translate([88, -65, 15])
difference() {
    translate([10, -5, 0])
    cube(size = [10, psu_length + 10, 10], center = true);
    
    translate([-2.5, -psu_length / 3, 0])
    cube(size = [5, 10, 10], center = true);
    
    translate([-2.5, psu_length / 3, 0])
    cube(size = [5, 10, 10], center = true);
}

translate([55, -140, 15])
cube(size = [psu_height + 10, 10, 10], center = true);

translate([13, -145, 15])
rotate([90, 0, 0])
cylinder(d = 10, h = 10);

translate([0, -100, 10])
difference() {
    cube(size = [20, 20, 20], center = true);
    translate([0, 4, 0])
    cylinder(d = 10, h = 10);
    translate([0, -8, 0])
    cube(size = [20, 20, 20], center = true);
}

/*difference() {
    cube(size = [psu_width + 20, 10, psu_height + 10]);
    translate([10, 0, 0]) 
    cube(size = [psu_width, 10, psu_height]);
}*/