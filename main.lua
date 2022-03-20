
require "gameFunctions"

-- LOVE2D FUNCTIONS - - -- - - -

function love.load() --runs imediately when the game loads (setups)
    --setting constrains
    MAX_RADIUS = 50 --max circle radius
    
    -- fontsizes
    gameFont = love.graphics.newFont(40) 
    gameOverFont = love.graphics.newFont(100)

    createButtons()
    
    loadMenu()
end

function love.update(dt) --game loop
    if run then
        if health <=0 then
            configGameOver()
        end
        for key, target in pairs(targets) do
            target.y = target.y + speed --moves the target
            
            if target.y > love.graphics.getHeight() + target.radius then --if the target is out of the screen
                health = health - 1 --decreases the health
                table.remove(targets, key) --removes the current target
            
            elseif target.y > 3*love.graphics.getHeight()/4 and not target.check then --creating a new target for this height
                createNewTarget(targets, false)
                target.check = true

            end
        end
    else --if it in the main menu screen or game over screen, both needs the falling balls background
        updateFallingBallsBackground()
end

function love.draw() --draws on the screen (similar to update, but involving graphics)
    if run then
        changeColor()
        
        drawTargets(targets)
        
        love.graphics.setColor(1,1,1)
        love.graphics.setFont(gameFont)
        love.graphics.print("Score: " .. tostring(score), 0, 0) --prints the value of score
        love.graphics.print("Health: " .. tostring(health), 0, 45)
    
    
    elseif menu then -- menu screen
        changeColor()
        drawTargets(backgroundCircles) --background

        love.graphics.setFont(gameOverFont)
        love.graphics.print("Falling Circles", 50, love.graphics.getHeight()/2 - 100)
        
        drawButton(startButton)
        
    
    else --game over screen
        changeColor()
        drawTargets(backgroundCircles)
        
        love.graphics.setColor(1,1,1)
        love.graphics.setFont(gameOverFont)
        
        love.graphics.print("GAME OVER :(", 50, love.graphics.getHeight()/2 - 100)
        
        love.graphics.setFont(gameFont)
        love.graphics.print("Score: " .. tostring(score), love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2 + 25)
        
        if isHighest then
            changeColor()
            love.graphics.print("New record!", love.graphics.getWidth()/2 - 130, love.graphics.getHeight()/2 + 75)
        else
            love.graphics.print("Highest score: " .. tostring(HIGHEST_SCORE), love.graphics.getWidth()/2 - 170, love.graphics.getHeight()/2 + 75)
        end
        
        
        drawButton(restartButton) --drawing restart BUTTON
    end
end

function love.mousepressed(x, y, button, istouch, pressed) --runs this function when the mouse is pressed
    --istouch and pressed are for mobile devices
    if button == 1 then --left button
        if run then
                local clickedProperly = false --tells if the player has clicked inside any circle
                
                for key, target in pairs(targets) do
                    
                    local mouseToTarget = distanceBetween(target.x, target.y, x, y)
                    
                    if mouseToTarget <= target.radius then
                        clickedProperly = true
                        
                        --increases the score and the speed
                        score = score + 1
                        speed = speed + 0.1
                        
                        table.remove(targets, key) --removes the current target from the list
                        createNewTarget(targets, false) --creates a new target
                        break
                    end
                end

                if not clickedProperly then -- decreases health, because the player didn't click properly
                    health = health - 1
                end
            
        elseif menu then
            if isOverButton(startButton, x, y) then --restarts the game
                startButton.action()
            end
        else
            if isOverButton(restartButton, x, y) then
                restartButton.action()
            end
        end
    end

end
end