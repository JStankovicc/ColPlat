#!/bin/bash

echo "ABPlat Docker Management Scripts"
echo "=================================="

show_menu() {
    echo
    echo "1. Pokretanje svih servisa (build + up)"
    echo "2. Pokretanje u background-u"
    echo "3. Zaustavljanje servisa"
    echo "4. Pregled logova"
    echo "5. Restart servisa"
    echo "6. Čišćenje (down + volumes)"
    echo "7. Status servisa"
    echo "8. Izlaz"
    echo
}

while true; do
    show_menu
    read -p "Izaberite opciju (1-8): " choice
    
    case $choice in
        1)
            echo "Pokretanje svih servisa..."
            docker-compose up --build
            ;;
        2)
            echo "Pokretanje u background-u..."
            docker-compose up -d --build
            ;;
        3)
            echo "Zaustavljanje servisa..."
            docker-compose down
            ;;
        4)
            echo "Pregled logova..."
            docker-compose logs -f
            ;;
        5)
            echo "Restart servisa..."
            docker-compose restart
            ;;
        6)
            echo "Čišćenje (down + volumes)..."
            docker-compose down -v
            ;;
        7)
            echo "Status servisa..."
            docker-compose ps
            ;;
        8)
            echo "Izlaz..."
            exit 0
            ;;
        *)
            echo "Neispravna opcija. Pokušajte ponovo."
            ;;
    esac
done
