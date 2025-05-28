# 📘 Student CSV Processor — Azure Function App

This project demonstrates a serverless solution using an Azure Blob-triggered JavaScript function. When a CSV file is uploaded to a designated Blob container, the function is triggered automatically. It parses student records and inserts them into Azure Table Storage for further use (e.g., analytics, dashboards, auditing).

---

## 📂 Project Structure

```
config-app.sh                   # Bash script to configure Azure resources
README.md                       # Project documentation
students.csv                    # Sample CSV input
upload.sh                       # Bash script to upload a test CSV

student-app/
├── src/
│   └── functions/
│       ├── function.json              # Defines the Blob trigger
│       ├── index.js                   # Contains the handler
│       ├── parseCsv.js                # CSV parsing logic
│       ├── insertStudent.js           # Logic to insert data into Table Storage
│       └── tableClient.js             # Table Storage client factory
├── host.json
├── local.settings.json
└── package.json
```

---

## 🧰 Technology Stack

- **Azure Functions v4** (Node.js runtime)
- **Azure Blob Storage** — for CSV uploads
- **Azure Table Storage** — for structured student data
- **JavaScript (Node.js 18+)**
- **NPM Packages**: `@azure/data-tables`, `csv-parse`, `uuid`

---

## 🚀 Initial Setup

- **Create the Azure Function app project**
  ```bash
  func init student-app --worker-runtime node --language javascript
  ```

- **Create a new Blob trigger function**
  ```bash
  cd student-app
  func new --name ProcessStudentCSV --template "Azure Blob Storage trigger"
  ```
---

## ✅ Requirements

### 🔧 Local Prerequisites

- **Azure Functions Core Tools v4**
  ```bash
  npm i -g azure-functions-core-tools@4 --unsafe-perm true
  func --version  # Should start with 4.x
  ```

- **Node.js 18 or later**
- **Install project dependencies**
  ```bash
  cd student-app
  npm install
  ```

- **Install required NPM packages**
  ```bash
  cd student-app
  npm install @azure/data-tables csv-parse uuid
  ```
---

### ☁️ Azure Prerequisites

- **Azure Subscription**
- **Azure Storage Account & Blob Container**
  - Automatically created via `config-app.sh`
- **Role Assignment: Storage Blob Data Contributor**
  Assign this role to your user to allow blob uploads (using Azure CLI or Azure Portal):
  ```bash
  az role assignment create --assignee <your-user-object-id> \
      --role "Storage Blob Data Contributor" \
      --scope "/subscriptions/<subscription-id>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account-name>"
  ```

---

## ⚙️ Setup and Deployment

### 1. Configure Azure Resources
Run the setup script to provision a resource group, storage account, container, and function app:

```bash
bash config-app.sh
```

### 2. Deploy to Azure
Publish the function to Azure:

```bash
cd student-app
func azure functionapp publish student-app
```

---

## 🧪 Test the Function

After deployment, run the upload script to trigger the function by uploading a sample CSV file:

```bash
bash upload.sh
```

Check the Function App logs (via Azure Portal or `func azure functionapp log-stream`) to verify successful execution and record insertion.

---

## 📌 Notes

- The function is triggered by any CSV file uploaded to the `student-files` container.
- The trigger pattern in `function.json` is configured as:
  ```json
  {
    "path": "student-files/{name}",
    ...
  }
  ```
- Each student record is parsed and inserted individually into the `StudentGrades` table.

---

## 📄 License

MIT License — Feel free to use, modify, and contribute.
