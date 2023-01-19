
psu_height = 86;
psu_width = 150;
psu_length = 140;

difference() {
    union() {
        cube(size = [10, 10, psu_height], center = true);
        translate([0, 75, 38])
        cube(size = [10, psu_width, 10], center = true);
        translate([0, 145, 0])
        cube(size = [10, 10, psu_height], center = true);
    }

    translate([0, (psu_width / 2) - 4, (psu_height / 2) - 8])
    cube(size = [10, 10, 5], center = true);
}