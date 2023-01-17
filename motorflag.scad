
clearance=0.05;

difference() {
    cube(size = [7,7,2], center=true);

    translate([0, 0, -5]) 
    linear_extrude(height = 10)
    circle(d = 5+clearance, $fn=100);
}

color("green")
translate([2.5,0,0]) 
cube(size = [1,5,2], center=true);

translate([5+5/2, 0, 0]) 
cube(size = [10,7,2], center=true);