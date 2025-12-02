SMODS.Joker{ --Tokagashi
    key = "tokagashi",
    config = {
        extra = {
            kingsindeck = 0,
            tokagashiMeep = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tokagashi',
        ['text'] = {
            [1] = 'When round begins, add a buffed {C:attention}King {}',
            [2] = 'to your deck if you have at least {C:money}$5{} for every',
            [3] = '{C:attention}King{} currently in your deck {C:inactive}(Currently:{} {C:money}$#2#{}{C:inactive}){}',
            [4] = '{s:0.7}\"I am gonna buy this.\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.tokagashiMeep, ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()) * 5}}
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn  and not context.blueprint then
            if G.GAME.dollars >= to_big(((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.base.id == 13 then count = count + 1 end end; return count end)()) * 5) then
                local card_front = pseudorandom_element({G.P_CARDS.S_K, G.P_CARDS.H_K, G.P_CARDS.D_K, G.P_CARDS.C_K}, pseudoseed('add_card_suit'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_seal(pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed('add_card_seal')), true)
            new_card:set_edition(pseudorandom_element({"e_foil", "e_holo", "e_polychrome", "e_negative"}, pseudoseed('add_card_edition')), true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                play_sound("lexmod_tokagashiMeep")
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Collected!"
                }
            end
        end
    end
}