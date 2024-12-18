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
						card = self,
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
						card = self,
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
						card = self,
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
						card = self,
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
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.Xmult, card.ability.extra.Xmult_mod}}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			if context.other_card:get_id() == 3 and not context.blueprint then
				card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
					return {
							extra = {focus = card, message = localize('k_upgrade_ex')},
                            card = self,
                            colour = G.C.MULT
                        }
                end
			end
			
		if context.joker_main then
				return {
					card = self,
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
						card = self,
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
				'If it was beat in one hand'
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
		name = 'Hekikomori',
			text = {
				'{X:mult,C:white}X#1#{} Mult if played hand',
				'has only one card.'
				}
			},
	atlas = 'jokers',
	pos = {x = 2, y = 0},
	config = { extra = {
		Xmult = 2
	}
},
	cost = 4,
	rarity = 1,
	blueprint_compat = true,
	loc_vars = function(self,info_queue,center)
		return {vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self,card,context)
		if context.joker_main and #context.full_hand == 1 then
				return {
					card = self,
					Xmult_mod = card.ability.extra.Xmult,
					message = 'X' .. card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
		end
} 

