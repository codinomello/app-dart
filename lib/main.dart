import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const WeebieApp());
}

class WeebieApp extends StatelessWidget {
  const WeebieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weebie - Projetos Comunitários',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
        fontFamily: 'EuclidCircularA',
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        fontFamily: 'EuclidCircularA',
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _darkMode = false;
  bool _mobileMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: isMobile ? _buildMobileAppBar(isDark) : _buildDesktopAppBar(isDark),
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildFeaturedProjects(),
            _buildHowItWorks(),
            _buildImpactStats(),
            _buildTestimonials(),
            _buildUpcomingEvents(),
            _buildFaqSection(),
            _buildCallToAction(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  AppBar _buildDesktopAppBar(bool isDark) {
    return AppBar(
      title: Row(
        children: [
          Image.asset('assets/icons/house_with_garden.png', width: 40, height: 40),
          const SizedBox(width: 12),
          const Text('Weebie', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
      centerTitle: false,
      actions: [
        TextButton(onPressed: () {}, child: const Text('Início')),
        TextButton(onPressed: () {}, child: const Text('Projetos')),
        TextButton(onPressed: () {}, child: const Text('Sobre')),
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            setState(() {
              _darkMode = !_darkMode;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.amber],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  AppBar _buildMobileAppBar(bool isDark) {
    return AppBar(
      title: Row(
        children: [
          Image.asset('assets/icons/house_with_garden.png', width: 30, height: 30),
          const SizedBox(width: 8),
          const Text('Weebie', style: TextStyle(fontSize: 20)),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            setState(() {
              _darkMode = !_darkMode;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _mobileMenuOpen = !_mobileMenuOpen;
            });
          },
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.amber],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.amber],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/house_with_garden.png', width: 60, height: 60),
                  const SizedBox(height: 10),
                  const Text('Weebie', style: TextStyle(fontSize: 24, color: Colors.white)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Início', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Colors.white),
              title: const Text('Projetos', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('Sobre', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('👋 Comunidades que Inspiram e Transformam!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('Conectando boas ideias a pessoas que fazem acontecer',
              style: TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.work),
                label: const Text('Seus Projetos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.rocket_launch),
                label: const Text('Iniciar Projeto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search),
                label: const Text('Explorar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProjects() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('🌟 Projetos Destacados',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Iniciativas que estão transformando comunidades',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildProjectCard(
                '🌻 Horta Urbana',
                'Ativo',
                'Cultivo coletivo de alimentos orgânicos no centro da cidade',
                0.75,
                Colors.green,
              ),
              _buildProjectCard(
                '📚 Biblioteca Livre',
                'Novo',
                'Pontos de compartilhamento de livros em espaços públicos',
                0.4,
                Colors.blue,
              ),
              _buildProjectCard(
                '🎨 Arte na Rua',
                'Concluído',
                'Oficinas de arte urbana para jovens da comunidade de Guarulhos',
                1.0,
                Colors.pink,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String status, String description, double progress, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Chip(
                  label: Text(status),
                  backgroundColor: color.withOpacity(0.1),
                  labelStyle: TextStyle(color: color),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Progresso:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[200],
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('${(progress * 100).toInt()}%'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color),
              ),
              child: const Text('Apoiar Projeto →'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('🔑 Como Funcionamos',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Um processo simples para grandes transformações',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStepCard('💡', 'Ideia', 'Registre sua iniciativa ou encontre projetos para apoiar', 1),
              _buildStepCard('🤝', 'Conexão', 'Conectamos você com voluntários e recursos necessários', 2),
              _buildStepCard('🌱', 'Implementação', 'Acompanhamos o desenvolvimento do projeto', 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(String emoji, String title, String description, int stepNumber) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),
            CircleAvatar(
              backgroundColor: _getStepColor(stepNumber),
              child: Text(stepNumber.toString(), style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStepColor(int step) {
    switch (step) {
      case 1:
        return Colors.orange;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildImpactStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('📈 Nosso Impacto',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatCard('120+', 'Projetos Ativos', '🏆 Em 15 cidades', Colors.red),
              _buildStatCard('5.8K', 'Voluntários', '🤝 Comunidade ativa', Colors.green),
              _buildStatCard('92%', 'Sucesso', '🎯 Metas alcançadas', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String title, String subtitle, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 8),
            Text(subtitle, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonials() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('🗣️ Quem Apoia',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTestimonialCard(
                '👩🌾',
                'Maria Silva',
                'Voluntária na Horta Comunitária',
                '"A Weebie nos deu estrutura para transformar um terreno abandonado em fonte de alimentos para toda comunidade!"',
                Colors.purple,
              ),
              _buildTestimonialCard(
                '👨🏫',
                'Carlos Mendes',
                'Coordenador de Projetos',
                '"A plataforma simplificou nossa captação de recursos e organização de voluntários de maneira incrível."',
                Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String emoji, String name, String role, String quote, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(role, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(quote, style: TextStyle(color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text('📅 Próximos Eventos',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _buildEventCard('27', 'Maio', 'Motratech', '📌 Colégio Eniac', '16:50h', Colors.teal),
              _buildEventCard('12', 'Abril', 'Workshop de Compostagem', '📌 Centro Comunitário', '14:20h', Colors.amber),
              _buildEventCard('5', 'Junho', 'Oficina de Arte Urbana', '📌 Praça Central', '10:00h', Colors.indigo),
              _buildEventCard('8', 'Agosto', 'Palestra: Agricultura Urbana', '📌 Horta Comunitária', '15:00h', Colors.green),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ver todos os eventos'),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String day, String month, String title, String location, String time, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: color, width: 2),
      ),
      child: SizedBox(
        width: 160,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(day, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text(month, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(location, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
              Text(time, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        children: [
          const Text('❓ Perguntas Frequentes',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          ExpansionTile(
            title: const Text('Como participar de um projeto?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Escolha um projeto em nossa plataforma, clique em "Participar" e siga as instruções. É gratuito e aberto a todos!'),
              ),
            ],
          ),
          // Add more FAQ items here
        ],
      ),
    );
  }

  Widget _buildCallToAction() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          const Text('Pronto para transformar sua comunidade?',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          const SizedBox(height: 16),
          const Text('Sua ideia pode ser a próxima a mudar vidas. Comece agora de forma simples e rápida!',
              style: TextStyle(fontSize: 18, color: Colors.white70)),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.rocket_launch),
                    SizedBox(width: 8),
                    Text('Iniciar Projeto'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Text('Explorar Projetos'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, color: Colors.white70, size: 16),
              SizedBox(width: 8),
              Text('Cadastro rápido - menos de 2 minutos', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.amber],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/house_with_garden.png', width: 48, height: 48),
                      const SizedBox(width: 8),
                      const Text('Weebie', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Transformando ideias em ações comunitárias desde 2023.',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Links Rápidos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.info, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Sobre Nós', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.work, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Todos os Projetos', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Fale Conosco', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Institucional', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.description, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Termos de Uso', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.security, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Privacidade', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.help, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Perguntas Frequentes', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('© 2023 Weebie. Todos os direitos reservados.', style: TextStyle(color: Colors.white70)),
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('Política de Privacidade', style: TextStyle(color: Colors.white70))),
                  TextButton(onPressed: () {}, child: const Text('Termos de Serviço', style: TextStyle(color: Colors.white70))),
                  TextButton(onPressed: () {}, child: const Text('Cookies', style: TextStyle(color: Colors.white70))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}