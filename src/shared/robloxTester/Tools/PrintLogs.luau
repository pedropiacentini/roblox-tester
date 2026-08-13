local PrintLogs = {}

function PrintLogs.printLogs(failedMessages: {string}, total: number, failed: number)
	PrintLogs.printScore(total, failed)
	PrintLogs.printMessages(failedMessages)
end

function PrintLogs.printMessages(messages: {string})
	for _, message in messages do
		print(message)
	end
end

function PrintLogs.printScore(total: number, failed: number)
	printf(`{total} total tests`)
	printf(`{total - failed} passed`)
	
	if failed > 0 then
		
		printf(`{failed} failed`)
	else
		printf(`All passed!`)
	end
end

function printf(text: string)
	print(format(text))
end
function format(text: string)
	return `    {text}`
end

return PrintLogs
