class Wall
{
  float xPos;
  float yPos;
  float wallWidth;
  float wallHeight;
  //color wallColor;
  
  Wall()
  {
    
  }
  
  Wall(float wallXPos, float wallYPos, float wallW, float wallH)
  {
    xPos = wallXPos;
    yPos = wallYPos;
    wallWidth = wallW;
    wallHeight = wallH;
  }
  
  void draw()
  {
    rect(xPos, yPos, wallWidth, wallHeight);
  }
  
  // I don't want to do this check...
  void collisionWithCharacter()
  {
    if (player.charXPos < xPos + wallWidth && player.charXPos > xPos && player.keysPressed[3])
    {
      if (player.charYPos < yPos + wallHeight && player.charYPos  + player.charHeight > yPos)
      {
        player.charXPos = xPos + wallWidth;
      }
    }
    
    if (player.charXPos + player.charWidth > xPos && player.charXPos < xPos && player.keysPressed[1])
    {
      if (player.charYPos < yPos + wallHeight && player.charYPos > yPos - player.charHeight)
      {
        player.charXPos = xPos - player.charWidth;
      }
    }
    
    if (player.charYPos < yPos + wallHeight && player.charYPos > yPos && player.keysPressed[0])
    { 
      if (player.charXPos < xPos + wallWidth && player.charXPos > xPos - player.charWidth)
      {
        player.charYPos = yPos + wallHeight;
      }
    }
    
    if (player.charYPos + player.charHeight > yPos && player.charYPos < yPos && player.keysPressed[2])
    {
      if (player.charXPos < xPos + wallHeight && player.charXPos > xPos - player.charWidth)
      {
        player.charYPos = yPos - player.charHeight;
      }
    }
    
    /*if (player.charYPos <= yPos + wallHeight && player.charYPos >= yPos)
    {
      if (player.charXPos <= xPos + wallWidth && player.charXPos + player.charWidth >= xPos)
      {
        player.charYPos = yPos + wallHeight;
      }
    }*/
    
    
  }
  
}
