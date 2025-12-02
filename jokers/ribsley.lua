SMODS.Joker{ --Ribsley
    key = "ribsley",
    config = {
        extra = {
            randomDialog = 1,
            chips = 30,
            chips2 = 30,
            chips3 = 30
        }
    },
    loc_txt = {
        ['name'] = 'Ribsley',
        ['text'] = {
            [1] = '{C:blue}+30 Chips{}',
            [2] = '{C:purple}+1 Joker Slot{}',
            [3] = 'Provides {E:1}encouraging{} and',
            [4] = '{E:1}excited{} commentary',
            [5] = '{s:0.7}\"A FRIEND IN NEED IS A FRIEND INDEED!\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 0.75, 
        h = 95 * 0.75
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 3
    },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            if (card.ability.extra.randomDialog or 0) == 1 then
                return {
                    message = "HELLO FRIEND!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_7f0c4b45', 1, 5)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                return {
                    message = "GREETINGS!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_0124be92', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                return {
                    message = "I AM HERE!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_6ad56eba', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_6a960cdf', 1, 3)
                    return true
                end
                }
            end
        end
        if context.setting_blind  and not context.blueprint then
            if (card.ability.extra.randomDialog or 0) == 1 then
                return {
                    message = "YOU GOT THIS!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_64750b64', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                return {
                    message = "I SHALL HELP!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_c73d0c13', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                return {
                    message = "ONWARD!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_64b47453', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_b922e6c4', 1, 3)
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.randomDialog or 0) == 1 then
                card.ability.extra.randomDialog = pseudorandom('randomDialog_39ea29e2', 1, 3)
                return {
                    chips = card.ability.extra.chips,
                    message = "HIYA!"
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                card.ability.extra.randomDialog = pseudorandom('randomDialog_49b3bd0c', 1, 3)
                return {
                    chips = card.ability.extra.chips2,
                    message = "TAKE THAT!"
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                card.ability.extra.randomDialog = pseudorandom('randomDialog_3525e0e6', 1, 3)
                return {
                    chips = card.ability.extra.chips3,
                    message = "HA-HA!"
                }
            else
                card.ability.extra.randomDialog = pseudorandom('randomDialog_68b43fe9', 1, 3)
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if (card.ability.extra.randomDialog or 0) == 1 then
                return {
                    message = "HUZZAH!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_d5c15055', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                return {
                    message = "GOOD JOB!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_9967fa3b', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                return {
                    message = "WE DID IT!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_dad6aa9e', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_5fc36442', 1, 3)
                    return true
                end
                }
            end
        end
        if context.selling_self  and not context.blueprint then
            if (card.ability.extra.randomDialog or 0) == 1 then
                return {
                    message = "SEE YOU!"
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                return {
                    message = "GOODBYE FRIEND!"
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                return {
                    message = "UNTIL LATER!"
                }
            end
        end
        if context.using_consumeable  and not context.blueprint then
            if (card.ability.extra.randomDialog or 0) == 1 then
                return {
                    message = "WOAH!...",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_edca4e11', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 2 then
                return {
                    message = "MAGIC!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_30b7b503', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            elseif (card.ability.extra.randomDialog or 0) == 3 then
                return {
                    message = "COOL!",
                    extra = {
                        func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_34b7df99', 1, 3)
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.randomDialog = pseudorandom('randomDialog_950ccdb8', 1, 3)
                    return true
                end
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_lexmod_ribsley" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
	if e.config.ref_table.config.center.key == "j_lexmod_ribsley" then
		e.config.colour = G.C.GREEN
		e.config.button = "use_card"
	else
		can_select_card_ref(e)
	end
end