/// a base API url for news feature
const newsBaseUrl = 'https://newsapi.org/v2';

/// an API key, used with [newsBaseUrl]
const newsApiKey = 'a2cf0f24021c44aebcd082a64255629e';

/// a base API url for food and product database feature
const foodBaseUrl = 'https://api.edamam.com/api/food-database/v2/parser';

/// an app id, used with [foodBaseUrl]
const foodAppId = 'd79c2580';

/// an app key, used with [foodBaseUrl]
const foodAppKey = '64a112f6eef502fe92858d780232ee98';

/// a base API url for food recipe feauture
const recipeBaseUrl = 'https://api.edamam.com/api/recipes/v2';

/// an app id, used with [recipeBaseUrl]
const recipeAppId = '81f4800b';

/// an app key, used with [recipeBaseUrl]
const recipeAppKey = 'a3c9fb2ef8a69553992e131387fe7716';

/// a list of certificates that used for request data from API
const certificates = <String, String>{
  'newsApi': 'certificates/sni-cloudflaressl-com.pem',
  'nutritionApi': 'certificates/edamam-com.pem',
};

const userNutrientQuestions = <UserNutrientQuestion>[
  UserNutrientQuestion(
    'Detail nutrisi harian saya tidak muncul.',
    'Kami perlu data umur, usia, berat badan, dan tinggi badan untuk menentukan kebutuhan nutrisi harian anda. Lengkapi data anda pada menu pengaturan profil atau Input secara manual dengan mengklik icon di pojok kanan atas.',
  ),
  UserNutrientQuestion(
    'Bagaimana aplikasi menghitung kebutuhan nutrisi harian saya?',
    'Kebutuhan nutrisi yang tertera di atas adalah Basal Metabolic Rate (BMR) anda yang dihitung menggunakan rumus Harris-Benedict.',
  ),
  UserNutrientQuestion(
    'Apa itu BMR?',
    'Basal Metabolic Rate (BMR) adalah kalori yang tubuh Anda perlukan untuk melakukan aktivitas dasar tubuh. Aktivitas tersebut mencakup memompa jantung, mencerna makanan, bernapas, memperbaiki sel tubuh, hingga membuang racun dalam tubuh.',
  ),
  UserNutrientQuestion(
    'Apa itu kalori dan fungsinya untuk tubuh?',
    'Kalori adalah sumber bahan bakar tubuh yang didapatkan dari mengonsumsi beragam makanan dan minuman. Kalori dari makanan dan minuman tersebut akan digunakan tubuh sebagai energi untuk melakukan segala aktivitas fisik.',
  ),
  UserNutrientQuestion(
    'Apakah BMR sudah akurat dalam menentukan kebutuhan nutrisi?',
    'BMR hanyalah jumlah kalori minimum yang dibutuhkan tubuh Anda untuk dapat menjalankan fungsi organ-organ vital tubuh. Namun, setiap harinya Anda perlu mengonsumsi makanan dan minuman dengan jumlah kalori lebih dari itu.',
  ),
];

class UserNutrientQuestion {
  final String question;
  final String answer;

  const UserNutrientQuestion(this.question, this.answer);
}
