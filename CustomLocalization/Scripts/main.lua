--! Take a look at the contents of SUPPORTED_LANGUAGES and set the SELECTED_LANGUAGE of your choice
local SELECTED_LANGUAGE = "FRENCH"

local SUPPORTED_LANGUAGES = {
    ["FRENCH"] = require("SUPPORTED_LANGUAGES_FOLDER.FRENCH")
}

local CUSTOM_LANGUAGE = SUPPORTED_LANGUAGES[SELECTED_LANGUAGE]

local PRINT_ALL_TEXT = false

local kismetTextLib = nil
RegisterHook("/Script/UMG.TextBlock:SetText", function(Context, Text)
    if not Text or not Text:get() then return end
    local originalStr = Text:get():ToString()
    if PRINT_ALL_TEXT then print("[\"" .. originalStr:gsub("\r\n", "\\r\\n"):gsub("\n", "\\n") .. "\"] = \"TRANSLATED TEXT\"") end
    if not kismetTextLib then kismetTextLib = StaticFindObject("/Script/Engine.Default__KismetTextLibrary") end
    if CUSTOM_LANGUAGE[originalStr] then Text:set(kismetTextLib:Conv_StringToText(CUSTOM_LANGUAGE[originalStr])) end
end)
