
--  /$$$$$$$$ /$$    /$$ /$$$$$$$$ /$$   /$$ /$$$$$$$$       /$$   /$$  /$$$$$$  /$$   /$$ /$$$$$$$  /$$       /$$$$$$ /$$   /$$  /$$$$$$ 
-- | $$_____/| $$   | $$| $$_____/| $$$ | $$|__  $$__/      | $$  | $$ /$$__  $$| $$$ | $$| $$__  $$| $$      |_  $$_/| $$$ | $$ /$$__  $$
-- | $$      | $$   | $$| $$      | $$$$| $$   | $$         | $$  | $$| $$  \ $$| $$$$| $$| $$  \ $$| $$        | $$  | $$$$| $$| $$  \__/
-- | $$$$$   |  $$ / $$/| $$$$$   | $$ $$ $$   | $$         | $$$$$$$$| $$$$$$$$| $$ $$ $$| $$  | $$| $$        | $$  | $$ $$ $$| $$ /$$$$
-- | $$__/    \  $$ $$/ | $$__/   | $$  $$$$   | $$         | $$__  $$| $$__  $$| $$  $$$$| $$  | $$| $$        | $$  | $$  $$$$| $$|_  $$
-- | $$        \  $$$/  | $$      | $$\  $$$   | $$         | $$  | $$| $$  | $$| $$\  $$$| $$  | $$| $$        | $$  | $$\  $$$| $$  \ $$
-- | $$$$$$$$   \  $/   | $$$$$$$$| $$ \  $$   | $$         | $$  | $$| $$  | $$| $$ \  $$| $$$$$$$/| $$$$$$$$ /$$$$$$| $$ \  $$|  $$$$$$/
-- |________/    \_/    |________/|__/  \__/   |__/         |__/  |__/|__/  |__/|__/  \__/|_______/ |________/|______/|__/  \__/ \______/ 
--
--------------------------------------------------
-- If not the most important part of the file
-- this strings the GUI functions with the 
-- actual gui elements not to exclude the XML.
--------------------------------------------------                                                                                                                                       
                                                                                                                                       
                                                                                                                                       

addEventHandler("onClientMouseEnter", guirun.label[1], onLabelEnter, false)
addEventHandler("onClientMouseEnter", guirun.label[2], onLabelEnter, false)
addEventHandler("onClientMouseLeave", guirun.label[1], onLabelLeave, false)
addEventHandler("onClientMouseLeave", guirun.label[2], onLabelLeave, false)


--------------------------------------------------
-- When guirun.label[1] is clicked on enter
-- save mode.
--------------------------------------------------
addEventHandler("onClientGUIClick", guirun.label[1], 
	function ()
		guirun:setSaveMode(true)
		handleXML()
		guirun:populateGridlist()
	end
, false
)

--------------------------------------------------
-- When guirun.label[2] is clicked on enter
-- load mode.
--------------------------------------------------
addEventHandler("onClientGUIClick", guirun.label[2], 
	function ()
		guirun:setLoadMode(true)
		handleXML()
		guirun:populateGridlist()
	end
, false
)

addEventHandler("onClientGUIClick", guirun.second.button[2], 
	function ()
		-- Define local convertion table
		local i = {
			["SAVE"] = function (x) guirun:setSaveMode(x)  end,
			["LOAD"] = function (x) guirun:setLoadMode(x)  end
		}
		
		local mode = guirun.second.button[1]:getText()
		i[mode](false)
	end, false
)

-- TEMP COMMAND
addCommandHandler("guirun",
	function ()
		local n = not (guirun.window:getVisible())
		guirun:setVisible(not n)
	end
)

addEventHandler("onClientGUIDoubleClick", guirun.second.gridlist[1],
	function()

		if guirun.second.window:getVisible() then
			local _mode = guirun.second.window:getText()
			if _mode == "LOAD" then
				local itemText = guirun:getSelectedItemText()
				if itemText then
					guirun:setMemoText(getCodeFromKey(itemText))
					guirun:setLoadMode(false)
				end
				assert(itemText, "Somethign went wrong ")
			elseif _mode == "SAVE" then

				local itemText = guirun:getSelectedItemText()
				if itemText then
					guiSetText(guirun.third.edit[1], itemText)
				end
			end
		end		

	end, false
)

addEventHandler("onClientGUIClick", guirun.second.button[1],
	function()
		local _MODE = guiGetText(this)

		if _MODE == "SAVE" then
			local editName = guiGetText(guirun.third.edit[1])
			if #editName > 1 then 
				local memoText = guiGetText(guirun.memo[1])
				if #memoText > 2 then
					saveCode(editName, memoText)
					handleXML()
					guirun:populateGridlist()
					return
				end
			end
		end	
	end
)

addEventHandler("onClientGUIClick", guirun.second.button[3],
	function ( ... )
		local _mode = guiGetText(guirun.second.window)
		guirun:expandWindow(not settings._EXPANDED)
	end)
