function mat2(m1, m2, m3, m4) = [[m1, m2], [m3, m4]];
function mat2z() = [[0, 0], [0, 0]];
function mat3(m1, m2, m3, m4, m5, m6, m7, m8, m9) = [[m1, m2, m3], [m4, m5, m6], [m7, m8, m9]];
function mat3z() = [[0, 0, 0], [0, 0, 0], [0, 0, 0]];
function mat4(m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16) = [[m1, m2, m3, m4], [m5, m6, m7, m8], [m9, m10, m11, m12], [m13, m14, m15, m16]];
function mat4z() = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]];

function identitymat2() = [[1, 0], [0, 1]];
function identitymat3() = [[1, 0, 0], [0, 1, 0], [0, 0, 1]];
function identitymat4() = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]];

function addmat2(m1, m2) = [[m1[0][0] + m2[0][0], m1[0][1] + m2[0][1]], [m1[1][0] + m2[1][0], m1[1][1] + m2[1][1]]];
function addmat3(m1, m2) = [[m1[0][0] + m2[0][0], m1[0][1] + m2[0][1], m1[0][2] + m2[0][2]], [m1[1][0] + m2[1][0], m1[1][1] + m2[1][1], m1[1][2] + m2[1][2]], [m1[2][0] + m2[2][0], m1[2][1] + m2[2][1], m1[2][2] + m2[2][2]]];
function addmat4(m1, m2) = [[m1[0][0] + m2[0][0], m1[0][1] + m2[0][1], m1[0][2] + m2[0][2], m1[0][3] + m2[0][3]], [m1[1][0] + m2[1][0], m1[1][1] + m2[1][1], m1[1][2] + m2[1][2], m1[1][3] + m2[1][3]], [m1[2][0] + m2[2][0], m1[2][1] + m2[2][1], m1[2][2] + m2[2][2], m1[2][3] + m2[2][3]], [m1[3][0] + m2[3][0], m1[3][1] + m2[3][1], m1[3][2] + m2[3][2], m1[3][3] + m2[3][3]]];

function negatemat2(m1) = [[-m1[0][0], -m1[0][1]], [-m1[1][0], -m1[1][1]]];
function negatemat3(m1) = [[-m1[0][0], -m1[0][1], -m1[0][2]], [-m1[1][0], -m1[1][1], -m1[1][2]], [-m1[2][0], -m1[2][1], -m1[2][2]]];
function negatemat4(m1) = [[-m1[0][0], -m1[0][1], -m1[0][2], -m1[0][3]], [-m1[1][0], -m1[1][1], -m1[1][2], -m1[1][3]], [-m1[2][0], -m1[2][1], -m1[2][2], -m1[2][3]], [-m1[3][0], -m1[3][1], -m1[3][2], -m1[3][3]]];

function submat2(m1, m2) = [[m1[0][0] - m2[0][0], m1[0][1] - m2[0][1]], [m1[1][0] - m2[1][0], m1[1][1] - m2[1][1]]];
function submat3(m1, m2) = [[m1[0][0] - m2[0][0], m1[0][1] - m2[0][1], m1[0][2] - m2[0][2]], [m1[1][0] - m2[1][0], m1[1][1] - m2[1][1], m1[1][2] - m2[1][2]], [m1[2][0] - m2[2][0], m1[2][1] - m2[2][1], m1[2][2] - m2[2][2]]];
function submat4(m1, m2) = [[m1[0][0] - m2[0][0], m1[0][1] - m2[0][1], m1[0][2] - m2[0][2], m1[0][3] - m2[0][3]], [m1[1][0] - m2[1][0], m1[1][1] - m2[1][1], m1[1][2] - m2[1][2], m1[1][3] - m2[1][3]], [m1[2][0] - m2[2][0], m1[2][1] - m2[2][1], m1[2][2] - m2[2][2], m1[2][3] - m2[2][3]], [m1[3][0] - m2[3][0], m1[3][1] - m2[3][1], m1[3][2] - m2[3][2], m1[3][3] - m2[3][3]]];

function scalarmat2(m1, scalar) = [[m1[0][0] * scalar, m1[0][1] * scalar], [m1[1][0] * scalar, m1[1][1] * scalar]];
function scalarmat3(m1, scalar) = [[m1[0][0] * scalar, m1[0][1] * scalar, m1[0][2] * scalar], [m1[1][0] * scalar, m1[1][1] * scalar, m1[1][2] * scalar], [m1[2][0] * scalar, m1[2][1] * scalar, m1[2][2] * scalar]];
function scalarmat4(m1, scalar) = [[m1[0][0] * scalar, m1[0][1] * scalar, m1[0][2] * scalar, m1[0][3] * scalar], [m1[1][0] * scalar, m1[1][1] * scalar, m1[1][2] * scalar, m1[1][3] * scalar], [m1[2][0] * scalar, m1[2][1] * scalar, m1[2][2] * scalar, m1[2][3] * scalar], [m1[3][0] * scalar, m1[3][1] * scalar, m1[3][2] * scalar, m1[3][3] * scalar]];

