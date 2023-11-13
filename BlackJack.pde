//New Prog

PImage spade;
PImage club;
PImage diamond;
PImage heart;

Deck deck = new Deck();
Player steve = new Player();
Player dealer = new Player();

boolean busted;

void setup()
{
  size(1200, 1000);
  //Suit Pictures
  spade = loadImage("spade.png");    
  spade.resize(200, 0);
  club = loadImage("club.png");   
  club.resize(200, 0);
  diamond = loadImage("diamond.png");   
  diamond.resize(200, 0);
  heart = loadImage("heart.png"); 
  heart.resize(200, 0);
  
  //textSize(25);
  //text(steve.hand.value,400,400);
  //  size(400, 400);

  //text( steve.whiteChip ,180, 40);
  //size(800,800);

  deck.fill52CardDeck();
  print(deck.card);
  
  
}
void draw()
{

  //Draw pile
  rectMode(CENTER);
  textAlign(CENTER);

  strokeWeight(10);
  fill(255);
  rect(width-200, height-300, 200, 300, 10);
  textSize(50);
  fill(0);
  
  if (steve.handValue() > 21)
  {
    boolean noAces = true;
    for(int i =0; i < steve.hand.size() && noAces; i++)
    {
      if( steve.hand.get(i).value == 11 )
      {
        steve.hand.get(i).reduced = true;
        noAces = false;
      }
    }
    println(noAces);
    if( noAces )
    {
      busted = true;
      text ("aww you kinda suck NGL", 400,400);
    }
  }

  for (int i = 0; i < steve.hand.size(); i++)
    steve.hand.get(i).drawCard(100+200*i,150);    

  //circle(50+100*i,50,50);

  fill(0);
  //textSize(100);
  text( deck.card.size(), width-200, height-300);
  //text( steve.handValue(),700,600);
  text( steve.handValue(), width-200, height-200);
  
  //image( heart, 100, 100);
  //image( diamond, 200, 100);
  //image( club, 300, 100);
  //image( spade, 400, 100);
}

//int bust()
//{
//  //if (steve.handValue() > 21)
//  //  text ("aww you kinda suck NGL", 200,200);
    
  
//}



boolean dealCardTo(Player p)  //make this deal to p instead of steve
{
  if ( deck.card.size() == 0)
    return false;
  //int randX = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
  int rand = (int)random(deck.card.size()); //random card rando(decksize)  //X = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
  steve.hand.add( new Card( deck.card.get(rand) ) );
  deck.card.remove(rand);

  // if(
  //if(deck.card.add  //add card to p's hand    ArrayList.add();
  //remove same card from deck  ArrayList.remove();

  return true;
}

void mousePressed()
{
  //println(mouseX+" "+mouseY);


  if ( mouseX > width-300
    && mouseX < width-100
    && mouseY > height-450
    && mouseY < height - 150
    && deck.card.size() > 0
    && !busted )
  {
    //  int randX = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
    dealCardTo( steve );
    //deck.card.remove(0);
  }
  println( steve.hand );
}

void keyPressed()
{
    if(key == 'w')
    text( "you stayed with:", 500,450);
  if(key == 'w')
    text( steve.handValue(), 640,450);
  if (key == 'a')
    println(deck.card);
  if (key == 'b')
    println(steve.hand);
}
