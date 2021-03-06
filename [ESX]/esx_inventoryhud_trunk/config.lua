
Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = 170

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Weight = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1000

--[[Config.localWeight = {
	wrench = 5000,
	potbrownie = 3000,
	lure = 3000,
	alive_pig = 5000,
	cheesepizza = 5000,
	meatpizza = 5000,
	advancedlockpick = 5000, 
	airbag = 3000,
	aluminum = 1000, 
	ammoanalyzer = 5000, 
	apple = 2000, 
	arAmmo = 5000,
	bait = 0, 
	banana = 2000, 
	bandage = 4000, 
	bankidcard = 0, 
	battery = 6000, 
	beer = 2000, 
	binoculars = 5000, 
	blankkey = 1000, 
	bloodsample = 1000,
	blueprint_knucks = 3000, 
	blueprint_microsmg = 3000, 
	blueprint_paper = 3000, 
	blueprint_pistol = 3000, 
	blueprint_pistolammo = 3000, 
	blueprint_rifleammo = 3000, 
	blueprint_shotgun = 3000, 
	blueprint_shotgunammo = 3000, 
	blueprint_smg = 3000, 
	blueprint_smgammo = 3000, 
	blueprint_snspistol = 3000, 
	blueprint_switchblade = 3000,
	bong = 5000, 
	bread = 1000, 
	bulletsample = 1000, 
	burger = 7000, 
	burrito = 3000, 
	c4_bank = 10000,
	champagne = 2000, 
	chips = 3000, 
	chocolate = 3000, 
	cigarett = 1000, 
	cigarette = 1000, 
	clip = 5000, 
	clothe = 2000, 
	cocacola = 1000, 
	coffe = 3000,
	beans = 2000,
	coke10g = 4000, 
	coke1g = 2000, 
	cokebrick = 7000,
	wax = 3000, 
	copper = 2000, 
	crack = 3000, 
	croquettes = 5000, 
	cuffs = 3000, 
	cuff_keys = 1000, 
	cupcake = 2000, 
	packaged_wood = 2000,
	ground_wood = 1000,
	deermeat = 5000, 
	diamond = 2000, 
	diamondring = 3000, 
	digiscanner = 1000, 
	dnaanalyzer = 5000, 
	donut = 1000, 
	drillbit = 1000,
	drugbags = 0, 
	electronics = 3000, 
	emptycannister = 5000, 
	firstaid = 5000, 
	firstaidkit = 5000, 
	fishingpermit = 0, 
	fishingrod = 5000, 
	fixkit = 5000, 
	flashlight = 2000, 
	fries = 2000, 
	fruitbasket = 5000, 
	fruitsmoothie = 5000, 
	GADGET_PARACHUTE = 10000, 
	gauze = 3000, 
	gintonic = 2000, 
	gold = 3000, 
	goldbar = 5000, 
	goldwatch = 0, 
	grip = 5000, 
	hamburger = 4000, 
	handcuffs = 3000, 
	HeavyArmor = 5000,
	heroine = 3000,
	highgradefemaleseed = 2000, 
	highgradefert = 5000, 
	highgrademaleseed = 2000, 
	highradio = 4000, 
	highrim = 7000, 
	hqscale = 5000, 
	hydrocodone = 2000, 
	idcard = 0,
	iron = 3000, 
	iron_ore = 1000, 
	jammer = 3000, 
	joint2g = 2000, 
	laptop = 10000, 
	licenseplate = 3000, 
	lighter = 1000,
	lobster = 3000, 
	lockpick = 4000, 
	lowgradefemaleseed = 2000, 
	lowgradefert = 5000, 
	lowgrademaleseed = 2000, 
	lowradio = 4000, 
	meat = 3000, 
	medikit = 5000, 
	medkit = 5000, 
	meth10g = 4000, 
	meth1g = 2000, 
	methbrick = 7000, 
	mgAmmo = 5000, 
	milk = 3000, 
	molly = 3000, 
	morphine = 5000, 
	nitrocannister = 10000, 
	nokiaphone = 3000, 
	notepad = 1000, 
	orange = 2000, 
	pAmmo = 5000, 
	pear = 2000, 
	phone = 0, 
	pickaxe = 5000, 
	pildora = 2000, 
	plantpot = 5000, 
	plastic = 1000, 
	plasticpouch = 1000, 
	poolreceipt = 1000, 
	pruningshears = 2000, 
	purifiedwater = 3000, 
	quesadilla = 3000, 
	rabbitmeat = 1000, 
	radio = 0, 
	raspa = 1000, 
	rasperry = 5000, 
	redgull = 3000, 
	roach = 2000, 
	rolex = 2000, 
	rolpaper = 1000, 
	rubbies = 2000, 
	salmon = 3000, 
	sandwich = 2000, 
	screen = 2000, 
	screwdriver = 2000, 
	sealed_tech_doc = 6000, 
	sgAmmo = 6000, 
	shark = 1000, 
	silver = 2000, 
	slaughtered_chicken = 3000, 
	alive_chicken = 5000,
	chicken = 5000,
	packaged_chicken = 3000,
	smallkey = 1000, 
	stockrim = 6000, 
	stone = 2000, 
	strawberry = 1000, 
	suppressor = 6000, 
	taco = 3000, 
	tech_doc_knuckles = 3000, 
	tech_doc_microsmg = 3000, 
	tech_doc_pistol = 3000, 
	tech_doc_pistolammo = 3000, 
	tech_doc_rifleammo = 3000, 
	tech_doc_shotgun = 3000, 
	tech_doc_shotgunammo = 3000, 
	tech_doc_rifle = 3000, 
	tech_doc_smgammo = 3000, 
	tech_doc_snspistol = 3000, 
	tech_doc_machinepistol = 3000,
	tech_doc_carbine_mk2 = 3000,
	tequila = 2000, 
	torta = 3000, 
	tostada = 3000, 
	trimmedweed = 1000, 
	uncut_diamond = 2000, 
	uncut_rubbies = 2000, 
	viagra = 2000, 
	vicodin = 2000, 
	vodka = 2000, 
	washed_stone = 2000,
	washpan = 3000, 
	water = 1000, 
	wateringcan = 5000, 
	WEAPON_ADVANCEDRIFLE = 10000, 
	WEAPON_APPISTOL = 6000, 
	WEAPON_ASSAULTRIFLE = 10000, 
	WEAPON_BAT = 4000, 
	WEAPON_BULLPUPSHOTGUN = 8000, 
	WEAPON_CARBINERIFLE = 12000,
	WEAPON_CARBINERIFLE_MK2 = 12000,
	WEAPON_COMBATPDW = 8000, 
	WEAPON_COMBATPISTOL = 6000, 
	WEAPON_COMPACTRIFLE = 8000, 
	WEAPON_DBSHOTGUN = 8000,
	WEAPON_FLASHLIGHT = 3000, 
	WEAPON_GUSENBERG = 10000, 
	WEAPON_HAMMER = 1000, 
	WEAPON_HEAVYPISTOL = 7000, 
	WEAPON_KNIFE = 2000, 
	WEAPON_KNUCKLE = 2000, 
	WEAPON_MICROSMG = 8000, 
	WEAPON_MINISMG = 8000, 
	WEAPON_NIGHTSTICK = 3000, 
	WEAPON_PETROLCAN = 10000, 
	WEAPON_PISTOL = 5000,
	WEAPON_PISTOL_MK2 = 5000, 
	WEAPON_PISTOL50 = 8000, 
	WEAPON_PUMPSHOTGUN = 7000, 
	WEAPON_SAWNOFFSHOTGUN = 7000, 
	WEAPON_SMOKEGRENADE = 2000, 
	WEAPON_SNSPISTOL = 6000, 
	WEAPON_STUNGUN = 5000, 
	WEAPON_SWITCHBLADE = 2000, 
	WEAPON_VINTAGEPISTOL = 6000, 
	weed20g = 4000, 
	weed4g = 2000, 
	weedbrick = 7000, 
	whisky = 2000, 
	wine = 2000, 
	wood = 1000, 
	xanax = 2000, 
	yusuf = 3000, 
	Zinc = 2000,
}]]

