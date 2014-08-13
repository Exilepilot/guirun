--[[
	Handles the client XML part of script.
--]]

-- RENAME FUNCTIONS NEEDED

local createFile 	= xmlCreateFile
local createChild 	= xmlCreateChild
local saveFile		= xmlSaveFile
local unloadFile	= xmlUnloadFile
local findChild		= xmlFindChild
local loadFile		= xmlLoadFile
local getAttributes = xmlNodeGetAttributes
local setAttribute	= xmlNodeSetAttribute
local getAttribute 	= xmlNodeGetAttribute

local settings = {
	fileName 	= "code.xml",
	rootNode 	= "root",
	childNode 	= "code",
}

-- PUBLIC table for gui to use.
code = {
	
}

-- Creates code read/write file.
function xmlCreate()
	local problem = false
	local root = createFile(settings.fileName, settings.rootNode)
	local childNode = nil	-- Make local variable inside scope of function instead of if-statement for debugging.

	if root then
		childNode = createChild(root, settings.childNode)
		if childNode then
			-- SAVE FILE AND UNLOAD 
			saveFile(root)
			unloadFile(root)
			return true
		end
	end

	outputDebugString("ROOT NODE: "..tostring(root).." CHILD NODE: "..tostring(childNode))
	return false
end

-- Does the the file exist?
function xmlDoesFileExist()
	local root = loadFile(settings.fileName)

	if root then
		unloadFile(root)
		return true
	end
	return false
end

-- Read file and populate code table.
function xmlGetCode()

	local root, child = nil, nil

	if xmlDoesFileExist() then
		root = loadFile(settings.fileName)
		child = findChild(root, settings.childNode, 0)

		if child then
			for i, v in ipairs(getAttributes(child)) do
				if v ~= nil then
					code[i] = v
				end
			end
			outputDebugString("Found "..#code.." files...")
			unloadFile(root)
			return true
		end
	end

	outputDebugString("ROOT: "..tostring(root).." CHILD: "..tostring(child))
	return false
end

-- Make overwriting possible
function xmlDoesAttributeAlreadyExist(attributeName)
	assert(type(attributeName) == "string")
	local root, child, attribute = loadFile(settings.fileName), nil, nil

	if root then
		child = findChild(root, settings.childNode, 0)
		if child then
			attribute = getAttribute(child, attributeName)
			if attribute then
				return true
			end
		end
	end

	outputDebugString("ROOT: "..tostring(root).." CHILD: "..tostring(child).." ATTRIBUTE: "..tostring(attribute))
	return false
end

function xmlSaveCode(codeName)
	
end