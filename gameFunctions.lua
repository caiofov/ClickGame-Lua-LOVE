require "src.screens"
require "src.buttons"
require "src.targets"
require "src.color"

-- MY FUNCTIONS - - - -- - - -- 
function configGame() --reset all variables to their initial values
    love.mouse.setCursor() --sets cursor to default
    targets = {}
    createNewTarget(targets, false) --generates a new target in a random position

    score = 0
    health = 5
    setDefaultVariables()
    
    loadHighestScore()
    isHighest = false

    run = true --game's runnings
    menu = false
end

function setDefaultVariables()
    speed = 2
    color = newRandomColor()
end


function loadHighestScore() --loads the highest score from the file
    local file = io.open("highest_score.txt", "r")
    HIGHEST_SCORE = tonumber(file:read("*all"))
    file:close()
end

function saveHighestScore(new_record) --saves the highest score
    local file = io.open("highest_score.txt", "w")
    file:write(new_record)
    file:close()
end


