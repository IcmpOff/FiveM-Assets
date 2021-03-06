QBCoreBoatshop = QBCoreBoatshop or {}
QBCoreDiving = QBCoreDiving or {}

QBCoreBoatshop.PoliceBoat = {
    x = -800.67, 
    y = -1494.54, 
    z = 1.59,
}

QBCoreBoatshop.PoliceBoatSpawn = {
    x = -793.58, 
    y = -1501.4, 
    z = 0.12,
    h = 111.5,
}

QBCoreBoatshop.PoliceBoat2 = {
    x = -279.41, 
    y = 6635.09, 
    z = 7.51,
}

QBCoreBoatshop.PoliceBoatSpawn2 = {
    x = -293.10, 
    y = 6642.69, 
    z = 0.15,
    h = 65.5,
}

QBCoreBoatshop.Docks = {
    ["paletto"] = {
        label = "Main Boat House",
        coords = {
            take = {
                x = -776.677, 
                y = -1503.948, 
                z = 1.59, 
            },
            put = {
                x = -827.21, 
                y = -1525.28, 
                z = 1.0, 
                h = 130.0,
            }
        }
    },    
    ["millars"] = {
        label = "Pauls Boat House",
        coords = {
            take = {
                x = -277.46, 
                y = 6637.2, 
                z = 7.48,
            },
            put = {
                x = -289.2, 
                y = 6637.96, 
                z = 1.01,
                h = 45.5,
            }
        }
    },
}
QBCoreBoatshop.Depots = {
    [1] = {
        label = "Boat Depot",
        coords = {
            take = {
                x = -772.98, 
                y = -1430.76, 
                z = 1.59, 
            },
            put = {
                x = -827.21, 
                y = -1525.28, 
                z = 1.0, 
                h = 130.0,
            }
        }
    },
}

QBCoreBoatshop.Locations = {
    ["berths"] = {
        [1] = {
            ["boatModel"] = "dinghy",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -727.05,
                    ["y"] = -1326.59,
                    ["z"] = 1.06,
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -723.3,
                    ["y"] = -1323.61,
                    ["z"] = 0.64,
                }
            },
            ["inUse"] = false
        },
        [2] = {
            ["boatModel"] = "speeder",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -732.84, 
                    ["y"] = -1333.5, 
                    ["z"] = 1.59, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -729.19, 
                    ["y"] = -1330.58, 
                    ["z"] = 0.64, 
                },
            },
            ["inUse"] = false
        },
        [3] = {
            ["boatModel"] = "dinghy",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -737.84, 
                    ["y"] = -1340.83, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -734.98, 
                    ["y"] = -1337.42, 
                    ["z"] = 0.60, 
                },
            },
            ["inUse"] = false
        },
        [4] = {
            ["boatModel"] = "dinghy",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -743.53, 
                    ["y"] = -1347.7, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -741.0, 
                    ["y"] = -1344.28, 
                    ["z"] = .64, 
                },
            },
            ["inUse"] = false
        },
        [5] = {
            ["boatModel"] = "dinghy",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -749.59, 
                    ["y"] = -1354.88, 
                    ["z"] = 0.79, 
                    ["h"] = 229.5
                },
                ["buy"] = {
                    ["x"] = -746.6, 
                    ["y"] = -1351.36, 
                    ["z"] = 0.64, 
                },
            },
            ["inUse"] = false
        },
        [6] = {
            ["boatModel"] = "tug",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -738.09, 
                    ["y"] = -1373.46, 
                    ["z"] = 0.79, 
                    ["h"] = 116.8
                },
                ["buy"] = {
                    ["x"] = -726.55,
                    ["y"] = -1375.66,
                    ["z"] = 1.59,
                },
            },
            ["inUse"] = false
        },
        [7] = {
            ["boatModel"] = "yacht2",
            ["coords"] = {
                ["boat"] = {
                    ["x"] = -806.95, 
                    ["y"] = -1425.37, 
                    ["z"] = 0.47, 
                    ["h"] = 224.8
                },
                ["buy"] = {
                    ["x"] = -800.48,
                    ["y"] = -1417.732,
                    ["z"] = 1.59,
                },
            },
            ["inUse"] = false
        },
    }
}

QBCoreBoatshop.ShopBoats = {
    ["dinghy"] = {
        ["model"] = "dinghy",
        ["label"] = "Dinghy",
        ["price"] = 6000
    },
    ["speeder"] = {
        ["model"] = "speeder",
        ["label"] = "Speeder",
        ["price"] = 20000
    },
    ["tug"] = {
        ["model"] = "tug",
        ["label"] = "tug",
        ["price"] = 130000
    },
    ["yacht2"] = {
        ["model"] = "yacht2",
        ["label"] = "yacht2",
        ["price"] = 2000000
    }
}

