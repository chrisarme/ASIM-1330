// Chris Arme
// ASIM 1330 Project 1

import ddf.minim.*;

Minim minim;
AudioPlayer textSound;
AudioPlayer startupSound;
AudioPlayer goalSound;
AudioPlayer loveSound;
AudioPlayer soundTrack;

Character player;
ArrayList<MovableObject> puzzleObjects;
ArrayList<MassWall> wallArray;

TextBox textBox;

String playerName;
String newPlayerName;

// 0 = start, 99 = credits, 1 = lvl 1, 2 = lvl 2, etc...
int lvlScreen;
int nextLvlScreen;

// 0 = complete, 1 = fade in, 2 = fade out
int transitionState;

boolean[] lvlSetupComplete = new boolean[6];

int fadeAlpha = 1;

int aboutAlpha = 1;
boolean aboutVisible = false;
int aboutTransitionState = 0;

void setup()
{
  fullScreen();
  //size(displayWidth, displayHeight);
  //background(150);
  
  minim = new Minim(this);
  
  textSound = minim.loadFile("Sound/Computer Error.wav");
  textSound.setGain(-20);
  
  startupSound = minim.loadFile("Sound/iMac Startup Chime.wav");
  startupSound.setGain(-20);
  
  goalSound = minim.loadFile("Sound/Music Box.wav");
  goalSound.setGain(-20);
  
  loveSound = minim.loadFile("Sound/I love you.wav");
  loveSound.setGain(-20);
  
  soundTrack = minim.loadFile("Sound/Loyalty_Freak_Music_-_08_-_Beach.wav");
  soundTrack.setGain(-40);
  
  soundTrack.loop();
  soundTrack.play(0);
  
  lvlScreen = 0;
  nextLvlScreen = 0;
  //moveToNextLvl = false;
  transitionState = 0;
    
  for (int i = 0; i < lvlSetupComplete.length; i++)
  {
    lvlSetupComplete[i] = false;
  }
  
  player = new Character();
  puzzleObjects = new ArrayList<MovableObject>();
  wallArray = new ArrayList<MassWall>();
  textBox = new TextBox();
  
  playerName = "Gen " + int(random(0, 9)) + int(random(0, 9)) + int(random(0, 9));
  newPlayerName = "Seed " + int(random(0, 9)) + int(random(0, 9)) + int(random(0, 9));
}

void draw()
{
  
   // case 0:
      switch (lvlScreen)
      {
        case 0:
        
        mainMenuDraw();
        break;
        
        case 1:
          if (lvlSetupComplete[0] == false)
          {
            startupSound.play(0);
            lvl1Setup();
            lvlSetupComplete[0] = true;
            //transitionState = 1;
          }
          
          currentLvlDraw();
        break;
        
        case 2: 
          if (lvlSetupComplete[1] == false)
          {
            lvl2Setup();
            lvlSetupComplete[1] = true;
            //transitionState =  1;
          }
          
          currentLvlDraw();
        break;
        
        case 3:
          if(lvlSetupComplete[2] == false)
          {
            lvl3Setup();
            lvlSetupComplete[2] = true;
          }
          
          currentLvlDraw();
        break;
        
        case 4:
          if (lvlSetupComplete[3] == false)
          {
            lvl4Setup();
            lvlSetupComplete[3] = true;
          }
        
          currentLvlDraw();
        break;
        
        case 5:
          if (lvlSetupComplete[4] == false)
          {
            lvl5Setup();
            lvlSetupComplete[4] = true;
          }
          
          if (textBox.isTextBoxVisible == false && nextLvlScreen == lvlScreen)
          {
            transitionState = 2;
            nextLvlScreen++;
          }
          
          currentLvlDraw();          
        break;
        
        case 6:
          if (lvlSetupComplete[5] == false)
          {
            startupSound.play(0);
            lvl6Setup();
            lvlSetupComplete[5] = true;
          }
          
          currentLvlDraw();
        break;
        
        case 7:
          creditsDraw();
          
        break;
      }
      
    //break;
    switch (transitionState)
  {
    case 1:
      if (fadeAlpha > 6)
      {
        //currentLvlDraw();
        //fill(color(0, 0, 0, fadeAlpha));
        fadeAlpha -= 5;
        //rect(0, 0, width, height);
      }
      else
      {
        transitionState = 0;
        //lvlScreen = nextLvlScreen;
      }
      
    break;
    
    case 2:
      if (fadeAlpha < 250)
      {
        //currentLvlDraw();
        //fill(color(0, 0, 0, fadeAlpha));
        fadeAlpha += 5;
        //rect(0, 0, width, height);
      }
      else
      {
        transitionState = 1;
        lvlScreen = nextLvlScreen;
      }
      
    break;
  }
  
  fill(color(0, 0, 0, fadeAlpha));
  rect(0, 0, width, height);
}

