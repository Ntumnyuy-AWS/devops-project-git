# Day 4: Linux Users, Groups, and Permissions

## Objective
Practise Linux user and group management, file ownership, permissions, and least-privilege access control.

## Key Commands

| Command | Purpose |
|---|---|
| `adduser` | Create a user account |
| `addgroup` | Create a group |
| `usermod -aG` | Add a user to a supplementary group |
| `id` / `groups` | Inspect user group membership |
| `chown` | Change file or directory ownership |
| `chmod` | Change permissions |
| `sudo -u` | Run a command as another user |
| `ls -l` | Inspect file permissions and ownership |

## Practical Lab

- Created the `devops` and `developers` groups.
- Created `devops1` and `developer1` test accounts.
- Assigned each user to the appropriate team group.
- Created separate team directories under `/srv/company/`.
- Set directory ownership to `root` and the corresponding team group.
- Applied `chmod 2770` to enable owner and group access while denying access to others.

## Key Learning

- Linux permissions control read (`r`), write (`w`), and execute (`x`) access.
- `chown` manages ownership; `chmod` manages permissions.
- The setgid bit on a directory helps new files and subdirectories inherit its group.
- `usermod -aG` adds a supplementary group without replacing existing supplementary group memberships.
- `sudo` provides elevated privileges and should be used carefully.
- Least privilege means giving users only the access they need.

## Validation

- Each test user successfully created a file in their own team's directory.
- Cross-team directory access was denied as expected.
- The permission-denied tests demonstrated that directory permissions can restrict access even when a user knows a file's path.

## Security Note

The setgid bit controls group inheritance; it does not automatically guarantee group-write access to every new file. Shared-file collaboration may require appropriate `umask` settings, default ACLs, or explicit permissions.

## Outcome

Successfully practised Linux user and group administration, ownership, permission management, setgid, and least-privilege access control.
