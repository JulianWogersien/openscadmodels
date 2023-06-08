use<basic3d.scad>
use<mesh.scad>
use<list.scad>

list = random_intlist(min = 0, max = 1000, size = 1000);
mid = find_smallest(a = list);
echo("list: ", list, "mid: ", mid);

//mesh = fhexahedron();
//catmull_clark(mesh = mesh);
