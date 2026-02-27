return {
	{
		"rcarriga/nvim-notify",
		-- A very high priority to ensure it loads first
		priority = 1000,
		opts = {
			-- Your custom options here
			background_colour = "#000000",
		},
		config = function(_, opts)
			-- Setup the plugin with your options
			require("notify").setup(opts)
			-- This is the key line to make nvim-notify the default
			vim.notify = require("notify")
		end,
	},
}
