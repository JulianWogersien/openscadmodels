
// 107mm with both holes
// hole ~7mm
$fn = 100;

thickness_total = 20;
corner_radius = 5;
thickness = thickness_total - corner_radius;

difference(){
    minkowski() {
        union(){
            translate([0, 0, 0])
            cube(size=[110, thickness, thickness], center=true);
            translate([65,0,18])
            cube(size=[thickness, thickness, 21.5+thickness*2], center=true);
            translate([40,0,21.5 + thickness])
            cube(size=[50, thickness, thickness], center=true);
        }
        cylinder(h = 1, r = corner_radius);
    }
    
    
    translate([52, thickness_total + 10/2 ,(thickness/2) + 1])
    rotate([90, 45, 0])
    scale([1.3, 1, 1])
    cylinder(h = thickness_total + 100, r = 2);
    translate([52, 100 ,(thickness/2) + 1 + (thickness / 2) + 13])
    rotate([90, -45, 0])
    scale([1.3, 1, 1])
    cylinder(h = thickness + 100, r = 2);

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