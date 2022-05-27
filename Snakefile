subdir = "subdir"


def txt_output(wildcards):
    return [f"results/{subdir}/D.txt"]


rule all:
    input:
        txt_output,


rule txt:
    output:
        f"results/{subdir}/D.txt"
    shell:
        "echo 'D' "
        ">{output} "


