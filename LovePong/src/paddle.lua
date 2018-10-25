Paddle = Actor:extend()

function Paddle:new(image,x,y,width,height,speed,controller)
  Paddle.super.new(self,image,x,y,width,height,speed,0,0,1)
  self.controller = controller
end

function Paddle:update(dt)
  self.controller:update(dt,self)
end

function Paddle:draw()
  self.super.draw(self)
end
