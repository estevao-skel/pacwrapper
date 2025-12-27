BITS 64

section .data
    title: db "pacwrapper", 0
    btn_update: db "atualizar sistema", 0
    btn_list: db "listar pacotes", 0
    btn_search: db "buscar pacote", 0
    btn_install: db "instalar pacote", 0
    btn_remove: db "remover pacote", 0
    btn_fastfetch: db "executar fastfetch", 0

    label_welcome: db "palmeiras é minha vida palmeiras é meu amor", 0
    label_subtitle: db "gerenciador de pacotes arch linux", 0
    label_palmeiras: db "avanti palestra", 0
    label_pkg: db "nome do pacote:", 0

    cmd_update: db "konsole -e bash -c 'sudo pacman -Syu; exit'", 0
    cmd_list: db "konsole -e bash -c 'pacman -Q | less; exit'", 0
    cmd_search_1: db "konsole -e bash -c 'pacman -Ss ", 0
    cmd_search_2: db "; exit'", 0
    cmd_install_1: db "konsole -e bash -c 'sudo pacman -S ", 0
    cmd_install_2: db "; exit'", 0
    cmd_remove_1: db "konsole -e bash -c 'sudo pacman -R ", 0
    cmd_remove_2: db "; exit'", 0
    cmd_fastfetch: db "konsole -e bash -c 'fastfetch; sleep 5; exit'", 0

    sig_destroy: db "destroy", 0
    sig_clicked: db "clicked", 0

    css_data: db "window { background: linear-gradient(135deg, rgba(0, 146, 70, 0.7) 0%, rgba(0, 133, 61, 0.7) 35%, rgba(3, 102, 53, 0.7) 70%, rgba(206, 43, 55, 0.7) 90%, rgba(241, 242, 241, 0.7) 100%); }", 10
              db "label { color: rgba(255, 255, 255, 0.98); font-size: 13px; font-weight: 600; padding: 6px; text-shadow: 0 2px 8px rgba(0,0,0,0.7), 0 0 20px rgba(0,0,0,0.5); }", 10
              db ".title-label { font-size: 22px; font-weight: 900; color: rgba(255, 255, 255, 1); text-shadow: 0 3px 12px rgba(0,0,0,0.8), 0 0 30px rgba(0,0,0,0.6); letter-spacing: 1.5px; }", 10
              db "button { background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(15px); -webkit-backdrop-filter: blur(15px); color: rgba(255, 255, 255, 0.98); font-size: 13px; font-weight: 700; padding: 16px 24px; margin: 5px; border-radius: 30px; border: 2px solid rgba(255, 255, 255, 0.3); box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.35), inset 0 1px 0 0 rgba(255, 255, 255, 0.2); transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1); }", 10
              db "button:hover { background: rgba(255, 255, 255, 0.25); border: 2px solid rgba(255, 255, 255, 0.45); transform: translateY(-3px) scale(1.02); box-shadow: 0 8px 35px 0 rgba(0, 0, 0, 0.45), inset 0 2px 0 0 rgba(255, 255, 255, 0.25); }", 10
              db "button:active { transform: translateY(-1px) scale(0.98); box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.3); }", 10
              db "entry { background: rgba(255, 255, 255, 0.12); backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); color: rgba(255, 255, 255, 0.98); caret-color: rgba(255, 255, 255, 0.95); font-size: 13px; font-weight: 600; padding: 12px 18px; border-radius: 25px; border: 2px solid rgba(255, 255, 255, 0.25); box-shadow: inset 0 2px 8px rgba(0,0,0,0.25), 0 2px 15px rgba(0,0,0,0.2); transition: all 0.3s ease; }", 10
              db "entry:focus { background: rgba(255, 255, 255, 0.2); border: 2px solid rgba(255, 255, 255, 0.5); box-shadow: 0 0 25px rgba(255, 255, 255, 0.3), inset 0 2px 8px rgba(0,0,0,0.2); }", 10
              db "entry::selection { background-color: rgba(255, 255, 255, 0.35); }", 10
              db "separator { background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0.25) 50%, rgba(255,255,255,0) 100%); min-height: 1px; margin: 12px 0; }", 0

