// list Dealer Wins out of 10:1,3,4, player won :2,5,6,7,8,9,10

//New Prog

//images 
PImage spade;
PImage club;
PImage diamond;
PImage heart;
PImage cardBack;
PImage greenFelt;

Deck deck = new Deck();
Player steve = new Player();
Player dealer = new Player();

boolean busted;
boolean stayed;
boolean handOver;

import processing.sound.*;

SoundFile cardEffect;

void setup()
{
  size(1200, 1000);
  
  //background
    
  //background(greenFelt);
      imageMode(CENTER);
      
  //Suit Pictures
  spade = loadImage("spade.png");    
  spade.resize(200, 0);
  club = loadImage("club.png");   
  club.resize(200, 0);
  diamond = loadImage("diamond.png");   
  diamond.resize(200, 0);
  heart = loadImage("heart.png"); 
  heart.resize(200, 0);
  greenFelt = loadImage("feltGreen.jpg");   
  greenFelt.resize(1200,1000);

  
  //Deck Pictures
  cardBack =loadImage("cardBack.jpg");


  deck.fill52CardDeck();
  print(deck.card);
  //background(#05F532);
  
  fill(0,0,0,0);
rect(890, 540, 220, 320);

//the card image 
  cardBack.resize(200,0);
  
  //sound
  cardEffect = new SoundFile(this, "CardSoundEffect.wav");
  
}
void draw()
{
  image(greenFelt,600,500);
  //background(#05F532);
  //Draw pile
  rectMode(CENTER);
  textAlign(CENTER);

  strokeWeight(5);
  stroke(50);
  fill(0);
  for( int i = 0; i < deck.card.size()/2; i++)
  {
    stroke(50+20*(i%2));
    rect(width-200-i, height-300-i, 210, 290, 10);
  }
  textSize(50);
  fill(0);
  
  if (steve.handValue() > 21)
  {
    boolean noAces = true;
    for(int i =0; i < steve.hand.size() && noAces; i++)
    {
      if( steve.hand.get(i).value() == 11 )
      {
        steve.hand.get(i).reduced = true;
        noAces = false;
      }
    }
    //println(noAces);
    if( noAces )
    {
      busted = true;
      text ("aww you kinda suck NGL", 400,400);
    }
  }

  for (int i = 0; i < steve.hand.size(); i++)
    steve.hand.get(i).drawCard(100+200*i,150);    

  fill(0);

  text( deck.card.size(), width-200, 900);
  image(cardBack,width-200-deck.card.size()/2, height-300-deck.card.size()/2);

  //Stay Button
  rectMode(CORNER);
  rect(150, 450 ,75, 50);
  
  //Dealer drawing cards
  if( stayed )
  {
    while( dealer.handValue() <= 17 )
    {
      dealCardTo(dealer);
      println(dealer.handValue());
    }
    handOver = true;
  }
  
  if( handOver )
  {
    textSize(25);
    text( "PLAYER: "+ steve.handValue(), 100, 390 );
    text( "DEALER: "+ dealer.handValue(), 100, 440);
    
  }
}

boolean dealCardTo(Player p)  //make this deal to p instead of steve
{
  if ( deck.card.size() == 0)
    return false;
  //int randX = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
  int rand = (int)random(deck.card.size()); //random card rando(decksize)  //X = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
  p.hand.add( new Card( deck.card.get(rand) ) );
  deck.card.remove(rand);

  return true;
}

void mousePressed()
{
  println(mouseX+" "+mouseY);


  if ( mouseX > width-300
    && mouseX < width-100
    && mouseY > height-450
    && mouseY < height - 150
    && deck.card.size() > 0
    && !busted )
  {

    dealCardTo( steve );
  cardEffect.play();
  }
  if( mouseX > 150
    && mouseX < 225
    && mouseY > 450
    && mouseY < 500
    //&& deck.card.size() > 0
    && !busted )
    {
      stayed = true;
    }
  println( steve.hand );
  
  if(stayed == true)
    println(steve.handValue());
}

void keyPressed()
{
    if(key == 'w')
    text( "you stayed with:", 500,450);
  if(key == 'w')
    println(steve.handValue());
  if (key == 'a')
    println(deck.card);
  if (key == 'b')
    println(steve.hand);
  //if(key == 'r')
    
}
