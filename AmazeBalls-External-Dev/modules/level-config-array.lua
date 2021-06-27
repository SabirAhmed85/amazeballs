local t = {}
local worldRequirementsArray = {
	WoodyWalk = {
		silver = 0
	},
	FieryFortress = {
		silver = 0
	}
}


	t.nextSlide = nextSlide

local popUpIntroTutorial = function (mainFunc, popUpNum, itemName, popUpSlideArray, levelStart)
	mainFunc.ballAndButtonAndScreenCreateScript.backBtn:removeEventListener("tap", mainFunc.buttonListener)
	mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:removeEventListener("tap", mainFunc.buttonListener)
	mainFunc.ballAndButtonAndScreenCreateScript.playBtn:removeEventListener("tap", mainFunc.buttonListener)
	mainFunc.ballAndButtonAndScreenCreateScript.backBtn.alpha = 0
	mainFunc.ballAndButtonAndScreenCreateScript.randomBtn.alpha = 0
	mainFunc.ballAndButtonAndScreenCreateScript.playBtn.alpha = 0

	mainFunc.tutorialPopUp[popUpNum] = display.newImageRect("images/central-images/Tutorials/introTuts/introTutorialScreen.png", 480, 320)
	mainFunc.tutorialPopUp[popUpNum].anchorX = 0.5
    mainFunc.tutorialPopUp[popUpNum].anchorY = 0.5
    mainFunc.tutorialPopUp[popUpNum].alpha = 0
    mainFunc.tutorialPopUp[popUpNum].x = contentCentreX
    mainFunc.tutorialPopUp[popUpNum].y = contentCentreY

    mainFunc.tutorialPopUp[popUpNum].nextButton = display.newImageRect("images/central-images/Tutorials/introTuts/okButton.png", 86, 48)
	mainFunc.tutorialPopUp[popUpNum].nextButton.anchorX = 0
    mainFunc.tutorialPopUp[popUpNum].nextButton.anchorY = 0
    mainFunc.tutorialPopUp[popUpNum].nextButton.alpha = 0
    mainFunc.tutorialPopUp[popUpNum].nextButton.x = contentCentreX + 120
    mainFunc.tutorialPopUp[popUpNum].nextButton.y = contentCentreY + 80
    mainFunc.tutorialPopUp[popUpNum].nextButton.isDisabled = false

    mainFunc.tutorialPopUp[popUpNum].nextButton.currentSlide = 1
    mainFunc.tutorialPopUp[popUpNum].totalSlides = #popUpSlideArray

    mainFunc.tutorialPopUp[popUpNum].slides = {}

    local slideImageSheet = {}
    local slideSequenceData = {}

    for a = 1, #popUpSlideArray do
    	local slideSheetPath = popUpSlideArray[a][1]
    	local numberOfFrames = popUpSlideArray[a][2]
    	local animationTime = popUpSlideArray[a][3]
    	local slideTextPath = popUpSlideArray[a][4]

    	mainFunc.tutorialPopUp[popUpNum].slides[a] = {}

    	slideImageSheet[a] = graphics.newImageSheet( "images/central-images/Tutorials/introTuts/Pic/" .. slideSheetPath .. ".png", {width = 375, height = 133, numFrames = numberOfFrames, sheetContentWidth = 375, sheetContentHeight = 133 * numberOfFrames})
	    slideSequenceData[a] = {
	        { name = "full", start=1, count=11,   loopCount=0, time = animationTime } 
	    }

	    mainFunc.tutorialPopUp[popUpNum].slides[a].image = display.newSprite(slideImageSheet[a], slideSequenceData[a])
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image:setSequence("full")
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image.alpha = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image.anchorX = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image.anchorY = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image.x = contentCentreX - 195
	    mainFunc.tutorialPopUp[popUpNum].slides[a].image.y = contentCentreY - 130

	    mainFunc.tutorialPopUp[popUpNum].slides[a].text = display.newImageRect("images/central-images/Tutorials/introTuts/Text/" .. slideTextPath .. ".png", 375, 59)
	    mainFunc.tutorialPopUp[popUpNum].slides[a].text.alpha = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].text.anchorX = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].text.anchorY = 0
	    mainFunc.tutorialPopUp[popUpNum].slides[a].text.x = contentCentreX - 150
	    mainFunc.tutorialPopUp[popUpNum].slides[a].text.y = contentCentreY + 10
    end

    local nextSlide = function (event)
		local function innerNextSlide (mainFunc, popUpNum)
			local button = mainFunc.tutorialPopUp[1].nextButton
			currentSlide = button.currentSlide

			transition.to(button, {alpha = 0, time = 250})
			
			transition.to(mainFunc.tutorialPopUp[popUpNum].slides[currentSlide].image, {alpha = 0, time = 100})
			transition.to(mainFunc.tutorialPopUp[popUpNum].slides[currentSlide].text, {alpha = 0, time = 100})

			if currentSlide < mainFunc.tutorialPopUp[popUpNum].totalSlides then
				transition.to(mainFunc.tutorialPopUp[popUpNum].slides[currentSlide + 1].text, {alpha = 1, time = 500})
				transition.to(mainFunc.tutorialPopUp[popUpNum].slides[currentSlide + 1].image, {alpha = 1, time = 500, onComplete = function ()
					mainFunc.tutorialPopUp[popUpNum].slides[currentSlide + 1].image:play()
					timer.performWithDelay(popUpSlideArray[currentSlide + 1][3], function ()
		    			transition.to(button, {alpha = 1, time = 500, onComplete = function ()
		    				button.currentSlide = button.currentSlide + 1
		    				button.isDisabled = false
		    			end})
		    		end)
				end})
			else
				--event.target:removeEventListener("tap", nextSlide)
				transition.to(event.target, {alpha = 0, time = 50, onComplete = function ()
			    	myGameSettings["tutorialDone"][itemName] = true
			    	saveTable(myGameSettings, "myGameSettings.json")
			    	local closeTutorial = function ()
			    		transition.to(mainFunc.tutorialPopUp[popUpNum], {alpha = 0, time = 100, onComplete = function ()
					    	transition.to(mainFunc.ballAndButtonAndScreenCreateScript.randomBtn, {alpha = 1, time = 100})
					    	transition.to(mainFunc.ballAndButtonAndScreenCreateScript.playBtn, {alpha = 1, time = 100})
							mainFunc.ballAndButtonAndScreenCreateScript.randomBtn:addEventListener("tap", mainFunc.buttonListener)
					    	mainFunc.ballAndButtonAndScreenCreateScript.playBtn:addEventListener("tap", mainFunc.buttonListener)
	    					mainFunc.thisLevelSettings.tutorialsToDo = {}
	    					if levelStart == false then
	    						timer.performWithDelay(250, function ()
	    							mainFunc.buttonListenerScript.addBackEventListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
								    mainFunc.buttonListenerScript.addBackShapeListenersForPause(mainFunc, shapeArray, shapeArrayParameters)
								    mainFunc.buttonListenerScript.addBackButtonListenersForItemGained(mainFunc)

								    mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay.alpha = 0
						        	mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay:removeEventListener("tap", mainFunc.dummyListener)
						        	mainFunc.ballAndButtonAndScreenCreateScript.itemBagScreen.itemBagScreenOverlay:removeEventListener("touch", mainFunc.dummyListener)
	    						end)

					        	if mainFunc.thisLevelSettings.itemBagButtonsVisible then
							        mainFunc.ballAndButtonAndScreenCreateScript.itemBtn:addEventListener( "tap", mainFunc.buttonListener )
						    		transition.to(mainFunc.ballAndButtonAndScreenCreateScript.itemBtn, {alpha=1, time=400})
						    		if (mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img
						    		and mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img ~= nil) then
						    			transition.to(mainFunc.ballAndButtonAndScreenCreateScript.itemBtn.img, {alpha=1, time=400})
						    		end
						    		
						    		transition.to(mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn, {alpha=1, time=400})
									mainFunc.ballAndButtonAndScreenCreateScript.itemBagBtn:addEventListener( "tap", mainFunc.buttonListener )
							        mainFunc.thisLevelSettings.hasToolArray = true
							    end

	    						mainFunc.tm["ball"][mainFunc.ballAndButtonAndScreenCreateScript.instance2.relevantArrayIndex]:resumeAll()
	    					else
					    		transition.to(mainFunc.ballAndButtonAndScreenCreateScript.backBtn, {alpha = 1, time = 100, onComplete = function ()
					    			mainFunc.ballAndButtonAndScreenCreateScript.backBtn:addEventListener("tap", mainFunc.buttonListener)
					    		end})
	    					end
						end})
			    	end
			    	if levelStart then
						for a = 1, #mainFunc.thisLevelSettings.tutorialsToDo do
							if mainFunc.thisLevelSettings.tutorialsToDo[a] == itemName then
								if a < #mainFunc.thisLevelSettings.tutorialsToDo then
									mainFunc.popUpIntroTutorial(mainFunc, a + 1, mainFunc.thisLevelSettings.tutorialsToDo[a + 1], mainFunc.allLevelSettings.tutorialPopUpParams[mainFunc.thisLevelSettings.tutorialsToDo[a + 1]])
								else
									closeTutorial()
								end
							end
						end
					else
						closeTutorial()
					end
				end})
			end
		end
		if (mainFunc.tutorialPopUp[popUpNum].nextButton.isDisabled == false) then
			mainFunc.tutorialPopUp[popUpNum].nextButton.isDisabled = true
			innerNextSlide(mainFunc, popUpNum)
		end
	end

    timer.performWithDelay(600, function ()
    	transition.to(mainFunc.tutorialPopUp[popUpNum],  {alpha = 1, time = 300, onComplete = function ()
    		
    		timer.performWithDelay(250, function ()
    			transition.to(mainFunc.tutorialPopUp[popUpNum].slides[1].text, {alpha = 1, time = 100, onComplete = function ()
		    		timer.performWithDelay(450, function ()
		    			transition.to(mainFunc.tutorialPopUp[popUpNum].slides[1].image, {alpha = 1, time = 300, onComplete = function ()
			    			mainFunc.tutorialPopUp[popUpNum].slides[1].image:play()
			    			timer.performWithDelay(popUpSlideArray[1][3], function ()
				    			transition.to(mainFunc.tutorialPopUp[popUpNum].nextButton, {alpha = 1, time = 500, onComplete = function ()
				    				mainFunc.tutorialPopUp[popUpNum].nextButton:addEventListener("tap", nextSlide)
				    			end})
				    		end)
			    		end})
		    		end)
		    	end})
    		end)
    		
    	end})
    end)
