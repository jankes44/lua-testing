local Movement = Class{}

function Movement:init(speed, on_input_callback)
    self.type = "InputComponent"  -- Identifier for retrieval if needed
    self.speed = speed or 200     -- Movement speed in pixels per second
    self.on_input_callback = on_input_callback
end

function Movement:update(dt)
    local transform = self.entity:getComponent("Transform")
    if transform then
        if love.keyboard.isDown("a") then
            transform.x = transform.x - self.speed * dt
        end
        if love.keyboard.isDown("d") then
            transform.x = transform.x + self.speed * dt
        end
        if love.keyboard.isDown("w") then
            transform.y = transform.y - self.speed * dt
        end
        if love.keyboard.isDown("s") then
            transform.y = transform.y + self.speed * dt
        end
    end
end

return Movement
