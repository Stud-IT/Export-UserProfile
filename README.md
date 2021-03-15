# Export-UserProfile

[![Download script](https://img.shields.io/github/downloads/Stud-IT/Export-UserProfile/total.svg)](https://github.com/Stud-IT/Export-UserProfile/releases/latest/download/Export-UserProfile.ps1.bat)
[![List releases](https://img.shields.io/github/release/Stud-IT/Export-UserProfile.svg)](https://github.com/Stud-IT/Export-UserProfile/releases)

## Bedienungsanleitung
1. Script auf externe Festplatte herunterladen
1. Script ausfühhren (doppelklick)
    - Jetzt sollte sind eine Konsole öffnen
    - Nach und nach werden die Ordner kopiert
    - Sofern ein Ordner leer ist oder nicht existiert, wird er übersprungen
    - Alle Kopiervorgänge werden mit dem Standard Window-Explorer-UI durchgeführt
    - Evtl. wird nach Adminrechten oder Überschreibbestätigungen gefragt
1. Sobald sich der Zielordner öffnet, ist das Script abgeschlossen
1. Nun kann das Konsolenfenster geschlossen werden


## Ordner, die kopiert werden
- %UserProfile%
    - `Desktop`, `Documents`, `Downloads`, `Favorites`, `Music`, `Pictures` (Standardbenutzerordner)
- %AppData%
    - `Microsoft\Signatures` (Outlook Signaturen)
    - `Microsoft\Windows\Themes\CachedFiles` (Hintergrundbild)
    - `Microsoft\Windows\Network Shortcuts` (Netzwerkverknüpfungen)
- %ProgramFiles(x86)%
    - `notes\data` (Lotus Notes auf C)
    - `SAP\PRD_MobileInfrastructure` (SAP Mobile Infrastructure)
- Wie füge ich selbst einen Ordner hinzu?
    - Füge den Pfad als String-Element zum `$Input` Array hinzu