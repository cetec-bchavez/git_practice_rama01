#!/bin/bash

opcion=0
linea=""
master="main"
rama="funcionalidad1"

# 1) Configuracion (git config)
usuario="bydan105"
mail="bydan@hotmail.com"

# 2) Clonar Proyecto (git clone)
https_url="https://github.com/cetec-bchavez/git_practice_rama01.git"
ssh_url="git@github.com:cetec-bchavez/git_practice_rama01.git"
proyecto="git_practice_rama01"

# 3) .gitignore Archivo (echo secret.txt >> .gitignore)
file_ignore="secret.txt"

# 4) Nuevo Archivo (git add .)
carpeta_nuevo="practica_01"
archivo_nuevo="index.html"

# 5) Eliminar Archivo (git rm --cached)
archivo_eliminar=".gitignore"
carpeta_eliminar="practica_01"

# 6) Commit Mensaje (git commit)
mensaje_commit="Subir Local 1"

#---------- TOKENS PARA HTTPS ----------
#---- cetec-bchavez, Practicas ----
# 7-Dias,15/02/2022
# u: cetec-bchavez
# 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

#---------- KEYS PARA SSH --------------
# Detalle en get_clone_repository_ssh

get_menu_opciones() {
    clear
    echo
    echo -e "\t\t\tPRACTICA GIT03 - REMOTO RAMA \n"
    
    echo -e "\n\t----------------------- RAMA NUEVA/SECUNDARIA (features1,features2,features3)-------------------------\n"

    echo -e "\t1. Configuracion (NO OBLIGATORIO) (usuario,mail)"
    echo -e "\t2. Clonar Https (TOKEN) (git clone https:)"
    echo -e "\t3. Clonar SSH (Keys Public/Private) (git clone git:)"
    echo -e "\t4. Crear Rama (git branch features1)"
    echo -e "\t5. Cambiar Rama (git checkout features1)"
    echo -e "\t6. Archivos Ignore (touch .gitignore)"
    echo -e "\t7. Add Archivos to Local Staged (git add -A)"
    echo -e "\t8. Commit Cambios Archivos to Local (git commit -m)"
    echo -e "\t9. Upload Rama Archivos to Internet (git push -u origin features1)"
    echo -e "\t10. Download Rama Archivos from Internet (git push origin features1)"
    echo -e "\t11. Eliminar Archivos (Staged / Cache) (git rm --cached .gitignore)"
    echo -e "\t12. Eliminar Carpeta (Staged / Remote) (git rm -r practica_01)"
    echo -e "\t--- Rama ---"
    echo -e "\t13. Eliminar Rama/Branch Local (git branch -d features1)"
    echo -e "\t14. Eliminar Rama/Branch Remoto (git push origin --delete features1)"
    
    
    echo -e "\n\t----------------------- RAMA PRINCIPAL (main/master)-------------------------\n"
    
    echo -e "\t21. Cambiar a Rama Principal(main/master) (git checkout master)"
    echo -e "\t22. Download Principal Rama Archivos from Internet (git pull origin master)"
    echo -e "\t23. Merge a Rama Principal from Internet (git merge features1)"
    echo -e "\t24. Upload Principal Rama Archivos to Internet (git push origin master)"

    
    echo -e "\n\t----------------------- INFORMACION -------------------------\n"
    
    echo -e "\t31. Git Status Local / Version (git status && git --version)"
    echo -e "\t32. Git Commit Local Log (git log && git --version)"
    echo -e "\t33. Git Diff Commit Local/Remote Log (git diff)"
    echo -e "\t34. Ver Ramas/Branches (git branch)"
    echo -e "\t35. Ver Ramas/Branches Merged (git branch --merged)"
    echo -e "\t36. Ver Archivos Actuales Local (ls -alh)"
    echo -e "\t37. Ver Configuracion Local (Usuario/Mail) (git config --list)"

    echo -e "\n\tAYUDA"
    echo -e "\t81. Ayuda Cd-ROM 1(Log,Eject)"
    echo -e "\t99. Testing"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion
}

set_configuracion_local() {
    clear   
    echo -e "-----------1. Configuracion (NO OBLIGATORIO) (usuario,mail)-------------"
    echo
    
    #------- DATA AUTO ---------
    #user.name=cetec-bchavez
    #user.email=cetec.bchavez@gmail.com
    #remote.origin.url=https://github.com/cetec-bchavez/git_practice01.git

    git config --global user.name $usuario
    git config --global user.email $mail
    git config --list
    
    echo "Configured..."

    ##for g1 in $(groups); do
    #   echo -e "-> $g1"
    #done
}  

