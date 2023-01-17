
$fn = 500;
hotend_top_diameter = 12;
hotend_top_length = 6;
hotend_bottom_diameter = 23;
hotend_bottom_length = 4;

difference() {
    cube(size = [6, 12 + 4, 30], center=true);

    translate([-10, 0, 0])
    rotate([0, 90, 0])
    cylinder(h = hotend_top_length + 19, r = hotend_top_diameter / 2);
    
    translate([0, 0, 6])
    cube(size = [hotend_top_diameter, hotend_top_diameter, hotend_top_diameter], center  = true);
    
    translate([0, 0, 10])
    cube(size = [hotend_top_diameter, hotend_top_diameter, hotend_top_diameter], center  = true);
    
    translate([0, 0, 15])
    cube(size = [hotend_top_diameter + 10, hotend_top_diameter + 10, hotend_top_diameter], center  = true);
}

translate([18,0,0])
difference() {
    cube(size = [hotend_bottom_length, hotend_bottom_diameter, 30], center = true);
    
    translate([-10, 0, 0])
    rotate([0, 90, 0])
    cylinder(h = hotend_bottom_length + 19, r = hotend_bottom_diameter / 2);
    
    translate([0, 0, 15])
    cube(size = [30, 30, 30], center = true);
}

translate([7.5, 0, -15])
cube(size = [25, 23, 2], center = true);