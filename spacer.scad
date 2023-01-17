module hole(amount, hole_increase, d_increase) {
    diameter=10;
    hole=3.1;
    
    for(x = [0:amount]) {
        for(j = [0:amount])
            translate([x*20.5,j*20.5,0]){
            difference() {
                linear_extrude(height=10, center=true, convexity=5, scale=2)
                circle(d = diameter);
                cylinder(h = 10, d = hole, center=true);
            }
        }
    }
}

$fn=50;
rotate([180,0,0])
hole(2, 0.0, 0.0);