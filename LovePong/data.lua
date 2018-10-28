w = love.graphics.getWidth()
h = love.graphics.getHeight()

-- GAME DATA

scoreIncrement = 100
differenceToWin = 1000
leaderboardPath = "leaderboard/scores.txt"

-- PADDLE DATA

paddleWidth = 20
paddleHeight = 100
paddleSpeed = 700

-- PLAYER DATA

playerPath = "sprites/paddle2.png"
playerInitPosX = 3*paddleWidth
playerInitPosY = h/2 - paddleHeight/2

-- CPU DATA

cpuPath = "sprites/paddleblue.png"
cpuInitPosX = w-3*paddleWidth
cpuInitPosY = h/2 - paddleHeight/2

-- BALL DATA

ballBluePath = "sprites/ballblue.png"
ballWhitePath = "sprites/ballblue.png"
ballOrangePath = "sprites/ballorange.png"
radius = 15
ballSpeed = 300
speedIncrease = 30

-- TEXT DATA

titleFontSize = 200
fontSize = 50
smallfontSize = 30
fontPath = "font/D-DIN-Bold.otf"

-- PLAYER SCORE TEXT DATA

playerScrX = w/2
playerScrY = 20
playerScrXO = -250
playerScrYO = 0
playerScrSize = 200
playerScrAlign = "right"

-- CPU SCORE TEXT DATA

cpuScrX = w/2
cpuScrY = 20
cpuScrXO = 60
cpuScrYO = 0
cpuScrSize = 200
cpuScrAlign = "left"

-- BACKGROUND

bgPath = "sprites/pongbg.png"
bluebgPath = "sprites/bluebg.png"
orangebgPath = "sprites/orangebg.png"

-- COLORS

colors = {WHITE = {1,1,1,1}, GREY = {0.831, 0.831, 0.831, 1}, DARKGREY = {0.521, 0.521, 0.521,1}, BLACK = {0,0,0,1}, BLUE = {0.180,0.631,0.960,1}, RED = {1,0,0,1}}

--SOUNDS

pum = love.audio.newSource("sounds/pum.wav", "static")
clack = love.audio.newSource("sounds/clack.wav", "static")
clin = love.audio.newSource("sounds/clin2.wav", "static")

pitch = 1

pum:setVolume(0.7)
clin:setVolume(0.7)
