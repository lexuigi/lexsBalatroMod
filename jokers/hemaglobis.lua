SMODS.Joker{ --Hema Globis
    key = "hemaglobis",
    config = {
        extra = {
            odds = 2,
            xchips = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Hema Globis',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for',
            [2] = 'played {C:hearts}Hearts{} and {C:attention}3s{} to give',
            [3] = '{X:chips,C:white}X1.5{} Chips when scored',
            [4] = '{s:0.7}\"Scars ain\'t nothin\' to be ashamed of!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_lexmod_hemaglobis') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Hearts") or context.other_card:get_id() == 3) then
                if SMODS.pseudorandom_probability(card, 'group_0_82691c03', 1, card.ability.extra.odds, 'j_lexmod_hemaglobis', false) then
              SMODS.calculate_effect({x_chips = card.ability.extra.xchips}, card)
          end
            end
        end
    end
}