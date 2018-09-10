class MovableObject
{
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  color objColor;
  
  boolean isGoalCompleted = false;
  
  ObjectGoal objectGoal;
  
  MovableObject()
  {
    xPos = 300;
    yPos = 300;
    objWidth = 50;
    objHeight = 50;
    objColor = color(255, 0, 0);
    
    objectGoal = new ObjectGoal();
  }
  
  MovableObject(float objXPos, float objYPos, float w, float h, color objColor)
  {
    xPos = objXPos;
    yPos = objYPos;
    objWidth = w;
    objHeight = h;
    this.objColor = objColor;
  }
  
  void setupGoal(ObjectGoal goal)
  {
    objectGoal = goal;
  }
  
  void draw()
  {
    //fill(objectGoal.goalColor);
    //objectGoal.draw();
    
    if (isGoalCompleted == false)
    {
      fill(objColor);
      rect(xPos, yPos, objWidth, objHeight);
    }
  }
  
  void completeGoal()
  {
    isGoalCompleted = true;
    objectGoal.completedGoal();
  }
  
  void collisionWithCharacter()
  {
    //top of obj check > bottom check > left check > right check
    if ((player.charYPos + player.charHeight >= yPos && player.charYPos <= yPos && player.keysPressed[2]) && (player.charXPos <= xPos + player.charWidth && player.charXPos >= xPos - player.charWidth))
    {
      yPos += 5;
      player.charYPos = yPos - player.charHeight;
    }
    else if ((player.charYPos <= yPos + objHeight && player.charYPos >= yPos && player.keysPressed[0]) && (player.charXPos <= xPos + player.charWidth && player.charXPos >= xPos - player.charWidth))
    {
      yPos -= 5;
      player.charYPos = yPos + objHeight;
    }
    else if ((player.charXPos + player.charWidth >= xPos && player.charXPos <= xPos && player.keysPressed[1]) && (player.charYPos <= yPos + player.charHeight && player.charYPos >= yPos - player.charHeight))
    {
      xPos += 5;
      player.charXPos = xPos - player.charWidth;
    }
    else if ((player.charXPos <= xPos + objWidth && player.charXPos >= xPos && player.keysPressed[3]) && (player.charYPos <= yPos + player.charHeight && player.charYPos >= yPos - player.charHeight))
    {
      xPos -= 5;
      player.charXPos = xPos + objWidth;
    }
  }
  
  boolean checkObject()
  {
    return objectGoal.checkObject(this); 
  }
}
