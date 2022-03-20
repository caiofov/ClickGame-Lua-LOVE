function love.load() --runs imediately when the game loads (setups)
    target = {}
    target.x = 0
    target.y = 0
    target.radius = 50

    score = 0
    timer = 0

    gameFont = love.graphics.newFont(40) -- fontsize
end

function love.update(dt) --game loop

end

function love.draw() --draws on the screen (similar to update, but involving graphics)
    -- love.graphics.setColor(0,1,0) --sets the color of the following shapes
    
    -- love.graphics.rectangle("fill", 0, 0, 200, 100)
    -- -- "fill" -> filled | "line" -> outline
    -- -- x, y, width, height
    -- love.graphics.setColor(255/255, 102/255, 153/255)
    -- love.graphics.circle("fill", 300, 200, 100)
    -- -- x, y (center), radius
    
    love.graphics.setColor(0.5,0.5,0)
    love.graphics.circle("fill", target.x, target.y, target.radius)
    
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0) --prints the value of score
end

function love.mousepressed( x, y, button, istouch, pressed) --runs this function when the mouse is pressed
    --istouch and pressed are for mobile devices

    if button == 1 then --left button
        local mouseToTarget = distanceBetween(target.x, target.y, x, y)
        if mouseToTarget < target.radius then
            score = score + 1
        end
    end

end

function distanceBetween (x1,y1,x2,y2)
    return math.sqrt(((x2-x1)^2) +((y2-y1)^2))
end