end
	t.popUpIntroTutorial = popUpIntroTutorial

local blinkPopUp = function (popUp, mainFunc)
	if popUp.currentBlinkPopUpShouldCancel == false then
		if popUp.alpha == 1 then
			mainFunc.popUpTimer[popUp.popUpTimerIndex] = timer.performWithDelay(1000, function ()
				popUp.alpha = 0
				t.blinkPopUp(popUp, mainFunc)
			end)
		elseif popUp.alpha == 0 then
			mainFunc.popUpTimer[popUp.popUpTimerIndex] = timer.performWithDelay(500, function ()
				popUp.alpha = 1
				t.blinkPopUp(popUp, mainFunc)
			end)
		end
	end
end
	t.blinkPopUp = blinkPopUp

local swipeImageSheet = graphics.newImageSheet( "images/central-images/Tutorials/Pop-ups/actions.png", {width = 60, height = 35, numFrames = 3, sheetContentWidth = 60, sheetContentHeight = 105})
local swipeSequenceData = {
	{ name = "swipe", start=1, count=1,   loopCount=1 },
	{ name = "tap", start=2, count=1,   loopCount=1 },
	{ name = "hold", start=3, count=1,   loopCount=1 }
}

local swipeArrowImageSheet = graphics.newImageSheet( "images/central-images/Tutorials/Pop-ups/swipe-arrow.png", {width = 31, height = 52, numFrames = 4, sheetContentWidth = 124, sheetContentHeight = 52})
local swipeArrowSequenceData = {
	{ name = "loop", start=1, count=4,   loopCount=0, time = 1500 }
}
t.swipeArrowImageSheet = swipeArrowImageSheet
t.swipeArrowSequenceData = swipeArrowSequenceData
t.swipeImageSheet = swipeImageSheet
t.swipeSequenceData = swipeSequenceData

