const express = require('express');
const app = express();

//settings
app.set('port', process.env.PORT || 3000);
//En caso tal que el sistema operativo me de un puerto este lo agarrará

//routes
app.use(require('./routes/app'));

app.listen(app.get('port'), () => {
    console.log("Server on port", app.get('port'));
});