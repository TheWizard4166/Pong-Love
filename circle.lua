Circle = Shape:extend()

function Circle:new(x, y, radius, vx)
    Circle.super.new(self,x, y)
    self.r = radius or 10
    self.vx = vx or -10 
    self.vy = 0
end

function Circle:bounceW() 
    self.vy = self.vy * (-1)
    if(self.vy > 0 ) then
        self.y = self.y + 5
    else
        self.y = self.y - 5
    end
end

function Circle:translate(x) 
    self.x = self.x + x
end

function Circle:bounce(rect) 
    self.vx = self.vx * (-1)
    self.vy = math.abs((self.y - rect:getCenter())/4)
    if(self.vy > 100) then
        self.vy = 100
    end
    if(self.y < rect:getCenter()) then
        self.vy = (-1)*self.vy
    end
    print(self.vy)
end

function Circle:recenter()
    self.x = wWidth/2
end

function Circle:update(dt)
    self.x = (self.x + (self.vx*dt))
    self.y = self.y + self.vy*dt*10
end

function Circle:draw()
    love.graphics.circle("fill", self.x, self.y, self.r)
end
