int x = width/2 ,y = height/2 ,r ;
float alf;
color c = color(0,102,117);

void setup() 
{ 
            size (640,480);
            r=137;
}
void draw()
{ 
           color b = color(mouseX,mouseY,9);  
           background(c);  
           fill(b);
           int a = 34;
           alf=alf+7;
           x=268+round(r*cos(PI*alf/180));
           y=268+round(r*sin(PI*alf/180));
           rect(x-a/3,y-a/3,29,29);
           x = x++ % width;
           y = y++ % height;

}