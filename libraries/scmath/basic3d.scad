
// generates a line between given xyz points with thickness
module line3d(x1, y1, z1, x2, y2, z2, thickness) {
    length = norm([x2, y2, z2]);
    b = acos(z2 / length);
    c = atan2(y2, x2);

    translate([x1, y1, z1]) 
    rotate([0, b, c])
        cylinder(h = length, r = thickness);
}

// generates a tetrahedron
module tetrahedron(size = [1, 1, 1]) {
    a = 1 / 3;
    b = sqrt(8 / 9);
    c = sqrt(2 / 9);
    d = sqrt(2 / 3);

    vertices = [[0, 0, 1], [-c, d, -a], [-c, -d, -a], [b, 0, -a]];
    faces = [[0, 1, 2], [0, 2, 3], [0, 3, 1], [3, 2, 1]];
    polyhedron(vertices, faces);
}