section .bss
    window: resq 1
    vbox_main: resq 1
    vbox: resq 1
    hbox: resq 1
    label_title: resq 1
    label_sub: resq 1
    label_palm: resq 1
    label2: resq 1
    entry: resq 1
    btn1: resq 1
    btn2: resq 1
    btn3: resq 1
    btn4: resq 1
    btn5: resq 1
    btn6: resq 1
    separator1: resq 1
    separator2: resq 1
    separator3: resq 1
    cmd_buffer: resb 512
    css_provider: resq 1
    screen: resq 1

section .text
    global _start
    extern gtk_init
    extern gtk_window_new
    extern gtk_window_set_title
    extern gtk_window_set_default_size
    extern gtk_window_set_position
    extern gtk_box_new
    extern gtk_container_add
    extern gtk_container_set_border_width
    extern gtk_button_new_with_label
    extern gtk_label_new
    extern gtk_entry_new
    extern gtk_entry_get_text
    extern gtk_box_pack_start
    extern gtk_separator_new
    extern gtk_widget_show_all
    extern gtk_main
    extern gtk_main_quit
    extern g_signal_connect_data
    extern gtk_css_provider_new
    extern gtk_css_provider_load_from_data
    extern gtk_style_context_add_provider_for_screen
    extern gdk_screen_get_default
    extern system
    extern strcpy
    extern strcat
    extern memset

_start:
    push rbp
    mov rbp, rsp
    and rsp, -16

    xor edi, edi
    xor esi, esi
    call gtk_init

    call gdk_screen_get_default
    mov [screen], rax

    call gtk_css_provider_new
    mov [css_provider], rax

    mov rdi, [css_provider]
    lea rsi, [css_data]
    mov rdx, -1
    xor ecx, ecx
    call gtk_css_provider_load_from_data

    mov rdi, [screen]
    mov rsi, [css_provider]
    mov edx, 800
    call gtk_style_context_add_provider_for_screen

    xor edi, edi
    call gtk_window_new
    mov [window], rax

    mov rdi, [window]
    lea rsi, [title]
    call gtk_window_set_title

    mov rdi, [window]
    mov esi, 380
    mov edx, 600
    call gtk_window_set_default_size

    mov rdi, [window]
    mov esi, 1
    call gtk_window_set_position

    mov edi, 1
    mov esi, 0
    call gtk_box_new
    mov [vbox_main], rax

    mov rdi, [window]
    mov rsi, [vbox_main]
    call gtk_container_add

    mov rdi, [vbox_main]
    mov esi, 20
    call gtk_container_set_border_width

    mov edi, 1
    mov esi, 18
    call gtk_box_new
    mov [vbox], rax

    mov rdi, [vbox_main]
    mov rsi, [vbox]
    mov edx, 1
    mov ecx, 1
    mov r8d, 0
    call gtk_box_pack_start

    lea rdi, [label_welcome]
    call gtk_label_new
    mov [label_title], rax

    mov rdi, [vbox]
    mov rsi, [label_title]
    mov edx, 0
    mov ecx, 0
    mov r8d, 15
    call gtk_box_pack_start

    lea rdi, [label_subtitle]
    call gtk_label_new
    mov [label_sub], rax

    mov rdi, [vbox]
    mov rsi, [label_sub]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    lea rdi, [label_palmeiras]
    call gtk_label_new
    mov [label_palm], rax

    mov rdi, [vbox]
    mov rsi, [label_palm]
    mov edx, 0
    mov ecx, 0
    mov r8d, 10
    call gtk_box_pack_start

    mov edi, 0
    call gtk_separator_new
    mov [separator1], rax

    mov rdi, [vbox]
    mov rsi, [separator1]
    mov edx, 0
    mov ecx, 0
    mov r8d, 12
    call gtk_box_pack_start

    mov edi, 0
    mov esi, 10
    call gtk_box_new
    mov [hbox], rax

    mov rdi, [vbox]
    mov rsi, [hbox]
    mov edx, 0
    mov ecx, 0
    mov r8d, 12
    call gtk_box_pack_start

    lea rdi, [label_pkg]
    call gtk_label_new
    mov [label2], rax

    mov rdi, [hbox]
    mov rsi, [label2]
    mov edx, 0
    mov ecx, 0
    mov r8d, 10
    call gtk_box_pack_start

    call gtk_entry_new
    mov [entry], rax

    mov rdi, [hbox]
    mov rsi, [entry]
    mov edx, 1
    mov ecx, 1
    mov r8d, 10
    call gtk_box_pack_start

    mov edi, 0
    call gtk_separator_new
    mov [separator2], rax

    mov rdi, [vbox]
    mov rsi, [separator2]
    mov edx, 0
    mov ecx, 0
    mov r8d, 12
    call gtk_box_pack_start

    lea rdi, [btn_update]
    call gtk_button_new_with_label
    mov [btn1], rax

    mov rdi, [vbox]
    mov rsi, [btn1]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    mov rdi, [btn1]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn1_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    lea rdi, [btn_list]
    call gtk_button_new_with_label
    mov [btn2], rax

    mov rdi, [vbox]
    mov rsi, [btn2]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    mov rdi, [btn2]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn2_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    lea rdi, [btn_fastfetch]
    call gtk_button_new_with_label
    mov [btn6], rax

    mov rdi, [vbox]
    mov rsi, [btn6]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    mov rdi, [btn6]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn6_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    mov edi, 0
    call gtk_separator_new
    mov [separator3], rax

    mov rdi, [vbox]
    mov rsi, [separator3]
    mov edx, 0
    mov ecx, 0
    mov r8d, 10
    call gtk_box_pack_start

    lea rdi, [btn_search]
    call gtk_button_new_with_label
    mov [btn3], rax

    mov rdi, [vbox]
    mov rsi, [btn3]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    mov rdi, [btn3]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn3_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    lea rdi, [btn_install]
    call gtk_button_new_with_label
    mov [btn4], rax

    mov rdi, [vbox]
    mov rsi, [btn4]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start
    ; eu nao aguento mais fazer codigooooooo

    mov rdi, [btn4]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn4_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    lea rdi, [btn_remove]
    call gtk_button_new_with_label
    mov [btn5], rax

    mov rdi, [vbox]
    mov rsi, [btn5]
    mov edx, 0
    mov ecx, 0
    mov r8d, 5
    call gtk_box_pack_start

    mov rdi, [btn5]
    lea rsi, [sig_clicked]
    lea rdx, [on_btn5_clicked]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    mov rdi, [window]
    lea rsi, [sig_destroy]
    lea rdx, [gtk_main_quit]
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    call g_signal_connect_data

    mov rdi, [window]
    call gtk_widget_show_all

    call gtk_main

    xor edi, edi
    mov eax, 60
    syscall
    ; negocios
