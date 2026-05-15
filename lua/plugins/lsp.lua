-- Server-specific LSP settings.
-- vtsls is installed and managed by astrocommunity.pack.typescript.
-- volar is installed and managed by astrocommunity.pack.vue (hybrid mode: volar owns templates, vtsls owns TS).
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      intelephense = {
        settings = {
          intelephense = {
            stubs = {
              "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
              "dba", "dom", "enchant", "exif", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
              "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
              "mcrypt", "meta", "mongodb", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre",
              "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix",
              "pspell", "readline", "recode", "Reflection", "regex", "session", "shmop", "SimpleXML",
              "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals",
              "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
              "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
              -- Laravel-specific stubs
              "wordpress", "redis",
            },
            files = {
              maxSize = 5000000,
            },
            environment = {
              phpVersion = "8.3",
            },
            completion = {
              insertUseDeclaration = true,
              fullyQualifyGlobalConstantsAndFunctions = false,
              triggerParameterHints = true,
              maxItems = 100,
            },
            format = {
              enable = false, -- disabled in favour of php-cs-fixer
            },
            diagnostics = {
              enable = true,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      },
      volar = {
        init_options = {
          vue = { hybridMode = true },
        },
      },
      vtsls = {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vim.fn.stdpath "data"
                    .. "/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "literals",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "literals",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            },
          },
          completions = { completeFunctionCalls = true },
        },
      },
    },
  },
}
