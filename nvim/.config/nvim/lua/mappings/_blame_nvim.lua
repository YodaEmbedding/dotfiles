return {
  {
    "<Space>gbb",
    function() vim.cmd [[ execute "BlameToggle window" ]] end,
    desc = "Git blame (blame.nvim)",
  },
}
