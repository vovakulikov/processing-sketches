
public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector previousPos;
  float maxSpeed;
  float hue = 0;
  float hueSpeed = 0.01;
  float hueRange = 20;
  float baseHue = 240;
   
  Particle(PVector start, float maxspeed) {
    maxSpeed = maxspeed;
    pos = start;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    previousPos = pos.copy();
  }
  void run() {
    update();
    edges();
    show();
  }
  void update() {
    pos.add(vel);
    vel.limit(maxSpeed);
    vel.add(acc);
    acc.mult(0);
  }
  void applyForce(PVector force) {
    acc.add(force); 
  }
  void show() {
    colorMode(HSB);
    hue+=hueSpeed;
    float max = map(cos(hue), -1, 1, 0, 200);
    float d = pos.heading();
    float r = map(sin(d), -1, 1, 0, 200) ; //<>//
    float g = map(cos(d), -1, 1, 0, 200);
    float b = map(sin(d) + cos(d), -1, 1, 0, 200);
    
    stroke(r, g, b, 5);
    strokeWeight(1);
    line(pos.x, pos.y, previousPos.x, previousPos.y);
    //point(pos.x, pos.y);
    updatePreviousPos();
  }
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePreviousPos();
    }
    if (pos.x < 0) {
      pos.x = width;    
      updatePreviousPos();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePreviousPos();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePreviousPos();
    }
  }
  void updatePreviousPos() {
    this.previousPos.x = pos.x;
    this.previousPos.y = pos.y;
  }
  void follow(FlowField flowfield) {
    int x = floor(pos.x / flowfield.scl);
    int y = floor(pos.y / flowfield.scl);
    int index = x + y * flowfield.cols;
    
    PVector force = flowfield.vectors[index];
    applyForce(force);
  }
}
