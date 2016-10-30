import gab.opencv.*;
import processing.video.*;
import java.awt.*;

PShape rocket;
int rot1=0;
int rot2=0;
Capture video;
OpenCV opencv;


void setup() 
{

  size(1280, 720,P3D);
  video = new Capture(this, 320, 240);
  opencv = new OpenCV(this, 320, 240);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  rocket = loadShape("rocket.obj");
  video.start();
  
}

void draw()
{
  clear();
  scale(0.5);
  translate(0,0,750);
  opencv.loadImage(video);
  image(video, 0, 0,640,480);
  noFill();
  Rectangle[] faces = opencv.detect();
  println(faces.length);
  for (int i = 0; i < faces.length; i++) 
  {
    rot1=(faces[i].x+faces[i].width/2)-opencv.width/2;
    rot2=(faces[i].y+faces[i].height/2)-opencv.height/2;
    println(rot1 + "," + rot2);
   }
  translate(90,200,-1300);
  fill(255,0,0);
  box(180);
  translate(-400,-500,+700);
  fill(0,255,0);
  box(180);
  translate(+1000,+900,+300);
  fill(0,0,255);
  sphere(180);
  beginShape();
  camera(rot1*4, rot2*8, -600, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0); 
  rotateZ(PI);
  shape(rocket);
  stroke(255,0,0);
  fill(180);
  box(1500,1500,1500);
  endShape();
}
