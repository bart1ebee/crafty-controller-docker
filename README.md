# Crafty Controller Web Docker Image

## Usage

You will need two mounts:

- `/crafty_db` will contain the sqlite3 database. You will want to persist
  this however you wish.
- `/mincraft_servers` can be where you keep your minecraft servers. The
  path is not important, you just need to be consistent and obviously 
  back up this volume regularly.
