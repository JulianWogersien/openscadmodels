 
psu_height = 65.1;
psu_width = 32.1;
thickness = 5;

$fn=100;

difference() {
    cube(size = [psu_height + thickness, psu_width, thickness], center = true);
    translate([0, -2, 0])
    cube(size = [psu_height, psu_width, thickness], center = true);
}

translate([49.5, -10.6, 5])
rotate([90, 0, 0])
difference() {
    translate([-7, 0, 3])
    cube(size = [15, 15, 5], center = true);
    color("red")
    translate([-7, 0, 1])
    linear_extrude(height = 10, center = true, scale=[0.3,0.3])
    circle(d = 15);
}

translate([-35.5, -10.6, 5])
rotate([90, 0, 0])
difference() {
    translate([-7, 0, 3])
    cube(size = [15, 15, 5], center = true);
    color("red")
    translate([-7, 0, 1])
    linear_extrude(height = 10, center = true, scale=[0.3,0.3])
    circle(d = 15);
}