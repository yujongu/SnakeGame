float boxWidth = 10;
float xPos = 100;
float yPos = 100;
float boxPosX = random(0, (width / boxWidth));
float boxPosY = random(0, (width / boxWidth));
boolean foodExist = false;
Snake snake = new Snake();

void setup() {
  size(800, 800);
}

void draw() {
  rectMode(CENTER);
  background(0);
  snake.genSnake();
  keyPressed();
  snake.eatFood();
  stroke(255);
  snake.genFood();
  snake.death();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      snake.move(UP);
    } else if (keyCode == DOWN) {
      snake.move(DOWN);
    } else if (keyCode == LEFT) {
      snake.move(LEFT);
    } else if (keyCode == RIGHT) {
      snake.move(RIGHT);
    }
  }
}
