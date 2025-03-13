local Renderer = Class{}

function Renderer:init(args)
    self.type = "Renderer"  -- Component identifier
    self.color = args.color or {1,1,1}
    self.width = args.width or 5
    self.height = args.height or 5
    self.ysortorigin = args.ysortorigin or 0 -- for sorting objects based on position of 'y'
    self.offsetX = args.offsetX or 0
    self.offsetY = args.offsetY or 0
end

function Renderer:draw()
    -- Access the entity's Transform component
    local transform = self.entity:getComponent("Transform")
    if transform then
        local x = math.floor(transform:getX() + self.offsetX)
        local y = math.floor(transform:getY() + self.offsetY)

        love.graphics.setColor(self.color)
        love.graphics.rectangle("fill", x - (self.width/2) + self.offsetX, y - (self.height/2) + self.offsetY, self.width, self.height)
    end
    love.graphics.setColor(1,1,1)
end

return Renderer
