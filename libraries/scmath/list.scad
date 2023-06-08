
// checks if any in the list match
function do_any_match(list, value) = [for (l = list) if (l == value) true else
    false][0];

// depth of list
function depth(a) = is_list(a) ? len(a) == undef ? 0 : 1 + depth(a[0]) : 0;

// flattens a list
function flatten(l) = [for (a = l) for (b = a) b];

// flattens a list that can contain any arbitrary amount of nested lists at any
// position
function dflatten(l, d = 2) =
    flatten([for (a = l) depth(a) > d ? dflatten(a, d) : [a]]);

// use merge sort to sort given array
function merge_sort(arr, keypos = undef) =
    !(len(arr) > 1)
        ? arr
        : let(left = [for (i = [0:floor(len(arr) / 2) - 1]) arr[i]],
              right = [for (i = [floor(len(arr) / 2):len(arr) - 1]) arr[i]],
              mlft = merge_sort(left, keypos),
              mrgt = merge_sort(right, keypos))
              merge(left = mlft, right = mrgt, kp = keypos);

// merge the lists left and right from position j[0] and j[1] respectively;
// _acc is the list with the merge already done
function merge(left, right, kp, j = [ 0, 0 ], _acc = []) =
    j[0] >= len(left) && j[1] >= len(right)
        ? _acc
        : merge(left = left,
                right = right,
                kp = kp,
                j = next_js(j, left, right, kp),
                _acc = concat(_acc, next_entry(j, left, right, kp)));

// choose the next value of indices j
function next_js(j, lft, rgt, kp) =
    let(jl = j[0], jr = j[1]) jl >= len(lft) || jr >= len(rgt)
        ? // any partition is done ?
        [ jl + 1, jr + 1 ]
        : // advance both pointers
        kp == undef
            ? // is there a key ? // select the partition to take from
            lft[jl] > rgt[jr] ? [ jl, jr + 1 ] : [ jl + 1, jr ]
            : lft[jl][kp] > rgt[jr][kp] ? [ jl, jr + 1 ] : [ jl + 1, jr ];

function next_entry(j, lft, lrt, kp) =
    let(jl = j[0], jr = j[1]) jl >= len(lft)
        ? [lrt[jr]]
        : // partition left is done ? no, take from right
        jr >= len(lrt) ? [lft[jl]]
                       : // partition right is done ? no, take from left
        kp == undef ?    // is there a key ?
        lft[jl] > lrt[jr] ? [lrt[jr]] : [lft[jl]]
                    : lft[jl][kp] > lrt[jr][kp] ? [lrt[jr]] : [lft[jl]];

// generates a list of random integers
function random_intlist(min = 0, max = 100, size = 100) = let(rand_l = rands(min, max, size)) [for(i = rand_l) round(i)];

// finds the largest integer in a list
function find_largest(a, i = 0) = (i < len(a) - 1) ? max(a[i], find_largest(a, i +1 )) : a[i];

// finds the smallest number in the list and returns it
function find_smallest(a, i = 0) = (i < len(a) - 1) ? min(a[i], find_smallest(a, i + 1)) : a[i];

// splits given list at given index (between the value before the index and the index)
function split_at_index(list, index) = let(arr1 = [for(i = [0:index-1]) list[i]],  arr2 = [for(i = [index:len(list)-1]) list[i]]) [arr1, arr2];

// sets given index in the list to given value
function set_value_in_list(list, index, value) = let(arrs = split_at_index(list, index), arr_novalue = split_at_index(arrs[1], 1), temp_arr = concat(arrs[0], value), arr = concat(temp_arr, arr_novalue[1])) arr;

// removes everything in the list that falls inside the given start and end variables
function remove_range(list, range_start, range_end) = let(left = split_at_index(list, range_start), right = split_at_index(list, range_end)) concat(left[0], right[1]);

// gets everything in the list between start and end indexes
function get_range(list, range_start, range_end) = let(left = split_at_index(list, range_start), mid = split_at_index(left[1], (range_end - (len(left[0])-1)))) mid[0];
