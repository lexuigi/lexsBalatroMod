SMODS.Joker{ --Sketch
    key = "sketch",
    config = {
        extra = {
            odds = 2,
            start_dissolve = 0,
            sketchDecay = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sketch',
        ['text'] = {
            [1] = 'Copies ability of',
            [2] = '{C:attention}Joker{} to the left',
            [3] = '{C:green}#3# in 2{} chance of being destroyed',
            [4] = 'after {C:attention}Boss Blind{} is defeated'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_lexmod_sketch') 
        return {vars = {card.ability.extra.sketchDecay, card.ability.extra.start_dissolve, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_287c5b64', 1, card.ability.extra.odds, 'j_lexmod_sketch', false) then
              play_sound("lexmod_sketchDecay")
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
          end
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_sketchDecay")
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}