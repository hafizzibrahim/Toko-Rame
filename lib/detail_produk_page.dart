import 'package:flutter/material.dart';

class DetailProdukPage extends StatefulWidget {
  const DetailProdukPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailProdukPageState createState() => _DetailProdukPageState();
}

class _DetailProdukPageState extends State<DetailProdukPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _selectedPaket = 'Paket 1';
  String _selectedWarna = 'Coklat';

  final List<String> _productImages = [
    'assets/produk.png',
    'assets/produk.png',
    'assets/produk.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 480,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) =>
                        setState(() => _currentPage = page),
                    itemCount: _productImages.length,
                    itemBuilder: (context, index) => Image.asset(
                      _productImages[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      actions: [
                        Image.asset(
                          'assets/download_icon.png',
                          scale: 0.8,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          'assets/chart_icon.png',
                          scale: 0.8,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30, // Posisi indikator lebih ke bawah
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _productImages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == index ? 30 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFECE806)),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'NEW ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: 'Product Baru',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset('assets/Isolation_Mode.png')
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Beauty Set by Irvie',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Irvie group official',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: const Color(0xFF848C8B)),
                  ),
                  const SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rp 178.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Harga Customer',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 120,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rp 142.400',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Harga Reseller',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFECE806),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10)),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Komisi ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Rp. 35.600',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: ' (20%)',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ukuran',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  setState(() => _selectedPaket = 'Paket 1'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _selectedPaket == 'Paket 1'
                                    ? const Color(0xFFE6E7E7)
                                    : const Color(0xFFE6E7E7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: _selectedPaket == 'Paket 1'
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Paket 1',
                                style: TextStyle(
                                  color: _selectedPaket == 'Paket 1'
                                      ? Colors.black
                                      : const Color(0xFF4A4E5A),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  setState(() => _selectedPaket = 'Paket 2'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _selectedPaket == 'Paket 2'
                                    ? const Color(0xFFE6E7E7)
                                    : const Color(0xFFE6E7E7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: _selectedPaket == 'Paket 2'
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Paket 2',
                                style: TextStyle(
                                  color: _selectedPaket == 'Paket 2'
                                      ? Colors.black
                                      : const Color(0xFF4A4E5A),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Warna',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 16,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedWarna = 'Coklat'),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFDDB69A),
                                  border: Border.all(
                                    color: _selectedWarna == 'Coklat'
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedWarna = 'Cream'),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF5B3E36),
                                  border: Border.all(
                                    color: _selectedWarna == 'Cream'
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Stock ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '99+ pcs',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deskripsi',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Image.asset('assets/document-copy.png'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '*New Material*\nTerbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan.\nMenggunakan fit Relaxed Fit.\n-\nSIZE CHART RELAXED SHIRT....',
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Implementasi untuk menampilkan deskripsi lengkap
                        },
                        child: const Text('Selengkapnya',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      Image.asset('assets/arrow-down.png'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Produk lain dari Irvie group official',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/produk.png',
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    bottom: 2,
                                    left: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: const TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '30% ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            TextSpan(
                                              text: 'Komisi',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                if (index == 1 || index == 2)
                                  Positioned(
                                    top: 0,
                                    right: 10,
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          'assets/label_new_icon.png',
                                        ),
                                        const Positioned(
                                          bottom: 0,
                                          top: 3,
                                          left: 5,
                                          right: 0,
                                          child: Text(
                                            'New',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Produk ${index + 1}',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Harga Reseller',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: const Color(0xFF697170)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rp 142.400',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/archive_icon.png'),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '99+ pcs',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF242626),
                            ),
                            child: const Center(
                              child: Text(
                                'Bagikan',
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.close),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Bagikan produk',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Teks dan link',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const Divider(),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Gambar',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const Divider(),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Tambahkan ke toko'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image.asset(
                  'assets/chart_icon.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
