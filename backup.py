import argparse
import tarfile
import os.path
import glob
import yaml


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('distribution')
    args = parser.parse_args()

    with open('vars/{0}.yml'.format(args.distribution), 'rb') as fp:
        config = yaml.safe_load(fp)

    with tarfile.open('backup-{0}.tar.gz'.format(args.distribution), 'w:gz') as tar:
        for path in config['backup']:
            for file in glob.iglob(os.path.expanduser(path)):
                print(file)
                tar.add(file, arcname=os.path.basename(file))


if __name__ == '__main__':
    main()
