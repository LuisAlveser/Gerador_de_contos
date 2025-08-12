# TCC

TCC (Análise e Desenvolvimento de Sistemas )📚✨

Este é um aplicativo Flutter inovador projetado para gerar histórias personalizadas para crianças, com foco especial em atender às necessidades de crianças com Transtorno do Espectro Autista (TEA). Utilizando a poderosa Gemini API do Google, o aplicativo cria narrativas adaptadas ao nome, idade, nível de TEA, comunicação, ano escolar e hiperfoco da criança, além de incluir ou excluir elementos específicos e personagens secundários. O objetivo é proporcionar uma experiência de leitura engajadora e inclusiva.

Funcionalidades
Geração de Histórias Personalizadas: Cria histórias únicas baseadas em perfis detalhados de crianças.

Adaptação para TEA: Considera o nível de TEA, comunicação e hiperfoco para uma narrativa mais adequada.

Controle de Conteúdo: Permite especificar elementos que a história deve ou não deve conter.

Personagens Secundários: Inclui nomes de cônjuges e amigos como personagens na história.

Extensão da História: Ajusta o comprimento da história com base no nível de TEA da criança.

Visualização da História: Exibe a história gerada em uma interface de usuário amigável.

Botões de Ação: (Futuras funcionalidades) Botões para "Salvar História" e "Baixar História" (PDF, TXT, etc.).

Tecnologias Utilizadas
Flutter: Framework para desenvolvimento de aplicativos móveis (Android/iOS).

Firebase Firestore: Banco de dados NoSQL para armazenar os perfis das crianças.

Google Gemini API: Modelo de linguagem de IA para geração de texto da história.

flutter_dotenv: Para gerenciar variáveis de ambiente (como a chave da API).

flutter_gemini: SDK para fácil integração com a Gemini API no Flutter.

Como Rodar o Projeto Localmente
Siga estas instruções para configurar e executar o projeto em sua máquina local.

Pré-requisitos
Certifique-se de ter o seguinte instalado:

Flutter SDK: Instruções de Instalação do Flutter

Um editor de código: Como VS Code ou Android Studio

Conta Google Cloud: Para obter uma chave de API do Gemini.

Projeto Firebase: Com Firestore configurado para armazenar os dados das crianças.

1. Clonar o Repositório
git clone <URL_DO_SEU_REPOSITORIO>
cd <nome_do_seu_projeto>

2. Configurar o Arquivo .env
Este projeto utiliza variáveis de ambiente para armazenar a chave da API do Gemini de forma segura.

Crie um arquivo chamado .env na raiz do seu projeto (no mesmo nível do pubspec.yaml).

Adicione sua chave de API do Gemini a este arquivo no seguinte formato:

chave_google_texto="SUA_CHAVE_DE_API_DO_GEMINI_AQUI"

Importante: Substitua "SUA_CHAVE_DE_API_DO_GEMINI_AQUI" pela sua chave real da Gemini API.

3. Instalar Dependências
No terminal, dentro da pasta do projeto, execute:

flutter pub get

4. Configurar Firebase
Certifique-se de que seu projeto Flutter esteja conectado ao seu projeto Firebase e que o Firestore esteja configurado para as coleções de dados das crianças. Siga a documentação oficial do Firebase para Flutter para configurar isso, se ainda não o fez.

5. Rodar o Aplicativo
Conecte um dispositivo físico ou inicie um emulador. Em seguida, execute o aplicativo:

flutter run

Estrutura do Projeto
.
├── lib/
│   ├── main.dart             # Ponto de entrada da aplicação e inicialização do dotenv
│   ├── models/               # Modelos de dados (ex: perfil da criança)
│   ├── screens/              # Telas da aplicação (ex: teladahistoria.dart)
│   ├── services/             # Lógica de serviço (ex: integração com Firebase)
│   └── widgets/              # Widgets reutilizáveis
├── assets/                   # Imagens e outros recursos (ex: fundo_botao.jpg)
├── .env                      # Arquivo para variáveis de ambiente (NÃO ENVIE PARA O GIT!)
├── pubspec.yaml              # Definições do projeto e dependências
└── README.md                 # Este arquivo

Contribuição
Contribuições são bem-vindas! Se você tiver sugestões ou quiser melhorar o projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request.

Faça um fork do repositório.

Crie uma nova branch (git checkout -b feature/sua-feature).

Faça suas alterações e commit (git commit -m 'Adiciona nova feature').

Envie para a branch (git push origin feature/sua-feature).

Abra um Pull Request.



Créditos
Desenvolvido por:  Ericsson Luis
