
psu_height = 86;
psu_width = 160;
psu_length = 140;

difference() {
    union() {
        cube(size = [10, 10, psu_height + 15], center = true);
        translate([0, 75 + 10, 45.5])
        cube(size = [10, psu_width + 10, 10], center = true);
        translate([0, 150 + 15, 0])
        cube(size = [10, 10, psu_height + 15], center = true);
    }

    translate([0, (psu_width / 2) - 2, (psu_height / 2) - 2 + 7])
    cube(size = [10, 12, 5], center = true);
}