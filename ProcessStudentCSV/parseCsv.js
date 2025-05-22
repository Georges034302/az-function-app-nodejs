const parse = require("csv-parse/lib/sync");

function parseCsv(csvText) {
    return parse(csvText, {
        columns: true,
        skip_empty_lines: true,
    });
}

module.exports = { parseCsv };
