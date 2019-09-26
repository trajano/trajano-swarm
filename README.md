# Trajano base Docker swarm stacks

This contains the stack files used to deploy my Docker swarm.  It uses Traefik 2.0 to do the TLS routing and SSL termination, Apache HTTP to do the SSL client certificate validation and another Traefik to manage the intranet services.

It uses the label `intranet=true` to distinguish intranet services from external services.

In addition, this has a management plane which provides Zipkin and Portainer agents and a management UI stack exposed to the intranet to access the necessary info.

## Required files

The mappings to the following files should change to match your CA, Intranet DMZ certificate and Intranet DMZ private key respectively.

    - /d/p/trajano.net/devops-ca-R2.crt
    - /d/p/trajano.net/intranet_dmz/i.trajano.net.pem
    - /d/p/trajano.net/intranet_dmz/key.pem

## Deploying

    docker stack deploy -c management.yml --prune management
    docker stack deploy -c edge.yml --prune edge
    docker stack deploy -c intranet.yml --prune intranet
    docker stack deploy -c management-ui.yml --prune management-ui
