local t = {}

-- OBJECT STRUCTURE NOTE

local IAPShapeItemsArray = {
	triangle = {
		{
			itemPrice = 100,
			properties = {shape = "triangleTopRightShape"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "triangleTopRightShape"}
		},
		{
			itemPrice = 100,
			properties = {shape = "triangleBottomRightShape"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "triangleBottomRightShape"}
		},
		{
			itemPrice = 100,
			properties = {shape = "triangleBottomLeftShape"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "triangleBottomLeftShape"}
		},
		{
			itemPrice = 100,
			properties = {shape = "triangleTopLeftShape"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "triangleTopLeftShape"}
		},
	},
	bar = {
		{
			itemPrice = 100,
			properties = {shape = "horz"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "horz"}
		}
		,{
			itemPrice = 100,
			properties = {shape = "vert"}
		},
		{
			quantity = 4,
			itemPrice = 300,
			properties = {shape = "vert"}
		}
	},
	autoFan = {
		{
			itemPrice = 100,
			properties = {directions = {"up"}}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {directions = {"up"}}
		},
		{
			itemPrice = 100,
			properties = {directions = {"right"}}
		}
	},
	manualFan = {
		{
			itemPrice = 100,
			properties = {directions = {"up"}}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {directions = {"up"}}
		},
		{
			itemPrice = 100,
			properties = {directions = {"right"} }
		}
	},
	simple = {
		{
			itemPrice = 100
		},
		{
			quantity = 4,
			itemPrice = 100
		}
	},
	backFire = {
		{
			itemPrice = 100
		},
		{
			quantity = 4,
			itemPrice = 100
		}
	},
	spitter = {
		{
			itemPrice = 100,
			properties = {directions = {"up"}}
		},
		{
			itemPrice = 100,
			properties = {directions = {"up", "right", "down", "left"}}
		},
		{
			itemPrice = 100,
			properties = {directions = {"right"}}
		}
	}

}
	t.IAPShapeItemsArray = IAPShapeItemsArray


return t