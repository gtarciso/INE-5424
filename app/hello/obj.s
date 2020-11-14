
hello:     file format elf32-littleriscv


Disassembly of section .init:

80000000 <_vector_table>:
80000000:	a891                	j	80000054 <_reset>
80000002:	0001                	nop
80000004:	00000013          	nop
80000008:	00000013          	nop
8000000c:	00000013          	nop

80000010 <IRQ0>:
80000010:	1fc0306f          	j	8000320c <_ZN4EPOS1S2IC18exception_handlingEv>

80000014 <IRQ1>:
80000014:	0fc0306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000018 <IRQ2>:
80000018:	0f80306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

8000001c <IRQ3>:
8000001c:	0f40306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000020 <IRQ4>:
80000020:	0f00306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000024 <IRQ5>:
80000024:	0ec0306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000028 <IRQ6>:
80000028:	0e80306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

8000002c <IRQ7>:
8000002c:	0e40306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000030 <IRQ8>:
80000030:	0e00306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000034 <IRQ9>:
80000034:	0dc0306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000038 <IRQ10>:
80000038:	0d80306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

8000003c <IRQ11>:
8000003c:	0d40306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000040 <IRQ12>:
80000040:	0d00306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000044 <IRQ13>:
80000044:	0cc0306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000048 <IRQ14>:
80000048:	0c80306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

8000004c <IRQ15>:
8000004c:	0c40306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000050 <IRQ16>:
80000050:	0c00306f          	j	80003110 <_ZN4EPOS1S2IC5entryEv>

80000054 <_reset>:
80000054:	18001073          	csrw	satp,zero
80000058:	f14022f3          	csrr	t0,mhartid
8000005c:	04029a63          	bnez	t0,800000b0 <secondary>
80000060:	08000117          	auipc	sp,0x8000
80000064:	f9f10113          	addi	sp,sp,-97 # 87ffffff <__boot_stack__>
80000068:	4285                	li	t0,1
8000006a:	02be                	slli	t0,t0,0xf
8000006c:	f1402573          	csrr	a0,mhartid
80000070:	02a282b3          	mul	t0,t0,a0
80000074:	40510133          	sub	sp,sp,t0
80000078:	6289                	lui	t0,0x2
8000007a:	88828293          	addi	t0,t0,-1912 # 1888 <_vector_table-0x7fffe778>
8000007e:	30029073          	csrw	mstatus,t0
80000082:	18001073          	csrw	satp,zero
80000086:	00000317          	auipc	t1,0x0
8000008a:	0ca30313          	addi	t1,t1,202 # 80000150 <_start>
8000008e:	34131073          	csrw	mepc,t1
80000092:	00000397          	auipc	t2,0x0
80000096:	f7e38393          	addi	t2,t2,-130 # 80000010 <IRQ0>
8000009a:	0013e393          	ori	t2,t2,1
8000009e:	30539073          	csrw	mtvec,t2
800000a2:	6e05                	lui	t3,0x1
800000a4:	888e0e13          	addi	t3,t3,-1912 # 888 <_vector_table-0x7ffff778>
800000a8:	304e1073          	csrw	mie,t3
800000ac:	30200073          	mret

800000b0 <secondary>:
800000b0:	08000117          	auipc	sp,0x8000
800000b4:	f4f10113          	addi	sp,sp,-177 # 87ffffff <__boot_stack__>
800000b8:	4285                	li	t0,1
800000ba:	02d2                	slli	t0,t0,0x14
800000bc:	f1402573          	csrr	a0,mhartid
800000c0:	02a282b3          	mul	t0,t0,a0
800000c4:	40510133          	sub	sp,sp,t0
800000c8:	6289                	lui	t0,0x2
800000ca:	88828293          	addi	t0,t0,-1912 # 1888 <_vector_table-0x7fffe778>
800000ce:	30029073          	csrw	mstatus,t0
800000d2:	6e05                	lui	t3,0x1
800000d4:	888e0e13          	addi	t3,t3,-1912 # 888 <_vector_table-0x7ffff778>
800000d8:	304e1073          	csrw	mie,t3
800000dc:	00000317          	auipc	t1,0x0
800000e0:	02030313          	addi	t1,t1,32 # 800000fc <wait>
800000e4:	34131073          	csrw	mepc,t1
800000e8:	00000397          	auipc	t2,0x0
800000ec:	f2838393          	addi	t2,t2,-216 # 80000010 <IRQ0>
800000f0:	0013e393          	ori	t2,t2,1
800000f4:	30539073          	csrw	mtvec,t2
800000f8:	30200073          	mret

800000fc <wait>:
800000fc:	10500073          	wfi
80000100:	0500006f          	j	80000150 <_start>
80000104:	00000013          	nop
80000108:	00000013          	nop
8000010c:	00000013          	nop

80000110 <_init>:
80000110:	800057b7          	lui	a5,0x80005
80000114:	fe07a783          	lw	a5,-32(a5) # 80004fe0 <__boot_stack__+0xf8004fe1>
80000118:	577d                	li	a4,-1
8000011a:	02e78863          	beq	a5,a4,8000014a <_init+0x3a>
8000011e:	1141                	addi	sp,sp,-16
80000120:	c606                	sw	ra,12(sp)
80000122:	c422                	sw	s0,8(sp)
80000124:	c226                	sw	s1,4(sp)
80000126:	80005437          	lui	s0,0x80005
8000012a:	fe040413          	addi	s0,s0,-32 # 80004fe0 <__boot_stack__+0xf8004fe1>
8000012e:	54fd                	li	s1,-1
80000130:	a031                	j	8000013c <_init+0x2c>
80000132:	9782                	jalr	a5
80000134:	1471                	addi	s0,s0,-4
80000136:	401c                	lw	a5,0(s0)
80000138:	00978463          	beq	a5,s1,80000140 <_init+0x30>
8000013c:	f87d                	bnez	s0,80000132 <_init+0x22>
8000013e:	bfdd                	j	80000134 <_init+0x24>
80000140:	40b2                	lw	ra,12(sp)
80000142:	4422                	lw	s0,8(sp)
80000144:	4492                	lw	s1,4(sp)
80000146:	0141                	addi	sp,sp,16
80000148:	8082                	ret
8000014a:	8082                	ret

Disassembly of section .text:

80000150 <_start>:
80000150:	f1402573          	csrr	a0,mhartid
80000154:	02051263          	bnez	a0,80000178 <_start+0x28>
80000158:	00005517          	auipc	a0,0x5
8000015c:	ea850513          	addi	a0,a0,-344 # 80005000 <initialized.0>
80000160:	00006597          	auipc	a1,0x6
80000164:	fe058593          	addi	a1,a1,-32 # 80006140 <_end>
80000168:	00b57863          	bgeu	a0,a1,80000178 <_start+0x28>
8000016c:	00052023          	sw	zero,0(a0)
80000170:	00450513          	addi	a0,a0,4
80000174:	feb56ce3          	bltu	a0,a1,8000016c <_start+0x1c>
80000178:	00000097          	auipc	ra,0x0
8000017c:	f98080e7          	jalr	-104(ra) # 80000110 <_init>

80000180 <__epos_app_entry>:
80000180:	00000097          	auipc	ra,0x0
80000184:	1fc080e7          	jalr	508(ra) # 8000037c <main>
80000188:	00012503          	lw	a0,0(sp)
8000018c:	00003097          	auipc	ra,0x3
80000190:	510080e7          	jalr	1296(ra) # 8000369c <_fini>
80000194:	00001097          	auipc	ra,0x1
80000198:	d78080e7          	jalr	-648(ra) # 80000f0c <_exit>
	...

800001a8 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE>:
800001a8:	1141                	addi	sp,sp,-16
800001aa:	c606                	sw	ra,12(sp)
800001ac:	f14027f3          	csrr	a5,mhartid
800001b0:	80005737          	lui	a4,0x80005
800001b4:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
800001b8:	00269713          	slli	a4,a3,0x2
800001bc:	80005637          	lui	a2,0x80005
800001c0:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
800001c4:	9732                	add	a4,a4,a2
800001c6:	1007262f          	lr.w	a2,(a4)
800001ca:	0605                	addi	a2,a2,1
800001cc:	18c722af          	sc.w	t0,a2,(a4)
800001d0:	fe029be3          	bnez	t0,800001c6 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x1e>
800001d4:	8b8d                	andi	a5,a5,3
800001d6:	cb91                	beqz	a5,800001ea <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x42>
800001d8:	80005737          	lui	a4,0x80005
800001dc:	068a                	slli	a3,a3,0x2
800001de:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
800001e2:	9736                	add	a4,a4,a3
800001e4:	431c                	lw	a5,0(a4)
800001e6:	fffd                	bnez	a5,800001e4 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x3c>
800001e8:	a825                	j	80000220 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x78>
800001ea:	800057b7          	lui	a5,0x80005
800001ee:	00269713          	slli	a4,a3,0x2
800001f2:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
800001f6:	973e                	add	a4,a4,a5
800001f8:	460d                	li	a2,3
800001fa:	431c                	lw	a5,0(a4)
800001fc:	fef65fe3          	bge	a2,a5,800001fa <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x52>
80000200:	80005737          	lui	a4,0x80005
80000204:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000208:	0017b793          	seqz	a5,a5
8000020c:	00f72223          	sw	a5,4(a4)
80000210:	800057b7          	lui	a5,0x80005
80000214:	068a                	slli	a3,a3,0x2
80000216:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
8000021a:	96be                	add	a3,a3,a5
8000021c:	0006a023          	sw	zero,0(a3)
80000220:	f1402773          	csrr	a4,mhartid
80000224:	8b0d                	andi	a4,a4,3
80000226:	800057b7          	lui	a5,0x80005
8000022a:	070a                	slli	a4,a4,0x2
8000022c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80000230:	97ba                	add	a5,a5,a4
80000232:	47dc                	lw	a5,12(a5)
80000234:	438c                	lw	a1,0(a5)
80000236:	f14027f3          	csrr	a5,mhartid
8000023a:	80005737          	lui	a4,0x80005
8000023e:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000242:	00269713          	slli	a4,a3,0x2
80000246:	80005637          	lui	a2,0x80005
8000024a:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
8000024e:	9732                	add	a4,a4,a2
80000250:	1007262f          	lr.w	a2,(a4)
80000254:	0605                	addi	a2,a2,1
80000256:	18c722af          	sc.w	t0,a2,(a4)
8000025a:	fe029be3          	bnez	t0,80000250 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0xa8>
8000025e:	8b8d                	andi	a5,a5,3
80000260:	cb91                	beqz	a5,80000274 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0xcc>
80000262:	80005737          	lui	a4,0x80005
80000266:	068a                	slli	a3,a3,0x2
80000268:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
8000026c:	9736                	add	a4,a4,a3
8000026e:	431c                	lw	a5,0(a4)
80000270:	fffd                	bnez	a5,8000026e <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0xc6>
80000272:	a825                	j	800002aa <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0x102>
80000274:	800057b7          	lui	a5,0x80005
80000278:	00269713          	slli	a4,a3,0x2
8000027c:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000280:	973e                	add	a4,a4,a5
80000282:	460d                	li	a2,3
80000284:	431c                	lw	a5,0(a4)
80000286:	fef65fe3          	bge	a2,a5,80000284 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE+0xdc>
8000028a:	80005737          	lui	a4,0x80005
8000028e:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000292:	0017b793          	seqz	a5,a5
80000296:	00f72223          	sw	a5,4(a4)
8000029a:	800057b7          	lui	a5,0x80005
8000029e:	068a                	slli	a3,a3,0x2
800002a0:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
800002a4:	96be                	add	a3,a3,a5
800002a6:	0006a023          	sw	zero,0(a3)
800002aa:	08800793          	li	a5,136
800002ae:	30479073          	csrw	mie,a5
800002b2:	41c8                	lw	a0,4(a1)
800002b4:	00003097          	auipc	ra,0x3
800002b8:	120080e7          	jalr	288(ra) # 800033d4 <_ZNVK4EPOS1S3CPU7Context4loadEv>
800002bc:	40b2                	lw	ra,12(sp)
800002be:	0141                	addi	sp,sp,16
800002c0:	8082                	ret

