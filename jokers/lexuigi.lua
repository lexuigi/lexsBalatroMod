SMODS.Joker{ --Lex
    key = "lexuigi",
    config = {
        extra = {
            n = 0,
            lexSpawn = 0
        }
    },
    loc_txt = {
        ['name'] = 'Lex',
        ['text'] = {
            [1] = 'Creates a {C:tarot}Tarot{} card when',
            [2] = '{C:attention}playing cards{} are destroyed',
            [3] = '{s:0.7}\"Less is more, or something like that\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 1
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
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 1
    },

    set_ability = function(self, card, initial)
        G.GAME.current_round.spade_card = { suit = 'Spades' }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards  then
                play_sound("lexmod_lexSpawn")
                return {
                    
    func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', soulable = true, })                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                  end
                }
        end
    end
}