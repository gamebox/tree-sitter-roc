local M = {}

function M.setup()
	-- add roc tree-sitter
	local parsers = require("nvim-treesitter.parsers").get_parser_configs()

	parsers.roc = {
		install_info = {
			url = "https://github.com/faldor20/tree-sitter-roc",
			files = { "src/parser.c", "src/scanner.c" },
		},
	}

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
		pattern = { "*.roc" },
		command = "set filetype=roc",
	})

	local ok, ft = pcall(require, "filetype")
	if ok then
		ft.setup({
			overrides = {
				extensions = {
					roc = "roc",
				},
			},
		})
	end
end

return M
