
CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";

  config.toolbar = [
   ['Styles','Format','Font','FontSize'],
   '/',
   ['Bold','Italic','Underline','StrikeThrough','-','Undo','Redo','-','Cut','Copy','Paste','Find','Replace','-','Outdent','Indent','-'],
   '/',
   ['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
   ['Table','-','Link','Smiley','TextColor']
] ;

  // ... rest of the original config.js  ...
}