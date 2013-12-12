chef-trinity Cookbook
====================
Chef cookbook to configure servers according to trinity standard setup

TODO
----
#### Make this work on non vagrant/chef-solo installs..

Usage
-----
#### chef-trinity::default

e.g.
Just include `chef-trinity` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-trinity]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: patrick@trinity-ai.com
