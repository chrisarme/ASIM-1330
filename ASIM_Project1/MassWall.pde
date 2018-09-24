class MassWall
{
  float xPos;
  float yPos;
  float wallWidth;
  float wallHeight;
  int wallRepeatLength;
  int wallRepeatWidth;
  color wallColor;
  
  ArrayList<Wall> walls;
  
  MassWall(float startXPos, float startYPos, float wallWidths, float wallHeights, int wallRepW, int wallRepH, color wallC)
  {
    walls = new ArrayList<Wall>();
    
    xPos = startXPos;
    yPos = startYPos;
    wallWidth = wallWidths;
    wallHeight = wallHeights;
    wallRepeatLength = wallRepW;
    wallRepeatWidth = wallRepH;
    wallColor = wallC;
  }
  
  void wallSetup()
  {
    for (int i = 0; i < wallRepeatWidth; i++)
    {
      for (int j = 0; j < wallRepeatLength; j++)
      {
        walls.add(new Wall(xPos + (wallWidth * i), yPos + (wallHeight * j), wallWidth, wallHeight));
      }
    }
  }
  
  void massCollisionCheck()
  {
    for (int i = 0; i < walls.size(); i++)
    {
      walls.get(i).collisionWithCharacter();
    }
  }
  
  void draw()
  {
    fill(wallColor);
    strokeWeight(3);
    for (int i = 0; i < walls.size(); i++)
    {
      walls.get(i).draw();
    }
  }
}
