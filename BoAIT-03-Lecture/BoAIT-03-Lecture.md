---
marp: true
theme: mytheme
class: lead
paginate: true
math: katex
title: 情報処理応用基礎 第2回授業資料
header: 第3回：Processing入門と2D描画
footer: Basics of Applied Information Technology | T.Shimizu © 2025
---

# 情報処理応用基礎
# 第3回：Processing入門と2D描画

清水 哲也 ( shimizu@info.shonan-it.ac.jp )

---


⸻

marp: true
paginate: true
size: 16:9
headingDivider: 2

大学院向けコンピュータグラフィックス（4回圧縮版）

第2回：ライトとテクスチャ（3D導入）
	•	ねらい：Processing の P3D で3D描画を始め、基本ライトとテクスチャ貼付までを実装する。
	•	本日の成果物：
	•	3Dスターター（軸＋カメラ操作）
	•	基本ライト（ambient/directional/point）
	•	テクスチャ付きの球（地球デモ）

⸻

前回の復習（第1回）
	•	setup/draw と 2D描画の状態遷移（fill/stroke）
	•	反復（for）・乱数/ノイズ・入力（mouse/key）の組み合わせ
	•	P1：2Dポスター の要件と提出物

⸻

今日のゴール
	•	size(..., P3D) で3Dを開始し、カメラ・座標軸を用意できる
	•	ambientLight/directionalLight/pointLight と材質（shininess/specular）を使い分けられる
	•	画像を読み込み、球体にテクスチャを貼れる

⸻

3D導入：P3D と座標系
	•	size(w,h,P3D)：3Dレンダラ
	•	座標系（Processing）：右手系（+X 右、+Y 下、+Z 手前）
	•	投影：camera()（視点/注視/上方向）＋ perspective()（視野角・near/far）

// 3Dスターター（軸＋簡易オービット）
float camR=480, theta=PI/4, phi=PI/3; // 球座標でカメラ

void setup(){
  size(1280,720,P3D); smooth(8); frameRate(60);
}

void draw(){
  background(10);  
  float ex = camR*sin(phi)*cos(theta);
  float ey = camR*cos(phi);
  float ez = camR*sin(phi)*sin(theta);
  camera(ex,ey,ez, 0,0,0, 0,1,0);
  perspective(radians(60), (float)width/height, 1, 5000);

  drawAxes(240);
}

void drawAxes(float s){
  strokeWeight(3);
  stroke(255,60,60);  line(0,0,0, s,0,0);   // X
  stroke(60,255,60);  line(0,0,0, 0,s,0);   // Y
  stroke(60,120,255); line(0,0,0, 0,0,s);   // Z
}

void mouseDragged(){
  theta += (mouseX-pmouseX)*0.01;  
  phi   -= (mouseY-pmouseY)*0.01;  
  phi = constrain(phi, 0.05, PI-0.05);
}
void keyPressed(){ if(key=='w') camR-=20; if(key=='s') camR+=20; camR=constrain(camR,120,2000);} 


⸻

ライティングの基本
	•	環境光：ambientLight(r,g,b) … 全体を持ち上げる
	•	平行光：directionalLight(r,g,b, nx,ny,nz) … 方向一定（太陽光）
	•	点光源：pointLight(r,g,b, x,y,z) … 位置から全方向へ
	•	材質：specular(r,g,b)（鏡面の色）、shininess(v)（ハイライトの鋭さ）

void draw(){
  // ... カメラ設定は省略
  background(12);
  ambientLight(32,32,32);
  directionalLight(220,220,220, -1,-1,-1);

  pushMatrix();
  translate(0,0,0);
  noStroke();
  specular(255); shininess(40);
  fill(80,160,255);
  sphereDetail(48); sphere(120);
  popMatrix();
}

Tips：真っ黒問題は環境光不足かライト未設定が原因のことが多い

⸻

点光源の移動と見え方

