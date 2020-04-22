#!/bin/sh
docker run --rm --network management_default docker.elastic.co/beats/filebeat:7.6.2 setup --index-management -E setup.ilm.overwrite=true -E 'output.elasticsearch.hosts=["elasticsearch:9200"]'
docker run --rm --network management_default docker.elastic.co/beats/filebeat:7.6.2 setup --dashboards -E setup.kibana.host=kibana-api:5601/kibana
docker run --rm --network management_default docker.elastic.co/beats/metricbeat:7.6.2 setup --index-management -E setup.ilm.overwrite=true -E 'output.elasticsearch.hosts=["elasticsearch:9200"]'
docker run --rm --network management_default docker.elastic.co/beats/metricbeat:7.6.2 setup --dashboards -E setup.kibana.host=kibana-api:5601/kibana
