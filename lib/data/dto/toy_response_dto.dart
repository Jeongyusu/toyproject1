class ToyResponseDTO {
  final bool success;
  dynamic response;
  final String? error;// response field is dynamic

  ToyResponseDTO(this.success, this.response, this.error);

  ToyResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        response = json["response"],
        error = json["error"];
}