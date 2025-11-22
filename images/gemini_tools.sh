#!/bin/bash
# -------------------------------------------------------
# Gemini CLI - Outils Adobe Integration Script
# Auteur: François Joseph Kenegue
# Date: Novembre 2025
# -------------------------------------------------------

# ------------------------------
# 1. Configuration Gemini CLI
# ------------------------------
echo "Configuration de Gemini CLI..."

# Paramètres généraux
gemini config set ShowStatusInTitle true
gemini config set HideTips false
gemini config set HideBanner false
gemini config set UseFullWidth false
gemini config set DisableLoadingPhrases false
gemini config set ScreenReaderMode false
gemini config set IDEMode false
gemini config set MaxSessionTurns -1
gemini config set CompressionThreshold 0.2
gemini config set SkipNextSpeakerCheck true
gemini config set MemoryDiscoveryMaxDirs 200
gemini config set LoadMemoryFromIncludeDirectories false
gemini config set RespectGitignore true
gemini config set RespectGeminiignore true
gemini config set EnableRecursiveFileSearch true
gemini config set DisableFuzzySearch false
gemini config set EnableInteractiveShell true
gemini config set ShowColor false
gemini config set AutoAccept false
gemini config set UseRipgrep true
gemini config set EnableToolOutputTruncation true
gemini config set ToolOutputTruncationThreshold 4000000
gemini config set ToolOutputTruncationLines 1000
gemini config set EnableMessageBusIntegration false
gemini config set VimMode false
gemini config set DisableAutoUpdate false
gemini config set EnablePromptCompletion false
gemini config set DebugKeystrokeLogging false
gemini config set SessionRetention true
gemini config set EnableSessionCleanup false
gemini config set OutputFormat Text
gemini config set HideWindowTitle false
gemini config set HideFooter false

# ------------------------------
# 2. Intégration des outils Adobe
# ------------------------------
echo "Intégration des outils Adobe..."

# Chemins vers les exécutables Adobe
PHOTOSHOP_PATH="/c/Program Files/Adobe/Adobe Photoshop 2025/Photoshop.exe"
ILLUSTRATOR_PATH="/c/Program Files/Adobe/Adobe Illustrator 2025/Illustrator.exe"
AFTER_EFFECTS_PATH="/c/Program Files/Adobe/Adobe After Effects 2025/AfterFX.exe"
PREMIERE_PATH="/c/Program Files/Adobe/Adobe Premiere Pro 2025/Premiere.exe"

# Fonction pour lancer un outil depuis Gemini
launch_tool() {
    TOOL_NAME=$1
    TOOL_PATH=$2
    if [ -f "$TOOL_PATH" ]; then
        echo "Lancement de $TOOL_NAME..."
        "$TOOL_PATH" &
    else
        echo "⚠️  $TOOL_NAME non trouvé à $TOOL_PATH"
    fi
}

# Exemple d'utilisation
launch_tool "Photoshop" "$PHOTOSHOP_PATH"
launch_tool "Illustrator" "$ILLUSTRATOR_PATH"
launch_tool "After Effects" "$AFTER_EFFECTS_PATH"
launch_tool "Premiere Pro" "$PREMIERE_PATH"

# ------------------------------
# 3. Animation et Scripts
# ------------------------------
echo "Préparation des animations et scripts..."

# Exemple de script After Effects pour lancer une animation
AE_SCRIPT_PATH="./scripts/launch_animation.jsx"
if [ -f "$AE_SCRIPT_PATH" ]; then
    echo "Exécution du script After Effects..."
    "$AFTER_EFFECTS_PATH" -r "$AE_SCRIPT_PATH"
else
    echo "⚠️ Script After Effects non trouvé : $AE_SCRIPT_PATH"
fi

# ------------------------------
# 4. Fin du script
# ------------------------------
echo "✅ Intégration Adobe terminée."
echo "Vous pouvez maintenant utiliser Gemini CLI avec les outils Adobe."
