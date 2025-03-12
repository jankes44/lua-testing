local Signal = require 'libs.hump.signal'
local utils = require 'utils'

local Player = require "gameobjects.Player"
local SomeObject = require "gameobjects.SomeCollisionObject"

DebugColliders = true

local game = {}
local player
local someObject
local gameentities = {}

function game:enter()
    -- Initialize game state
    Signal.emit('game_entered')
    print("game state entered")

    player = Player(100, 200)
    someObject = SomeObject(300, 200)
    table.insert(gameentities, player)
    table.insert(gameentities, someObject)
end

function game:draw()
    love.graphics.printf("Game is running, press escape to quit to menu", 0, 0, love.graphics.getWidth(), "left")
    
    table.sort(gameentities, function(a, b)
        local renderer_a = a:getComponent("Renderer")
        local renderer_b = b:getComponent("Renderer")
        return a:getComponent("Transform").y - renderer_a.ysortorigin < b:getComponent("Transform").y - renderer_b.ysortorigin
    end)

    -- Draw all entities
    for _, entity in ipairs(gameentities) do
        entity:draw()
    end
end

function game:update(dt)
    player:update(dt)
    someObject:update(dt)
    
    local playerCollider = player:getComponent("Collider")
    local enemyCollider = someObject:getComponent("Collider")
    if playerCollider and enemyCollider then
        if playerCollider:checkCollision(enemyCollider) then
            print("Collision detected!")
            -- Handle collision (e.g., stop movement, reduce health, etc.)
        end
    end
end

function game:leave()
    -- Clean up game state
    player = nil
    someObject = nil
end

function game:keypressed(key)
    if key == 'escape' then
        Gamestate.switch(States.menu)
    end
end

return game