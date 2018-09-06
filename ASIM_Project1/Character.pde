class Character
{
  float charXPos;
  float charYPos;
  float charSpeed;
  float charWidth;
  float charHeight;
  boolean[] keysPressed;
  
  Character()
  {
    charXPos = 50;
    charYPos = 50;
    charSpeed = 5;
    charWidth = 50;
    charHeight = 50;
    
    // 0 = w, 1 = d, 2 = s, 3 = a
    keysPressed = new boolean[4];
    
    for (int i = 0; i < 4; i++)
    {
      keysPressed[i] = false;
    }
  }
  
  void update()
  {
    
  }
  
  void draw()
  {
    rect(charXPos, charYPos, charWidth, charHeight);
  }
  
  void checkKeyPressed(char key)
  {
    if (key == 'w')
    {
      keysPressed[0] = true;
    }
    else if (key == 'd')
    {
      keysPressed[1] = true;
    }
    else if (key == 's')
    {
      keysPressed[2] = true;
    }
    else if (key == 'a')
    {
      keysPressed[3] = true;
    }
  }
  
  void checkKeyReleased(char key)
  {
    if (key == 'w')
    {
      keysPressed[0] = false;
    }
    else if (key == 'd')
    {
      keysPressed[1] = false;
    }
    else if (key == 's')
    {
      keysPressed[2] = false;
    }
    else if (key == 'a')
    {
      keysPressed[3] = false;
    }
  }
  
  void moveCharacter()
  {
    // w
    if (keysPressed[0])
    {
      charYPos -= charSpeed;
    }
    
    // d
    if (keysPressed[1])
    {
      charXPos += charSpeed;
    }
    
    // s
    if (keysPressed[2])
    {
      charYPos += charSpeed;
    }
    
    // a
    if (keysPressed[3])
    {
      charXPos -= charSpeed;
    }
  }
  
}
