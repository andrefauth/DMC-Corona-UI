--====================================================================--
-- dmc_widgets/base_textfield_style.lua
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
--== DMC Corona Widgets : Widget TextField Style
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
--== DMC Widgets : newTextFieldStyle
--====================================================================--



--====================================================================--
--== Imports


local Objects = require 'dmc_objects'

local BaseStyle = require( widget_find( 'widget_style.base_style' ) )



--====================================================================--
--== Setup, Constants


local newClass = Objects.newClass
local ObjectBase = Objects.ObjectBase

local sformat = string.format

local Widgets = nil -- set later



--====================================================================--
--== TextField Style Class
--====================================================================--


local TextFieldStyle = newClass( BaseStyle, {name="TextField Style"} )

--== Class Constants

TextFieldStyle.__base_style__ = nil

-- child styles
TextFieldStyle.BACKGROUND_KEY = 'background'
TextFieldStyle.BACKGROUND_NAME = 'textfield-background'
TextFieldStyle.HINT_KEY = 'hint'
TextFieldStyle.HINT_NAME = 'textfield-hint'
TextFieldStyle.DISPLAY_KEY = 'display'
TextFieldStyle.DISPLAY_NAME = 'textfield-display'

TextFieldStyle._STYLE_DEFAULTS = {
	name='textfield-default-style',
	debugOn=false,

	width=200,
	height=40,

	align='center',
	anchorX=0.5,
	anchorY=0.5,
	backgroundStyle='none',
	inputType='default',
	isHitActive=true,
	isHitTestable=true,
	isSecure=false,
	marginX=0,
	marginY=5,
	returnKey='done',

	background={
		--[[
		Copied from TextField
		* width
		* height
		* anchorX/Y
		--]]
		view={
			type='rectangle',

			fillColor={0.5,0.5,0.2,1},
			strokeWidth=2,
			strokeColor={0,0,0,1},
		}
	},
	hint={
		--[[
		Copied from TextField
		* width
		* height
		* align
		* anchorX/Y
		* marginX/Y
		--]]
		fillColor={0,0,0,0},
		font=native.systemFont,
		fontSize=24,
		textColor={0.3,0.3,0.3,1},
	},
	display={
		--[[
		Copied from TextField
		* width
		* height
		* align
		* anchorX/Y
		* marginX/Y
		--]]
		fillColor={0,0,0,0},
		font=native.systemFontBold,
		fontSize=24,
		textColor={0.1,0.1,0.1,1},
	},

}

--== Event Constants

TextFieldStyle.EVENT = 'textfield-style-event'

-- from super
-- Class.STYLE_UPDATED


--======================================================--
-- Start: Setup DMC Objects

function TextFieldStyle:__init__( params )
	-- print( "TextFieldStyle:__init__", params )
	params = params or {}
	self:superCall( '__init__', params )
	--==--

	--== Style Properties ==--

	-- self._data
	-- self._inherit
	-- self._widget
	-- self._parent
	-- self._onProperty

	-- self._name
	-- self._debugOn

	--== Local style properties

	self._width = nil
	self._height = nil

	self._align = nil
	self._anchorX = nil
	self._anchorY = nil
	self._bgStyle = nil
	self._inputType = nil
	self._isHitActive = nil
	self._isHitTestable = nil
	self._isSecure = nil
	self._marginX = nil
	self._marginY = nil
	self._returnKey = nil

	--== Object Refs ==--

	-- these are other style objects
	self._background = nil
	self._hint = nil
	self._display = nil

end

-- END: Setup DMC Objects
--======================================================--



--====================================================================--
--== Static Methods


function TextFieldStyle.initialize( manager )
	-- print( "TextFieldStyle.initialize", manager )
	Widgets = manager

	TextFieldStyle._setDefaults()
end


function TextFieldStyle._setDefaults()
	-- print( "TextFieldStyle._setDefaults" )

	local defaults = TextFieldStyle._STYLE_DEFAULTS

	defaults = TextFieldStyle.pushMissingProperties( defaults )

	local style = TextFieldStyle:new{
		data=defaults
	}
	TextFieldStyle.__base_style__ = style

end


function TextFieldStyle.copyMissingProperties( dest, src )
	-- print( "TextFieldStyle.copyMissingProperties", dest, src )
end


