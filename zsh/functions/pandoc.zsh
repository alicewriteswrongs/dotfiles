function bigpdf() {
    local pdfname=$(echo $1 | cut -d "." -f 1).pdf

    pandoc \
        -V geometry:margin=1in \
        --variable colorlinks=true \
        $1 \
        -o $pdfname
}
