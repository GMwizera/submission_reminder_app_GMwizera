# Submission Reminder App

## Overview
The **Submission Reminder App** is a simple shell script-based application that alerts students about upcoming assignment deadlines. It reads submission records and notifies students who have not submitted their assignments.

## Directory Structure
After running the setup script, the following directory structure will be created:

```
submission_reminder_{yourName}/
│-- app/
│   └── reminder.sh
│-- modules/
│   └── functions.sh
│-- assets/
│   └── submissions.txt
│-- config/
│   └── config.env
│-- startup.sh
```

## How to Run the Application

### 1. Clone the Repository
```sh
git clone https://github.com/GMwizera/submission_reminder_app_GMwizera.git
cd submission_reminder_app_GMwizera
```

### 2. Run the Setup Script
```sh
chmod +x create_environment.sh
./create_environment.sh
```
You will be prompted to enter your name. The directory `submission_reminder_{yourName}` will be created with all necessary files.

### 3. Navigate to the Created Directory
```sh
cd submission_reminder_{yourName}
```

### 4. Start the Reminder App
```sh
./startup.sh
```
This will execute the script and check the `submissions.txt` file for students who haven't submitted their assignments.



