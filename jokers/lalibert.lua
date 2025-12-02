SMODS.Joker{ --Laliberté
    key = "lalibert",
    config = {
        extra = {
            levels = 1,
            levels2 = 1,
            levels3 = 1,
            levels4 = 1,
            levels5 = 1,
            levels6 = 1,
            levels7 = 1,
            levels8 = 1,
            levels9 = 1,
            levels10 = 1,
            levels11 = 1,
            levels12 = 1,
            levels13 = 1,
            levels14 = 1,
            levels15 = 1,
            levels16 = 1,
            levels17 = 1,
            levels18 = 1,
            levels19 = 1,
            levels20 = 1,
            levels21 = 1,
            levels22 = 1,
            levels23 = 1,
            levels24 = 1,
            levels25 = 1,
            levels26 = 1,
            levels27 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Laliberté',
        ['text'] = {
            [1] = 'Using a {C:planet}Planet{} card upgrades the level of',
            [2] = 'every poker hand type the {C:planet}Planet\'s{} card contains',
            [3] = '{C:inactive}(ex: Earth upgrades Full House, Three of a Kind,{}',
            [4] = '{C:inactive}Two Pair, Pair, and High card){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.using_consumeable  then
            if (context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_mercury' or context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_saturn' or context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_jupiter') then
                local target_hand = "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                }
            elseif (context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_uranus' or context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_venus') then
                local target_hand2 = "Pair"
                local target_hand3 = "High Card"
                return {
                    level_up = card.ability.extra.levels2,
      level_up_hand = target_hand2,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels3,
      level_up_hand = target_hand3,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_earth' then
                local target_hand4 = "Three of a Kind"
                local target_hand5 = "Two Pair"
                local target_hand6 = "Pair"
                local target_hand7 = "High Card"
                return {
                    level_up = card.ability.extra.levels4,
      level_up_hand = target_hand4,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels5,
      level_up_hand = target_hand5,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels6,
      level_up_hand = target_hand6,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels7,
      level_up_hand = target_hand7,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_mars' then
                local target_hand8 = "Three of a Kind"
                local target_hand9 = "Pair"
                local target_hand10 = "High Card"
                return {
                    level_up = card.ability.extra.levels8,
      level_up_hand = target_hand8,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels9,
      level_up_hand = target_hand9,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels10,
      level_up_hand = target_hand10,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_neptune' then
                local target_hand11 = "Flush"
                local target_hand12 = "Straight"
                return {
                    level_up = card.ability.extra.levels11,
      level_up_hand = target_hand11,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels12,
      level_up_hand = target_hand12,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_planet_x' then
                local target_hand13 = "Four of a Kind"
                local target_hand14 = "Three of a Kind"
                local target_hand15 = "Pair"
                local target_hand16 = "High Card"
                return {
                    level_up = card.ability.extra.levels13,
      level_up_hand = target_hand13,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels14,
      level_up_hand = target_hand14,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels15,
      level_up_hand = target_hand15,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels16,
      level_up_hand = target_hand16,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_ceres' then
                local target_hand17 = "Flush"
                local target_hand18 = "Three of a Kind"
                local target_hand19 = "Two Pair"
                local target_hand20 = "Pair"
                local target_hand21 = "High Card"
                return {
                    level_up = card.ability.extra.levels17,
      level_up_hand = target_hand17,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels18,
      level_up_hand = target_hand18,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels19,
      level_up_hand = target_hand19,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels20,
      level_up_hand = target_hand20,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels21,
      level_up_hand = target_hand21,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                        }
                        }
                }
            elseif context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_eris' then
                local target_hand22 = "Five of a Kind"
                local target_hand23 = "Four of a Kind"
                local target_hand24 = "Flush"
                local target_hand25 = "Three of a Kind"
                local target_hand26 = "Pair"
                local target_hand27 = "High Card"
                return {
                    level_up = card.ability.extra.levels22,
      level_up_hand = target_hand22,
                    message = localize('k_level_up_ex'),
                    extra = {
                        level_up = card.ability.extra.levels23,
      level_up_hand = target_hand23,
                            message = localize('k_level_up_ex'),
                        colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels24,
      level_up_hand = target_hand24,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels25,
      level_up_hand = target_hand25,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels26,
      level_up_hand = target_hand26,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED,
                        extra = {
                            level_up = card.ability.extra.levels27,
      level_up_hand = target_hand27,
                            message = localize('k_level_up_ex'),
                            colour = G.C.RED
                        }
                        }
                        }
                        }
                        }
                }
            end
        end
    end
}