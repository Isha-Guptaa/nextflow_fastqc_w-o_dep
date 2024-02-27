params.reads = "${launchDir}/data/*.fq"

/**
 * Quality control fastq
 */

reads_ch = Channel
    .fromPath(params.reads)
    
process fastqc {

    input:
    path read  
    
    output:
    path "${read.baseName}_fastqc"
    
    script:
    """
    mkdir -p ${read.baseName}_fastqc
    fastqc ${read} -o ${read.baseName}_fastqc/
    """
}

workflow {
    fastqc(reads_ch)
}
