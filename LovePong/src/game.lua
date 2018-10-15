Object = require "lib/object"

require "src/ball"
require "src/paddle"
require "src/score"

Game = Object:extend()

local lObjects = {}

function Game:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  self.ball = Ball()
  self.player = Paddle()
  self.cpu = Paddle()
  
  table.insert(self.lObjects, self.ball)
  table.insert(self.lObjects, self.player)
  table.insert(self.lObjects, self.cpu)
  
end

function Game:update(dt)
  
  for _,v in pairs(self.lObjects) do
    v:update(dt)
  end
  
end


function Game:draw()
    
  for _,v in pairs(self.lObjects) do
    v:draw(dt)
  end
  
end
