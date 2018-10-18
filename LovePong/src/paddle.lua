Paddle = Actor:extend()

function Paddle:new(x,y,width,height,speed,controller)
  Paddle.super.new(self,x,y,width,height,speed,0,0,1)
  self.controller = controller
end

function Paddle:update(dt)
  self.controller:update(dt,self)
end

function Paddle:draw()
  love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height);  
end
