--------------------------------------------------
-- guirun.client.gui.lua
-- 
-- Merged guidump with gui.lua...
--
-- My initial thought is to prevent messy code, 
-- however more errors have occured...
--------------------------------------------------

local settings = {

	-- CHANGE COLORS TO LIKING...
	hoverColor = {93, 174, 48},
	leaveColor = {255, 255,255},

	warnings = {"Invalid name", "No code to save"},
}

_MODE = nil
--------------------------------------------------
-- Main window
-- 
-- Save/load code, write code, run
--------------------------------------------------

local guirun = {
    radiobutton = {},
    button = {},
    label = {},
    memo = {}
}

guirun.window 	  		  = guiCreateWindow(0.26, 0.27, 0.47, 0.46, "RUNCODE", true)
	guirun.label[1] 	  = guiCreateLabel(0.04, 0.06, 0.12, 0.04, "SAVE", true, guirun.window)
	guirun.label[2] 	  = guiCreateLabel(0.16, 0.06, 0.12, 0.04, "LOAD", true, guirun.window)
	guirun.label[3] 	  = guiCreateLabel(0.06, 0.90, 0.12, 0.04, "SRUN", true, guirun.window)
	guirun.label[4] 	  = guiCreateLabel(0.20, 0.90, 0.12, 0.04, "CRUN", true, guirun.window)
	guirun.memo[1]  	  = guiCreateMemo(0.04, 0.13, 0.92, 0.75, "", true, guirun.window)
	guirun.radiobutton[1] = guiCreateRadioButton(0.04, 0.90, 0.02, 0.04, "", true, guirun.window)
	guirun.radiobutton[2] = guiCreateRadioButton(0.18, 0.90, 0.02, 0.04, "", true, guirun.window)
	guirun.button[1] 	  = guiCreateButton(0.68, 0.91, 0.13, 0.06, "RUN CODE", true, guirun.window)
	guirun.button[2]      = guiCreateButton(0.83, 0.91, 0.13, 0.06, "CLOSE", true, guirun.window)

-- WINDOW SETTINGS
	guiWindowSetMovable(guirun.window, false)
	guiWindowSetSizable(guirun.window, false)
	guiSetAlpha(guirun.window, 0.95)
	guiSetVisible(guirun.window, false)

-- LABEL SETTINGS
	guiSetFont(guirun.label[1], "default-bold-small")
	--guiLabelSetHorizontalAlign(guirun.label[1], "center", false)
	guiLabelSetVerticalAlign(guirun.label[1], "center")
	
	guiSetFont(guirun.label[2], "default-bold-small")
	guiLabelSetColor(guirun.label[2], 93, 174, 48)
	--guiLabelSetHorizontalAlign(guirun.label[2], "center", false)
	guiLabelSetVerticalAlign(guirun.label[2], "center")

	guiSetFont(guirun.label[3], "default-bold-small")
	guiLabelSetHorizontalAlign(guirun.label[3], "center", false)
	guiLabelSetVerticalAlign(guirun.label[3], "center")

	guiSetFont(guirun.label[4], "default-bold-small")
	guiLabelSetHorizontalAlign(guirun.label[4], "center", false)
	guiLabelSetVerticalAlign(guirun.label[4], "center")
	
-- BUTTON SETTINGS
	guiSetProperty(guirun.button[1], "NormalTextColour", "FFAAAAAA")
	guiSetProperty(guirun.button[2], "NormalTextColour", "FFAAAAAA")

--------------------------------------------------
--	guirun.second window (Stupid name...)
-- Has multiple uses loading and saving code and
-- when saving code the guirun.third window will be in
-- use.
--------------------------------------------------

guirun.second = {
    edit = {},
    button = {},
    label = {},
    gridlist = {}
}

-- MAIN LOAD/SAVE WINDOW
guirun.second.window 			= guiCreateWindow(0.40, 0.27, 0.20, 0.51, "", true)
	guirun.second.gridlist[1] 	= guiCreateGridList(0.04, 0.08, 0.93, 0.81, true, guirun.second.window)
	guirun.second.button[1] 	= guiCreateButton(0.04, 0.89, 0.46, 0.05, "", true, guirun.second.window)
	guirun.second.button[2] 	= guiCreateButton(0.50, 0.89, 0.46, 0.05, "BACK", true, guirun.second.window)

-- WINDOW SETTINGS
	guiWindowSetMovable(guirun.second.window, false)
	guiWindowSetSizable(guirun.second.window, false)
	guiSetAlpha(guirun.second.window, 0.87)
	guiSetProperty(guirun.second.window, "AlwaysOnTop", "True")
	guiSetVisible(guirun.second.window, false)

-- GRIDLIST SETTINGS
	local column = guiGridListAddColumn(guirun.second.gridlist[1], "NAME", 0.9)
	
-- BUTTON SETTINGS
	guiSetProperty(guirun.second.button[1], "NormalTextColour", "FFAAAAAA")
	guiSetProperty(guirun.second.button[2], "NormalTextColour", "FFAAAAAA")

--------------------------------------------------
-- Creating the name, displaying labels with
-- errors, etc...
--------------------------------------------------

