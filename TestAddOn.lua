local tadn_player_hp = UnitHealth("player")
local tadn_player_level = UnitLevel("player")
local tadn_player_name = UnitName("player")

local function greeting(name, level, health)
	if not health then health = 0 end
	level = level or 1 --another way of saying the same thing as a line above
	if not name then name = "Untitled" end

	print("Hey, " .. name)
end

local function count_number_of_elements(...)
	print("Number of elements passed to the function: " .. #{...})
end

local function print_character_info(char_table)
	print("Name: " .. char_table["name"])
	print("Level: " .. char_table.level)
	print("Health: " .. char_table.health)
	print("Class: " .. char_table["class"])
	print("Size of the table (4 indexed elements in a table):" .. #char_table)
end

local tadn_tbl = {1,2,3,4,5,6,7,8,9,10} --first element is at location 1 instead of 0
tadn_tbl["key_of_element"] = 15

--creating a table of values
local character_table = {
1,2,3,4, --just random values for one of the examples
	["name"] = UnitName("player"),
	health = UnitHealth("player"),
	["class"] = UnitClass("player"),
	level = UnitLevel("player")
}

--creating a stack "class" based on table
local stack_class = {
	1,2,3,4,5,

	push = function(self, arg)
		local n = #self
		self[n+1] = arg
	end,

	pop = function(self)
		local n = #self
		if(n > 0) then
			local rtn = self[n]
			self[n] = nil
			return rtn
		end
	end,
}

--using functions of a class
stack_class.push(stack_class, 10)--need to pass it itself as one of the arguments is 'self' ONLY IF USING . accessor
print(stack_class[3])
print(stack_class:pop(6))--if : accessor is used it generates the 'self' argument by itself

--use functions
greeting(tadn_player_name, tadn_player_level, tadn_player_hp)
count_number_of_elements(1,2,3,4,5,6,7,"asd", "twentyfive",{1,"name"})
print_character_info(character_table)


--loop
local endValue = 10
print("Counting loop:")
for i = 1, endValue, 1 do --when i is GREATER than endValue it BREAKS
	print(i)
end

print("Character table loop: ")
for key, value in pairs(character_table) do --can put ipairs instead of pairs to print only indexed part of table
	print(key .. " : " .. value)
end
