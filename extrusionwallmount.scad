
$fn = $preview ? 100 : 1000;

EXTRUSION_PLATE_WIDTH = 40;
EXTRUSION_PLATE_DEPTH = 20;
EXTRUSION_PLATE_HEIGHT = 2.5;
HOLE_DIAMETER = 4.2;

ARM_WIDTH = 200;
ARM_HEIGHT = 20;
ARM_DEPTH = 20;
DIAGONAL = sqrt(200 * 200 + 200 * 200);

difference() {
    cube(size = [EXTRUSION_PLATE_WIDTH, EXTRUSION_PLATE_DEPTH, EXTRUSION_PLATE_HEIGHT], center = true);

    translate([EXTRUSION_PLATE_WIDTH / 4, 0, -5])
    linear_extrude(height = 10) 
    circle(d = 4.2);

    translate([EXTRUSION_PLATE_WIDTH / -4, 0, -5])
    linear_extrude(height = 10) 
    circle(d = 4.2);

}

translate([0, (EXTRUSION_PLATE_DEPTH / 2) - EXTRUSION_PLATE_HEIGHT / 2, (EXTRUSION_PLATE_DEPTH / 2) - EXTRUSION_PLATE_HEIGHT / 2])
rotate([90, 0, 0]) 
cube(size = [EXTRUSION_PLATE_WIDTH, EXTRUSION_PLATE_DEPTH, EXTRUSION_PLATE_HEIGHT], center = true);

translate([0, (ARM_WIDTH / 2) + ARM_DEPTH / 2, (ARM_DEPTH / 2) - 1.25])
rotate([0, 0, 90])
cube(size = [ARM_WIDTH, ARM_DEPTH, ARM_HEIGHT], center = true);

translate([0, (ARM_WIDTH) + ARM_DEPTH / 2, (ARM_WIDTH / -2) + 16])
rotate([0, 90, 0])
cube(size = [ARM_WIDTH + 5, ARM_DEPTH, ARM_HEIGHT], center = true);

translate([0, 5 + (ARM_WIDTH / 2) + ARM_DEPTH / 2, 6 + -ARM_WIDTH / 2])
rotate([0, 45, 90])
cube(size = [DIAGONAL - 6, ARM_DEPTH, ARM_HEIGHT], center = true);
