SMODS.Joker{ --R Key
    key = "rkey",
    config = {
        extra = {
            ante_value = 1,
            scale = 0.6,
            rotation = 0.6,
            rkey = 0,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'R Key',
        ['text'] = {
            [1] = 'Sell this card to',
            [2] = 'set Ante to {C:attention}1{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 3
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.selling_self  and not context.blueprint then
                play_sound("lexmod_rkey")
                return {
                    func = function()
                    local mod = card.ability.extra.ante_value - G.GAME.round_resets.ante
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = card.ability.extra.ante_value
				return true
			end,
		}))
                    return true
                end,
                    message = "Ante set to " .. card.ability.extra.ante_value .. "!"
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
                local target_card = context.other_card
                return {
                    func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end
                }
        end
    end
}