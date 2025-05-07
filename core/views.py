from django.shortcuts import render
from django.http import JsonResponse
from django.core.mail import send_mail
from django.conf import settings
import json

def home(request):
    servicos = [
        {
            'titulo': 'Cópia de grandes formatos',
            'descricao': 'Cópia de originais físicos de grandes formatos de arquitetura e engenharia coloridos ou preto e branco.',
            'icone': 'fas fa-print',
            'imagem_exemplo': 'https://static.vecteezy.com/ti/fotos-gratis/t2/36324708-ai-gerado-cenario-do-uma-tigre-caminhando-dentro-a-floresta-foto.jpg'
        },
        {
            'titulo': 'Encadernações',
            'descricao': 'Encadernação padrão em espiral e capas em PVC, espiral duplo de metal Wire-o, Binder (térmica) e também em capa dura.',
            'icone': 'fas fa-book',
            'imagem_exemplo': '/static/img/exemplo-encadernacoes.jpg'
        },
        {
            'titulo': 'Digitalização',
            'descricao': 'Digitalização de documentos em A4 ou A3 preto e branco ou colorido em alta resolução.',
            'icone': 'fas fa-file-import',
            'imagem_exemplo': '/static/img/exemplo-digitalizacao.jpg'
        },
        {
            'titulo': 'Engenharia',
            'descricao': 'Impressão de projetos de arquitetura e engenharia produzidos em AutoCAD e outros programas.',
            'icone': 'fas fa-drafting-compass',
            'imagem_exemplo': '/static/img/exemplo-engenharia.jpg'
        },
        {
            'titulo': 'Cópia e impressão laser',
            'descricao': 'Impressão e cópia de relatórios, apostilas, fotos em papeis especiais nos formatos padrões.',
            'icone': 'fas fa-copy',
            'imagem_exemplo': '/static/img/exemplo-impressao-laser.jpg'
        },
        {
            'titulo': 'Plastificação e laminação',
            'descricao': 'Plastificação de pequenos formatos e laminação de grandes formatos como projetos, fotos, cartazes.',
            'icone': 'fas fa-layer-group',
            'imagem_exemplo': '/static/img/exemplo-plastificacao.jpg'
        },
        {
            'titulo': 'Banners e Adesivos',
            'descricao': 'Impressão de banners em lona e adesivos em PVC expandido para obras ou ambientes internos.',
            'icone': 'fas fa-image',
            'imagem_exemplo': '/static/img/exemplo-banners-adesivos.jpg'
        },
        {
            'titulo': 'Serviços Gráficos',
            'descricao': 'Produção de cartões de visita, folders e panfletos com acabamento profissional.',
            'icone': 'fas fa-palette',
            'imagem_exemplo': '/static/img/exemplo-servicos-graficos.jpg'
        }
    ]
    
    return render(request, 'core/home.html', {'servicos': servicos})

def enviar_email(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            nome = data.get('nome')
            email = data.get('email')
            telefone = data.get('telefone')
            mensagem = data.get('mensagem')

            # Conteúdo do email
            assunto = f'Nova mensagem de contato de {nome}'
            conteudo = f"""
            Nova mensagem de contato:
            
            Nome: {nome}
            Email: {email}
            Telefone: {telefone}
            
            Mensagem:
            {mensagem}
            """

            # Enviar email
            send_mail(
                assunto,
                conteudo,
                settings.DEFAULT_FROM_EMAIL,
                [settings.DEFAULT_FROM_EMAIL],
                fail_silently=False,
            )

            return JsonResponse({'status': 'success', 'message': 'Email enviado com sucesso!'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)}, status=500)

    return JsonResponse({'status': 'error', 'message': 'Método não permitido'}, status=405) 