-- 1st - Ask for total
-- 2nd - Ask for names
-- Split into drinks, apps, entrees, etc...
-- Note: Make sure that you make it flash yellow when total is not correct
-- and change color the closer you get to the total

require("love")

function love.load() -- Put as much logic in here as possible
    -- Might want to save pixels from UI components in a map here
end

local function drawKeys(rows: integer, cols: integer)
    local x = 325
    local y = 150
    local width = 30
    local height = 30

    -- Need to reset y coordinate
    for _ = 1, rows do
        love.graphics.rectangle("fill", x, y, width, height) -- fill, x, y, width, height
        for _ = 1, cols do
            love.graphics.rectangle("fill", x, y, width, height) -- fill, x, y, width, height
            y = y + 40
        end
        x = x + 40
        y = 150
    end
end

function love.draw()
    drawKeys(5, 4)
end


