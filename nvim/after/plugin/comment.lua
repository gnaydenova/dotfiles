local has_comment , comment = pcall(require, "Comment")

if not has_comment  then
    vim.notify("Comment is missing", vim.log.levels.WARN)
    return
end

comment.setup()
