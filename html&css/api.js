const apiKey = 'coinranking747a8bfb38c50d6169b91d41e64efcb30efb17bbaf779046';
const coinUuid = 'Qwsogvtv82FCd';


async function fetchCoinInfo() {
    try {
        const response = await fetch(`https://api.coinranking.com/v2/coin/${coinUuid}`, {
            headers: {
                'x-access-token': apiKey
            }
        });
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const data = await response.json();
        const coin = data.data.coin;
        const coinInfoHTML = `
            <p>Nume: ${coin.name}</p>
            <p>Simbol: ${coin.symbol}</p>
            <p>Descriere: ${coin.description}</p>
            <p>Preț: ${coin.price}</p>
            <p>24h Volum: ${coin['24hVolume']}</p>
        `;

        document.getElementById('coinInfo').innerHTML = coinInfoHTML;
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}


fetchCoinInfo();