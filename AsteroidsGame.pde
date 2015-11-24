//your variable declarations here
SpaceShip bob = new SpaceShip();
Asteroid [] asteroids;  
Star [] stars;
public void setup() 
{
  //your code here
  size(800,800);
  frameRate(60);
stars = new Star[300];
 for (int i =0; i<stars.length; i++){
  stars[i] = new Star();
    }
asteroids = new Asteroid[15];
 for (int i =0; i<asteroids.length; i++){
  asteroids[i] = new Asteroid();

    }

}
public void draw() 
{
  //your code here
    background(255);
  
    bob.show();
    bob.move();
  for(int i = 0; i < stars.length; i++){
    
    stars[i].show();
   
  }
  for(int i = 0; i < asteroids.length; i++){
    
    asteroids[i].show();
    asteroids[i].move();
    asteroids[i].rotate(asteroids[i].getRotation());
   
  }





}
 public void keyPressed(){
      if(key == 'w'){
          bob.accelerate(0.25);
      } 
       if (key == 'a') {
          bob.rotate(-10);
      } 
       if (key == 'd') {
        bob.rotate(10);
      } 
       if (key == ' ') {
        bob.hyperspace();
      }
      if (key == 's' ){
        bob.accelerate(-0.25);
      }


        
  }


class SpaceShip extends Floater  
{   
    //your code here
      


     public SpaceShip(){
      corners = 4;
      xCorners = new int [corners];
      yCorners = new int [corners];
        xCorners[0] = -15;
        yCorners[0] = -9;
        xCorners[1] = 10;
        yCorners[1] = 0;
        xCorners[2] = -15;
        yCorners[2] = 9;
        xCorners[3] = -9;
        yCorners[3] = 0;
      myColor = 0;
      myCenterX = 400.0;
      myCenterY = 400.0;
      myDirectionX = 0.0;
      myDirectionY = 0.0;
      myPointDirection = 0.0;
    }
    public void hyperspace(){
        bob.setX((int)(Math.random()*800));
        bob.setY((int)(Math.random()*800));
        bob.setDirectionX(0.0);
        bob.setDirectionY(0.0);
        bob.setPointDirection((int)(Math.random()*360));
    }


    public void setX(int x){myCenterX = x;}
    public int getX(){return  (int)(myCenterX);}
    public void setY(int y){myCenterY = y;}
    public int getY(){return  (int)(myCenterY);}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;} 
    public double getPointDirection(){return myPointDirection;}

}
 
class Star{
  private int x;
  private int y;
  private int size;

public Star(){
     x = (int)(Math.random()*800);
     y = (int)(Math.random()*800);
     size = ((int)(Math.random()*5)+1);
  }

  public void show(){
    fill(0);
    ellipse(x,y,size,size);


  }

}

class Asteroid extends Floater{

  private int rotation;
  private int pX, pY;
  public Asteroid(){
    rotation = (int)(Math.random()*6)-3;
    pX = (int)(Math.random()*6)-3;
    if(pX == 0){pX =1;}
    pY = (int)(Math.random()*6)-3;
    if(pY == 0){pY =1;}
      corners = 7;
      xCorners = new int[corners];
      yCorners = new int[corners];
          xCorners[0] = -11;
          yCorners[0] = -10;
          xCorners[1] = 7;
          yCorners[1] = -8;
          xCorners[2] = 9;
          yCorners[2] = 3;
          xCorners[3] = 6;
          yCorners[3] = 8;
          xCorners[4] = -6;
          yCorners[4] = 8;
          xCorners[5] = -5;
          yCorners[5] = 3;
          xCorners[6] = -8;
          xCorners[6] = 2;
      myColor = 0;
      myCenterX = (int)(Math.random()*800);
      myCenterY = (int)(Math.random()*800);
      myDirectionX = 0.0;
      myDirectionY = 0.0;
      myPointDirection = 0.0;



  }

  public void move(){
      myCenterX+= pX;
      myCenterY+= pY;
          if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }


  }

    public void setX(int x){myCenterX = x;}
    public int getX(){return  (int)(myCenterX);}
    public void setY(int y){myCenterY = y;}
    public int getY(){return  (int)(myCenterY);}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;} 
    public double getPointDirection(){return myPointDirection;}
    public void setRotation(int r){rotation = r;}
    public int getRotation(){return rotation;}


}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);

  }
    


} 

