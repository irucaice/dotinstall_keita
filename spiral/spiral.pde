//螺旋上に点を配置

float radius = 150;  //球体の半径

void setup() {
  size(640, 360, P3D);
  //pixelDensity(displayDensity());
}

void draw() {
  background(255);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.02);
  
  //z 座標をずらしながら theta を増やしつつ、同時に phi も増やす
  for (int dTheta = 0, dPhi = 0; dTheta <= 180; dTheta++, dPhi += 10) {
    float theta = radians(dTheta);  //x,z軸のなす角度。移動中の円の大きさを司る。
    float z = radius * cos(theta);  //円を描く時の中心の座標
    float phi = radians(dPhi);  //x,y軸のなす角度。円上に点を配置する。
    float x = radius * sin(theta) * cos(phi);
    float y = radius * sin(theta) * sin(phi);
    stroke(0);
    strokeWeight(4);
    point(x, y, z);
  }
  
}
