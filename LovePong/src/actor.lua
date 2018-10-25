Actor = Object:extend()

function Actor:new(image,x,y,width,height,speed,rotationSpeed,fx,fy, rot)
    self.image = love.graphics.newImage(image)
    self.position = Vector.new(x or 0, y or 0)
    self.scale = Vector.new(1,1)
    self.forward = Vector.new(fx or 1,fy or 0)
    self.speed = speed or 10
    self.rotationSpeed = rotationSpeed or 20
    self.origin = Vector.new(self.image:getWidth()/2 ,self.image:getHeight()/2)
    self.rot = 0 or rot
    self.height = height
    self.width  = width
end

function Actor:update(dt)
   
end

function Actor:draw()
  xx = self.position.x
  ox = self.origin.x
  yy = self.position.y
  oy = self.origin.y
  sx = self.scale.x
  sy = self.scale.y
  rr = self.rot
  love.graphics.draw(self.image,xx,yy,rr,sx,sy,ox,oy,0,0)
end

function Actor.dist(a,b)
  v=b.position - a.position
  return v:len()
end



