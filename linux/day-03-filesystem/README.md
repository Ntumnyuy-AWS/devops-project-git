# Day 3: Linux Filesystems, Files and Directories

## Objective

Learn how Linux organizes its filesystem and practise navigating directories, creating files, and inspecting disk usage.

## Environment

- Operating system: Ubuntu 22.04 LTS
- Environment: Ubuntu Vagrant virtual machine
- Practice directory: `~/day3-lab`

## Concepts learned

- `/` is the root of the Linux filesystem.
- `/etc` commonly stores system and service configuration.
- `/home` contains users' home directories.
- `/var/log` is an important location for troubleshooting logs.
- Absolute paths start from `/`, while relative paths are interpreted from the current directory.
- `df -h` reports filesystem capacity and usage.
- `du -sh` summarizes the disk space used by a directory.

## Commands practised

| Command | Purpose |
|---|---|
| `pwd` | Display the current directory |
| `ls -lah` | List files, including hidden files, with details |
| `cd /etc` | Navigate to a directory |
| `mkdir -p` | Create directories, including missing parent directories |
| `touch` | Create an empty file if it does not exist |
| `cat` | Display file contents |
| `df -h` | Inspect filesystem usage |
| `du -sh` | Summarize directory disk usage |

## Practical exercise

Create a practice directory with separate configuration and log folders.

```bash
mkdir -p ~/day3-lab/config
mkdir -p ~/day3-lab/logs
touch ~/day3-lab/config/app.conf
touch ~/day3-lab/logs/app.log
echo "APP_ENV=development" > ~/day3-lab/config/app.conf
cat ~/day3-lab/config/app.conf
```

## Results

Complete this section after running the commands.

- Directory creation: [Record the observed result]
- Configuration file contents: [Record the actual output]
- Root filesystem usage: [Record the output of `df -h`]
- Practice directory usage: [Record the output of `du -sh ~/day3-lab`]

## Troubleshooting and observations

[Describe any errors, what you checked, and how you resolved them. If there were no errors, record that the commands completed successfully.]

## Key takeaway

Linux filesystem knowledge helps DevOps engineers locate configuration files, investigate logs, manage application files, and diagnose disk-space problems.

## Evidence

Add relevant terminal screenshots to the `screenshots/` directory after completing the exercise.

## Next steps

Continue practising.
