SMODS.ConsumableType { 
    key = 'food',
    collection_rows = { 3,4 },
    secondary_colour = HEX("EC2D33"),
    primary_colour = HEX("F6F0D5"),
    loc_txt = {
        collection = 'Refreshment cards',
        name = 'Refreshment',
        label = 'Refreshment',
        undiscovered = {
			name = "Not Discovered",
			text = {
				"Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
			},
		},
    },
	shop_rate = 0.5
}

SMODS.UndiscoveredSprite{
	key = "food",
	atlas = "food",
	pos = { x = 0, y = 2 }
}

SMODS.Booster{
        key = 'food_basic1',
        config = {extra = 2, choose = 1},
        atlas = 'food',
        cost = 4,
        weight = 0.8,
		loc_txt = {
        ['en-us'] = {
            name = 'Taste Pack',
            text = {
                "Choose {C:attention}#1#{} of up to",
				"{C:attention}#2#{C:red} Refreshment{} cards to",
				"add to consumables"
            }
        }
	},
        pos = { x = 2, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.food)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.food, special_colour = G.C.BLACK, contrast = 1 })
        end,
        create_card = function(self, card)
            return create_card("food", G.pack_cards, nil, nil, true, true, nil, "food")
        end,
        group_key = "food_pack",
}

SMODS.Booster{
        key = 'food_jumbo',
        config = {extra = 4, choose = 1},
        atlas = 'food',
        cost = 6,
        weight = 0.8,
		loc_txt = {
        ['en-us'] = {
            name = 'Jumbo Taste Pack',
            text = {
                "Choose {C:attention}#1#{} of up to",
				"{C:attention}#2#{C:red} Refreshment{} cards to",
				"add to consumables"
            }
        }
	},
        pos = { x = 1, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.food)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.food, special_colour = G.C.BLACK, contrast = 1 })
        end,
        create_card = function(self, card)
            return create_card("food", G.pack_cards, nil, nil, true, true, nil, "food")
        end,
        group_key = "food_pack",
}

SMODS.Booster{
        key = 'food_mega',
        config = {extra = 4, choose = 2},
        atlas = 'food',
        cost = 8,
        weight = 0.8,
		loc_txt = {
        ['en-us'] = {
            name = 'Mega Taste Pack',
            text = {
                "Choose {C:attention}#1#{} of up to",
				"{C:attention}#2#{C:red} Refreshment{} cards to",
				"add to consumables"
            }
        }
	},
        pos = { x = 1, y = 2 },
        loc_vars = function(self, info_queue, card)
            return {vars = {card.config.center.config.choose, card.ability.extra}}
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.SECONDARY_SET.food)
            ease_background_colour({ new_colour = G.C.SECONDARY_SET.food, special_colour = G.C.BLACK, contrast = 1 })
        end,
        create_card = function(self, card)
            return create_card("food", G.pack_cards, nil, nil, true, true, nil, "food")
        end,
        group_key = "food_pack",
}

SMODS.Consumable{
    key = 'milk',
    set = 'food',
    atlas = 'food',
    pos = { x = 2, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Milk',
            text = {
                '{C:blue}+#1#{} Hands'
            }
        }
	},
	config = {extra = 2},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra} }
    end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		 G.E_MANAGER:add_event(Event({func = function()
				card:juice_up(0.3, 0.5)
                ease_hands_played(card.ability.extra)
            return true end }))
		delay(0.6)
	end
}

SMODS.Consumable{
    key = 'wine',
    set = 'food',
    atlas = 'food',
    pos = { x = 1, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Red Wine',
            text = {
                '{C:red}+#1#{} Discards'
            }
        }
	},
	config = {extra = 3},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra} }
    end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.3, 0.5)
                    ease_discard(card.ability.extra)
        return true end }))
		delay(0.6)
	end
}

SMODS.Consumable{
    key = 'bread',
    set = 'food',
    atlas = 'food',
    pos = { x = 0, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Bread Sticks',
            text = {
                'Decreases current blind by 15%'
            }
        }
	},
	config = {extra = 0.15},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra} }
    end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({func = function()
				card:juice_up(0.3, 0.5)
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1-card.ability.extra))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                play_sound('timpani')
			return true 
		end }))
		delay(0.6)
	end
}

