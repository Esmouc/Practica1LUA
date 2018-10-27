PlayerController = Object:extend()

function PlayerController:new()
  self.speed = paddleSpeed
end

function PlayerController:update(dt, gameobject)
  if gameobject.transform.position.y > 0 + paddleHeight/2 then
    if love.keyboard.isDown("up") then
      gameobject.transform.position.y = gameobject.transform.position.y - self.speed * dt; end end
    
  if gameobject.transform.position.y < h - paddleHeight/2 then
    if love.keyboard.isDown("down") then
      gameobject.transform.position.y = gameobject.transform.position.y + self.speed * dt; end end
end
