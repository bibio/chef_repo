# chef_repo

A kitchen of my development environment.

## How to create a cookbook

```
$ cd /path/to/chef_repo
$ chef generate cookbook <cookbook name>
```

Edit a recipe(`/path/to/chef_repo/<cookbook name>/recipes/default.rb`)

## How to cook in local-mode

```
$ cd /path/to/chef_repo
# WhyRun
$ chef-client -z --runlist 'recipe[<cookbook name>]' -W
# Cook!
$ chef-client -z --runlist 'recipe[<cookbook name>]'
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
