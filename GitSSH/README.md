#### Using Windows's OpenSSH client for Git
Add the below-listed commands to your ".gitconfig" file the under "core" section.
```
sshCommand = 'C:/Windows/System32/OpenSSH/ssh.exe' -c aes128-cbc
askpass = git-gui--askpass
```

Also, make sure that the "OpenSSH Authentication Agent" service is running and set to start automatically!

#### Using multiple GitHub accounts with SSH
Create or modify the config file that is located in your ".ssh" folder.

Example:
```
Host github.com
    Hostname github.com
    User john-white
    IdentityFile "/C/Users/John/.ssh/github_john-white"
Host github-google
    Hostname github.com
    User john-google
    IdentityFile "/C/Users/John/.ssh/github_john-google"
```

When cloning **work** repositories (*john-google*) you must change
the URL:

E.g. from "git@github.com:chromium/chromium.git" to
"git@github-google:chromium/chromium.git".

More information on configuring the SSH config file can be found [here][ssh_config].

#### Using [WinMerge][WinMerge] as a Git difftool
Add the below-listed commands to your ".gitconfig" file.
```
[diff]
    tool = winmerge
[difftool]
    prompt = false
[difftool "winmerge"]
    name = WinMerge
    trustExitCode = true
    cmd = "/C/Program\\ Files/WinMerge/WinMergeU.exe" -u -e $LOCAL $REMOTE
```

Usage:
```sh
$ git difftool
```
or
```sh
$ git difftool --dir-diff
```
for diffing the whole directory.


[ssh_config]: <https://linuxize.com/post/using-the-ssh-config-file>
[WinMerge]: <https://winmerge.org/?lang=en>