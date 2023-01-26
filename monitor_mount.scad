
// 107mm with both holes
// hole ~7mm
$fn = 100;

thickness_total = 20;
corner_radius = 5;
thickness = thickness_total - corner_radius;

difference(){
    minkowski() {
        union(){
            translate([0, 0, -2.5])
            cube(size=[110, thickness, thickness], center=true);
            translate([65,0,22.5])
            cube(size=[thickness, thickness, 65], center=true);
            translate([40,0,47.5])
            cube(size=[50, thickness, thickness], center=true);
        }
        cylinder(h = 1, r = corner_radius);
    }
    
    translate([0,0,-6])
    union(){
        translate([-50,0,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
    
        translate([50,0,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
        
        translate([-50,0,2])
        linear_extrude(500)
        circle(d=9, $fn=100);
        
        translate([50,0,2])
        linear_extrude(500)
        circle(d=9, $fn=100);
    }
}