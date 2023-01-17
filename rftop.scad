
// coil size = [84, 35, 2]

difference(){
translate([0,0,-1])
difference(){
    cube(size=[52, 69, 5], center=true);
    translate([0,0,1])
    
    translate([0,-15,0])
    difference(){
        cube(size=[47, 35, 4], center=true);
        cube(size=[42, 29, 4], center=true);
    }
    translate([0,18,1])
    cube(size=[47  ,31,4], center=true);
    
    translate([0,0,3])
    cube(size=[500,500,1.5], center=true);
}
translate([0,0,-1]){
union(){
color("red")
    translate([0,-20,-3])
linear_extrude(0.6)

difference(){
    circle(d = 22, $fn = 100);
    circle(d = 20, $fn = 100);
}
}}

translate([-8.6,-27,-4])
scale([.06,.06,.06])
color("green") 
linear_extrude(height = 10) 
import(file = "wireless.svg");
}
