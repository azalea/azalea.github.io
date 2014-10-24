---
layout: post
title: python读取文件末尾的一行或多行 转载
tags:
- programming
- python
- zz
- 文件

---
Ref: [http://www.zeuux.org/pipermail/zeuux-python/2005-December/020677.html](http://www.zeuux.org/pipermail/zeuux-python/2005-December/020677.html)


    # tail.py
    # Usage: python tail.py FILENAME LINES
    # similar to linux command: tail -n LINES FILENAME
    def last_lines(filename, lines = 1):
        """
        Print the last several line(s) of a text file.
        Argument filename is the name of the file to print.
        Argument lines is the number of lines to print from last.
        """
        lines = int(lines)
        block_size = 1024
        block = ''
        nl_count = 0
        start = 0
        fsock = file(filename, 'rU')
        try:
            # seek to end
            fsock.seek(0, 2)
            # get seek position
            curpos = fsock.tell()
            while(curpos > 0): #while not EOF
                # seek ahead block_size+the length of last read block
                curpos -= (block_size + len(block));
                if curpos < 0: 
                    curpos = 0
                fsock.seek(curpos)
                # read to end
                block = fsock.read()
                nl_count = block.count('\n')
                # if read enough(more)
                if nl_count >= lines:
                    break
            # get the exact start position
            for n in range(nl_count - lines + 1):
                start = block.find('\n', start) + 1
        finally:
            fsock.close()
        print block[start:]

    if __name__ == '__main__':
        import sys
        last_lines(sys.argv[1], sys.argv[2])
