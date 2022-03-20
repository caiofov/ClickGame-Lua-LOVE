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
    targets = {}
    createNewTarget() --generates a new target in a random position

    score = 0
    health = 5
    speed = 2

    run = true --game's runnings
end
