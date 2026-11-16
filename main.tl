-- 1st - Ask for total
-- 2nd - Ask for names
-- Note: Make sure that you make it flash yellow when total is not correct
-- and change color the closer you get to the total

require("love")

function love.load() -- Put as much logic in here as possible
end

function love.draw()
    love.graphics.rectangle("fill", 40, 100, 30, 30) -- fill, x, y, width, height
    love.graphics.rectangle("fill", 80, 100, 30, 30) -- fill, x, y, width, height
    love.graphics.rectangle("fill", 120, 100, 30, 30) -- fill, x, y, width, height
end

