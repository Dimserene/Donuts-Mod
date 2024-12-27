SMODS.Joker{
	key = 'thedud',
	loc_txt = {
		name = 'The Dud',
			text = {
				'{C:chips}+#1#{} Chips.',
				'{C:inactive} Art by hatstack.'
				}
			},
	atlas = 'jokers',
	pos = {x = 1, y = 0},
	config = { extra = {
		chips = 3
	}
},
	cost = 1,
	rarity = 1,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.chips}}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
				return {
					card = card,
					message = '+' .. card.ability.extra.chips,
                    chip_mod = card.ability.extra.chips, 
                    colour = G.C.CHIPS
				}
			end
		end
} 

SMODS.Joker{
	key = 'croissant',
	loc_txt = {
		name = 'Croissants',
			text = {
				'Scored {C:spades}Spades{} give {C:mult}#1#{} Mult.',
				'Reduces by {C:mult}#2#{} Mult every hand.'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 0},
	config = { extra = {
		mult = 10,
		mult_mod = 1
		}
	},
	cost = 3,
	rarity = 1,
	eternal_compat = false,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Spades") then
                    return {
						card = card,
                        mult = card.ability.extra.mult,
						colour = G.C.MULT
                    }
			end
		end
		if context.after and not context.blueprint then
			if card.ability.extra.mult - 1 <= 0 then
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
                        else 
                            card.ability.extra.mult = card.ability.extra.mult - 1
                            return {
								focus = card, 
								message = '-' .. card.ability.extra.mult_mod,
                                colour = G.C.MULT
                            }
                        end
                    end
				end
}

SMODS.Joker{
	key = 'cupcake',
	loc_txt = {
		name = 'Cupcakes',
			text = {
				'Scored {C:hearts}Hearts{} give {C:mult}#1#{} Mult.',
				'Reduces by {C:mult}#2#{} Mult every hand.'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 0},
	config = { extra = {
		mult = 10,
		mult_mod = 1
		}
	},
	cost = 3,
	rarity = 1,
	eternal_compat = false,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Hearts") then
                    return {
						card = card,
                        mult = card.ability.extra.mult,
						colour = G.C.MULT,
                    }
			end
		end
		if context.after and not context.blueprint then
			if card.ability.extra.mult - 1 <= 0 then
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
                        else 
                            card.ability.extra.mult = card.ability.extra.mult - 1
                            return {
								focus = card, 
								message = '-' .. card.ability.extra.mult_mod,
                                colour = G.C.MULT
                            }
                        end
                    end
				end
}

SMODS.Joker{
	key = 'fairybread',
	loc_txt = {
		name = 'Fairybread',
			text = {
				'Scored {C:diamonds}Diamonds{} give {C:mult}#1#{} Mult.',
				'Reduces by {C:mult}#2#{} Mult every hand.'
				}
			},
	atlas = 'jokers',
	pos = {x = 5, y = 0},
	config = { extra = {
		mult = 10,
		mult_mod = 1
		}
	},
	cost = 3,
	rarity = 1,
	eternal_compat = false,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Diamonds") then
                    return {
						card = card,
                        mult = card.ability.extra.mult,
						colour = G.C.MULT,
                    }
			end
		end
		if context.after and not context.blueprint then
			if card.ability.extra.mult - 1 <= 0 then
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
                        else 
                            card.ability.extra.mult = card.ability.extra.mult - 1
                            return {
								focus = card, 
								message = '-' .. card.ability.extra.mult_mod,
                                colour = G.C.MULT
                            }
                        end
                    end
				end
}

SMODS.Joker{
	key = 'doughnut',
	loc_txt = {
		name = 'Doughnuts',
			text = {
				'Scored {C:clubs}Clubs{} give {C:mult}#1#{} Mult.',
				'Reduces by {C:mult}#2#{} Mult every hand.'
				}
			},
	atlas = 'jokers',
	pos = {x = 4, y = 0},
	config = { extra = {
		mult = 10,
		mult_mod = 1
		}
	},
	cost = 3,
	rarity = 1,
	eternal_compat = false,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.mult, card.ability.extra.mult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:is_suit("Clubs") then
                    return {
						card = card,
                        mult = card.ability.extra.mult,
						colour = G.C.MULT,
                    }
			end
		end
		if context.after and not context.blueprint then
			if card.ability.extra.mult - 1 <= 0 then
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
                        else 
                            card.ability.extra.mult = card.ability.extra.mult - 1
                            return {
								focus = card, 
								message = '-' .. card.ability.extra.mult_mod,
                                colour = G.C.MULT
                            }
                        end
                    end
				end
}

SMODS.Joker{
	key = 'triangle',
	loc_txt = {
		name = 'Impossible Triangle',
			text = {
				'This Joker gains',
				'{X:mult,C:white}X#2#{} Mult when each',
				'played {C:attention}3{} is scored.',
				'{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)'
				}
			},
	atlas = 'jokers',
	pos = {x = 1, y = 4},
	config = { extra = {
		Xmult = 1,
		Xmult_mod = 0.1
	}
},
	cost = 8,
	rarity = 3,
	blueprint_compat = true,
	perishable_compat = false,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 3 and not context.blueprint then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
					return {
							extra = {focus = card, message = localize('k_upgrade_ex')},
                            card = card,
                            colour = G.C.MULT
                        }
                end
			end
			
		if context.joker_main then
				return {
					card = card,
					Xmult_mod = card.ability.extra.Xmult,
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
		end
} 

SMODS.Joker{
	key = 'telephone',
	loc_txt = {
		name = 'Telephone',
			text = {
				'{X:chips,C:white} X#1# {} Chips if played',
				'hand does not contain',
				'{C:attention}face cards{} or {C:attention}10s{}.'
				}
			},
	atlas = 'jokers',
	pos = {x = 3, y = 0},
	config = { extra = {
		x_chips = 2
	}
},
	cost = 5,
	rarity = 1,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.x_chips}}
	end,
	calculate = function(self,card,context)
			if context.joker_main and context.cardarea == G.jokers then
				local faces = false
				card = card
                        for i = 1, #context.scoring_hand do
                            if context.scoring_hand[i]:is_face() or context.full_hand[i]:get_id() == 10 then faces = true  
								end
							end
                    if not faces then
					return {
						card = card,
						Xchip_mod = card.ability.extra.x_chips,
						message = 'X' .. card.ability.extra.x_chips,
						colour = G.C.CHIPS
					}
				end
			end
		end
} 

SMODS.Joker{
	key = 'doubledice',
	loc_txt = {
		name = 'Double Dice',
			text = {
				'Every played card has',
				'a {C:green}#1# in #2#{} chance',
				'to retrigger.'
				}
			},
	atlas = 'jokers',
	pos = {x = 1, y = 2},
	config = { extra = {
		odds = 2,
		repetitions = 1
	}
},
	cost = 7,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
	end,
	calculate = function(self,card,context)
		if context.cardarea == G.play and context.repetition then
			if pseudorandom('doubledice') < G.GAME.probabilities.normal / card.ability.extra.odds then
					return {
							message = localize('k_again_ex'),
							repetitions = card.ability.extra.repetitions,
							card = card
					}
			end
		end
	end
} 

SMODS.Joker{
	key = 'speedrunner',
	loc_txt = {
		name = 'Speedrunner',
			text = {
				'Earn {C:money}$#1#{} at the end of round',
				'If it was beat in one hand.'
				}
			},
	atlas = 'jokers',
	pos = {x = 2, y = 2},
	config = { extra = 8 },
	cost = 7,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra}}
	end,
	calc_dollar_bonus = function(self, card, context)
		if G.GAME.current_round.hands_played <= 1 then
            return card.ability.extra
        end
	end
} 

