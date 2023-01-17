 
difference(){

    cube(size=[120,120,1], center=true);

    union(){
        translate([-50,50,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
    
        translate([50,-50,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
        
        translate([-50,-50,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
    
        translate([50,50,-5])
        linear_extrude(100)
        circle(d=5, $fn=100);
    }
}

translate([30,0,12])
cube(size=[20, 20, 23], center=true);

translate([-15,0,34])
cube(size=[110, 20, 21], center=true);