function transposemat2(m1) = [[m1[0][0], m1[1][0]], [m1[0][1], m1[1][1]]];
function transposemat3(m1) = [[m1[0][0], m1[1][0], m1[2][0]], [m1[0][1], m1[1][1], m1[2][1]], [m1[0][2], m1[1][2], m1[2][2]]];
function transposemat4(m1) = [[m1[0][0], m1[1][0], m1[2][0], m1[3][0]], [m1[0][1], m1[1][1], m1[2][1], m1[3][1]], [m1[0][2], m1[1][2], m1[2][2], m1[3][2]], [m1[0][3], m1[1][3], m1[2][3], m1[3][3]]];

function determinantmatrixmat3(m1) = [[m1[1][1] * m1[2][2] - m1[1][2] * m1[2][1], m1[0][1] * m1[2][2] - m1[1][2] * m1[2][0], m1[1][0] * m1[2][1] - m1[1][1] * m1[2][0]], [m1[0][1] * m1[2][2] - m1[0][2] * m1[2][1], m1[0][0] * m1[2][2] - m1[0][2] * m1[2][0], m1[0][0] * m1[2][1] - m1[0][1] * m1[2][0]], [m1[0][1] * m1[1][2] - m1[2][0] * m1[1][1], m1[0][0] * m1[1][2] - m1[0][2] * m1[1][0], m1[0][0] * m1[1][1] - m1[0][1] * m1[1][0]]];
function determinantmatrixmat4(m1) = mat4(determinantmat3(mat3(m1[1][1], m1[1][2], m1[1][3], m1[2][1], m1[2][2], m1[2][3], m1[3][1], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[1][0], m1[1][2], m1[1][3], m1[2][0], m1[2][2], m1[2][3], m1[3][0], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[1][0], m1[1][1], m1[1][3], m1[2][0], m1[2][1], m1[2][3], m1[3][0], m1[3][1], m1[3][3])), determinantmat3(mat3(m1[1][0], m1[1][1], m1[1][2], m1[2][0], m1[2][1], m1[2][2], m1[3][0], m1[3][1], m1[3][2])), determinantmat3(mat3(m1[0][1], m1[0][2], m1[0][3], m1[2][1], m1[2][2], m1[2][3], m1[3][1], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][2], m1[0][3], m1[2][0], m1[2][2], m1[2][3], m1[3][0], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][3], m1[2][0], m1[2][1], m1[2][3], m1[3][0], m1[3][1], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][2], m1[2][0], m1[2][1], m1[2][2], m1[3][0], m1[3][1], m1[3][2])), determinantmat3(mat3(m1[0][1], m1[0][2], m1[0][3], m1[1][1], m1[1][2], m1[1][3], m1[3][1], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][2], m1[0][3], m1[1][0], m1[1][2], m1[1][3], m1[3][0], m1[3][2], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][3], m1[1][0], m1[1][1], m1[1][3], m1[3][0], m1[3][1], m1[3][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][2], m1[1][0], m1[1][1], m1[1][2], m1[2][0], m1[2][1], m1[2][2])), determinantmat3(mat3(m1[0][1], m1[0][2], m1[0][3], m1[1][1], m1[1][2], m1[1][3], m1[2][1], m1[2][2], m1[2][3])), determinantmat3(mat3(m1[0][0], m1[0][2], m1[0][3], m1[1][0], m1[1][2], m1[1][3], m1[2][0], m1[2][2], m1[2][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][3], m1[1][0], m1[1][1], m1[1][3], m1[2][0], m1[2][1], m1[2][3])), determinantmat3(mat3(m1[0][0], m1[0][1], m1[0][2], m1[1][0], m1[1][1], m1[1][2], m1[2][0], m1[2][1], m1[2][2])));