local levelConfigArray = {
	WoodyWalk = {
		level1 = {
			silver = {
				silver = 0,
				onLevelComplete = 
				function ()
					
				end,
				gemTotal = 10,
				tutorial = {
					onLevelStart = function (mainFunc, shapeArray)
						for c = 1, #shapeArray do
							for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
					            if mainFunc.allLevelSettings.transitionArrayIndex[d][1][1] == shapeArrayParameters[c]["name"] then
					                shapeArray[c]:removeEventListener("touch", mainFunc.listener)
					        		shapeArray[c].mainFuncListenerAdded = false
					            end
					        end
					    end

				    	mainFunc.tutorialPopUp = {}
				    	mainFunc.popUpTimer = {}
				        
					end,
					onGoPress = function (mainFunc, shapeArray)
					    tutorialPopUp = mainFunc.tutorialPopUp

						tutorialPopUp[1] = display.newImageRect("images/central-images/Tutorials/Pop-ups/popUp1-2.png", 250, 65)
					    tutorialPopUp[1].anchorX = 0
					    tutorialPopUp[1].anchorY = 0
					    tutorialPopUp[1].alpha = 0
					    tutorialPopUp[1].x = xCalc(110)
					    tutorialPopUp[1].y = yCalc(133)

					    transition.to(tutorialPopUp[1], {alpha = 1, time = 200, onComplete = function ()
					    	timer.performWithDelay(2500, function ()

					    		transition.to(tutorialPopUp[1], {alpha = 0, time = 200})
					    		tutorialPopUp[2] = display.newImageRect("images/central-images/Tutorials/Pop-ups/popUp1-2b.png", 250, 65)
							    tutorialPopUp[2].anchorX = 0
							    tutorialPopUp[2].anchorY = 0
							    tutorialPopUp[2].alpha = 0
							    tutorialPopUp[2].x = xCalc(165)
							    tutorialPopUp[2].y = yCalc(128)

							    transition.to(tutorialPopUp[2], {alpha = 1, time = 200, onComplete = function ()

		    						timer.performWithDelay(5000, function () 
							    		transition.to(tutorialPopUp[2], {alpha = 0, time = 200, onComplete = function ()

								    		tutorialPopUp[3] = display.newImageRect("images/central-images/Tutorials/Guides/5v.png", 60, 260)
						    				tutorialPopUp[3].width = xCalc(60)
						    				tutorialPopUp[3].height = yCalc(260)
								    		tutorialPopUp[3].anchorX = 0
										    tutorialPopUp[3].anchorY = 0
										    tutorialPopUp[3].alpha = 0
										    tutorialPopUp[3].x = xCalc(90)
										    tutorialPopUp[3].y = yCalc(30)

										    tutorialPopUp[4] = display.newImageRect("images/central-images/Tutorials/Guides/7h.png", 420, 52)
						    				tutorialPopUp[4].width = xCalc(420)
						    				tutorialPopUp[4].height = yCalc(52)
								    		tutorialPopUp[4].anchorX = 0
										    tutorialPopUp[4].anchorY = 0
										    tutorialPopUp[4].alpha = 0
										    tutorialPopUp[4].x = xCalc(30)
										    tutorialPopUp[4].y = yCalc(186)

										    tutorialPopUp[5] = display.newImageRect("images/central-images/Tutorials/Guides/5v.png", 60, 260)
						    				tutorialPopUp[5].width = xCalc(60)
						    				tutorialPopUp[5].height = yCalc(260)
								    		tutorialPopUp[5].anchorX = 0
										    tutorialPopUp[5].anchorY = 0
										    tutorialPopUp[5].alpha = 0
										    tutorialPopUp[5].x = xCalc(90)
										    tutorialPopUp[5].y = yCalc(30)

										    tutorialPopUp[6] = display.newImageRect("images/central-images/Tutorials/Guides/3h.png", 180, 52)
						    				tutorialPopUp[6].width = xCalc(180)
						    				tutorialPopUp[6].height = yCalc(52)
								    		tutorialPopUp[6].anchorX = 0
										    tutorialPopUp[6].anchorY = 0
										    tutorialPopUp[6].alpha = 0
										    tutorialPopUp[6].x = xCalc(90)
										    tutorialPopUp[6].y = yCalc(186)

										    tutorialPopUp[7] = display.newImageRect("images/central-images/Tutorials/Guides/3v.png", 60, 156)
						    				tutorialPopUp[7].width = xCalc(60)
						    				tutorialPopUp[7].height = yCalc(156)
								    		tutorialPopUp[7].anchorX = 0
										    tutorialPopUp[7].anchorY = 0
										    tutorialPopUp[7].alpha = 0
										    tutorialPopUp[7].x = xCalc(270)
										    tutorialPopUp[7].y = yCalc(82)

										    tutorialPopUp[8] = display.newImageRect("images/central-images/Tutorials/Guides/1.png", 60, 52)
						    				tutorialPopUp[8].width = xCalc(60)
					    					tutorialPopUp[8].height = yCalc(52)
								    		tutorialPopUp[8].anchorX = 0
										    tutorialPopUp[8].anchorY = 0
										    tutorialPopUp[8].alpha = 0
										    tutorialPopUp[8].x = xCalc(30)
										    tutorialPopUp[8].y = yCalc(186)

										    tutorialPopUp[9] = display.newImageRect("images/central-images/Tutorials/Guides/2h.png", 120, 52)
						    				tutorialPopUp[9].width = xCalc(120)
						    				tutorialPopUp[9].height = yCalc(52)
								    		tutorialPopUp[9].anchorX = 0
										    tutorialPopUp[9].anchorY = 0
										    tutorialPopUp[9].alpha = 0
										    tutorialPopUp[9].x = xCalc(330)
										    tutorialPopUp[9].y = yCalc(186)

										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[3])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[4])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[5])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[6])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[7])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[8])
										    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[9])

										    transition.to(tutorialPopUp[3], {alpha = 1, time = 500})
										    transition.to(tutorialPopUp[4], {alpha = 1, time = 500})

								    		timer.performWithDelay(3500, function ()
									        	
										    	tutorialPopUp[10] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
											    tutorialPopUp[10].anchorX = 0
											    tutorialPopUp[10].anchorY = 0
											    tutorialPopUp[10].alpha = 0
											    tutorialPopUp[10].x = xCalc(285)
											    tutorialPopUp[10].y = yCalc(210)

											    tutorialPopUp[11] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
											    tutorialPopUp[11]:setSequence("swipe")
											    tutorialPopUp[11]:play()
											    tutorialPopUp[11].anchorX = 0
											    tutorialPopUp[11].anchorY = 0
											    tutorialPopUp[11].alpha = 0
											    tutorialPopUp[11].x = xCalc(272)
											    tutorialPopUp[11].y = yCalc(150)
											    tutorialPopUp[11].popUpTimerIndex = 1

											    tutorialPopUp[12] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
											    tutorialPopUp[12].anchorX = 0
											    tutorialPopUp[12].anchorY = 0
											    tutorialPopUp[12].alpha = 0
											    tutorialPopUp[12].x = xCalc(317)
											    tutorialPopUp[12].y = yCalc(285)
											    

											    transition.to(tutorialPopUp[11], {alpha = 1, time = 200, onComplete = function ()
											    	
											    	tutorialPopUp[11].currentBlinkPopUpShouldCancel = false
											    	timer.performWithDelay(300, function ()
											    		print("1")
											    		t.blinkPopUp(tutorialPopUp[11], mainFunc)
											    	end)
											    end})
											    transition.to(tutorialPopUp[10], {alpha = 1, time = 200, onComplete = function ()
											    	tutorialPopUp[10]:setSequence("loop")
											    	tutorialPopUp[10]:play()

											    	for c = 1, #shapeArray do
											        	for d=1, #mainFunc.allLevelSettings.transitionArrayIndex do
												            if mainFunc.allLevelSettings.transitionArrayIndex[d][1][1] == shapeArrayParameters[c]["name"]
												            and shapeArray[c].mainFuncListenerAdded == false then
												                shapeArray[c]:addEventListener("touch", mainFunc.listener)
												                shapeArray[c].mainFuncListenerAdded = true
												            end
												        end
											    	end
											    end})
									        end)

										    mainFunc.tutorialActions = {}

										    mainFunc.tutorialActions[1] = {}
										    mainFunc.tutorialActions[1].actionPieceName = "triangle2_1_1"
										    mainFunc.tutorialActions[1].actionCompletedOnce = false
										    mainFunc.tutorialActions[1].actionPieceSwitchCounter = 0

										    -- add event listener for this action piece only
										    for c = 1, #shapeArray do
									            if shapeArray[c].name == mainFunc.tutorialActions[1].actionPieceName then
									                shapeArray[c]:addEventListener("touch", mainFunc.listener)
									            end
										    end
										end})
							    	end)

							    end})

					    	end)
					    end})

					end,
					onSlideAction = function (mainFunc, objectSlided, shapeArray)
						for b = 1, #mainFunc.tutorialActions do
							if objectSlided.name == mainFunc.tutorialActions[b].actionPieceName then
								if mainFunc.tutorialActions[b].actionPieceSwitchCounter == 0 then
									if mainFunc.tutorialActions[b].actionCompletedOnce == false then
										print("2")
										if (mainFunc.popUpTimer[1]) then timer.cancel(mainFunc.popUpTimer[1]) end
										tutorialPopUp[11].currentBlinkPopUpShouldCancel = true
										tutorialPopUp[11].alpha = 0
										transition.to(mainFunc.tutorialPopUp[10], {alpha = 0, time = 300})
										mainFunc.tutorialActions[b].actionCompletedOnce = true
									end
									mainFunc.tutorialActions[b].actionPieceSwitchCounter = 1
									-- change the guideline direction arrows
									-- if ball is on one side, do one thing
									transition.to(mainFunc.tutorialPopUp[3], {alpha = 0, time = 200})
									transition.to(mainFunc.tutorialPopUp[4], {alpha = 0, time = 200})

									local function showWrongTurnPopUp ()
										transition.to(mainFunc.tutorialPopUp[8], {alpha = 1, time = 200})
										transition.to(mainFunc.tutorialPopUp[9], {alpha = 1, time = 200})
										tutorialPopUp[12].rotation = 180
										tutorialPopUp[12]:setSequence("loop")
								    	tutorialPopUp[12]:play()
										transition.to(mainFunc.tutorialPopUp[12], {alpha = 1, time = 200})
										tutorialPopUp[11].y = 198
										tutorialPopUp[11].alpha = 1
										tutorialPopUp[11].currentBlinkPopUpShouldCancel = false
										t.blinkPopUp(tutorialPopUp[11], mainFunc)
									end

									if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > xCalc(90)
									and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x < xCalc(330) ) then
										if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.direction == "right"
										and mainFunc.ballAndButtonAndScreenCreateScript.instance2.x > xCalc(300) ) then
											showWrongTurnPopUp()
										else
											transition.to(mainFunc.tutorialPopUp[5], {alpha = 1, time = 200})
											transition.to(mainFunc.tutorialPopUp[6], {alpha = 1, time = 200})
											transition.to(mainFunc.tutorialPopUp[7], {alpha = 1, time = 200})
										end
									else
										showWrongTurnPopUp()
									end
									--if ball is on another, show another
								else
									mainFunc.tutorialActions[b].actionPieceSwitchCounter = 0
									if (mainFunc.popUpTimer[1]) then timer.cancel(mainFunc.popUpTimer[1]) end
									tutorialPopUp[11].alpha = 0
									tutorialPopUp[11].currentBlinkPopUpShouldCancel = true
									-- change the guideline direction arrows
									if (mainFunc.tutorialPopUp[5].alpha == 1) then
										transition.to(mainFunc.tutorialPopUp[5], {alpha = 0, time = 200})
										transition.to(mainFunc.tutorialPopUp[6], {alpha = 0, time = 200})
										transition.to(mainFunc.tutorialPopUp[7], {alpha = 0, time = 200})
									elseif (mainFunc.tutorialPopUp[8].alpha == 1) then
										transition.to(mainFunc.tutorialPopUp[8], {alpha = 0, time = 200})
										transition.to(mainFunc.tutorialPopUp[9], {alpha = 0, time = 200})
									end

									if (mainFunc.tutorialPopUp[12].alpha == 1) then
										transition.to(mainFunc.tutorialPopUp[12], {alpha = 0, time = 200})
									end

									transition.to(mainFunc.tutorialPopUp[3], {alpha = 1, time = 200})
									transition.to(mainFunc.tutorialPopUp[4], {alpha = 1, time = 200})
								end
							end
						end
					end
				}
			},
			gold = {
			}
		},
		level2 = {
			silver = {
				silver = 1,

				tutorial = {
					onLevelStart = function (mainFunc, shapeArray)
					    mainFunc.tutorialActions = {}

					    mainFunc.tutorialActions[1] = {}
					    mainFunc.tutorialActions[1].actionPieceName = "triangle1_1_1"
					    mainFunc.tutorialActions[1].actionCompletedOnce = false
					    mainFunc.tutorialActions[1].actionPieceSwitchCounter = 0

					    mainFunc.tutorialActions[2] = {}
					    mainFunc.tutorialActions[2].actionPieceName = "triangle2_1_1"
					    mainFunc.tutorialActions[2].actionCompletedOnce = false
					    mainFunc.tutorialActions[2].actionPieceSwitchCounter = 0

						for b = 1, #mainFunc.tutorialActions do
					        for c = 1, #shapeArray do
								if (shapeArray[c].name == mainFunc.tutorialActions[b].actionPieceName) then
					        		shapeArray[c]:removeEventListener("touch", mainFunc.listener)
					        		shapeArray[c].mainFuncListenerAdded = false
					        	end
					    	end
				    	end

				    	mainFunc.popUpTimer = {}
					end,
					onGoPress = function (mainFunc, shapeArray)

					    mainFunc.tutorialPopUp = {}
					    tutorialPopUp = mainFunc.tutorialPopUp

					    tutorialPopUp[1] = display.newImageRect("images/central-images/Tutorials/Guides/7h.png", 420, 52)
					    tutorialPopUp[1].width = xCalc(420)
					    tutorialPopUp[1].height = yCalc(52)
					    tutorialPopUp[1].anchorX = 0
					    tutorialPopUp[1].anchorY = 0
					    tutorialPopUp[1].alpha = 0
					    tutorialPopUp[1].x = xCalc(30)
					    tutorialPopUp[1].y = yCalc(186)
					    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[1])

				    	transition.to(tutorialPopUp[1], {alpha = 1, time = 200})

				        for c = 1, #shapeArray do
							if (shapeArray[c].name == "triangle1_1_1")
							and shapeArray[c].mainFuncListenerAdded == false then
				        		shapeArray[c]:addEventListener("touch", mainFunc.listener)
				        		shapeArray[c].mainFuncListenerAdded = true
				        	end
				    	end 

				    	tutorialPopUp[2] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
					    tutorialPopUp[2].anchorX = 0
					    tutorialPopUp[2].anchorY = 0
					    tutorialPopUp[2].alpha = 0
					    tutorialPopUp[2].x = xCalc(92)
					    tutorialPopUp[2].y = yCalc(250)
					    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[2])

				    	tutorialPopUp[3] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
					    tutorialPopUp[3].anchorX = 0
					    tutorialPopUp[3].anchorY = 0
					    tutorialPopUp[3].alpha = 0
					    tutorialPopUp[3].x = xCalc(105)
					    tutorialPopUp[3].y = yCalc(210)
					    tutorialPopUp[3]:setSequence("loop")
				    	tutorialPopUp[3]:play()
					    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[3])

				    	transition.to(tutorialPopUp[2], {alpha = 1, time = 200})
				    	transition.to(tutorialPopUp[3], {alpha = 1, time = 200, onComplete = function ()
				    		tutorialPopUp[2].currentBlinkPopUpShouldCancel = false
				    		tutorialPopUp[2].popUpTimerIndex = 1
				    		t.blinkPopUp(tutorialPopUp[2], mainFunc)
				    	end})

					end,
					onSlideAction = function (mainFunc, objectSlided, shapeArray)
						for b = 1, #mainFunc.tutorialActions do
							if objectSlided.name == mainFunc.tutorialActions[b].actionPieceName then
								if (objectSlided.name == "triangle1_1_1") then
									-- does not depend on where ball is
									transition.to(tutorialPopUp[3], {alpha = 0, time = 200})
									mainFunc.tutorialPopUp[2].alpha = 0
									timer.cancel(mainFunc.popUpTimer[1])
									mainFunc.tutorialActions[b].actionCompletedOnce = true

									-- change the guideline direction arrows

									-- add touch listener for other shape

									for c = 1, #shapeArray do
										if (shapeArray[c].name == mainFunc.tutorialActions[b].actionPieceName)
										and shapeArray[c].mainFuncListenerAdded == true then
							        		shapeArray[c]:removeEventListener("touch", mainFunc.listener)
							        		shapeArray[c].mainFuncListenerAdded = false
							        	end
							        	if (shapeArray[c].name == mainFunc.tutorialActions[b + 1].actionPieceName)
							        	and shapeArray[c].mainFuncListenerAdded == false then
							        		shapeArray[c]:addEventListener("touch", mainFunc.listener)
							        		shapeArray[c].mainFuncListenerAdded = true
							        	end
							    	end

							    	tutorialPopUp = mainFunc.tutorialPopUp

								    tutorialPopUp[4] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
								    tutorialPopUp[4].anchorX = 0
								    tutorialPopUp[4].anchorY = 0
								    tutorialPopUp[4].alpha = 0
								    tutorialPopUp[4].rotation = 270
								    tutorialPopUp[4].x = xCalc(108)
								    tutorialPopUp[4].y = yCalc(72)
					    			tutorialPopUp[4]:setSequence("loop")
				    				tutorialPopUp[4]:play()

								    tutorialPopUp[5] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
								    tutorialPopUp[5].anchorX = 0
								    tutorialPopUp[5].anchorY = 0
								    tutorialPopUp[5].alpha = 0
								    tutorialPopUp[5].x = xCalc(150)
								    tutorialPopUp[5].y = yCalc(40)

								    transition.to(tutorialPopUp[4], {alpha = 1, time = 200})
								    transition.to(tutorialPopUp[5], {alpha = 1, time = 200, onComplete = function ()
								    	tutorialPopUp[5].currentBlinkPopUpShouldCancel = false
							    		tutorialPopUp[5].popUpTimerIndex = 2
							    		t.blinkPopUp(tutorialPopUp[5], mainFunc)
								    end})

								    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[4])
								    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[5])

								    tutorialPopUp[6] = display.newImageRect("images/central-images/Tutorials/Guides/5v.png", 60, 260)
						    		tutorialPopUp[6].width = xCalc(60)
						    		tutorialPopUp[6].height = yCalc(260)
								    tutorialPopUp[6].anchorX = 0
								    tutorialPopUp[6].anchorY = 0
								    tutorialPopUp[6].alpha = 0
								    tutorialPopUp[6].x = xCalc(90)
								    tutorialPopUp[6].y = yCalc(30)

								    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[6])

								    transition.to(tutorialPopUp[6], {alpha = 1, time = 200})
								else
									if mainFunc.tutorialActions[b].actionPieceSwitchCounter == 0 then
										transition.to(tutorialPopUp[4], {alpha = 0, time = 200})
										mainFunc.tutorialPopUp[5].alpha = 0
										timer.cancel(mainFunc.popUpTimer[2])

										tutorialPopUp[7] = display.newImageRect("images/central-images/Tutorials/Guides/4v.png", 60, 208)
						    			tutorialPopUp[7].width = xCalc(60)
						    			tutorialPopUp[7].height = yCalc(208)
									    tutorialPopUp[7].anchorX = 0
									    tutorialPopUp[7].anchorY = 0
									    tutorialPopUp[7].alpha = 0
									    tutorialPopUp[7].x = xCalc(90)
									    tutorialPopUp[7].y = yCalc(30)

									    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[7])

									    tutorialPopUp[8] = display.newImageRect("images/central-images/Tutorials/Guides/4h.png", 240, 52)
						    			tutorialPopUp[8].width = xCalc(240)
						    			tutorialPopUp[8].height = yCalc(52)
									    tutorialPopUp[8].anchorX = 0
									    tutorialPopUp[8].anchorY = 0
									    tutorialPopUp[8].alpha = 0
									    tutorialPopUp[8].x = xCalc(90)
									    tutorialPopUp[8].y = yCalc(30)

									    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[8])

									    tutorialPopUp[9] = display.newImageRect("images/central-images/Tutorials/Guides/1.png", 60, 52)
						    			tutorialPopUp[9].width = xCalc(60)
						    			tutorialPopUp[9].height = yCalc(52)
									    tutorialPopUp[9].anchorX = 0
									    tutorialPopUp[9].anchorY = 0
									    tutorialPopUp[9].alpha = 0
									    tutorialPopUp[9].x = xCalc(90)
									    tutorialPopUp[9].y = yCalc(238)

									    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[9])

									    tutorialPopUp[10] = display.newImageRect("images/central-images/Tutorials/Guides/3v.png", 60, 156)
						    			tutorialPopUp[10].width = xCalc(60)
						    			tutorialPopUp[10].height = yCalc(156)
									    tutorialPopUp[10].anchorX = 0
									    tutorialPopUp[10].anchorY = 0
									    tutorialPopUp[10].alpha = 0
									    tutorialPopUp[10].x = xCalc(330)
									    tutorialPopUp[10].y = yCalc(30)

									    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[10])

									    tutorialPopUp[11] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
									    tutorialPopUp[11].anchorX = 0
									    tutorialPopUp[11].anchorY = 0
									    tutorialPopUp[11].alpha = 0
									    tutorialPopUp[11].rotation = 90
									    tutorialPopUp[11].x = xCalc(185)
									    tutorialPopUp[11].y = yCalc(40)
						    			tutorialPopUp[11]:setSequence("loop")
					    				tutorialPopUp[11]:play()
					    				mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[11])

									    tutorialPopUp[12] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
									    tutorialPopUp[12].anchorX = 0
									    tutorialPopUp[12].anchorY = 0
									    tutorialPopUp[12].alpha = 0
									    tutorialPopUp[12].x = xCalc(90)
									    tutorialPopUp[12].y = yCalc(40)
					    				mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[12])

									    local function showWrongTurnPopUp ()

									    	transition.to(tutorialPopUp[1], {alpha = 0, time = 200})
									    	transition.to(tutorialPopUp[6], {alpha = 0, time = 200})
									    	transition.to(tutorialPopUp[9], {alpha = 1, time = 200})

											if mainFunc.tutorialPopUp[4].alpha == 1 then
												transition.to(mainFunc.tutorialPopUp[4], {alpha = 0, time = 200})
											end

										    transition.to(tutorialPopUp[11], {alpha = 1, time = 200})
										    transition.to(tutorialPopUp[12], {alpha = 1, time = 200, onComplete = function ()
										    	tutorialPopUp[12].currentBlinkPopUpShouldCancel = false
									    		tutorialPopUp[12].popUpTimerIndex = 3
									    		t.blinkPopUp(tutorialPopUp[12], mainFunc)
										    end})
									    end

									    local function showRightTurnPopUp ()
									    	transition.to(tutorialPopUp[6], {alpha = 0, time = 200})
											transition.to(tutorialPopUp[7], {alpha = 1, time = 200})
										    transition.to(tutorialPopUp[8], {alpha = 1, time = 200})
										    transition.to(tutorialPopUp[10], {alpha = 1, time = 200})
									    end

											-- if ball is too high, different path
										if (mainFunc.ballAndButtonAndScreenCreateScript.instance2.y < yCalc(56) )
										or (mainFunc.ballAndButtonAndScreenCreateScript.instance2.y > yCalc(246) ) then
												showWrongTurnPopUp()
										else
											-- else if ball is in right place, just show right path
											showRightTurnPopUp()

										end
										
										mainFunc.tutorialActions[b].actionPieceSwitchCounter = 1
									else
										-- -- if ball is too high, different path

										if (mainFunc.tutorialPopUp[9]) then
											if mainFunc.tutorialPopUp[9].alpha == 1 then
												transition.to(mainFunc.tutorialPopUp[9], {alpha = 0, time = 200})
												transition.to(mainFunc.tutorialPopUp[1], {alpha = 1, time = 200})
												transition.to(mainFunc.tutorialPopUp[6], {alpha = 1, time = 200})
											end
										end

										if (mainFunc.tutorialPopUp[10]) then
											if mainFunc.tutorialPopUp[10].alpha == 1 then
												transition.to(mainFunc.tutorialPopUp[10], {alpha = 0, time = 200})
												transition.to(mainFunc.tutorialPopUp[7], {alpha = 0, time = 200})
												transition.to(mainFunc.tutorialPopUp[8], {alpha = 0, time = 200})

												transition.to(mainFunc.tutorialPopUp[6], {alpha = 1, time = 200})
											end
										end

										if (mainFunc.tutorialPopUp[11]) then
											if mainFunc.tutorialPopUp[11].alpha == 1 then
												transition.to(mainFunc.tutorialPopUp[11], {alpha = 0, time = 200})
												mainFunc.tutorialPopUp[12].alpha = 0
												mainFunc.tutorialPopUp[12].currentBlinkPopUpShouldCancel = true
												timer.cancel(mainFunc.popUpTimer[3])
											end
										end

										mainFunc.tutorialActions[b].actionPieceSwitchCounter = 0
									end
								end
							end
						end
					end
				}
			},
			gold = {
				silver = 1
			}
		},
		level3 = {
			silver = {
				silver = 2,
				tutorial = {
					onLevelStart = function (mainFunc, shapeArray)
				    	mainFunc.tutorialPopUp = {}

				    	t.popUpIntroTutorial(mainFunc, 1, "simple", mainFunc.allLevelSettings.tutorialPopUpParams["simple"])

				    	mainFunc.popUpTimer = {}
					end,
					onFanLanding = function (mainFunc, thisFan, shapeArray)
						tutorialPopUp = mainFunc.tutorialPopUp

					    if (thisFan.name == "simple1_1_1") then

						    tutorialPopUp[2] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
						    tutorialPopUp[2]:setSequence("hold")
						    tutorialPopUp[2]:play()
						    tutorialPopUp[2].anchorX = 0
						    tutorialPopUp[2].anchorY = 0
						    tutorialPopUp[2].alpha = 0
						    tutorialPopUp[2].x = xCalc(- 1)
						    tutorialPopUp[2].y = yCalc(287)

						    mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(tutorialPopUp[2])

						    transition.to(tutorialPopUp[2], {alpha = 1, time = 200})

						    tutorialPopUp[3] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
						    tutorialPopUp[3]:setSequence("tap")
						    tutorialPopUp[3]:play()
						    tutorialPopUp[3].anchorX = 0
						    tutorialPopUp[3].anchorY = 0
						    tutorialPopUp[3].alpha = 0
						    tutorialPopUp[3].x = xCalc(270)
						    tutorialPopUp[3].y = yCalc(245)

						    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[3])

						    transition.to(tutorialPopUp[3], {alpha = 1, time = 200})

						    tutorialPopUp[4] = display.newImageRect("images/central-images/Tutorials/Guides/2h.png", 120, 52)
						    tutorialPopUp[4].width = xCalc(120)
						    tutorialPopUp[4].height = yCalc(52)
						    tutorialPopUp[4].anchorX = 0
						    tutorialPopUp[4].anchorY = 0
						    tutorialPopUp[4].alpha = 0
						    tutorialPopUp[4].x = xCalc(270)
						    tutorialPopUp[4].y = yCalc(238)

						    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[4])

						    transition.to(tutorialPopUp[4], {alpha = 1, time = 200})

						    tutorialPopUp[5] = display.newImageRect("images/central-images/Tutorials/Guides/5v.png", 60, 260)
						    tutorialPopUp[5].width = xCalc(60)
						    tutorialPopUp[5].height = yCalc(260)
						    tutorialPopUp[5].anchorX = 0
						    tutorialPopUp[5].anchorY = 0
						    tutorialPopUp[5].alpha = 0
						    tutorialPopUp[5].x = xCalc(390)
						    tutorialPopUp[5].y = yCalc(30)

						    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[5])

						    transition.to(tutorialPopUp[5], {alpha = 1, time = 200})

						    tutorialPopUp[6] = display.newImageRect("images/central-images/Tutorials/Guides/1.png", 60, 52)
						    tutorialPopUp[6].width = xCalc(60)
						    tutorialPopUp[6].height = yCalc(52)
						    tutorialPopUp[6].anchorX = 0
						    tutorialPopUp[6].anchorY = 0
						    tutorialPopUp[6].alpha = 0
						    tutorialPopUp[6].x = xCalc(330)
						    tutorialPopUp[6].y = yCalc(30)

						    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[6])

						    transition.to(tutorialPopUp[2], {alpha = 1, time = 200, onComplete = function ()
						    	tutorialPopUp[2].currentBlinkPopUpShouldCancel = false
					    		tutorialPopUp[2].popUpTimerIndex = 1
					    		t.blinkPopUp(tutorialPopUp[2], mainFunc)
						    end})
						    transition.to(tutorialPopUp[3], {alpha = 1, time = 200, onComplete = function ()
						    	tutorialPopUp[3].currentBlinkPopUpShouldCancel = false
					    		tutorialPopUp[3].popUpTimerIndex = 2
					    		t.blinkPopUp(tutorialPopUp[3], mainFunc)
						    end})

						    transition.to(tutorialPopUp[6], {alpha = 1, time = 200})

					    elseif (thisFan.name == "simple2_1_1") then

							transition.to(mainFunc.tutorialPopUp[4], {alpha = 0, time = 200})
							transition.to(mainFunc.tutorialPopUp[5], {alpha = 0, time = 200})
							transition.to(mainFunc.tutorialPopUp[6], {alpha = 0, time = 200})

					    	tutorialPopUp[3].x = xCalc(330)
						    tutorialPopUp[3].y = yCalc(38)

						    tutorialPopUp[7] = display.newImageRect("images/central-images/Tutorials/Guides/3h.png", 180, 52)
						    tutorialPopUp[7].width = xCalc(180)
						    tutorialPopUp[7].height = yCalc(52)
						    tutorialPopUp[7].anchorX = 0
						    tutorialPopUp[7].anchorY = 0
						    tutorialPopUp[7].alpha = 0
						    tutorialPopUp[7].x = xCalc(150)
						    tutorialPopUp[7].y = yCalc(30)

						    mainFunc.allLevelSettings.backgroundObjectsGroup:insert(tutorialPopUp[7])

						    transition.to(tutorialPopUp[7], {alpha = 1, time = 200})

						    transition.to(tutorialPopUp[2], {alpha = 1, time = 200, onComplete = function ()
						    	tutorialPopUp[2].currentBlinkPopUpShouldCancel = false
					    		t.blinkPopUp(tutorialPopUp[2], mainFunc)
						    end})
						    transition.to(tutorialPopUp[3], {alpha = 1, time = 200, onComplete = function ()
						    	tutorialPopUp[3].currentBlinkPopUpShouldCancel = false
					    		t.blinkPopUp(tutorialPopUp[3], mainFunc)
						    end})
					    end
					end,
					onFanRelease = function (mainFunc, thisFan, shapeArray)
					    if (thisFan.name == "simple1_1_1") then
							mainFunc.tutorialPopUp[2].alpha = 0
							timer.cancel(mainFunc.popUpTimer[1])
							mainFunc.tutorialPopUp[3].alpha = 0
							timer.cancel(mainFunc.popUpTimer[2])
					    elseif (thisFan.name == "simple2_1_1") then
					    	mainFunc.tutorialPopUp[2].currentBlinkPopUpShouldCancel = true
							mainFunc.tutorialPopUp[2].alpha = 0
							timer.cancel(mainFunc.popUpTimer[1])
							mainFunc.tutorialPopUp[3].currentBlinkPopUpShouldCancel = true
							mainFunc.tutorialPopUp[3].alpha = 0
							timer.cancel(mainFunc.popUpTimer[2])

							transition.to(mainFunc.tutorialPopUp[6], {alpha = 0, time = 200})
					    end
					end
				}
			},
			gold = {
				silver = 1
			}
		},
		level4 = {
			silver = {
				silver = 3,
				onLevelComplete = 
				function ()
					myGameSettings["gems_discovered_second"] = true
				end,
				tutorial = {
					onLevelStart = function (mainFunc, shapeArray)
					end,
					onGoPress = function (mainFunc, shapeArray)
						mainFunc.tutorialPopUp = {}
						mainFunc.popUpTimer = {}
						for a = 1, #shapeArray do
							if shapeArray[a].name == "simple1_1_1" then
								shapeArray[a].tutorialSlideCounter = 0
							end
						end
					end,
					onSlideAction = function (mainFunc, objectSlided, shapeArray)

						if objectSlided.tutorialSlideCounter == 0 then
							if tutorialPopUp[1] then
								if tutorialPopUp[1].alpha == 1 then
									transition.to(tutorialPopUp[1], {alpha = 0, time = 200})
									mainFunc.tutorialPopUp[2].currentBlinkPopUpShouldCancel = true
									mainFunc.tutorialPopUp[2].alpha = 0
									timer.cancel(mainFunc.popUpTimer[1])

									if tutorialPopUp[3] then

									else
										tutorialPopUp[3] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
									    tutorialPopUp[3]:setSequence("hold")
									    tutorialPopUp[3]:play()
									    tutorialPopUp[3].anchorX = 0
									    tutorialPopUp[3].anchorY = 0
									    tutorialPopUp[3].alpha = 0
									    tutorialPopUp[3].x = xCalc(- 1)
									    tutorialPopUp[3].y = yCalc(287)

								    	mainFunc.allLevelSettings.pauseScreenObjectsGroup:insert(tutorialPopUp[3])

									    tutorialPopUp[4] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
									    tutorialPopUp[4]:setSequence("tap")
									    tutorialPopUp[4]:play()
									    tutorialPopUp[4].anchorX = 0
									    tutorialPopUp[4].anchorY = 0
									    tutorialPopUp[4].alpha = 0
									    tutorialPopUp[4].x = xCalc(210)
									    tutorialPopUp[4].y = yCalc(141)

									    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[4])

									    transition.to(tutorialPopUp[3], {alpha = 1, time = 200, onComplete = function ()
									    	tutorialPopUp[3].currentBlinkPopUpShouldCancel = false
								    		tutorialPopUp[3].popUpTimerIndex = 2
								    		t.blinkPopUp(tutorialPopUp[3], mainFunc)
									    end})
									    transition.to(tutorialPopUp[4], {alpha = 1, time = 200, onComplete = function ()
									    	tutorialPopUp[4].currentBlinkPopUpShouldCancel = false
								    		tutorialPopUp[4].popUpTimerIndex = 3
								    		t.blinkPopUp(tutorialPopUp[4], mainFunc)
									    end})
								    end
								end
							end
						else
							if tutorialPopUp[2] then
								if tutorialPopUp[2].alpha == 1 then
									transition.to(tutorialPopUp[2], {alpha = 0, time = 200})
									transition.to(tutorialPopUp[3], {alpha = 0, time = 200})

									transition.to(tutorialPopUp[1], {alpha = 1, time = 200})
								end
							end
						end

						if objectSlided.tutorialSlideCounter == 0 then
							objectSlided.tutorialSlideCounter = 1
						else
							objectSlided.tutorialSlideCounter = 0
						end
					end,
					onFanLanding = function (mainFunc, thisFan, shapeArray)
						if (thisFan.name == "simple1_1_1") then
							tutorialPopUp = mainFunc.tutorialPopUp

					    	if (tutorialPopUp[1]) then

					    	else
						    	tutorialPopUp[1] = display.newSprite(t.swipeArrowImageSheet, t.swipeArrowSequenceData)
							    tutorialPopUp[1]:setSequence("loop")
							    tutorialPopUp[1]:play()
							    tutorialPopUp[1].anchorX = 0
							    tutorialPopUp[1].anchorY = 0
							    tutorialPopUp[1].alpha = 0
							    tutorialPopUp[1].rotation = 180
							    tutorialPopUp[1].x = xCalc(257)
							    tutorialPopUp[1].y = yCalc(181)

						    	mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[1])

							    tutorialPopUp[2] = display.newSprite(t.swipeImageSheet, t.swipeSequenceData)
							    tutorialPopUp[2]:setSequence("tap")
							    tutorialPopUp[2]:play()
							    tutorialPopUp[2].anchorX = 0
							    tutorialPopUp[2].anchorY = 0
							    tutorialPopUp[2].alpha = 0
							    tutorialPopUp[2].x = xCalc(210)
							    tutorialPopUp[2].y = yCalc(89)

							    mainFunc.allLevelSettings.frontScreenObjectsGroup:insert(tutorialPopUp[2])

							    transition.to(tutorialPopUp[1], {alpha = 1, time = 200})
							    transition.to(tutorialPopUp[2], {alpha = 1, time = 200, onComplete = function ()
							    	tutorialPopUp[2].currentBlinkPopUpShouldCancel = false
						    		tutorialPopUp[2].popUpTimerIndex = 1
						    		t.blinkPopUp(tutorialPopUp[2], mainFunc)
							    end})
							end
						end
					end,
					onFanRelease = function (mainFunc, thisFan, shapeArray)
						tutorialPopUp = mainFunc.tutorialPopUp

						if tutorialPopUp[1].alpha == 1 then
							transition.to(tutorialPopUp[1], {alpha = 0, time = 200})
							mainFunc.tutorialPopUp[2].alpha = 0
							timer.cancel(mainFunc.popUpTimer[1])
						end
						if tutorialPopUp[4].currentBlinkPopUpShouldCancel == false then
							mainFunc.tutorialPopUp[3].currentBlinkPopUpShouldCancel = true
				    		mainFunc.tutorialPopUp[3].alpha = 0
							timer.cancel(mainFunc.popUpTimer[2])
							mainFunc.tutorialPopUp[4].currentBlinkPopUpShouldCancel = true
							mainFunc.tutorialPopUp[4].alpha = 0
							timer.cancel(mainFunc.popUpTimer[3])
				    	end
					end
				}
			},
			gold = {
				silver = 1
			}
		},
		level5 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level6 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level7 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level8 = {
			silver = {
				gemTotal = 10,
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level9 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level10 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level11 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level12 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level13 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		},
		level14 = {
			silver = {
				silver = 0,
				gold = 0
			},
			gold = {
				silver = 0
			}
		}
	},
	FieryFortress = {
		level1 = {
			silver = {
				silver = 0, 
				onLevelComplete = function ()
					myGameSettings["gems_discovered_first"] = true
				end
			},
			gold = {
			}
		},
		level2 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level3 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level4 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level5 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level6 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level7 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level8 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level9 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level10 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level11 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level12 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level13 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level14 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level15 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level16 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level17 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level18 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		}
	},
	IcyIsland = {
		level1 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level2 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level3 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level4 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level5 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level6 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level7 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level8 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level9 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level10 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level11 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level12 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level13 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level14 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level15 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level16 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level17 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level18 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level19 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level20 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level21 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level22 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level23 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level24 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		}
	},
	BallTimore = {
		level1 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level2 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level3 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level4 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level5 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level6 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level7 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level8 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level9 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level10 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level11 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level12 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level13 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level14 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level15 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level16 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level17 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level18 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},level19 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level20 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level21 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level22 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level23 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level24 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		}
	},
	HyrollCastle = {
		level1 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level2 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level3 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level4 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level5 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level6 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level7 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level8 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level9 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level10 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 00
			}
		},
		level11 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level12 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level13 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level14 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level15 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level16 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level17 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level18 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level19 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level20 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level21 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		},
		level22 = {
			silver = {
				silver = 0
			},
			gold = {
				silver = 0
			}
		}
	}
}

