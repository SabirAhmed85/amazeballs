---------------
--Rectangle

cat = display.newImageRect("grass.png", 65, 45)
cat:setReferencePoint(display.TopLeftReferencePoint)
cat.x, cat.y = 10, 15
 
--Let's add a physics body with a basic Square shape.
physics.addBody( cat, "static", {
friction = 0,
bounce = 0,
density = 0,
shape = {
-18,-10, --top left
30,-10, -- top right
30,20, -- bottom right
-18,20 --bottom left
}
})


---------------

--  Square
cat2 = display.newImageRect("grass.png", 125, 45)
cat2:setReferencePoint(display.TopLeftReferencePoint)
cat2.x, cat2.y = 166, 45
 
--Let's add a physics body with a basic Square shape.
physics.addBody( cat2, "static", {
friction = 0,
bounce = 0,
density = 0,
shape = {
-25,-10, --top left
20,-10, -- top right
20,30, -- bottom right
-25,30 --bottom left
}
})

---------------
--equilateral triangle physics object

local rad=30/360*2*math.pi
local xHalfLen=70*math.sin(rad)
local yLen=70*math.cos(rad)

local obj=display.newLine(100,100, 100+xHalfLen,100+yLen)
obj:append(100-xHalfLen,100+yLen, 100,100)
obj.width=1
obj:setColor(255,120,120)

local triangleShape={0,0, xHalfLen,yLen, -xHalfLen,yLen}    
--center of object is at top of triangle
physics.addBody(obj, "static", {density=0,friction=0,shape=triangleShape} )

---------------
--  Normal Triangle

local triangle2 = display.newImage("grass.png")
triangle2.x, triangle.y = 200, 170
triangle2Shape = { 90,15, 140,65, 90,65 }
triangle2.name = "triangle2"
 
physics.addBody( triangle2, "static", { density=1.6, friction=0.5, bounce=0.2, shape=triangle2Shape } )