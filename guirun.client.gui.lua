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

--[[
	Edit to liking
	-- TODO: Allow settings to be editable via admin panel.
--]]
local settings = {
	hoverColor = {93, 174, 48},
	leaveColor = {255, 255,255},
	
	elementType = {
		WINDOW = "gui-window",
		LABEL = "gui-label",
	}
}

--[[
	--@Desc: Opens or closes window of choice based on boolean given.
	--@Param: (Type: gui-window) window, (Type: boolean) bool
	--@Returns: true if successful, false otherwise.  
--]]
function windowSetVisible(window, bool)
	bool = bool or true	-- If no bool is retrieved then set to true.

	-- Check for correct type of element.
	if getElementType(window) == elementType.WINDOW then 
		window:setVisible(bool)
		if isCursorShowing() ~= bool then
			showCursor(bool)
		end
		return true
	else
		outputDebugString("expected type "..elementType.WINDOW.." got: "..getElementType(window))
		return false
	end
end

--[[
	Changes color of gui-label element attached to event.
--]]
function labelEntered()
	assert(getElementType(this) == "gui-label")

	local i = settings.hoverColor
	this:setColor(i[1], i[2], i[3])
end

function labelLeft()
	assert(getElementType(this) == "gui-label")

	local i = settings.leaveColor
	this:setColor(i[1], i[2], i[3])
end

-- Populates gridlist with saves made
-- this can be loaded.
function populateGridList()
	gridlist:clear()	-- Renew gridlist

	for i, v in ipairs(code) do
		local row = gridlist:addRow()
		gridList:setItemText(row, 1, i)
	end
	outputDebugString("GridList populated")
end