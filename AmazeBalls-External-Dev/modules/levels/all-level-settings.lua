local widget = require("widget")
local t = {}

t.createLevelSettings = function (mainFunc, creationType)

	if (creationType == "in-level") then
		--put into this format script instead
		squareHeight = (display.contentHeight * (13/16)) / 5 -- (13/16) & 5 for default, (13/16) & 9 for tablet
		squareWidth = (display.contentWidth * (7/8)) / 7 --
		gutterWidth = display.contentWidth / 16 

		-- tablet
		-- squareHeight = (display.contentHeight * (13/16)) / 9 -- (13/16) & 5 for default, (13/16) & 9 for tablet
		-- squareWidth = (display.contentWidth * (9/10)) / 13 -- for tablet
		-- gutterWidth = display.contentWidth / 20

		gutterHeight = display.contentHeight * (3/32) -- 3/32 for default, 3/32 for tablet
		----

		shapeArray = {}
		shapeArrayParameters = {}
		transitionArrayIndex = {}

		backgroundObjectsGroup = display.newGroup()
		screenObjectsGroup = display.newGroup()
		midScreenObjectsGroup = display.newGroup()
		frontScreenObjectsGroup = display.newGroup()
		pauseScreenObjectsGroup = display.newGroup()
		itemScreenObjectsGroup = display.newGroup()

		ballScreenVertValue = mainFunc.thisLevelSettings.ballFirstScreenVertValue
		ballScreenHorzValue = mainFunc.thisLevelSettings.ballFirstScreenHorzValue

		transitionForProjectile = {
		    ball = {},
		    bullet = {},
		    hookshot = {}
		}

		moveSomethingCounter = 0
		pressCount = 0

		rightScreenEdge = (ballScreenHorzValue * display.contentWidth)
		leftScreenEdge = ((ballScreenHorzValue - 1) * display.contentWidth)
		topScreenEdge = ((ballScreenVertValue - 1) * display.contentHeight)
		bottomScreenEdge = (ballScreenVertValue * display.contentHeight)

		screenInitialiserHorzValue = 1
		screenInitialiserVertValue = 1

		screenInitialiserInTransition = false
		nextScreenInitialiserTransition = "horizontal"
		screenInitialiserHorzTransition = "incomplete"
		screenInitialiserVertTransition = "incomplete"
		relevantHorzScreen = mainFunc.thisLevelSettings.screenHorzTotal

		thisSwitch = null
		screenChangeType = null
		ballActivateButtonSet = false
		pauseButtonsEnabled = true
		isSomethingTransitioning = false
		tunnelIsActive = true

		ballspeed = 2

		defaultLevelTime = 6000

		levelFirstStarted = 0
		lifeCounter = 1
		object1Counter = 0
		screenTimer = 0
		directionCounter = 0
		mapShowCounter = 0
		gemCounter = 0
		initialReturnToBallScreenCounter = 0
		mainScreenChangeSpeed = display.contentWidth / 12

		shouldBallMoveCounter = 0

		edgesTransitionscounter = 0
		manualScreenChangeCounter = 0
		tunnelCounter = 0
		moveslow_Counter = 1
		direction = mainFunc.thisLevelSettings.initialDirection

		flipVerticalCounter = 0

		fanCenteringCounter = 0
		autoFanCounter = 0
		manualFanCounter = 0
		spitterCounter = 0

		stillTransitioningCounter = 0
		transitionMoveCounter = 0
		secondTransitionMoveCounter = 0

		returnToBallVertTransition = 0
		returnToBallHorzTransition = 0

		numberOfSwitchesCounter = 1

		playCounter = 0
		isBallMovingState = "false"

		bullet = {}
		bulletHasFired = false

		createdBulletCounter = 0
		moveBulletOff = true

		thisObjectBreakability = false
		itemBagIsOpen = false

		specialBallActive = false

		backgroundImage = "images/level-images/" .. currentWorld .. "/Layout/world-background.png"

		directionArrayIndex = {
		    -- NO NEED TO CHANGE THESE 6 DIRECTION OPTIONS
		    
		    {	{1}, {
					"down",
					"up",
					"left",
					"right"
				},
				{2}, {
					"down",
					"left",
					"right",
					"up"
				},
				{3}, {
					"left",
					"down",
					"up",
					"right"
				}
		    },

		    {	{1}, {
					"down",
					"left",
					"right",
					"up"
				},
				{2}, {
					"down",
					"up",
					"left",
					"right"
				},
				{3}, {
					"right",
					"left",
					"up",
					"down"
				}
		    },

		    {	{1}, {
					"right",
					"left",
					"up",
					"down"
				},
				{2}, {
					"left",
					"down",
					"up",
					"right"
				},
				{3}, {
					"down",
					"left",
					"right",
					"up"
				}
		    },

		    {	{1}, {
					"left",
					"down",
					"up",
					"right"
				},
				{2}, {
					"right",
					"left",
					"up",
					"down"
				},
				{3}, {
					"down",
					"up",
					"left",
					"right"
				}
		    },
		    --Big Triangle LeftAndRight
		    {	{1}, {
			    	"right",
			    	"left",
			    	"right",
			    	"specialRule",
			    	"",
			   	 	"",
			    	"up",
			    	"down"
				},
				{2},{
			    	"left",
			    	"specialRule",
			    	"left",
			    	"right",
			    	"up",
			    	"down",
			    	"",
			    	""
				}
		    },
		    --Big Triangle TopAndBottom
		    {	{1}, {
			    	"down",
			    	"up",
			    	"specialRule",
			    	"up",
			    	"",
			    	"",
			    	"left",
			    	"right"
				},
				{2},{
			    	"specialRule",
			    	"down",
			    	"up",
			    	"down",
			    	"left",
			    	"right",
			    	"",
			    	""
				}
		    },

		    --- 7 - GunSquare
		    {	{1}, {
			    	"down",
			    	"left",
			    	"up",
			    	"right",
				}
		    },

		    --Bar no KillBars - 8, labelled as 1 in Level Design
		    {	{"horz"}, {
			    	{"down"},
			    	"left",
			    	{"up"},
			    	"right",
				},
				{"vert"},{
			    	"down",
			    	{"left"},
			    	"up",
			    	{"right"},
				}
		    },

		    --Bar KillBars on Top/left - 9, labelled as 2 in Level Design
		    {	{"horz"}, {
			    	{"down"},
			    	{"left"},
			    	{"up"},
			    	"right",
				},
				{"vert"},{
			    	"down",
			    	{"left"},
			    	{"up"},
			    	{"right"},
				}
		    },

		    --Bar KillBars on Bottom/Right - 10, labelled as 3 in Level Design
		    {	{"horz"}, {
			    	{"down"},
			    	"left",
			    	{"up"},
			    	{"right"},
				},
				{"vert"},{
			    	{"down"},
			    	{"left"},
			    	"up",
			    	{"right"},
				}
		    },

		    --Bar KillBars both sides - 11, labelled as 4 in Level Design
		    {	{"horz"}, {
			    	{"down"},
			    	{"left"},
			    	{"up"},
			    	{"right"},
				},
				{"vert"},{
			    	{"down"},
			    	{"left"},
			    	{"up"},
			    	{"right"},
				}
		    }
		    
		    -- PUT YOUR CUSTOM DIRECTION OPTIONS HERE
		    ,
		    -- put the comma above into the code if you have added custom styles
		    
		    {	--1	
		    	{1},{ {"down"}, "left", "right", "up" },
		    	{2},{ {"down"}, "up", "left", "right" },
		    	{3},{ "right", "left", "down", {"up"} }
		    }

		    ,

		    {	--2
		    	{1},{ "left", "down", "up", {"right"} }
		    }

		    ,

		    {	--3
		    	{1},{ "right", "left", {"up"}, "down" },
		    	{2},{ "left", "down", {"up"}, "right" },
		    	{3},{ "right", "left", {"up"}, "down" }
		    }

		    ,

		    {	--4
		    	{1},{ "left", "down", {"up"}, "right" },
		    	{2},{ "right", "left", {"up"}, "down" }
		    }

		    ,

		    {	--5
		    	{1},{ {"down"}, "up", "left", "right" },
		    	{2},{ {"down"}, "left", "right", "up" },
		    	{3},{ "left", "down", "right", {"up"} }
		    }

		    ,

		    {	--6
		    	{1},{ "down", "up", "left", {"right"} },
		    	{3},{ "left", "down", "up", {"right"} }
		    }

		    ,

		    {	--7
		    	{1},{ {"left"}, {"down"}, "up", "right" }
		    }

		    ,

		    {	--8
		    	{1},{ {"right"}, "left", "up", {"down"} }
		    }

		    ,

		    {	--9
		    	{1},{ "right", {"left"}, "up", "down" },
		    	{2},{ "left", "down", "up", {"right"} },
		    	{3},{ "down", {"left"}, "right", "up" }
		    }

		    ,

		    {	--10
		    	{1},{ "down", "left", {"right"}, {"up"} }
		    }

		    ,

		    {	--11
		    	{1},{ "down", {"up"}, {"left"}, "right" },
		    	{2},{ "down", "up", {"right"}, {"up"} },
		    	{3},{ {"left"}, {"down"}, "up", "right" }
		    }

		    ,
		    --12
		    {	{1}, {
			    	"specialRule",
			    	"up",
			    	"specialRule",
			    	"up",
			    	{"down"},
			    	"down",
			    	"left",
			    	"right"
				}
		    }

		    ,

		    {	--13
		    	{1},{ "down", {"left"}, "right", "up" },
		    	{2},{ "down", "up", "left", {"right"} },
		    	{3},{ "right", {"left"}, "up", "down" }
		    }

		    ,

		    {	--14
		    	{1},{ "right", {"left"}, {"up"}, "down" },
		    	{2},{ "left", "down", {"up"}, {"right"} },
		    	{3},{ {"down"}, {"left"}, "right", "up" }
		    }

		    ,

		    {	--15
		    	{1},{ {"down"}, "up", "left", {"right"} },
		    	{2},{ {"down"}, {"left"}, "right", "up" },
		    	{3},{ "left", "down", {"up"}, {"right"} }
		    }

		    ,

		    {	--16
		    	{1},{ {"down"}, {"left"}, "right", "up" }
		    }

		    ,

		    {	--17
		    	{1},{ "down", {"left"}, {"right"}, {"up"} }
		    }

		    , --18

		    {	{1}, {
			    	"specialRule",
			    	"up",
			    	{"up"},
			    	"up",
			    	{"down"},
			    	"down",
			    	"right",
			    	{"left"}
				}
		    }

		    ,
		    --19
		    {	{1}, {
			    	"specialRule",
			    	"up",
			    	"specialRule",
			    	"up",
			    	{"down"},
			    	{"down"},
			    	"left",
			    	"right"
				},
				{2}, {
			    	"specialRule",
			    	"down",
			    	"specialRule",
			    	"down",
			    	"left",
			    	"right",
			    	{"up"},
			    	{"up"}
				}
		    }

		    ,
		    --20
		    {	{1}, {
			    	"left",
			    	"down",
			    	{"up"},
			    	{"right"}
				}
		    }

		    ,
		    --21
		    {	{1}, {
			    	{"right"},
			    	{"left"},
			    	"up",
			    	{"down"}
				}
		    }

		    ,
		    --22
		    {	{1}, {
			    	{"left"},
			    	{"down"},
			    	{"up"},
			    	"right"
				}
		    }

		    ,
		    --23
		    {	{1}, {
			    	{"left"},
			    	{"down"},
			    	{"up"},
			    	{"right"}
				}
		    }

		    ,
		    --24
		    {	{1}, {
			    	{"down"},
			    	"down",
			    	{"right"},
			    	{"up"}
				}
		    }

		    ,
		    --25
		    {	{1}, {
			    	{"left"},
			    	{"down"},
			    	"up",
			    	{"right"}
				}
		    }

		    ,
		    --26
		    {	{1}, {
			    	{"down"},
			    	{"up"},
			    	{"left"},
			    	"right"
				}
		    }

		    ,
		    --27
		    {	{1}, {
			    	{"down"},
			    	{"left"},
			    	{"right"},
			    	{"up"}
				}
		    }
		    
		    -- every time you enter a new Array, put the comma into the code before it, same as above
		}

		gem_counter = {
		    purple = 0,
		    redCoin = 0,
		    purpleCoin = 0,
		    blueCoin = 0,
		    coins = 0
		}

		--

		isWaitingForBombForScreenChange = false
		waitingForScreenChangeDirection = nil

		--

		showingToolsArray = {}
		showingObjectsArray = {}

		connectorArray = {}

		isScreenPausedState = false
		itemBagIsOpen = false
		mysteryBlockBagIsOpen = false

	end

	--general config for bonus values

	coinsGainedPerGem = 10
	coinsGainedPerTenthOfASecond = 10
	coinsGainedForRedCoin = 15
	coinsGainedForBlueCoin = 25
	coinsGainedForPurpleCoin = 50

	levelItemsImageSheet = "images/objects/level-items.png"
	levelItemsImageSheetSettings = {width = 43, height = 32, numFrames = 4, sheetContentWidth = 172, sheetContentHeight = 32}
	levelItemsSequenceData = {
	    { name = "silverMap", start=1, count=1,   loopCount=1 },
	    { name = "goldMap", start=2, count=1, loopCount=1 },
	    { name = "silverCompass", start=3, count=1, loopCount=1 },
	    { name = "goldCompass", start=4, count=1, loopCount=1 }
	}

	levelItems2ImageSheet = "images/objects/level-items2.png"
	levelItems2ImageSheetSettings = {width = 60, height = 52, numFrames = 8, sheetContentWidth = 240, sheetContentHeight = 104}
	levelItems2SequenceData = {
	    { name = "red", start=1, count=1,   loopCount=1 },
	    { name = "blueCoin", start=2, count=1, loopCount=1 },
	    { name = "purpleCoin", start=3, count=1, loopCount=1 },
	    { name = "purple", start=4, count=1, loopCount=1 },
	    { name = "redCoinFloating", start=5, count=1,   loopCount=1 },
	    { name = "blueCoinFloating", start=6, count=1, loopCount=1 },
	    { name = "purpleCoinFloating", start=7, count=1, loopCount=1 },
	    { name = "purpleFloating", start=8, count=1, loopCount=1 }
	}

	levelItemsBackboardImageSheet = graphics.newImageSheet( "images/objects/level-item-backboards.png", {width = 45, height = 37.5, numFrames = 5, sheetContentWidth = 225, sheetContentHeight = 75})
	levelItemsBackboardSequenceData = {
        { name = "gem", start=1, count=1,   loopCount=1 },
        { name = "redCoin", start=2, count=1, loopCount=1 },
        { name = "blueCoin", start=3, count=1, loopCount=1 },
        { name = "purpleCoin", start=4, count=1, loopCount=1 },
        { name = "item", start=5, count=1, loopCount=1 },
        { name = "purpleRing", start=6, count=1, loopCount=1 },
        { name = "redCoinRing", start=7, count=1, loopCount=1 },
        { name = "blueCoinRing", start=8, count=1, loopCount=1 },
        { name = "purpleCoinRing", start=9, count=1, loopCount=1 }
    }

    lifeLostScreenBgImageSheet = graphics.newImageSheet( "images/objects/Layout/lifeLostScreenBg.png", {width = xCalc(522), height = yCalc(108), numFrames = 3, sheetContentWidth = xCalc(522), sheetContentHeight = yCalc(324)})
    lifeLostScreenBgSequenceData = {
        { name = "3", start=1, count=1,   loopCount=1 },
        { name = "4", start=2, count=1,   loopCount=1 },
        { name = "5", start=3, count=1,   loopCount=1 }
    }

    largeIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Large-icons.png", {width = 100, height = 104, numFrames = 1, sheetContentWidth = 100, sheetContentHeight = 104})
    largeIconsSequenceData = {
        { name = "ball", start=1, count=1,   loopCount=1 }
    }

	smallIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/Small-icons.png", {width = 32, height = 30, numFrames = 9, sheetContentWidth = 288, sheetContentHeight = 30})
    smallIconsSequenceData = {
        { name = "lives", start=1, count=1,   loopCount=1 },
        { name = "gems", start=2, count=1, loopCount=1 },
        { name = "coins", start=3, count=1, loopCount=1 },
        { name = "goldMedal", start=4, count=1, loopCount=1 },
        { name = "silverMedal", start=5, count=1, loopCount=1 },
        { name = "plusButton-inactive", start=6, count=1, loopCount=1 },
        { name = "plusButton-active", start=7, count=1, loopCount=1 },
        { name = "question-mark", start=8, count=1, loopCount=1 }
    }

    allFansImageSheet = graphics.newImageSheet( "images/objects/shapes/allFans.png", {width = xCalc(60), height = yCalc(52), numFrames = 22, sheetContentWidth = xCalc(660), sheetContentHeight = yCalc(104)})
    allFansSequenceData = {
    	{ name = "autoFan", start=1, count=1,   loopCount=1 },
        { name = "manualFan", start=2, count=1, loopCount=1 },
        { name = "backFire", start=3, count=1, loopCount=1 },
        { name = "simple", start=4, count=1, loopCount=1 },
        { name = "spitter", start=5, count=1, loopCount=1 },
        { name = "tunnel", start=6, count=1, loopCount=1 },
        { name = "characterChangePoint", start=7, count=1, loopCount=1 },
        { name = "gunBase", start=8, count=1, loopCount=1 },
        { name = "autoFan-sliding", start=9, count=1,   loopCount=1 },
        { name = "manualFan-sliding", start=10, count=1, loopCount=1 },
        { name = "backFire-sliding", start=11, count=1, loopCount=1 },
        { name = "simple-sliding", start=12, count=1, loopCount=1 },
        { name = "spitter-sliding", start=13, count=1, loopCount=1 },
        { name = "tunnel-sliding", start=14, count=1, loopCount=1 },
        { name = "characterChangePoint-sliding", start=15, count=1, loopCount=1 },
        { name = "gunBase-sliding", start=16, count=1, loopCount=1 }
	}

	horizontalConnectorTubesImageSheet = graphics.newImageSheet( "images/objects/shapes/connectorPieces/horizontal-TubesSprite.png", {width = xCalc(60), height = yCalc(8), numFrames = 11, sheetContentWidth = xCalc(60), sheetContentHeight = yCalc(88)})
	verticalConnectorTubesImageSheet = graphics.newImageSheet( "images/objects/shapes/connectorPieces/vertical-TubesSprite.png", {width = 8, height = 60, numFrames = 8, sheetContentWidth = 64, sheetContentHeight = 60})
	cornerConnectorTubesImageSheet = graphics.newImageSheet( "images/objects/shapes/connectorPieces/corner-TubesSprite.png", {width = 15, height = 55, numFrames = 8, sheetContentWidth = 15, sheetContentHeight = 440})
	connectorSpotsImageSheet = graphics.newImageSheet( "images/objects/shapes/connectorPieces/spotsSprite.png", {width = 22, height = 21, numFrames = 11, sheetContentWidth = 242, sheetContentHeight = 21})
	connectorTubesSequenceData = {
    	{ name = "lightDarkBlue", start=1, count=1,   loopCount=1 },
        { name = "lightBlue", start=2, count=1, loopCount=1 },
        { name = "orange", start=3, count=1, loopCount=1 },
        { name = "silver", start=4, count=1, loopCount=1 },
        { name = "green", start=5, count=1, loopCount=1 },
        { name = "darkBlue", start=6, count=1, loopCount=1 },
        { name = "yellow", start=7, count=1, loopCount=1 },
        { name = "brown", start=8, count=1, loopCount=1 },
        { name = "purple", start=9, count=1, loopCount=1 },
        { name = "red", start=10, count=1, loopCount=1 },
        { name = "white", start=11, count=1, loopCount=1 }
	}
	connectorSpotsSequenceData = {
    	{ name = "lightDarkBlue", start=1, count=1,   loopCount=1 },
        { name = "lightBlue", start=2, count=1, loopCount=1 },
        { name = "silver", start=3, count=1, loopCount=1 },
        { name = "orange", start=4, count=1, loopCount=1 },
        { name = "darkBlue", start=5, count=1, loopCount=1 },
        { name = "green", start=6, count=1, loopCount=1 },
        { name = "yellow", start=7, count=1, loopCount=1 },
        { name = "brown", start=8, count=1, loopCount=1 },
        { name = "red", start=9, count=1, loopCount=1 },
        { name = "purple", start=10, count=1, loopCount=1 },
        { name = "white", start=11, count=1, loopCount=1 }
	}
	shapeColourArray = {
		backFire = "lightDarkBlue",
		simple = "lightBlue",
		autoFan = "orange",
		manualFan = "silver",
		shape = "green",
		spitter = "darkBlue",
		tunnel = "yellow",
		bar = "brown",
		characterChangePoint = "purple"
	}

	itemsImageSheet = graphics.newImageSheet( "images/objects/items.png", {width = 60, height = 52, numFrames = 16, sheetContentWidth = 960, sheetContentHeight = 52})
	itemsSequenceData = {
	    { name = "bomb", start=1, count=1,   loopCount=1 },
	    { name = "hook", start=2, count=1, loopCount=1 },
	    { name = "jet", start=3, count=1, loopCount=1 },
	    { name = "clock", start=4, count=1, loopCount=1 },
	    { name = "firstTime-clock", start=5, count=1, loopCount=1 },
	    { name = "dummyBall", start=6, count=1, loopCount=1 },
	    { name = "superBall", start=7, count=1, loopCount=1 },
	    { name = "fireCape", start=8, count=1, loopCount=1 },
	    { name = "iceCape", start=9, count=1, loopCount=1 },
	    { name = "bulletVest", start=10, count=1, loopCount=1 },
	    { name = "characterSpecial", start=11, count=1, loopCount=1 },
	    { name = "small-present", start=12, count=1, loopCount=1 },
	    { name = "mystery-block", start=13, count=1, loopCount=1 },
	    { name = "big-present", start=14, count=1, loopCount=1 },
	    { name = "coins-small", start=15, count=1, loopCount=1 },
	    { name = "coins-big", start=16, count=1, loopCount=1 }
	}

	shapesImageSheet = graphics.newImageSheet( "images/central-images/Layout/itemBagScreen-shapesSprite.png", {width = 60, height = 52, numFrames = 7, sheetContentWidth = 420, sheetContentHeight = 52})
	shapesSequenceData = {
	    { name = "triangle", start=1, count=1,   loopCount=1 },
	    { name = "bar", start=2, count=1, loopCount=1 },
	    { name = "autoFan", start=3, count=1, loopCount=1 },
	    { name = "manualFan", start=4, count=1, loopCount=1 },
	    { name = "spitter", start=5, count=1, loopCount=1 },
	    { name = "simple", start=6, count=1, loopCount=1 },
	    { name = "backFire", start=7, count=1, loopCount=1 }
	}

	triangleImageSheet = graphics.newImageSheet( "images/objects/shapes/triangleSprite.png", {width = 50, height = 50.5, numFrames = 24, sheetContentWidth = 200, sheetContentHeight = 303})
	triangleSequenceData = {
	    { name = "triangleTopRightShape", start=1, count=1,   loopCount=1 },
	    { name = "triangleBottomRightShape", start=2, count=1,   loopCount=1 },
	    { name = "triangleBottomLeftShape", start=3, count=1,   loopCount=1 },
	    { name = "triangleTopLeftShape", start=4, count=1,   loopCount=1 },
	    { name = "triangleTopRightShape-sliding", start=5, count=1,   loopCount=1 },
	    { name = "triangleBottomRightShape-sliding", start=6, count=1,   loopCount=1 },
	    { name = "triangleBottomLeftShape-sliding", start=7, count=1,   loopCount=1 },
	    { name = "triangleTopLeftShape-sliding", start=8, count=1,   loopCount=1 },
	    { name = "breakable-triangleTopRightShape", start=9, count=1,   loopCount=1 },
	    { name = "breakable-triangleBottomRightShape", start=10, count=1,   loopCount=1 },
	    { name = "breakable-triangleBottomLeftShape", start=11, count=1,   loopCount=1 },
	    { name = "breakable-triangleTopLeftShape", start=12, count=1,   loopCount=1 },
	    { name = "icy-triangleTopRightShape", start=13, count=1,   loopCount=1 },
	    { name = "icy-triangleBottomRightShape", start=14, count=1,   loopCount=1 },
	    { name = "icy-triangleBottomLeftShape", start=15, count=1,   loopCount=1 },
	    { name = "icy-triangleTopLeftShape", start=16, count=1,   loopCount=1 },
	    { name = "fire-triangleTopRightShape", start=17, count=1,   loopCount=1 },
	    { name = "fire-triangleBottomRightShape", start=18, count=1,   loopCount=1 },
	    { name = "fire-triangleBottomLeftShape", start=19, count=1,   loopCount=1 },
	    { name = "fire-triangleTopLeftShape", start=20, count=1,   loopCount=1 },
	    { name = "hyroll-triangleTopRightShape", start=21, count=1,   loopCount=1 },
	    { name = "hyroll-triangleBottomRightShape", start=22, count=1,   loopCount=1 },
	    { name = "hyroll-triangleBottomLeftShape", start=23, count=1,   loopCount=1 },
	    { name = "hyroll-triangleTopLeftShape", start=24, count=1,   loopCount=1 },
	}

	triangleLeftAndRightImageSheet = graphics.newImageSheet( "images/objects/shapes/triangleLeftAndRightSprite.png", {width = 52, height = 96, numFrames = 2, sheetContentWidth = 104, sheetContentHeight = 96})
	triangleLeftAndRightSequenceData = {
	    { name = "triangleLeftAndRightShape", start=1, count=1,   loopCount=1 },
	    { name = "triangleLeftAndRightShape-sliding", start=2, count=1,   loopCount=1 }
	}

	triangleTopAndBottomImageSheet = graphics.newImageSheet( "images/objects/shapes/triangleTopAndBottomSprite.png", {width = 96, height = 52, numFrames = 2, sheetContentWidth = 96, sheetContentHeight = 104})
	triangleTopAndBottomSequenceData = {
	    { name = "triangleTopAndBottomShape", start=1, count=1,   loopCount=1 },
	    { name = "triangleTopAndBottomShape-sliding", start=2, count=1,   loopCount=1 }
	}

	barImageSheet = {}
	barSequenceData = {}
	barImageSheet["single"] = {}
	barImageSheet["double"] = {}
	barSequenceData["single"] = {}
	barSequenceData["double"] = {}

	barImageSheet["single"]["horz"] = graphics.newImageSheet( "images/objects/shapes/bar.png", {width = 50, height = 51, numFrames = 2, sheetContentWidth = 100, sheetContentHeight = 51})
	barSequenceData["single"]["horz"] = {
	    { name = "bar", start=1, count=1,   loopCount=1 },
	    { name = "bar-sliding", start=2, count=1,   loopCount=1 }
	}

	barImageSheet["single"]["vert"] = graphics.newImageSheet( "images/objects/shapes/horzbar.png", {width = 50, height = 58, numFrames = 2, sheetContentWidth = 100, sheetContentHeight = 58})
	barSequenceData["single"]["vert"] = {
	    { name = "bar", start=1, count=1,   loopCount=1 },
	    { name = "bar-sliding", start=2, count=1,   loopCount=1 }
	}

	barImageSheet["double"]["horz"] = graphics.newImageSheet( "images/objects/shapes/doublebar.png", {width = 50, height = 101, numFrames = 2, sheetContentWidth = 100, sheetContentHeight = 101})
	barSequenceData["double"]["horz"] = {
	    { name = "doubleBar", start=1, count=1,   loopCount=1 },
	    { name = "doubleBar-sliding", start=2, count=1,   loopCount=1 }
	}

	barImageSheet["double"]["vert"] = graphics.newImageSheet( "images/objects/shapes/double-horzbar.png", {width = 50, height = 165, numFrames = 2, sheetContentWidth = 100, sheetContentHeight = 165})
	barSequenceData["double"]["vert"] = {
	    { name = "doubleBar", start=1, count=1,   loopCount=1 },
	    { name = "doubleBar-sliding", start=2, count=1,   loopCount=1 }
	}

	breakableTriangleImageSheet = graphics.newImageSheet( "images/objects/shapes/breakable-trianglesSprite.png", {width = 60, height = 65, numFrames = 32, sheetContentWidth = 240, sheetContentHeight = 520})
    breakableTriangleSequenceData = {
        { name = "triangleTopRightShape", frames = {1, 2, 3, 4}, time = 350, loopCount=1 },
        { name = "triangleBottomRightShape", frames = {5, 6, 7, 8}, time = 350, loopCount=1 },
        { name = "triangleBottomLeftShape", frames = {9, 10, 11, 12}, time = 350, loopCount=1 },
        { name = "triangleTopLeftShape", frames = {13, 14, 15, 16}, time = 350, loopCount=1 },
        { name = "hyroll-triangleTopRightShape", frames = {17,18,19,20}, time = 350, loopCount=1 },
        { name = "hyroll-triangleBottomRightShape", frames = {21,22,23,24}, time = 350, loopCount=1 },
        { name = "hyroll-triangleBottomLeftShape", frames = {25,26,27,28}, time = 350, loopCount=1 },
        { name = "hyroll-triangleTopLeftShape", frames = {29,30,31,32}, time = 350, loopCount=1 }
    }

	itemBagScreenCounterImageSheet = graphics.newImageSheet( "images/central-images/Layout/itemBagScreen-itemCounter.png", {width = 30, height = 27, numFrames = 10, sheetContentWidth = 300, sheetContentHeight = 27})
	itemBagScreenCounterSequenceData = {
	    { name = "1", start=1, count=1,   loopCount=1 },
	    { name = "2", start=2, count=1, loopCount=1 },
	    { name = "3", start=3, count=1, loopCount=1 },
	    { name = "4", start=4, count=1, loopCount=1 },
	    { name = "5", start=5, count=1, loopCount=1 },
	    { name = "6", start=6, count=1, loopCount=1 },
	    { name = "7", start=7, count=1, loopCount=1 },
	    { name = "8", start=8, count=1, loopCount=1 },
	    { name = "9", start=9, count=1, loopCount=1 },
	    { name = "0", start=10, count=1, loopCount=1 }
	}

	tunnelPiecesImageSheet = graphics.newImageSheet( "images/objects/tunnel-extraPiecesSprite.png", {width = 25, height = 30, numFrames = 21, sheetContentWidth = 175, sheetContentHeight = 90})
    tunnelPiecesSequenceData = {
        { name = "blueCircleOn", start=1, count=1,   loopCount=1 },
        { name = "greenCircleOn", start=2, count=1, loopCount=1 },
        { name = "redCircleOn", start=3, count=1,   loopCount=1 },
        { name = "orangeCircleOn", start=4, count=1, loopCount=1 },
        { name = "whiteCircleOn", start=5, count=1,   loopCount=1 },
        { name = "greyCircleOn", start=6, count=1, loopCount=1 },
        { name = "purpleCircleOn", start=7, count=1,   loopCount=1 },
        { name = "blueCircleOff", start=8, count=1, loopCount=1 },
        { name = "greenCircleOff", start=9, count=1,   loopCount=1 },
        { name = "redCircleOff", start=10, count=1, loopCount=1 },
        { name = "orangeCircleOff", start=11, count=1,   loopCount=1 },
        { name = "whiteCircleOff", start=12, count=1, loopCount=1 },
        { name = "greyCircleOff", start=13, count=1,   loopCount=1 },
        { name = "purpleCircleOff", start=14, count=1, loopCount=1 },
        { name = "blueArrow", start=15, count=1,   loopCount=1 },
        { name = "greenArrow", start=16, count=1, loopCount=1 },
        { name = "redArrow", start=17, count=1,   loopCount=1 },
        { name = "orangeArrow", start=18, count=1, loopCount=1 },
        { name = "whiteArrow", start=19, count=1,   loopCount=1 },
        { name = "greyArrow", start=20, count=1, loopCount=1 },
        { name = "purpleArrow", start=21, count=1,   loopCount=1 }
    }

    charactersIconsImageSheet = graphics.newImageSheet( "images/central-images/Icons/CharactersIconsSprite.png", {width = 140, height = 120, numFrames = 4, sheetContentWidth = 560, sheetContentHeight = 120})
    charactersIconsSequenceData = {
        { name = "normal", start=1, count=1,   loopCount=1 },
        { name = "PuckNorris", start=2, count=1, loopCount=1 },
        { name = "PrincessBoulder", start=3, count=1,   loopCount=1 },
        { name = "TheShuttleMickyTake", start=4, count=1, loopCount=1 }
    }

    characterProfileTextImageSheet = graphics.newImageSheet( "images/objects/Layout/characterDescriptionSprite.png", {width = 251, height = 77, numFrames = 3, sheetContentWidth = 251, sheetContentHeight = 231})
    characterProfileTextSequenceData = {
        { name = "PuckNorris", start=1, count=1, loopCount=1 },
        { name = "PrincessBoulder", start=2, count=1,   loopCount=1 },
        { name = "TheShuttleMickyTake", start=3, count=1, loopCount=1 }
    }

    characterInLevelImageSheet = {}
    characterInLevelImageSheet["normal"] = graphics.newImageSheet( "images/objects/characters/ballSprite.png", {width = 31, height = 34, numFrames = 8, sheetContentWidth = 124, sheetContentHeight = 68})
    characterInLevelImageSheet["PuckNorris"] = graphics.newImageSheet( "images/objects/characters/PuckNorrisSprite.png", {width = 31, height = 34, numFrames = 12, sheetContentWidth = 124, sheetContentHeight = 102})
    characterInLevelImageSheet["PrincessBoulder"] = graphics.newImageSheet( "images/objects/characters/PrincessBoulderSprite.png", {width = 38, height = 38, numFrames = 12, sheetContentWidth = 152, sheetContentHeight = 114})
    characterInLevelImageSheet["TheShuttleMickyTake"] = graphics.newImageSheet( "images/objects/characters/TheShuttleMickyTakeSprite.png", {width = 38, height = 38, numFrames = 12, sheetContentWidth = 152, sheetContentHeight = 114})
    normalCharacterInLevelSequenceData = {
    	{ name = "up", start=1, count=1, loopCount=1 },
        { name = "right", start=2, count=1,   loopCount=1 },
        { name = "down", start=3, count=1, loopCount=1 },
        { name = "left", start=4, count=1, loopCount=1 },
        { name = "up-bullet", start=5, count=1,   loopCount=1 },
        { name = "right-bullet", start=6, count=1, loopCount=1 },
        { name = "down-bullet", start=7, count=1, loopCount=1 },
        { name = "left-bullet", start=8, count=1,   loopCount=1 }
	}
    specialCharacterInLevelSequenceData = {
    	{ name = "up", start=1, count=1, loopCount=1 },
        { name = "right", start=2, count=1,   loopCount=1 },
        { name = "down", start=3, count=1, loopCount=1 },
        { name = "left", start=4, count=1, loopCount=1 },
        { name = "up-bullet", start=5, count=1,   loopCount=1 },
        { name = "right-bullet", start=6, count=1, loopCount=1 },
        { name = "down-bullet", start=7, count=1, loopCount=1 },
        { name = "left-bullet", start=8, count=1,   loopCount=1 },
        { name = "up-special", start=9, count=1, loopCount=1 },
        { name = "right-special", start=10, count=1, loopCount=1 },
        { name = "down-special", start=11, count=1,   loopCount=1 },
        { name = "left-special", start=12, count=1, loopCount=1 }
	}

	mysteryBlockButtonsImageSheet = graphics.newImageSheet( "images/objects/Layout/mysteryBlockOptionsButtons.png", {width = 122, height = 42, numFrames = 2, sheetContentWidth = 122, sheetContentHeight = 84})
	mysteryBlockButtonsSequenceData = {
        { name = "cancel", start=1, count=1,   loopCount=1 },
        { name = "remove", start=2, count=1, loopCount=1 }
	}	

	itemScreenToolPositioningArray = {
		clock = {56, 260},
		bomb = {78, 95},
		hook = {172, 95},
		jet = {268, 95},
		iceCape = {232, 260},
		fireCape = {116, 260},
		characterSpecial = {174, 260},
		bulletVest = {290, 260},
		dummyBall = {358, 102},
		superBall = {415, 102},
		autoFan = {78, 95},
		manualFan = {173, 95},
		spitter = {269, 95},
		triangle = {104, 260},
		bar = {246, 260},
		simple = {359, 102},
		backFire = {416, 102}
	}
		t.itemScreenToolPositioningArray = itemScreenToolPositioningArray

	itemScreenToolDescriptions = {
		clock = {"Time-Boost", "increase level time"},
		bomb = {"Bomb", "explode squares and some of the objects inside them"},
		hook = {"Hook-Rope", "hook onto objects in the squares around you"},
		jet = {"Jet Pack", "change the direction that you're moving in"},
		iceCape = {"Ice Cape", "protect yourself from fiery shapes"},
		fireCape = {"Fire Cape", "protect yourself from icy shapes"},
		characterSpecial = {"Character Power-up", "power up your character, get special powers!"},
		bulletVest = {"Bullet Vest", "protect yourself from speeding bullets!"},
		autoFan = {"Auto Fire", "the ball will automatically be fired in the direction shown"},
		manualFan = {"Manual Fire", "the ball can manually be fired in the direction shown"},
		spitter = {"Split Fire", "the ball can be fired in any of the directions shown"},
		triangle = {"Triangle", "the ball will hit the triangle and bounce of it"},
		bar = {"Bar", "the ball will hit the bar and bounce of it"}
	}
		t.itemScreenToolDescriptions = itemScreenToolDescriptions

	tutorialPopUpParams = {}

	tutorialPopUpParams["simple"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["door"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["autoFan"] = {{"autoFan-1", 5, 3000, "autoFan-text-1"}, {"autoFan-2", 5, 3000, "autoFan-text-2"}}
	tutorialPopUpParams["backFire"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["manualFan"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["spitter"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["tunnel"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["characterChangePoint"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["gem"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["bar"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["switch"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["flipTriangle"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["icyTriangle"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["fireTriangle"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["breakableTriangle"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}

	tutorialPopUpParams["clock"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["bomb"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["hook"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["jet"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["iceCape"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["fireCape"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["characterSpecial"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["bulletVest"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["dummyBall"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}
	tutorialPopUpParams["superBall"] = {{"simple-1", 11, 6500, "simple-text-1"}, {"simple-2", 11, 6500, "simple-text-2"}}

	t.tutorialPopUpParams = tutorialPopUpParams

----

	if (creationType == "in-level") then

		t.squareHeight = squareHeight
		t.squareWidth = squareWidth
		t.gutterWidth = gutterWidth
		t.gutterHeight = gutterHeight

		t.shapeArray = shapeArray
		t.shapeArrayParameters = shapeArrayParameters
		t.transitionArrayIndex = transitionArrayIndex

		t.backgroundObjectsGroup = backgroundObjectsGroup
		t.screenObjectsGroup = screenObjectsGroup
		t.midScreenObjectsGroup = midScreenObjectsGroup
		t.frontScreenObjectsGroup = frontScreenObjectsGroup
		t.pauseScreenObjectsGroup = pauseScreenObjectsGroup
		t.itemScreenObjectsGroup = itemScreenObjectsGroup

		t.ballScreenVertValue = ballScreenVertValue
		t.ballScreenHorzValue = ballScreenHorzValue

		t.transitionForProjectile = transitionForProjectile

		t.moveSomethingCounter = moveSomethingCounter
		t.pressCount = pressCount

		t.rightScreenEdge = rightScreenEdge
		t.leftScreenEdge = leftScreenEdge
		t.topScreenEdge = topScreenEdge
		t.bottomScreenEdge = bottomScreenEdge

		t.screenInitialiserHorzValue = screenInitialiserHorzValue
		t.screenInitialiserVertValue = screenInitialiserVertValue

		t.screenInitialiserInTransition = screenInitialiserInTransition
		t.nextScreenInitialiserTransition = nextScreenInitialiserTransition
		t.screenInitialiserHorzTransition = screenInitialiserHorzTransition
		t.screenInitialiserVertTransition = screenInitialiserVertTransition
		t.relevantHorzScreen = relevantHorzScreen

		t.thisSwitch = thisSwitch	
		t.screenChangeType = screenChangeType
		t.ballActivateButtonSet = ballActivateButtonSet
		t.pauseButtonsEnabled = pauseButtonsEnabled
		t.isSomethingTransitioning = isSomethingTransitioning
		t.tunnelIsActive = tunnelIsActive

		t.numberOfScreensballspeed = ballspeed

		t.defaultLevelTime = defaultLevelTime

		t.levelFirstStarted = levelFirstStarted
		t.lifeCounter = lifeCounter
		t.object1Counter = object1Counter
		t.screenTimer = screenTimer
		t.directionCounter = directionCounter
		t.mapShowCounter = mapShowCounter
		t.gemCounter = gemCounter
		t.initialReturnToBallScreenCounter = initialReturnToBallScreenCounter
		t.mainScreenChangeSpeed = mainScreenChangeSpeed

		t.shouldBallMoveCounter = shouldBallMoveCounter

		t.edgesTransitionscounter = edgesTransitionscounter
		t.manualScreenChangeCounter = manualScreenChangeCounter
		t.tunnelCounter = tunnelCounter
		t.moveslow_Counter = moveslow_Counter
		t.direction = direction

		t.flipVerticalCounter = flipVerticalCounter

		t.fanCenteringCounter = fanCenteringCounter
		t.autoFanCounter = autoFanCounter
		t.manualFanCounter = manualFanCounter
		t.spitterCounter = spitterCounter

		t.stillTransitioningCounter = stillTransitioningCounter
		t.transitionMoveCounter = transitionMoveCounter
		t.secondTransitionMoveCounter = secondTransitionMoveCounter

		t.returnToBallVertTransition = returnToBallVertTransition
		t.returnToBallHorzTransition = returnToBallHorzTransition

		t.numberOfSwitchesCounter = numberOfSwitchesCounter

		t.playCounter = playCounter
		t.isBallMovingState = isBallMovingState

		t.bullet = bullet
		t.bulletHasFired = bulletHasFired

		t.createdBulletCounter = createdBulletCounter
		t.moveBulletOff = moveBulletOff

		t.thisObjectBreakability = thisObjectBreakability
		t.itemBagIsOpen = itemBagIsOpen

		t.specialBallActive = specialBallActive

		t.backgroundImage = backgroundImage

		t.directionArrayIndex = directionArrayIndex

		t.gem_counter = gem_counter

		t.isWaitingForBombForScreenChange = isWaitingForBombForScreenChange
		t.waitingForScreenChangeDirection = waitingForScreenChangeDirection

		t.showingToolsArray = showingToolsArray
		t.showingObjectsArray = showingObjectsArray

		t.connectorArray = connectorArray

		t.isScreenPausedState = isScreenPausedState
		t.itemBagIsOpen = itemBagIsOpen
		t.mysteryBlockBagIsOpen = mysteryBlockBagIsOpen
	end

	t.coinsGainedPerGem = coinsGainedPerGem
	t.coinsGainedPerTenthOfASecond = coinsGainedPerTenthOfASecond
	t.coinsGainedForRedCoin = coinsGainedForRedCoin
	t.coinsGainedForBlueCoin = coinsGainedForBlueCoin
	t.coinsGainedForPurpleCoin = coinsGainedForPurpleCoin

	-- Constants image Sheets ca happen in menu screen also, not just in-level
	t.lifeLostScreenBgImageSheet = lifeLostScreenBgImageSheet
	t.lifeLostScreenBgSequenceData = lifeLostScreenBgSequenceData

	t.largeIconsImageSheet = largeIconsImageSheet
	t.largeIconsSequenceData = largeIconsSequenceData

	t.smallIconsImageSheet = smallIconsImageSheet
	t.smallIconsSequenceData = smallIconsSequenceData

	t.levelItemsImageSheet = levelItemsImageSheet
	t.levelItemsImageSheetSettings = levelItemsImageSheetSettings
	t.levelItemsSequenceData = levelItemsSequenceData

	t.levelItems2ImageSheet = levelItems2ImageSheet
	t.levelItems2ImageSheetSettings = levelItems2ImageSheetSettings
	t.levelItems2SequenceData = levelItems2SequenceData
	t.levelItemsBackboardImageSheet = levelItemsBackboardImageSheet
	t.levelItemsBackboardSequenceData = levelItemsBackboardSequenceData

	t.allFansImageSheet = allFansImageSheet
	t.allFansSequenceData = allFansSequenceData

	t.horizontalConnectorTubesImageSheet = horizontalConnectorTubesImageSheet
	t.verticalConnectorTubesImageSheet = verticalConnectorTubesImageSheet
	t.cornerConnectorTubesImageSheet = cornerConnectorTubesImageSheet
	t.connectorTubesSequenceData = connectorTubesSequenceData
	t.shapeColourArray = shapeColourArray
	t.connectorSpotsImageSheet = connectorSpotsImageSheet
	t.connectorSpotsSequenceData = connectorSpotsSequenceData

	t.itemsImageSheet = itemsImageSheet
	t.itemsSequenceData = itemsSequenceData

	t.shapesImageSheet = shapesImageSheet
	t.shapesSequenceData = shapesSequenceData

	t.breakableTriangleImageSheet = breakableTriangleImageSheet
	t.breakableTriangleSequenceData = breakableTriangleSequenceData
	t.triangleImageSheet = triangleImageSheet
	t.triangleSequenceData = triangleSequenceData
	t.triangleLeftAndRightImageSheet = triangleLeftAndRightImageSheet
	t.triangleTopAndBottomImageSheet = triangleTopAndBottomImageSheet
	t.triangleLeftAndRightSequenceData = triangleLeftAndRightSequenceData
	t.triangleTopAndBottomSequenceData = triangleTopAndBottomSequenceData
	t.barImageSheet = barImageSheet
	t.barSequenceData = barSequenceData

	t.itemBagScreenCounterImageSheet = itemBagScreenCounterImageSheet
	t.itemBagScreenCounterSequenceData = itemBagScreenCounterSequenceData

	t.tunnelPiecesImageSheet = tunnelPiecesImageSheet
	t.tunnelPiecesSequenceData = tunnelPiecesSequenceData

	t.charactersIconsImageSheet = charactersIconsImageSheet
	t.charactersIconsSequenceData = charactersIconsSequenceData

	t.characterProfileTextImageSheet = characterProfileTextImageSheet
	t.characterProfileTextSequenceData = characterProfileTextSequenceData

	t.characterInLevelImageSheet = characterInLevelImageSheet

    t.normalCharacterInLevelSequenceData = normalCharacterInLevelSequenceData
    t.specialCharacterInLevelSequenceData = specialCharacterInLevelSequenceData

    t.mysteryBlockButtonsImageSheet = mysteryBlockButtonsImageSheet
    t.mysteryBlockButtonsSequenceData = mysteryBlockButtonsSequenceData

	----
end

return t