on_btn1_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    lea rdi, [cmd_update]
    call system
    leave
    ret

on_btn2_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    lea rdi, [cmd_list]
    call system
    leave
    ret

on_btn3_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    push r12
    mov rdi, [entry]
    call gtk_entry_get_text
    mov r12, rax
    lea rdi, [cmd_buffer]
    xor esi, esi
    mov edx, 512
    call memset
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_search_1]
    call strcpy
    lea rdi, [cmd_buffer]
    mov rsi, r12
    call strcat
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_search_2]
    call strcat
    lea rdi, [cmd_buffer]
    call system
    pop r12
    leave
    ret

on_btn4_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    push r12
    mov rdi, [entry]
    call gtk_entry_get_text
    mov r12, rax
    lea rdi, [cmd_buffer]
    xor esi, esi
    mov edx, 512
    call memset
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_install_1]
    call strcpy
    lea rdi, [cmd_buffer]
    mov rsi, r12
    call strcat
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_install_2]
    call strcat
    lea rdi, [cmd_buffer]
    call system
    pop r12
    leave
    ret

on_btn5_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    push r12
    mov rdi, [entry]
    call gtk_entry_get_text
    mov r12, rax
    lea rdi, [cmd_buffer]
    xor esi, esi
    mov edx, 512
    call memset
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_remove_1]
    call strcpy
    lea rdi, [cmd_buffer]
    mov rsi, r12
    call strcat
    lea rdi, [cmd_buffer]
    lea rsi, [cmd_remove_2]
    call strcat
    lea rdi, [cmd_buffer]
    call system
    pop r12
    leave
    ret

on_btn6_clicked:
    push rbp
    mov rbp, rsp
    and rsp, -16
    lea rdi, [cmd_fastfetch]
    call system
    leave
    ret
