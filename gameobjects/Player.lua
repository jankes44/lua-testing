local BaseEntity = require "base.baseentity"
local Transform = require "components.transform"
local Renderer = require "components.renderer"
local Movement = require "components.movement"

local Player = Class{__includes = BaseEntity}

function Player:init(x, y)
    -- Call the BaseEntity initializer with a default name "Player"
    BaseEntity.init(self, "Player")
    
    self:addComponent(Transform(x or 0, y or 0, 0, 1))
    self:addComponent(Renderer())
    self:addComponent(Movement(400))
end

return Player