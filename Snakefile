config = {
    "species": "homo_sapiens",
    "build": "GRCh38",
    "release": 106
}


def get_annotation_output(wildcards):
    paths = []
    
    paths.extend(
        expand(
            "results/{build}.{release}.gtf",
            build=config["build"],
            release=config["release"],
        )
    )
    
    return paths


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
        flavor="",  # optional, e.g. chr_patch_hapl_scaff, see Ensembl FTP.
    cache: True  # save space and time with between workflow caching (see docs)
    wrapper:
        "v1.4.0/bio/reference/ensembl-annotation"

