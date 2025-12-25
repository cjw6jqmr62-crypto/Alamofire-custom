import Foundation

public final class AppRouter {
    public static let shared = AppRouter()
    
    private let networkService: NetworkService
    private let dataCache: DataCache
    
    private init() {
        self.networkService = NetworkService.shared
        self.dataCache = DataCache.shared
    }
    
    public func determineInitialRoute(completion: @escaping (DisplayMode, String?) -> Void) {
        if dataCache.hasContentURL, let cachedURL = dataCache.contentURL {
            networkService.verifyURLAvailability(urlString: cachedURL) { isAvailable in
                if isAvailable {
                    completion(.webContent, cachedURL)
                } else {
                    completion(.nativeInterface, nil)
                }
            }
            return
        }
        
        if dataCache.wasRegistrationAttempted {
            completion(.nativeInterface, nil)
            return
        }
        
        networkService.performRegistration(completion: completion)
    }
}
