
int frames = 0;
void setup() {
 size(800, 800);
 background(0);
 stroke(0);

}

//void draw() {
//  float r = min(width, height) * 0.35;
//  int points = 100;
  
//  for (int i = 0; i < points; i = i + 1) {
//    float angel = i * TWO_PI / points;
//    float x = cos(angel) * r + (width / 2);
//    float y = sin(angel) * r + (height / 2);
    
//    circle(x, y, 5);
//  }
  
//  noLoop();
//}

void draw() {
  clear();
  translate(width/2, height/2); 
  float r = min(width, height) * 0.35;
  float noiseMax = 2;
  int points = 100;
  int rings = 70;
  noiseDetail(5);
  
  stroke(255);
  noFill();
 
  
  for(int j = 0; j <= rings; j=j+1) {
     float rad = (r / rings) * (rings - j);
     
      beginShape();
     
     for (int i = 0; i < points; i = i + 1) {
        float angle = i * TWO_PI / points;
        float xOff = map(cos(angle), -1, 1, 0, noiseMax);
        float yOff = map(sin(angle), -1, 1, 0, noiseMax);;
       
        float offset = map((float)SimplexNoise.noise(xOff, yOff + (j * 0.1), frames * 0.003), 0, 1, 0, rad / 5);
        float x = (rad + offset) * cos(angle);
        float y = (rad + offset) * sin(angle);
        
        vertex(x, y);
      }
       stroke(j / rings * 175 + 120);
      endShape(CLOSE);
  }
  
  frames++;
  //noLoop();
}

//function goToStep6 () {
//  loop();
//  ctx.fillStyle = 'black';
//  frames = 0;
//}

//function step6 () {
//  clear();
//  let r = min(width, height) * 0.35;
//  const rings = 70;
//  for (let j = 0; j < rings; j++) {
//    let rad = (r / rings) * (rings - j);
//    beginShape();
//    for (let i = 0; i <= 100; i++) {
//      let x = cos(i / 100 * TWO_PI);
//      let y = sin(i / 100 * TWO_PI);
//      const offset = _noise.simplex3(x, y + (j * 0.03), frames * 0.003) * (rad / 5);
//      x *= rad + offset;
//      y *= rad + offset;
//      x += width / 2;
//      y += height / 2;
//      vertex(x, y);
//    }
//    stroke(j / rings * 175 + 80);
//    endShape();
//  }
//  frames++;
//}
