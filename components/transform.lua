local Transform = Class{}

function Transform:init(args)
    self.type = "Transform"  -- Identifier used to retrieve this component
    self.rotation = args.rotation or 0
    self.scale = args.scale or 1
    self.collider = world:newBSGRectangleCollider(args.x, args.y, args.width, args.height, args.boxRadius or 0)
    self.collider:setFixedRotation(true)
    self.collider:setType(args.collisionType)
    self.collider:setLinearDamping(args.linearDamping or 0)
end

function Transform:getY()
    local _, y = self.collider:getPosition()
    return y
end

function Transform:getX()
    local x, _ = self.collider:getPosition()
    return x
end

return Transform