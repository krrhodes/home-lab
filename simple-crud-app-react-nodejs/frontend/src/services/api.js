import axios from 'axios';

import config from './config';

const api = axios.create({
	baseURL: config.api_url,
    headers: { 
        "Content-Type": "application/x-www-form-urlencoded"
    }
});

export default api;
