local Signal = require 'libraries.hump.signal'
local Camera = require 'libraries.hump.camera'
local Player = require "gameobjects.Player"
local SomeObject = require "gameobjects.SomeCollisionObject"

DebugColliders = true

local game = {}
local player
local someObject
local gameentities = {}

function game:enter()
    cam = Camera()
    cam:zoom(2)

    wf = require 'libraries.windfield'
    world = wf.newWorld(0, 0)

    sti = require 'libraries.sti'
    gameMap = sti('maps/testmap.lua')

    player = Player(100, 200)
    someObject = SomeObject(300, 200)
    table.insert(gameentities, player)
    table.insert(gameentities, someObject)

    walls = {}
    if gameMap.layers["Walls"] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType("static")
            table.insert(walls, wall)
        end
    end
end

function game:draw()
    cam:attach()
        gameMap:drawLayer(gameMap.layers["ground"])
        gameMap:drawLayer(gameMap.layers["objects"])
        table.sort(gameentities, function(a, b)
            local renderer_a = a:getComponent("Renderer")
            local renderer_b = b:getComponent("Renderer")
            return a:getComponent("Body"):getY() - renderer_a.ysortorigin < b:getComponent("Body"):getY() - renderer_b.ysortorigin
        end)

        -- Draw all entities
        for _, entity in ipairs(gameentities) do
            entity:draw()
        end
        world:draw()
    cam:detach()
end

function game:update(dt)
    player:update(dt)
    someObject:update(dt)
    
    world:update(dt)
    
    cam:lookAt(player:getComponent("Body"):getX(), player:getComponent("Body"):getY())
    
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w/2 then
        cam.x = w/2
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