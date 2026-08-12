local ReplicatedStorage = game:GetService("ReplicatedStorage")

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
	for _, scriptObj in scriptsList do
		local script = require(scriptObj) :: () -> ()
		script()
	end
end

return run