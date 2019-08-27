class Snake {
  ArrayList<PVector> snake;
  int snakeSpeed;
  Snake() {
    snake = new ArrayList<PVector>();
    snakeSpeed = 50;
    PVector v = new PVector(xPos, yPos);
    snake.add(v);

    float incPos = boxWidth;
    for (int i = 0; i < 3; i++) {
      xPos -= incPos;
      snake.add(new PVector(xPos, yPos));
    }
  }

  void genSnake() {
    for (int i = 0; i < snake.size(); i++) {
      rect(snake.get(i).x, snake.get(i).y, boxWidth, boxWidth);
    }
  }

  void eatFood() {
    if (snake.get(0).x == boxPosX && snake.get(0).y == boxPosY) {
      foodExist = false;
      snake.add(new PVector(snake.get(snake.size() - 1).x, snake.get(snake.size() - 1).y));
    }
  }

  void genFood() {
    if (foodExist == false) {
      boxPosX = ceil((random(0, (width / boxWidth)) * boxWidth) / 10) * 10;
      boxPosY = ceil((random(0, (width / boxWidth)) * boxWidth) / 10) * 10;
      foodExist = true;
    }
    rectMode(CENTER);
    rect((int)boxPosX, (int)boxPosY, boxWidth, boxWidth);
  }

  void death() {
    if (snake.get(0).x >= width || snake.get(0).x < 0 || 
      snake.get(0).y >= height || snake.get(0).y < 0) {
      print("Dead");
    }
    for (int i = 1; i < snake.size(); i++) {
      if (snake.get(0).x == snake.get(i).x && snake.get(0).y == snake.get(i).y) {
        print("Dead");
      }
    }
  }

  void move(int direction) {
    switch (direction) {
    case UP:
      for (int i = snake.size() - 1; i > 0; i--) {
        snake.get(i).x = snake.get(i - 1).x;
        snake.get(i).y = snake.get(i - 1).y;
      }
      snake.get(0).y -= boxWidth;
      eatFood();
      delay(snakeSpeed);
      break;
    case DOWN:
      for (int i = snake.size() - 1; i > 0; i--) {
        snake.get(i).x = snake.get(i - 1).x;
        snake.get(i).y = snake.get(i - 1).y;
      }
      snake.get(0).y += boxWidth;
      eatFood();
      delay(snakeSpeed);
      break;
    case LEFT:
      for (int i = snake.size() - 1; i > 0; i--) {
        snake.get(i).x = snake.get(i - 1).x;
        snake.get(i).y = snake.get(i - 1).y;
      }
      snake.get(0).x -= boxWidth;
      eatFood();
      delay(snakeSpeed);
      break;
    case RIGHT:
      for (int i = snake.size() - 1; i > 0; i--) {
        snake.get(i).x = snake.get(i - 1).x;
        snake.get(i).y = snake.get(i - 1).y;
      }
      snake.get(0).x += boxWidth;
      eatFood();
      delay(snakeSpeed);
      break;
    default:
      for (int i = snake.size() - 1; i > 0; i--) {
        snake.get(i).x = snake.get(i - 1).x;
        snake.get(i).y = snake.get(i - 1).y;
      }
      snake.get(0).x += boxWidth;
      eatFood();
      delay(snakeSpeed);
      break;
    }
  }
}
