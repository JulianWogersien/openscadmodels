

usb_x = 5.4;
usb_y = 13.2;
usb_z = 9;

difference() {
    cube(size = [usb_x + 2, usb_y + 1, 50], center = true);

    translate([0, 0, -23]) 
    cube(size = [usb_x, usb_y, usb_z], center = true);
    
    translate([4, 0, -21.5])
    cube(size = [3, ((usb_y / 100) * 90), 6], center = true);
}