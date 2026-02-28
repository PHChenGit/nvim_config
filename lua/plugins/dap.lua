return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- DAP UI
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")

          dapui.setup({
            icons = { expanded = "", collapsed = "", current_frame = "" },
            layouts = {
              {
                elements = {
                  { id = "scopes",      size = 0.35 },
                  { id = "breakpoints", size = 0.15 },
                  { id = "stacks",      size = 0.30 },
                  { id = "watches",     size = 0.20 },
                },
                size = 40,
                position = "left",
              },
              {
                elements = {
                  { id = "repl",    size = 0.5 },
                  { id = "console", size = 0.5 },
                },
                size = 12,
                position = "bottom",
              },
            },
            floating = { border = "rounded" },
          })

          -- Auto open/close DAP UI
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },

      -- Mason DAP installer
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          ensure_installed = { "codelldb", "python" },
          automatic_installation = true,
          handlers = {},
        },
      },

      -- Python DAP
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          -- Use the python3 from the system (or virtual env if active)
          local python = vim.fn.exepath("python3") or "python3"
          require("dap-python").setup(python)
        end,
      },
    },

    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,           desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                    desc = "Continue / Start" },
      { "<leader>di", function() require("dap").step_into() end,                   desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end,                   desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end,                    desc = "Step out" },
      { "<leader>dr", function() require("dap").repl.open() end,                   desc = "Open REPL" },
      { "<leader>dt", function() require("dap").terminate() end,                   desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end,                    desc = "Toggle DAP UI" },
    },

    config = function()
      local dap = require("dap")

      -- codelldb adapter for C/C++
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
      local codelldb_path = mason_path .. "/extension/adapter/codelldb"
      local liblldb_path = mason_path .. "/extension/lldb/lib/liblldb.so"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }

      -- C++ debug configuration
      dap.configurations.cpp = {
        {
          name = "Launch (codelldb)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      -- C uses same config as C++
      dap.configurations.c = dap.configurations.cpp

      -- DAP signs
      vim.fn.sign_define("DapBreakpoint",
        { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition",
        { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",
        { text = "󰁕", texthl = "DiagnosticSignInfo", linehl = "DapStoppedLine", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected",
        { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
    end,
  },
}
