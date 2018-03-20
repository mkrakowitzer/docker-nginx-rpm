#!/bin/bash

rpmbuild -ba ~/rpmbuild/SPECS/nginx.spec
rpmbuild -D 'debug_package %{nil}' -ba ~/rpmbuild/SPECS/nginx-module-geoip2.spec
rpmbuild -D 'debug_package %{nil}' -ba ~/rpmbuild/SPECS/nginx-module-vts.spec
rpmbuild -D 'debug_package %{nil}' -ba ~/rpmbuild/SPECS/nginx-module-substitutions_filter.spec

cp -r ~/rpmbuild/SRPMS /rpms
cp -r ~/rpmbuild/RPMS /rpms
