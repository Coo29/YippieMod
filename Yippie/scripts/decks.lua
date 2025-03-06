SMODS.Back{ --test deck 1
    name = "testdeck",
    key = "testdeck",
    pos = {x = 0, y = 4},
    atlas = 'Decks',
    atlas_key = 'testdeck',
        pos = {
        x = 0,
        y = 0,
        },
    config = {
        hands = 0,
        discards = -1,
        consumables = {'c_wraith'},
    },

    loc_txt = {
        name = "Test Deck",
        text = {
            "{C:red}#1#{} discards",
            "Start with a {C:spectral}Wraith{} card"
        }
    },
    loc_vars = function(self)
        return { vars = { 
            self.config.discards,
            self.config.hands,
            self.config.consumables
        }}
    end,

}