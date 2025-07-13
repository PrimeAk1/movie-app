//
//  CombinedCreditsViewModel.swift
//  movie-app
//
//  Created by Akos  Gegeny   on 2025. 07. 13..
//

import Foundation
import InjectPropertyWrapper
import Combine

protocol CombinedCreditsViewModelProtocol: ObservableObject {
    var combinedCredits: [CombinedCreditCast] { get }
}

class CombinedCreditsViewModel: CombinedCreditsViewModelProtocol, ErrorPresentable {
    @Published var combinedCredits: [CombinedCreditCast] = []
    @Published var alertModel: AlertModel? = nil
    
    let personIdSubject = PassthroughSubject<Int, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Inject
    private var repository: MovieRepository
    
    init() {
        personIdSubject
            .flatMap { [weak self] personId -> AnyPublisher<CombinedCredits, MovieError> in
                guard let self = self else {
                    preconditionFailure("There is no self")
                }
                let request = FetchCombinedCreditsRequest(personId: personId)
                return self.repository.fetchCombinedCredits(req: request)
            }
            .map({ combinedCredits in
                combinedCredits.cast.sorted { $0.fixTitle < $1.fixTitle }
            })
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.alertModel = self?.toAlertModel(error)
                }
            } receiveValue: { [weak self] combinedCreditCast in
                guard let self = self else { preconditionFailure("There is no self") }
                self.combinedCredits = combinedCreditCast
            }
            .store(in: &cancellables)
        
    }
}
