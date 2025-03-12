local utils = {}

function utils.randomPosition()
    local x = math.random(0, love.graphics.getWidth())
    local y = math.random(0, love.graphics.getHeight())
    return {x = x, y = y}
end

function utils.randomWaypoints(numWaypoints)
    local waypoints = {}
    for i = 1, numWaypoints do
        table.insert(waypoints, utils.randomPosition())
    end
    return waypoints
end

function utils.distance(a, b)
    local dx = a.x - b.x
    local dy = a.y - b.y
    return math.sqrt(dx * dx + dy * dy)
end

function utils.removeFromTable(item_to_remove, table_from)
    for index, value in ipairs(table_from) do
        if item_to_remove == value then
            table.remove(table_from, index)
        end
    end
end

return utils