local servers = { "lua_ls", "gopls", "rust_analyzer", "clangd", "pyright", "arduino_language_server" }

-- Native LSP Configs
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } }, workspace = { checkThirdParty = false } } },
})

vim.lsp.config("arduino_language_server", {
  cmd = {
    "arduino-language-server",
    "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
    "-fqbn", "arduino:avr:uno",
  },
})

vim.lsp.enable(servers)

-- Treesitter Setup
local ts_status, ts_configs = pcall(require, "nvim-treesitter.configs")
if ts_status then
  ts_configs.setup({
    ensure_installed = { "lua", "go", "rust", "c", "cpp", "python", "arduino", "markdown", "vimdoc" },
    highlight = { enable = true },
  })
end

-- Conform Setup
local conform_status, conform = pcall(require, "conform")
if conform_status then
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt", "goimports" },
      rust = { "rustfmt" },
    },
    format_on_save = { timeout_ms = 750, lsp_format = "fallback" },
  })
end

-- Telescope & LSP Mappings
local tele_status, telescope = pcall(require, "telescope.builtin")
if tele_status then
  vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then return end

      -- 1. Explicitly hook Neovim's engine to use the LSP's data source
      vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      vim.lsp.completion.enable(true, client.id, args.buf, { autoTrigger = true })

      -- 2. Clean, high-performance character-type listener for instant dropdowns
      local group = vim.api.nvim_create_augroup("LspCompletionAutoPopup", { clear = false })
      vim.api.nvim_create_autocmd({ "TextChangedI", "InsertCharPre" }, {
        group = group,
        buffer = args.buf,
        callback = function()
          if vim.fn.pumvisible() == 1 then return end

          local col = vim.fn.col(".")
          local line = vim.fn.getline(".")
          local char = line:sub(col - 1, col - 1)

          -- Termux optimization: Only trigger auto-popup on exact punctuation signals,
          -- otherwise wait for manual triggers to protect mobile CPU & battery.
          if vim.g.is_termux then
            if char == "." or char == ":" then
              vim.schedule(function()
                pcall(vim.api.nvim_feedkeys, vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true), "n", true)
              end)
            end
          else
            -- Desktop: Trigger on any word character or punctuation
            if char:match("%w") or char == "." or char == ":" then
              vim.schedule(function()
                pcall(vim.api.nvim_feedkeys, vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true), "n", true)
              end)
            end
          end
        end,
      })

      -- 3. Bind standard Telescope mappings to your active buffer
      local opts = { buffer = args.buf }
      local telescope = require("telescope.builtin")
      vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
      vim.keymap.set("n", "gr", telescope.lsp_references, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end,
  })
end
