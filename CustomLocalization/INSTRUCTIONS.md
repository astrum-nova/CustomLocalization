# CUSTOM LOCALIZATION INSTRUCTIONS

## FOR USERS
0: Set the ingame language to ENGLISH, then restart the game to apply the effects of the mod <br>
1: Open in `main.lua` <br>
2: Take a look at `SELECTED_LANGUAGE` and `SUPPORTED_LANGUAGES` <br>
3: Change `SELECTED_LANGUAGE` to the language you want, as long as it is present in `SUPPORTED_LANGUAGES` <br>
>SELECTED_LANGUAGE = "MY_CUSTOM_LANGUAGE" <br>
local SUPPORTED_LANGUAGES = { <br>
    ["MY_CUSTOM_LANGUAGE"] = the rest does not matter <br>
} <br>
Remember just the language name in between quotes! Dont include the [square brackets]

## FOR TRANSLATORS
0: Set the ingame language to ENGLISH so we have a standard translation starting point <br>
1: Open the SUPPORTED_LANGUAGES_FOLDER <br>
2: Copy and paste an existing language file, and rename the file it to `MY_CUSTOM_LANGUAGE.lua` or whatever language you are implementing <br>
3: Open `main.lua` <br>
4: Add a new line in SUPPORTED_LANGUAGES like this: <br>
local SUPPORTED_LANGUAGES = { <br>
    ["FRENCH"] = require("SUPPORTED_LANGUAGES_FOLDER.FRENCH") <br>
    ["MY_CUSTOM_LANGUAGE"] = require("SUPPORTED_LANGUAGES_FOLDER.MY_CUSTOM_LANGUAGE") <br>
} <br>
5: Set `PRINT_ALL_TEXT = true` (default should be false unless i forgot) <br>
6: In your `ue4ss` folder, open `UE4SS-settings.ini` <br>
7: Find the `[Debug]` section and modify it as follows: <br>

`[Debug]`<br>
`; Whether to enable the external UE4SS debug console.`<br>
`ConsoleEnabled = 1`<br>
`GuiConsoleEnabled = 1`<br>
`GuiConsoleVisible = 1`<br>
If the window that opens up is completely white, then look for `GraphicsAPI = opengl` and replace `opengl` with `dx11` <br>
This will open up a window of utilities alongside the game, we will focus on the `>_ Console` window. <br>
8: Every time the game sets any text, the console will show you this: `["ORIGINAL TEXT"] = "TRANSLATED TEXT"`, you must copy this, and paste it in your `MY_CUSTOM_LANGUAGE.lua` translations as a new line. Remember to end every line there with a comma! Except for of course `return {` and `}`, im obviusly talking about the `[""] = "",` lines <br>
8: Replace the `"TRANSLATED TEXT"` with the translation you want to make<br>

> If you see `\r\n` in the text, thats the symbol used for a new line.<br>Remember to include it in your translated text aswell to get a new line like in the original text!<br>You dont need to put any spaces before or after `\r\n`, heres an example:<br>
`["This is the first line\r\nand this is the second line"] = "This is the first line of the translated text\r\nand this is the second line of the translated text",`