800002c2 <_Z4funci>:
800002c2:	711d                	addi	sp,sp,-96
800002c4:	ce86                	sw	ra,92(sp)
800002c6:	cca2                	sw	s0,88(sp)
800002c8:	caa6                	sw	s1,84(sp)
800002ca:	c8ca                	sw	s2,80(sp)
800002cc:	c6ce                	sw	s3,76(sp)
800002ce:	c4d2                	sw	s4,72(sp)
800002d0:	c2d6                	sw	s5,68(sp)
800002d2:	c0da                	sw	s6,64(sp)
800002d4:	892a                	mv	s2,a0
800002d6:	6405                	lui	s0,0x1
800002d8:	38840413          	addi	s0,s0,904 # 1388 <_vector_table-0x7fffec78>
800002dc:	6b05                	lui	s6,0x1
800002de:	800054b7          	lui	s1,0x80005
800002e2:	80003ab7          	lui	s5,0x80003
800002e6:	80003a37          	lui	s4,0x80003
800002ea:	49a9                	li	s3,10
800002ec:	388b0793          	addi	a5,s6,904 # 1388 <_vector_table-0x7fffec78>
800002f0:	17fd                	addi	a5,a5,-1
800002f2:	fffd                	bnez	a5,800002f0 <_Z4funci+0x2e>
800002f4:	860a                	mv	a2,sp
800002f6:	85ca                	mv	a1,s2
800002f8:	01448513          	addi	a0,s1,20 # 80005014 <__boot_stack__+0xf8005015>
800002fc:	00001097          	auipc	ra,0x1
80000300:	dd6080e7          	jalr	-554(ra) # 800010d2 <_ZN4EPOS1S1U7OStream4itoaEiPc>
80000304:	009c                	addi	a5,sp,64
80000306:	97aa                	add	a5,a5,a0
80000308:	fc078023          	sb	zero,-64(a5)
8000030c:	850a                	mv	a0,sp
8000030e:	00001097          	auipc	ra,0x1
80000312:	c20080e7          	jalr	-992(ra) # 80000f2e <_print>
80000316:	6dca8513          	addi	a0,s5,1756 # 800036dc <__boot_stack__+0xf80036dd>
8000031a:	00001097          	auipc	ra,0x1
8000031e:	c14080e7          	jalr	-1004(ra) # 80000f2e <_print>
80000322:	f14025f3          	csrr	a1,mhartid
80000326:	4681                	li	a3,0
80000328:	860a                	mv	a2,sp
8000032a:	898d                	andi	a1,a1,3
8000032c:	01448513          	addi	a0,s1,20
80000330:	00001097          	auipc	ra,0x1
80000334:	d16080e7          	jalr	-746(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000338:	009c                	addi	a5,sp,64
8000033a:	97aa                	add	a5,a5,a0
8000033c:	fc078023          	sb	zero,-64(a5)
80000340:	850a                	mv	a0,sp
80000342:	00001097          	auipc	ra,0x1
80000346:	bec080e7          	jalr	-1044(ra) # 80000f2e <_print>
8000034a:	6e8a0513          	addi	a0,s4,1768 # 800036e8 <__boot_stack__+0xf80036e9>
8000034e:	00001097          	auipc	ra,0x1
80000352:	be0080e7          	jalr	-1056(ra) # 80000f2e <_print>
80000356:	0134aa23          	sw	s3,20(s1)
8000035a:	00001097          	auipc	ra,0x1
8000035e:	fe6080e7          	jalr	-26(ra) # 80001340 <_ZN4EPOS1S6Thread5yieldEv>
80000362:	147d                	addi	s0,s0,-1
80000364:	f441                	bnez	s0,800002ec <_Z4funci+0x2a>
80000366:	4501                	li	a0,0
80000368:	40f6                	lw	ra,92(sp)
8000036a:	4466                	lw	s0,88(sp)
8000036c:	44d6                	lw	s1,84(sp)
8000036e:	4946                	lw	s2,80(sp)
80000370:	49b6                	lw	s3,76(sp)
80000372:	4a26                	lw	s4,72(sp)
80000374:	4a96                	lw	s5,68(sp)
80000376:	4b06                	lw	s6,64(sp)
80000378:	6125                	addi	sp,sp,96
8000037a:	8082                	ret

8000037c <main>:
8000037c:	7159                	addi	sp,sp,-112
8000037e:	d686                	sw	ra,108(sp)
80000380:	d4a2                	sw	s0,104(sp)
80000382:	d2a6                	sw	s1,100(sp)
80000384:	d0ca                	sw	s2,96(sp)
80000386:	cece                	sw	s3,92(sp)
80000388:	ccd2                	sw	s4,88(sp)
8000038a:	cad6                	sw	s5,84(sp)
8000038c:	c8da                	sw	s6,80(sp)
8000038e:	c6de                	sw	s7,76(sp)
80000390:	c4e2                	sw	s8,72(sp)
80000392:	c2e6                	sw	s9,68(sp)
80000394:	c0ea                	sw	s10,64(sp)
80000396:	de6e                	sw	s11,60(sp)
80000398:	80003937          	lui	s2,0x80003
8000039c:	6ec90513          	addi	a0,s2,1772 # 800036ec <__boot_stack__+0xf80036ed>
800003a0:	00001097          	auipc	ra,0x1
800003a4:	b8e080e7          	jalr	-1138(ra) # 80000f2e <_print>
800003a8:	800034b7          	lui	s1,0x80003
800003ac:	6e848513          	addi	a0,s1,1768 # 800036e8 <__boot_stack__+0xf80036e9>
800003b0:	00001097          	auipc	ra,0x1
800003b4:	b7e080e7          	jalr	-1154(ra) # 80000f2e <_print>
800003b8:	80005ab7          	lui	s5,0x80005
800003bc:	014a8b13          	addi	s6,s5,20 # 80005014 <__boot_stack__+0xf8005015>
800003c0:	4429                	li	s0,10
800003c2:	008b2023          	sw	s0,0(s6)
800003c6:	80003537          	lui	a0,0x80003
800003ca:	71050513          	addi	a0,a0,1808 # 80003710 <__boot_stack__+0xf8003711>
800003ce:	00001097          	auipc	ra,0x1
800003d2:	b60080e7          	jalr	-1184(ra) # 80000f2e <_print>
800003d6:	6e848513          	addi	a0,s1,1768
800003da:	00001097          	auipc	ra,0x1
800003de:	b54080e7          	jalr	-1196(ra) # 80000f2e <_print>
800003e2:	008b2023          	sw	s0,0(s6)
800003e6:	6ec90513          	addi	a0,s2,1772
800003ea:	00001097          	auipc	ra,0x1
800003ee:	b44080e7          	jalr	-1212(ra) # 80000f2e <_print>
800003f2:	6e848513          	addi	a0,s1,1768
800003f6:	00001097          	auipc	ra,0x1
800003fa:	b38080e7          	jalr	-1224(ra) # 80000f2e <_print>
800003fe:	008b2023          	sw	s0,0(s6)
80000402:	80003537          	lui	a0,0x80003
80000406:	73850513          	addi	a0,a0,1848 # 80003738 <__boot_stack__+0xf8003739>
8000040a:	00001097          	auipc	ra,0x1
8000040e:	b24080e7          	jalr	-1244(ra) # 80000f2e <_print>
80000412:	6e848513          	addi	a0,s1,1768
80000416:	00001097          	auipc	ra,0x1
8000041a:	b18080e7          	jalr	-1256(ra) # 80000f2e <_print>
8000041e:	008b2023          	sw	s0,0(s6)
80000422:	4d05                	li	s10,1
80000424:	c66a                	sw	s10,12(sp)
80000426:	009897b7          	lui	a5,0x989
8000042a:	68078793          	addi	a5,a5,1664 # 989680 <_vector_table-0x7f676980>
8000042e:	c83e                	sw	a5,16(sp)
80000430:	6c91                	lui	s9,0x4
80000432:	ca66                	sw	s9,20(sp)
80000434:	80005937          	lui	s2,0x80005
80000438:	02400593          	li	a1,36
8000043c:	04492503          	lw	a0,68(s2) # 80005044 <__boot_stack__+0xf8005045>
80000440:	00000097          	auipc	ra,0x0
80000444:	2e4080e7          	jalr	740(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
80000448:	8a2a                	mv	s4,a0
8000044a:	4685                	li	a3,1
8000044c:	80000c37          	lui	s8,0x80000
80000450:	2c2c0613          	addi	a2,s8,706 # 800002c2 <__boot_stack__+0xf80002c3>
80000454:	006c                	addi	a1,sp,12
80000456:	00000097          	auipc	ra,0x0
8000045a:	386080e7          	jalr	902(ra) # 800007dc <_ZN4EPOS1S6ThreadC1IJiEEERKNS1_13ConfigurationEPFiDpT_ES7_>
8000045e:	80003bb7          	lui	s7,0x80003
80000462:	748b8513          	addi	a0,s7,1864 # 80003748 <__boot_stack__+0xf8003749>
80000466:	00001097          	auipc	ra,0x1
8000046a:	ac8080e7          	jalr	-1336(ra) # 80000f2e <_print>
8000046e:	85d2                	mv	a1,s4
80000470:	014a8513          	addi	a0,s5,20
80000474:	00000097          	auipc	ra,0x0
80000478:	282080e7          	jalr	642(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
8000047c:	89aa                	mv	s3,a0
8000047e:	6e848513          	addi	a0,s1,1768
80000482:	00001097          	auipc	ra,0x1
80000486:	aac080e7          	jalr	-1364(ra) # 80000f2e <_print>
8000048a:	0089a023          	sw	s0,0(s3)
8000048e:	cc6a                	sw	s10,24(sp)
80000490:	02faf7b7          	lui	a5,0x2faf
80000494:	08078793          	addi	a5,a5,128 # 2faf080 <_vector_table-0x7d050f80>
80000498:	ce3e                	sw	a5,28(sp)
8000049a:	d066                	sw	s9,32(sp)
8000049c:	02400593          	li	a1,36
800004a0:	04492503          	lw	a0,68(s2)
800004a4:	00000097          	auipc	ra,0x0
800004a8:	280080e7          	jalr	640(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
800004ac:	89aa                	mv	s3,a0
800004ae:	4695                	li	a3,5
800004b0:	2c2c0613          	addi	a2,s8,706
800004b4:	082c                	addi	a1,sp,24
800004b6:	00000097          	auipc	ra,0x0
800004ba:	326080e7          	jalr	806(ra) # 800007dc <_ZN4EPOS1S6ThreadC1IJiEEERKNS1_13ConfigurationEPFiDpT_ES7_>
800004be:	748b8513          	addi	a0,s7,1864
800004c2:	00001097          	auipc	ra,0x1
800004c6:	a6c080e7          	jalr	-1428(ra) # 80000f2e <_print>
800004ca:	85ce                	mv	a1,s3
800004cc:	014a8513          	addi	a0,s5,20
800004d0:	00000097          	auipc	ra,0x0
800004d4:	226080e7          	jalr	550(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
800004d8:	8daa                	mv	s11,a0
800004da:	6e848513          	addi	a0,s1,1768
800004de:	00001097          	auipc	ra,0x1
800004e2:	a50080e7          	jalr	-1456(ra) # 80000f2e <_print>
800004e6:	008da023          	sw	s0,0(s11)
800004ea:	d26a                	sw	s10,36(sp)
800004ec:	01c9c7b7          	lui	a5,0x1c9c
800004f0:	38078793          	addi	a5,a5,896 # 1c9c380 <_vector_table-0x7e363c80>
800004f4:	d43e                	sw	a5,40(sp)
800004f6:	d666                	sw	s9,44(sp)
800004f8:	02400593          	li	a1,36
800004fc:	04492503          	lw	a0,68(s2)
80000500:	00000097          	auipc	ra,0x0
80000504:	224080e7          	jalr	548(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
80000508:	892a                	mv	s2,a0
8000050a:	468d                	li	a3,3
8000050c:	2c2c0613          	addi	a2,s8,706
80000510:	104c                	addi	a1,sp,36
80000512:	00000097          	auipc	ra,0x0
80000516:	2ca080e7          	jalr	714(ra) # 800007dc <_ZN4EPOS1S6ThreadC1IJiEEERKNS1_13ConfigurationEPFiDpT_ES7_>
8000051a:	748b8513          	addi	a0,s7,1864
8000051e:	00001097          	auipc	ra,0x1
80000522:	a10080e7          	jalr	-1520(ra) # 80000f2e <_print>
80000526:	85ca                	mv	a1,s2
80000528:	014a8513          	addi	a0,s5,20
8000052c:	00000097          	auipc	ra,0x0
80000530:	1ca080e7          	jalr	458(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
80000534:	8baa                	mv	s7,a0
80000536:	6e848513          	addi	a0,s1,1768
8000053a:	00001097          	auipc	ra,0x1
8000053e:	9f4080e7          	jalr	-1548(ra) # 80000f2e <_print>
80000542:	008ba023          	sw	s0,0(s7)
80000546:	8552                	mv	a0,s4
80000548:	00001097          	auipc	ra,0x1
8000054c:	604080e7          	jalr	1540(ra) # 80001b4c <_ZN4EPOS1S6Thread4joinEv>
80000550:	80003bb7          	lui	s7,0x80003
80000554:	760b8513          	addi	a0,s7,1888 # 80003760 <__boot_stack__+0xf8003761>
80000558:	00001097          	auipc	ra,0x1
8000055c:	9d6080e7          	jalr	-1578(ra) # 80000f2e <_print>
80000560:	85d2                	mv	a1,s4
80000562:	014a8513          	addi	a0,s5,20
80000566:	00000097          	auipc	ra,0x0
8000056a:	190080e7          	jalr	400(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
8000056e:	8c2a                	mv	s8,a0
80000570:	6e848513          	addi	a0,s1,1768
80000574:	00001097          	auipc	ra,0x1
80000578:	9ba080e7          	jalr	-1606(ra) # 80000f2e <_print>
8000057c:	008c2023          	sw	s0,0(s8)
80000580:	854e                	mv	a0,s3
80000582:	00001097          	auipc	ra,0x1
80000586:	5ca080e7          	jalr	1482(ra) # 80001b4c <_ZN4EPOS1S6Thread4joinEv>
8000058a:	760b8513          	addi	a0,s7,1888
8000058e:	00001097          	auipc	ra,0x1
80000592:	9a0080e7          	jalr	-1632(ra) # 80000f2e <_print>
80000596:	85ce                	mv	a1,s3
80000598:	014a8513          	addi	a0,s5,20
8000059c:	00000097          	auipc	ra,0x0
800005a0:	15a080e7          	jalr	346(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
800005a4:	8c2a                	mv	s8,a0
800005a6:	6e848513          	addi	a0,s1,1768
800005aa:	00001097          	auipc	ra,0x1
800005ae:	984080e7          	jalr	-1660(ra) # 80000f2e <_print>
800005b2:	008c2023          	sw	s0,0(s8)
800005b6:	854a                	mv	a0,s2
800005b8:	00001097          	auipc	ra,0x1
800005bc:	594080e7          	jalr	1428(ra) # 80001b4c <_ZN4EPOS1S6Thread4joinEv>
800005c0:	760b8513          	addi	a0,s7,1888
800005c4:	00001097          	auipc	ra,0x1
800005c8:	96a080e7          	jalr	-1686(ra) # 80000f2e <_print>
800005cc:	85ca                	mv	a1,s2
800005ce:	014a8513          	addi	a0,s5,20
800005d2:	00000097          	auipc	ra,0x0
800005d6:	124080e7          	jalr	292(ra) # 800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>
800005da:	8aaa                	mv	s5,a0
800005dc:	6e848513          	addi	a0,s1,1768
800005e0:	00001097          	auipc	ra,0x1
800005e4:	94e080e7          	jalr	-1714(ra) # 80000f2e <_print>
800005e8:	008aa023          	sw	s0,0(s5)
800005ec:	80003537          	lui	a0,0x80003
800005f0:	77050513          	addi	a0,a0,1904 # 80003770 <__boot_stack__+0xf8003771>
800005f4:	00001097          	auipc	ra,0x1
800005f8:	93a080e7          	jalr	-1734(ra) # 80000f2e <_print>
800005fc:	6e848513          	addi	a0,s1,1768
80000600:	00001097          	auipc	ra,0x1
80000604:	92e080e7          	jalr	-1746(ra) # 80000f2e <_print>
80000608:	008b2023          	sw	s0,0(s6)
8000060c:	000a0e63          	beqz	s4,80000628 <main+0x2ac>
80000610:	8552                	mv	a0,s4
80000612:	00002097          	auipc	ra,0x2
80000616:	a7a080e7          	jalr	-1414(ra) # 8000208c <_ZN4EPOS1S6ThreadD1Ev>
8000061a:	02400593          	li	a1,36
8000061e:	8552                	mv	a0,s4
80000620:	00001097          	auipc	ra,0x1
80000624:	9d6080e7          	jalr	-1578(ra) # 80000ff6 <_ZdlPvj>
80000628:	00098e63          	beqz	s3,80000644 <main+0x2c8>
8000062c:	854e                	mv	a0,s3
8000062e:	00002097          	auipc	ra,0x2
80000632:	a5e080e7          	jalr	-1442(ra) # 8000208c <_ZN4EPOS1S6ThreadD1Ev>
80000636:	02400593          	li	a1,36
8000063a:	854e                	mv	a0,s3
8000063c:	00001097          	auipc	ra,0x1
80000640:	9ba080e7          	jalr	-1606(ra) # 80000ff6 <_ZdlPvj>
80000644:	00090e63          	beqz	s2,80000660 <main+0x2e4>
80000648:	854a                	mv	a0,s2
8000064a:	00002097          	auipc	ra,0x2
8000064e:	a42080e7          	jalr	-1470(ra) # 8000208c <_ZN4EPOS1S6ThreadD1Ev>
80000652:	02400593          	li	a1,36
80000656:	854a                	mv	a0,s2
80000658:	00001097          	auipc	ra,0x1
8000065c:	99e080e7          	jalr	-1634(ra) # 80000ff6 <_ZdlPvj>
80000660:	800039b7          	lui	s3,0x80003
80000664:	6ec98513          	addi	a0,s3,1772 # 800036ec <__boot_stack__+0xf80036ed>
80000668:	00001097          	auipc	ra,0x1
8000066c:	8c6080e7          	jalr	-1850(ra) # 80000f2e <_print>
80000670:	80003937          	lui	s2,0x80003
80000674:	6e890513          	addi	a0,s2,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80000678:	00001097          	auipc	ra,0x1
8000067c:	8b6080e7          	jalr	-1866(ra) # 80000f2e <_print>
80000680:	80005437          	lui	s0,0x80005
80000684:	01440413          	addi	s0,s0,20 # 80005014 <__boot_stack__+0xf8005015>
80000688:	44a9                	li	s1,10
8000068a:	c004                	sw	s1,0(s0)
8000068c:	80003537          	lui	a0,0x80003
80000690:	77c50513          	addi	a0,a0,1916 # 8000377c <__boot_stack__+0xf800377d>
80000694:	00001097          	auipc	ra,0x1
80000698:	89a080e7          	jalr	-1894(ra) # 80000f2e <_print>
8000069c:	6e890513          	addi	a0,s2,1768
800006a0:	00001097          	auipc	ra,0x1
800006a4:	88e080e7          	jalr	-1906(ra) # 80000f2e <_print>
800006a8:	c004                	sw	s1,0(s0)
800006aa:	6ec98513          	addi	a0,s3,1772
800006ae:	00001097          	auipc	ra,0x1
800006b2:	880080e7          	jalr	-1920(ra) # 80000f2e <_print>
800006b6:	6e890513          	addi	a0,s2,1768
800006ba:	00001097          	auipc	ra,0x1
800006be:	874080e7          	jalr	-1932(ra) # 80000f2e <_print>
800006c2:	c004                	sw	s1,0(s0)
800006c4:	4501                	li	a0,0
800006c6:	50b6                	lw	ra,108(sp)
800006c8:	5426                	lw	s0,104(sp)
800006ca:	5496                	lw	s1,100(sp)
800006cc:	5906                	lw	s2,96(sp)
800006ce:	49f6                	lw	s3,92(sp)
800006d0:	4a66                	lw	s4,88(sp)
800006d2:	4ad6                	lw	s5,84(sp)
800006d4:	4b46                	lw	s6,80(sp)
800006d6:	4bb6                	lw	s7,76(sp)
800006d8:	4c26                	lw	s8,72(sp)
800006da:	4c96                	lw	s9,68(sp)
800006dc:	4d06                	lw	s10,64(sp)
800006de:	5df2                	lw	s11,60(sp)
800006e0:	6165                	addi	sp,sp,112
800006e2:	8082                	ret

800006e4 <_GLOBAL__sub_I_cout>:
800006e4:	800057b7          	lui	a5,0x80005
800006e8:	01478793          	addi	a5,a5,20 # 80005014 <__boot_stack__+0xf8005015>
800006ec:	4729                	li	a4,10
800006ee:	c398                	sw	a4,0(a5)
800006f0:	00078223          	sb	zero,4(a5)
800006f4:	8082                	ret

800006f6 <_ZN4EPOS1S1U7OStreamlsEPKv>:
800006f6:	715d                	addi	sp,sp,-80
800006f8:	c686                	sw	ra,76(sp)
800006fa:	c4a2                	sw	s0,72(sp)
800006fc:	842a                	mv	s0,a0
800006fe:	860a                	mv	a2,sp
80000700:	00001097          	auipc	ra,0x1
80000704:	9fa080e7          	jalr	-1542(ra) # 800010fa <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>
80000708:	009c                	addi	a5,sp,64
8000070a:	953e                	add	a0,a0,a5
8000070c:	fc050023          	sb	zero,-64(a0)
80000710:	850a                	mv	a0,sp
80000712:	00001097          	auipc	ra,0x1
80000716:	81c080e7          	jalr	-2020(ra) # 80000f2e <_print>
8000071a:	8522                	mv	a0,s0
8000071c:	40b6                	lw	ra,76(sp)
8000071e:	4426                	lw	s0,72(sp)
80000720:	6161                	addi	sp,sp,80
80000722:	8082                	ret

80000724 <_ZN4EPOS1S1U4Heap5allocEj>:
80000724:	cdc1                	beqz	a1,800007bc <_ZN4EPOS1S1U4Heap5allocEj+0x98>
80000726:	0035f793          	andi	a5,a1,3
8000072a:	c789                	beqz	a5,80000734 <_ZN4EPOS1S1U4Heap5allocEj+0x10>
8000072c:	0585                	addi	a1,a1,1
8000072e:	0035f793          	andi	a5,a1,3
80000732:	ffed                	bnez	a5,8000072c <_ZN4EPOS1S1U4Heap5allocEj+0x8>
80000734:	0591                	addi	a1,a1,4
80000736:	47c1                	li	a5,16
80000738:	00f5f363          	bgeu	a1,a5,8000073e <_ZN4EPOS1S1U4Heap5allocEj+0x1a>
8000073c:	45c1                	li	a1,16
8000073e:	415c                	lw	a5,4(a0)
80000740:	cb91                	beqz	a5,80000754 <_ZN4EPOS1S1U4Heap5allocEj+0x30>
80000742:	01058693          	addi	a3,a1,16
80000746:	43d8                	lw	a4,4(a5)
80000748:	06d77c63          	bgeu	a4,a3,800007c0 <_ZN4EPOS1S1U4Heap5allocEj+0x9c>
8000074c:	06e58a63          	beq	a1,a4,800007c0 <_ZN4EPOS1S1U4Heap5allocEj+0x9c>
80000750:	47dc                	lw	a5,12(a5)
80000752:	fbf5                	bnez	a5,80000746 <_ZN4EPOS1S1U4Heap5allocEj+0x22>
80000754:	1141                	addi	sp,sp,-16
80000756:	c606                	sw	ra,12(sp)
80000758:	00001097          	auipc	ra,0x1
8000075c:	8dc080e7          	jalr	-1828(ra) # 80001034 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
80000760:	4501                	li	a0,0
80000762:	40b2                	lw	ra,12(sp)
80000764:	0141                	addi	sp,sp,16
80000766:	8082                	ret
80000768:	4118                	lw	a4,0(a0)
8000076a:	4685                	li	a3,1
8000076c:	00d70d63          	beq	a4,a3,80000786 <_ZN4EPOS1S1U4Heap5allocEj+0x62>
80000770:	4790                	lw	a2,8(a5)
80000772:	c20d                	beqz	a2,80000794 <_ZN4EPOS1S1U4Heap5allocEj+0x70>
80000774:	47d4                	lw	a3,12(a5)
80000776:	ca8d                	beqz	a3,800007a8 <_ZN4EPOS1S1U4Heap5allocEj+0x84>
80000778:	c654                	sw	a3,12(a2)
8000077a:	4798                	lw	a4,8(a5)
8000077c:	c698                	sw	a4,8(a3)
8000077e:	4118                	lw	a4,0(a0)
80000780:	177d                	addi	a4,a4,-1
80000782:	c118                	sw	a4,0(a0)
80000784:	a0a9                	j	800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80000786:	00052223          	sw	zero,4(a0)
8000078a:	00052423          	sw	zero,8(a0)
8000078e:	00052023          	sw	zero,0(a0)
80000792:	a835                	j	800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80000794:	cf0d                	beqz	a4,800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
80000796:	4158                	lw	a4,4(a0)
80000798:	4758                	lw	a4,12(a4)
8000079a:	c158                	sw	a4,4(a0)
8000079c:	00072423          	sw	zero,8(a4)
800007a0:	4118                	lw	a4,0(a0)
800007a2:	177d                	addi	a4,a4,-1
800007a4:	c118                	sw	a4,0(a0)
800007a6:	a025                	j	800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
800007a8:	c31d                	beqz	a4,800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
800007aa:	4518                	lw	a4,8(a0)
800007ac:	4718                	lw	a4,8(a4)
800007ae:	c518                	sw	a4,8(a0)
800007b0:	00072623          	sw	zero,12(a4)
800007b4:	4118                	lw	a4,0(a0)
800007b6:	177d                	addi	a4,a4,-1
800007b8:	c118                	sw	a4,0(a0)
800007ba:	a811                	j	800007ce <_ZN4EPOS1S1U4Heap5allocEj+0xaa>
800007bc:	4501                	li	a0,0
800007be:	8082                	ret
800007c0:	8f0d                	sub	a4,a4,a1
800007c2:	c3d8                	sw	a4,4(a5)
800007c4:	4558                	lw	a4,12(a0)
800007c6:	8f0d                	sub	a4,a4,a1
800007c8:	c558                	sw	a4,12(a0)
800007ca:	43d8                	lw	a4,4(a5)
800007cc:	df51                	beqz	a4,80000768 <_ZN4EPOS1S1U4Heap5allocEj+0x44>
800007ce:	4398                	lw	a4,0(a5)
800007d0:	43dc                	lw	a5,4(a5)
800007d2:	97ba                	add	a5,a5,a4
800007d4:	00478513          	addi	a0,a5,4
800007d8:	c38c                	sw	a1,0(a5)
800007da:	8082                	ret

800007dc <_ZN4EPOS1S6ThreadC1IJiEEERKNS1_13ConfigurationEPFiDpT_ES7_>:
800007dc:	7179                	addi	sp,sp,-48
800007de:	d606                	sw	ra,44(sp)
800007e0:	d422                	sw	s0,40(sp)
800007e2:	d226                	sw	s1,36(sp)
800007e4:	d04a                	sw	s2,32(sp)
800007e6:	ce4e                	sw	s3,28(sp)
800007e8:	842a                	mv	s0,a0
800007ea:	84ae                	mv	s1,a1
800007ec:	8932                	mv	s2,a2
800007ee:	89b6                	mv	s3,a3
800007f0:	419c                	lw	a5,0(a1)
800007f2:	c51c                	sw	a5,8(a0)
800007f4:	00052623          	sw	zero,12(a0)
800007f8:	00052823          	sw	zero,16(a0)
800007fc:	c948                	sw	a0,20(a0)
800007fe:	41dc                	lw	a5,4(a1)
80000800:	cd1c                	sw	a5,24(a0)
80000802:	00052e23          	sw	zero,28(a0)
80000806:	02052023          	sw	zero,32(a0)
8000080a:	458c                	lw	a1,8(a1)
8000080c:	00001097          	auipc	ra,0x1
80000810:	926080e7          	jalr	-1754(ra) # 80001132 <_ZN4EPOS1S6Thread20constructor_prologueEj>
80000814:	401c                	lw	a5,0(s0)
80000816:	4498                	lw	a4,8(s1)
80000818:	97ba                	add	a5,a5,a4
8000081a:	f8c78713          	addi	a4,a5,-116
8000081e:	800016b7          	lui	a3,0x80001
80000822:	f1a68693          	addi	a3,a3,-230 # 80000f1a <__boot_stack__+0xf8000f1b>
80000826:	f8d7a623          	sw	a3,-116(a5)
8000082a:	ff27ae23          	sw	s2,-4(a5)
8000082e:	ff37a223          	sw	s3,-28(a5)
80000832:	c058                	sw	a4,4(s0)
80000834:	c64a                	sw	s2,12(sp)
80000836:	4490                	lw	a2,8(s1)
80000838:	006c                	addi	a1,sp,12
8000083a:	8522                	mv	a0,s0
8000083c:	00001097          	auipc	ra,0x1
80000840:	fc6080e7          	jalr	-58(ra) # 80001802 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80000844:	50b2                	lw	ra,44(sp)
80000846:	5422                	lw	s0,40(sp)
80000848:	5492                	lw	s1,36(sp)
8000084a:	5902                	lw	s2,32(sp)
8000084c:	49f2                	lw	s3,28(sp)
8000084e:	6145                	addi	sp,sp,48
80000850:	8082                	ret

80000852 <_GLOBAL__sub_I__ZN4EPOS1S11Application8_preheapE>:
80000852:	800057b7          	lui	a5,0x80005
80000856:	02478793          	addi	a5,a5,36 # 80005024 <__boot_stack__+0xf8005025>
8000085a:	4729                	li	a4,10
8000085c:	c398                	sw	a4,0(a5)
8000085e:	00078223          	sb	zero,4(a5)
80000862:	800057b7          	lui	a5,0x80005
80000866:	01c78793          	addi	a5,a5,28 # 8000501c <__boot_stack__+0xf800501d>
8000086a:	c398                	sw	a4,0(a5)
8000086c:	00078223          	sb	zero,4(a5)
80000870:	8082                	ret

80000872 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>:
80000872:	455c                	lw	a5,12(a0)
80000874:	41d8                	lw	a4,4(a1)
80000876:	97ba                	add	a5,a5,a4
80000878:	c55c                	sw	a5,12(a0)
8000087a:	0006a023          	sw	zero,0(a3)
8000087e:	00062023          	sw	zero,0(a2)
80000882:	0005a303          	lw	t1,0(a1)
80000886:	0045a883          	lw	a7,4(a1)
8000088a:	989a                	add	a7,a7,t1
8000088c:	415c                	lw	a5,4(a0)
8000088e:	c3cd                	beqz	a5,80000930 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xbe>
80000890:	873e                	mv	a4,a5
80000892:	00072803          	lw	a6,0(a4)
80000896:	01088463          	beq	a7,a6,8000089e <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
8000089a:	4758                	lw	a4,12(a4)
8000089c:	fb7d                	bnez	a4,80000892 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x20>
8000089e:	0007a803          	lw	a6,0(a5)
800008a2:	0047a883          	lw	a7,4(a5)
800008a6:	9846                	add	a6,a6,a7
800008a8:	09030663          	beq	t1,a6,80000934 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc2>
800008ac:	47dc                	lw	a5,12(a5)
800008ae:	fbe5                	bnez	a5,8000089e <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
800008b0:	411c                	lw	a5,0(a0)
800008b2:	cf81                	beqz	a5,800008ca <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x58>
800008b4:	451c                	lw	a5,8(a0)
800008b6:	c7cc                	sw	a1,12(a5)
800008b8:	451c                	lw	a5,8(a0)
800008ba:	c59c                	sw	a5,8(a1)
800008bc:	0005a623          	sw	zero,12(a1)
800008c0:	c50c                	sw	a1,8(a0)
800008c2:	411c                	lw	a5,0(a0)
800008c4:	0785                	addi	a5,a5,1
800008c6:	c11c                	sw	a5,0(a0)
800008c8:	a811                	j	800008dc <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x6a>
800008ca:	0005a423          	sw	zero,8(a1)
800008ce:	0005a623          	sw	zero,12(a1)
800008d2:	c14c                	sw	a1,4(a0)
800008d4:	c50c                	sw	a1,8(a0)
800008d6:	411c                	lw	a5,0(a0)
800008d8:	0785                	addi	a5,a5,1
800008da:	c11c                	sw	a5,0(a0)
800008dc:	4781                	li	a5,0
800008de:	ef21                	bnez	a4,80000936 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc4>
800008e0:	8082                	ret
800008e2:	00052223          	sw	zero,4(a0)
800008e6:	00052423          	sw	zero,8(a0)
800008ea:	00052023          	sw	zero,0(a0)
800008ee:	a059                	j	80000974 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800008f0:	08080263          	beqz	a6,80000974 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800008f4:	00452803          	lw	a6,4(a0)
800008f8:	00c82803          	lw	a6,12(a6)
800008fc:	01052223          	sw	a6,4(a0)
80000900:	00082423          	sw	zero,8(a6)
80000904:	00052803          	lw	a6,0(a0)
80000908:	187d                	addi	a6,a6,-1
8000090a:	01052023          	sw	a6,0(a0)
8000090e:	a09d                	j	80000974 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
80000910:	06080263          	beqz	a6,80000974 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
80000914:	00852803          	lw	a6,8(a0)
80000918:	00882803          	lw	a6,8(a6)
8000091c:	01052423          	sw	a6,8(a0)
80000920:	00082623          	sw	zero,12(a6)
80000924:	00052803          	lw	a6,0(a0)
80000928:	187d                	addi	a6,a6,-1
8000092a:	01052023          	sw	a6,0(a0)
8000092e:	a099                	j	80000974 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
80000930:	873e                	mv	a4,a5
80000932:	bfbd                	j	800008b0 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x3e>
80000934:	c331                	beqz	a4,80000978 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x106>
80000936:	0045a803          	lw	a6,4(a1)
8000093a:	00472883          	lw	a7,4(a4)
8000093e:	9846                	add	a6,a6,a7
80000940:	0105a223          	sw	a6,4(a1)
80000944:	00052803          	lw	a6,0(a0)
80000948:	4885                	li	a7,1
8000094a:	f9180ce3          	beq	a6,a7,800008e2 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x70>
8000094e:	00872303          	lw	t1,8(a4)
80000952:	f8030fe3          	beqz	t1,800008f0 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x7e>
80000956:	00c72883          	lw	a7,12(a4)
8000095a:	fa088be3          	beqz	a7,80000910 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x9e>
8000095e:	01132623          	sw	a7,12(t1)
80000962:	00872803          	lw	a6,8(a4)
80000966:	0108a423          	sw	a6,8(a7)
8000096a:	00052803          	lw	a6,0(a0)
8000096e:	187d                	addi	a6,a6,-1
80000970:	01052023          	sw	a6,0(a0)
80000974:	c218                	sw	a4,0(a2)
80000976:	c799                	beqz	a5,80000984 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x112>
80000978:	43d8                	lw	a4,4(a5)
8000097a:	41d0                	lw	a2,4(a1)
8000097c:	9732                	add	a4,a4,a2
8000097e:	c3d8                	sw	a4,4(a5)
80000980:	c28c                	sw	a1,0(a3)
80000982:	8082                	ret
80000984:	8082                	ret

80000986 <_ZN4EPOS1S16Init_ApplicationC1Ev>:
80000986:	f14027f3          	csrr	a5,mhartid
8000098a:	80005737          	lui	a4,0x80005
8000098e:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000992:	00269713          	slli	a4,a3,0x2
80000996:	80005637          	lui	a2,0x80005
8000099a:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
8000099e:	9732                	add	a4,a4,a2
800009a0:	1007262f          	lr.w	a2,(a4)
800009a4:	0605                	addi	a2,a2,1
800009a6:	18c722af          	sc.w	t0,a2,(a4)
800009aa:	fe029be3          	bnez	t0,800009a0 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a>
800009ae:	8b8d                	andi	a5,a5,3
800009b0:	cb91                	beqz	a5,800009c4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x3e>
800009b2:	80005737          	lui	a4,0x80005
800009b6:	068a                	slli	a3,a3,0x2
800009b8:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
800009bc:	9736                	add	a4,a4,a3
800009be:	431c                	lw	a5,0(a4)
800009c0:	fffd                	bnez	a5,800009be <_ZN4EPOS1S16Init_ApplicationC1Ev+0x38>
800009c2:	a825                	j	800009fa <_ZN4EPOS1S16Init_ApplicationC1Ev+0x74>
800009c4:	800057b7          	lui	a5,0x80005
800009c8:	00269713          	slli	a4,a3,0x2
800009cc:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
800009d0:	973e                	add	a4,a4,a5
800009d2:	460d                	li	a2,3
800009d4:	431c                	lw	a5,0(a4)
800009d6:	fef65fe3          	bge	a2,a5,800009d4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x4e>
800009da:	80005737          	lui	a4,0x80005
800009de:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
800009e2:	0017b793          	seqz	a5,a5
800009e6:	00f72223          	sw	a5,4(a4)
800009ea:	800057b7          	lui	a5,0x80005
800009ee:	068a                	slli	a3,a3,0x2
800009f0:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
800009f4:	96be                	add	a3,a3,a5
800009f6:	0006a023          	sw	zero,0(a3)
800009fa:	f14027f3          	csrr	a5,mhartid
800009fe:	8b8d                	andi	a5,a5,3
80000a00:	12079663          	bnez	a5,80000b2c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
80000a04:	800067b7          	lui	a5,0x80006
80000a08:	1347a783          	lw	a5,308(a5) # 80006134 <__boot_stack__+0xf8006135>
80000a0c:	12078063          	beqz	a5,80000b2c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
80000a10:	43d4                	lw	a3,4(a5)
80000a12:	10068d63          	beqz	a3,80000b2c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
80000a16:	7179                	addi	sp,sp,-48
80000a18:	d606                	sw	ra,44(sp)
80000a1a:	d422                	sw	s0,40(sp)
80000a1c:	d226                	sw	s1,36(sp)
80000a1e:	d04a                	sw	s2,32(sp)
80000a20:	ce4e                	sw	s3,28(sp)
80000a22:	cc52                	sw	s4,24(sp)
80000a24:	80006437          	lui	s0,0x80006
80000a28:	13040413          	addi	s0,s0,304 # 80006130 <__boot_stack__+0xf8006131>
80000a2c:	80005937          	lui	s2,0x80005
80000a30:	800054b7          	lui	s1,0x80005
80000a34:	03448493          	addi	s1,s1,52 # 80005034 <__boot_stack__+0xf8005035>
80000a38:	80003a37          	lui	s4,0x80003
80000a3c:	800039b7          	lui	s3,0x80003
80000a40:	a84d                	j	80000af2 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x16c>
80000a42:	4018                	lw	a4,0(s0)
80000a44:	4605                	li	a2,1
80000a46:	00c70c63          	beq	a4,a2,80000a5e <_ZN4EPOS1S16Init_ApplicationC1Ev+0xd8>
80000a4a:	478c                	lw	a1,8(a5)
80000a4c:	c99d                	beqz	a1,80000a82 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xfc>
80000a4e:	47d0                	lw	a2,12(a5)
80000a50:	c639                	beqz	a2,80000a9e <_ZN4EPOS1S16Init_ApplicationC1Ev+0x118>
80000a52:	c5d0                	sw	a2,12(a1)
80000a54:	478c                	lw	a1,8(a5)
80000a56:	c60c                	sw	a1,8(a2)
80000a58:	177d                	addi	a4,a4,-1
80000a5a:	c018                	sw	a4,0(s0)
80000a5c:	a041                	j	80000adc <_ZN4EPOS1S16Init_ApplicationC1Ev+0x156>
80000a5e:	00042223          	sw	zero,4(s0)
80000a62:	00042423          	sw	zero,8(s0)
80000a66:	00042023          	sw	zero,0(s0)
80000a6a:	438c                	lw	a1,0(a5)
80000a6c:	43dc                	lw	a5,4(a5)
80000a6e:	95be                	add	a1,a1,a5
80000a70:	e9b5                	bnez	a1,80000ae4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x15e>
80000a72:	50b2                	lw	ra,44(sp)
80000a74:	5422                	lw	s0,40(sp)
80000a76:	5492                	lw	s1,36(sp)
80000a78:	5902                	lw	s2,32(sp)
80000a7a:	49f2                	lw	s3,28(sp)
80000a7c:	4a62                	lw	s4,24(sp)
80000a7e:	6145                	addi	sp,sp,48
80000a80:	8082                	ret
80000a82:	cf29                	beqz	a4,80000adc <_ZN4EPOS1S16Init_ApplicationC1Ev+0x156>
80000a84:	4050                	lw	a2,4(s0)
80000a86:	4650                	lw	a2,12(a2)
80000a88:	c050                	sw	a2,4(s0)
80000a8a:	00062423          	sw	zero,8(a2)
80000a8e:	177d                	addi	a4,a4,-1
80000a90:	c018                	sw	a4,0(s0)
80000a92:	438c                	lw	a1,0(a5)
80000a94:	43dc                	lw	a5,4(a5)
80000a96:	95be                	add	a1,a1,a5
80000a98:	e5b1                	bnez	a1,80000ae4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x15e>
80000a9a:	405c                	lw	a5,4(s0)
80000a9c:	a889                	j	80000aee <_ZN4EPOS1S16Init_ApplicationC1Ev+0x168>
80000a9e:	cf1d                	beqz	a4,80000adc <_ZN4EPOS1S16Init_ApplicationC1Ev+0x156>
80000aa0:	4410                	lw	a2,8(s0)
80000aa2:	4610                	lw	a2,8(a2)
80000aa4:	c410                	sw	a2,8(s0)
80000aa6:	00062623          	sw	zero,12(a2)
80000aaa:	177d                	addi	a4,a4,-1
80000aac:	c018                	sw	a4,0(s0)
80000aae:	a03d                	j	80000adc <_ZN4EPOS1S16Init_ApplicationC1Ev+0x156>
80000ab0:	c18c                	sw	a1,0(a1)
80000ab2:	c1d4                	sw	a3,4(a1)
80000ab4:	0005a423          	sw	zero,8(a1)
80000ab8:	0005a623          	sw	zero,12(a1)
80000abc:	0074                	addi	a3,sp,12
80000abe:	0030                	addi	a2,sp,8
80000ac0:	00000097          	auipc	ra,0x0
80000ac4:	db2080e7          	jalr	-590(ra) # 80000872 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>
80000ac8:	a00d                	j	80000aea <_ZN4EPOS1S16Init_ApplicationC1Ev+0x164>
80000aca:	04492503          	lw	a0,68(s2) # 80005044 <__boot_stack__+0xf8005045>
80000ace:	8f15                	sub	a4,a4,a3
80000ad0:	c3d8                	sw	a4,4(a5)
80000ad2:	4458                	lw	a4,12(s0)
80000ad4:	8f15                	sub	a4,a4,a3
80000ad6:	c458                	sw	a4,12(s0)
80000ad8:	43d8                	lw	a4,4(a5)
80000ada:	d725                	beqz	a4,80000a42 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xbc>
80000adc:	438c                	lw	a1,0(a5)
80000ade:	43dc                	lw	a5,4(a5)
80000ae0:	95be                	add	a1,a1,a5
80000ae2:	c581                	beqz	a1,80000aea <_ZN4EPOS1S16Init_ApplicationC1Ev+0x164>
80000ae4:	47bd                	li	a5,15
80000ae6:	fcd7e5e3          	bltu	a5,a3,80000ab0 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x12a>
80000aea:	405c                	lw	a5,4(s0)
80000aec:	d3d9                	beqz	a5,80000a72 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xec>
80000aee:	43d4                	lw	a3,4(a5)
80000af0:	d2c9                	beqz	a3,80000a72 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xec>
80000af2:	405c                	lw	a5,4(s0)
80000af4:	cb91                	beqz	a5,80000b08 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x182>
80000af6:	00468613          	addi	a2,a3,4
80000afa:	43d8                	lw	a4,4(a5)
80000afc:	fcc777e3          	bgeu	a4,a2,80000aca <_ZN4EPOS1S16Init_ApplicationC1Ev+0x144>
80000b00:	fcd705e3          	beq	a4,a3,80000aca <_ZN4EPOS1S16Init_ApplicationC1Ev+0x144>
80000b04:	47dc                	lw	a5,12(a5)
80000b06:	fbf5                	bnez	a5,80000afa <_ZN4EPOS1S16Init_ApplicationC1Ev+0x174>
80000b08:	4785                	li	a5,1
80000b0a:	00f48223          	sb	a5,4(s1)
80000b0e:	7a0a0513          	addi	a0,s4,1952 # 800037a0 <__boot_stack__+0xf80037a1>
80000b12:	00000097          	auipc	ra,0x0
80000b16:	41c080e7          	jalr	1052(ra) # 80000f2e <_print>
80000b1a:	6e898513          	addi	a0,s3,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80000b1e:	00000097          	auipc	ra,0x0
80000b22:	410080e7          	jalr	1040(ra) # 80000f2e <_print>
80000b26:	47a9                	li	a5,10
80000b28:	c09c                	sw	a5,0(s1)
80000b2a:	b7c1                	j	80000aea <_ZN4EPOS1S16Init_ApplicationC1Ev+0x164>
80000b2c:	8082                	ret

80000b2e <_GLOBAL__sub_I__end>:
80000b2e:	1141                	addi	sp,sp,-16
80000b30:	c606                	sw	ra,12(sp)
80000b32:	80005537          	lui	a0,0x80005
80000b36:	02c50513          	addi	a0,a0,44 # 8000502c <__boot_stack__+0xf800502d>
80000b3a:	00000097          	auipc	ra,0x0
80000b3e:	e4c080e7          	jalr	-436(ra) # 80000986 <_ZN4EPOS1S16Init_ApplicationC1Ev>
80000b42:	40b2                	lw	ra,12(sp)
80000b44:	0141                	addi	sp,sp,16
80000b46:	8082                	ret

80000b48 <_ZN4EPOS1S11Init_SystemC1Ev>:
80000b48:	1101                	addi	sp,sp,-32
80000b4a:	ce06                	sw	ra,28(sp)
80000b4c:	cc22                	sw	s0,24(sp)
80000b4e:	f14027f3          	csrr	a5,mhartid
80000b52:	80005737          	lui	a4,0x80005
80000b56:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000b5a:	00269713          	slli	a4,a3,0x2
80000b5e:	80005637          	lui	a2,0x80005
80000b62:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80000b66:	9732                	add	a4,a4,a2
80000b68:	1007262f          	lr.w	a2,(a4)
80000b6c:	0605                	addi	a2,a2,1
80000b6e:	18c722af          	sc.w	t0,a2,(a4)
80000b72:	fe029be3          	bnez	t0,80000b68 <_ZN4EPOS1S11Init_SystemC1Ev+0x20>
80000b76:	8b8d                	andi	a5,a5,3
80000b78:	cfdd                	beqz	a5,80000c36 <_ZN4EPOS1S11Init_SystemC1Ev+0xee>
80000b7a:	80005737          	lui	a4,0x80005
80000b7e:	068a                	slli	a3,a3,0x2
80000b80:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80000b84:	9736                	add	a4,a4,a3
80000b86:	431c                	lw	a5,0(a4)
80000b88:	fffd                	bnez	a5,80000b86 <_ZN4EPOS1S11Init_SystemC1Ev+0x3e>
80000b8a:	f14027f3          	csrr	a5,mhartid
80000b8e:	8b8d                	andi	a5,a5,3
80000b90:	eff9                	bnez	a5,80000c6e <_ZN4EPOS1S11Init_SystemC1Ev+0x126>
80000b92:	00002097          	auipc	ra,0x2
80000b96:	be8080e7          	jalr	-1048(ra) # 8000277a <_ZN4EPOS1S3CPU4initEv>
80000b9a:	800067b7          	lui	a5,0x80006
80000b9e:	1347a783          	lw	a5,308(a5) # 80006134 <__boot_stack__+0xf8006135>
80000ba2:	cf81                	beqz	a5,80000bba <_ZN4EPOS1S11Init_SystemC1Ev+0x72>
80000ba4:	000446b7          	lui	a3,0x44
80000ba8:	00368613          	addi	a2,a3,3 # 44003 <_vector_table-0x7ffbbffd>
80000bac:	43d8                	lw	a4,4(a5)
80000bae:	20e66d63          	bltu	a2,a4,80000dc8 <_ZN4EPOS1S11Init_SystemC1Ev+0x280>
80000bb2:	20d70b63          	beq	a4,a3,80000dc8 <_ZN4EPOS1S11Init_SystemC1Ev+0x280>
80000bb6:	47dc                	lw	a5,12(a5)
80000bb8:	fbf5                	bnez	a5,80000bac <_ZN4EPOS1S11Init_SystemC1Ev+0x64>
80000bba:	80005437          	lui	s0,0x80005
80000bbe:	03440413          	addi	s0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
80000bc2:	4785                	li	a5,1
80000bc4:	00f40223          	sb	a5,4(s0)
80000bc8:	80003537          	lui	a0,0x80003
80000bcc:	7a050513          	addi	a0,a0,1952 # 800037a0 <__boot_stack__+0xf80037a1>
80000bd0:	00000097          	auipc	ra,0x0
80000bd4:	35e080e7          	jalr	862(ra) # 80000f2e <_print>
80000bd8:	80003537          	lui	a0,0x80003
80000bdc:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80000be0:	00000097          	auipc	ra,0x0
80000be4:	34e080e7          	jalr	846(ra) # 80000f2e <_print>
80000be8:	47a9                	li	a5,10
80000bea:	c01c                	sw	a5,0(s0)
80000bec:	800057b7          	lui	a5,0x80005
80000bf0:	07878793          	addi	a5,a5,120 # 80005078 <__boot_stack__+0xf8005079>
80000bf4:	00078023          	sb	zero,0(a5)
80000bf8:	000780a3          	sb	zero,1(a5)
80000bfc:	00078123          	sb	zero,2(a5)
80000c00:	000781a3          	sb	zero,3(a5)
80000c04:	00078223          	sb	zero,4(a5)
80000c08:	000782a3          	sb	zero,5(a5)
80000c0c:	00078323          	sb	zero,6(a5)
80000c10:	000783a3          	sb	zero,7(a5)
80000c14:	00078423          	sb	zero,8(a5)
80000c18:	000784a3          	sb	zero,9(a5)
80000c1c:	00078523          	sb	zero,10(a5)
80000c20:	000785a3          	sb	zero,11(a5)
80000c24:	00078623          	sb	zero,12(a5)
80000c28:	000786a3          	sb	zero,13(a5)
80000c2c:	00078723          	sb	zero,14(a5)
80000c30:	000787a3          	sb	zero,15(a5)
80000c34:	a40d                	j	80000e56 <_ZN4EPOS1S11Init_SystemC1Ev+0x30e>
80000c36:	800057b7          	lui	a5,0x80005
80000c3a:	00269713          	slli	a4,a3,0x2
80000c3e:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000c42:	973e                	add	a4,a4,a5
80000c44:	460d                	li	a2,3
80000c46:	431c                	lw	a5,0(a4)
80000c48:	fef65fe3          	bge	a2,a5,80000c46 <_ZN4EPOS1S11Init_SystemC1Ev+0xfe>
80000c4c:	80005737          	lui	a4,0x80005
80000c50:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000c54:	0017b793          	seqz	a5,a5
80000c58:	00f72223          	sw	a5,4(a4)
80000c5c:	800057b7          	lui	a5,0x80005
80000c60:	068a                	slli	a3,a3,0x2
80000c62:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000c66:	96be                	add	a3,a3,a5
80000c68:	0006a023          	sw	zero,0(a3)
80000c6c:	bf39                	j	80000b8a <_ZN4EPOS1S11Init_SystemC1Ev+0x42>
80000c6e:	f14027f3          	csrr	a5,mhartid
80000c72:	80005737          	lui	a4,0x80005
80000c76:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000c7a:	00269713          	slli	a4,a3,0x2
80000c7e:	80005637          	lui	a2,0x80005
80000c82:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80000c86:	9732                	add	a4,a4,a2
80000c88:	1007262f          	lr.w	a2,(a4)
80000c8c:	0605                	addi	a2,a2,1
80000c8e:	18c722af          	sc.w	t0,a2,(a4)
80000c92:	fe029be3          	bnez	t0,80000c88 <_ZN4EPOS1S11Init_SystemC1Ev+0x140>
80000c96:	8b8d                	andi	a5,a5,3
80000c98:	c795                	beqz	a5,80000cc4 <_ZN4EPOS1S11Init_SystemC1Ev+0x17c>
80000c9a:	80005737          	lui	a4,0x80005
80000c9e:	068a                	slli	a3,a3,0x2
80000ca0:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80000ca4:	9736                	add	a4,a4,a3
80000ca6:	431c                	lw	a5,0(a4)
80000ca8:	fffd                	bnez	a5,80000ca6 <_ZN4EPOS1S11Init_SystemC1Ev+0x15e>
80000caa:	00002097          	auipc	ra,0x2
80000cae:	ad0080e7          	jalr	-1328(ra) # 8000277a <_ZN4EPOS1S3CPU4initEv>
80000cb2:	00002097          	auipc	ra,0x2
80000cb6:	df0080e7          	jalr	-528(ra) # 80002aa2 <_ZN4EPOS1S5Timer4initEv>
80000cba:	00002097          	auipc	ra,0x2
80000cbe:	e44080e7          	jalr	-444(ra) # 80002afe <_ZN4EPOS1S6Thread4initEv>
80000cc2:	a8fd                	j	80000dc0 <_ZN4EPOS1S11Init_SystemC1Ev+0x278>
80000cc4:	800057b7          	lui	a5,0x80005
80000cc8:	00269713          	slli	a4,a3,0x2
80000ccc:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000cd0:	973e                	add	a4,a4,a5
80000cd2:	460d                	li	a2,3
80000cd4:	431c                	lw	a5,0(a4)
80000cd6:	fef65fe3          	bge	a2,a5,80000cd4 <_ZN4EPOS1S11Init_SystemC1Ev+0x18c>
80000cda:	80005737          	lui	a4,0x80005
80000cde:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000ce2:	0017b793          	seqz	a5,a5
80000ce6:	00f72223          	sw	a5,4(a4)
80000cea:	800057b7          	lui	a5,0x80005
80000cee:	068a                	slli	a3,a3,0x2
80000cf0:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000cf4:	96be                	add	a3,a3,a5
80000cf6:	0006a023          	sw	zero,0(a3)
80000cfa:	bf45                	j	80000caa <_ZN4EPOS1S11Init_SystemC1Ev+0x162>
80000cfc:	80006737          	lui	a4,0x80006
80000d00:	13072703          	lw	a4,304(a4) # 80006130 <__boot_stack__+0xf8006131>
80000d04:	4685                	li	a3,1
80000d06:	00d70f63          	beq	a4,a3,80000d24 <_ZN4EPOS1S11Init_SystemC1Ev+0x1dc>
80000d0a:	4790                	lw	a2,8(a5)
80000d0c:	c61d                	beqz	a2,80000d3a <_ZN4EPOS1S11Init_SystemC1Ev+0x1f2>
80000d0e:	47d4                	lw	a3,12(a5)
80000d10:	c2b1                	beqz	a3,80000d54 <_ZN4EPOS1S11Init_SystemC1Ev+0x20c>
80000d12:	c654                	sw	a3,12(a2)
80000d14:	4790                	lw	a2,8(a5)
80000d16:	c690                	sw	a2,8(a3)
80000d18:	177d                	addi	a4,a4,-1
80000d1a:	800066b7          	lui	a3,0x80006
80000d1e:	12e6a823          	sw	a4,304(a3) # 80006130 <__boot_stack__+0xf8006131>
80000d22:	a0c1                	j	80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d24:	80006737          	lui	a4,0x80006
80000d28:	13070713          	addi	a4,a4,304 # 80006130 <__boot_stack__+0xf8006131>
80000d2c:	00072223          	sw	zero,4(a4)
80000d30:	00072423          	sw	zero,8(a4)
80000d34:	00072023          	sw	zero,0(a4)
80000d38:	a06d                	j	80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d3a:	c745                	beqz	a4,80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d3c:	800066b7          	lui	a3,0x80006
80000d40:	13068693          	addi	a3,a3,304 # 80006130 <__boot_stack__+0xf8006131>
80000d44:	42d0                	lw	a2,4(a3)
80000d46:	4650                	lw	a2,12(a2)
80000d48:	c2d0                	sw	a2,4(a3)
80000d4a:	00062423          	sw	zero,8(a2)
80000d4e:	177d                	addi	a4,a4,-1
80000d50:	c298                	sw	a4,0(a3)
80000d52:	a841                	j	80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d54:	c759                	beqz	a4,80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d56:	800066b7          	lui	a3,0x80006
80000d5a:	13068693          	addi	a3,a3,304 # 80006130 <__boot_stack__+0xf8006131>
80000d5e:	4690                	lw	a2,8(a3)
80000d60:	4610                	lw	a2,8(a2)
80000d62:	c690                	sw	a2,8(a3)
80000d64:	00062623          	sw	zero,12(a2)
80000d68:	177d                	addi	a4,a4,-1
80000d6a:	c298                	sw	a4,0(a3)
80000d6c:	a89d                	j	80000de2 <_ZN4EPOS1S11Init_SystemC1Ev+0x29a>
80000d6e:	800057b7          	lui	a5,0x80005
80000d72:	00269713          	slli	a4,a3,0x2
80000d76:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000d7a:	973e                	add	a4,a4,a5
80000d7c:	460d                	li	a2,3
80000d7e:	431c                	lw	a5,0(a4)
80000d80:	fef65fe3          	bge	a2,a5,80000d7e <_ZN4EPOS1S11Init_SystemC1Ev+0x236>
80000d84:	80005737          	lui	a4,0x80005
80000d88:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000d8c:	0017b793          	seqz	a5,a5
80000d90:	00f72223          	sw	a5,4(a4)
80000d94:	800057b7          	lui	a5,0x80005
80000d98:	068a                	slli	a3,a3,0x2
80000d9a:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80000d9e:	96be                	add	a3,a3,a5
80000da0:	0006a023          	sw	zero,0(a3)
80000da4:	00002097          	auipc	ra,0x2
80000da8:	d40080e7          	jalr	-704(ra) # 80002ae4 <_ZN4EPOS1S6System4initEv>
80000dac:	0200c7b7          	lui	a5,0x200c
80000db0:	ffc7a703          	lw	a4,-4(a5) # 200bffc <_vector_table-0x7dff4004>
80000db4:	ff87a703          	lw	a4,-8(a5)
80000db8:	800057b7          	lui	a5,0x80005
80000dbc:	04e7a823          	sw	a4,80(a5) # 80005050 <__boot_stack__+0xf8005051>
80000dc0:	40f2                	lw	ra,28(sp)
80000dc2:	4462                	lw	s0,24(sp)
80000dc4:	6105                	addi	sp,sp,32
80000dc6:	8082                	ret
80000dc8:	fffbc637          	lui	a2,0xfffbc
80000dcc:	9732                	add	a4,a4,a2
80000dce:	c3d8                	sw	a4,4(a5)
80000dd0:	80006737          	lui	a4,0x80006
80000dd4:	13070713          	addi	a4,a4,304 # 80006130 <__boot_stack__+0xf8006131>
80000dd8:	4754                	lw	a3,12(a4)
80000dda:	96b2                	add	a3,a3,a2
80000ddc:	c754                	sw	a3,12(a4)
80000dde:	43d8                	lw	a4,4(a5)
80000de0:	df11                	beqz	a4,80000cfc <_ZN4EPOS1S11Init_SystemC1Ev+0x1b4>
80000de2:	438c                	lw	a1,0(a5)
80000de4:	43dc                	lw	a5,4(a5)
80000de6:	95be                	add	a1,a1,a5
80000de8:	800057b7          	lui	a5,0x80005
80000dec:	07878793          	addi	a5,a5,120 # 80005078 <__boot_stack__+0xf8005079>
80000df0:	00078023          	sb	zero,0(a5)
80000df4:	000780a3          	sb	zero,1(a5)
80000df8:	00078123          	sb	zero,2(a5)
80000dfc:	000781a3          	sb	zero,3(a5)
80000e00:	00078223          	sb	zero,4(a5)
80000e04:	000782a3          	sb	zero,5(a5)
80000e08:	00078323          	sb	zero,6(a5)
80000e0c:	000783a3          	sb	zero,7(a5)
80000e10:	00078423          	sb	zero,8(a5)
80000e14:	000784a3          	sb	zero,9(a5)
80000e18:	00078523          	sb	zero,10(a5)
80000e1c:	000785a3          	sb	zero,11(a5)
80000e20:	00078623          	sb	zero,12(a5)
80000e24:	000786a3          	sb	zero,13(a5)
80000e28:	00078723          	sb	zero,14(a5)
80000e2c:	000787a3          	sb	zero,15(a5)
80000e30:	c19d                	beqz	a1,80000e56 <_ZN4EPOS1S11Init_SystemC1Ev+0x30e>
80000e32:	c18c                	sw	a1,0(a1)
80000e34:	000447b7          	lui	a5,0x44
80000e38:	c1dc                	sw	a5,4(a1)
80000e3a:	0005a423          	sw	zero,8(a1)
80000e3e:	0005a623          	sw	zero,12(a1)
80000e42:	0074                	addi	a3,sp,12
80000e44:	0030                	addi	a2,sp,8
80000e46:	80005537          	lui	a0,0x80005
80000e4a:	07850513          	addi	a0,a0,120 # 80005078 <__boot_stack__+0xf8005079>
80000e4e:	00000097          	auipc	ra,0x0
80000e52:	a24080e7          	jalr	-1500(ra) # 80000872 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>
80000e56:	80005737          	lui	a4,0x80005
80000e5a:	800057b7          	lui	a5,0x80005
80000e5e:	07878793          	addi	a5,a5,120 # 80005078 <__boot_stack__+0xf8005079>
80000e62:	04f72223          	sw	a5,68(a4) # 80005044 <__boot_stack__+0xf8005045>
80000e66:	00002097          	auipc	ra,0x2
80000e6a:	c2a080e7          	jalr	-982(ra) # 80002a90 <_ZN4EPOS1S7Machine4initEv>
80000e6e:	f14027f3          	csrr	a5,mhartid
80000e72:	80005737          	lui	a4,0x80005
80000e76:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80000e7a:	00269713          	slli	a4,a3,0x2
80000e7e:	80005637          	lui	a2,0x80005
80000e82:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80000e86:	9732                	add	a4,a4,a2
80000e88:	1007262f          	lr.w	a2,(a4)
80000e8c:	0605                	addi	a2,a2,1
80000e8e:	18c722af          	sc.w	t0,a2,(a4)
80000e92:	fe029be3          	bnez	t0,80000e88 <_ZN4EPOS1S11Init_SystemC1Ev+0x340>
80000e96:	8b8d                	andi	a5,a5,3
80000e98:	ec078be3          	beqz	a5,80000d6e <_ZN4EPOS1S11Init_SystemC1Ev+0x226>
80000e9c:	80005737          	lui	a4,0x80005
80000ea0:	068a                	slli	a3,a3,0x2
80000ea2:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80000ea6:	9736                	add	a4,a4,a3
80000ea8:	431c                	lw	a5,0(a4)
80000eaa:	fffd                	bnez	a5,80000ea8 <_ZN4EPOS1S11Init_SystemC1Ev+0x360>
80000eac:	bde5                	j	80000da4 <_ZN4EPOS1S11Init_SystemC1Ev+0x25c>

80000eae <_GLOBAL__sub_I__ZN4EPOS1S11init_systemE>:
80000eae:	1141                	addi	sp,sp,-16
80000eb0:	c606                	sw	ra,12(sp)
80000eb2:	80005537          	lui	a0,0x80005
80000eb6:	03050513          	addi	a0,a0,48 # 80005030 <__boot_stack__+0xf8005031>
80000eba:	00000097          	auipc	ra,0x0
80000ebe:	c8e080e7          	jalr	-882(ra) # 80000b48 <_ZN4EPOS1S11Init_SystemC1Ev>
80000ec2:	40b2                	lw	ra,12(sp)
80000ec4:	0141                	addi	sp,sp,16
80000ec6:	8082                	ret

80000ec8 <_GLOBAL__sub_I__ZN4EPOS1S7__entryE>:
80000ec8:	1141                	addi	sp,sp,-16
80000eca:	c606                	sw	ra,12(sp)
80000ecc:	557d                	li	a0,-1
80000ece:	00002097          	auipc	ra,0x2
80000ed2:	b10080e7          	jalr	-1264(ra) # 800029de <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>
80000ed6:	800057b7          	lui	a5,0x80005
80000eda:	03c78793          	addi	a5,a5,60 # 8000503c <__boot_stack__+0xf800503d>
80000ede:	4729                	li	a4,10
80000ee0:	c398                	sw	a4,0(a5)
80000ee2:	00078223          	sb	zero,4(a5)
80000ee6:	800057b7          	lui	a5,0x80005
80000eea:	03478793          	addi	a5,a5,52 # 80005034 <__boot_stack__+0xf8005035>
80000eee:	c398                	sw	a4,0(a5)
80000ef0:	00078223          	sb	zero,4(a5)
80000ef4:	40b2                	lw	ra,12(sp)
80000ef6:	0141                	addi	sp,sp,16
80000ef8:	8082                	ret

80000efa <_panic>:
80000efa:	1141                	addi	sp,sp,-16
80000efc:	c606                	sw	ra,12(sp)
80000efe:	00002097          	auipc	ra,0x2
80000f02:	37e080e7          	jalr	894(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
80000f06:	40b2                	lw	ra,12(sp)
80000f08:	0141                	addi	sp,sp,16
80000f0a:	8082                	ret

80000f0c <_exit>:
80000f0c:	1141                	addi	sp,sp,-16
80000f0e:	c606                	sw	ra,12(sp)
80000f10:	00001097          	auipc	ra,0x1
80000f14:	e28080e7          	jalr	-472(ra) # 80001d38 <_ZN4EPOS1S6Thread4exitEi>
80000f18:	a001                	j	80000f18 <_exit+0xc>

80000f1a <__exit>:
80000f1a:	1141                	addi	sp,sp,-16
80000f1c:	c606                	sw	ra,12(sp)
80000f1e:	852a                	mv	a0,a0
80000f20:	00001097          	auipc	ra,0x1
80000f24:	e18080e7          	jalr	-488(ra) # 80001d38 <_ZN4EPOS1S6Thread4exitEi>
80000f28:	40b2                	lw	ra,12(sp)
80000f2a:	0141                	addi	sp,sp,16
80000f2c:	8082                	ret

80000f2e <_print>:
80000f2e:	00054683          	lbu	a3,0(a0)
80000f32:	cac5                	beqz	a3,80000fe2 <_print+0xb4>
80000f34:	4825                	li	a6,9
80000f36:	100007b7          	lui	a5,0x10000
80000f3a:	80005637          	lui	a2,0x80005
80000f3e:	45a9                	li	a1,10
80000f40:	4335                	li	t1,13
80000f42:	800058b7          	lui	a7,0x80005
80000f46:	04f00e13          	li	t3,79
80000f4a:	a005                	j	80000f6a <_print+0x3c>
80000f4c:	0057c703          	lbu	a4,5(a5) # 10000005 <_vector_table-0x6ffffffb>
80000f50:	02077713          	andi	a4,a4,32
80000f54:	df65                	beqz	a4,80000f4c <_print+0x1e>
80000f56:	01078023          	sb	a6,0(a5)
80000f5a:	06c62703          	lw	a4,108(a2) # 8000506c <__boot_stack__+0xf800506d>
80000f5e:	0721                	addi	a4,a4,8
80000f60:	06e62623          	sw	a4,108(a2)
80000f64:	00054683          	lbu	a3,0(a0)
80000f68:	cead                	beqz	a3,80000fe2 <_print+0xb4>
80000f6a:	0505                	addi	a0,a0,1
80000f6c:	ff0680e3          	beq	a3,a6,80000f4c <_print+0x1e>
80000f70:	02b69863          	bne	a3,a1,80000fa0 <_print+0x72>
80000f74:	0057c703          	lbu	a4,5(a5)
80000f78:	02077713          	andi	a4,a4,32
80000f7c:	df65                	beqz	a4,80000f74 <_print+0x46>
80000f7e:	00678023          	sb	t1,0(a5)
80000f82:	0057c703          	lbu	a4,5(a5)
80000f86:	02077713          	andi	a4,a4,32
80000f8a:	df65                	beqz	a4,80000f82 <_print+0x54>
80000f8c:	00b78023          	sb	a1,0(a5)
80000f90:	06062623          	sw	zero,108(a2)
80000f94:	0688a703          	lw	a4,104(a7) # 80005068 <__boot_stack__+0xf8005069>
80000f98:	0705                	addi	a4,a4,1
80000f9a:	06e8a423          	sw	a4,104(a7)
80000f9e:	b7d9                	j	80000f64 <_print+0x36>
80000fa0:	06c62703          	lw	a4,108(a2)
80000fa4:	0705                	addi	a4,a4,1
80000fa6:	06e62623          	sw	a4,108(a2)
80000faa:	0057c703          	lbu	a4,5(a5)
80000fae:	02077713          	andi	a4,a4,32
80000fb2:	df65                	beqz	a4,80000faa <_print+0x7c>
80000fb4:	00d78023          	sb	a3,0(a5)
80000fb8:	06c62703          	lw	a4,108(a2)
80000fbc:	faee54e3          	bge	t3,a4,80000f64 <_print+0x36>
80000fc0:	0057c703          	lbu	a4,5(a5)
80000fc4:	02077713          	andi	a4,a4,32
80000fc8:	df65                	beqz	a4,80000fc0 <_print+0x92>
80000fca:	00678023          	sb	t1,0(a5)
80000fce:	0057c703          	lbu	a4,5(a5)
80000fd2:	02077713          	andi	a4,a4,32
80000fd6:	df65                	beqz	a4,80000fce <_print+0xa0>
80000fd8:	00b78023          	sb	a1,0(a5)
80000fdc:	06062623          	sw	zero,108(a2)
80000fe0:	b751                	j	80000f64 <_print+0x36>
80000fe2:	8082                	ret

80000fe4 <_GLOBAL__sub_I__panic>:
80000fe4:	800057b7          	lui	a5,0x80005
80000fe8:	04878793          	addi	a5,a5,72 # 80005048 <__boot_stack__+0xf8005049>
80000fec:	0007a023          	sw	zero,0(a5)
80000ff0:	0007a223          	sw	zero,4(a5)
80000ff4:	8082                	ret

80000ff6 <_ZdlPvj>:
80000ff6:	ffc52783          	lw	a5,-4(a0)
80000ffa:	473d                	li	a4,15
80000ffc:	00f76363          	bltu	a4,a5,80001002 <_ZdlPvj+0xc>
80001000:	8082                	ret
80001002:	1101                	addi	sp,sp,-32
80001004:	ce06                	sw	ra,28(sp)
80001006:	80005737          	lui	a4,0x80005
8000100a:	04472703          	lw	a4,68(a4) # 80005044 <__boot_stack__+0xf8005045>
8000100e:	ffc50593          	addi	a1,a0,-4
80001012:	feb52e23          	sw	a1,-4(a0)
80001016:	c11c                	sw	a5,0(a0)
80001018:	00052223          	sw	zero,4(a0)
8000101c:	00052423          	sw	zero,8(a0)
80001020:	0074                	addi	a3,sp,12
80001022:	0030                	addi	a2,sp,8
80001024:	853a                	mv	a0,a4
80001026:	00000097          	auipc	ra,0x0
8000102a:	84c080e7          	jalr	-1972(ra) # 80000872 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>
8000102e:	40f2                	lw	ra,28(sp)
80001030:	6105                	addi	sp,sp,32
80001032:	8082                	ret

80001034 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>:
80001034:	1141                	addi	sp,sp,-16
80001036:	c606                	sw	ra,12(sp)
80001038:	00000097          	auipc	ra,0x0
8000103c:	ec2080e7          	jalr	-318(ra) # 80000efa <_panic>
80001040:	40b2                	lw	ra,12(sp)
80001042:	0141                	addi	sp,sp,16
80001044:	8082                	ret

80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>:
80001046:	c9a1                	beqz	a1,80001096 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x50>
80001048:	10000793          	li	a5,256
8000104c:	00b7f663          	bgeu	a5,a1,80001058 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
80001050:	411c                	lw	a5,0(a0)
80001052:	17e1                	addi	a5,a5,-8
80001054:	9bdd                	andi	a5,a5,-9
80001056:	cba1                	beqz	a5,800010a6 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x60>
80001058:	4118                	lw	a4,0(a0)
8000105a:	87ae                	mv	a5,a1
8000105c:	88b6                	mv	a7,a3
8000105e:	0685                	addi	a3,a3,1
80001060:	883e                	mv	a6,a5
80001062:	02e7d7b3          	divu	a5,a5,a4
80001066:	fee87be3          	bgeu	a6,a4,8000105c <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x16>
8000106a:	9646                	add	a2,a2,a7
8000106c:	80003837          	lui	a6,0x80003
80001070:	7b880813          	addi	a6,a6,1976 # 800037b8 <__boot_stack__+0xf80037b9>
80001074:	411c                	lw	a5,0(a0)
80001076:	02f5f7b3          	remu	a5,a1,a5
8000107a:	97c2                	add	a5,a5,a6
8000107c:	0007c783          	lbu	a5,0(a5)
80001080:	00f60023          	sb	a5,0(a2)
80001084:	411c                	lw	a5,0(a0)
80001086:	872e                	mv	a4,a1
80001088:	02f5d5b3          	divu	a1,a1,a5
8000108c:	167d                	addi	a2,a2,-1
8000108e:	fef773e3          	bgeu	a4,a5,80001074 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x2e>
80001092:	8536                	mv	a0,a3
80001094:	8082                	ret
80001096:	9636                	add	a2,a2,a3
80001098:	03000793          	li	a5,48
8000109c:	00f60023          	sb	a5,0(a2)
800010a0:	00168513          	addi	a0,a3,1
800010a4:	8082                	ret
800010a6:	00168713          	addi	a4,a3,1
800010aa:	00d607b3          	add	a5,a2,a3
800010ae:	03000813          	li	a6,48
800010b2:	01078023          	sb	a6,0(a5)
800010b6:	00052803          	lw	a6,0(a0)
800010ba:	47c1                	li	a5,16
800010bc:	00f81963          	bne	a6,a5,800010ce <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x88>
800010c0:	0689                	addi	a3,a3,2
800010c2:	9732                	add	a4,a4,a2
800010c4:	07800793          	li	a5,120
800010c8:	00f70023          	sb	a5,0(a4)
800010cc:	b771                	j	80001058 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
800010ce:	86ba                	mv	a3,a4
800010d0:	b761                	j	80001058 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>

800010d2 <_ZN4EPOS1S1U7OStream4itoaEiPc>:
800010d2:	1141                	addi	sp,sp,-16
800010d4:	c606                	sw	ra,12(sp)
800010d6:	4681                	li	a3,0
800010d8:	0005c963          	bltz	a1,800010ea <_ZN4EPOS1S1U7OStream4itoaEiPc+0x18>
800010dc:	00000097          	auipc	ra,0x0
800010e0:	f6a080e7          	jalr	-150(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800010e4:	40b2                	lw	ra,12(sp)
800010e6:	0141                	addi	sp,sp,16
800010e8:	8082                	ret
800010ea:	40b005b3          	neg	a1,a1
800010ee:	02d00793          	li	a5,45
800010f2:	00f60023          	sb	a5,0(a2)
800010f6:	4685                	li	a3,1
800010f8:	b7d5                	j	800010dc <_ZN4EPOS1S1U7OStream4itoaEiPc+0xa>

800010fa <_ZN4EPOS1S1U7OStream4ptoaEPKvPc>:
800010fa:	03000793          	li	a5,48
800010fe:	00f60023          	sb	a5,0(a2)
80001102:	07800793          	li	a5,120
80001106:	00f600a3          	sb	a5,1(a2)
8000110a:	00960793          	addi	a5,a2,9
8000110e:	0605                	addi	a2,a2,1
80001110:	800036b7          	lui	a3,0x80003
80001114:	7b868693          	addi	a3,a3,1976 # 800037b8 <__boot_stack__+0xf80037b9>
80001118:	00f5f713          	andi	a4,a1,15
8000111c:	9736                	add	a4,a4,a3
8000111e:	00074703          	lbu	a4,0(a4)
80001122:	00e78023          	sb	a4,0(a5)
80001126:	8191                	srli	a1,a1,0x4
80001128:	17fd                	addi	a5,a5,-1
8000112a:	fec797e3          	bne	a5,a2,80001118 <_ZN4EPOS1S1U7OStream4ptoaEPKvPc+0x1e>
8000112e:	4529                	li	a0,10
80001130:	8082                	ret

80001132 <_ZN4EPOS1S6Thread20constructor_prologueEj>:
80001132:	1141                	addi	sp,sp,-16
80001134:	c606                	sw	ra,12(sp)
80001136:	c422                	sw	s0,8(sp)
80001138:	842a                	mv	s0,a0
8000113a:	4781                	li	a5,0
8000113c:	30479073          	csrw	mie,a5
80001140:	800057b7          	lui	a5,0x80005
80001144:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
80001148:	4398                	lw	a4,0(a5)
8000114a:	0705                	addi	a4,a4,1
8000114c:	c398                	sw	a4,0(a5)
8000114e:	f14027f3          	csrr	a5,mhartid
80001152:	8b8d                	andi	a5,a5,3
80001154:	80005737          	lui	a4,0x80005
80001158:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000115c:	078a                	slli	a5,a5,0x2
8000115e:	97ba                	add	a5,a5,a4
80001160:	47dc                	lw	a5,12(a5)
80001162:	01450613          	addi	a2,a0,20
80001166:	f14027f3          	csrr	a5,mhartid
8000116a:	8b8d                	andi	a5,a5,3
8000116c:	078a                	slli	a5,a5,0x2
8000116e:	973e                	add	a4,a4,a5
80001170:	475c                	lw	a5,12(a4)
80001172:	cbc9                	beqz	a5,80001204 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xd2>
80001174:	800057b7          	lui	a5,0x80005
80001178:	0887a503          	lw	a0,136(a5) # 80005088 <__boot_stack__+0xf8005089>
8000117c:	ed01                	bnez	a0,80001194 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x62>
8000117e:	00042e23          	sw	zero,28(s0)
80001182:	02042023          	sw	zero,32(s0)
80001186:	08878793          	addi	a5,a5,136
8000118a:	c3d0                	sw	a2,4(a5)
8000118c:	c790                	sw	a2,8(a5)
8000118e:	4705                	li	a4,1
80001190:	c398                	sw	a4,0(a5)
80001192:	a061                	j	8000121a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xe8>
80001194:	800057b7          	lui	a5,0x80005
80001198:	08c7a803          	lw	a6,140(a5) # 8000508c <__boot_stack__+0xf800508d>
8000119c:	87c2                	mv	a5,a6
8000119e:	a011                	j	800011a2 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x70>
800011a0:	87ba                	mv	a5,a4
800011a2:	43d4                	lw	a3,4(a5)
800011a4:	4c18                	lw	a4,24(s0)
800011a6:	00d74463          	blt	a4,a3,800011ae <_ZN4EPOS1S6Thread20constructor_prologueEj+0x7c>
800011aa:	47d8                	lw	a4,12(a5)
800011ac:	fb75                	bnez	a4,800011a0 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x6e>
800011ae:	43d4                	lw	a3,4(a5)
800011b0:	4c18                	lw	a4,24(s0)
800011b2:	00d75e63          	bge	a4,a3,800011ce <_ZN4EPOS1S6Thread20constructor_prologueEj+0x9c>
800011b6:	4798                	lw	a4,8(a5)
800011b8:	cb05                	beqz	a4,800011e8 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xb6>
800011ba:	c750                	sw	a2,12(a4)
800011bc:	c790                	sw	a2,8(a5)
800011be:	cc58                	sw	a4,28(s0)
800011c0:	d01c                	sw	a5,32(s0)
800011c2:	0505                	addi	a0,a0,1
800011c4:	800057b7          	lui	a5,0x80005
800011c8:	08a7a423          	sw	a0,136(a5) # 80005088 <__boot_stack__+0xf8005089>
800011cc:	a0b9                	j	8000121a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xe8>
800011ce:	800057b7          	lui	a5,0x80005
800011d2:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800011d6:	4798                	lw	a4,8(a5)
800011d8:	c750                	sw	a2,12(a4)
800011da:	cc58                	sw	a4,28(s0)
800011dc:	02042023          	sw	zero,32(s0)
800011e0:	c790                	sw	a2,8(a5)
800011e2:	0505                	addi	a0,a0,1
800011e4:	c388                	sw	a0,0(a5)
800011e6:	a815                	j	8000121a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xe8>
800011e8:	00042e23          	sw	zero,28(s0)
800011ec:	03042023          	sw	a6,32(s0)
800011f0:	00c82423          	sw	a2,8(a6)
800011f4:	800057b7          	lui	a5,0x80005
800011f8:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800011fc:	c3d0                	sw	a2,4(a5)
800011fe:	0505                	addi	a0,a0,1
80001200:	c388                	sw	a0,0(a5)
80001202:	a821                	j	8000121a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xe8>
80001204:	f14027f3          	csrr	a5,mhartid
80001208:	8b8d                	andi	a5,a5,3
8000120a:	00279713          	slli	a4,a5,0x2
8000120e:	800057b7          	lui	a5,0x80005
80001212:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001216:	97ba                	add	a5,a5,a4
80001218:	c7d0                	sw	a2,12(a5)
8000121a:	800057b7          	lui	a5,0x80005
8000121e:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80001222:	c9c1                	beqz	a1,800012b2 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x180>
80001224:	0035f793          	andi	a5,a1,3
80001228:	c789                	beqz	a5,80001232 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x100>
8000122a:	0585                	addi	a1,a1,1
8000122c:	0035f793          	andi	a5,a1,3
80001230:	ffed                	bnez	a5,8000122a <_ZN4EPOS1S6Thread20constructor_prologueEj+0xf8>
80001232:	0591                	addi	a1,a1,4
80001234:	47c1                	li	a5,16
80001236:	00f5f363          	bgeu	a1,a5,8000123c <_ZN4EPOS1S6Thread20constructor_prologueEj+0x10a>
8000123a:	45c1                	li	a1,16
8000123c:	415c                	lw	a5,4(a0)
8000123e:	cb91                	beqz	a5,80001252 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x120>
80001240:	01058693          	addi	a3,a1,16
80001244:	43d8                	lw	a4,4(a5)
80001246:	06d77863          	bgeu	a4,a3,800012b6 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x184>
8000124a:	06e58663          	beq	a1,a4,800012b6 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x184>
8000124e:	47dc                	lw	a5,12(a5)
80001250:	fbf5                	bnez	a5,80001244 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x112>
80001252:	00000097          	auipc	ra,0x0
80001256:	de2080e7          	jalr	-542(ra) # 80001034 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
8000125a:	4701                	li	a4,0
8000125c:	a895                	j	800012d0 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x19e>
8000125e:	4118                	lw	a4,0(a0)
80001260:	4685                	li	a3,1
80001262:	00d70d63          	beq	a4,a3,8000127c <_ZN4EPOS1S6Thread20constructor_prologueEj+0x14a>
80001266:	4790                	lw	a2,8(a5)
80001268:	c20d                	beqz	a2,8000128a <_ZN4EPOS1S6Thread20constructor_prologueEj+0x158>
8000126a:	47d4                	lw	a3,12(a5)
8000126c:	ca8d                	beqz	a3,8000129e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x16c>
8000126e:	c654                	sw	a3,12(a2)
80001270:	4798                	lw	a4,8(a5)
80001272:	c698                	sw	a4,8(a3)
80001274:	4118                	lw	a4,0(a0)
80001276:	177d                	addi	a4,a4,-1
80001278:	c118                	sw	a4,0(a0)
8000127a:	a0a9                	j	800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
8000127c:	00052223          	sw	zero,4(a0)
80001280:	00052423          	sw	zero,8(a0)
80001284:	00052023          	sw	zero,0(a0)
80001288:	a835                	j	800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
8000128a:	cf0d                	beqz	a4,800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
8000128c:	4158                	lw	a4,4(a0)
8000128e:	4758                	lw	a4,12(a4)
80001290:	c158                	sw	a4,4(a0)
80001292:	00072423          	sw	zero,8(a4)
80001296:	4118                	lw	a4,0(a0)
80001298:	177d                	addi	a4,a4,-1
8000129a:	c118                	sw	a4,0(a0)
8000129c:	a025                	j	800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
8000129e:	c31d                	beqz	a4,800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
800012a0:	4518                	lw	a4,8(a0)
800012a2:	4718                	lw	a4,8(a4)
800012a4:	c518                	sw	a4,8(a0)
800012a6:	00072623          	sw	zero,12(a4)
800012aa:	4118                	lw	a4,0(a0)
800012ac:	177d                	addi	a4,a4,-1
800012ae:	c118                	sw	a4,0(a0)
800012b0:	a811                	j	800012c4 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x192>
800012b2:	4701                	li	a4,0
800012b4:	a831                	j	800012d0 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x19e>
800012b6:	8f0d                	sub	a4,a4,a1
800012b8:	c3d8                	sw	a4,4(a5)
800012ba:	4558                	lw	a4,12(a0)
800012bc:	8f0d                	sub	a4,a4,a1
800012be:	c558                	sw	a4,12(a0)
800012c0:	43d8                	lw	a4,4(a5)
800012c2:	df51                	beqz	a4,8000125e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x12c>
800012c4:	4398                	lw	a4,0(a5)
800012c6:	43dc                	lw	a5,4(a5)
800012c8:	97ba                	add	a5,a5,a4
800012ca:	00478713          	addi	a4,a5,4
800012ce:	c38c                	sw	a1,0(a5)
800012d0:	c018                	sw	a4,0(s0)
800012d2:	40b2                	lw	ra,12(sp)
800012d4:	4422                	lw	s0,8(sp)
800012d6:	0141                	addi	sp,sp,16
800012d8:	8082                	ret

800012da <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>:
800012da:	ea15                	bnez	a2,8000130e <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x34>
800012dc:	04a58d63          	beq	a1,a0,80001336 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x5c>
800012e0:	1141                	addi	sp,sp,-16
800012e2:	c606                	sw	ra,12(sp)
800012e4:	451c                	lw	a5,8(a0)
800012e6:	e399                	bnez	a5,800012ec <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x12>
800012e8:	4785                	li	a5,1
800012ea:	c51c                	sw	a5,8(a0)
800012ec:	0005a423          	sw	zero,8(a1)
800012f0:	415c                	lw	a5,4(a0)
800012f2:	41dc                	lw	a5,4(a1)
800012f4:	41cc                	lw	a1,4(a1)
800012f6:	0511                	addi	a0,a0,4
800012f8:	00002097          	auipc	ra,0x2
800012fc:	27c080e7          	jalr	636(ra) # 80003574 <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>
80001300:	08800793          	li	a5,136
80001304:	30479073          	csrw	mie,a5
80001308:	40b2                	lw	ra,12(sp)
8000130a:	0141                	addi	sp,sp,16
8000130c:	8082                	ret
8000130e:	800057b7          	lui	a5,0x80005
80001312:	05c7a703          	lw	a4,92(a5) # 8000505c <__boot_stack__+0xf800505d>
80001316:	f14027f3          	csrr	a5,mhartid
8000131a:	f14027f3          	csrr	a5,mhartid
8000131e:	8b8d                	andi	a5,a5,3
80001320:	078a                	slli	a5,a5,0x2
80001322:	97ba                	add	a5,a5,a4
80001324:	47dc                	lw	a5,12(a5)
80001326:	f14027f3          	csrr	a5,mhartid
8000132a:	8b8d                	andi	a5,a5,3
8000132c:	4354                	lw	a3,4(a4)
8000132e:	078a                	slli	a5,a5,0x2
80001330:	973e                	add	a4,a4,a5
80001332:	c754                	sw	a3,12(a4)
80001334:	b765                	j	800012dc <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x2>
80001336:	08800793          	li	a5,136
8000133a:	30479073          	csrw	mie,a5
8000133e:	8082                	ret

80001340 <_ZN4EPOS1S6Thread5yieldEv>:
80001340:	1141                	addi	sp,sp,-16
80001342:	c606                	sw	ra,12(sp)
80001344:	4781                	li	a5,0
80001346:	30479073          	csrw	mie,a5
8000134a:	f14027f3          	csrr	a5,mhartid
8000134e:	8b8d                	andi	a5,a5,3
80001350:	80005737          	lui	a4,0x80005
80001354:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001358:	078a                	slli	a5,a5,0x2
8000135a:	97ba                	add	a5,a5,a4
8000135c:	47dc                	lw	a5,12(a5)
8000135e:	f14027f3          	csrr	a5,mhartid
80001362:	8b8d                	andi	a5,a5,3
80001364:	078a                	slli	a5,a5,0x2
80001366:	97ba                	add	a5,a5,a4
80001368:	47dc                	lw	a5,12(a5)
8000136a:	4388                	lw	a0,0(a5)
8000136c:	f14027f3          	csrr	a5,mhartid
80001370:	8b8d                	andi	a5,a5,3
80001372:	078a                	slli	a5,a5,0x2
80001374:	97ba                	add	a5,a5,a4
80001376:	47dc                	lw	a5,12(a5)
80001378:	431c                	lw	a5,0(a4)
8000137a:	cf81                	beqz	a5,80001392 <_ZN4EPOS1S6Thread5yieldEv+0x52>
8000137c:	800057b7          	lui	a5,0x80005
80001380:	08c7a783          	lw	a5,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80001384:	43d8                	lw	a4,4(a5)
80001386:	800007b7          	lui	a5,0x80000
8000138a:	fff7c793          	not	a5,a5
8000138e:	02f71663          	bne	a4,a5,800013ba <_ZN4EPOS1S6Thread5yieldEv+0x7a>
80001392:	f14027f3          	csrr	a5,mhartid
80001396:	8b8d                	andi	a5,a5,3
80001398:	00279713          	slli	a4,a5,0x2
8000139c:	800057b7          	lui	a5,0x80005
800013a0:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800013a4:	97ba                	add	a5,a5,a4
800013a6:	47dc                	lw	a5,12(a5)
800013a8:	4605                	li	a2,1
800013aa:	438c                	lw	a1,0(a5)
800013ac:	00000097          	auipc	ra,0x0
800013b0:	f2e080e7          	jalr	-210(ra) # 800012da <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
800013b4:	40b2                	lw	ra,12(sp)
800013b6:	0141                	addi	sp,sp,16
800013b8:	8082                	ret
800013ba:	f14027f3          	csrr	a5,mhartid
800013be:	8b8d                	andi	a5,a5,3
800013c0:	80005737          	lui	a4,0x80005
800013c4:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800013c8:	078a                	slli	a5,a5,0x2
800013ca:	97ba                	add	a5,a5,a4
800013cc:	47d4                	lw	a3,12(a5)
800013ce:	f14027f3          	csrr	a5,mhartid
800013d2:	8b8d                	andi	a5,a5,3
800013d4:	4350                	lw	a2,4(a4)
800013d6:	4318                	lw	a4,0(a4)
800013d8:	c32d                	beqz	a4,8000143a <_ZN4EPOS1S6Thread5yieldEv+0xfa>
800013da:	4585                	li	a1,1
800013dc:	04b70463          	beq	a4,a1,80001424 <_ZN4EPOS1S6Thread5yieldEv+0xe4>
800013e0:	00c62803          	lw	a6,12(a2)
800013e4:	800055b7          	lui	a1,0x80005
800013e8:	08858593          	addi	a1,a1,136 # 80005088 <__boot_stack__+0xf8005089>
800013ec:	0105a223          	sw	a6,4(a1)
800013f0:	00082423          	sw	zero,8(a6)
800013f4:	177d                	addi	a4,a4,-1
800013f6:	c198                	sw	a4,0(a1)
800013f8:	80005737          	lui	a4,0x80005
800013fc:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001400:	078a                	slli	a5,a5,0x2
80001402:	97ba                	add	a5,a5,a4
80001404:	c7d0                	sw	a2,12(a5)
80001406:	430c                	lw	a1,0(a4)
80001408:	e99d                	bnez	a1,8000143e <_ZN4EPOS1S6Thread5yieldEv+0xfe>
8000140a:	0006a423          	sw	zero,8(a3)
8000140e:	0006a623          	sw	zero,12(a3)
80001412:	800057b7          	lui	a5,0x80005
80001416:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000141a:	c3d4                	sw	a3,4(a5)
8000141c:	c794                	sw	a3,8(a5)
8000141e:	4705                	li	a4,1
80001420:	c398                	sw	a4,0(a5)
80001422:	bf85                	j	80001392 <_ZN4EPOS1S6Thread5yieldEv+0x52>
80001424:	80005737          	lui	a4,0x80005
80001428:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000142c:	00072223          	sw	zero,4(a4)
80001430:	00072423          	sw	zero,8(a4)
80001434:	00072023          	sw	zero,0(a4)
80001438:	b7c1                	j	800013f8 <_ZN4EPOS1S6Thread5yieldEv+0xb8>
8000143a:	4601                	li	a2,0
8000143c:	bf75                	j	800013f8 <_ZN4EPOS1S6Thread5yieldEv+0xb8>
8000143e:	800057b7          	lui	a5,0x80005
80001442:	08c7a803          	lw	a6,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80001446:	87c2                	mv	a5,a6
80001448:	a011                	j	8000144c <_ZN4EPOS1S6Thread5yieldEv+0x10c>
8000144a:	87ba                	mv	a5,a4
8000144c:	43d0                	lw	a2,4(a5)
8000144e:	42d8                	lw	a4,4(a3)
80001450:	00c74463          	blt	a4,a2,80001458 <_ZN4EPOS1S6Thread5yieldEv+0x118>
80001454:	47d8                	lw	a4,12(a5)
80001456:	fb75                	bnez	a4,8000144a <_ZN4EPOS1S6Thread5yieldEv+0x10a>
80001458:	43d0                	lw	a2,4(a5)
8000145a:	42d8                	lw	a4,4(a3)
8000145c:	00c75e63          	bge	a4,a2,80001478 <_ZN4EPOS1S6Thread5yieldEv+0x138>
80001460:	4798                	lw	a4,8(a5)
80001462:	cb05                	beqz	a4,80001492 <_ZN4EPOS1S6Thread5yieldEv+0x152>
80001464:	c754                	sw	a3,12(a4)
80001466:	c794                	sw	a3,8(a5)
80001468:	c698                	sw	a4,8(a3)
8000146a:	c6dc                	sw	a5,12(a3)
8000146c:	0585                	addi	a1,a1,1
8000146e:	800057b7          	lui	a5,0x80005
80001472:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001476:	bf31                	j	80001392 <_ZN4EPOS1S6Thread5yieldEv+0x52>
80001478:	800057b7          	lui	a5,0x80005
8000147c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001480:	4798                	lw	a4,8(a5)
80001482:	c754                	sw	a3,12(a4)
80001484:	c698                	sw	a4,8(a3)
80001486:	0006a623          	sw	zero,12(a3)
8000148a:	c794                	sw	a3,8(a5)
8000148c:	0585                	addi	a1,a1,1
8000148e:	c38c                	sw	a1,0(a5)
80001490:	b709                	j	80001392 <_ZN4EPOS1S6Thread5yieldEv+0x52>
80001492:	0006a423          	sw	zero,8(a3)
80001496:	0106a623          	sw	a6,12(a3)
8000149a:	00d82423          	sw	a3,8(a6)
8000149e:	800057b7          	lui	a5,0x80005
800014a2:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800014a6:	c3d4                	sw	a3,4(a5)
800014a8:	0585                	addi	a1,a1,1
800014aa:	c38c                	sw	a1,0(a5)
800014ac:	b5dd                	j	80001392 <_ZN4EPOS1S6Thread5yieldEv+0x52>

800014ae <_ZN4EPOS1S6Thread10rescheduleEv>:
800014ae:	715d                	addi	sp,sp,-80
800014b0:	c686                	sw	ra,76(sp)
800014b2:	c4a2                	sw	s0,72(sp)
800014b4:	c2a6                	sw	s1,68(sp)
800014b6:	304027f3          	csrr	a5,mie
800014ba:	0887f793          	andi	a5,a5,136
800014be:	ebb1                	bnez	a5,80001512 <_ZN4EPOS1S6Thread10rescheduleEv+0x64>
800014c0:	f14027f3          	csrr	a5,mhartid
800014c4:	8b8d                	andi	a5,a5,3
800014c6:	80005737          	lui	a4,0x80005
800014ca:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800014ce:	078a                	slli	a5,a5,0x2
800014d0:	97ba                	add	a5,a5,a4
800014d2:	47dc                	lw	a5,12(a5)
800014d4:	4388                	lw	a0,0(a5)
800014d6:	f14027f3          	csrr	a5,mhartid
800014da:	8b8d                	andi	a5,a5,3
800014dc:	078a                	slli	a5,a5,0x2
800014de:	97ba                	add	a5,a5,a4
800014e0:	47dc                	lw	a5,12(a5)
800014e2:	431c                	lw	a5,0(a4)
800014e4:	e7e5                	bnez	a5,800015cc <_ZN4EPOS1S6Thread10rescheduleEv+0x11e>
800014e6:	f14027f3          	csrr	a5,mhartid
800014ea:	8b8d                	andi	a5,a5,3
800014ec:	00279713          	slli	a4,a5,0x2
800014f0:	800057b7          	lui	a5,0x80005
800014f4:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800014f8:	97ba                	add	a5,a5,a4
800014fa:	47dc                	lw	a5,12(a5)
800014fc:	4605                	li	a2,1
800014fe:	438c                	lw	a1,0(a5)
80001500:	00000097          	auipc	ra,0x0
80001504:	dda080e7          	jalr	-550(ra) # 800012da <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80001508:	40b6                	lw	ra,76(sp)
8000150a:	4426                	lw	s0,72(sp)
8000150c:	4496                	lw	s1,68(sp)
8000150e:	6161                	addi	sp,sp,80
80001510:	8082                	ret
80001512:	800054b7          	lui	s1,0x80005
80001516:	03448413          	addi	s0,s1,52 # 80005034 <__boot_stack__+0xf8005035>
8000151a:	4785                	li	a5,1
8000151c:	00f40223          	sb	a5,4(s0)
80001520:	80003537          	lui	a0,0x80003
80001524:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
80001528:	00000097          	auipc	ra,0x0
8000152c:	a06080e7          	jalr	-1530(ra) # 80000f2e <_print>
80001530:	80003537          	lui	a0,0x80003
80001534:	7e050513          	addi	a0,a0,2016 # 800037e0 <__boot_stack__+0xf80037e1>
80001538:	00000097          	auipc	ra,0x0
8000153c:	9f6080e7          	jalr	-1546(ra) # 80000f2e <_print>
80001540:	80003537          	lui	a0,0x80003
80001544:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
80001548:	00000097          	auipc	ra,0x0
8000154c:	9e6080e7          	jalr	-1562(ra) # 80000f2e <_print>
80001550:	80003537          	lui	a0,0x80003
80001554:	7f850513          	addi	a0,a0,2040 # 800037f8 <__boot_stack__+0xf80037f9>
80001558:	00000097          	auipc	ra,0x0
8000155c:	9d6080e7          	jalr	-1578(ra) # 80000f2e <_print>
80001560:	80004537          	lui	a0,0x80004
80001564:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
80001568:	00000097          	auipc	ra,0x0
8000156c:	9c6080e7          	jalr	-1594(ra) # 80000f2e <_print>
80001570:	80004537          	lui	a0,0x80004
80001574:	82c50513          	addi	a0,a0,-2004 # 8000382c <__boot_stack__+0xf800382d>
80001578:	00000097          	auipc	ra,0x0
8000157c:	9b6080e7          	jalr	-1610(ra) # 80000f2e <_print>
80001580:	80004537          	lui	a0,0x80004
80001584:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
80001588:	00000097          	auipc	ra,0x0
8000158c:	9a6080e7          	jalr	-1626(ra) # 80000f2e <_print>
80001590:	4681                	li	a3,0
80001592:	860a                	mv	a2,sp
80001594:	13000593          	li	a1,304
80001598:	03448513          	addi	a0,s1,52
8000159c:	00000097          	auipc	ra,0x0
800015a0:	aaa080e7          	jalr	-1366(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800015a4:	009c                	addi	a5,sp,64
800015a6:	953e                	add	a0,a0,a5
800015a8:	fc050023          	sb	zero,-64(a0)
800015ac:	850a                	mv	a0,sp
800015ae:	00000097          	auipc	ra,0x0
800015b2:	980080e7          	jalr	-1664(ra) # 80000f2e <_print>
800015b6:	80003537          	lui	a0,0x80003
800015ba:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
800015be:	00000097          	auipc	ra,0x0
800015c2:	970080e7          	jalr	-1680(ra) # 80000f2e <_print>
800015c6:	47a9                	li	a5,10
800015c8:	c01c                	sw	a5,0(s0)
800015ca:	bddd                	j	800014c0 <_ZN4EPOS1S6Thread10rescheduleEv+0x12>
800015cc:	f14027f3          	csrr	a5,mhartid
800015d0:	8b8d                	andi	a5,a5,3
800015d2:	80005737          	lui	a4,0x80005
800015d6:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800015da:	078a                	slli	a5,a5,0x2
800015dc:	97ba                	add	a5,a5,a4
800015de:	47d4                	lw	a3,12(a5)
800015e0:	430c                	lw	a1,0(a4)
800015e2:	eda9                	bnez	a1,8000163c <_ZN4EPOS1S6Thread10rescheduleEv+0x18e>
800015e4:	0006a423          	sw	zero,8(a3)
800015e8:	0006a623          	sw	zero,12(a3)
800015ec:	800057b7          	lui	a5,0x80005
800015f0:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800015f4:	c3d4                	sw	a3,4(a5)
800015f6:	c794                	sw	a3,8(a5)
800015f8:	4705                	li	a4,1
800015fa:	c398                	sw	a4,0(a5)
800015fc:	f14027f3          	csrr	a5,mhartid
80001600:	8b8d                	andi	a5,a5,3
80001602:	80005737          	lui	a4,0x80005
80001606:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000160a:	4354                	lw	a3,4(a4)
8000160c:	4318                	lw	a4,0(a4)
8000160e:	cb55                	beqz	a4,800016c2 <_ZN4EPOS1S6Thread10rescheduleEv+0x214>
80001610:	4605                	li	a2,1
80001612:	08c70d63          	beq	a4,a2,800016ac <_ZN4EPOS1S6Thread10rescheduleEv+0x1fe>
80001616:	46cc                	lw	a1,12(a3)
80001618:	80005637          	lui	a2,0x80005
8000161c:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80001620:	c24c                	sw	a1,4(a2)
80001622:	0005a423          	sw	zero,8(a1)
80001626:	177d                	addi	a4,a4,-1
80001628:	c218                	sw	a4,0(a2)
8000162a:	00279713          	slli	a4,a5,0x2
8000162e:	800057b7          	lui	a5,0x80005
80001632:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001636:	97ba                	add	a5,a5,a4
80001638:	c7d4                	sw	a3,12(a5)
8000163a:	b575                	j	800014e6 <_ZN4EPOS1S6Thread10rescheduleEv+0x38>
8000163c:	800057b7          	lui	a5,0x80005
80001640:	08c7a803          	lw	a6,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80001644:	87c2                	mv	a5,a6
80001646:	a011                	j	8000164a <_ZN4EPOS1S6Thread10rescheduleEv+0x19c>
80001648:	87ba                	mv	a5,a4
8000164a:	43d0                	lw	a2,4(a5)
8000164c:	42d8                	lw	a4,4(a3)
8000164e:	00c74463          	blt	a4,a2,80001656 <_ZN4EPOS1S6Thread10rescheduleEv+0x1a8>
80001652:	47d8                	lw	a4,12(a5)
80001654:	fb75                	bnez	a4,80001648 <_ZN4EPOS1S6Thread10rescheduleEv+0x19a>
80001656:	43d0                	lw	a2,4(a5)
80001658:	42d8                	lw	a4,4(a3)
8000165a:	00c75e63          	bge	a4,a2,80001676 <_ZN4EPOS1S6Thread10rescheduleEv+0x1c8>
8000165e:	4798                	lw	a4,8(a5)
80001660:	cb05                	beqz	a4,80001690 <_ZN4EPOS1S6Thread10rescheduleEv+0x1e2>
80001662:	c754                	sw	a3,12(a4)
80001664:	c794                	sw	a3,8(a5)
80001666:	c698                	sw	a4,8(a3)
80001668:	c6dc                	sw	a5,12(a3)
8000166a:	0585                	addi	a1,a1,1
8000166c:	800057b7          	lui	a5,0x80005
80001670:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001674:	b761                	j	800015fc <_ZN4EPOS1S6Thread10rescheduleEv+0x14e>
80001676:	800057b7          	lui	a5,0x80005
8000167a:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000167e:	4798                	lw	a4,8(a5)
80001680:	c754                	sw	a3,12(a4)
80001682:	c698                	sw	a4,8(a3)
80001684:	0006a623          	sw	zero,12(a3)
80001688:	c794                	sw	a3,8(a5)
8000168a:	0585                	addi	a1,a1,1
8000168c:	c38c                	sw	a1,0(a5)
8000168e:	b7bd                	j	800015fc <_ZN4EPOS1S6Thread10rescheduleEv+0x14e>
80001690:	0006a423          	sw	zero,8(a3)
80001694:	0106a623          	sw	a6,12(a3)
80001698:	00d82423          	sw	a3,8(a6)
8000169c:	800057b7          	lui	a5,0x80005
800016a0:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800016a4:	c3d4                	sw	a3,4(a5)
800016a6:	0585                	addi	a1,a1,1
800016a8:	c38c                	sw	a1,0(a5)
800016aa:	bf89                	j	800015fc <_ZN4EPOS1S6Thread10rescheduleEv+0x14e>
800016ac:	80005737          	lui	a4,0x80005
800016b0:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800016b4:	00072223          	sw	zero,4(a4)
800016b8:	00072423          	sw	zero,8(a4)
800016bc:	00072023          	sw	zero,0(a4)
800016c0:	b7ad                	j	8000162a <_ZN4EPOS1S6Thread10rescheduleEv+0x17c>
800016c2:	4681                	li	a3,0
800016c4:	b79d                	j	8000162a <_ZN4EPOS1S6Thread10rescheduleEv+0x17c>

800016c6 <_ZN4EPOS1S6Thread6resumeEv>:
800016c6:	1141                	addi	sp,sp,-16
800016c8:	c606                	sw	ra,12(sp)
800016ca:	4781                	li	a5,0
800016cc:	30479073          	csrw	mie,a5
800016d0:	4518                	lw	a4,8(a0)
800016d2:	4789                	li	a5,2
800016d4:	02f70e63          	beq	a4,a5,80001710 <_ZN4EPOS1S6Thread6resumeEv+0x4a>
800016d8:	80004537          	lui	a0,0x80004
800016dc:	84050513          	addi	a0,a0,-1984 # 80003840 <__boot_stack__+0xf8003841>
800016e0:	00000097          	auipc	ra,0x0
800016e4:	84e080e7          	jalr	-1970(ra) # 80000f2e <_print>
800016e8:	80003537          	lui	a0,0x80003
800016ec:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
800016f0:	00000097          	auipc	ra,0x0
800016f4:	83e080e7          	jalr	-1986(ra) # 80000f2e <_print>
800016f8:	800057b7          	lui	a5,0x80005
800016fc:	4729                	li	a4,10
800016fe:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
80001702:	08800793          	li	a5,136
80001706:	30479073          	csrw	mie,a5
8000170a:	40b2                	lw	ra,12(sp)
8000170c:	0141                	addi	sp,sp,16
8000170e:	8082                	ret
80001710:	4785                	li	a5,1
80001712:	c51c                	sw	a5,8(a0)
80001714:	f14027f3          	csrr	a5,mhartid
80001718:	8b8d                	andi	a5,a5,3
8000171a:	80005737          	lui	a4,0x80005
8000171e:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001722:	078a                	slli	a5,a5,0x2
80001724:	97ba                	add	a5,a5,a4
80001726:	47dc                	lw	a5,12(a5)
80001728:	01450613          	addi	a2,a0,20
8000172c:	f14027f3          	csrr	a5,mhartid
80001730:	8b8d                	andi	a5,a5,3
80001732:	078a                	slli	a5,a5,0x2
80001734:	973e                	add	a4,a4,a5
80001736:	475c                	lw	a5,12(a4)
80001738:	cbc9                	beqz	a5,800017ca <_ZN4EPOS1S6Thread6resumeEv+0x104>
8000173a:	800057b7          	lui	a5,0x80005
8000173e:	0887a583          	lw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001742:	ed81                	bnez	a1,8000175a <_ZN4EPOS1S6Thread6resumeEv+0x94>
80001744:	00052e23          	sw	zero,28(a0)
80001748:	02052023          	sw	zero,32(a0)
8000174c:	08878793          	addi	a5,a5,136
80001750:	c3d0                	sw	a2,4(a5)
80001752:	c790                	sw	a2,8(a5)
80001754:	4705                	li	a4,1
80001756:	c398                	sw	a4,0(a5)
80001758:	a061                	j	800017e0 <_ZN4EPOS1S6Thread6resumeEv+0x11a>
8000175a:	800057b7          	lui	a5,0x80005
8000175e:	08c7a803          	lw	a6,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80001762:	87c2                	mv	a5,a6
80001764:	a011                	j	80001768 <_ZN4EPOS1S6Thread6resumeEv+0xa2>
80001766:	87ba                	mv	a5,a4
80001768:	43d4                	lw	a3,4(a5)
8000176a:	4d18                	lw	a4,24(a0)
8000176c:	00d74463          	blt	a4,a3,80001774 <_ZN4EPOS1S6Thread6resumeEv+0xae>
80001770:	47d8                	lw	a4,12(a5)
80001772:	fb75                	bnez	a4,80001766 <_ZN4EPOS1S6Thread6resumeEv+0xa0>
80001774:	43d4                	lw	a3,4(a5)
80001776:	4d18                	lw	a4,24(a0)
80001778:	00d75e63          	bge	a4,a3,80001794 <_ZN4EPOS1S6Thread6resumeEv+0xce>
8000177c:	4798                	lw	a4,8(a5)
8000177e:	cb05                	beqz	a4,800017ae <_ZN4EPOS1S6Thread6resumeEv+0xe8>
80001780:	c750                	sw	a2,12(a4)
80001782:	c790                	sw	a2,8(a5)
80001784:	cd58                	sw	a4,28(a0)
80001786:	d11c                	sw	a5,32(a0)
80001788:	0585                	addi	a1,a1,1
8000178a:	800057b7          	lui	a5,0x80005
8000178e:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001792:	a0b9                	j	800017e0 <_ZN4EPOS1S6Thread6resumeEv+0x11a>
80001794:	800057b7          	lui	a5,0x80005
80001798:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000179c:	4798                	lw	a4,8(a5)
8000179e:	c750                	sw	a2,12(a4)
800017a0:	cd58                	sw	a4,28(a0)
800017a2:	02052023          	sw	zero,32(a0)
800017a6:	c790                	sw	a2,8(a5)
800017a8:	0585                	addi	a1,a1,1
800017aa:	c38c                	sw	a1,0(a5)
800017ac:	a815                	j	800017e0 <_ZN4EPOS1S6Thread6resumeEv+0x11a>
800017ae:	00052e23          	sw	zero,28(a0)
800017b2:	03052023          	sw	a6,32(a0)
800017b6:	00c82423          	sw	a2,8(a6)
800017ba:	800057b7          	lui	a5,0x80005
800017be:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800017c2:	c3d0                	sw	a2,4(a5)
800017c4:	0585                	addi	a1,a1,1
800017c6:	c38c                	sw	a1,0(a5)
800017c8:	a821                	j	800017e0 <_ZN4EPOS1S6Thread6resumeEv+0x11a>
800017ca:	f14027f3          	csrr	a5,mhartid
800017ce:	8b8d                	andi	a5,a5,3
800017d0:	00279713          	slli	a4,a5,0x2
800017d4:	800057b7          	lui	a5,0x80005
800017d8:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800017dc:	97ba                	add	a5,a5,a4
800017de:	c7d0                	sw	a2,12(a5)
800017e0:	00000097          	auipc	ra,0x0
800017e4:	cce080e7          	jalr	-818(ra) # 800014ae <_ZN4EPOS1S6Thread10rescheduleEv>
800017e8:	b70d                	j	8000170a <_ZN4EPOS1S6Thread6resumeEv+0x44>

800017ea <_ZN4EPOS1S6Thread11time_slicerEj>:
800017ea:	1141                	addi	sp,sp,-16
800017ec:	c606                	sw	ra,12(sp)
800017ee:	4781                	li	a5,0
800017f0:	30479073          	csrw	mie,a5
800017f4:	00000097          	auipc	ra,0x0
800017f8:	cba080e7          	jalr	-838(ra) # 800014ae <_ZN4EPOS1S6Thread10rescheduleEv>
800017fc:	40b2                	lw	ra,12(sp)
800017fe:	0141                	addi	sp,sp,16
80001800:	8082                	ret

80001802 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>:
80001802:	715d                	addi	sp,sp,-80
80001804:	c686                	sw	ra,76(sp)
80001806:	c4a2                	sw	s0,72(sp)
80001808:	c2a6                	sw	s1,68(sp)
8000180a:	c0ca                	sw	s2,64(sp)
8000180c:	842a                	mv	s0,a0
8000180e:	415c                	lw	a5,4(a0)
80001810:	4518                	lw	a4,8(a0)
80001812:	478d                	li	a5,3
80001814:	02f70a63          	beq	a4,a5,80001848 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x46>
80001818:	4518                	lw	a4,8(a0)
8000181a:	4791                	li	a5,4
8000181c:	02f70663          	beq	a4,a5,80001848 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x46>
80001820:	4418                	lw	a4,8(s0)
80001822:	4785                	li	a5,1
80001824:	00f70463          	beq	a4,a5,8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80001828:	441c                	lw	a5,8(s0)
8000182a:	efe1                	bnez	a5,80001902 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x100>
8000182c:	4418                	lw	a4,8(s0)
8000182e:	4785                	li	a5,1
80001830:	1cf70563          	beq	a4,a5,800019fa <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1f8>
80001834:	08800793          	li	a5,136
80001838:	30479073          	csrw	mie,a5
8000183c:	40b6                	lw	ra,76(sp)
8000183e:	4426                	lw	s0,72(sp)
80001840:	4496                	lw	s1,68(sp)
80001842:	4906                	lw	s2,64(sp)
80001844:	6161                	addi	sp,sp,80
80001846:	8082                	ret
80001848:	80005937          	lui	s2,0x80005
8000184c:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
80001850:	4785                	li	a5,1
80001852:	00f48223          	sb	a5,4(s1)
80001856:	80003537          	lui	a0,0x80003
8000185a:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
8000185e:	fffff097          	auipc	ra,0xfffff
80001862:	6d0080e7          	jalr	1744(ra) # 80000f2e <_print>
80001866:	80004537          	lui	a0,0x80004
8000186a:	86850513          	addi	a0,a0,-1944 # 80003868 <__boot_stack__+0xf8003869>
8000186e:	fffff097          	auipc	ra,0xfffff
80001872:	6c0080e7          	jalr	1728(ra) # 80000f2e <_print>
80001876:	80003537          	lui	a0,0x80003
8000187a:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
8000187e:	fffff097          	auipc	ra,0xfffff
80001882:	6b0080e7          	jalr	1712(ra) # 80000f2e <_print>
80001886:	80004537          	lui	a0,0x80004
8000188a:	89850513          	addi	a0,a0,-1896 # 80003898 <__boot_stack__+0xf8003899>
8000188e:	fffff097          	auipc	ra,0xfffff
80001892:	6a0080e7          	jalr	1696(ra) # 80000f2e <_print>
80001896:	80004537          	lui	a0,0x80004
8000189a:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
8000189e:	fffff097          	auipc	ra,0xfffff
800018a2:	690080e7          	jalr	1680(ra) # 80000f2e <_print>
800018a6:	80004537          	lui	a0,0x80004
800018aa:	82c50513          	addi	a0,a0,-2004 # 8000382c <__boot_stack__+0xf800382d>
800018ae:	fffff097          	auipc	ra,0xfffff
800018b2:	680080e7          	jalr	1664(ra) # 80000f2e <_print>
800018b6:	80004537          	lui	a0,0x80004
800018ba:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
800018be:	fffff097          	auipc	ra,0xfffff
800018c2:	670080e7          	jalr	1648(ra) # 80000f2e <_print>
800018c6:	4681                	li	a3,0
800018c8:	860a                	mv	a2,sp
800018ca:	02a00593          	li	a1,42
800018ce:	03490513          	addi	a0,s2,52
800018d2:	fffff097          	auipc	ra,0xfffff
800018d6:	774080e7          	jalr	1908(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800018da:	009c                	addi	a5,sp,64
800018dc:	953e                	add	a0,a0,a5
800018de:	fc050023          	sb	zero,-64(a0)
800018e2:	850a                	mv	a0,sp
800018e4:	fffff097          	auipc	ra,0xfffff
800018e8:	64a080e7          	jalr	1610(ra) # 80000f2e <_print>
800018ec:	80003537          	lui	a0,0x80003
800018f0:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
800018f4:	fffff097          	auipc	ra,0xfffff
800018f8:	63a080e7          	jalr	1594(ra) # 80000f2e <_print>
800018fc:	47a9                	li	a5,10
800018fe:	c09c                	sw	a5,0(s1)
80001900:	b705                	j	80001820 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1e>
80001902:	f14027f3          	csrr	a5,mhartid
80001906:	8b8d                	andi	a5,a5,3
80001908:	80005737          	lui	a4,0x80005
8000190c:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001910:	078a                	slli	a5,a5,0x2
80001912:	97ba                	add	a5,a5,a4
80001914:	47dc                	lw	a5,12(a5)
80001916:	f14027f3          	csrr	a5,mhartid
8000191a:	8b8d                	andi	a5,a5,3
8000191c:	078a                	slli	a5,a5,0x2
8000191e:	973e                	add	a4,a4,a5
80001920:	4758                	lw	a4,12(a4)
80001922:	01440793          	addi	a5,s0,20
80001926:	02f70663          	beq	a4,a5,80001952 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x150>
8000192a:	800057b7          	lui	a5,0x80005
8000192e:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001932:	4705                	li	a4,1
80001934:	06e78c63          	beq	a5,a4,800019ac <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1aa>
80001938:	4c54                	lw	a3,28(s0)
8000193a:	c6c1                	beqz	a3,800019c2 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1c0>
8000193c:	5018                	lw	a4,32(s0)
8000193e:	c345                	beqz	a4,800019de <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1dc>
80001940:	c6d8                	sw	a4,12(a3)
80001942:	4c54                	lw	a3,28(s0)
80001944:	c714                	sw	a3,8(a4)
80001946:	17fd                	addi	a5,a5,-1
80001948:	80005737          	lui	a4,0x80005
8000194c:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
80001950:	bdf1                	j	8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80001952:	f14027f3          	csrr	a5,mhartid
80001956:	8b8d                	andi	a5,a5,3
80001958:	80005737          	lui	a4,0x80005
8000195c:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001960:	4354                	lw	a3,4(a4)
80001962:	4318                	lw	a4,0(a4)
80001964:	c331                	beqz	a4,800019a8 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1a6>
80001966:	4605                	li	a2,1
80001968:	02c70563          	beq	a4,a2,80001992 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x190>
8000196c:	46cc                	lw	a1,12(a3)
8000196e:	80005637          	lui	a2,0x80005
80001972:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80001976:	c24c                	sw	a1,4(a2)
80001978:	0005a423          	sw	zero,8(a1)
8000197c:	177d                	addi	a4,a4,-1
8000197e:	c218                	sw	a4,0(a2)
80001980:	00279713          	slli	a4,a5,0x2
80001984:	800057b7          	lui	a5,0x80005
80001988:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000198c:	97ba                	add	a5,a5,a4
8000198e:	c7d4                	sw	a3,12(a5)
80001990:	bd71                	j	8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80001992:	80005737          	lui	a4,0x80005
80001996:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000199a:	00072223          	sw	zero,4(a4)
8000199e:	00072423          	sw	zero,8(a4)
800019a2:	00072023          	sw	zero,0(a4)
800019a6:	bfe9                	j	80001980 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x17e>
800019a8:	4681                	li	a3,0
800019aa:	bfd9                	j	80001980 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x17e>
800019ac:	800057b7          	lui	a5,0x80005
800019b0:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800019b4:	0007a223          	sw	zero,4(a5)
800019b8:	0007a423          	sw	zero,8(a5)
800019bc:	0007a023          	sw	zero,0(a5)
800019c0:	b5b5                	j	8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
800019c2:	e60785e3          	beqz	a5,8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
800019c6:	80005737          	lui	a4,0x80005
800019ca:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800019ce:	4354                	lw	a3,4(a4)
800019d0:	46d4                	lw	a3,12(a3)
800019d2:	c354                	sw	a3,4(a4)
800019d4:	0006a423          	sw	zero,8(a3)
800019d8:	17fd                	addi	a5,a5,-1
800019da:	c31c                	sw	a5,0(a4)
800019dc:	bd81                	j	8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
800019de:	e40787e3          	beqz	a5,8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
800019e2:	80005737          	lui	a4,0x80005
800019e6:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800019ea:	4714                	lw	a3,8(a4)
800019ec:	4694                	lw	a3,8(a3)
800019ee:	c714                	sw	a3,8(a4)
800019f0:	0006a623          	sw	zero,12(a3)
800019f4:	17fd                	addi	a5,a5,-1
800019f6:	c31c                	sw	a5,0(a4)
800019f8:	bd15                	j	8000182c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
800019fa:	4c18                	lw	a4,24(s0)
800019fc:	800007b7          	lui	a5,0x80000
80001a00:	fff7c793          	not	a5,a5
80001a04:	e2f708e3          	beq	a4,a5,80001834 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x32>
80001a08:	00000097          	auipc	ra,0x0
80001a0c:	aa6080e7          	jalr	-1370(ra) # 800014ae <_ZN4EPOS1S6Thread10rescheduleEv>
80001a10:	b535                	j	8000183c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x3a>

80001a12 <_ZN4EPOS1S6Thread7suspendEb>:
80001a12:	1141                	addi	sp,sp,-16
80001a14:	c606                	sw	ra,12(sp)
80001a16:	86aa                	mv	a3,a0
80001a18:	e581                	bnez	a1,80001a20 <_ZN4EPOS1S6Thread7suspendEb+0xe>
80001a1a:	4781                	li	a5,0
80001a1c:	30479073          	csrw	mie,a5
80001a20:	f1402773          	csrr	a4,mhartid
80001a24:	8b0d                	andi	a4,a4,3
80001a26:	800057b7          	lui	a5,0x80005
80001a2a:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001a2e:	070a                	slli	a4,a4,0x2
80001a30:	973e                	add	a4,a4,a5
80001a32:	4758                	lw	a4,12(a4)
80001a34:	4308                	lw	a0,0(a4)
80001a36:	4709                	li	a4,2
80001a38:	c698                	sw	a4,8(a3)
80001a3a:	f1402773          	csrr	a4,mhartid
80001a3e:	8b0d                	andi	a4,a4,3
80001a40:	070a                	slli	a4,a4,0x2
80001a42:	973e                	add	a4,a4,a5
80001a44:	4758                	lw	a4,12(a4)
80001a46:	f1402773          	csrr	a4,mhartid
80001a4a:	8b0d                	andi	a4,a4,3
80001a4c:	070a                	slli	a4,a4,0x2
80001a4e:	97ba                	add	a5,a5,a4
80001a50:	47d8                	lw	a4,12(a5)
80001a52:	01468793          	addi	a5,a3,20
80001a56:	04f70963          	beq	a4,a5,80001aa8 <_ZN4EPOS1S6Thread7suspendEb+0x96>
80001a5a:	800057b7          	lui	a5,0x80005
80001a5e:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001a62:	4705                	li	a4,1
80001a64:	08e78f63          	beq	a5,a4,80001b02 <_ZN4EPOS1S6Thread7suspendEb+0xf0>
80001a68:	4ed0                	lw	a2,28(a3)
80001a6a:	c65d                	beqz	a2,80001b18 <_ZN4EPOS1S6Thread7suspendEb+0x106>
80001a6c:	5298                	lw	a4,32(a3)
80001a6e:	c371                	beqz	a4,80001b32 <_ZN4EPOS1S6Thread7suspendEb+0x120>
80001a70:	c658                	sw	a4,12(a2)
80001a72:	4ed4                	lw	a3,28(a3)
80001a74:	c714                	sw	a3,8(a4)
80001a76:	17fd                	addi	a5,a5,-1
80001a78:	80005737          	lui	a4,0x80005
80001a7c:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
80001a80:	f14027f3          	csrr	a5,mhartid
80001a84:	8b8d                	andi	a5,a5,3
80001a86:	00279713          	slli	a4,a5,0x2
80001a8a:	800057b7          	lui	a5,0x80005
80001a8e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001a92:	97ba                	add	a5,a5,a4
80001a94:	47dc                	lw	a5,12(a5)
80001a96:	4605                	li	a2,1
80001a98:	438c                	lw	a1,0(a5)
80001a9a:	00000097          	auipc	ra,0x0
80001a9e:	840080e7          	jalr	-1984(ra) # 800012da <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80001aa2:	40b2                	lw	ra,12(sp)
80001aa4:	0141                	addi	sp,sp,16
80001aa6:	8082                	ret
80001aa8:	f14027f3          	csrr	a5,mhartid
80001aac:	8b8d                	andi	a5,a5,3
80001aae:	80005737          	lui	a4,0x80005
80001ab2:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001ab6:	4354                	lw	a3,4(a4)
80001ab8:	4318                	lw	a4,0(a4)
80001aba:	c331                	beqz	a4,80001afe <_ZN4EPOS1S6Thread7suspendEb+0xec>
80001abc:	4605                	li	a2,1
80001abe:	02c70563          	beq	a4,a2,80001ae8 <_ZN4EPOS1S6Thread7suspendEb+0xd6>
80001ac2:	46cc                	lw	a1,12(a3)
80001ac4:	80005637          	lui	a2,0x80005
80001ac8:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80001acc:	c24c                	sw	a1,4(a2)
80001ace:	0005a423          	sw	zero,8(a1)
80001ad2:	177d                	addi	a4,a4,-1
80001ad4:	c218                	sw	a4,0(a2)
80001ad6:	00279713          	slli	a4,a5,0x2
80001ada:	800057b7          	lui	a5,0x80005
80001ade:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001ae2:	97ba                	add	a5,a5,a4
80001ae4:	c7d4                	sw	a3,12(a5)
80001ae6:	bf69                	j	80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>
80001ae8:	80005737          	lui	a4,0x80005
80001aec:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001af0:	00072223          	sw	zero,4(a4)
80001af4:	00072423          	sw	zero,8(a4)
80001af8:	00072023          	sw	zero,0(a4)
80001afc:	bfe9                	j	80001ad6 <_ZN4EPOS1S6Thread7suspendEb+0xc4>
80001afe:	4681                	li	a3,0
80001b00:	bfd9                	j	80001ad6 <_ZN4EPOS1S6Thread7suspendEb+0xc4>
80001b02:	800057b7          	lui	a5,0x80005
80001b06:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001b0a:	0007a223          	sw	zero,4(a5)
80001b0e:	0007a423          	sw	zero,8(a5)
80001b12:	0007a023          	sw	zero,0(a5)
80001b16:	b7ad                	j	80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>
80001b18:	d7a5                	beqz	a5,80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>
80001b1a:	80005737          	lui	a4,0x80005
80001b1e:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001b22:	4354                	lw	a3,4(a4)
80001b24:	46d4                	lw	a3,12(a3)
80001b26:	c354                	sw	a3,4(a4)
80001b28:	0006a423          	sw	zero,8(a3)
80001b2c:	17fd                	addi	a5,a5,-1
80001b2e:	c31c                	sw	a5,0(a4)
80001b30:	bf81                	j	80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>
80001b32:	d7b9                	beqz	a5,80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>
80001b34:	80005737          	lui	a4,0x80005
80001b38:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001b3c:	4714                	lw	a3,8(a4)
80001b3e:	4694                	lw	a3,8(a3)
80001b40:	c714                	sw	a3,8(a4)
80001b42:	0006a623          	sw	zero,12(a3)
80001b46:	17fd                	addi	a5,a5,-1
80001b48:	c31c                	sw	a5,0(a4)
80001b4a:	bf1d                	j	80001a80 <_ZN4EPOS1S6Thread7suspendEb+0x6e>

80001b4c <_ZN4EPOS1S6Thread4joinEv>:
80001b4c:	715d                	addi	sp,sp,-80
80001b4e:	c686                	sw	ra,76(sp)
80001b50:	c4a2                	sw	s0,72(sp)
80001b52:	c2a6                	sw	s1,68(sp)
80001b54:	c0ca                	sw	s2,64(sp)
80001b56:	842a                	mv	s0,a0
80001b58:	4781                	li	a5,0
80001b5a:	30479073          	csrw	mie,a5
80001b5e:	f14027f3          	csrr	a5,mhartid
80001b62:	8b8d                	andi	a5,a5,3
80001b64:	00279713          	slli	a4,a5,0x2
80001b68:	800057b7          	lui	a5,0x80005
80001b6c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001b70:	97ba                	add	a5,a5,a4
80001b72:	47dc                	lw	a5,12(a5)
80001b74:	439c                	lw	a5,0(a5)
80001b76:	0ea78063          	beq	a5,a0,80001c56 <_ZN4EPOS1S6Thread4joinEv+0x10a>
80001b7a:	481c                	lw	a5,16(s0)
80001b7c:	cfcd                	beqz	a5,80001c36 <_ZN4EPOS1S6Thread4joinEv+0xea>
80001b7e:	80005937          	lui	s2,0x80005
80001b82:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
80001b86:	4785                	li	a5,1
80001b88:	00f48223          	sb	a5,4(s1)
80001b8c:	80003537          	lui	a0,0x80003
80001b90:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
80001b94:	fffff097          	auipc	ra,0xfffff
80001b98:	39a080e7          	jalr	922(ra) # 80000f2e <_print>
80001b9c:	80004537          	lui	a0,0x80004
80001ba0:	91450513          	addi	a0,a0,-1772 # 80003914 <__boot_stack__+0xf8003915>
80001ba4:	fffff097          	auipc	ra,0xfffff
80001ba8:	38a080e7          	jalr	906(ra) # 80000f2e <_print>
80001bac:	80003537          	lui	a0,0x80003
80001bb0:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
80001bb4:	fffff097          	auipc	ra,0xfffff
80001bb8:	37a080e7          	jalr	890(ra) # 80000f2e <_print>
80001bbc:	80004537          	lui	a0,0x80004
80001bc0:	8f850513          	addi	a0,a0,-1800 # 800038f8 <__boot_stack__+0xf80038f9>
80001bc4:	fffff097          	auipc	ra,0xfffff
80001bc8:	36a080e7          	jalr	874(ra) # 80000f2e <_print>
80001bcc:	80004537          	lui	a0,0x80004
80001bd0:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
80001bd4:	fffff097          	auipc	ra,0xfffff
80001bd8:	35a080e7          	jalr	858(ra) # 80000f2e <_print>
80001bdc:	80004537          	lui	a0,0x80004
80001be0:	82c50513          	addi	a0,a0,-2004 # 8000382c <__boot_stack__+0xf800382d>
80001be4:	fffff097          	auipc	ra,0xfffff
80001be8:	34a080e7          	jalr	842(ra) # 80000f2e <_print>
80001bec:	80004537          	lui	a0,0x80004
80001bf0:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
80001bf4:	fffff097          	auipc	ra,0xfffff
80001bf8:	33a080e7          	jalr	826(ra) # 80000f2e <_print>
80001bfc:	4681                	li	a3,0
80001bfe:	860a                	mv	a2,sp
80001c00:	08100593          	li	a1,129
80001c04:	03490513          	addi	a0,s2,52
80001c08:	fffff097          	auipc	ra,0xfffff
80001c0c:	43e080e7          	jalr	1086(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001c10:	009c                	addi	a5,sp,64
80001c12:	953e                	add	a0,a0,a5
80001c14:	fc050023          	sb	zero,-64(a0)
80001c18:	850a                	mv	a0,sp
80001c1a:	fffff097          	auipc	ra,0xfffff
80001c1e:	314080e7          	jalr	788(ra) # 80000f2e <_print>
80001c22:	80003537          	lui	a0,0x80003
80001c26:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80001c2a:	fffff097          	auipc	ra,0xfffff
80001c2e:	304080e7          	jalr	772(ra) # 80000f2e <_print>
80001c32:	47a9                	li	a5,10
80001c34:	c09c                	sw	a5,0(s1)
80001c36:	4418                	lw	a4,8(s0)
80001c38:	4791                	li	a5,4
80001c3a:	0cf71b63          	bne	a4,a5,80001d10 <_ZN4EPOS1S6Thread4joinEv+0x1c4>
80001c3e:	08800793          	li	a5,136
80001c42:	30479073          	csrw	mie,a5
80001c46:	401c                	lw	a5,0(s0)
80001c48:	4388                	lw	a0,0(a5)
80001c4a:	40b6                	lw	ra,76(sp)
80001c4c:	4426                	lw	s0,72(sp)
80001c4e:	4496                	lw	s1,68(sp)
80001c50:	4906                	lw	s2,64(sp)
80001c52:	6161                	addi	sp,sp,80
80001c54:	8082                	ret
80001c56:	80005937          	lui	s2,0x80005
80001c5a:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
80001c5e:	4785                	li	a5,1
80001c60:	00f48223          	sb	a5,4(s1)
80001c64:	80003537          	lui	a0,0x80003
80001c68:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
80001c6c:	fffff097          	auipc	ra,0xfffff
80001c70:	2c2080e7          	jalr	706(ra) # 80000f2e <_print>
80001c74:	80004537          	lui	a0,0x80004
80001c78:	8e450513          	addi	a0,a0,-1820 # 800038e4 <__boot_stack__+0xf80038e5>
80001c7c:	fffff097          	auipc	ra,0xfffff
80001c80:	2b2080e7          	jalr	690(ra) # 80000f2e <_print>
80001c84:	80003537          	lui	a0,0x80003
80001c88:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
80001c8c:	fffff097          	auipc	ra,0xfffff
80001c90:	2a2080e7          	jalr	674(ra) # 80000f2e <_print>
80001c94:	80004537          	lui	a0,0x80004
80001c98:	8f850513          	addi	a0,a0,-1800 # 800038f8 <__boot_stack__+0xf80038f9>
80001c9c:	fffff097          	auipc	ra,0xfffff
80001ca0:	292080e7          	jalr	658(ra) # 80000f2e <_print>
80001ca4:	80004537          	lui	a0,0x80004
80001ca8:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
80001cac:	fffff097          	auipc	ra,0xfffff
80001cb0:	282080e7          	jalr	642(ra) # 80000f2e <_print>
80001cb4:	80004537          	lui	a0,0x80004
80001cb8:	82c50513          	addi	a0,a0,-2004 # 8000382c <__boot_stack__+0xf800382d>
80001cbc:	fffff097          	auipc	ra,0xfffff
80001cc0:	272080e7          	jalr	626(ra) # 80000f2e <_print>
80001cc4:	80004537          	lui	a0,0x80004
80001cc8:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
80001ccc:	fffff097          	auipc	ra,0xfffff
80001cd0:	262080e7          	jalr	610(ra) # 80000f2e <_print>
80001cd4:	4681                	li	a3,0
80001cd6:	860a                	mv	a2,sp
80001cd8:	07e00593          	li	a1,126
80001cdc:	03490513          	addi	a0,s2,52
80001ce0:	fffff097          	auipc	ra,0xfffff
80001ce4:	366080e7          	jalr	870(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80001ce8:	009c                	addi	a5,sp,64
80001cea:	953e                	add	a0,a0,a5
80001cec:	fc050023          	sb	zero,-64(a0)
80001cf0:	850a                	mv	a0,sp
80001cf2:	fffff097          	auipc	ra,0xfffff
80001cf6:	23c080e7          	jalr	572(ra) # 80000f2e <_print>
80001cfa:	80003537          	lui	a0,0x80003
80001cfe:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80001d02:	fffff097          	auipc	ra,0xfffff
80001d06:	22c080e7          	jalr	556(ra) # 80000f2e <_print>
80001d0a:	47a9                	li	a5,10
80001d0c:	c09c                	sw	a5,0(s1)
80001d0e:	b5b5                	j	80001b7a <_ZN4EPOS1S6Thread4joinEv+0x2e>
80001d10:	f14027f3          	csrr	a5,mhartid
80001d14:	8b8d                	andi	a5,a5,3
80001d16:	00279713          	slli	a4,a5,0x2
80001d1a:	800057b7          	lui	a5,0x80005
80001d1e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001d22:	97ba                	add	a5,a5,a4
80001d24:	47dc                	lw	a5,12(a5)
80001d26:	439c                	lw	a5,0(a5)
80001d28:	c81c                	sw	a5,16(s0)
80001d2a:	4808                	lw	a0,16(s0)
80001d2c:	4585                	li	a1,1
80001d2e:	00000097          	auipc	ra,0x0
80001d32:	ce4080e7          	jalr	-796(ra) # 80001a12 <_ZN4EPOS1S6Thread7suspendEb>
80001d36:	bf01                	j	80001c46 <_ZN4EPOS1S6Thread4joinEv+0xfa>

80001d38 <_ZN4EPOS1S6Thread4exitEi>:
80001d38:	1141                	addi	sp,sp,-16
80001d3a:	c606                	sw	ra,12(sp)
80001d3c:	86aa                	mv	a3,a0
80001d3e:	4781                	li	a5,0
80001d40:	30479073          	csrw	mie,a5
80001d44:	f1402773          	csrr	a4,mhartid
80001d48:	8b0d                	andi	a4,a4,3
80001d4a:	800057b7          	lui	a5,0x80005
80001d4e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001d52:	070a                	slli	a4,a4,0x2
80001d54:	973e                	add	a4,a4,a5
80001d56:	4758                	lw	a4,12(a4)
80001d58:	f1402773          	csrr	a4,mhartid
80001d5c:	8b0d                	andi	a4,a4,3
80001d5e:	070a                	slli	a4,a4,0x2
80001d60:	973e                	add	a4,a4,a5
80001d62:	4758                	lw	a4,12(a4)
80001d64:	4308                	lw	a0,0(a4)
80001d66:	f1402773          	csrr	a4,mhartid
80001d6a:	8b0d                	andi	a4,a4,3
80001d6c:	070a                	slli	a4,a4,0x2
80001d6e:	973e                	add	a4,a4,a5
80001d70:	4758                	lw	a4,12(a4)
80001d72:	f1402773          	csrr	a4,mhartid
80001d76:	8b0d                	andi	a4,a4,3
80001d78:	070a                	slli	a4,a4,0x2
80001d7a:	97ba                	add	a5,a5,a4
80001d7c:	47d8                	lw	a4,12(a5)
80001d7e:	01450793          	addi	a5,a0,20
80001d82:	08f70d63          	beq	a4,a5,80001e1c <_ZN4EPOS1S6Thread4exitEi+0xe4>
80001d86:	800057b7          	lui	a5,0x80005
80001d8a:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001d8e:	4705                	li	a4,1
80001d90:	0ee78563          	beq	a5,a4,80001e7a <_ZN4EPOS1S6Thread4exitEi+0x142>
80001d94:	4d50                	lw	a2,28(a0)
80001d96:	ce6d                	beqz	a2,80001e90 <_ZN4EPOS1S6Thread4exitEi+0x158>
80001d98:	5118                	lw	a4,32(a0)
80001d9a:	10070863          	beqz	a4,80001eaa <_ZN4EPOS1S6Thread4exitEi+0x172>
80001d9e:	c658                	sw	a4,12(a2)
80001da0:	4d50                	lw	a2,28(a0)
80001da2:	c710                	sw	a2,8(a4)
80001da4:	17fd                	addi	a5,a5,-1
80001da6:	80005737          	lui	a4,0x80005
80001daa:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
80001dae:	4791                	li	a5,4
80001db0:	c51c                	sw	a5,8(a0)
80001db2:	411c                	lw	a5,0(a0)
80001db4:	c394                	sw	a3,0(a5)
80001db6:	800057b7          	lui	a5,0x80005
80001dba:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
80001dbe:	4398                	lw	a4,0(a5)
80001dc0:	177d                	addi	a4,a4,-1
80001dc2:	c398                	sw	a4,0(a5)
80001dc4:	491c                	lw	a5,16(a0)
80001dc6:	18078663          	beqz	a5,80001f52 <_ZN4EPOS1S6Thread4exitEi+0x21a>
80001dca:	491c                	lw	a5,16(a0)
80001dcc:	4705                	li	a4,1
80001dce:	c798                	sw	a4,8(a5)
80001dd0:	4914                	lw	a3,16(a0)
80001dd2:	f14027f3          	csrr	a5,mhartid
80001dd6:	8b8d                	andi	a5,a5,3
80001dd8:	80005737          	lui	a4,0x80005
80001ddc:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001de0:	078a                	slli	a5,a5,0x2
80001de2:	97ba                	add	a5,a5,a4
80001de4:	47dc                	lw	a5,12(a5)
80001de6:	01468593          	addi	a1,a3,20
80001dea:	f14027f3          	csrr	a5,mhartid
80001dee:	8b8d                	andi	a5,a5,3
80001df0:	078a                	slli	a5,a5,0x2
80001df2:	973e                	add	a4,a4,a5
80001df4:	475c                	lw	a5,12(a4)
80001df6:	14078163          	beqz	a5,80001f38 <_ZN4EPOS1S6Thread4exitEi+0x200>
80001dfa:	800057b7          	lui	a5,0x80005
80001dfe:	0887a803          	lw	a6,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001e02:	0c081163          	bnez	a6,80001ec4 <_ZN4EPOS1S6Thread4exitEi+0x18c>
80001e06:	0006ae23          	sw	zero,28(a3)
80001e0a:	0206a023          	sw	zero,32(a3)
80001e0e:	08878793          	addi	a5,a5,136
80001e12:	c3cc                	sw	a1,4(a5)
80001e14:	c78c                	sw	a1,8(a5)
80001e16:	4705                	li	a4,1
80001e18:	c398                	sw	a4,0(a5)
80001e1a:	aa15                	j	80001f4e <_ZN4EPOS1S6Thread4exitEi+0x216>
80001e1c:	f14027f3          	csrr	a5,mhartid
80001e20:	8b8d                	andi	a5,a5,3
80001e22:	80005737          	lui	a4,0x80005
80001e26:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001e2a:	434c                	lw	a1,4(a4)
80001e2c:	4318                	lw	a4,0(a4)
80001e2e:	c721                	beqz	a4,80001e76 <_ZN4EPOS1S6Thread4exitEi+0x13e>
80001e30:	4605                	li	a2,1
80001e32:	02c70763          	beq	a4,a2,80001e60 <_ZN4EPOS1S6Thread4exitEi+0x128>
80001e36:	00c5a803          	lw	a6,12(a1)
80001e3a:	80005637          	lui	a2,0x80005
80001e3e:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80001e42:	01062223          	sw	a6,4(a2)
80001e46:	00082423          	sw	zero,8(a6)
80001e4a:	177d                	addi	a4,a4,-1
80001e4c:	c218                	sw	a4,0(a2)
80001e4e:	00279713          	slli	a4,a5,0x2
80001e52:	800057b7          	lui	a5,0x80005
80001e56:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001e5a:	97ba                	add	a5,a5,a4
80001e5c:	c7cc                	sw	a1,12(a5)
80001e5e:	bf81                	j	80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001e60:	80005737          	lui	a4,0x80005
80001e64:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001e68:	00072223          	sw	zero,4(a4)
80001e6c:	00072423          	sw	zero,8(a4)
80001e70:	00072023          	sw	zero,0(a4)
80001e74:	bfe9                	j	80001e4e <_ZN4EPOS1S6Thread4exitEi+0x116>
80001e76:	4581                	li	a1,0
80001e78:	bfd9                	j	80001e4e <_ZN4EPOS1S6Thread4exitEi+0x116>
80001e7a:	800057b7          	lui	a5,0x80005
80001e7e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001e82:	0007a223          	sw	zero,4(a5)
80001e86:	0007a423          	sw	zero,8(a5)
80001e8a:	0007a023          	sw	zero,0(a5)
80001e8e:	b705                	j	80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001e90:	df99                	beqz	a5,80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001e92:	80005737          	lui	a4,0x80005
80001e96:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001e9a:	4350                	lw	a2,4(a4)
80001e9c:	4650                	lw	a2,12(a2)
80001e9e:	c350                	sw	a2,4(a4)
80001ea0:	00062423          	sw	zero,8(a2)
80001ea4:	17fd                	addi	a5,a5,-1
80001ea6:	c31c                	sw	a5,0(a4)
80001ea8:	b719                	j	80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001eaa:	d391                	beqz	a5,80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001eac:	80005737          	lui	a4,0x80005
80001eb0:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001eb4:	4710                	lw	a2,8(a4)
80001eb6:	4610                	lw	a2,8(a2)
80001eb8:	c710                	sw	a2,8(a4)
80001eba:	00062623          	sw	zero,12(a2)
80001ebe:	17fd                	addi	a5,a5,-1
80001ec0:	c31c                	sw	a5,0(a4)
80001ec2:	b5f5                	j	80001dae <_ZN4EPOS1S6Thread4exitEi+0x76>
80001ec4:	800057b7          	lui	a5,0x80005
80001ec8:	08c7a883          	lw	a7,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80001ecc:	87c6                	mv	a5,a7
80001ece:	a011                	j	80001ed2 <_ZN4EPOS1S6Thread4exitEi+0x19a>
80001ed0:	87ba                	mv	a5,a4
80001ed2:	43d0                	lw	a2,4(a5)
80001ed4:	4e98                	lw	a4,24(a3)
80001ed6:	00c74463          	blt	a4,a2,80001ede <_ZN4EPOS1S6Thread4exitEi+0x1a6>
80001eda:	47d8                	lw	a4,12(a5)
80001edc:	fb75                	bnez	a4,80001ed0 <_ZN4EPOS1S6Thread4exitEi+0x198>
80001ede:	43d0                	lw	a2,4(a5)
80001ee0:	4e98                	lw	a4,24(a3)
80001ee2:	00c75e63          	bge	a4,a2,80001efe <_ZN4EPOS1S6Thread4exitEi+0x1c6>
80001ee6:	4798                	lw	a4,8(a5)
80001ee8:	cb0d                	beqz	a4,80001f1a <_ZN4EPOS1S6Thread4exitEi+0x1e2>
80001eea:	c74c                	sw	a1,12(a4)
80001eec:	c78c                	sw	a1,8(a5)
80001eee:	ced8                	sw	a4,28(a3)
80001ef0:	d29c                	sw	a5,32(a3)
80001ef2:	0805                	addi	a6,a6,1
80001ef4:	800057b7          	lui	a5,0x80005
80001ef8:	0907a423          	sw	a6,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80001efc:	a889                	j	80001f4e <_ZN4EPOS1S6Thread4exitEi+0x216>
80001efe:	800057b7          	lui	a5,0x80005
80001f02:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001f06:	4798                	lw	a4,8(a5)
80001f08:	c74c                	sw	a1,12(a4)
80001f0a:	ced8                	sw	a4,28(a3)
80001f0c:	0206a023          	sw	zero,32(a3)
80001f10:	c78c                	sw	a1,8(a5)
80001f12:	0805                	addi	a6,a6,1
80001f14:	0107a023          	sw	a6,0(a5)
80001f18:	a81d                	j	80001f4e <_ZN4EPOS1S6Thread4exitEi+0x216>
80001f1a:	0006ae23          	sw	zero,28(a3)
80001f1e:	0316a023          	sw	a7,32(a3)
80001f22:	00b8a423          	sw	a1,8(a7)
80001f26:	800057b7          	lui	a5,0x80005
80001f2a:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001f2e:	c3cc                	sw	a1,4(a5)
80001f30:	0805                	addi	a6,a6,1
80001f32:	0107a023          	sw	a6,0(a5)
80001f36:	a821                	j	80001f4e <_ZN4EPOS1S6Thread4exitEi+0x216>
80001f38:	f14027f3          	csrr	a5,mhartid
80001f3c:	8b8d                	andi	a5,a5,3
80001f3e:	00279713          	slli	a4,a5,0x2
80001f42:	800057b7          	lui	a5,0x80005
80001f46:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001f4a:	97ba                	add	a5,a5,a4
80001f4c:	c7cc                	sw	a1,12(a5)
80001f4e:	00052823          	sw	zero,16(a0)
80001f52:	f14027f3          	csrr	a5,mhartid
80001f56:	8b8d                	andi	a5,a5,3
80001f58:	80005737          	lui	a4,0x80005
80001f5c:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001f60:	078a                	slli	a5,a5,0x2
80001f62:	97ba                	add	a5,a5,a4
80001f64:	47dc                	lw	a5,12(a5)
80001f66:	431c                	lw	a5,0(a4)
80001f68:	e78d                	bnez	a5,80001f92 <_ZN4EPOS1S6Thread4exitEi+0x25a>
80001f6a:	f14027f3          	csrr	a5,mhartid
80001f6e:	8b8d                	andi	a5,a5,3
80001f70:	00279713          	slli	a4,a5,0x2
80001f74:	800057b7          	lui	a5,0x80005
80001f78:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001f7c:	97ba                	add	a5,a5,a4
80001f7e:	47dc                	lw	a5,12(a5)
80001f80:	4605                	li	a2,1
80001f82:	438c                	lw	a1,0(a5)
80001f84:	fffff097          	auipc	ra,0xfffff
80001f88:	356080e7          	jalr	854(ra) # 800012da <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80001f8c:	40b2                	lw	ra,12(sp)
80001f8e:	0141                	addi	sp,sp,16
80001f90:	8082                	ret
80001f92:	f14027f3          	csrr	a5,mhartid
80001f96:	8b8d                	andi	a5,a5,3
80001f98:	80005737          	lui	a4,0x80005
80001f9c:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001fa0:	078a                	slli	a5,a5,0x2
80001fa2:	97ba                	add	a5,a5,a4
80001fa4:	47d4                	lw	a3,12(a5)
80001fa6:	430c                	lw	a1,0(a4)
80001fa8:	eda9                	bnez	a1,80002002 <_ZN4EPOS1S6Thread4exitEi+0x2ca>
80001faa:	0006a423          	sw	zero,8(a3)
80001fae:	0006a623          	sw	zero,12(a3)
80001fb2:	800057b7          	lui	a5,0x80005
80001fb6:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001fba:	c3d4                	sw	a3,4(a5)
80001fbc:	c794                	sw	a3,8(a5)
80001fbe:	4705                	li	a4,1
80001fc0:	c398                	sw	a4,0(a5)
80001fc2:	f14027f3          	csrr	a5,mhartid
80001fc6:	8b8d                	andi	a5,a5,3
80001fc8:	80005737          	lui	a4,0x80005
80001fcc:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80001fd0:	4354                	lw	a3,4(a4)
80001fd2:	4318                	lw	a4,0(a4)
80001fd4:	cb55                	beqz	a4,80002088 <_ZN4EPOS1S6Thread4exitEi+0x350>
80001fd6:	4605                	li	a2,1
80001fd8:	08c70d63          	beq	a4,a2,80002072 <_ZN4EPOS1S6Thread4exitEi+0x33a>
80001fdc:	46cc                	lw	a1,12(a3)
80001fde:	80005637          	lui	a2,0x80005
80001fe2:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80001fe6:	c24c                	sw	a1,4(a2)
80001fe8:	0005a423          	sw	zero,8(a1)
80001fec:	177d                	addi	a4,a4,-1
80001fee:	c218                	sw	a4,0(a2)
80001ff0:	00279713          	slli	a4,a5,0x2
80001ff4:	800057b7          	lui	a5,0x80005
80001ff8:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80001ffc:	97ba                	add	a5,a5,a4
80001ffe:	c7d4                	sw	a3,12(a5)
80002000:	b7ad                	j	80001f6a <_ZN4EPOS1S6Thread4exitEi+0x232>
80002002:	800057b7          	lui	a5,0x80005
80002006:	08c7a803          	lw	a6,140(a5) # 8000508c <__boot_stack__+0xf800508d>
8000200a:	87c2                	mv	a5,a6
8000200c:	a011                	j	80002010 <_ZN4EPOS1S6Thread4exitEi+0x2d8>
8000200e:	87ba                	mv	a5,a4
80002010:	43d0                	lw	a2,4(a5)
80002012:	42d8                	lw	a4,4(a3)
80002014:	00c74463          	blt	a4,a2,8000201c <_ZN4EPOS1S6Thread4exitEi+0x2e4>
80002018:	47d8                	lw	a4,12(a5)
8000201a:	fb75                	bnez	a4,8000200e <_ZN4EPOS1S6Thread4exitEi+0x2d6>
8000201c:	43d0                	lw	a2,4(a5)
8000201e:	42d8                	lw	a4,4(a3)
80002020:	00c75e63          	bge	a4,a2,8000203c <_ZN4EPOS1S6Thread4exitEi+0x304>
80002024:	4798                	lw	a4,8(a5)
80002026:	cb05                	beqz	a4,80002056 <_ZN4EPOS1S6Thread4exitEi+0x31e>
80002028:	c754                	sw	a3,12(a4)
8000202a:	c794                	sw	a3,8(a5)
8000202c:	c698                	sw	a4,8(a3)
8000202e:	c6dc                	sw	a5,12(a3)
80002030:	0585                	addi	a1,a1,1
80002032:	800057b7          	lui	a5,0x80005
80002036:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
8000203a:	b761                	j	80001fc2 <_ZN4EPOS1S6Thread4exitEi+0x28a>
8000203c:	800057b7          	lui	a5,0x80005
80002040:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002044:	4798                	lw	a4,8(a5)
80002046:	c754                	sw	a3,12(a4)
80002048:	c698                	sw	a4,8(a3)
8000204a:	0006a623          	sw	zero,12(a3)
8000204e:	c794                	sw	a3,8(a5)
80002050:	0585                	addi	a1,a1,1
80002052:	c38c                	sw	a1,0(a5)
80002054:	b7bd                	j	80001fc2 <_ZN4EPOS1S6Thread4exitEi+0x28a>
80002056:	0006a423          	sw	zero,8(a3)
8000205a:	0106a623          	sw	a6,12(a3)
8000205e:	00d82423          	sw	a3,8(a6)
80002062:	800057b7          	lui	a5,0x80005
80002066:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000206a:	c3d4                	sw	a3,4(a5)
8000206c:	0585                	addi	a1,a1,1
8000206e:	c38c                	sw	a1,0(a5)
80002070:	bf89                	j	80001fc2 <_ZN4EPOS1S6Thread4exitEi+0x28a>
80002072:	80005737          	lui	a4,0x80005
80002076:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000207a:	00072223          	sw	zero,4(a4)
8000207e:	00072423          	sw	zero,8(a4)
80002082:	00072023          	sw	zero,0(a4)
80002086:	b7ad                	j	80001ff0 <_ZN4EPOS1S6Thread4exitEi+0x2b8>
80002088:	4681                	li	a3,0
8000208a:	b79d                	j	80001ff0 <_ZN4EPOS1S6Thread4exitEi+0x2b8>

8000208c <_ZN4EPOS1S6ThreadD1Ev>:
8000208c:	715d                	addi	sp,sp,-80
8000208e:	c686                	sw	ra,76(sp)
80002090:	c4a2                	sw	s0,72(sp)
80002092:	c2a6                	sw	s1,68(sp)
80002094:	c0ca                	sw	s2,64(sp)
80002096:	842a                	mv	s0,a0
80002098:	4781                	li	a5,0
8000209a:	30479073          	csrw	mie,a5
8000209e:	415c                	lw	a5,4(a0)
800020a0:	451c                	lw	a5,8(a0)
800020a2:	cbb5                	beqz	a5,80002116 <_ZN4EPOS1S6ThreadD1Ev+0x8a>
800020a4:	441c                	lw	a5,8(s0)
800020a6:	4709                	li	a4,2
800020a8:	22e78f63          	beq	a5,a4,800022e6 <_ZN4EPOS1S6ThreadD1Ev+0x25a>
800020ac:	12f76263          	bltu	a4,a5,800021d0 <_ZN4EPOS1S6ThreadD1Ev+0x144>
800020b0:	18078163          	beqz	a5,80002232 <_ZN4EPOS1S6ThreadD1Ev+0x1a6>
800020b4:	f14027f3          	csrr	a5,mhartid
800020b8:	8b8d                	andi	a5,a5,3
800020ba:	80005737          	lui	a4,0x80005
800020be:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800020c2:	078a                	slli	a5,a5,0x2
800020c4:	97ba                	add	a5,a5,a4
800020c6:	47dc                	lw	a5,12(a5)
800020c8:	f14027f3          	csrr	a5,mhartid
800020cc:	8b8d                	andi	a5,a5,3
800020ce:	078a                	slli	a5,a5,0x2
800020d0:	973e                	add	a4,a4,a5
800020d2:	4758                	lw	a4,12(a4)
800020d4:	01440793          	addi	a5,s0,20
800020d8:	16f70363          	beq	a4,a5,8000223e <_ZN4EPOS1S6ThreadD1Ev+0x1b2>
800020dc:	800057b7          	lui	a5,0x80005
800020e0:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
800020e4:	4705                	li	a4,1
800020e6:	1ae78963          	beq	a5,a4,80002298 <_ZN4EPOS1S6ThreadD1Ev+0x20c>
800020ea:	4c54                	lw	a3,28(s0)
800020ec:	1c068163          	beqz	a3,800022ae <_ZN4EPOS1S6ThreadD1Ev+0x222>
800020f0:	5018                	lw	a4,32(s0)
800020f2:	1c070c63          	beqz	a4,800022ca <_ZN4EPOS1S6ThreadD1Ev+0x23e>
800020f6:	c6d8                	sw	a4,12(a3)
800020f8:	4c54                	lw	a3,28(s0)
800020fa:	c714                	sw	a3,8(a4)
800020fc:	17fd                	addi	a5,a5,-1
800020fe:	80005737          	lui	a4,0x80005
80002102:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
80002106:	800057b7          	lui	a5,0x80005
8000210a:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
8000210e:	4398                	lw	a4,0(a5)
80002110:	177d                	addi	a4,a4,-1
80002112:	c398                	sw	a4,0(a5)
80002114:	a16d                	j	800025be <_ZN4EPOS1S6ThreadD1Ev+0x532>
80002116:	80005937          	lui	s2,0x80005
8000211a:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
8000211e:	4785                	li	a5,1
80002120:	00f48223          	sb	a5,4(s1)
80002124:	80003537          	lui	a0,0x80003
80002128:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
8000212c:	fffff097          	auipc	ra,0xfffff
80002130:	e02080e7          	jalr	-510(ra) # 80000f2e <_print>
80002134:	80004537          	lui	a0,0x80004
80002138:	92050513          	addi	a0,a0,-1760 # 80003920 <__boot_stack__+0xf8003921>
8000213c:	fffff097          	auipc	ra,0xfffff
80002140:	df2080e7          	jalr	-526(ra) # 80000f2e <_print>
80002144:	80003537          	lui	a0,0x80003
80002148:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
8000214c:	fffff097          	auipc	ra,0xfffff
80002150:	de2080e7          	jalr	-542(ra) # 80000f2e <_print>
80002154:	80004537          	lui	a0,0x80004
80002158:	93450513          	addi	a0,a0,-1740 # 80003934 <__boot_stack__+0xf8003935>
8000215c:	fffff097          	auipc	ra,0xfffff
80002160:	dd2080e7          	jalr	-558(ra) # 80000f2e <_print>
80002164:	80004537          	lui	a0,0x80004
80002168:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
8000216c:	fffff097          	auipc	ra,0xfffff
80002170:	dc2080e7          	jalr	-574(ra) # 80000f2e <_print>
80002174:	80004537          	lui	a0,0x80004
80002178:	82c50513          	addi	a0,a0,-2004 # 8000382c <__boot_stack__+0xf800382d>
8000217c:	fffff097          	auipc	ra,0xfffff
80002180:	db2080e7          	jalr	-590(ra) # 80000f2e <_print>
80002184:	80004537          	lui	a0,0x80004
80002188:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
8000218c:	fffff097          	auipc	ra,0xfffff
80002190:	da2080e7          	jalr	-606(ra) # 80000f2e <_print>
80002194:	4681                	li	a3,0
80002196:	860a                	mv	a2,sp
80002198:	04200593          	li	a1,66
8000219c:	03490513          	addi	a0,s2,52
800021a0:	fffff097          	auipc	ra,0xfffff
800021a4:	ea6080e7          	jalr	-346(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800021a8:	009c                	addi	a5,sp,64
800021aa:	953e                	add	a0,a0,a5
800021ac:	fc050023          	sb	zero,-64(a0)
800021b0:	850a                	mv	a0,sp
800021b2:	fffff097          	auipc	ra,0xfffff
800021b6:	d7c080e7          	jalr	-644(ra) # 80000f2e <_print>
800021ba:	80003537          	lui	a0,0x80003
800021be:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
800021c2:	fffff097          	auipc	ra,0xfffff
800021c6:	d6c080e7          	jalr	-660(ra) # 80000f2e <_print>
800021ca:	47a9                	li	a5,10
800021cc:	c09c                	sw	a5,0(s1)
800021ce:	bdd9                	j	800020a4 <_ZN4EPOS1S6ThreadD1Ev+0x18>
800021d0:	470d                	li	a4,3
800021d2:	3ee79663          	bne	a5,a4,800025be <_ZN4EPOS1S6ThreadD1Ev+0x532>
800021d6:	4454                	lw	a3,12(s0)
800021d8:	42d0                	lw	a2,4(a3)
800021da:	c619                	beqz	a2,800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800021dc:	87b2                	mv	a5,a2
800021de:	4398                	lw	a4,0(a5)
800021e0:	4ae40963          	beq	s0,a4,80002692 <_ZN4EPOS1S6ThreadD1Ev+0x606>
800021e4:	47dc                	lw	a5,12(a5)
800021e6:	ffe5                	bnez	a5,800021de <_ZN4EPOS1S6ThreadD1Ev+0x152>
800021e8:	f14027f3          	csrr	a5,mhartid
800021ec:	8b8d                	andi	a5,a5,3
800021ee:	80005737          	lui	a4,0x80005
800021f2:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800021f6:	078a                	slli	a5,a5,0x2
800021f8:	97ba                	add	a5,a5,a4
800021fa:	47dc                	lw	a5,12(a5)
800021fc:	01440613          	addi	a2,s0,20
80002200:	f14027f3          	csrr	a5,mhartid
80002204:	8b8d                	andi	a5,a5,3
80002206:	078a                	slli	a5,a5,0x2
80002208:	973e                	add	a4,a4,a5
8000220a:	475c                	lw	a5,12(a4)
8000220c:	34078263          	beqz	a5,80002550 <_ZN4EPOS1S6ThreadD1Ev+0x4c4>
80002210:	800057b7          	lui	a5,0x80005
80002214:	0887a583          	lw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80002218:	2c059663          	bnez	a1,800024e4 <_ZN4EPOS1S6ThreadD1Ev+0x458>
8000221c:	00042e23          	sw	zero,28(s0)
80002220:	02042023          	sw	zero,32(s0)
80002224:	08878793          	addi	a5,a5,136
80002228:	c3d0                	sw	a2,4(a5)
8000222a:	c790                	sw	a2,8(a5)
8000222c:	4705                	li	a4,1
8000222e:	c398                	sw	a4,0(a5)
80002230:	ae1d                	j	80002566 <_ZN4EPOS1S6ThreadD1Ev+0x4da>
80002232:	557d                	li	a0,-1
80002234:	00000097          	auipc	ra,0x0
80002238:	b04080e7          	jalr	-1276(ra) # 80001d38 <_ZN4EPOS1S6Thread4exitEi>
8000223c:	a649                	j	800025be <_ZN4EPOS1S6ThreadD1Ev+0x532>
8000223e:	f14027f3          	csrr	a5,mhartid
80002242:	8b8d                	andi	a5,a5,3
80002244:	80005737          	lui	a4,0x80005
80002248:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000224c:	4354                	lw	a3,4(a4)
8000224e:	4318                	lw	a4,0(a4)
80002250:	c331                	beqz	a4,80002294 <_ZN4EPOS1S6ThreadD1Ev+0x208>
80002252:	4605                	li	a2,1
80002254:	02c70563          	beq	a4,a2,8000227e <_ZN4EPOS1S6ThreadD1Ev+0x1f2>
80002258:	46cc                	lw	a1,12(a3)
8000225a:	80005637          	lui	a2,0x80005
8000225e:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80002262:	c24c                	sw	a1,4(a2)
80002264:	0005a423          	sw	zero,8(a1)
80002268:	177d                	addi	a4,a4,-1
8000226a:	c218                	sw	a4,0(a2)
8000226c:	00279713          	slli	a4,a5,0x2
80002270:	800057b7          	lui	a5,0x80005
80002274:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002278:	97ba                	add	a5,a5,a4
8000227a:	c7d4                	sw	a3,12(a5)
8000227c:	b569                	j	80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
8000227e:	80005737          	lui	a4,0x80005
80002282:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002286:	00072223          	sw	zero,4(a4)
8000228a:	00072423          	sw	zero,8(a4)
8000228e:	00072023          	sw	zero,0(a4)
80002292:	bfe9                	j	8000226c <_ZN4EPOS1S6ThreadD1Ev+0x1e0>
80002294:	4681                	li	a3,0
80002296:	bfd9                	j	8000226c <_ZN4EPOS1S6ThreadD1Ev+0x1e0>
80002298:	800057b7          	lui	a5,0x80005
8000229c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800022a0:	0007a223          	sw	zero,4(a5)
800022a4:	0007a423          	sw	zero,8(a5)
800022a8:	0007a023          	sw	zero,0(a5)
800022ac:	bda9                	j	80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
800022ae:	e4078ce3          	beqz	a5,80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
800022b2:	80005737          	lui	a4,0x80005
800022b6:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800022ba:	4354                	lw	a3,4(a4)
800022bc:	46d4                	lw	a3,12(a3)
800022be:	c354                	sw	a3,4(a4)
800022c0:	0006a423          	sw	zero,8(a3)
800022c4:	17fd                	addi	a5,a5,-1
800022c6:	c31c                	sw	a5,0(a4)
800022c8:	bd3d                	j	80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
800022ca:	e2078ee3          	beqz	a5,80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
800022ce:	80005737          	lui	a4,0x80005
800022d2:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800022d6:	4714                	lw	a3,8(a4)
800022d8:	4694                	lw	a3,8(a3)
800022da:	c714                	sw	a3,8(a4)
800022dc:	0006a623          	sw	zero,12(a3)
800022e0:	17fd                	addi	a5,a5,-1
800022e2:	c31c                	sw	a5,0(a4)
800022e4:	b50d                	j	80002106 <_ZN4EPOS1S6ThreadD1Ev+0x7a>
800022e6:	f14027f3          	csrr	a5,mhartid
800022ea:	8b8d                	andi	a5,a5,3
800022ec:	80005737          	lui	a4,0x80005
800022f0:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800022f4:	078a                	slli	a5,a5,0x2
800022f6:	97ba                	add	a5,a5,a4
800022f8:	47dc                	lw	a5,12(a5)
800022fa:	01440613          	addi	a2,s0,20
800022fe:	f14027f3          	csrr	a5,mhartid
80002302:	8b8d                	andi	a5,a5,3
80002304:	078a                	slli	a5,a5,0x2
80002306:	973e                	add	a4,a4,a5
80002308:	475c                	lw	a5,12(a4)
8000230a:	c7d9                	beqz	a5,80002398 <_ZN4EPOS1S6ThreadD1Ev+0x30c>
8000230c:	800057b7          	lui	a5,0x80005
80002310:	0887a583          	lw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80002314:	ed81                	bnez	a1,8000232c <_ZN4EPOS1S6ThreadD1Ev+0x2a0>
80002316:	00042e23          	sw	zero,28(s0)
8000231a:	02042023          	sw	zero,32(s0)
8000231e:	08878793          	addi	a5,a5,136
80002322:	c3d0                	sw	a2,4(a5)
80002324:	c790                	sw	a2,8(a5)
80002326:	4705                	li	a4,1
80002328:	c398                	sw	a4,0(a5)
8000232a:	a051                	j	800023ae <_ZN4EPOS1S6ThreadD1Ev+0x322>
8000232c:	800057b7          	lui	a5,0x80005
80002330:	08c7a503          	lw	a0,140(a5) # 8000508c <__boot_stack__+0xf800508d>
80002334:	87aa                	mv	a5,a0
80002336:	a011                	j	8000233a <_ZN4EPOS1S6ThreadD1Ev+0x2ae>
80002338:	87ba                	mv	a5,a4
8000233a:	43d4                	lw	a3,4(a5)
8000233c:	4c18                	lw	a4,24(s0)
8000233e:	00d74463          	blt	a4,a3,80002346 <_ZN4EPOS1S6ThreadD1Ev+0x2ba>
80002342:	47d8                	lw	a4,12(a5)
80002344:	fb75                	bnez	a4,80002338 <_ZN4EPOS1S6ThreadD1Ev+0x2ac>
80002346:	43d4                	lw	a3,4(a5)
80002348:	4c18                	lw	a4,24(s0)
8000234a:	00d75e63          	bge	a4,a3,80002366 <_ZN4EPOS1S6ThreadD1Ev+0x2da>
8000234e:	4798                	lw	a4,8(a5)
80002350:	cb05                	beqz	a4,80002380 <_ZN4EPOS1S6ThreadD1Ev+0x2f4>
80002352:	c750                	sw	a2,12(a4)
80002354:	c790                	sw	a2,8(a5)
80002356:	cc58                	sw	a4,28(s0)
80002358:	d01c                	sw	a5,32(s0)
8000235a:	0585                	addi	a1,a1,1
8000235c:	800057b7          	lui	a5,0x80005
80002360:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80002364:	a0a9                	j	800023ae <_ZN4EPOS1S6ThreadD1Ev+0x322>
80002366:	800057b7          	lui	a5,0x80005
8000236a:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000236e:	4798                	lw	a4,8(a5)
80002370:	c750                	sw	a2,12(a4)
80002372:	cc58                	sw	a4,28(s0)
80002374:	02042023          	sw	zero,32(s0)
80002378:	c790                	sw	a2,8(a5)
8000237a:	0585                	addi	a1,a1,1
8000237c:	c38c                	sw	a1,0(a5)
8000237e:	a805                	j	800023ae <_ZN4EPOS1S6ThreadD1Ev+0x322>
80002380:	00042e23          	sw	zero,28(s0)
80002384:	d008                	sw	a0,32(s0)
80002386:	c510                	sw	a2,8(a0)
80002388:	800057b7          	lui	a5,0x80005
8000238c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002390:	c3d0                	sw	a2,4(a5)
80002392:	0585                	addi	a1,a1,1
80002394:	c38c                	sw	a1,0(a5)
80002396:	a821                	j	800023ae <_ZN4EPOS1S6ThreadD1Ev+0x322>
80002398:	f14027f3          	csrr	a5,mhartid
8000239c:	8b8d                	andi	a5,a5,3
8000239e:	00279713          	slli	a4,a5,0x2
800023a2:	800057b7          	lui	a5,0x80005
800023a6:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800023aa:	97ba                	add	a5,a5,a4
800023ac:	c7d0                	sw	a2,12(a5)
800023ae:	f14027f3          	csrr	a5,mhartid
800023b2:	8b8d                	andi	a5,a5,3
800023b4:	80005737          	lui	a4,0x80005
800023b8:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800023bc:	078a                	slli	a5,a5,0x2
800023be:	97ba                	add	a5,a5,a4
800023c0:	47dc                	lw	a5,12(a5)
800023c2:	f14027f3          	csrr	a5,mhartid
800023c6:	8b8d                	andi	a5,a5,3
800023c8:	078a                	slli	a5,a5,0x2
800023ca:	973e                	add	a4,a4,a5
800023cc:	475c                	lw	a5,12(a4)
800023ce:	02f60d63          	beq	a2,a5,80002408 <_ZN4EPOS1S6ThreadD1Ev+0x37c>
800023d2:	800057b7          	lui	a5,0x80005
800023d6:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
800023da:	4705                	li	a4,1
800023dc:	08e78363          	beq	a5,a4,80002462 <_ZN4EPOS1S6ThreadD1Ev+0x3d6>
800023e0:	4c54                	lw	a3,28(s0)
800023e2:	cad9                	beqz	a3,80002478 <_ZN4EPOS1S6ThreadD1Ev+0x3ec>
800023e4:	5018                	lw	a4,32(s0)
800023e6:	c755                	beqz	a4,80002492 <_ZN4EPOS1S6ThreadD1Ev+0x406>
800023e8:	c6d8                	sw	a4,12(a3)
800023ea:	4c54                	lw	a3,28(s0)
800023ec:	c714                	sw	a3,8(a4)
800023ee:	17fd                	addi	a5,a5,-1
800023f0:	80005737          	lui	a4,0x80005
800023f4:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
800023f8:	800057b7          	lui	a5,0x80005
800023fc:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
80002400:	4398                	lw	a4,0(a5)
80002402:	177d                	addi	a4,a4,-1
80002404:	c398                	sw	a4,0(a5)
80002406:	aa65                	j	800025be <_ZN4EPOS1S6ThreadD1Ev+0x532>
80002408:	f14027f3          	csrr	a5,mhartid
8000240c:	8b8d                	andi	a5,a5,3
8000240e:	80005737          	lui	a4,0x80005
80002412:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002416:	4354                	lw	a3,4(a4)
80002418:	4318                	lw	a4,0(a4)
8000241a:	c331                	beqz	a4,8000245e <_ZN4EPOS1S6ThreadD1Ev+0x3d2>
8000241c:	4605                	li	a2,1
8000241e:	02c70563          	beq	a4,a2,80002448 <_ZN4EPOS1S6ThreadD1Ev+0x3bc>
80002422:	46cc                	lw	a1,12(a3)
80002424:	80005637          	lui	a2,0x80005
80002428:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
8000242c:	c24c                	sw	a1,4(a2)
8000242e:	0005a423          	sw	zero,8(a1)
80002432:	177d                	addi	a4,a4,-1
80002434:	c218                	sw	a4,0(a2)
80002436:	00279713          	slli	a4,a5,0x2
8000243a:	800057b7          	lui	a5,0x80005
8000243e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002442:	97ba                	add	a5,a5,a4
80002444:	c7d4                	sw	a3,12(a5)
80002446:	bf4d                	j	800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
80002448:	80005737          	lui	a4,0x80005
8000244c:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002450:	00072223          	sw	zero,4(a4)
80002454:	00072423          	sw	zero,8(a4)
80002458:	00072023          	sw	zero,0(a4)
8000245c:	bfe9                	j	80002436 <_ZN4EPOS1S6ThreadD1Ev+0x3aa>
8000245e:	4681                	li	a3,0
80002460:	bfd9                	j	80002436 <_ZN4EPOS1S6ThreadD1Ev+0x3aa>
80002462:	800057b7          	lui	a5,0x80005
80002466:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000246a:	0007a223          	sw	zero,4(a5)
8000246e:	0007a423          	sw	zero,8(a5)
80002472:	0007a023          	sw	zero,0(a5)
80002476:	b749                	j	800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
80002478:	d3c1                	beqz	a5,800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
8000247a:	80005737          	lui	a4,0x80005
8000247e:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002482:	4354                	lw	a3,4(a4)
80002484:	46d4                	lw	a3,12(a3)
80002486:	c354                	sw	a3,4(a4)
80002488:	0006a423          	sw	zero,8(a3)
8000248c:	17fd                	addi	a5,a5,-1
8000248e:	c31c                	sw	a5,0(a4)
80002490:	b7a5                	j	800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
80002492:	d3bd                	beqz	a5,800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
80002494:	80005737          	lui	a4,0x80005
80002498:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
8000249c:	4714                	lw	a3,8(a4)
8000249e:	4694                	lw	a3,8(a3)
800024a0:	c714                	sw	a3,8(a4)
800024a2:	0006a623          	sw	zero,12(a3)
800024a6:	17fd                	addi	a5,a5,-1
800024a8:	c31c                	sw	a5,0(a4)
800024aa:	b7b9                	j	800023f8 <_ZN4EPOS1S6ThreadD1Ev+0x36c>
800024ac:	0006a223          	sw	zero,4(a3)
800024b0:	0006a423          	sw	zero,8(a3)
800024b4:	0006a023          	sw	zero,0(a3)
800024b8:	bb05                	j	800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800024ba:	d20707e3          	beqz	a4,800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800024be:	465c                	lw	a5,12(a2)
800024c0:	c2dc                	sw	a5,4(a3)
800024c2:	0007a423          	sw	zero,8(a5)
800024c6:	429c                	lw	a5,0(a3)
800024c8:	17fd                	addi	a5,a5,-1
800024ca:	c29c                	sw	a5,0(a3)
800024cc:	bb31                	j	800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800024ce:	d0070de3          	beqz	a4,800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800024d2:	469c                	lw	a5,8(a3)
800024d4:	479c                	lw	a5,8(a5)
800024d6:	c69c                	sw	a5,8(a3)
800024d8:	0007a623          	sw	zero,12(a5)
800024dc:	429c                	lw	a5,0(a3)
800024de:	17fd                	addi	a5,a5,-1
800024e0:	c29c                	sw	a5,0(a3)
800024e2:	b319                	j	800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>
800024e4:	800057b7          	lui	a5,0x80005
800024e8:	08c7a503          	lw	a0,140(a5) # 8000508c <__boot_stack__+0xf800508d>
800024ec:	87aa                	mv	a5,a0
800024ee:	a011                	j	800024f2 <_ZN4EPOS1S6ThreadD1Ev+0x466>
800024f0:	87ba                	mv	a5,a4
800024f2:	43d4                	lw	a3,4(a5)
800024f4:	4c18                	lw	a4,24(s0)
800024f6:	00d74463          	blt	a4,a3,800024fe <_ZN4EPOS1S6ThreadD1Ev+0x472>
800024fa:	47d8                	lw	a4,12(a5)
800024fc:	fb75                	bnez	a4,800024f0 <_ZN4EPOS1S6ThreadD1Ev+0x464>
800024fe:	43d4                	lw	a3,4(a5)
80002500:	4c18                	lw	a4,24(s0)
80002502:	00d75e63          	bge	a4,a3,8000251e <_ZN4EPOS1S6ThreadD1Ev+0x492>
80002506:	4798                	lw	a4,8(a5)
80002508:	cb05                	beqz	a4,80002538 <_ZN4EPOS1S6ThreadD1Ev+0x4ac>
8000250a:	c750                	sw	a2,12(a4)
8000250c:	c790                	sw	a2,8(a5)
8000250e:	cc58                	sw	a4,28(s0)
80002510:	d01c                	sw	a5,32(s0)
80002512:	0585                	addi	a1,a1,1
80002514:	800057b7          	lui	a5,0x80005
80002518:	08b7a423          	sw	a1,136(a5) # 80005088 <__boot_stack__+0xf8005089>
8000251c:	a0a9                	j	80002566 <_ZN4EPOS1S6ThreadD1Ev+0x4da>
8000251e:	800057b7          	lui	a5,0x80005
80002522:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002526:	4798                	lw	a4,8(a5)
80002528:	c750                	sw	a2,12(a4)
8000252a:	cc58                	sw	a4,28(s0)
8000252c:	02042023          	sw	zero,32(s0)
80002530:	c790                	sw	a2,8(a5)
80002532:	0585                	addi	a1,a1,1
80002534:	c38c                	sw	a1,0(a5)
80002536:	a805                	j	80002566 <_ZN4EPOS1S6ThreadD1Ev+0x4da>
80002538:	00042e23          	sw	zero,28(s0)
8000253c:	d008                	sw	a0,32(s0)
8000253e:	c510                	sw	a2,8(a0)
80002540:	800057b7          	lui	a5,0x80005
80002544:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002548:	c3d0                	sw	a2,4(a5)
8000254a:	0585                	addi	a1,a1,1
8000254c:	c38c                	sw	a1,0(a5)
8000254e:	a821                	j	80002566 <_ZN4EPOS1S6ThreadD1Ev+0x4da>
80002550:	f14027f3          	csrr	a5,mhartid
80002554:	8b8d                	andi	a5,a5,3
80002556:	00279713          	slli	a4,a5,0x2
8000255a:	800057b7          	lui	a5,0x80005
8000255e:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002562:	97ba                	add	a5,a5,a4
80002564:	c7d0                	sw	a2,12(a5)
80002566:	f14027f3          	csrr	a5,mhartid
8000256a:	8b8d                	andi	a5,a5,3
8000256c:	80005737          	lui	a4,0x80005
80002570:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002574:	078a                	slli	a5,a5,0x2
80002576:	97ba                	add	a5,a5,a4
80002578:	47dc                	lw	a5,12(a5)
8000257a:	f14027f3          	csrr	a5,mhartid
8000257e:	8b8d                	andi	a5,a5,3
80002580:	078a                	slli	a5,a5,0x2
80002582:	973e                	add	a4,a4,a5
80002584:	475c                	lw	a5,12(a4)
80002586:	06f60463          	beq	a2,a5,800025ee <_ZN4EPOS1S6ThreadD1Ev+0x562>
8000258a:	800057b7          	lui	a5,0x80005
8000258e:	0887a783          	lw	a5,136(a5) # 80005088 <__boot_stack__+0xf8005089>
80002592:	4705                	li	a4,1
80002594:	0ae78a63          	beq	a5,a4,80002648 <_ZN4EPOS1S6ThreadD1Ev+0x5bc>
80002598:	4c54                	lw	a3,28(s0)
8000259a:	c2f1                	beqz	a3,8000265e <_ZN4EPOS1S6ThreadD1Ev+0x5d2>
8000259c:	5018                	lw	a4,32(s0)
8000259e:	cf69                	beqz	a4,80002678 <_ZN4EPOS1S6ThreadD1Ev+0x5ec>
800025a0:	c6d8                	sw	a4,12(a3)
800025a2:	4c54                	lw	a3,28(s0)
800025a4:	c714                	sw	a3,8(a4)
800025a6:	17fd                	addi	a5,a5,-1
800025a8:	80005737          	lui	a4,0x80005
800025ac:	08f72423          	sw	a5,136(a4) # 80005088 <__boot_stack__+0xf8005089>
800025b0:	800057b7          	lui	a5,0x80005
800025b4:	05878793          	addi	a5,a5,88 # 80005058 <__boot_stack__+0xf8005059>
800025b8:	4398                	lw	a4,0(a5)
800025ba:	177d                	addi	a4,a4,-1
800025bc:	c398                	sw	a4,0(a5)
800025be:	481c                	lw	a5,16(s0)
800025c0:	c791                	beqz	a5,800025cc <_ZN4EPOS1S6ThreadD1Ev+0x540>
800025c2:	4808                	lw	a0,16(s0)
800025c4:	fffff097          	auipc	ra,0xfffff
800025c8:	102080e7          	jalr	258(ra) # 800016c6 <_ZN4EPOS1S6Thread6resumeEv>
800025cc:	08800793          	li	a5,136
800025d0:	30479073          	csrw	mie,a5
800025d4:	4008                	lw	a0,0(s0)
800025d6:	c511                	beqz	a0,800025e2 <_ZN4EPOS1S6ThreadD1Ev+0x556>
800025d8:	4585                	li	a1,1
800025da:	fffff097          	auipc	ra,0xfffff
800025de:	a1c080e7          	jalr	-1508(ra) # 80000ff6 <_ZdlPvj>
800025e2:	40b6                	lw	ra,76(sp)
800025e4:	4426                	lw	s0,72(sp)
800025e6:	4496                	lw	s1,68(sp)
800025e8:	4906                	lw	s2,64(sp)
800025ea:	6161                	addi	sp,sp,80
800025ec:	8082                	ret
800025ee:	f14027f3          	csrr	a5,mhartid
800025f2:	8b8d                	andi	a5,a5,3
800025f4:	80005737          	lui	a4,0x80005
800025f8:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
800025fc:	4354                	lw	a3,4(a4)
800025fe:	4318                	lw	a4,0(a4)
80002600:	c331                	beqz	a4,80002644 <_ZN4EPOS1S6ThreadD1Ev+0x5b8>
80002602:	4605                	li	a2,1
80002604:	02c70563          	beq	a4,a2,8000262e <_ZN4EPOS1S6ThreadD1Ev+0x5a2>
80002608:	46cc                	lw	a1,12(a3)
8000260a:	80005637          	lui	a2,0x80005
8000260e:	08860613          	addi	a2,a2,136 # 80005088 <__boot_stack__+0xf8005089>
80002612:	c24c                	sw	a1,4(a2)
80002614:	0005a423          	sw	zero,8(a1)
80002618:	177d                	addi	a4,a4,-1
8000261a:	c218                	sw	a4,0(a2)
8000261c:	00279713          	slli	a4,a5,0x2
80002620:	800057b7          	lui	a5,0x80005
80002624:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002628:	97ba                	add	a5,a5,a4
8000262a:	c7d4                	sw	a3,12(a5)
8000262c:	b751                	j	800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
8000262e:	80005737          	lui	a4,0x80005
80002632:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002636:	00072223          	sw	zero,4(a4)
8000263a:	00072423          	sw	zero,8(a4)
8000263e:	00072023          	sw	zero,0(a4)
80002642:	bfe9                	j	8000261c <_ZN4EPOS1S6ThreadD1Ev+0x590>
80002644:	4681                	li	a3,0
80002646:	bfd9                	j	8000261c <_ZN4EPOS1S6ThreadD1Ev+0x590>
80002648:	800057b7          	lui	a5,0x80005
8000264c:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
80002650:	0007a223          	sw	zero,4(a5)
80002654:	0007a423          	sw	zero,8(a5)
80002658:	0007a023          	sw	zero,0(a5)
8000265c:	bf91                	j	800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
8000265e:	dba9                	beqz	a5,800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
80002660:	80005737          	lui	a4,0x80005
80002664:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002668:	4354                	lw	a3,4(a4)
8000266a:	46d4                	lw	a3,12(a3)
8000266c:	c354                	sw	a3,4(a4)
8000266e:	0006a423          	sw	zero,8(a3)
80002672:	17fd                	addi	a5,a5,-1
80002674:	c31c                	sw	a5,0(a4)
80002676:	bf2d                	j	800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
80002678:	df85                	beqz	a5,800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
8000267a:	80005737          	lui	a4,0x80005
8000267e:	08870713          	addi	a4,a4,136 # 80005088 <__boot_stack__+0xf8005089>
80002682:	4714                	lw	a3,8(a4)
80002684:	4694                	lw	a3,8(a3)
80002686:	c714                	sw	a3,8(a4)
80002688:	0006a623          	sw	zero,12(a3)
8000268c:	17fd                	addi	a5,a5,-1
8000268e:	c31c                	sw	a5,0(a4)
80002690:	b705                	j	800025b0 <_ZN4EPOS1S6ThreadD1Ev+0x524>
80002692:	4298                	lw	a4,0(a3)
80002694:	4585                	li	a1,1
80002696:	e0b70be3          	beq	a4,a1,800024ac <_ZN4EPOS1S6ThreadD1Ev+0x420>
8000269a:	478c                	lw	a1,8(a5)
8000269c:	e0058fe3          	beqz	a1,800024ba <_ZN4EPOS1S6ThreadD1Ev+0x42e>
800026a0:	47d0                	lw	a2,12(a5)
800026a2:	e20606e3          	beqz	a2,800024ce <_ZN4EPOS1S6ThreadD1Ev+0x442>
800026a6:	c5d0                	sw	a2,12(a1)
800026a8:	479c                	lw	a5,8(a5)
800026aa:	c61c                	sw	a5,8(a2)
800026ac:	429c                	lw	a5,0(a3)
800026ae:	17fd                	addi	a5,a5,-1
800026b0:	c29c                	sw	a5,0(a3)
800026b2:	be1d                	j	800021e8 <_ZN4EPOS1S6ThreadD1Ev+0x15c>

800026b4 <_ZN4EPOS1S6Thread4idleEv>:
800026b4:	1141                	addi	sp,sp,-16
800026b6:	c606                	sw	ra,12(sp)
800026b8:	c422                	sw	s0,8(sp)
800026ba:	c226                	sw	s1,4(sp)
800026bc:	c04a                	sw	s2,0(sp)
800026be:	f14027f3          	csrr	a5,mhartid
800026c2:	8b8d                	andi	a5,a5,3
800026c4:	00279713          	slli	a4,a5,0x2
800026c8:	800057b7          	lui	a5,0x80005
800026cc:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
800026d0:	97ba                	add	a5,a5,a4
800026d2:	47dc                	lw	a5,12(a5)
800026d4:	800057b7          	lui	a5,0x80005
800026d8:	0587a703          	lw	a4,88(a5) # 80005058 <__boot_stack__+0xf8005059>
800026dc:	4791                	li	a5,4
800026de:	02e7f063          	bgeu	a5,a4,800026fe <_ZN4EPOS1S6Thread4idleEv+0x4a>
800026e2:	08800613          	li	a2,136
800026e6:	800056b7          	lui	a3,0x80005
800026ea:	4711                	li	a4,4
800026ec:	30461073          	csrw	mie,a2
800026f0:	10500073          	wfi
800026f4:	05868793          	addi	a5,a3,88 # 80005058 <__boot_stack__+0xf8005059>
800026f8:	439c                	lw	a5,0(a5)
800026fa:	fef769e3          	bltu	a4,a5,800026ec <_ZN4EPOS1S6Thread4idleEv+0x38>
800026fe:	4781                	li	a5,0
80002700:	30479073          	csrw	mie,a5
80002704:	80004537          	lui	a0,0x80004
80002708:	95050513          	addi	a0,a0,-1712 # 80003950 <__boot_stack__+0xf8003951>
8000270c:	fffff097          	auipc	ra,0xfffff
80002710:	822080e7          	jalr	-2014(ra) # 80000f2e <_print>
80002714:	80003937          	lui	s2,0x80003
80002718:	6e890513          	addi	a0,s2,1768 # 800036e8 <__boot_stack__+0xf80036e9>
8000271c:	fffff097          	auipc	ra,0xfffff
80002720:	812080e7          	jalr	-2030(ra) # 80000f2e <_print>
80002724:	80005437          	lui	s0,0x80005
80002728:	03440413          	addi	s0,s0,52 # 80005034 <__boot_stack__+0xf8005035>
8000272c:	44a9                	li	s1,10
8000272e:	c004                	sw	s1,0(s0)
80002730:	80004537          	lui	a0,0x80004
80002734:	96c50513          	addi	a0,a0,-1684 # 8000396c <__boot_stack__+0xf800396d>
80002738:	ffffe097          	auipc	ra,0xffffe
8000273c:	7f6080e7          	jalr	2038(ra) # 80000f2e <_print>
80002740:	6e890513          	addi	a0,s2,1768
80002744:	ffffe097          	auipc	ra,0xffffe
80002748:	7ea080e7          	jalr	2026(ra) # 80000f2e <_print>
8000274c:	c004                	sw	s1,0(s0)
8000274e:	10500073          	wfi
80002752:	a001                	j	80002752 <_ZN4EPOS1S6Thread4idleEv+0x9e>

80002754 <_GLOBAL__sub_I__ZN4EPOS1S1U11This_Thread12_not_bootingE>:
80002754:	800057b7          	lui	a5,0x80005
80002758:	08878793          	addi	a5,a5,136 # 80005088 <__boot_stack__+0xf8005089>
8000275c:	0007a023          	sw	zero,0(a5)
80002760:	0007a223          	sw	zero,4(a5)
80002764:	0007a423          	sw	zero,8(a5)
80002768:	0007a623          	sw	zero,12(a5)
8000276c:	0007a823          	sw	zero,16(a5)
80002770:	0007aa23          	sw	zero,20(a5)
80002774:	0007ac23          	sw	zero,24(a5)
80002778:	8082                	ret

8000277a <_ZN4EPOS1S3CPU4initEv>:
8000277a:	f14027f3          	csrr	a5,mhartid
8000277e:	8b8d                	andi	a5,a5,3
80002780:	c391                	beqz	a5,80002784 <_ZN4EPOS1S3CPU4initEv+0xa>
80002782:	8082                	ret
80002784:	1141                	addi	sp,sp,-16
80002786:	c606                	sw	ra,12(sp)
80002788:	00000097          	auipc	ra,0x0
8000278c:	128080e7          	jalr	296(ra) # 800028b0 <_ZN4EPOS1S3MMU4initEv>
80002790:	40b2                	lw	ra,12(sp)
80002792:	0141                	addi	sp,sp,16
80002794:	8082                	ret

80002796 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>:
80002796:	455c                	lw	a5,12(a0)
80002798:	41d8                	lw	a4,4(a1)
8000279a:	97ba                	add	a5,a5,a4
8000279c:	c55c                	sw	a5,12(a0)
8000279e:	0006a023          	sw	zero,0(a3)
800027a2:	00062023          	sw	zero,0(a2)
800027a6:	0005a303          	lw	t1,0(a1)
800027aa:	0045a883          	lw	a7,4(a1)
800027ae:	088a                	slli	a7,a7,0x2
800027b0:	989a                	add	a7,a7,t1
800027b2:	415c                	lw	a5,4(a0)
800027b4:	c3dd                	beqz	a5,8000285a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc4>
800027b6:	873e                	mv	a4,a5
800027b8:	00072803          	lw	a6,0(a4)
800027bc:	01088463          	beq	a7,a6,800027c4 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
800027c0:	4758                	lw	a4,12(a4)
800027c2:	fb7d                	bnez	a4,800027b8 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x22>
800027c4:	0047a803          	lw	a6,4(a5)
800027c8:	00281893          	slli	a7,a6,0x2
800027cc:	0007a803          	lw	a6,0(a5)
800027d0:	9846                	add	a6,a6,a7
800027d2:	09030663          	beq	t1,a6,8000285e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc8>
800027d6:	47dc                	lw	a5,12(a5)
800027d8:	f7f5                	bnez	a5,800027c4 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
800027da:	411c                	lw	a5,0(a0)
800027dc:	cf81                	beqz	a5,800027f4 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x5e>
800027de:	451c                	lw	a5,8(a0)
800027e0:	c7cc                	sw	a1,12(a5)
800027e2:	451c                	lw	a5,8(a0)
800027e4:	c59c                	sw	a5,8(a1)
800027e6:	0005a623          	sw	zero,12(a1)
800027ea:	c50c                	sw	a1,8(a0)
800027ec:	411c                	lw	a5,0(a0)
800027ee:	0785                	addi	a5,a5,1
800027f0:	c11c                	sw	a5,0(a0)
800027f2:	a811                	j	80002806 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x70>
800027f4:	0005a423          	sw	zero,8(a1)
800027f8:	0005a623          	sw	zero,12(a1)
800027fc:	c14c                	sw	a1,4(a0)
800027fe:	c50c                	sw	a1,8(a0)
80002800:	411c                	lw	a5,0(a0)
80002802:	0785                	addi	a5,a5,1
80002804:	c11c                	sw	a5,0(a0)
80002806:	4781                	li	a5,0
80002808:	ef21                	bnez	a4,80002860 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xca>
8000280a:	8082                	ret
8000280c:	00052223          	sw	zero,4(a0)
80002810:	00052423          	sw	zero,8(a0)
80002814:	00052023          	sw	zero,0(a0)
80002818:	a059                	j	8000289e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000281a:	08080263          	beqz	a6,8000289e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000281e:	00452803          	lw	a6,4(a0)
80002822:	00c82803          	lw	a6,12(a6)
80002826:	01052223          	sw	a6,4(a0)
8000282a:	00082423          	sw	zero,8(a6)
8000282e:	00052803          	lw	a6,0(a0)
80002832:	187d                	addi	a6,a6,-1
80002834:	01052023          	sw	a6,0(a0)
80002838:	a09d                	j	8000289e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000283a:	06080263          	beqz	a6,8000289e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000283e:	00852803          	lw	a6,8(a0)
80002842:	00882803          	lw	a6,8(a6)
80002846:	01052423          	sw	a6,8(a0)
8000284a:	00082623          	sw	zero,12(a6)
8000284e:	00052803          	lw	a6,0(a0)
80002852:	187d                	addi	a6,a6,-1
80002854:	01052023          	sw	a6,0(a0)
80002858:	a099                	j	8000289e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
8000285a:	873e                	mv	a4,a5
8000285c:	bfbd                	j	800027da <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x44>
8000285e:	c331                	beqz	a4,800028a2 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x10c>
80002860:	0045a803          	lw	a6,4(a1)
80002864:	00472883          	lw	a7,4(a4)
80002868:	9846                	add	a6,a6,a7
8000286a:	0105a223          	sw	a6,4(a1)
8000286e:	00052803          	lw	a6,0(a0)
80002872:	4885                	li	a7,1
80002874:	f9180ce3          	beq	a6,a7,8000280c <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x76>
80002878:	00872303          	lw	t1,8(a4)
8000287c:	f8030fe3          	beqz	t1,8000281a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x84>
80002880:	00c72883          	lw	a7,12(a4)
80002884:	fa088be3          	beqz	a7,8000283a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xa4>
80002888:	01132623          	sw	a7,12(t1)
8000288c:	00872803          	lw	a6,8(a4)
80002890:	0108a423          	sw	a6,8(a7)
80002894:	00052803          	lw	a6,0(a0)
80002898:	187d                	addi	a6,a6,-1
8000289a:	01052023          	sw	a6,0(a0)
8000289e:	c218                	sw	a4,0(a2)
800028a0:	c799                	beqz	a5,800028ae <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x118>
800028a2:	43d8                	lw	a4,4(a5)
800028a4:	41d0                	lw	a2,4(a1)
800028a6:	9732                	add	a4,a4,a2
800028a8:	c3d8                	sw	a4,4(a5)
800028aa:	c28c                	sw	a1,0(a3)
800028ac:	8082                	ret
800028ae:	8082                	ret

800028b0 <_ZN4EPOS1S3MMU4initEv>:
800028b0:	711d                	addi	sp,sp,-96
800028b2:	ce86                	sw	ra,92(sp)
800028b4:	cca2                	sw	s0,88(sp)
800028b6:	caa6                	sw	s1,84(sp)
800028b8:	c8ca                	sw	s2,80(sp)
800028ba:	87ffc437          	lui	s0,0x87ffc
800028be:	800067b7          	lui	a5,0x80006
800028c2:	14078793          	addi	a5,a5,320 # 80006140 <__boot_stack__+0xf8006141>
800028c6:	8c1d                	sub	s0,s0,a5
800028c8:	47c1                	li	a5,16
800028ca:	0087f963          	bgeu	a5,s0,800028dc <_ZN4EPOS1S3MMU4initEv+0x2c>
800028ce:	e461                	bnez	s0,80002996 <_ZN4EPOS1S3MMU4initEv+0xe6>
800028d0:	40f6                	lw	ra,92(sp)
800028d2:	4466                	lw	s0,88(sp)
800028d4:	44d6                	lw	s1,84(sp)
800028d6:	4946                	lw	s2,80(sp)
800028d8:	6125                	addi	sp,sp,96
800028da:	8082                	ret
800028dc:	80005937          	lui	s2,0x80005
800028e0:	03490493          	addi	s1,s2,52 # 80005034 <__boot_stack__+0xf8005035>
800028e4:	4785                	li	a5,1
800028e6:	00f48223          	sb	a5,4(s1)
800028ea:	80003537          	lui	a0,0x80003
800028ee:	7cc50513          	addi	a0,a0,1996 # 800037cc <__boot_stack__+0xf80037cd>
800028f2:	ffffe097          	auipc	ra,0xffffe
800028f6:	63c080e7          	jalr	1596(ra) # 80000f2e <_print>
800028fa:	80004537          	lui	a0,0x80004
800028fe:	98450513          	addi	a0,a0,-1660 # 80003984 <__boot_stack__+0xf8003985>
80002902:	ffffe097          	auipc	ra,0xffffe
80002906:	62c080e7          	jalr	1580(ra) # 80000f2e <_print>
8000290a:	80003537          	lui	a0,0x80003
8000290e:	7ec50513          	addi	a0,a0,2028 # 800037ec <__boot_stack__+0xf80037ed>
80002912:	ffffe097          	auipc	ra,0xffffe
80002916:	61c080e7          	jalr	1564(ra) # 80000f2e <_print>
8000291a:	80004537          	lui	a0,0x80004
8000291e:	9a050513          	addi	a0,a0,-1632 # 800039a0 <__boot_stack__+0xf80039a1>
80002922:	ffffe097          	auipc	ra,0xffffe
80002926:	60c080e7          	jalr	1548(ra) # 80000f2e <_print>
8000292a:	80004537          	lui	a0,0x80004
8000292e:	82450513          	addi	a0,a0,-2012 # 80003824 <__boot_stack__+0xf8003825>
80002932:	ffffe097          	auipc	ra,0xffffe
80002936:	5fc080e7          	jalr	1532(ra) # 80000f2e <_print>
8000293a:	80004537          	lui	a0,0x80004
8000293e:	9f850513          	addi	a0,a0,-1544 # 800039f8 <__boot_stack__+0xf80039f9>
80002942:	ffffe097          	auipc	ra,0xffffe
80002946:	5ec080e7          	jalr	1516(ra) # 80000f2e <_print>
8000294a:	80004537          	lui	a0,0x80004
8000294e:	83850513          	addi	a0,a0,-1992 # 80003838 <__boot_stack__+0xf8003839>
80002952:	ffffe097          	auipc	ra,0xffffe
80002956:	5dc080e7          	jalr	1500(ra) # 80000f2e <_print>
8000295a:	4681                	li	a3,0
8000295c:	0810                	addi	a2,sp,16
8000295e:	07d00593          	li	a1,125
80002962:	03490513          	addi	a0,s2,52
80002966:	ffffe097          	auipc	ra,0xffffe
8000296a:	6e0080e7          	jalr	1760(ra) # 80001046 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
8000296e:	089c                	addi	a5,sp,80
80002970:	953e                	add	a0,a0,a5
80002972:	fc050023          	sb	zero,-64(a0)
80002976:	0808                	addi	a0,sp,16
80002978:	ffffe097          	auipc	ra,0xffffe
8000297c:	5b6080e7          	jalr	1462(ra) # 80000f2e <_print>
80002980:	80003537          	lui	a0,0x80003
80002984:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80002988:	ffffe097          	auipc	ra,0xffffe
8000298c:	5a6080e7          	jalr	1446(ra) # 80000f2e <_print>
80002990:	47a9                	li	a5,10
80002992:	c09c                	sw	a5,0(s1)
80002994:	bf2d                	j	800028ce <_ZN4EPOS1S3MMU4initEv+0x1e>
80002996:	800065b7          	lui	a1,0x80006
8000299a:	14058793          	addi	a5,a1,320 # 80006140 <__boot_stack__+0xf8006141>
8000299e:	14f5a023          	sw	a5,320(a1)
800029a2:	c3c0                	sw	s0,4(a5)
800029a4:	0007a423          	sw	zero,8(a5)
800029a8:	0007a623          	sw	zero,12(a5)
800029ac:	0814                	addi	a3,sp,16
800029ae:	0070                	addi	a2,sp,12
800029b0:	14058593          	addi	a1,a1,320
800029b4:	80006537          	lui	a0,0x80006
800029b8:	13050513          	addi	a0,a0,304 # 80006130 <__boot_stack__+0xf8006131>
800029bc:	00000097          	auipc	ra,0x0
800029c0:	dda080e7          	jalr	-550(ra) # 80002796 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>
800029c4:	b731                	j	800028d0 <_ZN4EPOS1S3MMU4initEv+0x20>

800029c6 <_ZN4EPOS1S2IC7ipi_eoiEj>:
800029c6:	f14027f3          	csrr	a5,mhartid
800029ca:	078a                	slli	a5,a5,0x2
800029cc:	8bb1                	andi	a5,a5,12
800029ce:	02000737          	lui	a4,0x2000
800029d2:	8fd9                	or	a5,a5,a4
800029d4:	0007a023          	sw	zero,0(a5)
800029d8:	34201073          	csrw	mcause,zero
800029dc:	8082                	ret

800029de <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>:
800029de:	1141                	addi	sp,sp,-16
800029e0:	c606                	sw	ra,12(sp)
800029e2:	f14027f3          	csrr	a5,mhartid
800029e6:	8b8d                	andi	a5,a5,3
800029e8:	cf8d                	beqz	a5,80002a22 <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0x44>
800029ea:	80004537          	lui	a0,0x80004
800029ee:	a5450513          	addi	a0,a0,-1452 # 80003a54 <__boot_stack__+0xf8003a55>
800029f2:	ffffe097          	auipc	ra,0xffffe
800029f6:	53c080e7          	jalr	1340(ra) # 80000f2e <_print>
800029fa:	80003537          	lui	a0,0x80003
800029fe:	6e850513          	addi	a0,a0,1768 # 800036e8 <__boot_stack__+0xf80036e9>
80002a02:	ffffe097          	auipc	ra,0xffffe
80002a06:	52c080e7          	jalr	1324(ra) # 80000f2e <_print>
80002a0a:	800057b7          	lui	a5,0x80005
80002a0e:	4729                	li	a4,10
80002a10:	02e7aa23          	sw	a4,52(a5) # 80005034 <__boot_stack__+0xf8005035>
80002a14:	f14027f3          	csrr	a5,mhartid
80002a18:	8b8d                	andi	a5,a5,3
80002a1a:	c3a1                	beqz	a5,80002a5a <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0x7c>
80002a1c:	40b2                	lw	ra,12(sp)
80002a1e:	0141                	addi	sp,sp,16
80002a20:	8082                	ret
80002a22:	100007b7          	lui	a5,0x10000
80002a26:	470d                	li	a4,3
80002a28:	00e781a3          	sb	a4,3(a5) # 10000003 <_vector_table-0x6ffffffd>
80002a2c:	4685                	li	a3,1
80002a2e:	00d78123          	sb	a3,2(a5)
80002a32:	f8300693          	li	a3,-125
80002a36:	00d781a3          	sb	a3,3(a5)
80002a3a:	46b5                	li	a3,13
80002a3c:	00d78023          	sb	a3,0(a5)
80002a40:	000780a3          	sb	zero,1(a5)
80002a44:	00e781a3          	sb	a4,3(a5)
80002a48:	800057b7          	lui	a5,0x80005
80002a4c:	0607a423          	sw	zero,104(a5) # 80005068 <__boot_stack__+0xf8005069>
80002a50:	800057b7          	lui	a5,0x80005
80002a54:	0607a623          	sw	zero,108(a5) # 8000506c <__boot_stack__+0xf800506d>
80002a58:	bf49                	j	800029ea <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0xc>
80002a5a:	00000097          	auipc	ra,0x0
80002a5e:	3dc080e7          	jalr	988(ra) # 80002e36 <_ZN4EPOS1S2IC4initEv>
80002a62:	80005737          	lui	a4,0x80005
80002a66:	800037b7          	lui	a5,0x80003
80002a6a:	9c678793          	addi	a5,a5,-1594 # 800029c6 <__boot_stack__+0xf80029c7>
80002a6e:	0af72e23          	sw	a5,188(a4) # 800050bc <__boot_stack__+0xf80050bd>
80002a72:	020007b7          	lui	a5,0x2000
80002a76:	43d8                	lw	a4,4(a5)
80002a78:	00876713          	ori	a4,a4,8
80002a7c:	c3d8                	sw	a4,4(a5)
80002a7e:	4798                	lw	a4,8(a5)
80002a80:	00876713          	ori	a4,a4,8
80002a84:	c798                	sw	a4,8(a5)
80002a86:	47d8                	lw	a4,12(a5)
80002a88:	00876713          	ori	a4,a4,8
80002a8c:	c7d8                	sw	a4,12(a5)
80002a8e:	b779                	j	80002a1c <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE+0x3e>

80002a90 <_ZN4EPOS1S7Machine4initEv>:
80002a90:	1141                	addi	sp,sp,-16
80002a92:	c606                	sw	ra,12(sp)
80002a94:	00000097          	auipc	ra,0x0
80002a98:	00e080e7          	jalr	14(ra) # 80002aa2 <_ZN4EPOS1S5Timer4initEv>
80002a9c:	40b2                	lw	ra,12(sp)
80002a9e:	0141                	addi	sp,sp,16
80002aa0:	8082                	ret

80002aa2 <_ZN4EPOS1S5Timer4initEv>:
80002aa2:	80005737          	lui	a4,0x80005
80002aa6:	800037b7          	lui	a5,0x80003
80002aaa:	34278793          	addi	a5,a5,834 # 80003342 <__boot_stack__+0xf8003343>
80002aae:	0cf72623          	sw	a5,204(a4) # 800050cc <__boot_stack__+0xf80050cd>
80002ab2:	08000793          	li	a5,128
80002ab6:	30479073          	csrw	mie,a5
80002aba:	0200c7b7          	lui	a5,0x200c
80002abe:	ff87a703          	lw	a4,-8(a5) # 200bff8 <_vector_table-0x7dff4008>
80002ac2:	f14027f3          	csrr	a5,mhartid
80002ac6:	8b8d                	andi	a5,a5,3
80002ac8:	6685                	lui	a3,0x1
80002aca:	80068693          	addi	a3,a3,-2048 # 800 <_vector_table-0x7ffff800>
80002ace:	97b6                	add	a5,a5,a3
80002ad0:	078e                	slli	a5,a5,0x3
80002ad2:	020006b7          	lui	a3,0x2000
80002ad6:	97b6                	add	a5,a5,a3
80002ad8:	6689                	lui	a3,0x2
80002ada:	71068693          	addi	a3,a3,1808 # 2710 <_vector_table-0x7fffd8f0>
80002ade:	9736                	add	a4,a4,a3
80002ae0:	c398                	sw	a4,0(a5)
80002ae2:	8082                	ret

80002ae4 <_ZN4EPOS1S6System4initEv>:
80002ae4:	1141                	addi	sp,sp,-16
80002ae6:	c606                	sw	ra,12(sp)
80002ae8:	00000097          	auipc	ra,0x0
80002aec:	380080e7          	jalr	896(ra) # 80002e68 <_ZN4EPOS1S5Alarm4initEv>
80002af0:	00000097          	auipc	ra,0x0
80002af4:	00e080e7          	jalr	14(ra) # 80002afe <_ZN4EPOS1S6Thread4initEv>
80002af8:	40b2                	lw	ra,12(sp)
80002afa:	0141                	addi	sp,sp,16
80002afc:	8082                	ret

80002afe <_ZN4EPOS1S6Thread4initEv>:
80002afe:	7179                	addi	sp,sp,-48
80002b00:	d606                	sw	ra,44(sp)
80002b02:	d422                	sw	s0,40(sp)
80002b04:	f14027f3          	csrr	a5,mhartid
80002b08:	80005737          	lui	a4,0x80005
80002b0c:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002b10:	00269713          	slli	a4,a3,0x2
80002b14:	80005637          	lui	a2,0x80005
80002b18:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80002b1c:	9732                	add	a4,a4,a2
80002b1e:	1007262f          	lr.w	a2,(a4)
80002b22:	0605                	addi	a2,a2,1
80002b24:	18c722af          	sc.w	t0,a2,(a4)
80002b28:	fe029be3          	bnez	t0,80002b1e <_ZN4EPOS1S6Thread4initEv+0x20>
80002b2c:	8b8d                	andi	a5,a5,3
80002b2e:	1a078663          	beqz	a5,80002cda <_ZN4EPOS1S6Thread4initEv+0x1dc>
80002b32:	80005737          	lui	a4,0x80005
80002b36:	068a                	slli	a3,a3,0x2
80002b38:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80002b3c:	9736                	add	a4,a4,a3
80002b3e:	431c                	lw	a5,0(a4)
80002b40:	fffd                	bnez	a5,80002b3e <_ZN4EPOS1S6Thread4initEv+0x40>
80002b42:	f14027f3          	csrr	a5,mhartid
80002b46:	8b8d                	andi	a5,a5,3
80002b48:	1c078563          	beqz	a5,80002d12 <_ZN4EPOS1S6Thread4initEv+0x214>
80002b4c:	f14027f3          	csrr	a5,mhartid
80002b50:	80005737          	lui	a4,0x80005
80002b54:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002b58:	00269713          	slli	a4,a3,0x2
80002b5c:	80005637          	lui	a2,0x80005
80002b60:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80002b64:	9732                	add	a4,a4,a2
80002b66:	1007262f          	lr.w	a2,(a4)
80002b6a:	0605                	addi	a2,a2,1
80002b6c:	18c722af          	sc.w	t0,a2,(a4)
80002b70:	fe029be3          	bnez	t0,80002b66 <_ZN4EPOS1S6Thread4initEv+0x68>
80002b74:	8b8d                	andi	a5,a5,3
80002b76:	20078763          	beqz	a5,80002d84 <_ZN4EPOS1S6Thread4initEv+0x286>
80002b7a:	80005737          	lui	a4,0x80005
80002b7e:	068a                	slli	a3,a3,0x2
80002b80:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80002b84:	9736                	add	a4,a4,a3
80002b86:	431c                	lw	a5,0(a4)
80002b88:	fffd                	bnez	a5,80002b86 <_ZN4EPOS1S6Thread4initEv+0x88>
80002b8a:	800007b7          	lui	a5,0x80000
80002b8e:	fff7c793          	not	a5,a5
80002b92:	c83e                	sw	a5,16(sp)
80002b94:	02400593          	li	a1,36
80002b98:	800057b7          	lui	a5,0x80005
80002b9c:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80002ba0:	ffffe097          	auipc	ra,0xffffe
80002ba4:	b84080e7          	jalr	-1148(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
80002ba8:	842a                	mv	s0,a0
80002baa:	4785                	li	a5,1
80002bac:	c51c                	sw	a5,8(a0)
80002bae:	00052623          	sw	zero,12(a0)
80002bb2:	00052823          	sw	zero,16(a0)
80002bb6:	c948                	sw	a0,20(a0)
80002bb8:	47c2                	lw	a5,16(sp)
80002bba:	cd1c                	sw	a5,24(a0)
80002bbc:	00052e23          	sw	zero,28(a0)
80002bc0:	02052023          	sw	zero,32(a0)
80002bc4:	6591                	lui	a1,0x4
80002bc6:	ffffe097          	auipc	ra,0xffffe
80002bca:	56c080e7          	jalr	1388(ra) # 80001132 <_ZN4EPOS1S6Thread20constructor_prologueEj>
80002bce:	800027b7          	lui	a5,0x80002
80002bd2:	6b478793          	addi	a5,a5,1716 # 800026b4 <__boot_stack__+0xf80026b5>
80002bd6:	4018                	lw	a4,0(s0)
80002bd8:	6691                	lui	a3,0x4
80002bda:	9736                	add	a4,a4,a3
80002bdc:	f8c70613          	addi	a2,a4,-116
80002be0:	800016b7          	lui	a3,0x80001
80002be4:	f1a68693          	addi	a3,a3,-230 # 80000f1a <__boot_stack__+0xf8000f1b>
80002be8:	f8d72623          	sw	a3,-116(a4)
80002bec:	fef72e23          	sw	a5,-4(a4)
80002bf0:	c050                	sw	a2,4(s0)
80002bf2:	ce3e                	sw	a5,28(sp)
80002bf4:	6611                	lui	a2,0x4
80002bf6:	086c                	addi	a1,sp,28
80002bf8:	8522                	mv	a0,s0
80002bfa:	fffff097          	auipc	ra,0xfffff
80002bfe:	c08080e7          	jalr	-1016(ra) # 80001802 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80002c02:	f14027f3          	csrr	a5,mhartid
80002c06:	80005737          	lui	a4,0x80005
80002c0a:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002c0e:	00269713          	slli	a4,a3,0x2
80002c12:	80005637          	lui	a2,0x80005
80002c16:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80002c1a:	9732                	add	a4,a4,a2
80002c1c:	1007262f          	lr.w	a2,(a4)
80002c20:	0605                	addi	a2,a2,1
80002c22:	18c722af          	sc.w	t0,a2,(a4)
80002c26:	fe029be3          	bnez	t0,80002c1c <_ZN4EPOS1S6Thread4initEv+0x11e>
80002c2a:	8b8d                	andi	a5,a5,3
80002c2c:	18078863          	beqz	a5,80002dbc <_ZN4EPOS1S6Thread4initEv+0x2be>
80002c30:	80005737          	lui	a4,0x80005
80002c34:	068a                	slli	a3,a3,0x2
80002c36:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80002c3a:	9736                	add	a4,a4,a3
80002c3c:	431c                	lw	a5,0(a4)
80002c3e:	fffd                	bnez	a5,80002c3c <_ZN4EPOS1S6Thread4initEv+0x13e>
80002c40:	02000593          	li	a1,32
80002c44:	800057b7          	lui	a5,0x80005
80002c48:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80002c4c:	ffffe097          	auipc	ra,0xffffe
80002c50:	ad8080e7          	jalr	-1320(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
80002c54:	00052023          	sw	zero,0(a0)
80002c58:	47a9                	li	a5,10
80002c5a:	c15c                	sw	a5,4(a0)
80002c5c:	4785                	li	a5,1
80002c5e:	00f50423          	sb	a5,8(a0)
80002c62:	800017b7          	lui	a5,0x80001
80002c66:	7ea78793          	addi	a5,a5,2026 # 800017ea <__boot_stack__+0xf80017eb>
80002c6a:	cd5c                	sw	a5,28(a0)
80002c6c:	800057b7          	lui	a5,0x80005
80002c70:	0707a783          	lw	a5,112(a5) # 80005070 <__boot_stack__+0xf8005071>
80002c74:	18078063          	beqz	a5,80002df4 <_ZN4EPOS1S6Thread4initEv+0x2f6>
80002c78:	47a9                	li	a5,10
80002c7a:	c55c                	sw	a5,12(a0)
80002c7c:	c91c                	sw	a5,16(a0)
80002c7e:	c95c                	sw	a5,20(a0)
80002c80:	cd1c                	sw	a5,24(a0)
80002c82:	800057b7          	lui	a5,0x80005
80002c86:	04a7ae23          	sw	a0,92(a5) # 8000505c <__boot_stack__+0xf800505d>
80002c8a:	f14027f3          	csrr	a5,mhartid
80002c8e:	80005737          	lui	a4,0x80005
80002c92:	00472683          	lw	a3,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002c96:	00269713          	slli	a4,a3,0x2
80002c9a:	80005637          	lui	a2,0x80005
80002c9e:	00860613          	addi	a2,a2,8 # 80005008 <__boot_stack__+0xf8005009>
80002ca2:	9732                	add	a4,a4,a2
80002ca4:	1007262f          	lr.w	a2,(a4)
80002ca8:	0605                	addi	a2,a2,1
80002caa:	18c722af          	sc.w	t0,a2,(a4)
80002cae:	fe029be3          	bnez	t0,80002ca4 <_ZN4EPOS1S6Thread4initEv+0x1a6>
80002cb2:	8b8d                	andi	a5,a5,3
80002cb4:	14078563          	beqz	a5,80002dfe <_ZN4EPOS1S6Thread4initEv+0x300>
80002cb8:	80005737          	lui	a4,0x80005
80002cbc:	068a                	slli	a3,a3,0x2
80002cbe:	00870713          	addi	a4,a4,8 # 80005008 <__boot_stack__+0xf8005009>
80002cc2:	9736                	add	a4,a4,a3
80002cc4:	431c                	lw	a5,0(a4)
80002cc6:	fffd                	bnez	a5,80002cc4 <_ZN4EPOS1S6Thread4initEv+0x1c6>
80002cc8:	800057b7          	lui	a5,0x80005
80002ccc:	4705                	li	a4,1
80002cce:	04e78a23          	sb	a4,84(a5) # 80005054 <__boot_stack__+0xf8005055>
80002cd2:	50b2                	lw	ra,44(sp)
80002cd4:	5422                	lw	s0,40(sp)
80002cd6:	6145                	addi	sp,sp,48
80002cd8:	8082                	ret
80002cda:	800057b7          	lui	a5,0x80005
80002cde:	00269713          	slli	a4,a3,0x2
80002ce2:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002ce6:	973e                	add	a4,a4,a5
80002ce8:	460d                	li	a2,3
80002cea:	431c                	lw	a5,0(a4)
80002cec:	fef65fe3          	bge	a2,a5,80002cea <_ZN4EPOS1S6Thread4initEv+0x1ec>
80002cf0:	80005737          	lui	a4,0x80005
80002cf4:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002cf8:	0017b793          	seqz	a5,a5
80002cfc:	00f72223          	sw	a5,4(a4)
80002d00:	800057b7          	lui	a5,0x80005
80002d04:	068a                	slli	a3,a3,0x2
80002d06:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002d0a:	96be                	add	a3,a3,a5
80002d0c:	0006a023          	sw	zero,0(a3)
80002d10:	bd0d                	j	80002b42 <_ZN4EPOS1S6Thread4initEv+0x44>
80002d12:	c202                	sw	zero,4(sp)
80002d14:	02400593          	li	a1,36
80002d18:	800057b7          	lui	a5,0x80005
80002d1c:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80002d20:	ffffe097          	auipc	ra,0xffffe
80002d24:	a04080e7          	jalr	-1532(ra) # 80000724 <_ZN4EPOS1S1U4Heap5allocEj>
80002d28:	842a                	mv	s0,a0
80002d2a:	00052423          	sw	zero,8(a0)
80002d2e:	00052623          	sw	zero,12(a0)
80002d32:	00052823          	sw	zero,16(a0)
80002d36:	c948                	sw	a0,20(a0)
80002d38:	4792                	lw	a5,4(sp)
80002d3a:	cd1c                	sw	a5,24(a0)
80002d3c:	00052e23          	sw	zero,28(a0)
80002d40:	02052023          	sw	zero,32(a0)
80002d44:	6591                	lui	a1,0x4
80002d46:	ffffe097          	auipc	ra,0xffffe
80002d4a:	3ec080e7          	jalr	1004(ra) # 80001132 <_ZN4EPOS1S6Thread20constructor_prologueEj>
80002d4e:	800007b7          	lui	a5,0x80000
80002d52:	18078793          	addi	a5,a5,384 # 80000180 <__boot_stack__+0xf8000181>
80002d56:	4018                	lw	a4,0(s0)
80002d58:	6691                	lui	a3,0x4
80002d5a:	9736                	add	a4,a4,a3
80002d5c:	f8c70613          	addi	a2,a4,-116
80002d60:	800016b7          	lui	a3,0x80001
80002d64:	f1a68693          	addi	a3,a3,-230 # 80000f1a <__boot_stack__+0xf8000f1b>
80002d68:	f8d72623          	sw	a3,-116(a4)
80002d6c:	fef72e23          	sw	a5,-4(a4)
80002d70:	c050                	sw	a2,4(s0)
80002d72:	cc3e                	sw	a5,24(sp)
80002d74:	6611                	lui	a2,0x4
80002d76:	082c                	addi	a1,sp,24
80002d78:	8522                	mv	a0,s0
80002d7a:	fffff097          	auipc	ra,0xfffff
80002d7e:	a88080e7          	jalr	-1400(ra) # 80001802 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80002d82:	b3e9                	j	80002b4c <_ZN4EPOS1S6Thread4initEv+0x4e>
80002d84:	800057b7          	lui	a5,0x80005
80002d88:	00269713          	slli	a4,a3,0x2
80002d8c:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002d90:	973e                	add	a4,a4,a5
80002d92:	460d                	li	a2,3
80002d94:	431c                	lw	a5,0(a4)
80002d96:	fef65fe3          	bge	a2,a5,80002d94 <_ZN4EPOS1S6Thread4initEv+0x296>
80002d9a:	80005737          	lui	a4,0x80005
80002d9e:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002da2:	0017b793          	seqz	a5,a5
80002da6:	00f72223          	sw	a5,4(a4)
80002daa:	800057b7          	lui	a5,0x80005
80002dae:	068a                	slli	a3,a3,0x2
80002db0:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002db4:	96be                	add	a3,a3,a5
80002db6:	0006a023          	sw	zero,0(a3)
80002dba:	bbc1                	j	80002b8a <_ZN4EPOS1S6Thread4initEv+0x8c>
80002dbc:	800057b7          	lui	a5,0x80005
80002dc0:	00269713          	slli	a4,a3,0x2
80002dc4:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002dc8:	973e                	add	a4,a4,a5
80002dca:	460d                	li	a2,3
80002dcc:	431c                	lw	a5,0(a4)
80002dce:	fef65fe3          	bge	a2,a5,80002dcc <_ZN4EPOS1S6Thread4initEv+0x2ce>
80002dd2:	80005737          	lui	a4,0x80005
80002dd6:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002dda:	0017b793          	seqz	a5,a5
80002dde:	00f72223          	sw	a5,4(a4)
80002de2:	800057b7          	lui	a5,0x80005
80002de6:	068a                	slli	a3,a3,0x2
80002de8:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002dec:	96be                	add	a3,a3,a5
80002dee:	0006a023          	sw	zero,0(a3)
80002df2:	b5b9                	j	80002c40 <_ZN4EPOS1S6Thread4initEv+0x142>
80002df4:	800057b7          	lui	a5,0x80005
80002df8:	06a7a823          	sw	a0,112(a5) # 80005070 <__boot_stack__+0xf8005071>
80002dfc:	bdb5                	j	80002c78 <_ZN4EPOS1S6Thread4initEv+0x17a>
80002dfe:	800057b7          	lui	a5,0x80005
80002e02:	00269713          	slli	a4,a3,0x2
80002e06:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002e0a:	973e                	add	a4,a4,a5
80002e0c:	460d                	li	a2,3
80002e0e:	431c                	lw	a5,0(a4)
80002e10:	fef65fe3          	bge	a2,a5,80002e0e <_ZN4EPOS1S6Thread4initEv+0x310>
80002e14:	80005737          	lui	a4,0x80005
80002e18:	00472783          	lw	a5,4(a4) # 80005004 <__boot_stack__+0xf8005005>
80002e1c:	0017b793          	seqz	a5,a5
80002e20:	00f72223          	sw	a5,4(a4)
80002e24:	800057b7          	lui	a5,0x80005
80002e28:	068a                	slli	a3,a3,0x2
80002e2a:	00878793          	addi	a5,a5,8 # 80005008 <__boot_stack__+0xf8005009>
80002e2e:	96be                	add	a3,a3,a5
80002e30:	0006a023          	sw	zero,0(a3)
80002e34:	bd51                	j	80002cc8 <_ZN4EPOS1S6Thread4initEv+0x1ca>

80002e36 <_ZN4EPOS1S2IC4initEv>:
80002e36:	4781                	li	a5,0
80002e38:	30479073          	csrw	mie,a5
80002e3c:	77fd                	lui	a5,0xfffff
80002e3e:	55578793          	addi	a5,a5,1365 # fffff555 <__boot_stack__+0x77fff556>
80002e42:	30479073          	csrw	mie,a5
80002e46:	800057b7          	lui	a5,0x80005
80002e4a:	0b078793          	addi	a5,a5,176 # 800050b0 <__boot_stack__+0xf80050b1>
80002e4e:	6705                	lui	a4,0x1
80002e50:	08070713          	addi	a4,a4,128 # 1080 <_vector_table-0x7fffef80>
80002e54:	973e                	add	a4,a4,a5
80002e56:	800036b7          	lui	a3,0x80003
80002e5a:	1b068693          	addi	a3,a3,432 # 800031b0 <__boot_stack__+0xf80031b1>
80002e5e:	c394                	sw	a3,0(a5)
80002e60:	0791                	addi	a5,a5,4
80002e62:	fee79ee3          	bne	a5,a4,80002e5e <_ZN4EPOS1S2IC4initEv+0x28>
80002e66:	8082                	ret

80002e68 <_ZN4EPOS1S5Alarm4initEv>:
80002e68:	1141                	addi	sp,sp,-16
80002e6a:	c606                	sw	ra,12(sp)
80002e6c:	800057b7          	lui	a5,0x80005
80002e70:	0447a503          	lw	a0,68(a5) # 80005044 <__boot_stack__+0xf8005045>
80002e74:	415c                	lw	a5,4(a0)
80002e76:	cf81                	beqz	a5,80002e8e <_ZN4EPOS1S5Alarm4initEv+0x26>
80002e78:	03300693          	li	a3,51
80002e7c:	02400613          	li	a2,36
80002e80:	43d8                	lw	a4,4(a5)
80002e82:	06e6eb63          	bltu	a3,a4,80002ef8 <_ZN4EPOS1S5Alarm4initEv+0x90>
80002e86:	06c70963          	beq	a4,a2,80002ef8 <_ZN4EPOS1S5Alarm4initEv+0x90>
80002e8a:	47dc                	lw	a5,12(a5)
80002e8c:	fbf5                	bnez	a5,80002e80 <_ZN4EPOS1S5Alarm4initEv+0x18>
80002e8e:	ffffe097          	auipc	ra,0xffffe
80002e92:	1a6080e7          	jalr	422(ra) # 80001034 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
80002e96:	4781                	li	a5,0
80002e98:	a049                	j	80002f1a <_ZN4EPOS1S5Alarm4initEv+0xb2>
80002e9a:	4118                	lw	a4,0(a0)
80002e9c:	4685                	li	a3,1
80002e9e:	00d70d63          	beq	a4,a3,80002eb8 <_ZN4EPOS1S5Alarm4initEv+0x50>
80002ea2:	4790                	lw	a2,8(a5)
80002ea4:	c20d                	beqz	a2,80002ec6 <_ZN4EPOS1S5Alarm4initEv+0x5e>
80002ea6:	47d4                	lw	a3,12(a5)
80002ea8:	ca8d                	beqz	a3,80002eda <_ZN4EPOS1S5Alarm4initEv+0x72>
80002eaa:	c654                	sw	a3,12(a2)
80002eac:	4798                	lw	a4,8(a5)
80002eae:	c698                	sw	a4,8(a3)
80002eb0:	4118                	lw	a4,0(a0)
80002eb2:	177d                	addi	a4,a4,-1
80002eb4:	c118                	sw	a4,0(a0)
80002eb6:	a891                	j	80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002eb8:	00052223          	sw	zero,4(a0)
80002ebc:	00052423          	sw	zero,8(a0)
80002ec0:	00052023          	sw	zero,0(a0)
80002ec4:	a099                	j	80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002ec6:	c331                	beqz	a4,80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002ec8:	4158                	lw	a4,4(a0)
80002eca:	4758                	lw	a4,12(a4)
80002ecc:	c158                	sw	a4,4(a0)
80002ece:	00072423          	sw	zero,8(a4)
80002ed2:	4118                	lw	a4,0(a0)
80002ed4:	177d                	addi	a4,a4,-1
80002ed6:	c118                	sw	a4,0(a0)
80002ed8:	a80d                	j	80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002eda:	cb05                	beqz	a4,80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002edc:	4518                	lw	a4,8(a0)
80002ede:	4718                	lw	a4,8(a4)
80002ee0:	c518                	sw	a4,8(a0)
80002ee2:	00072623          	sw	zero,12(a4)
80002ee6:	4118                	lw	a4,0(a0)
80002ee8:	177d                	addi	a4,a4,-1
80002eea:	c118                	sw	a4,0(a0)
80002eec:	a839                	j	80002f0a <_ZN4EPOS1S5Alarm4initEv+0xa2>
80002eee:	80005737          	lui	a4,0x80005
80002ef2:	06f72a23          	sw	a5,116(a4) # 80005074 <__boot_stack__+0xf8005075>
80002ef6:	a089                	j	80002f38 <_ZN4EPOS1S5Alarm4initEv+0xd0>
80002ef8:	fdc70713          	addi	a4,a4,-36
80002efc:	c3d8                	sw	a4,4(a5)
80002efe:	4558                	lw	a4,12(a0)
80002f00:	fdc70713          	addi	a4,a4,-36
80002f04:	c558                	sw	a4,12(a0)
80002f06:	43d8                	lw	a4,4(a5)
80002f08:	db49                	beqz	a4,80002e9a <_ZN4EPOS1S5Alarm4initEv+0x32>
80002f0a:	4398                	lw	a4,0(a5)
80002f0c:	43dc                	lw	a5,4(a5)
80002f0e:	973e                	add	a4,a4,a5
80002f10:	00470793          	addi	a5,a4,4
80002f14:	02400693          	li	a3,36
80002f18:	c314                	sw	a3,0(a4)
80002f1a:	4705                	li	a4,1
80002f1c:	c398                	sw	a4,0(a5)
80002f1e:	c3d8                	sw	a4,4(a5)
80002f20:	00e78423          	sb	a4,8(a5)
80002f24:	80003737          	lui	a4,0x80003
80002f28:	f5070713          	addi	a4,a4,-176 # 80002f50 <__boot_stack__+0xf8002f51>
80002f2c:	cfd8                	sw	a4,28(a5)
80002f2e:	80005737          	lui	a4,0x80005
80002f32:	07472703          	lw	a4,116(a4) # 80005074 <__boot_stack__+0xf8005075>
80002f36:	df45                	beqz	a4,80002eee <_ZN4EPOS1S5Alarm4initEv+0x86>
80002f38:	4705                	li	a4,1
80002f3a:	c7d8                	sw	a4,12(a5)
80002f3c:	cb98                	sw	a4,16(a5)
80002f3e:	cbd8                	sw	a4,20(a5)
80002f40:	cf98                	sw	a4,24(a5)
80002f42:	80005737          	lui	a4,0x80005
80002f46:	06f72023          	sw	a5,96(a4) # 80005060 <__boot_stack__+0xf8005061>
80002f4a:	40b2                	lw	ra,12(sp)
80002f4c:	0141                	addi	sp,sp,16
80002f4e:	8082                	ret

80002f50 <_ZN4EPOS1S5Alarm7handlerEj>:
80002f50:	4781                	li	a5,0
80002f52:	30479073          	csrw	mie,a5
80002f56:	800057b7          	lui	a5,0x80005
80002f5a:	06478793          	addi	a5,a5,100 # 80005064 <__boot_stack__+0xf8005065>
80002f5e:	4398                	lw	a4,0(a5)
80002f60:	0705                	addi	a4,a4,1
80002f62:	c398                	sw	a4,0(a5)
80002f64:	800057b7          	lui	a5,0x80005
80002f68:	0a47a703          	lw	a4,164(a5) # 800050a4 <__boot_stack__+0xf80050a5>
80002f6c:	e711                	bnez	a4,80002f78 <_ZN4EPOS1S5Alarm7handlerEj+0x28>
80002f6e:	08800793          	li	a5,136
80002f72:	30479073          	csrw	mie,a5
80002f76:	8082                	ret
80002f78:	800057b7          	lui	a5,0x80005
80002f7c:	0a87a683          	lw	a3,168(a5) # 800050a8 <__boot_stack__+0xf80050a9>
80002f80:	42dc                	lw	a5,4(a3)
80002f82:	17fd                	addi	a5,a5,-1
80002f84:	c2dc                	sw	a5,4(a3)
80002f86:	00f05763          	blez	a5,80002f94 <_ZN4EPOS1S5Alarm7handlerEj+0x44>
80002f8a:	08800793          	li	a5,136
80002f8e:	30479073          	csrw	mie,a5
80002f92:	8082                	ret
80002f94:	1141                	addi	sp,sp,-16
80002f96:	c606                	sw	ra,12(sp)
80002f98:	800057b7          	lui	a5,0x80005
80002f9c:	0a87a683          	lw	a3,168(a5) # 800050a8 <__boot_stack__+0xf80050a9>
80002fa0:	4785                	li	a5,1
80002fa2:	04f70563          	beq	a4,a5,80002fec <_ZN4EPOS1S5Alarm7handlerEj+0x9c>
80002fa6:	46d0                	lw	a2,12(a3)
80002fa8:	800057b7          	lui	a5,0x80005
80002fac:	0a478793          	addi	a5,a5,164 # 800050a4 <__boot_stack__+0xf80050a5>
80002fb0:	c3d0                	sw	a2,4(a5)
80002fb2:	00062423          	sw	zero,8(a2) # 4008 <_vector_table-0x7fffbff8>
80002fb6:	177d                	addi	a4,a4,-1
80002fb8:	c398                	sw	a4,0(a5)
80002fba:	46dc                	lw	a5,12(a3)
80002fbc:	c789                	beqz	a5,80002fc6 <_ZN4EPOS1S5Alarm7handlerEj+0x76>
80002fbe:	43d8                	lw	a4,4(a5)
80002fc0:	42d0                	lw	a2,4(a3)
80002fc2:	9732                	add	a4,a4,a2
80002fc4:	c3d8                	sw	a4,4(a5)
80002fc6:	428c                	lw	a1,0(a3)
80002fc8:	459c                	lw	a5,8(a1)
80002fca:	577d                	li	a4,-1
80002fcc:	02e78c63          	beq	a5,a4,80003004 <_ZN4EPOS1S5Alarm7handlerEj+0xb4>
80002fd0:	17fd                	addi	a5,a5,-1
80002fd2:	c59c                	sw	a5,8(a1)
80002fd4:	eb85                	bnez	a5,80003004 <_ZN4EPOS1S5Alarm7handlerEj+0xb4>
80002fd6:	08800793          	li	a5,136
80002fda:	30479073          	csrw	mie,a5
80002fde:	41c8                	lw	a0,4(a1)
80002fe0:	411c                	lw	a5,0(a0)
80002fe2:	479c                	lw	a5,8(a5)
80002fe4:	9782                	jalr	a5
80002fe6:	40b2                	lw	ra,12(sp)
80002fe8:	0141                	addi	sp,sp,16
80002fea:	8082                	ret
80002fec:	800057b7          	lui	a5,0x80005
80002ff0:	0a478793          	addi	a5,a5,164 # 800050a4 <__boot_stack__+0xf80050a5>
80002ff4:	0007a223          	sw	zero,4(a5)
80002ff8:	0007a423          	sw	zero,8(a5)
80002ffc:	0007a023          	sw	zero,0(a5)
80003000:	d2f9                	beqz	a3,80002fc6 <_ZN4EPOS1S5Alarm7handlerEj+0x76>
80003002:	bf65                	j	80002fba <_ZN4EPOS1S5Alarm7handlerEj+0x6a>
80003004:	45dc                	lw	a5,12(a1)
80003006:	c2dc                	sw	a5,4(a3)
80003008:	800057b7          	lui	a5,0x80005
8000300c:	0a47a803          	lw	a6,164(a5) # 800050a4 <__boot_stack__+0xf80050a5>
80003010:	00081d63          	bnez	a6,8000302a <_ZN4EPOS1S5Alarm7handlerEj+0xda>
80003014:	0006a423          	sw	zero,8(a3)
80003018:	0006a623          	sw	zero,12(a3)
8000301c:	0a478793          	addi	a5,a5,164
80003020:	c3d4                	sw	a3,4(a5)
80003022:	c794                	sw	a3,8(a5)
80003024:	4705                	li	a4,1
80003026:	c398                	sw	a4,0(a5)
80003028:	b77d                	j	80002fd6 <_ZN4EPOS1S5Alarm7handlerEj+0x86>
8000302a:	800057b7          	lui	a5,0x80005
8000302e:	0a87a703          	lw	a4,168(a5) # 800050a8 <__boot_stack__+0xf80050a9>
80003032:	4350                	lw	a2,4(a4)
80003034:	42dc                	lw	a5,4(a3)
80003036:	00c7ca63          	blt	a5,a2,8000304a <_ZN4EPOS1S5Alarm7handlerEj+0xfa>
8000303a:	4748                	lw	a0,12(a4)
8000303c:	c515                	beqz	a0,80003068 <_ZN4EPOS1S5Alarm7handlerEj+0x118>
8000303e:	8f91                	sub	a5,a5,a2
80003040:	c2dc                	sw	a5,4(a3)
80003042:	4758                	lw	a4,12(a4)
80003044:	4350                	lw	a2,4(a4)
80003046:	fec7dae3          	bge	a5,a2,8000303a <_ZN4EPOS1S5Alarm7handlerEj+0xea>
8000304a:	4708                	lw	a0,8(a4)
8000304c:	c121                	beqz	a0,8000308c <_ZN4EPOS1S5Alarm7handlerEj+0x13c>
8000304e:	40f607b3          	sub	a5,a2,a5
80003052:	c35c                	sw	a5,4(a4)
80003054:	c554                	sw	a3,12(a0)
80003056:	c714                	sw	a3,8(a4)
80003058:	c688                	sw	a0,8(a3)
8000305a:	c6d8                	sw	a4,12(a3)
8000305c:	0805                	addi	a6,a6,1
8000305e:	800057b7          	lui	a5,0x80005
80003062:	0b07a223          	sw	a6,164(a5) # 800050a4 <__boot_stack__+0xf80050a5>
80003066:	bf85                	j	80002fd6 <_ZN4EPOS1S5Alarm7handlerEj+0x86>
80003068:	fec7c1e3          	blt	a5,a2,8000304a <_ZN4EPOS1S5Alarm7handlerEj+0xfa>
8000306c:	8f91                	sub	a5,a5,a2
8000306e:	c2dc                	sw	a5,4(a3)
80003070:	800057b7          	lui	a5,0x80005
80003074:	0a478793          	addi	a5,a5,164 # 800050a4 <__boot_stack__+0xf80050a5>
80003078:	4798                	lw	a4,8(a5)
8000307a:	c754                	sw	a3,12(a4)
8000307c:	c698                	sw	a4,8(a3)
8000307e:	0006a623          	sw	zero,12(a3)
80003082:	c794                	sw	a3,8(a5)
80003084:	0805                	addi	a6,a6,1
80003086:	0107a023          	sw	a6,0(a5)
8000308a:	b7b1                	j	80002fd6 <_ZN4EPOS1S5Alarm7handlerEj+0x86>
8000308c:	40f607b3          	sub	a5,a2,a5
80003090:	c35c                	sw	a5,4(a4)
80003092:	0006a423          	sw	zero,8(a3)
80003096:	800057b7          	lui	a5,0x80005
8000309a:	0a478793          	addi	a5,a5,164 # 800050a4 <__boot_stack__+0xf80050a5>
8000309e:	43d8                	lw	a4,4(a5)
800030a0:	c6d8                	sw	a4,12(a3)
800030a2:	c714                	sw	a3,8(a4)
800030a4:	c3d4                	sw	a3,4(a5)
800030a6:	0805                	addi	a6,a6,1
800030a8:	0107a023          	sw	a6,0(a5)
800030ac:	b72d                	j	80002fd6 <_ZN4EPOS1S5Alarm7handlerEj+0x86>

800030ae <_GLOBAL__sub_I__ZN4EPOS1S5Alarm6_timerE>:
800030ae:	800057b7          	lui	a5,0x80005
800030b2:	0a478793          	addi	a5,a5,164 # 800050a4 <__boot_stack__+0xf80050a5>
800030b6:	0007a023          	sw	zero,0(a5)
800030ba:	0007a223          	sw	zero,4(a5)
800030be:	0007a423          	sw	zero,8(a5)
800030c2:	8082                	ret

800030c4 <_GLOBAL__sub_I__ZN4EPOS1S14Serial_Display7_engineE>:
800030c4:	100007b7          	lui	a5,0x10000
800030c8:	470d                	li	a4,3
800030ca:	00e781a3          	sb	a4,3(a5) # 10000003 <_vector_table-0x6ffffffd>
800030ce:	4685                	li	a3,1
800030d0:	00d78123          	sb	a3,2(a5)
800030d4:	f8300693          	li	a3,-125
800030d8:	00d781a3          	sb	a3,3(a5)
800030dc:	46b5                	li	a3,13
800030de:	00d78023          	sb	a3,0(a5)
800030e2:	000780a3          	sb	zero,1(a5)
800030e6:	00e781a3          	sb	a4,3(a5)
800030ea:	8082                	ret

800030ec <_ZN4EPOS1S2IC8dispatchEv>:
800030ec:	1141                	addi	sp,sp,-16
800030ee:	c606                	sw	ra,12(sp)
800030f0:	34202573          	csrr	a0,mcause
800030f4:	03f57513          	andi	a0,a0,63
800030f8:	800057b7          	lui	a5,0x80005
800030fc:	00251713          	slli	a4,a0,0x2
80003100:	0b078793          	addi	a5,a5,176 # 800050b0 <__boot_stack__+0xf80050b1>
80003104:	97ba                	add	a5,a5,a4
80003106:	439c                	lw	a5,0(a5)
80003108:	9782                	jalr	a5
8000310a:	40b2                	lw	ra,12(sp)
8000310c:	0141                	addi	sp,sp,16
8000310e:	8082                	ret

80003110 <_ZN4EPOS1S2IC5entryEv>:
80003110:	7119                	addi	sp,sp,-128
80003112:	c206                	sw	ra,4(sp)
80003114:	c40a                	sw	sp,8(sp)
80003116:	c60e                	sw	gp,12(sp)
80003118:	c812                	sw	tp,16(sp)
8000311a:	ca16                	sw	t0,20(sp)
8000311c:	cc1a                	sw	t1,24(sp)
8000311e:	ce1e                	sw	t2,28(sp)
80003120:	d022                	sw	s0,32(sp)
80003122:	d226                	sw	s1,36(sp)
80003124:	d42a                	sw	a0,40(sp)
80003126:	d62e                	sw	a1,44(sp)
80003128:	d832                	sw	a2,48(sp)
8000312a:	da36                	sw	a3,52(sp)
8000312c:	dc3a                	sw	a4,56(sp)
8000312e:	de3e                	sw	a5,60(sp)
80003130:	c0c2                	sw	a6,64(sp)
80003132:	c2c6                	sw	a7,68(sp)
80003134:	c4ca                	sw	s2,72(sp)
80003136:	c6ce                	sw	s3,76(sp)
80003138:	c8d2                	sw	s4,80(sp)
8000313a:	cad6                	sw	s5,84(sp)
8000313c:	ccda                	sw	s6,88(sp)
8000313e:	cede                	sw	s7,92(sp)
80003140:	d0e2                	sw	s8,96(sp)
80003142:	d2e6                	sw	s9,100(sp)
80003144:	d4ea                	sw	s10,104(sp)
80003146:	d6ee                	sw	s11,108(sp)
80003148:	d8f2                	sw	t3,112(sp)
8000314a:	daf6                	sw	t4,116(sp)
8000314c:	dcfa                	sw	t5,120(sp)
8000314e:	defe                	sw	t6,124(sp)
80003150:	00000097          	auipc	ra,0x0
80003154:	00c08093          	addi	ra,ra,12 # 8000315c <restore>
80003158:	f95ff06f          	j	800030ec <_ZN4EPOS1S2IC8dispatchEv>

8000315c <restore>:
8000315c:	4092                	lw	ra,4(sp)
8000315e:	4122                	lw	sp,8(sp)
80003160:	41b2                	lw	gp,12(sp)
80003162:	4242                	lw	tp,16(sp)
80003164:	42d2                	lw	t0,20(sp)
80003166:	4362                	lw	t1,24(sp)
80003168:	43f2                	lw	t2,28(sp)
8000316a:	5402                	lw	s0,32(sp)
8000316c:	5492                	lw	s1,36(sp)
8000316e:	5522                	lw	a0,40(sp)
80003170:	55b2                	lw	a1,44(sp)
80003172:	5642                	lw	a2,48(sp)
80003174:	56d2                	lw	a3,52(sp)
80003176:	5762                	lw	a4,56(sp)
80003178:	57f2                	lw	a5,60(sp)
8000317a:	4806                	lw	a6,64(sp)
8000317c:	4896                	lw	a7,68(sp)
8000317e:	4926                	lw	s2,72(sp)
80003180:	49b6                	lw	s3,76(sp)
80003182:	4a46                	lw	s4,80(sp)
80003184:	4ad6                	lw	s5,84(sp)
80003186:	4b66                	lw	s6,88(sp)
80003188:	4bf6                	lw	s7,92(sp)
8000318a:	5c06                	lw	s8,96(sp)
8000318c:	5c96                	lw	s9,100(sp)
8000318e:	5d26                	lw	s10,104(sp)
80003190:	5db6                	lw	s11,108(sp)
80003192:	5e46                	lw	t3,112(sp)
80003194:	5ed6                	lw	t4,116(sp)
80003196:	5f66                	lw	t5,120(sp)
80003198:	5ff6                	lw	t6,124(sp)
8000319a:	6109                	addi	sp,sp,128
8000319c:	30200073          	mret
800031a0:	8082                	ret
800031a2:	0001                	nop
800031a4:	00000013          	nop
800031a8:	00000013          	nop
800031ac:	00000013          	nop

800031b0 <_ZN4EPOS1S2IC7int_notEj>:
800031b0:	8082                	ret

800031b2 <_ZN4EPOS1S2IC21undefined_instructionEj>:
800031b2:	1141                	addi	sp,sp,-16
800031b4:	c606                	sw	ra,12(sp)
800031b6:	00000097          	auipc	ra,0x0
800031ba:	0c6080e7          	jalr	198(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
800031be:	40b2                	lw	ra,12(sp)
800031c0:	0141                	addi	sp,sp,16
800031c2:	8082                	ret

800031c4 <_ZN4EPOS1S2IC18software_interruptEj>:
800031c4:	1141                	addi	sp,sp,-16
800031c6:	c606                	sw	ra,12(sp)
800031c8:	00000097          	auipc	ra,0x0
800031cc:	0b4080e7          	jalr	180(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
800031d0:	40b2                	lw	ra,12(sp)
800031d2:	0141                	addi	sp,sp,16
800031d4:	8082                	ret

800031d6 <_ZN4EPOS1S2IC14prefetch_abortEj>:
800031d6:	1141                	addi	sp,sp,-16
800031d8:	c606                	sw	ra,12(sp)
800031da:	00000097          	auipc	ra,0x0
800031de:	0a2080e7          	jalr	162(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
800031e2:	40b2                	lw	ra,12(sp)
800031e4:	0141                	addi	sp,sp,16
800031e6:	8082                	ret

800031e8 <_ZN4EPOS1S2IC10data_abortEj>:
800031e8:	1141                	addi	sp,sp,-16
800031ea:	c606                	sw	ra,12(sp)
800031ec:	00000097          	auipc	ra,0x0
800031f0:	090080e7          	jalr	144(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
800031f4:	40b2                	lw	ra,12(sp)
800031f6:	0141                	addi	sp,sp,16
800031f8:	8082                	ret

800031fa <_ZN4EPOS1S2IC8reservedEj>:
800031fa:	1141                	addi	sp,sp,-16
800031fc:	c606                	sw	ra,12(sp)
800031fe:	00000097          	auipc	ra,0x0
80003202:	07e080e7          	jalr	126(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
80003206:	40b2                	lw	ra,12(sp)
80003208:	0141                	addi	sp,sp,16
8000320a:	8082                	ret

8000320c <_ZN4EPOS1S2IC18exception_handlingEv>:
8000320c:	1141                	addi	sp,sp,-16
8000320e:	c606                	sw	ra,12(sp)
80003210:	34202573          	csrr	a0,mcause
80003214:	03f57513          	andi	a0,a0,63
80003218:	47bd                	li	a5,15
8000321a:	00a7ef63          	bltu	a5,a0,80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>
8000321e:	00251793          	slli	a5,a0,0x2
80003222:	80004737          	lui	a4,0x80004
80003226:	a6870713          	addi	a4,a4,-1432 # 80003a68 <__boot_stack__+0xf8003a69>
8000322a:	97ba                	add	a5,a5,a4
8000322c:	439c                	lw	a5,0(a5)
8000322e:	8782                	jr	a5
80003230:	00000097          	auipc	ra,0x0
80003234:	fa6080e7          	jalr	-90(ra) # 800031d6 <_ZN4EPOS1S2IC14prefetch_abortEj>
80003238:	00000097          	auipc	ra,0x0
8000323c:	044080e7          	jalr	68(ra) # 8000327c <_ZN4EPOS1S7Machine5panicEv>
80003240:	40b2                	lw	ra,12(sp)
80003242:	0141                	addi	sp,sp,16
80003244:	8082                	ret
80003246:	4509                	li	a0,2
80003248:	00000097          	auipc	ra,0x0
8000324c:	f6a080e7          	jalr	-150(ra) # 800031b2 <_ZN4EPOS1S2IC21undefined_instructionEj>
80003250:	b7e5                	j	80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>
80003252:	450d                	li	a0,3
80003254:	00000097          	auipc	ra,0x0
80003258:	f70080e7          	jalr	-144(ra) # 800031c4 <_ZN4EPOS1S2IC18software_interruptEj>
8000325c:	bff1                	j	80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>
8000325e:	00000097          	auipc	ra,0x0
80003262:	f8a080e7          	jalr	-118(ra) # 800031e8 <_ZN4EPOS1S2IC10data_abortEj>
80003266:	bfc9                	j	80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>
80003268:	00000097          	auipc	ra,0x0
8000326c:	f92080e7          	jalr	-110(ra) # 800031fa <_ZN4EPOS1S2IC8reservedEj>
80003270:	b7e1                	j	80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>
80003272:	00000097          	auipc	ra,0x0
80003276:	f76080e7          	jalr	-138(ra) # 800031e8 <_ZN4EPOS1S2IC10data_abortEj>
8000327a:	bf7d                	j	80003238 <_ZN4EPOS1S2IC18exception_handlingEv+0x2c>

8000327c <_ZN4EPOS1S7Machine5panicEv>:
8000327c:	4781                	li	a5,0
8000327e:	30479073          	csrw	mie,a5
80003282:	05000693          	li	a3,80
80003286:	80004637          	lui	a2,0x80004
8000328a:	aa860613          	addi	a2,a2,-1368 # 80003aa8 <__boot_stack__+0xf8003aa9>
8000328e:	4825                	li	a6,9
80003290:	100007b7          	lui	a5,0x10000
80003294:	800055b7          	lui	a1,0x80005
80003298:	4529                	li	a0,10
8000329a:	4335                	li	t1,13
8000329c:	800058b7          	lui	a7,0x80005
800032a0:	04f00e13          	li	t3,79
800032a4:	a005                	j	800032c4 <_ZN4EPOS1S7Machine5panicEv+0x48>
800032a6:	0057c703          	lbu	a4,5(a5) # 10000005 <_vector_table-0x6ffffffb>
800032aa:	02077713          	andi	a4,a4,32
800032ae:	df65                	beqz	a4,800032a6 <_ZN4EPOS1S7Machine5panicEv+0x2a>
800032b0:	01078023          	sb	a6,0(a5)
800032b4:	06c5a703          	lw	a4,108(a1) # 8000506c <__boot_stack__+0xf800506d>
800032b8:	0721                	addi	a4,a4,8
800032ba:	06e5a623          	sw	a4,108(a1)
800032be:	00064683          	lbu	a3,0(a2)
800032c2:	cead                	beqz	a3,8000333c <_ZN4EPOS1S7Machine5panicEv+0xc0>
800032c4:	0605                	addi	a2,a2,1
800032c6:	ff0680e3          	beq	a3,a6,800032a6 <_ZN4EPOS1S7Machine5panicEv+0x2a>
800032ca:	02a69863          	bne	a3,a0,800032fa <_ZN4EPOS1S7Machine5panicEv+0x7e>
800032ce:	0057c703          	lbu	a4,5(a5)
800032d2:	02077713          	andi	a4,a4,32
800032d6:	df65                	beqz	a4,800032ce <_ZN4EPOS1S7Machine5panicEv+0x52>
800032d8:	00678023          	sb	t1,0(a5)
800032dc:	0057c703          	lbu	a4,5(a5)
800032e0:	02077713          	andi	a4,a4,32
800032e4:	df65                	beqz	a4,800032dc <_ZN4EPOS1S7Machine5panicEv+0x60>
800032e6:	00a78023          	sb	a0,0(a5)
800032ea:	0605a623          	sw	zero,108(a1)
800032ee:	0688a703          	lw	a4,104(a7) # 80005068 <__boot_stack__+0xf8005069>
800032f2:	0705                	addi	a4,a4,1
800032f4:	06e8a423          	sw	a4,104(a7)
800032f8:	b7d9                	j	800032be <_ZN4EPOS1S7Machine5panicEv+0x42>
800032fa:	06c5a703          	lw	a4,108(a1)
800032fe:	0705                	addi	a4,a4,1
80003300:	06e5a623          	sw	a4,108(a1)
80003304:	0057c703          	lbu	a4,5(a5)
80003308:	02077713          	andi	a4,a4,32
8000330c:	df65                	beqz	a4,80003304 <_ZN4EPOS1S7Machine5panicEv+0x88>
8000330e:	00d78023          	sb	a3,0(a5)
80003312:	06c5a703          	lw	a4,108(a1)
80003316:	faee54e3          	bge	t3,a4,800032be <_ZN4EPOS1S7Machine5panicEv+0x42>
8000331a:	0057c703          	lbu	a4,5(a5)
8000331e:	02077713          	andi	a4,a4,32
80003322:	df65                	beqz	a4,8000331a <_ZN4EPOS1S7Machine5panicEv+0x9e>
80003324:	00678023          	sb	t1,0(a5)
80003328:	0057c703          	lbu	a4,5(a5)
8000332c:	02077713          	andi	a4,a4,32
80003330:	df65                	beqz	a4,80003328 <_ZN4EPOS1S7Machine5panicEv+0xac>
80003332:	00a78023          	sb	a0,0(a5)
80003336:	0605a623          	sw	zero,108(a1)
8000333a:	b751                	j	800032be <_ZN4EPOS1S7Machine5panicEv+0x42>
8000333c:	10500073          	wfi
80003340:	8082                	ret

80003342 <_ZN4EPOS1S5Timer11int_handlerEj>:
80003342:	1141                	addi	sp,sp,-16
80003344:	c606                	sw	ra,12(sp)
80003346:	c422                	sw	s0,8(sp)
80003348:	842a                	mv	s0,a0
8000334a:	0200c7b7          	lui	a5,0x200c
8000334e:	ff87a703          	lw	a4,-8(a5) # 200bff8 <_vector_table-0x7dff4008>
80003352:	f14027f3          	csrr	a5,mhartid
80003356:	8b8d                	andi	a5,a5,3
80003358:	6685                	lui	a3,0x1
8000335a:	80068693          	addi	a3,a3,-2048 # 800 <_vector_table-0x7ffff800>
8000335e:	97b6                	add	a5,a5,a3
80003360:	078e                	slli	a5,a5,0x3
80003362:	020006b7          	lui	a3,0x2000
80003366:	97b6                	add	a5,a5,a3
80003368:	6689                	lui	a3,0x2
8000336a:	71068693          	addi	a3,a3,1808 # 2710 <_vector_table-0x7fffd8f0>
8000336e:	9736                	add	a4,a4,a3
80003370:	c398                	sw	a4,0(a5)
80003372:	800057b7          	lui	a5,0x80005
80003376:	0707a783          	lw	a5,112(a5) # 80005070 <__boot_stack__+0xf8005071>
8000337a:	cb99                	beqz	a5,80003390 <_ZN4EPOS1S5Timer11int_handlerEj+0x4e>
8000337c:	f1402773          	csrr	a4,mhartid
80003380:	8b0d                	andi	a4,a4,3
80003382:	070a                	slli	a4,a4,0x2
80003384:	97ba                	add	a5,a5,a4
80003386:	47d8                	lw	a4,12(a5)
80003388:	177d                	addi	a4,a4,-1
8000338a:	c7d8                	sw	a4,12(a5)
8000338c:	02e05463          	blez	a4,800033b4 <_ZN4EPOS1S5Timer11int_handlerEj+0x72>
80003390:	f14027f3          	csrr	a5,mhartid
80003394:	8b8d                	andi	a5,a5,3
80003396:	eb99                	bnez	a5,800033ac <_ZN4EPOS1S5Timer11int_handlerEj+0x6a>
80003398:	800057b7          	lui	a5,0x80005
8000339c:	0747a783          	lw	a5,116(a5) # 80005074 <__boot_stack__+0xf8005075>
800033a0:	c791                	beqz	a5,800033ac <_ZN4EPOS1S5Timer11int_handlerEj+0x6a>
800033a2:	43d8                	lw	a4,4(a5)
800033a4:	c7d8                	sw	a4,12(a5)
800033a6:	4fdc                	lw	a5,28(a5)
800033a8:	8522                	mv	a0,s0
800033aa:	9782                	jalr	a5
800033ac:	40b2                	lw	ra,12(sp)
800033ae:	4422                	lw	s0,8(sp)
800033b0:	0141                	addi	sp,sp,16
800033b2:	8082                	ret
800033b4:	80005737          	lui	a4,0x80005
800033b8:	07070713          	addi	a4,a4,112 # 80005070 <__boot_stack__+0xf8005071>
800033bc:	4314                	lw	a3,0(a4)
800033be:	f14027f3          	csrr	a5,mhartid
800033c2:	8b8d                	andi	a5,a5,3
800033c4:	42d0                	lw	a2,4(a3)
800033c6:	078a                	slli	a5,a5,0x2
800033c8:	97b6                	add	a5,a5,a3
800033ca:	c7d0                	sw	a2,12(a5)
800033cc:	431c                	lw	a5,0(a4)
800033ce:	4fdc                	lw	a5,28(a5)
800033d0:	9782                	jalr	a5
800033d2:	bf7d                	j	80003390 <_ZN4EPOS1S5Timer11int_handlerEj+0x4e>

800033d4 <_ZNVK4EPOS1S3CPU7Context4loadEv>:
800033d4:	800057b7          	lui	a5,0x80005
800033d8:	0447a803          	lw	a6,68(a5) # 80005044 <__boot_stack__+0xf8005045>
800033dc:	87ffc7b7          	lui	a5,0x87ffc
800033e0:	c39c                	sw	a5,0(a5)
800033e2:	6691                	lui	a3,0x4
800033e4:	c3d4                	sw	a3,4(a5)
800033e6:	0007a423          	sw	zero,8(a5) # 87ffc008 <__boot_stack__+0xffffc009>
800033ea:	0007a623          	sw	zero,12(a5)
800033ee:	00c82703          	lw	a4,12(a6)
800033f2:	9736                	add	a4,a4,a3
800033f4:	00e82623          	sw	a4,12(a6)
800033f8:	438c                	lw	a1,0(a5)
800033fa:	43d0                	lw	a2,4(a5)
800033fc:	962e                	add	a2,a2,a1
800033fe:	00482783          	lw	a5,4(a6)
80003402:	cbc5                	beqz	a5,800034b2 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xde>
80003404:	873e                	mv	a4,a5
80003406:	4314                	lw	a3,0(a4)
80003408:	00d60463          	beq	a2,a3,80003410 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x3c>
8000340c:	4758                	lw	a4,12(a4)
8000340e:	ff65                	bnez	a4,80003406 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x32>
80003410:	4394                	lw	a3,0(a5)
80003412:	43d0                	lw	a2,4(a5)
80003414:	96b2                	add	a3,a3,a2
80003416:	0ad58063          	beq	a1,a3,800034b6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xe2>
8000341a:	47dc                	lw	a5,12(a5)
8000341c:	fbf5                	bnez	a5,80003410 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x3c>
8000341e:	00082783          	lw	a5,0(a6)
80003422:	c39d                	beqz	a5,80003448 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x74>
80003424:	00882683          	lw	a3,8(a6)
80003428:	87ffc7b7          	lui	a5,0x87ffc
8000342c:	c6dc                	sw	a5,12(a3)
8000342e:	00882683          	lw	a3,8(a6)
80003432:	c794                	sw	a3,8(a5)
80003434:	0007a623          	sw	zero,12(a5) # 87ffc00c <__boot_stack__+0xffffc00d>
80003438:	00f82423          	sw	a5,8(a6)
8000343c:	00082783          	lw	a5,0(a6)
80003440:	0785                	addi	a5,a5,1
80003442:	00f82023          	sw	a5,0(a6)
80003446:	a005                	j	80003466 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x92>
80003448:	87ffc7b7          	lui	a5,0x87ffc
8000344c:	0007a423          	sw	zero,8(a5) # 87ffc008 <__boot_stack__+0xffffc009>
80003450:	0007a623          	sw	zero,12(a5)
80003454:	00f82223          	sw	a5,4(a6)
80003458:	00f82423          	sw	a5,8(a6)
8000345c:	00082783          	lw	a5,0(a6)
80003460:	0785                	addi	a5,a5,1
80003462:	00f82023          	sw	a5,0(a6)
80003466:	4781                	li	a5,0
80003468:	eb21                	bnez	a4,800034b8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xe4>
8000346a:	a069                	j	800034f4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x120>
8000346c:	00082223          	sw	zero,4(a6)
80003470:	00082423          	sw	zero,8(a6)
80003474:	00082023          	sw	zero,0(a6)
80003478:	a0bd                	j	800034e6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
8000347a:	c6b5                	beqz	a3,800034e6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
8000347c:	00482703          	lw	a4,4(a6)
80003480:	4758                	lw	a4,12(a4)
80003482:	00e82223          	sw	a4,4(a6)
80003486:	00072423          	sw	zero,8(a4)
8000348a:	00082703          	lw	a4,0(a6)
8000348e:	177d                	addi	a4,a4,-1
80003490:	00e82023          	sw	a4,0(a6)
80003494:	a889                	j	800034e6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80003496:	caa1                	beqz	a3,800034e6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80003498:	00882703          	lw	a4,8(a6)
8000349c:	4718                	lw	a4,8(a4)
8000349e:	00e82423          	sw	a4,8(a6)
800034a2:	00072623          	sw	zero,12(a4)
800034a6:	00082703          	lw	a4,0(a6)
800034aa:	177d                	addi	a4,a4,-1
800034ac:	00e82023          	sw	a4,0(a6)
800034b0:	a81d                	j	800034e6 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
800034b2:	873e                	mv	a4,a5
800034b4:	b7ad                	j	8000341e <_ZNVK4EPOS1S3CPU7Context4loadEv+0x4a>
800034b6:	cb0d                	beqz	a4,800034e8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x114>
800034b8:	87ffc637          	lui	a2,0x87ffc
800034bc:	4254                	lw	a3,4(a2)
800034be:	434c                	lw	a1,4(a4)
800034c0:	96ae                	add	a3,a3,a1
800034c2:	c254                	sw	a3,4(a2)
800034c4:	00082683          	lw	a3,0(a6)
800034c8:	4605                	li	a2,1
800034ca:	fac681e3          	beq	a3,a2,8000346c <_ZNVK4EPOS1S3CPU7Context4loadEv+0x98>
800034ce:	470c                	lw	a1,8(a4)
800034d0:	d5cd                	beqz	a1,8000347a <_ZNVK4EPOS1S3CPU7Context4loadEv+0xa6>
800034d2:	4750                	lw	a2,12(a4)
800034d4:	d269                	beqz	a2,80003496 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xc2>
800034d6:	c5d0                	sw	a2,12(a1)
800034d8:	4718                	lw	a4,8(a4)
800034da:	c618                	sw	a4,8(a2)
800034dc:	00082703          	lw	a4,0(a6)
800034e0:	177d                	addi	a4,a4,-1
800034e2:	00e82023          	sw	a4,0(a6)
800034e6:	c799                	beqz	a5,800034f4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x120>
800034e8:	43d8                	lw	a4,4(a5)
800034ea:	87ffc6b7          	lui	a3,0x87ffc
800034ee:	42d4                	lw	a3,4(a3)
800034f0:	9736                	add	a4,a4,a3
800034f2:	c3d8                	sw	a4,4(a5)
800034f4:	812a                	mv	sp,a0
800034f6:	07410113          	addi	sp,sp,116
800034fa:	ff812283          	lw	t0,-8(sp)
800034fe:	ff412303          	lw	t1,-12(sp)
80003502:	ff012383          	lw	t2,-16(sp)
80003506:	fec12403          	lw	s0,-20(sp)
8000350a:	fe812483          	lw	s1,-24(sp)
8000350e:	fe412503          	lw	a0,-28(sp)
80003512:	fe012583          	lw	a1,-32(sp)
80003516:	fdc12603          	lw	a2,-36(sp)
8000351a:	fd812683          	lw	a3,-40(sp)
8000351e:	fd412703          	lw	a4,-44(sp)
80003522:	fd012783          	lw	a5,-48(sp)
80003526:	fcc12803          	lw	a6,-52(sp)
8000352a:	fc812883          	lw	a7,-56(sp)
8000352e:	fc412903          	lw	s2,-60(sp)
80003532:	fc012983          	lw	s3,-64(sp)
80003536:	fbc12a03          	lw	s4,-68(sp)
8000353a:	fb812a83          	lw	s5,-72(sp)
8000353e:	fb412b03          	lw	s6,-76(sp)
80003542:	fb012b83          	lw	s7,-80(sp)
80003546:	fac12c03          	lw	s8,-84(sp)
8000354a:	fa812c83          	lw	s9,-88(sp)
8000354e:	fa412d03          	lw	s10,-92(sp)
80003552:	fa012d83          	lw	s11,-96(sp)
80003556:	f9c12e03          	lw	t3,-100(sp)
8000355a:	f9812e83          	lw	t4,-104(sp)
8000355e:	f9412f03          	lw	t5,-108(sp)
80003562:	f9012f83          	lw	t6,-112(sp)
80003566:	f8c12083          	lw	ra,-116(sp)
8000356a:	ffc12f83          	lw	t6,-4(sp)
8000356e:	000f8067          	jr	t6
80003572:	8082                	ret

80003574 <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>:
80003574:	fff12c23          	sw	t6,-8(sp)
80003578:	00000f97          	auipc	t6,0x0
8000357c:	106f8f93          	addi	t6,t6,262 # 8000367e <.ret>
80003580:	fff12e23          	sw	t6,-4(sp)
80003584:	ff812f83          	lw	t6,-8(sp)
80003588:	fe512c23          	sw	t0,-8(sp)
8000358c:	fe612a23          	sw	t1,-12(sp)
80003590:	fe712823          	sw	t2,-16(sp)
80003594:	fe812623          	sw	s0,-20(sp)
80003598:	fe912423          	sw	s1,-24(sp)
8000359c:	fea12223          	sw	a0,-28(sp)
800035a0:	feb12023          	sw	a1,-32(sp)
800035a4:	fcc12e23          	sw	a2,-36(sp)
800035a8:	fcd12c23          	sw	a3,-40(sp)
800035ac:	fce12a23          	sw	a4,-44(sp)
800035b0:	fcf12823          	sw	a5,-48(sp)
800035b4:	fd012623          	sw	a6,-52(sp)
800035b8:	fd112423          	sw	a7,-56(sp)
800035bc:	fd212223          	sw	s2,-60(sp)
800035c0:	fd312023          	sw	s3,-64(sp)
800035c4:	fb412e23          	sw	s4,-68(sp)
800035c8:	fb512c23          	sw	s5,-72(sp)
800035cc:	fb612a23          	sw	s6,-76(sp)
800035d0:	fb712823          	sw	s7,-80(sp)
800035d4:	fb812623          	sw	s8,-84(sp)
800035d8:	fb912423          	sw	s9,-88(sp)
800035dc:	fba12223          	sw	s10,-92(sp)
800035e0:	fbb12023          	sw	s11,-96(sp)
800035e4:	f9c12e23          	sw	t3,-100(sp)
800035e8:	f9d12c23          	sw	t4,-104(sp)
800035ec:	f9e12a23          	sw	t5,-108(sp)
800035f0:	f9f12823          	sw	t6,-112(sp)
800035f4:	f8112623          	sw	ra,-116(sp)
800035f8:	f8c10113          	addi	sp,sp,-116
800035fc:	00252023          	sw	sp,0(a0)
80003600:	812e                	mv	sp,a1
80003602:	07410113          	addi	sp,sp,116
80003606:	ff812283          	lw	t0,-8(sp)
8000360a:	ff412303          	lw	t1,-12(sp)
8000360e:	ff012383          	lw	t2,-16(sp)
80003612:	fec12403          	lw	s0,-20(sp)
80003616:	fe812483          	lw	s1,-24(sp)
8000361a:	fe412503          	lw	a0,-28(sp)
8000361e:	fe012583          	lw	a1,-32(sp)
80003622:	fdc12603          	lw	a2,-36(sp)
80003626:	fd812683          	lw	a3,-40(sp)
8000362a:	fd412703          	lw	a4,-44(sp)
8000362e:	fd012783          	lw	a5,-48(sp)
80003632:	fcc12803          	lw	a6,-52(sp)
80003636:	fc812883          	lw	a7,-56(sp)
8000363a:	fc412903          	lw	s2,-60(sp)
8000363e:	fc012983          	lw	s3,-64(sp)
80003642:	fbc12a03          	lw	s4,-68(sp)
80003646:	fb812a83          	lw	s5,-72(sp)
8000364a:	fb412b03          	lw	s6,-76(sp)
8000364e:	fb012b83          	lw	s7,-80(sp)
80003652:	fac12c03          	lw	s8,-84(sp)
80003656:	fa812c83          	lw	s9,-88(sp)
8000365a:	fa412d03          	lw	s10,-92(sp)
8000365e:	fa012d83          	lw	s11,-96(sp)
80003662:	f9c12e03          	lw	t3,-100(sp)
80003666:	f9812e83          	lw	t4,-104(sp)
8000366a:	f9412f03          	lw	t5,-108(sp)
8000366e:	f9012f83          	lw	t6,-112(sp)
80003672:	f8c12083          	lw	ra,-116(sp)
80003676:	ffc12f83          	lw	t6,-4(sp)
8000367a:	000f8067          	jr	t6

8000367e <.ret>:
8000367e:	00008067          	ret

80003682 <_GLOBAL__sub_I__ZN4EPOS1S3MMU5_freeE>:
80003682:	800067b7          	lui	a5,0x80006
80003686:	13078793          	addi	a5,a5,304 # 80006130 <__boot_stack__+0xf8006131>
8000368a:	0007a023          	sw	zero,0(a5)
8000368e:	0007a223          	sw	zero,4(a5)
80003692:	0007a423          	sw	zero,8(a5)
80003696:	0007a623          	sw	zero,12(a5)
8000369a:	8082                	ret

Disassembly of section .fini:

8000369c <_fini>:
8000369c:	800057b7          	lui	a5,0x80005
800036a0:	0007a783          	lw	a5,0(a5) # 80005000 <__boot_stack__+0xf8005001>
800036a4:	c391                	beqz	a5,800036a8 <_fini+0xc>
800036a6:	8082                	ret
800036a8:	800057b7          	lui	a5,0x80005
800036ac:	4705                	li	a4,1
800036ae:	00e7a023          	sw	a4,0(a5) # 80005000 <__boot_stack__+0xf8005001>
800036b2:	800057b7          	lui	a5,0x80005
800036b6:	ffc7a783          	lw	a5,-4(a5) # 80004ffc <__boot_stack__+0xf8004ffd>
800036ba:	d7f5                	beqz	a5,800036a6 <_fini+0xa>
800036bc:	1141                	addi	sp,sp,-16
800036be:	c606                	sw	ra,12(sp)
800036c0:	c422                	sw	s0,8(sp)
800036c2:	80005437          	lui	s0,0x80005
800036c6:	ffc40413          	addi	s0,s0,-4 # 80004ffc <__boot_stack__+0xf8004ffd>
800036ca:	9782                	jalr	a5
800036cc:	0411                	addi	s0,s0,4
800036ce:	401c                	lw	a5,0(s0)
800036d0:	ffed                	bnez	a5,800036ca <_fini+0x2e>
800036d2:	40b2                	lw	ra,12(sp)
800036d4:	4422                	lw	s0,8(sp)
800036d6:	0141                	addi	sp,sp,16
800036d8:	8082                	ret