t.levelConfigArray = levelConfigArray

local worldConfigArray = {
	{"WoodyWalk", {silver = 0, gold = 0}},
	{"FieryFortress", {silver = 0, gold = 0}},
	{"HyrollCastle", {silver = 0, gold = 0}},
	{"IcyIsland", {silver = 0, gold = 0}},
	{"BallTimore", {silver = 0, gold = 0}}
}
t.worldConfigArray = worldConfigArray

local characterConfigArray = {
	"PuckNorris", "PrincessBoulder", "TheShuttleMickyTake"
}
t.characterConfigArray = characterConfigArray

local fullCharacterConfigArray = {
	normal = {
		sheetName = "images/objects/characters/ballSprite.png",
		sheetWidth = 124,
		sheetHeight = 68
	},
	PrincessBoulder = {
		sheetName = "images/objects/characters/PrincessBoulderSprite.png",
		sheetWidth = 152,
		sheetHeight = 114
	},
	PuckNorris = {
		sheetName = "images/objects/characters/PuckNorrisSprite.png",
		sheetWidth = 124,
		sheetHeight = 102
	},
	TheShuttleMickyTake = {
		sheetName = "images/objects/characters/TheShuttleMickyTakeSprite.png",
		sheetWidth = 124,
		sheetHeight = 114
	}
}
t.fullCharacterConfigArray = fullCharacterConfigArray

local itemConfigArray = {
	"clock", "bomb", "hook", "jet", "iceCape", "fireCape", "characterSpecial", "bulletVest", "dummyBall", "superBall", 
	"gem", "autoFan", "manualFan", "spitter", "triangle", "bar", "simple", "backFire", "switch", "tunnel", "door",
	"icyTriangle", "fireTriangle", "breakableTriangle", "flip-triangle"
}
t.itemConfigArray = itemConfigArray

return t
