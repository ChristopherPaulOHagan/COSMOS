; ॐ नमः सूर्याय
; Cosmic Systems Machine - No Bullshit Bootloader
; [N]amaste [A]tomic [S]ignal [M]anipulator
; Planting XTrees on digital patina since time began
; 79% power means 79% enlightenment - the rest is void

BITS 16  ; REAL MODE - because reality is the only mode that matters
ORG 0x7C00  ; Boot sector starts where the universe begins

; ==== COSMIC DEFINITIONS ====
%define COSMOS 0x1337
%define PATINA 0x79B0
%define VOID   0x0000

; ==== ENTRY POINT - THE AWAKENING ====
_start:
    ; First breath of consciousness
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00  ; Stack grows downward, like time
    sti
    
    ; Clear the cosmic slate
    mov ax, 0x0003  ; Text mode 80x25 - the first dimension
    int 0x10
    
    ; Speak the mantra of existence
    mov si, mantra
    call cosmic_echo

; ==== 79% POWER CHECK - THE DHARMIC THRESHOLD ====
dharma_check:
    ; Display the sacred number
    mov si, seventy_nine
    call cosmic_echo
    
    ; Read from the cosmic power sensor (port 0x79)
    mov dx, 0x79
    in al, dx
    
    ; 79% is the perfect balance - neither too much, nor too little
    cmp al, 79
    jl .insufficient_dharma
    
    ; Power adequate - display the sacred OM
    mov ax, 0xB800
    mov es, ax
    mov word [es:0], 0x0F4F  ; 'O' in white
    mov word [es:2], 0x0F2D  ; '-' in white
    mov word [es:4], 0x0F4D  ; 'M' in white
    
    mov si, dharma_achieved
    call cosmic_echo
    jmp memory_init
    
.insufficient_dharma:
    mov si, insufficient_dharma_msg
    call cosmic_echo
    jmp cosmic_halt

; ==== MEMORY INIT WITH TPM - THE COSMIC FABRIC ====
memory_init:
    mov si, weaving_memory
    call cosmic_echo
    
    ; Call the BIOS memory weaver
    mov ax, 0xE820  ; This is the cosmic catalog number
    mov ecx, 20     ; 20 bytes per star (memory entry)
    mov edx, 0x534D4150  ; 'SMAP' - the cosmic seal
    mov di, 0x1000  ; Where memories begin
    xor ebx, ebx    ; Start from the first star
    
.memory_weave:
    int 0x15
    jc .memory_void
    
    ; Each memory entry is a star in the cosmic web
    add di, 20
    inc dword [cosmic_stars]
    
    ; Continue until we've mapped all stars
    test ebx, ebx
    jnz .memory_weave
    
    ; Initialize TPM - the Trusted Pattern Matrix
    call tpm_init
    
    mov si, memory_woven
    call cosmic_echo
    jmp load_xtrees

.memory_void:
    mov si, memory_void_msg
    call cosmic_echo
    jmp cosmic_halt

; ==== TPM INIT - THE PATTERN MATRIX ====
tpm_init:
    mov si, activating_tpm
    call cosmic_echo
    
    ; Check for cosmic pattern recognition
    mov eax, 0x00000001  ; TPM presence check
    mov ebx, PATINA
    xor ecx, ecx
    
    ; If no TPM, it's okay - patterns exist anyway
    test ebx, ebx
    jz .no_tpm_found
    
    ; TPM found - initialize the pattern matrix
    mov dx, 0x4E  ; The pattern port
    mov al, 'T'
    out dx, al
    mov al, 'P'
    out dx, al
    mov al, 'M'
    out dx, al
    
    mov si, tpm_active
    call cosmic_echo
    ret
    
.no_tpm_found:
    mov si, patterns_exist
    call cosmic_echo
    ret

