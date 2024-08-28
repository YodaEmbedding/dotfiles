return {
  {
    "<Space>gb",
    function() vim.cmd [[ execute "BlameToggle window" ]] end,
    desc = "Git blame",
  },
}
