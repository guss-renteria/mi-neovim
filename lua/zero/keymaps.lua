-- noremap
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
-- nmap
function nmap(shortcut, command)
  map('n', shortcut, command)
end
-- imap
function imap(shortcut, command)
  map('i', shortcut, command)
end

vim.g.mapleader = ' '

nmap('<leader>w', ':w<cr>')
map('n', '<leader>.', ':let @/=""<cr>')
map('n', '<leader>sp', ':vsp<cr>')
map('n', '<c-z>', '<nop>')

-- buffers
nmap('<leader>j', ':BufferLineCyclePrev<cr>')
nmap('<leader>k', ':BufferLineCycleNext<cr>')

-- navigate between buffers
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-l>', '<c-w>l')

-- arrows
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')

-- nvim tree
map('n', '<leader>nt', ':NvimTreeToggle<cr>')

-- nvim comment
nmap('<leader>c<leader>', ':CommentToggle<cr>')
map('v', '<leader>c<leader>', ':CommentToggle<cr>')
-- 
-- -- dashboard
nmap('<leader>ss', ':<c-u>SessionSave<cr>')
nmap('<leader>sl', ':<c-u>SessionLoad<cr>')
map('n', '<leader>t', ':tabe<cr>')
map('n', '<leader>fh', ':DashboardFindHistory<cr>')
map('n', '<leader>ff', ':DashboardFindFile<cr>')
-- 
-- -- easymotion
nmap('<leader>s', '<Plug>(easymotion-s2)')

vim.cmd [[
  let g:mapleader = ' '

  " buffers
  function! GetActiveBuffers()
    let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
    let l:result = []
    for l:item in l:blist
        "skip unnamed buffers; also skip hidden buffers?
        if empty(l:item.name) || l:item.hidden
            continue
        endif
        call add(l:result, shellescape(l:item.name))
    endfor
    return l:result
  endfunction

  function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
  endfunction
  
  function! DelBufferAndNext()
    let buf_num = bufnr('%')
    let buf_type = getbufvar(buf_num, '&buftype', 'not found')

    if buf_type == 'nofile'
      q!
    elseif buf_type == 'terminal'
      exec OpenTerminal()
    elseif len(GetActiveBuffers()) <= 0
      qa
    else
      let s:old_bufnr = bufnr('%')
      bnext
      exec s:old_bufnr . 'bd'
      unlet s:old_bufnr
      if bufname('%') == '' && len(GetActiveBuffers()) <= 2
        exec DeleteEmptyBuffers()
        NvimTreeClose
        Dashboard
      endif
   endif
  endfunction

  nnoremap <leader>q :call DelBufferAndNext()<cr>
  
  " terminal
  function! OpenTerminal()
    execute "normal \<C-l>"

    let bufNum = bufnr("%")
    let bufType = getbufvar(bufNum, "&buftype", "not found")

    if bufType == "terminal"
      execute "bdelete!"
    else
      execute "split term://zsh"
      execute "resize 12"
      execute "set nonu"
      execute "set nornu"

      execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
      execute "tnoremap <buffer> <C-t> <C-\\><C-n>:bdelete!<cr>"
      execute "tnoremap <buffer> <C-\\> <C-\\><C-\\><C-n>"

      execute "tnoremap <buffer> <esc> <C-\\><C-n><esc><cr>"
      execute "tnoremap <buffer> <C-h> <C-\\><C-n><c-w>h<cr>"
      execute "tnoremap <buffer> <C-k> <C-\\><C-n><c-w>k<cr>"
      execute "tnoremap <buffer> <C-j> <C-\\><C-n><c-w>j<cr>"
      execute "tnoremap <buffer> <C-l> <C-\\><C-n><c-w>l<cr>"
    endif
  endfunction
  nnoremap <c-t> :call OpenTerminal()<cr>
]]

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
