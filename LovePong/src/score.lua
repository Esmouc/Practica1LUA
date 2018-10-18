Score = Object:extend()

function Score:new(x,y,xo,yo,limit,align, value)
  self.x = x
  self.y = y
  self.xo = xo
  self.yo = yo
  self.limit = limit
  self.align = align
  self.value = value or 0
end

function Score:update(dt)
  
end

function Score:draw()
  love.graphics.printf(self.value, self.x + self.xo , self.y + self.yo, self.limit, self.align)
end
