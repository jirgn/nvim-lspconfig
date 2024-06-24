local util = require 'lspconfig.util'

local bin_name = 'vscode-neos-fusion-ls'
local cmd = { bin_name, '--stdio' }

if vim.fn.has 'win32' == 1 then
  cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
end

local default_settings = {
  neosFusionLsp = {
    folders = {
      packages = {
        "DistributionPackages",
        "Packages/Application",
        "Packages/Framework",
        "Packages/Plugins",
        "Packages/Sites",
        "Packages/Neos",
        "Packages/Carbon"
      },
      workspaceAsPackageFallback = true,
      fusion = {
        "Resources/Private/Fusion",
        "Resources/Private/FusionModule",
        "Resources/Private/FusionModules",
        "Resources/Private/FusionPlugins",
        "NodeTypes"
      },
      ignore = { "Packages/Libraries" },
      followSymbolicLinks = false,
      includeHiddenDirectories = false
    },
    diagnostics = {
      enabled = true,
      levels = {
        deprecations = "hint"
      },
      ignore = {
        folders = {
          "Packages/"
        }
      },
      alwaysDiagnoseChangedFile = false
    },
    inlayHint = {
      depth = "literal"
    },
    extensions = {
      modify = true
    },
    code = {
      deprecations = {
        fusion = {
          prototypes = {
            ["Neos.Fusion:Array"] = "Neos.Fusion:Join",
            ["Neos.Fusion:Collection"] = "Neos.Fusion:Loop",
            ["Neos.Fusion:RawCollection"] = "Neos.Fusion:Map",
            ["Neos.Fusion:RawArray"] = "Neos.Fusion:DataStructure",
            ["Neos.Fusion:UriBuilder"] = "Neos.Fusion:ActionUri"
          }
        }
      }
    },
    logging = {
      level = "info",
      inspect = false
    }
  }
}

return {
  default_config = {
    cmd = cmd,
    filetypes = { 'fusion' },
    settings = default_settings,
    init_options = {
      textDocumentSync = {
        openClose = true
      }
    },
    root_dir = util.root_pattern('composer.json', '.git'),
  },
  docs = {
    description = [[
https://github.com/sjsone/vscode-neos-fusion-lsp

!! This Language Server is currently in Experimental State
Installation has to be done via github url.
After Intallation you have to run `yarn compile` to build the server.
]],
  }
}
