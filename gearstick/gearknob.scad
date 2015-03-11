//include openscad file to render the threads
include <threads.scad>
//provided by Dan Kirshner - dan_kirshner@yahoo.com

//Gear stick knob by me, github.com/ntoff

//variables
//dia = main sphere diameter
//h_wid = H pattern cutout individual parts width
//h_len = H pattern overall length
//h_hi = H pattern cutout height
//h_dep = H pattern, how deep is the cutout
//h_tran = fine tuning for how deep the cutout is
//t_cut = fine tuning for how much of the sphere gets cut off
//collar_h = how high the extra collar on the bottom is
//collar_d = diameter of collar
//collar_hole = size of the HOLE in the collar, this is NOT the size of the hole with the THREADS in it.

dia=45;
h_wid=1;
h_len=12;
h_hi=8;
h_dep=1;
h_tran=(h_len/2)-(h_wid/2);
t_cut=dia-4;
collar_h=12; //to start the threads immediately, set this to 0
collar_d=20;
collar_hole=14;

//threads scad variables
th_dia=10;
th_pit=1.25;
th_len=25;

_smooth = 64; //bigger the number, the smoother the sphere.


module collar(){
	difference(){
		translate([0,0,-collar_h])cylinder(d=collar_d,h=15+collar_h);
		translate([0,0,-collar_h-0.1])cylinder(d=collar_hole,h=collar_h);
	}	
}

module knobtop()
{
	union()
		{
		translate([0,0,dia/2])sphere(d=dia,$fn=_smooth);
		collar();
		}
}

module H(){
    translate([-h_tran,h_hi-1,0])linear_extrude(h_dep+0.1)text("1", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    translate([-h_tran,-h_hi+1,0])linear_extrude(h_dep+0.1)text("2", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    translate([0,h_hi-1,0])linear_extrude(h_dep+0.1)text("3", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    translate([0,-h_hi+1,0])linear_extrude(h_dep+0.1)text("4", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    translate([h_tran,h_hi-1,0])linear_extrude(h_dep+0.1)text("5", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    translate([h_tran,-h_hi+1,0])linear_extrude(h_dep+0.1)text("R", halign = "center", valign = "center", size= 5, font = "Bitsumishi");
    union(){
        translate([-h_tran,0,0])cube([h_wid,h_hi,(h_dep+0.1)],center=true);
        translate([0,0,0])cube([h_wid,h_hi,(h_dep+0.1)],center=true); //middle vertical
        translate([h_tran,0,0])cube([h_wid,h_hi,(h_dep+0.1)],center=true);
        translate([0,0,0])cube([h_len,h_wid,(h_dep+0.1)],center=true); //longitudinal
    }
}

module gearknob(){
    difference()
        {
            knobtop();
            translate([-dia/2,-dia/2,t_cut])cube([dia,dia,10]);
            translate([0,0,t_cut-(h_dep/2)])H();
            translate([0,0,-collar_h-.7])metric_thread(th_dia, th_pit, th_len+collar_h, internal=true);
        }
}

//rotate([180,0,0])
gearknob();
