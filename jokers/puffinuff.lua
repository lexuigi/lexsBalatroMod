SMODS.Joker{ --Puffinuff
    key = "puffinuff",
    config = {
        extra = {
            repetitions = 1,
            xchips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Puffinuff',
        ['text'] = {
            [1] = 'Retrigger all scoring {C:attention}3s{}',
            [2] = 'If a {C:attention}3{} scored, {X:chips,C:white}X3{} Chips',
            [3] = '{s:0.7}\"ANOTHER FUCKING 3!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 3 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "Help Action!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 3 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}