SMODS.Consumable{
    key = 'donut',
    set = 'food',
    atlas = 'food',
    pos = { x = 3, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Doughnut',
            text = {
                'All played cards are retriggered', 'until the end of the round'
            }
        }
	},
	config = {extra = {active = false}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.active} }
    end,
	-- Card stays
	keep_on_use = function(self, card)
            return true
        end,
	-- The fella cannot be used again
	can_use = function(self, card)
		return not card.ability.extra.active
	end,
	--sets active to true
	use = function(self, card, area, copier)
		card.ability.extra.active = true
		local eval = function(card) return card.ability.extra.active end
		juice_card_until(card, eval, true)
	end,

	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and card.ability.extra.active then
				return {
						message = localize('k_again_ex'),
						repetitions = 1,
						card = card
					}
		end
		if context.end_of_round and not context.repetition and not context.individual and not card.getting_sliced and card.ability.extra.active then
			card.getting_sliced = true
                 G.E_MANAGER:add_event(Event({
                                func = function()
                                    play_sound('tarot1')
                                    card.T.r = -0.2
                                    card:juice_up(0.3, 0.4)
                                    card.states.drag.is = true
                                    card.children.center.pinch.x = true
                                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                        func = function()
                                                G.jokers:remove_card(card)
                                                card:remove()
                                            return true; end})) 
                                    return true
                                end
                            }))
							return {
                                message = localize('k_eaten_ex'),
                                colour = G.C.FILTER
                            }
		end
	end
}

SMODS.Consumable{
    key = 'macarons',
    set = 'food',
    atlas = 'food',
    pos = { x = 4, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Macarons',
            text = {
                'Gives a {C:attention}#1#'
            }
        }
	},
	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_TAGS.tag_juggle
        return { vars = { localize{type = 'name_text', set = 'Tag', key = 'tag_juggle', nodes = {}}}}
    end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
                    func = (function()
						card:juice_up(0.3, 0.5)
                        add_tag(Tag('tag_juggle'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                    end)
                }))
		delay(0.6)
    end
}

--[[SMODS.Consumable{
    key = 'rarejokers',
    set = 'food',
    atlas = 'food',
    pos = { x = 0, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'rare jokers',
            text = {
                'Creates a Random',
				'Perishable {C:red}Rare{C:attention} Joker{}',
				'{C:inactive}(Must have room)'
            }
        }
	},
	loc_vars = function(self, info_queue, center)
        return { vars = {}}
    end,
	can_use = function(self, card)
		return G.jokers.config.card_limit > #G.jokers.cards
	end,
	use = function(self, card, area, copier)
		local jokers_to_create = 1
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                G.E_MANAGER:add_event(Event({
                    func = function() 
						for i = 1, jokers_to_create do
							local _card = create_card('Joker', G.jokers, nil, 0.99, nil, nil, nil, 'food')
                            _card:add_to_deck()
                            G.jokers:emplace(_card)
                            _card:start_materialize()
                            G.GAME.joker_buffer = 0
							_card:set_perishable(_perishable)
							_card.ability.perish_tally = G.GAME.perishable_rounds
						end
                        return true
                    end}))
			delay(0.6)
		end
}]]

SMODS.Consumable{
    key = 'strudel',
    set = 'food',
    atlas = 'food',
    pos = { x = 0, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Toaster Srudels',
            text = {
                'Immediately draws {C:attention}#1#{} cards',
				'{C:inactive}(Ignores hand size)'
            }
        }
	},
	config = {extra = 5},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra} }
    end,
	can_use = function(self, card)
		return G.STATE == G.STATES.SELECTING_HAND
	end,
	use = function(self, card, area, copier)
		delay(0.6)
		G.E_MANAGER:add_event(Event({
            func = (function()
				card:juice_up(0.3, 0.5)
                return true
            end)
        }))
		G.FUNCS.draw_from_deck_to_hand(card.ability.extra)
		delay(0.6)
    end
}

