
// 107mm with both holes
// hole ~7mm

difference(){
    union(){
        cube(size=[110, 20, 20], center=true);
        translate([65,0,22.5])
        cube(size=[20, 20, 65], center=true);
        translate([0,0,45])
        cube(size=[110, 20, 20], center=true);
    }
    
    translate([0,0,-6])
    union(){
        translate([-50,0,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
    
        translate([50,0,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
        
        translate([-50,0,-1])
        linear_extrude(500)
        circle(d=9, $fn=100);
        
        translate([50,0,-1])
        linear_extrude(500)
        circle(d=9, $fn=100);
    }
}