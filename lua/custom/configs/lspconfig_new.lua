local servers = {
	"docker_compose_language_service",
  "docker_language_server",
  "gopls",
  "helm_ls",
  "html",
  "htmx",
  "java_language_server",
  "jinja_lsp",
  "kotlin_language_server",
  "lua_ls",
  "nginx_language_server",
  "pyright",
  "rust_analyzer",
  "templ",
  "yamlls",
  "zls",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, require("lsps/" .. server))
  vim.lsp.enable(server)
end
