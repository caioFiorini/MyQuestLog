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

  void updateAtributos(int forc, int dest, int cari, int perc, int inte, int agil){
    atributos.updateAllAtributos(forc, dest, cari, perc, inte, agil);

  }
  void addXP(int addedXP) async {
    usuario.xp += addedXP;
    if (usuario.xp > 100 * usuario.nivel) {
      usuario.nivel++;
      if (usuario.nivel % 2 == 0) {
        usuario.atributos.forca++;
        usuario.atributos.destreza++;
        usuario.atributos.inteligencia++;
      } else {
        usuario.atributos.carisma++;
        usuario.atributos.percepcao++;
        usuario.atributos.agilidade++;
      }
      dbSup.updateAtributos();
    }
  }

  @override
  String toString() {
    return "${"\n------------------------------"
          + "\nID: " + userId}\nNível: $nivel\nXP: $xp\nForça: ${atributos.forca}\nDestreza: ${atributos.destreza}\nCarisma: ${atributos.carisma}\nPercepção: ${atributos.percepcao}\nInteligência: ${atributos.inteligencia}\nAgilidade: ${atributos.agilidade}\n------------------------------\n";
  }
}
