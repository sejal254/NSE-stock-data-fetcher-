import requests

url_equitySegment="https://archives.nseindia.com/content/equities/EQUITY_L.csv"
req=requests.get(url_equitySegment)
url_content = req.content
csv_file=open('equitySegment.csv','wb')
csv_file.write(url_content)
csv_file.close()

date="26122022"
url_bhavcopy=f"https://archives.nseindia.com/products/content/sec_bhavdata_full_{date}.csv"
req=requests.get(url_bhavcopy)
url_content = req.content
f_name=f"bhavcopy{date}.csv"
csv_file=open(f_name,'wb')
csv_file.write(url_content)
csv_file.close()

for i in range(1,26):
    dates_holiday=[3,4,10,11,17,18,24,25]
    if i not in dates_holiday:
        if i<=9:
            i=f"0{i}"
        else:
            i=str(i)
        
        date=f"{i}122022"
        url_bhavcopy=f"https://archives.nseindia.com/products/content/sec_bhavdata_full_{date}.csv"
        url_equitySegment="https://archives.nseindia.com/content/equities/EQUITY_L.csv"
        req=requests.get(url_bhavcopy)
        url_content = req.content
        csv_file=open(f'bhavcopy{date}.csv','wb')
        csv_file.write(url_content)
        csv_file.close()