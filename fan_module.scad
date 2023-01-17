clearance=0.1;

fan_length = 25.3 + clearance;
fan_width = 92.2 + clearance;
fan_height = 92.2 + clearance ;
fan_radius = 87/2;

$fn=100;

difference() {
    minkowski() {
        cube(size = [fan_length + 1, fan_width + 1, fan_height], center=true);
        sphere(r = 2);
    }
    
    translate([0, 0, 2])
    cube(size = [fan_length, fan_width, fan_height], center=true);

    translate([-25,0,0])
    rotate([0, 90, 0])
    cylinder(h = fan_length + 20, r = fan_radius);
}

intersection() {
    translate([-25,0,0])
    rotate([0, 90, 0])
    cylinder(h = fan_length + 20, r = fan_radius);

    for(i = [0:(fan_radius*2) / 10]) {
        translate([(fan_length / 2) + 1.5, 0, (-i * 10) + fan_radius]) 
        cube(size = [2.5, 100, 3], center = true);
    }
}

intersection() {
    translate([-25,0,0])
    rotate([0, 90, 0])
    cylinder(h = fan_length + 20, r = fan_radius);

    for(i = [0:(fan_radius*2) / 10]) {
        translate([-((fan_length / 2) + 1.5), 0, (-i * 10) + fan_radius]) 
        cube(size = [2.5, 100, 3], center = true);
    }
}