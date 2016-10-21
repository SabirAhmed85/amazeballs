
-- application =
-- {
-- content =
-- 	{
-- 	width = 320,
-- 	height = 480,
-- 	scale = "zoomStretch"
-- 	},
-- }

local aspectRatio = display.pixelHeight/display.pixelWidth

application =
{
   content =
   {
      width = aspectRatio > 1.5 and 320 or math.ceil( 480 / aspectRatio ),
      height = aspectRatio < 1.5 and 480 or math.ceil( 320 * aspectRatio ),
      scale = "letterBox",
      xAlign = "center",
      yAlign = "center",
      imageSuffix =
      {
         ["@2x"] = 1.3
      },
   },
}