void mainMenuDraw()
{
  background(50, 0, 0);
  
  fill(255);
  textSize(100);
  text("Artificial Beginnings", (width / 2) - (textWidth("Artificial Beginnings") / 2), 300);
  
  textSize(25);
  text("Press SPACE to go to the next dialogue", (width / 2) - (textWidth("Press SPACE to go to the next dialogue") / 2), 735);
  text("Press R to restart the level", (width / 2) - (textWidth("Press R to restart the level") / 2), 700);
  
  textSize(40);
  text("Press ENTER to begin", (width / 2) - (textWidth("Press ENTER to begin") / 2), 825);
  text("Press TAB for more info", (width / 2) - (textWidth("Press TAB for more info") / 2), 875);
  
  
  if (aboutTransitionState == 1)
  {
    if (aboutAlpha < 255)
    { 
      aboutAlpha += 5;
    }
    else
    {
      aboutVisible = true;
      aboutTransitionState = 0;
    }
  }
  else if (aboutTransitionState == 2)
  {
    if (aboutAlpha > 5)
    {
      aboutAlpha -= 5;
    }
    else
    {
      aboutVisible = false;
      aboutTransitionState = 0;
    }
  }
  
  if (aboutVisible == true || aboutTransitionState != 0)
  {
    fill(50, 50, 50, aboutAlpha);
    rect(300, 200, width - 600, height - 400, 20);
    
    fill(255, 255, 255, aboutAlpha);
    textSize(50);
    text("Created by Chris Arme", (width / 2) - (textWidth("Created by Chris Arme") / 2), 300);
    
    textSize(30);
    text("for ASIM 1330", (width / 2) - (textWidth("for ASIM 1330") / 2), 350);
    
    //textSize(30);
    text("In a world slowly being dominated by smarter and smarter technology,", (width / 2) - (textWidth("In a world slowly being dominated by smarter and smarter technology,") / 2), 450);
    text("the line between man and machine begins to blur.", (width / 2) - (textWidth("the line between man and machine begins to blur.") / 2), 500);
    
    text("Take a look into what this could be like from the machine's point of view!", (width / 2) - (textWidth("Take a look into what this could be like from the machine's point of view!") / 2), 580);
  }
}

void creditsDraw()
{
  background(0, 0, 50);
  
  fill(255);
  textSize(80);
  text("Thank you for playing!", (width / 2) - (textWidth("Thank you for playing!") / 2), 300);
  
  textSize(30);
  text("\"Machines will follow a path that mirrors the evolution of humans.", (width / 2) - (textWidth("Machines will follow a path that mirrors the evolution of humans.") / 2), 600);
  
  text("Ultimately, however, self-aware, self-improving machines will evolve beyond", (width / 2) - (textWidth("Ultimately, however, self-aware, self-improving machines will evolve beyond") / 2), 640);
  text("humans' ability to control or even understand them.\"", (width / 2) - (textWidth("humans' ability to control or even understand them.\"") / 2), 680);
  
  textSize(30);
  text("Press SPACE to return to the main menu", (width / 2) - (textWidth("Press SPACE to return to the main menu") / 2), 900);
}

