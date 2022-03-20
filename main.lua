function love.load() --runs imediately when the game loads (setups)
    target = {}
    target.x = 100
    target.y = 100
    target.radius = 50

    score = 0
    timer = 0
    health = 5
    speed = 2
    level = 1

    gameFont = love.graphics.newFont(40) -- fontsize
end

function love.update(dt) --game loop
    target.y = target.y + speed

    if target.y > love.graphics.getHeight() + target.radius then
        health = health - 1
        newTarget()
    end
    checkLevel() --updates the speed, if necessary
end

function love.draw() --draws on the screen (similar to update, but involving graphics)
    
    love.graphics.setColor(0.5,0.5,0) --sets the color of the following shapes
    love.graphics.circle("fill", target.x, target.y, target.radius)
    -- "fill" -> filled | "line" -> outline 
    -- x, y (center), radius

    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. tostring(score), 0, 0) --prints the value of score
    love.graphics.print("Health: " .. tostring(health), 0, 45)
end

function love.mousepressed( x, y, button, istouch, pressed) --runs this function when the mouse is pressed
    --istouch and pressed are for mobile devices

    if button == 1 then --left button
        local mouseToTarget = distanceBetween(target.x, target.y, x, y)
        if mouseToTarget < target.radius then
            score = score + 1
            newTarget()
        else
            health = health - 1
        end
    end

end

function distanceBetween (x1,y1,x2,y2)
    return math.sqrt(((x2-x1)^2) +((y2-y1)^2))
end

function newTarget() --generates new position for a new target
    target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
    target.y = math.random(0, love.graphics.getHeight()/4)
end

function checkLevel() --checks if the score is high enough to increase the speed
    if score % level * 10 > 1 then
        speed = speed + 2
        level =  level + 1
    end
end
