local Body = Class{}

function Body:init(args)
    self.type = "Body"  -- Identifier used to retrieve this component
    self.rotation = args.rotation or 0
    self.scale = args.scale or 1
    self.collider = args.world:newBSGRectangleCollider(args.x, args.y, args.width, args.height, args.boxRadius or 0)
    self.collider:setFixedRotation(true)
    if args.collisionType == "sensor" then
        self.collider:setSensor(true)
    else
        self.collider:setType(args.collisionType)
    end
    self.collider:setLinearDamping(args.linearDamping or 0)
end

function Body:getY()
    local _, y = self.collider:getPosition()
    return y
end

function Body:getX()
    local x, _ = self.collider:getPosition()
    return x
end

return Body