import 'package:myquestlog/main.dart';

class Atributos{
  late int forca;
  late int destreza;
  late int carisma;
  late int percepcao;
  late int inteligencia;
  late int agilidade;

  Atributos(){
    forca = 0;
    destreza = 0;
    carisma = 0;
    percepcao = 0;
    inteligencia = 0;
    agilidade = 0;
  }

  void updateAllAtributos(int forc, int dest, int cari, int perc, int inte, int agil){
    forca = forc;
    destreza = dest;
    carisma = cari;
    percepcao = perc;
    inteligencia = inte;
    agilidade = agil;
  }

}

class Usuario {
  late String email;
  late String nome;
  late var userId;
  late int nivel;
  late int xp;
  late Atributos atributos;

  Usuario(String uNome, String uEmail, int uNivel, int uXp){
    nome = uNome;
    email = uEmail;
    userId = userSupabaseId;
    nivel = uNivel;
    xp = uXp;
    atributos = Atributos();
  }
  void levelUp(){
    nivel++;
    xp = 0;
  }
  void updateAtributos(int forc, int dest, int cari, int perc, int inte, int agil){
    atributos.updateAllAtributos(forc, dest, cari, perc, inte, agil);
  }
  @override
  String toString() {
    return "\n------------------------------"
          + "\nID: " + userId
          + "\nNível: " + nivel.toString()
          + "\nXP: " + xp.toString()
          + "\nForça: " + atributos.forca.toString()
          + "\nDestreza: " + atributos.destreza.toString()
          + "\nCarisma: " + atributos.carisma.toString()
          + "\nPercepção: " + atributos.percepcao.toString()
          + "\nInteligência: " + atributos.inteligencia.toString()
          + "\nAgilidade: " + atributos.agilidade.toString()
        + "\n------------------------------\n";
  }
}
