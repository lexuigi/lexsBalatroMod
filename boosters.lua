SMODS.Booster {
    key = 'mega_lex_mod_buffoon_pack',
    loc_txt = {
        name = "Mega Lex Mod Buffoon Pack",
        text = {
            "Choose 2 of up to 5 Joker cards",
            "from Lex's Mod!"
        },
        group_name = "Mega Lex Mod Buffoon Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 12,
    weight = 0.1,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            0.5,
            0.5,
            1.4,
            0.5,
            0.5,
            0.2,
            0.5,
            0.5,
            0.5,
            0.2,
            0.2,
            0.5,
            0.5,
            1.4,
            0.5,
            1.4,
            1.4,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5,
            0.5,
            0.5,
            1.4,
            0.2,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('lexmod_mega_lex_mod_buffoon_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_lexmod_lexuigi",
            set = "Joker",
            rarity = "lexmod_curse",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "j_lexmod_hex",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 3 then
            return {
            key = "j_lexmod_cjamiam",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 4 then
            return {
            key = "j_lexmod_puffinuff",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 5 then
            return {
            key = "j_lexmod_pennysaved",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 6 then
            return {
            key = "j_lexmod_curseof3s",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 7 then
            return {
            key = "j_lexmod_gooberjoker",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 8 then
            return {
            key = "j_lexmod_mart",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 9 then
            return {
            key = "j_lexmod_tokagashi",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 10 then
            return {
            key = "j_lexmod_nuclearwarhead",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 11 then
            return {
            key = "j_lexmod_swagmessiah",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 12 then
            return {
            key = "j_lexmod_temptation",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 13 then
            return {
            key = "j_lexmod_rubisanag",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 14 then
            return {
            key = "j_lexmod_ribsley",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 15 then
            return {
            key = "j_lexmod_hemaglobis",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 16 then
            return {
            key = "j_lexmod_yellowfrog",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 17 then
            return {
            key = "j_lexmod_thecreature",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 18 then
            return {
            key = "j_lexmod_toad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 19 then
            return {
            key = "j_lexmod_goose",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 20 then
            return {
            key = "j_lexmod_oldman",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 21 then
            return {
            key = "j_lexmod_sketch",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 22 then
            return {
            key = "j_lexmod_odysseus",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 23 then
            return {
            key = "j_lexmod_spectre",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 24 then
            return {
            key = "j_lexmod_redborg",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 25 then
            return {
            key = "j_lexmod_cobalt",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 26 then
            return {
            key = "j_lexmod_alexchad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 27 then
            return {
            key = "j_lexmod_sishiandkutaro",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 28 then
            return {
            key = "j_lexmod_cursedsoul",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 29 then
            return {
            key = "j_lexmod_witchdoctor",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 30 then
            return {
            key = "j_lexmod_backyardburn",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        elseif selected_index == 31 then
            return {
            key = "j_lexmod_twentysideddie",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_mega_lex_mod_buffoon_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("fb7d08"))
        ease_background_colour({ new_colour = HEX('fb7d08'), special_colour = HEX("5ff353"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'jumbo_lex_mod_buffoon_pack',
    loc_txt = {
        name = "Jumbo Lex Mod Buffoon Pack",
        text = {
            "Choose 1 of up to 5 Joker cards",
            "from Lex's Mod!"
        },
        group_name = "Jumbo Lex Mod Buffoon Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 10,
    weight = 0.3,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            0.5,
            0.5,
            1.4,
            0.5,
            0.5,
            0.2,
            0.5,
            0.5,
            0.5,
            0.2,
            0.2,
            0.5,
            0.5,
            1.4,
            0.5,
            1.4,
            1.4,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5,
            0.5,
            0.5,
            1.4,
            0.2,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('lexmod_jumbo_lex_mod_buffoon_pack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_lexmod_lexuigi",
            set = "Joker",
            rarity = "lexmod_curse",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 2 then
            return {
            key = "j_lexmod_hex",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 3 then
            return {
            key = "j_lexmod_cjamiam",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 4 then
            return {
            key = "j_lexmod_puffinuff",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 5 then
            return {
            key = "j_lexmod_pennysaved",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 6 then
            return {
            key = "j_lexmod_curseof3s",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 7 then
            return {
            key = "j_lexmod_gooberjoker",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 8 then
            return {
            key = "j_lexmod_mart",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 9 then
            return {
            key = "j_lexmod_tokagashi",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 10 then
            return {
            key = "j_lexmod_nuclearwarhead",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 11 then
            return {
            key = "j_lexmod_swagmessiah",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 12 then
            return {
            key = "j_lexmod_temptation",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 13 then
            return {
            key = "j_lexmod_rubisanag",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 14 then
            return {
            key = "j_lexmod_ribsley",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 15 then
            return {
            key = "j_lexmod_hemaglobis",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 16 then
            return {
            key = "j_lexmod_yellowfrog",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 17 then
            return {
            key = "j_lexmod_thecreature",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 18 then
            return {
            key = "j_lexmod_toad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 19 then
            return {
            key = "j_lexmod_goose",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 20 then
            return {
            key = "j_lexmod_oldman",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 21 then
            return {
            key = "j_lexmod_sketch",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 22 then
            return {
            key = "j_lexmod_odysseus",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 23 then
            return {
            key = "j_lexmod_spectre",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 24 then
            return {
            key = "j_lexmod_redborg",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 25 then
            return {
            key = "j_lexmod_cobalt",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 26 then
            return {
            key = "j_lexmod_alexchad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 27 then
            return {
            key = "j_lexmod_sishiandkutaro",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 28 then
            return {
            key = "j_lexmod_cursedsoul",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 29 then
            return {
            key = "j_lexmod_witchdoctor",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 30 then
            return {
            key = "j_lexmod_backyardburn",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        elseif selected_index == 31 then
            return {
            key = "j_lexmod_twentysideddie",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_jumbo_lex_mod_buffoon_pack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ee08fb"))
        ease_background_colour({ new_colour = HEX('ee08fb'), special_colour = HEX("0f08ef"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'lex_mod_buffoon_pack2',
    loc_txt = {
        name = "Lex Mod Buffoon Pack",
        text = {
            "Choose 1 of up to 3 Joker cards",
            "from Lex's Mod!"
        },
        group_name = "Lex Mod Buffoon Pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 8,
    weight = 0.3,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            0.5,
            0.5,
            1.4,
            0.5,
            0.5,
            0.2,
            0.5,
            0.5,
            0.5,
            0.2,
            0.2,
            0.5,
            0.5,
            1.4,
            0.5,
            1.4,
            1.4,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5,
            0.5,
            0.5,
            1.4,
            0.2,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('lexmod_lex_mod_buffoon_pack2_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_lexmod_lexuigi",
            set = "Joker",
            rarity = "lexmod_curse",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 2 then
            return {
            key = "j_lexmod_hex",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 3 then
            return {
            key = "j_lexmod_cjamiam",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 4 then
            return {
            key = "j_lexmod_puffinuff",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 5 then
            return {
            key = "j_lexmod_pennysaved",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 6 then
            return {
            key = "j_lexmod_curseof3s",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 7 then
            return {
            key = "j_lexmod_gooberjoker",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 8 then
            return {
            key = "j_lexmod_mart",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 9 then
            return {
            key = "j_lexmod_tokagashi",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 10 then
            return {
            key = "j_lexmod_nuclearwarhead",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 11 then
            return {
            key = "j_lexmod_swagmessiah",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 12 then
            return {
            key = "j_lexmod_temptation",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 13 then
            return {
            key = "j_lexmod_rubisanag",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 14 then
            return {
            key = "j_lexmod_ribsley",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 15 then
            return {
            key = "j_lexmod_hemaglobis",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 16 then
            return {
            key = "j_lexmod_yellowfrog",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 17 then
            return {
            key = "j_lexmod_thecreature",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 18 then
            return {
            key = "j_lexmod_toad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 19 then
            return {
            key = "j_lexmod_goose",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 20 then
            return {
            key = "j_lexmod_oldman",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 21 then
            return {
            key = "j_lexmod_sketch",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 22 then
            return {
            key = "j_lexmod_odysseus",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 23 then
            return {
            key = "j_lexmod_spectre",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 24 then
            return {
            key = "j_lexmod_redborg",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 25 then
            return {
            key = "j_lexmod_cobalt",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 26 then
            return {
            key = "j_lexmod_alexchad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 27 then
            return {
            key = "j_lexmod_sishiandkutaro",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 28 then
            return {
            key = "j_lexmod_cursedsoul",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 29 then
            return {
            key = "j_lexmod_witchdoctor",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 30 then
            return {
            key = "j_lexmod_backyardburn",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        elseif selected_index == 31 then
            return {
            key = "j_lexmod_twentysideddie",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack2"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("5beafb"))
        ease_background_colour({ new_colour = HEX('5beafb'), special_colour = HEX("6f1f1f"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}


SMODS.Booster {
    key = 'lex_mod_buffoon_pack1',
    loc_txt = {
        name = "Lex Mod Buffoon Pack",
        text = {
            "Choose 1 of up to 3 Joker cards",
            "from Lex's Mod!"
        },
        group_name = "Lex Mod Buffoon Pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 8,
    weight = 0.3,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            0.5,
            0.5,
            1.4,
            0.5,
            0.5,
            0.2,
            0.5,
            0.5,
            0.5,
            0.2,
            0.2,
            0.5,
            0.5,
            1.4,
            0.5,
            1.4,
            1.4,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5,
            0.5,
            0.5,
            1.4,
            0.2,
            0.2,
            0.2,
            0.5,
            0.5,
            0.5
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('lexmod_lex_mod_buffoon_pack1_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
            key = "j_lexmod_lexuigi",
            set = "Joker",
            rarity = "lexmod_curse",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 2 then
            return {
            key = "j_lexmod_hex",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 3 then
            return {
            key = "j_lexmod_cjamiam",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 4 then
            return {
            key = "j_lexmod_puffinuff",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 5 then
            return {
            key = "j_lexmod_pennysaved",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 6 then
            return {
            key = "j_lexmod_curseof3s",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 7 then
            return {
            key = "j_lexmod_gooberjoker",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 8 then
            return {
            key = "j_lexmod_mart",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 9 then
            return {
            key = "j_lexmod_tokagashi",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 10 then
            return {
            key = "j_lexmod_nuclearwarhead",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 11 then
            return {
            key = "j_lexmod_swagmessiah",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 12 then
            return {
            key = "j_lexmod_temptation",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 13 then
            return {
            key = "j_lexmod_rubisanag",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 14 then
            return {
            key = "j_lexmod_ribsley",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 15 then
            return {
            key = "j_lexmod_hemaglobis",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 16 then
            return {
            key = "j_lexmod_yellowfrog",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 17 then
            return {
            key = "j_lexmod_thecreature",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 18 then
            return {
            key = "j_lexmod_toad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 19 then
            return {
            key = "j_lexmod_goose",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 20 then
            return {
            key = "j_lexmod_oldman",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 21 then
            return {
            key = "j_lexmod_sketch",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 22 then
            return {
            key = "j_lexmod_odysseus",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 23 then
            return {
            key = "j_lexmod_spectre",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 24 then
            return {
            key = "j_lexmod_redborg",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 25 then
            return {
            key = "j_lexmod_cobalt",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 26 then
            return {
            key = "j_lexmod_alexchad",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 27 then
            return {
            key = "j_lexmod_sishiandkutaro",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 28 then
            return {
            key = "j_lexmod_cursedsoul",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 29 then
            return {
            key = "j_lexmod_witchdoctor",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 30 then
            return {
            key = "j_lexmod_backyardburn",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        elseif selected_index == 31 then
            return {
            key = "j_lexmod_twentysideddie",
            set = "Joker",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "lexmod_lex_mod_buffoon_pack1"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("fbd608"))
        ease_background_colour({ new_colour = HEX('fbd608'), special_colour = HEX("151515"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
    end,
}
