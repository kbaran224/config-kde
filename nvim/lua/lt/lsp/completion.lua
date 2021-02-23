require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 2,
  -- preselect = 'enable' || 'disable' || 'always';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  -- allow_prefix_unmatch = false;

  source = {
    vsnip = {
      filetypes = {'go'},
      sticky_char = '0'
    },
    nvim_lua = { 'lua' },
    nvim_lsp = {
      filetypes = {'go'}
    },
    path = true,
    buffer =  true,
  }
}
