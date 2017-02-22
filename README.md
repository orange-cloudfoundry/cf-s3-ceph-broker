# S3 Ceph (Rados Gateway) Service Broker for Cloud Foundry


### Description

This is a [S3 Ceph](http://docs.ceph.com/) service broker for Cloud Foundry.

This service broker allows users to provision instances of an S3-compatible storage service.
Provisioning the service creates a Ceph bucket through [rados gateway](http://docs.ceph.com/docs/master/radosgw/).
Binding an application creates unique credentials for that application to access the bucket.

Highly based on [the Riak service broker by pivotal](https://github.com/cloudfoundry/cf-riak-cs-broker).

### Prerequisites

This service broker must be configured to access a Rados Gateway.

### Testing

To run all specs: `rake`

### Usage

Set your configuration through the `manifest.yml` when running in cloud foundry or set env var which can be found in this file.
*(Optional)* Configure the `settings.yml` to change your catalog.


#### Start locally

Start the S3 Ceph Service Broker:


```
bundle exec rackup
```

Add the broker to Cloud Foundry as described by [the service broker documentation](http://docs.cloudfoundry.org/services/managing-service-brokers.html).

#### Start on cloud foundry

```
cf push
```