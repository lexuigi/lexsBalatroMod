SMODS.Joker{ --Mart
    key = "mart",
    config = {
        extra = {
            trainPower = 0,
            trainPower5 = 5,
            trainPowerLow5 = -5,
            martHorn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mart',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult when hand',
            [2] = 'contains a straight',
            [3] = 'Total Mult increases by {C:red}5{}',
            [4] = 'per played {C:attention}Straight{}',
            [5] = '{s:0.7}\"Put it to ya this way...\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.trainPower}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                card.ability.extra.trainPower = (card.ability.extra.trainPower) + 5
                play_sound("lexmod_martHorn")
                return {
                    mult = card.ability.extra.trainPower
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_martHorn")
        end
    end
}