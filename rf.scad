
// coil size = [84, 35, 2]

difference(){
translate([0,0,-1])
difference(){
    cube(size=[52, 69, 4], center=true);
    translate([0,0,1])
    
    translate([0,-15,0])
    difference(){
        cube(size=[47, 35, 4], center=true);
        cube(size=[42, 29, 4], center=true);
    }
    translate([0,18,1])
    cube(size=[47  ,31,4], center=true);
    
}
union(){
color("red")
    translate([0,-20,-3])
linear_extrude(0.9)

difference(){
    circle(d = 21, $fn = 100);
    circle(d = 20, $fn = 100);
}
}

translate([-8.6,-27,-3])
scale([.06,.06,.06])
color("green") 
linear_extrude(height = 5) 
import(file = "wireless.svg");
}

translate([70,0,22]){
difference(){
    cube(size=[58, 75, 5], center=true);
    translate([0,0,1])
    cube(size=[53,70,4], center=true);
    translate([0,10,-5])
    cube(size=[53, 50, 10], center=true);
    translate([0,0,0])
    cube(size=[10,50,10], center=true);
}
translate([0,10,-13]){
difference(){
    cube(size=[58, 55, 24], center=true);
    translate([0,0,2])
    cube(size=[52, 49, 20], center=true);
    translate([26,20,0])
    cube(size=[8,5,5], center=true);
}}
}