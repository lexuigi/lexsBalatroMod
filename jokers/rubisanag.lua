SMODS.Joker{ --Rubi Sanag
    key = "rubisanag",
    config = {
        extra = {
            odds = 10,
            odds2 = 10,
            odds3 = 10,
            odds4 = 5,
            dieRoll = 0,
            cursedDieRoll = 0
        }
    },
    loc_txt = {
        ['name'] = 'Rubi Sanag',
        ['text'] = {
            [1] = 'Played cards have a variety of',
            [2] = '{C:green}#3# in #4#{} chances to have {C:attention}Enhancements{},',
            [3] = '{C:attention}Seals{}, and {C:attention}Editions {}applied to them.',
            [4] = 'Discarded cards have a {C:green}#5# in 5{} chance to',
            [5] = '{C:red}lose all upgrades{}.',
            [6] = '{s:0.7}\"What will you get? I have no fucking idea\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_lexmod_rubisanag')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_lexmod_rubisanag')
        return {vars = {card.ability.extra.cursedDieRoll, card.ability.extra.dieRoll, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_cef4367d', 1, card.ability.extra.odds, 'j_lexmod_rubisanag', false) then
              local enhancement_pool = {}
                for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                    if enhancement.key ~= 'm_stone' then
                        enhancement_pool[#enhancement_pool + 1] = enhancement
                    end
                end
                local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                context.other_card:set_ability(random_enhancement)
                        play_sound("lexmod_dieRoll")
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_55e9f114', 1, card.ability.extra.odds, 'j_lexmod_rubisanag', false) then
              local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                if random_seal then
                    context.other_card:set_seal(random_seal, true)
                end
                        play_sound("lexmod_dieRoll")
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_1c936eb3', 1, card.ability.extra.odds, 'j_lexmod_rubisanag', false) then
              local random_edition = poll_edition('edit_card_edition', nil, true, true)
                if random_edition then
                    context.other_card:set_edition(random_edition, true)
                end
                        play_sound("lexmod_dieRoll")
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            end
        end
        if context.discard  then
            if ((function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)() or context.other_card.edition ~= nil or context.other_card.seal ~= nil) then
                if SMODS.pseudorandom_probability(card, 'group_0_f495133f', 1, card.ability.extra.odds, 'j_lexmod_rubisanag', false) then
              play_sound("lexmod_cursedDieRoll")
                        SMODS.calculate_effect({func = function()
                context.other_card:set_ability(G.P_CENTERS.c_base)
                context.other_card:set_seal(nil)
                context.other_card:set_edition(nil)
                    end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            end
        end
    end
}