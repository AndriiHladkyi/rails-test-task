Create blog with the next requirements:
Category has many posts.
Each post has shared url, which has expired time (destroy url in 15 minutes after creation, set nil value)
Each post has title, which is generating automatically after creation (title 1, title 2, ..., title n; n - current number of posts)
(*) User can get categories, which have posts with shared url (post.url != nil)
UI part doesn’t matter. It’s important to check code quality. It will be better if you add some specs.
(*) - not required, just for advanced logic.
