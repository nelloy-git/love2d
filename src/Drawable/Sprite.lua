--=========
-- Include
--=========

local Class = require('utils.Class.Class')

---@type DrawableClass
local Drawable = require('Drawable.Drawable')

--=======
-- Class
--=======

local Sprite = Class.new('Sprite', Drawable)
---@class Sprite : Instance
local public = Sprite.public
---@class SpriteClass : Class
local static = Sprite.static
---@type SpriteClass
local override = Sprite.override
local private = {}

--=========
-- Static
--=========

---@param child_instance Sprite | nil
---@return Sprite
function override.new(texture, child_instance)
    local instance = child_instance or Class.allocate(Sprite)
    instance = Drawable.new(instance)
    private.newData(instance, texture)

    return instance
end

--========
-- Public
--========

local draw = love.graphics.draw
function public:draw()
    local priv = private.data[self]
    draw(priv.texture:getTexture(), 0, 0, 0, 100, 100, 0, 0, 0, 0)
    print('draw')
end


--=========
-- Private
--=========

private.data = setmetatable({}, {__mode = 'kv'})

---@param self Sprite
function private.newData(self, texture)
    private.data[self] = {
        texture = texture
    }
end

return static