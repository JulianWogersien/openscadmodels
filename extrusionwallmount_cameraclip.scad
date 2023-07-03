
$fn = $preview ? 100 : 500;

MIDDLE_HEIGHT = 30;
MIDDLE_INSET_HEIGHT = 14;
MIDDLE_INNER_DIAM = 51.2;
MIDDLE_OUTER_DIAM = 72;
MIDDLE_INSET = 10;
TOTAL_HEIGHT = 30;

HOLDER_CUBE_SIZE = [90, 90, MIDDLE_HEIGHT - 5];

CONNECTOR_DEPTH = 20;

BEAM_WIDTH = 40;
BEAM_DEPTH = 20;

SCREW_TAIL_DIAM = 4.9;
SCREW_HEAD_DIAM = 8.5;

SCREWCLAMP_HEAD_DIAM = 7.2;
SCREWCLAMP_TAIL_DIAM = 4;

module Cylindricalheadscrew(head_diameter, tail_diameter) {
    union() {
        linear_extrude(height = 1000) 
        circle(d = tail_diameter);
        translate([0, 0, 0])
        linear_extrude(height = 500) 
        circle(d = head_diameter);
    }
}

module Top() {
    translate([-1.5, 0.81, -TOTAL_HEIGHT / 2])
    difference() {
        translate([-35, -45, 0])
        import(file = "30mm.STL", center = true, convexity = 10);
        cube(size = [505, 505, 30], center = true);
    }
}

module Bottom() {
    translate([-1.5, 0.81, -TOTAL_HEIGHT / 2])
    difference() {
        translate([-35, -45, 0])
        import(file = "30mm.STL", center = true, convexity = 10);
        translate([0, 0, 30])
        cube(size = [505, 505, 30], center = true);
    }
}

module Middle() {
    rotate_extrude($fn=100) 
    translate([(MIDDLE_OUTER_DIAM - (MIDDLE_OUTER_DIAM - MIDDLE_INNER_DIAM) / 2) / 2, 0])
    difference() {
        square(size = [(MIDDLE_OUTER_DIAM - MIDDLE_INNER_DIAM) / 2, MIDDLE_HEIGHT], center = true);
        translate([MIDDLE_OUTER_DIAM - MIDDLE_INNER_DIAM - MIDDLE_INSET * 1.5, 0])
        square(size = [MIDDLE_INSET, MIDDLE_INSET_HEIGHT], center = true);
    }
}

module CameraPart() {
    translate([0, 0, TOTAL_HEIGHT / 2])
    Top();
    Middle();
    translate([0, 0, TOTAL_HEIGHT / -2])
    Bottom();
}

module Holder(direction = "left") {
    difference() {
        if(direction == "right") {
            translate([(HOLDER_CUBE_SIZE[0] / -2) / -2, (HOLDER_CUBE_SIZE[1] / -2) + CONNECTOR_DEPTH / -2, 0])
            cube(size = [HOLDER_CUBE_SIZE[0] / 2, CONNECTOR_DEPTH, HOLDER_CUBE_SIZE[2]], center = true);
        } else {
            translate([(HOLDER_CUBE_SIZE[0] / -2) / 2, (HOLDER_CUBE_SIZE[1] / -2) + CONNECTOR_DEPTH / -2, 0])
            cube(size = [HOLDER_CUBE_SIZE[0] / 2, CONNECTOR_DEPTH, HOLDER_CUBE_SIZE[2]], center = true);

            difference() { 
                translate([(HOLDER_CUBE_SIZE[0] / -2) - BEAM_DEPTH / -2, ((HOLDER_CUBE_SIZE[1] / -2) - ((BEAM_DEPTH + CONNECTOR_DEPTH) / 2) - CONNECTOR_DEPTH), 0])
                cube(size = [BEAM_DEPTH, (BEAM_DEPTH + CONNECTOR_DEPTH), HOLDER_CUBE_SIZE[2]], center = true);

                translate([-530, (HOLDER_CUBE_SIZE[1] / -2) - ((BEAM_DEPTH + CONNECTOR_DEPTH) / 4) - CONNECTOR_DEPTH, 0])
                rotate([0, 90, 0])
                Cylindricalheadscrew(head_diameter = SCREWCLAMP_HEAD_DIAM, tail_diameter = SCREWCLAMP_TAIL_DIAM);
            }

            difference() {
                translate([0, ((HOLDER_CUBE_SIZE[1] / -2) + (-CONNECTOR_DEPTH) - BEAM_DEPTH) + CONNECTOR_DEPTH / -2, 0])
                cube(size = [HOLDER_CUBE_SIZE[0], CONNECTOR_DEPTH, HOLDER_CUBE_SIZE[2]], center = true);

                translate([-15, -590, 0])
                rotate([-90, 0, 0])
                Cylindricalheadscrew(head_diameter = SCREWCLAMP_HEAD_DIAM, tail_diameter = SCREWCLAMP_TAIL_DIAM);
                
                translate([5, -590, 0])
                rotate([-90, 0, 0])
                Cylindricalheadscrew(head_diameter = SCREWCLAMP_HEAD_DIAM, tail_diameter = SCREWCLAMP_TAIL_DIAM);      
            }
        }

        translate([-400, (HOLDER_CUBE_SIZE[1] / 2) - 10, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = SCREW_HEAD_DIAM, tail_diameter = SCREW_TAIL_DIAM);

        translate([-505, (HOLDER_CUBE_SIZE[1] / -2) - CONNECTOR_DEPTH / 2, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = SCREW_HEAD_DIAM, tail_diameter = SCREW_TAIL_DIAM);
    }
}

module FullHolderPart() {
    difference() {
        cube(size = HOLDER_CUBE_SIZE, center = true);
        Middle();
        translate([0, 0, -MIDDLE_HEIGHT])
        cylinder(h = 100, d = MIDDLE_INNER_DIAM + 1);

        translate([-505, (HOLDER_CUBE_SIZE[1] / 2) - 10, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = SCREW_HEAD_DIAM, tail_diameter = SCREW_TAIL_DIAM);

        translate([-540, (HOLDER_CUBE_SIZE[1] / -2) - CONNECTOR_DEPTH / 2, 0])
        rotate([0, 90, 0])
        Cylindricalheadscrew(head_diameter = SCREW_HEAD_DIAM, tail_diameter = SCREW_TAIL_DIAM);
    }
}

module HolderPartLeft() {
    difference() {
        FullHolderPart();
        
        translate([(HOLDER_CUBE_SIZE[0] / 2), 0, 0])
        cube(size = HOLDER_CUBE_SIZE, center = true);
    }

    Holder();
}

module HolderPartRight() {
    difference() {
        FullHolderPart();
        
        translate([HOLDER_CUBE_SIZE[0] / -2, 0, 0])
        cube(size = HOLDER_CUBE_SIZE, center = true);
    }

    Holder(direction = "right");
}

module PrintableHolder(tr = true) {
    HolderPartLeft();
    if(tr == true) {
        translate([5, -30, 0])
        HolderPartRight();
    } else {
        HolderPartRight();
    }
}

module PrintableHolder2() {
    difference() {
        PrintableHolder(tr = false);
        translate([65, -5, 0])
        cube(size = [120, 120, 120], center = true);
    }

    translate([5, 0, 0])
    difference() {
        PrintableHolder(tr = false);
        translate([-55, -5, 0])
        cube(size = [120, 120, 120], center = true);
        translate([0, -125, 0])
        cube(size = [120, 120, 120], center = true);
    }
}

PrintableHolder2();
