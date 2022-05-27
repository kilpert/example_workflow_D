configfile: "config.yaml"


results = config["results"]


def txt_output(wildcards):
    return [f"{results}/D.txt"]


rule all:
    input:
        txt_output,


rule txt:
    output:
        "results/D.txt"
    shell:
        "echo 'D' "
        ">{output} "


