function loadMenu()
    menu = true
    run = false
    
    setDefaultVariables()
    populateBackgroundCircles()
end

function updateFallingBallsBackground()
    for key, circle in pairs(backgroundCircles) do
        circle.y = circle.y + speed --moves the circle
        
        if circle.y > love.graphics.getHeight() + circle.radius then --if the circle is out of the screen
            table.remove(backgroundCircles, key) --removes the current circle
        
        elseif circle.y > love.graphics.getHeight()/2 and not circle.check then --creating a new circle for this height
            createNewTarget(backgroundCircles, true)
            circle.check = true
        end
    end
end

function populateBackgroundCircles()
    backgroundCircles = {}
    for i = 1,5,1 
    do 
       newCircle = createNewTarget(backgroundCircles, true)
    end
end

function configGameOver()
    run = false --stop running the game itself
    targets = {} --deletes all targets
    
    setDefaultVariables()
    populateBackgroundCircles()
    
    if score > HIGHEST_SCORE then
        saveHighestScore(score)
        isHighest = true
    end
end
