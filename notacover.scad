
innerwidth = 64;
innerheight = 36.3;
depth = 15;
outerwidth = innerwidth + 15;
outerheight = innerheight + 15;

difference() {
    intersection() {
        cube(size = [outerwidth, depth, outerheight], center = true);
        translate([0, 0, 0])
        union() {
        cube(size = [innerwidth + 4, depth + 4, innerheight + 4], center = true);
        translate([0, depth/2, 0])
        cube(size = [outerwidth, 4, outerheight], center = true);
        }
    }
    cube(size = [innerwidth, depth, innerheight], center = true);
}