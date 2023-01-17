
rail_length = 90;
rail_distance = 90;

bottomrail_width = 11;
bottomrail_width_actual = 16;
bottomrail_height = 2.5;
bottomrail_height_actual = 8;

toprail_width = 20.5;
toprail_height = 7.2;
toprail_height_actual = 10;
toprail_width_actual = 22;

translate([0, 0, 5.7])
translate([-20, 0, -0.5])
difference() {
    cube(size = [toprail_width_actual, rail_length, toprail_height_actual], center = true);

    cube(size = [toprail_width, rail_length, toprail_height], center = true);
    
    translate([0, 0, 3]) 
    cube(size = [toprail_width / 3, rail_length, toprail_height + 2], center = true);
}

difference() {
    cube(size = [bottomrail_width_actual, rail_length, bottomrail_height_actual], center = true);

    cube(size = [bottomrail_width, rail_length, bottomrail_height], center = true);
    
    translate([0, 0, 3]) 
    cube(size = [(bottomrail_width / 3) + 0.4, rail_length, bottomrail_height + 2], center = true);
}

translate([0, 0, 5.7])
translate([-20, 42.5, -10])
rotate([0, 0, 90]) 
union() {
    cube(size = [bottomrail_width - 0.5, 5, bottomrail_height - 0.9 ], center = true);
    
    translate([0, 0, 2.6]) 
    cube(size = [(bottomrail_width / 3) - 0.5, 5, bottomrail_height  + 3 - 0.7], center = true);
}

translate([0, 0, 5.7])
translate([-20, -42.5, -10])
rotate([0, 0, 90]) 
union() {
    cube(size = [bottomrail_width - 0.5, 5, bottomrail_height - 0.9], center = true);
    
    translate([0, 0, 2.6]) 
    cube(size = [(bottomrail_width / 3) - 0.5, 5, bottomrail_height  + 3 - 0.7], center = true);
}