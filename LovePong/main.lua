local w, h -- Variables to store the screen width and height

local ballX, ballY -- Variables to store the position of the ball in the screen (Uncomment at the start of TODO 6)
local ballSpeed -- Variable to store the ball speed (Uncomment at the start of TODO 8)
local playerX, playerY, cpuX, cpuY -- Variables to store the position of the player and cpu paddle (Uncomment at the start of TODO 10)
local paddleSpeed -- Variable to store the paddle speed (Uncomment at the start of TODO 12)
local ballAngle -- Variable to estore the ball movement angle (Uncomment at the start of TODO 16)
local playerPoints, cpuPoints -- Variable to store the player and cpu points (Uncomment at the start of TODO 21)

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  w, h = love.graphics.getDimensions() -- Get the screen width and height
  
  -- TODO 5: Load the font to use in the game and set it -- David
  
  font = love.graphics.newFont("pong.ttf",50)
  love.graphics.setFont(font)
  
  -- TODO 6: Initialize the position of the ball at the center of the screen -- David
  
  ballX, ballY = love.graphics.getWidth()/2, love.graphics.getHeight()/2
  
  -- TODO 8: Initialize the ball speed for going to the left -- David
  
  --ballSpeed = -250
  
  -- TODO 10: Initialize the player and cpu paddles position -- Miquel
  
  playerX, playerY, cpuX, cpuY = 50, love.graphics.getHeight()/2 - 25, love.graphics.getWidth()-10-50, love.graphics.getHeight()/2 - 25
  
  -- TODO 12: Initialize the paddle speed -- Miquel
  
  paddleSpeed = 350
  
  -- TODO 16: Initialize the ball angle -- David
  
  ballAngle = math.pi - math.pi/4
  
  -- TODO 18: Comment all the code of the TODO 8 and initialize the ball speed without sign -- David
  
  ballSpeed = 300
  
  -- TODO 21: Initialize the player and cpu points variables -- David
  
  playerPoints , cpuPoints = 0, 0
  
end

