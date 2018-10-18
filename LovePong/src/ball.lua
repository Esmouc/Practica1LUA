Ball = Actor:extend()

function Ball:new()
  Ball.super.new(self,love.graphics.getWidth()/2,love.graphics.getHeight()/2,10,10,300,0)
  self.forward = Vector.new(-1,1):normalize()
end

function Ball:update(dt)
   
  -- MOVIMIENTO
  
  self.position = self.position + self.speed * self.forward * dt 
  
  -- COLISION CON LOS BORDES DEL CAMPO
  
  if self.position.y > love.graphics.getHeight() - 10 or self.position.y < 10 then
    self:horizontalBounce()
  end
  
  -- COLISION CON LOS PADDLES
  
  if self:checkSquareCollision (game.player) or self:checkSquareCollision (game.cpu) then
    self:addSpeed(10)
    self:verticalBounce()
  end
  
  -- MUERTE
  
  if self.position.x < 0 then
    game.cpuScore.value = game.cpuScore.value + 100
    self.position.x, self.position.y = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    speed = 300
  end
  
  if self.position.x > love.graphics.getWidth()  then
    game.playerScore.value = game.playerScore.value + 100
    self.position.x, self.position.y = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    speed = 300
  end
  
end

function Ball:draw()
    love.graphics.circle("fill", self.position.x, self.position.y, self.width)
end

function Ball:checkSquareCollision(object)
  local DeltaX = self.position.x - math.max(object.position.x, math.min(self.position.x, object.position.x + object.width));
  local DeltaY = self.position.y - math.max(object.position.y, math.min(self.position.y, object.position.y + object.height));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (object.width * object.width) then
    return true
  end
  return false
  
end

function Ball:addSpeed(speed)
  self.ballSpeed = self.speed + speed
end

function Ball:verticalBounce()
  self.forward.x = -self.forward.x
end

function Ball:horizontalBounce()
  self.forward.y = -self.forward.y
end

