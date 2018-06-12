import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
  /// Register routes to the router
  let router = EngineRouter.default()
  try routes(router)
  services.register(router, as: Router.self)
  
  /// Register middleware
  var middlewares = MiddlewareConfig() // Create _empty_ middleware config
  /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
  middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
  services.register(middlewares)
  
  let wss = NIOWebSocketServer.default()
  
  wss.get("event") { ws, r in
    ws.onText({ ws, s in
      ws.send(s.uppercased())
    })
  }
  
  services.register(wss, as: WebSocketServer.self)
}
