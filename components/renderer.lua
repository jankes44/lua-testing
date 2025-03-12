local Renderer = Class{}

function Renderer:init(image, offsetX, offsetY)
    self.type = "Renderer"  -- Component identifier
    self.image = image      -- love.graphics image, if provided
    self.offsetX = offsetX or 0
    self.offsetY = offsetY or 0
end

function Renderer:draw()
    -- Access the entity's Transform component
    local transform = self.entity:getComponent("Transform")
    if transform then
        local x = math.floor(transform.x + self.offsetX)
        local y = math.floor(transform.y + self.offsetY)
        local rotation = transform.rotation or 0
        local scale = transform.scale or 1

        if self.image then
            -- Draw the image using the transform values
            love.graphics.draw(self.image, x + self.offsetX, y + self.offsetY, rotation, scale, scale)
        else
            -- Fallback: draw a simple rectangle if no image is provided
            love.graphics.rectangle("fill", x + self.offsetX, y + self.offsetY, 50, 50)
        end
    end
end

return Renderer
