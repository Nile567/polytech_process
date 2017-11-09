int[] array =new int[35];
int i=0;
int j=0;
int temp;
void setup() {
  size(360, 720);
  for (int i=0; i<array.length; i++) {
    array[i] = (int)random(35);
  }
  frameRate(5);
}
void draw() {
  background(0,102,117);

  for (j=0; j<array.length; j++) {
     if (array[i]>array[j]) {
       temp = array[j];
       array[j] = array[i];
       array[i] = temp;
    }
    fill(7,20,33);
    strokeWeight(10);
    line(90, 25+20*j, 120+5*array[j], 25+20*j);
  }
 i++;  
 if (i>array.length-1){
    noLoop();
 }
}