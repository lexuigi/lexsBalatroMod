SMODS.Joker{ --Toad0cooly
    key = "toad",
    config = {
        extra = {
            mult = 2,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Toad0cooly',
        ['text'] = {
            [1] = 'Cards with a {C:attention}Red{}',
            [2] = '{C:attention}Seal{} give {C:red}+2 Mult{} when scored',
            [3] = 'Skipping any {C:attention}Booster Pack{}',
            [4] = 'creates a {C:spectral}Deja Vu{} card',
            [5] = '{C:inactive}(Cannot already have a Deja Vu){}',
            [6] = '{s:0.7}\"Wait, why is my effect on the Green Seals?\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
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

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_deja_vu"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_deja_vu\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Red" then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.skipping_booster  and not context.blueprint then
            if (function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_deja_vu" then
            count = count + 1
        end
    end
    return count < 1
end)() then
                return {
                    
    func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', key = 'c_deja_vu'})                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                  end
                }
            end
        end
    end
}