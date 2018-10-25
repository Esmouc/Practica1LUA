CpuController = Object:extend()

function CpuController:new()
  
end

function CpuController:update(dt, object)
  local distance = game.ball.position.y - game.cpu.position.y;
  local direction = distance / math.abs(distance)
  
  if direction == 1 and game.cpu.position.y < h - game.cpu.height/2 then
    local speed = math.min (game.cpu.speed, (game.ball.position.y - game.cpu.position.y) / (direction * dt))
    game.cpu.position.y = game.cpu.position.y + direction * speed * dt;
  elseif game.cpu.position.y > 0 + game.cpu.height/2 then
    local speed = math.min (game.cpu.speed, (game.ball.position.y - game.cpu.position.y) / (direction * dt))
    game.cpu.position.y = game.cpu.position.y + direction * speed * dt;
  end
end