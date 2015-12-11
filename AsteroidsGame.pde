//your variable declarations here




SpaceShip bob = new SpaceShip();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <smallAsteroid> smallAsteroids = new ArrayList <smallAsteroid>();
int bX;
int bY;
Star [] stars;
public void setup() 
{
  //your code here
  size(600,600);
  frameRate(60);
stars = new Star[300];
 for (int i =0; i<stars.length; i++){
  stars[i] = new Star();
    }

 for (int i =0; i<6; i++){
  asteroids.add(i, new Asteroid());

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

  checkIfCollisionBullet();



  checkIfCollisionShip();

    
  

 for(int i = 0; i < bullets.size(); i++){
    bullets.get(i).move();
    bullets.get(i).show();


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
public void mouseClicked(){
  bullets.add(new Bullet(bob));


}


class SpaceShip extends Floater  
{   
    //your code here
      private int lives;


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
      lives =3;
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
    public void setLives(int x){lives = x;}
    public int getLives(){return lives;}

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
    fill(253);
    ellipse(x,y,size,size);


  }

}

class Asteroid extends Floater{

  private int rotation;
  private double pX, pY;
  public Asteroid(){
    rotation = (int)(Math.random()*4)-2;
    pX = (double)(Math.random()*2)-1;
    if(pX == 0){pX =0.5;}
    pY = (double)(Math.random()*2)-1;
    if(pY == 0){pY =0.5;}
 corners = 6;

xCorners = new int[corners];

yCorners = new int[corners];

xCorners[0] = -46;

yCorners[0] = -24;

xCorners[1] = 32;

yCorners[1] = -27;

xCorners[2] = 27;

yCorners[2] = 34;

xCorners[3] = 23;

yCorners[3] = 52;

xCorners[4] = -29;

yCorners[4] = 41;

xCorners[5] = -27;

yCorners[5] = 39;
      myColor = 254;
      myCenterX = (int)(Math.random()*600);
      myCenterY = (int)(Math.random()*600);
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

  public void rotate() {
    myPointDirection++;
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

class smallAsteroid extends Asteroid{
  private int rotation;
  private double pX, pY;


   public smallAsteroid(){
    rotation = (int)(Math.random()*4)-2;
    pX = (double)(Math.random()*2)-1;
    if(pX == 0){pX =0.5;}
    pY = (double)(Math.random()*2)-1;
    if(pY == 0){pY =0.5;}
 corners = 6;

xCorners = new int[corners];

yCorners = new int[corners];

xCorners[0] = -16;

yCorners[0] = -14;

xCorners[1] = 12;

yCorners[1] = -17;

xCorners[2] = 21;

yCorners[2] = 24;

xCorners[3] = 13;

yCorners[3] = 32;

xCorners[4] = -23;

yCorners[4] = 24;

xCorners[5] = -20;

yCorners[5] = 12;
      myColor = 254;
      myCenterX = (int)(Math.random()*600);
      myCenterY = (int)(Math.random()*600);
      myDirectionX = 0.0;
      myDirectionY = 0.0;
      myPointDirection = 0.0;



  }






}


class Bullet extends Floater{
  public Bullet(SpaceShip bob){
    myCenterX = bob.getX();
    myCenterY = bob.getY();
    myPointDirection = bob.getPointDirection();
    myDirectionX = 5*Math.cos(myPointDirection*(Math.PI/180)) + bob.getDirectionX();
    myDirectionY = 5*Math.sin(myPointDirection*(Math.PI/180)) + bob.getDirectionY();
  }


  public void show(){
    fill(255,0,0);
    stroke(255,0,0);
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  } 


    public void move ()   {      
         
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

     
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

public void checkIfCollisionShip(){
for (int i = 0; i < asteroids.size(); i++){
if (dist(asteroids.get(i).getX(), asteroids.get(i).getY(), bob.getX(), bob.getY())<60){
        asteroids.remove(i);
      } else {
      asteroids.get(i).show();
      asteroids.get(i).move();
      asteroids.get(i).rotate();
      bob.setLives(bob.getLives()-1);
      smallAsteroids.add(new smallAsteroid());
 




  }

 }
}
public void checkIfCollisionBullet(){
  for (int i = 0; i < asteroids.size(); i++){
    for (int j = 0; j < bullets.size(); j++ ){
      if(dist(asteroids.get(i).getX(), asteroids.get(i).getY(), bullets.get(j).getX(), bullets.get(j).getY())<60){
          asteroids.remove(i);
          bullets.remove(j);


      } 
    }
  }


}
/*public void checkIfDead(){
  if (bob.getLives() = 0){

  }
}

}*/ 



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

