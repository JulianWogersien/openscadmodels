function vec3(x, y, z) = [x, y, z];
function vec2(x, y) = [x, y];
function vec4(x, y, z, w) = [x, y, z, w];

function vec2add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1]];
function vec3add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2]];
function vec4add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2], v1[3] + v1[3]];

function vec2sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1]];
function vec3sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2]];
function vec4sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2], v1[3] + v1[3]];