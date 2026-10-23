# Day 5: Linux Pipes, Redirection, and Log Analysis

## Objective
Practise Linux output redirection, pipes, log filtering, error handling, and viewing files efficiently.

## Concepts Learned

- `>` redirects standard output and overwrites an existing file.
- `>>` appends standard output without overwriting existing content.
- `2>` redirects standard error to a file.
- `|` passes the output of one command as input to another.
- `grep` searches text for matching patterns.
- `grep -i` performs case-insensitive searches.
- `wc -l` counts lines.
- `less` allows interactive, page-by-page file viewing.

## Practical Exercises

### 1. Create and inspect a log file

```bash
cat app.log
```

The sample log contained application startup messages, database connection failures, warnings, and recovery information.

### 2. Redirect output

```bash
echo "Day 5 Linux lab started" > report.txt
echo "Practising output redirection" >> report.txt
cat report.txt
```

### 3. Capture errors

```bash
ls app.log missing.log > results.txt
ls app.log missing.log 2> errors.txt
cat errors.txt
```

Standard output and standard error can be redirected separately.

### 4. Filter errors with a pipe

```bash
cat app.log | grep "ERROR"
```

### 5. Count error entries

```bash
cat app.log | grep "ERROR" | wc -l
```

Result: `2`

### 6. Count warnings

```bash
grep "WARNING" app.log | wc -l
```

Result: `2`

### 7. Search without case sensitivity

```bash
grep -i "error" app.log
```

### 8. Browse logs interactively

```bash
less app.log
```

Useful controls: `Space` for the next page, `/ERROR` to search, `n` for the next match, and `q` to quit.

## Key DevOps Takeaway

Linux pipes and text-processing tools help engineers investigate application logs, identify errors, count warnings, and troubleshoot services efficiently without manually reading every line.

## Validation

- [x] Practised output redirection and appending.
- [x] Redirected standard error.
- [x] Filtered application logs using `grep`.
- [x] Counted errors and warnings using `wc -l`.
- [x] Searched logs interactively with `less`.
