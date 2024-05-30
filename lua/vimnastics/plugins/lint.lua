return {
    { -- Linting
        'mfussenegger/nvim-lint',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lint = require 'lint'
            lint.linters_by_ft = lint.linters_by_ft or {}

            -- lint.linters_by_ft['markdown'] = { 'markdownlint' }

            -- default
            -- {
            --   clojure = { "clj-kondo" },
            --   dockerfile = { "hadolint" },
            --   inko = { "inko" },
            --   janet = { "janet" },
            --   json = { "jsonlint" },
            --   markdown = { "vale" },
            --   rst = { "vale" },
            --   ruby = { "ruby" },
            --   terraform = { "tflint" },
            --   text = { "vale" }
            -- }

            lint.linters_by_ft['clojure'] = nil
            lint.linters_by_ft['dockerfile'] = nil
            lint.linters_by_ft['inko'] = nil
            lint.linters_by_ft['janet'] = nil
            lint.linters_by_ft['json'] = nil
            lint.linters_by_ft['rst'] = nil
            lint.linters_by_ft['ruby'] = nil
            lint.linters_by_ft['terraform'] = nil
            lint.linters_by_ft['text'] = nil

            local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
                group = lint_augroup,
                callback = function()
                    require('lint').try_lint()
                end,
            })
        end,
    },
}
