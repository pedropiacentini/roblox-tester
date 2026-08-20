local ReplicatedStorage = game:GetService("ReplicatedStorage")
const PrintLogs = require("@game/ReplicatedStorage/Shared/RoTest/Tools/PrintLogs")
const TestLogs = require("@game/ReplicatedStorage/Shared/RoTest/Tools/TestLogs")

local function getScriptsFromTestsFolder()
	local scripts = {}
	local testsFolder = ReplicatedStorage:FindFirstChild("tests", true)

	if not testsFolder then
		warn("tests folder not found in ReplicatedStorage")
		return scripts
	end

	for _, descendant in testsFolder:GetDescendants() do
		if descendant:IsA("ModuleScript") then
			table.insert(scripts, descendant)
		end
	end

	return scripts
end

local function run()
	local scriptsList = getScriptsFromTestsFolder()
	print("Start tests")
	for _, scriptObj in scriptsList do
		local scriptTable = require(scriptObj) :: { () -> () }
		for _, script in scriptTable do
			script()
		end
	end
	PrintLogs.printLogs(TestLogs.failedTests, TestLogs.testsCount, TestLogs.failCount)
end

return run
