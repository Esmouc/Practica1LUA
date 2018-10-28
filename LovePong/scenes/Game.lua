Game = Object:extend()

function Game:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  -- GAME OBJECTS
  self.ball = GameObject({BallScript()},Transform(w/2,h/2,-1,1),SpriteRenderer(ballBluePath))
  self.background = GameObject({},Transform(w/2,h/2),SpriteRenderer(bgPath))
  self.player = GameObject({PlayerController()},Transform(playerInitPosX,playerInitPosY),SpriteRenderer(playerPath))
  self.cpu = GameObject({CpuController()},Transform(cpuInitPosX,cpuInitPosY),SpriteRenderer(cpuPath))
  
  -- UI
  self.playerScore = Text(playerScrX,playerScrY,playerScrXO,playerScrYO,playerScrSize,playerScrAlign)
  self.cpuScore = Text(cpuScrX,cpuScrY,cpuScrXO,cpuScrYO,cpuScrSize,cpuScrAlign)
  
  table.insert(self.lObjects, self.background)
  table.insert(self.lObjects, self.ball)
  table.insert(self.lObjects, self.player)
  table.insert(self.lObjects, self.cpu)
  table.insert(self.lObjects, self.playerScore)
  table.insert(self.lObjects, self.cpuScore)
  
end

function Game:update(dt)
  
  for _,v in pairs(self.lObjects) do
    v:update(dt)
  end
  
end


function Game:draw()
    
  for _,v in pairs(self.lObjects) do
    v:draw()
  end
  
end

function Game:ToGameOver()
  gameOver = GameOver()
  gameState = GameStates.gameover
end
    
