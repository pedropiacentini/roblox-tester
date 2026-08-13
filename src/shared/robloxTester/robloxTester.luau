const TestLogs = require("@game/ReplicatedStorage/Shared/robloxTester/Tools/TestLogs")

local newFail = TestLogs.newFail
local robloxTester = {
    assertEquals = function(a: any, b: any)
        if a ~= b then
            newFail(`expect {a} to be equal to {b}`)
        end
    end
}

return robloxTester