local Signal = require 'libraries.hump.signal'
local utils = require 'libraries.sti.utils'

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

    wf = require 'libraries.windfield'
    world = wf.newWorld(0, 0)

    sti = require 'libraries.sti'
    gameMap = sti('maps/testmap.lua')

    player = Player(100, 200)
    someObject = SomeObject(300, 200)
    table.insert(gameentities, player)
    table.insert(gameentities, someObject)
end

function game:draw()
    gameMap:draw()
    table.sort(gameentities, function(a, b)
        local renderer_a = a:getComponent("Renderer")
        local renderer_b = b:getComponent("Renderer")
        local _, ytransform_a = a:getComponent("Transform").collider:getPosition()
        local _, ytransform_b = b:getComponent("Transform").collider:getPosition()
        return ytransform_a - renderer_a.ysortorigin < ytransform_b - renderer_b.ysortorigin
    end)

    -- Draw all entities
    for _, entity in ipairs(gameentities) do
        entity:draw()
    end
    world:draw()
end

function game:update(dt)
    player:update(dt)
    someObject:update(dt)
    
    world:update(dt)
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