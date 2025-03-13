local BaseEntity = require "base.baseentity"
local Body = require "components.body"
local Renderer = require "components.renderer"
local Movement = require "components.movement"

local Player = Class{__includes = BaseEntity}

function Player:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Body({ 
        world = world, collisionType = "dynamic", x = x or 0, y = y or 0, width = 18, height = 18, rotation = 0, scale = 1, boxRadius = 2
    }))
    self:addComponent(Renderer({ 
        color = {0,0.5,0.75}, width = 18, height = 18 
    }))
    self:addComponent(Movement(300))
end

function Player:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Player