local Texture = require('Drawable.Texture')
local Sprite = require('Drawable.Sprite')
local Drawable = require('Drawable.Drawable')

local texture = Texture.new('/graphics/hamster.jpg', true, false)
local test = Sprite.new(texture)

function love.load()
end

local loop = 1
function love.draw()
    Drawable.drawAll()
    loop = loop + 1
    if loop > 3 then
        test = nil
        collectgarbage()
    end
end