-- BaseEntity.lua
local BaseEntity = Class{}

function BaseEntity:init(name)
    self.name = name or "Entity"
    self.components = {}  -- table to hold components
end

-- Add a component
function BaseEntity:addComponent(component)
    table.insert(self.components, component)
    component.entity = self  -- link the component back to its owner
end

-- Retrieve a component by its type identifier
function BaseEntity:getComponent(typeName)
    for _, comp in ipairs(self.components) do
        if comp.type == typeName then
            return comp
        end
    end
    return nil
end

-- Update all components (if they implement an update method)
function BaseEntity:update(dt)
    for _, comp in ipairs(self.components) do
        if comp.update then
            comp:update(dt)
        end
    end
end

-- Draw all components (if they implement a draw method)
function BaseEntity:draw()
    for _, comp in ipairs(self.components) do
        if comp.draw then
            comp:draw()
        end
    end
end

return BaseEntity
