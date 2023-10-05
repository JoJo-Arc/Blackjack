class Card
{
  CardType suit;
  int value;
  color cardColor;
  float cardX,cardY;
  boolean grabbed;

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

    //Draw numbers and symbol
    textMode(CENTER);
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

  //void drawSymbol( CardType s )
  //{
  //  switch(s)
  //  {
  //  case HEART:
  //    image(d, 0, 0);
  //    break;
  //  case SPADE:
  //    image(sc, 0, 0);
  //    break;
  //  case DIAMOND:
  //    image(v, 0, 0);
  //    break;
  //  case CLUB:
  //    image(f, 0, 0);
  //    break;
  //  }
  //}
}

public enum CardType
{
  SPADE, CLUB, HEART, DIAMOND, JOKER
}
