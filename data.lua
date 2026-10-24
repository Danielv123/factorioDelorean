-- The delorean is the base game car with its own sprites and stats, so it keeps up with the car's sounds, triggers
-- and new fields between Factorio versions.

local stripes = {}
for i = 0, 15 do
	stripes[#stripes + 1] = {
		filename = "__delorean__/graphics/hr_delorean_" .. i .. ".png",
		width_in_frames = 4,
		height_in_frames = 4,
	}
end

local item = table.deepcopy(data.raw["item-with-entity-data"]["car"])
item.name = "delorean"
item.icon = "__delorean__/graphics/icon_frame169.png"
item.icon_size = 256
item.order = "b[personal-transport]-a[car]-b[delorean]"
item.place_result = "delorean"

local car = table.deepcopy(data.raw["car"]["car"])
car.name = "delorean"
car.icon = "__delorean__/graphics/icon_frame169.png"
car.icon_size = 256
car.flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"}
car.minable = {mining_time = 1, result = "delorean"}
car.max_health = 1000
car.resistances = {
	{type = "fire", percent = 50},
	{type = "impact", percent = 80, decrease = 50},
}
car.collision_box = {{-0.7, -1}, {0.7, 1}}
car.selection_box = {{-0.9, -1.2}, {0.9, 1.2}}
car.effectivity = 0.8
car.braking_force = (700 * 1000) / 60
car.energy_source.effectivity = 0.6
car.energy_source.fuel_inventory_size = 4
car.consumption = "400kW"
car.friction_force = 0.001
car.animation = {
	layers = {
		{
			priority = "low",
			width = 1024,
			height = 1024,
			frame_count = 1,
			scale = 0.25,
			direction_count = 256,
			shift = {0, -0.359375},
			animation_speed = 8,
			max_advance = 0.2,
			stripes = stripes,
		},
	},
}
-- the car's own light, turret, gun and reflection sprites don't fit the delorean
car.light_animation = nil
car.turret_animation = nil
car.water_reflection = nil
car.guns = {}
car.rotation_speed = 0.01
car.weight = 2000

data:extend({
	{
		type = "recipe",
		name = "delorean",
		enabled = true,
		energy_required = 2,
		ingredients = {
			{type = "item", name = "engine-unit", amount = 8},
			{type = "item", name = "iron-plate", amount = 20},
			{type = "item", name = "steel-plate", amount = 5},
		},
		results = {{type = "item", name = "delorean", amount = 1}},
	},
	item,
	car,
})
