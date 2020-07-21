# Chart URL Table

## Continuous Integration

[![Run Status](https://api.shippable.com/projects/5f1568b83660230007857b52/badge?branch=master)]()

https://app.shippable.com/github/svo/chart-url-table/dashboard

## Solution Design

### Decisions

* using ruby as wanting to build familiarity to aid feasibility analysis on a marketplace open source project
* command line interface is sufficient
* if more than one table in the document it will just use the first
* if more than one numeric column in the table it will just use the first
* column considered numeric if values begin with a number consistently

### Activity

![Activity UML](docs/activity.png)

## Running Application

#### Using Vagrant

e.g.

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./bash/run.sh https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression
```

Uses 'https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression' as URL by default.

#### Using Docker Build Image

e.g.

```
./run.sh https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression
```

Uses 'https://en.wikipedia.org/wiki/Women%27s_high_jump_world_record_progression' as URL by default.

## Development

### Setup (Docker)

```
docker login
vagrant up docker
vagrant ssh docker
```

### Setup (VirtualBox)

```
vagrant up virtualbox
vagrant ssh virtualbox
```

### Setup (Both VirtualBox and Docker)

```
docker login
vagrant up
vagrant ssh [docker | virtualbox]
```

### Running Tests

#### Using Vagrant

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./bash/test.sh
```

#### Using Docker Build Image

```
./test.sh
```

## Configuration Management

### Create Development Docker Image

Created using ansible playbook: `configuration-management/ansible/playbook-development.yml`

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./bash/create-development.sh
```

### Create Build Docker Image

Created using ansible playbook: `configuration-management/ansible/playbook-buildnode.yml`

```
vagrant ssh [docker | virtualbox]
cd /vagrant
./bash/create-buildnode.sh
```
