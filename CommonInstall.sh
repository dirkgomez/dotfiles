cp gitconfig ~/.gitconfig
cp gitignore_global ~/.gitignore_global
mkdir -p ~/.copilot/
cp copilot/* ~/.copilot/

# Add this to your VSCode settings.json
#     "github.copilot.chat.codeGeneration.instructions": [
#        {
#        "file": "~/.copilot/python.instructions.md"
#        },
#        {
#        "file": "~/.copilot/general.instructions.md"
#        },
