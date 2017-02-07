default[:cocotoca][:user][:name] = 'cocotoca'
default[:cocotoca][:user][:enabled] = true

default[:cocotoca][:cfg_path] = '/etc/cocotoca'
default[:cocotoca][:run_path] = '/var/run/cocotoca'

default[:cocotoca][:gunicorn][:enabled] = true
default[:cocotoca][:gunicorn][:listen] = "0.0.0.0:8080"
default[:cocotoca][:gunicorn][:worker_class] = 'gevent'
default[:cocotoca][:gunicorn][:worker_processes] = node[:cpu][:total] * 2 + 1
default[:cocotoca][:gunicorn][:worker_timeout] = 60
# default access log format
default[:cocotoca][:gunicorn][:access_log_format] = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

default[:cocotoca][:runit][:svwait] = 180

default[:cocotoca][:revision][:tilequeue] = 'master'
default[:cocotoca][:revision][:mapbox_vector_tile] = 'master'
default[:cocotoca][:revision][:cocotoca] = 'master'

default[:cocotoca][:pip_requirements] = %w(
  pyparsing==2.1.10
  argparse==1.2.1
  boto==2.33.0
  Flask==0.12
  future==0.15.2
  hiredis==0.2.0
  itsdangerous==0.24
  Jinja2==2.8
  MarkupSafe==0.23
  ModestMaps==1.4.6
  protobuf==2.6.0
  psycopg2==2.5.4
  pyclipper==1.0.5
  pycountry==1.20
  pyproj==1.9.5.1
  python-dateutil==2.4.2
  PyYAML==3.11
  redis==2.10.5
  requests==2.10.0
  Shapely==1.4.3
  simplejson==3.6.4
  six==1.10.0
  StreetNames==0.1.5
  ujson==1.35
  Werkzeug==0.9.6
  wsgiref==0.1.2
  zope.dottedname==4.1.0
  git+https://github.com/ixc/python-edtf@aad32b8d5cd8848c50fbef92c73697a93cf182ba#edtf
)

default[:cocotoca][:pip_requirements] += [
  "git+https://github.com/tilezen/mapbox-vector-tile@#{node[:cocotoca][:revision][:mapbox_vector_tile]}#egg=mapbox-vector-tile",
  "git+https://github.com/tilezen/tilequeue@#{node[:cocotoca][:revision][:tilequeue]}#egg=tilequeue",
  "git+https://github.com/tilezen/cocotoca@#{node[:cocotoca][:revision][:cocotoca]}#egg=cocotoca"
]

default[:cocotoca][:store][:enabled] = false

default[:cocotoca][:buffer] = nil
default[:cocotoca][:layer_names] = []

default[:cocotoca][:metatile][:enabled]                      = true
default[:cocotoca][:metatile][:size]                         = 1
