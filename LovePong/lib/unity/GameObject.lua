GameObject = Object:extend()

function GameObject:new(components, transform, spriteRenderer)
    self.transform = transform or Transform.new()
    self.spriteRenderer = spriteRenderer or SpriteRenderer.new()
    self.components = components
end

function GameObject:update(dt)
  for i,v in pairs(self.components) do
    v:update(dt,self)
  end
end

function GameObject:draw()
  self.spriteRenderer:draw(self)
end