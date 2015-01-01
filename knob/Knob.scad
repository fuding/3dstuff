//General Knob
//Hole is threadless, designed for later tapping using an appropriate sized thread tap.
//Threads can also be created in 3d and "cut out" in place of the screw hole and then printed directly into the knob if one so desires.
//
//
shaftdia=24; //diameter of the shaft
shafth=12; //height of the shaft
balldia=42; //diameter of the main ball
$fn=25; //how smooth the ball and shaft are. Bigger number = smoother appearance. Too large and it will take ages to compile.
holedia=7.5; //how big the hole in the shaft is. This should be adjusted to either suit a rod or other object to be inserted and glued, resized to suit tapping, or replaced with an imported or generated thread pattern for direct thread printing.
stl="example.stl"; //import an STL file of a screw or bolt thread pattern to be printed directly into the knob.

//Note: Path to STL must be in this format "C:\\folder here\\another folder\\stlfile.stl" if not in the same directory as the .scad file. You must use double backslash.

//Knobby stuff
module knob_shaft()
{
	union()
		{
			translate([0,0,shafth*2])sphere(d=balldia);
			cylinder(d=shaftdia,h=shafth);
		}
}

//Hole for screwing
difference()
	{
		knob_shaft();
		translate([0,0,-0.1])cylinder(d=holedia,h=balldia/2+shafth); //comment out this line if you wish to import a thread mesh below.
		//translate([0,0,0])import (stl); //uncomment this line to use an imported thread mesh. may need to be translated depending on how long it is or the orientation it was in when exported.
	}