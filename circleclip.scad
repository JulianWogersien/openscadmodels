$fn=100;

difference(){
    translate([0, -5, -2])
    cube(size = [14, 14, 10], center = true);
    rotate([90, 0, 0])
    translate([0, 0, -3])
    cylinder(h = 30, d = 10.7);
}