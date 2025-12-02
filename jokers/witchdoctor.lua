SMODS.Joker{ --Witch Doctor
    key = "witchdoctor",
    config = {
        extra = {
            cursedCardTotal = 0,
            enhancedcardsindeck = 0,
            bonuscardsindeck = 0,
            multcardsindeck = 0,
            wildcardsindeck = 0,
            glasscardsindeck = 0,
            steelcardsindeck = 0,
            stonecardsindeck = 0,
            goldcardsindeck = 0,
            luckycardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Witch Doctor',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}X0.75{} Mult',
            [2] = 'per {C:hearts}Non Vanilla{} {C:attention}Playing{}',
            [3] = '{C:attention}card{} {C:enhanced}Enhancement{} in deck',
            [4] = '{C:inactive}(Currently:{} {X:red,C:white}*X#1#{} {C:inactive}Mult){}',
            [5] = '{s:0.7}*Predicted XMult may be inaccurate,{}',
            [6] = '{s:0.7}updates when purchased or hand played.{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
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
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 4
    },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and G.GAME.pool_flags.lexmod_cursedDeck
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.cursedCardTotal}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.cursedCardTotal
                }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
                local cursedCardTotal_value = card.ability.extra.cursedCardTotal
                return {
                    func = function()
                    card.ability.extra.cursedCardTotal = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_bonus') then count = count + 1 end end; return count end)())
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_mult') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_glass') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_gold') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_lucky') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) * 0.75
                    return true
                end,
                            colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) + 1
                    return true
                end,
                            colour = G.C.GREEN
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                }
        end
        if context.hand_drawn  and not context.blueprint then
                local cursedCardTotal_value = card.ability.extra.cursedCardTotal
                return {
                    func = function()
                    card.ability.extra.cursedCardTotal = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_bonus') then count = count + 1 end end; return count end)())
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_mult') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_glass') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_gold') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_lucky') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) * 0.75
                    return true
                end,
                            colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) + 1
                    return true
                end,
                            colour = G.C.GREEN
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                }
        end
        if context.buying_card  and not context.blueprint then
                local cursedCardTotal_value = card.ability.extra.cursedCardTotal
                return {
                    func = function()
                    card.ability.extra.cursedCardTotal = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_bonus') then count = count + 1 end end; return count end)())
                    return true
                end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_mult') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_glass') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_gold') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = math.max(0, (card.ability.extra.cursedCardTotal) - (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_lucky') then count = count + 1 end end; return count end)())
                    return true
                end,
                            colour = G.C.RED,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) * 0.75
                    return true
                end,
                            colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.cursedCardTotal = (card.ability.extra.cursedCardTotal) + 1
                    return true
                end,
                            colour = G.C.GREEN
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                        }
                }
        end
    end
}