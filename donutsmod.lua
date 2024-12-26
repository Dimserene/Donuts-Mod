assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/food.lua"))()
assert(SMODS.load_file("items/deck.lua"))()

Sparklingwateractive = false

function cardsplashed(card)
        local _,_,_,scoring_hand,_ = G.FUNCS.get_poker_hand_info(G.play.cards)
        for _, scored_card in ipairs(scoring_hand) do
            if scored_card == card then
                return false
            end
        end
        return true
    end

SMODS.Atlas{
	key = 'placeholders',
	path = 'placeholders.png',
	px = 71,
	py = 95
}

SMODS.Atlas{
	key = 'jokers',
	path = 'jokers.png',
	px = 71,
	py = 95
}

SMODS.Atlas{
	key = 'food',
	path = 'food.png',
	px = 71,
	py = 95
}

SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 34,
    py = 34
}

SMODS.current_mod.extra_tabs = function()
  local scale = 0.75
  return {
    label = 'Credits',
    tab_definition_function = function()
      return {
        n = G.UIT.ROOT,
        config = {
          align = "cm",
          padding = 0.05,
          colour = G.C.CLEAR,
        },
        nodes = {
		{
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Lead Developer and Artist: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "BetterDonutGalaxy",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
			}
        },
		{
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
			nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Other Programmers: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "LunaAstraCassiopeia, Maratby",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
		},
		{
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
			nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Other Artist: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "Hatstack",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
						}
					}
				}
			},
		{
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Assistance and special thanks: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "Balatro Community Discord",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
			} 
        }
        }
      }
    end
  }
end
