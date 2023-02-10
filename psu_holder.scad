$fn=100;

psu_height = 86;
psu_width = 150;
psu_length = 140;

difference() {
    union() {
        cube(size = [10, 10, psu_height + 10], center = true);
        translate([0, 75 + 7.5, 43])
        cube(size = [10, psu_length + 15, 10], center = true);
        translate([0, 150 + 15, 0])
        cube(size = [10, 10, psu_height + 10], center = true);
    }

    translate([0, (psu_width / 3), (psu_height / 2) - 2.5])
    cube(size = [10, 10, 5], center = true);
    
    translate([0, (psu_width / 3) + psu_width / 3, (psu_height / 2) - 2.5])
    cube(size = [10, 10, 5], center = true);
}

rotate([0, 90, 0])
translate([35, 0, -10]) {
    translate([10, 0, 10])
    cylinder(h = 36, r = 3, center = true);
    translate([10, 0 ,-3])
    difference() {
        cylinder(h = 10, r = 5, center = true);
        cylinder(h = 10, r = 4, center = true);
    }
    
    translate([10, 0 ,20+3])
    difference() {
        cylinder(h = 10, r = 5, center = true);
        cylinder(h = 10, r = 4, center = true);
    }
}

translate([13, 0, -54])
cube(size = [10, 10, 10], center = true);

translate([-13, 0, -54])
cube(size = [10, 10, 10], center = true);

translate([0, 180, -45]) 
rotate([90, 0, 0])
cylinder(h = 10, r = 5);

translate([0, 180, -55]) 
difference(){
    translate([0, -5, -2])
    cube(size = [14, 14, 10], center = true);
    rotate([90, 0, 0])
    translate([0, 0, -3])
    cylinder(h = 30, r = 5);
}