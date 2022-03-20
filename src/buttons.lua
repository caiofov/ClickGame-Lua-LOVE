
function createButtons()
    --restart button
    restartButton = {}
    restartButton.x = love.graphics.getWidth()/2 - 90
    restartButton.y = love.graphics.getHeight()/2 + 125
    restartButton.paddingY = 50
    restartButton.paddingX = 100
    restartButton.fontSize = gameFont
    restartButton.text = "Restart"
    restartButton.action = configGame

    startButton = {}
    startButton.x = love.graphics.getWidth()/2 - 70
    startButton.y = love.graphics.getHeight()/2 + 125
    startButton.paddingY = 50
    startButton.paddingX = 100
    startButton.fontSize = gameFont
    startButton.text = "Start"
    startButton.action = configGame
end

function drawButton(button)
    love.graphics.setFont(button.fontSize)
    love.graphics.setColor(1,1,1)
    love.mouse.setCursor() --sets cursor to default
    
    if isOverButton(button, love.mouse.getX(), love.mouse.getY()) then
        love.graphics.setColor(0.5,0.8,0.8) --changes the color
        love.mouse.setCursor(love.mouse.getSystemCursor("hand")) --sets cursor to pointer
    end
    
    love.graphics.print(button.text, button.x, button.y)
end

function isOverButton(button, posX, posY)
    return posX <= button.x + button.paddingX and posX > button.x and posY <= button.y + button.paddingY and posY > button.y
end
