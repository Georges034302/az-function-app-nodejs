#!/bin/bash


echo "🚀 Uploading students.csv to Azure Blob Storage..."
az storage blob upload \
  --account-name studentappstorage2025 \
  --container-name student-files \
  --name students.csv \
  --file students.csv \
  --auth-mode login

echo "✅ Upload complete. students.csv has been uploaded to the student-files container."
