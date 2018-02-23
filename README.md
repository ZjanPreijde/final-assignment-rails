# Student Evaluations

Select all students for Batch

```ruby
batch_id = 1
@students = Student.where(batch_id: batch_id)
```





Also rather handy :

```shell
$ git remote -v
```



Other Tidbits

Under the hood with Devise:

```shell
$ export BUNDLER_EDITOR='atom'
$ bundle open devise
```



create date :  1.days.from_now, -1.days.from_now

truncate to date only : datetime.to_date