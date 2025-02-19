#!/bin/bash

# Prompt user for their name
echo -n "Enter your name: "
read user_name

dir_name="submission_reminder_${user_name}"

# Create main directory and subdirectories
mkdir -p $dir_name/{app,modules,assets,config}

# Create and populate config.env file
cat <<EOF > $dir_name/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Create and populate reminder.sh file
cat <<EOF > $dir_name/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "\$submissions_file"
EOF

# Create and populate functions.sh file
cat <<EOF > $dir_name/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOF

# Create and populate submissions.txt file
cat <<EOF > $dir_name/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Gisele, Shell Navigation, not submitted
Amen, Shell Navigation, submitted
Mwizera, Shell Basics, not submitted
Herve, Git, submitted
Miguel, Shell Navigation, not submitted
EOF

# Create and populate startup.sh file
cat <<EOF > $dir_name/startup.sh
#!/bin/bash

# Navigate to the application directory
cd "\$(dirname "\$0")"

# Make scripts executable
chmod +x app/reminder.sh modules/functions.sh startup.sh

# Run the reminder script
bash app/reminder.sh
EOF

# Make all .sh scripts executable
chmod +x $dir_name/app/reminder.sh $dir_name/modules/functions.sh $dir_name/startup.sh

echo "Environment setup complete!"

