MainMenu = Object:extend()

local lObjects = {}

function MainMenu:new()
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- Enable the debugging with ZeroBrane Studio
  
  self.lObjects = {}
  
  -- GAME OBJECTS
  self.background = GameObject({},Transform(w/2,h/2),SpriteRenderer(bluebgPath))
  
  -- UI
  self.titleText = Text(w/2,50,-300,0,600,"center", titleFont,"PONG")
  self.playButton = Button(ToPlay,w/2-100,h/2, font,"Play")
  self.quitButton = Button(Quit,w/2-100,h/2+150, font,"Exit")
  
  table.insert(self.lObjects, self.background)
  table.insert(self.lObjects, self.playButton)
  table.insert(self.lObjects, self.quitButton)
  table.insert(self.lObjects, self.titleText)
  
end

function MainMenu:update(dt)
  
  for _,v in pairs(self.lObjects) do
    v:update(dt)
  end
  
end


function MainMenu:draw()
    
  for _,v in pairs(self.lObjects) do
    v:draw(dt)
  end
  
end

function ToPlay()
  gameState = GameStates.gameplay
end

function Quit()
  love.event.quit()
end
