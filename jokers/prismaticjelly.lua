SMODS.Joker{ --Prismatic Jelly
    key = "prismaticjelly",
    config = {
        extra = {
            Xmult = 2,
            odds = 20,
            scale = 0.4,
            rotation = 0.4,
            prismaticCollect = 0,
            onetime = 0
        }
    },
    loc_txt = {
        ['name'] = 'Prismatic Jelly',
        ['text'] = {
            [1] = 'All suits are {E:1}equal{}',
            [2] = 'Played {C:attention}Wild{} cards give',
            [3] = '{X:red,C:white}X2{} Mult when scored',
            [4] = 'Scored cards have a {C:green}#3# in #4#{}',
            [5] = 'chance of turning {C:edition}Polychrome{}',
            [6] = 'Disables {C:attention}Boss Blinds{} that',
            [7] = 'effect specific suits'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 2
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
        x = 8,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_wild"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_wild\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["e_polychrome"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_polychrome\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_lexmod_prismaticjelly') 
        return {vars = {card.ability.extra.onetime, card.ability.extra.prismaticCollect, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_wild"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif context.other_card.edition == nil then
                if SMODS.pseudorandom_probability(card, 'group_0_b2c06c21', 1, card.ability.extra.odds, 'j_lexmod_prismaticjelly', false) then
              context.other_card:set_edition("e_polychrome", true)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Prismatic!", colour = G.C.BLUE})
          end
            end
        end
        if context.setting_blind  and not context.blueprint then
            if (G.GAME.blind.name == "The Club" or G.GAME.blind.name == "The Goad" or G.GAME.blind.name == "The Window" or G.GAME.blind.name == "The Head") then
                return {
                    func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Inclusivity!", colour = G.C.GREEN})
            end
                    return true
                end
                }
            end
        end
        if context.hand_drawn  and not context.blueprint then
                play_sound("lexmod_prismaticCollect")
                local target_card = context.other_card
                return {
                    func = function()
                      card:juice_up(card.ability.extra.scale, card.ability.extra.rotation)
                      return true
                    end
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Combine suits effect enabled
        -- Combine suits effect enabled
        -- Combine suits effect enabled
        -- Combine suits effect enabled
        -- Combine suits effect enabled
        -- Combine suits effect enabled
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Combine suits effect disabled
        -- Combine suits effect disabled
        -- Combine suits effect disabled
        -- Combine suits effect disabled
        -- Combine suits effect disabled
        -- Combine suits effect disabled
    end
}


local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    if not ret and not SMODS.has_no_suit(self) then
        if next(SMODS.find_card("j_lexmod_prismaticjelly")) then
            -- If checking for Spades and card is Hearts, return true
            if suit == "Spades" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Hearts and card is Spades, return true
            if suit == "Hearts" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Spades and card is Diamonds, return true
            if suit == "Spades" and self.base.suit == "Diamonds" then
                ret = true
            end
            -- If checking for Diamonds and card is Spades, return true
            if suit == "Diamonds" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Spades and card is Clubs, return true
            if suit == "Spades" and self.base.suit == "Clubs" then
                ret = true
            end
            -- If checking for Clubs and card is Spades, return true
            if suit == "Clubs" and self.base.suit == "Spades" then
                ret = true
            end
            -- If checking for Hearts and card is Diamonds, return true
            if suit == "Hearts" and self.base.suit == "Diamonds" then
                ret = true
            end
            -- If checking for Diamonds and card is Hearts, return true
            if suit == "Diamonds" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Hearts and card is Clubs, return true
            if suit == "Hearts" and self.base.suit == "Clubs" then
                ret = true
            end
            -- If checking for Clubs and card is Hearts, return true
            if suit == "Clubs" and self.base.suit == "Hearts" then
                ret = true
            end
            -- If checking for Diamonds and card is Clubs, return true
            if suit == "Diamonds" and self.base.suit == "Clubs" then
                ret = true
            end
            -- If checking for Clubs and card is Diamonds, return true
            if suit == "Clubs" and self.base.suit == "Diamonds" then
                ret = true
            end
        end
    end
    return ret
end