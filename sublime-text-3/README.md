# sublime text 3 
## sublimeTmpl
* 添加新语言模板NEW.new
    1. 在User/SublimeTmpl/templates内添加模板NEW.tmpl
    2. 在settings-user
```json
"NEW": {
    "syntax": "Packages/NEW/NEW.tmLanguage",
    "extension": "new"
    }
```
    3. command-user 添加
```json
{
    "caption": "Tmpl: Create NEW", "command": "sublime_tmpl",
    "args": {"type": "NEW"}
}
```

## snippets
* "$"为特殊符号，需要用"\"转义