// Chris Arme
// ASIM 1330 Project 1

Character player;

TextBox textBox;
boolean isTextBoxVisible;

void setup()
{
  fullScreen();
  //size(displayWidth, displayHeight);
  background(150);
  
  player = new Character();
  
  textBox = new TextBox();
  textBox.updateTextBox();
  
  isTextBoxVisible = true;
}

void draw()
{
  background(150);
  
  player.update();
  player.moveCharacter();
  player.draw();
  
  if (isTextBoxVisible)
  {
    textBox.drawTextBox();
  
    if(frameCount % 30 == 0)
    {
      textBox.updateTextBox();
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    if (isTextBoxVisible == false)
    {
      isTextBoxVisible = true;
    }
    else if (isTextBoxVisible == true)
    {
      isTextBoxVisible = false;
    }
  }
  
  if (key == 'w' || key == 's' || key == 'a' || key == 'd')
  {
    player.checkKeyPressed(key);
  }
}

void keyReleased()
{ 
  if (key == 'w' || key == 's' || key == 'a' || key == 'd')
  {
    player.checkKeyReleased(key);
  }
}
