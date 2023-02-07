

difference(){
    cube(size=[10,10,8.5], center=true);
    
    translate([0,0,-5])
    linear_extrude(10)
    circle(d=5.3, $fn=1000);
}