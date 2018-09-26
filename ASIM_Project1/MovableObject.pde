class MovableObject
{
  float xPos;
  float yPos;
  float objWidth;
  float objHeight;
  color objColor;
  
  boolean isGoalCompleted = false;
  
  boolean movable = true;
  
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
    if (movable == true)
    {
      //top of obj check > bottom check > left check > right check
      if ((player.charYPos + player.charHeight > yPos && player.charYPos < yPos && player.keysPressed[2]) && (player.charXPos < xPos + objWidth && player.charXPos > xPos - player.charWidth))
      {
        yPos += 5;
        player.charYPos = yPos - player.charHeight;
        player.canOtherKeysBePressed = false;
      }
      else if ((player.charYPos < yPos + objHeight && player.charYPos > yPos && player.keysPressed[0]) && (player.charXPos < xPos + objWidth && player.charXPos > xPos - player.charWidth))
      {
        yPos -= 5;
        player.charYPos = yPos + objHeight;
        player.canOtherKeysBePressed = false;
      }
      else if ((player.charXPos + player.charWidth > xPos && player.charXPos < xPos && player.keysPressed[1]) && (player.charYPos < yPos + objHeight && player.charYPos > yPos - player.charHeight))
      {
        xPos += 5;
        player.charXPos = xPos - player.charWidth;
        player.canOtherKeysBePressed = false;
      }
      else if ((player.charXPos < xPos + objWidth && player.charXPos > xPos && player.keysPressed[3]) && (player.charYPos < yPos + objHeight && player.charYPos > yPos - player.charHeight))
      {
        xPos -= 5;
        player.charXPos = xPos + objWidth;
        player.canOtherKeysBePressed = false;
    }
    }
  }
  
  void collisionWithWalls()
  {
    for (MassWall walls : wallArray)
    {
      for (Wall wall : walls.walls)
      {
        if ((wall.yPos + wall.wallHeight > yPos && wall.yPos < yPos + objHeight && player.keysPressed[2]) && (wall.xPos < xPos + objWidth && wall.xPos > xPos - wall.wallWidth))
        {
          //yPos = 160;
          yPos = wall.yPos - objHeight;
          //wall.canOtherKeysBePressed = false;
          movable = false;
          println("test");
        }
        else if ((wall.yPos < yPos + wall.wallHeight && wall.yPos + wall.wallHeight > yPos && player.keysPressed[0]) && (wall.xPos < xPos + objWidth && wall.xPos > xPos - wall.wallWidth))
        {
          //yPos -= 5;
          yPos = wall.yPos + wall.wallHeight;
          //wall.canOtherKeysBePressed = false;
          movable = false;
          println("test");
        }
        else if ((wall.xPos + wall.wallWidth > xPos && wall.xPos < xPos + objWidth && player.keysPressed[1]) && (wall.yPos < yPos + objHeight && wall.yPos > yPos - wall.wallHeight))
        {
          //xPos += 5;
          xPos = wall.xPos - objWidth;
          //wall.canOtherKeysBePressed = false;
          movable = false;
        }
        else if ((wall.xPos < xPos + objWidth && wall.xPos > xPos && player.keysPressed[3]) && (wall.yPos < yPos + objHeight && wall.yPos > yPos - wall.wallHeight))
        {
          //xPos -= 5;
          //player.xPos = xPos + objWidth;
          //player.canOtherKeysBePressed = false;
          movable = false;
        }
        else
        {
          movable = true;
        }
      }
    }
  }
  
  /*boolean collisionWithOtherObject(MovableObject object)
  {
    //top of obj check > bottom check > left check > right check
    if ((object.yPos + object.objHeight > yPos && object.yPos < yPos && player.keysPressed[2]) && (object.xPos < xPos + objWidth && object.xPos > xPos - object.objWidth))
    {
      player.charYPos = object.yPos - player.charHeight;
      println("test");
      return true;
    }
    else if ((object.yPos < yPos + objHeight && object.yPos > yPos && player.keysPressed[0]) && (object.xPos < xPos + objWidth && object.xPos > xPos - object.objWidth))
    {
      player.charYPos = object.yPos + object.objHeight;
      println("test");
      return true;
    }
    else if ((object.xPos + object.objWidth > xPos && object.xPos < xPos && player.keysPressed[1]) && (object.yPos < yPos + objHeight && object.yPos > yPos - object.objHeight))
    {
      player.charXPos = xPos - player.charWidth;
      println("test");
      return true;
    }
    else if ((object.xPos < xPos + objWidth && object.xPos > xPos && player.keysPressed[3]) && (object.yPos < yPos + objHeight && object.yPos > yPos - object.objHeight))
    {
      player.charXPos = object.xPos + object.objWidth;
      println("test");
      return true;
    }
    
    return false;
  }*/
  
  boolean checkObject()
  {
    return objectGoal.checkObject(this); 
  }
}
