local p = require('le-grand-bleu.palette')

local le_grand_bleu = {}

le_grand_bleu.normal = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

le_grand_bleu.insert = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

le_grand_bleu.visual = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

le_grand_bleu.replace = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

le_grand_bleu.command = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

le_grand_bleu.inactive = {
  a = { fg = p.text, bg = p.blue4, gui = 'bold' },
  b = { fg = p.text, bg = p.blue4 },
  c = { fg = p.text, bg = p.blue4 },
}

return le_grand_bleu
