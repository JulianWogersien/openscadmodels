use<libraries/gridfinity/gridfinity-rebuilt-bins.scad>

difference() {
    union() {
        gridfinityInit(gx = 1, gy = 1, h = 35, l = 42);
        gridfinityBase(1, 1, 42, 1, 1, 1);
    }
    
    translate([0, 0, 10])
    linear_extrude(height = 45) 
    circle(d = 40);
}

