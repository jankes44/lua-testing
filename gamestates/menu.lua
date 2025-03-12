local Button = require "ui.button"  -- Adjust the path if you stored it in a subfolder like "ui/Button.lua"

local menu = {}

local startButton, exitButton

function menu:enter()
    -- Create a start button: when clicked, it switches to the game state.
    startButton = Button:new("Start", 100, 100, 200, 50, function()
        -- Switch to the game state; adjust the require path as needed
        Gamestate.switch(States.game)
    end)
    
    -- Create an exit button: when clicked, it quits the game.
    exitButton = Button:new("Exit", 100, 200, 200, 50, function()
        love.event.quit()
    end)
end

function menu:update(dt)
    startButton:update(dt)
    exitButton:update(dt)
end

function menu:draw()
    startButton:draw()
    exitButton:draw()
end

function menu:mousepressed(x, y, button)
    startButton:mousepressed(x, y, button)
    exitButton:mousepressed(x, y, button)
end

return menu
