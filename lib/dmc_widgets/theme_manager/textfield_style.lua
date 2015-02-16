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

local BaseStyle = require( widget_find( 'theme_manager.base_style' ) )



--====================================================================--
--== Setup, Constants


local newClass = Objects.newClass
local ObjectBase = Objects.ObjectBase

local Widgets = nil -- set later



--====================================================================--
--== TextField Style Class
--====================================================================--


local TextFieldStyle = newClass( BaseStyle, {name="TextField Style"} )

--== Class Constants

TextFieldStyle.__base_style__ = nil

-- child styles
TextFieldStyle.BACKGROUND = 'textfield-background'
TextFieldStyle.HINT = 'textfield-hint'
TextFieldStyle.TEXT = 'textfield-text'


TextFieldStyle.DEFAULT = {
	name='textfield-default-style',

	width=200,
	height=40,

	align='center',
	anchorX=0.5,
	anchorY=0.5,
	debugOn=false,
	backgroundStyle='none',
	inputType='password',
	marginX=0,
	marginY=5,
	returnKey='done',

	background={
		--[[
		from TextField
		* width
		* height
		* anchorX/Y
		--]]
		fillColor={0.5,0.5,0.2,1},
		isHitTestable=true,
		strokeWidth=2,
		strokeColor={0,0,0,0},
	},
	hint={
		--[[
		from TextField
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
	text={
		--[[
		from TextField
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
--== Start: Setup DMC Objects

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

	-- these are ones which we save locally, others are
	-- stored in component styles
	--
	self._width = nil
	self._height = nil

	self._align = nil
	self._anchorX = nil
	self._anchorY = nil
	self._bgStyle = nil
	self._inputType = nil
	self._marginX = nil
	self._marginY = nil
	self._text_textColor = nil
	self._hint_textColor = nil
	self._returnKey = nil

	--== Object Refs ==--

	-- these are other style objects
	self._background = nil
	self._hint = nil
	self._text = nil

end

--== END: Setup DMC Objects
--======================================================--



--====================================================================--
--== Static Methods


function TextFieldStyle.initialize( manager )
	-- print( "TextFieldStyle.initialize", manager )
	Widgets = manager

	TextFieldStyle._setDefaults()
end



function TextFieldStyle:_checkChildren()
	-- print( "TextFieldStyle:_checkChildren" )
	-- using setters !!!
	if self._background==nil then self.background=nil end
	if self._hint==nil then self.hint=nil end
	if self._text==nil then self.text=nil end
end



--====================================================================--
--== Public Methods


--== inherit

-- Style Class
--
function TextFieldStyle.__setters:inherit( value )
	-- print( "TextFieldStyle.__setters:inherit", value )
	assert( value:isa(TextFieldStyle) )
	--==--
	self._inherit = value

	self._background.inherit = value.background
	self._hint.inherit = value.hint
	self._text.inherit = value.text
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



--== other styles

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
		name=TextFieldStyle.BACKGROUND,
		data=data,
		inherit=inherit,
		parent=self
	}
end


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
		name=TextFieldStyle.HINT,
		inherit=inherit,
		data=data,
		parent=self
	}
end


function TextFieldStyle.__getters:text()
	return self._text
end
function TextFieldStyle.__setters:text( data )
	-- print( 'TextFieldStyle.__setters:text', data )
	assert( data==nil or type( data )=='table' )
	--==--
	local StyleClass = Widgets.Style.Text
	local inherit = self._inherit and self._inherit._text

	self._text = StyleClass:createStyleFrom{
		name=TextFieldStyle.TEXT,
		data=data,
		inherit=inherit,
		parent=self
	}
end



--== updateStyle

-- force is used when making exact copy of data
--
function TextFieldStyle:updateStyle( params )
	-- print( "TextFieldStyle:updateStyle" )

	if info.debugOn~=nil or force then self.debugOn=info.debugOn end

	--== Widget-level
	if params.width then self.width=params.width end
	if params.height then self.height=params.height end

	if params.align then self.align=params.align end
	if params.anchorX then self.anchorX=params.anchorX end
	if params.anchorY then self.anchorY=params.anchorY end
	if params.backgroundStyle then self.backgroundStyle=params.backgroundStyle end
	if params.inputType then self.inputType=params.inputType end
	if params.marginX then self.marginX=params.marginX end
	if params.marginY then self.marginY=params.marginY end
	if params.returnKey then self.returnKey=params.returnKey end

	--== Text-level
	if params.textColor then self.text.color=params.textColor end
	if params.textFont then self.text.font=params.textFont end
	if params.textFontSize then self.text.fontSize=params.textFontSize end
	--== Hint-level
	if params.hintColor then self.hint.color=params.hintColor end
	if params.hintFont then self.hint.font=params.hintFont end
	if params.hintFontSize then self.hint.fontSize=params.hintFontSize end

	--== Background-level
	if params.marginX then self.background.marginX=params.marginX end
	if params.marginY then self.background.marginY=params.marginY end

end



--====================================================================--
--== Private Methods


function TextFieldStyle._setDefaults()
	-- print( "TextFieldStyle._setDefaults" )
	local defaults = TextFieldStyle.DEFAULT

	--== copy over property values to sub-styles
	-- this is a little hack, but inline with how the system works
	-- just done manually for startup
	local tmp
	-- background
	tmp = defaults.background
	tmp.width=defaults.width
	tmp.height=defaults.height
	tmp.anchorX=defaults.anchorX
	tmp.anchorY=defaults.anchorY

	-- hint
	tmp = defaults.hint
	tmp.width=defaults.width
	tmp.height=defaults.height
	tmp.align=defaults.align
	tmp.anchorX=defaults.anchorX
	tmp.anchorY=defaults.anchorY
	tmp.marginX=defaults.marginX
	tmp.marginY=defaults.marginY

	-- text
	tmp = defaults.text
	tmp.width=defaults.width
	tmp.height=defaults.height
	tmp.align=defaults.align
	tmp.anchorX=defaults.anchorX
	tmp.anchorY=defaults.anchorY
	tmp.marginX=defaults.marginX
	tmp.marginY=defaults.marginY


	local style = TextFieldStyle:new{
		data=defaults
	}
	TextFieldStyle.__base_style__ = style

end



function TextFieldStyle:_checkProperties()
	-- print( "TextFieldStyle:_checkProperties" )
	BaseStyle._checkProperties( self )

	-- TODO: add more tests

	assert( self.width, "Style: requires 'width'" )
	assert( self.height, "Style: requires 'height'" )

	assert( self.align, "Style: requires 'align'" )
	assert( self.anchorY, "Style: requires 'anchory'" )
	assert( self.anchorX, "Style: requires 'anchorX'" )
	assert( self.backgroundStyle, "Style: requires 'backgroundStyle'" )
	assert( self.inputType, "Style: requires 'inputType'" )
	assert( self.marginX, "Style: requires 'marginX'" )
	assert( self.marginY, "Style: requires 'marginY'" )
	assert( self.returnKey, "Style: requires 'returnKey'" )

	assert( self._background.strokeWidth, "Style: requires 'background.strokeWidth'" )
	assert( self._background.fillColor, "Style: requires 'background.fillColor'" )
	assert( self._background.strokeColor, "Style: requires 'background.strokeColor'" )

	assert( self.hint.font, "Style: requires 'hint.font'" )
	assert( self.hint.fontSize, "Style: requires 'hint.fontSize'" )
	assert( self.hint.textColor, "Style: requires 'hint.textColor'" )

	assert( self.text.font, "Style: requires 'text.font'" )
	assert( self.text.fontSize, "Style: requires 'text.fontSize'" )
	assert( self.text.textColor, "Style: requires 'text.textColor'" )

end



--====================================================================--
--== Event Handlers


-- none




return TextFieldStyle
