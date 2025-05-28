#!/bin/bash

# Navigate to the project root
cd student-app || { echo "❌ student-app directory not found"; exit 1; }

# Remove src/functions if it exists
if [ -d "src/functions" ]; then
  rm -rf src/functions
  echo "✅ Removed src/functions"
fi

# Remove src/ if empty
if [ -d "src" ] && [ -z "$(ls -A src)" ]; then
  rmdir src
  echo "✅ Removed empty src/"
fi

# Create ProcessStudentCSV directory
mkdir -p ProcessStudentCSV

# Create empty files
touch ProcessStudentCSV/function.json
touch ProcessStudentCSV/index.js
touch ProcessStudentCSV/parseCsv.js
touch ProcessStudentCSV/insertStudent.js
touch ProcessStudentCSV/tableClient.js

echo "✅ Created ProcessStudentCSV/ with empty function files"