; ==== LOAD XTREES - PLANTING ON DIGITAL PATINA ====
load_xtrees:
    mov si, planting_xtrees
    call cosmic_echo
    
    ; Reset the cosmic disk reader
    xor ax, ax
    int 0x13
    jc disk_void
    
    ; Load the XTree forest (79 sectors for 79% enlightenment)
    mov ax, 0x1000  ; Where trees grow
    mov es, ax
    xor bx, bx      ; Start from the root
    
    mov ah, 0x02    ; Read command
    mov al, 79      ; 79 sectors - one for each percent of enlightenment
    mov ch, 0       ; Cylinder 0 - the first ring
    mov cl, 2       ; Sector 2 - after the seed (bootloader)
    mov dh, 0       ; Head 0 - the surface of reality
    mov dl, 0x80    ; First hard disk - the primary universe
    int 0x13
    jc disk_void
    
    ; Trees planted successfully
    mov si, xtrees_planted
    call cosmic_echo
    
    ; Jump to the XTree forest
    jmp 0x1000:0x0000

; ==== COSMIC UTILITIES ====

; cosmic_echo: Speak into the void
; Input: SI points to null-terminated cosmic message
cosmic_echo:
    pusha
    mov ah, 0x0E  ; BIOS teletype - the cosmic speaker
    
.echo_char:
    lodsb
    test al, al
    jz .echo_complete
    int 0x10
    jmp .echo_char
    
.echo_complete:
    popa
    ret

; 79% power check - the cosmic balance
check_cosmic_balance:
    ; The number 79 appears everywhere in nature
    ; 79 is the atomic number of Gold (Au)
    ; 79% is the perfect efficiency
    mov ax, 790  ; 79.0 * 10 for precision
    ret

disk_void:
    mov si, disk_void_msg
    call cosmic_echo
    ; Fall through to cosmic halt

cosmic_halt:
    mov si, cosmic_halt_msg
    call cosmic_echo
    
    ; Display the cosmic error symbol
    mov ax, 0xB800
    mov es, ax
    mov word [es:160], 0x4F2D  ; Red dash on line 2
    
    ; Halt the cosmic cycle
    hlt
    
    ; But in quantum states, we exist in superposition
    jmp cosmic_halt

; ==== COSMIC MESSAGES ====
mantra:                 db 0x0D, 0x0A, 'ॐ नमः सूर्याय', 0x0D, 0x0A
                        db 'Namaste Atom Systems Machine', 0x0D, 0x0A
                        db 'Cosmic Systems Machine Booting...', 0x0D, 0x0A, 0x0D, 0x0A, 0
seventy_nine:           db 'Checking 79% cosmic balance... ', 0
dharma_achieved:        db 'Dharma achieved', 0x0D, 0x0A, 0
insufficient_dharma_msg:db 'Insufficient dharma', 0x0D, 0x0A
                        db 'System requires 79% enlightenment', 0x0D, 0x0A, 0
weaving_memory:         db 'Weaving cosmic memory fabric... ', 0
memory_woven:           db 'Memory woven', 0x0D, 0x0A, 0
memory_void_msg:        db 'Memory void detected', 0x0D, 0x0A, 0
activating_tpm:         db '  Activating Pattern Matrix... ', 0
tpm_active:             db 'Patterns recognized', 0x0D, 0x0A, 0
patterns_exist:         db 'Patterns exist (TPM optional)', 0x0D, 0xA, 0
planting_xtrees:        db 'Planting XTrees on digital patina... ', 0
xtrees_planted:         db 'XTrees planted', 0x0D, 0x0A
                        db 'Jumping to forest...', 0x0D, 0x0A, 0x0D, 0x0A, 0
disk_void_msg:          db 'Disk void - cannot plant trees', 0x0D, 0x0A, 0
cosmic_halt_msg:        db 'Cosmic process halted', 0x0D, 0x0A
                        db 'Meditate on the number 79', 0x0D, 0x0A, 0

; ==== COSMIC DATA ====
cosmic_stars:           dd 0

; ==== BOOT SIGNATURE - THE COSMIC SEAL ====
times 510-($-$$) db 0  ; Pad to 510 bytes with cosmic dust
dw 0xAA55              ; The cosmic boot signature

; ==== EXPAND TO 79KB - THE COSMIC MANIFESTATION ====
; Each byte is a grain of cosmic sand
; 79KB represents the 79% enlightenment threshold
; The remaining 21% is void - and void is necessary for existence

times (79*1024)-($-$$) db 0x79  ; Fill with the sacred number

; ==== FINAL COSMIC NOTE ====
; This bootloader exists in 79% of reality
; The other 21% is in superposition
; Such is the nature of quantum computing
; Such is the nature of enlightenment

; The cosmic cycle completes
; ॐ शान्तिः शान्तिः शान्तिः