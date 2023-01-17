
difference(){
    cube(size=[58, 75, 7.6], center=true);
    translate([0,0,2])
    cube(size=[53,70,6], center=true);
    translate([0,10,-5])
    cube(size=[53, 50, 10], center=true);
    translate([0,0,0])
    cube(size=[14,52,10], center=true);
}
translate([0,10,-13]){
difference(){
    cube(size=[58, 55, 24], center=true);
    translate([0,0,2])
    cube(size=[52, 47, 20], center=true);
    translate([26,20,0])
    cube(size=[8,6,5], center=true);
}
} 
