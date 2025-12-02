SMODS.Joker{ --Spectre
    key = "spectre",
    config = {
        extra = {
            spectralcardsused = 1,
            spectreUpgrade = 0,
            spectreSold = 0,
            spectreBuy = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spectre',
        ['text'] = {
            [1] = 'Gains {X:blue,C:white}X0.2{} Chips',
            [2] = 'per {C:spectral}Spectral{} card used',
            [3] = 'throughout the {E:1}whole{} run',
            [4] = '{C:inactive}(Currently:{} {X:blue,C:white}X#4#{} {C:inactive}Chips){}',
            [5] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.spectreBuy, card.ability.extra.spectreSold, card.ability.extra.spectreUpgrade, card.ability.extra.spectralcardsused + (((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) or 0)) * 0.2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.spectralcardsused + ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)) * 0.2
                }
        end
        if context.using_consumeable  and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Spectral' then
                play_sound("lexmod_spectreUpgrade")
                return {
                    message = "Haunted!"
                }
            end
        end
        if context.selling_self  and not context.blueprint then
                play_sound("lexmod_spectreSold")
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
                play_sound("lexmod_spectreBuy")
        end
    end
}