local BaseEntity = require "base.baseentity"
local Transform = require "components.transform"
local Renderer = require "components.renderer"
local Collider = require "components.collider"

local Object = Class{__includes = BaseEntity}

function Object:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Transform(x or 0, y or 0, 0, 1))
    self:addComponent(Renderer({ color = {1,0.5,0}, ysortorigin = 2 }))
    self:addComponent(Collider(50, 50))
end

function Object:update(dt)
    BaseEntity.update(self, dt) -- base class update method (super)

    -- Additional behaviour
end

return Object