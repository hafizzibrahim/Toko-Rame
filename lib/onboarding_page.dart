import 'package:flutter/material.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingItem({
    required this.image, 
    required this.title, 
    required this.subtitle
  });
}

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({
    super.key, 
    required this.currentPage, 
    required this.totalPages
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentPage == index ? 30 : 10,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: currentPage == index
              ? null
              : const Center(
                  child: SizedBox(
                    width: 6,
                    height: 6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Lewati',
        style: TextStyle(color: Color(0xFF242626), fontSize: 16),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              item.title,
              style: const TextStyle(
                color: Color(0xFF242626),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 60,
          child: Text(
            item.subtitle,
            style: const TextStyle(
              color: Color(0xFF242626),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF242626),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Selanjutnya',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingData = const [
    OnboardingItem(
      image: 'assets/onboarding1.png',
      title: 'Gratis Materi Belajar Menjadi Seller Handal',
      subtitle:
          'Nggak bisa jualan?\nJangan khawatir, Tokorame akan membimbing kamu hingga menjadi seller langsung dari ahlinya',
    ),
    OnboardingItem(
      image: 'assets/onboarding2.png',
      title: 'Ribuan Produk dengan Kualitas Terbaik',
      subtitle:
          'Tokorame menyediakan ribuan produk dengan kualitas terbaik dari seller terpercaya',
    ),
    OnboardingItem(
      image: 'assets/onboarding3.png',
      title: 'Toko Online Unik Untuk Kamu Jualan',
      subtitle: 'Subdomain unik dan toko online profesional siap pakai',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Implementasi untuk halaman terakhir
    }
  }

  void _skipOnboarding() {
    // Implementasi untuk melewati onboarding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) => setState(() => _currentPage = page),
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) => Image.asset(
              _onboardingData[index].image,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 40,
            right: 0,
            child: SkipButton(onPressed: _skipOnboarding),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                PageIndicator(
                  currentPage: _currentPage,
                  totalPages: _onboardingData.length,
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OnboardingContent(item: _onboardingData[_currentPage]),
                      const SizedBox(height: 20),
                      NextButton(onPressed: _nextPage),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
