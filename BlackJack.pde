// list Dealer Wins out of 10:1,3,4, player won :2,5,6,7,8,9,10

/*
White chips, $1
Red chips, $5
Blue chips, $10
Green chips, $25
Black chips, $100
*/



//New Prog

//images 
PImage spade;
PImage club;
PImage diamond;
PImage heart;
PImage cardBack;
PImage greenFelt;
PImage moneyCat;
PImage c1, c2;


//The deck and dealer and player
Deck deck = new Deck();
Player steve = new Player();
Player dealer = new Player();

boolean busted;
boolean stayed;
boolean handOver;

//different states of the game
int ante;
int endState;


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
  //the background
  greenFelt = loadImage("feltGreen.jpg");   
  greenFelt.resize(1200,1000);
  //thats money cat
  moneyCat = loadImage("moneyCat.png");
  moneyCat.resize(130, 0);
  //Deck Pictures
  cardBack =loadImage("cardBack.jpg");
  //chips
  c1 = loadImage("chipWhite.png");
  c2 = loadImage("chipColor.png");

  loadGame();


  deck.fill52CardDeck();
  print(deck.card);
  //background(#05F532);
  
  fill(0,0,0,0);
  rect(890, 540, 220, 320);

  //the card image 
  cardBack.resize(200,0);
  
  //sound
  cardEffect = new SoundFile(this, "CardSoundEffect.wav");
  
  if( !stayed == true && !busted == true )
    {
      ante = 1;
        endState = 0;
    }
    
  if( stayed == true || busted == true )
    {
      ante = 0;
        endState = 1;
    }

}
void draw()
{

   // prints the playing table
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
          text("loss you bust",400,400);
            busted = true;
              endState = -1;
    }
  }
  
  //Draws the cards on the sceen 
  for (int i = 0; i < steve.hand.size(); i++)
    steve.hand.get(i).drawCard(100+200*i,150);    
    
  fill(0);

  text( deck.card.size(), width-200, 900);
  image(cardBack,width-200-deck.card.size()/2, height-300-deck.card.size()/2);

  //Stay Button
  rectMode(CORNER);
  
  //Moneycat is the icon to stay
  image(moneyCat,160, 470);
  //Dealer drawing cards
  if( stayed )
  {
    while( dealer.handValue() <= 17 )
    {
      dealCardTo(dealer);
      println(dealer.handValue());
    }
    
    //How you won
  if(dealer.handValue() > 21)
  {
       text("win dealer busted",400,400);
         handOver = true;
           endState = 1;
             saveGame();
  }

  else if (dealer.handValue() > steve.handValue())
  {
    text("loss",400,400);
      handOver = true;
        endState = -1;
          saveGame();
  }
  //else if(busted = true )
  //{
  //  text("loss you bust",400,400);
  
  //     busted = true;
  //      gameState = -1;
  //}
  else if(dealer.handValue() < steve.handValue())
  {    //
       text("win",400,400);
         handOver = true;
           endState = 1;
             saveGame();
  }

  else
  {    
       //this ties the game
       text("tie",400,400);
         handOver = true;
           endState = 0;
             saveGame();
  }
//Win,loss or tie
     if (endState == 1)
     {
       text("win",400,550);
         steve.chipGreen -= 1;  
     }
     else if(endState == -1)
     {
       text("loss",400,550);
         steve.chipGreen -= 1;
     }
     else if(endState == 0)
     {
       text("tie",400,550);
     }
     println( steve.chipGreen );

  }
  
  if( handOver )
  {
    textSize(25);
    text( "PLAYER: "+ steve.handValue(), 100, 390 );
    text( "DEALER: "+ dealer.handValue(), 100, 440);
  }
 // text("$" + steve.chipsAsCash(),900,500);

  //Draws the chips
  drawChip(200,900,#345678);
  drawChip(400,900,#345678);
  
  //Checks balance
  if(dist( mouseX , mouseY, 200, 900 ) < 40 )
    text("$" + steve.chipsAsCash(),300,750);
  if(dist( mouseX , mouseY, 400, 900 ) < 40 )
    text("$" + steve.chipsAsCash(),300,750);
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


  //Allows player to click on the deck and deosnt 
  if ( mouseX > width-300
    && mouseX < width-100
    && mouseY > height-450
    && mouseY < height - 150
    && deck.card.size() > 0
    && !busted 
    && !handOver)
  {

  dealCardTo( steve );
  cardEffect.play();
  steve.chipsAsCash();
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

  if (key == 'a')
    println(deck.card);
  if (key == 'b')
    println(steve.hand);
  if (key == 'i' || ante == 1)
   {  steve.chipRed -= 1;}
  if (key == 'u')
  steve.chipBrown -= 1;
  if (key == 'o')
  steve.chipGreen -= 1;  
  if (key == 'p')
  steve.chipBlack -= 1;

  //pressing this saves game
  if (key == 'e')
    saveGame();
}

//draws the token 
void drawChip( float x, float y, color c )
{
  push(); if (key == 'r')

  imageMode(CENTER);
  image(c1, x, y, 100,100 );
  
  tint(c);
  
  image(c2, x, y, 100,100 );
  pop();
}
//saving the game funtion 
void saveGame()
{
  try
  {
    //use a PrintWriter to send your information to a chosen file
    PrintWriter pw = createWriter( "save.txt" );
    pw.println( steve.chipBrown );
    pw.println( steve.chipRed );
    pw.println( steve.chipGreen );
    pw.println( steve.chipBlack );
    
    pw.flush(); //Writes the remaining data to the file
    pw.close(); //Finishes the file
  }
  //if something goes wrong it then loads a starter set
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG");
  }
}

void loadGame()
{
  
  try
  {
    //use the loadStrings() method to pull the lines of your save file into a String array
    String [] data = loadStrings("save.txt");
    steve.chipBrown = Integer.parseInt(data[0]);
    steve.chipRed = Integer.parseInt(data[1]);
    steve.chipGreen = Integer.parseInt(data[2]);
    steve.chipBlack = Integer.parseInt(data[3]);
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG");
    
    //Loads default data
    steve.chipBrown = 1;
    steve.chipRed = 1;
    steve.chipGreen = 0;
    steve.chipBlack = 0;
  }
}
