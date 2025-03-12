-- Collider.lua
local Collider = Class{}

function Collider:init(width, height, offsetX, offsetY)
    self.type = "Collider"       -- Identifier for retrieval
    self.width = width or 0      -- Width of the collision box
    self.height = height or 0    -- Height of the collision box
    self.offsetX = offsetX or 0  -- Optional offset from the entity's position
    self.offsetY = offsetY or 0
    self.x = 0                   -- These will be updated from the Transform
    self.y = 0
end

-- Update collider position based on the entity's Transform component.
function Collider:update(dt)
    local transform = self.entity:getComponent("Transform")
    if transform then
        self.x = transform.x + self.offsetX
        self.y = transform.y + self.offsetY
    end
end

-- Check collision with another collider using AABB detection.
function Collider:checkCollision(other)
    return self.x < other.x + other.width and
           other.x < self.x + self.width and
           self.y < other.y + other.height and
           other.y < self.y + self.height
end

-- Optional: draw the collider for debugging purposes.
function Collider:draw()
    love.graphics.setColor(1, 0, 0, 0.5)  -- red with some transparency
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1, 1)    -- reset to white
end

return Collider
