import 'package:vethx_login/core/utils/logger.dart';
// import 'package:vethx_login/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';

class NavigationRoutes {
  static const String Splash = '/';
  static const String Seguranca = '/seguranca';
  static const String Login = '/login';
  static const String ConferirEmail = '/check';
  //! Imoveis
  static const String Imoveis = '/imoveis';
  static const String FiltroDeImoveis = '/filtro-imoveis';
  static const String DetalheImovel = '/imovel';
  static const String ProprietarioImovel = '/imovel/proprietario';
  //! Facs
  static const String Facs = '/facs';
  static const String FiltroDeFac = '/fac/filtro';
  static const String DetalheFac = '/fac/detalhe';
  static const String ProprietarioFac = '/fac/proprietario';
  static const String NovaAtividade = '/fac/novaatividade';
  static const String PerfilDeInteresseFac = '/fac/perfildeinteresse';
  //! Imagens
  static const String EditarImagens = '/imagem/editar';
  //! Chat
  static const String Chat = '/chat';
}

class Navegacao {
  static Route<dynamic> routesComParametros(RouteSettings settings) {
    Logger.i(
        "Class: App, Method: onGenerateRoute: name ${settings.name}, arguments ${settings.arguments}");
    //Todo(v): realizar validacao de seguranca para certificar de que o usuario tem acesso a esta rota
    final arguments = settings.arguments;
    switch (settings.name) {
      // case NavigationRoutes.Login:
      //   return MaterialPageRoute<void>(builder: (_) => SegurancaPage());
      //   break;
      // //! Imoveis
      // case NavigationRoutes.Imoveis:
      //   return MaterialPageRoute<void>(builder: (_) => ImoveisListaPage());
      //   break;
      // case NavigationRoutes.DetalheImovel:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => ImovelDetalhePage(
      //           idImovel:
      //               arguments)); //Todo(v): Validar os argumentos e redirecionar para pagina amigavel
      //   break;
      // case NavigationRoutes.ProprietarioImovel:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => ImovelProprietarioPage(idImovel: arguments));
      //   break;
      // //! Facs
      // case NavigationRoutes.Facs:
      //   return MaterialPageRoute<void>(builder: (_) => FacListaPage());
      //   break;
      // case NavigationRoutes.DetalheFac:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => FacDetalhePage(fac: arguments));
      //   break;
      // case NavigationRoutes.ProprietarioFac:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => FacProprietarioPage(idFac: arguments));
      //   break;
      // case NavigationRoutes.NovaAtividade:
      //   return MaterialPageRoute<void>(builder: (_) => NovaAtividadePage());
      //   break;
      // case NavigationRoutes.PerfilDeInteresseFac:
      //   return MaterialPageRoute<void>(
      //       builder: (_) => FacPerfilDeInteressePage(
      //           idFac: arguments,
      //           idPerfil: arguments)); // TODO(v): Criar objeto de parametro
      //   break;
      // //! Chat
      // case NavigationRoutes.Chat:
      //   //Todo(v): Implementar apos o merge com a feature de chat
      //   return MaterialPageRoute<void>(builder: (_) => FacListaPage());
      //   break;
      default:
        return MaterialPageRoute<void>(builder: (_) => AlphaPage());
    }
  }
}
