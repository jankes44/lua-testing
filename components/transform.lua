local Transform = Class{}

function Transform:init(x, y, rotation, scale)
    self.type = "Transform"  -- Identifier used to retrieve this component
    self.x = x or 0
    self.y = y or 0
    self.rotation = rotation or 0
    self.scale = scale or 1
end

return Transform