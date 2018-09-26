class Character
{
  float charXPos;
  float charYPos;
  float charSpeed;
  float charWidth;
  float charHeight;
  float charColor;
  boolean[] keysPressed;
  boolean canOtherKeysBePressed;
  
  float sinNum;
  
  Character()
  {
    charXPos = 100;
    charYPos = 100;
    charSpeed = 5;
    charWidth = 50;
    charHeight = 50;
    charColor = 0;
    
    // 0 = w, 1 = d, 2 = s, 3 = a
    keysPressed = new boolean[4];
    
    for (int i = 0; i < 4; i++)
    {
      keysPressed[i] = false;
    }
    
    canOtherKeysBePressed = true;
  }
  
  void update()
  {
    
  }
  
  void draw()
  {
    fill(color(charColor));
    rect(charXPos, charYPos, charWidth, charHeight);
    
    charColor = 125 + (sin(sinNum) * 100);
    
    if (sinNum < TWO_PI)
    {
      sinNum += .01;
    }
    else
    {
      sinNum = 0;
    }
  }
  
  void checkKeyPressed(char key)
  {
    if (canOtherKeysBePressed == true)
    {
      if (key == 'w' || keyCode == UP)
      {
        keysPressed[0] = true;
      }
      else if (key == 'd' || keyCode == RIGHT)
      {
        keysPressed[1] = true;
      }
      else if (key == 's' || keyCode == DOWN)
      {
        keysPressed[2] = true;
      }
      else if (key == 'a' || keyCode == LEFT)
      {
        keysPressed[3] = true;
      }
    }
  }
  
  void checkKeyReleased(char key)
  {
    if (canOtherKeysBePressed == false)
    {
      canOtherKeysBePressed = true;
    }
    
    if (key == 'w' || keyCode == UP)
    {
      keysPressed[0] = false;
    }
    else if (key == 'd' || keyCode == RIGHT)
    {
      keysPressed[1] = false;
    }
    else if (key == 's' || keyCode == DOWN)
    {
      keysPressed[2] = false;
    }
    else if (key == 'a' || keyCode == LEFT)
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
