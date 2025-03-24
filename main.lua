-- Window Parameters
wHeight = 920 
wWidth = 1200
love.window.setMode(wWidth, wHeight)

function collision(a, b)
    if(a:is(Circle) and b:is(Rectangle)) then
        local a_left = a.x - a.r
        local a_right = a.x + a.r
        local a_top = a.y - a.r
        local a_bottom = a.y + a.r

        local b_left = b.x
        local b_right = b.x + b.width
        local b_top = b.y
        local b_bottom = b.y + b.height

        return (a_right > b_left and a_left < b_right and a_bottom > b_top and a_top < b_bottom)
    end
    return false
end

function topBottomWall(a) 
    return (a.y - a.r <= 0) or (a.y + a.r >= wHeight)
end

function outOfBoundsCirc(a)
    return (a.x - a.r <= p1.width/2) or (a.x + a.r >= wWidth - aiRect.width/2)
end

function love.load()
    -- Class objects
    Object = require("classic")
    require("shape")
    require("rectangle")
    require("circle")
    -- Game Values 
    p1 = Rectangle(0, wHeight/2, 25, 200, 300)
    aiRect = Rectangle(wWidth - 25, wHeight/2, 25, 200, 200)
    ball = Circle(wWidth/2, wHeight/2, 25, -300)
end

function love.update(dt)
    if love.keyboard.isDown("left") and p1.y > 5 then
        p1:update(dt, 1)
    end
    if love.keyboard.isDown("right") and p1.y + p1.height < wHeight-5 then
        p1:update(dt, -1)
    end
    if (collision(ball, p1) == false) and (collision(ball, aiRect) == false) and (topBottomWall(ball) == false) then
        ball:update(dt)
    elseif collision(ball, p1) then
        ball:bounce(p1)
        ball:translate(p1.width/10)
        ball:update(dt)
    elseif collision(ball, aiRect) then
        ball:bounce(aiRect)
        ball:translate(-1*aiRect.width/10)
        ball:update(dt)
    elseif topBottomWall(ball) then
        ball:bounceW()
        ball:update(dt)
    end
    if outOfBoundsCirc(ball) then
        ball:recenter() 
    end
    if (ball.y + 30 > aiRect:getCenter()) and (ball.y - 30 < aiRect:getCenter()) then
        aiRect:update(dt, 0) 
    elseif (ball.y + 30 > aiRect:getCenter()) and (aiRect:getCenter() < wHeight - aiRect.height/2) then
        aiRect:update(dt, -1)
    elseif (ball.y - 30 < aiRect:getCenter()) and aiRect:getCenter() > aiRect.height/2 then
        aiRect:update(dt,  1)
    end
end

function love.draw()
    p1:draw()
    aiRect:draw()
    ball:draw()
end

