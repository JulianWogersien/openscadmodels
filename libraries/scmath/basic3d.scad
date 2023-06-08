use<vec.scad>
use<mesh.scad>
use<list.scad>

/*
// generates the dual polyhedron of given mesh of triangles
// a dual polyhedron can be defined as for each convex polyhedron there is a dual polyhedron with a face for each vertex and a vertex for each face
function fdual_polyhedron(mesh) = 
    let(
        
    )
        [tmp_vertices, tmp_faces];*/
   

// generates a tetrahedron (four vertices and four triangular faces)
function ftetrahedron() =
    let (
        // coordinates on unit sphere
        a = 1 / 3,
        b = sqrt(8 / 9),
        c = sqrt(2 / 9),
        d = sqrt(2 / 3),
        
        vertices = [[0, 0, 1], [-c, d, -a], [-c, -d, -a], [b, 0, -a]],
        indices = [[0, 1, 2], [0, 2, 3], [0, 3, 1], [3, 2, 1]]
    ) [vertices, indices];

// generate a hexahedron (8 vertices & 6 quadrilateral faces)
function fhexahedron() = 
    let(
        // coordinates on unit sphere
        a = 1.0 / sqrt(3.0),

        vertices = [[-a, -a, -a], [a, -a, -a], [a, a, -a], [-a, a, -a], [-a, -a, a], [a, -a, a], [a, a, a], [-a, a, a]],
        indices = [[3, 2, 1, 0], [2, 6, 5, 1], [5, 6, 7, 4], [0, 4, 7, 3], [3, 7, 6, 2], [1, 5, 4, 0]]
    ) [vertices, indices];

// generates a octahedron
/*function foctahedron() = 
    project_to_unit_sphere(fdual_polyhedron(fhexahedron()));*/

// generates a line between given xyz points with optional thickness
module line3d(x1, y1, z1, x2, y2, z2, thickness = 0.1) {
    length = norm([x2, y2, z2]);
    b = acos(z2 / length);
    c = atan2(y2, x2);

    translate([x1, y1, z1]) 
    rotate([0, b, c])
        cylinder(h = length, r = thickness);
}

// generates and displays a tetrahedron (four vertices and four triangular faces) at given (optional) size
module tetrahedron(size = [1, 1, 1]) {
    mesh = ftetrahedron();

    if(size != [1, 1, 1]) {
        resize(size)
        polyhedron(mesh[0], mesh[1]);
    } else {
        polyhedron(mesh[0], mesh[1]);
    }
}

// generate and displays a hexahedron (8 vertices & 6 quadrilateral faces)
module hexahedron(size = [1, 1, 1]) {
    mesh = fhexahedron();

    if(size != [1, 1, 1]) {
        resize(size)
        polyhedron(mesh[0], mesh[1]);
    } else {
        polyhedron(mesh[0], mesh[1]);
    }
}

// generates and displays a dual polyhedron of given mesh of triangles
// a dual polyhedron can be defined as for each convex polyhedron there is a dual polyhedron with a face for each vertex and a vertex for each face
/*module dual_polyhedron(mesh) {
    polyhedron(fdual_polyhedron(mesh));
}*/

// generates and displays a octahedron at optionally given size
/*module octahedron(size = [1, 1, 1]) {
    mesh = foctahedron();
    echo(mesh);
    if(size != [1, 1, 1]) {
        resize(size)
        polyhedron(mesh[0], mesh[1]);
    } else {
        polyhedron(mesh[0], mesh[1]);
    }
}*/

module catmull_clark(mesh) {
    face_points = [for(face = [0:len(mesh[1])-1]) centroid(mesh, face)];
    face_size = len(mesh[1][0])-1;

    edge_points = [for(i = [0:len(mesh[0])]) i];
    for()
}