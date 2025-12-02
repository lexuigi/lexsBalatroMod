SMODS.Joker{ --Redborg
    key = "redborg",
    config = {
        extra = {
            suitHidden = 1,
            redborgSpray = 0,
            redborgShake = 0
        }
    },
    loc_txt = {
        ['name'] = 'Redborg',
        ['text'] = {
            [1] = 'Hands that contain {C:attention}Flushes{}',
            [2] = 'are turned into {C:attention}#4#s{}',
            [3] = '{C:inactive}(Suit changes at end of round){}',
            [4] = '{s:0.7}\"I\'ll paint you a bird!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 3
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

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.suitHidden, card.ability.extra.redborgShake, card.ability.extra.redborgSpray, localize((G.GAME.current_round.currentSuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.currentSuit_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.currentSuit_card = { suit = 'Spades' }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.suitHidden = pseudorandom('suitHidden_5366c9ee', 1, 4)
                    return true
                end
                }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.suitHidden = pseudorandom('suitHidden_2d6706d6', 1, 4)
                    return true
                end
                }
        end
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (next(context.poker_hands["Flush"]) and (card.ability.extra.suitHidden or 0) == 1 and not (context.other_card:is_suit("Spades"))) then
                assert(SMODS.change_base(context.other_card, "Spades", nil))
                play_sound("lexmod_redborgSpray")
                return {
                    message = "Card Modified!"
                }
            elseif (next(context.poker_hands["Flush"]) and (card.ability.extra.suitHidden or 0) == 2 and not (context.other_card:is_suit("Hearts"))) then
                assert(SMODS.change_base(context.other_card, "Hearts", nil))
                play_sound("lexmod_redborgSpray")
                return {
                    message = "Card Modified!"
                }
            elseif (next(context.poker_hands["Flush"]) and (card.ability.extra.suitHidden or 0) == 3 and not (context.other_card:is_suit("Diamonds"))) then
                assert(SMODS.change_base(context.other_card, "Diamonds", nil))
                play_sound("lexmod_redborgSpray")
                return {
                    message = "Card Modified!"
                }
            elseif (next(context.poker_hands["Flush"]) and (card.ability.extra.suitHidden or 0) == 4 and not (context.other_card:is_suit("Clubs"))) then
                assert(SMODS.change_base(context.other_card, "Clubs", nil))
                play_sound("lexmod_redborgSpray")
                return {
                    message = "Card Modified!"
                }
            end
        end
        if context.ending_shop  and not context.blueprint then
            if (card.ability.extra.suitHidden or 0) == 1 then
                G.GAME.current_round.currentSuit_card.suit = 'Spades'
                play_sound("lexmod_redborgShake")
            elseif (card.ability.extra.suitHidden or 0) == 2 then
                G.GAME.current_round.currentSuit_card.suit = 'Hearts'
                play_sound("lexmod_redborgShake")
            elseif (card.ability.extra.suitHidden or 0) == 3 then
                G.GAME.current_round.currentSuit_card.suit = 'Diamonds'
                play_sound("lexmod_redborgShake")
            elseif (card.ability.extra.suitHidden or 0) == 4 then
                G.GAME.current_round.currentSuit_card.suit = 'Clubs'
                play_sound("lexmod_redborgShake")
            end
        end
    end
}