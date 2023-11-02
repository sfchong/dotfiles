local status, autosession = pcall(require, "auto-session")
if (not status) then return end

autosession.setup({
    log_level = "error",
    auto_session_allowed_dirs = { "~/code/*", "~/dotfiles" },
    auto_session_suppress_dirs = { "~/", "/" },
})
