-- Change variable names to elements that are going to be edited.

--[[
	CONFIGURATION:


	GUI ELEMENT
		-> CHILD OF ELEMENT
	GUI ELEMENT (2)
		-> CHILD OF ELEMENT (2)
	.... ETC
--]]

local mainWindow 		= guirun.window[1]
	local saveLabel 	= guirun.button[1]	
	local loadLabel 	= guirun.button[2]
	local clientRun		= guirun.radiobutton[1]
	local serverRun 	= guirun.radiobutton[2]
	local runCode		= guirun.button[1]
	local close			= guirun.button[2]
	local memo 			= guirun.memo[1]

local secondaryWindow 	= utils.window[1]
	local gridList 		= utils.gridList[1]
	local funcButton	= utils.button[1]
	local closeButton	= utils.button[2]

local thirdWindow 		= utils.window[2]
	local errorLabel	= utils.label[2]
	local saveEdit		= utils.edit[1]


local settings = {
	hoverColor = {93, 174, 48},
	leaveColor = {255, 255,255},
}


function windowSetVisible(window, bool)
	assert(getElementType(window) == "gui-window" or type(bool) == "boolean")

	window:setVisible(bool)
	
	if isCursorShowing() ~= bool then
		showCursor(bool)
	end
	return
end


function labelEntered()
	assert(getElementType(label) == "gui-label")

	local i = settings.hoverColor
	source:setColor(i[1], i[2], i[3])
end

function labelLeft()
	assert(getElementType(label) == "gui-label")

	local i = settings.hoverColor
	source:setColor(i[1], i[2], i[3])
end
