 //declare bacteria variables here 
 
int posX = mouseX;
int posY = mouseY;



 Bacteria [] colony;  
 void setup()   
 {     
 	//initialize bacteria variables here   
 	
 	size(400,400);
 	colony = new Bacteria[50];
 for (int i =0; i<colony.length; i++){
 	colony[i] = new Bacteria(200,200);
 		}
 	frameRate(60);
 }   
 void draw()   
 {    
 	//move and show the bacteria  
 	background(0);
 	for(int i = 0; i < colony.length; i++){
 		
 		colony[i].show();
 		colony[i].walk();
 		
 		
		
 	}

}
 	
 
 


 class Bacteria    
 {     
 	//lots of java!   
 	int myX, myY, myColor, life;
 		Bacteria(int x, int y){
 			life = 0;
 			myX = x; 
 			myY = y;
 			myColor = (int)(Math.random()*255);
 		
 		}

 	void walk(){
 		if(Math.random()<0.5)
 		{
 			myX += 1;
 		} else {
 			myX -= 1;
 		}
 		if(Math.random()<0.5){
 		myY += 1;
 		} else {
 		myY -= 1;
 		}

 	}

 	void show(){
 		life+=(int)(Math.random()*50);
 		if(life<(int)(Math.random()*500)+100000){
 			fill(myColor,100,100);
 			ellipse(myX,myY,10,10);
 		} 
 	}


 
 }



  
