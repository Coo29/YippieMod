--Sound Junk

SMODS.Sound ({
key = 'yippie',
path = 'yippie.ogg',
volume = 1.3,
pitch = 1.0,
})

SMODS.Sound:register_global()

--Atlas Junk

SMODS.Atlas {
	key = "Coo29",
	path = "JokerSheet.png",
	px = 71,
	py = 95
}

SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
})
--Atlas Junk End

--Actual Joker Junk

SMODS.Joker {
    key = 'yippie',

    loc_txt = {
        name = 'Yippie Joker',
        text = {

            "{C:mult}+#1# {} Mult"

        }
    },

    config = {extra = { mult = 15} },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult} }
    end,

    rarity = 1,
    atlas = 'Coo29',
    pos = { x = 0, y = 0 },
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    allow_duplicates = true,


    calculate = function(self, card, context)
        if context.joker_main then
            play_sound("Coo29_yippie")
            return {
                mult_mod = card.ability.extra.mult,
            -- message  = localize {type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult} }
            message = 'Yippie!'
            }
        end
    end
}
--Actual Joker Junk End