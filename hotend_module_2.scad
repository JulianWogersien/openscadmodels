$fn = 100;
fan_height = 40;
fan_width = 40;
fan_length = 10.3;
fan_diameter = 37.4;

difference() {
    minkowski() {
        cube(size = [fan_length + 2, fan_width + 2, fan_height + 2], center = true);
        sphere(r = 1);
    }
    translate([0, 0, 6.1])
    cube(size = [fan_length, fan_width, fan_height + 10], center = true);

    translate([-20, 0, 0])
    rotate([0, 90, 0]) 
    cylinder(h = 100, r = fan_diameter / 2);
}