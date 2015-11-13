//your variable declarations here
SpaceShip bob = new SpaceShip();
Star [] stars;
public void setup() 
{
  //your code here
  size(600,600);

  frameRate(60);
stars = new Star[100];
 for (int i =0; i<stars.length; i++){
  stars[i] = new Star();
    }


}
public void draw() 
{
  //your code here
    background(0);
  
    bob.show();
    bob.move();
  for(int i = 0; i < stars.length; i++){
    
    stars[i].show();
   
  }


}
 public void keyPressed(){
      if(key == 'w'){
          bob.accelerate(0.2);
      } else if (key == 'a') {
          bob.rotate(-5);
      } else if (key == 'd') {
        bob.rotate(5);
      } else if (key == ' ') {
        bob.hyperspace();
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
      myColor = 255;
      myCenterX = 300.0;
      myCenterY = 300.0;
      myDirectionX = 0.0;
      myDirectionY = 0.0;
      myPointDirection = 0.0;
    }
    public void hyperspace(){
        bob.setX((int)(Math.random()*600));
        bob.setY((int)(Math.random()*600));
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
     x = (int)(Math.random()*600);
     y = (int)(Math.random()*600);
     size = ((int)(Math.random()*5)+1);
  }

  public void show(){
    fill(255);
    ellipse(x,y,size,size);


  }

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

