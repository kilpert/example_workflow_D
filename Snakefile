config = {
    "species": "homo_sapiens",
    "build": "GRCh38",
    "release": 106
}


def get_annotation_output(wildcards):
    return expand(
            "results/{build}.{release}.gtf",
            build=config["build"],
            release=config["release"],
    )


rule all:
    input:
        get_annotation_output,


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