guirun.third = {
    edit = {},
    label = {}
}
-- THIS WINDOW IS TO COMPLEMENT THE SAVE FEATURE
guirun.third.window 			= guiCreateWindow(0.60, 0.27, 0.13, 0.17, "Details", true)
	guirun.third.label[1] 		= guiCreateLabel(0.05, 0.24, 0.40, 0.12, "Name", true, guirun.third.window)
	guirun.third.label[2] 		= guiCreateLabel(0.05, 0.65, 0.89, 0.27, "Name is required!", true, guirun.third.window)
	guirun.third.edit[1] 		= guiCreateEdit(0.05, 0.40, 0.89, 0.18, "", true, guirun.third.window)

-- WINDOW SETTINGS

	guiWindowSetMovable(guirun.third.window, false)
	guiWindowSetSizable(guirun.third.window, false)
	guiSetAlpha(guirun.third.window, 0.87)
	guiSetProperty(guirun.third.window, "AlwaysOnTop", "True")
	guiSetVisible(guirun.third.window, false)


-- LABEL SETTINGS
	guiSetFont(guirun.third.label[1], "default-bold-small")
	guiLabelSetHorizontalAlign(guirun.third.label[1], "center", false)
	guiLabelSetVerticalAlign(guirun.third.label[1], "center")

	guiSetFont(guirun.third.label[2], "default-bold-small")
	guiLabelSetHorizontalAlign(guirun.third.label[2], "center", false)
	guiLabelSetVerticalAlign(guirun.third.label[2], "center")
	guirun.third.label[2]:setVisible(false)	



--------------------------------------------------
-- GUI Functions,
--------------------------------------------------


--------------------------------------------------
-- Sets the main window visible
-- @param boolean this is passed onto setVisible method.

-- @return true if successful, false otherwise
--------------------------------------------------
function guirun:setVisible(bool)
	assert( type(bool) == "boolean", "Incorrect type" )
	local window = self.window
	local cursor = isCursorShowing()
	bool = bool or true

	if window:getVisible() ~= bool then
		window:setVisible(bool)
		if cursor ~= bool then
			showCursor(bool)
		end
		outputDebugString("Set window "..tostring(bool))

		return true
	end

	outputDebugString("Cannot set window "..tostring(bool))
	return false
end

--------------------------------------------------
-- Opens both second.window and third.window
-- which is also known as 'save mode'
--------------------------------------------------
function guirun:setSaveMode()

	local window = self.second.window
	local funcButton = self.second.button[1]
	local other = self.third.window
	
	-- Make sure both windows aren't open already...
	if not (window:getVisible() or other:getVisible()) then
		window:setVisible(true)
		other:setVisible(true)

		-- Set text to elements
		funcButton:setText("SAVE")
		window:setText("SAVE")
		outputDebugString("Opened both windows... save mode is set.")
		return true
	end

	outputDebugString("Cannot set to save mode...")
	return false
end

--------------------------------------------------
-- Opens both second.window and sets text to some
-- gui elements which is also known as 'load'
--------------------------------------------------
function guirun:setLoadMode()

	local window = self.second.window
	local other = self.third.window
	local funcButton = self.second.button[1]

	if not (window:getVisible() or other:getVisible()) then

		window:setVisible(true)

		-- Set text to elements

		window:setText("LOAD")
		funcButton:setText("LOAD")
		outputDebugString("Opened windows, set elements text... load mode is set.")
		return true
	end

	outputDebugString("Cannot set to load mode...")
	return false
end

--------------------------------------------------
-- Populates gridlist
--------------------------------------------------

function guirun:populateGridlist()
	if code ~= nil or #code > 0 then
		local gridlist = self.second.gridlist[1]
		
		for i, v in ipairs(code) do
			local r = gridlist:addRow()
			gridlist:setItemText(r, col, i)
		end
		outputDebugString("Set values to gridlist")
		return true
	end

	outputDebugString("Cannot populate gridlist")
	return false
end



--------------------------------------------------
-- THESE FUNCTIONS WILL ONLY WORK WHEN ATTACHED
-- TO onClientMouseEnter/onClientMouseLeave
--------------------------------------------------
function onLabelEnter()
	if isElement(this) then
		local i = settings.hoverColor
		this:setColor(i[1], i[2], i[3])
	end
end

function onLabelLeave()
	if isElement(this) then
		local i = settings.leaveColor
		this:setColor(i[1], i[2], i[3])
	end
end


-- addEventHandler("onClientMouseEnter", guirun.label[1], onLabelEnter, false)
-- addEventHandler("onClientMouseEnter", guirun.label[2], onLabelEnter, false)
-- addEventHandler("onClientMouseLeave", guirun.label[1], onLabelLeave, false)
-- addEventHandler("onClientMouseLeave", guirun.label[2], onLabelLeave, false)
-- addEventHandler("onClientGUIClick", guirun.label[1], 
-- 	function()
-- 		guirun:setSaveMode()
-- 	end
-- , false)

-- addEventHandler("onClientGUIClick", guirun.label[2], 
-- 	function()
-- 		guirun:setLoadMode()
-- 	end
-- , false)

-- addCommandHandler("guirun",
-- 	function()
-- 		local n = not (guirun.window:getVisible())
-- 		guirun:setVisible(not n)
-- 	end
-- )