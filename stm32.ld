SECTIONS
{
    .  = 0x0;         /* From 0x00000000 */
    .text : 
    {
        *(isr_vector) /* Interrupt Service Routine Vector table */
        *(.text)      /* Program code */
    }
}  