float t;
void draw(){
  // ... カメラ設定は省略
  background(8); t += 0.02;
  ambientLight(24,24,24);
  float lx = 400*cos(t), lz = 400*sin(t);
  pointLight(255,255,255, lx, 200, lz); // 点光源が周回

  specular(255); shininess(50);
  fill(200);
  sphereDetail(48); sphere(140);
}

	•	点光の距離減衰は固定（古典パイプライン相当）。強すぎる場合は色を落とす

⸻

テクスチャの基本（画像→形状）
	•	画像読み込み：PImage img = loadImage("earth.jpg");
	•	PShapeに貼る：createShape(SPHERE, r) → setTexture(img)
	•	sphere() に 直接 texture() は使えない（独自メッシュが必要）ので、PShapeが便利

PImage earthImg; 
PShape globe; 
float ry;

void setup(){
  size(1280,720,P3D); smooth(8);
  earthImg = loadImage("earth.jpg"); // 正距円筒図法の地球画像を推奨
  globe = createShape(SPHERE, 160);
  globe.setTexture(earthImg);
  globe.setStroke(false);
  sphereDetail(64);
}

void draw(){
  background(10);
  // カメラ・投影は省略
  ambientLight(24,24,24);
  directionalLight(255,255,255, -0.6,-0.5,-0.6);

  pushMatrix();
  rotateY(ry); ry += 0.01; // 自転
  shape(globe);
  popMatrix();
}


⸻

応用：雲レイヤと簡易大気

PImage clouds; PShape cloudLayer;
void setup(){
  // ... earthImg/globe 生成後
  clouds = loadImage("clouds.png"); // 透過PNG（アルファ）
  cloudLayer = createShape(SPHERE, 163);
  cloudLayer.setTexture(clouds);
  cloudLayer.setStroke(false);
}
void draw(){
  // ... 地球の描画後
  pushMatrix();
  rotateY(-ry*1.2); // 風による相対移動のような演出
  tint(255, 220);   // うっすら
  shape(cloudLayer);
  noTint();
  popMatrix();
}

	•	tint() は シェイプ描画直前のみ有効（描画後は noTint() を忘れずに）

⸻

ハンズオン（手順）
	1.	3Dスターターをコピペ→軸・オービット操作を確認
	2.	ライトを追加：環境光＋平行光／点光を試す（色・角度・位置）
	3.	地球テクスチャを貼る（earth.jpg を data/ へ）
	4.	雲レイヤ（任意）と自転/公転の演出

素材の命名例: data/earth.jpg, data/clouds.png

⸻

課題P2（第2回の提出物）

テーマ：テクスチャ地球のデモ
	•	必須要件
	1.	地球（球）にテクスチャ貼付（createShape(SPHERE)+setTexture）
	2.	自転（rotateY）とライト移動（点光 or 平行光）
	3.	README.md（実行/操作/環境）＋ 30–60秒動画
	•	加点要素
	•	雲レイヤ（アルファPNG）／公転・UI（キー/スライダ）／スクリーンショット保存

提出名：CG-Grad-2025-学籍番号-P2-TexturedEarth

⸻

P2 ルーブリック（抜粋）

観点	C	B	A
要件充足	一部欠落	全要件達成	全要件＋小改良
見えの設計	最低限	ライト・色が見やすい	雲/公転/UIで魅力的
実装明瞭さ	動くが読みにくい	命名/分割が適切	クラス化・コメント充実
再現性	曖昧	READMEあり	一発実行・動画良質


⸻

トラブルシューティング
	•	真っ黒：ambientLight 不足／ライト未設定／fill() が黒
	•	ハイライトが出ない：specular()/shininess() を設定
	•	テクスチャが貼れない：data/ フォルダに画像を置く／拡張子ミス
	•	ジャギーが気になる：smooth(8)／sphereDetail(≥48)
	•	雲が真っ黒：PNGのアルファがない／tint() の指定を見直す

⸻

参考と次回予告
	•	参考：Processing リファレンス（Light, Material, PShape, Texture）
	•	次回（第3回）：アニメーション／ベクトル／粒子（PVector、寿命・エミッタ、簡易衝突）