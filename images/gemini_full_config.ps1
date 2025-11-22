# =========================================================
# GEMINI CLI - FULL CONFIGURATION + Bit0 + LMBZ + Tools
# =========================================================

# Dossier de configuration Gemini
$GeminiConfigPath = "$env:USERPROFILE\Gemini_Full_Config"

# Créer le dossier si nécessaire
if (-not (Test-Path $GeminiConfigPath)) {
    mkdir $GeminiConfigPath
}

# ========================
# 1️⃣ Paramètres CLI optimisés
# ========================

$CLISettings = @"
# -----------------------
# Gemini CLI Settings
# -----------------------
ShowStatusInTitle: true
HideTips: false
HideBanner: false
HideContextSummary: false
HideCWD: false
UseFullWidth: false
DisableLoadingPhrases: false
ScreenReaderMode: false
IDEMode: false
MaxSessionTurns: -1
CompressionThreshold: 0.2
SkipNextSpeakerCheck: true
MemoryDiscoveryMaxDirs: 200
LoadMemoryFromIncludeDirectories: false
RespectGitignore: true
RespectGeminiignore: true
EnableRecursiveFileSearch: true
DisableFuzzySearch: false
EnableInteractiveShell: true
ShowColor: false
AutoAccept: false
UseRipgrep: true
EnableToolOutputTruncation: true
ToolOutputTruncationThreshold: 4000000
ToolOutputTruncationLines: 1000
EnableMessageBusIntegration: false
VimMode: false
DisableAutoUpdate: false
EnablePromptCompletion: false
DebugKeystrokeLogging: false
SessionRetention: true
EnableSessionCleanup: false
OutputFormat: Text
HideWindowTitle: false
HideFooter: true
DisableYOLOMode: false
FolderTrust: false
UseModelRouter: true
EnableCodebaseInvestigator: false
CodebaseInvestigatorMaxNumTurns: 15
"@

$CLISettingsFile = "$GeminiConfigPath\cli_settings.conf"
$CLISettings | Out-File -Encoding UTF8 $CLISettingsFile

# ========================
# 2️⃣ Règles Bit0
# ========================

$Bit0Rules = @"
# ========================
# Bit0 Semantic Logic - Advanced
# ========================

DEFINE concept: "Entity"
  description: "Tout objet, être ou idée dans le système Bit0"
END

DEFINE concept: "Action"
  description: "Tout processus ou changement affectant une Entity"
END

DEFINE concept: "Relation"
  description: "Connexion entre Entities avec un sens précis"
END

DEFINE concept: "Tool"
  description: "Tout logiciel ou utilitaire utilisé par l'utilisateur"
END

DEFINE concept: "File"
  description: "Fichier ou document manipulé par Actions"
END

DEFINE concept: "Project"
  description: "Regroupement d'Entities et Files avec un but commun"
END

# Règles principales
RULE 1
  IF Entity.type == "User" AND Action.type == "Create"
  THEN Relation.type = "Ownership"
END

RULE 2
  IF Entity.type == "File" AND Action.type == "Modify"
  THEN Relation.type = "Versioned"
END

RULE 3
  IF Tool.type == "Adobe" AND Action.type == "Use"
  THEN Relation.type = "EnhancedByTool"
END

RULE 4
  IF Project.status == "Active" AND Action.type == "Analyze"
  THEN Action.priority = "High"
END

RULE 5
  IF File.extension IN ["psd","aep","blend","json","py"]
  THEN Action.recommendation = "PreserveVersioning"
END

RULE 6
  IF Entity.type == "Entity" AND Action.type == "Track"
  THEN Relation.type = "Monitored"
END

META bit0_documents_path: "C:\"
META description: "Advanced Bit0 Rules for Gemini CLI"
META version: "2.0"
META author: "François J. Kenegue"
"@

$Bit0File = "$GeminiConfigPath\bit0_rules"
$Bit0Rules | Out-File -Encoding UTF8 $Bit0File

# ========================
# 3️⃣ Règles LMBZ
# ========================

$LMBZRules = @"
# ========================
# LMBZ Logic - Advanced
# ========================

DEFINE glyph: "Φ"
  description: "Concept central ou clé"
END

DEFINE glyph: "λ"
  description: "Transformation ou transition"
END

DEFINE glyph: "Ξ"
  description: "Indique automatisation ou intelligence"
END

# Règles avancées LMBZ
RULE 1
  IF Entity.hasGlyph("Φ") AND Action.type == "Analyze"
  THEN Action.priority = "Critical"
END

RULE 2
  IF Entity.hasGlyph("λ") AND Relation.type == "Versioned"
  THEN Action.nextStep = "TrackChange"
END

RULE 3
  IF Tool.type == "Adobe" AND Entity.hasGlyph("Φ")
  THEN Action.recommendation = "UseAdvancedFeatures"
END

RULE 4
  IF Tool.type == "Blender" AND Entity.hasGlyph("Ξ")
  THEN Action.recommendation = "EnableAutomationScripts"
END

RULE 5
  IF File.extension IN ["psd","aep","blend"] AND Action.type == "Modify"
  THEN Action.recommendation = "BackupBeforeSave"
END

RULE 6
  IF Entity.type == "Code" AND Tool.type == "VSCode"
  THEN Action.recommendation = "RunLinterAndTests"
END

META description: "Advanced LMBZ Rules for Gemini CLI"
META version: "2.0"
META author: "François J. Kenegue"
"@

$LMBZFile = "$GeminiConfigPath\lmbz_rules"
$LMBZRules | Out-File -Encoding UTF8 $LMBZFile

# ========================
# 4️⃣ Charger tout dans Gemini CLI
# ========================

gemini config load $CLISettingsFile
gemini logic load "Bit0" --from $Bit0File
gemini logic load "LMBZ" --from $LMBZFile
gemini memory add-dir "C:\" --recursive

# ========================
# 5️⃣ Vérification
# ========================

gemini logic list
gemini memory list

Write-Output "✅ GEMINI CLI FULL CONFIGURATION COMPLETE!"
