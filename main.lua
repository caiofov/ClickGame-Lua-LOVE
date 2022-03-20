
require "gameFunctions"

-- LOVE2D FUNCTIONS - - -- - - -

function love.load() --runs imediately when the game loads (setups)
    MAX_RADIUS = 50
    
    -- fontsizes
    gameFont = love.graphics.newFont(40) 
    gameOverFont = love.graphics.newFont(100)
    
    configGame()
end

function love.update(dt) --game loop
    if health <=0 then
        run = false
        targets = {} --deletes all targets
    end
    if run then
        for key, target in pairs(targets) do
            move(target)
            
            if target.y > love.graphics.getHeight() + target.radius then --if the target is out of the screen
                health = health - 1 --decreases the health
                table.remove(targets, key) --removes the current target
            
            elseif target.y > 3*love.graphics.getHeight()/4 and not target.check then --creating a new target for this height
                createNewTarget()
                target.check = true

            end
        end
    end
end

function love.draw() --draws on the screen (similar to update, but involving graphics)
    if run then
        love.graphics.setColor(0.5,0.5,0) --sets the color of the following shapes
        
        for key, target in pairs(targets) do
            love.graphics.circle("fill", target.x, target.y, target.radius)
            -- "fill" -> filled | "line" -> outline 
            -- x, y (center), radius
        end
        
        love.graphics.setColor(1,1,1)
        love.graphics.setFont(gameFont)
        love.graphics.print("Score: " .. tostring(score), 0, 0) --prints the value of score
        love.graphics.print("Health: " .. tostring(health), 0, 45)
    
    else
        love.graphics.setFont(gameOverFont)
        love.graphics.print("GAME OVER :(", 50, love.graphics.getHeight()/2 - 100)
        
        love.graphics.setFont(gameFont)
        love.graphics.print("Score: " .. tostring(score), love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2)
    end
end

function love.mousepressed(x, y, button, istouch, pressed) --runs this function when the mouse is pressed
    --istouch and pressed are for mobile devices
    if run then
        if button == 1 then --left button
            local clickedProperly = false --tells if the player has clicked inside any circle
            
            for key, target in pairs(targets) do
                
                local mouseToTarget = distanceBetween(target.x, target.y, x, y)
                
                if mouseToTarget < target.radius then
                    clickedProperly = true
                    
                    --increases the score and the speed
                    score = score + 1
                    speed = speed + 0.1
                    
                    table.remove(targets, key) --removes the current target from the list
                    createNewTarget() --creates a new target
                    break
                end
            end

            if not clickedProperly then -- decreases health, because the player didn't click properly
                health = health - 1
            end
        end
    end

end