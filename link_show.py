import sys
import os

# command line arguments
argv = sys.argv
if len(argv) < 2 or argv[1] == '-h':
    print("""\
Hard link all files from source folder to destination folder

Usage: python {} src_dir dst_dir
Options:
-r  Apply to subsequent folders\
""".format(argv[0]))

def rlink(src,dst):
    for f in os.scandir(src):
        if f.is_file() and not f.is_symlink():
            dst_f = os.path.join(dst,f.name)
            os.link(f,dst_f)
            print(dst_f)

src = argv[1]
dst = argv[2]

try:
    os.mkdir(dst)
except FileExistsError:
    pass
except FileNotFoundError:
    print('Error: Parent directory not found!',dst)

rlink(src,dst)
