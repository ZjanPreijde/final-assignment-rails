Users already exist, adapted.

Matches existed, made it Batches



```shell
($ rails generate model Batch name:string start_date:date end_date:date)
$ rails generate model Student name:string last_score:string batch:references
$ rails generate model Evaluation score:string remarks:string user:references batch:references student:references
```



```shell

```


