return {
  "gbprod/substitute.nvim",
  opts = {},
  keys = {
    {
      "s",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute with motion",
    },
    {
      "ss",
      function()
        require("substitute").line()
      end,
      desc = "Substitute line",
    },
    {
      "S",
      function()
        require("substitute").eol()
      end,
      desc = "Substitute to end of line",
    },
    {
      "s",
      function()
        require("substitute").visual()
      end,
      mode = "x",
      desc = "Substitute selection",
    },
    {
      "sx",
      function()
        require("substitute.exchange").operator()
      end,
      desc = "Exchange with motion",
    },
    {
      "sxx",
      function()
        require("substitute.exchange").line()
      end,
      desc = "Exchange line",
    },
    {
      "X",
      function()
        require("substitute.exchange").visual()
      end,
      mode = "x",
      desc = "Exchange selection",
    },
    {
      "sxc",
      function()
        require("substitute.exchange").cancel()
      end,
      desc = "Cancel exchange",
    },
  },
}
