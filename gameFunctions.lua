-- MY FUNCTIONS - - - -- - - -- 

function move(t) --moves the target
    t.y = t.y + speed
end

function distanceBetween (x1,y1,x2,y2) --distance between two points
    return math.sqrt(((x2-x1)^2) +((y2-y1)^2))
end

function createNewTarget() --generates new position for a new target
    local newTarget = {}
    newTarget.radius = math.random(20, MAX_RADIUS)
    newTarget.x = math.random(newTarget.radius, love.graphics.getWidth() - newTarget.radius)
    newTarget.y = -5
    
    newTarget.checked = false --tells if this target has already created a new one
    
    table.insert(targets, newTarget)
end

function configGame() --reset all variables to their initial values
    love.mouse.setCursor() --sets cursor to default
    targets = {}
    createNewTarget() --generates a new target in a random position

    score = 0
    health = 5
    speed = 2

    run = true --game's runnings
end

function restartButton() --draws restart button
    love.graphics.setColor(1,1,1)
    love.mouse.setCursor() --sets cursor to default
    
    if isOverRestartButton(love.mouse.getX(), love.mouse.getY()) then --hovering the button
        love.graphics.setColor(0.5,0.8,0.8) --changes the color
        love.mouse.setCursor(love.mouse.getSystemCursor("hand")) --sets cursor to pointer
    end

    love.graphics.print("Restart", RESTART_X, RESTART_Y)

end

function isOverRestartButton(x, y) -- checks if the given coordinate is inside the restart button
    return x <= RESTART_X + 150 and x > RESTART_X and y <= RESTART_Y + 40 and y > RESTART_Y
end