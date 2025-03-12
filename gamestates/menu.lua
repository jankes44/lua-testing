local menu = {}

function menu:enter()
    -- Initialize menu state
end

function menu:draw()
    love.graphics.print("Press Enter to enter the game, press escape to quit game", 100, 100)
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