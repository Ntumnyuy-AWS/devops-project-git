# Day 3: Linux Filesystem — Practical Exercises

## Objective

Practise Linux filesystem navigation, directory and file management,
shell output redirection, and disk-usage inspection on an Ubuntu VM
managed with Vagrant.

## Environment

- Operating system: Ubuntu Linux 22.04 LTS
- Virtualisation: Vagrant-managed virtual machine
- Linux user: `vagrant`
- Practice workspace: `/home/vagrant/day3-lab`
- Documentation repository: `devops-project-git`

---

## 1. Inspect the Current Directory

### Commands

```bash
pwd
ls -lah
```

### What I learned

- `pwd` prints the current working directory.
- `ls` lists directory contents.
- `-l` displays detailed information, including permissions and ownership.
- `-a` includes hidden entries, such as `.git`.
- `-h` displays sizes in human-readable units.

### Observed result

My repository was located at:

```text
/home/vagrant/devops-project-git
```

The repository contained:

```text
.git/
README.md
linux/
```

The `linux` directory contained the `day-03-filesystem` lesson folder.

---

## 2. Understand Linux File Permissions

### Example

```text
drwxrwxr-x
-rw-rw-r--
```

### What I learned

Linux permissions are divided into three groups:

- **Owner:** Permissions for the file's owner.
- **Group:** Permissions for users in the file's group.
- **Others:** Permissions for other users.

Permission symbols:

- `r` means read.
- `w` means write.
- `x` means execute. For directories, it allows traversal.
- `-` means the permission is not granted.

The first character identifies the file type:

- `d` indicates a directory.
- `-` indicates a regular file.

I also learned to identify ownership and group information in `ls -lah`.

---

## 3. Create a Directory Structure

### Command

```bash
mkdir -p ~/day3-lab/config ~/day3-lab/logs
```

### What I learned

- `mkdir` creates directories.
- `-p` creates parent directories when necessary and does not fail
  simply because the requested directories already exist.
- `~` represents the current user's home directory.

The resulting structure was:

```text
/home/vagrant/day3-lab/
├── config/
└── logs/
```

### Verification

```bash
ls -lah ~/day3-lab
```

The output confirmed that both `config` and `logs` existed.

---

## 4. Create Files with `touch`

### Command

```bash
touch ~/day3-lab/config/app.conf ~/day3-lab/logs/app.log
```

### What I learned

- `touch` creates an empty file if it does not exist.
- If the file already exists, `touch` updates its modification timestamp
  without normally changing its contents.

### Verification

```bash
ls -lah ~/day3-lab/config ~/day3-lab/logs
```

The output confirmed that:

- `config/app.conf` existed and was initially empty.
- `logs/app.log` existed and was initially empty.

---

## 5. Write Configuration Data

### Command

```bash
echo "APP_ENV=development" > ~/day3-lab/config/app.conf
```

### Verify the file

```bash
cat ~/day3-lab/config/app.conf
```

### Observed output

```text
APP_ENV=development
```

### What I learned

- `echo` prints text.
- `cat` displays file contents.
- `>` redirects output to a file, replacing its existing contents.

**Important:** Using `>` on an existing file can erase its previous contents.

---

## 6. Write and Append Application Logs

### First log entry

```bash
echo "Application started successfully" >> ~/day3-lab/logs/app.log
```

### Second log entry

```bash
echo "Application processed a request" >> ~/day3-lab/logs/app.log
```

### Verify the log file

```bash
cat ~/day3-lab/logs/app.log
```

### Observed output

```text
Application started successfully
Application processed a request
```

### What I learned

- `>>` appends new content to a file.
- Existing content is preserved when using `>>`.
- Application logs help engineers investigate application behaviour,
  errors, and deployment problems.

### Redirection comparison

| Operator | Behaviour |
| --- | --- |
| `>` | Writes output and replaces existing file contents |
| `>>` | Appends output while preserving existing contents |

---

## 7. Inspect Filesystem Capacity with `df -h`

### Command

```bash
df -h
```

### Observed output

