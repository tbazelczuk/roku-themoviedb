' @import /components/router/Router.facade.brs from @dazn/kopytko-framework
' @import /components/store/Store.facade.brs from @dazn/kopytko-framework
' @import /components/theme/Theme.facade.brs from @dazn/kopytko-framework

sub init()
  m.router = RouterFacade()
  m.store = StoreFacade()
  m.theme = ThemeFacade()
end sub
