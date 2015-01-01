$fn=32;

module uni(dia)
{
	translate([0,0,15])
	rotate([90,0,0])
	difference() //start this difference
	{
		union() //the guts
			{
				cylinder(d=7,h=15,center=true);
				rotate([90,0,0])translate([0,0,7.5])cylinder(d=15,h=15,center=true);
			}
	
		union() //side cutout #1
			{
				translate([-7,0,0])cube([7,10,15],center=true);
				translate([-7,-5,0])cylinder(d=7,h=15,center=true);
			}
		union() //side cutout #2
			{
				translate([7,0,0])cube([7,10,15],center=true);
				translate([7,-5,0])cylinder(d=7,h=15,center=true);
			}
	
		union() //middle cutout
			{
				resize([0,0,11])translate([0,-5,0])rotate([0,90,0])cylinder(d=7,h=20,center=true);
				translate([0,0,0])rotate([0,90,0])cube([11,10,20],center=true);
			}
	
		cylinder(d=3.2,h=20,center=true); // pivot point screw holes
		translate([0,-11.5,0])cylinder(d=3,h=20,center=true); // securing pin hole
		translate([0,-10,0])rotate([90,0,0])cylinder(d=dia,h=20,center=true); // motor/rod hole.
	} // end this difference 

}



module joiner()
{
	translate([0,0,3.5])
	difference()
	{
		cylinder(d=11,h=7,center=true);
		union()
			{
				rotate([0,90,0])cylinder(d=2.9,h=20,center=true); // joiner screw holes
				rotate([90,0,0])cylinder(d=2.9,h=20,center=true); // joiner screw holes
			}
	
		difference()
			{
				sphere(d=22);
				sphere(d=12);
			}
	}
}


//Call the uni joint module with a hole size diameter in millimetres.
//Typical Nema17 motor is 5mm. Adjustment may be necessary for individual printers.
//M8 can either be printed under sized and tapped, and a nut used to secure 
//or printed actual size and a mounting pin used.

uni(dia=5); //nema17
translate([40,0,0])uni(dia=7.6); //M8 threaded rod

//the bit that goes in the middle to join everything
translate([20,0,0])joiner();