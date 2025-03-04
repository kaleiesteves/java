# Java Project
Automated build system for compiling and running Java projects.

## Installation
I suggest installing this in a sub-folder inside your user's home directory — for me this is '~/Workspaces/assignments'

Then clone the repository:
```
git clone 
```


## Project Tree
```
.
├── Dockerfile
├── README.md
├── XSort
│       ├── HeapSort.java
│       ├── MergeSort.java
│       ├── README.md
│       └── XSort.java
└── scripts
    ├── activate.sh
    └── build.sh
```

---
## Setting up Docker
When working with Docker on macOS, you'll also need **Colima** and Docker's `buildx` plugin enabled.


1. Install **Colima** and **Docker***
```
brew install colima
brew install docker
```

2. Install the `buildx` plugin
```
brew install docker-buildx
```

3. Enable `buildx` plugin
Open Docker's config file:
```
nano ~/.docker/config.json
```
Make sure it looks like this:
```
{
        "auths": {},
        "currentContext": "colima",
        "cliPluginsExtraDirs": [
                "/opt/homebrew/lib/docker/cli-plugins"
        ]
}
```

4. Start Colima
```
colima start
```
You can leave this running, but if you want to stop it you can `colima stop`


---
## How to use
I've made a light-weight virtual environment to automate the build system. It provides a 'build' function that triggers a chain of scripts to execute the whole process, including the run.

1. Activate the environment
```
source scripts/activate.sh
```
*Probably best to run this line while in the 'java/' directory!*

2. Run the test
```
build XSort
```
*The project folder should be the same name (case-sensitive) as the program.*

3. Deactivate the environment
```
deactivate
```
*This only needs to be done if you plan on closing the terminal and ending the session*


---
## Troubleshooting
If there's any issues, they're likely to be related to project structure and path definitions. **This environment does not edit the system PATH, or make use of it directly**, but you will need to make sure that '/opt/homebrew/bin' is at the start of your PATH variable.

#### Important
- Project names are case sensitive! I did this because Java's code conventions expect capitalised class names.
- The 


