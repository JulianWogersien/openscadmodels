use <list.scad>
use <mat.scad>
use <miscellaneous.scad>
use <vec.scad>

// gets all faces that share given vertex
function get_faces_with_vertex(mesh, vertex) =
    let(idx = [for (v = [0:len(mesh[0])]) if (v == vertex)
            v][0])[for (i = mesh[1]) if (do_any_match(i, idx)) i];

// finds the centroid of given face from mesh
function centroid(mesh,
                  face) = let(face_indices = mesh[1][face],
                              vertices = [for (f = face_indices) mesh[0][f]],
                              sum = vec3listsum(list = vertices),
                              num_vertices = len(vertices) - 1,
                              avg = sum / num_vertices) avg;

// projects the vertices of given mesh to a unit sphere (essentially making
// their size 1, 1, 1 )
function project_to_unit_sphere(mesh) = [
    [for (v = [0:len(mesh[0]) - 1]) let(p = mesh[0][v], n = norm(p))(1 / n) *
        p],
    mesh[1]
];

// applies given transformation matrix to the mesh
function apply_transform_to_mesh(mesh, matrix) =
    [ [for (v = mesh[0]) transform_vec3bymat3(v, matrix)], mesh[1] ];

// translates given mesh to given vec3 target
function translate_mesh(mesh, target) =
    [ [for (v = mesh[0]) vec3add(v, target)], [mesh[1]] ];

// rotates given mesh by given x y z rotation
function rotate_mesh3(mesh,
                      x,
                      y,
                      z) = apply_transform_to_mesh(mesh, rotationmat3(x, y, z));

// scales mesh by given x y z coordinates
function scale_mesh3(mesh,
                     x,
                     y,
                     z) = apply_transform_to_mesh(mesh, scalemat3(x, y, z));

function find_face_id_in_mesh(mesh, face) = search(face, mesh[1])[0];

// simply divides each face of the mesh into smaller ones note: may break for non triangle faces because im lazy and will definitely break if you have a mix of triangular and non triangular faces because im lazy and this thing is bad enough as is
function simple_subdivision(mesh) = let(
    face_size = len(mesh[1][0]) - 1,
    are_triangles = face_size == 2,
    err = echo(are_triangles),
    centroids = [for (face = [0:len(mesh[1]) - 1]) centroid(mesh, face)],
    midpoints = dflatten(
        [for (f = [0:len(mesh[1]) - 1])
                let(face = mesh[1][f],
                    centroid = centroid(mesh, f),
                    v = [for (i = [0:1:len(face) - 1])
                            let(secondary = len(face) == i ? 0 : i + 1)
                                vec3sub(mesh[0][secondary], mesh[0][i])],
                    va = dflatten(v, 1)) va],
        1),
    original_len_vertices = len(mesh[0]) - 1,
    vertices_tmp = concat(mesh[0], centroids),
    vertices_actual = !are_triangles ? concat(vertices_tmp, midpoints)
                                     : vertices_tmp,
    centroid_position = (len(mesh[0]) - 1) - (len(centroids) - 1),
    new_faces = dflatten(
        l = [for (i = [0:(len(mesh[1]) - 1) * 4])
                     let(face_id = floor(i / 4),
                         length_m = (len(mesh[1]) - 1),
                         len_faces = len(mesh[1][0]) - 1,
                         midpoint_b = (len(vertices_actual) - 1) -
                                      (len(midpoints) - 1), length_m_c = length_m + face_id > len_faces ? 0 : length_m + face_id ) are_triangles
                 ? [[length_m_c, length_m_c + 1, centroid_position + face_id],
                    [length_m_c + 1, length_m_c + 2, centroid_position + face_id],
                    [length_m_c + 2, length_m_c, centroid_position + face_id]]
                 : [[length_m_c,
                     midpoint_b + face_id,
                     centroid_position + face_id,
                     midpoint_b + face_id + 1],
                    [midpoint_b + face_id,
                     length_m + face_id + 1,
                     midpoint_b + face_id + 1,
                     centroid_position + face_id],
                    [centroid_position + face_id,
                     midpoint_b + face_id + 1,
                     length_m + face_id + 2,
                     midpoint_b + face_id + 2],
                    [midpoint_b + face_id + 3,
                     centroid_position + face_id,
                     midpoint_b + face_id + 2,
                     length_m + face_id + 3]]],
        1))[vertices_actual, new_faces];

// unfinished function using the catmull clark algorithm to subdivide surfaces
function catmull_clark(mesh) = let(centroids = [for(f = [0:len(mesh[1])-1]) centroid(mesh, face)], new_vertices = concat([], centroids)  )1;


