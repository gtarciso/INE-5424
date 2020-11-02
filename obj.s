
app/hello/hello:     file format elf32-littleriscv


Disassembly of section .init:

80000000 <_vector_table>:
80000000:	a801                	j	80000010 <_reset>
80000002:	0001                	nop
80000004:	00000013          	nop
80000008:	00000013          	nop
8000000c:	00000013          	nop

80000010 <_reset>:
80000010:	18001073          	csrw	satp,zero
80000014:	f14022f3          	csrr	t0,mhartid
80000018:	04029c63          	bnez	t0,80000070 <secondary>
8000001c:	08000117          	auipc	sp,0x8000
80000020:	fe310113          	addi	sp,sp,-29 # 87ffffff <__boot_stack__>
80000024:	4285                	li	t0,1
80000026:	02be                	slli	t0,t0,0xf
80000028:	f1402573          	csrr	a0,mhartid
8000002c:	02a282b3          	mul	t0,t0,a0
80000030:	40510133          	sub	sp,sp,t0
80000034:	6289                	lui	t0,0x2
80000036:	88828293          	addi	t0,t0,-1912 # 1888 <_vector_table-0x7fffe778>
8000003a:	30029073          	csrw	mstatus,t0
8000003e:	18001073          	csrw	satp,zero
80000042:	00000317          	auipc	t1,0x0
80000046:	09e30313          	addi	t1,t1,158 # 800000e0 <_start>
8000004a:	34131073          	csrw	mepc,t1
8000004e:	00003397          	auipc	t2,0x3
80000052:	a9a38393          	addi	t2,t2,-1382 # 80002ae8 <_ZN4EPOS1S2IC5entryEv>
80000056:	30539073          	csrw	mtvec,t2
8000005a:	6e05                	lui	t3,0x1
8000005c:	888e0e13          	addi	t3,t3,-1912 # 888 <_vector_table-0x7ffff778>
80000060:	304e1073          	csrw	mie,t3
80000064:	00000097          	auipc	ra,0x0
80000068:	03008093          	addi	ra,ra,48 # 80000094 <wait>
8000006c:	30200073          	mret

80000070 <secondary>:
80000070:	4285                	li	t0,1
80000072:	00028303          	lb	t1,0(t0)
80000076:	0305                	addi	t1,t1,1
80000078:	00628023          	sb	t1,0(t0)
8000007c:	42a1                	li	t0,8
8000007e:	30029073          	csrw	mstatus,t0
80000082:	4321                	li	t1,8
80000084:	30431073          	csrw	mie,t1
80000088:	00000397          	auipc	t2,0x0
8000008c:	05838393          	addi	t2,t2,88 # 800000e0 <_start>
80000090:	30539073          	csrw	mtvec,t2

80000094 <wait>:
80000094:	10500073          	wfi
80000098:	0480006f          	j	800000e0 <_start>
8000009c:	00000013          	nop

800000a0 <_init>:
800000a0:	800057b7          	lui	a5,0x80005
800000a4:	fe07a783          	lw	a5,-32(a5) # 80004fe0 <__boot_stack__+0xf8004fe1>
800000a8:	577d                	li	a4,-1
800000aa:	02e78863          	beq	a5,a4,800000da <_init+0x3a>
800000ae:	1141                	addi	sp,sp,-16
800000b0:	c606                	sw	ra,12(sp)
800000b2:	c422                	sw	s0,8(sp)
800000b4:	c226                	sw	s1,4(sp)
800000b6:	80005437          	lui	s0,0x80005
800000ba:	fe040413          	addi	s0,s0,-32 # 80004fe0 <__boot_stack__+0xf8004fe1>
800000be:	54fd                	li	s1,-1
800000c0:	a031                	j	800000cc <_init+0x2c>
800000c2:	9782                	jalr	a5
800000c4:	1471                	addi	s0,s0,-4
800000c6:	401c                	lw	a5,0(s0)
800000c8:	00978463          	beq	a5,s1,800000d0 <_init+0x30>
800000cc:	f87d                	bnez	s0,800000c2 <_init+0x22>
800000ce:	bfdd                	j	800000c4 <_init+0x24>
800000d0:	40b2                	lw	ra,12(sp)
800000d2:	4422                	lw	s0,8(sp)
800000d4:	4492                	lw	s1,4(sp)
800000d6:	0141                	addi	sp,sp,16
800000d8:	8082                	ret
800000da:	8082                	ret

Disassembly of section .text:

800000e0 <_start>:
800000e0:	00005517          	auipc	a0,0x5
800000e4:	f3050513          	addi	a0,a0,-208 # 80005010 <initialized.0>
800000e8:	00005597          	auipc	a1,0x5
800000ec:	04858593          	addi	a1,a1,72 # 80005130 <_end>
800000f0:	00b57863          	bgeu	a0,a1,80000100 <_start+0x20>
800000f4:	00052023          	sw	zero,0(a0)
800000f8:	00450513          	addi	a0,a0,4
800000fc:	feb56ce3          	bltu	a0,a1,800000f4 <_start+0x14>
80000100:	00000097          	auipc	ra,0x0
80000104:	fa0080e7          	jalr	-96(ra) # 800000a0 <_init>
80000108:	00000013          	nop
8000010c:	00000013          	nop

80000110 <__epos_app_entry>:
80000110:	00000097          	auipc	ra,0x0
80000114:	126080e7          	jalr	294(ra) # 80000236 <main>
80000118:	00012503          	lw	a0,0(sp)
8000011c:	00003097          	auipc	ra,0x3
80000120:	600080e7          	jalr	1536(ra) # 8000371c <_fini>
80000124:	00001097          	auipc	ra,0x1
80000128:	9a0080e7          	jalr	-1632(ra) # 80000ac4 <_exit>
8000012c:	0000                	unimp
	...

80000130 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE>:
80000130:	1141                	addi	sp,sp,-16
80000132:	c606                	sw	ra,12(sp)
80000134:	80003537          	lui	a0,0x80003
80000138:	75c50513          	addi	a0,a0,1884 # 8000375c <__boot_stack__+0xf800375d>
8000013c:	00001097          	auipc	ra,0x1
80000140:	9aa080e7          	jalr	-1622(ra) # 80000ae6 <_print>
80000144:	80003537          	lui	a0,0x80003
80000148:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
8000014c:	00001097          	auipc	ra,0x1
80000150:	99a080e7          	jalr	-1638(ra) # 80000ae6 <_print>
80000154:	800057b7          	lui	a5,0x80005
80000158:	4729                	li	a4,10
8000015a:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
8000015e:	800057b7          	lui	a5,0x80005
80000162:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80000166:	47dc                	lw	a5,12(a5)
80000168:	439c                	lw	a5,0(a5)
8000016a:	43c8                	lw	a0,4(a5)
8000016c:	00003097          	auipc	ra,0x3
80000170:	ba6080e7          	jalr	-1114(ra) # 80002d12 <_ZNVK4EPOS1S3CPU7Context4loadEv>
80000174:	40b2                	lw	ra,12(sp)
80000176:	0141                	addi	sp,sp,16
80000178:	8082                	ret

