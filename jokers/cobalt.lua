SMODS.Joker{ --Cobalt
    key = "cobalt",
    config = {
        extra = {
            handsplayedthisround = 0,
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Cobalt',
        ['text'] = {
            [1] = 'If round is defeated',
            [2] = 'in {C:attention}first hand{} earn {C:money}$5{}',
            [3] = '{s:0.7}\"Cobalt likes playing with his new friends!\"{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 0.9, 
        h = 95 * 0.9
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if 1 == G.GAME.current_round.hands_played then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  and not context.blueprint then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_lexmod_kutaro" then
              return true
          end
      end
      return false
  end)() and (G.GAME.pool_flags.lexmod_sishiDead or false)) then
                return {
                    message = "Sishi...?"
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_lexmod_kutaro" then
              return true
          end
      end
      return false
  end)() and G.GAME.blind.name == "The Needle") then
                return {
                    message = "Sishi...?!"
                }
            end
        end
    end
}