function createNewTarget(listOfTargets, randomY) --generates new position for a new target
    local newTarget = {}
    newTarget.radius = math.random(20, MAX_RADIUS)
    newTarget.x = math.random(newTarget.radius, love.graphics.getWidth() - newTarget.radius)
    if randomY then
        newTarget.y = math.random(-400,-5)
    else
        newTarget.y = -5
    end
    
    newTarget.checked = false --tells if this target has already created a new one
    
    table.insert(listOfTargets, newTarget)

end
function drawTargets(listOfTargets)
    for key, target in pairs(listOfTargets) do
        love.graphics.circle("fill", target.x, target.y, target.radius)
        -- "fill" -> filled | "line" -> outline 
        -- x, y (center), radius
    end
end
function distanceBetween (x1,y1,x2,y2) --distance between two points
    return math.sqrt(((x2-x1)^2) +((y2-y1)^2))
end

