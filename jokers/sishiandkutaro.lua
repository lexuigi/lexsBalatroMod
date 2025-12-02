SMODS.Joker{ --Sishi and Kutaro
    key = "sishiandkutaro",
    config = {
        extra = {
            Xmult = 3,
            start_dissolve = 0,
            ignore = 0,
            sishiDead = 0,
            n = 0,
            sishiExists = 0,
            sishiKutaro = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sishi and Kutaro',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult if hand contains both a {C:attention}2{} and a {C:attention}King{}',
            [2] = '{C:inactive}(Warning: Sishi is afraid of Needles...){}',
            [3] = '{s:0.7}\"I\'d fight a thousand leagues to sew my little fish again.\"{}',
            [4] = '{s:0.7}“I love you big fish!”{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and not G.GAME.pool_flags.lexmod_sishiDead
      end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 2 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 13 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if G.GAME.blind.name == "The Needle" then
                G.GAME.pool_flags.lexmod_sishiDead = true
                G.GAME.pool_flags.lexmod_sishiExists = false
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_lexmod_kutaro' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
      local target_joker = G.P_CENTERS["j_lexmod_kutaro"]
      if target_joker then
        unlock_card(target_joker)
        discover_card(target_joker)
        SMODS.calculate_effect({message = "..."}, card)
      else
        error("JOKERFORGE: Invalid joker key in Unlock Joker Effect. Did you forget the modprefix or misspelled the key?")
      end
      return true
    end,
                            colour = G.C.BLUE
                        }
                        }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_sishiKutaro")
        end
        if context.starting_shop  and not context.blueprint then
            if (G.GAME.pool_flags.lexmod_sishiDead or false) then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_lexmod_kutaro' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}