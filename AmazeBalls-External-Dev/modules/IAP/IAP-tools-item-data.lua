local t = {}

-- OBJECT STRUCTURE NOTE

--[[
	bomb = {
		{
			quantity = 1, -- optional (default = 1)
			itemPrice = 100,
			itemPriceType = coin, -- optional (default = coins)
			itemPrice2 = 1.00 -- optional (default doesn´t exist)
								-- if you specify an itemPrice2, you must specify itemPriceType, 
								-- and itemPriceType of itemPrice2 is taken as opposite of itemPriceType
		},
		{}
	}
]]

local IAPToolItemsArray = {
	bomb = {
		{
			quantity = 4,
			itemPrice = 128,
			properties = { directions = {"up", "right" , "down", "left"}, squares = 4 },
			voucherNeeded = true
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = { directions = {"right"}, squares = 2}
		},
		{
			quantity = 1,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 3 }
		},
		{
			quantity = 1,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 4 },
			voucherNeeded = true
		},
		{
			quantity = 1,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 1 }
		},
		{
			quantity = 1,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 1 }
		},
		{
			quantity = 1,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 1 }
		}
	},
	hook = {
		{
			itemPrice = 100,
			properties = {directions = {"up"}, squares = 1}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {directions = {"right"}, squares = 1}
		},
		{
			itemPrice = 100,
			properties = {directions = {"down"}, squares = 1}
		},
		{
			itemPrice = 100,
			properties = {directions = {"left"}, squares = 1}
		},
		{
			itemPrice = 175,
			properties = {directions = {"up"}, squares = 2}
		},
		{
			itemPrice = 175,
			properties = {directions = {"right"}, squares = 2}
		},
		{
			itemPrice = 175,
			properties = {directions = {"down"}, squares = 2}
		},
		{
			itemPrice = 175,
			properties = {directions = {"left"}, squares = 2}
		}
	},
	clock = { --
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 200,
			properties = {seconds = 6}
		},
		{
			itemPrice = 300,
			properties = {seconds = 7}
		},
		{
			itemPrice = 100,
			properties = {seconds = 0}
		}
	},
	jet = {
		{
			itemPrice = 100,
			properties = {directions = {"right"} }
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {directions = {"right"} }
		},
		{
			itemPrice = 100,
			properties = {directions = {"right"} }
		},
		{
			itemPrice = 100,
			properties = {directions = {"right"}}
		}
	},
	dummyBall = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	},
	superBall = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	},
	bulletVest = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	},
	iceCape = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	},
	fireCape = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	},
	characterSpecial = {
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			quantity = 4,
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		},
		{
			itemPrice = 100,
			properties = {seconds = 5}
		}
	}

}
	t.IAPToolItemsArray = IAPToolItemsArray


return t