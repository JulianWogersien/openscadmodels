
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

module regular_hexagon(side_length) {
  r = side_length * sqrt(3) / 2;

  points = [    [r, 0],
    [r / 2, side_length * 0.86602540378],
    [-r / 2, side_length * 0.86602540378],
    [-r, 0],
    [-r / 2, -side_length * 0.86602540378],
    [r / 2, -side_length * 0.86602540378]
  ];

  polygon(points);
}