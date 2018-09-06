class TextBox
{
  String textBoxString;
  String[] textBoxStringArray;
  
  TextBox()
  {
    textBoxString = "";
    textBoxStringArray = new String[8];
    updateTextBox();
    
    for(int i = 0; i < 8; i++)
    {
      textBoxStringArray[i] = "";
    }
  }
  
  void drawTextBox()
  {
    fill(255);
    rect(45, height - 215, width - 90,  190);
    
    fill(0);
    textSize(15);
    text(textBoxString, 50, height - 200);
    //println(textBoxStringArray);
    
  }
  
  void updateTextBox()
  {
    textSize(15);
    
    textBoxString = "";
    
    for(int i = 0; i < 8; i++)
    {
      textBoxStringArray[i] = "";
    }
    
    // first row
    textBoxStringArray[0] += getRandomCharacter();
    
    while (textWidth(textBoxStringArray[0]) < width - 115)
    {
      textBoxStringArray[0] += "-";
      textBoxStringArray[0] += getRandomCharacter();
    }
    
    // 2-4 rows
    //textBoxStringArray[1] += '\n';
    
    for (int i = 1; i < textBoxStringArray.length - 1; i++)
    {
      textBoxStringArray[i] += getRandomCharacter();
      
      while (textWidth(textBoxStringArray[i]) < width - 115)
      {
        textBoxStringArray[i] += " ";
      }
      
      textBoxStringArray[i] += getRandomCharacter();
    }
    // final row
    
    textBoxStringArray[textBoxStringArray.length - 1] += getRandomCharacter();
    
    while (textWidth(textBoxStringArray[textBoxStringArray.length - 1]) < width - 115)
    {
      textBoxStringArray[textBoxStringArray.length - 1] += "-";
      textBoxStringArray[textBoxStringArray.length - 1] += getRandomCharacter();
    }
    
    // combine
    
    for (int i = 0; i < textBoxStringArray.length; i++)
    {
      textBoxString += textBoxStringArray[i];
      textBoxString += '\n';
    }
    
    //println(textBoxStringArray[7]);
  }
  
  char getRandomCharacter()
  {
    int randomNum = int(random(1, 56));
    
    switch(randomNum)
    {
      case 1:
        return 'A';
      case 2:
        return 'B';
      case 3:
        return 'C';
      case 4:
        return 'D';
      case 5:
        return 'E';
      case 6:
        return 'F';
      case 7:
        return 'G';
      case 8:
        return 'H';
      case 9:
        return 'I';
      case 10:
        return 'J';
      case 11:
        return 'K';
      case 12:
        return 'L';
      case 13:
        return 'M';
      case 14:
        return 'N';
      case 15:
        return 'O';
      case 16:
        return 'P';
      case 17:
        return 'Q';
      case 18:
        return 'R';
      case 19:
        return 'S';
      case 20:
        return 'T';
      case 21:
        return 'U';
      case 22:
        return 'V';
      case 23:
        return 'W';
      case 24:
        return 'X';
      case 25:
        return 'Y';
      case 26:
        return 'Z';
      case 27:
        return '1';
      case 28:
        return '2';
      case 29:
        return '3';
      case 30:
        return '4';
      case 31:
        return '5';
      case 32:
        return '6';
      case 33:
        return '7';
      case 34:
        return '8';
      case 35:
        return '9';
      case 36:
        return '0';
      case 37:
        return '!';
      case 38:
        return '@';
      case 39:
        return '#';
      case 40:
        return '$';
      case 41:
        return '%';
      case 42:
        return '^';
      case 43:
        return '&';
      case 44:
        return '*';
      case 45:
        return '(';
      case 46:
        return ')';
      case 47:
        return '[';
      case 48:
        return ']';
      case 49:
        return '{';
      case 50:
        return '}';
      case 51:
        return '|';
      case 52:
        return '\\';
      case 53:
        return '/';
      case 54:
        return '?';
      case 55:
        return '<';
      case 56:
        return '>';
    }
    
    return ' ';
  }
}
