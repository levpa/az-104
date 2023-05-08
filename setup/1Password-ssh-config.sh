# second way is to setup 1Password automation for auto signing:
# on Windows 10
1. Windows + R -> services.msc
2. Stop and disable SSDP discovery
3. Restart or sign out
4. Go to GitHub and generate new ed25519 key for Auth, and use it for signing
5. Change that key in ~/.gitconfig

# Must end up with:
[user]
  signingkey = ssh-ed25519 YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
  email = name.surname@example.com
  name = Name Surname
[gpg]
  format = ssh

[gpg "ssh"]
  program = "C:/Users/levpa/AppData/Local/1Password/app/8/op-ssh-sign.exe"

[commit]
	gpgsign = true

[core]
	editor = \"C:\\Users\\levpa\\AppData\\Local\\Programs\\Microsoft VS Code\\bin\\code\" --wait

[alias]
# my aliases

6. Download private SSH GitHub key to ~/.ssh folder and point to it in a config file:

7. ~/.ssh/config:

Host github.com
        User levpa
        Hostname github.com
        PreferredAuthentications publickey
        IdentityFile ~/.ssh/id_ed25519

8. Check functionality (git auth + git signing with 1Password):
git add . && git commit -m " git auth and signing with 1Password " && git push