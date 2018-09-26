// Chris Arme
// ASIM 1330 Project 1

Character player;
ArrayList<MovableObject> puzzleObjects;
//ArrayLis t<ObjectGoal> puzzleGoals;

ArrayList<MassWall> wallArray;

//MassWall wallArray;
//MassWall testBlock;

TextBox textBox;

// 0 = start, 99 = credits, 1 = lvl 1, 2 = lvl 2, etc...
int lvlScreen;

boolean[] lvlSetupComplete = new boolean[3];

void setup()
{
  fullScreen();
  //size(displayWidth, displayHeight);
  //background(150);
  
  lvlScreen = 0;
    
  for (int i = 0; i < lvlSetupComplete.length; i++)
  {
    lvlSetupComplete[i] = false;
  }
}

void draw()
{
  switch (lvlScreen)
  {
    case 0:
    
    mainMenuDraw();
    break;
    
    case 1:
      if (lvlSetupComplete[0] == false)
      {
        testLvlSetup();
        lvlSetupComplete[0] = true;
      }
      
      currentLvlDraw();
    break;
    
    case 2: 
      if (lvlSetupComplete[1] == false)
      {
        testLvlSetup();
        lvlSetupComplete[1] = true;
      }
      
      currentLvlDraw();
    break;
  }
}

void mainMenuSetup()
{
  background(100, 0, 0);
  
  
}

void mainMenuDraw()
{
  background(50, 0, 0);
  
  textSize(100);
  text("Digital Beginnings", (width / 2) - (textWidth("Digital Beginnings") / 2), 200);
}

void testLvlSetup()
{
  player = new Character();
  
  puzzleObjects = new ArrayList<MovableObject>();
  //puzzleGoals = new ArrayList<ObjectGoal>();
  
  wallArray = new ArrayList<MassWall>();
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  
  wallArray.add(new MassWall(800, 500, 200, 200, 2, 2, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  for (int i = 0; i < 2; i++)
  {
    puzzleObjects.add(new MovableObject(200 * (i + 1), 200 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(255, 0, 0)));
    puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(0, 0, 255)));
    //puzzleGoals.add(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50, 50, color(0, 0, 255)));
  }
  
  String[] testString = new String[2];
  testString[0] = ("This is a test text string");
  testString[1] = ("#$%^&*()@#$%^&*()_@#$%^&*()");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl1Setup()
{
  player = new Character();
  
  puzzleObjects = new ArrayList<MovableObject>();
  //puzzleGoals = new ArrayList<ObjectGoal>();
  
  wallArray = new ArrayList<MassWall>();
  
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  for (int i = 0; i < 2; i++)
  {
    puzzleObjects.add(new MovableObject(200 * (i + 1), 200 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(255, 0, 0)));
    puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50 * (i + 1), 50 * (i + 1), color(0, 0, 255)));
    //puzzleGoals.add(new ObjectGoal(300 * (i + 1), 300 * (i + 1), 50, 50, color(0, 0, 255)));
  }
  
  String[] testString = new String[2];
  testString[0] = ("This is a test text string");
  testString[1] = ("#$%^&*()@#$%^&*()_@#$%^&*()");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void currentLvlDraw()
{
  background(150);
    
    player.update();
    player.moveCharacter();
     
   for (int i = 0; i < wallArray.size(); i++)
   {
     //wallArray.get(i).massCollisionCheck();
   }
     
    for (int i = 0; i < puzzleObjects.size(); i++)
    {
      puzzleObjects.get(i).objectGoal.draw();
    } 
     
    for(int i = 0; i < puzzleObjects.size(); i++)
    {
      if(!puzzleObjects.get(i).isGoalCompleted)
      {
        puzzleObjects.get(i).collisionWithCharacter();
        puzzleObjects.get(i).collisionWithWalls();
        
        if (puzzleObjects.get(i).checkObject())
        {
          puzzleObjects.get(i).completeGoal();
          //puzzleGoals.remove(i);
        }
      }
      
      puzzleObjects.get(i).draw();
    }
     
     player.draw();
     
   for (int i = 0; i < wallArray.size(); i++)
   {
     wallArray.get(i).draw();
   }
     
     textBox.mainControl();
}

void keyPressed()
{
  switch (lvlScreen)
  {
    case 0:
      switch(key)
      {
        case '0':
          lvlScreen = 99;
          break;
        
        case '1':
          lvlScreen = 1;
          break;
      }
      break;
    case 99:
    
      break;
    default:
    if (key == ' ')
    {
      textBox.checkKeyPressed();
    }
    
    if (key == 'w' || key == 's' || key == 'a' || key == 'd')
    {
      player.checkKeyPressed(key);
    }
    
    break;
  }
}

void keyReleased()
{ 
  switch (lvlScreen)
  {
    case 0:
    break;
    default:
      if (key == 'w' || key == 's' || key == 'a' || key == 'd')
      {
        player.checkKeyReleased(key);
      }
      break;
  }
}
