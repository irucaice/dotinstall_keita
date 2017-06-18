//螺旋上に点を配置

float radius = 150;  //球体の半径
float dPhiStep = 0;  //dPhi を更新する値
float dPhiStepVelocity = 0.05;  //dPhiStepを徐々に増やす値

void setup() {
  size(640, 360, P3D);
  //pixelDensity(displayDensity());
}

void draw() {
  background(0, 24, 43);
  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.02);
  
  float lastX = 0;
  float lastY = 0;
  float lastZ = 0;
  
  //z 座標をずらしながら theta を増やしつつ、同時に phi も増やす
  for (float dTheta = 0, dPhi = 0; dTheta <= 180; dTheta++, dPhi += dPhiStep) {
    float theta = radians(dTheta);  //x,z軸のなす角度。移動中の円の大きさを司る。
    float phi = radians(dPhi);  //x,y軸のなす角度。円上に点を配置する。

    float x = radius * sin(theta) * cos(phi);
    float y = radius * sin(theta) * sin(phi);
    float z = radius * cos(theta);  //円を描く時の中心の座標
    
    stroke(179,208,252);
    if (lastX != 0) {
      strokeWeight(1);
      line(lastX, lastY, lastZ, x, y, z);
    }
    strokeWeight(4);
    point(x, y, z);
    
    lastX = x;
    lastY = y;
    lastZ = z;
  }
  dPhiStep += dPhiStepVelocity;
}
