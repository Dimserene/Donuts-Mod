SMODS.Enhancement{
	key = 'brittle',
	atlas = 'placeholders',
	discovered = true,
	pos = { x = 2, y = 2 },
	config = {},
	loc_vars = function(self,info_queue,center)
		return {vars = {}}
	end,
	loc_txt = {
        ['en-us'] = {
            name = 'Brittle',
            text = {
                'Card is destroyed',  'after being played'
            }
        }
    },
	calculate = function(self,card,context)
		if context.cardarea == G.play then
			destroyed = true
		end
	end
}