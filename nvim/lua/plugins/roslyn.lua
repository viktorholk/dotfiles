local M = {
  "seblyng/roslyn.nvim",
  ft = "cs",
  opts = {
    choose_target = function(targets)
      -- Prefer root .sln files over nested ones
      for _, target in ipairs(targets) do
        if target:match("%.sln$") and not target:match("/src/") then
          return target
        end
      end
      return targets[1]
    end,
  },
}

return M
