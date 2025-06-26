


struct EditFavoriteResult {
    let success: Bool
    let statusCode: Int
    let statusMessage: String
    
    init(dto: EditFavoriteResponse) {
        self.success = dto.success
        self.statusCode = dto.statusCode
        self.statusMessage = dto.statusMessage
    }
}
