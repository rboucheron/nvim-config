return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"  -- Add nvim-nio as a dependency
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup()

        dap.listeners.before['event_initialized']['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before['launch']['dapui_config'] = function()
            dapui.open()
        end
        dap.listeners.before['event_terminated']['dapui_config'] = function()
            dapui.close()
        end
        dap.listeners.before['event_exited']['dapui_config'] = function()
            dapui.close()
        end

        vim.keymap.set("n", "DT", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "DC", dap.continue, {})
    end,
}