get_clone_repository_https() {
    clear   
    echo -e "-----------2. Clonar Https (TOKEN) (git clone)-------------"
    echo
    
    git clone $https_url

    ls -alh

    echo "Cloned..."
}

get_clone_repository_ssh() {
    clear   
    echo -e "-----------3. Clonar SSH (Keys Public/Private) (git clone git:)-------------"
    echo
    
    git clone $ssh_url

    ls -alh

    echo "Cloned..."

    #---------- KEYS PARA SSH --------------
    # apt-get install openssh-server
    # systemctl enable ssh
    # ssh-keygen -t rsa -b 4096 -C "cetec.bchavez@gmail.com"
    # Password (NO,MEJOR NO), Nombre Archivo = cetec_bchavez
    # Archivo Clave Publica x.pub copiar Codigo a github.com
    # Perfil ---> Settings ---> SSH and GPG Keys
    # Archivo Clave Privada (cetec_bchavez), copiar a /home/bydan_lnlt/.ssh/
    # Cambiar Nombre cetec_bchavez ---> id_rsa
    # Comprobar ssh -T git@github.com
    # Pregunta = yes (Aunque no hay conexion)
}

create_rama() {
    clear   
    echo -e "-----------4. Crear Rama (git branch features1)-------------"
    echo
    
    git branch $rama

    echo "Rama Created ..."
}

cambiar_rama() {
    clear   
    echo -e "-----------5. Cambiar Rama (git checkout features1)-------------"
    echo
    
    git checkout $rama

    echo "Rama Changed and Selected..."
}

create_set_archivos_ignore_config() {
    clear   
    echo -e "-----------6. Archivo Ignore con Ejemplo (touch .gitignore)-------------"
    echo
    
    # 1) Crear Archivo Ejemplo
    touch $file_ignore
    echo "Datos Ejemplo" > $file_ignore


    # 2) Crear Archivo Control .gitignore
    #  - Adicionar Archivo Ejemplo
    touch ".gitignore"
    echo "#Archivo Prueba" > ".gitignore"
    echo $file_ignore >> ".gitignore"  

    echo "$file_ignore y .gitignore Generated..."
}

add_staged_files() {
    clear   
    echo -e "-----------7. Archivos Ignore (touch .gitignore)-------------"
    echo
    
    # 1) Crear Archivo Ejemplo: ./practica_01/index.html
    mkdir $carpeta_nuevo
    touch "./$carpeta_nuevo/$archivo_nuevo"
    
    echo "<html>" > "./$carpeta_nuevo/$archivo_nuevo"
    echo "  <head>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  </head>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  <body>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "      <h1>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "          Datos de Ejemplo" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "      </h1>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  </body>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "</html>" >> "./$carpeta_nuevo/$archivo_nuevo"
    
    # Add Archivo Ejemplo al Local Stage
    git add -A

    git status

    echo "./$carpeta_nuevo/$archivo_nuevo Added..."
}

set_commit_staged_files() {
    clear   
    echo -e "-----------8. Commit Cambios Archivos to Local (git commit -m)-------------"
    echo
    
    git commit -m "$mensaje_commit"

    echo "Commited..."
}

upload_commited_staged_files() {
    clear   
    echo -e "-----------9. Upload Rama Archivos to Internet (git push -u origin features1)-------------"
    echo
    
    git push -u origin $rama

    echo "Rama Uploaded..."
}

download_commited_staged_files() {
    clear   
    echo -e "-----------10. Download Archivos from Internet (git push origin features1)-------------"
    echo
    
    git pull origin $rama

    echo "Rama Downloaded..."
}

delete_staged_file() {
    clear   
    echo -e "-----------11. Eliminar Cache Archivos Ignore (git rm --cached .gitignore)-------------"
    echo    

    git rm $archivo_eliminar

    echo "$archivo_eliminar Deleted..."

    # Luego Ejecutar 5), 6) , 7) osea Commit, Upload, Download
    # Eliminacion Local/Remoto
    #git rm $archivo_eliminar

    # Eliminacion Local
    #git rm --cached $archivo_eliminar
}

