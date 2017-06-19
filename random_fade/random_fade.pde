float radius = 150;
int num = 3000;  // 点の個数
float[] x = new float[num];
float[] y = new float[num];
float[] z = new float[num];

void setup() {
  size(640, 360, P3D);
  //  pixelDensity(displayDensity());

  //初期化
  for (int i = 0; i < num; i++) {
    x[i] = 0;
    y[i] = 0;
    z[i] = 0;
  }
}

int i =0;

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.01);

  //徐々に点を打っていく
  if (frameCount%4==0) {
    float theta = random(PI);  //0~180度
    float phi = random(TWO_PI);  //0~360度

    x[i] = radius * sin(theta) * cos(phi);
    y[i] = radius * sin(theta) * sin(phi);
    z[i] = radius * cos(theta);
    i++;
  }

  //描画
  for (int i = 0; i < num; i++) {
    stroke(0);
    strokeWeight(3);
    point(x[i], y[i], z[i]);
  }
}

