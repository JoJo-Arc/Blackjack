
class Deck
{
  ArrayList<Card> card = new ArrayList<Card>();



  public Deck()
  {
    
  }
  
  public void fill52CardDeck()
  {

    for(int i = 1; i <= 13; i = i+1)
    {
       card.add( new Card (CardType.SPADE, i ) );
       card.add( new Card (CardType.CLUB, i ) );
       card.add( new Card (CardType.HEART, i ) );
       card.add( new Card (CardType.DIAMOND, i) );
    }
  }
  
  public Card pullCard()
  {
    //deal with exhaustion
    if( card.size() == 0 )
      return null;
    
    Card drawnCard = card.get(card.size()-1);
    card.remove( card.size()-1 );
    return drawnCard;
  }

}
