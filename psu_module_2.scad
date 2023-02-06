
psu_height = 86;
psu_width = 160;
psu_length = 140;

difference() {
    union() {
        cube(size = [10, 10, psu_height + 10], center = true);
        translate([0, 75 + 10, 43])
        cube(size = [10, psu_width + 10, 10], center = true);
        translate([0, 150 + 15, 0])
        cube(size = [10, 10, psu_height + 10], center = true);
    }

    translate([0, (psu_width / 2) - 4, (psu_height / 2) - 2 + 5])
    cube(size = [10, 10, 5], center = true);
}