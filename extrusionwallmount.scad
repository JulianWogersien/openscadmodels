
$fn = $preview ? 100 : 1000;

EXTRUSION_PLATE_WIDTH = 40;
EXTRUSION_PLATE_DEPTH = 20;
EXTRUSION_PLATE_HEIGHT = 20;
EXTRUSION_PLATE_HEIGHT_OUTSET = 10;
HOLE_DIAMETER = 4.2;

WALL_MOUNT_ADAPTER_WIDTH = 20;
WALL_MOUNT_ADAPTER_DEPTH = 20;
WALL_MOUNT_ADAPTER_HEIGHT = 10;
WALL_MOUNT_ADAPTER_CIRCLE_DIAMETER = 4;

ARM_WIDTH = 200;
ARM_HEIGHT = 20;
ARM_DEPTH = 20;
DIAGONAL = sqrt(ARM_WIDTH * ARM_WIDTH + ARM_WIDTH * ARM_WIDTH);

difference() {
    union() {
        translate([0, (ARM_WIDTH / 2) + ARM_DEPTH / 2, (ARM_DEPTH / 2) - 1.25])
        rotate([0, 0, 90])
        cube(size = [ARM_WIDTH, ARM_DEPTH, ARM_HEIGHT], center = true);

        translate([0, (ARM_WIDTH) + ARM_DEPTH / 2, (ARM_WIDTH / -2) + 16])
        rotate([0, 90, 0])
        cube(size = [ARM_WIDTH + 5, ARM_DEPTH, ARM_HEIGHT], center = true);

        translate([0, 5 + (ARM_WIDTH / 2) + ARM_DEPTH / 2, 6 + -ARM_WIDTH / 2])
        rotate([0, 45, 90])
        cube(size = [DIAGONAL - 6, ARM_DEPTH, ARM_HEIGHT], center = true);
    
        difference() {
            union() {
                translate([ARM_DEPTH, ARM_WIDTH + 15 ,0])
                rotate([90, 0, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH, WALL_MOUNT_ADAPTER_DEPTH, WALL_MOUNT_ADAPTER_HEIGHT], center = true);

                translate([(ARM_DEPTH / 1.5) - 0.5, ARM_WIDTH + 15 , -WALL_MOUNT_ADAPTER_HEIGHT -3])
                rotate([90, 45, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH , sqrt(2 * WALL_MOUNT_ADAPTER_DEPTH^2 ), WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            }

            translate([ARM_DEPTH, ARM_WIDTH + 30 ,0])
            rotate([90, 0 ,0])
            linear_extrude(height = 100) 
            circle(d = WALL_MOUNT_ADAPTER_CIRCLE_DIAMETER);
        }

        difference() {
            union() {
                translate([-ARM_DEPTH, ARM_WIDTH + 15 ,0])
                rotate([90, 0, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH, WALL_MOUNT_ADAPTER_DEPTH, WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            
                translate([(ARM_DEPTH / -1.5) + 0.5, ARM_WIDTH + 15 , -WALL_MOUNT_ADAPTER_HEIGHT -3])
                rotate([90, -45, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH , sqrt(2 * WALL_MOUNT_ADAPTER_DEPTH^2 ), WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            }

            translate([-ARM_DEPTH, ARM_WIDTH + 30 ,0])
            rotate([90, 0 ,0])
            linear_extrude(height = 100) 
            circle(d = WALL_MOUNT_ADAPTER_CIRCLE_DIAMETER);
        }

        difference() {
            union() {
                translate([ARM_DEPTH, ARM_WIDTH + 15 , -100])
                rotate([90, 0, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH, WALL_MOUNT_ADAPTER_DEPTH, WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            
                translate([(ARM_DEPTH / 1.5) - 0.5, ARM_WIDTH + 15 , -100 + -WALL_MOUNT_ADAPTER_HEIGHT -3])
                rotate([90, 45, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH , sqrt(2 * WALL_MOUNT_ADAPTER_DEPTH^2 ), WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            }

            translate([ARM_DEPTH, ARM_WIDTH + 30 , -100])
            rotate([90, 0 ,0])
            linear_extrude(height = 100) 
            circle(d = WALL_MOUNT_ADAPTER_CIRCLE_DIAMETER);
        }

        difference() {
            union() {
                translate([-ARM_DEPTH, ARM_WIDTH + 15 , -100])
                rotate([90, 0, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH, WALL_MOUNT_ADAPTER_DEPTH, WALL_MOUNT_ADAPTER_HEIGHT], center = true);

                translate([(ARM_DEPTH / -1.5) + 0.5, ARM_WIDTH + 15 , -100 + -WALL_MOUNT_ADAPTER_HEIGHT -3])
                rotate([90, -45, 0])
                cube(size = [WALL_MOUNT_ADAPTER_WIDTH , sqrt(2 * WALL_MOUNT_ADAPTER_DEPTH^2 ), WALL_MOUNT_ADAPTER_HEIGHT], center = true);
            }

            translate([-ARM_DEPTH, ARM_WIDTH + 30 , -100])
            rotate([90, 0 ,0])
            linear_extrude(height = 100) 
            circle(d = WALL_MOUNT_ADAPTER_CIRCLE_DIAMETER);
        }
    }
    
    translate([0, 30 ,10])
    cube(size = [EXTRUSION_PLATE_WIDTH, EXTRUSION_PLATE_WIDTH, EXTRUSION_PLATE_HEIGHT], center = true);

    translate([0, 20 ,-40])
    linear_extrude(height = 100) 
    circle(d = HOLE_DIAMETER);

    translate([0, 40 ,-40])
    linear_extrude(height = 100) 
    circle(d = HOLE_DIAMETER);

    translate([0, 20 ,-20])
    linear_extrude(height = 10) 
    circle(d = HOLE_DIAMETER + 1);

    translate([0, 40 ,-20])
    linear_extrude(height = 10) 
    circle(d = HOLE_DIAMETER + 1);
}