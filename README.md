# Ruby on Rails N+1 examples

Launch GitHub Codespaces and run `bundle exec rspec spec` to see the N+1 problem in action, or clone the repository and run `docker compose run --rm app bundle exec rspec spec` to see the N+1 problem in action.

You can see the N+1 problem in the logs.

```log
root@1af4793ae0dd:/app# bundle exec rspec spec
**
Executed SQL queries:
1. SHOW search_path
2. SELECT "mice".* FROM "mice"
3. SELECT "baby_mouses".* FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
4. SELECT "baby_mouses".* FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
5. SELECT "baby_mouses".* FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
6. SELECT "baby_mouses".* FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1

Total queries: 6
[Warning] N+1 Queries！
.
Executed SQL queries:
1. SELECT "mice".* FROM "mice"
2. SELECT COUNT(*) FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
3. SELECT COUNT(*) FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
4. SELECT COUNT(*) FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1
5. SELECT COUNT(*) FROM "baby_mouses" WHERE "baby_mouses"."mouse_id" = $1

Total queries: 5
[Warning] N+1 Queries！
.

Pending: (Failures listed here are expected and do not affect your suite's status)

  1) BabyMouse add some examples to (or delete) /app/spec/models/baby_mouse_spec.rb
     # Not yet implemented
     # ./spec/models/baby_mouse_spec.rb:4

  2) Mouse add some examples to (or delete) /app/spec/models/mouse_spec.rb
     # Not yet implemented
     # ./spec/models/mouse_spec.rb:4


Finished in 0.29178 seconds (files took 3.23 seconds to load)
4 examples, 0 failures, 2 pending
```

Try to fix the N+1 problem!
