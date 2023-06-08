function vec2(x, y) = [x, y];
function vec3(x, y, z) = [x, y, z];
function vec4(x, y, z, w) = [x, y, z, w];
function vec2z() = [0, 0];
function vec3z() = [0, 0, 0];
function vec4z() = [0, 0, 0, 0];

function vec2add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1]];
function vec3add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2]];
function vec4add(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2], v1[3] + v1[3]];

function vec2sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1]];
function vec3sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2]];
function vec4sub(v1, v2) = [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2], v1[3] + v1[3]];

function vec2mag(v1) = sqrt(v1[0]*v1[0] + v1[1]*v1[1]);
function vec3mag(v1) = sqrt(v1[0]*v1[0] + v1[1]*v1[1] + v1[2] * v1[2]);
function vec4mag(v1) = sqrt(v1[0]*v1[0] + v1[1]*v1[1] + v1[2] * v1[2] + v1[3] * v1[3]);

function vec2mulscalar(v1, scalar) = [v1[0] * scalar, v1[1] * scalar];
function vec3mulscalar(v1, scalar) = [v1[0] * scalar, v1[1] * scalar, v1[2] * scalar];
function vec4mulscalar(v1, scalar) = [v1[0] * scalar, v1[1] * scalar, v1[2] * scalar, v1[3] * scalar];

function vec2cos(v1, v2) = cos((v1[0] * v2[0] + v1[1] * v2[1]) / (((v1[0]*v1[0] + v1[1]*v1[1]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1]) * 0.5)));
function vec3cos(v1, v2) = cos((v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2]) / (((v1[0]*v1[0] + v1[1]*v1[1] + v1[2]*v1[2]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1] + v2[2]*v2[2]) * 0.5)));
function vec4cos(v1, v2) = cos((v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2] + v1[3] * v2[3]) / (((v1[0]*v1[0] + v1[1]*v1[1] + v1[2]*v1[2] + v1[3]*v1[3]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1] + v2[2]*v2[2] + v2[3]*v2[3]) * 0.5)));

function vec2sin(v1, v2) = sin((v1[0] * v2[0] + v1[1] * v2[1]) / (((v1[0]*v1[0] + v1[1]*v1[1]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1]) * 0.5)));
function vec3sin(v1, v2) = sin((v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2]) / (((v1[0]*v1[0] + v1[1]*v1[1] + v1[2]*v1[2]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1] + v2[2]*v2[2]) * 0.5)));
function vec4sin(v1, v2) = sin((v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2] + v1[3] * v2[3]) / (((v1[0]*v1[0] + v1[1]*v1[1] + v1[2]*v1[2] + v1[3]*v1[3]) * 0.5) * ((v2[0]*v2[0] + v2[1]*v2[1] + v2[2]*v2[2] + v2[3]*v2[3]) * 0.5)));

function vec2dot(v1, v2) = vec2mag(v1) * vec2mag(v2) * vec2cos(v1, v2);
function vec3dot(v1, v2) = vec3mag(v1) * vec3mag(v2) * vec3cos(v1, v2);
function vec4dot(v1, v2) = vec4mag(v1) * vec4mag(v2) * vec4cos(v1, v2);

function vec3cross(v1, v2) = [v1[1]*v2[2] - v1[2]*v2[1], v1[2]*v2[0] - v1[0]*v2[2], v1[0]*v2[1] - v1[1]*v2[0]];

function vec2frompolar(length, angle) = [length * cos(angle), length * sin(angle)];
function vec2intopolar(v1) = [sqrt(v1[0]*v1[0] + v1[1]*v1[1]), atan(v1[1] / v1[0])];

function vec2divscalar(v1, scalar) = [v1[0] / scalar, v1[1] / scalar];
function vec3divscalar(v1, scalar) = [v1[0] / scalar, v1[1] / scalar, v1[2] / scalar];
function vec4divscalar(v1, scalar) = [v1[0] / scalar, v1[1] / scalar, v1[2] / scalar, v1[3] / scalar];

function vec2listsum(list, idx = 0, result = vec2z()) = idx >= len(list) ? result : vec2listsum(list, idx + 1, vec2add(result, list[idx]));
function vec3listsum(list, idx = 0, result = vec3z()) = idx >= len(list) ? result : vec3listsum(list, idx + 1, vec3add(result, list[idx]));
function vec4listsum(list, idx = 0, result = vec4z()) = idx >= len(list) ? result : vec4listsum(list, idx + 1, vec4add(result, list[idx]));

function transform_vec2bymat2(vec, m1) = [m1[0][0] * vec[0] + m1[0][1] * vec[1], m1[1][0] * vec[0] + m1[1][1] * vec[1]];
function transform_vec3bymat3(vec, m1) = [m1[0][0] * vec[0] + m1[0][1] * vec[1] + m1[0][2] * vec[2], m1[1][0] * vec[0] + m1[1][1] * vec[1] + m1[1][2] * vec[2], m1[2][0] * vec[0] + m1[2][1] * vec[1] + m1[2][2] * vec[2]];
function transform_vec4bymat4(vec, m1) = [m1[0][0] * vec[0] + m1[0][1] * vec[1] + m1[0][2] * vec[2] + m1[0][3] * vec[3], m1[1][0] * vec[0] + m1[1][1] * vec[1] + m1[1][2] * vec[2] + m1[1][3] * vec[3], m1[2][0] * vec[0] + m1[2][1] * vec[1] + m1[2][2] * vec[2] + m1[2][3] * vec[3], m1[3][0] * vec[0] + m1[3][1] * vec[1] + m1[3][2] * vec[2] + m1[3][3] * vec[3]];

function vec2_dist(v1, v2) = [v1[0] - v2[0], v1[1] - v2[1]];
function vec3_dist(v1, v2) = [v1[0] - v2[0], v1[1] - v2[1], v1[2] - v2[2]];
function vec4_dist(v1, v2) = [v1[0] - v2[0], v1[1] - v2[1], v1[2] - v2[2], v1[3] - v2[3]];