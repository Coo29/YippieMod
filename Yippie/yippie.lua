--Sound Junk

        -- used to import the sound effect.
    SMODS.Sound {
    key = 'yippie',
    path = 'yippie.ogg',
    volume = 1.3,
    pitch = 1.0,
    }

    SMODS.Sound:register_global()

-- Sound junk end


--Atlas Junk start

        -- atlas for the joker texture.
    SMODS.Atlas {
            -- key it uses to call the correct sheet later on.
    	key = "Coo29",
           -- name of the file the joker textures are located in.
    	path = "JokerSheet.png",
           -- size of the individual joker textures in the file. (71x95 is default)
    	px = 71,
    	py = 95
    }
       -- icon for the modpack as shown in the mods menu.
    SMODS.Atlas {
            -- this text needs to be modicon afaik.
        key = "modicon",
           -- file name should also be modicon.png.
       path = "modicon.png",
       px = 32,
       py = 32
    }

--Atlas Junk End

--Actual Joker Junk

        -- the actual joker code.
    SMODS.Joker {
       key = 'yippie',

           -- description of the joker.
        loc_txt = {
            name = 'Yippie Joker',
            text = {
                "{C:mult}+#1#{} Mult, gains",
                "{C:mult}+#2#{} Mult when scored.",
            }
        },

           -- config of the joker. Variables go here.
        config = {
           extra = {
                mult = 0,
                gain = 1
         }
     },
            -- rarity level, 0 = common, 1 = uncommon, 2 = rare, 3 = legendary.
        rarity = 2,

            -- atlas the joker uses for texture(s).
        atlas = 'Coo29',
    
            -- where on the atlas texture the joker is locarted.
        pos = {
            x = 0,
            y = 0
        },
            -- cost of the joker in the shop.
        cost = 2,

            -- whether it is unlocked by default.
        unlocked = true,

            -- whether it is discovered by default.
        discovered = true,

            -- whether blueprint can copy this joker.
        blueprint_compat = true,

            -- whether this joker can have the perishable sticker.
        perishable_compat = true,

            -- whether this joker can have the eternal sticker.
        eternal_compat = true,

            -- whether duplicates of this joker can appear in the shop by default.
        allow_duplicates = true,

            -- loc_vars works with the config and gives you text variables to work with.
            -- these are formatted as #n#, where n is the position in the variable table.
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                        -- #1#
                    card.ability.extra.mult,
                        -- #2#
                    card.ability.extra.gain,
                    }
                }
        end,

            -- calculate is where the scoring and effects of the joker are handled. 
        calculate = function(self, card, context)
                -- context.joker_main takes place when the joker is meant to score.
            if context.joker_main then
                return {
                        -- adds the number contained in the mult variable to the score.
                mult_mod = card.ability.extra.mult,
                        -- message is the text that appears when the joker scores.
                        -- localize is used to make sure the text works across multiple languages.
                    message  = localize {
                        type = 'variable',
                        key = 'a_mult',
                        vars = {
                            card.ability.extra.mult
                        }
                    }
                }
            end
                -- context.after takes place after the hand is scored.
                -- context.blueprint applies if the joker is a blueprint copy.
            if context.after and not context.blueprint then
                            -- adds the gain variable to the base mult number.
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                    return {
                            -- another message, just prints the text.
                        message = "Yippie!",
                        colour = G.C.MULT,
                            -- plays the sound effect yippie.ogg. the prefix is needed.
                        play_sound("Coo29_yippie"),
                            -- needed, can be changed to context.other_card to apply to another card.
                        card = card
                    }
            end
        end
    }

--Actual Joker Junk End