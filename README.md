# MHO Server Docker

## Getting Started

### Prereq

#### Software

| Name | Link |
|------|------|
| Docker | https://docs.docker.com/engine/install/ | 

#### Finding the Necessary Files

In order to build the image, both the `mu_cdata.sip` and `Calligraphy.sip` files will need to be copied into the `data/` folder of this project. These files can be found in
the `Data/Game/` folder of your Marvel Heroes installation. These instructions will not provide any instructions on how to download the client. After copying the files into the `data/`
folder, move on to the next step.

### Usage

```bash
cd mho-server-docker

# Build Image
docker compose build .

# Run Containers (use -d to run in detached mode)
docker compose up
```

#### General Instructions

Run the Marvel Heroes client with the following command line parameters:

```bash
-siteconfigurl=localhost/SiteConfig.xml -emailaddress=test@test.com -password=123
```


