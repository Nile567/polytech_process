int ang=0;
int snake=5;
int time=0;
int[] hdx= new int[2500];
int[] hdy= new int[2500];
int apx=(round(random(47))+1)*8;
int apy=(round(random(47))+1)*8;
boolean red=true;
boolean stopgame=false;
void setup()
{
  restart();
  size(400,400);
  textAlign(CENTER);
}
void draw()
{
  if (stopgame)
  {
  
  }
  else
  {
   
  time+=1;
  fill(255,0,0);
  stroke(0);
  rect(apx,apy,8,8);
  fill(0);
  stroke(0);
  rect(0,0,width,8);
  rect(0,height-8,width,8);
  rect(0,0,8,height);
  rect(width-8,0,8,height);
  
  if ((time % 5)==0)
  {
    travel();
    display();
    checkdead();
  }
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    
    if (keyCode == UP && ang!=270 && (hdy[1]-8)!=hdy[2])
    {
      ang=90;
    }
    if (keyCode == DOWN && ang!=90 && (hdy[1]+8)!=hdy[2])
    {
      ang=270;
    }if (keyCode == LEFT && ang!=0 && (hdx[1]-8)!=hdx[2])
    {
      ang=180;
    }if (keyCode == RIGHT && ang!=180 && (hdx[1]+8)!=hdx[2])
    {
      ang=0;
    }
    if (keyCode == SHIFT)
    {
    
      restart();
    }
  }
}
void travel()
{
  for(int i=snake;i>0;i--)
  {
    if (i!=1)
    {
     
      hdx[i]=hdx[i-1];
      hdy[i]=hdy[i-1];
    }
    else
    {
      
      switch(ang)
      {
        case 0:
        hdx[1]+=8;
        break;
        case 90:
        hdy[1]-=8;
        break;
        case 180:
        hdx[1]-=8;
        break;
        case 270:
        hdy[1]+=8;
        break;
      }
    }
  }
  
}
void display()
{
 
  if (hdx[1]==apx && hdy[1]==apy)
  {
    
    snake+=round(random(3)+1);
    red=true;
    while(red)
    {
      apx=(round(random(47))+1)*8;
      apy=(round(random(47))+1)*8;
      for(int i=1;i<snake;i++)
      {
        
        if (apx==hdx[i] && apy==hdy[i])
        {
          red=true;
        }
        else
        {
          red=false;
          i=1000;
        }
      }
    }
  }
 
  stroke(sinecolor(1),sinecolor(0),sinecolor(.5));
  fill(0);
  rect(hdx[1],hdy[1],8,8);
 
  fill(255);
  rect(hdx[snake],hdy[snake],8,8);
  
}
void checkdead()
{
  for(int i=2;i<=snake;i++)
  {
    
    if (hdx[1]==hdx[i] && hdy[1]==hdy[i])
    {
      fill(255);
      rect(125,125,160,100);
      fill(0);
      text("GAME OVER",200,150);
      text("Score:  "+str(snake-1)+" points ",200,175);
      text("To restart, press Shift.",200,200);
      stopgame=true;
    }
    
    if (hdx[1]>=(width-8) || hdy[1]>=(height-8) || hdx[1]<=0 || hdy[1]<=0)
    {
      fill(255);
      rect(125,125,160,100);
      fill(0);
      text("GAME OVER",200,150);
      text("Score:  "+str(snake-1)+" points ",200,175);
      text("To restart, press Shift.",200,200);
      stopgame=true;
    }
  }
}
void restart()
{
  
  background(255);
  hdx[1]=200;
  hdy[1]=200;
  for(int i=2;i<1000;i++)
  {
    hdx[i]=0;
    hdy[i]=0;
  }
  stopgame=false;
  apx=(round(random(47))+1)*8;
  apy=(round(random(47))+1)*8;
  snake=5;
  time=0;
  ang=0;
  red=true;
}
float sinecolor(float percent)
{
  float slime=(sin(radians((((time +(255*percent)) % 255)/255)*360)))*255;
  return slime;
}