local intro = {}

function intro:enter()
    -- Initialize intro state
end

function intro:draw()
    love.graphics.print("Press any key to start", 100, 100)
end

function intro:keypressed(key)
    Gamestate.switch(States.menu)
end

return intro