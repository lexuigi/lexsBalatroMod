SMODS.Joker{ --Penny Saved
    key = "pennysaved",
    config = {
        extra = {
            shopRerolled = 0,
            shopsIgnoredConsecutively = 0
        }
    },
    loc_txt = {
        ['name'] = 'Penny Saved',
        ['text'] = {
            [1] = 'At the end of the shop, earn {C:money}$#2#{}',
            [2] = 'Increases by {C:money}$4{} for every consecutive',
            [3] = '{C:attention}shop{} ended without {C:attention}rerolling{}.',
            [4] = '{C:inactive}(Resets when a shop is rerolled){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 2
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
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.shopRerolled, card.ability.extra.shopsIgnoredConsecutively}}
    end,

    calculate = function(self, card, context)
        if context.reroll_shop  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.shopsIgnoredConsecutively = 0
                    return true
                end,
                    message = "Penny Spent!",
                    extra = {
                        func = function()
                    card.ability.extra.shopRerolled = 1
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.ending_shop  then
            if (card.ability.extra.shopRerolled or 0) == 0 then
                local shopsIgnoredConsecutively_value = card.ability.extra.shopsIgnoredConsecutively
                return {
                    dollars = shopsIgnoredConsecutively_value,
                    message = "Penny Earned!",
                    extra = {
                        func = function()
                    card.ability.extra.shopsIgnoredConsecutively = (card.ability.extra.shopsIgnoredConsecutively) + 4
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.shopRerolled = 0
                    return true
                end
                }
            end
        end
    end
}