function love.update(dt)
  -- TODO 9: Make the ball move using the ballSpeed variable -- David
  
  --[[ 
  ballX = ballX + ballSpeed * dt
  ballY = ballY + ballSpeed * dt]]
   
  -- TODO 17: Comment all the code of the TODO 9 and make the ball move using the ballAngle variable -- David
  
  ballX = ballX + (ballSpeed * math.cos(ballAngle)) * dt 
  ballY = ballY + (ballSpeed * math.sin(ballAngle)) * dt
  
  -- TODO 13: Move the player paddle getting the up and down arrows keys of the keyboard using the variable paddleSpeed -- Miquel
  
  if playerY > 0 then
    if love.keyboard.isDown("up") then
      playerY = playerY - paddleSpeed * dt; end end
    
  if playerY < love.graphics.getHeight() - 50 then
    if love.keyboard.isDown("down") then
      playerY = playerY + paddleSpeed * dt; end end
  
  -- TODO 14: Detect the ball collision with the player paddle and make it bounce -- Miquel
  --[[
  DeltaX = ballX - math.max(playerX, math.min(ballX, playerX + 10));
  DeltaY = ballY - math.max(playerY, math.min(ballY, playerY + 50));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (10 * 10) then
    ballSpeed = -ballSpeed
  end]]
  
  -- TODO 15: Detect the ball collision with the cpu paddle and make it bounce -- Miquel
  --[[
  DeltaX = ballX - math.max(cpuX, math.min(ballX, cpuX + 10));
  DeltaY = ballY - math.max(cpuY, math.min(ballY, cpuY + 50));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (10 * 10) then
    ballSpeed = -ballSpeed
  end]]
  
  -- TODO 25: Add the needed code at TODO 19 to make the ball quicker at paddle collision -- Miquel
  -- TODO 19: Comment all the code of the TODO 14 and TODO 15 and make it bounce using the new ball angle -- Miquel
  
  DeltaX = ballX - math.max(playerX, math.min(ballX, playerX + 10));
  DeltaY = ballY - math.max(playerY, math.min(ballY, playerY + 50));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (10 * 10) then
    ballAngle = math.pi-ballAngle
    ballSpeed = ballSpeed + 20
  end
  
  DeltaX = ballX - math.max(cpuX, math.min(ballX, cpuX + 10));
  DeltaY = ballY - math.max(cpuY, math.min(ballY, cpuY + 50));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (10 * 10) then
    ballAngle = math.pi-ballAngle
    ballSpeed = ballSpeed + 20
  end
  
  -- TODO 20: Detect the ball collision with the top and bottom of the field and make it bounce -- David
  
  if ballY > love.graphics.getHeight() - 10 or ballY < 10 then
    ballAngle = -ballAngle
  end
  
  -- TODO 26: Add the needed code at TODO 23 to reset the ball speed -- David  
  -- TODO 23: Detect the ball collision with the player and cpu sides, increse the points accordingly and reset the ball -- Miquel
  
  if ballX < playerX + 10 then
    cpuPoints = cpuPoints + 100
    ballX, ballY = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    ballSpeed = 300
  end
  
  if ballX > cpuX then
    playerPoints = playerPoints + 100
    ballX, ballY = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    ballSpeed = 300
  end
  
  -- TODO 24: Make the cpu paddle move to get the ball -- Miquel
  
  distance = ballY - cpuY - 25;
  direction = distance / math.abs(distance)
  
  if direction == 1 and cpuY < love.graphics.getHeight() - 50 then
    speed = math.min (paddleSpeed, (ballY - cpuY - 25) / (direction * dt))
    cpuY = cpuY + direction * speed * dt;
  elseif cpuY > 0 then
    speed = math.min (paddleSpeed, (ballY - cpuY - 25) / (direction * dt))
    cpuY = cpuY + direction * speed * dt;
  end
  
end

function love.draw()
  -- TODO 1: Draw the center of the field -- David
  
    love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2, love.graphics.getHeight());
    
  -- TODO 2: Draw the ball at the center of the field -- Miquel
  
  --love.graphics.circle("fill", love.graphics.getWidth()/2, love.graphics.getHeight()/2, 10)
  
  -- TODO 3: Draw the player and cpu paddles -- Miquel
  --[[
  love.graphics.rectangle("fill", 50, love.graphics.getHeight()/2 - 25, 10, 50);
  love.graphics.rectangle("fill", love.graphics.getWidth()-10-50, love.graphics.getHeight()/2 - 25, 10, 50);]]
  
  -- TODO 4: Draw the player and cpu points -- David
  --[[
  love.graphics.print(0, love.graphics.getWidth()/2 -100, 20, 0, 1, 1, 0, 0, 0, 0)
  love.graphics.print(0, love.graphics.getWidth()/2 +50, 20, 0, 1, 1, 0, 0, 0, 0)]]
  
  -- TODO 7: Comment all the code of the TODO 2 and use the ballX and ballY variables to draw the ball -- Miquel
  
  love.graphics.circle("fill", ballX, ballY, 10)
  
  -- TODO 11: Comment all the code of the TODO 3 and use the playerX, playerY, cpuX and cpuY variables to draw the player and cpu paddles -- Miquel
  
  love.graphics.rectangle("fill", playerX, playerY, 10, 50);
  love.graphics.rectangle("fill", cpuX, cpuY, 10, 50);
  
  -- TODO 22: Comment all the code of the TODO 4 and use the playerPoints and cpuPoints variables to draw the points -- David
  
  love.graphics.printf(playerPoints, love.graphics.getWidth()/2 - 250 , 20, 200, "right")
  love.graphics.printf(cpuPoints, love.graphics.getWidth()/2 + 60 , 20, 200, "left")
  
end