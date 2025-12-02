SMODS.Seal {
    key = 'greyseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 4,
            negativeJokerTotal = 0
        }
    },
    badge_colour = HEX('737373'),
   loc_txt = {
        name = 'Grey Seal',
        label = 'Grey Seal',
        text = {
        [1] = '{C:green}#1# in #2#{} chance to create a',
        [2] = '{C:dark_edition}Negative{} Joker when discarded',
        [3] = 'Card is {C:hearts}Cursed{} after creating a Joker',
        [4] = '{C:inactive}'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'lexmod_greyseal')
        return {vars = {numerator, denominator}}
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if SMODS.pseudorandom_probability(card, 'group_0_1fc96d90', 1, card.ability.seal.extra.odds, 'm_lexmod_greyseal') then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                            
                        end
                        
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                SMODS.calculate_effect({func = function()
                context.other_card:set_ability(G.P_CENTERS.m_lexmod_cursed)
                context.other_card:set_seal(nil)
                    end}, card)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cursed!", colour = G.C.BLUE})
            end
        end
    end
}