local BaseEntity = require "base.baseentity"
local Body = require "components.body"
local Renderer = require "components.renderer"
local Movement = require "components.movement"

local Object = Class{__includes = BaseEntity}

function Object:init(world, x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Body({ 
        world = world, collisionType = "sensor", x = x or 0, y = y or 0, width = 80, height = 40, rotation = 0, scale = 1, linearDamping = 2
    }))
    self:addComponent(Renderer({ 
        color = {1,0.5,0}, ysortorigin = -10, width = 80, height = 40 
    }))
    -- self:addComponent(Movement(200))
end

function Object:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Object