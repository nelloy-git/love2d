--=========
-- Include
--=========

local Class = require('utils.Class.Class')

--=======
-- Class
--=======

local Texture = Class.new('Texture')
---@class Texture : Instance
local public = Texture.public
---@class TextureClass : Class
local static = Texture.static
---@type TextureClass
local override = Texture.override
local private = {}

--=========
-- Static
--=========

---@param filename string
---@param linear boolean
---@param mipmap boolean or table
---@param child_instance Texture | nil
---@return Texture
function static.new(filename, linear, mipmap, child_instance)
    local instance = child_instance or Class.allocate(Texture)
    private.newData(instance, filename, linear, mipmap)

    return instance
end

--========
-- Public
--========

function public:getTexture()
    return private.data[self].data
end

--=========
-- Private
--=========

private.data = setmetatable({}, {__mode = 'kv'})

---@param self Texture
function private.newData(self, filename, linear, mipmap)
    private.data[self] = {
        data = love.graphics.newImage(filename, {linear = linear})
    }
end

return static