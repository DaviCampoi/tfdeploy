# TF01 - Pisces & Roses

Projeto acadêmico da disciplina de Infraestrutura / Deploy, com configuração manual de servidor **Nginx no WSL (Ubuntu)**, aplicação de boas práticas de segurança e versionamento via GitHub.

---

## 👨‍🎓 Aluno

- **Nome:** Davi Lucas Conteli Campoi  
- **RA:** 6324300  
- **Curso:** Análise e Desenvolvimento de Sistemas - 5° Semestre  

---

## 🏢 Empresa Fictícia

- **Nome:** Pisces & Roses  
- **Ramo:** Moda e Acessórios  
- **Descrição:** Empresa fictícia especializada na venda online de roupas e acessórios com identidade moderna, minimalista e estética digital voltada ao público jovem.

---

## 🚀 Sobre o Projeto

O projeto consiste na:

- Instalação e configuração do Nginx
- Criação de Virtual Host personalizado
- Organização de permissões Linux (755 e 644)
- Implementação de logs personalizados
- Aplicação de medidas básicas de segurança
- Deploy manual via WSL
- Versionamento no GitHub

---

## 🛠 Tecnologias Utilizadas

- Ubuntu (WSL)
- Nginx
- Git
- GitHub
- HTML5
- CSS3

---

## 📂 Estrutura do Projeto

```
TF01/
│
├── website/
│   ├── index.html
│   ├── sobre.html
│   ├── servicos.html
│   ├── contato.html
│   ├── css/
│   └── images/
│
├── configuracao.md
└── README.md
```

Arquivos publicados em:

```
/var/www/piscesandroses/
```

---

# 🖥 Como Executar

## 📋 Pré-requisitos

- Ubuntu 20.04+ ou similar
- WSL instalado (Windows Subsystem for Linux)
- Acesso sudo

---

## ⚙️ Instalação

```bash
# Clone o repositório
git clone https://github.com/DaviCampoi/tfdeploy.git

# Acesse a pasta
cd TF01

# (Opcional) Caso exista script de instalação
chmod +x scripts/install.sh
./scripts/install.sh
```

---

## 🌐 Acesso

Após configurar o Nginx:

Site principal:

```
http://localhost
```

### 📄 Páginas disponíveis:

- `/` (Home)
- `/sobre.html`
- `/servicos.html`
- `/contato.html`

---

## ⚙️ Configurações Aplicadas

- Nginx configurado com Virtual Host personalizado
- Root customizado para `/var/www/piscesandroses`
- Logs personalizados em `/var/log/nginx/`
- Permissões configuradas para usuário atual
- Página 404 customizada
- Uso de `try_files` para segurança
- Remoção do site default do Nginx
- Aplicação de headers de segurança

---

## 🔐 Permissões Aplicadas

### 📂 Pastas → 755

```
rwxr-xr-x
```

Permite leitura e execução para o Nginx sem liberar escrita pública.

### 📄 Arquivos → 644

```
rw-r--r--
```

Evita execução indevida e mantém segurança no servidor.

---

## 📊 Logs Personalizados

```
/var/log/nginx/pisces_access.log
/var/log/nginx/pisces_error.log
```

Benefícios:

- Melhor organização
- Facilidade de auditoria
- Debug simplificado

---

## 🛡 Segurança Aplicada

### Bloqueio de arquivos ocultos

```nginx
location ~ /\.ht {
    deny all;
}
```

### Headers de segurança aplicados

- `X-Frame-Options`
- `X-Content-Type-Options`
- `X-XSS-Protection`

### Uso de try_files

```nginx
try_files $uri $uri/ =404;
```

Evita exposição indevida de arquivos inexistentes.

---

## 🧰 Comandos Úteis

### Verificar status do Nginx

```bash
sudo systemctl status nginx
```

### Ver logs de acesso

```bash
sudo tail -f /var/log/nginx/pisces_access.log
```

### Ver logs de erro

```bash
sudo tail -f /var/log/nginx/pisces_error.log
```

### Testar configuração do Nginx

```bash
sudo nginx -t
```

### Reiniciar Nginx

```bash
sudo systemctl restart nginx
```

---

## 📦 Versionamento

```bash
git add .
git commit -m "Atualização do projeto"
git push
```

---

## 🎯 Objetivo Técnico

Este projeto demonstra:

- Configuração manual de servidor Linux
- Criação de ambiente de deploy local
- Aplicação de boas práticas de segurança
- Organização estrutural de projeto web
- Versionamento profissional com Git

---

## 📌 Entrega

Repositório GitHub:

```
https://github.com/DaviCampoi/tfdeploy
```
