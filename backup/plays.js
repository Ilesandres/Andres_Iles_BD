const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

// Game state
let gameState = {
    board: Array(9).fill(null),
    currentPlayer: 'X',
    isGameOver: false
};

// Handle WebSocket connections
wss.on('connection', (ws) => {
    console.log('Player connected');

    // Send initial game state
    ws.send(JSON.stringify({
        type: 'gameState',
        data: gameState
    }));

    // Handle messages from client
    ws.on('message', (message) => {
        const data = JSON.parse(message);

        if (data.type === 'move') {
            // Validate and process move
            const position = data.position;
            
            if (isValidMove(position)) {
                gameState.board[position] = gameState.currentPlayer;
                
                // Check for win or draw
                if (checkWin()) {
                    gameState.isGameOver = true;
                    ws.send(JSON.stringify({
                        type: 'gameOver',
                        winner: gameState.currentPlayer
                    }));
                } else if (isDraw()) {
                    gameState.isGameOver = true;
                    ws.send(JSON.stringify({
                        type: 'gameOver',
                        winner: 'draw'
                    }));
                }

                // Send updated game state
                ws.send(JSON.stringify({
                    type: 'gameState',
                    data: gameState
                }));
            }
        }

        if (data.type === 'reset') {
            gameState = {
                board: Array(9).fill(null),
                currentPlayer: 'X',
                isGameOver: false
            };
            ws.send(JSON.stringify({
                type: 'gameState',
                data: gameState
            }));
        }
    });
});

// Helper functions
function isValidMove(position) {
    return position >= 0 && 
           position < 9 && 
           gameState.board[position] === null && 
           !gameState.isGameOver;
}

function checkWin() {
    const winPatterns = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    return winPatterns.some(pattern => {
        const [a, b, c] = pattern;
        return gameState.board[a] &&
               gameState.board[a] === gameState.board[b] &&
               gameState.board[a] === gameState.board[c];
    });
}

function isDraw() {
    return gameState.board.every(cell => cell !== null);
}
