SMODS.Consumable {
    key = 'relic',
    set = 'Spectral',
    pos = { x = 6, y = 0 },
    config = { extra = {
        add_cards_count = 1,
        dollars_value = 5,
        odds = 2,
        odds2 = 1,
        dollars_value = 10
    } },
    loc_txt = {
        name = 'Relic',
        text = {
        [1] = 'Gain {C:money}$10{}, {C:money}$20{}, or {C:money}$30{}',
        [2] = '{C:attention}2 to 5{} {C:hearts}Cursed{} cards are',
        [3] = 'added to your hand',
        [4] = '{C:inactive}(If used outside of play, cards',
        [5] = 'will appear in next hand drawn){}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_lexmod_cursed']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_lexmod_cursed']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            play_sound("lexmod_cursedShort")
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." $", colour = G.C.MONEY})
                    ease_dollars(5, true)
                    return true
                end
            }))
            delay(0.6)
            if SMODS.pseudorandom_probability(card, 'group_0_c08c1a5c', 1, card.ability.extra.odds, 'c_lexmod_relic', true) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_lexmod_cursed']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            end
            if SMODS.pseudorandom_probability(card, 'group_1_0692a925', 1, card.ability.extra.odds, 'c_lexmod_relic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_lexmod_cursed']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            end
            if SMODS.pseudorandom_probability(card, 'group_2_55aa5226', 1, card.ability.extra.odds, 'c_lexmod_relic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_lexmod_cursed']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
            end
            if SMODS.pseudorandom_probability(card, 'group_3_952a56f7', 1, card.ability.extra.odds2, 'c_lexmod_relic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.MONEY})
                    ease_dollars(10, true)
                    return true
                end
            }))
            delay(0.6)
            end
            if SMODS.pseudorandom_probability(card, 'group_4_57eeda99', 1, card.ability.extra.odds, 'c_lexmod_relic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.MONEY})
                    ease_dollars(10, true)
                    return true
                end
            }))
            delay(0.6)
            end
            if SMODS.pseudorandom_probability(card, 'group_5_19863a31', 1, card.ability.extra.odds, 'c_lexmod_relic', false) then
                
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(10).." $", colour = G.C.MONEY})
                    ease_dollars(10, true)
                    return true
                end
            }))
            delay(0.6)
            end
    end,
    can_use = function(self, card)
        return true
    end
}