# BlobTrigger - JavaScript

The `BlobTrigger` makes it incredibly easy to react to new Blobs inside of Azure Blob Storage. This sample demonstrates a simple use case of processing data from a given Blob using JavaScript.

## How it works

For a `BlobTrigger` to work, you provide a path which dictates where the blobs are located inside your container, and can also help restrict the types of blobs you wish to return. For instance, you can set the path to `samples/{name}.png` to restrict the trigger to only the samples path and only blobs with ".png" at the end of their name.

---

### 1. Scaffold Local Function 
```bash
mkdir student-app && cd student-app
func init . --worker-runtime node
func new --name ProcessStudentCSV --template "Azure Blob Storage trigger"
# Blob path: student-files/{name}
```

### 2. Install Dependencies
```bash
npm install @azure/data-tables csv-parse uuid
```

### 3. Create function.json
```bash
function.json
```

### 4. Create App Files
```bash
index.js

parseCsv.js

tableClient.js

insertStudent.js
```

### 5. Create Setup BASH
```bash
config-app.sh
```

###  6. Publish to Azure
```bash
func azure functionapp publish student-app
```

---

### ✅ After Successful Publish:
* Your function is live

* Uploading a .csv to Blob container student-files will trigger the function

* Parsed student rows will be saved in Table Storage → StudentGrades

---