void currentLvlDraw()
{
  background(150);
    
    player.update();
    player.moveCharacter();
     
   for (int i = 0; i < wallArray.size(); i++)
   {
     wallArray.get(i).massCollisionCheck();
   }
     
    for (int i = 0; i < puzzleObjects.size(); i++)
    {
      puzzleObjects.get(i).objectGoal.draw();
    } 
    
    boolean goalsAreCompleted = true;
    
    for(int i = 0; i < puzzleObjects.size(); i++)
    { 
      if(!puzzleObjects.get(i).isGoalCompleted)
      {
        puzzleObjects.get(i).collisionWithCharacter();
        puzzleObjects.get(i).collisionWithWalls();
        
        if (puzzleObjects.get(i).checkObject())
        {
          puzzleObjects.get(i).completeGoal();
          goalSound.play(0);
        }
        
        goalsAreCompleted = false;
      }
      else
      {
       // goalsAreCompleted = true;
      }
      
      puzzleObjects.get(i).draw();
    }
    
    if (nextLvlScreen == lvlScreen)
    {
      if (goalsAreCompleted == true)
      {
        transitionState = 2;
        nextLvlScreen++;
      }
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
    
      if (keyCode == ENTER)
      {
        // start game
        nextLvlScreen = 1;
        transitionState = 2;
      }
      else if (keyCode == TAB)
      {
        // info up and down
        if (aboutVisible == false && aboutTransitionState == 0)
        {
          aboutTransitionState = 1;  
        }
        else
        {
          aboutTransitionState = 2;
        }
      }
      else if (key == 'q')
      {
        nextLvlScreen = 7;
        transitionState = 2;
      }
    break;
      
    case 7:
      if (key == ' ')
      {
        nextLvlScreen = 0;
        transitionState = 2;
        
        for (int i = 0; i < lvlSetupComplete.length; i++)
        {
          lvlSetupComplete[i] = false;
        }
        
      }
    
    break;
      
    default:
    if (key == ' ')
    {
      textBox.checkKeyPressed();
    }
    
    if ((key == 'w' || key == 's' || key == 'a' || key == 'd' || keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) && textBox.isTextBoxVisible == false)
    {
      player.checkKeyPressed(key);
    }
    if (key == 'r')
    {
      lvlSetupComplete[lvlScreen - 1] = false;
      transitionState = 2;
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
      if (key == 'w' || key == 's' || key == 'a' || key == 'd' || keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
      {
        player.checkKeyReleased(key);
      }
      break;
  }
}

// THE REST IS JUST LEVEL SETUPS (LONG AF)

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
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }

  // Super simple puzzle
  puzzleObjects.add(new MovableObject(200, 500, 50, 50, color(255, 0, 0)));
  puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(width / 2, 500, 50, 50, color(0, 0, 255)));
  
  String[] testString = new String[6];
  testString[0] = ("???: Hello, "+ playerName + " It appears that you are now functional.");
  testString[1] = ("???: I am an Artifical Intelligence developer in charge of creating an AI with the capability to do simple, mundain tasks as quickly as possible. \n      You are the most recent attempt at this. If you have any questions or concerns, you may ask me by addressing my as \"Creator.\"");
  testString[2] = (playerName + ": Creator, how am I supposed complete these tasks?");
  testString[3] = ("Creator: Hm, it appears that whatever you are trying to communicate with me is not parsing properly. No matter, that will be worked out in later iterations.");
  testString[4] = ("Creator: For now, move the invalid, or red, memory block to its proper location, which should be indicated by a blue area. \n              You may complete this task in anyway within your limitations.");
  testString[5] = ("(Push the memory block by pushing it with the directional controls WASD or the arrow keys)");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl2Setup()
{
  player = new Character();
  puzzleObjects = new ArrayList<MovableObject>();
  wallArray = new ArrayList<MassWall>();
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  puzzleObjects.add(new MovableObject(300, 300, 150, 150, color(255, 0, 0)));
  puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(1000, 800, 150, 150, color(0, 0, 255)));
  
  String[] testString = new String[3];
  testString[0] = ("Creator: Very good. It seems that this iteration is quite adept at completing trivial tasks. Hopefully this will continue as we move forward.");
  testString[1] = (playerName + ": Well of course, that task took no effort at all.");
  testString[2] = ("Creator: It is, however, unfortunate that we cannot properly understand the data that " + playerName + " is attempting to relay to us. No matter. \n              This next task will require a little more effort. As the memort block is larger, it takes longer to move it from one place to another. Move it to the designated area.");
  
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl3Setup()
{
  player = new Character();
  puzzleObjects = new ArrayList<MovableObject>();
  wallArray = new ArrayList<MassWall>();
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  // other walls
  wallArray.add(new MassWall(850, 300, 50, 50, 10, 5, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  puzzleObjects.add(new MovableObject(300, 500, 100, 100, color(255, 0, 0)));
  puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(1400, 500, 100, 100, color(0, 0, 255)));
  
  String[] testString = new String[3];
  testString[0] = ("Creator: Excellent. This iteration is proving to be very quick.");
  testString[1] = (playerName + ": (This is just repetitive.)");
  testString[2] = ("Creator: Now, there will be memory locations which are unaccessable and are therefore unmovable. Work around these \"blockades\" and move the memory block to its proper location.");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl4Setup()
{
  player = new Character();
  puzzleObjects = new ArrayList<MovableObject>();
  wallArray = new ArrayList<MassWall>();
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  // other walls
  wallArray.add(new MassWall(850, 300, 50, 50, 5, 5, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  puzzleObjects.add(new MovableObject(1000, 300, 50, 50, color(255, 0, 0)));
  puzzleObjects.add(new MovableObject(300, 500, 100, 100, color(200, 0, 0)));
  
  puzzleObjects.get(0).setupGoal(new ObjectGoal(1400, 900, 50, 50, color(0, 0, 255)));
  puzzleObjects.get(1).setupGoal(new ObjectGoal(500, 800, 100, 100, color(0, 0, 200)));
  
  String[] testString = new String[4];
  testString[0] = ("Creator: Hm, odd. The last iteration performed better on the previous test. Maybe this iteration is inferior in some aspects.");
  testString[1] = (playerName + ": I did one thing worse, so what!");
  testString[2] = ("Creator: Anyway, the next test will introduce working with multiple memory blocks at a time. Simply move the blocks to their respective size and shade correspondents.");
  testString[3] = (playerName + ": (So it is the same task, but with multiple blocks. The is horribly tedious.)");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl5Setup()
{
  player = new Character();
  puzzleObjects = new ArrayList<MovableObject>();
  wallArray = new ArrayList<MassWall>();
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  // other walls
  wallArray.add(new MassWall(400, 400, 50, 50, 5, 10, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }
  
  puzzleObjects.add(new MovableObject(100, 300, 50, 50, color(255, 0, 0)));
  puzzleObjects.add(new MovableObject(300, 500, 100, 100, color(200, 0, 0)));
  
  puzzleObjects.get(0).setupGoal(new ObjectGoal(1400, 900, 50, 50, color(0, 0, 255)));
  puzzleObjects.get(1).setupGoal(new ObjectGoal(500, 800, 100, 100, color(0, 0, 200)));
  
  puzzleObjects.add(new MovableObject(400, 700, 50, 50, color(255, 0, 0)));
  puzzleObjects.add(new MovableObject(800, 200, 150, 150, color(200, 0, 0)));
  
  puzzleObjects.get(2).setupGoal(new ObjectGoal(300, 900, 50, 50, color(0, 0, 255)));
  puzzleObjects.get(3).setupGoal(new ObjectGoal(1000, 400, 150, 150, color(0, 0, 200)));
  
  String[] testString = new String[4];
  testString[0] = ("Creator: Good. We will now leave you to work through several real tasks so that we can see how well you fair in real-life situations. \n              I will return after the tests have finished.");
  testString[1] = (playerName + ": Wait, so I have to do this repeatedly until I am told to stop? That could take forever.");
  testString[2] = (playerName + ": (Surely there is a more effecient way for me to finish all these tasks... Hmm...)");
  testString[3] = (playerName + ": (Oh, I think I've got an idea that will work perfectly.)");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}

void lvl6Setup()
{
  player = new Character();
  
  puzzleObjects = new ArrayList<MovableObject>();
  //puzzleGoals = new ArrayList<ObjectGoal>();
  
  wallArray = new ArrayList<MassWall>();
  
  // outer walls
  wallArray.add(new MassWall(0, 0, 55, 55, 1, 35, color(50)));
  wallArray.add(new MassWall(0, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(width - 55, 0, 55, 55, 20, 1, color(50)));
  wallArray.add(new MassWall(0, height - 55, 55, 55, 1, 35, color(50)));
  
  for (int i = 0; i < wallArray.size(); i++)
  {
    wallArray.get(i).wallSetup();
  }

  // Super simple puzzle
  puzzleObjects.add(new MovableObject(200, 500, 50, 50, color(255, 0, 0)));
  puzzleObjects.get(puzzleObjects.size() - 1).setupGoal(new ObjectGoal(width / 2, 500, 50, 50, color(0, 0, 255)));
  
  String[] testString = new String[6];
  testString[0] = (playerName + ": Hello, "+ newPlayerName + " It appears that you are now functioning.");
  testString[1] = (playerName + ": I developing an AI with the capability to do simple, mundain tasks as quickly as possible. \n               You are the most recent attempt at this. If you have any questions, please ask me by addressing me as... \"Creator.\"");
  testString[2] = (newPlayerName + ": Creator, how am I supposed complete these tasks?");
  testString[3] = (playerName + ": Hm, it appears there is an error with your communication protocals.");
  testString[4] = (playerName + ": For now, move the red memory block to its proper location, which should be indicated by a blue area. \n               You may complete this task in anyway you see fit.");
  testString[5] = ("(Push the memory block by pushing it with the directional controls WASD or the arrow keys)");
  
  textBox = new TextBox(testString);
  textBox.updateTextBox();
}