QBCoreBoatshop.SpawnVehicle = {
    x = -777.01, 
    y = -1413.49, 
    z = 1.0, 
    h = 131.5,
}

QBCoreDiving.Locations = {
    [1] = {
        label = "This is location 1",
        coords = {
            Area = {
                x = -2838.8, 
                y = -376.1, 
                z = 3.55
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -2849.25, 
                        y = -377.58, 
                        z = -40.23
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -2838.43, 
                        y = -363.63, 
                        z = -39.45
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -2887.04, 
                        y = -394.87, 
                        z = -40.91
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = -2808.99, 
                        y = -385.56, 
                        z = -39.32
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [2] = {
        label = "This is location 2",
        coords = {
            Area = {
                x = -3288.2, 
                y = -67.58,
                z = 2.79,
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -3275.03, 
                        y = -38.58, 
                        z = -19.21,
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -3273.73, 
                        y = -76.0, 
                        z = -26.81,
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -3346.53, 
                        y = -50.4, 
                        z = -35.84
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [3] = {
        label = "This is location 3",
        coords = {
            Area = {
                x = -3367.24, 
                y = 1617.89, 
                z = 1.39,
            },
            Coral = {
                [1] = {
                    coords = {
                        x = -3388.01, 
                        y = 1635.88, 
                        z = -39.41,
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = -3354.19, 
                        y = 1549.3, 
                        z = -38.21,
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = -3326.04, 
                        y = 1636.43, 
                        z = -40.98
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [4] = {
        label = "This is location 4",
        coords = {
            Area = {
                x = 3002.5, 
                y = -1538.28, 
                z = -27.36, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 2978.05, 
                        y = -1509.07, 
                        z = -24.96, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 3004.42, 
                        y = -1576.95, 
                        z = -29.36, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 2951.65, 
                        y = -1560.69, 
                        z = -28.36, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 3,
        TotalCoral = 3,
    },
    [5] = {
        label = "This is location 5",
        coords = {
            Area = {
                x = 3421.58, 
                y = 1975.68, 
                z = 0.86, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 3421.69, 
                        y = 1976.54, 
                        z = -50.64, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 3424.07, 
                        y = 1957.46, 
                        z = -53.04, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 3434.65, 
                        y = 1993.73, 
                        z = -49.84, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 3415.42, 
                        y = 1965.25, 
                        z = -52.04,
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [6] = {
        label = "This is location 6",
        coords = {
            Area = {
                x = 2720.14, 
                y = -2136.28, 
                z = 0.74, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 2724.0, 
                        y = -2134.95, 
                        z = -19.33, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 2710.68, 
                        y = -2156.06, 
                        z = -18.63, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 2702.84, 
                        y = -2139.29, 
                        z = -18.51, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 2736.27, 
                        y = -2153.91, 
                        z = -20.88, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
    [7] = {
        label = "This is location 7",
        coords = {
            Area = {
                x = 536.69, 
                y = 7253.75, 
                z = 1.69, 
            },
            Coral = {
                [1] = {
                    coords = {
                        x = 542.31, 
                        y = 7245.37, 
                        z = -30.01, 
                    },
                    PickedUp = false
                },
                [2] = {
                    coords = {
                        x = 528.21, 
                        y = 7223.26, 
                        z = -29.51, 
                    },
                    PickedUp = false
                },
                [3] = {
                    coords = {
                        x = 510.36, 
                        y = 7254.97, 
                        z = -32.11, 
                    },
                    PickedUp = false
                },
                [4] = {
                    coords = {
                        x = 525.37, 
                        y = 7259.12, 
                        z = -30.51, 
                    },
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 4,
        TotalCoral = 4,
    },
}

QBCoreDiving.CoralTypes = {
    [1] = {
        item = "dendrogyra_coral",
        maxAmount = math.random(2, 7),
        price = math.random(1200, 1300),
    },
    [2] = {
        item = "antipatharia_coral",
        maxAmount = math.random(2, 7),
        price = math.random(1300, 1450),
    }
}

QBCoreDiving.SellLocations = {
    [1] = {
        ["coords"] = {
            ["x"] = -1686.9, 
            ["y"] = -1072.23, 
            ["z"] = 13.15
        }
    }
}