
dist_x = 15;
dist_y = 15;
height = 120;
beam_dim = 3;
length_beam = sqrt((dist_x * dist_x) + (dist_y * dist_y));
outerbeam_dim = 4;

cube(size = [outerbeam_dim, outerbeam_dim, height], center = true);
translate([dist_x, 0, 0]) 
cube(size = [outerbeam_dim, outerbeam_dim, height], center = true);
translate([0, dist_y, 0]) 
cube(size = [outerbeam_dim, outerbeam_dim, height], center = true);
translate([dist_x, dist_y, 0]) 
cube(size = [outerbeam_dim, outerbeam_dim, height], center = true);

x = [0, 15, 15, 0];
y = [0, 0, 15, 15];
j = [90, 180, 270, 360];
colors = ["red", "blue", "green", "yellow"];
difference() {
    union() {
        for(k = [0:3]) {
            color(colors[k])
            translate([x[k], y[k], (height / -2) + dist_y / 2])
            rotate([0, 0, j[k]])
            for(i = [0:10:height - 10]) {
                num = i / 10;
                rotation = num % 2 == 0 ? 45 : -45; 
                translate([dist_x / 2, 0, i]) 
                rotate([0, rotation, 0])
                cube(size = [beam_dim, beam_dim, length_beam], center = true);
            }
        }
    }
    
    translate([0, 0, (height / 2) + 5])
    cube(size = [100, 100, 10], center = true);
}

union() {
    translate([0, dist_y / 2, height / -2])
    rotate([90, 0, 0])
    cube(size =[outerbeam_dim, outerbeam_dim, dist_x + 3], center = true);

    translate([dist_x, dist_y / 2, height / -2])
    rotate([90, 0, 0])
    cube(size =[outerbeam_dim, outerbeam_dim, dist_x + 3], center = true);

    translate([dist_x / 2, 0, height / -2])
    rotate([90, 90, 90])
    cube(size =[outerbeam_dim, outerbeam_dim, dist_x + 3], center = true);

    translate([dist_x / 2, dist_y, height / -2])
    rotate([90, 90, 90])
    cube(size =[outerbeam_dim, outerbeam_dim, dist_x + 3], center = true);
}