# chef_repo

A kitchen of my development environment.

## How to create a cookbook

```
$ cd /path/to/chef_repo/cookbooks
$ chef generate cookbook <cookbook name>
```

Edit a recipe(`/path/to/chef_repo/<cookbook name>/recipes/default.rb`)

## How to cook in local-mode

```
$ cd /path/to/chef_repo
# WhyRun
$ chef-solo -j nodes/localhost.json -c solo.rb -W
# Cook!
$ chef-solo -j nodes/localhost.json -c solo.rb 
```

## Simple recipe

1.Write a recipe.
```~/chef_repo/server.rb
package "httpd"
service "httpd"
```
2.Apply a recipe.
```
$ chef-apply <recipe filepath> -W
$ chef-apply <recipe filepath>
```