Config.VehicleWeight = {
    [0] = 7500, --Compact
    [1] = 8500, --Sedan
    [2] = 20000, --SUV
    [3] = 6500, --Coupes
    [4] = 7000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 7000, --Sports
    [7] = 5500, --Super
    [8] = 4000, --Motorcycles
    [9] = 25000, --Off-road
    [10] = 40000, --Industrial
    [11] = 25000, --Utility
    [12] = 35000, --Vans
    [13] = 0, --Cycles
    [14] = 40000, --Boats
    [15] = 40000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 50000, --Military
    [20] = 55000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LEO",
    ambulance = "EMS",
    mecano = "MECH"
}

Config.localWeight = {
	greengrapes = 100,
	greengrapejuice = 300,
	pinotnoir = 100,
	pinotnoirjuice = 300,
	redgrapes = 100,
	redgrapejuice = 300,
	redwinebottle = 200,
	whitewinebottle = 200,
	blancdenoirsbottle = 200,
	corndog = 300,
	wrench = 500,
	potbrownie = 300,
	lure = 300,
	alive_pig = 500,
	cheesepizza = 500,
	meatpizza = 500,
	advancedlockpick = 500, 
	airbag = 300,
	aluminum = 100, 
	ammoanalyzer = 500, 
	apple = 200, 
	arAmmo = 500,
	bait = 0, 
	banana = 200, 
	bandage = 400, 
	bankidcard = 0, 
	battery = 600, 
	beer = 200, 
	binoculars = 500, 
	blankkey = 100, 
	bloodsample = 100,
	blueprint_knucks = 300, 
	blueprint_microsmg = 300, 
	blueprint_paper = 300, 
	blueprint_pistol = 300, 
	blueprint_pistolammo = 300, 
	blueprint_rifleammo = 300, 
	blueprint_shotgun = 300, 
	blueprint_shotgunammo = 300, 
	blueprint_smg = 300, 
	blueprint_smgammo = 300, 
	blueprint_snspistol = 300, 
	blueprint_switchblade = 300,
	bong = 500, 
	bread = 100, 
	bulletsample = 100, 
	burger = 500, 
	burrito = 300, 
	c4_bank = 1000,
	champagne = 200, 
	chips = 300, 
	chocolate = 300, 
	cigarett = 100, 
	cigarette = 100, 
	clip = 500, 
	clothe = 200, 
	cocacola = 100, 
	coffe = 300,
	beans = 200,
	coke10g = 400, 
	coke1g = 200, 
	cokebrick = 700,
	wax = 300, 
	copper = 200, 
	crack = 300, 
	croquettes = 500, 
	cuffs = 300, 
	cuff_keys = 100, 
	cupcake = 200, 
	packaged_wood = 200,
	ground_wood = 100,
	deermeat = 500, 
	diamond = 200, 
	diamondring = 300, 
	digiscanner = 100, 
	dnaanalyzer = 500, 
	donut = 100, 
	drillbit = 100,
	drugbags = 0, 
	electronics = 300, 
	emptycannister = 500, 
	firstaid = 500, 
	firstaidkit = 500, 
	fishingpermit = 0, 
	fishingrod = 500, 
	fixkit = 500, 
	flashlight = 200, 
	fries = 200, 
	fruitbasket = 500, 
	fruitsmoothie = 500, 
	GADGET_PARACHUTE = 1000, 
	gauze = 300, 
	gintonic = 200, 
	gold = 300, 
	goldbar = 500, 
	goldwatch = 0, 
	grip = 500, 
	hamburger = 400, 
	handcuffs = 300, 
	HeavyArmor = 500,
	heroine = 300,
	highgradefemaleseed = 200, 
	highgradefert = 500, 
	highgrademaleseed = 200, 
	highradio = 400, 
	highrim = 700,
	hotdog = 200,
	chilihotdog = 500,
	sonoranhotdog = 500,
	hqscale = 500, 
	hydrocodone = 200, 
	idcard = 0,
	iron = 300, 
	iron_ore = 100, 
	jammer = 300, 
	joint2g = 200, 
	laptop = 1000, 
	licenseplate = 300, 
	lighter = 100,
	lobster = 300, 
	lockpick = 400, 
	lowgradefemaleseed = 200, 
	lowgradefert = 500, 
	lowgrademaleseed = 200, 
	lowradio = 400, 
	meat = 300, 
	medikit = 500, 
	medkit = 500, 
	meth10g = 400, 
	meth1g = 200, 
	methbrick = 700, 
	mgAmmo = 500, 
	milk = 300, 
	molly = 300, 
	morphine = 500, 
	nitrocannister = 1000, 
	nokiaphone = 300, 
	notepad = 100, 
	orange = 200, 
	pAmmo = 500, 
	pear = 200, 
	phone = 0, 
	pickaxe = 500, 
	pildora = 200, 
	plantpot = 500, 
	plastic = 100, 
	plasticpouch = 100, 
	poolreceipt = 100, 
	pruningshears = 200, 
	purifiedwater = 300, 
	quesadilla = 300, 
	rabbitmeat = 100, 
	radio = 0, 
	raspa = 100, 
	rasperry = 500, 
	redgull = 300, 
	roach = 200, 
	rolex = 200, 
	rolpaper = 100, 
	rubbies = 200, 
	salmon = 300, 
	sandwich = 200, 
	screen = 200, 
	screwdriver = 200, 
	sealed_tech_doc = 600, 
	sgAmmo = 600, 
	shark = 100, 
	silver = 200, 
	slaughtered_chicken = 300, 
	alive_chicken = 500,
	chicken = 500,
	packaged_chicken = 300,
	smallkey = 100, 
	stockrim = 600, 
	stone = 200, 
	strawberry = 100, 
	suppressor = 600, 
	taco = 300, 
	tech_doc_knuckles = 300, 
	tech_doc_microsmg = 300, 
	tech_doc_pistol = 300, 
	tech_doc_pistolammo = 300, 
	tech_doc_rifleammo = 300, 
	tech_doc_shotgun = 300, 
	tech_doc_shotgunammo = 300, 
	tech_doc_rifle = 300, 
	tech_doc_smgammo = 300, 
	tech_doc_snspistol = 300, 
	tech_doc_machinepistol = 300,
	tech_doc_carbine_mk2 = 300,
	tequila = 200, 
	torta = 300, 
	tostada = 300, 
	trimmedweed = 100, 
	uncut_diamond = 200, 
	uncut_rubbies = 200, 
	viagra = 200, 
	vicodin = 200, 
	vodka = 200, 
	washed_stone = 200,
	washpan = 300, 
	water = 100, 
	wateringcan = 500, 
	WEAPON_ADVANCEDRIFLE = 1000, 
	WEAPON_APPISTOL = 600, 
	WEAPON_ASSAULTRIFLE = 1000, 
	WEAPON_BAT = 400, 
	WEAPON_BULLPUPSHOTGUN = 800, 
	WEAPON_CARBINERIFLE = 1200,
	WEAPON_CARBINERIFLE_MK2 = 1200,
	WEAPON_COMBATPDW = 800, 
	WEAPON_COMBATPISTOL = 600, 
	WEAPON_COMPACTRIFLE = 800, 
	WEAPON_DBSHOTGUN = 800,
	WEAPON_FLASHLIGHT = 300, 
	WEAPON_GUSENBERG = 1000, 
	WEAPON_HAMMER = 100, 
	WEAPON_HEAVYPISTOL = 700, 
	WEAPON_KNIFE = 200, 
	WEAPON_KNUCKLE = 200, 
	WEAPON_MICROSMG = 800, 
	WEAPON_MINISMG = 800, 
	WEAPON_NIGHTSTICK = 300, 
	WEAPON_PETROLCAN = 1000, 
	WEAPON_PISTOL = 500,
	WEAPON_PISTOL_MK2 = 500, 
	WEAPON_PISTOL50 = 800, 
	WEAPON_PUMPSHOTGUN = 700, 
	WEAPON_SAWNOFFSHOTGUN = 700, 
	WEAPON_SMOKEGRENADE = 200, 
	WEAPON_SNSPISTOL = 600, 
	WEAPON_STUNGUN = 500, 
	WEAPON_SWITCHBLADE = 200, 
	WEAPON_VINTAGEPISTOL = 600, 
	weed20g = 400, 
	weed4g = 200, 
	weedbrick = 700, 
	whisky = 200, 
	wine = 200, 
	wood = 100, 
	xanax = 200, 
	yusuf = 300, 
	Zinc = 200,
}