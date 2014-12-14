//Y-Belt tensioner for a Velleman K8200 / 3Drag 3D Printer
//Designed by: http://www.thingiverse.com/sampeople

//HOW TO PRINT
//Export each part individually (except the washers, both can be done together)
//to an stl file, by commenting out different portions at the end of this file. 
//
//Assemble them on the platter inside your favourite slicer program.
//Slice, print, enjoy (etc).
//

//
//=======================================================================================
//polyhole module by nophead: http://www.thingiverse.com/thing:6118
module polyhole(h, d) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n,center=true);
}
//End polyhole
//=======================================================================================
//Pulley Clearance
module pulley(d,h)
{
rotate([0,90,0])cylinder(d=d,h=h,center=true,$fn=30);
}
//End pulley
//=======================================================================================
//The Tensioner
module tensioner()
	{
		module bearing_mounts()
			{
				difference()
					{
						cube([2,22,15],center=true);
						translate([0,0,3])rotate([0,90,0])bore(d=5,h=60);
						translate([0,-14,5])rotate([60,0,0])cube([8,22,15],center=true);
						translate([0,12.5,7.5])rotate([-60,0,0])cube([8,22,15],center=true);
					}
			}
			
			difference()
				{
					union()
						{
							translate([-2,0,15])bearing_mounts();
							translate([-16.5,0,15])bearing_mounts();
							translate([11.5,-1,9])cube([12,6,2.5],center=true);
							translate([0,16.5,5])cube([35,55,6],center=true); //main bit
						} 
					translate([-18,11,0])rotate([0,0,30])cube([25,30,15]); //angled bit
					translate([-21,23.5,0])cube([25,30,15]); //top
					translate([11,40,6.5])bore(d=2.8,h=10); //tension screw
					translate([-9.25,0,19])pulley(d=26,h=11);
					translate([-9.25,12,8.2])rotate([-5,0,0])cube([8.2,20,15],center=true); //belt cutout
					translate([0,-10,0])rotate([-45,0,0])cube([50,20,15],center=true);
					translate([0,-17,15])cube([50,20,15],center=true);
					translate([-15,-1,6.5])rotate([0,90,0])bore(d=3.3,h=10);
					translate([15,-1,6.5])rotate([0,90,0])bore(d=3.3,h=10);
				}	
	}
//End Tensioner
//=======================================================================================
//Washers
module washers()
	{
		difference()
			{
				union()
					{
						translate([0,0,2.9])polyhole(d=16,h=3.1);
						polyhole(d=20,h=3);
					}
				bore(d=3.5,h=10);
			}
	}
//End Washers
//=======================================================================================
//The Base
module base()
	{
		module tens_mounts()
			{
					difference()
						{
							cube([5,11,8],center=true);
							translate([0,5,6])rotate([50,0,0])cube([7,11,11],center=true);
							translate([0,-2.5,0.5])rotate([0,90,0])bore(d=3.1,h=80);
						}
			}
		union()
			{
				difference()
					{
					cube([120,22,5],center=true); //main bit
					translate([0,0,2])cube([36.5,30,3],center=true);
					translate([-50.75,0,0])polyhole(d=4.5,h=10);
					translate([50.75,0,0])polyhole(d=4.5,h=10);
					}
				translate([20.75,1.5,5.6])tens_mounts();
				translate([-20.75,1.5,5.6])tens_mounts();
			}
	}



//End Base
//=======================================================================================
//Bore for cutting holes in stuff
module bore(d,h)
	{
		polyhole(h,d);
	}
//=======================================================================================

//pulley standin do not print this part. used only for design and included if
//position of pully needs to be adjusted later
//translate([-9.4,0,19])pulley(d=20,h=11); //creates a mock pulley to assist in positioning
//
//
//
//The Tensioner
tensioner(); 

//Washers
translate([-50.75,0,-9])washers();
translate([50.75,0,-9])washers();

//Main Base
base();
		
