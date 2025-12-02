SMODS.Joker{ --Goober Joker
    key = "gooberjoker",
    config = {
        extra = {
            hand_change = 1,
            discard_change = 1,
            odds = 3,
            shatter = 0,
            y = 0,
            gooberDecay = 0,
            gooberBuy = 0,
            gooberSell = 0
        }
    },
    loc_txt = {
        ['name'] = 'Goober Joker',
        ['text'] = {
            [1] = '{X:blue,C:white}+1{} {C:blue}Hand {}and {X:red,C:white}+1{} {C:red}Discard{}',
            [2] = '{C:hearts}Hearts{} and {C:spades}Spades{}',
            [3] = 'count as the same suit,',
            [4] = '{C:diamonds}Diamonds{} and {C:clubs}Clubs{}',
            [5] = 'count as the same suit.',
            [6] = '{C:green}#6# in 3{} chance this is',
            [7] = 'destroyed at end of boss round.',
            [8] = '{s:0.7}\"Result of playing God.\"'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_lexmod_gooberjoker') 
        return {vars = {card.ability.extra.gooberBuy, card.ability.extra.gooberDecay, card.ability.extra.gooberSell, card.ability.extra.shatter, card.ability.extra.y, card.ability.extra.hand_change, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2ee71b2a', 1, card.ability.extra.odds, 'j_lexmod_gooberjoker', false) then
              play_sound("lexmod_gooberDecay")
                        SMODS.calculate_effect({func = function()
                card:shatter()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Spoiled Goober!", colour = G.C.RED})
          end
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_gooberBuy")
        end
        if context.selling_self  and not context.blueprint then
                play_sound("lexmod_gooberSell")
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine suits effect enabled
        -- Combine suits effect enabled
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine suits effect disabled
        -- Combine suits effect disabled
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
    end
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if next(SMODS.find_card("j_lexmod_gooberjoker")) then
            -- If checking for Spades and card is Hearts, return true
            if suit == "Spades" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Hearts and card is Spades, return true
            if suit == "Hearts" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Clubs and card is Diamonds, return true
            if suit == "Clubs" and self.base.suit == "Diamonds" then
                ret = true
            end
            -- If checking for Diamonds and card is Clubs, return true
            if suit == "Diamonds" and self.base.suit == "Clubs" then
                ret = true
            end
        end
    end
    return ret
end