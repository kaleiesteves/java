# XSort
[TODO: Complete README for XSort markers]

## Assignment
Project:    COMPX301 Assignment 1
Program:    XSort
User:       ke131
ID:         1282608

---
## Project Structure
```
.
└── XSort
    ├── README.md
    ├── HeapSort.java
    ├── MergeSort.java
    └── XSort.java
```

---
## Development Environment
I'm using an M2 MacBook with macOS Sequoia (version 15.3.1) for development. The program is compiled and run using a customised Docker (version 27.5.1) image.

**Docker Image**
Architecture:   arm64
System:         Linux
Distribution:   Ubuntu 24.04
Java:           jdk-17.0.14+7

---
## Building and Running
Markers should be able run the `javac` command to compile then `java` to run to program.

1. Compile
```
javac *.java
```

2. Initial Run
```
cat input.txt | java XSort <length> > output.txt
```
Replace <length> with the length of the runs.

3. Final Run
```
cat input.txt | java XSort <length> <split> > output.txt
```
Replace <split> with the number 2 or 4 (two-way or four-way merge sort)
