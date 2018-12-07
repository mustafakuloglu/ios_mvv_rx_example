
import UIKit

extension BaseViewModel{
    func getBaseUrl() -> String {
        return "https://api.themoviedb.org/3/movie/popular?api_key=f25b0eba7f85055400ba1d8a89e570d9"
    }
    
    func getApiKey() -> String {
        return "f25b0eba7f85055400ba1d8a89e570d9"
    }
    
    func getImageUrl(imageUrl:String) -> String {
        return "https://image.tmdb.org/t/p/w260_and_h390_bestv2/\(imageUrl)"
    }
}
