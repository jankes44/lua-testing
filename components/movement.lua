local Movement = Class{}

function Movement:init(speed)
    self.type = "InputComponent"  -- Identifier for retrieval if needed
    self.speed = speed or 200     -- Movement speed in pixels per second
end

function Movement:update(dt)
    local transform = self.entity:getComponent("Transform")
    if transform then
        if love.keyboard.isDown("left") then
            transform.x = transform.x - self.speed * dt
        end
        if love.keyboard.isDown("right") then
            transform.x = transform.x + self.speed * dt
        end
        if love.keyboard.isDown("up") then
            transform.y = transform.y - self.speed * dt
        end
        if love.keyboard.isDown("down") then
            transform.y = transform.y + self.speed * dt
        end
    end
end

return Movement
