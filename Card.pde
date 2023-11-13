class Card
{
  CardType suit;
  int value;
  color cardColor;
  float cardX,cardY;
  boolean grabbed;
  boolean worth11;
  
  boolean reduced; //for aces that have become worth 1

  public Card( CardType s, int v )
  {
    suit = s;
    value = v;
    cardColor = color(0);
  }

  //overloaded constructor
  public Card( int s, int v )
  {
    if     (s == 0) suit = CardType.HEART;
    else if (s == 1) suit = CardType.DIAMOND;
    else if (s == 2) suit = CardType.SPADE;
    else if (s == 3) suit = CardType.CLUB;
    value = v;
    cardColor = color(0);
  }

  public Card( Card c )
  {
    suit = c.suit;
    value = c.value;
    cardColor = c.cardColor;
  }

  public void drawCard( int x, int y )
  {
    //Draw card
    rectMode(CENTER);
    stroke(cardColor);
    strokeWeight(10);
    fill(255);
    rect(x, y, 200, 300, 10);
    drawSymbol( suit, x, y );

    //Draw numbers and symbol
    textAlign(CENTER);
    imageMode(CENTER);
    textSize(30);
    push();
    translate(x, y);
    //drawSymbol( suit );
    fill(cardColor);
    text(valueToChar(value), -80, -110);
    rotate(PI);
    text(valueToChar(value), -80, -110);
    pop();
  }
  
  int value()
  {
    if( value > 10 )
      return 10;
    if( value == 1 && !reduced )//&& steve.handValue() <= 10 )
      return 11;
    //else if( value == 1 && steve.handValue() >= 10)
    //  return 1;
    return value;
  }

  public String toString()
  {
    return valueToString(value) + " of " + typeToString(suit) + " " + min(10,value);
  }

  public String typeToString( CardType t )
  {
    switch(t)
    {
    case SPADE:
      return "Spades";
    case HEART:
      return "Hearts";
    case CLUB:
      return "Clubs";
    default:
      return "Diamonds";
    }
  }

  public String valueToString( int v )
  {
    switch(v)
    {
    case 1:
      return "Ace";
    case 11:
      return "Jack";
    case 12:
      return "Queen";
    case 13:
      return "King";
    case 0:
      return "Joker";
    default:
      return ""+v;
      //could also write out numbers:
      //case 1: return "One";
      //case 2: return "Two";
      //etc.
    }
  }

  public String valueToChar( int v )
  {
    switch(v)
    {
    case 10:
      return "10";
    case 11:
      return "J";
    case 12:
      return "Q";
    case 13:
      return "K";
    case 1:
      return "A";
    case 0:
      return "X"; //Joker
    default:
      return ""+(char)(v+48);
      
      
    }
  }

  void drawSymbol( CardType s, float x, float y)
  {
    switch(s)
    {
    case HEART:
      image(heart, x, y);
      break;
    case SPADE:
      image(spade, x, y);
      break;
    case DIAMOND:
      image(diamond, x, y);
      break;
    case CLUB:
      image(club, x, y);
      break;
    }
  }
}
//
//

public enum CardType
{
  SPADE, CLUB, HEART, DIAMOND, JOKER
}
