SMODS.Back({
	key = "platter", 
	atlas = "placeholders",
	pos = {x = 4, y = 2}, 
	config = {consumable_slot = 2, joker_slot = -1}, 
	loc_txt = {
        ['en-us'] = {
            name = 'Platter Deck',
            text = {
                '{C:attention}+2{} Consumable Slots.',
				'{C:red}-1{} Joker Slot.'
            }
        }
	},
	loc_vars = function(self, info_queue, card)
        return {vars = {self.config.consumable_slot, self.config.joker_slot}}
    end
})