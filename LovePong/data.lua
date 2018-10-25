w = love.graphics.getWidth()
h = love.graphics.getHeight()

-- PADDLE DATA

paddleWidth = 20
paddleHeight = 100
paddleSpeed = 350

-- PLAYER DATA

playerPath = "sprites/paddleblue.png"
playerInitPosX = 2*paddleWidth
playerInitPosY = h/2 - paddleHeight/2

-- CPU DATA

cpuPath = "sprites/paddle2.png"
cpuInitPosX = w-3*paddleWidth
cpuInitPosY = h/2 - paddleHeight/2

-- BALL DATA

ballPath = "sprites/ballwhite.png"
radius = 15
ballSpeed = 100
speedIncrease = 10

-- TEXT DATA

fontSize = 50
fontPath = "pong.ttf"

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

backgroundPath = "pongbg.png"

