local BaseEntity = require "base.baseentity"
local Transform = require "components.transform"
local Renderer = require "components.renderer"
local Movement = require "components.movement"

local Object = Class{__includes = BaseEntity}

function Object:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Transform({ 
        world = world, collisionType = "dynamic", x = x or 0, y = y or 0, width = 80, height = 40, rotation = 0, scale = 1, linearDamping = 2
    }))
    self:addComponent(Renderer({ 
        color = {1,0.5,0}, ysortorigin = 2, width = 80, height = 40 
    }))
    -- self:addComponent(Movement(1000))
end

function Object:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Object