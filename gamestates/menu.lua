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
    if startButton then startButton:update(dt) end
    if exitButton then exitButton:update(dt) end
end

function menu:draw()
    if startButton then startButton:draw() end
    if exitButton then exitButton:draw() end
end

function menu:mousepressed(x, y, button)
    if startButton then startButton:mousepressed(x, y, button) end
    if exitButton then exitButton:mousepressed(x, y, button) end
end

function menu:leave()
    startButton = nil
    exitButton = nil
end

function menu:keypressed(key)
    if key == 'return' then
        Gamestate.switch(States.game)
    end
    if key == 'escape' then
        love.event.quit()
    end
end

return menu
