GameOver = Object:extend()

function GameOver:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  -- GAME OBJECTS
  self.background = GameObject({},Transform(w/2,h/2),SpriteRenderer(orangebgPath))
  
  -- UI
  self.goText = Text(w/2,50,-300,0,600,"center", font,"GAME OVER")
  self.playerName = Text(w/2-180,150,0,0,200,"right", font,"name",colors.GREY)
  self.typeInfo = Text(w/2,300,-300,0,600,"center", smallDont,"Type your name")
  self.playerScore = Text(w/2+40,150,0,0,1000,"left", font,game.playerScore.value)
  self.submitButton = Button(self.ToLeaderboard,w/2-100,h/2+150, smallFont,"Submit")  
 
  table.insert(self.lObjects, self.background)
  table.insert(self.lObjects, self.playerScore)
  table.insert(self.lObjects, self.playerName)
  table.insert(self.lObjects, self.typeInfo)
  table.insert(self.lObjects, self.goText)
  table.insert(self.lObjects, self.submitButton)
  
end

function GameOver:update(dt)
  
  for _,v in pairs(self.lObjects) do
    v:update(dt)
  end
  
end


function GameOver:draw()
    
  for _,v in pairs(self.lObjects) do
    v:draw()
  end
  
end

function GameOver:ToLeaderboard()
  leaderboard:LoadUpdateScores()
  gameState = GameStates.leaderboard
end

function love.textinput(t)
    if (gameOver.playerName.value == "name") then
      gameOver.playerName.value = ""
    end
    gameOver.playerName.value =  gameOver.playerName.value..t
end



