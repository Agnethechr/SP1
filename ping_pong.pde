Ball ball;
Enemy enemy;
Player player;

float ballSpeedX;
float ballSpeedY;
float enemySpeed;
float ballSize;

// Setup a size for the game and enable anti-aliasing for smoother rendering.
void setup() {
  size(600, 600);
  smooth();

  // Create a player and an enemy player object with an initial position in the middle of the canvas.
  // Create a ball object with an initial position in the middle of the canvas and a reference to the player.
  player = new Player(height / 2);
  enemy = new Enemy(height / 2);
  ball = new Ball(width / 2, height / 2, player);

  // Set the speed of the ball and enemy player.
  ballSpeedX = width / 150;
  ballSpeedY = width / 100;
  enemySpeed = width / 250;
  ballSize = width / 20;
  rectMode(CENTER);
}

void draw() {
  background(0);
  centerLine();

  // Call the draw methods for the ball, player, and enemy to update their positions and appearances.
  ball.drawBall();
  player.drawPlayer();
  enemy.drawEnemy();
}

void centerLine() {
  int numberOfLine = 20;

  for (int i = 0; i < numberOfLine; i++) {
    strokeWeight(width / 100);
    stroke(255);

    // Draw the lines to create the center line, white.
    line(width / 2, i * height / numberOfLine, width / 2, (i + 1) * height / numberOfLine - height / 40);
    stroke(0);

    // Draw the lines to separate the white lines in the center line.
    line(width / 2, (i + 1) * height / numberOfLine - height / 40, width / 2, (i + 1) * height / numberOfLine);
  }
}
