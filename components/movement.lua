local Movement = Class{}

function Movement:init(speed, on_input_callback)
    self.type = "Movement"  -- Identifier for retrieval if needed
    self.speed = speed or 200     -- Movement speed in pixels per second
    self.on_input_callback = on_input_callback
end

function Movement:update(dt)
    local body = self.entity:getComponent("Body")
    if body then
        local dx, dy = 0, 0

        if love.keyboard.isDown("a") then
            dx = dx - 1
        end
        if love.keyboard.isDown("d") then
            dx = dx + 1
        end
        if love.keyboard.isDown("w") then
            dy = dy - 1
        end
        if love.keyboard.isDown("s") then
            dy = dy + 1
        end

        -- Normalize the vector if movement exists
        local length = math.sqrt(dx * dx + dy * dy)
        if length > 0 then
            dx = dx / length
            dy = dy / length
        end

        body.collider:setLinearVelocity(dx * self.speed, dy * self.speed)
    end
end

return Movement
