config = {
    "species": "homo_sapiens",
    "build": "GRCh38",
    "release": 106
}


rule all:
    input:
        expand(
            "results/{build}.{release}.gtf",
            build=config["build"],
            release=config["release"],
        )


rule get_annotation:
    output:
        "results/{build}.{release}.gtf",
    params:
        species=config["species"],
        release=config["release"],
        build=config["build"],
        flavor=""
    cache: True
    wrapper:
        "v1.4.0/bio/reference/ensembl-annotation"

