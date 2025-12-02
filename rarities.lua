SMODS.Rarity {
    key = "curse",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('6b1012'),
    loc_txt = {
        name = "Curse"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}