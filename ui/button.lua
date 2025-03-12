-- Button.lua
local Button = {}
Button.__index = Button

-- Constructor: create a new button with text, position, size, and a callback function
function Button:new(text, x, y, width, height, onClick)
    local btn = setmetatable({}, Button)
    btn.text = text
    btn.x = x
    btn.y = y
    btn.width = width
    btn.height = height
    btn.onClick = onClick or function() end
    btn.hovered = false
    return btn
end

-- Update function: check if the mouse is over the button
function Button:update(dt)
    local mx, my = love.mouse.getPosition()
    self.hovered = mx >= self.x and mx <= self.x + self.width and my >= self.y and my <= self.y + self.height
end

-- Draw the button (change color when hovered)
function Button:draw()
    if self.hovered then
        love.graphics.setColor(0.8, 0.8, 0.8) -- light gray when hovered
    else
        love.graphics.setColor(1, 1, 1) -- white normally
    end

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(0, 0, 0) -- black text
    local font = love.graphics.getFont()
    local textWidth = font:getWidth(self.text)
    local textHeight = font:getHeight(self.text)
    love.graphics.print(self.text, self.x + (self.width - textWidth) / 2, self.y + (self.height - textHeight) / 2)
end

-- Mousepressed event handler: if the button is clicked, call its onClick function
function Button:mousepressed(x, y, button)
    if button == 1 and self.hovered then
        self.onClick()
    end
end

return Button
