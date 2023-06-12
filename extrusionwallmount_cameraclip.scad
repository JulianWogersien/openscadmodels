
$fn = $preview ? 100 : 500;

CAMERA_DIAMETER_DIFFERENCE = 0.05;
CAMERA_DIAMETER = 58;
SCREW_DIAMETER = 3;
EXTRUSION_SCREW_DIAMETER = 3.5;

EXTRUSION_MOUNT_HEIGHT = 2.5;
EXTRUSION_MOUNT_DEPTH = 20;
EXTRUSION_WIDTH = 20;
EXTRUSION_HEIGHT = 20;

CAMERA_MOUNT_HEIGHT = 10;
CAMERA_MOUNT_THICKNESS = 3;

union() {
    cube(size = [EXTRUSION_WIDTH + EXTRUSION_MOUNT_HEIGHT * 2, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

    difference() {
        translate([EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_WIDTH / 2, 0, EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_HEIGHT / 2])
        rotate([0, 90, 0])
        cube(size = [EXTRUSION_HEIGHT, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

        translate([0, 0, EXTRUSION_HEIGHT / 2])
        rotate([0, 90, 0])
        linear_extrude(height = 100) 
        circle(d = EXTRUSION_SCREW_DIAMETER);
    }

    difference() {
        translate([EXTRUSION_MOUNT_HEIGHT / -2 + EXTRUSION_WIDTH / -2, 0, EXTRUSION_MOUNT_HEIGHT / 2 + EXTRUSION_HEIGHT / 2])
        rotate([0, 90, 0])
        cube(size = [EXTRUSION_HEIGHT, EXTRUSION_MOUNT_DEPTH, EXTRUSION_MOUNT_HEIGHT], center = true);

        translate([-50, 0, EXTRUSION_HEIGHT / 2])
        rotate([0, 90, 0])
        linear_extrude(height = 100) 
        circle(d = EXTRUSION_SCREW_DIAMETER);
    }
}

difference() {
    difference() {
        cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER + CAMERA_MOUNT_THICKNESS);
        cylinder(h = CAMERA_MOUNT_HEIGHT, d = CAMERA_DIAMETER);
    }
    translate([-50, -CAMERA_DIAMETER_DIFFERENCE, 0])
    cube(size = [100, 100, 100]);
}
