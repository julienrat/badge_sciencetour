//POVRay-File created by 3d41.ulp v20110101
///home/juju/eagle/moduluino/moduleduino.brd
//12/06/14 18:52

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 267;
#local cam_z = -81;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 31;
#local lgt1_pos_y = 47;
#local lgt1_pos_z = 18;
#local lgt1_intense = 0.742401;
#local lgt2_pos_x = -31;
#local lgt2_pos_y = 47;
#local lgt2_pos_z = 18;
#local lgt2_intense = 0.742401;
#local lgt3_pos_x = 31;
#local lgt3_pos_y = 47;
#local lgt3_pos_z = -12;
#local lgt3_intense = 0.742401;
#local lgt4_pos_x = -31;
#local lgt4_pos_y = 47;
#local lgt4_pos_z = -12;
#local lgt4_intense = 0.742401;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 83.490000;
#declare pcb_y_size = 35.550000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(731);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-41.745000,0,-17.775000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MODULEDUINO(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,6
<0.000000,0.000000><83.490000,0.000000>
<83.490000,0.000000><83.490000,35.550000>
<0.000000,35.550000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<12.725447,1,17.169534><12.725447,-5,17.169534>1.400000 texture{col_hls}}
cylinder{<81.280225,1,11.785909><81.280225,-5,11.785909>1.400000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.050000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C1 22pF C0603
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C2 0.1uF C0603
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0603()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.590000,0.000000,12.700000>translate<0,0.035000,0> }#end		//SMD Capacitor 0603 C5 22pF C0603
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0603("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<20.879788,0.000000,21.330256>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R1 330R R0603
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.978950,0.000000,24.786100>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R2 10K R0603
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_SMD_CHIP_0603("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<66.478725,0.000000,10.698328>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R13  R0603
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("ATMEGA328P-AU-1030060P1","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<34.290000,0.000000,17.780000>translate<0,0.035000,0> }#end		//TQFP-32 U1 ATMEGA328P-AU-1030060P1 TQFP32
#ifndef(pack_U2) #declare global_pack_U2=yes; object {IC_TR_TO252("CJ78M05-1300040P1","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.392341,0.000000,22.526275>translate<0,0.035000,0> }#end		//TO252 U2 CJ78M05-1300040P1 TO252
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_A3_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<52.037331,0,14.183009> texture{col_thl}}
#ifndef(global_pack_A3_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<52.037331,0,16.183009> texture{col_thl}}
#ifndef(global_pack_A3_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<52.037331,0,18.183009> texture{col_thl}}
#ifndef(global_pack_A3_A2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<52.037331,0,20.183009> texture{col_thl}}
object{TOOLS_PCB_SMD(1.778000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<80.569672,0.000000,15.846031>}
object{TOOLS_PCB_SMD(1.778000,1.397000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<80.569672,0.000000,20.164031>}
object{TOOLS_PCB_SMD(1.778000,1.016000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<82.728672,0.000000,14.449031>}
object{TOOLS_PCB_SMD(1.778000,1.016000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<82.728672,0.000000,21.561031>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<19.050000,0.000000,18.542000>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<19.050000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,18.542000>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<21.590000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<21.590000,0.000000,13.462000>}
object{TOOLS_PCB_SMD(1.143000,2.286000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<14.832006,0.000000,12.674581>}
object{TOOLS_PCB_SMD(1.143000,2.286000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.753006,0.000000,12.674581>}
object{TOOLS_PCB_SMD(1.143000,2.286000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.067881,0.000000,22.785297>}
object{TOOLS_PCB_SMD(1.143000,2.286000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.146881,0.000000,22.785297>}
object{TOOLS_PCB_SMD(0.762000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<21.034178,0.000000,18.589897>}
object{TOOLS_PCB_SMD(0.762000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<21.034178,0.000000,17.065897>}
#ifndef(global_pack_D2_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<59.368375,0,14.202513> texture{col_thl}}
#ifndef(global_pack_D2_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.368375,0,16.202513> texture{col_thl}}
#ifndef(global_pack_D2_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.368375,0,18.202513> texture{col_thl}}
#ifndef(global_pack_D2_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<59.368375,0,20.202513> texture{col_thl}}
object{TOOLS_PCB_SMD(0.762000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<73.162113,0.000000,17.304950>}
object{TOOLS_PCB_SMD(0.762000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<73.162113,0.000000,18.828950>}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,24.263669> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,21.723669> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,19.183669> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,16.643669> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,14.103669> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.651000,0.889000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<77.935347,0,11.563669> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<69.850000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<74.930000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<80.010000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<53.340000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<58.420000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<63.500000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<46.990000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<30.480000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<3.810000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<8.890000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_J7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<3.810000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<25.400000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<46.990000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<41.910000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<36.830000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<63.500000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<53.340000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<80.010000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<74.930000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J11) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.032000,1.168400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<69.850000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_J12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.850000,1.000000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<5.124422,0,12.676297> texture{col_thl}}
#ifndef(global_pack_J12) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.850000,1.000000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<5.124422,0,16.176297> texture{col_thl}}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<20.879788,0.000000,20.568256>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-90.000000,0> texture{col_pds} translate<20.879788,0.000000,22.092256>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<33.978950,0.000000,25.548100>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<33.978950,0.000000,24.024100>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-180.000000,0> texture{col_pds} translate<67.240725,0.000000,10.698328>}
object{TOOLS_PCB_SMD(0.889000,0.889000,0.037000,25) rotate<0,-180.000000,0> texture{col_pds} translate<65.716725,0.000000,10.698328>}
#ifndef(global_pack_SDA_SCL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<44.617869,0,14.215222> texture{col_thl}}
#ifndef(global_pack_SDA_SCL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.617869,0,16.215222> texture{col_thl}}
#ifndef(global_pack_SDA_SCL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.617869,0,18.215222> texture{col_thl}}
#ifndef(global_pack_SDA_SCL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.617869,0,20.215222> texture{col_thl}}
#ifndef(global_pack_TX_RX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<66.830088,0,14.192709> texture{col_thl}}
#ifndef(global_pack_TX_RX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<66.830088,0,16.192709> texture{col_thl}}
#ifndef(global_pack_TX_RX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<66.830088,0,18.192709> texture{col_thl}}
#ifndef(global_pack_TX_RX) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.270000,0.800000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<66.830088,0,20.192709> texture{col_thl}}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,20.580000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,19.780000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,18.980000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,18.180000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,17.380000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,16.580000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,15.780000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.997400,0.000000,14.980000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.490000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.290000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.090000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.890000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<34.690000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.490000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.290000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.090000,0.000000,13.487400>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,14.980000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,15.780000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,16.580000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,17.380000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,18.180000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,18.980000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,19.780000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.582600,0.000000,20.580000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.090000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.290000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.490000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<34.690000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.890000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.090000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.290000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.490000,0.000000,22.072600>}
object{TOOLS_PCB_SMD(1.016000,1.651000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.218341,0.000000,20.240275>}
object{TOOLS_PCB_SMD(5.300000,6.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<4.892341,0.000000,22.526275>}
object{TOOLS_PCB_SMD(1.016000,1.651000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.218341,0.000000,24.812275>}
object{TOOLS_PCB_SMD(1.778000,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<25.400000,0.000000,19.939000>}
object{TOOLS_PCB_SMD(1.778000,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<25.400000,0.000000,15.621000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<68.638591,0,26.494031> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<63.456213,0,27.177241> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<58.390378,0,27.043803> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<53.365703,0,27.120281> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<40.133766,0,16.612356> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<40.807647,0,18.970241> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<64.815134,0,25.527044> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<66.857900,0,25.445631> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.375962,0,12.220794> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<24.623344,0,11.088763> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<38.837028,0,10.728572> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<66.672566,0,4.051953> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<41.355906,0,15.437156> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<50.174725,0,28.228947> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<70.997797,0,21.892247> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<71.034109,0,13.970000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<35.809859,0,25.691638> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<41.090184,0,21.681472> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<20.821356,0,24.918450> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.406572,0,25.665469> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.533881,0.000000,26.946075>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.533881,0.000000,9.815988>}
box{<0,0,-0.152400><17.130088,0.035000,0.152400> rotate<0,-90.000000,0> translate<0.533881,0.000000,9.815988> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.533881,0.000000,9.815988>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.906116,0.000000,9.815988>}
box{<0,0,-0.152400><0.372234,0.035000,0.152400> rotate<0,0.000000,0> translate<0.533881,0.000000,9.815988> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.227925,0.000000,10.458278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.227925,0.000000,13.659794>}
box{<0,0,-0.152400><3.201516,0.035000,0.152400> rotate<0,90.000000,0> translate<1.227925,0.000000,13.659794> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.227925,0.000000,13.659794>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.236225,0.000000,26.308484>}
box{<0,0,-0.152400><12.648693,0.035000,0.152400> rotate<0,-89.956466,0> translate<1.227925,0.000000,13.659794> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.533881,0.000000,26.946075>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.630391,0.000000,26.946075>}
box{<0,0,-0.152400><3.096509,0.035000,0.152400> rotate<0,0.000000,0> translate<0.533881,0.000000,26.946075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.630391,0.000000,26.892716>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.630391,0.000000,26.946075>}
box{<0,0,-0.152400><0.053359,0.035000,0.152400> rotate<0,90.000000,0> translate<3.630391,0.000000,26.946075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,9.467900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,5.080000>}
box{<0,0,-0.152400><4.387900,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.810000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.630391,0.000000,26.892716>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,0.000000,26.892716>}
box{<0,0,-0.152400><0.179609,0.035000,0.152400> rotate<0,0.000000,0> translate<3.630391,0.000000,26.892716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,0.000000,26.892716>}
box{<0,0,-0.152400><3.587284,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.810000,0.000000,26.892716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,12.676297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,12.705456>}
box{<0,0,-0.152400><0.029159,0.035000,0.152400> rotate<0,90.000000,0> translate<5.124422,0.000000,12.705456> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,16.176297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,20.842409>}
box{<0,0,-0.152400><4.666113,0.035000,0.152400> rotate<0,90.000000,0> translate<5.124422,0.000000,20.842409> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,20.842409>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,20.842409>}
box{<0,0,-0.152400><0.396637,0.035000,0.152400> rotate<0,0.000000,0> translate<5.124422,0.000000,20.842409> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,20.842409>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,22.785297>}
box{<0,0,-0.152400><1.942887,0.035000,0.152400> rotate<0,90.000000,0> translate<5.521059,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,22.989378>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,22.785297>}
box{<0,0,-0.152400><0.204081,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.521059,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.892341,0.000000,22.526275>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,22.989378>}
box{<0,0,-0.152400><0.780866,0.035000,0.152400> rotate<0,-36.372304,0> translate<4.892341,0.000000,22.526275> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.906116,0.000000,9.815988>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.320975,0.000000,9.841716>}
box{<0,0,-0.152400><7.414904,0.035000,0.152400> rotate<0,-0.198791,0> translate<0.906116,0.000000,9.815988> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,8.721787>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,5.080000>}
box{<0,0,-0.152400><3.641787,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.890000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.236225,0.000000,26.308484>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,26.291691>}
box{<0,0,-0.152400><7.653793,0.035000,0.152400> rotate<0,0.125709,0> translate<1.236225,0.000000,26.308484> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,26.291691>}
box{<0,0,-0.152400><4.188309,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.890000,0.000000,26.291691> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.124422,0.000000,12.705456>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.654066,0.000000,12.705456>}
box{<0,0,-0.152400><4.529644,0.035000,0.152400> rotate<0,0.000000,0> translate<5.124422,0.000000,12.705456> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.654066,0.000000,12.705456>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.684913,0.000000,20.307209>}
box{<0,0,-0.152400><7.601816,0.035000,0.152400> rotate<0,-89.761579,0> translate<9.654066,0.000000,12.705456> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.684913,0.000000,20.307209>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.735163,0.000000,20.281525>}
box{<0,0,-0.152400><0.056434,0.035000,0.152400> rotate<0,27.071235,0> translate<9.684913,0.000000,20.307209> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.320975,0.000000,9.841716>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.197125,0.000000,9.817975>}
box{<0,0,-0.152400><1.876300,0.035000,0.152400> rotate<0,0.724929,0> translate<8.320975,0.000000,9.841716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.735163,0.000000,20.281525>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.218341,0.000000,20.240275>}
box{<0,0,-0.152400><2.483521,0.035000,0.152400> rotate<0,0.951634,0> translate<9.735163,0.000000,20.281525> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.218341,0.000000,24.812275>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.269747,0.000000,24.763869>}
box{<0,0,-0.152400><0.070610,0.035000,0.152400> rotate<0,43.275560,0> translate<12.218341,0.000000,24.812275> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,8.104316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,5.080000>}
box{<0,0,-0.152400><3.024316,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.970000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,25.878903>}
box{<0,0,-0.152400><4.601097,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.970000,0.000000,25.878903> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.654066,0.000000,12.705456>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.832006,0.000000,12.674581>}
box{<0,0,-0.152400><5.178033,0.035000,0.152400> rotate<0,0.341616,0> translate<9.654066,0.000000,12.705456> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.783213,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.832006,0.000000,12.674581>}
box{<0,0,-0.152400><1.049102,0.035000,0.152400> rotate<0,1.388267,0> translate<13.783213,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.521059,0.000000,22.785297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.146881,0.000000,22.785297>}
box{<0,0,-0.152400><9.625822,0.035000,0.152400> rotate<0,0.000000,0> translate<5.521059,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.146881,0.000000,22.785297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,22.785297>}
box{<0,0,-0.152400><0.093119,0.035000,0.152400> rotate<0,0.000000,0> translate<15.146881,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,22.785297>}
box{<0,0,-0.152400><5.005297,0.035000,0.152400> rotate<0,90.000000,0> translate<15.240000,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,17.018000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<15.240000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,17.018000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.002000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,12.674581>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,17.018000>}
box{<0,0,-0.152400><4.343419,0.035000,0.152400> rotate<0,90.000000,0> translate<16.510000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.705462,0.000000,18.542000>}
box{<0,0,-0.152400><0.195462,0.035000,0.152400> rotate<0,0.000000,0> translate<16.510000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.705462,0.000000,19.974053>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.705462,0.000000,18.542000>}
box{<0,0,-0.152400><1.432053,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.705462,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,12.674581>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.753006,0.000000,12.674581>}
box{<0,0,-0.152400><1.243006,0.035000,0.152400> rotate<0,0.000000,0> translate<16.510000,0.000000,12.674581> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,17.018000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<16.510000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,17.780000>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.780000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.753006,0.000000,12.674581>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.782113,0.000000,11.950397>}
box{<0,0,-0.152400><0.724769,0.035000,0.152400> rotate<0,87.692632,0> translate<17.753006,0.000000,12.674581> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.847981,0.000000,17.780000>}
box{<0,0,-0.152400><0.067981,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.847981,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.847981,0.000000,18.553950>}
box{<0,0,-0.152400><0.773950,0.035000,0.152400> rotate<0,90.000000,0> translate<17.847981,0.000000,18.553950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.705462,0.000000,19.974053>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,19.974053>}
box{<0,0,-0.152400><1.328538,0.035000,0.152400> rotate<0,0.000000,0> translate<16.705462,0.000000,19.974053> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,22.785297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,19.974053>}
box{<0,0,-0.152400><2.811244,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.034000,0.000000,19.974053> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,0.000000,22.785297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.067881,0.000000,22.785297>}
box{<0,0,-0.152400><0.033881,0.035000,0.152400> rotate<0,0.000000,0> translate<18.034000,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.067881,0.000000,22.785297>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,22.785297>}
box{<0,0,-0.152400><0.019075,0.035000,0.152400> rotate<0,0.000000,0> translate<18.067881,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,24.763869>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,22.785297>}
box{<0,0,-0.152400><1.978572,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.086956,0.000000,22.785297> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.269747,0.000000,24.763869>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,24.763869>}
box{<0,0,-0.152400><5.817209,0.035000,0.152400> rotate<0,0.000000,0> translate<12.269747,0.000000,24.763869> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,24.932822>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,24.763869>}
box{<0,0,-0.152400><0.168953,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.086956,0.000000,24.763869> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.492206>}
box{<0,0,-0.152400><0.049794,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.050000,0.000000,18.492206> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.553950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.542000>}
box{<0,0,-0.152400><0.011950,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.050000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.847981,0.000000,18.553950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.553950>}
box{<0,0,-0.152400><1.202019,0.035000,0.152400> rotate<0,0.000000,0> translate<17.847981,0.000000,18.553950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.083137,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.083137,0.000000,15.621131>}
box{<0,0,-0.152400><1.396869,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.083137,0.000000,15.621131> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.083137,0.000000,17.018000>}
box{<0,0,-0.152400><0.033137,0.035000,0.152400> rotate<0,0.000000,0> translate<19.050000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.978622,0.000000,18.492206>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.978622,0.000000,17.065897>}
box{<0,0,-0.152400><1.426309,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.978622,0.000000,17.065897> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,18.492206>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.978622,0.000000,18.492206>}
box{<0,0,-0.152400><0.928622,0.035000,0.152400> rotate<0,0.000000,0> translate<19.050000,0.000000,18.492206> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,7.565022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,5.080000>}
box{<0,0,-0.152400><2.485022,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.320000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,34.181550>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,30.480000>}
box{<0,0,-0.152400><3.701550,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.320000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.447641,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.447641,0.000000,26.892716>}
box{<0,0,-0.152400><3.587284,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.447641,0.000000,26.892716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.447641,0.000000,30.480000>}
box{<0,0,-0.152400><0.127641,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.821356,0.000000,24.932822>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.821356,0.000000,24.918450>}
box{<0,0,-0.152400><0.014372,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.821356,0.000000,24.918450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.086956,0.000000,24.932822>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.821356,0.000000,24.932822>}
box{<0,0,-0.152400><2.734400,0.035000,0.152400> rotate<0,0.000000,0> translate<18.086956,0.000000,24.932822> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,22.092256>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,22.860000>}
box{<0,0,-0.152400><0.767744,0.035000,0.152400> rotate<0,90.000000,0> translate<20.879788,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.821356,0.000000,24.918450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,24.918450>}
box{<0,0,-0.152400><0.058431,0.035000,0.152400> rotate<0,0.000000,0> translate<20.821356,0.000000,24.918450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,22.092256>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,24.918450>}
box{<0,0,-0.152400><2.826194,0.035000,0.152400> rotate<0,90.000000,0> translate<20.879788,0.000000,24.918450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,17.065897>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,16.886875>}
box{<0,0,-0.152400><0.179022,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.034178,0.000000,16.886875> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.978622,0.000000,17.065897>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,17.065897>}
box{<0,0,-0.152400><1.055556,0.035000,0.152400> rotate<0,0.000000,0> translate<19.978622,0.000000,17.065897> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.879788,0.000000,20.568256>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,20.568256>}
box{<0,0,-0.152400><0.154391,0.035000,0.152400> rotate<0,0.000000,0> translate<20.879788,0.000000,20.568256> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,18.589897>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,20.568256>}
box{<0,0,-0.152400><1.978359,0.035000,0.152400> rotate<0,90.000000,0> translate<21.034178,0.000000,20.568256> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.782113,0.000000,11.950397>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,11.938000>}
box{<0,0,-0.152400><3.807908,0.035000,0.152400> rotate<0,0.186518,0> translate<17.782113,0.000000,11.950397> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,25.878903>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.784263,0.000000,25.878903>}
box{<0,0,-0.152400><7.814262,0.035000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,25.878903> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.447641,0.000000,26.892716>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.944544,0.000000,26.892716>}
box{<0,0,-0.152400><1.496903,0.035000,0.152400> rotate<0,0.000000,0> translate<20.447641,0.000000,26.892716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.034178,0.000000,16.886875>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.603325,0.000000,16.886875>}
box{<0,0,-0.152400><1.569147,0.035000,0.152400> rotate<0,0.000000,0> translate<21.034178,0.000000,16.886875> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.603325,0.000000,16.886875>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.603325,0.000000,21.486772>}
box{<0,0,-0.152400><4.599897,0.035000,0.152400> rotate<0,90.000000,0> translate<22.603325,0.000000,21.486772> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.850103,0.000000,12.539263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.850103,0.000000,12.752697>}
box{<0,0,-0.152400><0.213434,0.035000,0.152400> rotate<0,90.000000,0> translate<22.850103,0.000000,12.752697> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.227925,0.000000,10.458278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.903491,0.000000,10.458278>}
box{<0,0,-0.152400><21.675566,0.035000,0.152400> rotate<0,0.000000,0> translate<1.227925,0.000000,10.458278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.850103,0.000000,12.539263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.903491,0.000000,12.539263>}
box{<0,0,-0.152400><0.053387,0.035000,0.152400> rotate<0,0.000000,0> translate<22.850103,0.000000,12.539263> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.903491,0.000000,10.458278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.903491,0.000000,12.539263>}
box{<0,0,-0.152400><2.080984,0.035000,0.152400> rotate<0,90.000000,0> translate<22.903491,0.000000,12.539263> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.197125,0.000000,9.817975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.330597,0.000000,9.817975>}
box{<0,0,-0.152400><13.133472,0.035000,0.152400> rotate<0,0.000000,0> translate<10.197125,0.000000,9.817975> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.330597,0.000000,9.817975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.330597,0.000000,9.924694>}
box{<0,0,-0.152400><0.106719,0.035000,0.152400> rotate<0,90.000000,0> translate<23.330597,0.000000,9.924694> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.083137,0.000000,15.621131>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.344419,0.000000,15.621131>}
box{<0,0,-0.152400><4.261281,0.035000,0.152400> rotate<0,0.000000,0> translate<19.083137,0.000000,15.621131> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.344419,0.000000,15.621131>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.344419,0.000000,20.035797>}
box{<0,0,-0.152400><4.414666,0.035000,0.152400> rotate<0,90.000000,0> translate<23.344419,0.000000,20.035797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,9.467900>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.363903,-1.535000,9.467900>}
box{<0,0,-0.152400><19.553903,0.035000,0.152400> rotate<0,0.000000,0> translate<3.810000,-1.535000,9.467900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.363903,-1.535000,12.220794>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.363903,-1.535000,9.467900>}
box{<0,0,-0.152400><2.752894,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.363903,-1.535000,9.467900> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.330597,0.000000,9.924694>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.544150,0.000000,9.924694>}
box{<0,0,-0.152400><0.213553,0.035000,0.152400> rotate<0,0.000000,0> translate<23.330597,0.000000,9.924694> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.544150,0.000000,9.924694>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.544150,0.000000,12.059034>}
box{<0,0,-0.152400><2.134341,0.035000,0.152400> rotate<0,90.000000,0> translate<23.544150,0.000000,12.059034> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,8.721787>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.160691,-1.535000,8.721787>}
box{<0,0,-0.152400><15.270691,0.035000,0.152400> rotate<0,0.000000,0> translate<8.890000,-1.535000,8.721787> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.160691,-1.535000,11.088763>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.160691,-1.535000,8.721787>}
box{<0,0,-0.152400><2.366975,0.035000,0.152400> rotate<0,-90.000000,0> translate<24.160691,-1.535000,8.721787> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.160691,-1.535000,11.088763>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.623344,-1.535000,11.088763>}
box{<0,0,-0.152400><0.462653,0.035000,0.152400> rotate<0,0.000000,0> translate<24.160691,-1.535000,11.088763> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.623344,0.000000,10.522747>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.623344,0.000000,11.088763>}
box{<0,0,-0.152400><0.566016,0.035000,0.152400> rotate<0,90.000000,0> translate<24.623344,0.000000,11.088763> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,7.565022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.924250,0.000000,7.565022>}
box{<0,0,-0.152400><4.604250,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,7.565022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.924250,0.000000,9.911722>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.924250,0.000000,7.565022>}
box{<0,0,-0.152400><2.346700,0.035000,0.152400> rotate<0,-90.000000,0> translate<24.924250,0.000000,7.565022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.784263,0.000000,25.878903>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.252569,0.000000,22.410597>}
box{<0,0,-0.152400><4.904926,0.035000,0.152400> rotate<0,44.997030,0> translate<21.784263,0.000000,25.878903> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,9.263294>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,5.080000>}
box{<0,0,-0.152400><4.183294,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.400000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,13.462000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.590000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,15.621000>}
box{<0,0,-0.152400><2.159000,0.035000,0.152400> rotate<0,90.000000,0> translate<25.400000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,20.035797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,19.939000>}
box{<0,0,-0.152400><0.096797,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.400000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.344419,0.000000,20.035797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,20.035797>}
box{<0,0,-0.152400><2.055581,0.035000,0.152400> rotate<0,0.000000,0> translate<23.344419,0.000000,20.035797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,33.439750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,30.480000>}
box{<0,0,-0.152400><2.959750,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.400000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.412731,0.000000,30.467269>}
box{<0,0,-0.152400><0.018005,0.035000,0.152400> rotate<0,44.997030,0> translate<25.400000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.412731,0.000000,24.651656>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.412731,0.000000,30.467269>}
box{<0,0,-0.152400><5.815613,0.035000,0.152400> rotate<0,90.000000,0> translate<25.412731,0.000000,30.467269> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.944544,0.000000,26.892716>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.626284,0.000000,23.210975>}
box{<0,0,-0.152400><5.206768,0.035000,0.152400> rotate<0,44.997030,0> translate<21.944544,0.000000,26.892716> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.412731,0.000000,24.651656>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.213109,0.000000,23.851278>}
box{<0,0,-0.152400><1.131906,0.035000,0.152400> rotate<0,44.997030,0> translate<25.412731,0.000000,24.651656> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.345713,0.000000,27.686759>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.345716,0.000000,24.601425>}
box{<0,0,-0.152400><3.085334,0.035000,0.152400> rotate<0,89.994002,0> translate<26.345713,0.000000,27.686759> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.850103,0.000000,12.752697>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.373719,0.000000,12.752697>}
box{<0,0,-0.152400><3.523616,0.035000,0.152400> rotate<0,0.000000,0> translate<22.850103,0.000000,12.752697> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.373719,0.000000,12.752697>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.373719,0.000000,14.033303>}
box{<0,0,-0.152400><1.280606,0.035000,0.152400> rotate<0,90.000000,0> translate<26.373719,0.000000,14.033303> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.587269,0.000000,14.033303>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.587269,0.000000,13.979944>}
box{<0,0,-0.152400><0.053359,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.587269,0.000000,13.979944> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.373719,0.000000,14.033303>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.587269,0.000000,14.033303>}
box{<0,0,-0.152400><0.213550,0.035000,0.152400> rotate<0,0.000000,0> translate<26.373719,0.000000,14.033303> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.957247,0.000000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.957247,0.000000,16.609028>}
box{<0,0,-0.152400><3.329972,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.957247,0.000000,16.609028> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.957247,0.000000,19.939000>}
box{<0,0,-0.152400><1.557247,0.035000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.950281,0.000000,25.113000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.963334,0.000000,27.116212>}
box{<0,0,-0.152400><2.003255,0.035000,0.152400> rotate<0,-89.620745,0> translate<26.950281,0.000000,25.113000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.544150,0.000000,12.059034>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.067763,0.000000,12.059034>}
box{<0,0,-0.152400><3.523612,0.035000,0.152400> rotate<0,0.000000,0> translate<23.544150,0.000000,12.059034> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.067763,0.000000,12.059034>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.067763,0.000000,13.286284>}
box{<0,0,-0.152400><1.227250,0.035000,0.152400> rotate<0,90.000000,0> translate<27.067763,0.000000,13.286284> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.420428,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.420428,0.000000,14.911078>}
box{<0,0,-0.152400><0.709922,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.420428,0.000000,14.911078> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.420428,0.000000,15.621000>}
box{<0,0,-0.152400><2.020428,0.035000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,18.924413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,17.349950>}
box{<0,0,-0.152400><1.574463,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.636581,0.000000,17.349950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,21.486772>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,18.924413>}
box{<0,0,-0.152400><2.562359,0.035000,0.152400> rotate<0,-90.000000,0> translate<27.636581,0.000000,18.924413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.603325,0.000000,21.486772>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,21.486772>}
box{<0,0,-0.152400><5.033256,0.035000,0.152400> rotate<0,0.000000,0> translate<22.603325,0.000000,21.486772> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.694966,0.000000,25.688103>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.694966,0.000000,26.491413>}
box{<0,0,-0.152400><0.803309,0.035000,0.152400> rotate<0,90.000000,0> translate<27.694966,0.000000,26.491413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.694966,0.000000,26.491413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.730656,0.000000,26.491413>}
box{<0,0,-0.152400><0.035691,0.035000,0.152400> rotate<0,0.000000,0> translate<27.694966,0.000000,26.491413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.730656,0.000000,26.491413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.730656,0.000000,26.544969>}
box{<0,0,-0.152400><0.053556,0.035000,0.152400> rotate<0,90.000000,0> translate<27.730656,0.000000,26.544969> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,17.349950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.760097,0.000000,17.349950>}
box{<0,0,-0.152400><0.123516,0.035000,0.152400> rotate<0,0.000000,0> translate<27.636581,0.000000,17.349950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.760097,0.000000,17.349950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.760097,0.000000,17.380000>}
box{<0,0,-0.152400><0.030050,0.035000,0.152400> rotate<0,90.000000,0> translate<27.760097,0.000000,17.380000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.007128,0.000000,16.609028>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.007128,0.000000,15.837234>}
box{<0,0,-0.152400><0.771794,0.035000,0.152400> rotate<0,-90.000000,0> translate<28.007128,0.000000,15.837234> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.957247,0.000000,16.609028>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.007128,0.000000,16.609028>}
box{<0,0,-0.152400><1.049881,0.035000,0.152400> rotate<0,0.000000,0> translate<26.957247,0.000000,16.609028> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.295687,0.000000,22.410597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.295687,0.000000,19.902744>}
box{<0,0,-0.152400><2.507853,0.035000,0.152400> rotate<0,-90.000000,0> translate<28.295687,0.000000,19.902744> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.252569,0.000000,22.410597>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.295687,0.000000,22.410597>}
box{<0,0,-0.152400><3.043119,0.035000,0.152400> rotate<0,0.000000,0> translate<25.252569,0.000000,22.410597> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.363903,-1.535000,12.220794>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.375962,-1.535000,12.220794>}
box{<0,0,-0.152400><5.012059,0.035000,0.152400> rotate<0,0.000000,0> translate<23.363903,-1.535000,12.220794> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.375962,0.000000,11.088763>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.375962,0.000000,12.220794>}
box{<0,0,-0.152400><1.132031,0.035000,0.152400> rotate<0,90.000000,0> translate<28.375962,0.000000,12.220794> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.821356,-1.535000,24.918450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.562628,-1.535000,24.918450>}
box{<0,0,-0.152400><7.741272,0.035000,0.152400> rotate<0,0.000000,0> translate<20.821356,-1.535000,24.918450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.562628,-1.535000,24.918450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.562628,-1.535000,25.665469>}
box{<0,0,-0.152400><0.747019,0.035000,0.152400> rotate<0,90.000000,0> translate<28.562628,-1.535000,25.665469> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.882956,0.000000,23.210975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.882956,0.000000,20.649766>}
box{<0,0,-0.152400><2.561209,0.035000,0.152400> rotate<0,-90.000000,0> translate<28.882956,0.000000,20.649766> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.626284,0.000000,23.210975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.882956,0.000000,23.210975>}
box{<0,0,-0.152400><3.256672,0.035000,0.152400> rotate<0,0.000000,0> translate<25.626284,0.000000,23.210975> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.213109,0.000000,23.851278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.523616,0.000000,23.851278>}
box{<0,0,-0.152400><3.310506,0.035000,0.152400> rotate<0,0.000000,0> translate<26.213109,0.000000,23.851278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.523616,0.000000,23.157619>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.523616,0.000000,23.851278>}
box{<0,0,-0.152400><0.693659,0.035000,0.152400> rotate<0,90.000000,0> translate<29.523616,0.000000,23.851278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.683778,0.000000,13.286284>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.683778,0.000000,11.632169>}
box{<0,0,-0.152400><1.654116,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.683778,0.000000,11.632169> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.067763,0.000000,13.286284>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.683778,0.000000,13.286284>}
box{<0,0,-0.152400><2.616016,0.035000,0.152400> rotate<0,0.000000,0> translate<27.067763,0.000000,13.286284> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.420428,0.000000,14.911078>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,14.911078>}
box{<0,0,-0.152400><2.576972,0.035000,0.152400> rotate<0,0.000000,0> translate<27.420428,0.000000,14.911078> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,14.911078>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,14.980000>}
box{<0,0,-0.152400><0.068922,0.035000,0.152400> rotate<0,90.000000,0> translate<29.997400,0.000000,14.980000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,15.837234>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,15.780000>}
box{<0,0,-0.152400><0.057234,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.997400,0.000000,15.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.007128,0.000000,15.837234>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,15.837234>}
box{<0,0,-0.152400><1.990272,0.035000,0.152400> rotate<0,0.000000,0> translate<28.007128,0.000000,15.837234> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.760097,0.000000,17.380000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,17.380000>}
box{<0,0,-0.152400><2.237303,0.035000,0.152400> rotate<0,0.000000,0> translate<27.760097,0.000000,17.380000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.245234>}
box{<0,0,-0.152400><0.065234,0.035000,0.152400> rotate<0,90.000000,0> translate<29.997400,0.000000,18.245234> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.636581,0.000000,18.924413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.924413>}
box{<0,0,-0.152400><2.360819,0.035000,0.152400> rotate<0,0.000000,0> translate<27.636581,0.000000,18.924413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.980000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.924413>}
box{<0,0,-0.152400><0.055587,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.997400,0.000000,18.924413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.985100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.980000>}
box{<0,0,-0.152400><0.005100,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.997400,0.000000,18.980000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,19.902744>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,19.780000>}
box{<0,0,-0.152400><0.122744,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.997400,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.295687,0.000000,19.902744>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,19.902744>}
box{<0,0,-0.152400><1.701713,0.035000,0.152400> rotate<0,0.000000,0> translate<28.295687,0.000000,19.902744> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,20.649766>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,20.580000>}
box{<0,0,-0.152400><0.069766,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.997400,0.000000,20.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.882956,0.000000,20.649766>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,20.649766>}
box{<0,0,-0.152400><1.114444,0.035000,0.152400> rotate<0,0.000000,0> translate<28.882956,0.000000,20.649766> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.345716,0.000000,24.601425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.120525,0.000000,24.619275>}
box{<0,0,-0.152400><3.774852,0.035000,0.152400> rotate<0,-0.270916,0> translate<26.345716,0.000000,24.601425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.120525,0.000000,24.619275>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.159697,0.000000,23.683725>}
box{<0,0,-0.152400><0.936370,0.035000,0.152400> rotate<0,87.596620,0> translate<30.120525,0.000000,24.619275> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.271047,0.000000,13.979944>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.271047,0.000000,12.325828>}
box{<0,0,-0.152400><1.654116,0.035000,0.152400> rotate<0,-90.000000,0> translate<30.271047,0.000000,12.325828> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.587269,0.000000,13.979944>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.271047,0.000000,13.979944>}
box{<0,0,-0.152400><3.683778,0.035000,0.152400> rotate<0,0.000000,0> translate<26.587269,0.000000,13.979944> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.345713,0.000000,27.686759>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.464403,0.000000,27.668909>}
box{<0,0,-0.152400><4.118729,0.035000,0.152400> rotate<0,0.248296,0> translate<26.345713,0.000000,27.686759> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,8.707494>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,5.080000>}
box{<0,0,-0.152400><3.627494,0.035000,0.152400> rotate<0,-90.000000,0> translate<30.480000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,33.191000>}
box{<0,0,-0.152400><2.711000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.480000,-1.535000,33.191000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.484600,0.000000,30.475400>}
box{<0,0,-0.152400><0.006505,0.035000,0.152400> rotate<0,44.997030,0> translate<30.480000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.464403,0.000000,27.668909>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.500094,0.000000,28.111816>}
box{<0,0,-0.152400><0.444342,0.035000,0.152400> rotate<0,-85.387265,0> translate<30.464403,0.000000,27.668909> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.484600,0.000000,30.475400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.500094,0.000000,28.111816>}
box{<0,0,-0.152400><2.363635,0.035000,0.152400> rotate<0,89.618506,0> translate<30.484600,0.000000,30.475400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.950281,0.000000,25.113000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.730738,0.000000,25.155019>}
box{<0,0,-0.152400><3.780690,0.035000,0.152400> rotate<0,-0.636759,0> translate<26.950281,0.000000,25.113000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.720319,0.000000,24.190075>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.730738,0.000000,25.155019>}
box{<0,0,-0.152400><0.965000,0.035000,0.152400> rotate<0,-89.375488,0> translate<30.720319,0.000000,24.190075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.963334,0.000000,27.116212>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.326563,0.000000,27.098363>}
box{<0,0,-0.152400><4.363265,0.035000,0.152400> rotate<0,0.234381,0> translate<26.963334,0.000000,27.116212> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.318659,0.000000,28.107613>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.326563,0.000000,27.098363>}
box{<0,0,-0.152400><1.009281,0.035000,0.152400> rotate<0,89.545434,0> translate<31.318659,0.000000,28.107613> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.694966,0.000000,25.688103>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.424506,0.000000,25.688103>}
box{<0,0,-0.152400><3.729541,0.035000,0.152400> rotate<0,0.000000,0> translate<27.694966,0.000000,25.688103> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.424506,0.000000,24.706278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.424506,0.000000,25.688103>}
box{<0,0,-0.152400><0.981825,0.035000,0.152400> rotate<0,90.000000,0> translate<31.424506,0.000000,25.688103> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.490000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.498975,0.000000,22.072600>}
box{<0,0,-0.152400><0.008975,0.035000,0.152400> rotate<0,0.000000,0> translate<31.490000,0.000000,22.072600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.523616,0.000000,23.157619>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.498975,0.000000,23.157619>}
box{<0,0,-0.152400><1.975359,0.035000,0.152400> rotate<0,0.000000,0> translate<29.523616,0.000000,23.157619> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.498975,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.498975,0.000000,23.157619>}
box{<0,0,-0.152400><1.085019,0.035000,0.152400> rotate<0,90.000000,0> translate<31.498975,0.000000,23.157619> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.527316,0.000000,18.245234>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.527316,0.000000,16.516413>}
box{<0,0,-0.152400><1.728822,0.035000,0.152400> rotate<0,-90.000000,0> translate<31.527316,0.000000,16.516413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.245234>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.527316,0.000000,18.245234>}
box{<0,0,-0.152400><1.529916,0.035000,0.152400> rotate<0,0.000000,0> translate<29.997400,0.000000,18.245234> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.271047,0.000000,12.325828>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.552363,0.000000,12.325828>}
box{<0,0,-0.152400><1.281316,0.035000,0.152400> rotate<0,0.000000,0> translate<30.271047,0.000000,12.325828> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.490000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.552363,0.000000,13.487400>}
box{<0,0,-0.152400><0.062362,0.035000,0.152400> rotate<0,0.000000,0> translate<31.490000,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.552363,0.000000,12.325828>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.552363,0.000000,13.487400>}
box{<0,0,-0.152400><1.161572,0.035000,0.152400> rotate<0,90.000000,0> translate<31.552363,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.527316,0.000000,16.516413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.516413>}
box{<0,0,-0.152400><0.030881,0.035000,0.152400> rotate<0,0.000000,0> translate<31.527316,0.000000,16.516413> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.516413>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.547284>}
box{<0,0,-0.152400><0.030872,0.035000,0.152400> rotate<0,90.000000,0> translate<31.558197,0.000000,16.547284> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,16.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.580000>}
box{<0,0,-0.152400><1.560797,0.035000,0.152400> rotate<0,0.000000,0> translate<29.997400,0.000000,16.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.547284>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.580000>}
box{<0,0,-0.152400><0.032716,0.035000,0.152400> rotate<0,90.000000,0> translate<31.558197,0.000000,16.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.730656,0.000000,26.544969>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.173984,0.000000,26.544969>}
box{<0,0,-0.152400><4.443328,0.035000,0.152400> rotate<0,0.000000,0> translate<27.730656,0.000000,26.544969> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.120450,0.000000,27.473237>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.173984,0.000000,27.473237>}
box{<0,0,-0.152400><0.053534,0.035000,0.152400> rotate<0,0.000000,0> translate<32.120450,0.000000,27.473237> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.173984,0.000000,26.544969>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.173984,0.000000,27.473237>}
box{<0,0,-0.152400><0.928269,0.035000,0.152400> rotate<0,90.000000,0> translate<32.173984,0.000000,27.473237> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.683778,0.000000,11.632169>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.299797,0.000000,11.632169>}
box{<0,0,-0.152400><2.616019,0.035000,0.152400> rotate<0,0.000000,0> translate<29.683778,0.000000,11.632169> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.290000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.299797,0.000000,13.487400>}
box{<0,0,-0.152400><0.009797,0.035000,0.152400> rotate<0,0.000000,0> translate<32.290000,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.299797,0.000000,11.632169>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.299797,0.000000,13.487400>}
box{<0,0,-0.152400><1.855231,0.035000,0.152400> rotate<0,90.000000,0> translate<32.299797,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.159697,0.000000,23.683725>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.306894,0.000000,23.682550>}
box{<0,0,-0.152400><2.147197,0.035000,0.152400> rotate<0,0.031352,0> translate<30.159697,0.000000,23.683725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.290000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.314756,0.000000,23.446038>}
box{<0,0,-0.152400><1.373661,0.035000,0.152400> rotate<0,-88.961482,0> translate<32.290000,0.000000,22.072600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.306894,0.000000,23.682550>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.314756,0.000000,23.446038>}
box{<0,0,-0.152400><0.236643,0.035000,0.152400> rotate<0,88.090176,0> translate<32.306894,0.000000,23.682550> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.562628,-1.535000,25.665469>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.406572,-1.535000,25.665469>}
box{<0,0,-0.152400><3.843944,0.035000,0.152400> rotate<0,0.000000,0> translate<28.562628,-1.535000,25.665469> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.997400,0.000000,18.985100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.561166,0.000000,18.985100>}
box{<0,0,-0.152400><2.563766,0.035000,0.152400> rotate<0,0.000000,0> translate<29.997400,0.000000,18.985100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.561166,0.000000,18.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.561166,0.000000,18.985100>}
box{<0,0,-0.152400><0.805100,0.035000,0.152400> rotate<0,90.000000,0> translate<32.561166,0.000000,18.985100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.720319,0.000000,24.190075>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.021363,0.000000,24.202519>}
box{<0,0,-0.152400><2.301077,0.035000,0.152400> rotate<0,-0.309825,0> translate<30.720319,0.000000,24.190075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.375962,0.000000,11.088763>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.053881,0.000000,11.088763>}
box{<0,0,-0.152400><4.677919,0.035000,0.152400> rotate<0,0.000000,0> translate<28.375962,0.000000,11.088763> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.053881,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.053881,0.000000,11.088763>}
box{<0,0,-0.152400><2.398637,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.053881,0.000000,11.088763> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.053881,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.090000,0.000000,13.487400>}
box{<0,0,-0.152400><0.036119,0.035000,0.152400> rotate<0,0.000000,0> translate<33.053881,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.021363,0.000000,24.202519>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.090000,0.000000,22.072600>}
box{<0,0,-0.152400><2.131024,0.035000,0.152400> rotate<0,88.148441,0> translate<33.021363,0.000000,24.202519> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.424506,0.000000,24.706278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.369578,0.000000,24.706278>}
box{<0,0,-0.152400><1.945072,0.035000,0.152400> rotate<0,0.000000,0> translate<31.424506,0.000000,24.706278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.369578,0.000000,24.581319>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.369578,0.000000,24.706278>}
box{<0,0,-0.152400><0.124959,0.035000,0.152400> rotate<0,90.000000,0> translate<33.369578,0.000000,24.706278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.369578,0.000000,24.581319>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.887075,0.000000,24.581319>}
box{<0,0,-0.152400><0.517497,0.035000,0.152400> rotate<0,0.000000,0> translate<33.369578,0.000000,24.581319> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.887075,0.000000,24.152884>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.887075,0.000000,24.581319>}
box{<0,0,-0.152400><0.428434,0.035000,0.152400> rotate<0,90.000000,0> translate<33.887075,0.000000,24.581319> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,23.916994>}
box{<0,0,-0.152400><1.844394,0.035000,0.152400> rotate<0,90.000000,0> translate<33.890000,0.000000,23.916994> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.887075,0.000000,24.152884>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,24.152884>}
box{<0,0,-0.152400><0.002925,0.035000,0.152400> rotate<0,0.000000,0> translate<33.887075,0.000000,24.152884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,24.152884>}
box{<0,0,-0.152400><2.080284,0.035000,0.152400> rotate<0,90.000000,0> translate<33.890000,0.000000,24.152884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.623344,0.000000,10.522747>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.902078,0.000000,10.522747>}
box{<0,0,-0.152400><9.278734,0.035000,0.152400> rotate<0,0.000000,0> translate<24.623344,0.000000,10.522747> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.902078,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.902078,0.000000,10.522747>}
box{<0,0,-0.152400><2.964653,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.902078,0.000000,10.522747> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.902078,0.000000,13.487400>}
box{<0,0,-0.152400><0.012078,0.035000,0.152400> rotate<0,0.000000,0> translate<33.890000,0.000000,13.487400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.890000,0.000000,23.916994>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.978950,0.000000,24.024100>}
box{<0,0,-0.152400><0.139226,0.035000,0.152400> rotate<0,-50.287601,0> translate<33.890000,0.000000,23.916994> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.954994,0.000000,25.530978>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.978950,0.000000,25.548100>}
box{<0,0,-0.152400><0.029446,0.035000,0.152400> rotate<0,-35.551589,0> translate<33.954994,0.000000,25.530978> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.406572,0.000000,25.665469>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.048428,0.000000,25.655209>}
box{<0,0,-0.152400><1.641888,0.035000,0.152400> rotate<0,0.357993,0> translate<32.406572,0.000000,25.665469> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.978950,0.000000,25.548100>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.048428,0.000000,25.655209>}
box{<0,0,-0.152400><0.127670,0.035000,0.152400> rotate<0,-57.026165,0> translate<33.978950,0.000000,25.548100> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.244656,0.000000,16.547284>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.244656,0.000000,15.780000>}
box{<0,0,-0.152400><0.767284,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.244656,0.000000,15.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.558197,0.000000,16.547284>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.244656,0.000000,16.547284>}
box{<0,0,-0.152400><2.686459,0.035000,0.152400> rotate<0,0.000000,0> translate<31.558197,0.000000,16.547284> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,10.728572>}
box{<0,0,-0.152400><2.758828,0.035000,0.152400> rotate<0,-90.000000,0> translate<34.690000,0.000000,10.728572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,23.123244>}
box{<0,0,-0.152400><1.050644,0.035000,0.152400> rotate<0,90.000000,0> translate<34.690000,0.000000,23.123244> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.488659,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.488659,0.000000,23.000075>}
box{<0,0,-0.152400><0.927475,0.035000,0.152400> rotate<0,90.000000,0> translate<35.488659,0.000000,23.000075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.490000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.490000,0.000000,11.609994>}
box{<0,0,-0.152400><1.877406,0.035000,0.152400> rotate<0,-90.000000,0> translate<35.490000,0.000000,11.609994> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.488659,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.490000,0.000000,22.072600>}
box{<0,0,-0.152400><0.001341,0.035000,0.152400> rotate<0,0.000000,0> translate<35.488659,0.000000,22.072600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.954994,0.000000,25.530978>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.809859,0.000000,25.691638>}
box{<0,0,-0.152400><1.861810,0.035000,0.152400> rotate<0,-4.949998,0> translate<33.954994,0.000000,25.530978> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,23.123244>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.810309,0.000000,24.243553>}
box{<0,0,-0.152400><1.584357,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.690000,0.000000,23.123244> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.488659,0.000000,23.000075>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.089072,0.000000,23.600487>}
box{<0,0,-0.152400><0.849112,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.488659,0.000000,23.000075> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.810309,0.000000,24.243553>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.240075,0.000000,24.243553>}
box{<0,0,-0.152400><0.429766,0.035000,0.152400> rotate<0,0.000000,0> translate<35.810309,0.000000,24.243553> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,12.258425>}
box{<0,0,-0.152400><1.228975,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.290000,0.000000,12.258425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,22.793756>}
box{<0,0,-0.152400><0.721156,0.035000,0.152400> rotate<0,90.000000,0> translate<36.290000,0.000000,22.793756> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.089072,0.000000,23.600487>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.540256,0.000000,23.600487>}
box{<0,0,-0.152400><0.451184,0.035000,0.152400> rotate<0,0.000000,0> translate<36.089072,0.000000,23.600487> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,22.793756>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.603713,0.000000,23.107469>}
box{<0,0,-0.152400><0.443656,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.290000,0.000000,22.793756> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,8.013084>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,5.080000>}
box{<0,0,-0.152400><2.933084,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.830000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,32.523622>}
box{<0,0,-0.152400><2.043622,0.035000,0.152400> rotate<0,90.000000,0> translate<36.830000,-1.535000,32.523622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.318659,0.000000,28.107613>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.837784,0.000000,28.104044>}
box{<0,0,-0.152400><5.519126,0.035000,0.152400> rotate<0,0.037046,0> translate<31.318659,0.000000,28.107613> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.837784,0.000000,30.480000>}
box{<0,0,-0.152400><0.007784,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.837784,0.000000,28.104044>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.837784,0.000000,30.480000>}
box{<0,0,-0.152400><2.375956,0.035000,0.152400> rotate<0,90.000000,0> translate<36.837784,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.876766,-1.535000,5.080000>}
box{<0,0,-0.152400><0.046766,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.876766,-1.535000,2.048241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.876766,-1.535000,5.080000>}
box{<0,0,-0.152400><3.031759,0.035000,0.152400> rotate<0,90.000000,0> translate<36.876766,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.603713,0.000000,23.107469>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.990509,0.000000,23.107469>}
box{<0,0,-0.152400><0.386797,0.035000,0.152400> rotate<0,0.000000,0> translate<36.603713,0.000000,23.107469> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,13.487400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,12.968609>}
box{<0,0,-0.152400><0.518791,0.035000,0.152400> rotate<0,-90.000000,0> translate<37.090000,0.000000,12.968609> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,22.072600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,22.263728>}
box{<0,0,-0.152400><0.191128,0.035000,0.152400> rotate<0,90.000000,0> translate<37.090000,0.000000,22.263728> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.173984,0.000000,27.473237>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.449072,0.000000,27.473237>}
box{<0,0,-0.152400><5.275087,0.035000,0.152400> rotate<0,0.000000,0> translate<32.173984,0.000000,27.473237> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.449072,0.000000,27.473237>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.449072,0.000000,28.249331>}
box{<0,0,-0.152400><0.776094,0.035000,0.152400> rotate<0,90.000000,0> translate<37.449072,0.000000,28.249331> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.126188,0.000000,21.499806>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.126188,0.000000,22.228616>}
box{<0,0,-0.152400><0.728809,0.035000,0.152400> rotate<0,90.000000,0> translate<38.126188,0.000000,22.228616> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.126188,0.000000,22.228616>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.212497,0.000000,22.228616>}
box{<0,0,-0.152400><0.086309,0.035000,0.152400> rotate<0,0.000000,0> translate<38.126188,0.000000,22.228616> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,14.980000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,14.961841>}
box{<0,0,-0.152400><0.018159,0.035000,0.152400> rotate<0,-90.000000,0> translate<38.582600,0.000000,14.961841> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,15.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,15.713747>}
box{<0,0,-0.152400><0.066253,0.035000,0.152400> rotate<0,-90.000000,0> translate<38.582600,0.000000,15.713747> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.244656,0.000000,15.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,15.780000>}
box{<0,0,-0.152400><4.337944,0.035000,0.152400> rotate<0,0.000000,0> translate<34.244656,0.000000,15.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.561166,0.000000,18.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,18.180000>}
box{<0,0,-0.152400><6.021434,0.035000,0.152400> rotate<0,0.000000,0> translate<32.561166,0.000000,18.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,18.980000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,18.970241>}
box{<0,0,-0.152400><0.009759,0.035000,0.152400> rotate<0,-90.000000,0> translate<38.582600,0.000000,18.970241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.240075,0.000000,24.243553>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.705156,0.000000,26.708634>}
box{<0,0,-0.152400><3.486151,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.240075,0.000000,24.243553> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,8.104316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.837028,-1.535000,8.104316>}
box{<0,0,-0.152400><24.867028,0.035000,0.152400> rotate<0,0.000000,0> translate<13.970000,-1.535000,8.104316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.837028,-1.535000,10.728572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.837028,-1.535000,8.104316>}
box{<0,0,-0.152400><2.624256,0.035000,0.152400> rotate<0,-90.000000,0> translate<38.837028,-1.535000,8.104316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.690000,0.000000,10.728572>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.837028,0.000000,10.728572>}
box{<0,0,-0.152400><4.147028,0.035000,0.152400> rotate<0,0.000000,0> translate<34.690000,0.000000,10.728572> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.540256,0.000000,23.600487>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.941031,0.000000,26.001263>}
box{<0,0,-0.152400><3.395209,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.540256,0.000000,23.600487> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,20.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.112578,0.000000,20.580000>}
box{<0,0,-0.152400><0.529978,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,20.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.126188,0.000000,21.499806>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.112578,0.000000,21.499806>}
box{<0,0,-0.152400><0.986391,0.035000,0.152400> rotate<0,0.000000,0> translate<38.126188,0.000000,21.499806> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.112578,0.000000,20.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.112578,0.000000,21.499806>}
box{<0,0,-0.152400><0.919806,0.035000,0.152400> rotate<0,90.000000,0> translate<39.112578,0.000000,21.499806> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.990509,0.000000,23.107469>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.241238,0.000000,25.358197>}
box{<0,0,-0.152400><3.183010,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.990509,0.000000,23.107469> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.341369,0.000000,14.961841>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.341369,0.000000,13.675666>}
box{<0,0,-0.152400><1.286175,0.035000,0.152400> rotate<0,-90.000000,0> translate<39.341369,0.000000,13.675666> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,14.961841>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.341369,0.000000,14.961841>}
box{<0,0,-0.152400><0.758769,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,14.961841> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,22.263728>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.434228,0.000000,24.607956>}
box{<0,0,-0.152400><3.315239,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.090000,0.000000,22.263728> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,19.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,19.780000>}
box{<0,0,-0.152400><1.108947,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,19.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,22.550022>}
box{<0,0,-0.152400><2.770022,0.035000,0.152400> rotate<0,90.000000,0> translate<39.691547,0.000000,22.550022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.212497,0.000000,22.228616>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,23.707666>}
box{<0,0,-0.152400><2.091693,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.212497,0.000000,22.228616> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.019359,0.000000,18.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.019359,0.000000,17.803769>}
box{<0,0,-0.152400><0.376231,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.019359,0.000000,17.803769> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,18.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.019359,0.000000,18.180000>}
box{<0,0,-0.152400><1.436759,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,18.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,22.550022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.034641,0.000000,22.893116>}
box{<0,0,-0.152400><0.485208,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.691547,0.000000,22.550022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.096466,0.000000,15.713747>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.096466,0.000000,14.433403>}
box{<0,0,-0.152400><1.280344,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.096466,0.000000,14.433403> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,15.713747>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.096466,0.000000,15.713747>}
box{<0,0,-0.152400><1.513866,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,15.713747> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.924250,0.000000,9.911722>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.131744,0.000000,9.911722>}
box{<0,0,-0.152400><15.207494,0.035000,0.152400> rotate<0,0.000000,0> translate<24.924250,0.000000,9.911722> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.131744,0.000000,11.609994>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.131744,0.000000,9.911722>}
box{<0,0,-0.152400><1.698272,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.131744,0.000000,9.911722> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.490000,0.000000,11.609994>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.131744,0.000000,11.609994>}
box{<0,0,-0.152400><4.641744,0.035000,0.152400> rotate<0,0.000000,0> translate<35.490000,0.000000,11.609994> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,16.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.133766,0.000000,16.580000>}
box{<0,0,-0.152400><1.551166,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,16.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.133766,0.000000,16.580000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.133766,0.000000,16.612356>}
box{<0,0,-0.152400><0.032356,0.035000,0.152400> rotate<0,90.000000,0> translate<40.133766,0.000000,16.612356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,9.263294>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.779525,0.000000,9.263294>}
box{<0,0,-0.152400><15.379525,0.035000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,9.263294> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.779525,0.000000,12.258425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.779525,0.000000,9.263294>}
box{<0,0,-0.152400><2.995131,0.035000,0.152400> rotate<0,-90.000000,0> translate<40.779525,0.000000,9.263294> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.290000,0.000000,12.258425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.779525,0.000000,12.258425>}
box{<0,0,-0.152400><4.489525,0.035000,0.152400> rotate<0,0.000000,0> translate<36.290000,0.000000,12.258425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.582600,0.000000,18.970241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.807647,0.000000,18.970241>}
box{<0,0,-0.152400><2.225047,0.035000,0.152400> rotate<0,0.000000,0> translate<38.582600,0.000000,18.970241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.090184,0.000000,21.681472>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.090184,0.000000,20.972200>}
box{<0,0,-0.152400><0.709272,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.090184,0.000000,20.972200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.809859,-1.535000,25.691638>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.112128,-1.535000,25.685347>}
box{<0,0,-0.152400><5.302272,0.035000,0.152400> rotate<0,0.067971,0> translate<35.809859,-1.535000,25.691638> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.090184,-1.535000,21.681472>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.112128,-1.535000,25.685347>}
box{<0,0,-0.152400><4.003935,0.035000,0.152400> rotate<0,-89.680067,0> translate<41.090184,-1.535000,21.681472> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,-1.535000,15.437156>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,-1.535000,5.080000>}
box{<0,0,-0.152400><10.357156,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.355906,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,0.000000,17.803769>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,0.000000,15.437156>}
box{<0,0,-0.152400><2.366612,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.355906,0.000000,15.437156> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.019359,0.000000,17.803769>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,0.000000,17.803769>}
box{<0,0,-0.152400><1.336547,0.035000,0.152400> rotate<0,0.000000,0> translate<40.019359,0.000000,17.803769> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,8.707494>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.396463,0.000000,8.707494>}
box{<0,0,-0.152400><10.916463,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,0.000000,8.707494> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.396463,0.000000,12.968609>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.396463,0.000000,8.707494>}
box{<0,0,-0.152400><4.261116,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.396463,0.000000,8.707494> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.090000,0.000000,12.968609>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.396463,0.000000,12.968609>}
box{<0,0,-0.152400><4.306463,0.035000,0.152400> rotate<0,0.000000,0> translate<37.090000,0.000000,12.968609> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,3.015262>}
box{<0,0,-0.152400><2.064738,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.910000,-1.535000,3.015262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.355906,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,5.080000>}
box{<0,0,-0.152400><0.554094,0.035000,0.152400> rotate<0,0.000000,0> translate<41.355906,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.807647,-1.535000,18.970241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,18.970241>}
box{<0,0,-0.152400><1.102353,0.035000,0.152400> rotate<0,0.000000,0> translate<40.807647,-1.535000,18.970241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,18.970241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,30.480000>}
box{<0,0,-0.152400><11.509759,0.035000,0.152400> rotate<0,90.000000,0> translate<41.910000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,8.013084>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.069050,0.000000,8.013084>}
box{<0,0,-0.152400><5.239050,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,0.000000,8.013084> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.069050,0.000000,13.675666>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.069050,0.000000,8.013084>}
box{<0,0,-0.152400><5.662581,0.035000,0.152400> rotate<0,-90.000000,0> translate<42.069050,0.000000,8.013084> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.341369,0.000000,13.675666>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.069050,0.000000,13.675666>}
box{<0,0,-0.152400><2.727681,0.035000,0.152400> rotate<0,0.000000,0> translate<39.341369,0.000000,13.675666> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.090184,0.000000,20.972200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.659638,0.000000,20.972200>}
box{<0,0,-0.152400><1.569453,0.035000,0.152400> rotate<0,0.000000,0> translate<41.090184,0.000000,20.972200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.628563,0.000000,10.102856>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.671772,0.000000,15.736838>}
box{<0,0,-0.152400><5.634147,0.035000,0.152400> rotate<0,-89.554673,0> translate<42.628563,0.000000,10.102856> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.133766,-1.535000,16.612356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.682281,-1.535000,16.612356>}
box{<0,0,-0.152400><2.548516,0.035000,0.152400> rotate<0,0.000000,0> translate<40.133766,-1.535000,16.612356> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.682281,-1.535000,16.612356>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.682281,-1.535000,27.951631>}
box{<0,0,-0.152400><11.339275,0.035000,0.152400> rotate<0,90.000000,0> translate<42.682281,-1.535000,27.951631> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.659638,0.000000,20.972200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.687966,0.000000,16.256975>}
box{<0,0,-0.152400><4.715310,0.035000,0.152400> rotate<0,89.649866,0> translate<42.659638,0.000000,20.972200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.671772,0.000000,15.736838>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.690513,0.000000,15.833256>}
box{<0,0,-0.152400><0.098223,0.035000,0.152400> rotate<0,-78.995520,0> translate<42.671772,0.000000,15.736838> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.687966,0.000000,16.256975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.690513,0.000000,15.833256>}
box{<0,0,-0.152400><0.423726,0.035000,0.152400> rotate<0,89.649696,0> translate<42.687966,0.000000,16.256975> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.096466,0.000000,14.433403>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.692456,0.000000,14.433403>}
box{<0,0,-0.152400><2.595991,0.035000,0.152400> rotate<0,0.000000,0> translate<40.096466,0.000000,14.433403> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.671772,0.000000,15.736838>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.692456,0.000000,14.536316>}
box{<0,0,-0.152400><1.200700,0.035000,0.152400> rotate<0,89.007046,0> translate<42.671772,0.000000,15.736838> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.692456,0.000000,14.433403>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.692456,0.000000,14.536316>}
box{<0,0,-0.152400><0.102913,0.035000,0.152400> rotate<0,90.000000,0> translate<42.692456,0.000000,14.536316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,0.000000,14.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,10.713431>}
box{<0,0,-0.152400><3.501885,0.035000,0.152400> rotate<0,89.573545,0> translate<44.617869,0.000000,14.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,0.000000,14.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,14.157281>}
box{<0,0,-0.152400><0.063386,0.035000,0.152400> rotate<0,66.073017,0> translate<44.617869,0.000000,14.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.687966,0.000000,16.256975>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,16.256975>}
box{<0,0,-0.152400><1.955606,0.035000,0.152400> rotate<0,0.000000,0> translate<42.687966,0.000000,16.256975> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,0.000000,16.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,16.256975>}
box{<0,0,-0.152400><0.049030,0.035000,0.152400> rotate<0,-58.379793,0> translate<44.617869,0.000000,16.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,-1.535000,18.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,-1.535000,18.192294>}
box{<0,0,-0.152400><0.034443,0.035000,0.152400> rotate<0,41.731371,0> translate<44.617869,-1.535000,18.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,-1.535000,20.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,-1.535000,26.319734>}
box{<0,0,-0.152400><6.104567,0.035000,0.152400> rotate<0,-89.752833,0> translate<44.617869,-1.535000,20.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,-1.535000,18.192294>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.992422,-1.535000,18.192294>}
box{<0,0,-0.152400><1.348850,0.035000,0.152400> rotate<0,0.000000,0> translate<44.643572,-1.535000,18.192294> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.992422,-1.535000,25.442525>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.992422,-1.535000,18.192294>}
box{<0,0,-0.152400><7.250231,0.035000,0.152400> rotate<0,-90.000000,0> translate<45.992422,-1.535000,18.192294> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.682281,-1.535000,27.951631>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,27.951631>}
box{<0,0,-0.152400><4.307719,0.035000,0.152400> rotate<0,0.000000,0> translate<42.682281,-1.535000,27.951631> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,27.951631>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,30.480000>}
box{<0,0,-0.152400><2.528369,0.035000,0.152400> rotate<0,90.000000,0> translate<46.990000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.182900,0.000000,5.080000>}
box{<0,0,-0.152400><0.192900,0.035000,0.152400> rotate<0,0.000000,0> translate<46.990000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.182900,0.000000,10.125950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.182900,0.000000,5.080000>}
box{<0,0,-0.152400><5.045950,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.182900,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.628563,0.000000,10.102856>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.182900,0.000000,10.125950>}
box{<0,0,-0.152400><4.554396,0.035000,0.152400> rotate<0,-0.290509,0> translate<42.628563,0.000000,10.102856> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.201078,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.201078,0.000000,2.593672>}
box{<0,0,-0.152400><2.486328,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.201078,0.000000,2.593672> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.182900,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.201078,0.000000,5.080000>}
box{<0,0,-0.152400><0.018178,0.035000,0.152400> rotate<0,0.000000,0> translate<47.182900,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.705156,0.000000,26.708634>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.730219,0.000000,26.679925>}
box{<0,0,-0.152400><9.025108,0.035000,0.152400> rotate<0,0.182249,0> translate<38.705156,0.000000,26.708634> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.730219,0.000000,26.679925>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.730219,0.000000,27.120281>}
box{<0,0,-0.152400><0.440356,0.035000,0.152400> rotate<0,90.000000,0> translate<47.730219,0.000000,27.120281> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.898978,0.000000,10.713431>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.898978,0.000000,6.672725>}
box{<0,0,-0.152400><4.040706,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.898978,0.000000,6.672725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,10.713431>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.898978,0.000000,10.713431>}
box{<0,0,-0.152400><3.255406,0.035000,0.152400> rotate<0,0.000000,0> translate<44.643572,0.000000,10.713431> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.824384,0.000000,6.672725>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.824384,0.000000,5.080000>}
box{<0,0,-0.152400><1.592725,0.035000,0.152400> rotate<0,-90.000000,0> translate<48.824384,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.898978,0.000000,6.672725>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.824384,0.000000,6.672725>}
box{<0,0,-0.152400><0.925406,0.035000,0.152400> rotate<0,0.000000,0> translate<47.898978,0.000000,6.672725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.449072,0.000000,28.249331>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.174725,0.000000,28.228947>}
box{<0,0,-0.152400><12.725669,0.035000,0.152400> rotate<0,0.091772,0> translate<37.449072,0.000000,28.249331> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.174725,-1.535000,28.228947>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.182256,-1.535000,28.256450>}
box{<0,0,-0.152400><0.028516,0.035000,0.152400> rotate<0,-74.681027,0> translate<50.174725,-1.535000,28.228947> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.791631,-1.535000,24.953244>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.791631,-1.535000,18.014375>}
box{<0,0,-0.152400><6.938869,0.035000,0.152400> rotate<0,-90.000000,0> translate<50.791631,-1.535000,18.014375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.976866,-1.535000,20.157281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.976866,-1.535000,24.050406>}
box{<0,0,-0.152400><3.893125,0.035000,0.152400> rotate<0,90.000000,0> translate<51.976866,-1.535000,24.050406> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,0.000000,14.157281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,0.000000,14.183009>}
box{<0,0,-0.152400><7.393804,0.035000,0.152400> rotate<0,-0.199359,0> translate<44.643572,0.000000,14.157281> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.976866,-1.535000,20.157281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,-1.535000,20.183009>}
box{<0,0,-0.152400><0.065712,0.035000,0.152400> rotate<0,-23.048233,0> translate<51.976866,-1.535000,20.157281> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.617869,0.000000,16.215222>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.114438,0.000000,16.266678>}
box{<0,0,-0.152400><7.496745,0.035000,0.152400> rotate<0,-0.393245,0> translate<44.617869,0.000000,16.215222> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,0.000000,16.183009>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.114438,0.000000,16.266678>}
box{<0,0,-0.152400><0.113780,0.035000,0.152400> rotate<0,-47.334273,0> translate<52.037331,0.000000,16.183009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.791631,-1.535000,18.014375>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.114438,-1.535000,18.014375>}
box{<0,0,-0.152400><1.322806,0.035000,0.152400> rotate<0,0.000000,0> translate<50.791631,-1.535000,18.014375> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,-1.535000,18.183009>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.114438,-1.535000,18.014375>}
box{<0,0,-0.152400><0.185426,0.035000,0.152400> rotate<0,65.423944,0> translate<52.037331,-1.535000,18.183009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.824384,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,0.000000,5.080000>}
box{<0,0,-0.152400><4.515616,0.035000,0.152400> rotate<0,0.000000,0> translate<48.824384,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.643572,-1.535000,26.319734>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,26.319734>}
box{<0,0,-0.152400><8.696428,0.035000,0.152400> rotate<0,0.000000,0> translate<44.643572,-1.535000,26.319734> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.730219,0.000000,27.120281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.365703,0.000000,27.120281>}
box{<0,0,-0.152400><5.635484,0.035000,0.152400> rotate<0,0.000000,0> translate<47.730219,0.000000,27.120281> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,26.319734>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.365703,-1.535000,27.120281>}
box{<0,0,-0.152400><0.800959,0.035000,0.152400> rotate<0,-88.155220,0> translate<53.340000,-1.535000,26.319734> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.365703,0.000000,27.120281>}
box{<0,0,-0.152400><3.359817,0.035000,0.152400> rotate<0,89.555763,0> translate<53.340000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,3.015262>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.415650,-1.535000,3.015262>}
box{<0,0,-0.152400><11.505650,0.035000,0.152400> rotate<0,0.000000,0> translate<41.910000,-1.535000,3.015262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.415650,-1.535000,5.080000>}
box{<0,0,-0.152400><0.075650,0.035000,0.152400> rotate<0,0.000000,0> translate<53.340000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.415650,-1.535000,3.015262>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.415650,-1.535000,5.080000>}
box{<0,0,-0.152400><2.064738,0.035000,0.152400> rotate<0,90.000000,0> translate<53.415650,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.992422,-1.535000,25.442525>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.391038,-1.535000,25.442525>}
box{<0,0,-0.152400><8.398616,0.035000,0.152400> rotate<0,0.000000,0> translate<45.992422,-1.535000,25.442525> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.391038,-1.535000,27.043803>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.391038,-1.535000,25.442525>}
box{<0,0,-0.152400><1.601278,0.035000,0.152400> rotate<0,-90.000000,0> translate<54.391038,-1.535000,25.442525> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.235344,-1.535000,18.202513>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.235344,-1.535000,23.154022>}
box{<0,0,-0.152400><4.951509,0.035000,0.152400> rotate<0,90.000000,0> translate<55.235344,-1.535000,23.154022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.138331,-1.535000,20.202513>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.138331,-1.535000,22.369872>}
box{<0,0,-0.152400><2.167359,0.035000,0.152400> rotate<0,90.000000,0> translate<56.138331,-1.535000,22.369872> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.941031,0.000000,26.001263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.390378,0.000000,26.001263>}
box{<0,0,-0.152400><19.449347,0.035000,0.152400> rotate<0,0.000000,0> translate<38.941031,0.000000,26.001263> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.391038,-1.535000,27.043803>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.390378,-1.535000,27.043803>}
box{<0,0,-0.152400><3.999341,0.035000,0.152400> rotate<0,0.000000,0> translate<54.391038,-1.535000,27.043803> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.390378,0.000000,26.001263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.390378,0.000000,27.043803>}
box{<0,0,-0.152400><1.042541,0.035000,0.152400> rotate<0,90.000000,0> translate<58.390378,0.000000,27.043803> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.415650,-1.535000,3.015262>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,3.015262>}
box{<0,0,-0.152400><5.004350,0.035000,0.152400> rotate<0,0.000000,0> translate<53.415650,-1.535000,3.015262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,3.015262>}
box{<0,0,-0.152400><2.064738,0.035000,0.152400> rotate<0,-90.000000,0> translate<58.420000,-1.535000,3.015262> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.390378,0.000000,26.001263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,26.001263>}
box{<0,0,-0.152400><0.029622,0.035000,0.152400> rotate<0,0.000000,0> translate<58.390378,0.000000,26.001263> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,26.001263>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,30.480000>}
box{<0,0,-0.152400><4.478737,0.035000,0.152400> rotate<0,90.000000,0> translate<58.420000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,0.000000,14.183009>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.157281>}
box{<0,0,-0.152400><7.331089,0.035000,0.152400> rotate<0,0.201064,0> translate<52.037331,0.000000,14.183009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.157281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.202513>}
box{<0,0,-0.152400><0.045231,0.035000,0.152400> rotate<0,90.000000,0> translate<59.368375,0.000000,14.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.202513>}
box{<0,0,-0.152400><0.009803,0.035000,0.152400> rotate<0,90.000000,0> translate<59.368375,0.000000,14.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.037331,0.000000,16.183009>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,16.157281>}
box{<0,0,-0.152400><7.331089,0.035000,0.152400> rotate<0,0.201064,0> translate<52.037331,0.000000,16.183009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,16.157281>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,16.202513>}
box{<0,0,-0.152400><0.045231,0.035000,0.152400> rotate<0,90.000000,0> translate<59.368375,0.000000,16.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.235344,-1.535000,18.202513>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,-1.535000,18.202513>}
box{<0,0,-0.152400><4.133031,0.035000,0.152400> rotate<0,0.000000,0> translate<55.235344,-1.535000,18.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.138331,-1.535000,20.202513>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,-1.535000,20.202513>}
box{<0,0,-0.152400><3.230044,0.035000,0.152400> rotate<0,0.000000,0> translate<56.138331,-1.535000,20.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.791631,-1.535000,24.953244>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.634619,-1.535000,24.953244>}
box{<0,0,-0.152400><8.842987,0.035000,0.152400> rotate<0,0.000000,0> translate<50.791631,-1.535000,24.953244> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.634619,-1.535000,27.177241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.634619,-1.535000,24.953244>}
box{<0,0,-0.152400><2.223997,0.035000,0.152400> rotate<0,-90.000000,0> translate<59.634619,-1.535000,24.953244> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.976866,-1.535000,24.050406>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.329144,-1.535000,24.050406>}
box{<0,0,-0.152400><8.352278,0.035000,0.152400> rotate<0,0.000000,0> translate<51.976866,-1.535000,24.050406> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.329144,-1.535000,24.050406>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.329144,-1.535000,26.386853>}
box{<0,0,-0.152400><2.336447,0.035000,0.152400> rotate<0,90.000000,0> translate<60.329144,-1.535000,26.386853> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.241238,0.000000,25.358197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.456213,0.000000,25.358197>}
box{<0,0,-0.152400><24.214975,0.035000,0.152400> rotate<0,0.000000,0> translate<39.241238,0.000000,25.358197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.634619,-1.535000,27.177241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.456213,-1.535000,27.177241>}
box{<0,0,-0.152400><3.821594,0.035000,0.152400> rotate<0,0.000000,0> translate<59.634619,-1.535000,27.177241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.456213,0.000000,25.358197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.456213,0.000000,27.177241>}
box{<0,0,-0.152400><1.819044,0.035000,0.152400> rotate<0,90.000000,0> translate<63.456213,0.000000,27.177241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,5.080000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.420000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.456213,0.000000,25.358197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,25.358197>}
box{<0,0,-0.152400><0.043787,0.035000,0.152400> rotate<0,0.000000,0> translate<63.456213,0.000000,25.358197> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,25.358197>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,30.480000>}
box{<0,0,-0.152400><5.121803,0.035000,0.152400> rotate<0,90.000000,0> translate<63.500000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.235344,-1.535000,23.154022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.789325,-1.535000,23.154022>}
box{<0,0,-0.152400><9.553981,0.035000,0.152400> rotate<0,0.000000,0> translate<55.235344,-1.535000,23.154022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.789325,-1.535000,23.154022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.815134,-1.535000,25.527044>}
box{<0,0,-0.152400><2.373162,0.035000,0.152400> rotate<0,-89.370968,0> translate<64.789325,-1.535000,23.154022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.716725,0.000000,10.698328>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.716725,0.000000,9.617825>}
box{<0,0,-0.152400><1.080503,0.035000,0.152400> rotate<0,-90.000000,0> translate<65.716725,0.000000,9.617825> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,33.439750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.855816,0.000000,33.439750>}
box{<0,0,-0.152400><40.455816,0.035000,0.152400> rotate<0,0.000000,0> translate<25.400000,0.000000,33.439750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.815134,0.000000,25.527044>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.873022,0.000000,25.518438>}
box{<0,0,-0.152400><1.057923,0.035000,0.152400> rotate<0,0.466078,0> translate<64.815134,0.000000,25.527044> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.855816,0.000000,33.439750>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.873022,0.000000,25.518438>}
box{<0,0,-0.152400><7.921331,0.035000,0.152400> rotate<0,89.869614,0> translate<65.855816,0.000000,33.439750> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.511472,0.000000,9.617825>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.511472,0.000000,4.051953>}
box{<0,0,-0.152400><5.565872,0.035000,0.152400> rotate<0,-90.000000,0> translate<66.511472,0.000000,4.051953> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<65.716725,0.000000,9.617825>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.511472,0.000000,9.617825>}
box{<0,0,-0.152400><0.794747,0.035000,0.152400> rotate<0,0.000000,0> translate<65.716725,0.000000,9.617825> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.876766,-1.535000,2.048241>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.672566,-1.535000,2.026806>}
box{<0,0,-0.152400><29.795808,0.035000,0.152400> rotate<0,0.041214,0> translate<36.876766,-1.535000,2.048241> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.672566,-1.535000,4.051953>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.672566,-1.535000,2.026806>}
box{<0,0,-0.152400><2.025147,0.035000,0.152400> rotate<0,-90.000000,0> translate<66.672566,-1.535000,2.026806> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.511472,0.000000,4.051953>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.672566,0.000000,4.051953>}
box{<0,0,-0.152400><0.161094,0.035000,0.152400> rotate<0,0.000000,0> translate<66.511472,0.000000,4.051953> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,14.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.830088,0.000000,14.192709>}
box{<0,0,-0.152400><7.461713,0.035000,0.152400> rotate<0,0.000000,0> translate<59.368375,0.000000,14.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,34.181550>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.845109,0.000000,34.181550>}
box{<0,0,-0.152400><46.525109,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,34.181550> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.845109,0.000000,25.574725>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.845109,0.000000,34.181550>}
box{<0,0,-0.152400><8.606825,0.035000,0.152400> rotate<0,90.000000,0> translate<66.845109,0.000000,34.181550> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.830088,0.000000,14.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.854053,0.000000,14.192709>}
box{<0,0,-0.152400><0.023966,0.035000,0.152400> rotate<0,0.000000,0> translate<66.830088,0.000000,14.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.845109,0.000000,25.574725>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.857900,0.000000,25.445631>}
box{<0,0,-0.152400><0.129726,0.035000,0.152400> rotate<0,84.336028,0> translate<66.845109,0.000000,25.574725> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.368375,0.000000,16.202513>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.871194,0.000000,16.202513>}
box{<0,0,-0.152400><7.502819,0.035000,0.152400> rotate<0,0.000000,0> translate<59.368375,0.000000,16.202513> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.830088,0.000000,16.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.871194,0.000000,16.202513>}
box{<0,0,-0.152400><0.042259,0.035000,0.152400> rotate<0,-13.412614,0> translate<66.830088,0.000000,16.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.854053,0.000000,14.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.875466,0.000000,12.455753>}
box{<0,0,-0.152400><1.737088,0.035000,0.152400> rotate<0,89.287823,0> translate<66.854053,0.000000,14.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.138331,-1.535000,22.369872>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.892309,-1.535000,22.369872>}
box{<0,0,-0.152400><10.753978,0.035000,0.152400> rotate<0,0.000000,0> translate<56.138331,-1.535000,22.369872> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.857900,-1.535000,25.445631>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.892309,-1.535000,22.369872>}
box{<0,0,-0.152400><3.075952,0.035000,0.152400> rotate<0,89.353146,0> translate<66.857900,-1.535000,25.445631> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.240725,0.000000,10.698328>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.240725,0.000000,11.733503>}
box{<0,0,-0.152400><1.035175,0.035000,0.152400> rotate<0,90.000000,0> translate<67.240725,0.000000,11.733503> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.329144,-1.535000,26.386853>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.638591,-1.535000,26.386853>}
box{<0,0,-0.152400><8.309447,0.035000,0.152400> rotate<0,0.000000,0> translate<60.329144,-1.535000,26.386853> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.638591,-1.535000,26.386853>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.638591,-1.535000,26.494031>}
box{<0,0,-0.152400><0.107178,0.035000,0.152400> rotate<0,90.000000,0> translate<68.638591,-1.535000,26.494031> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.201078,0.000000,2.593672>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,2.593672>}
box{<0,0,-0.152400><22.648922,0.035000,0.152400> rotate<0,0.000000,0> translate<47.201078,0.000000,2.593672> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,2.593672>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,5.080000>}
box{<0,0,-0.152400><2.486328,0.035000,0.152400> rotate<0,90.000000,0> translate<69.850000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.434228,0.000000,24.607956>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,24.607956>}
box{<0,0,-0.152400><30.415772,0.035000,0.152400> rotate<0,0.000000,0> translate<39.434228,0.000000,24.607956> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<68.638591,0.000000,26.494031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,26.494031>}
box{<0,0,-0.152400><1.211409,0.035000,0.152400> rotate<0,0.000000,0> translate<68.638591,0.000000,26.494031> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,24.607956>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,26.494031>}
box{<0,0,-0.152400><1.886075,0.035000,0.152400> rotate<0,90.000000,0> translate<69.850000,0.000000,26.494031> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,26.494031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,30.480000>}
box{<0,0,-0.152400><3.985969,0.035000,0.152400> rotate<0,90.000000,0> translate<69.850000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.997797,-1.535000,28.281338>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.997797,-1.535000,21.892247>}
box{<0,0,-0.152400><6.389091,0.035000,0.152400> rotate<0,-90.000000,0> translate<70.997797,-1.535000,21.892247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.997797,0.000000,21.892247>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.034109,0.000000,13.970000>}
box{<0,0,-0.152400><7.922330,0.035000,0.152400> rotate<0,89.731458,0> translate<70.997797,0.000000,21.892247> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.182256,-1.535000,28.256450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.034109,-1.535000,28.281338>}
box{<0,0,-0.152400><20.851868,0.035000,0.152400> rotate<0,-0.068380,0> translate<50.182256,-1.535000,28.256450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<70.997797,-1.535000,28.281338>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.034109,-1.535000,28.281338>}
box{<0,0,-0.152400><0.036312,0.035000,0.152400> rotate<0,0.000000,0> translate<70.997797,-1.535000,28.281338> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.010650,-1.535000,18.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.010650,-1.535000,15.256697>}
box{<0,0,-0.152400><2.936012,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.010650,-1.535000,15.256697> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.830088,-1.535000,18.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.010650,-1.535000,18.192709>}
box{<0,0,-0.152400><5.180562,0.035000,0.152400> rotate<0,0.000000,0> translate<66.830088,-1.535000,18.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.875466,0.000000,12.455753>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.021187,0.000000,12.455753>}
box{<0,0,-0.152400><5.145722,0.035000,0.152400> rotate<0,0.000000,0> translate<66.875466,0.000000,12.455753> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.021187,0.000000,12.455753>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.042606,0.000000,18.839022>}
box{<0,0,-0.152400><6.383305,0.035000,0.152400> rotate<0,-89.801821,0> translate<72.021187,0.000000,12.455753> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<67.240725,0.000000,11.733503>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.161284,0.000000,11.715656>}
box{<0,0,-0.152400><5.920586,0.035000,0.152400> rotate<0,0.172700,0> translate<67.240725,0.000000,11.733503> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.042606,0.000000,18.839022>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.162113,0.000000,18.828950>}
box{<0,0,-0.152400><1.119552,0.035000,0.152400> rotate<0,0.515426,0> translate<72.042606,0.000000,18.839022> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.161284,0.000000,11.715656>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.164856,0.000000,12.670422>}
box{<0,0,-0.152400><0.954772,0.035000,0.152400> rotate<0,-89.779726,0> translate<73.161284,0.000000,11.715656> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.162113,0.000000,17.304950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.164856,0.000000,12.670422>}
box{<0,0,-0.152400><4.634529,0.035000,0.152400> rotate<0,89.960142,0> translate<73.162113,0.000000,17.304950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<73.162113,0.000000,18.828950>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.465497,0.000000,18.800006>}
box{<0,0,-0.152400><1.303706,0.035000,0.152400> rotate<0,1.272052,0> translate<73.162113,0.000000,18.828950> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<69.850000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.930000,0.000000,5.080000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<69.850000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.691547,0.000000,23.707666>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.930000,0.000000,23.707666>}
box{<0,0,-0.152400><35.238453,0.035000,0.152400> rotate<0,0.000000,0> translate<39.691547,0.000000,23.707666> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.930000,0.000000,23.707666>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.930000,0.000000,30.480000>}
box{<0,0,-0.152400><6.772334,0.035000,0.152400> rotate<0,90.000000,0> translate<74.930000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.465497,0.000000,18.800006>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.131209,0.000000,18.790234>}
box{<0,0,-0.152400><0.665784,0.035000,0.152400> rotate<0,0.840919,0> translate<74.465497,0.000000,18.800006> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.114394,0.000000,22.254713>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.132241,0.000000,22.268366>}
box{<0,0,-0.152400><0.022470,0.035000,0.152400> rotate<0,-37.414057,0> translate<75.114394,0.000000,22.254713> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.131209,0.000000,18.790234>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.132241,0.000000,22.268366>}
box{<0,0,-0.152400><3.478131,0.035000,0.152400> rotate<0,-89.977074,0> translate<75.131209,0.000000,18.790234> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.010650,-1.535000,15.256697>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.711575,-1.535000,15.282425>}
box{<0,0,-0.152400><3.701014,0.035000,0.152400> rotate<0,-0.398277,0> translate<72.010650,-1.535000,15.256697> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.711575,-1.535000,15.282425>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.737272,-1.535000,16.568825>}
box{<0,0,-0.152400><1.286657,0.035000,0.152400> rotate<0,-88.849759,0> translate<75.711575,-1.535000,15.282425> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.737272,-1.535000,16.568825>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.737272,-1.535000,16.643669>}
box{<0,0,-0.152400><0.074844,0.035000,0.152400> rotate<0,90.000000,0> translate<75.737272,-1.535000,16.643669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.034641,0.000000,22.893116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.823506,0.000000,22.893116>}
box{<0,0,-0.152400><35.788866,0.035000,0.152400> rotate<0,0.000000,0> translate<40.034641,0.000000,22.893116> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.823506,0.000000,22.893116>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.823506,0.000000,28.080506>}
box{<0,0,-0.152400><5.187391,0.035000,0.152400> rotate<0,90.000000,0> translate<75.823506,0.000000,28.080506> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.968522,-1.535000,20.215394>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.968522,-1.535000,19.183669>}
box{<0,0,-0.152400><1.031725,0.035000,0.152400> rotate<0,-90.000000,0> translate<75.968522,-1.535000,19.183669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.830088,-1.535000,20.192709>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.968522,-1.535000,20.215394>}
box{<0,0,-0.152400><9.138463,0.035000,0.152400> rotate<0,-0.142216,0> translate<66.830088,-1.535000,20.192709> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.112269,0.000000,9.601309>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.112269,0.000000,21.429084>}
box{<0,0,-0.152400><11.827775,0.035000,0.152400> rotate<0,90.000000,0> translate<76.112269,0.000000,21.429084> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.114394,0.000000,22.254713>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.502069,0.000000,22.254713>}
box{<0,0,-0.152400><1.387675,0.035000,0.152400> rotate<0,0.000000,0> translate<75.114394,0.000000,22.254713> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.502069,0.000000,22.254713>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.548263,0.000000,24.380669>}
box{<0,0,-0.152400><2.126458,0.035000,0.152400> rotate<0,-88.749389,0> translate<76.502069,0.000000,22.254713> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.548263,0.000000,24.380669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.677066,0.000000,24.195316>}
box{<0,0,-0.152400><0.225712,0.035000,0.152400> rotate<0,55.200662,0> translate<76.548263,0.000000,24.380669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<71.034109,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,-1.535000,14.103669>}
box{<0,0,-0.152400><6.902532,0.035000,0.152400> rotate<0,-1.109539,0> translate<71.034109,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,14.123938>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,14.103669>}
box{<0,0,-0.152400><0.020269,0.035000,0.152400> rotate<0,-90.000000,0> translate<77.935347,0.000000,14.103669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.737272,-1.535000,16.643669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,-1.535000,16.643669>}
box{<0,0,-0.152400><2.198075,0.035000,0.152400> rotate<0,0.000000,0> translate<75.737272,-1.535000,16.643669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.968522,-1.535000,19.183669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,-1.535000,19.183669>}
box{<0,0,-0.152400><1.966825,0.035000,0.152400> rotate<0,0.000000,0> translate<75.968522,-1.535000,19.183669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.112269,0.000000,21.429084>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,21.429084>}
box{<0,0,-0.152400><1.823078,0.035000,0.152400> rotate<0,0.000000,0> translate<76.112269,0.000000,21.429084> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,21.429084>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,21.723669>}
box{<0,0,-0.152400><0.294584,0.035000,0.152400> rotate<0,90.000000,0> translate<77.935347,0.000000,21.723669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.677066,0.000000,24.195316>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.263669>}
box{<0,0,-0.152400><1.260136,0.035000,0.152400> rotate<0,-3.109195,0> translate<76.677066,0.000000,24.195316> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.208072>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.263669>}
box{<0,0,-0.152400><0.055597,0.035000,0.152400> rotate<0,90.000000,0> translate<77.935347,0.000000,24.263669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.355450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.263669>}
box{<0,0,-0.152400><0.091781,0.035000,0.152400> rotate<0,-90.000000,0> translate<77.935347,0.000000,24.263669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,-1.535000,19.183669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.457331,-1.535000,19.183669>}
box{<0,0,-0.152400><1.521984,0.035000,0.152400> rotate<0,0.000000,0> translate<77.935347,-1.535000,19.183669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.457331,-1.535000,19.183669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.457331,-1.535000,25.838278>}
box{<0,0,-0.152400><6.654609,0.035000,0.152400> rotate<0,90.000000,0> translate<79.457331,-1.535000,25.838278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,24.355450>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.764659,0.000000,24.355450>}
box{<0,0,-0.152400><1.829313,0.035000,0.152400> rotate<0,0.000000,0> translate<77.935347,0.000000,24.355450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.764659,0.000000,20.164031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.764659,0.000000,24.355450>}
box{<0,0,-0.152400><4.191419,0.035000,0.152400> rotate<0,90.000000,0> translate<79.764659,0.000000,24.355450> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,0.000000,14.123938>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.949728,0.000000,14.123938>}
box{<0,0,-0.152400><2.014381,0.035000,0.152400> rotate<0,0.000000,0> translate<77.935347,0.000000,14.123938> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.949728,0.000000,15.846031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.949728,0.000000,14.123938>}
box{<0,0,-0.152400><1.722094,0.035000,0.152400> rotate<0,-90.000000,0> translate<79.949728,0.000000,14.123938> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,5.072797>}
box{<0,0,-0.152400><0.007203,0.035000,0.152400> rotate<0,-90.000000,0> translate<80.010000,0.000000,5.072797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<74.930000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,5.080000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<74.930000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<75.823506,0.000000,28.080506>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,28.080506>}
box{<0,0,-0.152400><4.186494,0.035000,0.152400> rotate<0,0.000000,0> translate<75.823506,0.000000,28.080506> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,28.080506>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,30.480000>}
box{<0,0,-0.152400><2.399494,0.035000,0.152400> rotate<0,90.000000,0> translate<80.010000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<77.935347,-1.535000,16.643669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.012459,-1.535000,16.643669>}
box{<0,0,-0.152400><2.077112,0.035000,0.152400> rotate<0,0.000000,0> translate<77.935347,-1.535000,16.643669> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.012459,-1.535000,16.643669>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.012459,-1.535000,16.718884>}
box{<0,0,-0.152400><0.075216,0.035000,0.152400> rotate<0,90.000000,0> translate<80.012459,-1.535000,16.718884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.012459,-1.535000,16.718884>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.086475,-1.535000,16.718884>}
box{<0,0,-0.152400><0.074016,0.035000,0.152400> rotate<0,0.000000,0> translate<80.012459,-1.535000,16.718884> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.086475,-1.535000,16.718884>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.086475,-1.535000,25.096863>}
box{<0,0,-0.152400><8.377978,0.035000,0.152400> rotate<0,90.000000,0> translate<80.086475,-1.535000,25.096863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.949728,0.000000,15.846031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.569672,0.000000,15.846031>}
box{<0,0,-0.152400><0.619944,0.035000,0.152400> rotate<0,0.000000,0> translate<79.949728,0.000000,15.846031> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.764659,0.000000,20.164031>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.569672,0.000000,20.164031>}
box{<0,0,-0.152400><0.805012,0.035000,0.152400> rotate<0,0.000000,0> translate<79.764659,0.000000,20.164031> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<79.457331,-1.535000,25.838278>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.897616,-1.535000,25.838278>}
box{<0,0,-0.152400><2.440284,0.035000,0.152400> rotate<0,0.000000,0> translate<79.457331,-1.535000,25.838278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.897616,-1.535000,32.523622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.897616,-1.535000,25.838278>}
box{<0,0,-0.152400><6.685344,0.035000,0.152400> rotate<0,-90.000000,0> translate<81.897616,-1.535000,25.838278> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,32.523622>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<81.897616,-1.535000,32.523622>}
box{<0,0,-0.152400><45.067616,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,-1.535000,32.523622> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.010000,0.000000,5.072797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.529038,0.000000,5.072797>}
box{<0,0,-0.152400><2.519037,0.035000,0.152400> rotate<0,0.000000,0> translate<80.010000,0.000000,5.072797> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<76.112269,0.000000,9.601309>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.529038,0.000000,9.601309>}
box{<0,0,-0.152400><6.416769,0.035000,0.152400> rotate<0,0.000000,0> translate<76.112269,0.000000,9.601309> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.529038,0.000000,5.072797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.529038,0.000000,9.601309>}
box{<0,0,-0.152400><4.528512,0.035000,0.152400> rotate<0,90.000000,0> translate<82.529038,0.000000,9.601309> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<80.086475,-1.535000,25.096863>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.564175,-1.535000,25.096863>}
box{<0,0,-0.152400><2.477700,0.035000,0.152400> rotate<0,0.000000,0> translate<80.086475,-1.535000,25.096863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.564175,-1.535000,33.191000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.564175,-1.535000,25.096863>}
box{<0,0,-0.152400><8.094138,0.035000,0.152400> rotate<0,-90.000000,0> translate<82.564175,-1.535000,25.096863> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,33.191000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.564175,-1.535000,33.191000>}
box{<0,0,-0.152400><52.084175,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,-1.535000,33.191000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.529038,0.000000,5.072797>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<82.580216,0.000000,5.072797>}
box{<0,0,-0.152400><0.051178,0.035000,0.152400> rotate<0,0.000000,0> translate<82.529038,0.000000,5.072797> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.077088,0.000000,35.530353>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.089219,0.000000,35.524200>}
box{<0,0,-0.152400><0.013603,0.035000,0.152400> rotate<0,26.892931,0> translate<0.077088,0.000000,35.530353> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.077088,0.000000,35.530353>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.307378,0.000000,35.530353>}
box{<0,0,-0.152400><83.230291,0.035000,0.152400> rotate<0,0.000000,0> translate<0.077088,0.000000,35.530353> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086028,-1.535000,0.071694>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086028,-1.535000,35.469700>}
box{<0,0,-0.152400><35.398006,0.035000,0.152400> rotate<0,90.000000,0> translate<0.086028,-1.535000,35.469700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086028,-1.535000,0.071694>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.442103,-1.535000,0.071694>}
box{<0,0,-0.152400><83.356075,0.035000,0.152400> rotate<0,0.000000,0> translate<0.086028,-1.535000,0.071694> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086028,-1.535000,35.469700>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086728,-1.535000,35.474156>}
box{<0,0,-0.152400><0.004511,0.035000,0.152400> rotate<0,-81.067420,0> translate<0.086028,-1.535000,35.469700> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.086728,-1.535000,35.474156>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.442103,-1.535000,35.474156>}
box{<0,0,-0.152400><83.355375,0.035000,0.152400> rotate<0,0.000000,0> translate<0.086728,-1.535000,35.474156> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.089219,0.000000,0.312400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.089219,0.000000,35.524200>}
box{<0,0,-0.152400><35.211800,0.035000,0.152400> rotate<0,90.000000,0> translate<0.089219,0.000000,35.524200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.089219,0.000000,0.312400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.307378,0.000000,0.312400>}
box{<0,0,-0.152400><83.218159,0.035000,0.152400> rotate<0,0.000000,0> translate<0.089219,0.000000,0.312400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.307378,0.000000,35.530353>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.307378,0.000000,0.312400>}
box{<0,0,-0.152400><35.217953,0.035000,0.152400> rotate<0,-90.000000,0> translate<83.307378,0.000000,0.312400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.442103,-1.535000,35.474156>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<83.442103,-1.535000,0.071694>}
box{<0,0,-0.152400><35.402462,0.035000,0.152400> rotate<0,-90.000000,0> translate<83.442103,-1.535000,0.071694> }
texture{col_pol}
}
#end
union{
cylinder{<52.037331,0.038000,14.183009><52.037331,-1.538000,14.183009>0.400000}
cylinder{<52.037331,0.038000,16.183009><52.037331,-1.538000,16.183009>0.400000}
cylinder{<52.037331,0.038000,18.183009><52.037331,-1.538000,18.183009>0.400000}
cylinder{<52.037331,0.038000,20.183009><52.037331,-1.538000,20.183009>0.400000}
cylinder{<82.220672,0.038000,16.855031><82.220672,-1.538000,16.855031>0.475000 }
cylinder{<82.220672,0.038000,19.155031><82.220672,-1.538000,19.155031>0.475000 }
cylinder{<82.220672,0.038000,16.855031><82.220672,-1.538000,16.855031>0.475000 }
cylinder{<82.220672,0.038000,19.155031><82.220672,-1.538000,19.155031>0.475000 }
cylinder{<82.220672,0.038000,16.855031><82.220672,-1.538000,16.855031>0.475000 }
cylinder{<82.220672,0.038000,19.155031><82.220672,-1.538000,19.155031>0.475000 }
cylinder{<82.220672,0.038000,16.855031><82.220672,-1.538000,16.855031>0.475000 }
cylinder{<82.220672,0.038000,19.155031><82.220672,-1.538000,19.155031>0.475000 }
cylinder{<59.368375,0.038000,14.202513><59.368375,-1.538000,14.202513>0.400000}
cylinder{<59.368375,0.038000,16.202513><59.368375,-1.538000,16.202513>0.400000}
cylinder{<59.368375,0.038000,18.202513><59.368375,-1.538000,18.202513>0.400000}
cylinder{<59.368375,0.038000,20.202513><59.368375,-1.538000,20.202513>0.400000}
cylinder{<77.935347,0.038000,24.263669><77.935347,-1.538000,24.263669>0.444500}
cylinder{<77.935347,0.038000,21.723669><77.935347,-1.538000,21.723669>0.444500}
cylinder{<77.935347,0.038000,19.183669><77.935347,-1.538000,19.183669>0.444500}
cylinder{<77.935347,0.038000,16.643669><77.935347,-1.538000,16.643669>0.444500}
cylinder{<77.935347,0.038000,14.103669><77.935347,-1.538000,14.103669>0.444500}
cylinder{<77.935347,0.038000,11.563669><77.935347,-1.538000,11.563669>0.444500}
cylinder{<69.850000,0.038000,30.480000><69.850000,-1.538000,30.480000>0.584200}
cylinder{<74.930000,0.038000,30.480000><74.930000,-1.538000,30.480000>0.584200}
cylinder{<80.010000,0.038000,30.480000><80.010000,-1.538000,30.480000>0.584200}
cylinder{<53.340000,0.038000,30.480000><53.340000,-1.538000,30.480000>0.584200}
cylinder{<58.420000,0.038000,30.480000><58.420000,-1.538000,30.480000>0.584200}
cylinder{<63.500000,0.038000,30.480000><63.500000,-1.538000,30.480000>0.584200}
cylinder{<36.830000,0.038000,30.480000><36.830000,-1.538000,30.480000>0.584200}
cylinder{<41.910000,0.038000,30.480000><41.910000,-1.538000,30.480000>0.584200}
cylinder{<46.990000,0.038000,30.480000><46.990000,-1.538000,30.480000>0.584200}
cylinder{<20.320000,0.038000,30.480000><20.320000,-1.538000,30.480000>0.584200}
cylinder{<25.400000,0.038000,30.480000><25.400000,-1.538000,30.480000>0.584200}
cylinder{<30.480000,0.038000,30.480000><30.480000,-1.538000,30.480000>0.584200}
cylinder{<3.810000,0.038000,30.480000><3.810000,-1.538000,30.480000>0.584200}
cylinder{<8.890000,0.038000,30.480000><8.890000,-1.538000,30.480000>0.584200}
cylinder{<13.970000,0.038000,30.480000><13.970000,-1.538000,30.480000>0.584200}
cylinder{<13.970000,0.038000,5.080000><13.970000,-1.538000,5.080000>0.584200}
cylinder{<8.890000,0.038000,5.080000><8.890000,-1.538000,5.080000>0.584200}
cylinder{<3.810000,0.038000,5.080000><3.810000,-1.538000,5.080000>0.584200}
cylinder{<30.480000,0.038000,5.080000><30.480000,-1.538000,5.080000>0.584200}
cylinder{<25.400000,0.038000,5.080000><25.400000,-1.538000,5.080000>0.584200}
cylinder{<20.320000,0.038000,5.080000><20.320000,-1.538000,5.080000>0.584200}
cylinder{<46.990000,0.038000,5.080000><46.990000,-1.538000,5.080000>0.584200}
cylinder{<41.910000,0.038000,5.080000><41.910000,-1.538000,5.080000>0.584200}
cylinder{<36.830000,0.038000,5.080000><36.830000,-1.538000,5.080000>0.584200}
cylinder{<63.500000,0.038000,5.080000><63.500000,-1.538000,5.080000>0.584200}
cylinder{<58.420000,0.038000,5.080000><58.420000,-1.538000,5.080000>0.584200}
cylinder{<53.340000,0.038000,5.080000><53.340000,-1.538000,5.080000>0.584200}
cylinder{<80.010000,0.038000,5.080000><80.010000,-1.538000,5.080000>0.584200}
cylinder{<74.930000,0.038000,5.080000><74.930000,-1.538000,5.080000>0.584200}
cylinder{<69.850000,0.038000,5.080000><69.850000,-1.538000,5.080000>0.584200}
cylinder{<5.124422,0.038000,12.676297><5.124422,-1.538000,12.676297>0.500000}
cylinder{<5.124422,0.038000,16.176297><5.124422,-1.538000,16.176297>0.500000}
cylinder{<44.617869,0.038000,14.215222><44.617869,-1.538000,14.215222>0.400000}
cylinder{<44.617869,0.038000,16.215222><44.617869,-1.538000,16.215222>0.400000}
cylinder{<44.617869,0.038000,18.215222><44.617869,-1.538000,18.215222>0.400000}
cylinder{<44.617869,0.038000,20.215222><44.617869,-1.538000,20.215222>0.400000}
cylinder{<66.830088,0.038000,14.192709><66.830088,-1.538000,14.192709>0.400000}
cylinder{<66.830088,0.038000,16.192709><66.830088,-1.538000,16.192709>0.400000}
cylinder{<66.830088,0.038000,18.192709><66.830088,-1.538000,18.192709>0.400000}
cylinder{<66.830088,0.038000,20.192709><66.830088,-1.538000,20.192709>0.400000}
//Holes(fast)/Vias
cylinder{<68.638591,0.038000,26.494031><68.638591,-1.538000,26.494031>0.300000 }
cylinder{<63.456213,0.038000,27.177241><63.456213,-1.538000,27.177241>0.300000 }
cylinder{<58.390378,0.038000,27.043803><58.390378,-1.538000,27.043803>0.300000 }
cylinder{<53.365703,0.038000,27.120281><53.365703,-1.538000,27.120281>0.300000 }
cylinder{<40.133766,0.038000,16.612356><40.133766,-1.538000,16.612356>0.300000 }
cylinder{<40.807647,0.038000,18.970241><40.807647,-1.538000,18.970241>0.300000 }
cylinder{<64.815134,0.038000,25.527044><64.815134,-1.538000,25.527044>0.300000 }
cylinder{<66.857900,0.038000,25.445631><66.857900,-1.538000,25.445631>0.300000 }
cylinder{<28.375962,0.038000,12.220794><28.375962,-1.538000,12.220794>0.300000 }
cylinder{<24.623344,0.038000,11.088763><24.623344,-1.538000,11.088763>0.300000 }
cylinder{<38.837028,0.038000,10.728572><38.837028,-1.538000,10.728572>0.300000 }
cylinder{<66.672566,0.038000,4.051953><66.672566,-1.538000,4.051953>0.300000 }
cylinder{<41.355906,0.038000,15.437156><41.355906,-1.538000,15.437156>0.300000 }
cylinder{<50.174725,0.038000,28.228947><50.174725,-1.538000,28.228947>0.300000 }
cylinder{<70.997797,0.038000,21.892247><70.997797,-1.538000,21.892247>0.300000 }
cylinder{<71.034109,0.038000,13.970000><71.034109,-1.538000,13.970000>0.300000 }
cylinder{<35.809859,0.038000,25.691638><35.809859,-1.538000,25.691638>0.300000 }
cylinder{<41.090184,0.038000,21.681472><41.090184,-1.538000,21.681472>0.300000 }
cylinder{<20.821356,0.038000,24.918450><20.821356,-1.538000,24.918450>0.300000 }
cylinder{<32.406572,0.038000,25.665469><32.406572,-1.538000,25.665469>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.011300,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.011300,0.000000,19.150359>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<39.011300,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.011300,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.197806,0.000000,19.150359>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<38.197806,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.197806,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.926641,0.000000,18.879197>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<37.926641,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.926641,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.926641,0.000000,18.336866>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.926641,0.000000,18.336866> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.926641,0.000000,18.336866>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.197806,0.000000,18.065700>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<37.926641,0.000000,18.336866> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.197806,0.000000,18.065700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.011300,0.000000,18.065700>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<38.197806,0.000000,18.065700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.468972,0.000000,18.065700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.926641,0.000000,17.523372>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<37.926641,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.374144,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.374144,0.000000,18.608031>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<37.374144,0.000000,18.608031> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.374144,0.000000,18.608031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.831816,0.000000,19.150359>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<36.831816,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.831816,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.289484,0.000000,18.608031>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<36.289484,0.000000,18.608031> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.289484,0.000000,18.608031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.289484,0.000000,17.523372>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.289484,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.374144,0.000000,18.336866>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.289484,0.000000,18.336866>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<36.289484,0.000000,18.336866> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.194659,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.194659,0.000000,19.150359>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<35.194659,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.736988,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.652328,0.000000,19.150359>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<34.652328,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099831,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099831,0.000000,17.523372>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.099831,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099831,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.286338,0.000000,17.523372>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<33.286338,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.286338,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.015172,0.000000,17.794534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<33.015172,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.015172,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.015172,0.000000,18.879197>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<33.015172,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.015172,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.286338,0.000000,19.150359>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<33.015172,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.286338,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.099831,0.000000,19.150359>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<33.286338,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.462675,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.462675,0.000000,17.794534>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.462675,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.462675,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.191513,0.000000,17.523372>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.191513,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.191513,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.649181,0.000000,17.523372>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<31.649181,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.649181,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.378016,0.000000,17.794534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<31.378016,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.378016,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.378016,0.000000,19.150359>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,90.000000,0> translate<31.378016,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.825519,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.283191,0.000000,17.523372>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<30.283191,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.554356,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.554356,0.000000,19.150359>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<30.554356,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.825519,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.283191,0.000000,19.150359>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<30.283191,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.734081,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.734081,0.000000,19.150359>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<29.734081,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.734081,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.649422,0.000000,17.523372>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-56.306191,0> translate<28.649422,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.649422,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.649422,0.000000,19.150359>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,90.000000,0> translate<28.649422,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.283431,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.825762,0.000000,19.150359>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<27.283431,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.825762,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.096925,0.000000,18.879197>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<27.825762,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.096925,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.096925,0.000000,17.794534>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.096925,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.096925,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.825762,0.000000,17.523372>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.825762,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.825762,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.283431,0.000000,17.523372>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<27.283431,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.283431,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.012266,0.000000,17.794534>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<27.012266,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.012266,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.012266,0.000000,18.879197>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<27.012266,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.012266,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.283431,0.000000,19.150359>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<27.012266,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.822613,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.822613,0.000000,18.065700>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.822613,0.000000,18.065700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.822613,0.000000,18.065700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.280284,0.000000,17.523372>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.280284,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.280284,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.737953,0.000000,18.065700>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<23.737953,0.000000,18.065700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.737953,0.000000,18.065700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.737953,0.000000,19.150359>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<23.737953,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.185456,0.000000,18.608031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.643128,0.000000,19.150359>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<22.643128,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.643128,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.643128,0.000000,17.523372>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.643128,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.185456,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.100797,0.000000,17.523372>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<22.100797,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.548300,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.548300,0.000000,17.794534>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,90.000000,0> translate<21.548300,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.548300,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.277138,0.000000,17.794534>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,0.000000,0> translate<21.277138,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.277138,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.277138,0.000000,17.523372>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.277138,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.277138,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.548300,0.000000,17.523372>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,0.000000,0> translate<21.277138,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.729722,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.729722,0.000000,18.879197>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<20.729722,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.729722,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.458559,0.000000,19.150359>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<20.458559,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.458559,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.916228,0.000000,19.150359>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<19.916228,0.000000,19.150359> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.916228,0.000000,19.150359>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.645063,0.000000,18.879197>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<19.645063,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.645063,0.000000,18.879197>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.645063,0.000000,17.794534>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.645063,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.645063,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.916228,0.000000,17.523372>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<19.645063,0.000000,17.794534> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.916228,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.458559,0.000000,17.523372>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<19.916228,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.458559,0.000000,17.523372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.729722,0.000000,17.794534>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.458559,0.000000,17.523372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.729722,0.000000,17.794534>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.645063,0.000000,18.879197>}
box{<0,0,-0.076200><1.533942,0.036000,0.076200> rotate<0,44.997113,0> translate<19.645063,0.000000,18.879197> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.133619,0.000000,11.242219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.133619,0.000000,10.157559>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<70.133619,0.000000,10.157559> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.133619,0.000000,10.157559>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.675947,0.000000,9.615231>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<70.133619,0.000000,10.157559> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<70.675947,0.000000,9.615231>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.218278,0.000000,10.157559>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.996865,0> translate<70.675947,0.000000,9.615231> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.218278,0.000000,10.157559>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.218278,0.000000,11.242219>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<71.218278,0.000000,11.242219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.855434,0.000000,10.971056>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.584269,0.000000,11.242219>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<72.584269,0.000000,11.242219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.584269,0.000000,11.242219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.041938,0.000000,11.242219>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<72.041938,0.000000,11.242219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.041938,0.000000,11.242219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.770775,0.000000,10.971056>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<71.770775,0.000000,10.971056> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.770775,0.000000,10.971056>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.770775,0.000000,9.886394>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<71.770775,0.000000,9.886394> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<71.770775,0.000000,9.886394>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.041938,0.000000,9.615231>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<71.770775,0.000000,9.886394> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.041938,0.000000,9.615231>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.584269,0.000000,9.615231>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<72.041938,0.000000,9.615231> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.584269,0.000000,9.615231>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<72.855434,0.000000,9.886394>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<72.584269,0.000000,9.615231> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.492591,0.000000,10.971056>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.221425,0.000000,11.242219>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<74.221425,0.000000,11.242219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.221425,0.000000,11.242219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.679094,0.000000,11.242219>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<73.679094,0.000000,11.242219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.679094,0.000000,11.242219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.407931,0.000000,10.971056>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<73.407931,0.000000,10.971056> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.407931,0.000000,10.971056>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.407931,0.000000,9.886394>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<73.407931,0.000000,9.886394> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.407931,0.000000,9.886394>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.679094,0.000000,9.615231>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<73.407931,0.000000,9.886394> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<73.679094,0.000000,9.615231>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.221425,0.000000,9.615231>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<73.679094,0.000000,9.615231> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.221425,0.000000,9.615231>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<74.492591,0.000000,9.886394>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<74.221425,0.000000,9.615231> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.844919,0.000000,10.940181>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.573753,0.000000,11.211344>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<56.573753,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.573753,0.000000,11.211344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.031422,0.000000,11.211344>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<56.031422,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.031422,0.000000,11.211344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.760259,0.000000,10.940181>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.760259,0.000000,10.940181> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.760259,0.000000,10.940181>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.760259,0.000000,9.855519>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.760259,0.000000,9.855519> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.760259,0.000000,9.855519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.031422,0.000000,9.584356>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<55.760259,0.000000,9.855519> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.031422,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.573753,0.000000,9.584356>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<56.031422,0.000000,9.584356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.573753,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.844919,0.000000,9.855519>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<56.573753,0.000000,9.584356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.844919,0.000000,9.855519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.844919,0.000000,10.397850>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<56.844919,0.000000,10.397850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.844919,0.000000,10.397850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.302588,0.000000,10.397850>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<56.302588,0.000000,10.397850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.397416,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.397416,0.000000,11.211344>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<57.397416,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.397416,0.000000,11.211344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.482075,0.000000,9.584356>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,56.306191,0> translate<57.397416,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.482075,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.482075,0.000000,11.211344>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<58.482075,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.034572,0.000000,11.211344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.034572,0.000000,9.584356>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.034572,0.000000,9.584356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.034572,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.848066,0.000000,9.584356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<59.034572,0.000000,9.584356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.848066,0.000000,9.584356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.119231,0.000000,9.855519>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<59.848066,0.000000,9.584356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.119231,0.000000,9.855519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.119231,0.000000,10.940181>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<60.119231,0.000000,10.940181> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.119231,0.000000,10.940181>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.848066,0.000000,11.211344>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<59.848066,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.848066,0.000000,11.211344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.034572,0.000000,11.211344>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<59.034572,0.000000,11.211344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.881684,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.881684,0.000000,9.966113>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.881684,0.000000,9.966113> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.881684,0.000000,9.966113>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.195219,0.000000,9.652578>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<45.881684,0.000000,9.966113> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.195219,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.508753,0.000000,9.966113>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.195219,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.508753,0.000000,9.966113>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.508753,0.000000,10.593181>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<46.508753,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.444272,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.287503,0.000000,10.593181>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<47.287503,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.287503,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.973969,0.000000,10.593181>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<46.973969,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.973969,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.817203,0.000000,10.436413>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<46.817203,0.000000,10.436413> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.817203,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.817203,0.000000,9.809344>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.817203,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.817203,0.000000,9.809344>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.973969,0.000000,9.652578>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<46.817203,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.973969,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.287503,0.000000,9.652578>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<46.973969,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.287503,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.444272,0.000000,9.809344>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<47.287503,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.379791,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.223022,0.000000,10.593181>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<48.223022,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.223022,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.909488,0.000000,10.593181>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<47.909488,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.909488,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.752722,0.000000,10.436413>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<47.752722,0.000000,10.436413> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.752722,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.752722,0.000000,9.809344>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.752722,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.752722,0.000000,9.809344>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.909488,0.000000,9.652578>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<47.752722,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.909488,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.223022,0.000000,9.652578>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<47.909488,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.223022,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.379791,0.000000,9.809344>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<48.223022,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.066428,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.909659,0.000000,10.593181>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<40.909659,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.909659,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.596125,0.000000,10.593181>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.596125,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.596125,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.439359,0.000000,10.436413>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<40.439359,0.000000,10.436413> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.439359,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.439359,0.000000,9.809344>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.439359,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.439359,0.000000,9.809344>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.596125,0.000000,9.652578>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<40.439359,0.000000,9.809344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.596125,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.909659,0.000000,9.652578>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.596125,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.909659,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.066428,0.000000,9.809344>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<40.909659,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.066428,0.000000,9.809344>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.066428,0.000000,10.122878>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<41.066428,0.000000,10.122878> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.066428,0.000000,10.122878>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.752894,0.000000,10.122878>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.752894,0.000000,10.122878> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.374878,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.374878,0.000000,10.593181>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<41.374878,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.374878,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.001947,0.000000,9.652578>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,56.306216,0> translate<41.374878,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.001947,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.001947,0.000000,10.593181>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<42.001947,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.310397,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.310397,0.000000,9.652578>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.310397,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.310397,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.780697,0.000000,9.652578>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<42.310397,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.780697,0.000000,9.652578>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.937466,0.000000,9.809344>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<42.780697,0.000000,9.652578> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.937466,0.000000,9.809344>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.937466,0.000000,10.436413>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<42.937466,0.000000,10.436413> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.937466,0.000000,10.436413>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.780697,0.000000,10.593181>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<42.780697,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.780697,0.000000,10.593181>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.310397,0.000000,10.593181>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<42.310397,0.000000,10.593181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.765363,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.765363,0.000000,9.588481>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.765363,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.765363,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.235663,0.000000,9.588481>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.765363,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.235663,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392431,0.000000,9.745247>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<36.235663,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392431,0.000000,9.745247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392431,0.000000,10.372316>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<36.392431,0.000000,10.372316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392431,0.000000,10.372316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.235663,0.000000,10.529084>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<36.235663,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.235663,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.765363,0.000000,10.529084>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.765363,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.700881,0.000000,10.215550>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.014416,0.000000,10.529084>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.700881,0.000000,10.215550> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.014416,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.014416,0.000000,9.588481>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.014416,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.700881,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.327950,0.000000,9.588481>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<36.700881,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.636400,0.000000,10.372316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.793166,0.000000,10.529084>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<37.636400,0.000000,10.372316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.793166,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,10.529084>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.793166,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,10.372316>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<38.106700,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,10.372316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,10.215550>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.263469,0.000000,10.215550> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,10.215550>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,10.058781>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.106700,0.000000,10.058781> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,10.058781>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.949934,0.000000,10.058781>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<37.949934,0.000000,10.058781> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,10.058781>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,9.902016>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<38.106700,0.000000,10.058781> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,9.902016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,9.745247>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.263469,0.000000,9.745247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.263469,0.000000,9.745247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,9.588481>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<38.106700,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.106700,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.793166,0.000000,9.588481>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.793166,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.793166,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.636400,0.000000,9.745247>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<37.636400,0.000000,9.745247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.554709,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.554709,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.554709,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.554709,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.025009,0.000000,9.524384>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.554709,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.025009,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.181778,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<30.025009,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.181778,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.181778,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<30.181778,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.181778,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.025009,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<30.025009,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.025009,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.554709,0.000000,10.464988>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<29.554709,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.490228,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.803763,0.000000,10.464988>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.490228,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.803763,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.803763,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.803763,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.490228,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.117297,0.000000,9.524384>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<30.490228,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.052816,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.425747,0.000000,9.524384>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<31.425747,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.425747,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.052816,0.000000,10.151453>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.425747,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.052816,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.052816,0.000000,10.308219>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<32.052816,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.052816,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.896047,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<31.896047,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.896047,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.582512,0.000000,10.464988>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<31.582512,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.582512,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.425747,0.000000,10.308219>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<31.425747,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.560575,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.560575,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.560575,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.560575,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.030875,0.000000,9.524384>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<24.560575,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.030875,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.187644,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<25.030875,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.187644,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.187644,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<25.187644,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.187644,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.030875,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<25.030875,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.030875,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.560575,0.000000,10.464988>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<24.560575,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.496094,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.809628,0.000000,10.464988>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.496094,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.809628,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.809628,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.809628,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.496094,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.123163,0.000000,9.524384>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<25.496094,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.431612,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.745147,0.000000,10.464988>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.431612,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.745147,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.745147,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.745147,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.431612,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.058681,0.000000,9.524384>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<26.431612,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.374359,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.374359,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.374359,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.374359,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.844659,0.000000,9.524384>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.374359,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.844659,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.001428,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<19.844659,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.001428,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.001428,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<20.001428,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.001428,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.844659,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<19.844659,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.844659,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.374359,0.000000,10.464988>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<19.374359,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.309878,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.623413,0.000000,10.464988>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<20.309878,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.623413,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.623413,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.623413,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.309878,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.936947,0.000000,9.524384>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<20.309878,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.245397,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.245397,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<21.245397,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.245397,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.402162,0.000000,10.464988>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<21.245397,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.402162,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.715697,0.000000,10.464988>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.402162,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.715697,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.872466,0.000000,10.308219>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<21.715697,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.872466,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.872466,0.000000,9.681150>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.872466,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.872466,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.715697,0.000000,9.524384>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<21.715697,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.715697,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.402162,0.000000,9.524384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<21.402162,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.402162,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.245397,0.000000,9.681150>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<21.245397,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.245397,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.872466,0.000000,10.308219>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.245397,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.163706,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.163706,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.163706,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.163706,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.634006,0.000000,9.524384>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.163706,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.634006,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.790775,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<13.634006,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.790775,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.790775,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<13.790775,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.790775,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.634006,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<13.634006,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.634006,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.163706,0.000000,10.464988>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<13.163706,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.099225,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,9.524384>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<14.099225,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.569525,0.000000,9.524384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.255991,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.569525,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.726294,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<14.569525,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.726294,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.726294,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<14.726294,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.726294,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.569525,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<14.569525,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.569525,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,10.464988>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<14.255991,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.099225,0.000000,10.308219>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<14.099225,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.099225,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.099225,0.000000,10.151453>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.099225,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.099225,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,9.994684>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<14.099225,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.255991,0.000000,9.994684>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.726294,0.000000,9.994684>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<14.255991,0.000000,9.994684> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.169575,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.169575,0.000000,9.524384>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.169575,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.169575,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.639875,0.000000,9.524384>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.169575,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.639875,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.796644,0.000000,9.681150>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<8.639875,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.796644,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.796644,0.000000,10.308219>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<8.796644,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.796644,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.639875,0.000000,10.464988>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<8.639875,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.639875,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.169575,0.000000,10.464988>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<8.169575,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,10.464988>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<9.105094,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,10.464988>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.261859,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,10.464988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,10.308219>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<9.575394,0.000000,10.464988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,10.308219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,10.151453>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.732163,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,9.994684>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.575394,0.000000,9.994684> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,9.994684>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,9.837919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<9.575394,0.000000,9.994684> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,9.837919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,9.681150>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.732163,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.732163,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,9.524384>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<9.575394,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,9.524384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.261859,0.000000,9.524384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,9.524384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,9.681150>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<9.105094,0.000000,9.681150> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,9.681150>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,9.837919>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<9.105094,0.000000,9.837919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,9.837919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,9.994684>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.105094,0.000000,9.837919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,9.994684>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,10.151453>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<9.105094,0.000000,10.151453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,10.151453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.105094,0.000000,10.308219>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<9.105094,0.000000,10.308219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.261859,0.000000,9.994684>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.575394,0.000000,9.994684>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.261859,0.000000,9.994684> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.303494,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.303494,0.000000,9.588481>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.303494,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.303494,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.773794,0.000000,9.588481>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.303494,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.773794,0.000000,9.588481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.930563,0.000000,9.745247>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<3.773794,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.930563,0.000000,9.745247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.930563,0.000000,10.372316>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<3.930563,0.000000,10.372316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.930563,0.000000,10.372316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.773794,0.000000,10.529084>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<3.773794,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.773794,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.303494,0.000000,10.529084>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.303494,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.239013,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.866081,0.000000,10.529084>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<4.239013,0.000000,10.529084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.866081,0.000000,10.529084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.866081,0.000000,10.372316>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.866081,0.000000,10.372316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.866081,0.000000,10.372316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.239013,0.000000,9.745247>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.239013,0.000000,9.745247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.239013,0.000000,9.745247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.239013,0.000000,9.588481>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.239013,0.000000,9.588481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.333531,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.333531,0.000000,26.048747>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<4.333531,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.333531,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.863231,0.000000,26.048747>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.863231,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.863231,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.706463,0.000000,25.891981>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<3.706463,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.706463,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.706463,0.000000,25.264913>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.706463,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.706463,0.000000,25.264913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.863231,0.000000,25.108144>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<3.706463,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.863231,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.333531,0.000000,25.108144>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<3.863231,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.770944,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.084478,0.000000,25.264913>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<2.770944,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.084478,0.000000,25.264913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.398013,0.000000,25.578447>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.084478,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.398013,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.398013,0.000000,25.891981>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<3.398013,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.398013,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.241247,0.000000,26.048747>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<3.241247,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.241247,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.927713,0.000000,26.048747>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<2.927713,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.927713,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.770944,0.000000,25.891981>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<2.770944,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.770944,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.770944,0.000000,25.735213>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.770944,0.000000,25.735213> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.770944,0.000000,25.735213>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.927713,0.000000,25.578447>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<2.770944,0.000000,25.735213> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.927713,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.398013,0.000000,25.578447>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.927713,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.611478,0.000000,25.215059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.611478,0.000000,26.155663>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<9.611478,0.000000,26.155663> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.611478,0.000000,26.155663>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.141178,0.000000,26.155663>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.141178,0.000000,26.155663> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.141178,0.000000,26.155663>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.984409,0.000000,25.998897>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<8.984409,0.000000,25.998897> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.984409,0.000000,25.998897>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.984409,0.000000,25.371828>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.984409,0.000000,25.371828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.984409,0.000000,25.371828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.141178,0.000000,25.215059>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<8.984409,0.000000,25.371828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.141178,0.000000,25.215059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.611478,0.000000,25.215059>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<9.141178,0.000000,25.215059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.048891,0.000000,25.215059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.675959,0.000000,25.215059>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<8.048891,0.000000,25.215059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.675959,0.000000,25.215059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.675959,0.000000,25.685363>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<8.675959,0.000000,25.685363> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.675959,0.000000,25.685363>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.362425,0.000000,25.528594>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<8.362425,0.000000,25.528594> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.362425,0.000000,25.528594>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.205659,0.000000,25.528594>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<8.205659,0.000000,25.528594> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.205659,0.000000,25.528594>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.048891,0.000000,25.685363>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<8.048891,0.000000,25.685363> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.048891,0.000000,25.685363>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.048891,0.000000,25.998897>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<8.048891,0.000000,25.998897> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.048891,0.000000,25.998897>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.205659,0.000000,26.155663>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<8.048891,0.000000,25.998897> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.205659,0.000000,26.155663>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.519194,0.000000,26.155663>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<8.205659,0.000000,26.155663> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.519194,0.000000,26.155663>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.675959,0.000000,25.998897>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<8.519194,0.000000,26.155663> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.836113,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.836113,0.000000,26.048747>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<14.836113,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.836113,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.365813,0.000000,26.048747>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<14.365813,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.365813,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.209044,0.000000,25.891981>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<14.209044,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.209044,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.209044,0.000000,25.264913>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.209044,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.209044,0.000000,25.264913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.365813,0.000000,25.108144>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<14.209044,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.365813,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.836113,0.000000,25.108144>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<14.365813,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.430294,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.430294,0.000000,25.108144>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.430294,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.430294,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.900594,0.000000,25.578447>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,-44.997221,0> translate<13.430294,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.900594,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.273525,0.000000,25.578447>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<13.273525,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.286934,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.286934,0.000000,25.995291>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<21.286934,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.286934,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.816634,0.000000,25.995291>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.816634,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.816634,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.659866,0.000000,25.838525>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<20.659866,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.659866,0.000000,25.838525>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.659866,0.000000,25.211456>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.659866,0.000000,25.211456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.659866,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.816634,0.000000,25.054688>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<20.659866,0.000000,25.211456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.816634,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.286934,0.000000,25.054688>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<20.816634,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.351416,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.194650,0.000000,25.054688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<20.194650,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.194650,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.054688>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.881116,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.211456>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<19.724347,0.000000,25.211456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.368222>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<19.724347,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.524991>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<19.724347,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.037881,0.000000,25.524991>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<19.881116,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.681756>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<19.724347,0.000000,25.681756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.681756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.838525>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<19.724347,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.724347,0.000000,25.838525>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.995291>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<19.724347,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.881116,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.194650,0.000000,25.995291>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<19.881116,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.194650,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.351416,0.000000,25.838525>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<20.194650,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.031756,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.031756,0.000000,25.941834>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<26.031756,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.031756,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.561456,0.000000,25.941834>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<25.561456,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.561456,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.404688,0.000000,25.785069>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<25.404688,0.000000,25.785069> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.404688,0.000000,25.785069>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.404688,0.000000,25.158000>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.404688,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.404688,0.000000,25.158000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.561456,0.000000,25.001231>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<25.404688,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.561456,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.031756,0.000000,25.001231>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<25.561456,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469169,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.096238,0.000000,25.941834>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<24.469169,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.096238,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469169,0.000000,25.314766>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.469169,0.000000,25.314766> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469169,0.000000,25.314766>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469169,0.000000,25.158000>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.469169,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469169,0.000000,25.158000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.625938,0.000000,25.001231>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<24.469169,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.625938,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.939472,0.000000,25.001231>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.625938,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.939472,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.096238,0.000000,25.158000>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<24.939472,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.989825,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.989825,0.000000,25.941834>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<30.989825,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.989825,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.519525,0.000000,25.941834>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.519525,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.519525,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.362756,0.000000,25.785069>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<30.362756,0.000000,25.785069> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.362756,0.000000,25.785069>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.362756,0.000000,25.158000>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.362756,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.362756,0.000000,25.158000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.519525,0.000000,25.001231>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<30.362756,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.519525,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.989825,0.000000,25.001231>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.519525,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.054306,0.000000,25.314766>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740772,0.000000,25.001231>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.740772,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740772,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.740772,0.000000,25.941834>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<29.740772,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.054306,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.427238,0.000000,25.941834>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<29.427238,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.080400,0.000000,25.161600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.080400,0.000000,26.102203>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<38.080400,0.000000,26.102203> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.080400,0.000000,26.102203>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.610100,0.000000,26.102203>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.610100,0.000000,26.102203> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.610100,0.000000,26.102203>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453331,0.000000,25.945438>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<37.453331,0.000000,25.945438> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453331,0.000000,25.945438>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453331,0.000000,25.318369>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.453331,0.000000,25.318369> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453331,0.000000,25.318369>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.610100,0.000000,25.161600>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<37.453331,0.000000,25.318369> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.610100,0.000000,25.161600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.080400,0.000000,25.161600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.610100,0.000000,25.161600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.144881,0.000000,25.945438>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.144881,0.000000,25.318369>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.144881,0.000000,25.318369> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.144881,0.000000,25.318369>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.988116,0.000000,25.161600>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<36.988116,0.000000,25.161600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.988116,0.000000,25.161600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.674581,0.000000,25.161600>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.674581,0.000000,25.161600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.674581,0.000000,25.161600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.517813,0.000000,25.318369>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<36.517813,0.000000,25.318369> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.517813,0.000000,25.318369>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.517813,0.000000,25.945438>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<36.517813,0.000000,25.945438> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.517813,0.000000,25.945438>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.674581,0.000000,26.102203>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<36.517813,0.000000,25.945438> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.674581,0.000000,26.102203>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.988116,0.000000,26.102203>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.674581,0.000000,26.102203> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.988116,0.000000,26.102203>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.144881,0.000000,25.945438>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<36.988116,0.000000,26.102203> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.144881,0.000000,25.945438>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.517813,0.000000,25.318369>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.517813,0.000000,25.318369> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.558656,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.558656,0.000000,25.421678>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.558656,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.558656,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.245122,0.000000,25.108144>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.245122,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.245122,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.931587,0.000000,25.421678>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<41.931587,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.931587,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.931587,0.000000,26.048747>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<41.931587,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.558656,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.931587,0.000000,25.578447>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<41.931587,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.623137,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.996069,0.000000,25.108144>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<40.996069,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.996069,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.996069,0.000000,25.264913>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<40.996069,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.996069,0.000000,25.264913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.623137,0.000000,25.891981>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.996069,0.000000,25.264913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.623137,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.623137,0.000000,26.048747>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<41.623137,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.729978,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.729978,0.000000,25.368222>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.729978,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.729978,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.416444,0.000000,25.054688>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.416444,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.416444,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102909,0.000000,25.368222>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<47.102909,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102909,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102909,0.000000,25.995291>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<47.102909,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.729978,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102909,0.000000,25.524991>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<47.102909,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.167391,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.480925,0.000000,25.211456>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<46.167391,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.480925,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.794459,0.000000,25.524991>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.480925,0.000000,25.211456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.794459,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.794459,0.000000,25.838525>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<46.794459,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.794459,0.000000,25.838525>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.637694,0.000000,25.995291>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<46.637694,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.637694,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.324159,0.000000,25.995291>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<46.324159,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.324159,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.167391,0.000000,25.838525>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<46.167391,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.167391,0.000000,25.838525>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.167391,0.000000,25.681756>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.167391,0.000000,25.681756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.167391,0.000000,25.681756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.324159,0.000000,25.524991>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<46.167391,0.000000,25.681756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.324159,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.794459,0.000000,25.524991>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<46.324159,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.967550,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.967550,0.000000,25.421678>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.967550,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.967550,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.654016,0.000000,25.108144>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.654016,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.654016,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.340481,0.000000,25.421678>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<53.340481,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.340481,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.340481,0.000000,26.048747>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.340481,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.967550,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.340481,0.000000,25.578447>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<53.340481,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.404963,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.032031,0.000000,25.108144>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<52.404963,0.000000,25.108144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.032031,0.000000,25.108144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.032031,0.000000,25.578447>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<53.032031,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.032031,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.718497,0.000000,25.421678>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<52.718497,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.718497,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.561731,0.000000,25.421678>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<52.561731,0.000000,25.421678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.561731,0.000000,25.421678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.404963,0.000000,25.578447>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<52.404963,0.000000,25.578447> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.404963,0.000000,25.578447>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.404963,0.000000,25.891981>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<52.404963,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.404963,0.000000,25.891981>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.561731,0.000000,26.048747>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<52.404963,0.000000,25.891981> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.561731,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.875266,0.000000,26.048747>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<52.561731,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.875266,0.000000,26.048747>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.032031,0.000000,25.891981>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<52.875266,0.000000,26.048747> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.192184,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.192184,0.000000,25.368222>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.192184,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.192184,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.878650,0.000000,25.054688>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.878650,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.878650,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.565116,0.000000,25.368222>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<58.565116,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.565116,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.565116,0.000000,25.995291>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<58.565116,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.192184,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.565116,0.000000,25.524991>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<58.565116,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.786366,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.786366,0.000000,25.054688>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.786366,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.786366,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.256666,0.000000,25.524991>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,-44.997221,0> translate<57.786366,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.256666,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.629597,0.000000,25.524991>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<57.629597,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.256878,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.256878,0.000000,25.368222>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.256878,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.256878,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.943344,0.000000,25.054688>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.943344,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.943344,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.629809,0.000000,25.368222>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<63.629809,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.629809,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.629809,0.000000,25.995291>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<63.629809,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.256878,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.629809,0.000000,25.524991>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<63.629809,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.321359,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.164594,0.000000,25.054688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<63.164594,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.164594,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.054688>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<62.851059,0.000000,25.054688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.054688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.211456>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<62.694291,0.000000,25.211456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.211456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.368222>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<62.694291,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.368222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.524991>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.694291,0.000000,25.368222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.007825,0.000000,25.524991>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.851059,0.000000,25.524991> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.524991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.681756>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<62.694291,0.000000,25.681756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.681756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.838525>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<62.694291,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.694291,0.000000,25.838525>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.995291>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<62.694291,0.000000,25.838525> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.851059,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.164594,0.000000,25.995291>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<62.851059,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.164594,0.000000,25.995291>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.321359,0.000000,25.838525>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<63.164594,0.000000,25.995291> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.707703,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.707703,0.000000,25.314766>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<70.707703,0.000000,25.314766> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.707703,0.000000,25.314766>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.394169,0.000000,25.001231>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<70.394169,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.394169,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.080634,0.000000,25.314766>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<70.080634,0.000000,25.314766> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.080634,0.000000,25.314766>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.080634,0.000000,25.941834>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<70.080634,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.707703,0.000000,25.471534>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<70.080634,0.000000,25.471534>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<70.080634,0.000000,25.471534> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.145116,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.772184,0.000000,25.941834>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<69.145116,0.000000,25.941834> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.772184,0.000000,25.941834>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.145116,0.000000,25.314766>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<69.145116,0.000000,25.314766> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.145116,0.000000,25.314766>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.145116,0.000000,25.158000>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<69.145116,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.145116,0.000000,25.158000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.301884,0.000000,25.001231>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<69.145116,0.000000,25.158000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.301884,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.615419,0.000000,25.001231>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<69.301884,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.615419,0.000000,25.001231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<69.772184,0.000000,25.158000>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<69.615419,0.000000,25.001231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.710206,0.000000,25.861709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.710206,0.000000,25.234641>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<75.710206,0.000000,25.234641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.710206,0.000000,25.234641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.396672,0.000000,24.921106>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<75.396672,0.000000,24.921106> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.396672,0.000000,24.921106>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.083138,0.000000,25.234641>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<75.083138,0.000000,25.234641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.083138,0.000000,25.234641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.083138,0.000000,25.861709>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<75.083138,0.000000,25.861709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.710206,0.000000,25.391409>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<75.083138,0.000000,25.391409>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<75.083138,0.000000,25.391409> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.774687,0.000000,25.234641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.461153,0.000000,24.921106>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<74.461153,0.000000,24.921106> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.461153,0.000000,24.921106>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.461153,0.000000,25.861709>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<74.461153,0.000000,25.861709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.774687,0.000000,25.861709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<74.147619,0.000000,25.861709>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<74.147619,0.000000,25.861709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.021744,0.000000,25.888184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.021744,0.000000,25.261116>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<81.021744,0.000000,25.261116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.021744,0.000000,25.261116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.708209,0.000000,24.947581>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<80.708209,0.000000,24.947581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.708209,0.000000,24.947581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.394675,0.000000,25.261116>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<80.394675,0.000000,25.261116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.394675,0.000000,25.261116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.394675,0.000000,25.888184>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<80.394675,0.000000,25.888184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<81.021744,0.000000,25.417884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.394675,0.000000,25.417884>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<80.394675,0.000000,25.417884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.086225,0.000000,25.731419>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.086225,0.000000,25.104350>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<80.086225,0.000000,25.104350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.086225,0.000000,25.104350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.929459,0.000000,24.947581>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<79.929459,0.000000,24.947581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.929459,0.000000,24.947581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.615925,0.000000,24.947581>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<79.615925,0.000000,24.947581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.615925,0.000000,24.947581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.459156,0.000000,25.104350>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<79.459156,0.000000,25.104350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.459156,0.000000,25.104350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.459156,0.000000,25.731419>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<79.459156,0.000000,25.731419> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.459156,0.000000,25.731419>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.615925,0.000000,25.888184>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<79.459156,0.000000,25.731419> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.615925,0.000000,25.888184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.929459,0.000000,25.888184>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<79.615925,0.000000,25.888184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.929459,0.000000,25.888184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.086225,0.000000,25.731419>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<79.929459,0.000000,25.888184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<80.086225,0.000000,25.731419>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<79.459156,0.000000,25.104350>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,-44.997030,0> translate<79.459156,0.000000,25.104350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.121400,0.000000,17.380856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.537625>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.121400,0.000000,17.380856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.537625>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.851159>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<10.278169,0.000000,17.851159> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.851159>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.121400,0.000000,18.007925>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<10.121400,0.000000,18.007925> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.121400,0.000000,18.007925>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,18.007925>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.494331,0.000000,18.007925> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,18.007925>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,17.851159>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.337566,0.000000,17.851159> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,17.851159>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,17.537625>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.337566,0.000000,17.537625> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,17.537625>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,17.380856>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<9.337566,0.000000,17.537625> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,17.380856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.807866,0.000000,17.380856>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<9.494331,0.000000,17.380856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.807866,0.000000,17.380856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.807866,0.000000,17.694391>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<9.807866,0.000000,17.694391> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,17.072406>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.072406>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<9.337566,0.000000,17.072406> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,17.072406>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,16.445338>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-33.687844,0> translate<9.337566,0.000000,16.445338> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,16.445338>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,16.445338>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<9.337566,0.000000,16.445338> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,16.136888>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,16.136888>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<9.337566,0.000000,16.136888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,16.136888>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,15.666588>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.337566,0.000000,15.666588> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.337566,0.000000,15.666588>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,15.509819>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<9.337566,0.000000,15.666588> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.494331,0.000000,15.509819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.121400,0.000000,15.509819>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.494331,0.000000,15.509819> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.121400,0.000000,15.509819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,15.666588>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.121400,0.000000,15.509819> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,15.666588>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.278169,0.000000,16.136888>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<10.278169,0.000000,16.136888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.318781,0.000000,13.064122>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.691713,0.000000,13.064122>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.691713,0.000000,13.064122> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.691713,0.000000,13.064122>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.378178,0.000000,12.750587>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.378178,0.000000,12.750587> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.378178,0.000000,12.750587>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.691713,0.000000,12.437053>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<9.378178,0.000000,12.750587> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.691713,0.000000,12.437053>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.318781,0.000000,12.437053>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.691713,0.000000,12.437053> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.848478,0.000000,12.128603>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.848478,0.000000,11.501534>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.848478,0.000000,11.501534> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.162013,0.000000,11.815069>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.534944,0.000000,11.815069>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<9.534944,0.000000,11.815069> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.056575,0.000000,24.276150>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.963363,0.000000,24.369363>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<74.963363,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.963363,0.000000,24.369363>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.776938,0.000000,24.369363>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<74.776938,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.776938,0.000000,24.369363>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.683725,0.000000,24.276150>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<74.683725,0.000000,24.276150> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.683725,0.000000,24.276150>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.683725,0.000000,23.903300>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<74.683725,0.000000,23.903300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.683725,0.000000,23.903300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.776938,0.000000,23.810088>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<74.683725,0.000000,23.903300> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.776938,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.963363,0.000000,23.810088>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<74.776938,0.000000,23.810088> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.963363,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.056575,0.000000,23.903300>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<74.963363,0.000000,23.810088> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.056575,0.000000,23.903300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.056575,0.000000,24.089725>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,90.000000,0> translate<75.056575,0.000000,24.089725> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.056575,0.000000,24.089725>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.870150,0.000000,24.089725>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<74.870150,0.000000,24.089725> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.245034,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.245034,0.000000,24.369363>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<75.245034,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.245034,0.000000,24.369363>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.617884,0.000000,23.810088>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<75.245034,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.617884,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.617884,0.000000,24.369363>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<75.617884,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.806344,0.000000,24.369363>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.806344,0.000000,23.810088>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.806344,0.000000,23.810088> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.806344,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.085981,0.000000,23.810088>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<75.806344,0.000000,23.810088> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.085981,0.000000,23.810088>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.179194,0.000000,23.903300>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<76.085981,0.000000,23.810088> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.179194,0.000000,23.903300>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.179194,0.000000,24.276150>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<76.179194,0.000000,24.276150> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.179194,0.000000,24.276150>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.085981,0.000000,24.369363>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<76.085981,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.085981,0.000000,24.369363>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.806344,0.000000,24.369363>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<75.806344,0.000000,24.369363> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.780953,0.000000,21.934256>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.780953,0.000000,21.561406>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<74.780953,0.000000,21.561406> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.780953,0.000000,21.561406>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.967378,0.000000,21.374981>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<74.780953,0.000000,21.561406> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.967378,0.000000,21.374981>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.153803,0.000000,21.561406>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,-44.997030,0> translate<74.967378,0.000000,21.374981> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.153803,0.000000,21.561406>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.153803,0.000000,21.934256>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,90.000000,0> translate<75.153803,0.000000,21.934256> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.715113,0.000000,21.841044>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.621900,0.000000,21.934256>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.621900,0.000000,21.934256> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.621900,0.000000,21.934256>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.435475,0.000000,21.934256>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.435475,0.000000,21.934256> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.435475,0.000000,21.934256>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342263,0.000000,21.841044>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.342263,0.000000,21.841044> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342263,0.000000,21.841044>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342263,0.000000,21.468194>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.342263,0.000000,21.468194> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342263,0.000000,21.468194>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.435475,0.000000,21.374981>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.342263,0.000000,21.468194> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.435475,0.000000,21.374981>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.621900,0.000000,21.374981>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.435475,0.000000,21.374981> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.621900,0.000000,21.374981>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.715113,0.000000,21.468194>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.621900,0.000000,21.374981> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.276422,0.000000,21.841044>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.183209,0.000000,21.934256>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<76.183209,0.000000,21.934256> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.183209,0.000000,21.934256>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.996784,0.000000,21.934256>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.996784,0.000000,21.934256> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.996784,0.000000,21.934256>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.903572,0.000000,21.841044>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.903572,0.000000,21.841044> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.903572,0.000000,21.841044>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.903572,0.000000,21.468194>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.903572,0.000000,21.468194> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.903572,0.000000,21.468194>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.996784,0.000000,21.374981>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.903572,0.000000,21.468194> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.996784,0.000000,21.374981>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.183209,0.000000,21.374981>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.996784,0.000000,21.374981> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.183209,0.000000,21.374981>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.276422,0.000000,21.468194>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<76.183209,0.000000,21.374981> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.019341,0.000000,19.065547>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.019341,0.000000,19.624822>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<75.019341,0.000000,19.624822> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.019341,0.000000,19.624822>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.298978,0.000000,19.624822>}
box{<0,0,-0.025400><0.279638,0.036000,0.025400> rotate<0,0.000000,0> translate<75.019341,0.000000,19.624822> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.298978,0.000000,19.624822>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.392191,0.000000,19.531609>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.298978,0.000000,19.624822> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.392191,0.000000,19.531609>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.392191,0.000000,19.345184>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.392191,0.000000,19.345184> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.392191,0.000000,19.345184>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.298978,0.000000,19.251972>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.298978,0.000000,19.251972> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.298978,0.000000,19.251972>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.019341,0.000000,19.251972>}
box{<0,0,-0.025400><0.279638,0.036000,0.025400> rotate<0,0.000000,0> translate<75.019341,0.000000,19.251972> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.205766,0.000000,19.251972>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.392191,0.000000,19.065547>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<75.205766,0.000000,19.251972> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.580650,0.000000,19.624822>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.953500,0.000000,19.065547>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<75.580650,0.000000,19.624822> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.953500,0.000000,19.624822>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.580650,0.000000,19.065547>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,-56.306216,0> translate<75.580650,0.000000,19.065547> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.189478,0.000000,16.344466>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.189478,0.000000,16.903741>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<75.189478,0.000000,16.903741> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.003053,0.000000,16.903741>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.375903,0.000000,16.903741>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<75.003053,0.000000,16.903741> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.564363,0.000000,16.903741>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.937213,0.000000,16.344466>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,56.306216,0> translate<75.564363,0.000000,16.903741> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.937213,0.000000,16.903741>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.564363,0.000000,16.344466>}
box{<0,0,-0.025400><0.672165,0.036000,0.025400> rotate<0,-56.306216,0> translate<75.564363,0.000000,16.344466> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.940609,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.940609,0.000000,14.171772>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<73.940609,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.940609,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.220247,0.000000,14.171772>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<73.940609,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.220247,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.313459,0.000000,14.078559>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<74.220247,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.313459,0.000000,14.078559>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.313459,0.000000,13.892134>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,-90.000000,0> translate<74.313459,0.000000,13.892134> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.313459,0.000000,13.892134>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.220247,0.000000,13.798922>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<74.220247,0.000000,13.798922> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.220247,0.000000,13.798922>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<73.940609,0.000000,13.798922>}
box{<0,0,-0.025400><0.279637,0.036000,0.025400> rotate<0,0.000000,0> translate<73.940609,0.000000,13.798922> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.127034,0.000000,13.798922>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.313459,0.000000,13.612497>}
box{<0,0,-0.025400><0.263645,0.036000,0.025400> rotate<0,44.997030,0> translate<74.127034,0.000000,13.798922> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.874769,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.501919,0.000000,14.171772>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<74.501919,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.501919,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.501919,0.000000,13.612497>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<74.501919,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.501919,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.874769,0.000000,13.612497>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<74.501919,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.501919,0.000000,13.892134>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<74.688344,0.000000,13.892134>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<74.501919,0.000000,13.892134> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.436078,0.000000,14.078559>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,14.171772>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.342866,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,14.171772>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.156441,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.063228,0.000000,14.078559>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.063228,0.000000,14.078559> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.063228,0.000000,14.078559>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.063228,0.000000,13.985347>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.063228,0.000000,13.985347> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.063228,0.000000,13.985347>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,13.892134>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.063228,0.000000,13.985347> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,13.892134>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,13.892134>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.156441,0.000000,13.892134> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,13.892134>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.436078,0.000000,13.798922>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.342866,0.000000,13.892134> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.436078,0.000000,13.798922>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.436078,0.000000,13.705709>}
box{<0,0,-0.025400><0.093212,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.436078,0.000000,13.705709> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.436078,0.000000,13.705709>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,13.612497>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,-44.997030,0> translate<75.342866,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.342866,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,13.612497>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.156441,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.156441,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.063228,0.000000,13.705709>}
box{<0,0,-0.025400><0.131822,0.036000,0.025400> rotate<0,44.997030,0> translate<75.063228,0.000000,13.705709> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.997388,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.624538,0.000000,14.171772>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<75.624538,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.624538,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.624538,0.000000,13.612497>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,-90.000000,0> translate<75.624538,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.624538,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.997388,0.000000,13.612497>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<75.624538,0.000000,13.612497> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.624538,0.000000,13.892134>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<75.810963,0.000000,13.892134>}
box{<0,0,-0.025400><0.186425,0.036000,0.025400> rotate<0,0.000000,0> translate<75.624538,0.000000,13.892134> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.372272,0.000000,13.612497>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.372272,0.000000,14.171772>}
box{<0,0,-0.025400><0.559275,0.036000,0.025400> rotate<0,90.000000,0> translate<76.372272,0.000000,14.171772> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.185847,0.000000,14.171772>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<76.558697,0.000000,14.171772>}
box{<0,0,-0.025400><0.372850,0.036000,0.025400> rotate<0,0.000000,0> translate<76.185847,0.000000,14.171772> }
//A3/A2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.037331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.037331,0.000000,12.183009>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<51.037331,0.000000,12.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.537331,0.000000,22.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.537331,0.000000,22.183009>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.537331,0.000000,22.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.837331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,12.183009>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.837331,0.000000,12.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,13.983009>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.237331,0.000000,13.983009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,20.383009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,22.183009>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.237331,0.000000,22.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,22.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.837331,0.000000,22.183009>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.837331,0.000000,22.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.837331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.837331,0.000000,22.183009>}
box{<0,0,-0.127000><10.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<49.837331,0.000000,22.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,12.183009>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.237331,0.000000,12.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,12.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,13.983009>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.837331,0.000000,13.983009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,13.983009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,13.983009>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.237331,0.000000,13.983009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,13.983009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,20.383009>}
box{<0,0,-0.127000><6.400000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.237331,0.000000,20.383009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,20.383009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,20.383009>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.237331,0.000000,20.383009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,20.383009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,22.183009>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.837331,0.000000,22.183009> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.837331,0.000000,22.183009>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.237331,0.000000,22.183009>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<54.237331,0.000000,22.183009> }
//BT_RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.720672,0.000000,15.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.720672,0.000000,21.005031>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<80.720672,0.000000,21.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.720672,0.000000,21.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.470672,0.000000,21.005031>}
box{<0,0,-0.063500><0.750000,0.036000,0.063500> rotate<0,0.000000,0> translate<80.720672,0.000000,21.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.470672,0.000000,21.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.970672,0.000000,21.505031>}
box{<0,0,-0.063500><0.707107,0.036000,0.063500> rotate<0,-44.997030,0> translate<81.470672,0.000000,21.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.970672,0.000000,21.505031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,21.505031>}
box{<0,0,-0.063500><1.250000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.970672,0.000000,21.505031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,21.505031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,19.005031>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<83.220672,0.000000,19.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,19.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,17.005031>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<83.220672,0.000000,17.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,14.505031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.970672,0.000000,14.505031>}
box{<0,0,-0.063500><1.250000,0.036000,0.063500> rotate<0,0.000000,0> translate<81.970672,0.000000,14.505031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.970672,0.000000,14.505031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.470672,0.000000,15.005031>}
box{<0,0,-0.063500><0.707107,0.036000,0.063500> rotate<0,44.997030,0> translate<81.470672,0.000000,15.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<81.470672,0.000000,15.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<80.720672,0.000000,15.005031>}
box{<0,0,-0.063500><0.750000,0.036000,0.063500> rotate<0,0.000000,0> translate<80.720672,0.000000,15.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,14.505031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,17.005031>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<83.220672,0.000000,17.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,17.005031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.470672,0.000000,17.255031>}
box{<0,0,-0.063500><0.353553,0.036000,0.063500> rotate<0,-44.997030,0> translate<83.220672,0.000000,17.005031> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.470672,0.000000,18.755031>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<83.220672,0.000000,19.005031>}
box{<0,0,-0.063500><0.353553,0.036000,0.063500> rotate<0,44.997030,0> translate<83.220672,0.000000,19.005031> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,16.383000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.685000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.415000,0.000000,16.383000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.415000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.415000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.415000,0.000000,19.177000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.415000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.415000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.685000,0.000000,19.177000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.415000,0.000000,19.177000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875000,0.000000,19.177000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.875000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.145000,0.000000,19.177000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.875000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.145000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.145000,0.000000,16.383000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.145000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.145000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875000,0.000000,16.383000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.875000,0.000000,16.383000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,14.097000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.955000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,14.097000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.955000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,11.303000>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.225000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.225000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.955000,0.000000,11.303000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.955000,0.000000,11.303000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.070006,0.000000,14.071581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.515006,0.000000,14.071581>}
box{<0,0,-0.050800><4.445000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.070006,0.000000,14.071581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.515006,0.000000,14.071581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.515006,0.000000,11.277581>}
box{<0,0,-0.050800><2.794000,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.515006,0.000000,11.277581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.515006,0.000000,11.277581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.070006,0.000000,11.277581>}
box{<0,0,-0.050800><4.445000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.070006,0.000000,11.277581> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.070006,0.000000,11.277581>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.070006,0.000000,14.071581>}
box{<0,0,-0.050800><2.794000,0.036000,0.050800> rotate<0,90.000000,0> translate<14.070006,0.000000,14.071581> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.594006,0.000000,12.674581>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.102006,0.000000,12.674581>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.594006,0.000000,12.674581> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.848006,0.000000,12.420581>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.848006,0.000000,12.928581>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.848006,0.000000,12.928581> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.829881,0.000000,21.388297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.384881,0.000000,21.388297>}
box{<0,0,-0.050800><4.445000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.384881,0.000000,21.388297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.384881,0.000000,21.388297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.384881,0.000000,24.182297>}
box{<0,0,-0.050800><2.794000,0.036000,0.050800> rotate<0,90.000000,0> translate<14.384881,0.000000,24.182297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.384881,0.000000,24.182297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.829881,0.000000,24.182297>}
box{<0,0,-0.050800><4.445000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.384881,0.000000,24.182297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.829881,0.000000,24.182297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.829881,0.000000,21.388297>}
box{<0,0,-0.050800><2.794000,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.829881,0.000000,21.388297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.305881,0.000000,22.785297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.797881,0.000000,22.785297>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.797881,0.000000,22.785297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.051881,0.000000,23.039297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.051881,0.000000,22.531297>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.051881,0.000000,22.531297> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.669178,0.000000,19.161397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.669178,0.000000,16.494397>}
box{<0,0,-0.063500><2.667000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.669178,0.000000,16.494397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.669178,0.000000,16.494397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.399178,0.000000,16.494397>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.399178,0.000000,16.494397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.399178,0.000000,16.494397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.399178,0.000000,19.161397>}
box{<0,0,-0.063500><2.667000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.399178,0.000000,19.161397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.399178,0.000000,19.161397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.669178,0.000000,19.161397>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.399178,0.000000,19.161397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.415178,0.000000,17.954897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.653178,0.000000,17.954897>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.653178,0.000000,17.954897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.653178,0.000000,17.954897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.843678,0.000000,17.827897>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,33.687844,0> translate<20.653178,0.000000,17.954897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.843678,0.000000,17.827897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.034178,0.000000,17.700897>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,33.687844,0> translate<20.843678,0.000000,17.827897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.034178,0.000000,17.700897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.224678,0.000000,17.827897>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,-33.687844,0> translate<21.034178,0.000000,17.700897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.224678,0.000000,17.827897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.415178,0.000000,17.954897>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,-33.687844,0> translate<21.224678,0.000000,17.827897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.288178,0.000000,17.891397>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.780178,0.000000,17.891397>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.780178,0.000000,17.891397> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.224678,0.000000,17.827897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.843678,0.000000,17.827897>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.843678,0.000000,17.827897> }
//D2/D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.368375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.368375,0.000000,12.202513>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<58.368375,0.000000,12.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.868375,0.000000,22.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<60.868375,0.000000,22.202513>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<57.868375,0.000000,22.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.168375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,12.202513>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<57.168375,0.000000,12.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,14.002512>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<61.568375,0.000000,14.002512> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,20.402513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,22.202513>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<61.568375,0.000000,22.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,22.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.168375,0.000000,22.202513>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<57.168375,0.000000,22.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.168375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.168375,0.000000,22.202513>}
box{<0,0,-0.127000><10.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<57.168375,0.000000,22.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,12.202513>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.568375,0.000000,12.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,12.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,14.002512>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<62.168375,0.000000,14.002512> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,14.002512>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,14.002512>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.568375,0.000000,14.002512> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,14.002512>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,20.402513>}
box{<0,0,-0.127000><6.400000,0.036000,0.127000> rotate<0,90.000000,0> translate<61.568375,0.000000,20.402513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,20.402513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,20.402513>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.568375,0.000000,20.402513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,20.402513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,22.202513>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<62.168375,0.000000,22.202513> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.168375,0.000000,22.202513>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.568375,0.000000,22.202513>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<61.568375,0.000000,22.202513> }
//D13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.527113,0.000000,16.733450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.527113,0.000000,19.400450>}
box{<0,0,-0.063500><2.667000,0.036000,0.063500> rotate<0,90.000000,0> translate<72.527113,0.000000,19.400450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.527113,0.000000,19.400450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.797112,0.000000,19.400450>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.527113,0.000000,19.400450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.797112,0.000000,19.400450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.797112,0.000000,16.733450>}
box{<0,0,-0.063500><2.667000,0.036000,0.063500> rotate<0,-90.000000,0> translate<73.797112,0.000000,16.733450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.797112,0.000000,16.733450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.527113,0.000000,16.733450>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.527113,0.000000,16.733450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.781113,0.000000,17.939950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.543113,0.000000,17.939950>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.781113,0.000000,17.939950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.543113,0.000000,17.939950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.352613,0.000000,18.066950>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,33.687844,0> translate<73.352613,0.000000,18.066950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.352613,0.000000,18.066950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.162113,0.000000,18.193950>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,33.687844,0> translate<73.162113,0.000000,18.193950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.162113,0.000000,18.193950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.971613,0.000000,18.066950>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,-33.687844,0> translate<72.971613,0.000000,18.066950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.971613,0.000000,18.066950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.781113,0.000000,17.939950>}
box{<0,0,-0.063500><0.228953,0.036000,0.063500> rotate<0,-33.687844,0> translate<72.781113,0.000000,17.939950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.908113,0.000000,18.003450>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.416112,0.000000,18.003450>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.908113,0.000000,18.003450> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<72.971613,0.000000,18.066950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<73.352613,0.000000,18.066950>}
box{<0,0,-0.063500><0.381000,0.036000,0.063500> rotate<0,0.000000,0> translate<72.971613,0.000000,18.066950> }
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.665347,0.000000,25.533669>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.205347,0.000000,25.533669>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.665347,0.000000,25.533669> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.205347,0.000000,25.533669>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.205347,0.000000,10.293669>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,-90.000000,0> translate<79.205347,0.000000,10.293669> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<79.205347,0.000000,10.293669>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.665347,0.000000,10.293669>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<76.665347,0.000000,10.293669> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.665347,0.000000,10.293669>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<76.665347,0.000000,25.533669>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,90.000000,0> translate<76.665347,0.000000,25.533669> }
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,34.544000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.183000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,34.544000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.183000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,26.416000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.677000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,26.416000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.183000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,33.020000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.437000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,33.020000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.437000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,27.940000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.423000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,27.940000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.437000,0.000000,27.940000> }
difference{
cylinder{<69.850000,0,30.480000><69.850000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<69.850000,-0.1,30.480000><69.850000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<74.930000,0,30.480000><74.930000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<74.930000,-0.1,30.480000><74.930000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<80.010000,0,30.480000><80.010000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<80.010000,-0.1,30.480000><80.010000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,34.544000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.673000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,34.544000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,26.416000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<66.167000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,26.416000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,33.020000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.927000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,33.020000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.927000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,27.940000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<65.913000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,27.940000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.927000,0.000000,27.940000> }
difference{
cylinder{<53.340000,0,30.480000><53.340000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<53.340000,-0.1,30.480000><53.340000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<58.420000,0,30.480000><58.420000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<58.420000,-0.1,30.480000><58.420000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<63.500000,0,30.480000><63.500000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<63.500000,-0.1,30.480000><63.500000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,34.544000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.163000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,34.544000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.163000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,26.416000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,26.416000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.163000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,33.020000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.417000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,33.020000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.417000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,27.940000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.403000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,27.940000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.417000,0.000000,27.940000> }
difference{
cylinder{<36.830000,0,30.480000><36.830000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<36.830000,-0.1,30.480000><36.830000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<41.910000,0,30.480000><41.910000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<41.910000,-0.1,30.480000><41.910000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<46.990000,0,30.480000><46.990000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<46.990000,-0.1,30.480000><46.990000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,34.544000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.653000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,34.544000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.653000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,26.416000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.147000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,26.416000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.653000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,33.020000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.907000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,33.020000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.907000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,27.940000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.893000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,27.940000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.907000,0.000000,27.940000> }
difference{
cylinder{<20.320000,0,30.480000><20.320000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<20.320000,-0.1,30.480000><20.320000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<25.400000,0,30.480000><25.400000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<25.400000,-0.1,30.480000><25.400000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<30.480000,0,30.480000><30.480000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<30.480000,-0.1,30.480000><30.480000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
//J6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,34.544000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.143000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,34.544000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.143000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,26.416000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.637000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,26.416000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.143000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,33.020000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.397000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,33.020000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.397000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,27.940000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.383000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,27.940000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.397000,0.000000,27.940000> }
difference{
cylinder{<3.810000,0,30.480000><3.810000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,30.480000><3.810000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<8.890000,0,30.480000><8.890000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<8.890000,-0.1,30.480000><8.890000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<13.970000,0,30.480000><13.970000,0.036000,30.480000>2.353000 translate<0,0.000000,0>}
cylinder{<13.970000,-0.1,30.480000><13.970000,0.135000,30.480000>2.226000 translate<0,0.000000,0>}}
//J7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,1.016000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.637000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,1.016000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.143000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,9.144000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.143000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.143000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.637000,0.000000,9.144000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.143000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,2.540000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.383000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,2.540000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.397000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,7.620000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.397000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.397000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.383000,0.000000,7.620000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.397000,0.000000,7.620000> }
difference{
cylinder{<13.970000,0,5.080000><13.970000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<13.970000,-0.1,5.080000><13.970000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<8.890000,0,5.080000><8.890000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<8.890000,-0.1,5.080000><8.890000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,5.080000><3.810000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,5.080000><3.810000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
//J8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,1.016000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.147000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,1.016000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.653000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,9.144000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.653000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.653000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.147000,0.000000,9.144000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.653000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,2.540000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.893000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,2.540000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.907000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,7.620000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.907000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.907000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.893000,0.000000,7.620000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<17.907000,0.000000,7.620000> }
difference{
cylinder{<30.480000,0,5.080000><30.480000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<30.480000,-0.1,5.080000><30.480000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<25.400000,0,5.080000><25.400000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<25.400000,-0.1,5.080000><25.400000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<20.320000,0,5.080000><20.320000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<20.320000,-0.1,5.080000><20.320000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
//J9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,1.016000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.657000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,1.016000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.163000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,9.144000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.163000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.163000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.657000,0.000000,9.144000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.163000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,2.540000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.403000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,2.540000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.417000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,7.620000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.417000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.417000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.403000,0.000000,7.620000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.417000,0.000000,7.620000> }
difference{
cylinder{<46.990000,0,5.080000><46.990000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<46.990000,-0.1,5.080000><46.990000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<41.910000,0,5.080000><41.910000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<41.910000,-0.1,5.080000><41.910000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<36.830000,0,5.080000><36.830000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<36.830000,-0.1,5.080000><36.830000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
//J10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,1.016000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<66.167000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,1.016000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,9.144000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.673000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<66.167000,0.000000,9.144000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,2.540000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<65.913000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,2.540000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.927000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,7.620000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<50.927000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.927000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.913000,0.000000,7.620000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.927000,0.000000,7.620000> }
difference{
cylinder{<63.500000,0,5.080000><63.500000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<63.500000,-0.1,5.080000><63.500000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<58.420000,0,5.080000><58.420000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<58.420000,-0.1,5.080000><58.420000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<53.340000,0,5.080000><53.340000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<53.340000,-0.1,5.080000><53.340000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
//J11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,1.016000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.677000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,1.016000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.183000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,9.144000>}
box{<0,0,-0.063500><8.128000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.183000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.183000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.677000,0.000000,9.144000>}
box{<0,0,-0.063500><15.494000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.183000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,2.540000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,-90.000000,0> translate<82.423000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,2.540000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.437000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,7.620000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,90.000000,0> translate<67.437000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.437000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<82.423000,0.000000,7.620000>}
box{<0,0,-0.063500><14.986000,0.036000,0.063500> rotate<0,0.000000,0> translate<67.437000,0.000000,7.620000> }
difference{
cylinder{<80.010000,0,5.080000><80.010000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<80.010000,-0.1,5.080000><80.010000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<74.930000,0,5.080000><74.930000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<74.930000,-0.1,5.080000><74.930000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
difference{
cylinder{<69.850000,0,5.080000><69.850000,0.036000,5.080000>2.353000 translate<0,0.000000,0>}
cylinder{<69.850000,-0.1,5.080000><69.850000,0.135000,5.080000>2.226000 translate<0,0.000000,0>}}
//J12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.624422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.624422,0.000000,17.926297>}
box{<0,0,-0.063500><7.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<1.624422,0.000000,17.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.624422,0.000000,17.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,17.926297>}
box{<0,0,-0.063500><1.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.624422,0.000000,17.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,17.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,17.926297>}
box{<0,0,-0.063500><4.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.024422,0.000000,17.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,17.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.624422,0.000000,17.926297>}
box{<0,0,-0.063500><1.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.224422,0.000000,17.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.624422,0.000000,17.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.624422,0.000000,10.926297>}
box{<0,0,-0.063500><7.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.624422,0.000000,10.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.624422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,10.926297>}
box{<0,0,-0.063500><1.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.224422,0.000000,10.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,10.926297>}
box{<0,0,-0.063500><4.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.024422,0.000000,10.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.624422,0.000000,10.926297>}
box{<0,0,-0.063500><1.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.624422,0.000000,10.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.024422,0.000000,17.926297>}
box{<0,0,-0.063500><7.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.024422,0.000000,17.926297> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,10.926297>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.224422,0.000000,17.926297>}
box{<0,0,-0.063500><7.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.224422,0.000000,17.926297> }
difference{
cylinder{<5.124422,0,12.696297><5.124422,0.036000,12.696297>1.563500 translate<0,0.000000,0>}
cylinder{<5.124422,-0.1,12.696297><5.124422,0.135000,12.696297>1.436500 translate<0,0.000000,0>}}
difference{
cylinder{<5.124422,0,16.156297><5.124422,0.036000,16.156297>1.563500 translate<0,0.000000,0>}
cylinder{<5.124422,-0.1,16.156297><5.124422,0.135000,16.156297>1.436500 translate<0,0.000000,0>}}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.244788,0.000000,19.933256>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.244788,0.000000,22.727256>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,90.000000,0> translate<20.244788,0.000000,22.727256> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.244788,0.000000,22.727256>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.514788,0.000000,22.727256>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.244788,0.000000,22.727256> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.514788,0.000000,22.727256>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.514788,0.000000,19.933256>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.514788,0.000000,19.933256> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.514788,0.000000,19.933256>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.244788,0.000000,19.933256>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.244788,0.000000,19.933256> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.613950,0.000000,26.183100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.613950,0.000000,23.389100>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,-90.000000,0> translate<34.613950,0.000000,23.389100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.613950,0.000000,23.389100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.343950,0.000000,23.389100>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.343950,0.000000,23.389100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.343950,0.000000,23.389100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.343950,0.000000,26.183100>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.343950,0.000000,26.183100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.343950,0.000000,26.183100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.613950,0.000000,26.183100>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.343950,0.000000,26.183100> }
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.875725,0.000000,10.063328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.081725,0.000000,10.063328>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.081725,0.000000,10.063328> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.081725,0.000000,10.063328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.081725,0.000000,11.333328>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<65.081725,0.000000,11.333328> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.081725,0.000000,11.333328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.875725,0.000000,11.333328>}
box{<0,0,-0.063500><2.794000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.081725,0.000000,11.333328> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.875725,0.000000,11.333328>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.875725,0.000000,10.063328>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<67.875725,0.000000,10.063328> }
//SDA/SCL silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.617869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.617869,0.000000,12.215222>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<43.617869,0.000000,12.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.117869,0.000000,22.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.117869,0.000000,22.215222>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<43.117869,0.000000,22.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.417869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,12.215222>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<42.417869,0.000000,12.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,14.015222>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<46.817869,0.000000,14.015222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,20.415222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,22.215222>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<46.817869,0.000000,22.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,22.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.417869,0.000000,22.215222>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<42.417869,0.000000,22.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.417869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.417869,0.000000,22.215222>}
box{<0,0,-0.127000><10.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<42.417869,0.000000,22.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,12.215222>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.817869,0.000000,12.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,12.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,14.015222>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<47.417869,0.000000,14.015222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,14.015222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,14.015222>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.817869,0.000000,14.015222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,14.015222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,20.415222>}
box{<0,0,-0.127000><6.400000,0.036000,0.127000> rotate<0,90.000000,0> translate<46.817869,0.000000,20.415222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,20.415222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,20.415222>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.817869,0.000000,20.415222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,20.415222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,22.215222>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<47.417869,0.000000,22.215222> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.417869,0.000000,22.215222>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.817869,0.000000,22.215222>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.817869,0.000000,22.215222> }
//TX/RX silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.830088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<67.830088,0.000000,12.192709>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<65.830088,0.000000,12.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<65.330088,0.000000,22.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<68.330088,0.000000,22.192709>}
box{<0,0,-0.127000><3.000000,0.036000,0.127000> rotate<0,0.000000,0> translate<65.330088,0.000000,22.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.630088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,12.192709>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.630088,0.000000,12.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,13.992709>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.030088,0.000000,13.992709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,20.392709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,22.192709>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.030088,0.000000,22.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,22.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.630088,0.000000,22.192709>}
box{<0,0,-0.127000><4.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<64.630088,0.000000,22.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.630088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.630088,0.000000,22.192709>}
box{<0,0,-0.127000><10.000000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.630088,0.000000,22.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,12.192709>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.030088,0.000000,12.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,12.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,13.992709>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.630088,0.000000,13.992709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,13.992709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,13.992709>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.030088,0.000000,13.992709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,13.992709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,20.392709>}
box{<0,0,-0.127000><6.400000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.030088,0.000000,20.392709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,20.392709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,20.392709>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.030088,0.000000,20.392709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,20.392709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,22.192709>}
box{<0,0,-0.127000><1.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<69.630088,0.000000,22.192709> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.630088,0.000000,22.192709>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<69.030088,0.000000,22.192709>}
box{<0,0,-0.127000><0.600000,0.036000,0.127000> rotate<0,0.000000,0> translate<69.030088,0.000000,22.192709> }
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.795000,0.000000,21.285000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.795000,0.000000,14.275000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.795000,0.000000,14.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.795000,0.000000,14.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.785000,0.000000,14.275000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.785000,0.000000,14.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.785000,0.000000,14.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.785000,0.000000,20.930000>}
box{<0,0,-0.076200><6.655000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.785000,0.000000,20.930000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.140000,0.000000,21.285000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.795000,0.000000,21.285000>}
box{<0,0,-0.076200><6.655000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.140000,0.000000,21.285000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.140000,0.000000,21.285000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.785000,0.000000,20.930000>}
box{<0,0,-0.076200><0.502046,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.785000,0.000000,20.930000> }
difference{
cylinder{<30.403800,0,21.666200><30.403800,0.036000,21.666200>0.508000 translate<0,0.000000,0>}
cylinder{<30.403800,-0.1,21.666200><30.403800,0.135000,21.666200>0.254000 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,20.580000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,19.780000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,18.980000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,18.180000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,17.380000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,16.580000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,15.780000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<30.238700,0.000000,14.980000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<31.490000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<32.290000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<33.090000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<33.890000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<34.690000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<35.490000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<36.290000,0.000000,13.728700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<37.090000,0.000000,13.728700>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,14.980000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,15.780000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,16.580000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,17.380000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,18.180000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,18.980000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,19.780000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-0.000000,0> translate<38.341300,0.000000,20.580000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<37.090000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<36.290000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<35.490000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<34.690000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<33.890000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<33.090000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<32.290000,0.000000,21.831300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-0.000000,0> translate<31.490000,0.000000,21.831300>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.396341,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.396341,0.000000,25.091675>}
box{<0,0,-0.099900><5.130800,0.036000,0.099900> rotate<0,90.000000,0> translate<3.396341,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.196541,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.196541,0.000000,25.091675>}
box{<0,0,-0.099900><5.130800,0.036000,0.099900> rotate<0,90.000000,0> translate<3.196541,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.996741,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.996741,0.000000,25.091675>}
box{<0,0,-0.099900><5.130800,0.036000,0.099900> rotate<0,90.000000,0> translate<2.996741,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.796941,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.796941,0.000000,25.091675>}
box{<0,0,-0.099900><5.130800,0.036000,0.099900> rotate<0,90.000000,0> translate<2.796941,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.597141,0.000000,20.107875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.597141,0.000000,24.944675>}
box{<0,0,-0.099900><4.836800,0.036000,0.099900> rotate<0,90.000000,0> translate<2.597141,0.000000,24.944675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.397341,0.000000,20.307675>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.397341,0.000000,24.744875>}
box{<0,0,-0.099900><4.437200,0.036000,0.099900> rotate<0,90.000000,0> translate<2.397341,0.000000,24.744875> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.455341,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.744141,0.000000,19.960875>}
box{<0,0,-0.099900><0.711200,0.036000,0.099900> rotate<0,0.000000,0> translate<2.744141,0.000000,19.960875> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.744141,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.286941,0.000000,20.418075>}
box{<0,0,-0.099900><0.646578,0.036000,0.099900> rotate<0,44.997030,0> translate<2.286941,0.000000,20.418075> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.286941,0.000000,20.418075>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.286941,0.000000,24.634475>}
box{<0,0,-0.099900><4.216400,0.036000,0.099900> rotate<0,90.000000,0> translate<2.286941,0.000000,24.634475> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.286941,0.000000,24.634475>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.744141,0.000000,25.091675>}
box{<0,0,-0.099900><0.646578,0.036000,0.099900> rotate<0,-44.997030,0> translate<2.286941,0.000000,24.634475> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<2.744141,0.000000,25.091675>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.455341,0.000000,25.091675>}
box{<0,0,-0.099900><0.711200,0.036000,0.099900> rotate<0,0.000000,0> translate<2.744141,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.455341,0.000000,25.091675>}
cylinder{<0,0,0><0,0.036000,0>0.099900 translate<3.455341,0.000000,19.960875>}
box{<0,0,-0.099900><5.130800,0.036000,0.099900> rotate<0,-90.000000,0> translate<3.455341,0.000000,19.960875> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.556941,0.000000,25.802875>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.551341,0.000000,25.803275>}
box{<0,0,-0.101600><5.994400,0.036000,0.101600> rotate<0,-0.003823,0> translate<3.556941,0.000000,25.802875> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.551341,0.000000,25.803275>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.551341,0.000000,19.249275>}
box{<0,0,-0.101600><6.554000,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.551341,0.000000,19.249275> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.551341,0.000000,19.249275>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.556941,0.000000,19.249675>}
box{<0,0,-0.101600><5.994400,0.036000,0.101600> rotate<0,0.003823,0> translate<3.556941,0.000000,19.249675> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.557341,0.000000,19.249275>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.557741,0.000000,25.803675>}
box{<0,0,-0.101600><6.554400,0.036000,0.101600> rotate<0,-89.990564,0> translate<3.557341,0.000000,19.249275> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455341,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.744141,0.000000,19.960875>}
box{<0,0,-0.101600><0.711200,0.036000,0.101600> rotate<0,0.000000,0> translate<2.744141,0.000000,19.960875> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.744141,0.000000,19.960875>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.286941,0.000000,20.418075>}
box{<0,0,-0.101600><0.646578,0.036000,0.101600> rotate<0,44.997030,0> translate<2.286941,0.000000,20.418075> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.286941,0.000000,20.418075>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.286941,0.000000,24.634475>}
box{<0,0,-0.101600><4.216400,0.036000,0.101600> rotate<0,90.000000,0> translate<2.286941,0.000000,24.634475> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.286941,0.000000,24.634475>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.744141,0.000000,25.091675>}
box{<0,0,-0.101600><0.646578,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.286941,0.000000,24.634475> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.744141,0.000000,25.091675>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455341,0.000000,25.091675>}
box{<0,0,-0.101600><0.711200,0.036000,0.101600> rotate<0,0.000000,0> translate<2.744141,0.000000,25.091675> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455341,0.000000,25.091675>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455341,0.000000,19.960875>}
box{<0,0,-0.101600><5.130800,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.455341,0.000000,19.960875> }
box{<-0.431800,0,-1.447800><0.431800,0.036000,1.447800> rotate<0,-90.000000,0> translate<11.100741,0.000000,20.240275>}
box{<-0.431800,0,-1.447800><0.431800,0.036000,1.447800> rotate<0,-90.000000,0> translate<11.100741,0.000000,24.812275>}
box{<-0.431800,0,-0.381000><0.431800,0.036000,0.381000> rotate<0,-90.000000,0> translate<10.033941,0.000000,22.526275>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.000000,0.000000,20.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.600000,0.000000,20.280000>}
box{<0,0,-0.063500><0.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.600000,0.000000,20.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.200000,0.000000,20.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.800000,0.000000,20.280000>}
box{<0,0,-0.063500><0.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.800000,0.000000,20.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.800000,0.000000,20.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.800000,0.000000,15.280000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.800000,0.000000,15.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.800000,0.000000,15.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.200000,0.000000,15.280000>}
box{<0,0,-0.063500><0.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.800000,0.000000,15.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.600000,0.000000,15.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.000000,0.000000,15.280000>}
box{<0,0,-0.063500><0.400000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.600000,0.000000,15.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.000000,0.000000,15.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.000000,0.000000,20.280000>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.000000,0.000000,20.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.416000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,18.034000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.384000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,17.526000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.384000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.384000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.416000,0.000000,17.526000>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.384000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.416000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.416000,0.000000,18.034000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<26.416000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,18.415000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.400000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,18.415000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,17.145000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.400000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,17.145000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,18.923000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.400000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,16.637000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.400000,0.000000,16.637000> }
box{<-0.635000,0,-1.016000><0.635000,0.036000,1.016000> rotate<0,-270.000000,0> translate<25.400000,0.000000,19.685000>}
box{<-0.635000,0,-1.016000><0.635000,0.036000,1.016000> rotate<0,-270.000000,0> translate<25.400000,0.000000,15.875000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MODULEDUINO(-41.745000,0,-17.775000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//A3/A2	GROVE-4P-2.0-3470130P1	4P-2.0
//BT_RESET	BUTTON-2P-REINFORCE-3100060P1	4P-SMD-7.0X3.5X3.5H-90D
//C6		AVX-B
//C7		AVX-B
//D1		LED0603
//D2/D3	GROVE-4P-2.0-3470130P1	4P-2.0
//D13		LED0603
//J1	CONNECTOR-HEADER-6P-3460650P1	1X6P-2.54-2.54-11.6-3.0-BLACK-MALE
//J2	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J3	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J4	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J5	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J6	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J7	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J8	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J9	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J10	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J11	SCREW-TERMINAL-3P-3470080P1	3P-5.0
//J12	SCREW-TERMINAL-2P-3470070P1	2P-3.5
//SDA/SCL	GROVE-4P-2.0-3470130P1	4P-2.0
//TX/RX	GROVE-4P-2.0-3470130P1	4P-2.0
//X1	CRYSTAL-0500290P1	2P-SMD-5.0X3.2
