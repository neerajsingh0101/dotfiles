return {
  "numToStr/Comment.nvim",
  opts = {
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = function(ctx)
      if vim.bo.commentstring ~= "" then
        return vim.bo.commentstring
      end

      return require("Comment.ft").get(vim.bo.filetype, ctx.ctype)
    end,
  },
}
