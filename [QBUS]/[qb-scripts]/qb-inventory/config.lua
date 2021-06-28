Config = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Config.VendingObjects = {
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_water_01"
}

Config.BinObjects = {
    "prop_bin_05a",
}

Config.VendingItem = {
    [1] = {
        name = "kurkakola",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}

Config.CraftingItems = {
    [1] = {
        name = "lockpick",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 22,
            ["plastic"] = 32,
        },
        type = "item",
        slot = 1,
        threshold = 0,
        points = 1,
    },
    [2] = {
        name = "screwdriverset",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 30,
            ["plastic"] = 42,
        },
        type = "item",
        slot = 2,
        threshold = 0,
        points = 2,
    },
    [3] = {
        name = "electronickit",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 30,
            ["plastic"] = 45,
            ["aluminum"] = 28,
        },
        type = "item",
        slot = 3,
        threshold = 0,
        points = 3,
    },
    [4] = {
        name = "radioscanner",
        amount = 50,
        info = {},
        costs = {
            ["electronickit"] = 2,
            ["plastic"] = 52,
            ["steel"] = 40,
        },
        type = "item",
        slot = 4,
        threshold = 0,
        points = 4,
    },
    [5] = {
        name = "gatecrack",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 10,
            ["plastic"] = 50,
            ["aluminum"] = 30,
            ["iron"] = 17,
            ["electronickit"] = 1,
        },
        type = "item",
        slot = 5,
        threshold = 120,
        points = 5,
    },
    [6] = {
        name = "handcuffs",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 36,
            ["steel"] = 24,
            ["aluminum"] = 28,
        },
        type = "item",
        slot = 6,
        threshold = 160,
        points = 6,
    },
    [7] = {
        name = "repairkit",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 32,
            ["steel"] = 43,
            ["plastic"] = 61,
        },
        type = "item",
        slot = 7,
        threshold = 200,
        points = 7,
    },
    [8] = {
        name = "pistol_ammo",
        amount = 50,
        info = {},
        costs = {
            ["metalscrap"] = 50,
            ["steel"] = 37,
            ["copper"] = 26,
        },
        type = "item",
        slot = 8,
        threshold = 250,
        points = 8,
    },
    [9] = {
        name = "ironoxide",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 60,
            ["glass"] = 30,
        },
        type = "item",
        slot = 9,
        threshold = 300,
        points = 9,
    },
    [10] = {
        name = "aluminumoxide",
        amount = 50,
        info = {},
        costs = {
            ["aluminum"] = 60,
            ["glass"] = 30,
        },
        type = "item",
        slot = 10,
        threshold = 300,
        points = 10,
    },
    [11] = {
        name = "armor",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 33,
            ["steel"] = 44,
            ["plastic"] = 55,
            ["aluminum"] = 22,
        },
        type = "item",
        slot = 11,
        threshold = 350,
        points = 11,
    },
    [12] = {
        name = "drill",
        amount = 50,
        info = {},
        costs = {
            ["iron"] = 50,
            ["steel"] = 50,
            ["screwdriverset"] = 3,
            ["advancedlockpick"] = 2,
        },
        type = "item",
        slot = 12,
        threshold = 1750,
        points = 12,
    },
	
	[13] = {
		name = "advancedlockpick",
		amount = 50,
		info = {},
		costs = {
			["metalscrap"] = 80,
			["plastic"] = 82,
		},
		type = "item",
		slot = 13,
		threshold = 0,
		points = 0,
	},
}
Config.AttachmentCrafting = {
		['location'] = vector3(955.46, -118.58, 75.09),  
		["items"] = {
		[1] = {
			name = "weapon_appistol",
			amount = 1,
			info = {},
			costs = {
				["copper"] = 300,
				["steel"] = 100,
				["iron"] = 250,
				["rubber"] = 200,
				["metalscrap"] = 200,
			},
			type = "item",
			slot = 1,
			threshold = 0,
			points = 1,
		},
		[2] = {
			name = "pistol_extendedclip",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 140,
				["steel"] = 250,
				["rubber"] = 60,
			},
			type = "item",
			slot = 2,
			threshold = 0,
			points = 0,
		},
		[3] = {
			name = "pistol_suppressor",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 165,
				["steel"] = 285,
				["rubber"] = 75,
			},
			type = "item",
			slot = 3,
			threshold = 0,
			points = 0,
		},
		[4] = {
			name = "rifle_drummag",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 205,
				["steel"] = 340,
				["rubber"] = 110,
				["smg_extendedclip"] = 2,
			},
			type = "item",
			slot = 4,
			threshold = 0,
			points = 0,
		},
		[5] = {
			name = "smg_flashlight",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 230,
				["steel"] = 365,
				["rubber"] = 130,
			},
			type = "item",
			slot = 5,
			threshold = 0,
			points = 0,
		},
		[6] = {
			name = "smg_extendedclip",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 255,
				["steel"] = 390,
				["rubber"] = 145,
			},
			type = "item",
			slot = 6,
			threshold = 0,
			points = 0,
		},
		[7] = {
			name = "smg_suppressor",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 270,
				["steel"] = 435,
				["rubber"] = 155,
			},
			type = "item",
			slot = 7,
			threshold = 0,
			points = 0,
		},
		[8] = {
			name = "smg_scope",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 300,
				["steel"] = 469,
				["rubber"] = 170,
			},
			type = "item",
			slot = 8,
			threshold = 0,
			points = 0,
		},
		[9] = {
			name = "weapon_pistol",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 300,
				["steel"] = 469,
				["rubber"] = 170,
			},
			type = "item",
			slot = 9,
			threshold = 0,
			points = 0,
		},

		[10] = {
			name = "lockpick",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 22,
				["plastic"] = 32,
			},
			type = "item",
			slot = 10,
			threshold = 0,
			points = 0,
		},

		[11] = {
			name = "screwdriverset",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 30,
				["plastic"] = 42,
			},
			type = "item",
			slot = 11,
			threshold = 0,
			points = 0,
		},

		[12] = {
			name = "advancedlockpick",
			amount = 50,
			info = {},
			costs = {
				["metalscrap"] = 80,
				["plastic"] = 82,
			},
			type = "item",
			slot = 12,
			threshold = 0,
			points = 0,
		},		
	}
}

MaxInventorySlots = 41

BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}

Config.MaximumAmmoValues = {
    ["pistol"] = 50,
    ["smg"] = 50,
    ["shotgun"] = 50,
    ["rifle"] = 50,
}