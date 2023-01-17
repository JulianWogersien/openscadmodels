font = "Noto Sans:style=Bold";
letter_size = 40;
height = 10;

string = "lo";
textlen = len(string);

difference(){
cube(size=[70,70,1], center=true);
    
    translate([-40,-40,0]){
    for(j=[1,2,3,4,5,6,7]){
    for(i=[1,2,3,4,5,6,7]){
        translate([10*i,10*j,0])
        linear_extrude(height=10, center=true, convexity=10, twist=0)
        circle(4);
    }}}
}

linear_extrude(height) {
    difference() {
        offset(r=-1) {
            text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
        }

        offset(r=-2) {
            text(string, size = letter_size, font = font, halign = "center", valign = "center", $fn = 64);
       }
    }
}
