//White chips – $1.
//Red chips – $5.
//Green chips – $25.
//Black chips – $100.

class Player

{
  ArrayList<Card> hand = new ArrayList<Card>();
  String namePlayer;
  int chipWhite =0;
  int chipRed =0;
  int chipGreen =0;
  int chipBlack =0;
  
  int handValue()
  {
    int totalValue = 0;
    
    for( int i = 0; i < hand.size(); i++ )
      totalValue += hand.get(i).value();
      
    return totalValue;
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
