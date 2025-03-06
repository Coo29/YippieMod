assert(SMODS.load_file('scripts/jokers.lua'))()
--assert(SMODS.load_file('scripts/decks.lua'))()

--Sound Junk

SMODS.Sound { -- used to import the sound effect
key = 'yippie',
path = 'yippie.ogg',
volume = 1.3,
pitch = 1.0,
}

SMODS.Sound:register_global() -- used to import the sound effect

-- Sound junk end

--Atlas Junk start

SMODS.Atlas { -- atlas for the joker texture.
       
    key = "Coo29",  -- key it uses to call the correct sheet later on.
      
    path = "JokerSheet.png",  -- name of the file the joker textures are located in.

    -- size of the individual joker textures in the file. (71x95 is default)
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "Decks",
    path = "decks.png",
    px = 71,
    py = 95
}

SMODS.Atlas { -- icon for the modpack as shown in the mods menu.
    key = "modicon", -- this text needs to be modicon afaik.
   path = "modicon.png", -- file name should also be modicon.png.
   px = 32,
   py = 32
}

SMODS.Atlas { -- atlas for the joker texture.
       
key = "possom",  -- key it uses to call the correct sheet later on.
  
path = "possom.png",  -- name of the file the joker textures are located in.

-- size of the individual joker textures in the file. (71x95 is default)
px = 71,
py = 95
}
--Atlas Junk End
