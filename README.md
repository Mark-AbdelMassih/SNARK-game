"# SNARK-game" 
# Snake Game in MATLAB

Welcome to the Snake Game implemented in MATLAB! This simple yet addictive game allows you to control a snake as it moves around the grid, eating food and growing longer with each meal. Try to avoid running into the walls or the snake's own body!

## Features

- Classic snake gameplay
- User-controlled movement using keyboard arrows
- Dynamic food generation
- Simple graphics using MATLAB's plotting capabilities

## Getting Started

### Prerequisites

- MATLAB (version R2016 or later recommended)

### Running the Game

1. Open MATLAB and create a new script.
2. Copy and paste the entire code provided below into your script.
3. Save the file with a `.m` extension (e.g., `snake_game.m`).
4. Run the script in MATLAB.

### Controls

- Use the **Arrow Keys** to control the snake:
  - Up Arrow: Move Up
  - Down Arrow: Move Down
  - Left Arrow: Move Left
  - Right Arrow: Move Right

## Code Explanation

The code implements the following features:

- **Playing Field:** A grid of size 20x20 is created for the game.
- **Snake Movement:** The snake starts at a defined position and moves based on user input.
- **Food Generation:** Food appears at random positions on the grid, and the snake grows each time it eats.
- **Game Over Conditions:** The game ends when the snake collides with the walls or itself.

### Main Functions

- `keyPress`: Handles keypress events and moves the snake accordingly.
- `youGottaMove`: Updates the snake's position and checks for collisions.
- `makeMovement`: Moves the snake in the specified direction.
- `checkBody`: Checks if the snake collides with itself.
- `checkPosEqFood`: Checks if the snake has reached the food.
- `getNewFood`: Generates a new food position that doesn't overlap with the snake.
- `gameOver`: Ends the game and displays a message.

## Customization

You can modify the game by adjusting:
- The size of the grid (`max_x` and `max_y`)
- The speed of the snake (change the `pause` duration in `keyPress`)

## Contributing

Feel free to fork the repository, make improvements, or suggest features. Your contributions are welcome!


Enjoy the game! 🍏🐍 
