
$fn=100;

difference() {
    rotate_extrude(angle = 130, convexity = 10) 
    translate([40, 0, 0]) 
    circle(r = 25);
 
    translate([0,0,10])
    cube(size = [1000, 1000, 30], center = true);
}