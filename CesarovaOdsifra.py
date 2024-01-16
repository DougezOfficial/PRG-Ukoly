def Cesarova_odsifra(sifra,odsazeni):
    Sifrovany_text = ""
    
    for i in range(len(sifra)):
        char = sifra[i]

        if char == " ":
            Sifrovany_text += " "

        elif (char.isupper()):
            Sifrovany_text += chr((ord(char) - odsazeni - 65) % 26 + 65)

        else:
            Sifrovany_text += chr((ord(char) - odsazeni - 97) % 26 + 97)

    return Sifrovany_text

sifra = "bipk"
odsazeni = 1

if odsazeni >= 26: 
    print("Podporovaná počet odsazení je: 1-25")
else:
    pass
    print ("Sifrovany text je: " +Cesarova_odsifra(sifra, odsazeni))

