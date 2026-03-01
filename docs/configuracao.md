📄 configuracao.md
📌 Configuração do Servidor Web com Nginx + WSL

Este documento descreve toda a configuração aplicada ao servidor Nginx no ambiente WSL (Ubuntu), incluindo permissões, segurança, logs personalizados e boas práticas.

🐧 1. Estrutura do Projeto

Projeto desenvolvido dentro do WSL:

~/TF01/website/

Arquivos publicados em:

/var/www/piscesandroses/
🔐 2. Permissões de Arquivos (755 e 644)
📂 Permissões 755 (pastas)
sudo chmod -R 755 /var/www/piscesandroses
🔎 O que significa 755?
Usuário	Permissão
Dono	rwx (ler, escrever, executar)
Grupo	r-x (ler e executar)
Outros	r-x (ler e executar)

✔ Necessário para que o Nginx possa acessar e entrar nas pastas.

📄 Permissões 644 (arquivos)
sudo find /var/www/piscesandroses -type f -exec chmod 644 {} \;
🔎 O que significa 644?
Usuário	Permissão
Dono	rw- (ler e escrever)
Grupo	r-- (somente leitura)
Outros	r-- (somente leitura)

✔ Garante segurança impedindo execução indevida de arquivos.

🚫 3. Remoção do Site Default

O Nginx instala um site padrão:

/etc/nginx/sites-enabled/default

Removemos para evitar conflitos:

sudo rm /etc/nginx/sites-enabled/default
✅ Por que remover?

Evita conflito de portas

Evita que o Nginx abra a página padrão

Mantém apenas nosso domínio ativo

Melhora organização

🌐 4. Configuração do Virtual Host

Arquivo:

/etc/nginx/sites-available/piscesandroses

Conteúdo aplicado:

server {
    listen 80;
    server_name localhost;

    root /var/www/piscesandroses;
    index index.html;

    access_log /var/log/nginx/pisces_access.log;
    error_log /var/log/nginx/pisces_error.log;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ /\.ht {
        deny all;
    }

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    add_header X-XSS-Protection "1; mode=block";
}
📄 5. Uso de try_files
try_files $uri $uri/ =404;
🔎 O que faz?

Tenta abrir o arquivo solicitado.

Se não existir, tenta como diretório.

Se ainda não existir → retorna erro 404.

✅ Benefícios

Evita exposição de diretórios

Evita fallback inseguro

Protege contra exploração de arquivos inexistentes

📊 6. Logs Personalizados

Definimos logs separados:

access_log /var/log/nginx/pisces_access.log;
error_log /var/log/nginx/pisces_error.log;
✅ Por que usar logs personalizados?

Organização

Facilita debug

Isola erros do projeto

Ajuda auditoria de segurança

Ver logs em tempo real:

sudo tail -f /var/log/nginx/pisces_error.log
🔒 7. Segurança Aplicada
🔹 Bloqueio de arquivos ocultos
location ~ /\.ht {
    deny all;
}

Evita acesso a:

.htaccess

.env

arquivos ocultos sensíveis

🔹 Headers de Segurança
add_header X-Frame-Options "SAMEORIGIN";
add_header X-Content-Type-Options "nosniff";
add_header X-XSS-Protection "1; mode=block";
🛡 X-Frame-Options

Protege contra ataques de Clickjacking.

🛡 X-Content-Type-Options

Impede interpretação incorreta de tipos de arquivos.

🛡 X-XSS-Protection

Ativa proteção contra ataques XSS no navegador.

🔄 8. Reiniciar Nginx

Após qualquer alteração:

sudo nginx -t
sudo systemctl restart nginx
🚀 9. Publicação do Projeto

Para atualizar arquivos:

sudo cp -r ~/TF01/website/* /var/www/piscesandroses/