SMODS.Joker{
	key = 'omori',
	loc_txt = {
		name = 'Hikikomori',
			text = {
				'{X:mult,C:white}X#1#{} Mult if played hand',
				'has only {C:attention}#2#{} card.'
				}
			},
	atlas = 'jokers',
	pos = {x = 2, y = 0},
	config = { extra = {
		Xmult = 2,
		cards = 1
	}
},
	cost = 4,
	rarity = 1,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,center)
		return {vars = {card.ability.extra.Xmult, card.ability.extra.cards}}
	end,
	calculate = function(self,card,context)
		if context.joker_main and #context.full_hand == card.ability.extra.cards then
				return {
					card = card,
					Xmult_mod = card.ability.extra.Xmult,
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
		end
} 

SMODS.Joker{
	key = 'formrod',
	loc_txt = {
		name = 'Form Rod',
			text = {
				'Every {C:attention}2{} or {C:attention}Ace{} gives',
				'{C:money}$#1#{} when scored.'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 0},
	config = { extra = 1
},
	cost = 6,
	rarity = 1,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 2 or context.other_card:get_id() == 14 then
				G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                    return {
                        dollars = card.ability.extra,
                        card = card
                    }
			end
		end
	end
} 

SMODS.Joker{
	key = 'honeyjar',
	loc_txt = {
		name = 'Jar-O-Honey',
			text = {
				'Earn {C:money}$#1#{} at the end of round.',
				'Reduces by {C:money}$#2#{} when a card is bought.'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 2},
	config = { extra = {dollars = 10, dollars_mod = 1}},
	cost = 7,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.dollars, card.ability.extra.dollars_mod}}
	end,
	calculate = function(self,card,context)
		if context.buying_card == true and not context.blueprint then 
			card.ability.extra.dollars = card.ability.extra.dollars - card.ability.extra.dollars_mod
				card_eval_status_text(
					card,
					"extra",
					nil,
					nil,
					nil,
						{
							message = '-' .. card.ability.extra.dollars_mod,
							colour = G.C.MONEY
						}
					)
				if card.ability.extra.dollars <= 0 and not context.blueprint then
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
			end
		end
	end,
	calc_dollar_bonus = function(self, card, context)
        return card.ability.extra.dollars
	end
} 

