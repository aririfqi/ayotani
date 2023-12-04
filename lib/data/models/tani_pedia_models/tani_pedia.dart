class TaniPediaModel {
  late String id, title, materi, pictureId, rating, city;

  TaniPediaModel({
    required this.id,
    required this.title,
    required this.materi,
    required this.pictureId,
    required this.rating,
    required this.city,
  });
}

var pedia = [
  TaniPediaModel(
    id: "12023",
    title: "Dampak perubahan iklim pada lahan pertanian",
    materi:
        "Terjadinya perubahan iklim dan cuaca yang semakin meluas itu, banyak ditengarai akibat kerusakan lingkungan yang semakin parah. Penebangan hutan secara liar dan tidak terkendali, penggunaan gas freon dan pestisida kimia secara berlebihan, pencemaran udara oleh pabrik maupun kendaraan bermotor, penggunaan plastik dan benda lain yang sulit terurai dalam tanah dan berbagai tindakan atau prilaku tidak peduli kepada lingkungan yang dilakukan baik secara sadar maupun tidak sadar. Tindakan atau perilaku tersebut kemudian berdampak pada kenaikan suhu permukaan bumi atau pemanasan global (Global Warming), menurunnya kualitas tanah, udara dan air akibat pencemaran yang kemudian terakulumulasi sebagai penyebab terjadinya perubahan iklim secara signifikan.",
    pictureId:
        "https://cdn.pixabay.com/photo/2019/05/30/16/49/cornfield-4240209_1280.jpg",
    city: "Lombok Tengah",
    rating: "4.7",
  ),
  TaniPediaModel(
    id: "22023",
    title: "Pemanfaatan digital pada pertanian dapat memulihkan ekonomi",
    materi:
        "Pemanfaatan digital pada pertanian dapat memulihkan ekonomi dengan cara meningkatkan efisiensi, produktivitas, dan ketahanan sektor pertanian. Teknologi seperti Internet of Things (IoT), analitika data, dan aplikasi seluler telah memungkinkan para petani untuk mengelola tanaman dan hewan mereka dengan lebih efektif, mengoptimalkan penggunaan sumber daya, dan memonitor kondisi lingkungan. Selain itu, platform perdagangan elektronik dan pasar digital memungkinkan para petani untuk menjual produk mereka secara langsung kepada konsumen, mengurangi ketergantungan pada perantara, dan meningkatkan pendapatan. Dengan demikian, pemanfaatan teknologi digital dalam pertanian tidak hanya meningkatkan kesejahteraan petani tetapi juga berpotensi menggerakkan pertumbuhan ekonomi secara keseluruhan.",
    pictureId:
        "https://digitalbisa.id/uploads/articles/digitalisasi-pertanian-dengan-implementasi-aplikasi-agree-pt-telkom-H9weYVTyXI.jpeg",
    city: "Mataram",
    rating: "4.6",
  ),
  TaniPediaModel(
    id: "32023",
    title: "Pertanian organik buahkan hasil ratusan juta rupiah",
    materi:
        "Pertanian organik telah membuktikan potensinya dalam menghasilkan pendapatan yang signifikan, mencapai ratusan juta rupiah. Dengan menghindari penggunaan pestisida dan pupuk kimia, serta fokus pada prinsip-prinsip berkelanjutan dan alamiah, para petani organik mampu menghasilkan produk pertanian yang lebih berkualitas dan bernilai lebih tinggi. Pasar global semakin menghargai produk organik karena mereka lebih sehat dan ramah lingkungan. Selain itu, pertumbuhan kesadaran konsumen tentang pentingnya makanan organik telah meningkatkan permintaan, yang berpotensi menghasilkan pendapatan yang substansial bagi petani yang mengadopsi praktik pertanian organik. Dengan komitmen yang kuat untuk menjaga kualitas dan keberlanjutan, pertanian organik mampu menjadi sumber pendapatan yang menguntungkan dan berkelanjutan bagi banyak petani.",
    pictureId:
        "https://assets-a1.kompasiana.com/items/album/2018/03/02/conservatory-1782437-1920-5a9967bfcaf7db28a877b362.jpg",
    city: "Lombok Timur",
    rating: "4.4",
  ),
  TaniPediaModel(
    id: "42023",
    title:
        "Langkah kementrian pertanian agar petani tetap panen dimusim kemarau",
    materi:
        "Kementerian Pertanian mengambil serangkaian langkah strategis untuk memastikan petani tetap panen selama musim kemarau. Salah satu langkah kunci adalah pengembangan teknologi irigasi modern dan penggunaan sumber daya air yang efisien, sehingga petani dapat mengelola pasokan air dengan lebih baik dalam kondisi kekeringan. Selain itu, Kementerian Pertanian memberikan pelatihan dan pendidikan kepada petani tentang praktik-praktik pertanian berkelanjutan yang dapat membantu mereka mengurangi dampak musim kemarau, seperti penggunaan varietas tahan kekeringan dan pemilihan tanaman yang sesuai. Pemantauan cuaca dan penyediaan informasi musim yang akurat juga menjadi prioritas, memungkinkan petani untuk merencanakan pertanian mereka dengan lebih baik. Dengan langkah-langkah ini, Kementerian Pertanian berkomitmen untuk mendukung ketahanan pangan dan kesejahteraan petani di tengah tantangan musim kemarau.",
    pictureId: "https://diskominfo.jogjaprov.go.id/upload/images//kemarau.jpg",
    city: "Jakarta",
    rating: "4.3",
  ),
  TaniPediaModel(
    id: "52023",
    title: "Petani bawang merah mengalami kerugian besar",
    materi:
        "Petani bawang merah mengalami kerugian besar akibat berbagai faktor yang memengaruhi produksi mereka. Salah satu faktor utama adalah fluktuasi harga bawang merah yang tidak stabil di pasaran, yang seringkali berada di bawah biaya produksi. Selain itu, cuaca yang tidak dapat diprediksi, seperti hujan berlebihan atau kekeringan, juga telah mempengaruhi hasil panen secara negatif. Faktor lain termasuk masalah penyakit dan hama yang dapat mengurangi produktivitas tanaman bawang merah. Kerugian ini bukan hanya memengaruhi ekonomi petani, tetapi juga dapat berdampak pada ketahanan pangan lokal. Oleh karena itu, dukungan dan bantuan kepada petani bawang merah di Pemalang adalah penting untuk membantu mereka mengatasi tantangan ini dan mempertahankan keberlanjutan pertanian mereka.",
    pictureId:
        "https://asset-2.tstatic.net/tribunnews/foto/bank/images/petani-bawang-merah-pemalang2_20160203_080028.jpg",
    city: "Lombok Tengah",
    rating: "4.2",
  ),
  TaniPediaModel(
    id: "62023",
    title: "Bibit padi berkualitas hasilkan padi hingga berton-ton",
    materi:
        "Bibit padi berkualitas memegang peran krusial dalam meningkatkan produktivitas pertanian, yang mampu menghasilkan padi hingga berton-ton. Bibit yang unggul memiliki sifat-sifat yang diinginkan seperti ketahanan terhadap penyakit, pertumbuhan seragam, dan potensi hasil yang tinggi. Dengan menggunakan bibit padi berkualitas, petani dapat mengurangi risiko gagal panen dan memaksimalkan hasil produksi. Ini bukan hanya menguntungkan bagi petani sendiri tetapi juga berkontribusi pada ketahanan pangan suatu negara, memastikan pasokan beras yang memadai untuk populasi yang terus bertumbuh. Oleh karena itu, investasi dalam penggunaan bibit padi berkualitas merupakan langkah penting dalam upaya meningkatkan produksi padi secara signifikan.",
    pictureId: "https://www.agrotani.com/wp-content/uploads/2015/09/tapin3.jpg",
    city: "Lombok Barat",
    rating: "4.2",
  ),
  TaniPediaModel(
    id: "72023",
    title:
        "Cara saat menanam kangkung untuk menghasilkan kangkung yang segar dan berkualitas",
    materi:
        "Untuk menghasilkan kangkung yang segar dan berkualitas, ada beberapa cara yang dapat diikuti saat menanamnya. Pertama, pemilihan benih yang baik sangat penting. Pastikan untuk memilih benih kangkung yang sehat dan bebas dari penyakit. Kedua, pilihlah lokasi yang mendapatkan sinar matahari yang cukup, tetapi juga terlindung dari angin kencang. Ketiga, perhatikan pola penyiraman yang tepat, kangkung membutuhkan kelembaban yang konsisten, tetapi juga perlu drainase yang baik untuk mencegah genangan air. Keempat, berikan pupuk organik secara teratur untuk mendukung pertumbuhan yang baik dan kualitas yang lebih baik. Terakhir, lakukan pemangkasan daun secara berkala untuk merangsang pertumbuhan tunas baru dan memastikan kangkung tetap segar dan lezat. Dengan mengikuti langkah-langkah ini, Anda dapat menghasilkan kangkung yang sehat, segar, dan berkualitas tinggi.",
    pictureId:
        "https://www.ruparupa.com/blog/wp-content/uploads/2021/11/cara-menanam-kangkung-di-rumah.jpeg",
    city: "Lombok Timur",
    rating: "4.2",
  ),
  TaniPediaModel(
    id: "82023",
    title: "Pentingnya Edukasi pertanian",
    materi:
        "Edukasi pertanian memiliki peran penting dalam meningkatkan produktivitas, keberlanjutan, dan ketahanan pangan dalam sektor pertanian. Melalui edukasi, para petani dapat memperoleh pengetahuan dan keterampilan terbaru dalam praktik pertanian yang efektif, penggunaan teknologi modern, dan manajemen sumber daya alam. Ini membantu mereka mengoptimalkan hasil panen, mengurangi risiko kerugian, dan menghadapi tantangan lingkungan. Selain itu, edukasi pertanian juga membuka peluang baru, seperti diversifikasi tanaman, pengembangan pasar, dan pemasaran produk pertanian yang lebih baik. Dengan demikian, edukasi pertanian tidak hanya memberikan manfaat bagi petani secara individu, tetapi juga berkontribusi pada ketahanan pangan suatu negara dan perkembangan sektor pertanian secara keseluruhan.",
    pictureId:
        "https://www.denpasarkota.go.id/public/uploads/berita/Berita_220409020936_34-orang-anak-tk-swastika-belajar-edukasi-pertanian-di-pkt-ketahanan-pangan-nabati-dan-hewani-desa-dauh-puri-kaja.jpg",
    city: "Mataram",
    rating: "4.1",
  ),
];
