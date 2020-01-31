local Drawable = require('utils.Drawable')

local test = Drawable.new()

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