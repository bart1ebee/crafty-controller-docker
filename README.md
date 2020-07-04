# Crafty Controller Web Docker Image

Use to run https://craftycontrol.com/ in docker.  Pretty much the same
as the provi

## Usage

You will need two mounts:

- `/crafty_db` will contain the sqlite3 database. You will want to persist
  this however you wish.
- `/mincraft_servers` can be where you keep your minecraft servers. The
  path is not important, you just need to be consistent and obviously 
  snapshot up this volume regularly.
- A backups mount.  You can handle this one of two ways:

  * You can mount into `/web_crafty/backups`. This is the default of where
    crafty will attempt to save backups.
  * If you mount elsewhere, you will need to reconfigure each individual 
    server to backup to the correct path.
