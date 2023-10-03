#!/bin/bash
# This is a rofi script that opens an application menu
# with useful Royal Holloway links. Make sure rofi is installed!

# Script by Otto Helen-Goldring
# https://github.com/Weetile/weetile-compsci-rhul-resources

# Define the options and corresponding links for Rofi
options=("💡 Campus Connect" "📚 Moodle" "📧 Mail" "📅 Timetable" "⏱️  Attendance" "📰 Piazza" "🖥️ CIM GitLab Server")
links=("https://campus-connect.royalholloway.ac.uk/" 
       "https://moodle.royalholloway.ac.uk/"
       "https://outlook.office365.com/mail/"
       "https://webtimetables.royalholloway.ac.uk/SWS/SDB2324SWS/default.aspx"
       "https://generalssb-prod.ec.royalholloway.ac.uk/BannerExtensibility/customPage/page/RHUL_Attendance_Student"
       "https://piazza.com/"
       "https://gitlab.cim.rhul.ac.uk/")

# Get the user's choice using Rofi
selected_option=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Choose a link")

# Find the selected option in the options list
index=-1
for i in "${!options[@]}"; do
    if [[ "${options[$i]}" = "${selected_option}" ]]; then
        index=$i
        break
    fi
done

# Open the corresponding link if a valid option is selected
if [ "$index" -ne -1 ]; then
    xdg-open "${links[$index]}"
fi
