# Java Projects
Automated build system for compiling and running Java projects.
This includes a minimal virtual environment with a `build` command.

The main idea is that you'll be able to write and test programs while using a personal machine as if it's running Linux. It helps keeps things consistent across different platforms. 

This project aims to provide a minimal starting point that can be used as a template for a custom build system. I also have [this repo in progress](https://github.com/kaleiesteves/gradle) for a Gradle build system.

## Installation
I suggest installing this in a sub-folder inside your user's home directory. 

For me this is _'~/Workspaces/assignments'_, and so if you want to mirror this for consistency then run:
```
mkdir -p ~/Workspaces/Assignments && cd ~/Workspaces/Assignments
```

Then while in that directory, run this line to clone the repo:
```
git@github.com:kaleiesteves/java.git
```


## Repo Tree
The root of the build system is _'java/'_ which contains the sub-directories of the projects to build, the _'scripts/'_ used for the environment and automation, and finally the **Dockerfile** which defines the settings for the image used for compiling and running the Java projects.
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
    ├── activate.sh <- `source scripts/activate.sh`
    └── build.sh
```


---
## Setting up Docker
When working with Docker on macOS, you'll also need Colima and Docker's `buildx` plugin enabled.


1. Install **Colima** and **Docker**
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
I've made a light-weight virtual environment to automate the build system. It provides a `build` command that triggers a chain of scripts to execute the whole process, including the run.

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
If there's any issues, they're likely to be related to project structure and path definitions. 

**This environment does not edit the system PATH, or make use of it directly**, but you will need to make sure that _'/opt/homebrew/bin'_ is at the start of your PATH variable.


#### Important
- Project names are case sensitive! I did this because Java's code conventions expect capitalised class names.
- 


