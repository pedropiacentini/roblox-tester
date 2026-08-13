local TestLog = {
	failedTests = {} :: { string },
	
	testsCount = 0,
	failCount = 0 ,
	successCount = 0
}

function TestLog.newFail(message: string)
	local outputMessage = `{message} in {debug.traceback("", 3)}`
	outputMessage = string.gsub(message, "[\r\n]", "")
	TestLog.failedTests[TestLog.failCount] = outputMessage
	
	TestLog.failCount += 1
	TestLog.testsCount += 1
end

return TestLog
