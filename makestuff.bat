call rails generate scaffold Property name:string address:string city:string state:string zip:string
call rails generate scaffold Unit name:string sq_ft:integer --skip -migration
call rails generate scaffold Lease start_date:date end_date:date rent:integer
call rails generate scaffold RepairRequest open_date:date close_date:date request_details:text request_response:text