function TextFieldStyle.pushMissingProperties( src )
	-- print("TextFieldStyle.pushMissingProperties", src )
	if not src then return end

	local StyleClass, dest
	local eStr = "ERROR: Style missing property '%s'"

	-- copy properties to Background substyle 'background'
	StyleClass = Widgets.Style.Background
	dest = src[ TextFieldStyle.BACKGROUND_KEY ]
	assert( dest, sformat( eStr, TextFieldStyle.BACKGROUND_KEY ) )
	StyleClass.copyMissingProperties( dest, src )

	-- copy properties to Text substyle 'hint'
	StyleClass = Widgets.Style.Text
	dest = src[ TextFieldStyle.HINT_KEY ]
	assert( dest, sformat( eStr, TextFieldStyle.HINT_KEY ) )
	StyleClass.copyMissingProperties( dest, src )

	-- copy properties to Text substyle 'display'
	StyleClass = Widgets.Style.Text
	dest = src[ TextFieldStyle.DISPLAY_KEY ]
	assert( dest, sformat( eStr, TextFieldStyle.DISPLAY_KEY ) )
	StyleClass.copyMissingProperties( dest, src )

	return src
end


--====================================================================--
--== Public Methods


--======================================================--
-- Access to sub-styles

--== Background

function TextFieldStyle.__getters:background()
	-- print( 'TextFieldStyle.__getters:background', self._background )
	return self._background
end
function TextFieldStyle.__setters:background( data )
	-- print( 'TextFieldStyle.__setters:background', data )
	assert( data==nil or type( data )=='table' )
	--==--
	local StyleClass = Widgets.Style.Background
	local inherit = self._inherit and self._inherit._background

	self._background = StyleClass:createStyleFrom{
		name=TextFieldStyle.BACKGROUND_NAME,
		inherit=inherit,
		parent=self,
		data=data
	}
end

--== Hint

function TextFieldStyle.__getters:hint()
	-- print( "TextFieldStyle.__getters:hint", data )
	return self._hint
end
function TextFieldStyle.__setters:hint( data )
	-- print( "TextFieldStyle.__setters:hint", data )
	assert( data==nil or type( data )=='table' )
	--==--
	local StyleClass = Widgets.Style.Text
	local inherit = self._inherit and self._inherit._hint

	self._hint = StyleClass:createStyleFrom{
		name=TextFieldStyle.HINT_NAME,
		inherit=inherit,
		parent=self,
		data=data
	}
end

--== Display

function TextFieldStyle.__getters:display()
	return self._display
end
function TextFieldStyle.__setters:display( data )
	-- print( 'TextFieldStyle.__setters:display', data )
	assert( data==nil or type( data )=='table' )
	--==--
	local StyleClass = Widgets.Style.Text
	local inherit = self._inherit and self._inherit._display

	self._display = StyleClass:createStyleFrom{
		name=TextFieldStyle.DISPLAY_NAME,
		inherit=inherit,
		parent=self,
		data=data
	}
end


--======================================================--
-- Access to style properties

--== align

function TextFieldStyle.__getters:align()
	-- print( "TextFieldStyle.__getters:align" )
	local value = self._align
	if value==nil and self._inherit then
		value = self._inherit.align
	end
	return value
end
function TextFieldStyle.__setters:align( value )
	-- print( "TextFieldStyle.__setters:align", value )
	assert( (value==nil and self._inherit) or type(value)=='string' )
	--==--
	if value == self._align then return end
	self._align = value
end

--== backgroundStyle

function TextFieldStyle.__getters:backgroundStyle()
	-- print( "TextFieldStyle.__getters:backgroundStyle" )
	local value = self._bgStyle
	if value==nil and self._inherit then
		value = self._inherit.backgroundStyle
	end
	return value
end
function TextFieldStyle.__setters:backgroundStyle( value )
	-- print( "TextFieldStyle.__setters:backgroundStyle", value )
	assert( (value==nil and self._inherit) or type(value)=='string' )
	--==--
	if value == self._bgStyle then return end
	self._bgStyle = value
end

--== inputType

function TextFieldStyle.__getters:inputType()
	-- print( "TextFieldStyle.__getters:inputType" )
	local value = self._inputType
	if value==nil and self._inherit then
		value = self._inherit.inputType
	end
	return value
