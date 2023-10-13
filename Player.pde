class Player {

  float y;

  // Initialize the player's y-coordinate.
  Player(float y) {
    this.y = y;
  }

  // Update the player's y-coordinate based on the mouse position.
  void drawPlayer() {
    y = mouseY;

    // Save the current transformation matrix. (a function that saves the current coordinate system to stack).
    pushMatrix();

    // Translate to the player's position on the right side.
    translate(width - width / 20, y);
    stroke(0);

    // Set the fill color to a custom color (yellowish-green).
    fill(180, 200, 30);

    // Draw the colored rectangle for the player's "paddle".
    rect(0, 0, width / 20, width / 20);

    // A function that restores the prior coordinate system. (See pushMatrix).
    popMatrix();
  }
}
