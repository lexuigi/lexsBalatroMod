SMODS.Joker{ --Old Man
    key = "oldman",
    config = {
        extra = {
            cashAmount = 0,
            cardCycle = 0,
            scale = 0.5,
            rotation = 0.5,
            onetime = 0,
            oldManClick = 0
        }
    },
    loc_txt = {
        ['name'] = 'Old Man',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} at the end of the round',
            [2] = 'For every {C:attention}2{} times cards are added to',
            [3] = 'your deck increase this by {C:money}$1{}',
            [4] = '{C:inactive}(Currently: $#1#){}',
            [5] = '{C:inactive}(Cards left before upgrade: #2#/2){}',
            [6] = '{s:0.7}\"I\'m old!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.cashAmount, card.ability.extra.cardCycle}}
    end,

    calculate = function(self, card, context)
        if context.playing_card_added  and not context.blueprint then
            if (card.ability.extra.cardCycle or 0) < 1 then
                local target_card = context.other_card
                play_sound("lexmod_oldManClick")
                return {
                    func = function()
                    card.ability.extra.cardCycle = (card.ability.extra.cardCycle) + 1
                    return true
                end,
                    extra = {
                        func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end,
                        colour = G.C.WHITE
                        }
                }
            elseif (card.ability.extra.cardCycle or 0) >= 1 then
                play_sound("lexmod_oldManClick")
                return {
                    func = function()
                    card.ability.extra.cardCycle = 0
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.cashAmount = (card.ability.extra.cashAmount) + 1
                    return true
                end,
                            message = "Upgraded!",
                        colour = G.C.GREEN
                        }
                }
            end
        end
        if context.starting_shop  then
            if (card.ability.extra.cashAmount or 0) > 0 then
                play_sound("lexmod_oldManClick")
                return {
                    dollars = card.ability.extra.cashAmount
                }
            end
        end
    end
}