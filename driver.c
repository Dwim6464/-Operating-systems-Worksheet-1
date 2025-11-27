int __attribute__ ((cdecl)) asm_main( void );

int main() {
    int ret_status;
    ret_status = asm_main();
    //This calls an assembly function named asm_main() and return its result. it is red because asm_main does not exist in this file.
    return ret_status;
}
