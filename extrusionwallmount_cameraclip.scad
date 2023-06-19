
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

CAMERA_DIAMETER_DIFFERENCE = 0.05;
CAMERA_DIAMETER = 58;
SCREW_DIAMETER = 3;
EXTRUSION_SCREW_DIAMETER = 3.5;

EXTRUSION_MOUNT_HEIGHT = 5;
EXTRUSION_MOUNT_DEPTH = 60;
EXTRUSION_WIDTH = 40;
EXTRUSION_HEIGHT = 20;

CAMERA_MOUNT_HEIGHT = 60;
CAMERA_MOUNT_THICKNESS = 7;

CAMERA_MOUNT_PLATE_LENGTH = 10;

CLAMP_SCREW_DIA = 5;
CLAMP_SCREW_HEAD_DIA = 8.3;

module ClampHold() {
    difference() {
        difference() {
            cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER + CAMERA_MOUNT_THICKNESS);
            cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER);
        }

        translate([-50, -CAMERA_DIAMETER_DIFFERENCE, 0])
        cube(size = [100, 100, 100]);
    }

    translate([0, CAMERA_DIAMETER / -3, CAMERA_MOUNT_HEIGHT / 2])
    difference() {
        cube(size = [CAMERA_DIAMETER + CAMERA_MOUNT_THICKNESS, CAMERA_DIAMETER / 2, CAMERA_MOUNT_HEIGHT], center = true);
        translate([0, CAMERA_DIAMETER / 3, -60])
        cylinder(h = 100, d = CAMERA_DIAMETER + CAMERA_MOUNT_THICKNESS);
    }

    difference() {
        translate([CAMERA_DIAMETER / 2, -CAMERA_MOUNT_THICKNESS, 0])
        cube(size = [CAMERA_MOUNT_PLATE_LENGTH + CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_HEIGHT], center = false);

        translate([(CAMERA_DIAMETER / 2) + CAMERA_MOUNT_THICKNESS + CAMERA_MOUNT_PLATE_LENGTH / 2, -53, CAMERA_MOUNT_HEIGHT / 2])
        rotate([-90, 0, 0])
        Cylindricalheadscrew(CLAMP_SCREW_HEAD_DIA, CLAMP_SCREW_DIA);
    }
    
    difference() {
        translate([(CAMERA_DIAMETER / -2) + -CAMERA_MOUNT_PLATE_LENGTH - CAMERA_MOUNT_THICKNESS, -CAMERA_MOUNT_THICKNESS, 0])
        cube(size = [CAMERA_MOUNT_PLATE_LENGTH + CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_HEIGHT], center = false);

        translate([(CAMERA_DIAMETER / -2) -+ CAMERA_MOUNT_THICKNESS + CAMERA_MOUNT_PLATE_LENGTH / -2, -53, CAMERA_MOUNT_HEIGHT / 2])
        rotate([-90, 0, 0])
        Cylindricalheadscrew(CLAMP_SCREW_HEAD_DIA, CLAMP_SCREW_DIA);
    }
}

module Clip() {
    difference() {
        difference() {
            cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER + CAMERA_MOUNT_THICKNESS);
            cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER);
        }

        translate([-50, -CAMERA_DIAMETER_DIFFERENCE, 0])
        cube(size = [100, 100, 100]);
    }

    difference() {
        translate([CAMERA_DIAMETER / 2, -CAMERA_MOUNT_THICKNESS, 0])
        cube(size = [CAMERA_MOUNT_PLATE_LENGTH + CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_HEIGHT], center = false);

        translate([(CAMERA_DIAMETER / 2) + CAMERA_MOUNT_THICKNESS + CAMERA_MOUNT_PLATE_LENGTH / 2, -53, CAMERA_MOUNT_HEIGHT / 2])
        rotate([-90, 0, 0])
        Cylindricalheadscrew(CLAMP_SCREW_HEAD_DIA, CLAMP_SCREW_DIA);
    }
    
    difference() {
        translate([(CAMERA_DIAMETER / -2) + -CAMERA_MOUNT_PLATE_LENGTH - CAMERA_MOUNT_THICKNESS, -CAMERA_MOUNT_THICKNESS, 0])
        cube(size = [CAMERA_MOUNT_PLATE_LENGTH + CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_THICKNESS, CAMERA_MOUNT_HEIGHT], center = false);

        translate([(CAMERA_DIAMETER / -2) -+ CAMERA_MOUNT_THICKNESS + CAMERA_MOUNT_PLATE_LENGTH / -2, -53, CAMERA_MOUNT_HEIGHT / 2])
        rotate([-90, 0, 0])
        Cylindricalheadscrew(CLAMP_SCREW_HEAD_DIA, CLAMP_SCREW_DIA);
    }
}

module Connector() {
    translate([0, (CAMERA_DIAMETER / -2) - CAMERA_MOUNT_THICKNESS / 2, CAMERA_MOUNT_HEIGHT / 2])
    rotate([90, 0 ,0])
    union() {
        cube(size = [EXTRUSION_WIDTH + EXTRUSION_MOUNT_HEIGHT * 2, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

        difference() {
            translate([EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_WIDTH / 2, 0, EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_HEIGHT / 2])
            rotate([0, 90, 0])
            cube(size = [EXTRUSION_HEIGHT, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

            translate([0, 0, 2 + EXTRUSION_HEIGHT / 2])
            rotate([0, 90, 0])
            linear_extrude(height = 100) 
            circle(d = EXTRUSION_SCREW_DIAMETER);
        }

        difference() {
            translate([EXTRUSION_MOUNT_HEIGHT / -2 + EXTRUSION_WIDTH / -2, 0, EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_HEIGHT / 2])
            rotate([0, 90, 0])
            cube(size = [EXTRUSION_HEIGHT, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

            translate([-50, 0, 2 + EXTRUSION_HEIGHT / 2])
            rotate([0, 90, 0])
            linear_extrude(height = 100) 
            circle(d = EXTRUSION_SCREW_DIAMETER);
        }
    }

    ClampHold();
}

translate([-100,0 ,0 ])
Clip();

Connector();
