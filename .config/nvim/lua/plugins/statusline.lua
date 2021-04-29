local fn = vim.fn
local bo = vim.bo
local cmd = vim.cmd

local galaxyline = require('galaxyline')
local vcs = require('galaxyline.provider_vcs')
local condition = require('galaxyline.condition')
local file_info = require('galaxyline.provider_fileinfo')
local whitespace = require('galaxyline.provider_whitespace')

local colors = {
  bg = '#3e444e',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#0087d7',
  red = '#ec5f67'
}

local function mode_color()
  local alias = {
    n = colors.magenta,
    i = colors.green,
    v = colors.blue,
    [""] = colors.blue,
    V = colors.blue,
    c = colors.red,
    no = colors.magenta,
    s = colors.orange,
    S = colors.orange,
    [""] = colors.orange,
    ic = colors.yellow,
    R = colors.purple,
    Rv = colors.purple,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ["r?"] = colors.cyan,
    ["!"] = colors.red,
    t = colors.red
  }
  local color = alias[fn.mode()]
  
  return color
end

local function constant(value)
  return function ()
    return value
  end
end

local function checkwidth()
  local squeeze_width = fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

local space = constant ' '

galaxyline.section.left = {
  {
    FirstElement = {
      provider = constant '████',
      condition = condition.buffer_not_empty,
      highlight = {colors.bg},
    },
  },

  {
    ViMode = {
      provider = function()
        cmd ('hi GalaxyViMode guifg='..mode_color())
        return '  '
      end,
      condition = condition.buffer_not_empty,
      highlight = {mode_color, colors.bg, 'bold'},
    },
  },

  {
    FileIcon = {
      provider = 'FileIcon',
      condition = condition.buffer_not_empty,
      highlight = {file_info.get_file_icon_color, colors.bg},
    },
  },

  {
    FileName = {
      provider = 'FileName',
      separator = ' ',
      condition = condition.buffer_not_empty,
      highlight = {file_info.get_file_icon_color, colors.bg, 'bold'},
      separator_highlight = {colors.bg}
    },
  },

  {
    DiffAdd = {
      provider = 'DiffAdd',
      icon = ' ',
      condition = checkwidth,
      highlight = {colors.green},
    },
  },

  {
    DiffModified = {
      provider = 'DiffModified',
      icon = '柳',
      condition = checkwidth,
      highlight = {colors.yellow},
    },
  },

  {
    DiffRemove = {
      provider = 'DiffRemove',
      icon = ' ',
      condition = checkwidth,
      highlight = {colors.red},
    },
  },

  {
    DianosticInfo = {
      provider = 'DiagnosticInfo',
      condition = checkwidth,
      icon = ' ',
      separator = ' ',
      highlight = {colors.blue, 'bold'},
    },
  },

  {
    DianosticHint = {
      provider = 'DiagnosticHint',
      condition = checkwidth,
      icon = ' ',
      separator = ' ',
      highlight = {colors.white, 'bold'},
    },
  },

  {
    Whitespace = {
      provider = constant ' '
    }
  },

  {
    DianosticWarn = {
      provider = 'DiagnosticWarn',
      condition = checkwidth,
      icon = ' ',
      separator = ' ',
      highlight = {colors.orange, 'bold'},
    },
  },
}

galaxyline.section.right = {
  {
    FileType = {
      provider = function ()
        if bo.filetype == '' then
          return 'none'
        end

        return bo.filetype
      end,
      condition = checkwidth,
      separator = '',
      highlight = {colors.grey, colors.bg},
      separator_highlight = {colors.bg},
    },
  },

  {
    FileFormat = {
      provider = function ()
        local icons = {
          unix = ' ',
          windows = ' ',
          mac = ' ',
          [''] = 'none',
        }

        return icons[bo.fileformat] or 'none'
      end,
      separator = ' | ',
      condition = checkwidth,
      highlight = {colors.grey, colors.bg},
      separator_highlight = {colors.white, colors.bg},
    },
  },

  -- LINE COLUMN

  {
    LineColumn = {
      separator = '|',
      condition = checkwidth,
      provider = 'LineColumn',
      highlight = {colors.grey, colors.bg},
      separator_highlight = {colors.white, colors.bg},
    }
  },

  -- FILE SIZE

  {
    FileSize = {
      provider = 'FileSize',
      separator = '|',
      condition = function ()
        return checkwidth() and condition.buffer_not_empty()
      end,
      highlight = {colors.grey, colors.bg, 'bold'},
      separator_highlight = {colors.white, colors.bg},
    },
  },

  -- GIT >

  {
    GitBranch = {
      provider = 'GitBranch',
      icon = ' ',
      separator = ' ',
      condition = checkwidth,
      highlight = {colors.red, colors.bg, 'bold'},
      separator_highlight = {colors.white, colors.bg},
    },
  },

  {
    Whitespace = {
      provider = constant ' '
    }
  },
}
