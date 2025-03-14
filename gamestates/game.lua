local Signal = require 'libraries.hump.signal'
local Camera = require 'libraries.hump.camera'
local Player = require "gameobjects.Player"
local SomeObject = require "gameobjects.SomeCollisionObject"
local Button = require "ui.button"
local sti = require 'libraries.sti'
local wf = require 'libraries.windfield'

DebugColliders = true

local game = {}
local world
local gameMap
local player
local someObject
local gameentities = {}
local cameraZoom = 3

-- buttons used for debug for now
local uibuttons = {
    Button:new("speed-increase", 20, 100, 100, 50, function()
        player:getComponent("Movement").speed = player:getComponent("Movement").speed + 20
    end),
    Button:new("speed-decrease", 20, 155, 100, 50, function()
        player:getComponent("Movement").speed = player:getComponent("Movement").speed - 20
    end),
    Button:new("toggle sensor object", 20, 210, 150, 50, function()
        local collider = someObject:getComponent("Body").collider
        collider:setSensor(not collider:isSensor())
    end),
}

function game:enter()
    Cam = Camera()
    Cam:zoom(cameraZoom)

    world = wf.newWorld(0, 0)
    
    gameMap = sti('maps/testmap.lua')

    player = Player(world, 100, 200)
    someObject = SomeObject(world, 300, 200)
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

function game:update(dt)
    player:update(dt)
    someObject:update(dt)
    
    world:update(dt)
    
    Cam:lookAt(player:getComponent("Body"):getX(), player:getComponent("Body"):getY())
    
    for _, btn in ipairs(uibuttons) do
        btn:update(dt)
    end

    -- camera borders
    local w = love.graphics.getWidth()/cameraZoom
    local h = love.graphics.getHeight()/cameraZoom
    -- left border
    if Cam.x < w/2 then
        Cam.x = w/2
    end
    -- top border
    if Cam.y < h/2 then
        Cam.y = h/2
    end
    
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    -- right border
    if Cam.x > (mapW - w/2) then
        Cam.x = (mapW - w/2)
    end
    -- bottom border
    if Cam.y > (mapH - h/2) then
        Cam.y = (mapH - h/2)
    end
end

function game:draw()
    Cam:attach()
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
    Cam:detach()

    -- hud debug things
    love.graphics.print("game is running, press 'esc' to exit")
    for _, btn in ipairs(uibuttons) do
        btn:draw()
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

function game:mousepressed(x,y,button)
    for _, btn in ipairs(uibuttons) do
        btn:mousepressed(x,y,button)
    end
end

return game