Game = Object:extend()

local w, h

local lObjects = {}

function Game:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  self.ball = Ball()
  self.player = Paddle(50, love.graphics.getHeight()/2 - 25, 10, 50, 350, PlayerController())
  self.cpu = Paddle(love.graphics.getWidth()-10-50, love.graphics.getHeight()/2 - 25, 10, 50, 350,CpuController())
  self.playerScore = Score(love.graphics.getWidth()/2,20,-250,0,200,"right")
  self.cpuScore = Score(love.graphics.getWidth()/2,20,60,0,200,"left")
  
  table.insert(self.lObjects, self.ball)
  table.insert(self.lObjects, self.player)
  table.insert(self.lObjects, self.cpu)
  table.insert(self.lObjects, self.playerScore)
  table.insert(self.lObjects, self.cpuScore)
  
  font = love.graphics.newFont("pong.ttf",50)
  love.graphics.setFont(font)
  
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
  
  love.graphics.line(love.graphics.getWidth()/2, 0, love.graphics.getWidth()/2, love.graphics.getHeight());
  
end
