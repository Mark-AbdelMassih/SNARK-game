% Size of the 'playing field'.
max_x = 20;
max_y = 20;
grid = zeros(max_x, max_y);

% Starting position.
x = 5;
y = 5;
grid(x, y) = 1;
length = 1; % Length of the snake

% Array holds all the coordinates of the snake's body elements
positionX = zeros(length, 1);
positionY = zeros(length, 1);

positionX(1) = x;
positionY(1) = y;

% Position of the food.
x_f = x;
y_f = y;
getNewFood();

h_fig = figure;
set(h_fig, 'menubar', 'none');
set(h_fig, 'CurrentObject', imagesc(grid));
set(h_fig, 'KeyPressFcn', @keyPress);

% Called for any key press.
function keyPress(~, evt)
    youGottaMove(evt.Key);
    while (~gameover)
        pause(0.1);
        youGottaMove(evt.Key);
    end
end

% Called after a keypress or after timedelay
function youGottaMove(mov)
    makeMovement(mov);
    if ~gameover
        checkBody();
        if ~gameover
            justGotFoodFlag = 0;
            grid(positionX(1), positionY(1)) = 0;
            if (length ~= 1)
                for i = 1:length-1
                    positionX(i) = positionX(i + 1);
                    positionY(i) = positionY(i + 1);
                end
            end
        end
    end
    positionX(length) = x;
    positionY(length) = y;
    checkPosEqFood();
    grid(x, y) = 1;
    set(h_fig, 'CurrentObject', imagesc(grid));
end

function makeMovement(mov)
    tmp = 1;
    while tmp
        switch(mov)
            case 'downarrow'
                if (x == max_x)
                    gameOver();
                    break;
                end
                x = x + 1;

            case 'uparrow'
                if (x == 1)
                    gameOver();
                    break;
                end
                x = x - 1;

            case 'rightarrow'
                if (y == max_y)
                    gameOver();
                    break;
                end
                y = y + 1;

            case 'leftarrow'
                if (y == 1)
                    gameOver();
                    break;
                end
                y = y - 1;
        end
        tmp = 0;
    end
end

% Checks if new position is part of snake's body
function checkBody()
    for i = 1:length - 1
        if (x == positionX(i)) && (y == positionY(i))
            gameOver();
            break;
        end
    end
end

% Check if you've reached the food
function checkPosEqFood()
    if (x == x_f) && (y == y_f)
        length = length + 1;
        positionX(length) = x;
        positionY(length) = y;
        getNewFood();
        justGotFoodFlag = 1;
    end
end

% Create new food element
function getNewFood()
    flag = 1;
    while (flag)
        x_f = randi(max_x);
        for i = 1:length
            if (x_f == positionX(i)) && (y_f == positionY(i))
                flag = 0;
                break;
            end
        end
        if flag
            y_f = randi(max_y);
            flag = 1; % Reset flag for next iteration
        end
    end
    grid(x_f, y_f) = 0.5;
end

function doNothing(~, ~)
end

% Closes things up.
function gameOver()
    set(h_fig, 'KeyPressFcn', @doNothing);
    grid(:, :) = 0.2;
    set(h_fig, 'CurrentObject', imagesc(grid));
    pause(1);
    close(h_fig);
    disp('Game over, you suck!');
    gameover = 1;
end
