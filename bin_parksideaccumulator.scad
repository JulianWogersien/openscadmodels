use<libraries/gridfinity/gridfinity-rebuilt-bins.scad>

difference() {
    union() {
        gridfinityInit(gx = 2, gy = 2, h = 35, l = 42);
        gridfinityBase(2, 2, 42, 1, 1, 1);
    }
    
    translate([0, 0, 10])
    linear_extrude(height = 45) 
    circle(d = 42);
}

