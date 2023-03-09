use<basic2d.scad>
use<basic3d.scad>

module graph_function_3d(f, min = -10, max = 10, step_size = 1, color = "blue") {
    total_steps = 0;

    samples_arr = [for(x = [min:step_size:max]) for(y = [min:step_size:max]) [x, y, callfunc3(x, y, f)] ];

    vertices = [ for(i = samples_arr) [i[0], i[1], i[2]] ];
    for(i = [0:len(vertices) - 2]) {
        line3d(vertices[i][0], vertices[i][1], vertices[i][2], vertices[i + 1][0], vertices[i + 1][1], vertices[i + 1][2], thickness = step_size);
    }
}

module graph_function_2d(f, min = -100, max = 100, step_size = 1, color = "red") {
    total_steps = 0;

    samples_arr = [for(x = [min:max]) [x, callfunc(x, f)] ];

    echo(samples_arr)
    color(color)
    for(i = [0:len(samples_arr) - 1]) {
        if(len(samples_arr) != i + 1) {
            x1 = samples_arr[i][0];
            y1 = samples_arr[i][1];
            x2 = samples_arr[i + 1][0];
            y2 = samples_arr[i + 1][1];
            line(x1, y1, x2, y2, 1);
        }
    }
}

function callfunc3(x, y, f) = (f == 1) ? f1(x, y) :
                              (f == 2) ? f2(x, y) :
                              (f == 3) ? f3(x, y) :
                              (f == 4) ? f4(x, y) :
                              (f == 5) ? f5(x, y) :
                              (f == 6) ? f6(x, y) :
                              (f == 7) ? f7(x, y) :
                              (f == 8) ? f8(x, y) :
                              (f == 9) ? f9(x, y) :
                              (f == 10) ? f10(x, y) :
                              (f == 11) ? f11(x, y) :
                              (f == 12) ? f12(x, y) :
                              (f == 13) ? f13(x, y) :
                              (f == 14) ? f14(x, y) :
                              (f == 15) ? f15(x, y) :
                              (f == 16) ? f16(x, y) : InvalidFunction;

function callfunc(x, f) = (f == 1) ? f1(x) : 
                          (f == 2) ? f2(x) :
                          (f == 3) ? f3(x) :
                          (f == 4) ? f4(x) :
                          (f == 5) ? f5(x) :
                          (f == 6) ? f6(x) :
                          (f == 7) ? f7(x) :
                          (f == 8) ? f8(x) :
                          (f == 9) ? f9(x) :
                          (f == 10) ? f10(x) :
                          (f == 11) ? f11(x) :
                          (f == 12) ? f12(x) :
                          (f == 13) ? f13(x) :
                          (f == 14) ? f14(x) :
                          (f == 15) ? f15(x) :
                          (f == 16) ? f16(x) : InvalidFunction;
