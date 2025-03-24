Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height, vx)
    Rectangle.super.new(self, x, y)
    self.width = width or 10
    self.height = height or 10
    self.vx = vx or 500
end

function Rectangle:getCenter() 
    return self.y + self.height/2
end

function Rectangle:update(dt, di) 
    self.y = self.y - self.vx*dt*di
end

function Rectangle:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
