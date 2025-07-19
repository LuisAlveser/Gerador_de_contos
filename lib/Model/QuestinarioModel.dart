class QuestionarioModel {
  String idCrianca;
  String nome;
  String apelido;
  int idade;
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

  // Constructor
  QuestionarioModel({
    required this.idCrianca,
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

  factory QuestionarioModel.fromJson(Map<String, dynamic> json) {
    return QuestionarioModel(
      idCrianca: json['id_crianca'] as String,
      nome: json['nome'] as String,
      apelido: json['apelido'] as String,
      idade: json['idade'] as int,
      usaOculos: json['usa_oculos'] as String,
      diagnosticoTEA: json['diagnostico_TEA'] as String,
      nivelTEA: json['nivel_TEA'] as String,
      genero: json['genero'] as String,
      comunicacao: json['comunicacao'] as String,
      tecnologiaQueGosta: json['tecnologia_que_gosta'] as String,
      anoEscolar: json['ano_escolar'] as String,
      acompanhamentoProfissinal: json['acompanhamento_profissinal'] as String,
      relacaocomLivros: json['relacao_com_livros'] as String,
      tecnologiasUsadasComFrequencia: json['tecnologias_usados_com_frequencia'] as String,
      caracteristicaBrinquedo: json['caracteristica_brinquedo'] as String,
      corFavorita: json['cor_favorita'] as String,
      veiculosPreferidos: json['veiculos_preferidos'] as String,
      alimentosNome: json['alimentos_nome'] as String,
      atividadePreferida: json['atividade_preferida'] as String,
      movimentoRealizadoComFrequencia: json['movimento_realizado_com_frequencia'] as String,
      brinquedoNome: json['brinquedo_nome'] as String,
      coisasPreferidas: json['coisas_preferidas'] as String,
      acessoriosPreferidos: json['acessorios_preferidos'] as String,
      animaisPreferidos: json['animais_preferidos'] as String,
      deveTerNaHistoria: json['deve_ter_na_historia'] as String,
      naoDeveTernaHistoria: json['nao_deve_ter_na_historia'] as String,
      parentesco: json['parentesco'] as String,
      processoDeAlfabetizacao: json['processo_de_alfabetizacao'] as String,
      conjugeNomes: json['conjuge_nomes'] as String,
      amigosNomes: json['amigos_nomes'] as String,
      atividadeFavorita: json['atividade_favorita'] as String,
      atividadeNaoGosta: json['atividade_nao_gosta'] as String,
      animalEstimacaoNome: json['animal_estimacao_nome'] as String,
      hiperfoco: json['hiperfoco'] as String,
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id_crianca': idCrianca,
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