8000017a <_Z9add_timeri>:
8000017a:	711d                	addi	sp,sp,-96
8000017c:	ce86                	sw	ra,92(sp)
8000017e:	cca2                	sw	s0,88(sp)
80000180:	caa6                	sw	s1,84(sp)
80000182:	c8ca                	sw	s2,80(sp)
80000184:	c6ce                	sw	s3,76(sp)
80000186:	842a                	mv	s0,a0
80000188:	80003537          	lui	a0,0x80003
8000018c:	77050513          	addi	a0,a0,1904 # 80003770 <__boot_stack__+0xf8003771>
80000190:	00001097          	auipc	ra,0x1
80000194:	956080e7          	jalr	-1706(ra) # 80000ae6 <_print>
80000198:	02004937          	lui	s2,0x2004
8000019c:	00092583          	lw	a1,0(s2) # 2004000 <_vector_table-0x7dffc000>
800001a0:	4681                	li	a3,0
800001a2:	860a                	mv	a2,sp
800001a4:	800054b7          	lui	s1,0x80005
800001a8:	01448513          	addi	a0,s1,20 # 80005014 <__boot_stack__+0xf8005015>
800001ac:	00001097          	auipc	ra,0x1
800001b0:	a02080e7          	jalr	-1534(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800001b4:	009c                	addi	a5,sp,64
800001b6:	953e                	add	a0,a0,a5
800001b8:	fc050023          	sb	zero,-64(a0)
800001bc:	850a                	mv	a0,sp
800001be:	00001097          	auipc	ra,0x1
800001c2:	928080e7          	jalr	-1752(ra) # 80000ae6 <_print>
800001c6:	80003537          	lui	a0,0x80003
800001ca:	77c50513          	addi	a0,a0,1916 # 8000377c <__boot_stack__+0xf800377d>
800001ce:	00001097          	auipc	ra,0x1
800001d2:	918080e7          	jalr	-1768(ra) # 80000ae6 <_print>
800001d6:	0200c9b7          	lui	s3,0x200c
800001da:	ff89a583          	lw	a1,-8(s3) # 200bff8 <_vector_table-0x7dff4008>
800001de:	4681                	li	a3,0
800001e0:	860a                	mv	a2,sp
800001e2:	01448513          	addi	a0,s1,20
800001e6:	00001097          	auipc	ra,0x1
800001ea:	9c8080e7          	jalr	-1592(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800001ee:	009c                	addi	a5,sp,64
800001f0:	953e                	add	a0,a0,a5
800001f2:	fc050023          	sb	zero,-64(a0)
800001f6:	850a                	mv	a0,sp
800001f8:	00001097          	auipc	ra,0x1
800001fc:	8ee080e7          	jalr	-1810(ra) # 80000ae6 <_print>
80000200:	80003537          	lui	a0,0x80003
80000204:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80000208:	00001097          	auipc	ra,0x1
8000020c:	8de080e7          	jalr	-1826(ra) # 80000ae6 <_print>
80000210:	47a9                	li	a5,10
80000212:	00f4aa23          	sw	a5,20(s1)
80000216:	ff89a783          	lw	a5,-8(s3)
8000021a:	06400513          	li	a0,100
8000021e:	02a40433          	mul	s0,s0,a0
80000222:	943e                	add	s0,s0,a5
80000224:	00892023          	sw	s0,0(s2)
80000228:	40f6                	lw	ra,92(sp)
8000022a:	4466                	lw	s0,88(sp)
8000022c:	44d6                	lw	s1,84(sp)
8000022e:	4946                	lw	s2,80(sp)
80000230:	49b6                	lw	s3,76(sp)
80000232:	6125                	addi	sp,sp,96
80000234:	8082                	ret

80000236 <main>:
80000236:	1141                	addi	sp,sp,-16
80000238:	c606                	sw	ra,12(sp)
8000023a:	80003537          	lui	a0,0x80003
8000023e:	78850513          	addi	a0,a0,1928 # 80003788 <__boot_stack__+0xf8003789>
80000242:	00001097          	auipc	ra,0x1
80000246:	8a4080e7          	jalr	-1884(ra) # 80000ae6 <_print>
8000024a:	80003537          	lui	a0,0x80003
8000024e:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80000252:	00001097          	auipc	ra,0x1
80000256:	894080e7          	jalr	-1900(ra) # 80000ae6 <_print>
8000025a:	800057b7          	lui	a5,0x80005
8000025e:	4729                	li	a4,10
80000260:	00e7aa23          	sw	a4,20(a5) # 80005014 <__boot_stack__+0xf8005015>
80000264:	4505                	li	a0,1
80000266:	00000097          	auipc	ra,0x0
8000026a:	f14080e7          	jalr	-236(ra) # 8000017a <_Z9add_timeri>
8000026e:	67e1                	lui	a5,0x18
80000270:	6a078793          	addi	a5,a5,1696 # 186a0 <_vector_table-0x7ffe7960>
80000274:	17fd                	addi	a5,a5,-1
80000276:	fffd                	bnez	a5,80000274 <main+0x3e>
80000278:	80003537          	lui	a0,0x80003
8000027c:	79850513          	addi	a0,a0,1944 # 80003798 <__boot_stack__+0xf8003799>
80000280:	00001097          	auipc	ra,0x1
80000284:	866080e7          	jalr	-1946(ra) # 80000ae6 <_print>
80000288:	80003537          	lui	a0,0x80003
8000028c:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80000290:	00001097          	auipc	ra,0x1
80000294:	856080e7          	jalr	-1962(ra) # 80000ae6 <_print>
80000298:	800057b7          	lui	a5,0x80005
8000029c:	4729                	li	a4,10
8000029e:	00e7aa23          	sw	a4,20(a5) # 80005014 <__boot_stack__+0xf8005015>
800002a2:	4501                	li	a0,0
800002a4:	40b2                	lw	ra,12(sp)
800002a6:	0141                	addi	sp,sp,16
800002a8:	8082                	ret

800002aa <_GLOBAL__sub_I_cout>:
800002aa:	800057b7          	lui	a5,0x80005
800002ae:	01478793          	addi	a5,a5,20 # 80005014 <__boot_stack__+0xf8005015>
800002b2:	4729                	li	a4,10
800002b4:	c398                	sw	a4,0(a5)
800002b6:	00078223          	sb	zero,4(a5)
800002ba:	8082                	ret

800002bc <_GLOBAL__sub_I__ZN4EPOS1S11Application8_preheapE>:
800002bc:	800057b7          	lui	a5,0x80005
800002c0:	02478793          	addi	a5,a5,36 # 80005024 <__boot_stack__+0xf8005025>
800002c4:	4729                	li	a4,10
800002c6:	c398                	sw	a4,0(a5)
800002c8:	00078223          	sb	zero,4(a5)
800002cc:	800057b7          	lui	a5,0x80005
800002d0:	01c78793          	addi	a5,a5,28 # 8000501c <__boot_stack__+0xf800501d>
800002d4:	c398                	sw	a4,0(a5)
800002d6:	00078223          	sb	zero,4(a5)
800002da:	8082                	ret

800002dc <_ZN4EPOS1S16Init_ApplicationC1Ev>:
800002dc:	7159                	addi	sp,sp,-112
800002de:	d686                	sw	ra,108(sp)
800002e0:	d4a2                	sw	s0,104(sp)
800002e2:	d2a6                	sw	s1,100(sp)
800002e4:	d0ca                	sw	s2,96(sp)
800002e6:	cece                	sw	s3,92(sp)
800002e8:	ccd2                	sw	s4,88(sp)
800002ea:	cad6                	sw	s5,84(sp)
800002ec:	c8da                	sw	s6,80(sp)
800002ee:	c6de                	sw	s7,76(sp)
800002f0:	c4e2                	sw	s8,72(sp)
800002f2:	c2e6                	sw	s9,68(sp)
800002f4:	c0ea                	sw	s10,64(sp)
800002f6:	80003537          	lui	a0,0x80003
800002fa:	7a850513          	addi	a0,a0,1960 # 800037a8 <__boot_stack__+0xf80037a9>
800002fe:	00000097          	auipc	ra,0x0
80000302:	7e8080e7          	jalr	2024(ra) # 80000ae6 <_print>
80000306:	80003537          	lui	a0,0x80003
8000030a:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
8000030e:	00000097          	auipc	ra,0x0
80000312:	7d8080e7          	jalr	2008(ra) # 80000ae6 <_print>
80000316:	800057b7          	lui	a5,0x80005
8000031a:	4729                	li	a4,10
8000031c:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
80000320:	800057b7          	lui	a5,0x80005
80000324:	1247a783          	lw	a5,292(a5) # 80005124 <__boot_stack__+0xf8005125>
80000328:	2e078563          	beqz	a5,80000612 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x336>
8000032c:	0047ac03          	lw	s8,4(a5)
80000330:	2e0c0163          	beqz	s8,80000612 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x336>
80000334:	80005437          	lui	s0,0x80005
80000338:	12040413          	addi	s0,s0,288 # 80005120 <__boot_stack__+0xf8005121>
8000033c:	80005b37          	lui	s6,0x80005
80000340:	80003ab7          	lui	s5,0x80003
80000344:	800054b7          	lui	s1,0x80005
80000348:	80003a37          	lui	s4,0x80003
8000034c:	800039b7          	lui	s3,0x80003
80000350:	80003bb7          	lui	s7,0x80003
80000354:	ac01                	j	80000564 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x288>
80000356:	4018                	lw	a4,0(s0)
80000358:	4685                	li	a3,1
8000035a:	00d70c63          	beq	a4,a3,80000372 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x96>
8000035e:	4790                	lw	a2,8(a5)
80000360:	c205                	beqz	a2,80000380 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xa4>
80000362:	47d4                	lw	a3,12(a5)
80000364:	ca85                	beqz	a3,80000394 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xb8>
80000366:	c654                	sw	a3,12(a2)
80000368:	4790                	lw	a2,8(a5)
8000036a:	c690                	sw	a2,8(a3)
8000036c:	177d                	addi	a4,a4,-1
8000036e:	c018                	sw	a4,0(s0)
80000370:	a29d                	j	800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
80000372:	00042223          	sw	zero,4(s0)
80000376:	00042423          	sw	zero,8(s0)
8000037a:	00042023          	sw	zero,0(s0)
8000037e:	aaa1                	j	800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
80000380:	14070b63          	beqz	a4,800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
80000384:	4054                	lw	a3,4(s0)
80000386:	46d4                	lw	a3,12(a3)
80000388:	c054                	sw	a3,4(s0)
8000038a:	0006a423          	sw	zero,8(a3)
8000038e:	177d                	addi	a4,a4,-1
80000390:	c018                	sw	a4,0(s0)
80000392:	a291                	j	800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
80000394:	14070163          	beqz	a4,800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
80000398:	4414                	lw	a3,8(s0)
8000039a:	4694                	lw	a3,8(a3)
8000039c:	c414                	sw	a3,8(s0)
8000039e:	0006a623          	sw	zero,12(a3)
800003a2:	177d                	addi	a4,a4,-1
800003a4:	c018                	sw	a4,0(s0)
800003a6:	aa05                	j	800004d6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1fa>
800003a8:	019ca023          	sw	s9,0(s9)
800003ac:	018ca223          	sw	s8,4(s9)
800003b0:	000ca423          	sw	zero,8(s9)
800003b4:	000ca623          	sw	zero,12(s9)
800003b8:	00c92783          	lw	a5,12(s2)
800003bc:	9c3e                	add	s8,s8,a5
800003be:	01892623          	sw	s8,12(s2)
800003c2:	000ca583          	lw	a1,0(s9)
800003c6:	004ca603          	lw	a2,4(s9)
800003ca:	962e                	add	a2,a2,a1
800003cc:	00492783          	lw	a5,4(s2)
800003d0:	c7ed                	beqz	a5,800004ba <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1de>
800003d2:	873e                	mv	a4,a5
800003d4:	4314                	lw	a3,0(a4)
800003d6:	00d60463          	beq	a2,a3,800003de <_ZN4EPOS1S16Init_ApplicationC1Ev+0x102>
800003da:	4758                	lw	a4,12(a4)
800003dc:	ff65                	bnez	a4,800003d4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xf8>
800003de:	4394                	lw	a3,0(a5)
800003e0:	43d0                	lw	a2,4(a5)
800003e2:	96b2                	add	a3,a3,a2
800003e4:	08d58c63          	beq	a1,a3,8000047c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a0>
800003e8:	47dc                	lw	a5,12(a5)
800003ea:	fbf5                	bnez	a5,800003de <_ZN4EPOS1S16Init_ApplicationC1Ev+0x102>
800003ec:	00092783          	lw	a5,0(s2)
800003f0:	c39d                	beqz	a5,80000416 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x13a>
800003f2:	00892783          	lw	a5,8(s2)
800003f6:	0197a623          	sw	s9,12(a5)
800003fa:	00892783          	lw	a5,8(s2)
800003fe:	00fca423          	sw	a5,8(s9)
80000402:	000ca623          	sw	zero,12(s9)
80000406:	01992423          	sw	s9,8(s2)
8000040a:	00092783          	lw	a5,0(s2)
8000040e:	0785                	addi	a5,a5,1
80000410:	00f92023          	sw	a5,0(s2)
80000414:	a831                	j	80000430 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x154>
80000416:	000ca423          	sw	zero,8(s9)
8000041a:	000ca623          	sw	zero,12(s9)
8000041e:	01992223          	sw	s9,4(s2)
80000422:	01992423          	sw	s9,8(s2)
80000426:	00092783          	lw	a5,0(s2)
8000042a:	0785                	addi	a5,a5,1
8000042c:	00f92023          	sw	a5,0(s2)
80000430:	4781                	li	a5,0
80000432:	e731                	bnez	a4,8000047e <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a2>
80000434:	a215                	j	80000558 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x27c>
80000436:	00092223          	sw	zero,4(s2)
8000043a:	00092423          	sw	zero,8(s2)
8000043e:	00092023          	sw	zero,0(s2)
80000442:	a0ad                	j	800004ac <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d0>
80000444:	c6a5                	beqz	a3,800004ac <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d0>
80000446:	00492703          	lw	a4,4(s2)
8000044a:	4758                	lw	a4,12(a4)
8000044c:	00e92223          	sw	a4,4(s2)
80000450:	00072423          	sw	zero,8(a4)
80000454:	00092703          	lw	a4,0(s2)
80000458:	177d                	addi	a4,a4,-1
8000045a:	00e92023          	sw	a4,0(s2)
8000045e:	a0b9                	j	800004ac <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d0>
80000460:	c6b1                	beqz	a3,800004ac <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d0>
80000462:	00892703          	lw	a4,8(s2)
80000466:	4718                	lw	a4,8(a4)
80000468:	00e92423          	sw	a4,8(s2)
8000046c:	00072623          	sw	zero,12(a4)
80000470:	00092703          	lw	a4,0(s2)
80000474:	177d                	addi	a4,a4,-1
80000476:	00e92023          	sw	a4,0(s2)
8000047a:	a80d                	j	800004ac <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d0>
8000047c:	cb0d                	beqz	a4,800004ae <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d2>
8000047e:	004ca683          	lw	a3,4(s9)
80000482:	4350                	lw	a2,4(a4)
80000484:	96b2                	add	a3,a3,a2
80000486:	00dca223          	sw	a3,4(s9)
8000048a:	00092683          	lw	a3,0(s2)
8000048e:	4605                	li	a2,1
80000490:	fac683e3          	beq	a3,a2,80000436 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x15a>
80000494:	470c                	lw	a1,8(a4)
80000496:	d5dd                	beqz	a1,80000444 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x168>
80000498:	4750                	lw	a2,12(a4)
8000049a:	d279                	beqz	a2,80000460 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x184>
8000049c:	c5d0                	sw	a2,12(a1)
8000049e:	4718                	lw	a4,8(a4)
800004a0:	c618                	sw	a4,8(a2)
800004a2:	00092703          	lw	a4,0(s2)
800004a6:	177d                	addi	a4,a4,-1
800004a8:	00e92023          	sw	a4,0(s2)
800004ac:	c7d5                	beqz	a5,80000558 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x27c>
800004ae:	43d8                	lw	a4,4(a5)
800004b0:	004ca683          	lw	a3,4(s9)
800004b4:	9736                	add	a4,a4,a3
800004b6:	c3d8                	sw	a4,4(a5)
800004b8:	a045                	j	80000558 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x27c>
800004ba:	873e                	mv	a4,a5
800004bc:	bf05                	j	800003ec <_ZN4EPOS1S16Init_ApplicationC1Ev+0x110>
800004be:	044b2903          	lw	s2,68(s6) # 80005044 <__boot_stack__+0xf8005045>
800004c2:	41870733          	sub	a4,a4,s8
800004c6:	c3d8                	sw	a4,4(a5)
800004c8:	4458                	lw	a4,12(s0)
800004ca:	41870733          	sub	a4,a4,s8
800004ce:	c458                	sw	a4,12(s0)
800004d0:	43d8                	lw	a4,4(a5)
800004d2:	e80702e3          	beqz	a4,80000356 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x7a>
800004d6:	0007ac83          	lw	s9,0(a5)
800004da:	43dc                	lw	a5,4(a5)
800004dc:	9cbe                	add	s9,s9,a5
800004de:	7bca8513          	addi	a0,s5,1980 # 800037bc <__boot_stack__+0xf80037bd>
800004e2:	00000097          	auipc	ra,0x0
800004e6:	604080e7          	jalr	1540(ra) # 80000ae6 <_print>
800004ea:	4681                	li	a3,0
800004ec:	860a                	mv	a2,sp
800004ee:	85e2                	mv	a1,s8
800004f0:	03448513          	addi	a0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
800004f4:	00000097          	auipc	ra,0x0
800004f8:	6ba080e7          	jalr	1722(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800004fc:	009c                	addi	a5,sp,64
800004fe:	953e                	add	a0,a0,a5
80000500:	fc050023          	sb	zero,-64(a0)
80000504:	850a                	mv	a0,sp
80000506:	00000097          	auipc	ra,0x0
8000050a:	5e0080e7          	jalr	1504(ra) # 80000ae6 <_print>
8000050e:	7d0a0513          	addi	a0,s4,2000 # 800037d0 <__boot_stack__+0xf80037d1>
80000512:	00000097          	auipc	ra,0x0
80000516:	5d4080e7          	jalr	1492(ra) # 80000ae6 <_print>
8000051a:	860a                	mv	a2,sp
8000051c:	85e6                	mv	a1,s9
8000051e:	03448513          	addi	a0,s1,52
80000522:	00001097          	auipc	ra,0x1
80000526:	85a080e7          	jalr	-1958(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
8000052a:	009c                	addi	a5,sp,64
8000052c:	953e                	add	a0,a0,a5
8000052e:	fc050023          	sb	zero,-64(a0)
80000532:	850a                	mv	a0,sp
80000534:	00000097          	auipc	ra,0x0
80000538:	5b2080e7          	jalr	1458(ra) # 80000ae6 <_print>
8000053c:	76c98513          	addi	a0,s3,1900 # 8000376c <__boot_stack__+0xf800376d>
80000540:	00000097          	auipc	ra,0x0
80000544:	5a6080e7          	jalr	1446(ra) # 80000ae6 <_print>
80000548:	47a9                	li	a5,10
8000054a:	02f4aa23          	sw	a5,52(s1)
8000054e:	000c8563          	beqz	s9,80000558 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x27c>
80000552:	47bd                	li	a5,15
80000554:	e587eae3          	bltu	a5,s8,800003a8 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xcc>
80000558:	405c                	lw	a5,4(s0)
8000055a:	cfc5                	beqz	a5,80000612 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x336>
8000055c:	0047ac03          	lw	s8,4(a5)
80000560:	0a0c0963          	beqz	s8,80000612 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x336>
80000564:	405c                	lw	a5,4(s0)
80000566:	cb91                	beqz	a5,8000057a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x29e>
80000568:	004c0693          	addi	a3,s8,4
8000056c:	43d8                	lw	a4,4(a5)
8000056e:	f4d778e3          	bgeu	a4,a3,800004be <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1e2>
80000572:	f58706e3          	beq	a4,s8,800004be <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1e2>
80000576:	47dc                	lw	a5,12(a5)
80000578:	fbf5                	bnez	a5,8000056c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x290>
8000057a:	03448913          	addi	s2,s1,52
8000057e:	4785                	li	a5,1
80000580:	00f90223          	sb	a5,4(s2)
80000584:	7d8b8513          	addi	a0,s7,2008 # 800037d8 <__boot_stack__+0xf80037d9>
80000588:	00000097          	auipc	ra,0x0
8000058c:	55e080e7          	jalr	1374(ra) # 80000ae6 <_print>
80000590:	76c98513          	addi	a0,s3,1900
80000594:	00000097          	auipc	ra,0x0
80000598:	552080e7          	jalr	1362(ra) # 80000ae6 <_print>
8000059c:	4ca9                	li	s9,10
8000059e:	01992023          	sw	s9,0(s2)
800005a2:	7bca8513          	addi	a0,s5,1980
800005a6:	00000097          	auipc	ra,0x0
800005aa:	540080e7          	jalr	1344(ra) # 80000ae6 <_print>
800005ae:	4681                	li	a3,0
800005b0:	860a                	mv	a2,sp
800005b2:	85e2                	mv	a1,s8
800005b4:	03448513          	addi	a0,s1,52
800005b8:	00000097          	auipc	ra,0x0
800005bc:	5f6080e7          	jalr	1526(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800005c0:	009c                	addi	a5,sp,64
800005c2:	953e                	add	a0,a0,a5
800005c4:	fc050023          	sb	zero,-64(a0)
800005c8:	850a                	mv	a0,sp
800005ca:	00000097          	auipc	ra,0x0
800005ce:	51c080e7          	jalr	1308(ra) # 80000ae6 <_print>
800005d2:	7d0a0513          	addi	a0,s4,2000
800005d6:	00000097          	auipc	ra,0x0
800005da:	510080e7          	jalr	1296(ra) # 80000ae6 <_print>
800005de:	860a                	mv	a2,sp
800005e0:	4581                	li	a1,0
800005e2:	03448513          	addi	a0,s1,52
800005e6:	00000097          	auipc	ra,0x0
800005ea:	796080e7          	jalr	1942(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
800005ee:	009c                	addi	a5,sp,64
800005f0:	953e                	add	a0,a0,a5
800005f2:	fc050023          	sb	zero,-64(a0)
800005f6:	850a                	mv	a0,sp
800005f8:	00000097          	auipc	ra,0x0
800005fc:	4ee080e7          	jalr	1262(ra) # 80000ae6 <_print>
80000600:	76c98513          	addi	a0,s3,1900
80000604:	00000097          	auipc	ra,0x0
80000608:	4e2080e7          	jalr	1250(ra) # 80000ae6 <_print>
8000060c:	01992023          	sw	s9,0(s2)
80000610:	b7a1                	j	80000558 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x27c>
80000612:	50b6                	lw	ra,108(sp)
80000614:	5426                	lw	s0,104(sp)
80000616:	5496                	lw	s1,100(sp)
80000618:	5906                	lw	s2,96(sp)
8000061a:	49f6                	lw	s3,92(sp)
8000061c:	4a66                	lw	s4,88(sp)
8000061e:	4ad6                	lw	s5,84(sp)
80000620:	4b46                	lw	s6,80(sp)
80000622:	4bb6                	lw	s7,76(sp)
80000624:	4c26                	lw	s8,72(sp)
80000626:	4c96                	lw	s9,68(sp)
80000628:	4d06                	lw	s10,64(sp)
8000062a:	6165                	addi	sp,sp,112
8000062c:	8082                	ret

8000062e <_GLOBAL__sub_I__end>:
8000062e:	1141                	addi	sp,sp,-16
80000630:	c606                	sw	ra,12(sp)
80000632:	80005537          	lui	a0,0x80005
80000636:	02c50513          	addi	a0,a0,44 # 8000502c <__boot_stack__+0xf800502d>
8000063a:	00000097          	auipc	ra,0x0
8000063e:	ca2080e7          	jalr	-862(ra) # 800002dc <_ZN4EPOS1S16Init_ApplicationC1Ev>
80000642:	40b2                	lw	ra,12(sp)
80000644:	0141                	addi	sp,sp,16
80000646:	8082                	ret

80000648 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>:
80000648:	455c                	lw	a5,12(a0)
8000064a:	41d8                	lw	a4,4(a1)
8000064c:	97ba                	add	a5,a5,a4
8000064e:	c55c                	sw	a5,12(a0)
80000650:	0006a023          	sw	zero,0(a3)
80000654:	00062023          	sw	zero,0(a2)
80000658:	0005a303          	lw	t1,0(a1)
8000065c:	0045a883          	lw	a7,4(a1)
80000660:	989a                	add	a7,a7,t1
80000662:	415c                	lw	a5,4(a0)
80000664:	c3cd                	beqz	a5,80000706 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xbe>
80000666:	873e                	mv	a4,a5
80000668:	00072803          	lw	a6,0(a4)
8000066c:	01088463          	beq	a7,a6,80000674 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
80000670:	4758                	lw	a4,12(a4)
80000672:	fb7d                	bnez	a4,80000668 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x20>
80000674:	0007a803          	lw	a6,0(a5)
80000678:	0047a883          	lw	a7,4(a5)
8000067c:	9846                	add	a6,a6,a7
8000067e:	09030663          	beq	t1,a6,8000070a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc2>
80000682:	47dc                	lw	a5,12(a5)
80000684:	fbe5                	bnez	a5,80000674 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
80000686:	411c                	lw	a5,0(a0)
80000688:	cf81                	beqz	a5,800006a0 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x58>
8000068a:	451c                	lw	a5,8(a0)
8000068c:	c7cc                	sw	a1,12(a5)
8000068e:	451c                	lw	a5,8(a0)
80000690:	c59c                	sw	a5,8(a1)
80000692:	0005a623          	sw	zero,12(a1)
80000696:	c50c                	sw	a1,8(a0)
80000698:	411c                	lw	a5,0(a0)
8000069a:	0785                	addi	a5,a5,1
8000069c:	c11c                	sw	a5,0(a0)
8000069e:	a811                	j	800006b2 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x6a>
800006a0:	0005a423          	sw	zero,8(a1)
800006a4:	0005a623          	sw	zero,12(a1)
800006a8:	c14c                	sw	a1,4(a0)
800006aa:	c50c                	sw	a1,8(a0)
800006ac:	411c                	lw	a5,0(a0)
800006ae:	0785                	addi	a5,a5,1
800006b0:	c11c                	sw	a5,0(a0)
800006b2:	4781                	li	a5,0
800006b4:	ef21                	bnez	a4,8000070c <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc4>
800006b6:	8082                	ret
800006b8:	00052223          	sw	zero,4(a0)
800006bc:	00052423          	sw	zero,8(a0)
800006c0:	00052023          	sw	zero,0(a0)
800006c4:	a059                	j	8000074a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800006c6:	08080263          	beqz	a6,8000074a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800006ca:	00452803          	lw	a6,4(a0)
800006ce:	00c82803          	lw	a6,12(a6)
800006d2:	01052223          	sw	a6,4(a0)
800006d6:	00082423          	sw	zero,8(a6)
800006da:	00052803          	lw	a6,0(a0)
800006de:	187d                	addi	a6,a6,-1
800006e0:	01052023          	sw	a6,0(a0)
800006e4:	a09d                	j	8000074a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800006e6:	06080263          	beqz	a6,8000074a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800006ea:	00852803          	lw	a6,8(a0)
800006ee:	00882803          	lw	a6,8(a6)
800006f2:	01052423          	sw	a6,8(a0)
800006f6:	00082623          	sw	zero,12(a6)
800006fa:	00052803          	lw	a6,0(a0)
800006fe:	187d                	addi	a6,a6,-1
80000700:	01052023          	sw	a6,0(a0)
80000704:	a099                	j	8000074a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
80000706:	873e                	mv	a4,a5
80000708:	bfbd                	j	80000686 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x3e>
8000070a:	c331                	beqz	a4,8000074e <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x106>
8000070c:	0045a803          	lw	a6,4(a1)
80000710:	00472883          	lw	a7,4(a4)
80000714:	9846                	add	a6,a6,a7
80000716:	0105a223          	sw	a6,4(a1)
8000071a:	00052803          	lw	a6,0(a0)
8000071e:	4885                	li	a7,1
80000720:	f9180ce3          	beq	a6,a7,800006b8 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x70>
80000724:	00872303          	lw	t1,8(a4)
80000728:	f8030fe3          	beqz	t1,800006c6 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x7e>
8000072c:	00c72883          	lw	a7,12(a4)
80000730:	fa088be3          	beqz	a7,800006e6 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x9e>
80000734:	01132623          	sw	a7,12(t1)
80000738:	00872803          	lw	a6,8(a4)
8000073c:	0108a423          	sw	a6,8(a7)
80000740:	00052803          	lw	a6,0(a0)
80000744:	187d                	addi	a6,a6,-1
80000746:	01052023          	sw	a6,0(a0)
8000074a:	c218                	sw	a4,0(a2)
8000074c:	c799                	beqz	a5,8000075a <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x112>
8000074e:	43d8                	lw	a4,4(a5)
80000750:	41d0                	lw	a2,4(a1)
80000752:	9732                	add	a4,a4,a2
80000754:	c3d8                	sw	a4,4(a5)
80000756:	c28c                	sw	a1,0(a3)
80000758:	8082                	ret
8000075a:	8082                	ret

8000075c <_ZN4EPOS1S11Init_SystemC1Ev>:
8000075c:	7119                	addi	sp,sp,-128
8000075e:	de86                	sw	ra,124(sp)
80000760:	dca2                	sw	s0,120(sp)
80000762:	daa6                	sw	s1,116(sp)
80000764:	d8ca                	sw	s2,112(sp)
80000766:	d6ce                	sw	s3,108(sp)
80000768:	d4d2                	sw	s4,104(sp)
8000076a:	d2d6                	sw	s5,100(sp)
8000076c:	d0da                	sw	s6,96(sp)
8000076e:	cede                	sw	s7,92(sp)
80000770:	80003537          	lui	a0,0x80003
80000774:	7f050513          	addi	a0,a0,2032 # 800037f0 <__boot_stack__+0xf80037f1>
80000778:	00000097          	auipc	ra,0x0
8000077c:	36e080e7          	jalr	878(ra) # 80000ae6 <_print>
80000780:	80003537          	lui	a0,0x80003
80000784:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80000788:	00000097          	auipc	ra,0x0
8000078c:	35e080e7          	jalr	862(ra) # 80000ae6 <_print>
80000790:	800057b7          	lui	a5,0x80005
80000794:	4729                	li	a4,10
80000796:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
8000079a:	00002097          	auipc	ra,0x2
8000079e:	8a2080e7          	jalr	-1886(ra) # 8000203c <_ZN4EPOS1S3CPU4initEv>
800007a2:	800057b7          	lui	a5,0x80005
800007a6:	1247a783          	lw	a5,292(a5) # 80005124 <__boot_stack__+0xf8005125>
800007aa:	cf81                	beqz	a5,800007c2 <_ZN4EPOS1S11Init_SystemC1Ev+0x66>
800007ac:	000446b7          	lui	a3,0x44
800007b0:	00368613          	addi	a2,a3,3 # 44003 <_vector_table-0x7ffbbffd>
800007b4:	43d8                	lw	a4,4(a5)
800007b6:	0ae66a63          	bltu	a2,a4,8000086a <_ZN4EPOS1S11Init_SystemC1Ev+0x10e>
800007ba:	0ad70863          	beq	a4,a3,8000086a <_ZN4EPOS1S11Init_SystemC1Ev+0x10e>
800007be:	47dc                	lw	a5,12(a5)
800007c0:	fbf5                	bnez	a5,800007b4 <_ZN4EPOS1S11Init_SystemC1Ev+0x58>
800007c2:	80005437          	lui	s0,0x80005
800007c6:	03440413          	addi	s0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
800007ca:	4785                	li	a5,1
800007cc:	00f40223          	sb	a5,4(s0)
800007d0:	80003537          	lui	a0,0x80003
800007d4:	7d850513          	addi	a0,a0,2008 # 800037d8 <__boot_stack__+0xf80037d9>
800007d8:	00000097          	auipc	ra,0x0
800007dc:	30e080e7          	jalr	782(ra) # 80000ae6 <_print>
800007e0:	80003537          	lui	a0,0x80003
800007e4:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
800007e8:	00000097          	auipc	ra,0x0
800007ec:	2fe080e7          	jalr	766(ra) # 80000ae6 <_print>
800007f0:	47a9                	li	a5,10
800007f2:	c01c                	sw	a5,0(s0)
800007f4:	4401                	li	s0,0
800007f6:	a851                	j	8000088a <_ZN4EPOS1S11Init_SystemC1Ev+0x12e>
800007f8:	80005737          	lui	a4,0x80005
800007fc:	12072703          	lw	a4,288(a4) # 80005120 <__boot_stack__+0xf8005121>
80000800:	4685                	li	a3,1
80000802:	00d70f63          	beq	a4,a3,80000820 <_ZN4EPOS1S11Init_SystemC1Ev+0xc4>
80000806:	4790                	lw	a2,8(a5)
80000808:	c61d                	beqz	a2,80000836 <_ZN4EPOS1S11Init_SystemC1Ev+0xda>
8000080a:	47d4                	lw	a3,12(a5)
8000080c:	c2b1                	beqz	a3,80000850 <_ZN4EPOS1S11Init_SystemC1Ev+0xf4>
8000080e:	c654                	sw	a3,12(a2)
80000810:	4790                	lw	a2,8(a5)
80000812:	c690                	sw	a2,8(a3)
80000814:	177d                	addi	a4,a4,-1
80000816:	800056b7          	lui	a3,0x80005
8000081a:	12e6a023          	sw	a4,288(a3) # 80005120 <__boot_stack__+0xf8005121>
8000081e:	a09d                	j	80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
80000820:	80005737          	lui	a4,0x80005
80000824:	12070713          	addi	a4,a4,288 # 80005120 <__boot_stack__+0xf8005121>
80000828:	00072223          	sw	zero,4(a4)
8000082c:	00072423          	sw	zero,8(a4)
80000830:	00072023          	sw	zero,0(a4)
80000834:	a881                	j	80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
80000836:	c739                	beqz	a4,80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
80000838:	800056b7          	lui	a3,0x80005
8000083c:	12068693          	addi	a3,a3,288 # 80005120 <__boot_stack__+0xf8005121>
80000840:	42d0                	lw	a2,4(a3)
80000842:	4650                	lw	a2,12(a2)
80000844:	c2d0                	sw	a2,4(a3)
80000846:	00062423          	sw	zero,8(a2)
8000084a:	177d                	addi	a4,a4,-1
8000084c:	c298                	sw	a4,0(a3)
8000084e:	a81d                	j	80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
80000850:	cb15                	beqz	a4,80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
80000852:	800056b7          	lui	a3,0x80005
80000856:	12068693          	addi	a3,a3,288 # 80005120 <__boot_stack__+0xf8005121>
8000085a:	4690                	lw	a2,8(a3)
8000085c:	4610                	lw	a2,8(a2)
8000085e:	c690                	sw	a2,8(a3)
80000860:	00062623          	sw	zero,12(a2)
80000864:	177d                	addi	a4,a4,-1
80000866:	c298                	sw	a4,0(a3)
80000868:	a831                	j	80000884 <_ZN4EPOS1S11Init_SystemC1Ev+0x128>
8000086a:	fffbc637          	lui	a2,0xfffbc
8000086e:	9732                	add	a4,a4,a2
80000870:	c3d8                	sw	a4,4(a5)
80000872:	80005737          	lui	a4,0x80005
80000876:	12070713          	addi	a4,a4,288 # 80005120 <__boot_stack__+0xf8005121>
8000087a:	4754                	lw	a3,12(a4)
8000087c:	96b2                	add	a3,a3,a2
8000087e:	c754                	sw	a3,12(a4)
80000880:	43d8                	lw	a4,4(a5)
80000882:	db3d                	beqz	a4,800007f8 <_ZN4EPOS1S11Init_SystemC1Ev+0x9c>
80000884:	4380                	lw	s0,0(a5)
80000886:	43dc                	lw	a5,4(a5)
80000888:	943e                	add	s0,s0,a5
8000088a:	80003537          	lui	a0,0x80003
8000088e:	7bc50513          	addi	a0,a0,1980 # 800037bc <__boot_stack__+0xf80037bd>
80000892:	00000097          	auipc	ra,0x0
80000896:	254080e7          	jalr	596(ra) # 80000ae6 <_print>
8000089a:	4681                	li	a3,0
8000089c:	0810                	addi	a2,sp,16
8000089e:	000445b7          	lui	a1,0x44
800008a2:	800054b7          	lui	s1,0x80005
800008a6:	03448513          	addi	a0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
800008aa:	00000097          	auipc	ra,0x0
800008ae:	304080e7          	jalr	772(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800008b2:	089c                	addi	a5,sp,80
800008b4:	953e                	add	a0,a0,a5
800008b6:	fc050023          	sb	zero,-64(a0)
800008ba:	0808                	addi	a0,sp,16
800008bc:	00000097          	auipc	ra,0x0
800008c0:	22a080e7          	jalr	554(ra) # 80000ae6 <_print>
800008c4:	80003bb7          	lui	s7,0x80003
800008c8:	7d0b8513          	addi	a0,s7,2000 # 800037d0 <__boot_stack__+0xf80037d1>
800008cc:	00000097          	auipc	ra,0x0
800008d0:	21a080e7          	jalr	538(ra) # 80000ae6 <_print>
800008d4:	0810                	addi	a2,sp,16
800008d6:	85a2                	mv	a1,s0
800008d8:	03448513          	addi	a0,s1,52
800008dc:	00000097          	auipc	ra,0x0
800008e0:	4a0080e7          	jalr	1184(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
800008e4:	089c                	addi	a5,sp,80
800008e6:	953e                	add	a0,a0,a5
800008e8:	fc050023          	sb	zero,-64(a0)
800008ec:	0808                	addi	a0,sp,16
800008ee:	00000097          	auipc	ra,0x0
800008f2:	1f8080e7          	jalr	504(ra) # 80000ae6 <_print>
800008f6:	80003ab7          	lui	s5,0x80003
800008fa:	76ca8513          	addi	a0,s5,1900 # 8000376c <__boot_stack__+0xf800376d>
800008fe:	00000097          	auipc	ra,0x0
80000902:	1e8080e7          	jalr	488(ra) # 80000ae6 <_print>
80000906:	03448993          	addi	s3,s1,52
8000090a:	4a29                	li	s4,10
8000090c:	0149a023          	sw	s4,0(s3)
80000910:	80005b37          	lui	s6,0x80005
80000914:	074b0793          	addi	a5,s6,116 # 80005074 <__boot_stack__+0xf8005075>
80000918:	00078023          	sb	zero,0(a5)
8000091c:	000780a3          	sb	zero,1(a5)
80000920:	00078123          	sb	zero,2(a5)
80000924:	000781a3          	sb	zero,3(a5)
80000928:	00078223          	sb	zero,4(a5)
8000092c:	000782a3          	sb	zero,5(a5)
80000930:	00078323          	sb	zero,6(a5)
80000934:	000783a3          	sb	zero,7(a5)
80000938:	00078423          	sb	zero,8(a5)
8000093c:	000784a3          	sb	zero,9(a5)
80000940:	00078523          	sb	zero,10(a5)
80000944:	000785a3          	sb	zero,11(a5)
80000948:	00078623          	sb	zero,12(a5)
8000094c:	000786a3          	sb	zero,13(a5)
80000950:	00078723          	sb	zero,14(a5)
80000954:	000787a3          	sb	zero,15(a5)
80000958:	80004537          	lui	a0,0x80004
8000095c:	80050513          	addi	a0,a0,-2048 # 80003800 <__boot_stack__+0xf8003801>
80000960:	00000097          	auipc	ra,0x0
80000964:	186080e7          	jalr	390(ra) # 80000ae6 <_print>
80000968:	0810                	addi	a2,sp,16
8000096a:	85a2                	mv	a1,s0
8000096c:	03448513          	addi	a0,s1,52
80000970:	00000097          	auipc	ra,0x0
80000974:	40c080e7          	jalr	1036(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80000978:	089c                	addi	a5,sp,80
8000097a:	953e                	add	a0,a0,a5
8000097c:	fc050023          	sb	zero,-64(a0)
80000980:	0808                	addi	a0,sp,16
80000982:	00000097          	auipc	ra,0x0
80000986:	164080e7          	jalr	356(ra) # 80000ae6 <_print>
8000098a:	80004537          	lui	a0,0x80004
8000098e:	80c50513          	addi	a0,a0,-2036 # 8000380c <__boot_stack__+0xf800380d>
80000992:	00000097          	auipc	ra,0x0
80000996:	154080e7          	jalr	340(ra) # 80000ae6 <_print>
8000099a:	4681                	li	a3,0
8000099c:	0810                	addi	a2,sp,16
8000099e:	000445b7          	lui	a1,0x44
800009a2:	03448513          	addi	a0,s1,52
800009a6:	00000097          	auipc	ra,0x0
800009aa:	208080e7          	jalr	520(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800009ae:	089c                	addi	a5,sp,80
800009b0:	953e                	add	a0,a0,a5
800009b2:	fc050023          	sb	zero,-64(a0)
800009b6:	0808                	addi	a0,sp,16
800009b8:	00000097          	auipc	ra,0x0
800009bc:	12e080e7          	jalr	302(ra) # 80000ae6 <_print>
800009c0:	7d0b8513          	addi	a0,s7,2000
800009c4:	00000097          	auipc	ra,0x0
800009c8:	122080e7          	jalr	290(ra) # 80000ae6 <_print>
800009cc:	0810                	addi	a2,sp,16
800009ce:	074b0593          	addi	a1,s6,116
800009d2:	03448513          	addi	a0,s1,52
800009d6:	00000097          	auipc	ra,0x0
800009da:	3a6080e7          	jalr	934(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
800009de:	089c                	addi	a5,sp,80
800009e0:	953e                	add	a0,a0,a5
800009e2:	fc050023          	sb	zero,-64(a0)
800009e6:	0808                	addi	a0,sp,16
800009e8:	00000097          	auipc	ra,0x0
800009ec:	0fe080e7          	jalr	254(ra) # 80000ae6 <_print>
800009f0:	76ca8513          	addi	a0,s5,1900
800009f4:	00000097          	auipc	ra,0x0
800009f8:	0f2080e7          	jalr	242(ra) # 80000ae6 <_print>
800009fc:	0149a023          	sw	s4,0(s3)
80000a00:	c015                	beqz	s0,80000a24 <_ZN4EPOS1S11Init_SystemC1Ev+0x2c8>
80000a02:	c000                	sw	s0,0(s0)
80000a04:	000447b7          	lui	a5,0x44
80000a08:	c05c                	sw	a5,4(s0)
80000a0a:	00042423          	sw	zero,8(s0)
80000a0e:	00042623          	sw	zero,12(s0)
80000a12:	0814                	addi	a3,sp,16
80000a14:	0070                	addi	a2,sp,12
80000a16:	85a2                	mv	a1,s0
80000a18:	074b0513          	addi	a0,s6,116
80000a1c:	00000097          	auipc	ra,0x0
80000a20:	c2c080e7          	jalr	-980(ra) # 80000648 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>
80000a24:	80005737          	lui	a4,0x80005
80000a28:	800057b7          	lui	a5,0x80005
80000a2c:	07478793          	addi	a5,a5,116 # 80005074 <__boot_stack__+0xf8005075>
80000a30:	04f72223          	sw	a5,68(a4) # 80005044 <__boot_stack__+0xf8005045>
80000a34:	00002097          	auipc	ra,0x2
80000a38:	a38080e7          	jalr	-1480(ra) # 8000246c <_ZN4EPOS1S7Machine4initEv>
80000a3c:	00002097          	auipc	ra,0x2
80000a40:	ab0080e7          	jalr	-1360(ra) # 800024ec <_ZN4EPOS1S6System4initEv>
80000a44:	c01027f3          	rdtime	a5
80000a48:	80005737          	lui	a4,0x80005
80000a4c:	04f72823          	sw	a5,80(a4) # 80005050 <__boot_stack__+0xf8005051>
80000a50:	50f6                	lw	ra,124(sp)
80000a52:	5466                	lw	s0,120(sp)
80000a54:	54d6                	lw	s1,116(sp)
80000a56:	5946                	lw	s2,112(sp)
80000a58:	59b6                	lw	s3,108(sp)
80000a5a:	5a26                	lw	s4,104(sp)
80000a5c:	5a96                	lw	s5,100(sp)
80000a5e:	5b06                	lw	s6,96(sp)
80000a60:	4bf6                	lw	s7,92(sp)
80000a62:	6109                	addi	sp,sp,128
80000a64:	8082                	ret

80000a66 <_GLOBAL__sub_I__ZN4EPOS1S11init_systemE>:
80000a66:	1141                	addi	sp,sp,-16
80000a68:	c606                	sw	ra,12(sp)
80000a6a:	80005537          	lui	a0,0x80005
80000a6e:	03050513          	addi	a0,a0,48 # 80005030 <__boot_stack__+0xf8005031>
80000a72:	00000097          	auipc	ra,0x0
80000a76:	cea080e7          	jalr	-790(ra) # 8000075c <_ZN4EPOS1S11Init_SystemC1Ev>
80000a7a:	40b2                	lw	ra,12(sp)
80000a7c:	0141                	addi	sp,sp,16
80000a7e:	8082                	ret

80000a80 <_GLOBAL__sub_I__ZN4EPOS1S7__entryE>:
80000a80:	1141                	addi	sp,sp,-16
80000a82:	c606                	sw	ra,12(sp)
80000a84:	557d                	li	a0,-1
80000a86:	00002097          	auipc	ra,0x2
80000a8a:	8e8080e7          	jalr	-1816(ra) # 8000236e <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>
80000a8e:	800057b7          	lui	a5,0x80005
80000a92:	03c78793          	addi	a5,a5,60 # 8000503c <__boot_stack__+0xf800503d>
80000a96:	4729                	li	a4,10
80000a98:	c398                	sw	a4,0(a5)
80000a9a:	00078223          	sb	zero,4(a5)
80000a9e:	800057b7          	lui	a5,0x80005
80000aa2:	03478793          	addi	a5,a5,52 # 80005034 <__boot_stack__+0xf8005035>
80000aa6:	c398                	sw	a4,0(a5)
80000aa8:	00078223          	sb	zero,4(a5)
80000aac:	40b2                	lw	ra,12(sp)
80000aae:	0141                	addi	sp,sp,16
80000ab0:	8082                	ret

80000ab2 <_panic>:
80000ab2:	1141                	addi	sp,sp,-16
80000ab4:	c606                	sw	ra,12(sp)
80000ab6:	00002097          	auipc	ra,0x2
80000aba:	0ac080e7          	jalr	172(ra) # 80002b62 <_ZN4EPOS1S7Machine5panicEv>
80000abe:	40b2                	lw	ra,12(sp)
80000ac0:	0141                	addi	sp,sp,16
80000ac2:	8082                	ret

80000ac4 <_exit>:
80000ac4:	1141                	addi	sp,sp,-16
80000ac6:	c606                	sw	ra,12(sp)
80000ac8:	00001097          	auipc	ra,0x1
80000acc:	1a0080e7          	jalr	416(ra) # 80001c68 <_ZN4EPOS1S6Thread4exitEi>
80000ad0:	a001                	j	80000ad0 <_exit+0xc>

80000ad2 <__exit>:
80000ad2:	1141                	addi	sp,sp,-16
80000ad4:	c606                	sw	ra,12(sp)
80000ad6:	852a                	mv	a0,a0
80000ad8:	00001097          	auipc	ra,0x1
80000adc:	190080e7          	jalr	400(ra) # 80001c68 <_ZN4EPOS1S6Thread4exitEi>
80000ae0:	40b2                	lw	ra,12(sp)
80000ae2:	0141                	addi	sp,sp,16
80000ae4:	8082                	ret

80000ae6 <_print>:
80000ae6:	00054683          	lbu	a3,0(a0)
80000aea:	cac5                	beqz	a3,80000b9a <_print+0xb4>
80000aec:	4825                	li	a6,9
80000aee:	100007b7          	lui	a5,0x10000
80000af2:	80005637          	lui	a2,0x80005
80000af6:	45a9                	li	a1,10
80000af8:	4335                	li	t1,13
80000afa:	800058b7          	lui	a7,0x80005
80000afe:	04f00e13          	li	t3,79
80000b02:	a005                	j	80000b22 <_print+0x3c>
80000b04:	0057c703          	lbu	a4,5(a5) # 10000005 <_vector_table-0x6ffffffb>
80000b08:	02077713          	andi	a4,a4,32
80000b0c:	df65                	beqz	a4,80000b04 <_print+0x1e>
80000b0e:	01078023          	sb	a6,0(a5)
80000b12:	06862703          	lw	a4,104(a2) # 80005068 <__boot_stack__+0xf8005069>
80000b16:	0721                	addi	a4,a4,8
80000b18:	06e62423          	sw	a4,104(a2)
80000b1c:	00054683          	lbu	a3,0(a0)
80000b20:	cead                	beqz	a3,80000b9a <_print+0xb4>
80000b22:	0505                	addi	a0,a0,1
80000b24:	ff0680e3          	beq	a3,a6,80000b04 <_print+0x1e>
80000b28:	02b69863          	bne	a3,a1,80000b58 <_print+0x72>
80000b2c:	0057c703          	lbu	a4,5(a5)
80000b30:	02077713          	andi	a4,a4,32
80000b34:	df65                	beqz	a4,80000b2c <_print+0x46>
80000b36:	00678023          	sb	t1,0(a5)
80000b3a:	0057c703          	lbu	a4,5(a5)
80000b3e:	02077713          	andi	a4,a4,32
80000b42:	df65                	beqz	a4,80000b3a <_print+0x54>
80000b44:	00b78023          	sb	a1,0(a5)
80000b48:	06062423          	sw	zero,104(a2)
80000b4c:	0648a703          	lw	a4,100(a7) # 80005064 <__boot_stack__+0xf8005065>
80000b50:	0705                	addi	a4,a4,1
80000b52:	06e8a223          	sw	a4,100(a7)
80000b56:	b7d9                	j	80000b1c <_print+0x36>
80000b58:	06862703          	lw	a4,104(a2)
80000b5c:	0705                	addi	a4,a4,1
80000b5e:	06e62423          	sw	a4,104(a2)
80000b62:	0057c703          	lbu	a4,5(a5)
80000b66:	02077713          	andi	a4,a4,32
80000b6a:	df65                	beqz	a4,80000b62 <_print+0x7c>
80000b6c:	00d78023          	sb	a3,0(a5)
80000b70:	06862703          	lw	a4,104(a2)
80000b74:	faee54e3          	bge	t3,a4,80000b1c <_print+0x36>
80000b78:	0057c703          	lbu	a4,5(a5)
80000b7c:	02077713          	andi	a4,a4,32
80000b80:	df65                	beqz	a4,80000b78 <_print+0x92>
80000b82:	00678023          	sb	t1,0(a5)
80000b86:	0057c703          	lbu	a4,5(a5)
80000b8a:	02077713          	andi	a4,a4,32
80000b8e:	df65                	beqz	a4,80000b86 <_print+0xa0>
80000b90:	00b78023          	sb	a1,0(a5)
80000b94:	06062423          	sw	zero,104(a2)
80000b98:	b751                	j	80000b1c <_print+0x36>
80000b9a:	8082                	ret

80000b9c <_GLOBAL__sub_I__panic>:
80000b9c:	800057b7          	lui	a5,0x80005
80000ba0:	04878793          	addi	a5,a5,72 # 80005048 <__boot_stack__+0xf8005049>
80000ba4:	0007a023          	sw	zero,0(a5)
80000ba8:	0007a223          	sw	zero,4(a5)
80000bac:	8082                	ret

80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>:
80000bae:	c9a1                	beqz	a1,80000bfe <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x50>
80000bb0:	10000793          	li	a5,256
80000bb4:	00b7f663          	bgeu	a5,a1,80000bc0 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
80000bb8:	411c                	lw	a5,0(a0)
80000bba:	17e1                	addi	a5,a5,-8
80000bbc:	9bdd                	andi	a5,a5,-9
80000bbe:	cba1                	beqz	a5,80000c0e <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x60>
80000bc0:	4118                	lw	a4,0(a0)
80000bc2:	87ae                	mv	a5,a1
80000bc4:	88b6                	mv	a7,a3
80000bc6:	0685                	addi	a3,a3,1
80000bc8:	883e                	mv	a6,a5
80000bca:	02e7d7b3          	divu	a5,a5,a4
80000bce:	fee87be3          	bgeu	a6,a4,80000bc4 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x16>
80000bd2:	9646                	add	a2,a2,a7
80000bd4:	80004837          	lui	a6,0x80004
80000bd8:	81480813          	addi	a6,a6,-2028 # 80003814 <__boot_stack__+0xf8003815>
80000bdc:	411c                	lw	a5,0(a0)
80000bde:	02f5f7b3          	remu	a5,a1,a5
80000be2:	97c2                	add	a5,a5,a6
80000be4:	0007c783          	lbu	a5,0(a5)
80000be8:	00f60023          	sb	a5,0(a2)
80000bec:	411c                	lw	a5,0(a0)
80000bee:	872e                	mv	a4,a1
80000bf0:	02f5d5b3          	divu	a1,a1,a5
80000bf4:	167d                	addi	a2,a2,-1
80000bf6:	fef773e3          	bgeu	a4,a5,80000bdc <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x2e>
80000bfa:	8536                	mv	a0,a3
80000bfc:	8082                	ret
80000bfe:	9636                	add	a2,a2,a3
80000c00:	03000793          	li	a5,48
80000c04:	00f60023          	sb	a5,0(a2)
80000c08:	00168513          	addi	a0,a3,1
80000c0c:	8082                	ret
80000c0e:	00168713          	addi	a4,a3,1
80000c12:	00d607b3          	add	a5,a2,a3
80000c16:	03000813          	li	a6,48
80000c1a:	01078023          	sb	a6,0(a5)
80000c1e:	00052803          	lw	a6,0(a0)
80000c22:	47c1                	li	a5,16
80000c24:	00f81963          	bne	a6,a5,80000c36 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x88>
80000c28:	0689                	addi	a3,a3,2
80000c2a:	9732                	add	a4,a4,a2
80000c2c:	07800793          	li	a5,120
80000c30:	00f70023          	sb	a5,0(a4)
80000c34:	b771                	j	80000bc0 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
80000c36:	86ba                	mv	a3,a4
80000c38:	b761                	j	80000bc0 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>

80000c3a <_ZN4EPOS1S1U7OStream4itoaEiPc>:
80000c3a:	1141                	addi	sp,sp,-16
80000c3c:	c606                	sw	ra,12(sp)
80000c3e:	4681                	li	a3,0
80000c40:	0005c963          	bltz	a1,80000c52 <_ZN4EPOS1S1U7OStream4itoaEiPc+0x18>
80000c44:	00000097          	auipc	ra,0x0
80000c48:	f6a080e7          	jalr	-150(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000c4c:	40b2                	lw	ra,12(sp)
80000c4e:	0141                	addi	sp,sp,16
80000c50:	8082                	ret
80000c52:	40b005b3          	neg	a1,a1
80000c56:	02d00793          	li	a5,45
80000c5a:	00f60023          	sb	a5,0(a2)
80000c5e:	4685                	li	a3,1
80000c60:	b7d5                	j	80000c44 <_ZN4EPOS1S1U7OStream4itoaEiPc+0xa>

80000c62 <_ZN4EPOS1S1U7OStream6llutoaEyPcj>:
80000c62:	7179                	addi	sp,sp,-48
80000c64:	d606                	sw	ra,44(sp)
80000c66:	d422                	sw	s0,40(sp)
80000c68:	d226                	sw	s1,36(sp)
80000c6a:	d04a                	sw	s2,32(sp)
80000c6c:	ce4e                	sw	s3,28(sp)
80000c6e:	cc52                	sw	s4,24(sp)
80000c70:	ca56                	sw	s5,20(sp)
80000c72:	c85a                	sw	s6,16(sp)
80000c74:	c65e                	sw	s7,12(sp)
80000c76:	c462                	sw	s8,8(sp)
80000c78:	c266                	sw	s9,4(sp)
80000c7a:	8cb6                	mv	s9,a3
80000c7c:	893a                	mv	s2,a4
80000c7e:	00c5e7b3          	or	a5,a1,a2
80000c82:	cfd5                	beqz	a5,80000d3e <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0xdc>
80000c84:	8b2a                	mv	s6,a0
80000c86:	84ae                	mv	s1,a1
80000c88:	8432                	mv	s0,a2
80000c8a:	e611                	bnez	a2,80000c96 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x34>
80000c8c:	ea11                	bnez	a2,80000ca0 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x3e>
80000c8e:	10000793          	li	a5,256
80000c92:	00b7f763          	bgeu	a5,a1,80000ca0 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x3e>
80000c96:	000b2783          	lw	a5,0(s6)
80000c9a:	17e1                	addi	a5,a5,-8
80000c9c:	9bdd                	andi	a5,a5,-9
80000c9e:	cbcd                	beqz	a5,80000d50 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0xee>
80000ca0:	000b2b83          	lw	s7,0(s6)
80000ca4:	41fbda13          	srai	s4,s7,0x1f
80000ca8:	8526                	mv	a0,s1
80000caa:	85a2                	mv	a1,s0
80000cac:	89ca                	mv	s3,s2
80000cae:	0905                	addi	s2,s2,1
80000cb0:	8c2a                	mv	s8,a0
80000cb2:	8aae                	mv	s5,a1
80000cb4:	865e                	mv	a2,s7
80000cb6:	86d2                	mv	a3,s4
80000cb8:	00002097          	auipc	ra,0x2
80000cbc:	334080e7          	jalr	820(ra) # 80002fec <__udivdi3>
80000cc0:	014ae663          	bltu	s5,s4,80000ccc <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x6a>
80000cc4:	ff5a14e3          	bne	s4,s5,80000cac <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x4a>
80000cc8:	ff7c72e3          	bgeu	s8,s7,80000cac <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x4a>
80000ccc:	99e6                	add	s3,s3,s9
80000cce:	80004c37          	lui	s8,0x80004
80000cd2:	814c0c13          	addi	s8,s8,-2028 # 80003814 <__boot_stack__+0xf8003815>
80000cd6:	000b2603          	lw	a2,0(s6)
80000cda:	41f65693          	srai	a3,a2,0x1f
80000cde:	8526                	mv	a0,s1
80000ce0:	85a2                	mv	a1,s0
80000ce2:	00002097          	auipc	ra,0x2
80000ce6:	6ae080e7          	jalr	1710(ra) # 80003390 <__umoddi3>
80000cea:	9562                	add	a0,a0,s8
80000cec:	00054783          	lbu	a5,0(a0)
80000cf0:	00f98023          	sb	a5,0(s3)
80000cf4:	000b2a83          	lw	s5,0(s6)
80000cf8:	41fada13          	srai	s4,s5,0x1f
80000cfc:	8ca6                	mv	s9,s1
80000cfe:	8ba2                	mv	s7,s0
80000d00:	8656                	mv	a2,s5
80000d02:	86d2                	mv	a3,s4
80000d04:	8526                	mv	a0,s1
80000d06:	85a2                	mv	a1,s0
80000d08:	00002097          	auipc	ra,0x2
80000d0c:	2e4080e7          	jalr	740(ra) # 80002fec <__udivdi3>
80000d10:	842e                	mv	s0,a1
80000d12:	84aa                	mv	s1,a0
80000d14:	19fd                	addi	s3,s3,-1
80000d16:	014be663          	bltu	s7,s4,80000d22 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0xc0>
80000d1a:	fb7a1ee3          	bne	s4,s7,80000cd6 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x74>
80000d1e:	fb5cfce3          	bgeu	s9,s5,80000cd6 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x74>
80000d22:	854a                	mv	a0,s2
80000d24:	50b2                	lw	ra,44(sp)
80000d26:	5422                	lw	s0,40(sp)
80000d28:	5492                	lw	s1,36(sp)
80000d2a:	5902                	lw	s2,32(sp)
80000d2c:	49f2                	lw	s3,28(sp)
80000d2e:	4a62                	lw	s4,24(sp)
80000d30:	4ad2                	lw	s5,20(sp)
80000d32:	4b42                	lw	s6,16(sp)
80000d34:	4bb2                	lw	s7,12(sp)
80000d36:	4c22                	lw	s8,8(sp)
80000d38:	4c92                	lw	s9,4(sp)
80000d3a:	6145                	addi	sp,sp,48
80000d3c:	8082                	ret
80000d3e:	00e68cb3          	add	s9,a3,a4
80000d42:	03000793          	li	a5,48
80000d46:	00fc8023          	sb	a5,0(s9)
80000d4a:	00170513          	addi	a0,a4,1
80000d4e:	bfd9                	j	80000d24 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0xc2>
80000d50:	00190713          	addi	a4,s2,1
80000d54:	012c87b3          	add	a5,s9,s2
80000d58:	03000693          	li	a3,48
80000d5c:	00d78023          	sb	a3,0(a5)
80000d60:	000b2683          	lw	a3,0(s6)
80000d64:	47c1                	li	a5,16
80000d66:	00f69963          	bne	a3,a5,80000d78 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x116>
80000d6a:	0909                	addi	s2,s2,2
80000d6c:	9766                	add	a4,a4,s9
80000d6e:	07800793          	li	a5,120
80000d72:	00f70023          	sb	a5,0(a4)
80000d76:	b72d                	j	80000ca0 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x3e>
80000d78:	893a                	mv	s2,a4
80000d7a:	b71d                	j	80000ca0 <_ZN4EPOS1S1U7OStream6llutoaEyPcj+0x3e>

80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>:
80000d7c:	03000793          	li	a5,48
80000d80:	00f60023          	sb	a5,0(a2)
80000d84:	07800793          	li	a5,120
80000d88:	00f600a3          	sb	a5,1(a2)
80000d8c:	00960793          	addi	a5,a2,9
80000d90:	0605                	addi	a2,a2,1
80000d92:	800046b7          	lui	a3,0x80004
80000d96:	81468693          	addi	a3,a3,-2028 # 80003814 <__boot_stack__+0xf8003815>
80000d9a:	00f5f713          	andi	a4,a1,15
80000d9e:	9736                	add	a4,a4,a3
80000da0:	00074703          	lbu	a4,0(a4)
80000da4:	00e78023          	sb	a4,0(a5)
80000da8:	8191                	srli	a1,a1,0x4
80000daa:	17fd                	addi	a5,a5,-1
80000dac:	fec797e3          	bne	a5,a2,80000d9a <_ZN4EPOS1S1U7OStream4ptoaEPKvPc+0x1e>
80000db0:	4529                	li	a0,10
80000db2:	8082                	ret

80000db4 <_ZN4EPOS1SlsERNS0_1U5DebugERKNS0_3CPU7ContextE>:
80000db4:	711d                	addi	sp,sp,-96
80000db6:	ce86                	sw	ra,92(sp)
80000db8:	cca2                	sw	s0,88(sp)
80000dba:	caa6                	sw	s1,84(sp)
80000dbc:	c8ca                	sw	s2,80(sp)
80000dbe:	c6ce                	sw	s3,76(sp)
80000dc0:	892a                	mv	s2,a0
80000dc2:	842e                	mv	s0,a1
80000dc4:	800054b7          	lui	s1,0x80005
80000dc8:	03448993          	addi	s3,s1,52 # 80005034 <__boot_stack__+0xf8005035>
80000dcc:	47c1                	li	a5,16
80000dce:	00f9a023          	sw	a5,0(s3)
80000dd2:	80004537          	lui	a0,0x80004
80000dd6:	82850513          	addi	a0,a0,-2008 # 80003828 <__boot_stack__+0xf8003829>
80000dda:	00000097          	auipc	ra,0x0
80000dde:	d0c080e7          	jalr	-756(ra) # 80000ae6 <_print>
80000de2:	4681                	li	a3,0
80000de4:	860a                	mv	a2,sp
80000de6:	546c                	lw	a1,108(s0)
80000de8:	03448513          	addi	a0,s1,52
80000dec:	00000097          	auipc	ra,0x0
80000df0:	dc2080e7          	jalr	-574(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000df4:	009c                	addi	a5,sp,64
80000df6:	953e                	add	a0,a0,a5
80000df8:	fc050023          	sb	zero,-64(a0)
80000dfc:	850a                	mv	a0,sp
80000dfe:	00000097          	auipc	ra,0x0
80000e02:	ce8080e7          	jalr	-792(ra) # 80000ae6 <_print>
80000e06:	80004537          	lui	a0,0x80004
80000e0a:	83050513          	addi	a0,a0,-2000 # 80003830 <__boot_stack__+0xf8003831>
80000e0e:	00000097          	auipc	ra,0x0
80000e12:	cd8080e7          	jalr	-808(ra) # 80000ae6 <_print>
80000e16:	4681                	li	a3,0
80000e18:	860a                	mv	a2,sp
80000e1a:	542c                	lw	a1,104(s0)
80000e1c:	03448513          	addi	a0,s1,52
80000e20:	00000097          	auipc	ra,0x0
80000e24:	d8e080e7          	jalr	-626(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000e28:	009c                	addi	a5,sp,64
80000e2a:	953e                	add	a0,a0,a5
80000e2c:	fc050023          	sb	zero,-64(a0)
80000e30:	850a                	mv	a0,sp
80000e32:	00000097          	auipc	ra,0x0
80000e36:	cb4080e7          	jalr	-844(ra) # 80000ae6 <_print>
80000e3a:	80004537          	lui	a0,0x80004
80000e3e:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
80000e42:	00000097          	auipc	ra,0x0
80000e46:	ca4080e7          	jalr	-860(ra) # 80000ae6 <_print>
80000e4a:	4681                	li	a3,0
80000e4c:	860a                	mv	a2,sp
80000e4e:	506c                	lw	a1,100(s0)
80000e50:	03448513          	addi	a0,s1,52
80000e54:	00000097          	auipc	ra,0x0
80000e58:	d5a080e7          	jalr	-678(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000e5c:	009c                	addi	a5,sp,64
80000e5e:	953e                	add	a0,a0,a5
80000e60:	fc050023          	sb	zero,-64(a0)
80000e64:	850a                	mv	a0,sp
80000e66:	00000097          	auipc	ra,0x0
80000e6a:	c80080e7          	jalr	-896(ra) # 80000ae6 <_print>
80000e6e:	80004537          	lui	a0,0x80004
80000e72:	84050513          	addi	a0,a0,-1984 # 80003840 <__boot_stack__+0xf8003841>
80000e76:	00000097          	auipc	ra,0x0
80000e7a:	c70080e7          	jalr	-912(ra) # 80000ae6 <_print>
80000e7e:	4681                	li	a3,0
80000e80:	860a                	mv	a2,sp
80000e82:	502c                	lw	a1,96(s0)
80000e84:	03448513          	addi	a0,s1,52
80000e88:	00000097          	auipc	ra,0x0
80000e8c:	d26080e7          	jalr	-730(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000e90:	009c                	addi	a5,sp,64
80000e92:	953e                	add	a0,a0,a5
80000e94:	fc050023          	sb	zero,-64(a0)
80000e98:	850a                	mv	a0,sp
80000e9a:	00000097          	auipc	ra,0x0
80000e9e:	c4c080e7          	jalr	-948(ra) # 80000ae6 <_print>
80000ea2:	80004537          	lui	a0,0x80004
80000ea6:	84850513          	addi	a0,a0,-1976 # 80003848 <__boot_stack__+0xf8003849>
80000eaa:	00000097          	auipc	ra,0x0
80000eae:	c3c080e7          	jalr	-964(ra) # 80000ae6 <_print>
80000eb2:	4681                	li	a3,0
80000eb4:	860a                	mv	a2,sp
80000eb6:	4c6c                	lw	a1,92(s0)
80000eb8:	03448513          	addi	a0,s1,52
80000ebc:	00000097          	auipc	ra,0x0
80000ec0:	cf2080e7          	jalr	-782(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000ec4:	009c                	addi	a5,sp,64
80000ec6:	953e                	add	a0,a0,a5
80000ec8:	fc050023          	sb	zero,-64(a0)
80000ecc:	850a                	mv	a0,sp
80000ece:	00000097          	auipc	ra,0x0
80000ed2:	c18080e7          	jalr	-1000(ra) # 80000ae6 <_print>
80000ed6:	80004537          	lui	a0,0x80004
80000eda:	85050513          	addi	a0,a0,-1968 # 80003850 <__boot_stack__+0xf8003851>
80000ede:	00000097          	auipc	ra,0x0
80000ee2:	c08080e7          	jalr	-1016(ra) # 80000ae6 <_print>
80000ee6:	4681                	li	a3,0
80000ee8:	860a                	mv	a2,sp
80000eea:	4c2c                	lw	a1,88(s0)
80000eec:	03448513          	addi	a0,s1,52
80000ef0:	00000097          	auipc	ra,0x0
80000ef4:	cbe080e7          	jalr	-834(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000ef8:	009c                	addi	a5,sp,64
80000efa:	953e                	add	a0,a0,a5
80000efc:	fc050023          	sb	zero,-64(a0)
80000f00:	850a                	mv	a0,sp
80000f02:	00000097          	auipc	ra,0x0
80000f06:	be4080e7          	jalr	-1052(ra) # 80000ae6 <_print>
80000f0a:	80004537          	lui	a0,0x80004
80000f0e:	85850513          	addi	a0,a0,-1960 # 80003858 <__boot_stack__+0xf8003859>
80000f12:	00000097          	auipc	ra,0x0
80000f16:	bd4080e7          	jalr	-1068(ra) # 80000ae6 <_print>
80000f1a:	4681                	li	a3,0
80000f1c:	860a                	mv	a2,sp
80000f1e:	486c                	lw	a1,84(s0)
80000f20:	03448513          	addi	a0,s1,52
80000f24:	00000097          	auipc	ra,0x0
80000f28:	c8a080e7          	jalr	-886(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000f2c:	009c                	addi	a5,sp,64
80000f2e:	953e                	add	a0,a0,a5
80000f30:	fc050023          	sb	zero,-64(a0)
80000f34:	850a                	mv	a0,sp
80000f36:	00000097          	auipc	ra,0x0
80000f3a:	bb0080e7          	jalr	-1104(ra) # 80000ae6 <_print>
80000f3e:	80004537          	lui	a0,0x80004
80000f42:	86050513          	addi	a0,a0,-1952 # 80003860 <__boot_stack__+0xf8003861>
80000f46:	00000097          	auipc	ra,0x0
80000f4a:	ba0080e7          	jalr	-1120(ra) # 80000ae6 <_print>
80000f4e:	4681                	li	a3,0
80000f50:	860a                	mv	a2,sp
80000f52:	482c                	lw	a1,80(s0)
80000f54:	03448513          	addi	a0,s1,52
80000f58:	00000097          	auipc	ra,0x0
80000f5c:	c56080e7          	jalr	-938(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000f60:	009c                	addi	a5,sp,64
80000f62:	953e                	add	a0,a0,a5
80000f64:	fc050023          	sb	zero,-64(a0)
80000f68:	850a                	mv	a0,sp
80000f6a:	00000097          	auipc	ra,0x0
80000f6e:	b7c080e7          	jalr	-1156(ra) # 80000ae6 <_print>
80000f72:	80004537          	lui	a0,0x80004
80000f76:	86850513          	addi	a0,a0,-1944 # 80003868 <__boot_stack__+0xf8003869>
80000f7a:	00000097          	auipc	ra,0x0
80000f7e:	b6c080e7          	jalr	-1172(ra) # 80000ae6 <_print>
80000f82:	4681                	li	a3,0
80000f84:	860a                	mv	a2,sp
80000f86:	446c                	lw	a1,76(s0)
80000f88:	03448513          	addi	a0,s1,52
80000f8c:	00000097          	auipc	ra,0x0
80000f90:	c22080e7          	jalr	-990(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000f94:	009c                	addi	a5,sp,64
80000f96:	953e                	add	a0,a0,a5
80000f98:	fc050023          	sb	zero,-64(a0)
80000f9c:	850a                	mv	a0,sp
80000f9e:	00000097          	auipc	ra,0x0
80000fa2:	b48080e7          	jalr	-1208(ra) # 80000ae6 <_print>
80000fa6:	80004537          	lui	a0,0x80004
80000faa:	87050513          	addi	a0,a0,-1936 # 80003870 <__boot_stack__+0xf8003871>
80000fae:	00000097          	auipc	ra,0x0
80000fb2:	b38080e7          	jalr	-1224(ra) # 80000ae6 <_print>
80000fb6:	4681                	li	a3,0
80000fb8:	860a                	mv	a2,sp
80000fba:	442c                	lw	a1,72(s0)
80000fbc:	03448513          	addi	a0,s1,52
80000fc0:	00000097          	auipc	ra,0x0
80000fc4:	bee080e7          	jalr	-1042(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000fc8:	009c                	addi	a5,sp,64
80000fca:	953e                	add	a0,a0,a5
80000fcc:	fc050023          	sb	zero,-64(a0)
80000fd0:	850a                	mv	a0,sp
80000fd2:	00000097          	auipc	ra,0x0
80000fd6:	b14080e7          	jalr	-1260(ra) # 80000ae6 <_print>
80000fda:	80004537          	lui	a0,0x80004
80000fde:	87850513          	addi	a0,a0,-1928 # 80003878 <__boot_stack__+0xf8003879>
80000fe2:	00000097          	auipc	ra,0x0
80000fe6:	b04080e7          	jalr	-1276(ra) # 80000ae6 <_print>
80000fea:	4681                	li	a3,0
80000fec:	860a                	mv	a2,sp
80000fee:	406c                	lw	a1,68(s0)
80000ff0:	03448513          	addi	a0,s1,52
80000ff4:	00000097          	auipc	ra,0x0
80000ff8:	bba080e7          	jalr	-1094(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000ffc:	009c                	addi	a5,sp,64
80000ffe:	953e                	add	a0,a0,a5
80001000:	fc050023          	sb	zero,-64(a0)
80001004:	850a                	mv	a0,sp
80001006:	00000097          	auipc	ra,0x0
8000100a:	ae0080e7          	jalr	-1312(ra) # 80000ae6 <_print>
8000100e:	80004537          	lui	a0,0x80004
80001012:	88050513          	addi	a0,a0,-1920 # 80003880 <__boot_stack__+0xf8003881>
80001016:	00000097          	auipc	ra,0x0
8000101a:	ad0080e7          	jalr	-1328(ra) # 80000ae6 <_print>
8000101e:	4681                	li	a3,0
80001020:	860a                	mv	a2,sp
80001022:	402c                	lw	a1,64(s0)
80001024:	03448513          	addi	a0,s1,52
80001028:	00000097          	auipc	ra,0x0
8000102c:	b86080e7          	jalr	-1146(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001030:	009c                	addi	a5,sp,64
80001032:	953e                	add	a0,a0,a5
80001034:	fc050023          	sb	zero,-64(a0)
80001038:	850a                	mv	a0,sp
8000103a:	00000097          	auipc	ra,0x0
8000103e:	aac080e7          	jalr	-1364(ra) # 80000ae6 <_print>
80001042:	80004537          	lui	a0,0x80004
80001046:	88850513          	addi	a0,a0,-1912 # 80003888 <__boot_stack__+0xf8003889>
8000104a:	00000097          	auipc	ra,0x0
8000104e:	a9c080e7          	jalr	-1380(ra) # 80000ae6 <_print>
80001052:	4681                	li	a3,0
80001054:	860a                	mv	a2,sp
80001056:	5c4c                	lw	a1,60(s0)
80001058:	03448513          	addi	a0,s1,52
8000105c:	00000097          	auipc	ra,0x0
80001060:	b52080e7          	jalr	-1198(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001064:	009c                	addi	a5,sp,64
80001066:	953e                	add	a0,a0,a5
80001068:	fc050023          	sb	zero,-64(a0)
8000106c:	850a                	mv	a0,sp
8000106e:	00000097          	auipc	ra,0x0
80001072:	a78080e7          	jalr	-1416(ra) # 80000ae6 <_print>
80001076:	80004537          	lui	a0,0x80004
8000107a:	89050513          	addi	a0,a0,-1904 # 80003890 <__boot_stack__+0xf8003891>
8000107e:	00000097          	auipc	ra,0x0
80001082:	a68080e7          	jalr	-1432(ra) # 80000ae6 <_print>
80001086:	4681                	li	a3,0
80001088:	860a                	mv	a2,sp
8000108a:	5c0c                	lw	a1,56(s0)
8000108c:	03448513          	addi	a0,s1,52
80001090:	00000097          	auipc	ra,0x0
80001094:	b1e080e7          	jalr	-1250(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001098:	009c                	addi	a5,sp,64
8000109a:	953e                	add	a0,a0,a5
8000109c:	fc050023          	sb	zero,-64(a0)
800010a0:	850a                	mv	a0,sp
800010a2:	00000097          	auipc	ra,0x0
800010a6:	a44080e7          	jalr	-1468(ra) # 80000ae6 <_print>
800010aa:	80004537          	lui	a0,0x80004
800010ae:	89850513          	addi	a0,a0,-1896 # 80003898 <__boot_stack__+0xf8003899>
800010b2:	00000097          	auipc	ra,0x0
800010b6:	a34080e7          	jalr	-1484(ra) # 80000ae6 <_print>
800010ba:	4681                	li	a3,0
800010bc:	860a                	mv	a2,sp
800010be:	584c                	lw	a1,52(s0)
800010c0:	03448513          	addi	a0,s1,52
800010c4:	00000097          	auipc	ra,0x0
800010c8:	aea080e7          	jalr	-1302(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800010cc:	009c                	addi	a5,sp,64
800010ce:	953e                	add	a0,a0,a5
800010d0:	fc050023          	sb	zero,-64(a0)
800010d4:	850a                	mv	a0,sp
800010d6:	00000097          	auipc	ra,0x0
800010da:	a10080e7          	jalr	-1520(ra) # 80000ae6 <_print>
800010de:	80004537          	lui	a0,0x80004
800010e2:	8a050513          	addi	a0,a0,-1888 # 800038a0 <__boot_stack__+0xf80038a1>
800010e6:	00000097          	auipc	ra,0x0
800010ea:	a00080e7          	jalr	-1536(ra) # 80000ae6 <_print>
800010ee:	4681                	li	a3,0
800010f0:	860a                	mv	a2,sp
800010f2:	580c                	lw	a1,48(s0)
800010f4:	03448513          	addi	a0,s1,52
800010f8:	00000097          	auipc	ra,0x0
800010fc:	ab6080e7          	jalr	-1354(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001100:	009c                	addi	a5,sp,64
80001102:	953e                	add	a0,a0,a5
80001104:	fc050023          	sb	zero,-64(a0)
80001108:	850a                	mv	a0,sp
8000110a:	00000097          	auipc	ra,0x0
8000110e:	9dc080e7          	jalr	-1572(ra) # 80000ae6 <_print>
80001112:	80004537          	lui	a0,0x80004
80001116:	8a850513          	addi	a0,a0,-1880 # 800038a8 <__boot_stack__+0xf80038a9>
8000111a:	00000097          	auipc	ra,0x0
8000111e:	9cc080e7          	jalr	-1588(ra) # 80000ae6 <_print>
80001122:	4681                	li	a3,0
80001124:	860a                	mv	a2,sp
80001126:	544c                	lw	a1,44(s0)
80001128:	03448513          	addi	a0,s1,52
8000112c:	00000097          	auipc	ra,0x0
80001130:	a82080e7          	jalr	-1406(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001134:	009c                	addi	a5,sp,64
80001136:	953e                	add	a0,a0,a5
80001138:	fc050023          	sb	zero,-64(a0)
8000113c:	850a                	mv	a0,sp
8000113e:	00000097          	auipc	ra,0x0
80001142:	9a8080e7          	jalr	-1624(ra) # 80000ae6 <_print>
80001146:	80004537          	lui	a0,0x80004
8000114a:	8b050513          	addi	a0,a0,-1872 # 800038b0 <__boot_stack__+0xf80038b1>
8000114e:	00000097          	auipc	ra,0x0
80001152:	998080e7          	jalr	-1640(ra) # 80000ae6 <_print>
80001156:	4681                	li	a3,0
80001158:	860a                	mv	a2,sp
8000115a:	540c                	lw	a1,40(s0)
8000115c:	03448513          	addi	a0,s1,52
80001160:	00000097          	auipc	ra,0x0
80001164:	a4e080e7          	jalr	-1458(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001168:	009c                	addi	a5,sp,64
8000116a:	953e                	add	a0,a0,a5
8000116c:	fc050023          	sb	zero,-64(a0)
80001170:	850a                	mv	a0,sp
80001172:	00000097          	auipc	ra,0x0
80001176:	974080e7          	jalr	-1676(ra) # 80000ae6 <_print>
8000117a:	80004537          	lui	a0,0x80004
8000117e:	8b850513          	addi	a0,a0,-1864 # 800038b8 <__boot_stack__+0xf80038b9>
80001182:	00000097          	auipc	ra,0x0
80001186:	964080e7          	jalr	-1692(ra) # 80000ae6 <_print>
8000118a:	4681                	li	a3,0
8000118c:	860a                	mv	a2,sp
8000118e:	504c                	lw	a1,36(s0)
80001190:	03448513          	addi	a0,s1,52
80001194:	00000097          	auipc	ra,0x0
80001198:	a1a080e7          	jalr	-1510(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000119c:	009c                	addi	a5,sp,64
8000119e:	953e                	add	a0,a0,a5
800011a0:	fc050023          	sb	zero,-64(a0)
800011a4:	850a                	mv	a0,sp
800011a6:	00000097          	auipc	ra,0x0
800011aa:	940080e7          	jalr	-1728(ra) # 80000ae6 <_print>
800011ae:	80004537          	lui	a0,0x80004
800011b2:	8c050513          	addi	a0,a0,-1856 # 800038c0 <__boot_stack__+0xf80038c1>
800011b6:	00000097          	auipc	ra,0x0
800011ba:	930080e7          	jalr	-1744(ra) # 80000ae6 <_print>
800011be:	4681                	li	a3,0
800011c0:	860a                	mv	a2,sp
800011c2:	500c                	lw	a1,32(s0)
800011c4:	03448513          	addi	a0,s1,52
800011c8:	00000097          	auipc	ra,0x0
800011cc:	9e6080e7          	jalr	-1562(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800011d0:	009c                	addi	a5,sp,64
800011d2:	953e                	add	a0,a0,a5
800011d4:	fc050023          	sb	zero,-64(a0)
800011d8:	850a                	mv	a0,sp
800011da:	00000097          	auipc	ra,0x0
800011de:	90c080e7          	jalr	-1780(ra) # 80000ae6 <_print>
800011e2:	80004537          	lui	a0,0x80004
800011e6:	8c850513          	addi	a0,a0,-1848 # 800038c8 <__boot_stack__+0xf80038c9>
800011ea:	00000097          	auipc	ra,0x0
800011ee:	8fc080e7          	jalr	-1796(ra) # 80000ae6 <_print>
800011f2:	4681                	li	a3,0
800011f4:	860a                	mv	a2,sp
800011f6:	4c4c                	lw	a1,28(s0)
800011f8:	03448513          	addi	a0,s1,52
800011fc:	00000097          	auipc	ra,0x0
80001200:	9b2080e7          	jalr	-1614(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001204:	009c                	addi	a5,sp,64
80001206:	953e                	add	a0,a0,a5
80001208:	fc050023          	sb	zero,-64(a0)
8000120c:	850a                	mv	a0,sp
8000120e:	00000097          	auipc	ra,0x0
80001212:	8d8080e7          	jalr	-1832(ra) # 80000ae6 <_print>
80001216:	80004537          	lui	a0,0x80004
8000121a:	8d050513          	addi	a0,a0,-1840 # 800038d0 <__boot_stack__+0xf80038d1>
8000121e:	00000097          	auipc	ra,0x0
80001222:	8c8080e7          	jalr	-1848(ra) # 80000ae6 <_print>
80001226:	4681                	li	a3,0
80001228:	860a                	mv	a2,sp
8000122a:	4c0c                	lw	a1,24(s0)
8000122c:	03448513          	addi	a0,s1,52
80001230:	00000097          	auipc	ra,0x0
80001234:	97e080e7          	jalr	-1666(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001238:	009c                	addi	a5,sp,64
8000123a:	953e                	add	a0,a0,a5
8000123c:	fc050023          	sb	zero,-64(a0)
80001240:	850a                	mv	a0,sp
80001242:	00000097          	auipc	ra,0x0
80001246:	8a4080e7          	jalr	-1884(ra) # 80000ae6 <_print>
8000124a:	80004537          	lui	a0,0x80004
8000124e:	8d850513          	addi	a0,a0,-1832 # 800038d8 <__boot_stack__+0xf80038d9>
80001252:	00000097          	auipc	ra,0x0
80001256:	894080e7          	jalr	-1900(ra) # 80000ae6 <_print>
8000125a:	4681                	li	a3,0
8000125c:	860a                	mv	a2,sp
8000125e:	484c                	lw	a1,20(s0)
80001260:	03448513          	addi	a0,s1,52
80001264:	00000097          	auipc	ra,0x0
80001268:	94a080e7          	jalr	-1718(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000126c:	009c                	addi	a5,sp,64
8000126e:	953e                	add	a0,a0,a5
80001270:	fc050023          	sb	zero,-64(a0)
80001274:	850a                	mv	a0,sp
80001276:	00000097          	auipc	ra,0x0
8000127a:	870080e7          	jalr	-1936(ra) # 80000ae6 <_print>
8000127e:	80004537          	lui	a0,0x80004
80001282:	8e050513          	addi	a0,a0,-1824 # 800038e0 <__boot_stack__+0xf80038e1>
80001286:	00000097          	auipc	ra,0x0
8000128a:	860080e7          	jalr	-1952(ra) # 80000ae6 <_print>
8000128e:	4681                	li	a3,0
80001290:	860a                	mv	a2,sp
80001292:	480c                	lw	a1,16(s0)
80001294:	03448513          	addi	a0,s1,52
80001298:	00000097          	auipc	ra,0x0
8000129c:	916080e7          	jalr	-1770(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800012a0:	009c                	addi	a5,sp,64
800012a2:	953e                	add	a0,a0,a5
800012a4:	fc050023          	sb	zero,-64(a0)
800012a8:	850a                	mv	a0,sp
800012aa:	00000097          	auipc	ra,0x0
800012ae:	83c080e7          	jalr	-1988(ra) # 80000ae6 <_print>
800012b2:	80004537          	lui	a0,0x80004
800012b6:	8e850513          	addi	a0,a0,-1816 # 800038e8 <__boot_stack__+0xf80038e9>
800012ba:	00000097          	auipc	ra,0x0
800012be:	82c080e7          	jalr	-2004(ra) # 80000ae6 <_print>
800012c2:	4681                	li	a3,0
800012c4:	860a                	mv	a2,sp
800012c6:	444c                	lw	a1,12(s0)
800012c8:	03448513          	addi	a0,s1,52
800012cc:	00000097          	auipc	ra,0x0
800012d0:	8e2080e7          	jalr	-1822(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800012d4:	009c                	addi	a5,sp,64
800012d6:	953e                	add	a0,a0,a5
800012d8:	fc050023          	sb	zero,-64(a0)
800012dc:	850a                	mv	a0,sp
800012de:	00000097          	auipc	ra,0x0
800012e2:	808080e7          	jalr	-2040(ra) # 80000ae6 <_print>
800012e6:	80004537          	lui	a0,0x80004
800012ea:	8f050513          	addi	a0,a0,-1808 # 800038f0 <__boot_stack__+0xf80038f1>
800012ee:	fffff097          	auipc	ra,0xfffff
800012f2:	7f8080e7          	jalr	2040(ra) # 80000ae6 <_print>
800012f6:	4681                	li	a3,0
800012f8:	860a                	mv	a2,sp
800012fa:	440c                	lw	a1,8(s0)
800012fc:	03448513          	addi	a0,s1,52
80001300:	00000097          	auipc	ra,0x0
80001304:	8ae080e7          	jalr	-1874(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001308:	009c                	addi	a5,sp,64
8000130a:	953e                	add	a0,a0,a5
8000130c:	fc050023          	sb	zero,-64(a0)
80001310:	850a                	mv	a0,sp
80001312:	fffff097          	auipc	ra,0xfffff
80001316:	7d4080e7          	jalr	2004(ra) # 80000ae6 <_print>
8000131a:	80004537          	lui	a0,0x80004
8000131e:	8f850513          	addi	a0,a0,-1800 # 800038f8 <__boot_stack__+0xf80038f9>
80001322:	fffff097          	auipc	ra,0xfffff
80001326:	7c4080e7          	jalr	1988(ra) # 80000ae6 <_print>
8000132a:	4681                	li	a3,0
8000132c:	860a                	mv	a2,sp
8000132e:	404c                	lw	a1,4(s0)
80001330:	03448513          	addi	a0,s1,52
80001334:	00000097          	auipc	ra,0x0
80001338:	87a080e7          	jalr	-1926(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000133c:	009c                	addi	a5,sp,64
8000133e:	953e                	add	a0,a0,a5
80001340:	fc050023          	sb	zero,-64(a0)
80001344:	850a                	mv	a0,sp
80001346:	fffff097          	auipc	ra,0xfffff
8000134a:	7a0080e7          	jalr	1952(ra) # 80000ae6 <_print>
8000134e:	80004537          	lui	a0,0x80004
80001352:	90050513          	addi	a0,a0,-1792 # 80003900 <__boot_stack__+0xf8003901>
80001356:	fffff097          	auipc	ra,0xfffff
8000135a:	790080e7          	jalr	1936(ra) # 80000ae6 <_print>
8000135e:	860a                	mv	a2,sp
80001360:	85a2                	mv	a1,s0
80001362:	03448513          	addi	a0,s1,52
80001366:	00000097          	auipc	ra,0x0
8000136a:	a16080e7          	jalr	-1514(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
8000136e:	009c                	addi	a5,sp,64
80001370:	953e                	add	a0,a0,a5
80001372:	fc050023          	sb	zero,-64(a0)
80001376:	850a                	mv	a0,sp
80001378:	fffff097          	auipc	ra,0xfffff
8000137c:	76e080e7          	jalr	1902(ra) # 80000ae6 <_print>
80001380:	80004537          	lui	a0,0x80004
80001384:	90850513          	addi	a0,a0,-1784 # 80003908 <__boot_stack__+0xf8003909>
80001388:	fffff097          	auipc	ra,0xfffff
8000138c:	75e080e7          	jalr	1886(ra) # 80000ae6 <_print>
80001390:	4681                	li	a3,0
80001392:	860a                	mv	a2,sp
80001394:	400c                	lw	a1,0(s0)
80001396:	03448513          	addi	a0,s1,52
8000139a:	00000097          	auipc	ra,0x0
8000139e:	814080e7          	jalr	-2028(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800013a2:	009c                	addi	a5,sp,64
800013a4:	953e                	add	a0,a0,a5
800013a6:	fc050023          	sb	zero,-64(a0)
800013aa:	850a                	mv	a0,sp
800013ac:	fffff097          	auipc	ra,0xfffff
800013b0:	73a080e7          	jalr	1850(ra) # 80000ae6 <_print>
800013b4:	80004537          	lui	a0,0x80004
800013b8:	91050513          	addi	a0,a0,-1776 # 80003910 <__boot_stack__+0xf8003911>
800013bc:	fffff097          	auipc	ra,0xfffff
800013c0:	72a080e7          	jalr	1834(ra) # 80000ae6 <_print>
800013c4:	4681                	li	a3,0
800013c6:	860a                	mv	a2,sp
800013c8:	582c                	lw	a1,112(s0)
800013ca:	03448513          	addi	a0,s1,52
800013ce:	fffff097          	auipc	ra,0xfffff
800013d2:	7e0080e7          	jalr	2016(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800013d6:	009c                	addi	a5,sp,64
800013d8:	953e                	add	a0,a0,a5
800013da:	fc050023          	sb	zero,-64(a0)
800013de:	850a                	mv	a0,sp
800013e0:	fffff097          	auipc	ra,0xfffff
800013e4:	706080e7          	jalr	1798(ra) # 80000ae6 <_print>
800013e8:	80004537          	lui	a0,0x80004
800013ec:	91850513          	addi	a0,a0,-1768 # 80003918 <__boot_stack__+0xf8003919>
800013f0:	fffff097          	auipc	ra,0xfffff
800013f4:	6f6080e7          	jalr	1782(ra) # 80000ae6 <_print>
800013f8:	47a9                	li	a5,10
800013fa:	00f9a023          	sw	a5,0(s3)
800013fe:	854a                	mv	a0,s2
80001400:	40f6                	lw	ra,92(sp)
80001402:	4466                	lw	s0,88(sp)
80001404:	44d6                	lw	s1,84(sp)
80001406:	4946                	lw	s2,80(sp)
80001408:	49b6                	lw	s3,76(sp)
8000140a:	6125                	addi	sp,sp,96
8000140c:	8082                	ret

8000140e <_ZN4EPOS1S7Machine6rebootEv>:
8000140e:	715d                	addi	sp,sp,-80
80001410:	c686                	sw	ra,76(sp)
80001412:	c4a2                	sw	s0,72(sp)
80001414:	c2a6                	sw	s1,68(sp)
80001416:	c0ca                	sw	s2,64(sp)
80001418:	c0102473          	rdtime	s0
8000141c:	80004537          	lui	a0,0x80004
80001420:	91c50513          	addi	a0,a0,-1764 # 8000391c <__boot_stack__+0xf800391d>
80001424:	fffff097          	auipc	ra,0xfffff
80001428:	6c2080e7          	jalr	1730(ra) # 80000ae6 <_print>
8000142c:	4701                	li	a4,0
8000142e:	868a                	mv	a3,sp
80001430:	85a2                	mv	a1,s0
80001432:	4601                	li	a2,0
80001434:	80005437          	lui	s0,0x80005
80001438:	03440513          	addi	a0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
8000143c:	00000097          	auipc	ra,0x0
80001440:	826080e7          	jalr	-2010(ra) # 80000c62 <_ZN4EPOS1S1U7OStream6llutoaEyPcj>
80001444:	009c                	addi	a5,sp,64
80001446:	953e                	add	a0,a0,a5
80001448:	fc050023          	sb	zero,-64(a0)
8000144c:	850a                	mv	a0,sp
8000144e:	fffff097          	auipc	ra,0xfffff
80001452:	698080e7          	jalr	1688(ra) # 80000ae6 <_print>
80001456:	80003937          	lui	s2,0x80003
8000145a:	76c90513          	addi	a0,s2,1900 # 8000376c <__boot_stack__+0xf800376d>
8000145e:	fffff097          	auipc	ra,0xfffff
80001462:	688080e7          	jalr	1672(ra) # 80000ae6 <_print>
80001466:	03440413          	addi	s0,s0,52
8000146a:	44a9                	li	s1,10
8000146c:	c004                	sw	s1,0(s0)
8000146e:	80004537          	lui	a0,0x80004
80001472:	93050513          	addi	a0,a0,-1744 # 80003930 <__boot_stack__+0xf8003931>
80001476:	fffff097          	auipc	ra,0xfffff
8000147a:	670080e7          	jalr	1648(ra) # 80000ae6 <_print>
8000147e:	76c90513          	addi	a0,s2,1900
80001482:	fffff097          	auipc	ra,0xfffff
80001486:	664080e7          	jalr	1636(ra) # 80000ae6 <_print>
8000148a:	c004                	sw	s1,0(s0)
8000148c:	10500073          	wfi
80001490:	40b6                	lw	ra,76(sp)
80001492:	4426                	lw	s0,72(sp)
80001494:	4496                	lw	s1,68(sp)
80001496:	4906                	lw	s2,64(sp)
80001498:	6161                	addi	sp,sp,80
8000149a:	8082                	ret

8000149c <_ZN4EPOS1S6Thread20constructor_prologueEj>:
8000149c:	1141                	addi	sp,sp,-16
8000149e:	c606                	sw	ra,12(sp)
800014a0:	c422                	sw	s0,8(sp)
800014a2:	842a                	mv	s0,a0
800014a4:	4781                	li	a5,0
800014a6:	30479073          	csrw	mie,a5
800014aa:	800057b7          	lui	a5,0x80005
800014ae:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
800014b2:	4398                	lw	a4,0(a5)
800014b4:	0705                	addi	a4,a4,1
800014b6:	c398                	sw	a4,0(a5)
800014b8:	800057b7          	lui	a5,0x80005
800014bc:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
800014c0:	47d8                	lw	a4,12(a5)
800014c2:	01450613          	addi	a2,a0,20
800014c6:	47dc                	lw	a5,12(a5)
800014c8:	cbc9                	beqz	a5,8000155a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xbe>
800014ca:	800057b7          	lui	a5,0x80005
800014ce:	0847a503          	lw	a0,132(a5) # 80005084 <__boot_stack__+0xf8005085>
800014d2:	ed01                	bnez	a0,800014ea <_ZN4EPOS1S6Thread20constructor_prologueEj+0x4e>
800014d4:	02042423          	sw	zero,40(s0)
800014d8:	02042623          	sw	zero,44(s0)
800014dc:	08478793          	addi	a5,a5,132
800014e0:	c3d0                	sw	a2,4(a5)
800014e2:	c790                	sw	a2,8(a5)
800014e4:	4705                	li	a4,1
800014e6:	c398                	sw	a4,0(a5)
800014e8:	a8b5                	j	80001564 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc8>
800014ea:	800057b7          	lui	a5,0x80005
800014ee:	0887a803          	lw	a6,136(a5) # 80005088 <__boot_stack__+0xf8005089>
800014f2:	87c2                	mv	a5,a6
800014f4:	a011                	j	800014f8 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x5c>
800014f6:	87ba                	mv	a5,a4
800014f8:	43d4                	lw	a3,4(a5)
800014fa:	4c18                	lw	a4,24(s0)
800014fc:	00d74463          	blt	a4,a3,80001504 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x68>
80001500:	4f98                	lw	a4,24(a5)
80001502:	fb75                	bnez	a4,800014f6 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x5a>
80001504:	43d4                	lw	a3,4(a5)
80001506:	4c18                	lw	a4,24(s0)
80001508:	00d75e63          	bge	a4,a3,80001524 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x88>
8000150c:	4bd8                	lw	a4,20(a5)
8000150e:	cb05                	beqz	a4,8000153e <_ZN4EPOS1S6Thread20constructor_prologueEj+0xa2>
80001510:	cf10                	sw	a2,24(a4)
80001512:	cbd0                	sw	a2,20(a5)
80001514:	d418                	sw	a4,40(s0)
80001516:	d45c                	sw	a5,44(s0)
80001518:	0505                	addi	a0,a0,1
8000151a:	800057b7          	lui	a5,0x80005
8000151e:	08a7a223          	sw	a0,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001522:	a089                	j	80001564 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc8>
80001524:	800057b7          	lui	a5,0x80005
80001528:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
8000152c:	4798                	lw	a4,8(a5)
8000152e:	cf10                	sw	a2,24(a4)
80001530:	d418                	sw	a4,40(s0)
80001532:	02042623          	sw	zero,44(s0)
80001536:	c790                	sw	a2,8(a5)
80001538:	0505                	addi	a0,a0,1
8000153a:	c388                	sw	a0,0(a5)
8000153c:	a025                	j	80001564 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc8>
8000153e:	02042423          	sw	zero,40(s0)
80001542:	03042623          	sw	a6,44(s0)
80001546:	00c82a23          	sw	a2,20(a6)
8000154a:	800057b7          	lui	a5,0x80005
8000154e:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001552:	c3d0                	sw	a2,4(a5)
80001554:	0505                	addi	a0,a0,1
80001556:	c388                	sw	a0,0(a5)
80001558:	a031                	j	80001564 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc8>
8000155a:	800057b7          	lui	a5,0x80005
8000155e:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001562:	c7d0                	sw	a2,12(a5)
80001564:	800057b7          	lui	a5,0x80005
80001568:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
8000156c:	c9c1                	beqz	a1,800015fc <_ZN4EPOS1S6Thread20constructor_prologueEj+0x160>
8000156e:	0035f793          	andi	a5,a1,3
80001572:	c789                	beqz	a5,8000157c <_ZN4EPOS1S6Thread20constructor_prologueEj+0xe0>
80001574:	0585                	addi	a1,a1,1
80001576:	0035f793          	andi	a5,a1,3
8000157a:	ffed                	bnez	a5,80001574 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xd8>
8000157c:	0591                	addi	a1,a1,4
8000157e:	47c1                	li	a5,16
80001580:	00f5f363          	bgeu	a1,a5,80001586 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xea>
80001584:	45c1                	li	a1,16
80001586:	415c                	lw	a5,4(a0)
80001588:	cb91                	beqz	a5,8000159c <_ZN4EPOS1S6Thread20constructor_prologueEj+0x100>
8000158a:	01058693          	addi	a3,a1,16 # 44010 <_vector_table-0x7ffbbff0>
8000158e:	43d8                	lw	a4,4(a5)
80001590:	06d77863          	bgeu	a4,a3,80001600 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x164>
80001594:	06e58663          	beq	a1,a4,80001600 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x164>
80001598:	47dc                	lw	a5,12(a5)
8000159a:	fbf5                	bnez	a5,8000158e <_ZN4EPOS1S6Thread20constructor_prologueEj+0xf2>
8000159c:	00002097          	auipc	ra,0x2
800015a0:	a3e080e7          	jalr	-1474(ra) # 80002fda <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
800015a4:	4701                	li	a4,0
800015a6:	a895                	j	8000161a <_ZN4EPOS1S6Thread20constructor_prologueEj+0x17e>
800015a8:	4118                	lw	a4,0(a0)
800015aa:	4685                	li	a3,1
800015ac:	00d70d63          	beq	a4,a3,800015c6 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x12a>
800015b0:	4790                	lw	a2,8(a5)
800015b2:	c20d                	beqz	a2,800015d4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x138>
800015b4:	47d4                	lw	a3,12(a5)
800015b6:	ca8d                	beqz	a3,800015e8 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x14c>
800015b8:	c654                	sw	a3,12(a2)
800015ba:	4798                	lw	a4,8(a5)
800015bc:	c698                	sw	a4,8(a3)
800015be:	4118                	lw	a4,0(a0)
800015c0:	177d                	addi	a4,a4,-1
800015c2:	c118                	sw	a4,0(a0)
800015c4:	a0a9                	j	8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015c6:	00052223          	sw	zero,4(a0)
800015ca:	00052423          	sw	zero,8(a0)
800015ce:	00052023          	sw	zero,0(a0)
800015d2:	a835                	j	8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015d4:	cf0d                	beqz	a4,8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015d6:	4158                	lw	a4,4(a0)
800015d8:	4758                	lw	a4,12(a4)
800015da:	c158                	sw	a4,4(a0)
800015dc:	00072423          	sw	zero,8(a4)
800015e0:	4118                	lw	a4,0(a0)
800015e2:	177d                	addi	a4,a4,-1
800015e4:	c118                	sw	a4,0(a0)
800015e6:	a025                	j	8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015e8:	c31d                	beqz	a4,8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015ea:	4518                	lw	a4,8(a0)
800015ec:	4718                	lw	a4,8(a4)
800015ee:	c518                	sw	a4,8(a0)
800015f0:	00072623          	sw	zero,12(a4)
800015f4:	4118                	lw	a4,0(a0)
800015f6:	177d                	addi	a4,a4,-1
800015f8:	c118                	sw	a4,0(a0)
800015fa:	a811                	j	8000160e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x172>
800015fc:	4701                	li	a4,0
800015fe:	a831                	j	8000161a <_ZN4EPOS1S6Thread20constructor_prologueEj+0x17e>
80001600:	8f0d                	sub	a4,a4,a1
80001602:	c3d8                	sw	a4,4(a5)
80001604:	4558                	lw	a4,12(a0)
80001606:	8f0d                	sub	a4,a4,a1
80001608:	c558                	sw	a4,12(a0)
8000160a:	43d8                	lw	a4,4(a5)
8000160c:	df51                	beqz	a4,800015a8 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x10c>
8000160e:	4398                	lw	a4,0(a5)
80001610:	43dc                	lw	a5,4(a5)
80001612:	97ba                	add	a5,a5,a4
80001614:	00478713          	addi	a4,a5,4
80001618:	c38c                	sw	a1,0(a5)
8000161a:	c018                	sw	a4,0(s0)
8000161c:	40b2                	lw	ra,12(sp)
8000161e:	4422                	lw	s0,8(sp)
80001620:	0141                	addi	sp,sp,16
80001622:	8082                	ret

80001624 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>:
80001624:	0cb50963          	beq	a0,a1,800016f6 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0xd2>
80001628:	715d                	addi	sp,sp,-80
8000162a:	c686                	sw	ra,76(sp)
8000162c:	c4a2                	sw	s0,72(sp)
8000162e:	c2a6                	sw	s1,68(sp)
80001630:	c0ca                	sw	s2,64(sp)
80001632:	842a                	mv	s0,a0
80001634:	84ae                	mv	s1,a1
80001636:	451c                	lw	a5,8(a0)
80001638:	e399                	bnez	a5,8000163e <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x1a>
8000163a:	4785                	li	a5,1
8000163c:	c51c                	sw	a5,8(a0)
8000163e:	0004a423          	sw	zero,8(s1)
80001642:	80004537          	lui	a0,0x80004
80001646:	94450513          	addi	a0,a0,-1724 # 80003944 <__boot_stack__+0xf8003945>
8000164a:	fffff097          	auipc	ra,0xfffff
8000164e:	49c080e7          	jalr	1180(ra) # 80000ae6 <_print>
80001652:	860a                	mv	a2,sp
80001654:	85a2                	mv	a1,s0
80001656:	80005937          	lui	s2,0x80005
8000165a:	03490513          	addi	a0,s2,52 # 80005034 <__boot_stack__+0xf8005035>
8000165e:	fffff097          	auipc	ra,0xfffff
80001662:	71e080e7          	jalr	1822(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001666:	009c                	addi	a5,sp,64
80001668:	953e                	add	a0,a0,a5
8000166a:	fc050023          	sb	zero,-64(a0)
8000166e:	850a                	mv	a0,sp
80001670:	fffff097          	auipc	ra,0xfffff
80001674:	476080e7          	jalr	1142(ra) # 80000ae6 <_print>
80001678:	80004537          	lui	a0,0x80004
8000167c:	95c50513          	addi	a0,a0,-1700 # 8000395c <__boot_stack__+0xf800395d>
80001680:	fffff097          	auipc	ra,0xfffff
80001684:	466080e7          	jalr	1126(ra) # 80000ae6 <_print>
80001688:	860a                	mv	a2,sp
8000168a:	85a6                	mv	a1,s1
8000168c:	03490513          	addi	a0,s2,52
80001690:	fffff097          	auipc	ra,0xfffff
80001694:	6ec080e7          	jalr	1772(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001698:	009c                	addi	a5,sp,64
8000169a:	953e                	add	a0,a0,a5
8000169c:	fc050023          	sb	zero,-64(a0)
800016a0:	850a                	mv	a0,sp
800016a2:	fffff097          	auipc	ra,0xfffff
800016a6:	444080e7          	jalr	1092(ra) # 80000ae6 <_print>
800016aa:	80004537          	lui	a0,0x80004
800016ae:	9d050513          	addi	a0,a0,-1584 # 800039d0 <__boot_stack__+0xf80039d1>
800016b2:	fffff097          	auipc	ra,0xfffff
800016b6:	434080e7          	jalr	1076(ra) # 80000ae6 <_print>
800016ba:	80003537          	lui	a0,0x80003
800016be:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
800016c2:	fffff097          	auipc	ra,0xfffff
800016c6:	424080e7          	jalr	1060(ra) # 80000ae6 <_print>
800016ca:	47a9                	li	a5,10
800016cc:	02f92a23          	sw	a5,52(s2)
800016d0:	405c                	lw	a5,4(s0)
800016d2:	40dc                	lw	a5,4(s1)
800016d4:	40cc                	lw	a1,4(s1)
800016d6:	00440513          	addi	a0,s0,4
800016da:	00001097          	auipc	ra,0x1
800016de:	7d8080e7          	jalr	2008(ra) # 80002eb2 <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>
800016e2:	08800793          	li	a5,136
800016e6:	30479073          	csrw	mie,a5
800016ea:	40b6                	lw	ra,76(sp)
800016ec:	4426                	lw	s0,72(sp)
800016ee:	4496                	lw	s1,68(sp)
800016f0:	4906                	lw	s2,64(sp)
800016f2:	6161                	addi	sp,sp,80
800016f4:	8082                	ret
800016f6:	08800793          	li	a5,136
800016fa:	30479073          	csrw	mie,a5
800016fe:	8082                	ret

80001700 <_ZN4EPOS1S6Thread10rescheduleEv>:
80001700:	715d                	addi	sp,sp,-80
80001702:	c686                	sw	ra,76(sp)
80001704:	c4a2                	sw	s0,72(sp)
80001706:	c2a6                	sw	s1,68(sp)
80001708:	80004537          	lui	a0,0x80004
8000170c:	96450513          	addi	a0,a0,-1692 # 80003964 <__boot_stack__+0xf8003965>
80001710:	fffff097          	auipc	ra,0xfffff
80001714:	3d6080e7          	jalr	982(ra) # 80000ae6 <_print>
80001718:	80003537          	lui	a0,0x80003
8000171c:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80001720:	fffff097          	auipc	ra,0xfffff
80001724:	3c6080e7          	jalr	966(ra) # 80000ae6 <_print>
80001728:	800057b7          	lui	a5,0x80005
8000172c:	4729                	li	a4,10
8000172e:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
80001732:	304027f3          	csrr	a5,mie
80001736:	0887f793          	andi	a5,a5,136
8000173a:	eb95                	bnez	a5,8000176e <_ZN4EPOS1S6Thread10rescheduleEv+0x6e>
8000173c:	800057b7          	lui	a5,0x80005
80001740:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001744:	47d8                	lw	a4,12(a5)
80001746:	4308                	lw	a0,0(a4)
80001748:	47d8                	lw	a4,12(a5)
8000174a:	438c                	lw	a1,0(a5)
8000174c:	edf1                	bnez	a1,80001828 <_ZN4EPOS1S6Thread10rescheduleEv+0x128>
8000174e:	800057b7          	lui	a5,0x80005
80001752:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001756:	47dc                	lw	a5,12(a5)
80001758:	4605                	li	a2,1
8000175a:	438c                	lw	a1,0(a5)
8000175c:	00000097          	auipc	ra,0x0
80001760:	ec8080e7          	jalr	-312(ra) # 80001624 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80001764:	40b6                	lw	ra,76(sp)
80001766:	4426                	lw	s0,72(sp)
80001768:	4496                	lw	s1,68(sp)
8000176a:	6161                	addi	sp,sp,80
8000176c:	8082                	ret
8000176e:	800054b7          	lui	s1,0x80005
80001772:	03448413          	addi	s0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
80001776:	4785                	li	a5,1
80001778:	00f40223          	sb	a5,4(s0)
8000177c:	80004537          	lui	a0,0x80004
80001780:	97c50513          	addi	a0,a0,-1668 # 8000397c <__boot_stack__+0xf800397d>
80001784:	fffff097          	auipc	ra,0xfffff
80001788:	362080e7          	jalr	866(ra) # 80000ae6 <_print>
8000178c:	80004537          	lui	a0,0x80004
80001790:	99050513          	addi	a0,a0,-1648 # 80003990 <__boot_stack__+0xf8003991>
80001794:	fffff097          	auipc	ra,0xfffff
80001798:	352080e7          	jalr	850(ra) # 80000ae6 <_print>
8000179c:	80004537          	lui	a0,0x80004
800017a0:	99c50513          	addi	a0,a0,-1636 # 8000399c <__boot_stack__+0xf800399d>
800017a4:	fffff097          	auipc	ra,0xfffff
800017a8:	342080e7          	jalr	834(ra) # 80000ae6 <_print>
800017ac:	80004537          	lui	a0,0x80004
800017b0:	9a850513          	addi	a0,a0,-1624 # 800039a8 <__boot_stack__+0xf80039a9>
800017b4:	fffff097          	auipc	ra,0xfffff
800017b8:	332080e7          	jalr	818(ra) # 80000ae6 <_print>
800017bc:	80004537          	lui	a0,0x80004
800017c0:	9d450513          	addi	a0,a0,-1580 # 800039d4 <__boot_stack__+0xf80039d5>
800017c4:	fffff097          	auipc	ra,0xfffff
800017c8:	322080e7          	jalr	802(ra) # 80000ae6 <_print>
800017cc:	80004537          	lui	a0,0x80004
800017d0:	9dc50513          	addi	a0,a0,-1572 # 800039dc <__boot_stack__+0xf80039dd>
800017d4:	fffff097          	auipc	ra,0xfffff
800017d8:	312080e7          	jalr	786(ra) # 80000ae6 <_print>
800017dc:	80004537          	lui	a0,0x80004
800017e0:	9e850513          	addi	a0,a0,-1560 # 800039e8 <__boot_stack__+0xf80039e9>
800017e4:	fffff097          	auipc	ra,0xfffff
800017e8:	302080e7          	jalr	770(ra) # 80000ae6 <_print>
800017ec:	4681                	li	a3,0
800017ee:	860a                	mv	a2,sp
800017f0:	12f00593          	li	a1,303
800017f4:	03448513          	addi	a0,s1,52
800017f8:	fffff097          	auipc	ra,0xfffff
800017fc:	3b6080e7          	jalr	950(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001800:	009c                	addi	a5,sp,64
80001802:	953e                	add	a0,a0,a5
80001804:	fc050023          	sb	zero,-64(a0)
80001808:	850a                	mv	a0,sp
8000180a:	fffff097          	auipc	ra,0xfffff
8000180e:	2dc080e7          	jalr	732(ra) # 80000ae6 <_print>
80001812:	80003537          	lui	a0,0x80003
80001816:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
8000181a:	fffff097          	auipc	ra,0xfffff
8000181e:	2cc080e7          	jalr	716(ra) # 80000ae6 <_print>
80001822:	47a9                	li	a5,10
80001824:	c01c                	sw	a5,0(s0)
80001826:	bf19                	j	8000173c <_ZN4EPOS1S6Thread10rescheduleEv+0x3c>
80001828:	800057b7          	lui	a5,0x80005
8000182c:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001830:	47d0                	lw	a2,12(a5)
80001832:	0047a803          	lw	a6,4(a5)
80001836:	87c2                	mv	a5,a6
80001838:	a011                	j	8000183c <_ZN4EPOS1S6Thread10rescheduleEv+0x13c>
8000183a:	87ba                	mv	a5,a4
8000183c:	43d4                	lw	a3,4(a5)
8000183e:	4258                	lw	a4,4(a2)
80001840:	00d74463          	blt	a4,a3,80001848 <_ZN4EPOS1S6Thread10rescheduleEv+0x148>
80001844:	4f98                	lw	a4,24(a5)
80001846:	fb75                	bnez	a4,8000183a <_ZN4EPOS1S6Thread10rescheduleEv+0x13a>
80001848:	43d4                	lw	a3,4(a5)
8000184a:	4258                	lw	a4,4(a2)
8000184c:	04d75463          	bge	a4,a3,80001894 <_ZN4EPOS1S6Thread10rescheduleEv+0x194>
80001850:	4bd8                	lw	a4,20(a5)
80001852:	cf31                	beqz	a4,800018ae <_ZN4EPOS1S6Thread10rescheduleEv+0x1ae>
80001854:	cf10                	sw	a2,24(a4)
80001856:	cbd0                	sw	a2,20(a5)
80001858:	ca58                	sw	a4,20(a2)
8000185a:	ce1c                	sw	a5,24(a2)
8000185c:	0585                	addi	a1,a1,1
8000185e:	800057b7          	lui	a5,0x80005
80001862:	08b7a223          	sw	a1,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001866:	800057b7          	lui	a5,0x80005
8000186a:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
8000186e:	43d4                	lw	a3,4(a5)
80001870:	4398                	lw	a4,0(a5)
80001872:	cf21                	beqz	a4,800018ca <_ZN4EPOS1S6Thread10rescheduleEv+0x1ca>
80001874:	4e90                	lw	a2,24(a3)
80001876:	800057b7          	lui	a5,0x80005
8000187a:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
8000187e:	c3d0                	sw	a2,4(a5)
80001880:	00062a23          	sw	zero,20(a2)
80001884:	177d                	addi	a4,a4,-1
80001886:	c398                	sw	a4,0(a5)
80001888:	800057b7          	lui	a5,0x80005
8000188c:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001890:	c7d4                	sw	a3,12(a5)
80001892:	bd75                	j	8000174e <_ZN4EPOS1S6Thread10rescheduleEv+0x4e>
80001894:	800057b7          	lui	a5,0x80005
80001898:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
8000189c:	4798                	lw	a4,8(a5)
8000189e:	cf10                	sw	a2,24(a4)
800018a0:	ca58                	sw	a4,20(a2)
800018a2:	00062c23          	sw	zero,24(a2)
800018a6:	c790                	sw	a2,8(a5)
800018a8:	0585                	addi	a1,a1,1
800018aa:	c38c                	sw	a1,0(a5)
800018ac:	bf6d                	j	80001866 <_ZN4EPOS1S6Thread10rescheduleEv+0x166>
800018ae:	00062a23          	sw	zero,20(a2)
800018b2:	01062c23          	sw	a6,24(a2)
800018b6:	00c82a23          	sw	a2,20(a6)
800018ba:	800057b7          	lui	a5,0x80005
800018be:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
800018c2:	c3d0                	sw	a2,4(a5)
800018c4:	0585                	addi	a1,a1,1
800018c6:	c38c                	sw	a1,0(a5)
800018c8:	bf79                	j	80001866 <_ZN4EPOS1S6Thread10rescheduleEv+0x166>
800018ca:	4681                	li	a3,0
800018cc:	bf75                	j	80001888 <_ZN4EPOS1S6Thread10rescheduleEv+0x188>

800018ce <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>:
800018ce:	7159                	addi	sp,sp,-112
800018d0:	d686                	sw	ra,108(sp)
800018d2:	d4a2                	sw	s0,104(sp)
800018d4:	d2a6                	sw	s1,100(sp)
800018d6:	d0ca                	sw	s2,96(sp)
800018d8:	842a                	mv	s0,a0
800018da:	84ae                	mv	s1,a1
800018dc:	8932                	mv	s2,a2
800018de:	80004537          	lui	a0,0x80004
800018e2:	9f050513          	addi	a0,a0,-1552 # 800039f0 <__boot_stack__+0xf80039f1>
800018e6:	fffff097          	auipc	ra,0xfffff
800018ea:	200080e7          	jalr	512(ra) # 80000ae6 <_print>
800018ee:	0870                	addi	a2,sp,28
800018f0:	408c                	lw	a1,0(s1)
800018f2:	800054b7          	lui	s1,0x80005
800018f6:	03448513          	addi	a0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
800018fa:	fffff097          	auipc	ra,0xfffff
800018fe:	482080e7          	jalr	1154(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001902:	109c                	addi	a5,sp,96
80001904:	953e                	add	a0,a0,a5
80001906:	fa050e23          	sb	zero,-68(a0)
8000190a:	0868                	addi	a0,sp,28
8000190c:	fffff097          	auipc	ra,0xfffff
80001910:	1da080e7          	jalr	474(ra) # 80000ae6 <_print>
80001914:	80004537          	lui	a0,0x80004
80001918:	a0050513          	addi	a0,a0,-1536 # 80003a00 <__boot_stack__+0xf8003a01>
8000191c:	fffff097          	auipc	ra,0xfffff
80001920:	1ca080e7          	jalr	458(ra) # 80000ae6 <_print>
80001924:	440c                	lw	a1,8(s0)
80001926:	0870                	addi	a2,sp,28
80001928:	03448513          	addi	a0,s1,52
8000192c:	fffff097          	auipc	ra,0xfffff
80001930:	30e080e7          	jalr	782(ra) # 80000c3a <_ZN4EPOS1S1U7OStream4itoaEiPc>
80001934:	109c                	addi	a5,sp,96
80001936:	953e                	add	a0,a0,a5
80001938:	fa050e23          	sb	zero,-68(a0)
8000193c:	0868                	addi	a0,sp,28
8000193e:	fffff097          	auipc	ra,0xfffff
80001942:	1a8080e7          	jalr	424(ra) # 80000ae6 <_print>
80001946:	80004537          	lui	a0,0x80004
8000194a:	a0850513          	addi	a0,a0,-1528 # 80003a08 <__boot_stack__+0xf8003a09>
8000194e:	fffff097          	auipc	ra,0xfffff
80001952:	198080e7          	jalr	408(ra) # 80000ae6 <_print>
80001956:	4c10                	lw	a2,24(s0)
80001958:	4c54                	lw	a3,28(s0)
8000195a:	5018                	lw	a4,32(s0)
8000195c:	505c                	lw	a5,36(s0)
8000195e:	c632                	sw	a2,12(sp)
80001960:	c836                	sw	a3,16(sp)
80001962:	ca3a                	sw	a4,20(sp)
80001964:	cc3e                	sw	a5,24(sp)
80001966:	45b2                	lw	a1,12(sp)
80001968:	0870                	addi	a2,sp,28
8000196a:	03448513          	addi	a0,s1,52
8000196e:	fffff097          	auipc	ra,0xfffff
80001972:	2cc080e7          	jalr	716(ra) # 80000c3a <_ZN4EPOS1S1U7OStream4itoaEiPc>
80001976:	109c                	addi	a5,sp,96
80001978:	953e                	add	a0,a0,a5
8000197a:	fa050e23          	sb	zero,-68(a0)
8000197e:	0868                	addi	a0,sp,28
80001980:	fffff097          	auipc	ra,0xfffff
80001984:	166080e7          	jalr	358(ra) # 80000ae6 <_print>
80001988:	80004537          	lui	a0,0x80004
8000198c:	a1450513          	addi	a0,a0,-1516 # 80003a14 <__boot_stack__+0xf8003a15>
80001990:	fffff097          	auipc	ra,0xfffff
80001994:	156080e7          	jalr	342(ra) # 80000ae6 <_print>
80001998:	0870                	addi	a2,sp,28
8000199a:	400c                	lw	a1,0(s0)
8000199c:	03448513          	addi	a0,s1,52
800019a0:	fffff097          	auipc	ra,0xfffff
800019a4:	3dc080e7          	jalr	988(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
800019a8:	109c                	addi	a5,sp,96
800019aa:	953e                	add	a0,a0,a5
800019ac:	fa050e23          	sb	zero,-68(a0)
800019b0:	0868                	addi	a0,sp,28
800019b2:	fffff097          	auipc	ra,0xfffff
800019b6:	134080e7          	jalr	308(ra) # 80000ae6 <_print>
800019ba:	80004537          	lui	a0,0x80004
800019be:	a2050513          	addi	a0,a0,-1504 # 80003a20 <__boot_stack__+0xf8003a21>
800019c2:	fffff097          	auipc	ra,0xfffff
800019c6:	124080e7          	jalr	292(ra) # 80000ae6 <_print>
800019ca:	4681                	li	a3,0
800019cc:	0870                	addi	a2,sp,28
800019ce:	85ca                	mv	a1,s2
800019d0:	03448513          	addi	a0,s1,52
800019d4:	fffff097          	auipc	ra,0xfffff
800019d8:	1da080e7          	jalr	474(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800019dc:	109c                	addi	a5,sp,96
800019de:	953e                	add	a0,a0,a5
800019e0:	fa050e23          	sb	zero,-68(a0)
800019e4:	0868                	addi	a0,sp,28
800019e6:	fffff097          	auipc	ra,0xfffff
800019ea:	100080e7          	jalr	256(ra) # 80000ae6 <_print>
800019ee:	80004537          	lui	a0,0x80004
800019f2:	a2450513          	addi	a0,a0,-1500 # 80003a24 <__boot_stack__+0xf8003a25>
800019f6:	fffff097          	auipc	ra,0xfffff
800019fa:	0f0080e7          	jalr	240(ra) # 80000ae6 <_print>
800019fe:	404c                	lw	a1,4(s0)
80001a00:	0870                	addi	a2,sp,28
80001a02:	03448513          	addi	a0,s1,52
80001a06:	fffff097          	auipc	ra,0xfffff
80001a0a:	376080e7          	jalr	886(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001a0e:	109c                	addi	a5,sp,96
80001a10:	953e                	add	a0,a0,a5
80001a12:	fa050e23          	sb	zero,-68(a0)
80001a16:	0868                	addi	a0,sp,28
80001a18:	fffff097          	auipc	ra,0xfffff
80001a1c:	0ce080e7          	jalr	206(ra) # 80000ae6 <_print>
80001a20:	80004537          	lui	a0,0x80004
80001a24:	a3450513          	addi	a0,a0,-1484 # 80003a34 <__boot_stack__+0xf8003a35>
80001a28:	fffff097          	auipc	ra,0xfffff
80001a2c:	0be080e7          	jalr	190(ra) # 80000ae6 <_print>
80001a30:	404c                	lw	a1,4(s0)
80001a32:	08e8                	addi	a0,sp,92
80001a34:	fffff097          	auipc	ra,0xfffff
80001a38:	380080e7          	jalr	896(ra) # 80000db4 <_ZN4EPOS1SlsERNS0_1U5DebugERKNS0_3CPU7ContextE>
80001a3c:	80004537          	lui	a0,0x80004
80001a40:	a3850513          	addi	a0,a0,-1480 # 80003a38 <__boot_stack__+0xf8003a39>
80001a44:	fffff097          	auipc	ra,0xfffff
80001a48:	0a2080e7          	jalr	162(ra) # 80000ae6 <_print>
80001a4c:	0870                	addi	a2,sp,28
80001a4e:	85a2                	mv	a1,s0
80001a50:	03448513          	addi	a0,s1,52
80001a54:	fffff097          	auipc	ra,0xfffff
80001a58:	328080e7          	jalr	808(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001a5c:	109c                	addi	a5,sp,96
80001a5e:	953e                	add	a0,a0,a5
80001a60:	fa050e23          	sb	zero,-68(a0)
80001a64:	0868                	addi	a0,sp,28
80001a66:	fffff097          	auipc	ra,0xfffff
80001a6a:	080080e7          	jalr	128(ra) # 80000ae6 <_print>
80001a6e:	80003537          	lui	a0,0x80003
80001a72:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80001a76:	fffff097          	auipc	ra,0xfffff
80001a7a:	070080e7          	jalr	112(ra) # 80000ae6 <_print>
80001a7e:	47a9                	li	a5,10
80001a80:	02f4aa23          	sw	a5,52(s1)
80001a84:	4418                	lw	a4,8(s0)
80001a86:	478d                	li	a5,3
80001a88:	02f70a63          	beq	a4,a5,80001abc <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1ee>
80001a8c:	4418                	lw	a4,8(s0)
80001a8e:	4791                	li	a5,4
80001a90:	02f70663          	beq	a4,a5,80001abc <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1ee>
80001a94:	4418                	lw	a4,8(s0)
80001a96:	4785                	li	a5,1
80001a98:	00f70463          	beq	a4,a5,80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001a9c:	441c                	lw	a5,8(s0)
80001a9e:	efe1                	bnez	a5,80001b76 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a8>
80001aa0:	4418                	lw	a4,8(s0)
80001aa2:	4785                	li	a5,1
80001aa4:	1af70663          	beq	a4,a5,80001c50 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x382>
80001aa8:	08800793          	li	a5,136
80001aac:	30479073          	csrw	mie,a5
80001ab0:	50b6                	lw	ra,108(sp)
80001ab2:	5426                	lw	s0,104(sp)
80001ab4:	5496                	lw	s1,100(sp)
80001ab6:	5906                	lw	s2,96(sp)
80001ab8:	6165                	addi	sp,sp,112
80001aba:	8082                	ret
80001abc:	80005937          	lui	s2,0x80005
80001ac0:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
80001ac4:	4785                	li	a5,1
80001ac6:	00f48223          	sb	a5,4(s1)
80001aca:	80004537          	lui	a0,0x80004
80001ace:	97c50513          	addi	a0,a0,-1668 # 8000397c <__boot_stack__+0xf800397d>
80001ad2:	fffff097          	auipc	ra,0xfffff
80001ad6:	014080e7          	jalr	20(ra) # 80000ae6 <_print>
80001ada:	80004537          	lui	a0,0x80004
80001ade:	a4050513          	addi	a0,a0,-1472 # 80003a40 <__boot_stack__+0xf8003a41>
80001ae2:	fffff097          	auipc	ra,0xfffff
80001ae6:	004080e7          	jalr	4(ra) # 80000ae6 <_print>
80001aea:	80004537          	lui	a0,0x80004
80001aee:	99c50513          	addi	a0,a0,-1636 # 8000399c <__boot_stack__+0xf800399d>
80001af2:	fffff097          	auipc	ra,0xfffff
80001af6:	ff4080e7          	jalr	-12(ra) # 80000ae6 <_print>
80001afa:	80004537          	lui	a0,0x80004
80001afe:	a7050513          	addi	a0,a0,-1424 # 80003a70 <__boot_stack__+0xf8003a71>
80001b02:	fffff097          	auipc	ra,0xfffff
80001b06:	fe4080e7          	jalr	-28(ra) # 80000ae6 <_print>
80001b0a:	80004537          	lui	a0,0x80004
80001b0e:	9d450513          	addi	a0,a0,-1580 # 800039d4 <__boot_stack__+0xf80039d5>
80001b12:	fffff097          	auipc	ra,0xfffff
80001b16:	fd4080e7          	jalr	-44(ra) # 80000ae6 <_print>
80001b1a:	80004537          	lui	a0,0x80004
80001b1e:	9dc50513          	addi	a0,a0,-1572 # 800039dc <__boot_stack__+0xf80039dd>
80001b22:	fffff097          	auipc	ra,0xfffff
80001b26:	fc4080e7          	jalr	-60(ra) # 80000ae6 <_print>
80001b2a:	80004537          	lui	a0,0x80004
80001b2e:	9e850513          	addi	a0,a0,-1560 # 800039e8 <__boot_stack__+0xf80039e9>
80001b32:	fffff097          	auipc	ra,0xfffff
80001b36:	fb4080e7          	jalr	-76(ra) # 80000ae6 <_print>
80001b3a:	4681                	li	a3,0
80001b3c:	0870                	addi	a2,sp,28
80001b3e:	02a00593          	li	a1,42
80001b42:	03490513          	addi	a0,s2,52
80001b46:	fffff097          	auipc	ra,0xfffff
80001b4a:	068080e7          	jalr	104(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001b4e:	109c                	addi	a5,sp,96
80001b50:	953e                	add	a0,a0,a5
80001b52:	fa050e23          	sb	zero,-68(a0)
80001b56:	0868                	addi	a0,sp,28
80001b58:	fffff097          	auipc	ra,0xfffff
80001b5c:	f8e080e7          	jalr	-114(ra) # 80000ae6 <_print>
80001b60:	80003537          	lui	a0,0x80003
80001b64:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80001b68:	fffff097          	auipc	ra,0xfffff
80001b6c:	f7e080e7          	jalr	-130(ra) # 80000ae6 <_print>
80001b70:	47a9                	li	a5,10
80001b72:	c09c                	sw	a5,0(s1)
80001b74:	b705                	j	80001a94 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1c6>
80001b76:	800057b7          	lui	a5,0x80005
80001b7a:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001b7e:	47d8                	lw	a4,12(a5)
80001b80:	47d8                	lw	a4,12(a5)
80001b82:	01440793          	addi	a5,s0,20
80001b86:	02f70763          	beq	a4,a5,80001bb4 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2e6>
80001b8a:	800057b7          	lui	a5,0x80005
80001b8e:	0847a783          	lw	a5,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001b92:	4705                	li	a4,1
80001b94:	06e78763          	beq	a5,a4,80001c02 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x334>
80001b98:	5418                	lw	a4,40(s0)
80001b9a:	cf3d                	beqz	a4,80001c18 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x34a>
80001b9c:	5454                	lw	a3,44(s0)
80001b9e:	cad9                	beqz	a3,80001c34 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x366>
80001ba0:	cf14                	sw	a3,24(a4)
80001ba2:	5458                	lw	a4,44(s0)
80001ba4:	5414                	lw	a3,40(s0)
80001ba6:	cb54                	sw	a3,20(a4)
80001ba8:	17fd                	addi	a5,a5,-1
80001baa:	80005737          	lui	a4,0x80005
80001bae:	08f72223          	sw	a5,132(a4) # 80005084 <__boot_stack__+0xf8005085>
80001bb2:	b5fd                	j	80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001bb4:	800057b7          	lui	a5,0x80005
80001bb8:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001bbc:	43d8                	lw	a4,4(a5)
80001bbe:	439c                	lw	a5,0(a5)
80001bc0:	cf9d                	beqz	a5,80001bfe <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x330>
80001bc2:	4685                	li	a3,1
80001bc4:	02d78263          	beq	a5,a3,80001be8 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x31a>
80001bc8:	4f10                	lw	a2,24(a4)
80001bca:	800056b7          	lui	a3,0x80005
80001bce:	08468693          	addi	a3,a3,132 # 80005084 <__boot_stack__+0xf8005085>
80001bd2:	c2d0                	sw	a2,4(a3)
80001bd4:	00062a23          	sw	zero,20(a2)
80001bd8:	17fd                	addi	a5,a5,-1
80001bda:	c29c                	sw	a5,0(a3)
80001bdc:	800057b7          	lui	a5,0x80005
80001be0:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001be4:	c7d8                	sw	a4,12(a5)
80001be6:	bd6d                	j	80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001be8:	800057b7          	lui	a5,0x80005
80001bec:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001bf0:	0007a223          	sw	zero,4(a5)
80001bf4:	0007a423          	sw	zero,8(a5)
80001bf8:	0007a023          	sw	zero,0(a5)
80001bfc:	b7c5                	j	80001bdc <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x30e>
80001bfe:	4701                	li	a4,0
80001c00:	bff1                	j	80001bdc <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x30e>
80001c02:	800057b7          	lui	a5,0x80005
80001c06:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001c0a:	0007a223          	sw	zero,4(a5)
80001c0e:	0007a423          	sw	zero,8(a5)
80001c12:	0007a023          	sw	zero,0(a5)
80001c16:	b569                	j	80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001c18:	e80784e3          	beqz	a5,80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001c1c:	80005737          	lui	a4,0x80005
80001c20:	08470713          	addi	a4,a4,132 # 80005084 <__boot_stack__+0xf8005085>
80001c24:	4354                	lw	a3,4(a4)
80001c26:	4e94                	lw	a3,24(a3)
80001c28:	c354                	sw	a3,4(a4)
80001c2a:	0006aa23          	sw	zero,20(a3)
80001c2e:	17fd                	addi	a5,a5,-1
80001c30:	c31c                	sw	a5,0(a4)
80001c32:	b5bd                	j	80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001c34:	e60786e3          	beqz	a5,80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001c38:	80005737          	lui	a4,0x80005
80001c3c:	08470713          	addi	a4,a4,132 # 80005084 <__boot_stack__+0xf8005085>
80001c40:	4714                	lw	a3,8(a4)
80001c42:	4ad4                	lw	a3,20(a3)
80001c44:	c714                	sw	a3,8(a4)
80001c46:	0006ac23          	sw	zero,24(a3)
80001c4a:	17fd                	addi	a5,a5,-1
80001c4c:	c31c                	sw	a5,0(a4)
80001c4e:	bd89                	j	80001aa0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1d2>
80001c50:	4c18                	lw	a4,24(s0)
80001c52:	800007b7          	lui	a5,0x80000
80001c56:	fff7c793          	not	a5,a5
80001c5a:	e4f707e3          	beq	a4,a5,80001aa8 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1da>
80001c5e:	00000097          	auipc	ra,0x0
80001c62:	aa2080e7          	jalr	-1374(ra) # 80001700 <_ZN4EPOS1S6Thread10rescheduleEv>
80001c66:	b5a9                	j	80001ab0 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1e2>

80001c68 <_ZN4EPOS1S6Thread4exitEi>:
80001c68:	715d                	addi	sp,sp,-80
80001c6a:	c686                	sw	ra,76(sp)
80001c6c:	c4a2                	sw	s0,72(sp)
80001c6e:	c2a6                	sw	s1,68(sp)
80001c70:	c0ca                	sw	s2,64(sp)
80001c72:	84aa                	mv	s1,a0
80001c74:	4781                	li	a5,0
80001c76:	30479073          	csrw	mie,a5
80001c7a:	80004537          	lui	a0,0x80004
80001c7e:	abc50513          	addi	a0,a0,-1348 # 80003abc <__boot_stack__+0xf8003abd>
80001c82:	fffff097          	auipc	ra,0xfffff
80001c86:	e64080e7          	jalr	-412(ra) # 80000ae6 <_print>
80001c8a:	860a                	mv	a2,sp
80001c8c:	85a6                	mv	a1,s1
80001c8e:	80005937          	lui	s2,0x80005
80001c92:	03490513          	addi	a0,s2,52 # 80005034 <__boot_stack__+0xf8005035>
80001c96:	fffff097          	auipc	ra,0xfffff
80001c9a:	fa4080e7          	jalr	-92(ra) # 80000c3a <_ZN4EPOS1S1U7OStream4itoaEiPc>
80001c9e:	009c                	addi	a5,sp,64
80001ca0:	953e                	add	a0,a0,a5
80001ca2:	fc050023          	sb	zero,-64(a0)
80001ca6:	850a                	mv	a0,sp
80001ca8:	fffff097          	auipc	ra,0xfffff
80001cac:	e3e080e7          	jalr	-450(ra) # 80000ae6 <_print>
80001cb0:	80004537          	lui	a0,0x80004
80001cb4:	ad450513          	addi	a0,a0,-1324 # 80003ad4 <__boot_stack__+0xf8003ad5>
80001cb8:	fffff097          	auipc	ra,0xfffff
80001cbc:	e2e080e7          	jalr	-466(ra) # 80000ae6 <_print>
80001cc0:	80005437          	lui	s0,0x80005
80001cc4:	08440413          	addi	s0,s0,132 # 80005084 <__boot_stack__+0xf8005085>
80001cc8:	445c                	lw	a5,12(s0)
80001cca:	860a                	mv	a2,sp
80001ccc:	438c                	lw	a1,0(a5)
80001cce:	03490513          	addi	a0,s2,52
80001cd2:	fffff097          	auipc	ra,0xfffff
80001cd6:	0aa080e7          	jalr	170(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80001cda:	009c                	addi	a5,sp,64
80001cdc:	953e                	add	a0,a0,a5
80001cde:	fc050023          	sb	zero,-64(a0)
80001ce2:	850a                	mv	a0,sp
80001ce4:	fffff097          	auipc	ra,0xfffff
80001ce8:	e02080e7          	jalr	-510(ra) # 80000ae6 <_print>
80001cec:	80004537          	lui	a0,0x80004
80001cf0:	ae050513          	addi	a0,a0,-1312 # 80003ae0 <__boot_stack__+0xf8003ae1>
80001cf4:	fffff097          	auipc	ra,0xfffff
80001cf8:	df2080e7          	jalr	-526(ra) # 80000ae6 <_print>
80001cfc:	80003537          	lui	a0,0x80003
80001d00:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80001d04:	fffff097          	auipc	ra,0xfffff
80001d08:	de2080e7          	jalr	-542(ra) # 80000ae6 <_print>
80001d0c:	47a9                	li	a5,10
80001d0e:	02f92a23          	sw	a5,52(s2)
80001d12:	445c                	lw	a5,12(s0)
80001d14:	4388                	lw	a0,0(a5)
80001d16:	445c                	lw	a5,12(s0)
80001d18:	4458                	lw	a4,12(s0)
80001d1a:	01450793          	addi	a5,a0,20
80001d1e:	08f70363          	beq	a4,a5,80001da4 <_ZN4EPOS1S6Thread4exitEi+0x13c>
80001d22:	800057b7          	lui	a5,0x80005
80001d26:	0847a783          	lw	a5,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001d2a:	4705                	li	a4,1
80001d2c:	0ce78363          	beq	a5,a4,80001df2 <_ZN4EPOS1S6Thread4exitEi+0x18a>
80001d30:	5518                	lw	a4,40(a0)
80001d32:	cb79                	beqz	a4,80001e08 <_ZN4EPOS1S6Thread4exitEi+0x1a0>
80001d34:	5554                	lw	a3,44(a0)
80001d36:	c6f5                	beqz	a3,80001e22 <_ZN4EPOS1S6Thread4exitEi+0x1ba>
80001d38:	cf14                	sw	a3,24(a4)
80001d3a:	5558                	lw	a4,44(a0)
80001d3c:	5514                	lw	a3,40(a0)
80001d3e:	cb54                	sw	a3,20(a4)
80001d40:	17fd                	addi	a5,a5,-1
80001d42:	80005737          	lui	a4,0x80005
80001d46:	08f72223          	sw	a5,132(a4) # 80005084 <__boot_stack__+0xf8005085>
80001d4a:	4791                	li	a5,4
80001d4c:	c51c                	sw	a5,8(a0)
80001d4e:	411c                	lw	a5,0(a0)
80001d50:	c384                	sw	s1,0(a5)
80001d52:	800057b7          	lui	a5,0x80005
80001d56:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
80001d5a:	4398                	lw	a4,0(a5)
80001d5c:	177d                	addi	a4,a4,-1
80001d5e:	c398                	sw	a4,0(a5)
80001d60:	491c                	lw	a5,16(a0)
80001d62:	14078e63          	beqz	a5,80001ebe <_ZN4EPOS1S6Thread4exitEi+0x256>
80001d66:	491c                	lw	a5,16(a0)
80001d68:	4705                	li	a4,1
80001d6a:	c798                	sw	a4,8(a5)
80001d6c:	4914                	lw	a3,16(a0)
80001d6e:	800057b7          	lui	a5,0x80005
80001d72:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001d76:	47d8                	lw	a4,12(a5)
80001d78:	01468593          	addi	a1,a3,20
80001d7c:	47dc                	lw	a5,12(a5)
80001d7e:	12078963          	beqz	a5,80001eb0 <_ZN4EPOS1S6Thread4exitEi+0x248>
80001d82:	800057b7          	lui	a5,0x80005
80001d86:	0847a803          	lw	a6,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001d8a:	0a081963          	bnez	a6,80001e3c <_ZN4EPOS1S6Thread4exitEi+0x1d4>
80001d8e:	0206a423          	sw	zero,40(a3)
80001d92:	0206a623          	sw	zero,44(a3)
80001d96:	08478793          	addi	a5,a5,132
80001d9a:	c3cc                	sw	a1,4(a5)
80001d9c:	c78c                	sw	a1,8(a5)
80001d9e:	4705                	li	a4,1
80001da0:	c398                	sw	a4,0(a5)
80001da2:	aa21                	j	80001eba <_ZN4EPOS1S6Thread4exitEi+0x252>
80001da4:	800057b7          	lui	a5,0x80005
80001da8:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001dac:	43d4                	lw	a3,4(a5)
80001dae:	439c                	lw	a5,0(a5)
80001db0:	cf9d                	beqz	a5,80001dee <_ZN4EPOS1S6Thread4exitEi+0x186>
80001db2:	4705                	li	a4,1
80001db4:	02e78263          	beq	a5,a4,80001dd8 <_ZN4EPOS1S6Thread4exitEi+0x170>
80001db8:	4e90                	lw	a2,24(a3)
80001dba:	80005737          	lui	a4,0x80005
80001dbe:	08470713          	addi	a4,a4,132 # 80005084 <__boot_stack__+0xf8005085>
80001dc2:	c350                	sw	a2,4(a4)
80001dc4:	00062a23          	sw	zero,20(a2)
80001dc8:	17fd                	addi	a5,a5,-1
80001dca:	c31c                	sw	a5,0(a4)
80001dcc:	800057b7          	lui	a5,0x80005
80001dd0:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001dd4:	c7d4                	sw	a3,12(a5)
80001dd6:	bf95                	j	80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001dd8:	800057b7          	lui	a5,0x80005
80001ddc:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001de0:	0007a223          	sw	zero,4(a5)
80001de4:	0007a423          	sw	zero,8(a5)
80001de8:	0007a023          	sw	zero,0(a5)
80001dec:	b7c5                	j	80001dcc <_ZN4EPOS1S6Thread4exitEi+0x164>
80001dee:	4681                	li	a3,0
80001df0:	bff1                	j	80001dcc <_ZN4EPOS1S6Thread4exitEi+0x164>
80001df2:	800057b7          	lui	a5,0x80005
80001df6:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001dfa:	0007a223          	sw	zero,4(a5)
80001dfe:	0007a423          	sw	zero,8(a5)
80001e02:	0007a023          	sw	zero,0(a5)
80001e06:	b791                	j	80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001e08:	d3a9                	beqz	a5,80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001e0a:	80005737          	lui	a4,0x80005
80001e0e:	08470713          	addi	a4,a4,132 # 80005084 <__boot_stack__+0xf8005085>
80001e12:	4354                	lw	a3,4(a4)
80001e14:	4e94                	lw	a3,24(a3)
80001e16:	c354                	sw	a3,4(a4)
80001e18:	0006aa23          	sw	zero,20(a3)
80001e1c:	17fd                	addi	a5,a5,-1
80001e1e:	c31c                	sw	a5,0(a4)
80001e20:	b72d                	j	80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001e22:	d785                	beqz	a5,80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001e24:	80005737          	lui	a4,0x80005
80001e28:	08470713          	addi	a4,a4,132 # 80005084 <__boot_stack__+0xf8005085>
80001e2c:	4714                	lw	a3,8(a4)
80001e2e:	4ad4                	lw	a3,20(a3)
80001e30:	c714                	sw	a3,8(a4)
80001e32:	0006ac23          	sw	zero,24(a3)
80001e36:	17fd                	addi	a5,a5,-1
80001e38:	c31c                	sw	a5,0(a4)
80001e3a:	bf01                	j	80001d4a <_ZN4EPOS1S6Thread4exitEi+0xe2>
80001e3c:	800057b7          	lui	a5,0x80005
80001e40:	0887a883          	lw	a7,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001e44:	87c6                	mv	a5,a7
80001e46:	a011                	j	80001e4a <_ZN4EPOS1S6Thread4exitEi+0x1e2>
80001e48:	87ba                	mv	a5,a4
80001e4a:	43d0                	lw	a2,4(a5)
80001e4c:	4e98                	lw	a4,24(a3)
80001e4e:	00c74463          	blt	a4,a2,80001e56 <_ZN4EPOS1S6Thread4exitEi+0x1ee>
80001e52:	4f98                	lw	a4,24(a5)
80001e54:	fb75                	bnez	a4,80001e48 <_ZN4EPOS1S6Thread4exitEi+0x1e0>
80001e56:	43d0                	lw	a2,4(a5)
80001e58:	4e98                	lw	a4,24(a3)
80001e5a:	00c75e63          	bge	a4,a2,80001e76 <_ZN4EPOS1S6Thread4exitEi+0x20e>
80001e5e:	4bd8                	lw	a4,20(a5)
80001e60:	cb0d                	beqz	a4,80001e92 <_ZN4EPOS1S6Thread4exitEi+0x22a>
80001e62:	cf0c                	sw	a1,24(a4)
80001e64:	cbcc                	sw	a1,20(a5)
80001e66:	d698                	sw	a4,40(a3)
80001e68:	d6dc                	sw	a5,44(a3)
80001e6a:	0805                	addi	a6,a6,1
80001e6c:	800057b7          	lui	a5,0x80005
80001e70:	0907a223          	sw	a6,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001e74:	a099                	j	80001eba <_ZN4EPOS1S6Thread4exitEi+0x252>
80001e76:	800057b7          	lui	a5,0x80005
80001e7a:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001e7e:	4798                	lw	a4,8(a5)
80001e80:	cf0c                	sw	a1,24(a4)
80001e82:	d698                	sw	a4,40(a3)
80001e84:	0206a623          	sw	zero,44(a3)
80001e88:	c78c                	sw	a1,8(a5)
80001e8a:	0805                	addi	a6,a6,1
80001e8c:	0107a023          	sw	a6,0(a5)
80001e90:	a02d                	j	80001eba <_ZN4EPOS1S6Thread4exitEi+0x252>
80001e92:	0206a423          	sw	zero,40(a3)
80001e96:	0316a623          	sw	a7,44(a3)
80001e9a:	00b8aa23          	sw	a1,20(a7)
80001e9e:	800057b7          	lui	a5,0x80005
80001ea2:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001ea6:	c3cc                	sw	a1,4(a5)
80001ea8:	0805                	addi	a6,a6,1
80001eaa:	0107a023          	sw	a6,0(a5)
80001eae:	a031                	j	80001eba <_ZN4EPOS1S6Thread4exitEi+0x252>
80001eb0:	800057b7          	lui	a5,0x80005
80001eb4:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001eb8:	c7cc                	sw	a1,12(a5)
80001eba:	00052823          	sw	zero,16(a0)
80001ebe:	800057b7          	lui	a5,0x80005
80001ec2:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001ec6:	47d8                	lw	a4,12(a5)
80001ec8:	438c                	lw	a1,0(a5)
80001eca:	e195                	bnez	a1,80001eee <_ZN4EPOS1S6Thread4exitEi+0x286>
80001ecc:	800057b7          	lui	a5,0x80005
80001ed0:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001ed4:	47dc                	lw	a5,12(a5)
80001ed6:	4605                	li	a2,1
80001ed8:	438c                	lw	a1,0(a5)
80001eda:	fffff097          	auipc	ra,0xfffff
80001ede:	74a080e7          	jalr	1866(ra) # 80001624 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80001ee2:	40b6                	lw	ra,76(sp)
80001ee4:	4426                	lw	s0,72(sp)
80001ee6:	4496                	lw	s1,68(sp)
80001ee8:	4906                	lw	s2,64(sp)
80001eea:	6161                	addi	sp,sp,80
80001eec:	8082                	ret
80001eee:	800057b7          	lui	a5,0x80005
80001ef2:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001ef6:	47d0                	lw	a2,12(a5)
80001ef8:	0047a803          	lw	a6,4(a5)
80001efc:	87c2                	mv	a5,a6
80001efe:	a011                	j	80001f02 <_ZN4EPOS1S6Thread4exitEi+0x29a>
80001f00:	87ba                	mv	a5,a4
80001f02:	43d4                	lw	a3,4(a5)
80001f04:	4258                	lw	a4,4(a2)
80001f06:	00d74463          	blt	a4,a3,80001f0e <_ZN4EPOS1S6Thread4exitEi+0x2a6>
80001f0a:	4f98                	lw	a4,24(a5)
80001f0c:	fb75                	bnez	a4,80001f00 <_ZN4EPOS1S6Thread4exitEi+0x298>
80001f0e:	43d4                	lw	a3,4(a5)
80001f10:	4258                	lw	a4,4(a2)
80001f12:	04d75463          	bge	a4,a3,80001f5a <_ZN4EPOS1S6Thread4exitEi+0x2f2>
80001f16:	4bd8                	lw	a4,20(a5)
80001f18:	cf31                	beqz	a4,80001f74 <_ZN4EPOS1S6Thread4exitEi+0x30c>
80001f1a:	cf10                	sw	a2,24(a4)
80001f1c:	cbd0                	sw	a2,20(a5)
80001f1e:	ca58                	sw	a4,20(a2)
80001f20:	ce1c                	sw	a5,24(a2)
80001f22:	0585                	addi	a1,a1,1
80001f24:	800057b7          	lui	a5,0x80005
80001f28:	08b7a223          	sw	a1,132(a5) # 80005084 <__boot_stack__+0xf8005085>
80001f2c:	800057b7          	lui	a5,0x80005
80001f30:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001f34:	43d4                	lw	a3,4(a5)
80001f36:	4398                	lw	a4,0(a5)
80001f38:	cf21                	beqz	a4,80001f90 <_ZN4EPOS1S6Thread4exitEi+0x328>
80001f3a:	4e90                	lw	a2,24(a3)
80001f3c:	800057b7          	lui	a5,0x80005
80001f40:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001f44:	c3d0                	sw	a2,4(a5)
80001f46:	00062a23          	sw	zero,20(a2)
80001f4a:	177d                	addi	a4,a4,-1
80001f4c:	c398                	sw	a4,0(a5)
80001f4e:	800057b7          	lui	a5,0x80005
80001f52:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001f56:	c7d4                	sw	a3,12(a5)
80001f58:	bf95                	j	80001ecc <_ZN4EPOS1S6Thread4exitEi+0x264>
80001f5a:	800057b7          	lui	a5,0x80005
80001f5e:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001f62:	4798                	lw	a4,8(a5)
80001f64:	cf10                	sw	a2,24(a4)
80001f66:	ca58                	sw	a4,20(a2)
80001f68:	00062c23          	sw	zero,24(a2)
80001f6c:	c790                	sw	a2,8(a5)
80001f6e:	0585                	addi	a1,a1,1
80001f70:	c38c                	sw	a1,0(a5)
80001f72:	bf6d                	j	80001f2c <_ZN4EPOS1S6Thread4exitEi+0x2c4>
80001f74:	00062a23          	sw	zero,20(a2)
80001f78:	01062c23          	sw	a6,24(a2)
80001f7c:	00c82a23          	sw	a2,20(a6)
80001f80:	800057b7          	lui	a5,0x80005
80001f84:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
80001f88:	c3d0                	sw	a2,4(a5)
80001f8a:	0585                	addi	a1,a1,1
80001f8c:	c38c                	sw	a1,0(a5)
80001f8e:	bf79                	j	80001f2c <_ZN4EPOS1S6Thread4exitEi+0x2c4>
80001f90:	4681                	li	a3,0
80001f92:	bf75                	j	80001f4e <_ZN4EPOS1S6Thread4exitEi+0x2e6>

80001f94 <_ZN4EPOS1S6Thread4idleEv>:
80001f94:	1141                	addi	sp,sp,-16
80001f96:	c606                	sw	ra,12(sp)
80001f98:	c422                	sw	s0,8(sp)
80001f9a:	c226                	sw	s1,4(sp)
80001f9c:	c04a                	sw	s2,0(sp)
80001f9e:	800057b7          	lui	a5,0x80005
80001fa2:	0587a703          	lw	a4,88(a5) # 80005058 <__boot_stack__+0xf8005059>
80001fa6:	4785                	li	a5,1
80001fa8:	02e7f063          	bgeu	a5,a4,80001fc8 <_ZN4EPOS1S6Thread4idleEv+0x34>
80001fac:	08800613          	li	a2,136
80001fb0:	800056b7          	lui	a3,0x80005
80001fb4:	4705                	li	a4,1
80001fb6:	30461073          	csrw	mie,a2
80001fba:	10500073          	wfi
80001fbe:	05868793          	addi	a5,a3,88 # 80005058 <__boot_stack__+0xf8005059>
80001fc2:	439c                	lw	a5,0(a5)
80001fc4:	fef769e3          	bltu	a4,a5,80001fb6 <_ZN4EPOS1S6Thread4idleEv+0x22>
80001fc8:	4781                	li	a5,0
80001fca:	30479073          	csrw	mie,a5
80001fce:	80004537          	lui	a0,0x80004
80001fd2:	ae450513          	addi	a0,a0,-1308 # 80003ae4 <__boot_stack__+0xf8003ae5>
80001fd6:	fffff097          	auipc	ra,0xfffff
80001fda:	b10080e7          	jalr	-1264(ra) # 80000ae6 <_print>
80001fde:	80003937          	lui	s2,0x80003
80001fe2:	76c90513          	addi	a0,s2,1900 # 8000376c <__boot_stack__+0xf800376d>
80001fe6:	fffff097          	auipc	ra,0xfffff
80001fea:	b00080e7          	jalr	-1280(ra) # 80000ae6 <_print>
80001fee:	80005437          	lui	s0,0x80005
80001ff2:	03440413          	addi	s0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
80001ff6:	44a9                	li	s1,10
80001ff8:	c004                	sw	s1,0(s0)
80001ffa:	80004537          	lui	a0,0x80004
80001ffe:	b0050513          	addi	a0,a0,-1280 # 80003b00 <__boot_stack__+0xf8003b01>
80002002:	fffff097          	auipc	ra,0xfffff
80002006:	ae4080e7          	jalr	-1308(ra) # 80000ae6 <_print>
8000200a:	76c90513          	addi	a0,s2,1900
8000200e:	fffff097          	auipc	ra,0xfffff
80002012:	ad8080e7          	jalr	-1320(ra) # 80000ae6 <_print>
80002016:	c004                	sw	s1,0(s0)
80002018:	fffff097          	auipc	ra,0xfffff
8000201c:	3f6080e7          	jalr	1014(ra) # 8000140e <_ZN4EPOS1S7Machine6rebootEv>
80002020:	a001                	j	80002020 <_ZN4EPOS1S6Thread4idleEv+0x8c>

80002022 <_GLOBAL__sub_I__ZN4EPOS1S1U11This_Thread12_not_bootingE>:
80002022:	800057b7          	lui	a5,0x80005
80002026:	08478793          	addi	a5,a5,132 # 80005084 <__boot_stack__+0xf8005085>
8000202a:	0007a023          	sw	zero,0(a5)
8000202e:	0007a223          	sw	zero,4(a5)
80002032:	0007a423          	sw	zero,8(a5)
80002036:	0007a623          	sw	zero,12(a5)
8000203a:	8082                	ret

8000203c <_ZN4EPOS1S3CPU4initEv>:
8000203c:	1141                	addi	sp,sp,-16
8000203e:	c606                	sw	ra,12(sp)
80002040:	80004537          	lui	a0,0x80004
80002044:	b1c50513          	addi	a0,a0,-1252 # 80003b1c <__boot_stack__+0xf8003b1d>
80002048:	fffff097          	auipc	ra,0xfffff
8000204c:	a9e080e7          	jalr	-1378(ra) # 80000ae6 <_print>
80002050:	80003537          	lui	a0,0x80003
80002054:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80002058:	fffff097          	auipc	ra,0xfffff
8000205c:	a8e080e7          	jalr	-1394(ra) # 80000ae6 <_print>
80002060:	800057b7          	lui	a5,0x80005
80002064:	4729                	li	a4,10
80002066:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
8000206a:	f14027f3          	csrr	a5,mhartid
8000206e:	8b8d                	andi	a5,a5,3
80002070:	c781                	beqz	a5,80002078 <_ZN4EPOS1S3CPU4initEv+0x3c>
80002072:	40b2                	lw	ra,12(sp)
80002074:	0141                	addi	sp,sp,16
80002076:	8082                	ret
80002078:	00000097          	auipc	ra,0x0
8000207c:	124080e7          	jalr	292(ra) # 8000219c <_ZN4EPOS1S3MMU4initEv>
80002080:	bfcd                	j	80002072 <_ZN4EPOS1S3CPU4initEv+0x36>

80002082 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>:
80002082:	455c                	lw	a5,12(a0)
80002084:	41d8                	lw	a4,4(a1)
80002086:	97ba                	add	a5,a5,a4
80002088:	c55c                	sw	a5,12(a0)
8000208a:	0006a023          	sw	zero,0(a3)
8000208e:	00062023          	sw	zero,0(a2)
80002092:	0005a303          	lw	t1,0(a1)
80002096:	0045a883          	lw	a7,4(a1)
8000209a:	088a                	slli	a7,a7,0x2
8000209c:	989a                	add	a7,a7,t1
8000209e:	415c                	lw	a5,4(a0)
800020a0:	c3dd                	beqz	a5,80002146 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc4>
800020a2:	873e                	mv	a4,a5
800020a4:	00072803          	lw	a6,0(a4)
800020a8:	01088463          	beq	a7,a6,800020b0 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
800020ac:	4758                	lw	a4,12(a4)
800020ae:	fb7d                	bnez	a4,800020a4 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x22>
800020b0:	0047a803          	lw	a6,4(a5)
800020b4:	00281893          	slli	a7,a6,0x2
800020b8:	0007a803          	lw	a6,0(a5)
800020bc:	9846                	add	a6,a6,a7
800020be:	09030663          	beq	t1,a6,8000214a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc8>
800020c2:	47dc                	lw	a5,12(a5)
800020c4:	f7f5                	bnez	a5,800020b0 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
800020c6:	411c                	lw	a5,0(a0)
800020c8:	cf81                	beqz	a5,800020e0 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x5e>
800020ca:	451c                	lw	a5,8(a0)
800020cc:	c7cc                	sw	a1,12(a5)
800020ce:	451c                	lw	a5,8(a0)
800020d0:	c59c                	sw	a5,8(a1)
800020d2:	0005a623          	sw	zero,12(a1)
800020d6:	c50c                	sw	a1,8(a0)
800020d8:	411c                	lw	a5,0(a0)
800020da:	0785                	addi	a5,a5,1
800020dc:	c11c                	sw	a5,0(a0)
800020de:	a811                	j	800020f2 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x70>
800020e0:	0005a423          	sw	zero,8(a1)
800020e4:	0005a623          	sw	zero,12(a1)
800020e8:	c14c                	sw	a1,4(a0)
800020ea:	c50c                	sw	a1,8(a0)
800020ec:	411c                	lw	a5,0(a0)
800020ee:	0785                	addi	a5,a5,1
800020f0:	c11c                	sw	a5,0(a0)
800020f2:	4781                	li	a5,0
800020f4:	ef21                	bnez	a4,8000214c <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xca>
800020f6:	8082                	ret
800020f8:	00052223          	sw	zero,4(a0)
800020fc:	00052423          	sw	zero,8(a0)
80002100:	00052023          	sw	zero,0(a0)
80002104:	a059                	j	8000218a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80002106:	08080263          	beqz	a6,8000218a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000210a:	00452803          	lw	a6,4(a0)
8000210e:	00c82803          	lw	a6,12(a6)
80002112:	01052223          	sw	a6,4(a0)
80002116:	00082423          	sw	zero,8(a6)
8000211a:	00052803          	lw	a6,0(a0)
8000211e:	187d                	addi	a6,a6,-1
80002120:	01052023          	sw	a6,0(a0)
80002124:	a09d                	j	8000218a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80002126:	06080263          	beqz	a6,8000218a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000212a:	00852803          	lw	a6,8(a0)
8000212e:	00882803          	lw	a6,8(a6)
80002132:	01052423          	sw	a6,8(a0)
80002136:	00082623          	sw	zero,12(a6)
8000213a:	00052803          	lw	a6,0(a0)
8000213e:	187d                	addi	a6,a6,-1
80002140:	01052023          	sw	a6,0(a0)
80002144:	a099                	j	8000218a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80002146:	873e                	mv	a4,a5
80002148:	bfbd                	j	800020c6 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x44>
8000214a:	c331                	beqz	a4,8000218e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x10c>
8000214c:	0045a803          	lw	a6,4(a1)
80002150:	00472883          	lw	a7,4(a4)
80002154:	9846                	add	a6,a6,a7
80002156:	0105a223          	sw	a6,4(a1)
8000215a:	00052803          	lw	a6,0(a0)
8000215e:	4885                	li	a7,1
80002160:	f9180ce3          	beq	a6,a7,800020f8 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x76>
80002164:	00872303          	lw	t1,8(a4)
80002168:	f8030fe3          	beqz	t1,80002106 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x84>
8000216c:	00c72883          	lw	a7,12(a4)
80002170:	fa088be3          	beqz	a7,80002126 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xa4>
80002174:	01132623          	sw	a7,12(t1)
80002178:	00872803          	lw	a6,8(a4)
8000217c:	0108a423          	sw	a6,8(a7)
80002180:	00052803          	lw	a6,0(a0)
80002184:	187d                	addi	a6,a6,-1
80002186:	01052023          	sw	a6,0(a0)
8000218a:	c218                	sw	a4,0(a2)
8000218c:	c799                	beqz	a5,8000219a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x118>
8000218e:	43d8                	lw	a4,4(a5)
80002190:	41d0                	lw	a2,4(a1)
80002192:	9732                	add	a4,a4,a2
80002194:	c3d8                	sw	a4,4(a5)
80002196:	c28c                	sw	a1,0(a3)
80002198:	8082                	ret
8000219a:	8082                	ret

8000219c <_ZN4EPOS1S3MMU4initEv>:
8000219c:	7159                	addi	sp,sp,-112
8000219e:	d686                	sw	ra,108(sp)
800021a0:	d4a2                	sw	s0,104(sp)
800021a2:	d2a6                	sw	s1,100(sp)
800021a4:	d0ca                	sw	s2,96(sp)
800021a6:	cece                	sw	s3,92(sp)
800021a8:	ccd2                	sw	s4,88(sp)
800021aa:	cad6                	sw	s5,84(sp)
800021ac:	80004537          	lui	a0,0x80004
800021b0:	b2850513          	addi	a0,a0,-1240 # 80003b28 <__boot_stack__+0xf8003b29>
800021b4:	fffff097          	auipc	ra,0xfffff
800021b8:	932080e7          	jalr	-1742(ra) # 80000ae6 <_print>
800021bc:	80003a37          	lui	s4,0x80003
800021c0:	76ca0513          	addi	a0,s4,1900 # 8000376c <__boot_stack__+0xf800376d>
800021c4:	fffff097          	auipc	ra,0xfffff
800021c8:	922080e7          	jalr	-1758(ra) # 80000ae6 <_print>
800021cc:	800054b7          	lui	s1,0x80005
800021d0:	03448913          	addi	s2,s1,52 # 80005034 <__boot_stack__+0xf8005035>
800021d4:	49a9                	li	s3,10
800021d6:	01392023          	sw	s3,0(s2)
800021da:	80005ab7          	lui	s5,0x80005
800021de:	130a8793          	addi	a5,s5,304 # 80005130 <__boot_stack__+0xf8005131>
800021e2:	87ffc437          	lui	s0,0x87ffc
800021e6:	8c1d                	sub	s0,s0,a5
800021e8:	80004537          	lui	a0,0x80004
800021ec:	b3450513          	addi	a0,a0,-1228 # 80003b34 <__boot_stack__+0xf8003b35>
800021f0:	fffff097          	auipc	ra,0xfffff
800021f4:	8f6080e7          	jalr	-1802(ra) # 80000ae6 <_print>
800021f8:	0810                	addi	a2,sp,16
800021fa:	130a8593          	addi	a1,s5,304
800021fe:	03448513          	addi	a0,s1,52
80002202:	fffff097          	auipc	ra,0xfffff
80002206:	b7a080e7          	jalr	-1158(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
8000220a:	089c                	addi	a5,sp,80
8000220c:	953e                	add	a0,a0,a5
8000220e:	fc050023          	sb	zero,-64(a0)
80002212:	0808                	addi	a0,sp,16
80002214:	fffff097          	auipc	ra,0xfffff
80002218:	8d2080e7          	jalr	-1838(ra) # 80000ae6 <_print>
8000221c:	80004537          	lui	a0,0x80004
80002220:	b4450513          	addi	a0,a0,-1212 # 80003b44 <__boot_stack__+0xf8003b45>
80002224:	fffff097          	auipc	ra,0xfffff
80002228:	8c2080e7          	jalr	-1854(ra) # 80000ae6 <_print>
8000222c:	4681                	li	a3,0
8000222e:	0810                	addi	a2,sp,16
80002230:	85a2                	mv	a1,s0
80002232:	03448513          	addi	a0,s1,52
80002236:	fffff097          	auipc	ra,0xfffff
8000223a:	978080e7          	jalr	-1672(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000223e:	089c                	addi	a5,sp,80
80002240:	953e                	add	a0,a0,a5
80002242:	fc050023          	sb	zero,-64(a0)
80002246:	0808                	addi	a0,sp,16
80002248:	fffff097          	auipc	ra,0xfffff
8000224c:	89e080e7          	jalr	-1890(ra) # 80000ae6 <_print>
80002250:	80004537          	lui	a0,0x80004
80002254:	9d050513          	addi	a0,a0,-1584 # 800039d0 <__boot_stack__+0xf80039d1>
80002258:	fffff097          	auipc	ra,0xfffff
8000225c:	88e080e7          	jalr	-1906(ra) # 80000ae6 <_print>
80002260:	76ca0513          	addi	a0,s4,1900
80002264:	fffff097          	auipc	ra,0xfffff
80002268:	882080e7          	jalr	-1918(ra) # 80000ae6 <_print>
8000226c:	01392023          	sw	s3,0(s2)
80002270:	47c1                	li	a5,16
80002272:	0087fc63          	bgeu	a5,s0,8000228a <_ZN4EPOS1S3MMU4initEv+0xee>
80002276:	e461                	bnez	s0,8000233e <_ZN4EPOS1S3MMU4initEv+0x1a2>
80002278:	50b6                	lw	ra,108(sp)
8000227a:	5426                	lw	s0,104(sp)
8000227c:	5496                	lw	s1,100(sp)
8000227e:	5906                	lw	s2,96(sp)
80002280:	49f6                	lw	s3,92(sp)
80002282:	4a66                	lw	s4,88(sp)
80002284:	4ad6                	lw	s5,84(sp)
80002286:	6165                	addi	sp,sp,112
80002288:	8082                	ret
8000228a:	8926                	mv	s2,s1
8000228c:	03448493          	addi	s1,s1,52
80002290:	4785                	li	a5,1
80002292:	00f48223          	sb	a5,4(s1)
80002296:	80004537          	lui	a0,0x80004
8000229a:	97c50513          	addi	a0,a0,-1668 # 8000397c <__boot_stack__+0xf800397d>
8000229e:	fffff097          	auipc	ra,0xfffff
800022a2:	848080e7          	jalr	-1976(ra) # 80000ae6 <_print>
800022a6:	80004537          	lui	a0,0x80004
800022aa:	b4850513          	addi	a0,a0,-1208 # 80003b48 <__boot_stack__+0xf8003b49>
800022ae:	fffff097          	auipc	ra,0xfffff
800022b2:	838080e7          	jalr	-1992(ra) # 80000ae6 <_print>
800022b6:	80004537          	lui	a0,0x80004
800022ba:	99c50513          	addi	a0,a0,-1636 # 8000399c <__boot_stack__+0xf800399d>
800022be:	fffff097          	auipc	ra,0xfffff
800022c2:	828080e7          	jalr	-2008(ra) # 80000ae6 <_print>
800022c6:	80004537          	lui	a0,0x80004
800022ca:	b6450513          	addi	a0,a0,-1180 # 80003b64 <__boot_stack__+0xf8003b65>
800022ce:	fffff097          	auipc	ra,0xfffff
800022d2:	818080e7          	jalr	-2024(ra) # 80000ae6 <_print>
800022d6:	80004537          	lui	a0,0x80004
800022da:	9d450513          	addi	a0,a0,-1580 # 800039d4 <__boot_stack__+0xf80039d5>
800022de:	fffff097          	auipc	ra,0xfffff
800022e2:	808080e7          	jalr	-2040(ra) # 80000ae6 <_print>
800022e6:	80004537          	lui	a0,0x80004
800022ea:	bbc50513          	addi	a0,a0,-1092 # 80003bbc <__boot_stack__+0xf8003bbd>
800022ee:	ffffe097          	auipc	ra,0xffffe
800022f2:	7f8080e7          	jalr	2040(ra) # 80000ae6 <_print>
800022f6:	80004537          	lui	a0,0x80004
800022fa:	9e850513          	addi	a0,a0,-1560 # 800039e8 <__boot_stack__+0xf80039e9>
800022fe:	ffffe097          	auipc	ra,0xffffe
80002302:	7e8080e7          	jalr	2024(ra) # 80000ae6 <_print>
80002306:	4681                	li	a3,0
80002308:	0810                	addi	a2,sp,16
8000230a:	07d00593          	li	a1,125
8000230e:	03490513          	addi	a0,s2,52
80002312:	fffff097          	auipc	ra,0xfffff
80002316:	89c080e7          	jalr	-1892(ra) # 80000bae <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000231a:	089c                	addi	a5,sp,80
8000231c:	953e                	add	a0,a0,a5
8000231e:	fc050023          	sb	zero,-64(a0)
80002322:	0808                	addi	a0,sp,16
80002324:	ffffe097          	auipc	ra,0xffffe
80002328:	7c2080e7          	jalr	1986(ra) # 80000ae6 <_print>
8000232c:	76ca0513          	addi	a0,s4,1900
80002330:	ffffe097          	auipc	ra,0xffffe
80002334:	7b6080e7          	jalr	1974(ra) # 80000ae6 <_print>
80002338:	47a9                	li	a5,10
8000233a:	c09c                	sw	a5,0(s1)
8000233c:	bf2d                	j	80002276 <_ZN4EPOS1S3MMU4initEv+0xda>
8000233e:	800055b7          	lui	a1,0x80005
80002342:	13058793          	addi	a5,a1,304 # 80005130 <__boot_stack__+0xf8005131>
80002346:	12f5a823          	sw	a5,304(a1)
8000234a:	c3c0                	sw	s0,4(a5)
8000234c:	0007a423          	sw	zero,8(a5)
80002350:	0007a623          	sw	zero,12(a5)
80002354:	0814                	addi	a3,sp,16
80002356:	0070                	addi	a2,sp,12
80002358:	13058593          	addi	a1,a1,304
8000235c:	80005537          	lui	a0,0x80005
80002360:	12050513          	addi	a0,a0,288 # 80005120 <__boot_stack__+0xf8005121>
80002364:	00000097          	auipc	ra,0x0
80002368:	d1e080e7          	jalr	-738(ra) # 80002082 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>
8000236c:	b731                	j	80002278 <_ZN4EPOS1S3MMU4initEv+0xdc>

8000236e <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>:
8000236e:	711d                	addi	sp,sp,-96
80002370:	ce86                	sw	ra,92(sp)
80002372:	cca2                	sw	s0,88(sp)
80002374:	caa6                	sw	s1,84(sp)
80002376:	c8ca                	sw	s2,80(sp)
80002378:	c6ce                	sw	s3,76(sp)
8000237a:	c4d2                	sw	s4,72(sp)
8000237c:	f14027f3          	csrr	a5,mhartid
80002380:	8b8d                	andi	a5,a5,3
80002382:	c7c5                	beqz	a5,8000242a <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0xbc>
80002384:	800049b7          	lui	s3,0x80004
80002388:	c1898513          	addi	a0,s3,-1000 # 80003c18 <__boot_stack__+0xf8003c19>
8000238c:	ffffe097          	auipc	ra,0xffffe
80002390:	75a080e7          	jalr	1882(ra) # 80000ae6 <_print>
80002394:	80003937          	lui	s2,0x80003
80002398:	76c90513          	addi	a0,s2,1900 # 8000376c <__boot_stack__+0xf800376d>
8000239c:	ffffe097          	auipc	ra,0xffffe
800023a0:	74a080e7          	jalr	1866(ra) # 80000ae6 <_print>
800023a4:	80005a37          	lui	s4,0x80005
800023a8:	034a0413          	addi	s0,s4,52 # 80005034 <__boot_stack__+0xf8005035>
800023ac:	44a9                	li	s1,10
800023ae:	c004                	sw	s1,0(s0)
800023b0:	c1898513          	addi	a0,s3,-1000
800023b4:	ffffe097          	auipc	ra,0xffffe
800023b8:	732080e7          	jalr	1842(ra) # 80000ae6 <_print>
800023bc:	76c90513          	addi	a0,s2,1900
800023c0:	ffffe097          	auipc	ra,0xffffe
800023c4:	726080e7          	jalr	1830(ra) # 80000ae6 <_print>
800023c8:	c004                	sw	s1,0(s0)
800023ca:	c01029f3          	rdtime	s3
800023ce:	80004537          	lui	a0,0x80004
800023d2:	c2c50513          	addi	a0,a0,-980 # 80003c2c <__boot_stack__+0xf8003c2d>
800023d6:	ffffe097          	auipc	ra,0xffffe
800023da:	710080e7          	jalr	1808(ra) # 80000ae6 <_print>
800023de:	4701                	li	a4,0
800023e0:	868a                	mv	a3,sp
800023e2:	85ce                	mv	a1,s3
800023e4:	4601                	li	a2,0
800023e6:	034a0513          	addi	a0,s4,52
800023ea:	fffff097          	auipc	ra,0xfffff
800023ee:	878080e7          	jalr	-1928(ra) # 80000c62 <_ZN4EPOS1S1U7OStream6llutoaEyPcj>
800023f2:	009c                	addi	a5,sp,64
800023f4:	953e                	add	a0,a0,a5
800023f6:	fc050023          	sb	zero,-64(a0)
800023fa:	850a                	mv	a0,sp
800023fc:	ffffe097          	auipc	ra,0xffffe
80002400:	6ea080e7          	jalr	1770(ra) # 80000ae6 <_print>
80002404:	76c90513          	addi	a0,s2,1900
80002408:	ffffe097          	auipc	ra,0xffffe
8000240c:	6de080e7          	jalr	1758(ra) # 80000ae6 <_print>
80002410:	c004                	sw	s1,0(s0)
80002412:	f14027f3          	csrr	a5,mhartid
80002416:	8b8d                	andi	a5,a5,3
80002418:	c7a9                	beqz	a5,80002462 <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0xf4>
8000241a:	40f6                	lw	ra,92(sp)
8000241c:	4466                	lw	s0,88(sp)
8000241e:	44d6                	lw	s1,84(sp)
80002420:	4946                	lw	s2,80(sp)
80002422:	49b6                	lw	s3,76(sp)
80002424:	4a26                	lw	s4,72(sp)
80002426:	6125                	addi	sp,sp,96
80002428:	8082                	ret
8000242a:	100007b7          	lui	a5,0x10000
8000242e:	470d                	li	a4,3
80002430:	00e781a3          	sb	a4,3(a5) # 10000003 <_vector_table-0x6ffffffd>
80002434:	4685                	li	a3,1
80002436:	00d78123          	sb	a3,2(a5)
8000243a:	f8300693          	li	a3,-125
8000243e:	00d781a3          	sb	a3,3(a5)
80002442:	46b5                	li	a3,13
80002444:	00d78023          	sb	a3,0(a5)
80002448:	000780a3          	sb	zero,1(a5)
8000244c:	00e781a3          	sb	a4,3(a5)
80002450:	800057b7          	lui	a5,0x80005
80002454:	0607a223          	sw	zero,100(a5) # 80005064 <__boot_stack__+0xf8005065>
80002458:	800057b7          	lui	a5,0x80005
8000245c:	0607a423          	sw	zero,104(a5) # 80005068 <__boot_stack__+0xf8005069>
80002460:	b715                	j	80002384 <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0x16>
80002462:	00000097          	auipc	ra,0x0
80002466:	2bc080e7          	jalr	700(ra) # 8000271e <_ZN4EPOS1S2IC4initEv>
8000246a:	bf45                	j	8000241a <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0xac>

8000246c <_ZN4EPOS1S7Machine4initEv>:
8000246c:	1141                	addi	sp,sp,-16
8000246e:	c606                	sw	ra,12(sp)
80002470:	80004537          	lui	a0,0x80004
80002474:	c3850513          	addi	a0,a0,-968 # 80003c38 <__boot_stack__+0xf8003c39>
80002478:	ffffe097          	auipc	ra,0xffffe
8000247c:	66e080e7          	jalr	1646(ra) # 80000ae6 <_print>
80002480:	80003537          	lui	a0,0x80003
80002484:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80002488:	ffffe097          	auipc	ra,0xffffe
8000248c:	65e080e7          	jalr	1630(ra) # 80000ae6 <_print>
80002490:	800057b7          	lui	a5,0x80005
80002494:	4729                	li	a4,10
80002496:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
8000249a:	00000097          	auipc	ra,0x0
8000249e:	00e080e7          	jalr	14(ra) # 800024a8 <_ZN4EPOS1S5Timer4initEv>
800024a2:	40b2                	lw	ra,12(sp)
800024a4:	0141                	addi	sp,sp,16
800024a6:	8082                	ret

800024a8 <_ZN4EPOS1S5Timer4initEv>:
800024a8:	1141                	addi	sp,sp,-16
800024aa:	c606                	sw	ra,12(sp)
800024ac:	80004537          	lui	a0,0x80004
800024b0:	c4850513          	addi	a0,a0,-952 # 80003c48 <__boot_stack__+0xf8003c49>
800024b4:	ffffe097          	auipc	ra,0xffffe
800024b8:	632080e7          	jalr	1586(ra) # 80000ae6 <_print>
800024bc:	80003537          	lui	a0,0x80003
800024c0:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
800024c4:	ffffe097          	auipc	ra,0xffffe
800024c8:	622080e7          	jalr	1570(ra) # 80000ae6 <_print>
800024cc:	800057b7          	lui	a5,0x80005
800024d0:	4729                	li	a4,10
800024d2:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
800024d6:	80005737          	lui	a4,0x80005
800024da:	800037b7          	lui	a5,0x80003
800024de:	cb078793          	addi	a5,a5,-848 # 80002cb0 <__boot_stack__+0xf8002cb1>
800024e2:	0af72a23          	sw	a5,180(a4) # 800050b4 <__boot_stack__+0xf80050b5>
800024e6:	40b2                	lw	ra,12(sp)
800024e8:	0141                	addi	sp,sp,16
800024ea:	8082                	ret

800024ec <_ZN4EPOS1S6System4initEv>:
800024ec:	1141                	addi	sp,sp,-16
800024ee:	c606                	sw	ra,12(sp)
800024f0:	00000097          	auipc	ra,0x0
800024f4:	284080e7          	jalr	644(ra) # 80002774 <_ZN4EPOS1S5Alarm4initEv>
800024f8:	00000097          	auipc	ra,0x0
800024fc:	0c6080e7          	jalr	198(ra) # 800025be <_ZN4EPOS1S6Thread4initEv>
80002500:	40b2                	lw	ra,12(sp)
80002502:	0141                	addi	sp,sp,16
80002504:	8082                	ret

80002506 <_ZN4EPOS1S1U4Heap5allocEj>:
80002506:	cdc1                	beqz	a1,8000259e <_ZN4EPOS1S1U4Heap5allocEj+0x98>
80002508:	0035f793          	andi	a5,a1,3
8000250c:	c789                	beqz	a5,80002516 <_ZN4EPOS1S1U4Heap5allocEj+0x10>
8000250e:	0585                	addi	a1,a1,1
80002510:	0035f793          	andi	a5,a1,3
80002514:	ffed                	bnez	a5,8000250e <_ZN4EPOS1S1U4Heap5allocEj+0x8>
80002516:	0591                	addi	a1,a1,4
80002518:	47c1                	li	a5,16
8000251a:	00f5f363          	bgeu	a1,a5,80002520 <_ZN4EPOS1S1U4Heap5allocEj+0x1a>
8000251e:	45c1                	li	a1,16
80002520:	415c                	lw	a5,4(a0)
80002522:	cb91                	beqz	a5,80002536 <_ZN4EPOS1S1U4Heap5allocEj+0x30>
80002524:	01058693          	addi	a3,a1,16
80002528:	43d8                	lw	a4,4(a5)
8000252a:	06d77c63          	bgeu	a4,a3,800025a2 <_ZN4EPOS1S1U4Heap5allocEj+0x9c>
8000252e:	06e58a63          	beq	a1,a4,800025a2 <_ZN4EPOS1S1U4Heap5allocEj+0x9c>
80002532:	47dc                	lw	a5,12(a5)
80002534:	fbf5                	bnez	a5,80002528 <_ZN4EPOS1S1U4Heap5allocEj+0x22>
80002536:	1141                	addi	sp,sp,-16
80002538:	c606                	sw	ra,12(sp)
8000253a:	00001097          	auipc	ra,0x1
8000253e:	aa0080e7          	jalr	-1376(ra) # 80002fda <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
80002542:	4501                	li	a0,0
80002544:	40b2                	lw	ra,12(sp)
80002546:	0141                	addi	sp,sp,16
80002548:	8082                	ret
8000254a:	4118                	lw	a4,0(a0)
8000254c:	4685                	li	a3,1
8000254e:	00d70d63          	beq	a4,a3,80002568 <_ZN4EPOS1S1U4Heap5allocEj+0x62>
80002552:	4790                	lw	a2,8(a5)
80002554:	c20d                	beqz	a2,80002576 <_ZN4EPOS1S1U4Heap5allocEj+0x70>
80002556:	47d4                	lw	a3,12(a5)
80002558:	ca8d                	beqz	a3,8000258a <_ZN4EPOS1S1U4Heap5allocEj+0x84>
8000255a:	c654                	sw	a3,12(a2)
8000255c:	4798                	lw	a4,8(a5)
8000255e:	c698                	sw	a4,8(a3)
80002560:	4118                	lw	a4,0(a0)
80002562:	177d                	addi	a4,a4,-1
80002564:	c118                	sw	a4,0(a0)
80002566:	a0a9                	j	800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80002568:	00052223          	sw	zero,4(a0)
8000256c:	00052423          	sw	zero,8(a0)
80002570:	00052023          	sw	zero,0(a0)
80002574:	a835                	j	800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80002576:	cf0d                	beqz	a4,800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80002578:	4158                	lw	a4,4(a0)
8000257a:	4758                	lw	a4,12(a4)
8000257c:	c158                	sw	a4,4(a0)
8000257e:	00072423          	sw	zero,8(a4)
80002582:	4118                	lw	a4,0(a0)
80002584:	177d                	addi	a4,a4,-1
80002586:	c118                	sw	a4,0(a0)
80002588:	a025                	j	800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
8000258a:	c31d                	beqz	a4,800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
8000258c:	4518                	lw	a4,8(a0)
8000258e:	4718                	lw	a4,8(a4)
80002590:	c518                	sw	a4,8(a0)
80002592:	00072623          	sw	zero,12(a4)
80002596:	4118                	lw	a4,0(a0)
80002598:	177d                	addi	a4,a4,-1
8000259a:	c118                	sw	a4,0(a0)
8000259c:	a811                	j	800025b0 <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
8000259e:	4501                	li	a0,0
800025a0:	8082                	ret
800025a2:	8f0d                	sub	a4,a4,a1
800025a4:	c3d8                	sw	a4,4(a5)
800025a6:	4558                	lw	a4,12(a0)
800025a8:	8f0d                	sub	a4,a4,a1
800025aa:	c558                	sw	a4,12(a0)
800025ac:	43d8                	lw	a4,4(a5)
800025ae:	df51                	beqz	a4,8000254a <_ZN4EPOS1S1U4Heap5allocEj+0x44>
800025b0:	4398                	lw	a4,0(a5)
800025b2:	43dc                	lw	a5,4(a5)
800025b4:	97ba                	add	a5,a5,a4
800025b6:	00478513          	addi	a0,a5,4
800025ba:	c38c                	sw	a1,0(a5)
800025bc:	8082                	ret

800025be <_ZN4EPOS1S6Thread4initEv>:
800025be:	7119                	addi	sp,sp,-128
800025c0:	de86                	sw	ra,124(sp)
800025c2:	dca2                	sw	s0,120(sp)
800025c4:	daa6                	sw	s1,116(sp)
800025c6:	d8ca                	sw	s2,112(sp)
800025c8:	d6ce                	sw	s3,108(sp)
800025ca:	80004537          	lui	a0,0x80004
800025ce:	c5850513          	addi	a0,a0,-936 # 80003c58 <__boot_stack__+0xf8003c59>
800025d2:	ffffe097          	auipc	ra,0xffffe
800025d6:	514080e7          	jalr	1300(ra) # 80000ae6 <_print>
800025da:	80003537          	lui	a0,0x80003
800025de:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
800025e2:	ffffe097          	auipc	ra,0xffffe
800025e6:	504080e7          	jalr	1284(ra) # 80000ae6 <_print>
800025ea:	800057b7          	lui	a5,0x80005
800025ee:	4729                	li	a4,10
800025f0:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
800025f4:	d002                	sw	zero,32(sp)
800025f6:	d202                	sw	zero,36(sp)
800025f8:	d402                	sw	zero,40(sp)
800025fa:	d602                	sw	zero,44(sp)
800025fc:	5782                	lw	a5,32(sp)
800025fe:	c63e                	sw	a5,12(sp)
80002600:	c802                	sw	zero,16(sp)
80002602:	ca02                	sw	zero,20(sp)
80002604:	cc02                	sw	zero,24(sp)
80002606:	800059b7          	lui	s3,0x80005
8000260a:	03000593          	li	a1,48
8000260e:	0449a503          	lw	a0,68(s3) # 80005044 <__boot_stack__+0xf8005045>
80002612:	00000097          	auipc	ra,0x0
80002616:	ef4080e7          	jalr	-268(ra) # 80002506 <_ZN4EPOS1S1U4Heap5allocEj>
8000261a:	842a                	mv	s0,a0
8000261c:	00052423          	sw	zero,8(a0)
80002620:	00052623          	sw	zero,12(a0)
80002624:	00052823          	sw	zero,16(a0)
80002628:	c948                	sw	a0,20(a0)
8000262a:	47b2                	lw	a5,12(sp)
8000262c:	cd1c                	sw	a5,24(a0)
8000262e:	47c2                	lw	a5,16(sp)
80002630:	cd5c                	sw	a5,28(a0)
80002632:	47d2                	lw	a5,20(sp)
80002634:	d11c                	sw	a5,32(a0)
80002636:	47e2                	lw	a5,24(sp)
80002638:	d15c                	sw	a5,36(a0)
8000263a:	02052423          	sw	zero,40(a0)
8000263e:	02052623          	sw	zero,44(a0)
80002642:	6591                	lui	a1,0x4
80002644:	fffff097          	auipc	ra,0xfffff
80002648:	e58080e7          	jalr	-424(ra) # 8000149c <_ZN4EPOS1S6Thread20constructor_prologueEj>
8000264c:	800007b7          	lui	a5,0x80000
80002650:	11078793          	addi	a5,a5,272 # 80000110 <__boot_stack__+0xf8000111>
80002654:	800014b7          	lui	s1,0x80001
80002658:	ad248493          	addi	s1,s1,-1326 # 80000ad2 <__boot_stack__+0xf8000ad3>
8000265c:	6911                	lui	s2,0x4
8000265e:	4018                	lw	a4,0(s0)
80002660:	974a                	add	a4,a4,s2
80002662:	f8c70693          	addi	a3,a4,-116
80002666:	f8972623          	sw	s1,-116(a4)
8000266a:	fef72e23          	sw	a5,-4(a4)
8000266e:	c054                	sw	a3,4(s0)
80002670:	cebe                	sw	a5,92(sp)
80002672:	6611                	lui	a2,0x4
80002674:	08ec                	addi	a1,sp,92
80002676:	8522                	mv	a0,s0
80002678:	fffff097          	auipc	ra,0xfffff
8000267c:	256080e7          	jalr	598(ra) # 800018ce <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80002680:	800007b7          	lui	a5,0x80000
80002684:	fff7c793          	not	a5,a5
80002688:	c4be                	sw	a5,72(sp)
8000268a:	c682                	sw	zero,76(sp)
8000268c:	c882                	sw	zero,80(sp)
8000268e:	ca82                	sw	zero,84(sp)
80002690:	47a6                	lw	a5,72(sp)
80002692:	da3e                	sw	a5,52(sp)
80002694:	dc02                	sw	zero,56(sp)
80002696:	de02                	sw	zero,60(sp)
80002698:	c082                	sw	zero,64(sp)
8000269a:	03000593          	li	a1,48
8000269e:	0449a503          	lw	a0,68(s3)
800026a2:	00000097          	auipc	ra,0x0
800026a6:	e64080e7          	jalr	-412(ra) # 80002506 <_ZN4EPOS1S1U4Heap5allocEj>
800026aa:	842a                	mv	s0,a0
800026ac:	4985                	li	s3,1
800026ae:	01352423          	sw	s3,8(a0)
800026b2:	00052623          	sw	zero,12(a0)
800026b6:	00052823          	sw	zero,16(a0)
800026ba:	c948                	sw	a0,20(a0)
800026bc:	57d2                	lw	a5,52(sp)
800026be:	cd1c                	sw	a5,24(a0)
800026c0:	57e2                	lw	a5,56(sp)
800026c2:	cd5c                	sw	a5,28(a0)
800026c4:	57f2                	lw	a5,60(sp)
800026c6:	d11c                	sw	a5,32(a0)
800026c8:	4786                	lw	a5,64(sp)
800026ca:	d15c                	sw	a5,36(a0)
800026cc:	02052423          	sw	zero,40(a0)
800026d0:	02052623          	sw	zero,44(a0)
800026d4:	6591                	lui	a1,0x4
800026d6:	fffff097          	auipc	ra,0xfffff
800026da:	dc6080e7          	jalr	-570(ra) # 8000149c <_ZN4EPOS1S6Thread20constructor_prologueEj>
800026de:	800027b7          	lui	a5,0x80002
800026e2:	f9478793          	addi	a5,a5,-108 # 80001f94 <__boot_stack__+0xf8001f95>
800026e6:	4018                	lw	a4,0(s0)
800026e8:	974a                	add	a4,a4,s2
800026ea:	f8c70693          	addi	a3,a4,-116
800026ee:	f8972623          	sw	s1,-116(a4)
800026f2:	fef72e23          	sw	a5,-4(a4)
800026f6:	c054                	sw	a3,4(s0)
800026f8:	ccbe                	sw	a5,88(sp)
800026fa:	6611                	lui	a2,0x4
800026fc:	08ac                	addi	a1,sp,88
800026fe:	8522                	mv	a0,s0
80002700:	fffff097          	auipc	ra,0xfffff
80002704:	1ce080e7          	jalr	462(ra) # 800018ce <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80002708:	800057b7          	lui	a5,0x80005
8000270c:	05378a23          	sb	s3,84(a5) # 80005054 <__boot_stack__+0xf8005055>
80002710:	50f6                	lw	ra,124(sp)
80002712:	5466                	lw	s0,120(sp)
80002714:	54d6                	lw	s1,116(sp)
80002716:	5946                	lw	s2,112(sp)
80002718:	59b6                	lw	s3,108(sp)
8000271a:	6109                	addi	sp,sp,128
8000271c:	8082                	ret

8000271e <_ZN4EPOS1S2IC4initEv>:
8000271e:	1141                	addi	sp,sp,-16
80002720:	c606                	sw	ra,12(sp)
80002722:	80004537          	lui	a0,0x80004
80002726:	c6850513          	addi	a0,a0,-920 # 80003c68 <__boot_stack__+0xf8003c69>
8000272a:	ffffe097          	auipc	ra,0xffffe
8000272e:	3bc080e7          	jalr	956(ra) # 80000ae6 <_print>
80002732:	80003537          	lui	a0,0x80003
80002736:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
8000273a:	ffffe097          	auipc	ra,0xffffe
8000273e:	3ac080e7          	jalr	940(ra) # 80000ae6 <_print>
80002742:	800057b7          	lui	a5,0x80005
80002746:	4729                	li	a4,10
80002748:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
8000274c:	4781                	li	a5,0
8000274e:	30479073          	csrw	mie,a5
80002752:	800057b7          	lui	a5,0x80005
80002756:	0a078793          	addi	a5,a5,160 # 800050a0 <__boot_stack__+0xf80050a1>
8000275a:	08078693          	addi	a3,a5,128
8000275e:	80003737          	lui	a4,0x80003
80002762:	b2870713          	addi	a4,a4,-1240 # 80002b28 <__boot_stack__+0xf8002b29>
80002766:	c398                	sw	a4,0(a5)
80002768:	0791                	addi	a5,a5,4
8000276a:	fed79ee3          	bne	a5,a3,80002766 <_ZN4EPOS1S2IC4initEv+0x48>
8000276e:	40b2                	lw	ra,12(sp)
80002770:	0141                	addi	sp,sp,16
80002772:	8082                	ret

80002774 <_ZN4EPOS1S5Alarm4initEv>:
80002774:	1141                	addi	sp,sp,-16
80002776:	c606                	sw	ra,12(sp)
80002778:	80004537          	lui	a0,0x80004
8000277c:	c7450513          	addi	a0,a0,-908 # 80003c74 <__boot_stack__+0xf8003c75>
80002780:	ffffe097          	auipc	ra,0xffffe
80002784:	366080e7          	jalr	870(ra) # 80000ae6 <_print>
80002788:	80003537          	lui	a0,0x80003
8000278c:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
80002790:	ffffe097          	auipc	ra,0xffffe
80002794:	356080e7          	jalr	854(ra) # 80000ae6 <_print>
80002798:	800057b7          	lui	a5,0x80005
8000279c:	4729                	li	a4,10
8000279e:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
800027a2:	800057b7          	lui	a5,0x80005
800027a6:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
800027aa:	415c                	lw	a5,4(a0)
800027ac:	cb99                	beqz	a5,800027c2 <_ZN4EPOS1S5Alarm4initEv+0x4e>
800027ae:	02700693          	li	a3,39
800027b2:	4661                	li	a2,24
800027b4:	43d8                	lw	a4,4(a5)
800027b6:	06e6eb63          	bltu	a3,a4,8000282c <_ZN4EPOS1S5Alarm4initEv+0xb8>
800027ba:	06c70963          	beq	a4,a2,8000282c <_ZN4EPOS1S5Alarm4initEv+0xb8>
800027be:	47dc                	lw	a5,12(a5)
800027c0:	fbf5                	bnez	a5,800027b4 <_ZN4EPOS1S5Alarm4initEv+0x40>
800027c2:	00001097          	auipc	ra,0x1
800027c6:	818080e7          	jalr	-2024(ra) # 80002fda <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
800027ca:	4781                	li	a5,0
800027cc:	a8b5                	j	80002848 <_ZN4EPOS1S5Alarm4initEv+0xd4>
800027ce:	4118                	lw	a4,0(a0)
800027d0:	4685                	li	a3,1
800027d2:	00d70d63          	beq	a4,a3,800027ec <_ZN4EPOS1S5Alarm4initEv+0x78>
800027d6:	4790                	lw	a2,8(a5)
800027d8:	c20d                	beqz	a2,800027fa <_ZN4EPOS1S5Alarm4initEv+0x86>
800027da:	47d4                	lw	a3,12(a5)
800027dc:	ca8d                	beqz	a3,8000280e <_ZN4EPOS1S5Alarm4initEv+0x9a>
800027de:	c654                	sw	a3,12(a2)
800027e0:	4798                	lw	a4,8(a5)
800027e2:	c698                	sw	a4,8(a3)
800027e4:	4118                	lw	a4,0(a0)
800027e6:	177d                	addi	a4,a4,-1
800027e8:	c118                	sw	a4,0(a0)
800027ea:	a881                	j	8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
800027ec:	00052223          	sw	zero,4(a0)
800027f0:	00052423          	sw	zero,8(a0)
800027f4:	00052023          	sw	zero,0(a0)
800027f8:	a089                	j	8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
800027fa:	c321                	beqz	a4,8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
800027fc:	4158                	lw	a4,4(a0)
800027fe:	4758                	lw	a4,12(a4)
80002800:	c158                	sw	a4,4(a0)
80002802:	00072423          	sw	zero,8(a4)
80002806:	4118                	lw	a4,0(a0)
80002808:	177d                	addi	a4,a4,-1
8000280a:	c118                	sw	a4,0(a0)
8000280c:	a03d                	j	8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
8000280e:	c715                	beqz	a4,8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
80002810:	4518                	lw	a4,8(a0)
80002812:	4718                	lw	a4,8(a4)
80002814:	c518                	sw	a4,8(a0)
80002816:	00072623          	sw	zero,12(a4)
8000281a:	4118                	lw	a4,0(a0)
8000281c:	177d                	addi	a4,a4,-1
8000281e:	c118                	sw	a4,0(a0)
80002820:	a829                	j	8000283a <_ZN4EPOS1S5Alarm4initEv+0xc6>
80002822:	80005737          	lui	a4,0x80005
80002826:	06f72823          	sw	a5,112(a4) # 80005070 <__boot_stack__+0xf8005071>
8000282a:	a835                	j	80002866 <_ZN4EPOS1S5Alarm4initEv+0xf2>
8000282c:	1721                	addi	a4,a4,-24
8000282e:	c3d8                	sw	a4,4(a5)
80002830:	4558                	lw	a4,12(a0)
80002832:	1721                	addi	a4,a4,-24
80002834:	c558                	sw	a4,12(a0)
80002836:	43d8                	lw	a4,4(a5)
80002838:	db59                	beqz	a4,800027ce <_ZN4EPOS1S5Alarm4initEv+0x5a>
8000283a:	4398                	lw	a4,0(a5)
8000283c:	43dc                	lw	a5,4(a5)
8000283e:	973e                	add	a4,a4,a5
80002840:	00470793          	addi	a5,a4,4
80002844:	46e1                	li	a3,24
80002846:	c314                	sw	a3,0(a4)
80002848:	4705                	li	a4,1
8000284a:	c398                	sw	a4,0(a5)
8000284c:	c3d8                	sw	a4,4(a5)
8000284e:	00e78423          	sb	a4,8(a5)
80002852:	80003737          	lui	a4,0x80003
80002856:	87870713          	addi	a4,a4,-1928 # 80002878 <__boot_stack__+0xf8002879>
8000285a:	cb98                	sw	a4,16(a5)
8000285c:	80005737          	lui	a4,0x80005
80002860:	07072703          	lw	a4,112(a4) # 80005070 <__boot_stack__+0xf8005071>
80002864:	df5d                	beqz	a4,80002822 <_ZN4EPOS1S5Alarm4initEv+0xae>
80002866:	4705                	li	a4,1
80002868:	c7d8                	sw	a4,12(a5)
8000286a:	80005737          	lui	a4,0x80005
8000286e:	04f72e23          	sw	a5,92(a4) # 8000505c <__boot_stack__+0xf800505d>
80002872:	40b2                	lw	ra,12(sp)
80002874:	0141                	addi	sp,sp,16
80002876:	8082                	ret

80002878 <_ZN4EPOS1S5Alarm7handlerEj>:
80002878:	4781                	li	a5,0
8000287a:	30479073          	csrw	mie,a5
8000287e:	800057b7          	lui	a5,0x80005
80002882:	06078793          	addi	a5,a5,96 # 80005060 <__boot_stack__+0xf8005061>
80002886:	4398                	lw	a4,0(a5)
80002888:	0705                	addi	a4,a4,1
8000288a:	c398                	sw	a4,0(a5)
8000288c:	800057b7          	lui	a5,0x80005
80002890:	0947a703          	lw	a4,148(a5) # 80005094 <__boot_stack__+0xf8005095>
80002894:	e711                	bnez	a4,800028a0 <_ZN4EPOS1S5Alarm7handlerEj+0x28>
80002896:	08800793          	li	a5,136
8000289a:	30479073          	csrw	mie,a5
8000289e:	8082                	ret
800028a0:	800057b7          	lui	a5,0x80005
800028a4:	0987a683          	lw	a3,152(a5) # 80005098 <__boot_stack__+0xf8005099>
800028a8:	42dc                	lw	a5,4(a3)
800028aa:	17fd                	addi	a5,a5,-1
800028ac:	c2dc                	sw	a5,4(a3)
800028ae:	00f05763          	blez	a5,800028bc <_ZN4EPOS1S5Alarm7handlerEj+0x44>
800028b2:	08800793          	li	a5,136
800028b6:	30479073          	csrw	mie,a5
800028ba:	8082                	ret
800028bc:	715d                	addi	sp,sp,-80
800028be:	c686                	sw	ra,76(sp)
800028c0:	c4a2                	sw	s0,72(sp)
800028c2:	c2a6                	sw	s1,68(sp)
800028c4:	800057b7          	lui	a5,0x80005
800028c8:	0987a683          	lw	a3,152(a5) # 80005098 <__boot_stack__+0xf8005099>
800028cc:	4785                	li	a5,1
800028ce:	10f70e63          	beq	a4,a5,800029ea <_ZN4EPOS1S5Alarm7handlerEj+0x172>
800028d2:	46d0                	lw	a2,12(a3)
800028d4:	800057b7          	lui	a5,0x80005
800028d8:	09478793          	addi	a5,a5,148 # 80005094 <__boot_stack__+0xf8005095>
800028dc:	c3d0                	sw	a2,4(a5)
800028de:	00062423          	sw	zero,8(a2) # 4008 <_vector_table-0x7fffbff8>
800028e2:	177d                	addi	a4,a4,-1
800028e4:	c398                	sw	a4,0(a5)
800028e6:	46dc                	lw	a5,12(a3)
800028e8:	c789                	beqz	a5,800028f2 <_ZN4EPOS1S5Alarm7handlerEj+0x7a>
800028ea:	43d8                	lw	a4,4(a5)
800028ec:	42d0                	lw	a2,4(a3)
800028ee:	9732                	add	a4,a4,a2
800028f0:	c3d8                	sw	a4,4(a5)
800028f2:	4280                	lw	s0,0(a3)
800028f4:	441c                	lw	a5,8(s0)
800028f6:	577d                	li	a4,-1
800028f8:	10e78663          	beq	a5,a4,80002a04 <_ZN4EPOS1S5Alarm7handlerEj+0x18c>
800028fc:	17fd                	addi	a5,a5,-1
800028fe:	c41c                	sw	a5,8(s0)
80002900:	10079263          	bnez	a5,80002a04 <_ZN4EPOS1S5Alarm7handlerEj+0x18c>
80002904:	08800793          	li	a5,136
80002908:	30479073          	csrw	mie,a5
8000290c:	80004537          	lui	a0,0x80004
80002910:	c8450513          	addi	a0,a0,-892 # 80003c84 <__boot_stack__+0xf8003c85>
80002914:	ffffe097          	auipc	ra,0xffffe
80002918:	1d2080e7          	jalr	466(ra) # 80000ae6 <_print>
8000291c:	860a                	mv	a2,sp
8000291e:	85a2                	mv	a1,s0
80002920:	800054b7          	lui	s1,0x80005
80002924:	03448513          	addi	a0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
80002928:	ffffe097          	auipc	ra,0xffffe
8000292c:	454080e7          	jalr	1108(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80002930:	009c                	addi	a5,sp,64
80002932:	953e                	add	a0,a0,a5
80002934:	fc050023          	sb	zero,-64(a0)
80002938:	850a                	mv	a0,sp
8000293a:	ffffe097          	auipc	ra,0xffffe
8000293e:	1ac080e7          	jalr	428(ra) # 80000ae6 <_print>
80002942:	80004537          	lui	a0,0x80004
80002946:	c9c50513          	addi	a0,a0,-868 # 80003c9c <__boot_stack__+0xf8003c9d>
8000294a:	ffffe097          	auipc	ra,0xffffe
8000294e:	19c080e7          	jalr	412(ra) # 80000ae6 <_print>
80002952:	800057b7          	lui	a5,0x80005
80002956:	0607a583          	lw	a1,96(a5) # 80005060 <__boot_stack__+0xf8005061>
8000295a:	860a                	mv	a2,sp
8000295c:	03448513          	addi	a0,s1,52
80002960:	ffffe097          	auipc	ra,0xffffe
80002964:	2da080e7          	jalr	730(ra) # 80000c3a <_ZN4EPOS1S1U7OStream4itoaEiPc>
80002968:	009c                	addi	a5,sp,64
8000296a:	953e                	add	a0,a0,a5
8000296c:	fc050023          	sb	zero,-64(a0)
80002970:	850a                	mv	a0,sp
80002972:	ffffe097          	auipc	ra,0xffffe
80002976:	174080e7          	jalr	372(ra) # 80000ae6 <_print>
8000297a:	80004537          	lui	a0,0x80004
8000297e:	ca050513          	addi	a0,a0,-864 # 80003ca0 <__boot_stack__+0xf8003ca1>
80002982:	ffffe097          	auipc	ra,0xffffe
80002986:	164080e7          	jalr	356(ra) # 80000ae6 <_print>
8000298a:	860a                	mv	a2,sp
8000298c:	800035b7          	lui	a1,0x80003
80002990:	87858593          	addi	a1,a1,-1928 # 80002878 <__boot_stack__+0xf8002879>
80002994:	03448513          	addi	a0,s1,52
80002998:	ffffe097          	auipc	ra,0xffffe
8000299c:	3e4080e7          	jalr	996(ra) # 80000d7c <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
800029a0:	009c                	addi	a5,sp,64
800029a2:	953e                	add	a0,a0,a5
800029a4:	fc050023          	sb	zero,-64(a0)
800029a8:	850a                	mv	a0,sp
800029aa:	ffffe097          	auipc	ra,0xffffe
800029ae:	13c080e7          	jalr	316(ra) # 80000ae6 <_print>
800029b2:	80004537          	lui	a0,0x80004
800029b6:	9d050513          	addi	a0,a0,-1584 # 800039d0 <__boot_stack__+0xf80039d1>
800029ba:	ffffe097          	auipc	ra,0xffffe
800029be:	12c080e7          	jalr	300(ra) # 80000ae6 <_print>
800029c2:	80003537          	lui	a0,0x80003
800029c6:	76c50513          	addi	a0,a0,1900 # 8000376c <__boot_stack__+0xf800376d>
800029ca:	ffffe097          	auipc	ra,0xffffe
800029ce:	11c080e7          	jalr	284(ra) # 80000ae6 <_print>
800029d2:	47a9                	li	a5,10
800029d4:	02f4aa23          	sw	a5,52(s1)
800029d8:	4048                	lw	a0,4(s0)
800029da:	411c                	lw	a5,0(a0)
800029dc:	479c                	lw	a5,8(a5)
800029de:	9782                	jalr	a5
800029e0:	40b6                	lw	ra,76(sp)
800029e2:	4426                	lw	s0,72(sp)
800029e4:	4496                	lw	s1,68(sp)
800029e6:	6161                	addi	sp,sp,80
800029e8:	8082                	ret
800029ea:	800057b7          	lui	a5,0x80005
800029ee:	09478793          	addi	a5,a5,148 # 80005094 <__boot_stack__+0xf8005095>
800029f2:	0007a223          	sw	zero,4(a5)
800029f6:	0007a423          	sw	zero,8(a5)
800029fa:	0007a023          	sw	zero,0(a5)
800029fe:	ee068ae3          	beqz	a3,800028f2 <_ZN4EPOS1S5Alarm7handlerEj+0x7a>
80002a02:	b5d5                	j	800028e6 <_ZN4EPOS1S5Alarm7handlerEj+0x6e>
80002a04:	445c                	lw	a5,12(s0)
80002a06:	c2dc                	sw	a5,4(a3)
80002a08:	800057b7          	lui	a5,0x80005
80002a0c:	0947a503          	lw	a0,148(a5) # 80005094 <__boot_stack__+0xf8005095>
80002a10:	ed01                	bnez	a0,80002a28 <_ZN4EPOS1S5Alarm7handlerEj+0x1b0>
80002a12:	0006a423          	sw	zero,8(a3)
80002a16:	0006a623          	sw	zero,12(a3)
80002a1a:	09478793          	addi	a5,a5,148
80002a1e:	c3d4                	sw	a3,4(a5)
80002a20:	c794                	sw	a3,8(a5)
80002a22:	4705                	li	a4,1
80002a24:	c398                	sw	a4,0(a5)
80002a26:	bdf9                	j	80002904 <_ZN4EPOS1S5Alarm7handlerEj+0x8c>
80002a28:	800057b7          	lui	a5,0x80005
80002a2c:	0987a703          	lw	a4,152(a5) # 80005098 <__boot_stack__+0xf8005099>
80002a30:	4350                	lw	a2,4(a4)
80002a32:	42dc                	lw	a5,4(a3)
80002a34:	00c7ca63          	blt	a5,a2,80002a48 <_ZN4EPOS1S5Alarm7handlerEj+0x1d0>
80002a38:	474c                	lw	a1,12(a4)
80002a3a:	c595                	beqz	a1,80002a66 <_ZN4EPOS1S5Alarm7handlerEj+0x1ee>
80002a3c:	8f91                	sub	a5,a5,a2
80002a3e:	c2dc                	sw	a5,4(a3)
80002a40:	4758                	lw	a4,12(a4)
80002a42:	4350                	lw	a2,4(a4)
80002a44:	fec7dae3          	bge	a5,a2,80002a38 <_ZN4EPOS1S5Alarm7handlerEj+0x1c0>
80002a48:	470c                	lw	a1,8(a4)
80002a4a:	cd9d                	beqz	a1,80002a88 <_ZN4EPOS1S5Alarm7handlerEj+0x210>
80002a4c:	40f607b3          	sub	a5,a2,a5
80002a50:	c35c                	sw	a5,4(a4)
80002a52:	c5d4                	sw	a3,12(a1)
80002a54:	c714                	sw	a3,8(a4)
80002a56:	c68c                	sw	a1,8(a3)
80002a58:	c6d8                	sw	a4,12(a3)
80002a5a:	0505                	addi	a0,a0,1
80002a5c:	800057b7          	lui	a5,0x80005
80002a60:	08a7aa23          	sw	a0,148(a5) # 80005094 <__boot_stack__+0xf8005095>
80002a64:	b545                	j	80002904 <_ZN4EPOS1S5Alarm7handlerEj+0x8c>
80002a66:	fec7c1e3          	blt	a5,a2,80002a48 <_ZN4EPOS1S5Alarm7handlerEj+0x1d0>
80002a6a:	8f91                	sub	a5,a5,a2
80002a6c:	c2dc                	sw	a5,4(a3)
80002a6e:	800057b7          	lui	a5,0x80005
80002a72:	09478793          	addi	a5,a5,148 # 80005094 <__boot_stack__+0xf8005095>
80002a76:	4798                	lw	a4,8(a5)
80002a78:	c754                	sw	a3,12(a4)
80002a7a:	c698                	sw	a4,8(a3)
80002a7c:	0006a623          	sw	zero,12(a3)
80002a80:	c794                	sw	a3,8(a5)
80002a82:	0505                	addi	a0,a0,1
80002a84:	c388                	sw	a0,0(a5)
80002a86:	bdbd                	j	80002904 <_ZN4EPOS1S5Alarm7handlerEj+0x8c>
80002a88:	40f607b3          	sub	a5,a2,a5
80002a8c:	c35c                	sw	a5,4(a4)
80002a8e:	0006a423          	sw	zero,8(a3)
80002a92:	800057b7          	lui	a5,0x80005
80002a96:	09478793          	addi	a5,a5,148 # 80005094 <__boot_stack__+0xf8005095>
80002a9a:	43d8                	lw	a4,4(a5)
80002a9c:	c6d8                	sw	a4,12(a3)
80002a9e:	c714                	sw	a3,8(a4)
80002aa0:	c3d4                	sw	a3,4(a5)
80002aa2:	0505                	addi	a0,a0,1
80002aa4:	c388                	sw	a0,0(a5)
80002aa6:	bdb9                	j	80002904 <_ZN4EPOS1S5Alarm7handlerEj+0x8c>

80002aa8 <_GLOBAL__sub_I__ZN4EPOS1S5Alarm6_timerE>:
80002aa8:	800057b7          	lui	a5,0x80005
80002aac:	09478793          	addi	a5,a5,148 # 80005094 <__boot_stack__+0xf8005095>
80002ab0:	0007a023          	sw	zero,0(a5)
80002ab4:	0007a223          	sw	zero,4(a5)
80002ab8:	0007a423          	sw	zero,8(a5)
80002abc:	8082                	ret

80002abe <_GLOBAL__sub_I__ZN4EPOS1S14Serial_Display7_engineE>:
80002abe:	100007b7          	lui	a5,0x10000
80002ac2:	470d                	li	a4,3
80002ac4:	00e781a3          	sb	a4,3(a5) # 10000003 <_vector_table-0x6ffffffd>
80002ac8:	4685                	li	a3,1
80002aca:	00d78123          	sb	a3,2(a5)
80002ace:	f8300693          	li	a3,-125
80002ad2:	00d781a3          	sb	a3,3(a5)
80002ad6:	46b5                	li	a3,13
80002ad8:	00d78023          	sb	a3,0(a5)
80002adc:	000780a3          	sb	zero,1(a5)
80002ae0:	00e781a3          	sb	a4,3(a5)
80002ae4:	8082                	ret
	...

80002ae8 <_ZN4EPOS1S2IC5entryEv>:
80002ae8:	342027f3          	csrr	a5,mcause
80002aec:	3ff7f793          	andi	a5,a5,1023
80002af0:	471d                	li	a4,7
80002af2:	00e79e63          	bne	a5,a4,80002b0e <_ZN4EPOS1S2IC5entryEv+0x26>
80002af6:	0200c7b7          	lui	a5,0x200c
80002afa:	ff87a783          	lw	a5,-8(a5) # 200bff8 <_vector_table-0x7dff4008>
80002afe:	6709                	lui	a4,0x2
80002b00:	71070713          	addi	a4,a4,1808 # 2710 <_vector_table-0x7fffd8f0>
80002b04:	97ba                	add	a5,a5,a4
80002b06:	02004737          	lui	a4,0x2004
80002b0a:	c31c                	sw	a5,0(a4)
80002b0c:	8082                	ret
80002b0e:	1141                	addi	sp,sp,-16
80002b10:	c606                	sw	ra,12(sp)
80002b12:	00000097          	auipc	ra,0x0
80002b16:	018080e7          	jalr	24(ra) # 80002b2a <_ZN4EPOS1S2IC18exception_handlingEv>
80002b1a:	00000097          	auipc	ra,0x0
80002b1e:	048080e7          	jalr	72(ra) # 80002b62 <_ZN4EPOS1S7Machine5panicEv>
80002b22:	40b2                	lw	ra,12(sp)
80002b24:	0141                	addi	sp,sp,16
80002b26:	8082                	ret

80002b28 <_ZN4EPOS1S2IC7int_notEj>:
80002b28:	8082                	ret

80002b2a <_ZN4EPOS1S2IC18exception_handlingEv>:
80002b2a:	342027f3          	csrr	a5,mcause
80002b2e:	3ff7f793          	andi	a5,a5,1023
80002b32:	471d                	li	a4,7
80002b34:	00e79e63          	bne	a5,a4,80002b50 <_ZN4EPOS1S2IC18exception_handlingEv+0x26>
80002b38:	0200c7b7          	lui	a5,0x200c
80002b3c:	ff87a783          	lw	a5,-8(a5) # 200bff8 <_vector_table-0x7dff4008>
80002b40:	6709                	lui	a4,0x2
80002b42:	71070713          	addi	a4,a4,1808 # 2710 <_vector_table-0x7fffd8f0>
80002b46:	97ba                	add	a5,a5,a4
80002b48:	02004737          	lui	a4,0x2004
80002b4c:	c31c                	sw	a5,0(a4)
80002b4e:	8082                	ret
80002b50:	1141                	addi	sp,sp,-16
80002b52:	c606                	sw	ra,12(sp)
80002b54:	00000097          	auipc	ra,0x0
80002b58:	00e080e7          	jalr	14(ra) # 80002b62 <_ZN4EPOS1S7Machine5panicEv>
80002b5c:	40b2                	lw	ra,12(sp)
80002b5e:	0141                	addi	sp,sp,16
80002b60:	8082                	ret

80002b62 <_ZN4EPOS1S7Machine5panicEv>:
80002b62:	715d                	addi	sp,sp,-80
80002b64:	c686                	sw	ra,76(sp)
80002b66:	c4a2                	sw	s0,72(sp)
80002b68:	c2a6                	sw	s1,68(sp)
80002b6a:	c0ca                	sw	s2,64(sp)
80002b6c:	4781                	li	a5,0
80002b6e:	30479073          	csrw	mie,a5
80002b72:	05000693          	li	a3,80
80002b76:	80004637          	lui	a2,0x80004
80002b7a:	ca460613          	addi	a2,a2,-860 # 80003ca4 <__boot_stack__+0xf8003ca5>
80002b7e:	4825                	li	a6,9
80002b80:	100007b7          	lui	a5,0x10000
80002b84:	800055b7          	lui	a1,0x80005
80002b88:	4529                	li	a0,10
80002b8a:	4335                	li	t1,13
80002b8c:	800058b7          	lui	a7,0x80005
80002b90:	04f00e13          	li	t3,79
80002b94:	a005                	j	80002bb4 <_ZN4EPOS1S7Machine5panicEv+0x52>
80002b96:	0057c703          	lbu	a4,5(a5) # 10000005 <_vector_table-0x6ffffffb>
80002b9a:	02077713          	andi	a4,a4,32
80002b9e:	df65                	beqz	a4,80002b96 <_ZN4EPOS1S7Machine5panicEv+0x34>
80002ba0:	01078023          	sb	a6,0(a5)
80002ba4:	0685a703          	lw	a4,104(a1) # 80005068 <__boot_stack__+0xf8005069>
80002ba8:	0721                	addi	a4,a4,8
80002baa:	06e5a423          	sw	a4,104(a1)
80002bae:	00064683          	lbu	a3,0(a2)
80002bb2:	cead                	beqz	a3,80002c2c <_ZN4EPOS1S7Machine5panicEv+0xca>
80002bb4:	0605                	addi	a2,a2,1
80002bb6:	ff0680e3          	beq	a3,a6,80002b96 <_ZN4EPOS1S7Machine5panicEv+0x34>
80002bba:	02a69863          	bne	a3,a0,80002bea <_ZN4EPOS1S7Machine5panicEv+0x88>
80002bbe:	0057c703          	lbu	a4,5(a5)
80002bc2:	02077713          	andi	a4,a4,32
80002bc6:	df65                	beqz	a4,80002bbe <_ZN4EPOS1S7Machine5panicEv+0x5c>
80002bc8:	00678023          	sb	t1,0(a5)
80002bcc:	0057c703          	lbu	a4,5(a5)
80002bd0:	02077713          	andi	a4,a4,32
80002bd4:	df65                	beqz	a4,80002bcc <_ZN4EPOS1S7Machine5panicEv+0x6a>
80002bd6:	00a78023          	sb	a0,0(a5)
80002bda:	0605a423          	sw	zero,104(a1)
80002bde:	0648a703          	lw	a4,100(a7) # 80005064 <__boot_stack__+0xf8005065>
80002be2:	0705                	addi	a4,a4,1
80002be4:	06e8a223          	sw	a4,100(a7)
80002be8:	b7d9                	j	80002bae <_ZN4EPOS1S7Machine5panicEv+0x4c>
80002bea:	0685a703          	lw	a4,104(a1)
80002bee:	0705                	addi	a4,a4,1
80002bf0:	06e5a423          	sw	a4,104(a1)
80002bf4:	0057c703          	lbu	a4,5(a5)
80002bf8:	02077713          	andi	a4,a4,32
80002bfc:	df65                	beqz	a4,80002bf4 <_ZN4EPOS1S7Machine5panicEv+0x92>
80002bfe:	00d78023          	sb	a3,0(a5)
80002c02:	0685a703          	lw	a4,104(a1)
80002c06:	faee54e3          	bge	t3,a4,80002bae <_ZN4EPOS1S7Machine5panicEv+0x4c>
80002c0a:	0057c703          	lbu	a4,5(a5)
80002c0e:	02077713          	andi	a4,a4,32
80002c12:	df65                	beqz	a4,80002c0a <_ZN4EPOS1S7Machine5panicEv+0xa8>
80002c14:	00678023          	sb	t1,0(a5)
80002c18:	0057c703          	lbu	a4,5(a5)
80002c1c:	02077713          	andi	a4,a4,32
80002c20:	df65                	beqz	a4,80002c18 <_ZN4EPOS1S7Machine5panicEv+0xb6>
80002c22:	00a78023          	sb	a0,0(a5)
80002c26:	0605a423          	sw	zero,104(a1)
80002c2a:	b751                	j	80002bae <_ZN4EPOS1S7Machine5panicEv+0x4c>
80002c2c:	c0102473          	rdtime	s0
80002c30:	80004537          	lui	a0,0x80004
80002c34:	91c50513          	addi	a0,a0,-1764 # 8000391c <__boot_stack__+0xf800391d>
80002c38:	ffffe097          	auipc	ra,0xffffe
80002c3c:	eae080e7          	jalr	-338(ra) # 80000ae6 <_print>
80002c40:	4701                	li	a4,0
80002c42:	868a                	mv	a3,sp
80002c44:	85a2                	mv	a1,s0
80002c46:	4601                	li	a2,0
80002c48:	80005437          	lui	s0,0x80005
80002c4c:	03440513          	addi	a0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
80002c50:	ffffe097          	auipc	ra,0xffffe
80002c54:	012080e7          	jalr	18(ra) # 80000c62 <_ZN4EPOS1S1U7OStream6llutoaEyPcj>
80002c58:	009c                	addi	a5,sp,64
80002c5a:	953e                	add	a0,a0,a5
80002c5c:	fc050023          	sb	zero,-64(a0)
80002c60:	850a                	mv	a0,sp
80002c62:	ffffe097          	auipc	ra,0xffffe
80002c66:	e84080e7          	jalr	-380(ra) # 80000ae6 <_print>
80002c6a:	80003937          	lui	s2,0x80003
80002c6e:	76c90513          	addi	a0,s2,1900 # 8000376c <__boot_stack__+0xf800376d>
80002c72:	ffffe097          	auipc	ra,0xffffe
80002c76:	e74080e7          	jalr	-396(ra) # 80000ae6 <_print>
80002c7a:	03440413          	addi	s0,s0,52
80002c7e:	44a9                	li	s1,10
80002c80:	c004                	sw	s1,0(s0)
80002c82:	80004537          	lui	a0,0x80004
80002c86:	93050513          	addi	a0,a0,-1744 # 80003930 <__boot_stack__+0xf8003931>
80002c8a:	ffffe097          	auipc	ra,0xffffe
80002c8e:	e5c080e7          	jalr	-420(ra) # 80000ae6 <_print>
80002c92:	76c90513          	addi	a0,s2,1900
80002c96:	ffffe097          	auipc	ra,0xffffe
80002c9a:	e50080e7          	jalr	-432(ra) # 80000ae6 <_print>
80002c9e:	c004                	sw	s1,0(s0)
80002ca0:	10500073          	wfi
80002ca4:	40b6                	lw	ra,76(sp)
80002ca6:	4426                	lw	s0,72(sp)
80002ca8:	4496                	lw	s1,68(sp)
80002caa:	4906                	lw	s2,64(sp)
80002cac:	6161                	addi	sp,sp,80
80002cae:	8082                	ret

80002cb0 <_ZN4EPOS1S5Timer11int_handlerEj>:
80002cb0:	1141                	addi	sp,sp,-16
80002cb2:	c606                	sw	ra,12(sp)
80002cb4:	c422                	sw	s0,8(sp)
80002cb6:	842a                	mv	s0,a0
80002cb8:	800057b7          	lui	a5,0x80005
80002cbc:	06c7a783          	lw	a5,108(a5) # 8000506c <__boot_stack__+0xf800506d>
80002cc0:	cb99                	beqz	a5,80002cd6 <_ZN4EPOS1S5Timer11int_handlerEj+0x26>
80002cc2:	f1402773          	csrr	a4,mhartid
80002cc6:	8b0d                	andi	a4,a4,3
80002cc8:	070a                	slli	a4,a4,0x2
80002cca:	97ba                	add	a5,a5,a4
80002ccc:	47d8                	lw	a4,12(a5)
80002cce:	177d                	addi	a4,a4,-1
80002cd0:	c7d8                	sw	a4,12(a5)
80002cd2:	02e05063          	blez	a4,80002cf2 <_ZN4EPOS1S5Timer11int_handlerEj+0x42>
80002cd6:	800057b7          	lui	a5,0x80005
80002cda:	0707a783          	lw	a5,112(a5) # 80005070 <__boot_stack__+0xf8005071>
80002cde:	c791                	beqz	a5,80002cea <_ZN4EPOS1S5Timer11int_handlerEj+0x3a>
80002ce0:	43d8                	lw	a4,4(a5)
80002ce2:	c7d8                	sw	a4,12(a5)
80002ce4:	4b9c                	lw	a5,16(a5)
80002ce6:	8522                	mv	a0,s0
80002ce8:	9782                	jalr	a5
80002cea:	40b2                	lw	ra,12(sp)
80002cec:	4422                	lw	s0,8(sp)
80002cee:	0141                	addi	sp,sp,16
80002cf0:	8082                	ret
80002cf2:	80005737          	lui	a4,0x80005
80002cf6:	06c70713          	addi	a4,a4,108 # 8000506c <__boot_stack__+0xf800506d>
80002cfa:	4314                	lw	a3,0(a4)
80002cfc:	f14027f3          	csrr	a5,mhartid
80002d00:	8b8d                	andi	a5,a5,3
80002d02:	42d0                	lw	a2,4(a3)
80002d04:	078a                	slli	a5,a5,0x2
80002d06:	97b6                	add	a5,a5,a3
80002d08:	c7d0                	sw	a2,12(a5)
80002d0a:	431c                	lw	a5,0(a4)
80002d0c:	4b9c                	lw	a5,16(a5)
80002d0e:	9782                	jalr	a5
80002d10:	b7d9                	j	80002cd6 <_ZN4EPOS1S5Timer11int_handlerEj+0x26>

80002d12 <_ZNVK4EPOS1S3CPU7Context4loadEv>:
80002d12:	800057b7          	lui	a5,0x80005
80002d16:	0447a803          	lw	a6,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80002d1a:	87ffc7b7          	lui	a5,0x87ffc
80002d1e:	c39c                	sw	a5,0(a5)
80002d20:	6691                	lui	a3,0x4
80002d22:	c3d4                	sw	a3,4(a5)
80002d24:	0007a423          	sw	zero,8(a5) # 87ffc008 <__boot_stack__+0xffffc009>
80002d28:	0007a623          	sw	zero,12(a5)
80002d2c:	00c82703          	lw	a4,12(a6)
80002d30:	9736                	add	a4,a4,a3
80002d32:	00e82623          	sw	a4,12(a6)
80002d36:	438c                	lw	a1,0(a5)
80002d38:	43d0                	lw	a2,4(a5)
80002d3a:	962e                	add	a2,a2,a1
80002d3c:	00482783          	lw	a5,4(a6)
80002d40:	cbc5                	beqz	a5,80002df0 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xde>
80002d42:	873e                	mv	a4,a5
80002d44:	4314                	lw	a3,0(a4)
80002d46:	00d60463          	beq	a2,a3,80002d4e <_ZNVK4EPOS1S3CPU7Context4loadEv+0x3c>
80002d4a:	4758                	lw	a4,12(a4)
80002d4c:	ff65                	bnez	a4,80002d44 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x32>
80002d4e:	4394                	lw	a3,0(a5)
80002d50:	43d0                	lw	a2,4(a5)
80002d52:	96b2                	add	a3,a3,a2
80002d54:	0ad58063          	beq	a1,a3,80002df4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xe2>
80002d58:	47dc                	lw	a5,12(a5)
80002d5a:	fbf5                	bnez	a5,80002d4e <_ZNVK4EPOS1S3CPU7Context4loadEv+0x3c>
80002d5c:	00082783          	lw	a5,0(a6)
80002d60:	c39d                	beqz	a5,80002d86 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x74>
80002d62:	00882683          	lw	a3,8(a6)
80002d66:	87ffc7b7          	lui	a5,0x87ffc
80002d6a:	c6dc                	sw	a5,12(a3)
80002d6c:	00882683          	lw	a3,8(a6)
80002d70:	c794                	sw	a3,8(a5)
80002d72:	0007a623          	sw	zero,12(a5) # 87ffc00c <__boot_stack__+0xffffc00d>
80002d76:	00f82423          	sw	a5,8(a6)
80002d7a:	00082783          	lw	a5,0(a6)
80002d7e:	0785                	addi	a5,a5,1
80002d80:	00f82023          	sw	a5,0(a6)
80002d84:	a005                	j	80002da4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x92>
80002d86:	87ffc7b7          	lui	a5,0x87ffc
80002d8a:	0007a423          	sw	zero,8(a5) # 87ffc008 <__boot_stack__+0xffffc009>
80002d8e:	0007a623          	sw	zero,12(a5)
80002d92:	00f82223          	sw	a5,4(a6)
80002d96:	00f82423          	sw	a5,8(a6)
80002d9a:	00082783          	lw	a5,0(a6)
80002d9e:	0785                	addi	a5,a5,1
80002da0:	00f82023          	sw	a5,0(a6)
80002da4:	4781                	li	a5,0
80002da6:	eb21                	bnez	a4,80002df6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xe4>
80002da8:	a069                	j	80002e32 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x120>
80002daa:	00082223          	sw	zero,4(a6)
80002dae:	00082423          	sw	zero,8(a6)
80002db2:	00082023          	sw	zero,0(a6)
80002db6:	a0bd                	j	80002e24 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80002db8:	c6b5                	beqz	a3,80002e24 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80002dba:	00482703          	lw	a4,4(a6)
80002dbe:	4758                	lw	a4,12(a4)
80002dc0:	00e82223          	sw	a4,4(a6)
80002dc4:	00072423          	sw	zero,8(a4)
80002dc8:	00082703          	lw	a4,0(a6)
80002dcc:	177d                	addi	a4,a4,-1
80002dce:	00e82023          	sw	a4,0(a6)
80002dd2:	a889                	j	80002e24 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80002dd4:	caa1                	beqz	a3,80002e24 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80002dd6:	00882703          	lw	a4,8(a6)
80002dda:	4718                	lw	a4,8(a4)
80002ddc:	00e82423          	sw	a4,8(a6)
80002de0:	00072623          	sw	zero,12(a4)
80002de4:	00082703          	lw	a4,0(a6)
80002de8:	177d                	addi	a4,a4,-1
80002dea:	00e82023          	sw	a4,0(a6)
80002dee:	a81d                	j	80002e24 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80002df0:	873e                	mv	a4,a5
80002df2:	b7ad                	j	80002d5c <_ZNVK4EPOS1S3CPU7Context4loadEv+0x4a>
80002df4:	cb0d                	beqz	a4,80002e26 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x114>
80002df6:	87ffc637          	lui	a2,0x87ffc
80002dfa:	4254                	lw	a3,4(a2)
80002dfc:	434c                	lw	a1,4(a4)
80002dfe:	96ae                	add	a3,a3,a1
80002e00:	c254                	sw	a3,4(a2)
80002e02:	00082683          	lw	a3,0(a6)
80002e06:	4605                	li	a2,1
80002e08:	fac681e3          	beq	a3,a2,80002daa <_ZNVK4EPOS1S3CPU7Context4loadEv+0x98>
80002e0c:	470c                	lw	a1,8(a4)
80002e0e:	d5cd                	beqz	a1,80002db8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xa6>
80002e10:	4750                	lw	a2,12(a4)
80002e12:	d269                	beqz	a2,80002dd4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xc2>
80002e14:	c5d0                	sw	a2,12(a1)
80002e16:	4718                	lw	a4,8(a4)
80002e18:	c618                	sw	a4,8(a2)
80002e1a:	00082703          	lw	a4,0(a6)
80002e1e:	177d                	addi	a4,a4,-1
80002e20:	00e82023          	sw	a4,0(a6)
80002e24:	c799                	beqz	a5,80002e32 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x120>
80002e26:	43d8                	lw	a4,4(a5)
80002e28:	87ffc6b7          	lui	a3,0x87ffc
80002e2c:	42d4                	lw	a3,4(a3)
80002e2e:	9736                	add	a4,a4,a3
80002e30:	c3d8                	sw	a4,4(a5)
80002e32:	812a                	mv	sp,a0
80002e34:	07410113          	addi	sp,sp,116
80002e38:	ff812283          	lw	t0,-8(sp)
80002e3c:	ff412303          	lw	t1,-12(sp)
80002e40:	ff012383          	lw	t2,-16(sp)
80002e44:	fec12403          	lw	s0,-20(sp)
80002e48:	fe812483          	lw	s1,-24(sp)
80002e4c:	fe412503          	lw	a0,-28(sp)
80002e50:	fe012583          	lw	a1,-32(sp)
80002e54:	fdc12603          	lw	a2,-36(sp)
80002e58:	fd812683          	lw	a3,-40(sp)
80002e5c:	fd412703          	lw	a4,-44(sp)
80002e60:	fd012783          	lw	a5,-48(sp)
80002e64:	fcc12803          	lw	a6,-52(sp)
80002e68:	fc812883          	lw	a7,-56(sp)
80002e6c:	fc412903          	lw	s2,-60(sp)
80002e70:	fc012983          	lw	s3,-64(sp)
80002e74:	fbc12a03          	lw	s4,-68(sp)
80002e78:	fb812a83          	lw	s5,-72(sp)
80002e7c:	fb412b03          	lw	s6,-76(sp)
80002e80:	fb012b83          	lw	s7,-80(sp)
80002e84:	fac12c03          	lw	s8,-84(sp)
80002e88:	fa812c83          	lw	s9,-88(sp)
80002e8c:	fa412d03          	lw	s10,-92(sp)
80002e90:	fa012d83          	lw	s11,-96(sp)
80002e94:	f9c12e03          	lw	t3,-100(sp)
80002e98:	f9812e83          	lw	t4,-104(sp)
80002e9c:	f9412f03          	lw	t5,-108(sp)
80002ea0:	f9012f83          	lw	t6,-112(sp)
80002ea4:	f8c12083          	lw	ra,-116(sp)
80002ea8:	ffc12f83          	lw	t6,-4(sp)
80002eac:	000f8067          	jr	t6
80002eb0:	8082                	ret

80002eb2 <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>:
80002eb2:	fff12c23          	sw	t6,-8(sp)
80002eb6:	00000f97          	auipc	t6,0x0
80002eba:	106f8f93          	addi	t6,t6,262 # 80002fbc <.ret>
80002ebe:	fff12e23          	sw	t6,-4(sp)
80002ec2:	ff812f83          	lw	t6,-8(sp)
80002ec6:	fe512c23          	sw	t0,-8(sp)
80002eca:	fe612a23          	sw	t1,-12(sp)
80002ece:	fe712823          	sw	t2,-16(sp)
80002ed2:	fe812623          	sw	s0,-20(sp)
80002ed6:	fe912423          	sw	s1,-24(sp)
80002eda:	fea12223          	sw	a0,-28(sp)
80002ede:	feb12023          	sw	a1,-32(sp)
80002ee2:	fcc12e23          	sw	a2,-36(sp)
80002ee6:	fcd12c23          	sw	a3,-40(sp)
80002eea:	fce12a23          	sw	a4,-44(sp)
80002eee:	fcf12823          	sw	a5,-48(sp)
80002ef2:	fd012623          	sw	a6,-52(sp)
80002ef6:	fd112423          	sw	a7,-56(sp)
80002efa:	fd212223          	sw	s2,-60(sp)
80002efe:	fd312023          	sw	s3,-64(sp)
80002f02:	fb412e23          	sw	s4,-68(sp)
80002f06:	fb512c23          	sw	s5,-72(sp)
80002f0a:	fb612a23          	sw	s6,-76(sp)
80002f0e:	fb712823          	sw	s7,-80(sp)
80002f12:	fb812623          	sw	s8,-84(sp)
80002f16:	fb912423          	sw	s9,-88(sp)
80002f1a:	fba12223          	sw	s10,-92(sp)
80002f1e:	fbb12023          	sw	s11,-96(sp)
80002f22:	f9c12e23          	sw	t3,-100(sp)
80002f26:	f9d12c23          	sw	t4,-104(sp)
80002f2a:	f9e12a23          	sw	t5,-108(sp)
80002f2e:	f9f12823          	sw	t6,-112(sp)
80002f32:	f8112623          	sw	ra,-116(sp)
80002f36:	f8c10113          	addi	sp,sp,-116
80002f3a:	00252023          	sw	sp,0(a0)
80002f3e:	812e                	mv	sp,a1
80002f40:	07410113          	addi	sp,sp,116
80002f44:	ff812283          	lw	t0,-8(sp)
80002f48:	ff412303          	lw	t1,-12(sp)
80002f4c:	ff012383          	lw	t2,-16(sp)
80002f50:	fec12403          	lw	s0,-20(sp)
80002f54:	fe812483          	lw	s1,-24(sp)
80002f58:	fe412503          	lw	a0,-28(sp)
80002f5c:	fe012583          	lw	a1,-32(sp)
80002f60:	fdc12603          	lw	a2,-36(sp)
80002f64:	fd812683          	lw	a3,-40(sp)
80002f68:	fd412703          	lw	a4,-44(sp)
80002f6c:	fd012783          	lw	a5,-48(sp)
80002f70:	fcc12803          	lw	a6,-52(sp)
80002f74:	fc812883          	lw	a7,-56(sp)
80002f78:	fc412903          	lw	s2,-60(sp)
80002f7c:	fc012983          	lw	s3,-64(sp)
80002f80:	fbc12a03          	lw	s4,-68(sp)
80002f84:	fb812a83          	lw	s5,-72(sp)
80002f88:	fb412b03          	lw	s6,-76(sp)
80002f8c:	fb012b83          	lw	s7,-80(sp)
80002f90:	fac12c03          	lw	s8,-84(sp)
80002f94:	fa812c83          	lw	s9,-88(sp)
80002f98:	fa412d03          	lw	s10,-92(sp)
80002f9c:	fa012d83          	lw	s11,-96(sp)
80002fa0:	f9c12e03          	lw	t3,-100(sp)
80002fa4:	f9812e83          	lw	t4,-104(sp)
80002fa8:	f9412f03          	lw	t5,-108(sp)
80002fac:	f9012f83          	lw	t6,-112(sp)
80002fb0:	f8c12083          	lw	ra,-116(sp)
80002fb4:	ffc12f83          	lw	t6,-4(sp)
80002fb8:	000f8067          	jr	t6

80002fbc <.ret>:
80002fbc:	00008067          	ret

80002fc0 <_GLOBAL__sub_I__ZN4EPOS1S3MMU5_freeE>:
80002fc0:	800057b7          	lui	a5,0x80005
80002fc4:	12078793          	addi	a5,a5,288 # 80005120 <__boot_stack__+0xf8005121>
80002fc8:	0007a023          	sw	zero,0(a5)
80002fcc:	0007a223          	sw	zero,4(a5)
80002fd0:	0007a423          	sw	zero,8(a5)
80002fd4:	0007a623          	sw	zero,12(a5)
80002fd8:	8082                	ret

80002fda <_ZN4EPOS1S1U4Heap13out_of_memoryEv>:
80002fda:	1141                	addi	sp,sp,-16
80002fdc:	c606                	sw	ra,12(sp)
80002fde:	ffffe097          	auipc	ra,0xffffe
80002fe2:	ad4080e7          	jalr	-1324(ra) # 80000ab2 <_panic>
80002fe6:	40b2                	lw	ra,12(sp)
80002fe8:	0141                	addi	sp,sp,16
80002fea:	8082                	ret

80002fec <__udivdi3>:
80002fec:	8e36                	mv	t3,a3
80002fee:	88b2                	mv	a7,a2
80002ff0:	832a                	mv	t1,a0
80002ff2:	882e                	mv	a6,a1
80002ff4:	eec5                	bnez	a3,800030ac <__udivdi3+0xc0>
80002ff6:	10c5f063          	bgeu	a1,a2,800030f6 <__udivdi3+0x10a>
80002ffa:	67c1                	lui	a5,0x10
80002ffc:	1af66a63          	bltu	a2,a5,800031b0 <__udivdi3+0x1c4>
80003000:	010007b7          	lui	a5,0x1000
80003004:	36f66163          	bltu	a2,a5,80003366 <__udivdi3+0x37a>
80003008:	01865713          	srli	a4,a2,0x18
8000300c:	4e61                	li	t3,24
8000300e:	00002797          	auipc	a5,0x2
80003012:	ffe7a783          	lw	a5,-2(a5) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
80003016:	97ba                	add	a5,a5,a4
80003018:	0007c783          	lbu	a5,0(a5)
8000301c:	02000713          	li	a4,32
80003020:	9e3e                	add	t3,t3,a5
80003022:	41c707b3          	sub	a5,a4,t3
80003026:	01c70c63          	beq	a4,t3,8000303e <__udivdi3+0x52>
8000302a:	00f59833          	sll	a6,a1,a5
8000302e:	01c55e33          	srl	t3,a0,t3
80003032:	00f618b3          	sll	a7,a2,a5
80003036:	010e6833          	or	a6,t3,a6
8000303a:	00f51333          	sll	t1,a0,a5
8000303e:	0108d593          	srli	a1,a7,0x10
80003042:	02b85533          	divu	a0,a6,a1
80003046:	01089693          	slli	a3,a7,0x10
8000304a:	82c1                	srli	a3,a3,0x10
8000304c:	01035793          	srli	a5,t1,0x10
80003050:	02b87733          	remu	a4,a6,a1
80003054:	02a68633          	mul	a2,a3,a0
80003058:	0742                	slli	a4,a4,0x10
8000305a:	00f76833          	or	a6,a4,a5
8000305e:	00c87a63          	bgeu	a6,a2,80003072 <__udivdi3+0x86>
80003062:	9846                	add	a6,a6,a7
80003064:	fff50793          	addi	a5,a0,-1
80003068:	01186463          	bltu	a6,a7,80003070 <__udivdi3+0x84>
8000306c:	30c86c63          	bltu	a6,a2,80003384 <__udivdi3+0x398>
80003070:	853e                	mv	a0,a5
80003072:	40c80833          	sub	a6,a6,a2
80003076:	02b85633          	divu	a2,a6,a1
8000307a:	0342                	slli	t1,t1,0x10
8000307c:	01035313          	srli	t1,t1,0x10
80003080:	02b87833          	remu	a6,a6,a1
80003084:	02c686b3          	mul	a3,a3,a2
80003088:	0842                	slli	a6,a6,0x10
8000308a:	00686833          	or	a6,a6,t1
8000308e:	00d87b63          	bgeu	a6,a3,800030a4 <__udivdi3+0xb8>
80003092:	9846                	add	a6,a6,a7
80003094:	fff60793          	addi	a5,a2,-1 # 87ffbfff <__boot_stack__+0xffffc000>
80003098:	01186563          	bltu	a6,a7,800030a2 <__udivdi3+0xb6>
8000309c:	1679                	addi	a2,a2,-2
8000309e:	00d86363          	bltu	a6,a3,800030a4 <__udivdi3+0xb8>
800030a2:	863e                	mv	a2,a5
800030a4:	0542                	slli	a0,a0,0x10
800030a6:	8d51                	or	a0,a0,a2
800030a8:	4581                	li	a1,0
800030aa:	8082                	ret
800030ac:	00d5f563          	bgeu	a1,a3,800030b6 <__udivdi3+0xca>
800030b0:	4581                	li	a1,0
800030b2:	4501                	li	a0,0
800030b4:	8082                	ret
800030b6:	67c1                	lui	a5,0x10
800030b8:	10f6e563          	bltu	a3,a5,800031c2 <__udivdi3+0x1d6>
800030bc:	010007b7          	lui	a5,0x1000
800030c0:	28f6e863          	bltu	a3,a5,80003350 <__udivdi3+0x364>
800030c4:	0186d813          	srli	a6,a3,0x18
800030c8:	4761                	li	a4,24
800030ca:	00002797          	auipc	a5,0x2
800030ce:	f427a783          	lw	a5,-190(a5) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
800030d2:	97c2                	add	a5,a5,a6
800030d4:	0007ce03          	lbu	t3,0(a5)
800030d8:	02000793          	li	a5,32
800030dc:	9e3a                	add	t3,t3,a4
800030de:	41c78eb3          	sub	t4,a5,t3
800030e2:	17c79e63          	bne	a5,t3,8000325e <__udivdi3+0x272>
800030e6:	28b6e463          	bltu	a3,a1,8000336e <__udivdi3+0x382>
800030ea:	00c53633          	sltu	a2,a0,a2
800030ee:	00164513          	xori	a0,a2,1
800030f2:	4581                	li	a1,0
800030f4:	8082                	ret
800030f6:	e601                	bnez	a2,800030fe <__udivdi3+0x112>
800030f8:	4785                	li	a5,1
800030fa:	02c7d8b3          	divu	a7,a5,a2
800030fe:	67c1                	lui	a5,0x10
80003100:	08f8ef63          	bltu	a7,a5,8000319e <__udivdi3+0x1b2>
80003104:	010007b7          	lui	a5,0x1000
80003108:	24f8eb63          	bltu	a7,a5,8000335e <__udivdi3+0x372>
8000310c:	0188d713          	srli	a4,a7,0x18
80003110:	4e61                	li	t3,24
80003112:	00002797          	auipc	a5,0x2
80003116:	efa7a783          	lw	a5,-262(a5) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
8000311a:	97ba                	add	a5,a5,a4
8000311c:	0007c683          	lbu	a3,0(a5)
80003120:	02000793          	li	a5,32
80003124:	9e36                	add	t3,t3,a3
80003126:	41c782b3          	sub	t0,a5,t3
8000312a:	0bc79463          	bne	a5,t3,800031d2 <__udivdi3+0x1e6>
8000312e:	01089f13          	slli	t5,a7,0x10
80003132:	41158733          	sub	a4,a1,a7
80003136:	0108df93          	srli	t6,a7,0x10
8000313a:	010f5f13          	srli	t5,t5,0x10
8000313e:	4585                	li	a1,1
80003140:	01035793          	srli	a5,t1,0x10
80003144:	03f75533          	divu	a0,a4,t6
80003148:	03f77733          	remu	a4,a4,t6
8000314c:	03e506b3          	mul	a3,a0,t5
80003150:	0742                	slli	a4,a4,0x10
80003152:	8fd9                	or	a5,a5,a4
80003154:	00d7fa63          	bgeu	a5,a3,80003168 <__udivdi3+0x17c>
80003158:	97c6                	add	a5,a5,a7
8000315a:	fff50713          	addi	a4,a0,-1
8000315e:	0117e463          	bltu	a5,a7,80003166 <__udivdi3+0x17a>
80003162:	22d7e463          	bltu	a5,a3,8000338a <__udivdi3+0x39e>
80003166:	853a                	mv	a0,a4
80003168:	8f95                	sub	a5,a5,a3
8000316a:	03f7d633          	divu	a2,a5,t6
8000316e:	0342                	slli	t1,t1,0x10
80003170:	01035313          	srli	t1,t1,0x10
80003174:	03f7f7b3          	remu	a5,a5,t6
80003178:	03e60f33          	mul	t5,a2,t5
8000317c:	07c2                	slli	a5,a5,0x10
8000317e:	0067e7b3          	or	a5,a5,t1
80003182:	01e7fb63          	bgeu	a5,t5,80003198 <__udivdi3+0x1ac>
80003186:	97c6                	add	a5,a5,a7
80003188:	fff60713          	addi	a4,a2,-1
8000318c:	0117e563          	bltu	a5,a7,80003196 <__udivdi3+0x1aa>
80003190:	1679                	addi	a2,a2,-2
80003192:	01e7e363          	bltu	a5,t5,80003198 <__udivdi3+0x1ac>
80003196:	863a                	mv	a2,a4
80003198:	0542                	slli	a0,a0,0x10
8000319a:	8d51                	or	a0,a0,a2
8000319c:	8082                	ret
8000319e:	0ff00793          	li	a5,255
800031a2:	8746                	mv	a4,a7
800031a4:	f717f7e3          	bgeu	a5,a7,80003112 <__udivdi3+0x126>
800031a8:	0088d713          	srli	a4,a7,0x8
800031ac:	4e21                	li	t3,8
800031ae:	b795                	j	80003112 <__udivdi3+0x126>
800031b0:	0ff00793          	li	a5,255
800031b4:	8732                	mv	a4,a2
800031b6:	e4c7fce3          	bgeu	a5,a2,8000300e <__udivdi3+0x22>
800031ba:	00865713          	srli	a4,a2,0x8
800031be:	4e21                	li	t3,8
800031c0:	b5b9                	j	8000300e <__udivdi3+0x22>
800031c2:	0ff00793          	li	a5,255
800031c6:	18d7f963          	bgeu	a5,a3,80003358 <__udivdi3+0x36c>
800031ca:	0086d813          	srli	a6,a3,0x8
800031ce:	4721                	li	a4,8
800031d0:	bded                	j	800030ca <__udivdi3+0xde>
800031d2:	005898b3          	sll	a7,a7,t0
800031d6:	01c5d633          	srl	a2,a1,t3
800031da:	0108df93          	srli	t6,a7,0x10
800031de:	03f65eb3          	divu	t4,a2,t6
800031e2:	01089f13          	slli	t5,a7,0x10
800031e6:	010f5f13          	srli	t5,t5,0x10
800031ea:	00559733          	sll	a4,a1,t0
800031ee:	01c55e33          	srl	t3,a0,t3
800031f2:	00ee6733          	or	a4,t3,a4
800031f6:	01075593          	srli	a1,a4,0x10
800031fa:	00551333          	sll	t1,a0,t0
800031fe:	03f676b3          	remu	a3,a2,t6
80003202:	03df07b3          	mul	a5,t5,t4
80003206:	06c2                	slli	a3,a3,0x10
80003208:	8ecd                	or	a3,a3,a1
8000320a:	00f6fb63          	bgeu	a3,a5,80003220 <__udivdi3+0x234>
8000320e:	96c6                	add	a3,a3,a7
80003210:	fffe8613          	addi	a2,t4,-1
80003214:	1716e663          	bltu	a3,a7,80003380 <__udivdi3+0x394>
80003218:	16f6f463          	bgeu	a3,a5,80003380 <__udivdi3+0x394>
8000321c:	1ef9                	addi	t4,t4,-2
8000321e:	96c6                	add	a3,a3,a7
80003220:	8e9d                	sub	a3,a3,a5
80003222:	03f6d7b3          	divu	a5,a3,t6
80003226:	01071e13          	slli	t3,a4,0x10
8000322a:	010e5e13          	srli	t3,t3,0x10
8000322e:	03f6f6b3          	remu	a3,a3,t6
80003232:	02ff0633          	mul	a2,t5,a5
80003236:	01069713          	slli	a4,a3,0x10
8000323a:	01c76733          	or	a4,a4,t3
8000323e:	00c77b63          	bgeu	a4,a2,80003254 <__udivdi3+0x268>
80003242:	9746                	add	a4,a4,a7
80003244:	fff78693          	addi	a3,a5,-1
80003248:	13176863          	bltu	a4,a7,80003378 <__udivdi3+0x38c>
8000324c:	12c77663          	bgeu	a4,a2,80003378 <__udivdi3+0x38c>
80003250:	17f9                	addi	a5,a5,-2
80003252:	9746                	add	a4,a4,a7
80003254:	010e9593          	slli	a1,t4,0x10
80003258:	8f11                	sub	a4,a4,a2
8000325a:	8ddd                	or	a1,a1,a5
8000325c:	b5d5                	j	80003140 <__udivdi3+0x154>
8000325e:	01c657b3          	srl	a5,a2,t3
80003262:	01d696b3          	sll	a3,a3,t4
80003266:	8edd                	or	a3,a3,a5
80003268:	01c5d333          	srl	t1,a1,t3
8000326c:	0106df13          	srli	t5,a3,0x10
80003270:	03e358b3          	divu	a7,t1,t5
80003274:	01069713          	slli	a4,a3,0x10
80003278:	8341                	srli	a4,a4,0x10
8000327a:	01d59833          	sll	a6,a1,t4
8000327e:	01c55e33          	srl	t3,a0,t3
80003282:	010e6833          	or	a6,t3,a6
80003286:	01085793          	srli	a5,a6,0x10
8000328a:	01d61633          	sll	a2,a2,t4
8000328e:	03e37333          	remu	t1,t1,t5
80003292:	031705b3          	mul	a1,a4,a7
80003296:	0342                	slli	t1,t1,0x10
80003298:	00f367b3          	or	a5,t1,a5
8000329c:	00b7fb63          	bgeu	a5,a1,800032b2 <__udivdi3+0x2c6>
800032a0:	97b6                	add	a5,a5,a3
800032a2:	fff88313          	addi	t1,a7,-1
800032a6:	0cd7eb63          	bltu	a5,a3,8000337c <__udivdi3+0x390>
800032aa:	0cb7f963          	bgeu	a5,a1,8000337c <__udivdi3+0x390>
800032ae:	18f9                	addi	a7,a7,-2
800032b0:	97b6                	add	a5,a5,a3
800032b2:	8f8d                	sub	a5,a5,a1
800032b4:	03e7d333          	divu	t1,a5,t5
800032b8:	0842                	slli	a6,a6,0x10
800032ba:	01085813          	srli	a6,a6,0x10
800032be:	03e7f7b3          	remu	a5,a5,t5
800032c2:	026705b3          	mul	a1,a4,t1
800032c6:	07c2                	slli	a5,a5,0x10
800032c8:	0107e833          	or	a6,a5,a6
800032cc:	00b87b63          	bgeu	a6,a1,800032e2 <__udivdi3+0x2f6>
800032d0:	9836                	add	a6,a6,a3
800032d2:	fff30793          	addi	a5,t1,-1
800032d6:	08d86f63          	bltu	a6,a3,80003374 <__udivdi3+0x388>
800032da:	08b87d63          	bgeu	a6,a1,80003374 <__udivdi3+0x388>
800032de:	1379                	addi	t1,t1,-2
800032e0:	9836                	add	a6,a6,a3
800032e2:	08c2                	slli	a7,a7,0x10
800032e4:	6f41                	lui	t5,0x10
800032e6:	0068e8b3          	or	a7,a7,t1
800032ea:	ffff0793          	addi	a5,t5,-1 # ffff <_vector_table-0x7fff0001>
800032ee:	00f8f733          	and	a4,a7,a5
800032f2:	0108d313          	srli	t1,a7,0x10
800032f6:	8ff1                	and	a5,a5,a2
800032f8:	8241                	srli	a2,a2,0x10
800032fa:	02f70e33          	mul	t3,a4,a5
800032fe:	40b80833          	sub	a6,a6,a1
80003302:	02c70733          	mul	a4,a4,a2
80003306:	010e5693          	srli	a3,t3,0x10
8000330a:	02f307b3          	mul	a5,t1,a5
8000330e:	973e                	add	a4,a4,a5
80003310:	9736                	add	a4,a4,a3
80003312:	02c30633          	mul	a2,t1,a2
80003316:	00f77363          	bgeu	a4,a5,8000331c <__udivdi3+0x330>
8000331a:	967a                	add	a2,a2,t5
8000331c:	01075313          	srli	t1,a4,0x10
80003320:	961a                	add	a2,a2,t1
80003322:	02c86363          	bltu	a6,a2,80003348 <__udivdi3+0x35c>
80003326:	00c80563          	beq	a6,a2,80003330 <__udivdi3+0x344>
8000332a:	8546                	mv	a0,a7
8000332c:	4581                	li	a1,0
8000332e:	8082                	ret
80003330:	66c1                	lui	a3,0x10
80003332:	16fd                	addi	a3,a3,-1
80003334:	8f75                	and	a4,a4,a3
80003336:	01071793          	slli	a5,a4,0x10
8000333a:	00de7e33          	and	t3,t3,a3
8000333e:	01d51533          	sll	a0,a0,t4
80003342:	97f2                	add	a5,a5,t3
80003344:	fef573e3          	bgeu	a0,a5,8000332a <__udivdi3+0x33e>
80003348:	fff88513          	addi	a0,a7,-1
8000334c:	4581                	li	a1,0
8000334e:	8082                	ret
80003350:	0106d813          	srli	a6,a3,0x10
80003354:	4741                	li	a4,16
80003356:	bb95                	j	800030ca <__udivdi3+0xde>
80003358:	8836                	mv	a6,a3
8000335a:	4701                	li	a4,0
8000335c:	b3bd                	j	800030ca <__udivdi3+0xde>
8000335e:	0108d713          	srli	a4,a7,0x10
80003362:	4e41                	li	t3,16
80003364:	b37d                	j	80003112 <__udivdi3+0x126>
80003366:	01065713          	srli	a4,a2,0x10
8000336a:	4e41                	li	t3,16
8000336c:	b14d                	j	8000300e <__udivdi3+0x22>
8000336e:	4581                	li	a1,0
80003370:	4505                	li	a0,1
80003372:	8082                	ret
80003374:	833e                	mv	t1,a5
80003376:	b7b5                	j	800032e2 <__udivdi3+0x2f6>
80003378:	87b6                	mv	a5,a3
8000337a:	bde9                	j	80003254 <__udivdi3+0x268>
8000337c:	889a                	mv	a7,t1
8000337e:	bf15                	j	800032b2 <__udivdi3+0x2c6>
80003380:	8eb2                	mv	t4,a2
80003382:	bd79                	j	80003220 <__udivdi3+0x234>
80003384:	1579                	addi	a0,a0,-2
80003386:	9846                	add	a6,a6,a7
80003388:	b1ed                	j	80003072 <__udivdi3+0x86>
8000338a:	1579                	addi	a0,a0,-2
8000338c:	97c6                	add	a5,a5,a7
8000338e:	bbe9                	j	80003168 <__udivdi3+0x17c>

80003390 <__umoddi3>:
80003390:	87b6                	mv	a5,a3
80003392:	8832                	mv	a6,a2
80003394:	88aa                	mv	a7,a0
80003396:	872e                	mv	a4,a1
80003398:	8e2e                	mv	t3,a1
8000339a:	e2cd                	bnez	a3,8000343c <__umoddi3+0xac>
8000339c:	0ec5f963          	bgeu	a1,a2,8000348e <__umoddi3+0xfe>
800033a0:	6741                	lui	a4,0x10
800033a2:	18e66f63          	bltu	a2,a4,80003540 <__umoddi3+0x1b0>
800033a6:	010007b7          	lui	a5,0x1000
800033aa:	34f66c63          	bltu	a2,a5,80003702 <__umoddi3+0x372>
800033ae:	01865693          	srli	a3,a2,0x18
800033b2:	47e1                	li	a5,24
800033b4:	00002717          	auipc	a4,0x2
800033b8:	c5872703          	lw	a4,-936(a4) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
800033bc:	9736                	add	a4,a4,a3
800033be:	00074703          	lbu	a4,0(a4)
800033c2:	02000693          	li	a3,32
800033c6:	97ba                	add	a5,a5,a4
800033c8:	40f68333          	sub	t1,a3,a5
800033cc:	00f68c63          	beq	a3,a5,800033e4 <__umoddi3+0x54>
800033d0:	006595b3          	sll	a1,a1,t1
800033d4:	00f557b3          	srl	a5,a0,a5
800033d8:	00661833          	sll	a6,a2,t1
800033dc:	00b7ee33          	or	t3,a5,a1
800033e0:	006518b3          	sll	a7,a0,t1
800033e4:	01085613          	srli	a2,a6,0x10
800033e8:	02ce57b3          	divu	a5,t3,a2
800033ec:	01081513          	slli	a0,a6,0x10
800033f0:	8141                	srli	a0,a0,0x10
800033f2:	0108d693          	srli	a3,a7,0x10
800033f6:	02ce7e33          	remu	t3,t3,a2
800033fa:	02f507b3          	mul	a5,a0,a5
800033fe:	0e42                	slli	t3,t3,0x10
80003400:	00de6733          	or	a4,t3,a3
80003404:	00f77863          	bgeu	a4,a5,80003414 <__umoddi3+0x84>
80003408:	9742                	add	a4,a4,a6
8000340a:	01076563          	bltu	a4,a6,80003414 <__umoddi3+0x84>
8000340e:	00f77363          	bgeu	a4,a5,80003414 <__umoddi3+0x84>
80003412:	9742                	add	a4,a4,a6
80003414:	8f1d                	sub	a4,a4,a5
80003416:	02c756b3          	divu	a3,a4,a2
8000341a:	01089793          	slli	a5,a7,0x10
8000341e:	83c1                	srli	a5,a5,0x10
80003420:	02c77733          	remu	a4,a4,a2
80003424:	02d50533          	mul	a0,a0,a3
80003428:	0742                	slli	a4,a4,0x10
8000342a:	8fd9                	or	a5,a5,a4
8000342c:	0ea7e563          	bltu	a5,a0,80003516 <__umoddi3+0x186>
80003430:	40a78533          	sub	a0,a5,a0
80003434:	00655533          	srl	a0,a0,t1
80003438:	4581                	li	a1,0
8000343a:	8082                	ret
8000343c:	882a                	mv	a6,a0
8000343e:	fed5eee3          	bltu	a1,a3,8000343a <__umoddi3+0xaa>
80003442:	67c1                	lui	a5,0x10
80003444:	10f6e763          	bltu	a3,a5,80003552 <__umoddi3+0x1c2>
80003448:	010007b7          	lui	a5,0x1000
8000344c:	2af6e763          	bltu	a3,a5,800036fa <__umoddi3+0x36a>
80003450:	0186d313          	srli	t1,a3,0x18
80003454:	48e1                	li	a7,24
80003456:	00002797          	auipc	a5,0x2
8000345a:	bb67a783          	lw	a5,-1098(a5) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
8000345e:	979a                	add	a5,a5,t1
80003460:	0007ce03          	lbu	t3,0(a5)
80003464:	02000793          	li	a5,32
80003468:	9e46                	add	t3,t3,a7
8000346a:	41c78333          	sub	t1,a5,t3
8000346e:	17c79663          	bne	a5,t3,800035da <__umoddi3+0x24a>
80003472:	00b6e463          	bltu	a3,a1,8000347a <__umoddi3+0xea>
80003476:	00c56963          	bltu	a0,a2,80003488 <__umoddi3+0xf8>
8000347a:	40c50833          	sub	a6,a0,a2
8000347e:	8d95                	sub	a1,a1,a3
80003480:	01053733          	sltu	a4,a0,a6
80003484:	40e58733          	sub	a4,a1,a4
80003488:	8542                	mv	a0,a6
8000348a:	85ba                	mv	a1,a4
8000348c:	8082                	ret
8000348e:	e601                	bnez	a2,80003496 <__umoddi3+0x106>
80003490:	4705                	li	a4,1
80003492:	02c75833          	divu	a6,a4,a2
80003496:	6741                	lui	a4,0x10
80003498:	08e86b63          	bltu	a6,a4,8000352e <__umoddi3+0x19e>
8000349c:	010007b7          	lui	a5,0x1000
800034a0:	24f86963          	bltu	a6,a5,800036f2 <__umoddi3+0x362>
800034a4:	01885693          	srli	a3,a6,0x18
800034a8:	47e1                	li	a5,24
800034aa:	00002717          	auipc	a4,0x2
800034ae:	b6272703          	lw	a4,-1182(a4) # 8000500c <_GLOBAL_OFFSET_TABLE_+0x4>
800034b2:	9736                	add	a4,a4,a3
800034b4:	00074703          	lbu	a4,0(a4)
800034b8:	02000693          	li	a3,32
800034bc:	97ba                	add	a5,a5,a4
800034be:	40f68333          	sub	t1,a3,a5
800034c2:	0af69063          	bne	a3,a5,80003562 <__umoddi3+0x1d2>
800034c6:	01081e13          	slli	t3,a6,0x10
800034ca:	410585b3          	sub	a1,a1,a6
800034ce:	01085613          	srli	a2,a6,0x10
800034d2:	010e5e13          	srli	t3,t3,0x10
800034d6:	0108d713          	srli	a4,a7,0x10
800034da:	02c5d6b3          	divu	a3,a1,a2
800034de:	02c5f5b3          	remu	a1,a1,a2
800034e2:	03c686b3          	mul	a3,a3,t3
800034e6:	05c2                	slli	a1,a1,0x10
800034e8:	8f4d                	or	a4,a4,a1
800034ea:	00d77763          	bgeu	a4,a3,800034f8 <__umoddi3+0x168>
800034ee:	9742                	add	a4,a4,a6
800034f0:	01076463          	bltu	a4,a6,800034f8 <__umoddi3+0x168>
800034f4:	22d76263          	bltu	a4,a3,80003718 <__umoddi3+0x388>
800034f8:	8f15                	sub	a4,a4,a3
800034fa:	02c75533          	divu	a0,a4,a2
800034fe:	08c2                	slli	a7,a7,0x10
80003500:	0108d893          	srli	a7,a7,0x10
80003504:	02c77733          	remu	a4,a4,a2
80003508:	03c50533          	mul	a0,a0,t3
8000350c:	0742                	slli	a4,a4,0x10
8000350e:	011767b3          	or	a5,a4,a7
80003512:	00a7f863          	bgeu	a5,a0,80003522 <__umoddi3+0x192>
80003516:	97c2                	add	a5,a5,a6
80003518:	0107e563          	bltu	a5,a6,80003522 <__umoddi3+0x192>
8000351c:	00a7f363          	bgeu	a5,a0,80003522 <__umoddi3+0x192>
80003520:	97c2                	add	a5,a5,a6
80003522:	40a78533          	sub	a0,a5,a0
80003526:	00655533          	srl	a0,a0,t1
8000352a:	4581                	li	a1,0
8000352c:	8082                	ret
8000352e:	0ff00713          	li	a4,255
80003532:	86c2                	mv	a3,a6
80003534:	f7077be3          	bgeu	a4,a6,800034aa <__umoddi3+0x11a>
80003538:	00885693          	srli	a3,a6,0x8
8000353c:	47a1                	li	a5,8
8000353e:	b7b5                	j	800034aa <__umoddi3+0x11a>
80003540:	0ff00713          	li	a4,255
80003544:	86b2                	mv	a3,a2
80003546:	e6c777e3          	bgeu	a4,a2,800033b4 <__umoddi3+0x24>
8000354a:	00865693          	srli	a3,a2,0x8
8000354e:	47a1                	li	a5,8
80003550:	b595                	j	800033b4 <__umoddi3+0x24>
80003552:	0ff00793          	li	a5,255
80003556:	1ad7fa63          	bgeu	a5,a3,8000370a <__umoddi3+0x37a>
8000355a:	0086d313          	srli	t1,a3,0x8
8000355e:	48a1                	li	a7,8
80003560:	bddd                	j	80003456 <__umoddi3+0xc6>
80003562:	00681833          	sll	a6,a6,t1
80003566:	00f5d733          	srl	a4,a1,a5
8000356a:	01085613          	srli	a2,a6,0x10
8000356e:	02c756b3          	divu	a3,a4,a2
80003572:	01081e13          	slli	t3,a6,0x10
80003576:	00f557b3          	srl	a5,a0,a5
8000357a:	010e5e13          	srli	t3,t3,0x10
8000357e:	006595b3          	sll	a1,a1,t1
80003582:	8ddd                	or	a1,a1,a5
80003584:	0105de93          	srli	t4,a1,0x10
80003588:	006518b3          	sll	a7,a0,t1
8000358c:	02c77733          	remu	a4,a4,a2
80003590:	02de07b3          	mul	a5,t3,a3
80003594:	01071693          	slli	a3,a4,0x10
80003598:	01d6e6b3          	or	a3,a3,t4
8000359c:	00f6f863          	bgeu	a3,a5,800035ac <__umoddi3+0x21c>
800035a0:	96c2                	add	a3,a3,a6
800035a2:	0106e563          	bltu	a3,a6,800035ac <__umoddi3+0x21c>
800035a6:	00f6f363          	bgeu	a3,a5,800035ac <__umoddi3+0x21c>
800035aa:	96c2                	add	a3,a3,a6
800035ac:	8e9d                	sub	a3,a3,a5
800035ae:	02c6d733          	divu	a4,a3,a2
800035b2:	01059793          	slli	a5,a1,0x10
800035b6:	83c1                	srli	a5,a5,0x10
800035b8:	02c6f6b3          	remu	a3,a3,a2
800035bc:	02ee0733          	mul	a4,t3,a4
800035c0:	01069593          	slli	a1,a3,0x10
800035c4:	8ddd                	or	a1,a1,a5
800035c6:	00e5f863          	bgeu	a1,a4,800035d6 <__umoddi3+0x246>
800035ca:	95c2                	add	a1,a1,a6
800035cc:	0105e563          	bltu	a1,a6,800035d6 <__umoddi3+0x246>
800035d0:	00e5f363          	bgeu	a1,a4,800035d6 <__umoddi3+0x246>
800035d4:	95c2                	add	a1,a1,a6
800035d6:	8d99                	sub	a1,a1,a4
800035d8:	bdfd                	j	800034d6 <__umoddi3+0x146>
800035da:	01c657b3          	srl	a5,a2,t3
800035de:	006696b3          	sll	a3,a3,t1
800035e2:	8edd                	or	a3,a3,a5
800035e4:	01c5d8b3          	srl	a7,a1,t3
800035e8:	0106d713          	srli	a4,a3,0x10
800035ec:	02e8deb3          	divu	t4,a7,a4
800035f0:	01069f13          	slli	t5,a3,0x10
800035f4:	01c557b3          	srl	a5,a0,t3
800035f8:	010f5f13          	srli	t5,t5,0x10
800035fc:	006595b3          	sll	a1,a1,t1
80003600:	8ddd                	or	a1,a1,a5
80003602:	0105d813          	srli	a6,a1,0x10
80003606:	00661633          	sll	a2,a2,t1
8000360a:	00651533          	sll	a0,a0,t1
8000360e:	02e8f8b3          	remu	a7,a7,a4
80003612:	03df07b3          	mul	a5,t5,t4
80003616:	08c2                	slli	a7,a7,0x10
80003618:	0108e833          	or	a6,a7,a6
8000361c:	00f87b63          	bgeu	a6,a5,80003632 <__umoddi3+0x2a2>
80003620:	9836                	add	a6,a6,a3
80003622:	fffe8893          	addi	a7,t4,-1
80003626:	0ed86763          	bltu	a6,a3,80003714 <__umoddi3+0x384>
8000362a:	0ef87563          	bgeu	a6,a5,80003714 <__umoddi3+0x384>
8000362e:	1ef9                	addi	t4,t4,-2
80003630:	9836                	add	a6,a6,a3
80003632:	40f80833          	sub	a6,a6,a5
80003636:	02e857b3          	divu	a5,a6,a4
8000363a:	05c2                	slli	a1,a1,0x10
8000363c:	81c1                	srli	a1,a1,0x10
8000363e:	02e87833          	remu	a6,a6,a4
80003642:	02ff0f33          	mul	t5,t5,a5
80003646:	01081713          	slli	a4,a6,0x10
8000364a:	8f4d                	or	a4,a4,a1
8000364c:	01e77b63          	bgeu	a4,t5,80003662 <__umoddi3+0x2d2>
80003650:	9736                	add	a4,a4,a3
80003652:	fff78593          	addi	a1,a5,-1 # ffffff <_vector_table-0x7f000001>
80003656:	0ad76d63          	bltu	a4,a3,80003710 <__umoddi3+0x380>
8000365a:	0be77b63          	bgeu	a4,t5,80003710 <__umoddi3+0x380>
8000365e:	17f9                	addi	a5,a5,-2
80003660:	9736                	add	a4,a4,a3
80003662:	0ec2                	slli	t4,t4,0x10
80003664:	62c1                	lui	t0,0x10
80003666:	00feeeb3          	or	t4,t4,a5
8000366a:	fff28813          	addi	a6,t0,-1 # ffff <_vector_table-0x7fff0001>
8000366e:	010ef8b3          	and	a7,t4,a6
80003672:	01065593          	srli	a1,a2,0x10
80003676:	010ede93          	srli	t4,t4,0x10
8000367a:	01067833          	and	a6,a2,a6
8000367e:	03088fb3          	mul	t6,a7,a6
80003682:	41e70733          	sub	a4,a4,t5
80003686:	030e8833          	mul	a6,t4,a6
8000368a:	010fd793          	srli	a5,t6,0x10
8000368e:	02b888b3          	mul	a7,a7,a1
80003692:	98c2                	add	a7,a7,a6
80003694:	97c6                	add	a5,a5,a7
80003696:	02be8eb3          	mul	t4,t4,a1
8000369a:	0107f363          	bgeu	a5,a6,800036a0 <__umoddi3+0x310>
8000369e:	9e96                	add	t4,t4,t0
800036a0:	6841                	lui	a6,0x10
800036a2:	187d                	addi	a6,a6,-1
800036a4:	0107d593          	srli	a1,a5,0x10
800036a8:	0107f7b3          	and	a5,a5,a6
800036ac:	07c2                	slli	a5,a5,0x10
800036ae:	010fffb3          	and	t6,t6,a6
800036b2:	95f6                	add	a1,a1,t4
800036b4:	97fe                	add	a5,a5,t6
800036b6:	02b76663          	bltu	a4,a1,800036e2 <__umoddi3+0x352>
800036ba:	02b70263          	beq	a4,a1,800036de <__umoddi3+0x34e>
800036be:	40f507b3          	sub	a5,a0,a5
800036c2:	00f53533          	sltu	a0,a0,a5
800036c6:	40b705b3          	sub	a1,a4,a1
800036ca:	8d89                	sub	a1,a1,a0
800036cc:	01c59e33          	sll	t3,a1,t3
800036d0:	0067d533          	srl	a0,a5,t1
800036d4:	00ae6533          	or	a0,t3,a0
800036d8:	0065d5b3          	srl	a1,a1,t1
800036dc:	8082                	ret
800036de:	fef570e3          	bgeu	a0,a5,800036be <__umoddi3+0x32e>
800036e2:	40c78633          	sub	a2,a5,a2
800036e6:	00c7b7b3          	sltu	a5,a5,a2
800036ea:	97b6                	add	a5,a5,a3
800036ec:	8d9d                	sub	a1,a1,a5
800036ee:	87b2                	mv	a5,a2
800036f0:	b7f9                	j	800036be <__umoddi3+0x32e>
800036f2:	01085693          	srli	a3,a6,0x10
800036f6:	47c1                	li	a5,16
800036f8:	bb4d                	j	800034aa <__umoddi3+0x11a>
800036fa:	0106d313          	srli	t1,a3,0x10
800036fe:	48c1                	li	a7,16
80003700:	bb99                	j	80003456 <__umoddi3+0xc6>
80003702:	01065693          	srli	a3,a2,0x10
80003706:	47c1                	li	a5,16
80003708:	b175                	j	800033b4 <__umoddi3+0x24>
8000370a:	8336                	mv	t1,a3
8000370c:	4881                	li	a7,0
8000370e:	b3a1                	j	80003456 <__umoddi3+0xc6>
80003710:	87ae                	mv	a5,a1
80003712:	bf81                	j	80003662 <__umoddi3+0x2d2>
80003714:	8ec6                	mv	t4,a7
80003716:	bf31                	j	80003632 <__umoddi3+0x2a2>
80003718:	9742                	add	a4,a4,a6
8000371a:	bbf9                	j	800034f8 <__umoddi3+0x168>

Disassembly of section .fini:

8000371c <_fini>:
8000371c:	800057b7          	lui	a5,0x80005
80003720:	0107a783          	lw	a5,16(a5) # 80005010 <__boot_stack__+0xf8005011>
80003724:	c391                	beqz	a5,80003728 <_fini+0xc>
80003726:	8082                	ret
80003728:	800057b7          	lui	a5,0x80005
8000372c:	4705                	li	a4,1
8000372e:	00e7a823          	sw	a4,16(a5) # 80005010 <__boot_stack__+0xf8005011>
80003732:	800057b7          	lui	a5,0x80005
80003736:	ffc7a783          	lw	a5,-4(a5) # 80004ffc <__boot_stack__+0xf8004ffd>
8000373a:	d7f5                	beqz	a5,80003726 <_fini+0xa>
8000373c:	1141                	addi	sp,sp,-16
8000373e:	c606                	sw	ra,12(sp)
80003740:	c422                	sw	s0,8(sp)
80003742:	80005437          	lui	s0,0x80005
80003746:	ffc40413          	addi	s0,s0,-4 # 80004ffc <__boot_stack__+0xf8004ffd>
8000374a:	9782                	jalr	a5
8000374c:	0411                	addi	s0,s0,4
8000374e:	401c                	lw	a5,0(s0)
80003750:	ffed                	bnez	a5,8000374a <_fini+0x2e>
80003752:	40b2                	lw	ra,12(sp)
80003754:	4422                	lw	s0,8(sp)
80003756:	0141                	addi	sp,sp,16
80003758:	8082                	ret
