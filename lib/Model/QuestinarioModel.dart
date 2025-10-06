class QuestionarioModel {
  String idquestionario;
  String idresponsavel;
  String nome;
  String apelido;
  String idade;
  String usaOculos;
  String diagnosticoTEA;
  String nivelTEA;
  String genero;
  String comunicacao;
  String tecnologiaQueGosta;
  String anoEscolar;
  String acompanhamentoProfissinal;
  String relacaocomLivros;
  String tecnologiasUsadasComFrequencia;
  String caracteristicaBrinquedo;
  String corFavorita;
  String veiculosPreferidos;
  String alimentosNome;
  String atividadePreferida;
  String movimentoRealizadoComFrequencia;
  String brinquedoNome;
  String coisasPreferidas;
  String acessoriosPreferidos;
  String animaisPreferidos;
  String deveTerNaHistoria;
  String naoDeveTernaHistoria;
  String parentesco;
  String processoDeAlfabetizacao;
  String conjugeNomes;
  String amigosNomes;
  String atividadeFavorita;
  String atividadeNaoGosta;
  String animalEstimacaoNome;
  String hiperfoco;

  QuestionarioModel({
    required this.idquestionario,
    required this.idresponsavel,
    required this.nome,
    required this.apelido,
    required this.idade,
    required this.usaOculos,
    required this.diagnosticoTEA,
    required this.nivelTEA,
    required this.genero,
    required this.comunicacao,
    required this.tecnologiaQueGosta,
    required this.anoEscolar,
    required this.acompanhamentoProfissinal,
    required this.relacaocomLivros,
    required this.tecnologiasUsadasComFrequencia,
    required this.caracteristicaBrinquedo,
    required this.corFavorita,
    required this.veiculosPreferidos,
    required this.alimentosNome,
    required this.atividadePreferida,
    required this.movimentoRealizadoComFrequencia,
    required this.brinquedoNome,
    required this.coisasPreferidas,
    required this.acessoriosPreferidos,
    required this.animaisPreferidos,
    required this.deveTerNaHistoria,
    required this.naoDeveTernaHistoria,
    required this.parentesco,
    required this.processoDeAlfabetizacao,
    required this.conjugeNomes,
    required this.amigosNomes,
    required this.atividadeFavorita,
    required this.atividadeNaoGosta,
    required this.animalEstimacaoNome,
    required this.hiperfoco,
  });

  factory QuestionarioModel.fromMap(Map<String, dynamic> map, String id) {
    return QuestionarioModel(
      idquestionario: map['idquestionario'],
      idresponsavel: map['idresponsavel'],
      nome: map['nome'],
      apelido: map['apelido'],
      idade: map['idade'],
      usaOculos: map['usa_oculos'],
      diagnosticoTEA: map['diagnostico_TEA'],
      nivelTEA: map['nivel_TEA'],
      genero: map['genero'],
      comunicacao: map['comunicacao'],
      tecnologiaQueGosta: map['tecnologia_que_gosta'],
      anoEscolar: map['ano_escolar'],
      acompanhamentoProfissinal: map['acompanhamento_profissinal'],
      relacaocomLivros: map['relacao_com_livros'],
      tecnologiasUsadasComFrequencia: map['tecnologias_usados_com_frequencia'],
      caracteristicaBrinquedo: map['caracteristica_brinquedo'],
      corFavorita: map['cor_favorita'],
      veiculosPreferidos: map['veiculos_preferidos'],
      alimentosNome: map['alimentos_nome'],
      atividadePreferida: map['atividade_preferida'],
      movimentoRealizadoComFrequencia:
          map['movimento_realizado_com_frequencia'],
      brinquedoNome: map['brinquedo_nome'],
      coisasPreferidas: map['coisas_preferidas'],
      acessoriosPreferidos: map['acessorios_preferidos'],
      animaisPreferidos: map['animais_preferidos'],
      deveTerNaHistoria: map['deve_ter_na_historia'],
      naoDeveTernaHistoria: map['nao_deve_ter_na_historia'],
      parentesco: map['parentesco'],
      processoDeAlfabetizacao: map['processo_de_alfabetizacao'],
      conjugeNomes: map['conjuge_nomes'],
      amigosNomes: map['amigos_nomes'],
      atividadeFavorita: map['atividade_favorita'],
      atividadeNaoGosta: map['atividade_nao_gosta'],
      animalEstimacaoNome: map['animal_estimacao_nome'],
      hiperfoco: map['hiperfoco'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idquestionario': idquestionario,
      'idresponsavel': idresponsavel,
      'nome': nome,
      'apelido': apelido,
      'idade': idade,
      'usa_oculos': usaOculos,
      'diagnostico_TEA': diagnosticoTEA,
      'nivel_TEA': nivelTEA,
      'genero': genero,
      'comunicacao': comunicacao,
      'tecnologia_que_gosta': tecnologiaQueGosta,
      'ano_escolar': anoEscolar,
      'acompanhamento_profissinal': acompanhamentoProfissinal,
      'relacao_com_livros': relacaocomLivros,
      'tecnologias_usados_com_frequencia': tecnologiasUsadasComFrequencia,
      'caracteristica_brinquedo': caracteristicaBrinquedo,
      'cor_favorita': corFavorita,
      'veiculos_preferidos': veiculosPreferidos,
      'alimentos_nome': alimentosNome,
      'atividade_preferida': atividadePreferida,
      'movimento_realizado_com_frequencia': movimentoRealizadoComFrequencia,
      'brinquedo_nome': brinquedoNome,
      'coisas_preferidas': coisasPreferidas,
      'acessorios_preferidos': acessoriosPreferidos,
      'animais_preferidos': animaisPreferidos,
      'deve_ter_na_historia': deveTerNaHistoria,
      'nao_deve_ter_na_historia': naoDeveTernaHistoria,
      'parentesco': parentesco,
      'processo_de_alfabetizacao': processoDeAlfabetizacao,
      'conjuge_nomes': conjugeNomes,
      'amigos_nomes': amigosNomes,
      'atividade_favorita': atividadeFavorita,
      'atividade_nao_gosta': atividadeNaoGosta,
      'animal_estimacao_nome': animalEstimacaoNome,
      'hiperfoco': hiperfoco,
    };
  }
}
