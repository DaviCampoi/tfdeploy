🚀 TFDeploy

Projeto de deploy de site estático utilizando Nginx + WSL (Ubuntu) + GitHub, com aplicação de boas práticas de segurança, organização de logs e permissões corretas de arquivos.

📌 Sobre o Projeto

O TFDeploy é um projeto focado em:

Configuração manual de servidor Nginx

Deploy local via WSL

Organização de permissões Linux

Hardening básico de segurança

Publicação e versionamento via GitHub

🛠 Tecnologias Utilizadas

Linux (WSL - Ubuntu)

Nginx

Git

GitHub

HTML5

CSS3

📂 Estrutura do Projeto
TF01/
│
├── website/
│   ├── index.html
│   ├── css/
│   └── images/
│
├── configuracao.md
└── README.md

Arquivos publicados em:

/var/www/piscesandroses/
🌐 Configuração do Servidor (Resumo)
🔹 Virtual Host Nginx

Porta 80

Root customizado

Logs personalizados

Segurança aplicada

Remoção do site default

🔐 Permissões Aplicadas
📂 Pastas → 755
rwxr-xr-x

Permite que o Nginx acesse diretórios sem conceder escrita pública.

📄 Arquivos → 644
rw-r--r--

Evita execução indevida e mantém segurança.

🚫 Remoção do Site Default

Arquivo removido:

/etc/nginx/sites-enabled/default
Motivo:

Evitar conflito

Evitar página padrão do Nginx

Melhor organização do servidor

📊 Logs Personalizados
/var/log/nginx/pisces_access.log
/var/log/nginx/pisces_error.log

Benefícios:

Debug facilitado

Auditoria de acessos

Isolamento do projeto

🛡 Segurança Aplicada
✔ Bloqueio de arquivos ocultos
location ~ /\.ht {
    deny all;
}
✔ Headers de Segurança
X-Frame-Options
X-Content-Type-Options
X-XSS-Protection
✔ Uso de try_files
try_files $uri $uri/ =404;

Evita fallback inseguro e exposição indevida de arquivos.

🚀 Como Atualizar o Deploy

Dentro do WSL:

sudo cp -r ~/TF01/website/* /var/www/piscesandroses/

Reiniciar Nginx:

sudo nginx -t
sudo systemctl restart nginx
📦 Versionamento

Subida para o GitHub via:

git add .
git commit -m "Update deploy"
git push
🎯 Objetivo Técnico

Este projeto demonstra:

Conhecimento em ambiente Linux

Configuração manual de servidor web

Estruturação de projeto para produção

Aplicação de boas práticas DevOps iniciais

Deploy controlado e versionado

👨‍💻 Autor

Davi Campoi
GitHub: https://github.com/DaviCampoi

📌 Próximos Passos (Evolução do Projeto)

Implementar HTTPS (SSL)

Configurar domínio real

Deploy em VPS

Automatizar com GitHub Actions

Aplicar cache e compressão (gzip)
