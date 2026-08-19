const TestLogs = require("@game/ReplicatedStorage/Shared/robloxTester/Tools/TestLogs")

local newFail, newSuccess = TestLogs.newFail, TestLogs.newSuccess

local robloxTester = {
	assertEquals = function(a: any, b: any)
		if a == b then
			newSuccess()
		else
			newFail(`expect {a} to be equal to {b}`)
		end
	end,

	assertTrue = function(a: any)
		if a then
			newSuccess()
		else
			newFail(`expect {a} to be true`)
		end
	end,

	assertFalse = function(a: any)
		if not a then
			newSuccess()
		else
			newFail(`expect {a} to be false`)
		end
	end,
}

return robloxTester
