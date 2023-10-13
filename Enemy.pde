class Enemy {

  float y;

  // Initialize the enemy players y-coordinate.
  Enemy(float y) {
    this.y = y;
  }

  // Adjust the enemy players position based on the global enemySpeed.
  void drawEnemy() {
    y += enemySpeed;

    // Save the current transformation matrix. (a function that saves the current coordinate system to stack).
    pushMatrix();
    stroke(0);

    // Translate to the enemy players position. (Specifies an amount to displace objects within the display window).
    translate(width / 20, y);
    fill(255); // Set the fill color to white.
    rect(0, 0, width / 20, width / 20); // Set the size to the same value.

    // A function that restores the prior coordinate system. (See pushMatrix).
    popMatrix();

    // Execute the enemy players AI logic.
    enemyAI();
  }

  void enemyAI() {
    if (y < ball.y) {
      enemySpeed = width / 150; // Move up if the ball is above the enemy player.
    } else if (y > ball.y) {
      enemySpeed = -width / 150; // Move down if the ball is below the enemy player.
    } else {
      enemySpeed = 0; // Stop moving if the enemy player is aligned with the ball vertically.
    }

    if (ball.x > width / 2) {
      enemySpeed = 0; // Stop moving when the ball is on the player's side.
    }
  }
}
