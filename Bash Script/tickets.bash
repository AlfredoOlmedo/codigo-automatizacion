#!/bin/bash
# Process hight priority tickets

# Function to process high priority tickets
process_high_priority() {
    echo "Processing high priority tickets..."
    # Add commands to handle high priority tickets
}

# Function to process medium priority tickets
process_medium_priority() {
    echo "Processing medium priority tickets..."
    # Add commands to handle medium priority tickets
}

# Function to process low priority tickets
process_low_priority() {
    echo "Processing low priority tickets..."
    # Add commands to handle low priority tickets
}

# Main function to triage tickets
triage_tickets() {
    while read ticket; do
        priority=$(echo $ticket | cut -d',' -f2)
        case $priority in
            "High")
                process_high_priority ;;
            "Medium")
                process_medium_priority ;;
            "Low")
                process_low_priority ;;
            *)
                echo "Unknown priority: $priority" ;;
        esac
    done < "$1"
}

# Check if input file provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file not found."
    exit 1
fi

# Start triaging tickets
triage_tickets "$input_file"


# Save the Script
# Grant Permissions chmod +x triage_tickets.sh
# Run it by passing the input file containing the tickets as an argument ./triage_tickets.sh tickets.csv
# Nota: 
# Assuming the ticket file is in CSV format with each row containing the ticket ID and priority level (e.g., ticket1,High), this script reads the file, processes each ticket according to its priority level, and outputs the corresponding actions for each priority level. You'll need to fill in the actions to be performed for each priority level within the respective functions.
