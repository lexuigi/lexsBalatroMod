SMODS.Joker{ --Hex
    key = "hex",
    config = {
        extra = {
            hexAmount = 10,
            hexDrain = 0,
            hexCoin = 0,
            shatter = 0,
            hexRun = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hex',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} when entering shop',
            [2] = 'Reduces by {C:money}$1{} per {C:tarot}tarot{} or',
            [3] = '{C:spectral}spectral{} card used',
            [4] = '{s:0.7}\"I cannot stand all that magic...\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.hexAmount}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable  and not context.blueprint then
            if ((card.ability.extra.hexAmount or 0) > 0 and context.consumeable and context.consumeable.ability.set == 'Tarot' or context.consumeable and context.consumeable.ability.set == 'Spectral') then
                play_sound("lexmod_hexDrain")
                return {
                    func = function()
                    card.ability.extra.hexAmount = math.max(0, (card.ability.extra.hexAmount) - 1)
                    return true
                end,
                    message = "Anti-Magic!"
                }
            end
        end
        if context.starting_shop  then
            if (card.ability.extra.hexAmount or 0) > 0 then
                play_sound("lexmod_hexCoin")
                return {
                    dollars = card.ability.extra.hexAmount
                }
            elseif (card.ability.extra.hexAmount or 0) == 0 then
                play_sound("lexmod_hexRun")
                return {
                    func = function()
                card:shatter()
                return true
            end
                }
            end
        end
    end
}