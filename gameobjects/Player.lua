local BaseEntity = require "base.baseentity"
local Transform = require "components.transform"
local Renderer = require "components.renderer"
local Movement = require "components.movement"
local Collider = require "components.collider"

local Player = Class{__includes = BaseEntity}

function Player:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Transform(x or 0, y or 0, 0, 1))
    self:addComponent(Renderer({ color = {0,0.5,0.75} }))
    self:addComponent(Movement(250))
    self:addComponent(Collider(50, 50))
end

function Player:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Player