class ContactUsModel{
  final String name;
  final String role;
  final String phone;
  final String email;
  final String image;

  ContactUsModel(
    this.name,
    this.role,
    this.phone,
    this.email,
    this.image,
  );
}

List<ContactUsModel> contactUsList = [
  ContactUsModel("Monika B A", "Software Engineer", "7676373298", "bamonika@gmail.com", "assets/team/monika.jpeg"),
  ContactUsModel("Jeethendra S R", "Software Developer", "7676373298", "jeethendrajeethu8@gmail.com", "assets/team/jeethendra.jpeg"),
  ContactUsModel("Nischitha", "Software Engineer", "7676373298", "nischushetty@gmail.com", "assets/team/nischitha.jpeg"),
  ContactUsModel("Pranav V Bharadwaj", "Software Developer", "6363255811", "pranavbharadwaj@gmail.com", "assets/team/pranav.jpeg"),
];