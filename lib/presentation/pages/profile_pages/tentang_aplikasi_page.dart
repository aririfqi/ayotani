import 'package:flutter/material.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: '',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            'assets/img/imageAyotani.png',
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(46, 73, 215, 41),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: const Color.fromARGB(167, 0, 0, 0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Kebijakan Privasi AyoTani',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Terakhir diperbarui pada 28 September 2023',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Selamat datang di AyoTani. Kami sangat menghargai privasi Anda dan berkomitmen untuk melindunginya. Kebijakan Privasi ini menjelaskan bagaimana Kami mengumpulkan, menggunakan, dan melindungi informasi pribadi Anda saat Anda menggunakan Aplikasi AyoTani. Dengan mengakses atau menggunakan Aplikasi ini, Anda setuju untuk mematuhi Kebijakan Privasi ini.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const Text(
                          'AyoTani merupakan startup di bidang pertanian yang menyediakan aplikasi serbaguna yang dapat membantu pengguna dalam memulai dan menghadapi segala kendala dalam bertani. AyoTani dapat diakses melalui smartphone dan memiliki beberapa fitur unggulan seperti TanyaTani, TaniPedia, TaniInvest, TaniTrend, dan TaniMarket ',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Informasi yang kami kumpulkan',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Text(
                          '1.1. Informasi Pribadi: Kami dapat mengumpulkan informasi pribadi yang Anda berikan, seperti nama, alamat email, nomor telepon, dan informasi lain yang Anda berikan saat mendaftar atau menggunakan Aplikasi.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Bagaimana Kami Menggunakan Informasi Anda',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '2.1. Kami menggunakan informasi pribadi Anda untuk memberikan layanan yang Anda minta, seperti memproses pesanan Anda, berkomunikasi dengan Anda, dan memberikan pembaruan tentang Aplikasi AyoTani.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          '2.2. Kami dapat menggunakan informasi non-pribadi untuk analisis statistik, perbaikan Aplikasi, dan untuk mengikuti tren penggunaan.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Pemberian Informasi kepada Pihak Ketiga',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '3.1. Kami tidak akan menjual, menyewakan, atau membagikan informasi pribadi Anda kepada pihak ketiga tanpa izin Anda, kecuali yang diperlukan oleh hukum atau untuk memenuhi tujuan layanan yang Anda minta.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Keamanan Informasi Anda',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '4.1. Kami mengambil langkah-langkah yang wajar untuk melindungi informasi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Perubahan pada Kebijakan Privasi',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '5.1. Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Setiap perubahan akan diberlakukan segera setelah diterbitkan di Aplikasi. Anda disarankan untuk memeriksa Kebijakan Privasi kami secara berkala.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Kontak Kami',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '6.1. Jika Anda memiliki pertanyaan atau komentar tentang Kebijakan Privasi ini, Anda dapat menghubungi kami di email berikut.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tpt.ayotani@gmail.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Colors.lightBlue,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Terima kasih telah menggunakan Aplikasi AyoTani!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
