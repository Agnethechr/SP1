class Ball {

  float x;
  float y;

  // Represents the distance between the ball and the player.
  float playerDist;

  // Reference to the player object.
  Player player;

  // Initialize the ball's x-coordinate and y-coordinate.
  Ball(float x, float y, Player player) {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  // Save the current transformation matrix. (a function that saves the current coordinate system to stack).
  void drawBall() {
    pushMatrix();

    // Translate to the ball's position. (Specifies an amount to displace objects within the display window).
    translate(this.x, this.y);

    // Set the fill color to white.
    fill(255);

    // Disable stroke (outline) for the ellipse.
    noStroke();
    ellipse(0, 0, width/20, width/20);

    // A function that restores the prior coordinate system. (See pushMatrix).
    popMatrix();

    // Update the ball's x-coordinate and y-coordinate using the global ballSpeedX and ballSpeedY.
    this.x += ballSpeedX;
    this.y += ballSpeedY;

    ballBoundary();
  }

  // Reverse the vertical speed when hitting the top boundary. (Hits top and bounces back).
  void ballBoundary() {
    if (this.y < 0) {
      this.y = 0;
      ballSpeedY = -1;
    }

    // Reverse the vertical speed when hitting the bottom boundary. (Hits bottom and bounces back).
    if (this.y > height) {
      this.y = height;
      ballSpeedY = -1;
    }

    // Reset the ball's position and reverse the vertical speed when passing the right boundary.
    if (this.y > width) {
      this.y = width / 2;
      ballSpeedY = -1;
    }

    // Reset the ball's position and reverse the horizontal speed when passing the left boundary.
    if (this.x < 0) {
      this.x = width / 2;
      ballSpeedX *= -1;
    }

    // Reverse the horizontal speed when colliding with the player's paddle.
    if (this.x > width - width / 40 - ballSize && this.x < width && abs(this.y - player.y) < width / 10) {
      this.x = width - width / 40 - ballSize;
      ballSpeedX *= -1;
    }
  }
}