function determinantmat2(m1) = m1[0][0] * m1[1][1] - m1[0][1] * m1[1][0];
function determinantmat3(m1) = m1[0][0] * (m1[1][1] * m1[2][2] - m1[1][2] * m1[2][1]) - m1[0][1] * (m1[0][1] * m1[2][2] - m1[1][2] * m1[0][2]) + m1[0][2] * (m1[0][1] * m1[2][1] - m1[1][1] * m1[2][0]);
function determinantmat4(m1) = m1[0][0] * determinantmat3(mat3(m1[1][1], m1[1][2], m1[1][3], m1[2][1], m1[2][2], m1[2][3], m1[3][1], m1[3][2], m1[3][3])) - m1[0][1] * determinantmat3(mat3(m1[1][0], m1[1][2], m1[1][3], m1[2][0], m1[2][2], m1[2][3], m1[3][0], m1[3][2], m1[3][3])) + m1[0][2] * determinantmat3(mat3(m1[1][0], m1[1][1], m1[1][3], m1[2][0], m1[2][1], m1[2][3], m1[3][0], m1[3][1], m1[3][3])) - m1[0][3] * determinantmat3(mat3(m1[1][0], m1[1][1], m1[1][2], m1[2][0], m1[2][1], m1[2][2], m1[3][0], m1[3][1], m1[3][2]));

function cofactormatrixmat2(m1) = mat2(m1[0][0], -m1[0][1], m1[1][0], -m1[1][1]);
function cofactormatrixmat3(m1) = [[m1[0][0], -m1[0][1], m1[0][2]], [-m1[1][0], m1[1][1], -m1[1][2]], [m1[2][0], -m1[2][1], m1[2][2]]];
function cofactormatrixmat4(m1) = [[m1[0][0], -m1[0][1], m1[0][2], -m1[0][3]], [m1[1][0], -m1[1][1], m1[1][2], -m1[1][3]], [m1[2][0], -m1[2][1], m1[2][2], -m[2][3]], [m1[3][0], -m1[3][1], m1[3][2], -m1[3][3]]];

function adjugatemat2(m1) = mat2(m1[0][0], m1[1][0], m1[0][1], m1[1][1]);
function adjugatemat3(m1) = [[m1[0][0], m1[1][0], m1[2][0]], [m1[0][1], m1[1][1], m1[2][1]], [m1[0][2], m1[1][2], m1[2][2]]];
function adjugatemat4(m1) = [[m1[0][0], m1[1][0], m1[2][0], m1[3][0]], [m1[0][1], m1[1][1], m1[2][1], m1[3][1]], [m1[0][2], m1[1][2], m1[2][2], m1[3][2]], [m1[0][3], m1[1][3], m1[2][3], m1[3][3]]];

function inversemat2(m1) = [[m1[1][1], -m1[0][1]], [-m1[1][0], m1[0][0]]];
function inversemat3(m1) = scalarmat3(adjugatemat3(cofactormatrixmat3(determinantmatrixmat3(m1))), 1 / determinantmat3(m1));
function inversemat4(m1) = scalarmat4(adjugatemat4(cofactormatrixmat4(determinantmatrixmat4(m1))), 1 / determinantmat4(m1));

function divmat2(m1, m2) = m1 * inversemat2(m2);
function divmat3(m1, m2) = m1 * inversemat3(m2);
function divmat4(m1, m2) = m1 * inversemat4(m2);

function rotationmat2(x, y) = mat2(cos(x), -sin(x), sin(x), cos(x)) * mat2(cos(y), -sin(y), sin(y), cos(y));
function rotationmat3(x, y, z) = let(matx = is_undef(x) ? identitymat3 : rotationmat3x(x), maty = is_undef(y) ? identitymat3 : rotationmat3x(y), matz = is_undef(z) ? identitymat3 : rotationmat3x(z)) matx * maty * matz;

function rotationmat3z(angle) = mat3(cos(angle), -sin(angle), 0, sin(angle), cos(angle), 0, 0, 0, 1);
function rotationmat3y(angle) = mat3(cos(angle), 0, -sin(angle), 0, 1, 0, sin(angle), 0, cos(angle));
function rotationmat3x(angle) = mat3(1, 0, 0, 0, cos(angle), sin(angle), 0, -sin(angle), cos(angle));

function scalemat2(x, y) = let(matx = is_undef(x) ? identitymat2() : scalemat2x(x), maty = is_undef(y) ? identitymat2() : scalemat2y(y)) matx * maty;
function scalemat3(x, y, z) = let(matx = is_undef(x) ? identitymat3() : scalemat3x(x), maty = is_undef(y) ? identitymat3() : scalemat3y(y), matz = is_undef(z) ? identitymat3() : scalemat3z(z)) matx * maty * matz;

function scalemat2x(x) = mat2(x, 0, 0, 1);
function scalemat2y(y) = mat2(1, 0, 0 , y);

function scalemat3x(x) = mat3(x, 0, 0, 0, 1, 0, 0, 0, 1);
function scalemat3y(y) = mat3(1, 0, 0, 0, y, 0, 0, 0, 1);
function scalemat3z(z) = mat3(1, 0, 0, 0, 1, 0, 0, 0, z);
