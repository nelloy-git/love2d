--=========
-- Include
--=========

local Class = require('utils.Class.Class')

--=======
-- Class
--=======

local Drawable = Class.new('Drawable')
---@class DrawableClass : Class
local static = Drawable.static
---@class Drawable : Instance
local public = Drawable.public
---@type DrawableClass
local override = Drawable.override

local private = {}

--========
-- Static
--========

---@param child_instance Drawable
function static.new(child_instance)
    if not child_instance then
        error('Can not create instance of abstract class', 2)
    end
    local instance = child_instance
    private.newData(instance)

    return instance
end

function static.drawAll()
    local all = private.all

    for i = 1, #all do
        all[i]:draw()
    end
end

--========
-- Public
--========

function public:draw()
    print('test draw')
end

--=========
-- Private
--=========

private.all = {}
setmetatable(private.all, {__mode = 'kv'})
private.data = {}
setmetatable(private.data, {__mode = 'kv'})

function private.newData(self)
    private.data[self] = {}
    table.insert(private.all, self)
end

return static