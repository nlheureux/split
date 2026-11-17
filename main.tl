require("love")

function love.load() -- Put as much logic in here as possible
    -- Might want to save pixels from UI components in a map here
    -- Define size and then calculate center position
end

local function drawKeys(rows: integer, cols: integer)
    local x = 200
    local y = 125
    local width = 60
    local height = 60

    for _ = 1, rows do
        love.graphics.rectangle("fill", x, y, width, height) -- fill, x, y, width, height
        for _ = 1, cols do
            love.graphics.rectangle("fill", x, y, width, height) -- fill, x, y, width, height
            y = y + 80
        end
        x = x + 80
        y = 125
    end
end

function love.draw()
    drawKeys(5, 4)
end


