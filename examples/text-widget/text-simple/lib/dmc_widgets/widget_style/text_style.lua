--====================================================================--
-- dmc_widgets/theme_manager/background_style.lua
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
--== DMC Corona Widgets : Text Widget Style
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
--== DMC Widgets : newTextStyle
--====================================================================--



--====================================================================--
--== Imports


local Objects = require 'dmc_objects'
local Utils = require 'dmc_utils'

local BaseStyle = require( widget_find( 'widget_style.base_style' ) )



--====================================================================--
--== Setup, Constants


local newClass = Objects.newClass
local ObjectBase = Objects.ObjectBase

local sformat = string.format
local tinsert = table.insert

--== To be set in initialize()
local Widgets = nil



--====================================================================--
--== Text Style Class
--====================================================================--


local TextStyle = newClass( BaseStyle, {name="Text Style"} )

--== Class Constants

TextStyle.TYPE = 'text'

TextStyle.__base_style__ = nil

TextStyle._VALID_PROPERTIES = {
	debugOn=true,
	width=true,
	height=true,
	anchorX=true,
	anchorY=true,

	align=true,
	fillColor=true,
	font=true,
	fontSize=true,
	marginX=true,
	marginY=true,
	textColor=true,

	strokeColor=true,
	strokeWidth=true,
}

TextStyle._EXCLUDE_PROPERTY_CHECK = {
	-- width/height, they can be nil
	width=true,
	height=true
}

TextStyle._STYLE_DEFAULTS = {
	name='text-default-style',
	debugOn=false,
	width=nil,
	height=nil,
	anchorX=0.5,
	anchorY=0.5,

	align='center',
	fillColor={0,0,0,0},
	font=native.systemFont,
	fontSize=16,
	marginX=0,
	marginY=0,
	textColor={0,0,0,1},

	strokeColor={0,0,0,0},
	strokeWidth=0,
}

TextStyle._TEST_DEFAULTS = {
	name='text-test-style',
	debugOn=false,
	width=117,
	height=nil,
	anchorX=101,
	anchorY=102,

	align='test-center',
	fillColor={101,102,103,104},
	font=native.systemFont,
	fontSize=101,
	marginX=102,
	marginY=103,
	textColor={111,112,113,114},

	strokeColor={121,122,123,124},
	strokeWidth=111,
}

TextStyle.MODE = BaseStyle.RUN_MODE
TextStyle._DEFAULTS = TextStyle._STYLE_DEFAULTS

--== Event Constants

TextStyle.EVENT = 'text-style-event'


--======================================================--
-- Start: Setup DMC Objects

function TextStyle:__init__( params )
	-- print( "TextStyle:__init__", params )
	params = params or {}
	self:superCall( '__init__', params )
	--==--

	--== Style Properties ==--

	-- self._inherit
	-- self._widget
	-- self._parent
	-- self._onProperty

	-- self._name
	-- self._debugOn
	-- self._width
	-- self._height
	-- self._anchorX
	-- self._anchorY

	self._align = nil
	self._fillColor = nil
	self._font = nil
	self._fontSize = nil
	self._marginX = nil
	self._marginY = nil
	self._strokeColor = nil
	self._strokeWidth = nil
	self._textColor = nil
end

-- END: Setup DMC Objects
--======================================================--



--====================================================================--
--== Static Methods


function TextStyle.initialize( manager, params )
	-- print( "TextStyle.initialize", manager )
	params = params or {}
	if params.mode==nil then params.mode=BaseStyle.RUN_MODE end
	--==--
	Widgets = manager

	if params.mode==BaseStyle.TEST_MODE then
		TextStyle.MODE = BaseStyle.TEST_MODE
		TextStyle._DEFAULTS = TextStyle._TEST_DEFAULTS
	end
	local defaults = TextStyle._DEFAULTS

	TextStyle._setDefaults( TextStyle, {defaults=defaults} )
end


