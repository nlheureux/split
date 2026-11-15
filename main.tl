-- 1st - Ask for total
-- 2nd - Ask for names
-- Note: Make sure that you make it flash yellow when total is not correct
--         and change color the closer you get to the total
require("love")

function love.load() -- Put as much logic in here as possible
   global calculator <const> = love.graphics.newImage("assets/calculator.png")
end

function love.draw()
    love.graphics.draw(calculator, 10, 10, 2, 2, 2)
end

