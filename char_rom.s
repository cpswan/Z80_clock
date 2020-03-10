#target ROM
#code ROM, 0, 512
      .org 0

      ; Char ROM is made up of 256 double words, each corresponding to
      ; one character able to be displayed.
      ;
      ; Data is stored in inverse format since the display driver
      ; sinks current to turn a segment on.
      ;
      ; For each of the words defined below, bits from MSb to LSb map
      ; to display segments as follows:
      ;
      ;                 MSB             LSB
      ;           +-------------+ +-------------+
      ;           |             | |             |
      ;           MSb                         LSb
      ;           +--                         --+
      ;           |                             |
      ; Segment:  a m k h u s t g f e d r p c n b
      ;
      ; Segment identifiers are based on the original design part:
      ;   Kingbright PSA08-11SYKWA
      ;
      ; While the words below are defined in big endian format, the
      ; words stored in ROM should be in little endian.

                        ; Dec   Hex    Bin        Oct   Char
      .dw 0xFFFF        ; 0     0x00   00000000     0   NUL
      .dw 0xFFFF        ; 1     0x01   00000001     1   SOH
      .dw 0xFFFF        ; 2     0x02   00000010     2   STX
      .dw 0xFFFF        ; 3     0x03   00000011     3   ETX
      .dw 0xFFFF        ; 4     0x04   00000100     4   EOT
      .dw 0xFFFF        ; 5     0x05   00000101     5   ENQ
      .dw 0xFFFF        ; 6     0x06   00000110     6   ACK
      .dw 0xFFFF        ; 7     0x07   00000111     7   BEL
      .dw 0xFFFF        ; 8     0x08   00001000    10   BS
      .dw 0xFFFF        ; 9     0x09   00001001    11   HT
      .dw 0xFFFF        ; 10    0x0A   00001010    12   LF
      .dw 0xFFFF        ; 11    0x0B   00001011    13   VT
      .dw 0xFFFF        ; 12    0x0C   00001100    14   FF
      .dw 0xFFFF        ; 13    0x0D   00001101    15   CR
      .dw 0xFFFF        ; 14    0x0E   00001110    16   SO
      .dw 0xFFFF        ; 15    0x0F   00001111    17   SI
      .dw 0xFFFF        ; 16    0x10   00010000    20   DLE
      .dw 0xFFFF        ; 17    0x11   00010001    21   DC1
      .dw 0xFFFF        ; 18    0x12   00010010    22   DC2
      .dw 0xFFFF        ; 19    0x13   00010011    23   DC3
      .dw 0xFFFF        ; 20    0x14   00010100    24   DC4
      .dw 0xFFFF        ; 21    0x15   00010101    25   NAK
      .dw 0xFFFF        ; 22    0x16   00010110    26   SYN
      .dw 0xFFFF        ; 23    0x17   00010111    27   ETB
      .dw 0xFFFF        ; 24    0x18   00011000    30   CAN
      .dw 0xFFFF        ; 25    0x19   00011001    31   EOM
      .dw 0xFFFF        ; 26    0x1A   00011010    32   SUB
      .dw 0xFFFF        ; 27    0x1B   00011011    33   ESC
      .dw 0xFFFF        ; 28    0x1C   00011100    34   FS
      .dw 0xFFFF        ; 29    0x1D   00011101    35   GS
      .dw 0xFFFF        ; 30    0x1E   00011110    36   RS
      .dw 0xFFFF        ; 31    0x1F   00011111    37   US
      .dw 0xFFFF        ; 32    0x20   00100000    40   SPC
      .dw 0xFFFF        ; 33    0x21   00100001    41   !
      .dw ~0x0220       ; 34    0x22   00100010    42   "
      .dw ~0xBA13       ; 35    0x23   00100011    43   #
      .dw ~0x3B97       ; 36    0x24   00100100    44   $
      .dw ~0x7B56       ; 37    0x25   00100101    45   %
      .dw ~0x470F       ; 38    0x26   00100110    46   &
      .dw ~0x0200       ; 39    0x27   00100111    47   '
      .dw ~0x8901       ; 40    0x28   00101000    50   (
      .dw ~0x00A6       ; 41    0x29   00101001    51   )
      .dw ~0x7658       ; 42    0x2A   00101010    52   *
      .dw ~0x3210       ; 43    0x2B   00101011    53   +
      .dw ~0x4000       ; 44    0x2C   00101100    54   ,
      .dw ~0x1010       ; 45    0x2D   00101101    55   -
      .dw ~0x0001       ; 46    0x2E   00101110    56   .
      .dw ~0x4040       ; 47    0x2F   00101111    57   /
      .dw ~0xC9E7       ; 48    0x30   00110000    60   0
      .dw ~0x0064       ; 49    0x31   00110001    61   1
      .dw ~0x91B3       ; 50    0x32   00110010    62   2
      .dw ~0x11B7       ; 51    0x33   00110011    63   3
      .dw ~0x1834       ; 52    0x34   00110100    64   4
      .dw ~0x1997       ; 53    0x35   00110101    65   5
      .dw ~0x9997       ; 54    0x36   00110110    66   6
      .dw ~0x01A4       ; 55    0x37   00110111    67   7
      .dw ~0x99B7       ; 56    0x38   00111000    70   8
      .dw ~0x19B7       ; 57    0x39   00111001    71   9
      .dw ~0x0101       ; 58    0x3A   00111010    72   :
      .dw ~0x4800       ; 59    0x3B   00111011    73   ;
      .dw ~0x0048       ; 60    0x3C   00111100    74   <
      .dw ~0x1013       ; 61    0x3D   00111101    75   =
      .dw ~0x4400       ; 62    0x3E   00111110    76   >
      .dw ~0x21C0       ; 63    0x3F   00111111    77   ?
      .dw ~0xF1A6       ; 64    0x40   01000000   100   @
      .dw ~0x99B4       ; 65    0x41   01000001   101   A
      .dw ~0x23B7       ; 66    0x42   01000010   102   B
      .dw ~0x8983       ; 67    0x43   01000011   103   C
      .dw ~0x23A7       ; 68    0x44   01000100   104   D
      .dw ~0x9993       ; 69    0x45   01000101   105   E
      .dw ~0x9990       ; 70    0x46   01000110   106   F
      .dw ~0x8997       ; 71    0x47   01000111   107   G
      .dw ~0x9834       ; 72    0x48   01001000   110   H
      .dw ~0x2383       ; 73    0x49   01001001   111   I
      .dw ~0x0027       ; 74    0x4A   01001010   112   J
      .dw ~0x9848       ; 75    0x4B   01001011   113   K
      .dw ~0x8803       ; 76    0x4C   01001100   114   L
      .dw ~0x8C64       ; 77    0x4D   01001101   115   M
      .dw ~0x8C2C       ; 78    0x4E   01001110   116   N
      .dw ~0x89A7       ; 79    0x4F   01001111   117   O
      .dw ~0x99B0       ; 80    0x50   01010000   120   P
      .dw ~0x89AF       ; 81    0x51   01010001   121   Q
      .dw ~0x99B8       ; 82    0x52   01010010   122   R
      .dw ~0x1997       ; 83    0x53   01010011   123   S
      .dw ~0x2380       ; 84    0x54   01010100   124   T
      .dw ~0x8827       ; 85    0x55   01010101   125   U
      .dw ~0xC840       ; 86    0x56   01010110   126   V
      .dw ~0xC82C       ; 87    0x57   01010111   127   W
      .dw ~0x4448       ; 88    0x58   01011000   130   X
      .dw ~0x2440       ; 89    0x59   01011001   131   Y
      .dw ~0x41C3       ; 90    0x5A   01011010   132   Z
      .dw ~0x2282       ; 91    0x5B   01011011   133   [
      .dw ~0x0408       ; 92    0x5C   01011100   134   \
      .dw ~0x2301       ; 93    0x5D   01011101   135   ]
      .dw ~0x0060       ; 94    0x5E   01011110   136   ^
      .dw ~0x0003       ; 95    0x5F   01011111   137   _
      .dw ~0x0400       ; 96    0x60   01100000   140   `
      .dw ~0x99B4       ; 97    0x61   01100001   141   a
      .dw ~0x23B7       ; 98    0x62   01100010   142   b
      .dw ~0x8983       ; 99    0x63   01100011   143   c
      .dw ~0x23A7       ; 100   0x64   01100100   144   d
      .dw ~0x9993       ; 101   0x65   01100101   145   e
      .dw ~0x9990       ; 102   0x66   01100110   146   f
      .dw ~0x8997       ; 103   0x67   01100111   147   g
      .dw ~0x9834       ; 104   0x68   01101000   150   h
      .dw ~0x2383       ; 105   0x69   01101001   151   i
      .dw ~0x0027       ; 106   0x6A   01101010   152   j
      .dw ~0x9848       ; 107   0x6B   01101011   153   k
      .dw ~0x8803       ; 108   0x6C   01101100   154   l
      .dw ~0x8C64       ; 109   0x6D   01101101   155   m
      .dw ~0x8C2C       ; 110   0x6E   01101110   156   n
      .dw ~0x89A7       ; 111   0x6F   01101111   157   o
      .dw ~0x99B0       ; 112   0x70   01110000   160   p
      .dw ~0x89AF       ; 113   0x71   01110001   161   q
      .dw ~0x99B8       ; 114   0x72   01110010   162   r
      .dw ~0x1997       ; 115   0x73   01110011   163   s
      .dw ~0x2380       ; 116   0x74   01110100   164   t
      .dw ~0x8827       ; 117   0x75   01110101   165   u
      .dw ~0xC840       ; 118   0x76   01110110   166   v
      .dw ~0xC82C       ; 119   0x77   01110111   167   w
      .dw ~0x4448       ; 120   0x78   01111000   170   x
      .dw ~0x2440       ; 121   0x79   01111001   171   y
      .dw ~0x41C3       ; 122   0x7A   01111010   172   z
      .dw ~0x3282       ; 123   0x7B   01111011   173   {
      .dw ~0x2200       ; 124   0x7C   01111100   174   |
      .dw ~0x2311       ; 125   0x7D   01111101   175   }
      .dw ~0x0C40       ; 126   0x7E   01111110   176   ~
      .dw 0xFFFF        ; 127   0x7F   01111111   177   DEL
      .dw 0xFFFF        ; 128   0x80   10000000   200
      .dw 0xFFFF        ; 129   0x81   10000001   201
      .dw 0xFFFF        ; 130   0x82   10000010   202
      .dw 0xFFFF        ; 131   0x83   10000011   203
      .dw 0xFFFF        ; 132   0x84   10000100   204
      .dw 0xFFFF        ; 133   0x85   10000101   205
      .dw 0xFFFF        ; 134   0x86   10000110   206
      .dw 0xFFFF        ; 135   0x87   10000111   207
      .dw 0xFFFF        ; 136   0x88   10001000   210
      .dw 0xFFFF        ; 137   0x89   10001001   211
      .dw 0xFFFF        ; 138   0x8A   10001010   212
      .dw 0xFFFF        ; 139   0x8B   10001011   213
      .dw 0xFFFF        ; 140   0x8C   10001100   214
      .dw 0xFFFF        ; 141   0x8D   10001101   215
      .dw 0xFFFF        ; 142   0x8E   10001110   216
      .dw 0xFFFF        ; 143   0x8F   10001111   217
      .dw 0xFFFF        ; 144   0x90   10010000   220
      .dw 0xFFFF        ; 145   0x91   10010001   221
      .dw 0xFFFF        ; 146   0x92   10010010   222
      .dw 0xFFFF        ; 147   0x93   10010011   223
      .dw 0xFFFF        ; 148   0x94   10010100   224
      .dw 0xFFFF        ; 149   0x95   10010101   225
      .dw 0xFFFF        ; 150   0x96   10010110   226
      .dw 0xFFFF        ; 151   0x97   10010111   227
      .dw 0xFFFF        ; 152   0x98   10011000   230
      .dw 0xFFFF        ; 153   0x99   10011001   231
      .dw 0xFFFF        ; 154   0x9A   10011010   232
      .dw 0xFFFF        ; 155   0x9B   10011011   233
      .dw 0xFFFF        ; 156   0x9C   10011100   234
      .dw 0xFFFF        ; 157   0x9D   10011101   235
      .dw 0xFFFF        ; 158   0x9E   10011110   236
      .dw 0xFFFF        ; 159   0x9F   10011111   237
      .dw 0xFFFF        ; 160   0xA0   10100000   240
      .dw 0xFFFF        ; 161   0xA1   10100001   241
      .dw 0xFFFF        ; 162   0xA2   10100010   242
      .dw 0xFFFF        ; 163   0xA3   10100011   243
      .dw 0xFFFF        ; 164   0xA4   10100100   244
      .dw 0xFFFF        ; 165   0xA5   10100101   245
      .dw 0xFFFF        ; 166   0xA6   10100110   246
      .dw 0xFFFF        ; 167   0xA7   10100111   247
      .dw 0xFFFF        ; 168   0xA8   10101000   250
      .dw 0xFFFF        ; 169   0xA9   10101001   251
      .dw 0xFFFF        ; 170   0xAA   10101010   252
      .dw 0xFFFF        ; 171   0xAB   10101011   253
      .dw 0xFFFF        ; 172   0xAC   10101100   254
      .dw 0xFFFF        ; 173   0xAD   10101101   255
      .dw 0xFFFF        ; 174   0xAE   10101110   256
      .dw 0xFFFF        ; 175   0xAF   10101111   257
      .dw 0xFFFF        ; 176   0xB0   10110000   260
      .dw 0xFFFF        ; 177   0xB1   10110001   261
      .dw 0xFFFF        ; 178   0xB2   10110010   262
      .dw 0xFFFF        ; 179   0xB3   10110011   263
      .dw 0xFFFF        ; 180   0xB4   10110100   264
      .dw 0xFFFF        ; 181   0xB5   10110101   265
      .dw 0xFFFF        ; 182   0xB6   10110110   266
      .dw 0xFFFF        ; 183   0xB7   10110111   267
      .dw 0xFFFF        ; 184   0xB8   10111000   270
      .dw 0xFFFF        ; 185   0xB9   10111001   271
      .dw 0xFFFF        ; 186   0xBA   10111010   272
      .dw 0xFFFF        ; 187   0xBB   10111011   273
      .dw 0xFFFF        ; 188   0xBC   10111100   274
      .dw 0xFFFF        ; 189   0xBD   10111101   275
      .dw 0xFFFF        ; 190   0xBE   10111110   276
      .dw 0xFFFF        ; 191   0xBF   10111111   277
      .dw 0xFFFF        ; 192   0xC0   11000000   300
      .dw 0xFFFF        ; 193   0xC1   11000001   301
      .dw 0xFFFF        ; 194   0xC2   11000010   302
      .dw 0xFFFF        ; 195   0xC3   11000011   303
      .dw 0xFFFF        ; 196   0xC4   11000100   304
      .dw 0xFFFF        ; 197   0xC5   11000101   305
      .dw 0xFFFF        ; 198   0xC6   11000110   306
      .dw 0xFFFF        ; 199   0xC7   11000111   307
      .dw 0xFFFF        ; 200   0xC8   11001000   310
      .dw 0xFFFF        ; 201   0xC9   11001001   311
      .dw 0xFFFF        ; 202   0xCA   11001010   312
      .dw 0xFFFF        ; 203   0xCB   11001011   313
      .dw 0xFFFF        ; 204   0xCC   11001100   314
      .dw 0xFFFF        ; 205   0xCD   11001101   315
      .dw 0xFFFF        ; 206   0xCE   11001110   316
      .dw 0xFFFF        ; 207   0xCF   11001111   317
      .dw 0xFFFF        ; 208   0xD0   11010000   320
      .dw 0xFFFF        ; 209   0xD1   11010001   321
      .dw 0xFFFF        ; 210   0xD2   11010010   322
      .dw 0xFFFF        ; 211   0xD3   11010011   323
      .dw 0xFFFF        ; 212   0xD4   11010100   324
      .dw 0xFFFF        ; 213   0xD5   11010101   325
      .dw 0xFFFF        ; 214   0xD6   11010110   326
      .dw 0xFFFF        ; 215   0xD7   11010111   327
      .dw 0xFFFF        ; 216   0xD8   11011000   330
      .dw 0xFFFF        ; 217   0xD9   11011001   331
      .dw 0xFFFF        ; 218   0xDA   11011010   332
      .dw 0xFFFF        ; 219   0xDB   11011011   333
      .dw 0xFFFF        ; 220   0xDC   11011100   334
      .dw 0xFFFF        ; 221   0xDD   11011101   335
      .dw 0xFFFF        ; 222   0xDE   11011110   336
      .dw 0xFFFF        ; 223   0xDF   11011111   337
      .dw 0xFFFF        ; 224   0xE0   11100000   340
      .dw 0xFFFF        ; 225   0xE1   11100001   341
      .dw 0xFFFF        ; 226   0xE2   11100010   342
      .dw 0xFFFF        ; 227   0xE3   11100011   343
      .dw 0xFFFF        ; 228   0xE4   11100100   344
      .dw 0xFFFF        ; 229   0xE5   11100101   345
      .dw 0xFFFF        ; 230   0xE6   11100110   346
      .dw 0xFFFF        ; 231   0xE7   11100111   347
      .dw 0xFFFF        ; 232   0xE8   11101000   350
      .dw 0xFFFF        ; 233   0xE9   11101001   351
      .dw 0xFFFF        ; 234   0xEA   11101010   352
      .dw 0xFFFF        ; 235   0xEB   11101011   353
      .dw 0xFFFF        ; 236   0xEC   11101100   354
      .dw 0xFFFF        ; 237   0xED   11101101   355
      .dw 0xFFFF        ; 238   0xEE   11101110   356
      .dw 0xFFFF        ; 239   0xEF   11101111   357
      .dw 0xFFFF        ; 240   0xF0   11110000   360
      .dw 0xFFFF        ; 241   0xF1   11110001   361
      .dw 0xFFFF        ; 242   0xF2   11110010   362
      .dw 0xFFFF        ; 243   0xF3   11110011   363
      .dw 0xFFFF        ; 244   0xF4   11110100   364
      .dw 0xFFFF        ; 245   0xF5   11110101   365
      .dw 0xFFFF        ; 246   0xF6   11110110   366
      .dw 0xFFFF        ; 247   0xF7   11110111   367
      .dw 0xFFFF        ; 248   0xF8   11111000   370
      .dw 0xFFFF        ; 249   0xF9   11111001   371
      .dw 0xFFFF        ; 250   0xFA   11111010   372
      .dw 0xFFFF        ; 251   0xFB   11111011   373
      .dw 0xFFFF        ; 252   0xFC   11111100   374
      .dw 0xFFFF        ; 253   0xFD   11111101   375
      .dw 0xFFFF        ; 254   0xFE   11111110   376
      .dw 0xFFFF        ; 255   0xFF   11111111   377

      .end
