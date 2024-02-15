class Tendril
{
  public final static int SEG_LENGTH = 1; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y)
  {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }
  public void show()
  {
    if(myNumSegments >= 50)
      stroke(255, 0, 0);
    else if(myNumSegments >= 10)
      stroke(0, 255, 0);
    else
      stroke(0, 0, 255);
    float startX = myX;
    float startY = myY;
    float endX = 0;
    float endY = 0;
    for(int i = 0; i < myNumSegments; i++){
      myAngle += (double)(Math.random()*0.4)-0.2;  
      endX = startX + 3*cos((float)myAngle*SEG_LENGTH);
      endY = startY + 3*sin((float)myAngle*SEG_LENGTH);
      line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
    }
    
    if(myNumSegments >= 3){
      Cluster c = new Cluster(myNumSegments/5, (int)endX, (int)endY);
    }
  }
}
