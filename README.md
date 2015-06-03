# deeplearningtools-installs

## Ambiente Virtuais para Desenvolvimento Python

Ambientes virtuais é uma ferramenta que nos permite criar ambientes virtuais de desenvolvimento para projetos Python permitindo o trabalho em diferentes projetos paralelamente, mesmo que os projetos tenham dependências conflitantes. Os ambientes virtuais nos auxiliam no gerenciamento de quais módulos e versões estão sendo usados em cada projeto e também facilita a instalação de módulos usando  o pip, instalador de módulos python multiplataforma, sem que o tenha privilégios de root.

Isto é possível pois quando trabalhamos com ambientes virtuais, cada projeto tem  seu própria espaço de diretórios para instalação de módulos python de maneira isolada do restante do seu sistema. Nos sistemas Linux, os módulos python são instalados no diretório global site-packages geralmente localizado em /usr/lib/python2.7/. Todos os pacotes python instalados com o pip são instalados neste diretório. 

Quando criamos um ambiente virtual, é criado uma estrutura de diretório e as variáveis de ambiente do sistema passam a apontar para esta estrutura permitindo que os códigos em desenvolvimento “enxerguem” somente os módulos instalados nesta nova estrutura de diretório. Por exemplo, quando criamos um ambiente virtual project_deep, é gerado os diretórios project_deep/bin, project_deep/include, project_deep/lib/python2.7, project_deep/local, project_deep/man, project_deep/share. Desse modo, você tem total controle de quais módulos estão sendo usados no seu projeto, e pode facilmente definir uma lista de dependência para os seus projetos, facilitando a reproducibilidade de seus projetos. Portanto as vantagens de se usar ambientes virtuais são:

1. Facilita o trabalho em projetos em paralelo com diferentes dependência de módulos;
2. Facilita a instalação de módulos Python para usuários que não tenham permissão de root;
3. Controle dos módulos, e suas versões, que estão sendo usado em seus projetos
4. Permite criar uma lista de dependência para cada projeto, facilitando a reproducibilidade de seus projetos.


Virtualenv e Virtualenvwrapper

Virtualenv é uma ferramenta que nos permite criar  e gerenciar ambientes virtuais.  Entretanto, existem um extensão desta ferramenta, o virtualenvwrapper, que facilitam muito o trabalho de criação e gerenciamento dos ambientes virtuais, além de organizar todo o ambiente em um só lugar. O virtualenvwrapper nos fornece uma série de comando úteis para gerenciar os ambientes virtuais, sendo que os principais comandos são:
mkvirtualenv project_deep – Cria um ambiente virtual com o nome project_deep;
mkproject  project_deep – Cria um ambiente virtual com o nome project_deep e cria um diretório para o desenvolvimento do projeto;
rmvirtualenv  project_deep – Remove o ambiente virtual project_deep;
workon  project_deep – Ativa o ambiente virtual
deactive – Desativa o ambiente virtual
Mais informações sobre este e outros comandos podem ser obtidas em http://virtualenvwrapper.readthedocs.org/en/latest/index.html


Ferramentas para Deep Learning

Atualmente, existem vários frameworks para desenvolvimento de pesquisa em Deep Learning. Estes scripts quatro ambientes que nos permitem trabalhar com as seguintes ferramentas: Theano, Caffe, e Simple-HP.  Segue abaixo uma breve descrição 
Theano:

