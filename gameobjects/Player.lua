local BaseEntity = require "base.baseentity"
local Transform = require "components.transform"
local Renderer = require "components.renderer"
local Movement = require "components.movement"
local Collider = require "components.collider"

local Player = Class{__includes = BaseEntity}

function Player:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Transform({ 
        world = world, collisionType = "dynamic", x = x or 0, y = y or 0, width = 50, height = 50, rotation = 0, scale = 1, boxRadius = 5
    }))
    self:addComponent(Renderer({ 
        color = {0,0.5,0.75}, width = 50, height = 50 
    }))
    self:addComponent(Movement(20000))
end

function Player:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Player