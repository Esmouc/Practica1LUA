CpuController = Object:extend()

function CpuController:new()
   self.speed = paddleSpeed
end

function CpuController:update(dt, gameobject)
  local distance = game.ball.transform.position.y - gameobject.transform.position.y;
  local direction = distance / math.abs(distance)
  
  if direction == 1 then
    if gameobject.transform.position.y < h - gameobject.spriteRenderer.origin.y then
      local speed = math.min (self.speed, (game.ball.transform.position.y - gameobject.transform.position.y) / (direction * dt))
      gameobject.transform.position.y = gameobject.transform.position.y + speed * dt;
    end
  else
    if gameobject.transform.position.y > 0 + gameobject.spriteRenderer.origin.y then
      local speed = math.min (self.speed, (game.ball.transform.position.y - gameobject.transform.position.y) / (direction * dt))
      gameobject.transform.position.y = gameobject.transform.position.y - speed * dt;
    end
  end
end