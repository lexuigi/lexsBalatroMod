SMODS.Joker{ --MesyGoose
    key = "goose",
    config = {
        extra = {
            additionalSlots = 0,
            joker_slots = 1,
            gooseHjonk = 0
        }
    },
    loc_txt = {
        ['name'] = 'MesyGoose',
        ['text'] = {
            [1] = '{C:dark_edition}+1 Permanent Joker Slot{} when a',
            [2] = '{C:legendary}Finisher Boss Blind{} is defeated',
            [3] = '{C:inactive}(Currently: #1# additional slots){}',
            [4] = '{s:0.7}\"Crazy as boots.\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.additionalSlots}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if (G.GAME.round_resets.ante == 8 or G.GAME.round_resets.ante == 16 or G.GAME.round_resets.ante == 24 or G.GAME.round_resets.ante == 32 or G.GAME.round_resets.ante == 40 or G.GAME.round_resets.ante == 48 or G.GAME.round_resets.ante == 56 or G.GAME.round_resets.ante == 64) then
                play_sound("lexmod_gooseHjonk")
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Hjonk!", colour = G.C.DARK_EDITION})
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
                return true
            end,
                    extra = {
                        func = function()
                    card.ability.extra.additionalSlots = (card.ability.extra.additionalSlots) + 1
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}