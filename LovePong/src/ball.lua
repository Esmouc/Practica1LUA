Ball = Actor:extend()

function Ball:new(image)
  Ball.super.new(self,image,w/2,h/2,radius,radius,ballSpeed,0)
  self.forward = Vector.new(-1,1):normalize()
end

function Ball:update(dt)
   
  -- MOVIMIENTO
  
  self.position = self.position + self.speed * self.forward * dt 
  
  -- COLISION CON LOS BORDES DEL CAMPO
  
  if self.position.y > h - self.width and self.forward.y > 0 then
    self:horizontalBounce()
  end
  
  if self.position.y < self.width and self.forward.y < 0 then
    self:horizontalBounce()
  end
  
  -- COLISION CON LOS PADDLES
  
  if self:checkSquareCollision (game.player) or self:checkSquareCollision (game.cpu) then
    self:addSpeed(speedIncrease)
    self:verticalBounce()
  end
  
  -- MUERTE
  
  if self.position.x < 0 then
    game.cpuScore.value = game.cpuScore.value + scoreIncrement
    self.position.x, self.position.y = w/2, h/2
    speed = ballSpeed
  end
  
  if self.position.x > w  then
    game.playerScore.value = game.playerScore.value + scoreIncrement
    self.position.x, self.position.y = w/2, h/2
    speed = ballSpeed
  end
  
end

function Ball:draw()
  self.super.draw(self)
end

function Ball:checkSquareCollision(object)
  
  DeltaX = self.position.x - math.max(object.position.x-object.origin.x, math.min(self.position.x, object.position.x + object.width/2));
  DeltaY = self.position.y - math.max(object.position.y-object.origin.y, math.min(self.position.y, object.position.y + object.height/2));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (self.width * self.width) then
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

