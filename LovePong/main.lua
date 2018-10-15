require "src/game"

game = Game()

function love.load(arg)
  
end

function love.update(dt)
  
  game:update(dt)
  
end

function love.draw()
 
 game:draw()
 
end