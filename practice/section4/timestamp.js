const dateStr = "1970-01-01 00:00:01";
const dateObj = new Date(dateStr +  " UTC");
const timestamp = Math.floor(dateObj.getTime() / 1000);
console.log(timestamp);