
module line(x1, y1, x2, y2, thickness, round = true) {
    if(round == true) {
        hull() {
            translate([x1, y1, 0]) 
            circle(r = thickness);
            translate([x2, y2, 0])
            circle(r = thickness);
        }
    }
}