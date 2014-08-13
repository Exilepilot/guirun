--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MAIN WINDOW
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

guirun = {
    radiobutton = {},
    button = {},
    window = {},
    label = {},
    memo = {}
}

guirun.window[1] 	  = guiCreateWindow(0.26, 0.27, 0.47, 0.46, "RUNCODE", true)
guirun.label[1] 	  = guiCreateLabel(0.04, 0.06, 0.12, 0.04, "SAVE", true, guirun.window[1])
guirun.label[2] 	  = guiCreateLabel(0.16, 0.06, 0.12, 0.04, "LOAD", true, guirun.window[1])
guirun.label[3] 	  = guiCreateLabel(0.06, 0.90, 0.12, 0.04, "SRUN", true, guirun.window[1])
guirun.label[4] 	  = guiCreateLabel(0.20, 0.90, 0.12, 0.04, "CRUN", true, guirun.window[1])
guirun.memo[1]  	  = guiCreateMemo(0.04, 0.13, 0.92, 0.75, "", true, guirun.window[1])
guirun.radiobutton[1] = guiCreateRadioButton(0.04, 0.90, 0.02, 0.04, "", true, guirun.window[1])
guirun.radiobutton[2] = guiCreateRadioButton(0.18, 0.90, 0.02, 0.04, "", true, guirun.window[1])
guirun.button[1] 	  = guiCreateButton(0.68, 0.91, 0.13, 0.06, "RUN CODE", true, guirun.window[1])
guirun.button[2]      = guiCreateButton(0.83, 0.91, 0.13, 0.06, "CLOSE", true, guirun.window[1])

-- WINDOW SETTINGS
	guiWindowSetMovable(guirun.window[1], false)
	guiWindowSetSizable(guirun.window[1], false)
	guiSetAlpha(guirun.window[1], 0.95)
	guirun.window[1]:setVisible(false)	-- close newly created window

-- LABEL SETTINGS
	guiSetFont(guirun.label[1], "default-bold-small")
	guiLabelSetHorizontalAlign(guirun.label[1], "center", false)
	guiLabelSetVerticalAlign(guirun.label[1], "center")
	
	guiSetFont(guirun.label[2], "default-bold-small")
	guiLabelSetColor(guirun.label[2], 93, 174, 48)
	guiLabelSetHorizontalAlign(guirun.label[2], "center", false)
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

--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; LOAD/SAVE WINDOW
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

utils = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}

-- MAIN LOAD/SAVE WINDOW
utils.window[1] 	= guiCreateWindow(0.40, 0.27, 0.20, 0.51, "", true)
	utils.gridlist[1] 	= guiCreateGridList(0.04, 0.08, 0.93, 0.81, true, utils.window[1])
	utils.button[1] 	= guiCreateButton(0.04, 0.89, 0.46, 0.05, "", true, utils.window[1])
	utils.button[2] 	= guiCreateButton(0.50, 0.89, 0.46, 0.05, "BACK", true, utils.window[1])

-- THIS WINDOW IS TO COMPLEMENT THE SAVE FEATURE
utils.window[2] 	= guiCreateWindow(0.60, 0.27, 0.13, 0.17, "Details", true)
	utils.label[1] 		= guiCreateLabel(0.05, 0.24, 0.40, 0.12, "Name", true, utils.window[2])
	utils.label[2] 		= guiCreateLabel(0.05, 0.65, 0.89, 0.27, "Name is required!", true, utils.window[2])
	utils.edit[1] 		= guiCreateEdit(0.05, 0.40, 0.89, 0.18, "", true, utils.window[2])

-- WINDOW SETTINGS
	guiWindowSetMovable(utils.window[1], false)
	guiWindowSetSizable(utils.window[1], false)
	guiSetAlpha(utils.window[1], 0.87)
	guiSetProperty(utils.window[1], "AlwaysOnTop", "True")
	utils.window[1]:setVisible(false)

	guiWindowSetMovable(utils.window[2], false)
	guiWindowSetSizable(utils.window[2], false)
	guiSetAlpha(utils.window[2], 0.87)
	guiSetProperty(utils.window[2], "AlwaysOnTop", "True")
	utils.window[2]:setVisible(false)

-- GRIDLIST SETTINGS
	guiGridListAddColumn(utils.gridlist[1], "NAME", 0.9)
	
-- BUTTON SETTINGS
	guiSetProperty(utils.button[1], "NormalTextColour", "FFAAAAAA")
	guiSetProperty(utils.button[2], "NormalTextColour", "FFAAAAAA")

-- LABEL SETTINGS
	guiSetFont(utils.label[1], "default-bold-small")
	guiLabelSetHorizontalAlign(utils.label[1], "center", false)
	guiLabelSetVerticalAlign(utils.label[1], "center")

	guiSetFont(utils.label[2], "default-bold-small")
	guiLabelSetHorizontalAlign(utils.label[2], "center", false)
	guiLabelSetVerticalAlign(utils.label[2], "center")
	utils.label[2]:setVisible(false)