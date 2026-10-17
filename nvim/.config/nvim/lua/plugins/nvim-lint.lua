local lint = require('lint')
lint.linters_by_ft = {
    sh = { 'bash' },
    python = { 'pylint', 'mypy' },
    dockerfile = { 'hadolint' },
    yaml = { 'yamllint' },
    terraform = { 'terraform_validate' },
    tf = { 'terraform_validate' }
}

-- Lint on read and save
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    lint.try_lint()
  end,
})
