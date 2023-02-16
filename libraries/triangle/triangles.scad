
module triangle(o_len, a_len, depth, center=false, do_rounded=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth)
    {
        if(do_rounded)
            offset(r = a_len) 
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}

module a_triangle(tan_angle, a_len, depth, center=false)
{
    triangle(tan(tan_angle) * a_len, a_len, depth, center);
}

module rounded_triangle(tan_angle, a_len, depth, center=false) {
    triangle(tan(tan_angle) * a_len, a_len / 2, depth / 2, center, do_rounded = true);
}