return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
		vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
		vim.keymap.set("n", "<F2>", ":lua require'dap'.step_into()<CR>")
		vim.keymap.set("n", "<F6>", ":lua require'dap'.step_out()<CR>")
		vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
		vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
		vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
		vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

		require("nvim-dap-virtual-text").setup()
		require('dap-go').setup()
		require("dapui").setup(
			{
				icons = { expanded = "", collapsed = "" },
				expand_lines = false,
				layouts = { {
					elements = { {
						id = "watches",
						size = 0.25
					}, {
						id = "scopes",
						size = 0.25
					}, {
						id = "breakpoints",
						size = 0.25
					}, {
						id = "stacks",
						size = 0.25
					} },
					position = "right",
					size = 50
				}, {
					elements = { {
						id = "repl",
						size = 1
					} },
					position = "bottom",
					size = 10
				} },
			}
		)

		local sign = vim.fn.sign_define

		sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end
}
