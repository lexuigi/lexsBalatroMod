SMODS.Joker{ --Cursed!
    key = "cursed",
    config = {
        extra = {
            hand_size = 0,
            explode = 0,
            n = 0,
            uncursed = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cursed!',
        ['text'] = {
            [1] = 'Sets {C:attention}Hand Size{} to {C:hearts}0{} after',
            [2] = 'blind is defeated!',
            [3] = '{s:0.7}\"Too bad!\"{}'
        },
        ['unlock'] = {
            [1] = 'Play or Discard a {C:attention}Cursed{} Card'
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "lexmod_curse",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
          or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                local current_hand_size = G.hand.config.card_limit
                local target_hand_size = card.ability.extra.hand_size
                local difference = target_hand_size - current_hand_size
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cursed!", colour = G.C.BLUE})
                G.hand:change_size(difference)
                return true
            end,
                    extra = {
                        func = function()
                card:explode()
                return true
            end,
                        colour = G.C.RED
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (function()
    local count = 0
    for _, playing_card in pairs(context.scoring_hand or {}) do
        if SMODS.get_enhancements(playing_card)["m_glass"] == true then
            count = count + 1
        end
    end
    return count >= 5
end)() then
                play_sound("lexmod_uncursed")
                return {
                    func = function()
                card:explode()
                return true
            end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
                return {
                    func = function()
      local target_joker = G.P_CENTERS["j_lexmod_cursed"]
      if target_joker then
        unlock_card(target_joker)
        discover_card(target_joker)
        
      else
        error("JOKERFORGE: Invalid joker key in Unlock Joker Effect. Did you forget the modprefix or misspelled the key?")
      end
      return true
    end
                }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_lexmod_cursed" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_lexmod_cursed" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end