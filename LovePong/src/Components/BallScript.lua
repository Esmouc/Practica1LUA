BallScript = Object:extend()

function BallScript:new(image)
  self.speed = ballSpeed
end

function BallScript:update(dt, gameobject)
   
  -- MOVIMIENTO
  
  gameobject.transform.position = gameobject.transform.position + self.speed * gameobject.transform.forward * dt 
  
  -- COLISION CON LOS BORDES DEL CAMPO
  
  if gameobject.transform.position.y > h - gameobject.spriteRenderer.origin.y and gameobject.transform.forward.y > 0 then
    self:horizontalBounce(gameobject)
  end
  
  if gameobject.transform.position.y < gameobject.spriteRenderer.origin.y and gameobject.transform.forward.y < 0 then
    self:horizontalBounce(gameobject)
  end
  
  -- COLISION CON LOS PADDLES
  
  if self:checkSquareCollision (gameobject,game.player) then
    self:paddleHit(gameobject, ballOrangePath)
  end
  
  if self:checkSquareCollision (gameobject,game.cpu) then
    self:paddleHit(gameobject, ballBluePath)
  end
  
  -- MUERTE
  
  if gameobject.transform.position.x < 0 then
    game.cpuScore.value = game.cpuScore.value + scoreIncrement
    gameobject.transform.position.x, gameobject.transform.position.y = w/2, h/2
    self.speed = ballSpeed
  end
  
  if gameobject.transform.position.x > w  then
    game.playerScore.value = game.playerScore.value + scoreIncrement
    gameobject.transform.position.x, gameobject.transform.position.y = w/2, h/2
    self.speed = ballSpeed
  end
  
end

function BallScript:checkSquareCollision(gameobject,object)
  
  DeltaX = gameobject.transform.position.x - math.max(object.transform.position.x-object.spriteRenderer.origin.x, math.min(gameobject.transform.position.x, object.transform.position.x + object.spriteRenderer.origin.x));
  DeltaY = gameobject.transform.position.y - math.max(object.transform.position.y-object.spriteRenderer.origin.y, math.min(gameobject.transform.position.y, object.transform.position.y + object.spriteRenderer.origin.y));
  
  if (DeltaX * DeltaX + DeltaY * DeltaY) < (gameobject.spriteRenderer.origin.x * gameobject.spriteRenderer.origin.x) then
    return true
  end
  return false
  
end

function BallScript:paddleHit(gameobject, newImagePath)
  gameobject.spriteRenderer:changeImage(newImagePath)
  self:addSpeed(speedIncrease)
  self:verticalBounce(gameobject)
end

function BallScript:addSpeed(speed)
  self.speed = self.speed + speed
end

function BallScript:verticalBounce(gameobject)
  gameobject.transform.forward.x = -gameobject.transform.forward.x
end

function BallScript:horizontalBounce(gameobject)
  gameobject.transform.forward.y = -gameobject.transform.forward.y
end

