exports.openByIdImpl = SpreadsheetApp.openById;
exports.getSheetByNameImpl = (s, name) => s.getSheetByName(name);
exports.getRangeImpl = (s, row, col, nrows, ncols) => s.getRange(row, col, nrows, ncols);
exports.getDisplayValuesImpl = r => r.getDisplayValues();
exports.getValuesImpl = r => r.getValues();
exports.isString = s => typeof s === 'string';
exports.isNumber = s => typeof s === 'number';
