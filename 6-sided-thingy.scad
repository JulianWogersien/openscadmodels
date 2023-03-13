use<libraries/scmath/basic2d.scad>

$fn=100;

difference() {
    linear_extrude(height = 9.2, scale = 1.1) 
    regular_hexagon(side_length = 38);

    translate([0, 0, -1]) 
    linear_extrude(height = 15)
    circle(d = 8);
    
    translate([20, 0, -1]) 
    linear_extrude(height = 15)
    circle(d = 5);
    
    translate([-20, 0, -1]) 
    linear_extrude(height = 15)
    circle(d = 5);
}