end
function TextFieldStyle.__setters:inputType( value )
	-- print( "TextFieldStyle.__setters:inputType", value )
	assert( (value==nil and self._inherit) or type(value)=='string' )
	--==--
	if value == self._inputType then return end
	self._inputType = value
end

--== isHitActive

function TextFieldStyle.__getters:isHitActive()
	-- print( "TextFieldStyle.__getters:isHitActive" )
	local value = self._isHitActive
	if value==nil and self._inherit then
		value = self._inherit.isHitActive
	end
	return value
end
function TextFieldStyle.__setters:isHitActive( value )
	-- print( "TextFieldStyle.__setters:isHitActive", value )
	assert( type(value)=='boolean' or (value==nil and self._inherit) )
	--==--
	if value == self._isHitActive then return end
	self._isHitActive = value
	self:_dispatchChangeEvent( 'isHitActive', value )
end

--== isHitTestable

function TextFieldStyle.__getters:isHitTestable()
	-- print( "TextFieldStyle.__getters:isHitTestable" )
	local value = self._isHitTestable
	if value==nil and self._inherit then
		value = self._inherit.isHitTestable
	end
	return value
end
function TextFieldStyle.__setters:isHitTestable( value )
	-- print( "TextFieldStyle.__setters:isHitTestable", value )
	assert( type(value)=='boolean' or (value==nil and self._inherit) )
	--==--
	if value==self._isHitTestable then return end
	self._isHitTestable = value
	self:_dispatchChangeEvent( 'isHitTestable', value )
end

--== isSecure

function TextFieldStyle.__getters:isSecure()
	-- print( "TextFieldStyle.__getters:isSecure" )
	local value = self._isSecure
	if value==nil and self._inherit then
		value = self._inherit.isSecure
	end
	return value
end
function TextFieldStyle.__setters:isSecure( value )
	-- print( "TextFieldStyle.__setters:isSecure", value )
	assert( type(value)=='boolean' or (value==nil and self._inherit) )
	--==--
	if value==self._isSecure then return end
	self._isSecure = value
	self:_dispatchChangeEvent( 'isSecure', value )
end

--== marginX

function TextFieldStyle.__getters:marginX()
	-- print( "TextFieldStyle.__getters:marginX" )
	local value = self._marginX
	if value==nil and self._inherit then
		value = self._inherit.marginX
	end
	return value
end
function TextFieldStyle.__setters:marginX( value )
	-- print( "TextFieldStyle.__setters:marginX", value )
	assert( (type(value)=='number' and value>=0) or (value==nil and self._inherit) )
	--==--
	if value == self._marginX then return end
	self._marginX = value
	self:_dispatchChangeEvent( 'marginX', value )
end

--== marginY

function TextFieldStyle.__getters:marginY()
	-- print( "TextFieldStyle.__getters:marginY" )
	local value = self._marginY
	if value==nil and self._inherit then
		value = self._inherit.marginY
	end
	return value
end
function TextFieldStyle.__setters:marginY( value )
	-- print( "TextFieldStyle.__setters:marginY", value )
	assert( (type(value)=='number' and value>=0) or (value==nil and self._inherit) )
	--==--
	if value == self._marginY then return end
	self._marginY = value
	self:_dispatchChangeEvent( 'marginY', value )
end

--== returnKey

function TextFieldStyle.__getters:returnKey()
	-- print( "TextFieldStyle.__getters:returnKey" )
	local value = self._returnKey
	if value==nil and self._inherit then
		value = self._inherit.returnKey
	end
	return value
end
function TextFieldStyle.__setters:returnKey( value )
	-- print( "TextFieldStyle.__setters:returnKey", value )
	assert( (value==nil and self._inherit) or type(value)=='string' )
	--==--
	if value == self._inputType then return end
	self._returnKey = value
end


--======================================================--
-- Proxy Methods





--======================================================--
-- Misc

--== inherit

function TextFieldStyle.__setters:inherit( value )
	-- print( "TextFieldStyle.__setters:inherit", value )
	BaseStyle.__setters.inherit( self, value )
	--==--
	if self._background then
		self._background.inherit = value and value.background or value
	end
	if self._hint then
		self._hint.inherit = value and value.hint or value
	end
	if self._display then
		self._display.inherit = value and value.display or value
	end
