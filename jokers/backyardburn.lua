SMODS.Joker{ --Backyard Burn
    key = "backyardburn",
    config = {
        extra = {
            backyardBurn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Backyard Burn',
        ['text'] = {
            [1] = 'Allows selection of an',
            [2] = '{E:1}additional{} {C:attention}card{} to {C:red}discard{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_backyardBurn")
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(-1)
    end
}