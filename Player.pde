//Brown chips – $1.
//Red chips – $5.
//Green chips – $25.
//Black chips – $100.

class Player
{
  ArrayList<Card> hand = new ArrayList<Card>();
  String namePlayer;
  int chipBrown =0;
  int chipRed =0;
  int chipGreen =0;
  int chipBlack =5;

  int handValue()
  {
    int totalValue = 0;

    for ( int i = 0; i < hand.size(); i++ )
      totalValue += hand.get(i).value();

    return totalValue;
  }
  
  //The chips value 
  public int chipsAsCash()
  {
    int result = 0;
    result += chipBrown * 1;
    result += chipRed * 5;
    result += chipGreen * 25;
    result += chipBlack * 100;

    return result;
  }

//how betting works
  public void bet(int bet)
  {
    if( bet >= 100 )
    {
      chipBlack -= bet/100;
      bet = bet % 100;
    }
    if( bet >= 25 )
    {
      chipGreen -= bet/25;
      bet = bet % 25;
    }    
    if( bet >= 5 )
    {
      chipRed -= bet/5;
      bet = bet % 5;
    } 
    if( bet >= 1 )
    {
      chipBrown -= bet/1;
      bet = bet % 1;
    } 

  }

}

/*
size(400, 400);
 textSize(128);
 text("word", 40, 120);
 fill(0, 408, 612);
 text("word", 40, 240);
 fill(0, 408, 612, 204);
 text("word", 40, 360);
 */
