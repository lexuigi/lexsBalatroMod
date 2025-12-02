SMODS.Joker{ --Temptation
    key = "temptation",
    config = {
        extra = {
            hand_change = 1,
            apple = 0
        }
    },
    loc_txt = {
        ['name'] = 'Temptation',
        ['text'] = {
            [1] = '{C:attention}+3{} Hand Size',
            [2] = 'Only {C:blue}1 Hand{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 4
    },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_apple")
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_hands = G.GAME.round_resets.hands
        G.GAME.round_resets.hands = card.ability.extra.hand_change
        G.hand:change_size(3)
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_hands then
            G.GAME.round_resets.hands = card.ability.extra.original_hands
        end
        G.hand:change_size(-3)
    end
}