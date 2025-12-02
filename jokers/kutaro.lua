SMODS.Joker{ --Broken Father
    key = "kutaro",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Broken Father',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult if hand contains a {C:attention}King{}',
            [2] = '{s:0.7}\"...\"{}'
        },
        ['unlock'] = {
            [1] = 'Face off against {C:attention}The Needle{}',
            [2] = 'with Sishi and Kutaro'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rta' and args.source ~= 'wra' 
          or args.source == 'rif' or args.source == 'sou' or args.source == 'uta'
          )
          and G.GAME.pool_flags.lexmod_sishiDead
      end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 13 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  and not context.blueprint then
            if G.GAME.blind.name == "The Needle" then
                return {
                    message = "..."
                }
            end
        end
    end
}