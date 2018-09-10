// Chris Arme
// ASIM 1330 Project 1

Character player;
ArrayList<MovableObject> puzzleObjects;
//ArrayList<ObjectGoal> puzzleGoals;

TextBox textBox;
boolean isTextBoxVisible;

void setup()
{
  fullScreen();
  //size(displayWidth, displayHeight);
  background(150);
  
  player = new Character();
  
  puzzleObjects = new ArrayList<MovableObject>();
  //puzzleGoals = new ArrayList<ObjectGoal>();
  
  for (int i = 0; i < 2; i++)
  {
    puzzleObjects.add(new MovableObject(200 * (i + 1), 200 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(255, 0, 0)));
    puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(0, 0, 255)));
    //puzzleGoals.add(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50, 50, color(0, 0, 255)));
  }
  
  textBox = new TextBox();
  textBox.updateTextBox();
  
  isTextBoxVisible = false;
}

void draw()
{
  background(150);
  
  player.update();
  player.moveCharacter();
   
  for (int i = 0; i < puzzleObjects.size(); i++)
  {
    puzzleObjects.get(i).objectGoal.draw();
  } 
   
  for(int i = 0; i < puzzleObjects.size(); i++)
  {
    if(!puzzleObjects.get(i).isGoalCompleted)
    {
      puzzleObjects.get(i).collisionWithCharacter();
      
      if (puzzleObjects.get(i).checkObject())
      {
        puzzleObjects.get(i).completeGoal();
        //puzzleGoals.remove(i);
      }
    }
    
    puzzleObjects.get(i).draw();
  }
   
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
