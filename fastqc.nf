params.input = "${launchDir}/data/*.fastq.gz"

/**
 * Quality control fastq
 */

input_ch = Channel
    .fromPath(params.input)
    
process fastqc {

    input:
    path input  
    
    output:
    path "${input.baseName}_fastqc"
    
    script:
    """
    mkdir -p ${input.baseName}_fastqc
    fastqc ${input} -o ${input.baseName}_fastqc/
    """
}

workflow {
    fastqc(input_ch)
}
