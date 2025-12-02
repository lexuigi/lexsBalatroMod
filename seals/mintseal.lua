SMODS.Seal {
    key = 'mintseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            card_draw = 2
        }
    },
    badge_colour = HEX('90EE90'),
   loc_txt = {
        name = 'Mint Seal',
        label = 'Mint Seal',
        text = {
        [1] = 'Draw {C:attention}2{} Cards when scored'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = false,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if G.GAME.blind.in_blind then
    SMODS.draw_cards(card.ability.seal.extra.card_draw)
  end
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.seal.extra.card_draw).." Cards Drawn", colour = G.C.BLUE})
        end
    end
}