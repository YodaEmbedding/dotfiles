function Folder:icon(file)
  return ui.Span(" " .. file:icon() .. "  ")
end
