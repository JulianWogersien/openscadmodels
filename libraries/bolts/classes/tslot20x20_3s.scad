/* Generated by BOLTS, do not modify */
function tslot20x20_3s_dims(l=100, detailed=false, part_mode="default") = [
	["detailed", detailed],
	["l", l]];

module tslot20x20_3s_geo(l, detailed, part_mode){
	tslot_20x20_3s_base(
		get_dim(tslot20x20_3s_dims(l, detailed, part_mode),"l"),
		get_dim(tslot20x20_3s_dims(l, detailed, part_mode),"detailed")
	);
};

module TSlotExtrusionThreeSlots20x20(l=100, detailed=false, part_mode="default"){
	BOLTS_check_parameter_type("TSlotExtrusionThreeSlots20x20","l",l,"Length (mm)");
	BOLTS_check_parameter_type("TSlotExtrusionThreeSlots20x20","detailed",detailed,"Bool");
	if(BOLTS_MODE == "bom"){
		if(!(part_mode == "diff")){
			echo(str("T slot extrusion three slots 20x20x",l,""));
		}
		cube();
	} else {
		tslot20x20_3s_geo(l, detailed, part_mode);
	}
};

function TSlotExtrusionThreeSlots20x20_dims(l=100, detailed=false, part_mode="default") = tslot20x20_3s_dims(l, detailed, part_mode);

function TSlotExtrusionThreeSlots20x20_conn(location,l=100, detailed=false, part_mode="default") = tslot20x20_3s_conn(location,l, detailed, part_mode);

