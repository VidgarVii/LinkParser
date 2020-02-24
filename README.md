# LinkParser

Collects less information about sites

## Install

* bundle
* bundle exec rake db:migrate

## Use

* rackup
* POST request to http://localhost:9292/site with params 'links' => ['https://site.com']
* For async mode off need in the request add param 'async_off'

-------------------
The request execution time is recorded in the response header 'X-Runtime'

Responsible for is middleware AppRuntime

Runtime Benchmark for async mode (default) vs sync mode, sec

|count link  | async on  | async off |          
| ---------- | --------- |-----------|
|1           | 0,2 - 0,4 | 0,2-0,4   |
|5           | 0,8 - 0,9 | 2-3       |
|10          | 0,8 - 1,3 | 5-7       |
|25          | 0,8 - 1,4 | 11-12     |