```text
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           392M  964K  391M   1% /run
/dev/sda1        39G  1.7G   38G   5% /
tmpfs           2.0G     0  2.0G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
vagrant         238G   91G  148G  38% /vagrant
tmpfs           392M  4.0K  392M   1% /run/user/1000
```

### What I learned

- `df` reports filesystem space usage.
- `-h` displays sizes in human-readable units.
- `Size` is the filesystem's reported capacity.
- `Used` is the space already consumed.
- `Avail` is the space available to users, subject to filesystem rules.
- `Use%` is the percentage of space used.
- `Mounted on` identifies where the filesystem is accessible.

The root filesystem, `/dev/sda1`, had approximately 5% usage at the
time of the exercise.

The `/vagrant` entry represents the shared Vagrant directory. Its
reported capacity is not necessarily the capacity of the VM's root disk.

I also learned that `tmpfs` is a temporary, memory-backed filesystem.

---

## 8. Measure Directory Usage with `du -sh`

### Commands

```bash
du -sh ~/day3-lab
du -sh ~/day3-lab/*
```

### Observed results

```text
20K     /home/vagrant/day3-lab
8.0K    /home/vagrant/day3-lab/config
8.0K    /home/vagrant/day3-lab/logs
```

### What I learned

- `du` estimates the disk space used by files and directories.
- `-s` displays a summary total.
- `-h` uses human-readable units.
- The wildcard `*` matches the immediate entries inside the directory.

Small files can use more disk space than their text contents alone
because of filesystem allocation and metadata.

### `df` versus `du`

- `df -h` reports usage and available space for entire filesystems.
- `du -sh` estimates the disk usage of a particular directory or file.

Both commands are useful when investigating disk-space problems.

---

## 9. Navigate Using Absolute Paths

### Commands

```bash
cd /home/vagrant/day3-lab/config
pwd
```

### Verified output

```text
/home/vagrant/day3-lab/config
```

### What I learned

An absolute path begins at the root directory `/` and specifies the
location from there.

Example:

```text
/home/vagrant/day3-lab/config
```

This makes the target location explicit, regardless of the current
working directory.

---

## 10. Navigate to a Parent Directory

### Commands

```bash
cd ..
pwd
```

### Verified output

```text
/home/vagrant/day3-lab
```

### What I learned

- `cd` changes the current working directory.
- `..` represents the parent directory.
- `pwd` verifies the current location.

---

## 11. Navigate Using Relative Paths

Starting from `/home/vagrant/day3-lab`, I entered the `logs` directory.

### Commands

```bash
cd logs
pwd
```

### Verified output

```text
/home/vagrant/day3-lab/logs
```

I then moved from `logs` to the sibling `config` directory.

### Commands

```bash
cd ../config
pwd
```

### Verified output

```text
/home/vagrant/day3-lab/config
```

### What I learned

A relative path is interpreted from the current working directory.

- `cd logs` enters a child directory named `logs`.
- `cd ..` moves to the parent directory.
- `cd ../config` moves to the parent and then enters `config`.

Relative paths are useful in project navigation and shell scripts.

---

## 12. Read Files Using Relative Paths

While inside the `config` directory, I read its configuration file.

### Command

```bash
cat app.conf
```

### Verified output

```text
APP_ENV=development
```

I then read the log file located in a sibling directory without
changing my working directory.

### Command

```bash
cat ../logs/app.log
```

### Verified output

```text
Application started successfully
Application processed a request
```

### What I learned

Relative paths can be used to access files in other directories without
first changing the current working directory.

---

## Key Takeaways

During this practical session, I learned how to:

- Inspect directories and understand basic file permissions.
- Create directories and files.
- Write configuration data and append application log entries.
- Distinguish between `>` and `>>`.
- Inspect filesystem capacity with `df -h`.
- Measure directory usage with `du -sh`.
- Navigate using absolute and relative paths.
- Read files from the current directory and sibling directories.

These skills form part of the foundation for Linux administration,
Bash scripting, application troubleshooting, and DevOps automation.

---

## Next Exercise

Continue with file discovery using `find`, followed by searching file
contents using `grep`.

These commands are useful for locating configuration files and finding
errors or specific messages in application logs.
