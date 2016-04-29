import * as express from 'express';
import * as connectLivereload from 'connect-livereload';
import { LIVE_RELOAD_PORT, HOT_LOADER_PORT, APP_SRC, APP_BASE, PROJECT_ROOT} from '../config';
import * as tinylrFn from 'tiny-lr';
import {join} from 'path';

let tinylr = tinylrFn();
let listen = () => {
    return tinylr.listen(LIVE_RELOAD_PORT);
};

let changed = files => {
  if (!(files instanceof Array)) {
    files = [files];
  }
    tinylr.changed({
      body: { files }
    });
};

let tinylrMiddleware = connectLivereload({ port: LIVE_RELOAD_PORT });
let middleware = [
  APP_BASE,
  (req, res, next) => {
      tinylrMiddleware(req, res, next);
  },
  express.static(process.cwd())
];

export { listen, changed, middleware };