SMODS.Consumable{
    key = 'water',
    set = 'food',
    atlas = 'food',
    pos = { x = 0, y = 0 },
    cost = 3,
    loc_txt = {
        ['en-us'] = {
            name = 'Sparkling Water',
            text = {
                'All played cards are scored',
				'and extra cards are',
				'{C:attention}retriggered{} until the',
				'end of the round'
            }
        }
	},
	config = {extra = {active = false}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.active} }
    end,
	keep_on_use = function(self, card)
            return true
        end,
	can_use = function(self, card)
		return not card.ability.extra.active
	end,
	use = function(self, card, area, copier)
		card.ability.extra.active = true
		local eval = function(card) return card.ability.extra.active end
		juice_card_until(card, eval, true)
		Sparklingwateractive = true
	end,
	calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and card.ability.extra.active then
			if cardsplashed(context.other_card) == true then
				return {
						message = localize('k_again_ex'),
						repetitions = 1,
						card = card
					}
			end
		end
		if context.selling_self then
			Sparklingwateractive = false
		end
		if context.end_of_round and not context.repetition and not context.individual and not card.getting_sliced and card.ability.extra.active then
			card.getting_sliced = true
			Sparklingwateractive = false
                 G.E_MANAGER:add_event(Event({
                                func = function()
                                    play_sound('tarot1')
                                    card.T.r = -0.2
                                    card:juice_up(0.3, 0.4)
                                    card.states.drag.is = true
                                    card.children.center.pinch.x = true
                                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                        func = function()
                                                G.jokers:remove_card(card)
                                                card:remove()
                                            return true; end})) 
                                    return true
                                end
                            }))
							return {
                                message = localize('k_eaten_ex'),
                                colour = G.C.FILTER
                            }
			end
		end
}

if Sparklingwateractive then 
	scoring_hand[i] = G.play.cards[i]
end

-- code taken from DreadJokers with permission to allow consumables to be added to the consumable slot directly
    G.FUNCS.can_reserve_card = function(e)
        if #G.consumeables.cards < G.consumeables.config.card_limit then
          e.config.colour = G.C.GREEN
          e.config.button = "reserve_card"
        else
          e.config.colour = G.C.UI.BACKGROUND_INACTIVE
          e.config.button = nil
        end
      end
      G.FUNCS.reserve_card = function(e)
        local c1 = e.config.ref_table
        G.E_MANAGER:add_event(Event({
          trigger = "after",
          delay = 0.1,
          func = function()
            c1.area:remove_card(c1)
            c1:add_to_deck()
            if c1.children.price then
              c1.children.price:remove()
            end
            c1.children.price = nil
            if c1.children.buy_button then
              c1.children.buy_button:remove()
            end
            c1.children.buy_button = nil
            remove_nils(c1.children)
            G.consumeables:emplace(c1)
            G.GAME.pack_choices = G.GAME.pack_choices - 1
            if G.GAME.pack_choices <= 0 then
              G.FUNCS.end_consumeable(nil, delay_fac)
            end
            return true
          end,
        }))
      end
	  local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
      function G.UIDEF.use_and_sell_buttons(card)
        if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
          if card.ability.set == "food" then
            return {
              n = G.UIT.ROOT,
              config = { padding = -0.1, colour = G.C.CLEAR },
              nodes = {
                {
                  n = G.UIT.R,
                  config = {
                    ref_table = card,
                    r = 0.08,
                    padding = 0.1,
                    align = "bm",
                    minw = 0.5 * card.T.w - 0.15,
                    minh = 0.7 * card.T.h,
                    maxw = 0.7 * card.T.w - 0.15,
                    hover = true,
                    shadow = true,
                    colour = G.C.UI.BACKGROUND_INACTIVE,
                    one_press = true,
                    button = "use_card",
                    func = "can_reserve_card",
                  },
                  nodes = {
                    {
                      n = G.UIT.T,
                      config = {
                        text = "Take",
                        colour = G.C.UI.TEXT_LIGHT,
                        scale = 0.55,
                        shadow = true,
                      },
                    },
                  },
                },
              },
            }
          end
        end
        return G_UIDEF_use_and_sell_buttons_ref(card)
      end