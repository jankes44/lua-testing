local Signal = require 'libs.hump.signal'
local utils = require 'utils'

local Player = require "gameobjects.Player"
 
local game = {}
local player

function game:enter()
    -- Initialize game state
    Signal.emit('game_entered')
    print("game state entered")

    player = Player(100, 200)
end

function game:draw()
    love.graphics.printf("Game is running, press escape to quit to menu", 0, 0, love.graphics.getWidth(), "left")
    player:draw()
end

function game:update(dt)
    player:update(dt)
end

function game:leave()
    -- Clean up game state
    player = nil
end

function game:keypressed(key)
    if key == 'escape' then
        Gamestate.switch(States.menu)
    end
end

return game