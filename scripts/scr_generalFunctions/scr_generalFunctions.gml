
/// @function summonObject(obj, arguments, _x, _y, _depth)
/// @description Creates an instance of `obj` at (_x, _y) with a depth of `_depth`, and assigns arguments from the `arguments` array
/// @param {object} obj The object to create
/// @param {array} arguments An array of sub-arrays, where each sub-array contains [argument_name, argument_value]
/// @param {number} _x The x-coordinate (default: x)
/// @param {number} _y The y-coordinate (default: y)
/// @param {number} _depth The depth (default: depth)
/// Generated by Deepseek and edited by Hector

function summonObject(obj, arguments = noone, _x = x, _y = y, _depth = depth){
	var struct = 1;
	if (arguments != noone){
	    // Create a ds_map to hold the arguments
	    var argumentMap = ds_map_create();

	    // Loop through the arguments array
	    for (var i = 0; i < array_length(arguments); i++) {
	        // Get the current sub-array (which contains [argument_name, argument_value])
	        var arg = arguments[i];

	        // Ensure the sub-array has exactly 2 elements (name and value)
	        if (array_length(arg) == 2) {
	            var argName = arg[0]; // Name of the argument (can be a string)
	            var argValue = arg[1]; // Value of the argument

	            // Add the argument to the ds_map
	            argumentMap[? argName] = argValue;
	        } else {
	            show_debug_message("Invalid argument at index " + string(i) + ": Expected [name, value].");
	        }
	    }
		//convert to struct
		struct = ds_map_to_struct(argumentMap)
		ds_map_destroy(argumentMap);
	    // Create the instance with the argument map
	}else{
		struct = {}
	}
    return instance_create_depth(_x, _y, _depth, obj, struct);
    
}


/// @function ds_map_to_struct(dsMap)
/// @description Converts a ds_map to a struct.
/// @param {ds_map} dsMap The ds_map to convert.
/// @return {struct} The resulting struct.
/// Generated by Deepseek
function ds_map_to_struct(dsMap) {
    // Create an empty struct
    var resultStruct = {};

    // Get the list of keys from the ds_map
    var keys = ds_map_keys_to_array(dsMap);

    // Loop through the keys and copy them to the struct
    for (var i = 0; i < array_length(keys); i++) {
        var key = keys[i];
        var value = dsMap[? key];

        // Add the key-value pair to the struct
        resultStruct[$ key] = value;
    }

    return resultStruct;
}

//this is way better
function print(text){
	show_debug_message(text);
}


/// @function stepCollisionWhileWithFailCon(objectArray, step, horizontal)
/// @description Used before colliding with something collideable, will check all object types in objectArray
/// @param {array} objectArray Array of all objects that need to be checked
/// @param {real} step Negative or positive direction
/// @param {real} horizontal y-axis or x-axis? 1 for x-axis, 0 for y-axis

function stepCollisionWhileWithFailCon(objectArray, step, horizontal){
	global.preWhileCoord = [x,y];
	while(!collisionWithArray(objectArray,step,horizontal)){
		x += step*horizontal;
		y += step*!horizontal
		global.whileFail++
		if (global.whileFail == global.whileFailLimit){
			x = global.preWhileCoord[0]
			y = global.preWhileCoord[1]
			global.whileFail = 0
			break;
		}
	}
}

/// @function collisionWithArray(array, step, horizontal)
/// @description Helper function for stepCollisionWhileWithFailCon
/// @param {array} objectArray Array of all objects that need to be checked
/// @param {real} step Negative or positive direction
/// @param {real} horizontal y-axis or x-axis? 1 for x-axis, 0 for y-axis
/// @returns {bool} true if collision with any obj in array, else false
function collisionWithArray(array,step,horizontal){
	var boolean = false;
	for (var i = 0; i < array_length(array); i++) {
		if place_meeting(x+step*horizontal,y+step*!horizontal,array[i]){
			return true
		}
	}
	return false;
}


function is_in_range(value, minimum, maximum) {
    return value > minimum && value < maximum;
}

function normalizedVector(objectA, objectB){
	// Get direction vector
	var dir_x = objectB.x - objectA.x;
	var dir_y = objectB.y - objectA.y;

	// Normalize using point_distance (more efficient than manual calculation)
	var dist = point_distance(0, 0, dir_x, dir_y);
	if (dist > 0) {
	    dir_x /= dist;
	    dir_y /= dist;
	}
	return [dir_x, dir_y];
}




/// @function minIndex(...)
/// @description Returns the minimum value and its position among the arguments
/// @param {variadic} values Any number of values to compare
/// @returns {array} [min_value, position_index]
/// made by deepseek, glory to the ccp, i am a lazy BUM!!!!!

function minIndex() {
    if (argument_count == 0) {
        // Handle case with no arguments
        return [undefined, 0];
    }
    
    var min_val = 99999999
    var min_index = 1;
    
    for (var i = 0; i < argument_count; i++) {
		//print("i: " + string(i) + " val: " + string(argument[i]));
        if (argument[i] < min_val) {
            min_val = argument[i];
            min_index = i; 
        }
    }
    
    return [min_val, min_index];
}