function newRandomColor() --creates a new color
    local newColor = {}
    newColor.r = math.random() + math.random(0, 1)
    newColor.g = math.random() + math.random(0, 1)
    newColor.b = math.random() + math.random(0, 1)
    newColor.count = 0 --a "timer" for changing the color
    
    return newColor
end

function changeColor() --changes the color randomly
    if color.count > 20 then
        color = newRandomColor()
    else
        color.count = color.count + 1
    end
    love.graphics.setColor(color.r,color.g, color.b)
end
