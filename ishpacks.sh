#!/bin/bash
clear
sleep 2
echo "Buscando paquetes."
sleep 1
clear
echo "Buscando paquetes.."
sleep 1
clear
echo "Buscando paquetes..."
sleep 3
clear
echo "Buscando paquetes."
sleep 2
clear
echo "¡Paquetes encontrados!"
sleep 5
clear

# Función para instalar un paquete
install_package() {
    package=$1
    echo "Instalando el paquete $package..."
    pkg install $package -y
    echo "El paquete $package ha sido instalado correctamente."
}

# Función para instalar los paquetes necesarios para discord.py
install_discord_packages() {
    echo "Instalando los paquetes necesarios para discord.py..."
    install_package "python"
    install_package "git"
    install_package "clang"
    install_package "openssl-tool"
    install_package "libffi-dev"
    echo "Los paquetes necesarios para discord.py han sido instalados correctamente."
}

# Función para instalar todos los paquetes dentro de la carpeta de paquetes de discord
install_all_discord_packages() {
    echo "Instalando todos los paquetes dentro de la carpeta de paquetes de discord..."
    cd discord/packages
    for package in *; do
        if [ -d "$package" ]; then
            install_package $package
        fi
    done
    cd ../..
    echo "Todos los paquetes han sido instalados correctamente."
}

# Título del menú de instalación
echo "═══════════════════════════════════"
echo "       Discord PKGS"
echo "═══════════════════════════════════"

# Menú de instalación de paquetes
echo "Por favor, selecciona una opción:"
echo "1. Instalar paquetes generales"
echo "2. Instalar paquetes para discord.py"
echo "3. Instalar todos los paquetes de discord"
echo "4. Salir"

read -p "Ingresa el número correspondiente a la opción que deseas seleccionar: " choice

case $choice in
    1)
        echo "Instalando paquetes generales..."
        install_package "nano"
        install_package "git"
        install_package "python"
        install_package "nodejs"
        install_package "php"
        install_package "ruby"
        ;;
    2)
        echo "Instalando paquetes para discord.py..."
        mkdir -p discord/packages
        cd discord/packages
        install_discord_packages
        cd ../..
        ;;
    3)
        echo "Instalando todos los paquetes de discord..."
        mkdir -p discord/packages
        cd discord/packages
        install_all_discord_packages
        cd ../..
        ;;
    4)
        echo "¡Hasta luego!"
        exit
        ;;
    *)
        echo "Opción no válida. Por favor, selecciona una opción válida."
        ;;
esac
