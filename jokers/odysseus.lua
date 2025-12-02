SMODS.Joker{ --Odysseus
    key = "odysseus",
    config = {
        extra = {
            lostMen = 1,
            odyStrike = 0
        }
    },
    loc_txt = {
        ['name'] = 'Odysseus',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X0.25{} Mult every time',
            [2] = '{C:attention}playing cards{} are destroyed',
            [3] = '{C:inactive}(Currently: {X:mult,C:white}X#1#{} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.lostMen}}
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
                play_sound("lexmod_odyStrike")
                return {
                    func = function()
                    card.ability.extra.lostMen = (card.ability.extra.lostMen) + 0.25
                    return true
                end,
                    message = "Upgraded..."
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.lostMen
                }
        end
    end
}