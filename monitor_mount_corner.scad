
// 107mm with both holes
// hole ~7mm
// monitor size 360
// size between monitorhalter 85.2
$fn = 100;

thickness_total = 20;
corner_radius = 5;
thickness = thickness_total - corner_radius;

minkowski() {
    union() {
        cube(size = [85.2, thickness, thickness], center = true);
        translate([0, 0, 40]) 
        cube(size = [thickness, thickness, 60], center = true);
    }
    sphere(r = corner_radius);
}