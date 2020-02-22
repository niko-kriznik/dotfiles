## Table of Contents
1. [Using Windows's OpenSSH client for Git](#windows-openssh)
2. [Using multiple GitHub accounts with SSH](#multiple-github)
3. [Using WinMerge as a Git difftool](#winmerge-difftool)
4. [Fixing "Bad owner or permissions on (path to)/.ssh/config"](#bad-owner-ssh)

#### Using Windows's OpenSSH client for Git <a name="windows-openssh">
Add the below-listed commands to your ".gitconfig" file the under "core" section.
```
sshCommand = "C:/Windows/System32/OpenSSH/ssh.exe" -c aes128-cbc
askpass = git-gui--askpass
```

Also, make sure that the "OpenSSH Authentication Agent" service is running and set to start automatically!

#### Using multiple GitHub accounts with SSH <a name="multiple-github">
Create or modify the config file that is located in your ".ssh" folder.

Example:
```
Host github.com
    Hostname github.com
    User john-white
    IdentityFile "C:/Users/John/.ssh/github_john-white"
Host github-google
    Hostname github.com
    User john-google
    IdentityFile "C:/Users/John/.ssh/github_john-google"
```

When cloning **work** repositories (*john-google*) you must change
the URL:

E.g. from "git@github.com:chromium/chromium.git" to
"git@github-google:chromium/chromium.git".

More information on configuring the SSH config file can be found [here][ssh_config].

#### Using [WinMerge][WinMerge] as a Git difftool <a name="winmerge-difftool">
Add the below-listed commands to your ".gitconfig" file.
```
[diff]
    tool = winmerge
[difftool]
    prompt = false
[difftool "winmerge"]
    name = WinMerge
    trustExitCode = true
    cmd = "C:/Program\\ Files/WinMerge/WinMergeU.exe" -u -e $LOCAL $REMOTE
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

#### Fixing "Bad owner or permissions on (path to)/.ssh/config" <a name="bad-owner-ssh">
This can occur when you have multiple Administrator privileged users on the same computer.

Just right-click on your ".ssh" folder, click *Properties* and then navigate to the *Security Tab*.

Under *Advanced* click on *DISABLE INHERITANCE* and then click on the other Administrator user (the one that is not you) and *Remove* them.


More information can be found [here][bad-owner_ssh].

[ssh_config]: <https://linuxize.com/post/using-the-ssh-config-file>
[WinMerge]: <https://winmerge.org/?lang=en>
[bad-owner_ssh]: <https://stackoverflow.com/questions/49926386/openssh-windows-bad-owner-or-permissions>