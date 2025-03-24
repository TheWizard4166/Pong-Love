Shape = Object:extend()

function Shape:new(x, y)
    self.x = x or wWidth/2
    self.y = y or wHeight/2
end

function Shape:update(dt) 
    self.x = self.x + self.speed*dt
end
