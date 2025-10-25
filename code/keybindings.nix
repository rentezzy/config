[
  {
    key = "ctrl+c";
    command = "editor.action.triggerSuggest";
    when = "editorHasCompletionItemProvider && textInputFocus && !editorReadonly && !suggestWidgetVisible";
  }
  {
    key = "cmd+i";
    command = "-editor.action.triggerSuggest";
    when = "editorHasCompletionItemProvider && textInputFocus && !editorReadonly && !suggestWidgetVisible";
  }
  {
    key = "shift+alt+f";
    command = "workbench.action.findInFiles";
  }
  {
    key = "shift+cmd+f";
    command = "-workbench.action.findInFiles";
  }
  {
    key = "shift+cmd+f";
    command = "editor.action.formatDocument";
    when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
  }
  {
    key = "shift+alt+f";
    command = "-editor.action.formatDocument";
    when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
  }
  {
    key = "shift+cmd+o";
    command = "editor.action.organizeImports";
    when = "textInputFocus && !editorReadonly && supportedCodeAction =~ /(\\s|^)source\\.organizeImports\\b/";
  }
  {
    key = "shift+alt+o";
    command = "-editor.action.organizeImports";
    when = "textInputFocus && !editorReadonly && supportedCodeAction =~ /(\\s|^)source\\.organizeImports\\b/";
  }
  {
    key = "shift+cmd+,";
    command = "-editor.action.inPlaceReplace.up";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "shift+cmd+,";
    command = "editor.cpp.toggle";
  }
  {
    key = "cmd+i";
    command = "composerMode.agent";
  }
]