delete_staged_folder() {
    clear   
    echo -e "-----------12. Eliminar Carpeta (Staged-Local / Remote) (git rm -r practica_01)-------------"
    echo    

    git rm -r $carpeta_eliminar

    echo "$carpeta_eliminar Deleted..."
    
    # Eliminacion Local/Remoto
    #git rm --cached $carpeta_eliminar
}

delete_rama_local() {
    clear   
    echo -e "-----------13. Eliminar Rama/Branch Local (git branch -d features1)-------------"
    echo    

    git branch -d $rama

    echo "Rama Local $rama Deleted..."
}

delete_rama_remoto() {
    clear   
    echo -e "-----------14. Eliminar Rama/Branch Remoto (git push origin --delete features1)-------------"
    echo    

    git push origin --delete $rama

    echo "Rama Remoto $rama Deleted..."
}

cambiar_rama_principal() {
    clear   
    echo -e "-----------21. Cambiar a Rama Principal(main/master) (git checkout master)-------------"
    echo
    
    git checkout $master

    echo "Rama Principal Changed and Selected..."
}

download_commited_staged_files_principal() {
    clear   
    echo -e "-----------22. Download Principal Rama Archivos from Internet (git pull origin master)-------------"
    echo
    
    git pull origin $master

    echo "Downloaded..."
}

merge_arama_principal() {
    clear   
    echo -e "-----------23. Merge a Rama Principal from Internet (git merge features1)-------------"
    echo
        
    git merge $rama

    echo "Merge a Principal Rama..."
}

upload_commited_staged_files_principal() {
    clear   
    echo -e "-----------24. Upload Principal Rama Archivos to Internet (git push origin master)-------------"
    echo
    
    git push -u origin $master

    echo "Principal Rama Uploaded..."
}

get_info_local_status() {
    clear   
    echo -e "-----------31. Git Status Local / Version (git status && git --version)-------------"
    echo

    git --version

    git status
}

get_info_local_commit_log() {
    clear   
    echo -e "-----------32. Git Commit Log Local (git log && git --version)-------------"
    echo

    git --version

    git log
}


get_info_local_remote_commit_diff() {
    clear   
    echo -e "-----------33. Git Diff Commit Local/Remote Log (git diff)-------------"
    echo

    git diff
}

get_info_local_remote_ramas() {
    clear   
    echo -e "-----------34. Ver Ramas/Branches (git branch)-------------"
    echo

    git branch -a
}

get_info_local_remote_ramas_merged() {
    clear   
    echo -e "-----------35. Ver Ramas/Branches Merged (git branch --merged)-------------"
    echo

    git branch --merged
}

get_info_archivos_actuales() {
    clear   
    echo -e "-----------36. Ver Archivos Actuales Local (git config --list)-------------"
    echo

    ls -alh
}

get_info_configuracion_local() {
    clear   
    echo -e "-----------37. Ver Configuracion Local (Usuario/Mail) (git config --list)-------------"
    echo

    git config --list
}

get_ayuda_cdrom1() {
    feh "./imagen/02_intermedio/07_cdrom.jpg"
}

exec_testing() {
    echo $proyecto
    echo ${proyecto}

    cd $proyecto
}


while [ 1 ]
do
    get_menu_opciones

    case $opcion in
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;          
        1)
             set_configuracion_local ;;            
        2)
             get_clone_repository_https;;          
        3)
             get_clone_repository_ssh;;
        4)
             create_rama;;
        5)
             cambiar_rama ;;
        6)
             create_set_archivos_ignore_config;;
        7)
             add_staged_files ;;        
        8)
             set_commit_staged_files ;;
        9)
             upload_commited_staged_files ;;
        10)
             download_commited_staged_files ;;
        21)
             cambiar_rama_principal ;;
        22)
             download_commited_staged_files_principal ;;
        23)
             merge_arama_principal ;;
        24)
             upload_commited_staged_files_principal ;;       
        11)
             delete_staged_file ;;
        12)
             delete_staged_folder ;;
        13)
             delete_rama_local ;;
        14)
             delete_rama_remoto ;;        
        31)
             get_info_local_status;;
        32)
             get_info_local_commit_log;;
        33)
             get_info_local_remote_commit_diff;;
        34)
             get_info_local_remote_ramas;;
        35)
             get_info_local_remote_ramas_merged;;
        36)
             get_info_archivos_actuales;;
        37)
             get_info_configuracion_local;;
        81)
             get_ayuda_cdrom1;;
        99)
             exec_testing;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac

echo -e "Presione la tecla Enter para continuar"
read linea

done