import os, subprocess

def mailpasswd(acc):
    acc = os.path.basename(acc)
    home = os.path.expanduser('~')
    path = home + "/.passwd/%s.gpg" % acc
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
