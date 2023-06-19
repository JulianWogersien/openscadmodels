
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

EXTRUSIONWIDTH = 21;
EXTRUSIONDEPTH = 41;
EXTRUSIONHEIGHT = 100;

WALL_THICKNESS = 6;

SCREW_TAIL_DIA = 5;
SCREW_HEAD_DIA = 8.5;

WALLSCREW_TAIL_DIAG = 5.9;
WALLSCREW_HEAD_DIAG = 9.8;

HOLE_DIA = 6;

DISTANCE_TOO_WALL = 100;

MOUNT_WIDTH = 20;
MOUNT_DEPTH = 40 + WALL_THICKNESS;
MOUNT_HEIGHT = 20;
MOUNT_ANGLE = 45 / 2;
MOUNT_HYP = DISTANCE_TOO_WALL / cos(MOUNT_ANGLE);
MOUNT_OPS = sqrt(MOUNT_HYP^2 - DISTANCE_TOO_WALL^2);

SCREW_PLATEWIDTH = 20;

module ExtrusionMountingPlate() {
    #union() {
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

            translate([0, 0, -50])
            Cylindricalheadscrew(WALLSCREW_HEAD_DIAG, WALLSCREW_TAIL_DIAG);
        }
    }
}

module LowerPart() {
    difference() {
        union() {
            hull() {
                translate([0, 0, -MOUNT_OPS])
                cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT / 2], center = true);

                translate([DISTANCE_TOO_WALL, 0, 0])
                cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT / 2], center = true);
            }

            difference() {
                hull() {
                    translate([0, 0, 0])
                    cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);

                    translate([DISTANCE_TOO_WALL, 0, 0])
                    cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT / 2], center = true);
                }

                translate([30, 30, 0])
                rotate([90, 0, 0])
                cylinder(h = 100, d = HOLE_DIA);

                translate([20, 30, 0])
                rotate([90, 0, 0])
                cylinder(h = 100, d = HOLE_DIA);
            }

            hull() {
                translate([0, 0, -MOUNT_OPS])
                cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT / 2], center = true);

                translate([0, 0, 0])
                cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);
            }

            /*translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, MOUNT_DEPTH / 1.5, -MOUNT_OPS]) 
            difference() {
                cube(size = [SCREW_PLATEWIDTH, MOUNT_DEPTH / 2, MOUNT_HEIGHT / 2], center = true);
                translate([60, 0, 0])
                rotate([0, -90, 0])
                Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
            }

            translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, -MOUNT_DEPTH / 1.5, -MOUNT_OPS]) 
            difference() {
                cube(size = [SCREW_PLATEWIDTH, MOUNT_DEPTH / 2, MOUNT_HEIGHT / 2], center = true);
                translate([60, 0, 0])
                rotate([0, -90, 0])
                Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
            }*/

            translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, 0, MOUNT_HEIGHT]) 
            difference() {
                cube(size = [SCREW_PLATEWIDTH, MOUNT_DEPTH / 2, MOUNT_HEIGHT], center = true);
                translate([60, 0, 0])
                rotate([0, -90, 0])
                Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
            }
        }

        translate([DISTANCE_TOO_WALL - WALL_THICKNESS, 0, 10])
        rotate([180, 0, 0])
        ExtrusionMountingPlate();

        translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, 0, -MOUNT_OPS]) 
        translate([60, 0, 0])
        rotate([0, -90, 0])
        Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
    }
}

LowerPart();
