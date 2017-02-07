Cocotoca Cookbook
=================

This cookbook installs and configures Cocotoca, the overzooming service.

Requirements
------------

#### packages
- `apt` - to install OS packages.
- `git` - to grab the source for Cocotoca.
- `gunicorn` - to run the Cocotoca web service.
- `python` - because Cocotoca is written in Python.
- `runit` - to wrap and manage the Cocotoca service.
- `user` - to make a user to run Cocotoca.

Attributes
----------


- `[:cocotoca][:user][:name]` - User name to use, default: 'cocotoca'
- `[:cocotoca][:user][:enabled]` - Whether to create an account for the user above, default: true
- `[:cocotoca][:cfg_path]` - Directory to create to contain configuration files, default: '/etc/cocotoca'
- `[:cocotoca][:run_path]` - Directory to create to contain runtime files, default: '/var/run/cocotoca'
- `[:cocotoca][:gunicorn][:enabled]` - Whether to enable gunicorn, default: true
- `[:cocotoca][:gunicorn][:listen]` - Address to listen on for requests, default: "0.0.0.0:8080"
- `[:cocotoca][:gunicorn][:worker_class]` - Gunicorn worker class to use, default: 'gevent'
- `[:cocotoca][:gunicorn][:worker_processes]` - Number of worker processes to use, default: NCPUs * 2 + 1
- `[:cocotoca][:gunicorn][:worker_timeout]` - Time in seconds to wait for a response from a worker before killing it, default: 60
- `[:cocotoca][:gunicorn][:access_log_format]` - Access log format, default: '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'
- `[:cocotoca][:runit][:svwait]` - Time in seconds to wait for the runit service to stabilise, default: 180
- `[:cocotoca][:revision][:tilequeue]` - Tag or branch of tilequeue to use, default: 'master'
- `[:cocotoca][:revision][:mapbox_vector_tile]` - Tag or branch of MVT library to use, default: 'master'
- `[:cocotoca][:revision][:cocotoca]` - Tag or branch of Cocotoca to use, default: 'master'
- `[:cocotoca][:pip_requirements]` - List of requirements and versions to install with `pip`.
- `[:cocotoca][:store][:enabled]` - Whether there is a store to fetch tiles from. This is required, so you must override it. Default: false
- `[:cocotoca][:buffer]` - Optional buffer config. Default: nil
- `[:cocotoca][:layer_names]` - List of layer names in the 'all' tile. Default `[]`
- `[:cocotoca][:metatile][:enabled]` - Whether the tile store supports metatiles, default: true
- `[:cocotoca][:metatile][:size]` - Size of the metatiles in store, default: 1

Usage
-----

#### cocotoca::default

Just include `cocotoca` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[cocotoca]"
  ]
}
```

Contributing
------------

We welcome contributions to Cocotoca's cookbook. Please use the "Github workflow" as follows:

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License
-------

This cookbook is released as open source under the MIT license.
