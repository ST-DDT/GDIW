data:extend(
{
  {
    type = "recipe",
    name = "advanced-oil-processing-GDIW",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="crude-oil", amount=10},
      {type="fluid", name="water", amount=5}
    },
    results=
    {
      {type="fluid", name="heavy-oil", amount=1},
      {type="fluid", name="light-oil", amount=4.5},
      {type="fluid", name="petroleum-gas", amount=5.5}
    },
    icon = "__GDIW__/graphics/advanced-oil-processing-GDIW.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-c[advanced-oil-processing-GDIW]"
  },

  {
    type = "recipe",
    name = "heavy-oil-cracking-GDIW",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=4},
      {type="fluid", name="water", amount=3}
    },
    results=
    {
      {type="fluid", name="light-oil", amount=3}
    },
    main_product= "",
    icon = "__GDIW__/graphics/heavy-oil-cracking-GDIW.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-b[heavy-oil-cracking-GDIW]"
  },

  {
    type = "recipe",
    name = "light-oil-cracking-GDIW",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="light-oil", amount=3},
      {type="fluid", name="water", amount=3}
    },
    results=
    {
      {type="fluid", name="petroleum-gas", amount=2}
    },
    main_product= "",
    icon = "__GDIW__/graphics/light-oil-cracking-GDIW.png",
    subgroup = "fluid-recipes",
    order = "b[fluid-chemistry]-c[light-oil-cracking-GDIW]"
  },

  {
    type = "recipe",
    name = "sulfur-GDIW",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=3},
      {type="fluid", name="water", amount=3}
    },
    results=
    {
      {type="item", name="sulfur", amount=2}
    }
  },

  {
    type = "recipe",
    name = "flame-thrower-ammo-GDIW",
    category = "chemistry",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type="item", name="iron-plate", amount=5},
      {type="fluid", name="heavy-oil", amount=2.5},
      {type="fluid", name="light-oil", amount=2.5}
    },
    result = "flame-thrower-ammo"
  }
})

for km, vm in pairs(data.raw.module) do
  if vm.name:find("productivity%-module") and vm.limitation then
    for _, recipe in ipairs({"advanced-oil-processing-GDIW","heavy-oil-cracking-GDIW","light-oil-cracking-GDIW","sulfur-GDIW"}) do
      table.insert(vm.limitation, recipe)
    end
  end
end

table.insert(data.raw["technology"]["advanced-oil-processing"].effects,{type="unlock-recipe",recipe="advanced-oil-processing-GDIW"})
table.insert(data.raw["technology"]["advanced-oil-processing"].effects,{type="unlock-recipe",recipe="heavy-oil-cracking-GDIW"})
table.insert(data.raw["technology"]["advanced-oil-processing"].effects,{type="unlock-recipe",recipe="light-oil-cracking-GDIW"})
table.insert(data.raw["technology"]["sulfur-processing"].effects,{type="unlock-recipe",recipe="sulfur-GDIW"})
table.insert(data.raw["technology"]["flame-thrower"].effects,{type="unlock-recipe",recipe="flame-thrower-ammo-GDIW"})
