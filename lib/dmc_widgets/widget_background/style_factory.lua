--====================================================================--
-- dmc_widgets/widget_background/style_factory.lua
--
-- Documentation: http://docs.davidmccuskey.com/
--====================================================================--

--[[

The MIT License (MIT)

Copyright (c) 2015 David McCuskey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]]



--====================================================================--
--== DMC Corona Widgets : Widget Background-View Factory
--====================================================================--


-- Semantic Versioning Specification: http://semver.org/

local VERSION = "0.1.0"



--====================================================================--
--== DMC Widgets Setup
--====================================================================--


local dmc_widget_data = _G.__dmc_widget
local dmc_widget_func = dmc_widget_data.func
local widget_find = dmc_widget_func.find



--====================================================================--
--== DMC Widgets : newBackground
--====================================================================--


--====================================================================--
--== Imports


local Widgets = nil -- set later

local Rectangle = require( widget_find( 'widget_background.rectangle_style' ) )
local Rounded = require( widget_find( 'widget_background.rounded_style' ) )



--====================================================================--
--== Setup, Constants


local sformat = string.format



--====================================================================--
--== Support Functions


local function initializeFactory( manager )
	-- print( "StyleFactory.initializeFactory" )
	Widgets = manager

	Rectangle.initialize( manager )
	Rounded.initialize( manager )
end


local function getStyleNames()
	-- print( "StyleFactory.getStyleNames" )
	return {
		Rectangle.TYPE,
		Rounded.TYPE
	}
end

local function getStyleClasses()
	-- print( "StyleFactory.getStyleClasses" )
	return {
		Rectangle,
		Rounded
	}
end


local function getStyleClass( style_type )
	-- print( "StyleFactory.getStyleClass", style_type )
	if style_type==Rectangle.TYPE then
		return Rectangle
	elseif style_type==Rounded.TYPE then
		return Rounded
	else
		error( sformat( "StyleFactory: Unknown style type '%s'", tostring( style_type )))
	end
end


local function createStyle( style_type, params )
	-- print( "StyleFactory.createStyle", style_type )
	local StyleClass = getStyleClass( style_type )
	return StyleClass:new( params )
end



--====================================================================--
--== Background Style Factory Facade
--====================================================================--


return {

	initialize = initializeFactory,

	Rectangle = Rectangle,
	Rounded = Rounded,

	create = createStyle,
	getClass = getStyleClass,

	getStyleNames = getStyleNames,
	getStyleClasses = getStyleClasses
}
