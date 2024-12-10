# Shell Script Race Condition

This repository demonstrates a race condition in a bash script that processes multiple files concurrently. The script uses a loop to iterate over a list of files and appends a message to each file. However, because the file operations are not synchronized, multiple processes might attempt to write to the same file at the same time, leading to unexpected behavior and data corruption.

## Bug Description
The bug stems from the lack of synchronization in file access.  The script is vulnerable to race conditions because the `>>` operator is not atomic and multiple processes might try to modify the same file concurrently. This can result in incomplete or corrupted file contents, which will be demonstrated when running the script multiple times. 

## Bug Solution
The solution involves using locking mechanisms to ensure that only one process can access and modify a file at a time.  This prevents race conditions and ensures data integrity. 

## How to reproduce
1. Clone the repository.
2. Make the files executable: `chmod +x bug.sh bugSolution.sh`
3. Run the buggy script multiple times: `./bug.sh`
4. Observe the inconsistent output in the generated files.
5. Run the fixed script to see the consistent result: `./bugSolution.sh`
