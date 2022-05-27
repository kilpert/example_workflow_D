def txt_output(wildcards):
    return ["results/D.txt"]


def txt2_output(wildcards):
    return ["results/D2.txt"]


rule all:
    input:
        txt_output,
        txt2_output


rule txt:
    output:
        "results/D.txt"
    shell:
        "echo 'D' "
        ">{output} "


rule txt2:
    input:
        "results/D.txt"
    output:
        "results/D2.txt"
    shell:
        "echo 'D2' "
        ">{output} "
