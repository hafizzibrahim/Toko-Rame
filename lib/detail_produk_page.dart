import 'package:flutter/material.dart';

class DetailProdukPage extends StatefulWidget {
  const DetailProdukPage({super.key});

  @override
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
            _buildImageCarousel(),
            _buildProductDetails(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildImageCarousel() {
    return Stack(
      children: [
        SizedBox(
          height: 480,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) => setState(() => _currentPage = page),
            itemCount: _productImages.length,
            itemBuilder: (context, index) => Image.asset(
              _productImages[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
        _buildAppBar(),
        _buildPageIndicator(),
        _buildBottomContainer(),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            _buildAppBarIcon('assets/download_icon.png'),
            const SizedBox(width: 16),
            _buildAppBarIcon('assets/chart_icon.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarIcon(String assetPath) {
    return Image.asset(assetPath, scale: 0.8);
  }

  Widget _buildPageIndicator() {
    return Positioned(
      bottom: 30,
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
    );
  }

  Widget _buildBottomContainer() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 16,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductHeader(),
          const SizedBox(height: 16),
          _buildPriceSection(context),
          const SizedBox(height: 8),
          _buildSizeAndColorSelection(context),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          _buildDescriptionSection(context),
          const SizedBox(height: 16),
          _buildRelatedProducts(),
        ],
      ),
    );
  }

  Widget _buildProductHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNewProductLabel(),
        Image.asset('assets/Isolation_Mode.png'),
      ],
    );
  }

  Widget _buildNewProductLabel() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFECE806),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'NEW ',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(
              text: 'Product Baru',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSection(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPriceColumn('Rp 178.000', 'Harga Customer', context),
          const VerticalDivider(width: 120, thickness: 1, color: Colors.grey),
          _buildPriceColumn('Rp 142.400', 'Harga Reseller', context),
        ],
      ),
    );
  }

  Widget _buildPriceColumn(String price, String label, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          price,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildSizeAndColorSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSizeSelection(),
        const SizedBox(height: 16),
        _buildColorSelection(),
        const SizedBox(height: 16),
        _buildStockInfo(),
      ],
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ukuran', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildSizeButton('Paket 1'),
            _buildSizeButton('Paket 2'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () => setState(() => _selectedPaket = size),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE6E7E7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: _selectedPaket == size ? Colors.black : Colors.transparent,
          ),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: _selectedPaket == size ? Colors.black : const Color(0xFF4A4E5A),
        ),
      ),
    );
  }

  Widget _buildColorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Warna', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            _buildColorOption('Coklat', const Color(0xFFDDB69A)),
            _buildColorOption('Cream', const Color(0xFF5B3E36)),
          ],
        ),
      ],
    );
  }

  Widget _buildColorOption(String colorName, Color color) {
    return GestureDetector(
      onTap: () => setState(() => _selectedWarna = colorName),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: _selectedWarna == colorName ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildStockInfo() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(text: 'Stock ', style: TextStyle(color: Colors.black)),
          TextSpan(
            text: '99+ pcs',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Deskripsi', style: Theme.of(context).textTheme.titleMedium),
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
              child: const Text('Selengkapnya', style: TextStyle(color: Colors.blue)),
            ),
            Image.asset('assets/arrow-down.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildRelatedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Produk lain dari Irvie group official', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => _buildRelatedProductCard(index),
        ),
      ],
    );
  }

  Widget _buildRelatedProductCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRelatedProductImage(index),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildRelatedProductInfo(index),
          ),
        ),
        _buildShareButton(),
      ],
    );
  }

  Widget _buildRelatedProductImage(int index) {
    return ClipRRect(
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
          _buildRelatedProductLabel(index),
        ],
      ),
    );
  }

  Widget _buildRelatedProductLabel(int index) {
    return Positioned(
      bottom: 2,
      left: 2,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '30% ',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              TextSpan(text: 'Komisi', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRelatedProductInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produk ${index + 1}',
          style: Theme.of(context).textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Text(
          'Harga Reseller',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFF697170)),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        _buildRelatedProductPrice(),
      ],
    );
  }

  Widget _buildRelatedProductPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rp 142.400',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Row(
          children: [
            Image.asset('assets/archive_icon.png'),
            const SizedBox(width: 4),
            Text(
              '99+ pcs',
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShareButton() {
    return Container(
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
    );
  }

  BottomAppBar _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAddToStoreButton(context),
          _buildChartIcon(),
        ],
      ),
    );
  }

  Widget _buildAddToStoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showShareModal(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(child: Text('Tambahkan ke toko')),
      ),
    );
  }

  void _showShareModal(BuildContext context) {
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
                  SizedBox(width: 16),
                  Text('Bagikan produk', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
              _buildShareOptions(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('Teks dan link', style: TextStyle(color: Colors.black)),
        ),
        const Divider(),
        TextButton(
          onPressed: () {},
          child: const Text('Gambar', style: TextStyle(color: Colors.black)),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildChartIcon() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset('assets/chart_icon.png'),
      ),
    );
  }
}
