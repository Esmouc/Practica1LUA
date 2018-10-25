Game = Object:extend()

local lObjects = {}

function Game:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  self.ball = Ball(ballPath)
  self.player = Paddle(playerPath,playerInitPosX, playerInitPosY, paddleWidth, paddleHeight, paddleSpeed, PlayerController())
  self.cpu = Paddle(cpuPath,cpuInitPosX, cpuInitPosY, paddleWidth, paddleHeight, paddleSpeed,CpuController())
  self.playerScore = Score(playerScrX,playerScrY,playerScrXO,playerScrYO,playerScrSize,playerScrAlign)
  self.cpuScore = Score(cpuScrX,cpuScrY,cpuScrXO,cpuScrYO,cpuScrSize,cpuScrAlign)
  
  table.insert(self.lObjects, self.ball)
  table.insert(self.lObjects, self.player)
  table.insert(self.lObjects, self.cpu)
  table.insert(self.lObjects, self.playerScore)
  table.insert(self.lObjects, self.cpuScore)
  
  font = love.graphics.newFont(fontPath, fontSize)
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
  
end
