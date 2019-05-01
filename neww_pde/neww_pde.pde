float rL = 50;  // least radius of bubble
float rH = 70; // greatest radius of bubble
float r =random(255);
float g =random(255);
float B =random(255);
float r_ =0;
float g_ =0;
float B_ =0;
float colorSpeed = 0.2;
color back;
boolean changing = false;
class bubble{
float x;
float y;
float r;
float xOff;
float yOff;
float alpha=255;
color c = color(255,255,255,alpha);
bubble(float x_,float y_,float r_)
{
x = x_;
y = y_;
r = r_;
xOff = random(0,500);
yOff = random(0,500);
}
void show(){
  c = color(255,255,255,alpha);
  noStroke();
fill(c);
ellipse(x,y,r,r);

}

void move(){

x+= map(noise(xOff),0,1,-4,4);
y+= map(noise(yOff),0,1,-4,4);
xOff+=0.02;
yOff+=0.02;
alpha-= 1.5;
}


};
ArrayList <bubble> bubbles;

void setBackground(){
if(r>r_){
r-=colorSpeed;
}
else{
r+=colorSpeed;
}
if(g>g_){
g-=colorSpeed;
}
else{
g+=colorSpeed;
}
if(B>B_){
B-=colorSpeed;
}
else{
B+=colorSpeed;
}


}
bubble b;
void setup(){
size(displayWidth, displayHeight);
back = color(r,g,B);
background(0);
bubbles = new ArrayList<bubble>();

}
void draw(){
  color backk = color(r,g,B);
  
  background(backk);
  if(random(1)<0.02){
  createBub();
  }
  if(random(1)<1 && (!(changing))){
     r_ = random(255);
     g_ = random(255);
     B_ = random(255);
  }
  setBackground();

for (int i=bubbles.size()-1 ;i>=0;i--)
{  bubble b = bubbles.get(i);
  b.show();
b.move();
if(b.alpha<=0){
bubbles.remove(i);
}
}


if((abs(r-r_)<=0.2 ) || (abs(g-g_)<0.2) || abs(B-B_) <0.2){
changing = false;
}
else{
changing = true;

}
}
void mousePressed(){
bubble b = new bubble(mouseX,mouseY,random(rL,rH));
bubbles.add(b);

}
void createBub(){
bubble b = new bubble(random(0,width),random(0,height),random(rL,rH));
bubbles.add(b);
}
