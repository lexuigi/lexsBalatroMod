SMODS.Joker{ --SwagMessiah
    key = "swagmessiah",
    config = {
        extra = {
            blind_size = 0.8,
            rizz = 0
        }
    },
    loc_txt = {
        ['name'] = 'SwagMessiah',
        ['text'] = {
            [1] = 'Lowers {C:attention}Boss Blind{}',
            [2] = '{C:attention}Requirement {}by 20%',
            [3] = '{s:0.7}\"It\'s Swaggerin\' Time\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                play_sound("lexmod_rizz")
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Swag!", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            end
        end
    end
}