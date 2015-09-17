
-- 通过地图数据，开始点，结束点，是否四方向来用A*寻路
local function findPathByAStar(map, mapRows, mapCols, startPoint, endPoint, four_dir)
    local AStar = require "AStar"

    local a_star = AStar.create(map, mapRows, mapCols, startPoint, endPoint, four_dir and true or false)
    local path = a_star:searchPath()
    
    if not path or #path == 1 then
        return nil
    end

    -- 得到的路径其实需要反转一下才是从起始到终点
    local resultPath = {}
    for i, v in ipairs(path) do
        resultPath[#path - i + 1] = v
    end

    for i,v in ipairs(resultPath) do
        local point = v
        printInfo("row = "..point.row.." col = "..point.col)
    end
    return resultPath
end

-- 地图数据
local map = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1,
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
}


local path = findPathByAStar(map, 9, 17, {row = 2, col = 2}, {row = 4, col = 4})