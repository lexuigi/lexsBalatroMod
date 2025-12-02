SMODS.Enhancement {
    key = 'cursed',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Cursed',
        text = {
        [1] = 'Playing or Discarding this card destroys',
        [2] = 'this card and gives a Joker that will',
        [3] = 'set {C:attention}Hand Size{} to {C:hearts}0{} at end of round'
    }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    shatters = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2.5,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if (function()
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.key == "j_lexmod_cursed" then
            return false
        end
    end
    return true
end)() then
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_lexmod_cursed' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
            card.should_destroy = true
            play_sound("lexmod_cursedLong")
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
            end
        end
        if context.discard and context.other_card == card and (function()
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config.center.key == "j_lexmod_cursed" then
            return false
        end
    end
    return true
end)() then
            local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_lexmod_cursed' })
                        if joker_card then
                            
                            
                        end
                        
                        return true
                    end
                }))
            play_sound("lexmod_cursedLong")
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
            SMODS.calculate_effect({remove = true}, card)
        end
    end
}