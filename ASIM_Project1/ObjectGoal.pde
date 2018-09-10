class ObjectGoal
{
  float xPos;
  float yPos;
  float goalWidth;
  float goalHeight;
  color goalColor;
  
  ObjectGoal()
  {
    xPos = 500;
    yPos = 500;
    goalWidth = 50;
    goalHeight = 50;
    goalColor = color(0, 0, 255);
  }
  
  ObjectGoal(float goalXPos, float goalYPos, float gWidth, float gHeight, color gColor)
  {
    xPos = goalXPos;
    yPos = goalYPos;
    goalWidth= gWidth;
    goalHeight = gHeight;
    goalColor = gColor;
  }
  
  void draw()
  {
    fill(goalColor);
    rect(xPos, yPos, goalWidth, goalHeight);
  }
  
  void completedGoal()
  {
    goalColor = color(0, 255, 0);
  }
  
  boolean checkObject(MovableObject matchedObject)
  {
    // biggest check in the world to see if it is approx at the same position
     // X check
    if ((matchedObject.xPos >= xPos - 15) && (matchedObject.xPos + matchedObject.objWidth <= xPos + goalWidth + 15))
    {
      // Y check
      if ((matchedObject.yPos >= yPos - 15) && (matchedObject.yPos + matchedObject.objHeight <= yPos + goalHeight + 15))
      {
        return true;
      }
    }
    
    return false;
  }
}
