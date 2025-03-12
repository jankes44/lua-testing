local Renderer = Class{}

function Renderer:init(args)
    self.type = "Renderer"  -- Component identifier
    self.color = args.color or {1,1,1}
    self.ysortorigin = args.ysortorigin or 0
    self.offsetX = args.offsetX or 0
    self.offsetY = args.offsetY or 0
end

function Renderer:draw()
    -- Access the entity's Transform component
    local transform = self.entity:getComponent("Transform")
    if transform then
        local x = math.floor(transform.x + self.offsetX)
        local y = math.floor(transform.y + self.offsetY)
        local rotation = transform.rotation or 0
        local scale = transform.scale or 1

        love.graphics.setColor(self.color)
        love.graphics.rectangle("fill", x + self.offsetX, y + self.offsetY, 50, 50)
    end
    love.graphics.setColor(1,1,1)
end

return Renderer
