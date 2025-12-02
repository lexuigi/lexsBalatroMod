SMODS.Joker{ --Curse of 3s
    key = "curseof3s",
    config = {
        extra = {
            topChance = 1,
            bottomChance = 4,
            cursedDieRoll = 0
        }
    },
    loc_txt = {
        ['name'] = 'Curse of 3s',
        ['text'] = {
            [1] = 'If played hand does not contain a',
            [2] = '{C:attention}Three of a Kind{}, {C:red}destroy{} scored cards',
            [3] = 'Otherwise, scored cards of any',
            [4] = 'rank are turned into {C:attention}3s{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
            if (context.scoring_name == "High Card" or context.scoring_name == "Pair" or context.scoring_name == "Two Pair" or context.scoring_name == "Straight" or context.scoring_name == "Straight Flush" or context.scoring_name == "Flush" and not (next(context.poker_hands["Three of a Kind"]))) then
                context.other_card.should_destroy = true
                play_sound("lexmod_cursedDieRoll")
                return {
                    message = "Cursed!"
                }
            elseif not (context.other_card:get_id() == 3) then
                assert(SMODS.change_base(context.other_card, nil, "3"))
                play_sound("lexmod_cursedDieRoll")
                return {
                    message = "Cursed!"
                }
            end
        end
    end
}