SMODS.Joker{
	key = 'boxofchocolates',
	loc_txt = {
		name = 'Box Of Chocolates',
			text = {
				'Create a random {C:attention}consumeable card{}',
				'when {C:attention}Blind{} is selected',
				'for the next {C:attention}#1#{} rounds.',
				'{C:inactive}(Must have room.)'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 2},
	config = { extra = 6 },
	cost = 1,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra}}
	end,
	calculate = function(self,card,context)
		if context.blind == G.GAME.round_resets.blind then
			card.ability.extra = card.ability.extra - 1
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                local card = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, nil, 'choco')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))   
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = card.ability.extra..'', colour = G.C.FILTER})      
                        return true
                    end)}))
				if card.ability.extra <= 0 and not context.blueprint then
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
	end
} 

SMODS.Joker{
	key = 'imalwaysright',
	loc_txt = {
		name = "I'm Always Right",
			text = {
				'Retriggers {C:attention}last card{} {C:attention}#1#{} times',
				'if hand has {C:attention}#2# or less{} cards.',
				'Retriggers {C:attention}last 2{} cards {C:attention}#1#{} times',
				'if hand has {C:attention}#3# or more{} cards'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 2},
	config = { extra = {
		repetitions = 2,
		onerepeat = 3,
		tworepeat = 4
	}
},
	cost = 7,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.repetitions, card.ability.extra.onerepeat, card.ability.extra.tworepeat}}
	end,
	calculate = function(self,card,context)
		if context.cardarea == G.play then
		local i = #context.scoring_hand
		local j = #context.scoring_hand - 1
			if context.repetition then
				if #context.scoring_hand <= card.ability.extra.onerepeat then
					if (context.other_card == context.scoring_hand[i]) then
						return {
							message = localize('k_again_ex'),
							repetitions = card.ability.extra.repetitions,
							card = card
						}
					end
				end
				if #context.scoring_hand >= card.ability.extra.tworepeat then
					if (context.other_card == context.scoring_hand[i]) or (context.other_card == context.scoring_hand[j]) then
						return {
							message = localize('k_again_ex'),
							repetitions = card.ability.extra.repetitions,
							card = card
						}
					end
				end
			end
		end
	end
} 

SMODS.Joker{
	key = 'blacktie',
	loc_txt = {
		name = 'Black Tie',
			text = {
				'{C:diamonds}Diamonds{} are considered {C:spades}Spades{} and {C:clubs}Clubs{}'
				}
			},
	atlas = 'jokers',
	pos = {x = 3, y = 2},
	config = {
},
	cost = 6,
	rarity = 2,
	blueprint_compat = false
} 

--Actually makes Diamonds considered Spades or Clubs
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if flush_calc then
		print('woo')
		if next(find_joker('j_dnm_blacktie')) and self.base.suit == 'Diamonds' and (suit == 'Spades' or suit == 'Clubs') then
			print('yeah') --random little tidbit, when I was working on this Joker I was struggling a bit and used prints to make sure the if statements actually worked. The console spammed woo yeah when this Joker finally worked LMAO. I'm not removing these
			return true
		end
		return self.base.suit == suit
	else
        if self.debuff and not bypass_debuff then return end
		if next(find_joker('j_dnm_blacktie')) and self.base.suit == 'Diamonds' and (suit == 'Spades' or suit == 'Clubs') then
			return true
		end
		return self.base.suit == suit
	end
end

--[[SMODS.Joker{
	key = 'scales',
	loc_txt = {
		name = 'Tip The Scales',
			text = {
				'Earn {C:money}$#1#{} at the end of round',
				'If scored chips are greater'
				'than %120 of the current blind.'
				}
			},
	atlas = 'jokers',
	pos = {x = 2, y = 2},
	config = { extra = 10 },
	cost = 7,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra}}
	end,
	calc_dollar_bonus = function(self, card, context)
		if G.GAME.current_round.hands_played <= 1 then
            return card.ability.extra
        end
	end
}]]

--[[SMODS.Joker{
	key = 'microscope',
	loc_txt = {
		name = 'Microscope',
			text = {
				'Increases {C:attention}rank{} of any scored',
				'{C:attention}2, 3, 4,{} or {C:attention}5{} by {C:attention}#1#{}'
				}
			},
	atlas = 'jokers',
	pos = {x = 0, y = 2},
	config = { extra = 1 },
	cost = 5,
	rarity = 2,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra}}
	end,
	calculate = function(self,card,context)
		if context.after then
			if context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5 then
				G.E_MANAGER:add_event(Event({
					trigger = 'after', 
					delay = 0.3,
					blockable = false,
					func = function()
							assert(SMODS.change_base(context.other_card, nil, new_rank))
							local rank_data = SMODS.Ranks[context.other_card.base.value]
							local behavior = rank_data.strength_effect or { fixed = 1, ignore = false, random = false } local new_rank
							local ii = (behavior.fixed and rank_data.next[behavior.fixed]) and behavior.fixed or 1
							local new_rank = rank_data.next[ii]
							card:juice_up() 
					return true end
				}))
				card_eval_status_text(card, 'extra', nil, nil, nil, {message = 'Rank Up!', colour = G.C.MONEY, instant = true})
			end
		end
	end
}]]