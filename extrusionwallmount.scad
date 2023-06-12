
$fn = $preview ? 100 : 500;

module Cylindricalheadscrew(head_diameter, tail_diameter) {
    union() {
        linear_extrude(height = 100) 
        circle(d = tail_diameter);
        translate([0, 0, 0])
        linear_extrude(height = 50) 
        circle(d = head_diameter);
    }
}

CLEARANCE = 0.1;

EXTRUSIONWIDTH = 20;
EXTRUSIONDEPTH = 40;
EXTRUSIONHEIGHT = 100;

ACTUAL_WIDTH = EXTRUSIONWIDTH + 6;

SCREW_TAIL_DIA = 5;
SCREW_HEAD_DIA = 8.3;

WALLSCREW_TAIL_DIAG = 5.9;
WALLSCREW_HEAD_DIAG = 9.8;

HOLE_DIA = 6;

module ExtrusionMountingPlate() {
    union() {
        cube(size = [EXTRUSIONWIDTH + CLEARANCE, EXTRUSIONDEPTH + CLEARANCE, EXTRUSIONWIDTH + CLEARANCE], center = true);

        translate([0, EXTRUSIONWIDTH / 2, 70])
        rotate([0, 180, 0])
        Cylindricalheadscrew(SCREW_HEAD_DIA, SCREW_TAIL_DIA);

        translate([0, EXTRUSIONWIDTH / -2, 70])
        rotate([0, 180, 0])
        Cylindricalheadscrew(SCREW_HEAD_DIA, SCREW_TAIL_DIA);
    }
}

module MountingPlate(direction = "l") {

    if(direction == "l") {
        difference() {
            difference() {
                cube(size = [EXTRUSIONWIDTH + 30, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

                translate([21, 10, 0])
                rotate([0, 0, -45])
                cube(size = [EXTRUSIONWIDTH + 10, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

                translate([-21, 10, 0])
                rotate([0, 0, 45])
                cube(size = [EXTRUSIONWIDTH + 10, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);
            }
        
            //rotate([90, 0 ,0])
            //linear_extrude(height = EXTRUSIONWIDTH, scale = 2.0, center = true) 
            //square(size = [EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

            translate([0, 0, -50])
            Cylindricalheadscrew(WALLSCREW_HEAD_DIAG, WALLSCREW_TAIL_DIAG);
        }
    } else {
        difference() {
            difference() {
                cube(size = [EXTRUSIONWIDTH + 30, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

                translate([21, -10, 0])
                rotate([0, 0, 45])
                cube(size = [EXTRUSIONWIDTH + 10, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

                translate([-21, -10, 0])
                rotate([0, 0, -45])
                cube(size = [EXTRUSIONWIDTH + 10, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);
            }
        
            //rotate([90, 0 ,0])
            //linear_extrude(height = EXTRUSIONWIDTH, scale = 2.0, center = true) 
            //square(size = [EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

            translate([0, 0, -50])
            Cylindricalheadscrew(WALLSCREW_HEAD_DIAG, WALLSCREW_TAIL_DIAG);
        }
    }
}

difference() {
    union() {
        difference() {
            hull() {
                cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

                translate([0, EXTRUSIONHEIGHT, 0])
                cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);
            }


            translate([-30, EXTRUSIONHEIGHT / 4, 0])
            rotate([0, 90, 0])
            linear_extrude(height = 1000) 
            circle(d = HOLE_DIA);

            translate([-30, EXTRUSIONHEIGHT / 3, 0])
            rotate([0, 90, 0])
            linear_extrude(height = 1000) 
            circle(d = HOLE_DIA);
        }

        hull() {
            cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);

            translate([0, 0, EXTRUSIONHEIGHT])
            cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);
        }

        hull() {
            translate([0, EXTRUSIONHEIGHT, 0])
            cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH + 10, EXTRUSIONWIDTH], center = true);

            translate([0, 0, EXTRUSIONHEIGHT])
            cube(size = [ACTUAL_WIDTH, EXTRUSIONWIDTH, EXTRUSIONWIDTH], center = true);
        }

        translate([EXTRUSIONWIDTH, 0, EXTRUSIONHEIGHT * 1/4])
        rotate([0, 90, -90])
        MountingPlate();

        translate([-EXTRUSIONWIDTH, 0, EXTRUSIONHEIGHT * 1/1.5])
        rotate([0, 90, -90])
        MountingPlate(direction = "r");
    }

    translate([-30, EXTRUSIONHEIGHT / 50, EXTRUSIONHEIGHT - 10])
    rotate([0, 90, 0])
    linear_extrude(height = 1000) 
    circle(d = HOLE_DIA);

    translate([-30, EXTRUSIONHEIGHT / 3, EXTRUSIONHEIGHT - 50])
    rotate([0, 90, 0])
    linear_extrude(height = 1000) 
    circle(d = HOLE_DIA);

    translate([0, EXTRUSIONHEIGHT - EXTRUSIONWIDTH / 2, 0]) 
    ExtrusionMountingPlate();
}
