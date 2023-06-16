
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

WALL_THICKNESS = 6;

SCREW_TAIL_DIA = 5;
SCREW_HEAD_DIA = 8.3;

WALLSCREW_TAIL_DIAG = 5.9;
WALLSCREW_HEAD_DIAG = 9.8;

HOLE_DIA = 6;

DISTANCE_TOO_WALL = 100;

MOUNT_WIDTH = 20;
MOUNT_DEPTH = 20;
MOUNT_HEIGHT = 20;
MOUNT_ANGLE = 45 / 2;
MOUNT_HYP = DISTANCE_TOO_WALL / cos(MOUNT_ANGLE);
MOUNT_OPS = sqrt(MOUNT_HYP^2 - DISTANCE_TOO_WALL^2);

SCREW_PLATEWIDTH = 5;

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
    hull() {
        translate([0, 0, -MOUNT_OPS])
        cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);

        translate([DISTANCE_TOO_WALL, 0, 0])
        cube(size = [MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);
    }

    translate([DISTANCE_TOO_WALL + MOUNT_WIDTH, 0, 0])
    difference() {
        cube(size = [EXTRUSIONWIDTH + WALL_THICKNESS, EXTRUSIONDEPTH + WALL_THICKNESS, WALL_THICKNESS * 4], center = true);
        translate([0, 0, 5]) 
        rotate([180, 0, 0])
        ExtrusionMountingPlate();
    }

    translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, MOUNT_DEPTH, -MOUNT_OPS]) 
    difference() {
        cube(size = [SCREW_PLATEWIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);
        translate([-10, 0, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
    }

    translate([(MOUNT_WIDTH / -2) - SCREW_PLATEWIDTH / -2, -MOUNT_DEPTH, -MOUNT_OPS]) 
    difference() {
        cube(size = [SCREW_PLATEWIDTH, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);
        translate([-10, 0, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = WALLSCREW_HEAD_DIAG, tail_diameter = WALLSCREW_TAIL_DIAG);
    }
}

module UpperPart() {
    difference() {
        cube(size = [DISTANCE_TOO_WALL, MOUNT_DEPTH, MOUNT_HEIGHT], center = true);
        rotate([90, 0, 0])
        translate([0, 0, -40])
        cylinder(h = 100, d = HOLE_DIA);

        rotate([90, 0, 0])
        translate([-10, 0, -40])
        cylinder(h = 100, d = HOLE_DIA);
    }
}

UpperPart();
