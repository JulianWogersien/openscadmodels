module triangle(o_len, a_len, depth, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module a_triangle(tan_angle, a_len, depth, center=false)
{
    triangle(tan(tan_angle) * a_len, a_len, depth, center);
}

module clip_bottom(x, y, z, l, t, w)
{
    translate([x, y, z]){
        cube(size=[w, l, 10], center=true);
        rotate([0, -90, -90]) translate([4.5, -0.3, t        ])
        a_triangle(51, 2, l);
    }
}

wt = 6;

difference(){
    union(){
        for(i=[0, 90, 180, 270]){
            rotate([0,0,i])
            clip_bottom(40, 0, 7.5, 8, 
            -4, 2);
        }
        cube(size=[80 + wt, 80 + wt, 13], center=true);
    }
    translate([0, 0, 3]){
        translate([0,0,3])
        cube(size=[80, 80, 18], center=true);
    }
}

translate([90, 0, 0]){
    rotate([180,0,0]){
    difference(){
        cube(size=[80 + wt, 80 + wt, 13], center=          true);
        
        union(){
            translate([0, 0, -5]){
                cube(size=[80, 80, 18], center=true);
            }
            for(i=[0, 90, 180, 270]){
                rotate([0,0,i])
                clip_bottom(40, 0, -5, 10, -5, 3);
            }
            color("red")
            translate([-40, 23,1]){
                cube(size=[15, 28-4, 7-3], center=true);
            }
            color("red")
            translate([-40, -20,1]){
                cube(size=[15, 28-4, 7-3], center=true);
            }
        }
        }
    }
}