SMODS.Joker{ --20 Sided Die
    key = "twentysideddie",
    config = {
        extra = {
            selectedXMult = 1,
            rerolledOnce = 0,
            dieRoll = 0
        }
    },
    loc_txt = {
        ['name'] = '20 Sided Die',
        ['text'] = {
            [1] = 'Each played {C:attention}#5#{} of {C:attention}#4#{} gives',
            [2] = '{X:red,C:white}X#1#{} Mult when scored',
            [3] = '{C:attention}Rank{}{C:inactive},{} {C:attention}Suite{}{C:inactive}, and{} {X:red,C:white}XMult{} {C:inactive}are randomized{}',
            [4] = '{C:inactive}when this card is bought or when{}',
            [5] = '{C:inactive}first hand is played after obtained{}',
            [6] = '{C:inactive}Rerolls when round ends if placed on the{}',
            [7] = '{C:inactive}far right of your Joker collection{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
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
        
        return {vars = {card.ability.extra.selectedXMult, card.ability.extra.rerolledOnce, card.ability.extra.dieRoll, localize((G.GAME.current_round.selectedSuite_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.selectedRank_card or {}).rank or 'Ace', 'ranks')}, colours = {G.C.SUITS[(G.GAME.current_round.selectedSuite_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.selectedSuite_card = { suit = 'Spades' }
        G.GAME.current_round.selectedRank_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                local selectedXMult_value = card.ability.extra.selectedXMult
                if G.playing_cards then
                    local valid_selectedSuite_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_selectedSuite_cards[#valid_selectedSuite_cards + 1] = v
                        end
                    end
                    if valid_selectedSuite_cards[1] then
                        local selectedSuite_card = pseudorandom_element(valid_selectedSuite_cards, pseudoseed('selectedSuite' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.selectedSuite_card.suit = selectedSuite_card.base.suit
                    end
                end
                if G.playing_cards then
                        local valid_selectedRank_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_selectedRank_cards[#valid_selectedRank_cards + 1] = v
                            end
                        end
                        if valid_selectedRank_cards[1] then
                            local selectedRank_card = pseudorandom_element(valid_selectedRank_cards, pseudoseed('selectedRank' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.selectedRank_card.rank = selectedRank_card.base.value
                            G.GAME.current_round.selectedRank_card.id = selectedRank_card.base.id
                        end
                    end
                play_sound("lexmod_dieRoll")
    SMODS.calculate_effect({message = "Rerolled!"}, card)
                return {
                    func = function()
                    card.ability.extra.selectedXMult = pseudorandom('selectedXMult_e3942f7e', 100, 300)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.rerolledOnce = 1
                    return true
                end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                    card.ability.extra.selectedXMult = (card.ability.extra.selectedXMult) / 100
                    return true
                end,
                            colour = G.C.MULT
                        }
                        }
                }
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == G.GAME.current_round.selectedRank_card.id and context.other_card:is_suit(G.GAME.current_round.selectedSuite_card.suit)) then
                return {
                    Xmult = card.ability.extra.selectedXMult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if (function()
        return G.jokers.cards[#G.jokers.cards] == card
    end)() then
                local selectedXMult_value = card.ability.extra.selectedXMult
                if G.playing_cards then
                    local valid_selectedSuite_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_selectedSuite_cards[#valid_selectedSuite_cards + 1] = v
                        end
                    end
                    if valid_selectedSuite_cards[1] then
                        local selectedSuite_card = pseudorandom_element(valid_selectedSuite_cards, pseudoseed('selectedSuite' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.selectedSuite_card.suit = selectedSuite_card.base.suit
                    end
                end
                if G.playing_cards then
                        local valid_selectedRank_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_selectedRank_cards[#valid_selectedRank_cards + 1] = v
                            end
                        end
                        if valid_selectedRank_cards[1] then
                            local selectedRank_card = pseudorandom_element(valid_selectedRank_cards, pseudoseed('selectedRank' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.selectedRank_card.rank = selectedRank_card.base.value
                            G.GAME.current_round.selectedRank_card.id = selectedRank_card.base.id
                        end
                    end
                play_sound("lexmod_dieRoll")
    SMODS.calculate_effect({message = "Rerolled!"}, card)
                return {
                    func = function()
                    card.ability.extra.selectedXMult = pseudorandom('selectedXMult_4bb21db5', 100, 300)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.selectedXMult = (card.ability.extra.selectedXMult) / 100
                    return true
                end,
                        colour = G.C.MULT
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (card.ability.extra.rerolledOnce or 0) == 0 then
                local selectedXMult_value = card.ability.extra.selectedXMult
                card.ability.extra.selectedXMult = pseudorandom('selectedXMult_513414da', 100, 300)
                card.ability.extra.rerolledOnce = 1
                if G.playing_cards then
                    local valid_selectedSuite_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_selectedSuite_cards[#valid_selectedSuite_cards + 1] = v
                        end
                    end
                    if valid_selectedSuite_cards[1] then
                        local selectedSuite_card = pseudorandom_element(valid_selectedSuite_cards, pseudoseed('selectedSuite' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.selectedSuite_card.suit = selectedSuite_card.base.suit
                    end
                end
                if G.playing_cards then
                        local valid_selectedRank_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_selectedRank_cards[#valid_selectedRank_cards + 1] = v
                            end
                        end
                        if valid_selectedRank_cards[1] then
                            local selectedRank_card = pseudorandom_element(valid_selectedRank_cards, pseudoseed('selectedRank' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.selectedRank_card.rank = selectedRank_card.base.value
                            G.GAME.current_round.selectedRank_card.id = selectedRank_card.base.id
                        end
                    end
                card.ability.extra.selectedXMult = (card.ability.extra.selectedXMult) / 100
                play_sound("lexmod_dieRoll")
    SMODS.calculate_effect({message = "Rerolled!"}, card)
            end
        end
    end
}