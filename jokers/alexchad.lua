SMODS.Joker{ --Alex Chad
    key = "alexchad",
    config = {
        extra = {
            repetitions = 4,
            repetitions2 = 1,
            odds = 10000,
            alexSnort = 0,
            alexDeath = 0
        }
    },
    loc_txt = {
        ['name'] = 'Alex Chad',
        ['text'] = {
            [1] = 'Retrigger {C:attention}last{} played',
            [2] = 'card in scoring',
            [3] = '{C:attention}4{} additional times',
            [4] = '{s:0.7}“Buy this card nothing bad will happen I swear”{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 2,
        y = 0
    },

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                for i = 1, card.ability.extra.repetitions do
              return {repetitions = card.ability.extra.repetitions}
                        
          end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1ba72738', 1, card.ability.extra.odds, 'j_lexmod_alexchad', false) then
              play_sound("lexmod_alexSnort")
                        error("EasternFarmer Was Here")
                        
          end
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_alexSnort")
        end
        if context.selling_self  and not context.blueprint then
                play_sound("lexmod_alexDeath")
        end
    end
}