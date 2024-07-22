from datetime import datetime, timezone

date_str = "1970-01-01 00:00:01"
date_obj = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")
ts = int(date_obj.replace(tzinfo=timezone.utc).timestamp())
print(ts)