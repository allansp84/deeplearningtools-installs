# Deep Learning Tools - Script Installs

### Ambientes Virtuais para Desenvolvimento Python

Virtualenv é uma ferramenta que nos permite criar e gerenciar ambientes virtuais de desenvolvimento para projetos Python, os quais nos ajudam a trabalhar em diferentes projetos paralelamente, mesmo que tais projetos tenham dependências conflitantes. Os ambientes virtuais também nos auxiliam no controle de quais módulos e versões estão sendo usados em cada projeto e além de facilitar a instalação de módulos usando o pip (instalador multiplataforma de módulos Python) sem a necessidade de privilégios de root. Em suma, o uso de ambiente virtual facilita:

1. O trabalho em projetos com diferentes dependência de módulos;
2. A instalação de módulos Python para usuários que não tenham permissão de root;
3. O controle dos módulos, e suas respectivas versões, que estão sendo usado em cada projeto;
4. A geração de lista de dependências de um projeto (modulos e suas respectivas versões), algo importante para a reproducibilidade do projeto.


### Virtualenvwrapper

Virtualenvwrapper é uma extensão do Virtualenv que simplifica a criação e o gerenciamento de ambientes virtuais, fornecendo uma série de comandos de fácil utilização. Os principais comandos disponibilizados pelo Virtualenvwrapper são:

* mkvirtualenv project_deep – Cria um ambiente virtual com o nome project_deep;
* mkproject  project_deep – Cria um ambiente virtual com o nome project_deep e cria um diretório para o desenvolvimento do projeto;
* rmvirtualenv  project_deep – Remove o ambiente virtual project_deep;
* workon  project_deep – Ativa o ambiente virtual
* deactive – Desativa o ambiente virtual

Mais informações sobre este e outros comandos podem ser obtidas em http://virtualenvwrapper.readthedocs.org/en/latest/index.html


### Instalação

Os scripts disponíveis devem ser executados na ordem que segue:

> 1. Execute o script *install_dependences.sh* para instalar as dependências;

> 2. Reinicie a seção do bash para que as dependências seja reconhecida pelo sistema;

> 3. Execute o script *install_caffe.sh* para instalar o framework Caffe e suas dependências de modulos python no ambiente virtual **caffe-env**;

> 4. Execute o script *install_theano.sh* para instalar o Theano e suas dependências de modulos python no ambiente virtual **theano-env**;

> 5. Execute o script *install_simplehp.sh* para instalar o Simple-Hp  e suas dependências de modulos python  no ambiente virtual **simplehp-env**. Esta ferramenta é usado para otimizações de arquiteturas "deep".

Estes scripts instala no diretório /home/user/local os seguintes softwares:

* Torch7 (última versão);
* Boost (versão 1.55);
* VLFeat (versão 0.9.20);
* OpenBLAS (última versão);
* Blitz (versão 0.10);
* Bison (versão 2.3);