end


--== updateStyle

-- force is used when making exact copy of data
--
function TextFieldStyle:updateStyle( info, params )
	-- print( "TextFieldStyle:updateStyle" )
	params = params or {}
	if params.force==nil then params.force=true end
	--==--
	local force=params.force

	if info.debugOn~=nil or force then self.debugOn=info.debugOn end

	if info.width or force then self.width=info.width end
	if info.height or force then self.height=info.height end

	if info.align or force then self.align=info.align end
	if info.anchorX or force then self.anchorX=info.anchorX end
	if info.anchorY or force then self.anchorY=info.anchorY end
	if info.backgroundStyle or force then self.backgroundStyle=info.backgroundStyle end
	if info.inputType or force then self.inputType=info.inputType end
	if info.isHitActive or force then self.isHitActive=info.isHitActive end
	if info.isHitTestable or force then self.isHitTestable=info.isHitTestable end
	if info.isSecure or force then self.isSecure=info.isSecure end
	if info.marginX or force then self.marginX=info.marginX end
	if info.marginY or force then self.marginY=info.marginY end
	if info.returnKey or force then self.returnKey=info.returnKey end

	-- --== Text-level
	-- if info.displayColor or force then self.display.textColor=info.displayColor end
	-- if info.displayFont or force then self.display.font=info.displayFont end
	-- if info.displayFontSize or force then self.display.fontSize=info.displayFontSize end
	-- --== Hint-level
	-- if info.hintColor or force then self.hint.textColor=info.hintColor end
	-- if info.hintFont or force then self.hint.font=info.hintFont end
	-- if info.hintFontSize or force then self.hint.fontSize=info.hintFontSize end

	-- --== Background-level
	-- if info.marginX or force then self.background.marginX=info.marginX end
	-- if info.marginY or force then self.background.marginY=info.marginY end

end



--====================================================================--
--== Private Methods


function TextFieldStyle:_prepareData( data )
	-- print("TextFieldStyle:_prepareData", data )
	if not data then return end
	return TextFieldStyle.pushMissingProperties( data )
end

function TextFieldStyle:_checkChildren()
	-- print( "TextFieldStyle:_checkChildren" )

	-- using setters !!!
	if self._background==nil then self.background=nil end
	if self._hint==nil then self.hint=nil end
	if self._display==nil then self.display=nil end
end

function TextFieldStyle:_checkProperties()
	-- print( "TextFieldStyle:_checkProperties" )
	local emsg = "Style: requires property '%s'"
	local is_valid = BaseStyle._checkProperties( self )

	-- TODO: add more tests

	if not self.width then print(sformat(emsg,'width')) ; is_valid=false end
	if not self.height then print(sformat(emsg,'height')) ; is_valid=false end

	if not self.align then print(sformat(emsg,'align')) ; is_valid=false end
	if not self.anchorX then print(sformat(emsg,'anchorX')) ; is_valid=false end
	if not self.anchorY then print(sformat(emsg,'anchorY')) ; is_valid=false end
	if not self.backgroundStyle then print(sformat(emsg,'backgroundStyle')) ; is_valid=false end
	if not self.inputType then print(sformat(emsg,'inputType')) ; is_valid=false end
	if self.isHitActive==nil then print(sformat(emsg,'isHitActive')) ; is_valid=false end
	if self.isHitTestable==nil then print(sformat(emsg,'isHitTestable')) ; is_valid=false end
	if self.isSecure==nil then print(sformat(emsg,'isSecure')) ; is_valid=false end
	if not self.marginX then print(sformat(emsg,'marginX')) ; is_valid=false end
	if not self.marginY then print(sformat(emsg,'marginY')) ; is_valid=false end
	if not self.returnKey then print(sformat(emsg,'returnKey')) ; is_valid=false end

	-- check sub-styles

	local StyleClass

	StyleClass = self._background.class
	-- if not StyleClass._checkProperties( self._background ) then is_valid=false end

	StyleClass = self._hint.class
	-- if not StyleClass._checkProperties( self._hint ) then is_valid=false end

	StyleClass = self._display.class
	-- if not StyleClass._checkProperties( self._display ) then is_valid=false end

	return is_valid
end



--====================================================================--
--== Event Handlers


-- none




return TextFieldStyle
