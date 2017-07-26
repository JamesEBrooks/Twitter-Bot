/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 */
import de.bezier.data.sql.*;
Flock flock;
int TempR=0;
int TempG=0;
int TempB=0;
//int x=1;

boolean showvalues = true;
boolean scrollbar = false;

float swt = 25.0;     //sep.mult(25.0f);
float awt = 4.0;      //ali.mult(4.0f);
float cwt = 5.0;      //coh.mult(5.0f);
float maxspeed = 1;
float maxforce = 0.025;



//////////////////////////////////////////////////////////////
int level=0;
int xx,yy;
//////////////////////////////////////////////////////////////////

class Pixel {
  void Pixel(){
  Red=int(randomGaussian() * 255);
  Green=255;
  Blue=int(randomGaussian() * 255);
  Alpha=0;
}
 
 int Red;
 int Green;
 int Blue;
 int Alpha;
}

Pixel Pix = new Pixel();
Pixel[][] Screen_Input = new Pixel[8][8];
int[][] HR_ScreenVal = new int[80][80];

SQLite db;

void setup() {
  size(400, 400);
  background(50);
   setupScrollbars();
  flock = new Flock();
   for (int i = 0; i < 40; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
  
  
  //////////////////////////
   db = new SQLite( this, "MintIceCream2.db" );  // open database file
 
    if ( db.connect() )
    {
     
        // list table names
        db.query( "SELECT * FROM LIGHTSCREEN_SWATCH" );
 // int ss=db.length();
        while (db.next())
        {
            println( "ABness: "+db.getString("ABness") );
            println( "CurveVa: "+db.getString("CurveVal") );
            println( "Position: "+db.getString("Position") );
            println( "Red: "+db.getString("Red") );
            println( "Green: "+db.getString("Green") );
            println( "Blue: "+db.getString("Blue") );
           // println( "Time: "+db.getTimestamp(this));
            //println( "Connection: "+db.getConnection());
            
        }
 
        // read all in table "table_one"
        db.query( "SELECT * FROM LIGHTSCREEN_SWATCH" );
 
        while (db.next())
        {
          //  println( db.getInt("Size") );
        }
    }
  
  
  /////////////////////////////////////////////
for(int x=0; x<8; x++)
        {
            for(int y=0; y<8; y++)
            {
Screen_Input[x][y]=new Pixel();

}
        }
        

//////////////////////
}

void draw() { 

     for(int x=0;x<80;x++)
   {
     for(int y=0;y<80;y++)
   {
      HR_ScreenVal[x][y]=0;
  }} 
       
    flock.run();
  
   level=0;
   
 
  for(int ax=0; ax<8; ax++)
        {
            for(int ay=0; ay<8; ay++)
            {
              
               xx=ax*10;
               yy=ay*10;
               level=0;
               
                 for(int bx=xx;bx<(xx+10);bx++)
   {
     for(int by=yy;by<(yy+10);by++)
   {
     level=level+(int(HR_ScreenVal[bx][by]/100));

     }
   }
   
                Screen_Input[ax][ay].Red=level;
                Screen_Input[ax][ay].Green=level/4;
                Screen_Input[ax][ay].Blue=level/4;
                Screen_Input[ax][ay].Alpha=level;
   

                TempR=Screen_Input [ay][ax].Red;
                TempG=Screen_Input [ay][ax].Green;
                TempB=Screen_Input [ay][ax].Blue;


 color pix = color (TempR,TempG,TempB);
 noStroke();
  fill(pix, 255);
  rect((ax*47)+14,(ay*47)+13,44,44);

    
              

            }
        }
         
  drawScrollbars();
        
        
        ////////////////////////////////////////////////////////////


  
// save("output.png");
  //exit();
 
 // fill(pix, 128);
  //ellipse(x, y, pointillize, pointillize);
}