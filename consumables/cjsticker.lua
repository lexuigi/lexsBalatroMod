SMODS.Consumable {
    key = 'cjsticker',
    set = 'Spectral',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'CJ',
        text = {
        [1] = 'Adds a {C:dark_edition}Negative {}{C:attention}CJamIam{}',
        [2] = 'to your jokers'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_lexmod_cjamiam' })
                      if new_joker then
                          new_joker:set_edition("e_negative", true)
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}