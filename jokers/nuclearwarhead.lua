SMODS.Joker{ --Nuclear Warhead
    key = "nuclearwarhead",
    config = {
        extra = {
            timer = 1,
            roundsLeftActive = 5,
            emult = 2,
            nuclearExplosion = 0,
            onetime = 0,
            nuclearSiren = 0
        }
    },
    loc_txt = {
        ['name'] = 'Nuclear Warhead',
        ['text'] = {
            [1] = '{X:edition,C:white}^2{} Mult for the next {C:dark_edition}#2#{} played or skipped blinds',
            [2] = 'Selling this card causes a {C:red}Game Over{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1.25, 
        h = 95 * 1.25
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and G.GAME.pool_flags.lexmod_cjDead
      end,

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.timer, card.ability.extra.roundsLeftActive}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (card.ability.extra.timer or 0) < 6 then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
        if context.selling_self  and not context.blueprint then
                play_sound("lexmod_nuclearExplosion")
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "BOOM!", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if (card.ability.extra.timer or 0) < 6 then
                local timer_value = card.ability.extra.timer
                local target_card = context.other_card
                play_sound("lexmod_nuclearSiren")
                return {
                    func = function()
                      card:juice_up(timer_value, timer_value)
                      return true
                    end,
                    extra = {
                        func = function()
                    card.ability.extra.timer = (card.ability.extra.timer) + 1
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.roundsLeftActive = math.max(0, (card.ability.extra.roundsLeftActive) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            end
        end
        if context.skip_blind  and not context.blueprint then
            if (card.ability.extra.timer or 0) < 6 then
                local timer_value = card.ability.extra.timer
                local target_card = context.other_card
                play_sound("lexmod_nuclearSiren")
                return {
                    func = function()
                      card:juice_up(timer_value, timer_value)
                      return true
                    end,
                    extra = {
                        func = function()
                    card.ability.extra.timer = (card.ability.extra.timer) + 1
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.roundsLeftActive = math.max(0, (card.ability.extra.roundsLeftActive) - 1)
                    return true
                end,
                            colour = G.C.RED
                        }
                        }
                }
            end
        end
    end
}