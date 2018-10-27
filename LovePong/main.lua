
GameStates = {mainMenu = 0, gameplay = 1}

function love.load(arg)
  
  --LIBRARIES
  Object = require "lib/object"
  require "lib/vector"
  
  -- SCENES
  require "scenes/Game"
  require "scenes/MainMenu"
  
  -- MAIN CLASSES
  require "lib/unity/GameObject"
  require "lib/unity/SpriteRenderer"
  require "lib/unity/Transform"
  
  -- UI
  require "src/UI/Text"
  require "src/UI/Button"
  
  -- COMPONENTS
  
  require "src/Components/BallScript"
  require "src/Components/PlayerController"
  require "src/Components/CpuController"
  
  -- GAME DATA
  
  require "data"
  
  -- LOAD FONTS
  titleFont = love.graphics.newFont(fontPath, titleFontSize)
  font = love.graphics.newFont(fontPath, fontSize)
  
  -- LOAD SCENES
  mainMenu = MainMenu()
  game = Game()
  
  -- SETTING GAME STATE
  gameState = GameStates.mainMenu
  
end

function love.update(dt)
  
  if (gameState == GameStates.mainMenu) then 
    mainMenu:update(dt)
  end
  if (gameState == GameStates.gameplay) then 
    game:update(dt)
  end
  
end

function love.draw()
 
  if (gameState == GameStates.mainMenu) then 
    mainMenu:draw(dt)
  end
  if (gameState == GameStates.gameplay) then 
    game:draw(dt)
  end
 
end