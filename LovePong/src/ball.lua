Object = require "lib/object"

Ball = Object:extend()

function Ball:new()
  self.ballX = love.graphics.getWidth()/2
  self.ballY = love.graphics.getHeight()/2
  self.ballSpeed = 300
  self.ballAngle = math.pi - math.pi/4
end

function Ball:update(dt)
   
  -- MOVIMIENTO
  
  self.ballX = self.ballX + (self.ballSpeed * math.cos(self.ballAngle)) * dt 
  self.ballY = self.ballY + (self.ballSpeed * math.sin(self.ballAngle)) * dt
  
  -- COLISION CON LOS BORDES DEL CAMPO
  
  if self.ballY > love.graphics.getHeight() - 10 or self.ballY < 10 then
    self:horizontalBounce()
  end
  
end

function Ball:draw()
    
end

function Ball:checkSquareCollision(x, y, width, height)
    
  local DeltaX = self.ballX - math.max(x, math.min(self.ballX, x + width));
  local DeltaY = self.ballY - math.max(y, math.min(self.ballY, y + height));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (width * width) then
    return true
  end
  return false
end

function Ball:addSpeed(speed)
  self.ballSpeed = self.ballSpeed + speed
end

function Ball:verticalBounce()
  self.ballAngle = math.pi-self.ballAngle
end

function Ball:horizontalBounce()
  self.ballAngle = -self.ballAngle
end

