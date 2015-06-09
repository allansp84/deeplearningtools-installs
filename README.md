# Deep Learning Tools - Script Installs

### Ambiente Virtuais para Desenvolvimento Python

Virtualenv é uma ferramenta que nos permite criar ambientes virtuais de desenvolvimento para projetos Python permitindo o trabalho em diferentes projetos paralelamente, mesmo que os projetos tenham dependências conflitantes. Os ambientes virtuais nos auxiliam no gerenciamento de quais módulos e versões estão sendo usados em cada projeto e também facilita a instalação de módulos usando o pip sem a necessidade de privilégios de root. Em suma, o uso de ambiente virtual facilita:

1. O trabalho em projetos em paralelo com diferentes dependência de módulos;
2. A instalação de módulos Python para usuários que não tenham permissão de root;
3. O controle dos módulos, e suas respectivas versões, que estão sendo usado em cada projeto;
4. A geração de lista de dependências de um projeto (modulos e suas respectivas versões), algo importante para a reproducibilidade do projeto.


### Virtualenv e Virtualenvwrapper

Virtualenv é uma ferramenta que nos permite criar  e gerenciar ambientes virtuais. Entretanto, existem um extensão desta ferramenta, o virtualenvwrapper, que facilitam muito o trabalho de criação e gerenciamento dos ambientes virtuais, além de organizar todo o ambiente em um só lugar. O virtualenvwrapper nos fornece uma série de comando úteis para gerenciar os ambientes virtuais, sendo que os principais comandos são:

* mkvirtualenv project_deep – Cria um ambiente virtual com o nome project_deep;
* mkproject  project_deep – Cria um ambiente virtual com o nome project_deep e cria um diretório para o desenvolvimento do projeto;
* rmvirtualenv  project_deep – Remove o ambiente virtual project_deep;
* workon  project_deep – Ativa o ambiente virtual
* deactive – Desativa o ambiente virtual

Mais informações sobre este e outros comandos podem ser obtidas em http://virtualenvwrapper.readthedocs.org/en/latest/index.html


### Instalação

Os scripts disponíveis devem ser executados na ordem que segue:

> 1. Execute o script *install_dependences.sh* para instalar as dependências;

> 2. Reinicia a seção do bash para que as dependências seja reconhecida pelo sistema;

> 3. Execute o script *install_caffe.sh* para instalar o framework Caffe e suas dependências de modulos python num ambiente virtual isolado;

> 4. Execute o script *install_theano.sh* para instalar o Theano e suas dependências de modulos python num ambiente virtual isolado;;

> 5. Execute o script *install_simplehp.sh* para instalar o Simple-Hp  e suas dependências de modulos python num ambiente virtual isolado. Esta ferramenta é usado para otimizações de arquiteturas "deep".

Estes scripts instala no diretório /home/user/local os seguintes softwares:

* Torch7 (última versão);
* Boost (versão 1.55);
* VLFeat (versão 0.9.20);
* OpenBLAS (última versão);
* Blitz (versão 0.10);
* Bison (versão 2.3);

