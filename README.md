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

  * You can mount into `/crafty_web/backups`. This is the default of where
    crafty will attempt to save backups.
  * If you mount elsewhere, you will need to reconfigure each individual 
    server to backup to the correct path.

## Tags

Crafty's base versioning isn't quite semver compliant and then there's always
nitpicky changes made at the container level so our tags are not semver
complaint but they try to give you both intuitive and specific enough tags.

- `edge`: This is the head of the master branch.
- `latest`: This is the latest tagged release.
- `3.1.Final`: The latest version of a particular verson of Crafty Controller.
  Crafty seems to follow Major, Minor, Discrminator (`Dev`, `Snapshot`, `Beta`,
  `Final`), and then an *optional* patch version at the end. For instance,
- `3.1.Final-1`: A static tag of a particular release of this docker image.
  the suffix increments for every build of a particular version of Crafty. The
  next build of `3.1.Final` will be `3.1.Final-2` and so on. The dash will
  always delimit between the crafty version and the docker build version.
