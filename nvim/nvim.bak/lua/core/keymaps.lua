vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- 插入模式
--[[
set(mode, target_key, source_key)    
]]
-- keymap.set("i", "jk", "<ESC>") 


-- 视觉模式
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
--


-- 正常模式
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平增加窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直增加窗口
keymap.set("n", "<leader>/", ":terminal<CR>")

--
--
--
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- -------------------------- plugins ------------------------------------------
-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- bufferline
-- keymap.set("n", "<C-k>", ":bnext<CR>")
-- keymap.set("n", "<C-j>", ":bprevious<CR>")
