import 'package:vethx_login/core/api/api_setup.dart';

enum Endpoint {
  //! Perfil
  perfil,
  empresasUsuario,
  //! Imoveis
  tiposDeImoveis,
  buscarImoveis,
  detalhesImovel,
  proprietarioImovel,
  //! Facs
  tiposDeFacs,
  buscarFacs,
  timeLineFac,
  proprietarioFac,
  novaAtividade,
  perfisDeInteresse,
  auxiliares,
  cidades,
  bairros,
  registrarPerfilInteresse,
  canaisEmidias,
  registrarContato,
  //! Campanhas
  buscarCampanhas,
  //! Blog
  buscarArtigos,
  //! Blog
  buscarComunicados,
  //! Imagens
  buscarImagens,
  buscarImagem,
  dadosDoCorretorParaImagens,
  atualizarDadosDoCorretor,
  realizarLogDoUsoDeImagem,
}

class API {
  API(this.api);

  final IApiSetup api;

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: api.host,
        port: api.port > 0 ? api.port : null,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint,
          {required Map<String, String> queryParameters}) =>
      Uri(
        scheme: 'https',
        host: api.host,
        port: api.port > 0 ? api.port : null,
        path: '${api.basePath}/${_paths[endpoint]}',
        queryParameters: queryParameters,
      );

  static final Map<Endpoint, String> _paths = {
    //! Perfil
    Endpoint.perfil: 'perfil/perfilacesso',
    Endpoint.empresasUsuario: 'api/account/empresas-por-email',
    //! Imoveis
    Endpoint.tiposDeImoveis: 'imoveis/buscar-tipos-imoveis',
    Endpoint.buscarImoveis: 'imoveis/buscar',
    Endpoint.detalhesImovel: 'imoveis/buscar-imovel-por-id',
    Endpoint.proprietarioImovel: 'imoveis/buscarproprietario',
    //! Facs
    Endpoint.tiposDeFacs: '', // TODO(v): ?
    Endpoint.buscarFacs: 'contatos/busca-avancada',
    Endpoint.timeLineFac: 'contatos/buscar-timeline',
    Endpoint.proprietarioFac: 'imoveis/buscarproprietario',
    Endpoint.perfisDeInteresse: 'contatos/listar-perfis',
    Endpoint.auxiliares: 'contatos/buscar-auxiliares',
    Endpoint.cidades: 'contatos/buscar-cidades',
    Endpoint.bairros: 'contatos/buscar-bairros',
    Endpoint.registrarPerfilInteresse: 'contatos/salvar-perfil',
    Endpoint.canaisEmidias: 'contatos/canais-midias',
    Endpoint.registrarContato: 'contatos/gravarcontato',
    //! Campanhas
    Endpoint.buscarCampanhas: 'landingpages/buscar',
    //! Blog
    Endpoint.buscarArtigos: 'compartilhamento/listar',
    //! Comunicados
    Endpoint.buscarComunicados: 'feed/listar',
    Endpoint.novaAtividade: 'contatos/GravarAnotacaoContato',
    //! Imagens
    Endpoint.buscarImagens: 'utilitarios/whatsapp',
    Endpoint.buscarImagem: 'utilitarios/gerar-mobilemarketing',
    Endpoint.dadosDoCorretorParaImagens: 'utilitarios/buscar-infos',
    Endpoint.atualizarDadosDoCorretor: 'utilitarios/atualizar-infs',
    Endpoint.realizarLogDoUsoDeImagem: 'landingpages/gravar-campanhas',
  };
}
