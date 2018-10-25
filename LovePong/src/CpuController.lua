CpuController = Object:extend()

function CpuController:new()
  
end

function CpuController:update(dt, object)
  local distance = game.ball.position.y - object.position.y;
  local direction = distance / math.abs(distance)
  
  if direction == 1 then
    if object.position.y < h - object.height/2 then
      local speed = math.min (object.speed, (game.ball.position.y - object.position.y) / (direction * dt))
      object.position.y = object.position.y + speed * dt;
    end
  else
    if object.position.y > 0 + object.height/2 then
      local speed = math.min (object.speed, (game.ball.position.y - object.position.y) / (direction * dt))
      object.position.y = object.position.y - speed * dt;
    end
  end
end