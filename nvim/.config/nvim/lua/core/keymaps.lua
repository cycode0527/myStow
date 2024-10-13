vim.g.mapleader = " "

local keymap = vim.keymap

-- -----------插入模式--------------
-- keymap.set("i", "jk", "<ESC>")

-- -----------视觉模式--------------
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- -----------正常模式--------------
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 行内左右
keymap.set("", "H", "^")
keymap.set("", "L", "g_")

-- vim.cmd [[
--     nmap j gj
--     nmap k gk
--
-- ]]
-- 等价于上面的命令，可以帮助在 vscode 中越过折叠
keymap.set("", "j", "gj", {remap = true})
keymap.set("", "k", "gk", {remap = true})

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- easymotion
-- keymap.set("n", "J", "<leader><leader>j")
-- keymap.set("n", "<leader>k", "<leader><leader>k")
-- keymap.set("n", "s", "<leader><leader>s")

-- hop
-- keymap.set("n", "s", ":HopChar1<CR>")
-- keymap.set("n", "J", ":HopLineAC<CR>")
-- keymap.set("n", "K", ":HopLineBC<CR>")
-- 
-- vim.keymap.set('n', 'B', ':lua require("jieba_nvim").wordmotion_B()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'b', ':lua require("jieba_nvim").wordmotion_b()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'w', ':lua require("jieba_nvim").wordmotion_w()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'W', ':lua require("jieba_nvim").wordmotion_W()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'E', ':lua require("jieba_nvim").wordmotion_E()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'e', ':lua require("jieba_nvim").wordmotion_e()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'ge', ':lua require("jieba_nvim").wordmotion_ge()<CR>', {noremap = false, silent = true})
-- vim.keymap.set('n', 'gE', ':lua require("jieba_nvim").wordmotion_gE()<CR>', {noremap = false, silent = true})
