//球体に点を配置

float radius = 150;  //半径

void setup() {
  size(640, 360, P3D);
  //pixelDensity(displayDensity());  //Retina のような高解像度のディスプレイ用の設定
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.02);  //Y軸回転

  //θtheta(z軸の座標) を 0 から 180 まで回す
  for (int dTheta = 0; dTheta <= 180; dTheta += 10) {
    float theta = radians(dTheta);
    float z = radius * cos(theta);
    float r = radius * sin(theta);
    drawCircle(z, r);
  }
}

//円を描く
void drawCircle(float z, float r) {  //z軸の座標と縦の円の半径r
  //0-360度の中で10度ごとに点を打っていく
  for (int dPhi = 0; dPhi < 360; dPhi += 10) {
    float phi = radians(dPhi);
    float x = r * cos(phi);
    float y = r * sin(phi);
    stroke(0);
    strokeWeight(4);
    point(x, y, z);
  }
}

