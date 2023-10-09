//New Prog

Deck deck = new Deck();
Player steve = new Player();

void setup()
{
  size(1200, 1000);
  textSize(25);
  text("chipWhite =", 40, 40);
  //  size(400, 400);
  //textSize(25);
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

  for (int i = 0; i < steve.hand.size(); i++)
    steve.hand.get(i).drawCard(50+100*i,150);    

  //circle(50+100*i,50,50);


  text( deck.card.size(), width-200, height-300);
}


boolean dealCardTo(Player p)
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
    && deck.card.size() > 0 )
  {
    //  int randX = (int)random(width/3-300,width/3+300), randY = (int)random(height/1.3-0,height/1.3+0);
    dealCardTo( steve );
    //deck.card.remove(0);
  }
  println( steve.hand );
}

void keyPressed()
{
  if (key == 'a')
    println(deck.card);
  if (key == 'b')
    println(steve.hand);
}
