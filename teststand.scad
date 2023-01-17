
$fn=100;
clearance=0.1;

x=48;
y=128;
h=5;

c_s=2;
c_h=10;
c_x=48;
c_y=52;

do_power=false;
do_mainboard=false;
do_motor=true;
do_limitswitch=false;
do_hotend=false;

// power module
if(do_power)
difference(){
    cube(size=[x, y, h], center=true);
    translate([0,0,1])
    cube(size=[x-1, y-1, h], center=true);
    
    translate([2,0,1])
    cube(size=[x-1, y-5, h], center=true);
    
    translate([-47,0,3])
    cube(size=[c_x, c_y, 5], center=true);
    
    for(i = [0:7]) {
        color("red")
        translate([0, (i*-9)+-5.5*i, 0])
        translate([c_x/2-12,c_y-3,-5])
        linear_extrude(10)
        circle(d = 6, $fn = 100);
    }
}

// mainboard module
mb_x=85.09;
mb_y=86.32;

if(do_mainboard)
translate([-100, 0, 0])
difference(){
    cube(size=[mb_x+1, mb_y+1, 22.5+1], center=true);
    translate([0,0,1])
    cube(size=[mb_x, mb_y, 22.5+1], center=true);
    
    translate([-30, 40, 0])
    cube(size=[24.5, 10, 15], center=true);
    
    translate([-40, -20, 0])
    cube(size=[24.5, 40, 15], center=true);
}

// hotend flsun module
hs_x=60;
hs_y=60;
hs_h=44;
hs_nh=23;
hs_th=9.5;
hs_nw=11;
ns_nh=11;

if(do_hotend)
translate([100, 0, 0])
difference(){
    cube(size=[hs_x+1, hs_y+1, hs_h+1], center=true);
    translate([0,0,1])
    cube(size=[hs_x, hs_y, hs_h], center=true);
    
    translate([0,-50,20-11])
    cube(size=[hs_nw, 100, ns_nh+20], center=true);
}

//limit switch module
ls_x=23;
ls_y=14;
ls_h=7.5;

if(do_limitswitch)
translate([0,-100,0])
difference(){
    cube(size=[ls_x+1, ls_y+1, ls_h+2.4], center=true);
    translate([0, 0, 1])
    cube(size=[ls_x, ls_y, ls_h+2.4], center=true);
    
    translate([0, 10, 2.5])
    cube(size=[10,7, 6], center=true);
    
    translate([0, -10, 2.5])
    cube(size=[13, 11, 6], center=true);
}        

// motor module
if(do_motor)
translate([0,100,0])
difference(){
    minkowski() {
        cube(size=[48, 48, 38], center=true);
        rotate([0,90,0]) 
        cylinder(h = 1, r = 1);
    }
    
    translate([3, 0, 0])
    cube(size=[50.1+clearance, 42.1+clearance, 35], center=true);
    
    translate([-16+25, 0, 21])
    cube(size=[45, 6, 60], center=true);
}