PlayerController = Object:extend()

function PlayerController:new()
  
end

function PlayerController:update(dt, object)
  if object.position.y > 0 + paddleHeight/2 then
    if love.keyboard.isDown("up") then
      object.position.y = object.position.y - object.speed * dt; end end
    
  if object.position.y < h - paddleHeight/2 then
    if love.keyboard.isDown("down") then
      object.position.y = object.position.y + object.speed * dt; end end
end
