use<list.scad>

// gets all faces that share given vertex
function get_faces_with_vertex(mesh, vertex) = let(idx = for(v = [0:len(mesh[0])]) if(v == vertex) v) [for(i = mesh[1]) if(do_any_match(i, idx)) i];

// finds the centroid of given face from mesh
function centroid(mesh, face) = let(face_indices = mesh[1][face], sum = [0, 0, 0] for (i = face_indices) sum += mesh[0][i], num_vertices = len(face_indices), avg = sum / num_vertices) avg;

// projects the vertices of given mesh to a unit sphere (essentially making their size 1, 1, 1 )
function project_to_unit_sphere(mesh) = 
    [[
        for(v = [0:len(mesh[0])])
            let(p = mesh[0][v], n = norm(p))
            (1 / n) * p
     ], 
    mesh[1]];
