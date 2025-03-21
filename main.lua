function rectCollision(a, b)
    return b.x <= a.x + a.width and a.x <= b.x + b.width and b.y <= a.y + a.height and a.y <= b.y + b.height
end

function circleRectCollision(circ, rect)
    return rect.x <= circ.x + circ.r and rect.x <= circ.x + circ.r  and circ.x - circ.r <= rect.x + rect.width and rect.y <= circ.y + circ.r and circ.y - circ.r <= rect.y + rect.height
end

function outOfBoundsCirc(a)
    return a.x - a.r >= wWidth and a.x + a.r <= wWidth and a.y + a.r <= wHeight and a.y - a.r >= wHeight
end

function love.load()
    Object = require("classic")
    require("shape")
    require("rectangle")
    require("circle")
    -- 
    wHeight = 920 
    wWidth = 1200
    love.window.setMode(wWidth, wHeight)
    speed = wHeight / 2   
    playerRect = Rectangle("fill", 0, wHeight/2, 50, 200)
    aiRect = Rectangle("fill", wWidth - 50, wHeight/2, 50, 200)
    ball = circle("fill", wWidth/2, wHeight/2, 25)
end

function love.update(dt)
    if love.keyboard.isDown("left") and playerRect.y > 0 then
        playerRect.y = playerRect.y - speed*dt  
    end
    if love.keyboard.isDown("right") and playerRect.y + playerRect.height < wHeight then
        playerRect.y = playerRect.y + speed*dt  
    end
    if (circleRectCollision(ball, playerRect) == false) and (circleRectCollision(ball, aiRect) == false) then
        ball.x = ball.x + ball.vx 
    else
        ball.vx = ball.vx * -1
        ball.x = ball.x + ball.vx 
    end
    if outOfBoundsCirc(ball) then
        ball.x = wWidth/2
        ball.vx = ball.vx * -1
    end
end

function love.draw()
    love.graphics.rectangle("fill", playerRect.x, playerRect.y, playerRect.width, playerRect.height)
    love.graphics.rectangle("fill", aiRect.x, aiRect.y, aiRect.width, aiRect.height)
    love.graphics.circle("fill", ball.x, ball.y, ball.r)
end