function TextStyle.addMissingDestProperties( dest, src )
	-- print( "TextStyle.addMissingDestProperties", dest, src )
	assert( dest )
	--==--
	local srcs = { TextStyle._DEFAULTS }
	if src then tinsert( srcs, 1, src ) end

	dest = BaseStyle.addMissingDestProperties( dest, src )

	for i=1,#srcs do
		local src = srcs[i]

		if dest.align==nil then dest.align=src.align end
		if dest.fillColor==nil then dest.fillColor=src.fillColor end
		if dest.font==nil then dest.font=src.font end
		if dest.fontSize==nil then dest.fontSize=src.fontSize end
		if dest.marginX==nil then dest.marginX=src.marginX end
		if dest.marginY==nil then dest.marginY=src.marginY end
		if dest.strokeColor==nil then dest.strokeColor=src.strokeColor end
		if dest.strokeWidth==nil then dest.strokeWidth=src.strokeWidth end
		if dest.textColor==nil then dest.textColor=src.textColor end

	end

	return dest
end


-- copyExistingSrcProperties()
--
function TextStyle.copyExistingSrcProperties( dest, src, params )
	-- print( "TextStyle.copyExistingSrcProperties", dest, src )
	assert( dest )
	if not src then return end
	params = params or {}
	if params.force==nil then params.force=false end
	--==--
	local force=params.force

	BaseStyle.copyExistingSrcProperties( dest, src, params )

	if (src.align~=nil and dest.align==nil) or force then
		dest.align=src.align
	end
	if (src.fillColor~=nil and dest.fillColor==nil) or force then
		dest.fillColor=src.fillColor
	end
	if (src.font~=nil and dest.font==nil) or force then
		dest.font=src.font
	end
	if (src.fontSize~=nil and dest.fontSize==nil) or force then
		dest.fontSize=src.fontSize
	end
	if (src.marginX~=nil and dest.marginX==nil) or force then
		dest.marginX=src.marginX
	end
	if (src.marginY~=nil and dest.marginY==nil) or force then
		dest.marginY=src.marginY
	end
	if (src.strokeColor~=nil and dest.strokeColor==nil) or force then
		dest.strokeColor=src.strokeColor
	end
	if (src.strokeWidth~=nil and dest.strokeWidth==nil) or force then
		dest.strokeWidth=src.strokeWidth
	end
	if (src.textColor~=nil and dest.textColor==nil) or force then
		dest.textColor=src.textColor
	end

	return dest
end


-- _verifyStyleProperties()
--
function TextStyle._verifyStyleProperties( src )
	-- print( "TextStyle._verifyStyleProperties", src )
	local emsg = "Style (Text) requires property '%s'"

	-- exclude width/height because nil is valid value
	local is_valid = BaseStyle._verifyStyleProperties( src, {width=true, height=true} )

	if not src.align then
		print(sformat(emsg,'align')) ; is_valid=false
	end
	if not src.fillColor then
		print(sformat(emsg,'fillColor')) ; is_valid=false
	end
	if not src.font then
		print(sformat(emsg,'font')) ; is_valid=false
	end
	if not src.fontSize then
		print(sformat(emsg,'fontSize')) ; is_valid=false
	end
	if not src.marginX then
		print(sformat(emsg,'marginX')) ; is_valid=false
	end
	if not src.marginY then
		print(sformat(emsg,'marginY')) ; is_valid=false
	end
	if not src.strokeColor then
		print(sformat(emsg,'strokeColor')) ; is_valid=false
	end
	if not src.strokeWidth then
		print(sformat(emsg,'strokeWidth')) ; is_valid=false
	end
	if not src.textColor then
		print(sformat(emsg,'textColor')) ; is_valid=false
	end

	return is_valid
end



--====================================================================--
--== Public Methods


--== verifyProperties

function TextStyle:verifyProperties()
	-- print( "TextStyle:verifyProperties" )
	return TextStyle._verifyStyleProperties( self )
end



--====================================================================--
--== Private Methods


-- none



--====================================================================--
--== Event Handlers


-- none



return TextStyle
