
function love.load(arg)
  
  Object = require "lib/object"
  
  require "src/actor"
  require "src/game"
  require "src/ball"
  require "src/paddle"
  require "src/score"
  require "src/PlayerController"
  require "src/CpuController"
  require "lib/vector"
  require "data"

  game = Game()
end

function love.update(dt)
  
  game:update(dt)
  
end

function love.draw()
 
 game:draw()
 
end