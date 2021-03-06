--====================================================================--
--== HDR Color File
--====================================================================--


local data = {
	["Alice Blue"] = { 240/255, 248/255, 255/255 },
	["Antique White"] = { 250/255, 235/255, 215/255 },
	["Aqua"] = { 0/255, 255/255, 255/255 },
	["Aquamarine"] = { 127/255, 255/255, 212/255 },
	["Azure"] = { 240/255, 255/255, 255/255 },
	["Beige"] = { 245/255, 245/255, 220/255 },
	["Bisque"] = { 255/255, 228/255, 196/255 },
	["Black"] = { 0/255, 0/255, 0/255 },
	["Blanched Almond"] = { 255/255, 235/255, 205/255 },
	["Blue"] = { 0/255, 0/255, 255/255 },
	["Blue Violet"] = { 138/255, 43/255, 226/255 },
	["Brown"] = { 165/255, 42/255, 42/255 },
	["Burlywood"] = { 222/255, 184/255, 135/255 },
	["Cadet Blue"] = { 95/255, 158/255, 160/255 },
	["Chartreuse"] = { 127/255, 255/255, 0/255 },
	["Chocolate"] = { 210/255, 105/255, 30/255 },
	["Coral"] = { 95/255, 158/255, 160/255 },
	["Cornflower"] = { 100/255, 149/255, 237/255 },
	["Cornsilk"] = { 255/255, 248/255, 220/255 },
	["Crimson"] = { 220/255, 20/255, 60/255 },
	["Cyan"] = { 0/255, 255/255, 255/255 },
	["Dark Blue"] = { 0/255, 0/255, 139/255 },
	["Dark Cyan"] = { 0/255, 139/255, 139/255 },
	["Dark Goldenrod"] = { 184/255, 134/255, 11/255 },
	["Dark Gray"] = { 169/255, 169/255, 169/255 },
	["Dark Green"] = { 0/255, 100/255, 0/255 },
	["Dark Khaki"] = { 189/255, 183/255, 107/255 },
	["Dark Magenta"] = { 139/255, 0/255, 139/255 },
	["Dark Olive Green"] = { 85/255, 107/255, 47/255 },
	["Dark Orange"] = { 255/255, 140/255, 0/255 },
	["Dark Orchid"] = { 153/255, 50/255, 204/255 },
	["Dark Red"] = { 139/255, 0/255, 0/255 },
	["Dark Salmon"] = { 233/255, 150/255, 122/255 },
	["Dark Sea Green"] = { 143/255, 188/255, 143/255 },
	["Dark Slate Blue"] = { 72/255, 61/255, 139/255 },
	["Dark Slate Gray"] = { 47/255, 79/255, 79/255 },
	["Dark Turquoise"] = { 0/255, 206/255, 209/255 },
	["Dark Violet"] = { 148/255, 0/255, 211/255 },
	["Deep Pink"] = { 255/255, 20/255, 147/255 },
	["Deep Sky Blue"] = { 0/255, 191/255, 255/255 },
	["Dim Gray"] = { 105/255, 105/255, 105/255 },
	["Dodger Blue"] = { 30/255, 144/255, 255/255 },
	["Firebrick"] = { 178/255, 34/255, 34/255 },
	["Floral White"] = { 255/255, 250/255, 240/255 },
	["Forest Green"] = { 34/255, 139/255, 34/255 },
	["Fuchsia"] = { 255/255, 0/255, 255/255 },
	["Gainsboro"] = { 220/255, 220/255, 220/255 },
	["Ghost White"] = { 248/255, 248/255, 255/255 },
	["Gold"] = { 255/255, 215/255, 0/255 },
	["Goldenrod"] = { 218/255, 165/255, 32/255 },
	["Gray"] = { 190/255, 190/255, 190/255 },
	["Gray-W3C"] = { 128/255, 128/255, 128/255 },
	["Gray-X11"] = { 190/255, 190/255, 190/255 },
	["Green Yellow"] = { 173/255, 255/255, 47/255 },
	["Green-W3C"] = { 0/255, 128/255, 0/255 },
	["Green-X11"] = { 0/255, 255/255, 0/255 },
	["Honeydew"] = { 240/255, 255/255, 240/255 },
	["Hot Pink"] = { 255/255, 105/255, 180/255 },
	["Indian Red"] = { 205/255, 92/255, 92/255 },
	["Indigo"] = { 75/255, 0/255, 130/255 },
	["Ivory"] = { 255/255, 255/255, 240/255 },
	["Khaki"] = { 240/255, 230/255, 140/255 },
	["Lavender"] = { 230/255, 230/255, 250/255 },
	["Lavender Blush"] = { 255/255, 240/255, 245/255 },
	["Lawn Green"] = { 124/255, 252/255, 0/255 },
	["Lemon Chiffon"] = { 255/255, 250/255, 205/255 },
	["Light Blue"] = { 173/255, 216/255, 230/255 },
	["Light Coral"] = { 240/255, 128/255, 128/255 },
	["Light Cyan"] = { 224/255, 255/255, 255/255 },
	["Light Goldenrod"] = { 250/255, 250/255, 210/255 },
	["Light Gray"] = { 211/255, 211/255, 211/255 },
	["Light Green"] = { 144/255, 238/255, 144/255 },
	["Light Pink"] = { 255/255, 182/255, 193/255 },
	["Light Salmon"] = { 255/255, 160/255, 122/255 },
	["Light Sea Green"] = { 32/255, 178/255, 170/255 },
	["Light Sky Blue"] = { 135/255, 206/255, 250/255 },
	["Light Slate Gray"] = { 119/255, 136/255, 153/255 },
	["Light Steel Blue"] = { 176/255, 196/255, 222/255 },
	["Light Yellow"] = { 255/255, 255/255, 224/255 },
	["Lime Green"] = { 50/255, 205/255, 50/255 },
	["Lime-W3C"] = { 0/255, 255/255, 0/255 },
	["Linen"] = { 250/255, 240/255, 230/255 },
	["Magenta"] = { 255/255, 0/255, 255/255 },
	["Maroon-W3C"] = { 127/255, 0/255, 0/255 },
	["Maroon-X11"] = { 176/255, 48/255, 96/255 },
	["Medium Aquamarine"] = { 102/255, 205/255, 170/255 },
	["Medium Blue"] = { 0/255, 0/255, 205/255 },
	["Medium Orchid"] = { 186/255, 85/255, 211/255 },
	["Medium Purple"] = { 147/255, 112/255, 219/255 },
	["Medium Sea Green"] = { 60/255, 179/255, 113/255 },
	["Medium Slate Blue"] = { 123/255, 104/255, 238/255 },
	["Medium Spring Green"] = { 0/255, 250/255, 154/255 },
	["Medium Turquoise"] = { 72/255, 209/255, 204/255 },
	["Medium Violet Red"] = { 199/255, 21/255, 133/255 },
	["Midnight Blue"] = { 25/255, 25/255, 112/255 },
	["Mint Cream"] = { 245/255, 255/255, 250/255 },
	["Misty Rose"] = { 255/255, 228/255, 225/255 },
	["Moccasin"] = { 255/255, 228/255, 181/255 },
	["Navajo White"] = { 255/255, 222/255, 173/255 },
	["Navy"] = { 0/255, 0/255, 128/255 },
	["Old Lace"] = { 253/255, 245/255, 230/255 },
	["Olive"] = { 128/255, 128/255, 0/255 },
	["Olive Drab"] = { 107/255, 142/255, 35/255 },
	["Orange"] = { 255/255, 165/255, 0/255 },
	["Orchid"] = { 218/255, 112/255, 214/255 },
	["Pale Goldenrod"] = { 238/255, 232/255, 170/255 },
	["Pale Green"] = { 152/255, 251/255, 152/255 },
	["Pale Turquoise"] = { 175/255, 238/255, 238/255 },
	["Pale Violet Red"] = { 219/255, 112/255, 147/255 },
	["Papaya Whip"] = { 255/255, 239/255, 213/255 },
	["Peach Puff"] = { 255/255, 218/255, 185/255 },
	["Peru"] = { 205/255, 133/255, 63/255 },
	["Pink"] = { 255/255, 192/255, 203/255 },
	["Plum"] = { 221/255, 160/255, 221/255 },
	["Powder Blue"] = { 176/255, 224/255, 230/255 },
	["Purple-W3C"] = { 127/255, 0/255, 127/255 },
	["Purple-X11"] = { 160/255, 32/255, 240/255 },
	["Red"] = { 255/255, 0/255, 0/255 },
	["Rosy Brown"] = { 188/255, 143/255, 143/255 },
	["Royal Blue"] = { 65/255, 105/255, 225/255 },
	["Saddle Brown"] = { 139/255, 69/255, 19/255 },
	["Salmon"] = { 250/255, 128/255, 114/255 },
	["Sandy Brown"] = { 244/255, 164/255, 96/255 },
	["Sea Green"] = { 46/255, 139/255, 87/255 },
	["Seashell"] = { 255/255, 245/255, 238/255 },
	["Sienna"] = { 160/255, 82/255, 45/255 },
	["Silver-W3C"] = { 192/255, 192/255, 192/255 },
	["Sky Blue"] = { 135/255, 206/255, 235/255 },
	["Slate Blue"] = { 106/255, 90/255, 205/255 },
	["Slate Gray"] = { 112/255, 128/255, 144/255 },
	["Snow"] = { 255/255, 250/255, 250/255 },
	["Spring Green"] = { 0/255, 255/255, 127/255 },
	["Steel Blue"] = { 70/255, 130/255, 180/255 },
	["Tan"] = { 210/255, 180/255, 140/255 },
	["Teal"] = { 0/255, 128/255, 128/255 },
	["Thistle"] = { 216/255, 191/255, 216/255 },
	["Tomato"] = { 255/255, 99/255, 71/255 },
	["Turquoise"] = { 64/255, 224/255, 208/255 },
	["Violet"] = { 238/255, 130/255, 238/255 },
	["Wheat"] = { 245/255, 222/255, 179/255 },
	["White"] = { 255/255, 255/255, 255/255 },
	["White Smoke"] = { 245/255, 245/255, 245/255 },
	["Yellow"] = { 255/255, 255/255, 0/255 },
	["Yellow Green"] = { 154/255, 205/255, 50/255 },
}



--====================================================================--
--== Color File Setup
--====================================================================--


local function initializeColors( Kolor )
	Kolor.addColors( data, {format=Kolor.dRGBA} )
end

return {
	initialize=initializeColors
}
