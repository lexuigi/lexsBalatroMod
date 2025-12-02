SMODS.Joker{ --CjamIam
    key = "cjamiam",
    config = {
        extra = {
            firstHandPlayed = 0,
            handsplayedthisround = 0,
            Xmult = 10,
            explode = 0,
            n = 0,
            cjDead = 0,
            cjExplosion = 0
        }
    },
    loc_txt = {
        ['name'] = 'CjamIam',
        ['text'] = {
            [1] = '{X:mult,C:white}X10{} Mult',
            [2] = 'Self destructs after',
            [3] = 'one hand is played',
            [4] = '{s:0.7}\"Can you just make my card explode?\"{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 0.9, 
        h = 95 * 0.9
    },
    cost = 2,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.hand_drawn  and not context.blueprint then
            if 1 == G.GAME.current_round.hands_played then
                G.GAME.pool_flags.lexmod_cjDead = true
                play_sound("lexmod_cjExplosion")
                return {
                    func = function()
                card:explode()
                return true
            end
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                G.GAME.pool_flags.lexmod_cjDead = true
                play_sound("lexmod_cjExplosion")
                return {
                    func = function()
                card:explode()
                return true
            end
                }
        end
    end
}