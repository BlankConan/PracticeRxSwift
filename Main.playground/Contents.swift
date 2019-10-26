import UIKit
import RxSwift

let disposeBag = DisposeBag()

let rxTemperature:Observable<Int> = Observable.create { (observable) -> Disposable in
    
    for tem in stride(from: 0, through: 100, by: 5) {
        observable.onNext(tem)
    }
    
    return Disposables.create()
}

// filter
rxTemperature.filter { $0 > 55 }
    .subscribe { print("高温:\($0)度")}
    .disposed(by: disposeBag)

