

--  /$$   /$$ /$$      /$$ /$$             /$$   /$$  /$$$$$$  /$$   /$$ /$$$$$$$  /$$       /$$$$$$ /$$   /$$  /$$$$$$ 
-- | $$  / $$| $$$    /$$$| $$            | $$  | $$ /$$__  $$| $$$ | $$| $$__  $$| $$      |_  $$_/| $$$ | $$ /$$__  $$
-- |  $$/ $$/| $$$$  /$$$$| $$            | $$  | $$| $$  \ $$| $$$$| $$| $$  \ $$| $$        | $$  | $$$$| $$| $$  \__/
--  \  $$$$/ | $$ $$/$$ $$| $$            | $$$$$$$$| $$$$$$$$| $$ $$ $$| $$  | $$| $$        | $$  | $$ $$ $$| $$ /$$$$
--   >$$  $$ | $$  $$$| $$| $$            | $$__  $$| $$__  $$| $$  $$$$| $$  | $$| $$        | $$  | $$  $$$$| $$|_  $$
--  /$$/\  $$| $$\  $ | $$| $$            | $$  | $$| $$  | $$| $$\  $$$| $$  | $$| $$        | $$  | $$\  $$$| $$  \ $$
-- | $$  \ $$| $$ \/  | $$| $$$$$$$$      | $$  | $$| $$  | $$| $$ \  $$| $$$$$$$/| $$$$$$$$ /$$$$$$| $$ \  $$|  $$$$$$/
-- |__/  |__/|__/     |__/|________/      |__/  |__/|__/  |__/|__/  \__/|_______/ |________/|______/|__/  \__/ \______/ 
--
--------------------------------------------------
-- This part of the file handles the XML
-- which is used mainly to save and load code
-- within the guirun script.
--------------------------------------------------                                                                                                                     
                                                                                                                     

--------------------------------------------------
-- Check if file exists
--------------------------------------------------
function fileExist()
	local rootNode = xmlLoadFile(settings.fileName)

	if rootNode then
		xmlUnloadFile(rootNode)
		return true
	end

	return false
end

--------------------------------------------------
-- Saves code onto XML file.
-- Enables overwriting of file as well.
--------------------------------------------------

function saveCode(key, code)
	assert(type(key, code) == "string", "Incorrect type expected string")
	local root, child = xmlLoadFile(settings.fileName), nil

	if root then
		child = xmlFindChild(root, settings.childNode, 0)

		if child then
			local success = xmlNodeSetAttribute(child, key, code)

			if success then
				xmlSaveFile(root)
				xmlUnloadFile(root)
				return true
			end

			assert( success, "Could not set attribute successfully. Sending variables..." )
			error ( tostring(child).." / "..tostring(key).." / "..tostring(code)          )
			error ( "Bailing out..."                                                      )	
			
			xmlUnloadFile(root)
		end
		assert( child, "Could not find child" )
		xmlUnloadFile(root)
	end

	assert( root, "Could not find file!")
	return false
end

--------------------------------------------------
-- Very nested function of if-statements to find
-- errors and such. This loads code onto code table

-- Pilot - Fixed function not working properly
--------------------------------------------------
function loadCode()
	assert(fileExist(), "Whoops seems like no files have been found!")

	local root, child = xmlLoadFile(settings.fileName)

	if root then
		child = xmlFindChild(root, settings.childNode, 0)
		if child then
			local attributes = xmlNodeGetAttributes(child)
			assert( type(attributes) == "table", "Unable to use this data" )
			-- If not useless
			code = attributes
			xmlUnloadFile(root)
			return true
		end
		assert( child, "Cannot find child node" )
		xmlUnloadFile(root)
	end
	assert( root, "Cannot find root node" )
	return false
end

--------------------------------------------------
-- Checks multiple things 
--------------------------------------------------
function handleXML()
	if fileExist() then
		local success = loadCode()
		if success then
			return true
		end
	end

	return false
end
