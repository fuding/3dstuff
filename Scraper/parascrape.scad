//Parametric scraper / tape applicator / door stop / toy car jump / whatever.
//"height" is the distance from the thin edge to the thick edge.
//"length" runs along the thin edge (and thick) and defines how wide the scraper will be
//default is about business card sized
//size1 and size2 are the thin and thick parts

sizx=55;	//height 
sizy=90; //length along the scraper
sizz1=0.6;	//thickness of the thinnest part
sizz2=3;	//thickness of the thickest part
hz=sizz2+3;	//thickness of the handle
hx=10;		//other bit of the handle
handle=1;	//1=yes 0=no


if ( handle == 1 )
{
polyscrape();
translate([-sizx/2,0,hz/2])cube([10,sizy,hz],center=true);
}
else
{
polyscrape();
}

module polyscrape()
{
polyhedron(
  points=[ [sizx/2,sizy/2,0],[sizx/2,-sizy/2,0],[-sizx/2,-sizy/2,0],[-sizx/2,sizy/2,0],
			[sizx/2,sizy/2,sizz1],[sizx/2,-sizy/2,sizz1],[-sizx/2,-sizy/2,sizz2],[-sizx/2,sizy/2,sizz2]], 
      faces=[[0,3,2,1],//bottom
            [0,1,5,4],//small
            [1,2,6,5],//right
            [2,3,7,6],//big
            [0,4,7,3],//right 
            [4,5,6,7]]//top
 );
}