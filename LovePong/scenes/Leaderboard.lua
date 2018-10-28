Leaderboard = Object:extend()

function Leaderboard:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  self.leaderboardScores = {}
  
  -- GAME OBJECTS
  self.background = GameObject({},Transform(w/2,h/2),SpriteRenderer(orangebgPath))
  
  -- UI
  self.lbText = Text(w/2,50,-300,0,600,"center", font,"LEADERBOARD")
  self.submitButton = Button(self.ToMainMenu,w/2-100,h/2+150, smallFont,"Close")
  
  table.insert(self.lObjects, self.background)
  table.insert(self.lObjects, self.lbText)
  table.insert(self.lObjects, self.submitButton)
  
end

function Leaderboard:update(dt)
  
  for _,v in pairs(self.lObjects) do
    v:update(dt)
  end
  
end


function Leaderboard:draw()
    
  for _,v in pairs(self.lObjects) do
    v:draw()
  end
  
end

function Leaderboard:ToMainMenu()
  gameState = GameStates.mainMenu
  leaderboard:SaveScores()
  leaderboard = Leaderboard()
  game = Game()
end

function Leaderboard:LoadUpdateScores()
  
  self.file = io.open (leaderboardPath , "r")
  self.leaderboardScores = {}
  
  local i = 1
  local t_playerScore = {gameOver.playerName.value,tostring(game.playerScore.value)}
  local scoreLocated = false
  
  for line in self.file:lines() do
    
    local score = {}
    
    for contents in string.gmatch(line, "%S+") do
      table.insert(score,contents)
    end
    
    if tonumber(score[2]) < tonumber(t_playerScore[2]) and scoreLocated == false then
      table.insert(self.leaderboardScores,t_playerScore)
      local goText = Text(w/2-225,100+i*30,0,0,300,"right", smallFont, i..".   "..self.leaderboardScores[i][1].."    "..self.leaderboardScores[i][2], colors.BLUE)
      table.insert(self.lObjects,goText)
      i = i + 1
      scoreLocated = true
    end
    
    if (i <= 10) then

    table.insert(self.leaderboardScores,score)
    local goText = Text(w/2-225,100+i*30,0,0,300,"right", smallFont, i..".   "..self.leaderboardScores[i][1].."    "..self.leaderboardScores[i][2])
    table.insert(self.lObjects,goText)
    
    end
    
    i = i + 1
  
  end

  self.file:close()
  
end

function Leaderboard:LoadScores()
  
  self.file = io.open (leaderboardPath , "r")
  self.leaderboardScores = {}
  
  local i = 1
  
  for line in self.file:lines() do
    
    local score = {}
    
    for contents in string.gmatch(line, "%S+") do
      table.insert(score,contents)
    end
  
    table.insert(self.leaderboardScores,score)
    local goText = Text(w/2-225,100+i*30,0,0,300,"right", smallFont, i..".   "..self.leaderboardScores[i][1].."    "..self.leaderboardScores[i][2])
    table.insert(self.lObjects,goText)
    
    i = i + 1
  
  end

  self.file:close()
  
end

function Leaderboard:SaveScores()
  
  self.file = io.open (leaderboardPath , "w")
  
  data = ""
  
  for _,v in pairs(self.leaderboardScores) do
    data = data..v[1].." "..v[2].."\n"
  end
  
  data = data:sub(1, -2)
  
  self.file:write(data)
  
  self.file:close();
  
end

