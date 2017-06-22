int num = 500;
Point[] points = new Point[num];

void setup() {
  size(800, 800, P3D);
  //  pixelDensity(displayDensity());

  for (int i = 0; i < num; i++) {
    points[i] = new Point();
  }
}

void draw() {
  background(0, 0, 0);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.005);

  for (int i = 0; i < num; i++) {
    points[i].display();
  }

  for (int i = 0; i < num; i++) {
    for (int j = i + 1; j < num; j++) {
      float d = dist(
      points[i].x, 
      points[i].y, 
      points[i].z, 
      points[j].x, 
      points[j].y, 
      points[j].z
        );
      if (d < 40) {
        int c = (int) map(d, 0, 40, 0, 255);
        stroke(c, c, 255);
        strokeWeight(1);
        line(
        points[i].x, 
        points[i].y, 
        points[i].z, 
        points[j].x, 
        points[j].y, 
        points[j].z
          );
      }
    }
  }
}

