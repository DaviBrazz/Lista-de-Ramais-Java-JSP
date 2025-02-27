const busca = document.getElementById('input-busca');
const tabela = document.getElementById('tabelaDeRegistros');

busca.addEventListener('keyup', () => {
    let expressao = busca.value.toLowerCase();

    if (expressao.length === 1) {
        return;
    }

    let linhas = tabela.getElementsByTagName('tr');
 console.log(linhas);
    for (let posicao in linhas) {
        if (true === isNaN(posicao)) {
            continue;
        }

        let conteudoDaLinha = linhas[posicao].innerHTML.toLowerCase();

        if (true === conteudoDaLinha.includes(expressao)) {
            linhas[posicao].style.display = '';
			
        } else {
            linhas[posicao].style.display = 'none';
        }
    }
});

