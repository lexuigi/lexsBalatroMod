SMODS.Joker{ --Yellow Frog
    key = "yellowfrog",
    config = {
        extra = {
            repetitions = 1,
            repetitions2 = 1,
            repetitions3 = 1,
            repetitions4 = 1,
            yellowfrogCroak = 0
        }
    },
    loc_txt = {
        ['name'] = 'Yellow Frog',
        ['text'] = {
            [1] = 'Retrigger {C:attention}first{} and {C:attention}last{} scored',
            [2] = 'cards {C:attention}1{} additional time',
            [3] = '{s:0.7}\"Go Eagles!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and #context.scoring_hand > 1) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "Leap!"
                }
            elseif (context.other_card == context.scoring_hand[#context.scoring_hand] and #context.scoring_hand > 1) then
                return {
                    repetitions = card.ability.extra.repetitions2,
                    message = "Frog!"
                }
            elseif #context.scoring_hand == 1 then
                return {
                    repetitions = card.ability.extra.repetitions3,
                    message = "Leap!",
                    extra = {
                        repetitions = card.ability.extra.repetitions4,
                            message = "Frog!",
                        colour = G.C.RED
                        }
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_yellowfrogCroak")
        end
    end
}