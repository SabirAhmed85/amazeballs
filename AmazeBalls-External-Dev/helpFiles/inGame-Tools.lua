-------------------------
-- SHAPE COLLISIONS

local function onRectangleCollision( event )
        if ( event.phase == "began" ) then
	    Runtime:removeEventListener( "enterFrame", moveSomething )
            if (direction) == "left" then
		
		direction = "up"
		
	    elseif (direction) == "up" then
	    
		direction = "left"
		
	    elseif (direction) == "real-left" then
		
		direction = "right"
		
	    elseif (direction) == "right" then
	    
		direction = "real-left"
	    end
	    
	    Runtime:addEventListener( "enterFrame", moveSomething )
	    
        end
end

local function on_RA_Triangle_BL_Collision( event )
        if ( event.phase == "began" ) then
	    Runtime:removeEventListener( "enterFrame", moveSomething )
            if (direction) == "real-left" then
		
		direction = "right"
		
	    elseif (direction) == "up" then
	    
		direction = "real-left"
		
	    elseif (direction) == "right" then
	    
		direction = "left"
		
	    elseif (direction) == "left" then
	    
		direction = "up"
		
	    end
	    
	    Runtime:addEventListener( "ent`CerFrame", moveSomething )
	    
        end
end