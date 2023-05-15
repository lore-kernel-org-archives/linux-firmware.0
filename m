Return-Path: <SRS0=+oOh=BE=bounces.foscoredevelopment.org=workshops=foscoredevelopment.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46BFC77B75
	for <linux-firmware@archiver.kernel.org>; Mon, 15 May 2023 14:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F77FC4339B; Mon, 15 May 2023 14:19:30 +0000 (UTC)
Received: from np20.mxout.mta3.net (np20.mxout.mta3.net [216.169.98.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44B2EC433D2
	for <linux-firmware@kernel.org>; Mon, 15 May 2023 14:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44B2EC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=foscoredevelopment.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bounces.foscoredevelopment.org
DKIM-Signature: v=1; a=rsa-sha256; d=foscoredevelopment.org; s=api;
	c=relaxed/simple; t=1684160364;
	h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
	bh=PgNobRalMGcQTXDD1xq8tfm/1drXDtXGvpfXpzaTUX0=;
	b=gjRI185kwZa5LUNCUGcIs0hhxbP5MSjEYpoGTTiLWrKL9tG+0Oy6xL6ELTBvh2lLn4V2tCzmupy
	UejiW1xu5lIIVaYMfYaMmGOF0AJ021EKK5xSDWfZsJdaP/pqZuUDPWhNZeWwo9Jjoe77FUhUKSfoe
	cMkSnqQceMOPZQNfz8s=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
	c=relaxed/simple; t=1684160364;
	h=from:date:subject:reply-to:to:list-unsubscribe;
	bh=PgNobRalMGcQTXDD1xq8tfm/1drXDtXGvpfXpzaTUX0=;
	b=TdN6UTUbfUuvFuHwQvRPcM6ro0FijcTbljwJ0OEH6hXJPYA9tejt70w5u5ObuMzV8xDs/wmYq9X
	TeLDfFCI/qtX29NNA9i5eP61MXZDD/vPZSyDXEvjW9no1ZEke2sZp8Yv9MX1/XaDb9O2kuM32R5G1
	+cNMvRYlRfWA10NBycA=
From: Foscore Development Center <workshops@foscoredevelopment.org>
Date: Mon, 15 May 2023 14:19:24 +0000
Subject: RE: Invitation to Impact Evaluation for Evidence Based Policy in
 Development Workshop June 2023 Mombasa Kenya
Message-Id: <4ujy5oyg2foi.mTeKG4N2A7JWBsP054A_3w2@email.foscoredevelopment.org>
Reply-To: workshops@foscoredevelopment.org
Sender: workshops@foscoredevelopment.org
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
List-Unsubscribe: 
 =?us-ascii?q?=3Cmailto=3Aunsubscribe+mTeKG4N2A7JWBsP054A=5F3w2=40bounces=2Eelasticem?=
 =?us-ascii?q?ail=2Enet=3Fsubject=3Dunsubscribe=3E=2C?=
 =?us-ascii?q?_=3Chttp=3A=2F=2Femail=2Efoscoredevelopment=2Eorg=2Ftracking=2Funsubscribe=3Fmsg?=
 =?us-ascii?q?id=3DmTeKG4N2A7JWBsP054A=5F3w2&c=3D1559414682878703408=3E?=
X-Msg-EID: mTeKG4N2A7JWBsP054A_3w2
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=-eZCfCVbQ1QKYCZW/PeMYSzrxglE29MF223WKzQ=="

--=-eZCfCVbQ1QKYCZW/PeMYSzrxglE29MF223WKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQoNCjxodHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGlj
az9kPWxLUEdiYkFRWWxFbTVFbXdKOFFLRkl5Z0RfTXFlekFFaEhaSGVEZ3BuakhUQUplcUNt
aVBIYzU0S1AyMTh6cnVkVTBWQXJjVEhadDMtMWtEbDR6dTNHVXBTMU1LbXlhZnc5V1MxMDZs
eW1ROWgzZEdDMElNcnpfTTFlaTZRbmxRQmVEWjQzWlJ5U1liWlFwRFdyR1VSZ3RCM2l0N0Q3
VlZpeEZtVUFxUkNzVVl5eFZYcmJ6OTVyMmhabnRubS1UaXNOY0VXcC13b3lZQWRCdm5MUVNE
V0VyVG9ZVkQwbGRtdzctUkVmWUJtbkFzNnE4a0hhOVZvd0FIV3VOWWdwZUd5MUFWZjZNVmhm
NE1rY0JZaHBZZ1RVTTE+DQpJbnZpdGF0aW9uIHRvIEltcGFjdCBFdmFsdWF0aW9uIGZvciBF
dmlkZW5jZSBCYXNlZCBQb2xpY3kgaW4gDQpEZXZlbG9wbWVudCBXb3Jrc2hvcA0KDQo8aHR0
cDovL2VtYWlsLmZvc2NvcmVkZXZlbG9wbWVudC5vcmcvdHJhY2tpbmcvY2xpY2s/ZD1wV3Ny
WWtZYXEtRXd1djdMVXFibng0M3NGNS1WMmtnNnZULVRENnkxaEtMZ1FLWDU0OUY3RGpKaVQ2
dDhyLWN2OUhxYUFid2dHM25PVmUzZXRRMURzRHZWVGtGcFhSd05TRXRTNG9LTU5HblRVWHRl
YnpES3RNdU9xZXA1MGV4cUxySTRKdk5QSDZrZE9oMGNCeUg0OTZJMT4NCkN1c3RvbWl6ZWQg
UHJvZ3JhbW1lDQoNCjxodHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFj
a2luZy9jbGljaz9kPVJabUFLVXBoYzZnYnoyZ2NlTFA2UklNcWxHRTMxR3ZpM1I2YnplX0My
Z3pEaGxqR0pRNGRPOV9QSXRtX3pOYUcwZ29qY0hFTEJ0QXdJQ1JqS0hZVzc3N010V1J5SGM0
UC1TVFRyTGZCT2RTRXFSeHgyVm5rRE9sRG9IVmpXNURlcnRUenM0cVB3T1Z6b2FFa3B1UFYz
a2sxPg0KSW5ob3VzZSANClByb2dyYW1tZQ0KDQo8aHR0cDovL2VtYWlsLmZvc2NvcmVkZXZl
bG9wbWVudC5vcmcvdHJhY2tpbmcvY2xpY2s/ZD1uTDJPM0N2N3d6X0V2V2VhRWtlaS1MeFBf
cE5CNlM2d3cybWdlbzB3cnFQNlpsaG12Ykh5UGJxbzN0TXJhbnVPTjA5VjJ0c1U4TEdseEl1
U1dISVRmVzhaLWQ0bk9NbXFmSDk1WU1KdjJvRWhnb0R4LXU1OVh1R2NlZF9oUzBJUUNTZjk0
OEZGUi0wSE8xVXlvcW5jdUpZMT4NCk9ubGluZSANClRyYWluaW5nDQoNCjxodHRwOi8vZW1h
aWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPW9ubk1nWnJHMmx6
RVlNVC1LZ2djdEZpOHQ3U3o4OUdYUE1oVG1ua052WXkwckdLMVZLVy11UF8yUGlFdm9JMDQx
SFEtTTVUSmt0ckNtUjlITEdaSjNoV0swNjNscHNxcWdKak8xU1ZZZ0ttMGVYeGV0WEw1WW5y
cUZEcDI2QXktTEIwM3NtXy11ejBmT0VFX3FCWVdibzgxPg0KU3R1ZHkgDQpUb3VyDQoNCjxo
dHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPXJB
ZldYSVJYcVFYWGxyRDR3b3VfUmxKSVNKNXdDaWdKaHRFaG1pSDJsdE5HOUJQMlIzbmw0dEZa
eVIxdS1IQTZaeDBqbVVFR1NxYWJNY0t0MEYyUHhCOG9LYm01TXFDLUwzQlVfYzNqOW10R1VF
TDJORnotUHZBU0p0dUxZV0hObVBpUG5DV05LUmNXMHAzX0tZVWpWaGVnMEhmY0VuTDVXdGlt
aVVxOHM5cHZONC1NSWVzOHdPMEE0VERxTm1BeDh3Mj4NCkRvd25sb2FkIA0KUERGDQoNCkNv
dXJzZSANCiAgICAgIERhdGUNCkR1cmF0aW9uDQpMb2NhdGlvbg0KUmVnaXN0cmF0aW9uDQox
OS8wNi8yMDIzwqBUb8KgMzAvMDYvMjAyMw0KMTAgDQogICAgICBEYXlzDQpNb21iYXNhLCAN
CiAgICAgIEtlbnlhDQoNCjxodHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90
cmFja2luZy9jbGljaz9kPUVXanZNNEd5TnJma0oxMnozd1NnQ2p4ZGVqLUdFWXVFWnFsOWI1
SkFFQ214UEJoalprOTlXTkI2bEFzU0hGWEJxT0NhenZLUU1HLXdITTgzS1JJTUhJUDFaTFpz
eEhKaDFkUTVwRWxrWHNubmpqTG9GTUNydlVaQlVGSlJWZ3ZVVk1nNndwS2dPSGNQRHNZQ091
MDFBb3ctQXl0c2FqMGNWLWYzbG04OG0zUXVBOG9abEpaRzM3cnlVV043MTZVdWVhc3BNa2Vw
SUdSQnhmR1lZOFVFVVhUdUttODUzZFR4cVI2X1c5UkZkS01qelhjWTgtTmFabmVNS3VIdF9O
NlBobF9XaVRCWnlRSGVuTnEycDgxNXg1RDItelhmVGpIVkFhM3IyeHNoaExPRDA+DQpSZWdp
c3RlciBBcyANCiAgICAgIEluZGl2aWR1YWwNCg0KPGh0dHA6Ly9lbWFpbC5mb3Njb3JlZGV2
ZWxvcG1lbnQub3JnL3RyYWNraW5nL2NsaWNrP2Q9OV9pMlFqZmxCN0hOVkFqQXROcko5c2Vv
VDhXRGF3TFFFV2MzSDJzZkNQS2o5Y2dpVElvRFU1YUxCc3g4ZFpGdjZMMGMyUHd1c0hXeHVK
cE41NDIxV3ZPQTA3d04xSUZXWTBkMG9HcGxqXzk1RV9HaV9EWEQ2SzZ1OVlCb1ZFajVrTnJ6
ZFBIa1ZzWXZfYXJ2amlCMFl6bjBpWm15Y195ZlA1eWxkMFhLV2pzVC1za3FZcVBpOUtzR1Rw
TWEwQ3JNOURJREZzLXJISDJ1aC1ZVWhiZFFTc0tGWHR6TXFSUEItQTF2QkZGZUExb3hEX2My
OFEtakZZMHpMQTZMV3pCVHk4T1RLWTRYQ3hWdHZzOV9faDFnYnc4c2ppWVhJa3FNeWlNamRD
Rm40Z1lGMD4NClJlZ2lzdGVyIEZvciBPbmxpbmUgDQogICAgICBUcmFpbmluZw0KDQo8aHR0
cDovL2VtYWlsLmZvc2NvcmVkZXZlbG9wbWVudC5vcmcvdHJhY2tpbmcvY2xpY2s/ZD1RNi00
eUVkWEQtUDhvX0xZa3hxY2lPWnAzbmNWcmRfNTJhY0tybVRBOS1LaC1zWmFOR3huMEJKcXZJ
WTJodkpRd2RMcTJnVFJIN1dwaTA0X3FydkN2LWNxczZJWUtodjVKdWh5Z09VVWxZMFJKSUFR
QjNKVXIycE5hVFZxLXZNNHNabnNjZ0c4U0JBcXJaOHp3bVl2UE9GS3FwV09QSmF3WUMzLXYt
N0ZFcWFqN3E2WlBlbF85eVRiRjFsNmN4ZTgxMWJKalZGSDBzTjcxLVRYM3laMGQzbWQ4VHZv
ME1iZ2dUaVQ2MUdja1BhN0RzVk84UE9GYWxkdUFmbUY3cTZFMUVkbG5yWm11QTBSdzc5cEFf
UDZiQTJJQ1dOejE3RkpXLWJLWW96ZW5kRlYwPg0KUmVnaXN0ZXIgQXMgQSANCiAgICBHcm91
cA0KSW50cm9kdWN0aW9uDQpUaGUgDQpjb3Vyc2UgYWltZWQgdG8gYWRkcmVzcyBhbiBpbXBv
cnRhbnQgcHJlcmVxdWlzaXRlIGZvciBpbmNvcnBvcmF0aW5nIGltcGFjdCANCmV2YWx1YXRp
b24gKElFKSBpbnRvIHByb2dyYW1tZSBkZXNpZ246IGEgdGhlb3JldGljYWwgYW5kIHByYWN0
aWNhbCB1bmRlcnN0YW5kaW5nIA0Kb2YgSUUgYXBwcm9hY2hlcyB0byBlbmFibGUgc2VsZWN0
aW9uIG9mIGFwcHJvcHJpYXRlIG1ldGhvZG9sb2dpZXMsIGNvdXBsZWQgd2l0aCANCmNhcmVm
dWwgYXBwcmFpc2FsIG9mIHRoZSByZXN1bHRpbmcgZXZpZGVuY2UuIFRoZSBjb3Vyc2UgaW50
cm9kdWNlZCBwYXJ0aWNpcGFudHMgDQp0byBjdXJyZW50IHF1YW50aXRhdGl2ZSBhcyB3ZWxs
IGFzIHF1YWxpdGF0aXZlIGV2YWx1YXRpb24gdGVjaG5pcXVlcyBmb3IgaW1wYWN0IA0KZXZh
bHVhdGlvbiBhbmQgZ2F2ZSB0aGVtIGFuIGluc2lnaHQgaW50byB0aGUgY3JpdGljYWwgdW5k
ZXJzdGFuZGluZyBvZiB0aGUgcm9sZXMgDQp0aGV5IGNhbiBwbGF5IGluIHRoZSBkZXNpZ24g
YW5kIGFzc2Vzc21lbnQgb2YgcHVibGljIHBvbGljeSBhbmQgZGV2ZWxvcG1lbnQgDQppbnRl
cnZlbnRpb25zLiBUaGUgZ3JvdXAgZW50aHVzaWFzdGljYWxseSB0YWNrbGVkIHRoZSBkaWZm
aWN1bHRpZXMgb2YgbGVhcm5pbmcgDQpTVEFUQSxOVklWTyBhbmQgdGhlIGludHJpY2FjaWVz
IG9mIGV2YWx1YXRpb24gcmVzZWFyY2ggZGVzaWducyBhbmQgZWNvbm9tZXRyaWMgDQp0ZWNo
bmlxdWVzLCBhbGwgYm9sc3RlcmVkIGJ5IHRoZSBzdXBwb3J0IG9mIHRoZSBleHBlcmllbmNl
ZCB0ZWFjaGluZyANCnRlYW0uDQrCoA0KV2hvIA0KU2hvdWxkIEF0dGVuZD8NClRoaXMgDQpj
b3Vyc2UgaXMgdGFyZ2V0ZWQgYXQgcmVzZWFyY2hlcnMsIHByb2plY3Qgc3RhZmYsIG1hbmFn
ZXJzLCBkZXZlbG9wbWVudCANCnByYWN0aXRpb25lcnMsIHBvbGljeSBtYWtlcnMgaW4gZ292
ZXJubWVudCwgTkdPcyBhbmQgZGV2ZWxvcG1lbnQgb3JnYW5pemF0aW9ucyANCndobyB3YW50
IHRvIGRldGVybWluZSB0aGUgaW1wYWN0IG9mIHRoZWlyIGludGVydmVudGlvbnMuDQrCoA0K
Tm8gDQpvZiBEYXlzDQoxMCANCkRheXMNCsKgDQpDb3Vyc2UgDQpPYmplY3RpdmVzDQrCt8Kg
wqDCoMKgwqDCoMKgwqAgDQpDb25kdWN0IA0KYSByaWdvcm91cyBpbXBhY3QgZXZhbHVhdGlv
biBvZiBhIHByb2plY3QNCsK3wqDCoMKgwqDCoMKgwqDCoCANCkxlYXJuIA0KYW5kIHByYWN0
aWNlIGVjb25vbWV0cmljIHRlY2huaXF1ZXMgZm9yIGltcGFjdCBldmFsdWF0aW9uDQrCt8Kg
wqDCoMKgwqDCoMKgwqAgDQpDYXJyeSANCm91dCBpbXBhY3QgZGF0YSBhbmFseXNpcyB1c2lu
ZyBQcm9wZW5zaXR5IE1hdGNoaW5nIGFuZCBEaWZmZXJlbmNlLWluIA0KLURpZmZlcmVuY2UN
CsK3wqDCoMKgwqDCoMKgwqDCoCANClVuZGVyc3RhbmQgDQpJRSBkZXNpZ25zOiByYW5kb21p
emVkLCBxdWFzaSBhbmQgbm9uLWV4cGVyaW1lbnRhbA0KwrfCoMKgwqDCoMKgwqDCoMKgIA0K
TGVhcm4gDQphYm91dCBldmFsdWF0aW9uIHByb2JsZW06IEF0dHJpYnV0aW9uLCBzZWxlY3Rp
b24gYW5kIHBsYWNlbWVudCANCmJpYXNlcw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KTGVhcm4g
DQphYm91dCB0aGVvcmllcyBhbmQgcHJhY3RpY2VzIG9mIGltcGFjdCBldmFsdWF0aW9uDQrC
t8KgwqDCoMKgwqDCoMKgwqAgDQpDb25kdWN0IA0Kc2FtcGxpbmcgYW5kIHBvd2VyIGNhbGN1
bGF0aW9uDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpSZXBvcnQgDQphbmQgZGlzc2VtaW5hdGUg
aW1wYWN0IGV2YWx1YXRpb24gZmluZGluZ3MNCsKgDQpDb3Vyc2UgDQpPdXRsaW5lDQpPdmVy
dmlldyANCm9mIE0mRSBGdW5kYW1lbnRhbHMgZm9yIEltcGFjdCBFdmFsdWF0aW9uDQrCt8Kg
wqDCoMKgwqDCoMKgwqAgDQpSZXN1bHRzIA0KRnJhbWV3b3JrDQrCt8KgwqDCoMKgwqDCoMKg
wqAgDQpNJkUgDQpQcm9qZWN0IEluZGljYXRvcnMNCsK3wqDCoMKgwqDCoMKgwqDCoCANCkxv
Z2ljYWwgDQpGcmFtZXdvcmsNCsK3wqDCoMKgwqDCoMKgwqDCoCANClBlcmZvcm1hbmNlIA0K
RXZhbHVhdGlvbg0KSW50cm9kdWN0aW9uIA0KdG8gSW1wYWN0IEV2YWx1YXRpb24NCsK3wqDC
oMKgwqDCoMKgwqDCoCANCkRlZmluaW5nIA0KaW1wYWN0IGV2YWx1YXRpb24NCsK3wqDCoMKg
wqDCoMKgwqDCoCANCkRlY2lkaW5nIA0Kd2hldGhlciB0byBldmFsdWF0ZQ0KwrfCoMKgwqDC
oMKgwqDCoMKgIA0KQXR0cmlidXRpb24gDQppbiBpbXBhY3QgZXZhbHVhdGlvbg0KwrfCoMKg
wqDCoMKgwqDCoMKgIA0KQ29udHJpYnV0aW9uIA0KdnMgYXR0cmlidXRpb24NCkRldGVybWlu
aW5nIA0KcG9pbnRzIG9mIEltcGFjdCBFdmFsdWF0aW9uDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQpUeXBlcyANCm9mIGV2YWx1YXRpb24gcXVlc3Rpb25zDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQpUaGVvcmllcyANCm9mIENoYW5nZQ0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KVGhlIA0KcmVz
dWx0cyBjaGFpbg0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KRXZhbHVhdGlvbiANCmh5cG90aGVz
aXMNCsK3wqDCoMKgwqDCoMKgwqDCoCANCkltcGFjdCANCmV2YWx1YXRpb24gaW5kaWNhdG9y
cw0KQ291bnRlcmZhY3R1YWxzIA0KaW4gSW1wYWN0IEV2YWx1YXRpb24NCsK3wqDCoMKgwqDC
oMKgwqDCoCANCkNhdXNhbCANCnJlZmVyZW5jZQ0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KQ29t
cGFyaXNvbiANCmdyb3VwcyBhbmQgY291bnRlcmZhY3R1YWxzDQrCt8KgwqDCoMKgwqDCoMKg
wqAgDQpFc3RpbWF0aW5nIA0KY291bnRlcmZhY3R1YWwgaW4gaW1wYWN0IGV2YWx1YXRpb24N
CsK3wqDCoMKgwqDCoMKgwqDCoCANCkltcGFjdCANCkV2YWx1YXRpb24gd2hlbiBhIENvbXBh
cmlzb24gYW5kIEJhc2VsaW5lIERhdGEgYXJlIG5vdCBhdmFpbGFibGUNCkltcGFjdCANCkV2
YWx1YXRpb24gUmVzZWFyY2ggRGVzaWducw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KRXhwZXJp
bWVudGFsIA0KRGVzaWduDQpvwqDCoMKgIA0KUmFuZG9taXplZCANCkNvbnRyb2wgVHJpYWxz
DQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpRdWFzaSANCmV4cGVyaW1lbnRhbCBkZXNpZ25zDQpv
wqDCoMKgIA0KUmVncmVzc2lvbiANCkRpc2NvbnRpbnVpdHkNCm/CoMKgwqAgDQpEaWZmZXJl
bmNlLWluLURpZmZlcmVuY2UNCm/CoMKgwqAgDQpNYXRjaGluZw0KwrfCoMKgwqDCoMKgwqDC
oMKgIA0KTm9uLWV4cGVyaW1lbnRhbCANCmRlc2lnbnMNClNhbXBsaW5nIA0KaW4gSW1wYWN0
IEV2YWx1YXRpb24NCsK3wqDCoMKgwqDCoMKgwqDCoCANClNhbXBsaW5nIA0KdGVjaG5pcXVl
cyBpbiBJbXBhY3QgRXZhbHVhdGlvbg0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KU2FtcGxlIA0K
c2l6ZSBjYWxjdWxhdGlvbiwNCsK3wqDCoMKgwqDCoMKgwqDCoCANClNhbXBsaW5nIA0Kd2Vp
Z2h0DQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpTdGF0aXN0aWNhbCANCnBvd2VyDQrCt8KgwqDC
oMKgwqDCoMKgwqAgDQpDb25zdHJ1Y3RpbmcgDQp2YWxpZCBjb21wYXJpc29uIGdyb3Vwcw0K
UXVhbnRpdGF0aXZlIA0KRGF0YSBBbmFseXNpcyBmb3IgSW1wYWN0IEV2YWx1YXRpb24NClJh
bmRvbWl6ZWQgDQpJbXBhY3QgRXZhbHVhdGlvbg0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KU2V0
dGluZyANCnRoZSBjb3VudGVyZmFjdHVhbA0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KU3RhdGlz
dGljYWwgDQpEZXNpZ24gb2YgUmFuZG9taXphdGlvbg0KwrfCoMKgwqDCoMKgwqDCoMKgIA0K
SW1wYWN0cyANCm9mIFByb2dyYW0gUGxhY2VtZW50DQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpJ
bXBhY3RzIA0Kb2YgUHJvZ3JhbSBQYXJ0aWNpcGF0aW9uDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQpDYXB0dXJpbmcgDQpCb3RoIFByb2dyYW0gUGxhY2VtZW50IGFuZCBQYXJ0aWNpcGF0aW9u
DQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpNZWFzdXJpbmcgDQpTcGlsbG92ZXIgRWZmZWN0cw0K
UHJvcGVuc2l0eSANClNjb3JlIE1hdGNoaW5nIFRlY2huaXF1ZSAoUFNNKQ0KwrfCoMKgwqDC
oMKgwqDCoMKgIA0KSW50cm9kdWN0aW9uIA0KdG8gUFNNDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQpBcHBsaWNhdGlvbiANCm9mIFBTTSBpbiBJbXBhY3QgRXZhbHVhdGlvbg0KwrfCoMKgwqDC
oMKgwqDCoMKgIA0KQ29uc3RydWN0aW5nIA0KcHJvcGVuc2l0eSBzY29yZXMNCsK3wqDCoMKg
wqDCoMKgwqDCoCANCk1hdGNoaW5nIA0KQW5hbHlzaXMgKE5lYXJlc3QtTmVpZ2hib3VyLCBT
dHJhdGlmaWNhdGlvbiwgUmFkaXVzLCBLZXJuZWwgKQ0KwrfCoMKgwqDCoMKgwqDCoMKgIA0K
Q29tbW9uIA0Kc3VwcG9ydA0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KRG91Ymx5IA0KUm9idXN0
IEVzdGltYXRpb24NCkRpZmZlcmVuY2UgDQppbiBEaWZmZXJlbmNlIE1ldGhvZA0KwrfCoMKg
wqDCoMKgwqDCoMKgIA0KV2hhdCANCmlzIERJRD8NCsK3wqDCoMKgwqDCoMKgwqDCoCANCkFw
cGxpY2F0aW9uIA0Kb2YgRElEIGluIEltcGFjdCBFdmFsdWF0aW9uDQrCt8KgwqDCoMKgwqDC
oMKgwqAgDQpFc3RpbWF0aW5nIA0KRElEIGVzdGltYXRvcjogU2luZ2xlIERJRCwgRElEIHdp
dGggY292YXJpYXRlcywgUXVhbnRpbGUgRElEDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpESUQg
DQpmb3IgQ3Jvc3MtU2VjdGlvbmFsIERhdGENCsK3wqDCoMKgwqDCoMKgwqDCoCANCkJhbGFu
Y2luZyANClRlc3RzDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpEaWZmLWluLURpZmYgDQp3aXRo
IFByb3BlbnNpdHkgU2NvcmUgTWF0Y2hpbmcNClF1YWxpdGF0aXZlIA0KQXBwcm9hY2hlcyBp
biBJbXBhY3QgRXZhbHVhdGlvbg0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KTW9zdCANClNpZ25p
ZmljYW50IENoYW5nZQ0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KT3V0Y29tZSANCk1hcHBpbmcN
CsK3wqDCoMKgwqDCoMKgwqDCoCANCk91dGNvbWUgDQpIYXJ2ZXN0aW5nDQrCt8KgwqDCoMKg
wqDCoMKgwqAgDQpBcHByZWNpYXRpdmUgDQpJbnF1aXJ5DQpQcm9kdWNpbmcgDQphbmQgRGlz
c2VtaW5hdGluZyBJbXBhY3QgRXZhbHVhdGlvbiBmaW5kaW5ncw0KwrfCoMKgwqDCoMKgwqDC
oMKgIA0KSW1wYWN0IA0KRXZhbHVhdGlvbiBQbGFuDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpJ
bXBhY3QgDQpFdmFsdWF0aW9uIFJlcG9ydHM6IEJhc2VsaW5lIHJlcG9ydCwgSW1wYWN0IEV2
YWx1YXRpb24gUmVwb3J0cw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KQ2FzZSANCnN0dWRpZXMN
CsKgDQpHZW5lcmFsIA0KTm90ZXMNCsK3wqDCoMKgwqDCoMKgwqDCoMKgQWxsIA0Kb3VyIGNv
dXJzZXMgY2FuIGJlIFRhaWxvci1tYWRlIHRvIHBhcnRpY2lwYW50cycgbmVlZHMNCsK3wqDC
oMKgwqDCoMKgwqDCoMKgVGhlIA0KcGFydGljaXBhbnQgbXVzdCBiZSBjb252ZXJzYW50IGlu
IEVuZ2xpc2gNCsK3wqDCoMKgwqDCoMKgwqDCoMKgUHJlc2VudGF0aW9ucyANCmFyZSB3ZWxs
LWd1aWRlZCwgcHJhY3RpY2FsIGV4ZXJjaXNlcywgd2ViLWJhc2VkIHR1dG9yaWFscywgYW5k
IGdyb3VwIHdvcmsuIE91ciANCmZhY2lsaXRhdG9ycyBhcmUgZXhwZXJ0cyB3aXRoIG1vcmUg
dGhhbiAxMCB5ZWFycyBvZiANCmV4cGVyaWVuY2UuDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFVw
b24gDQpjb21wbGV0aW9uIG9mIHRyYWluaW5nIHRoZSBwYXJ0aWNpcGFudCB3aWxsIGJlIGlz
c3VlZCB3aXRoIGEgRm9zY29yZSBkZXZlbG9wbWVudCANCmNlbnRlciBjZXJ0aWZpY2F0ZSAo
RkRDLUspDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRyYWluaW5nIA0Kd2lsbCBiZSBkb25lIGF0
IHRoZSBGb3Njb3JlIGRldmVsb3BtZW50IGNlbnRlciAoRkRDLUspIGNlbnRlcnMuIFdlIGFs
c28gb2ZmZXIgDQppbmhvdXNlIGFuZCBvbmxpbmUgdHJhaW5pbmcgb24gdGhlIGNsaWVudCBz
Y2hlZHVsZQ0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDb3Vyc2UgDQpkdXJhdGlvbiBpcyBmbGV4
aWJsZSBhbmQgdGhlIGNvbnRlbnRzIGNhbiBiZSBtb2RpZmllZCB0byBmaXQgYW55IG51bWJl
ciBvZiANCmRheXMuDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCmNvdXJzZSBmZWUgZm9y
IG9uc2l0ZSB0cmFpbmluZyBpbmNsdWRlcyBmYWNpbGl0YXRpb24gdHJhaW5pbmcgbWF0ZXJp
YWxzLCAyIA0KY29mZmVlIGJyZWFrcywgYSBidWZmZXQgbHVuY2gsIGFuZCBhIENlcnRpZmlj
YXRlIG9mIHN1Y2Nlc3NmdWwgY29tcGxldGlvbiBvZiANClRyYWluaW5nLiBQYXJ0aWNpcGFu
dHMgd2lsbCBiZSByZXNwb25zaWJsZSBmb3IgdGhlaXIgb3duIHRyYXZlbCBleHBlbnNlcyBh
bmQgDQphcnJhbmdlbWVudHMsIGFpcnBvcnQgdHJhbnNmZXJzLCB2aXNhIGFwcGxpY2F0aW9u
IGRpbm5lcnMsIGhlYWx0aC9hY2NpZGVudCANCmluc3VyYW5jZSwgYW5kIG90aGVyIHBlcnNv
bmFsIGV4cGVuc2VzLg0KwrfCoMKgwqDCoMKgwqDCoMKgwqBBY2NvbW1vZGF0aW9uLCANCnBp
Y2t1cCwgZnJlaWdodCBib29raW5nLCBhbmQgVmlzYSBwcm9jZXNzaW5nIGFycmFuZ2VtZW50
LCBhcmUgZG9uZSBvbiByZXF1ZXN0LCANCmF0IGRpc2NvdW50ZWQgcHJpY2VzLg0KwrfCoMKg
wqDCoMKgwqDCoMKgwqBUYWJsZXQgDQphbmQgTGFwdG9wcyBhcmUgcHJvdmlkZWQgdG8gcGFy
dGljaXBhbnRzIG9uIHJlcXVlc3QgYXMgYW4gYWRkLW9uIGNvc3QgdG8gdGhlIA0KdHJhaW5p
bmcgZmVlLg0KwrfCoMKgwqDCoMKgwqDCoMKgwqBPbmUteWVhcsKgZnJlZSANCkNvbnN1bHRh
dGlvbiBhbmQgQ29hY2hpbmcgcHJvdmlkZWQgYWZ0ZXIgdGhlIGNvdXJzZS4NCsK3wqDCoMKg
wqDCoMKgwqDCoMKgUmVnaXN0ZXIgDQphcyBhIGdyb3VwIG9mIG1vcmUgdGhhbiB0d28gYW5k
IGVuam95IGEgZGlzY291bnQgb2YgKDEwJSB0byANCjUwJSkNCsK3wqDCoMKgwqDCoMKgwqDC
oMKgUGF5bWVudCANCnNob3VsZCBiZSBkb25lIGJlZm9yZSBjb21tZW5jZSBvZiB0aGUgdHJh
aW5pbmcgb3IgYXMgYWdyZWVkIGJ5IHRoZSBwYXJ0aWVzLCB0byANCnRoZSBGT1NDT1JFIERF
VkVMT1BNRU5UIENFTlRFUiBhY2NvdW50LCBzbyBhcyB0byBlbmFibGUgdXMgdG8gcHJlcGFy
ZSBiZXR0ZXIgZm9yIA0KeW91Lg0KwrfCoMKgwqDCoMKgwqDCoMKgwqBGb3IgDQphbnkgaW5x
dWlyaWVzIHJlYWNoIHVzIGF0wqB0cmFpbmluZ0BmZGMtay5vcmfCoG9yIA0KKzI1NDcxMjI2
MDAzMQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgV2Vic2l0ZToNCjxodHRwOi8vZW1haWwu
Zm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPWhwMXF5NlJ5dUNubTBa
QzAzZWlTcHFNX0FEV25TSVdqQl9vWV9DV2FaNUk5M01lZ19KangtUmNMbXBxZWswT1k0Wnc5
YW1Kdk5jWUdUYzZ2VVdUc25PcnRSb1JFNVdoemQwSjlHbE0wX1MxWWp2OWtLaHlMZUhyLVdo
UUZ5clBuU3pFVng1UjRMZy1rT2R3UXYxdFh1cnMxPg0Kd3d3LmZkYy1rLm9yZw0KT3RoZXIg
DQpVcGNvbWluZyBXb3Jrc2hvcHMgS2VueWEsIFJ3YW5kYSwgVGFuemFuaWEsIEV0aGlvcGlh
IGFuZCANCkR1YmFpDQoNCjENCg0KPGh0dHA6Ly9lbWFpbC5mb3Njb3JlZGV2ZWxvcG1lbnQu
b3JnL3RyYWNraW5nL2NsaWNrP2Q9eUV0bFQzV1BITTh4VnJSOWhtQ3hwaW9vMUlUOVZOek5Y
TlVoOUZDd0hOaU51YU5MU2JVQzBTdDJiRWJ0TlNja2taejdHdFg4UkVwNzVsUGxZMEdjSUpU
MGh2b1BmdGN0YUdyVEJySzh1bTBhWG51WmZZWXZPV0RRQjBtNmdWOGxCQlU0NnEyV0FlLTVy
cXNBV3J5eEpkVm03ekd1aWY3WEhpU2tGN0ZtVWxlNHI1enpMMDJER1FNT19nSUFZN1M4U3Ju
TTI4RHNKYW13dGVtWktGaFR2Q3NEcWliWkw1Z29WRk9VYVdjd0VHNlMwPg0KQ29tbXVuaXR5
IEJhc2VkIFJpc2sgUmVkdWN0aW9uIA0KICAgICAgQ291cnNlDQoyDQoNCjxodHRwOi8vZW1h
aWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPWdoY1l3NThmSDZ1
TV9MdWMzMnp0U3RGMndhVFVFRlFkeDJYdmpZRlFOS2ljbTI3SURDelo1WV9QLW5OVW9jLWRv
RU8xdUJfa3U3Z3hiSDk1cEU5eGNFc0dPZjBhUUREU0NXSGRCUzB5bkdseWVuTFZBaVBMV3po
cldQYVp2dUx0d0dWUEtXZjhNTW15TjJqSlo4Unh2Y1M5dkdtZktlYlAtT0VwcHNxa2d3Um45
RUswRE5rTHYtbGprOEhUbmtPTHZLTmJMZWt6Ymp5WkhTX3ZKYjU1Wk9VMT4NCkdJUyBmb3Ig
TmF0dXJhbCBSZXNvdXJjZSBNYW5hZ2VtZW50IA0KICAgICAgQ291cnNlDQozDQoNCjxodHRw
Oi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPXFqMUx5
Q0lfeWdzdm5tSDVRYUFPNkRXUlVudlJyeG5TV1c0QTBJYmtxM3FiMzAyZkNmazR5elJ4R3B2
N3g5QVVrT3JDcmZJRVJyTWJCNUk1emV0SWpWSi02WnM1SXI2V01teXI2YWVRTThid0NIVks5
Wms1R2ZScnBLX2V0allzd1NNVjJyS0hBRllaVkhhQXlYNGh5MGlwcU9fRGJ2dFh0aS0yUDBR
UVhJa3NXcUlwc0ZSWnJJR1IxeGc2NzVYZlBhNHVNSWdwZVFGZmh5OTFBbF9sRy1KX1BBV0Nh
dlVpTEJ3Ym9GZ2cweDBMT25TclplUkx1MDJLMkxLXzNpWVlIdzI+DQpTdXBlcnZpc29yeSBN
YW5hZ2VtZW50IFNraWxscyBDb3Vyc2UgDQogICAgICBXb3Jrc2hvcA0KNA0KDQo8aHR0cDov
L2VtYWlsLmZvc2NvcmVkZXZlbG9wbWVudC5vcmcvdHJhY2tpbmcvY2xpY2s/ZD1uQ2ZfZkNt
QzIxVmlaR3NJeG02M0dJSjlzaFVNejQxNXdaa0p5MXdDRWgtNE8yaEZpZU45c3hsMFlicm1y
UjBWQ1pzN2EybVItUF91WmpSQ2FPSHludGY0Wkx2SWhZWUFfUDBhRGtJdzRmY0IxbDVWeGEx
TkVhZFZXMU5PTEZnWHNPVmlMelp0LUFHYnZBNzBpRTJlVnFFY0NqUjJGUFFla2dxaHg5YnBJ
WnNmb2M0dHllVGJsdHBYQTV2OGV5SWg1YkZRMmtzemdUUkh5Z0ZockZVdmRXVXV5MTJsT2NK
a0VzWkVSVFpUbW1wdDA+DQpDcmVkaXQgQ29udHJvbCBhbmQgRGVidCBNYW5hZ2VtZW50IA0K
ICAgICAgQ291cnNlDQo1DQoNCjxodHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9y
Zy90cmFja2luZy9jbGljaz9kPXN1X0xxSmF2NWpoQWw2ZXpoSXhReHFXR0w0QWhtcm9pTGhL
RjdwcVR0ck54eDNUcXk4NVJaRlh2b2laWThHUjk2NEgzc1RXdE9EbXZ3UGVKSXM3VGRZVVRR
LW1SYnZJdEYtM2p1UDhkdWtkaGZTWHBfdWRfQ1RaMDBKLTZoSS1OQTdMaWZtanQ4UUxWbjdq
bVp1M2ZDYVNzWlVmUDVCeER6OWdTc2UyZG5GeWxhbnhVVmlyUW00ZmhOa2lya1VHZ1M1SU0z
cGhMbEJoWUpkbTFJQTNlRkVUbjZraE1JTm9ENElJaUNqb0tBdDdpMD4NClB1YmxpYyBTZWN0
b3IgUHJvY3VyZW1lbnQgDQogICAgICBDb3Vyc2UNCjYNCg0KPGh0dHA6Ly9lbWFpbC5mb3Nj
b3JlZGV2ZWxvcG1lbnQub3JnL3RyYWNraW5nL2NsaWNrP2Q9eGU3eS1xX2pLX0F6VHk0X2ZB
d3VfTFk4LS13dkRTcE5WZnlzdTg0WXpoX0lhVy1nR0tnQ2Rpd2VzUnpxZ1Z3X1l6Z1BMYVZl
aFFjZnBRdHdHVlMtN2VOQklaZEp1Wnh5TlI3NUotY2p2U0E1MWo0d3FtVGZxcXFBbUlONzBH
M3BTRW9uNWpCUHkzLXg3T0FTOUtWRzlpLTVtVjRVR3RZZXRsc2NiQ1VQTlNodlJPWjFOS2JV
UnRsQWtscHR5d2tLV2g3b0piWm4tQ1BaTTdjSGw1SE53c0NzTFF6by1keWFya0RocWZ0Yzl5
ZVptRHZfZ3Q2MmktSGplTVVFQ1Q0ZDZOREt2V2M3bWhBNmp0OWc3NDhUMlJoWHFPODVTWnhw
VTh2ejdBRS1pN3JmdVNtaHJkcEo1cVV1ZFNSS25mbThwUTI+DQpSZXNlYXJjaCBEZXNpZ24s
IE9ESyBNb2JpbGUgRGF0YSBDb2xsZWN0aW9uLCBHSVMgTWFwcGluZywgDQogICAgICBEYXRh
IEFuYWx5c2lzIHVzaW5nIE5WSVZPIGFuZCBTUFNTIA0KICAgICAgQ291cnNlDQo3DQoNCjxo
dHRwOi8vZW1haWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPVAt
M3ZZVktGWmc1VDRFdGl0bTdiVEIyX0p3dVI5S2dfWG8za3JSR1dhYWdDQUwxTWt5eHZCYU5i
NFNic3dGTDJKX3hrMWljTGNESkQ5R0trdnByQlFkU2pla1ZmeXpGakdoQlYweHlDd2ZmUDll
ZmpkaXduSXBGQnV0bjNqU3B1RmZ6TndaUUQ5RHBfbzBFSFlQZmtsb3JKai1ya09VYjJxdEVR
MzhpakhObzkwbHpabUpFV2h6eHlqUndSUjZMV1dDbEJsTkljcDlkZGxxMEc4b2FrN3hiQ0Vs
b0o3dkxqeW40MVNOeGNRVG52MD4NCkVudHJlcHJlbmV1cnNoaXAgYW5kIElubm92YXRpb24g
DQogICAgICBDb3Vyc2UNCjgNCg0KPGh0dHA6Ly9lbWFpbC5mb3Njb3JlZGV2ZWxvcG1lbnQu
b3JnL3RyYWNraW5nL2NsaWNrP2Q9Z2k4aW5HaGNWdC1IUU85ZTRUV2ozLXBkQy1sZHRwbl9h
dVh0X0NOZmc3UmJBandnQVB6Tkd0WU9wNXhjRXU0SEZma2dYc1c1Wm0xd21vRTRQd3NiQzFM
Ri0xODdHdmVEaGM3c2x6SG1NVUJGUkFSYndiWjlJbEs5d3k0OFVnNjVwV2taOUtULUp5VHZw
S0RCTXFsM0ItOHF6Z2RvQ2lQVzI4NGlMcWQwaXRwdHFGVUZfUENmbzhHYjRYOGwzaGpYRFNm
WkxxcG9xSk5jTDhyZTBDZzZrc3ZmUmJyTDk3SXVWcHFlSm0zbS1BRk4wPg0KTW9iaWxlIEFw
cGxpY2F0aW9uIERldmVsb3BtZW50IA0KICAgICAgQ291cnNlDQo5DQoNCjxodHRwOi8vZW1h
aWwuZm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPTZSb2tQN1d0bkot
N19NaEJtcTF6MUNWVE5qS2RJU0V4MEJFU0FUdl9LcnduWjNIMldrRFNPeDk3WEd4SDJpV3dP
VXQyMF9CbkhLYmhxQ1FicVhhQXdkYkdUUmNoVG52anFSMzM3amdTY3JZTDVETlZLYVlUVnkw
alR0Q051N3c4ZGdyNkRucjFhZVlhUDJjaF84U1lXcnV3enJZQW4yekFDeFB4aDJjX2JuUmZX
Uy1SLVhxQ0M0N2lEd1hFTEJhdDhCZExxUWp4YmxvQ0EtRWNheGtHMTh0em13dmRMaUNyOU5p
WkNqMVVoaTBZcW5Dc0F4WUhNM21fX01rSGJRQ3UzZzI+DQpQcm9qZWN0IFByb3Bvc2FsIGFu
ZCBSZXBvcnQgV3JpdGluZyBTa2lsbCANCiAgICAgIGNvdXJzZQ0KMTANCg0KPGh0dHA6Ly9l
bWFpbC5mb3Njb3JlZGV2ZWxvcG1lbnQub3JnL3RyYWNraW5nL2NsaWNrP2Q9MkpMb1RELThD
YWl3SHdqbENzZVNRZ291Q1BTSW1uaWFwYmdHYTJNSHR6OGJnUkdsMHRWQVZmX0hRYzNLZFBY
c0lxVTJ0ZEVLWUg3ZXJuTDB6VFpxdHZEc0VHVVBBQ0hzdUc5SkF0UmYwQ1ZhSVFkelNuV296
VlR1aVVoMWJBMG01dFRTdmpycHk4UzdtRVlPc004QkZLZ2p6ZzVWSDNtNjVsWXJCUDdvdGRL
TGRjNi02UWlmLVFEVC1tZ2g3dEZrZVMtZ1Q4WVhmdXhHemQ1WEdrV0RicHEtcTdFZk5ldTAy
b0xXVEgySzlSTXlYSktPbXcxc0t3Ql93M2U1R2xkdGs5YzVFNGhERC1RMGJCaVhxTURkT2dF
M3oyNVBSRmlVSUh4LUk5SE9OeEEzazEwUUV4WWxnTFZxdTVoSnRGdFlRQk9kek5HT2x3UHFw
b2wxcnNEQ19aak5hTXZNWlR5aTlBYTJCVXZVdjRvZjA+DQpHZW5kZXIgYmFzZWQgVmlvbGVu
Y2UsIEdlbmRlciBBbmFseXNpcyBhbmQgRGV2ZWxvcG1lbnQgYW5kIA0KICAgICAgR2VuZGVy
IE1haW5zdHJlYW1pbmcsIEFuYWx5c2lzIGFuZCANCiAgICAgIFANCg0KPGh0dHA6Ly9lbWFp
bC5mb3Njb3JlZGV2ZWxvcG1lbnQub3JnL3RyYWNraW5nL2NsaWNrP2Q9T1hCT19xeWxCdWMw
ZXA2WU4zZnRjV0NVRFFUcEtVN28xRlJoTFlHYldrMXFkMGttWVp5cHdzSVRpdTAtVm1sU19N
OFE4b0tUS2VVTXI5azB2WlJ3RFJfX1dvNDhkSUVKWW9nM0p5TldPdkNkdGZ3VklLQXJ6bGJH
OVlxV2Ntd1ZjNkw4NFJTOVBISnhXcGpBTWR4NTJCODE+DQpDb250YWN0IA0KVXMNCg0KPGh0
dHA6Ly9lbWFpbC5mb3Njb3JlZGV2ZWxvcG1lbnQub3JnL3RyYWNraW5nL2NsaWNrP2Q9b25u
TWdackcybHpFWU1ULUtnZ2N0TkdZN1NwMG1qSHV6OHRUbUIzQ3Joc2pCeWxObHNBN1lTNTl0
dDFxdkptZUZhbjNfc2kzVlU5ZUwxZVFQWjVZbDc2MzdDcFBSNHhGNzN1THkybFRjUVZHV01o
TDQ4dkZaNkM5ZDdaRGhzOVVfelVpT0Vlb0g0LXRZR0xMWExreVp2ZzE+DQpDb3Vyc2UgDQpT
Y2hlZHVsZQ0KDQo8aHR0cDovL2VtYWlsLmZvc2NvcmVkZXZlbG9wbWVudC5vcmcvdHJhY2tp
bmcvY2xpY2s/ZD1uTDJPM0N2N3d6X0V2V2VhRWtlaS1MeFBfcE5CNlM2d3cybWdlbzB3cnFQ
NlpsaG12Ykh5UGJxbzN0TXJhbnVPNkF0SnZmMlBRTzk1UkRQNzF5bXU3cnBTQVc3UVhvX2N6
RGZHNlFyckZLX1NSSFBNQ1AyMlp4aWRPOUJwUThiU3FhQm1SNzJXUUdoZDFxbmhES0d2eDhr
MT4NClZpcnR1YWwgDQpUcmFpbmluZw0KDQo8aHR0cDovL2VtYWlsLmZvc2NvcmVkZXZlbG9w
bWVudC5vcmcvdHJhY2tpbmcvY2xpY2s/ZD1fRWdIbGtQWnBvUGRSMjFmZUtmUW1kMVlUX0Vn
UUg4dmZ4ejBLdlV4clBTZmp1MDlWd2xWRVBNLXM3WUd3LU9Da0lZNGJBVDUtR05FaHJKSldh
Z3o0NTdDWWhqSjlHR2hSaUUyeW51bjFuMHI0aDZQN05weFd2cUNUbExZTDBIY2RqVmZqZFp4
UkdPd1ZQTU1ZTjVFNFYwMT4NCkNvbnN1bHRhbmN5DQoNCjxodHRwOi8vZW1haWwuZm9zY29y
ZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy9jbGljaz9kPXJBZldYSVJYcVFYWGxyRDR3b3Vf
UmxKSVNKNXdDaWdKaHRFaG1pSDJsdE5HOUJQMlIzbmw0dEZaeVIxdS1IQTZaeDBqbVVFR1Nx
YWJNY0t0MEYyUHhKR0RBYlVSVU5wR18zeE94R2tmOVY4ekxySHZxcjRLLXlrRFNXa19sNTNx
S2VDZGt1elpBU1FRdzZVeEw1QUlLZURWN3pQeGt0bmVGTGMyTW9xWGhEZVBpVk9nOVQyOFhL
aGQtQy01eXJUMWt3Mj4NCkRvd25sb2FkIA0KUERGDQrCoA0KwqANCjxodHRwOi8vZW1haWwu
Zm9zY29yZWRldmVsb3BtZW50Lm9yZy90cmFja2luZy91bnN1YnNjcmliZT9kPW93ZWRsUU9a
YjRIRVJSUHh5LWdsTXBhdDRTSy1rbzlxUHc0SUlHRk96NXpYdElka0lKS2F5VzJObDdlRnVI
a25aS2RTVmQyOURhT3R6N1UwUjZsaHlkeTB2OWktS3RUMzkwNGFjVmlVLThnaDA+DQpVTlNV
QlNDUklCRQ==

--=-eZCfCVbQ1QKYCZW/PeMYSzrxglE29MF223WKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; TEXT-ALIGN: center; MARGIN: 0cm 0cm 15pt=
; mso-line-height-alt: 13.2pt; mso-outline-level: 3"=20
align=3Dcenter><B><SPAN=20
style=3D'FONT-SIZE: 18pt; FONT-FAMILY: "Segoe UI",sans-serif; COLOR: #=
444444; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DlKPGbbA=
QYlEm5EmwJ8QKFIygD_MqezAEhHZHeDgpnjHTAJeqCmiPHc54KP218zrudU0VArcTHZt3-=
1kDl4zu3GUpS1MKmyafw9WS106lymQ9h3dGC0IMrz_M1ei6QnlQBeDZ43ZRySYbZQpDWrG=
URgtB3it7D7VVixFmUAqRCsUYyxVXrbz95r2hZntnm-TisNcEWp-woyYAdBvnLQSDWErTo=
YVD0ldmw7-REfYBmnAs6q8kHa9VowAHWuNYgpeGy1AVf6MVhf4MkcBYhpYgTUM1"><FONT=
=20
color=3D#0000ff>Invitation to Impact Evaluation for Evidence Based Pol=
icy in=20
Development Workshop</FONT></A><?xml:namespace prefix =3D "o" ns =3D=20
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#31708f; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DpWsrYkY=
aq-Ewuv7LUqbnx43sF5-V2kg6vT-TD6y1hKLgQKX549F7DjJiT6t8r-cv9HqaAbwgG3nOV=
e3etQ1DsDvVTkFpXRwNSEtS4oKMNGnTUXtebzDKtMuOqep50exqLrI4JvNPH6kdOh0cByH=
496I1"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
color=3D#0000ff>Customized Programme</FONT></SPAN></A><o:p></o:p></SPA=
N></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#31708f; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DRZmAKUp=
hc6gbz2gceLP6RIMqlGE31Gvi3R6bze_C2gzDhljGJQ4dO9_PItm_zNaG0gojcHELBtAwI=
CRjKHYW777MtWRyHc4P-STTrLfBOdSEqRxx2VnkDOlDoHVjW5DertTzs4qPwOVzoaEkpuP=
V3kk1"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Inhouse=20
Programme</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#31708f; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DnL2O3Cv=
7wz_EvWeaEkei-LxP_pNB6S6ww2mgeo0wrqP6ZlhmvbHyPbqo3tMranuON09V2tsU8LGlx=
IuSWHITfW8Z-d4nOMmqfH95YMJv2oEhgoDx-u59XuGced_hS0IQCSf948FFR-0HO1Uyoqn=
cuJY1"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Online=20
Training</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#31708f; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DonnMgZr=
G2lzEYMT-KggctFi8t7Sz89GXPMhTmnkNvYy0rGK1VKW-uP_2PiEvoI041HQ-M5TJktrCm=
R9HLGZJ3hWK063lpsqqgJjO1SVYgKm0eXxetXL5YnrqFDp26Ay-LB03sm_-uz0fOEE_qBY=
Wbo81"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Study=20
Tour</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: #d9edf7; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#31708f; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DrAfWXIR=
XqQXXlrD4wou_RlJISJ5wCigJhtEhmiH2ltNG9BP2R3nl4tFZyR1u-HA6Zx0jmUEGSqabM=
cKt0F2PxB8oKbm5MqC-L3BU_c3j9mtGUEL2NFz-PvASJtuLYWHNmPiPnCWNKRcW0p3_KYU=
jVheg0HfcEnL5WtimiUq8s9pvN4-MIes8wO0A4TDqNmAx8w2"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Download=20
PDF</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P>
<TABLE class=3DMsoNormalTable=20
style=3D"WIDTH: 462.3pt; BORDER-COLLAPSE: collapse; mso-yfti-tbllook: =
1184"=20
cellSpacing=3D0 cellPadding=3D0 border=3D0>
  <THEAD>
  <TR style=3D"mso-yfti-irow: 0; mso-yfti-firstrow: yes">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 134.7p=
t; BORDER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-TO=
P: 6pt; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; B=
ACKGROUND-COLOR: transparent"=20
    vAlign=3Dbottom width=3D180>
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: normal"><B><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>Course=20
      Date<o:p></o:p></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 73.8pt=
; BORDER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-TOP=
: 6pt; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BA=
CKGROUND-COLOR: transparent"=20
    vAlign=3Dbottom width=3D98>
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: normal"><B><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>Duration<o:p=
></o:p></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 57.35p=
t; BORDER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-TO=
P: 6pt; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; B=
ACKGROUND-COLOR: transparent"=20
    vAlign=3Dbottom width=3D77>
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: normal"><B><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>Location<o:p=
></o:p></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 196.45=
pt; BORDER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-T=
OP: 6pt; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; =
BACKGROUND-COLOR: transparent"=20
    vAlign=3Dbottom width=3D262 colSpan=3D3>
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: normal"><B><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>Registration=
<o:p></o:p></SPAN></B></P></TD></TR></THEAD>
  <TBODY>
  <TR style=3D"mso-yfti-irow: 1; mso-yfti-lastrow: yes">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 134.7p=
t; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADD=
ING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-CO=
LOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop width=3D180>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'>19/06/2023=
&nbsp;<B>To</B>&nbsp;30/06/2023<o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; BORDER-BOTTOM=
: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LEFT: 6pt; B=
ORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: transparent=
; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'>10=20
      Days<o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 57.35p=
t; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADD=
ING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-CO=
LOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop width=3D77>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'>Mombasa,=20
      Kenya<o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 70.85p=
t; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADD=
ING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-CO=
LOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop width=3D94>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DE=
WjvM4GyNrfkJ12z3wSgCjxdej-GEYuEZql9b5JAECmxPBhjZk99WNB6lAsSHFXBqOCazvK=
QMG-wHM83KRIMHIP1ZLZsxHJh1dQ5pElkXsnnjjLoFMCrvUZBUFJRVgvUVMg6wpKgOHcPD=
sYCOu01Aow-Aytsaj0cV-f3lm88m3QuA8oZlJZG37ryUWN716UueaspMkepIGRBxfGYY8U=
EUXTuKm853dTxqR6_W9RFdKMjzXcY8-NaZneMKuHt_N6Phl_WiTBZyQHenNq2p815x5D2-=
zXfTjHVAa3r2xshhLOD0"><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Register As=20
      Individual</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 48.2pt=
; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDI=
NG-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COL=
OR: transparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop width=3D64>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3D9=
_i2QjflB7HNVAjAtNrJ9seoT8WDawLQEWc3H2sfCPKj9cgiTIoDU5aLBsx8dZFv6L0c2Pw=
usHWxuJpN5421WvOA07wN1IFWY0d0oGplj_95E_Gi_DXD6K6u9YBoVEj5kNrzdPHkVsYv_=
arvjiB0Yzn0iZmyc_yfP5yld0XKWjsT-skqYqPi9KsGTpMa0CrM9DIDFs-rHH2uh-YUhbd=
QSsKFXtzMqRPB-A1vBFFeA1oxD_c28Q-jFY0zLA6LWzBTy8OTKY4XCxVtvs9__h1gbw8sj=
iYXIkqMyiMjdCFn4gYF0"><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Register For Online=20
      Training</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 77.4pt=
; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDI=
NG-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COL=
OR: transparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop width=3D103>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 10.5pt; FONT-FAMILY: "Times New Roman",serif=
; COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DQ=
6-4yEdXD-P8o_LYkxqciOZp3ncVrd_52acKrmTA9-Kh-sZaNGxn0BJqvIY2hvJQwdLq2gT=
RH7Wpi04_qrvCv-cqs6IYKhv5JuhygOUUlY0RJIAQB3JUr2pNaTVq-vM4sZnscgG8SBAqr=
Z8zwmYvPOFKqpWOPJawYC3-v-7FEqaj7q6ZPel_9yTbF1l6cxe811bJjVFH0sN71-TX3yZ=
0d3md8Tvo0MbggTiT61GckPa7DsVO8POFalduAfmF7q6E1EdlnrZmuA0Rw79pA_P6bA2IC=
WNz17FJW-bKYozendFV0"><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Register As A=20
    Group</FONT></SPAN></A><o:p></o:p></SPAN></P></TD></TR></TBODY></T=
ABLE></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: 16.9pt"=
><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction</SPAN=
></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
course aimed to address an important prerequisite for incorporating im=
pact=20
evaluation (IE) into programme design: a theoretical and practical und=
erstanding=20
of IE approaches to enable selection of appropriate methodologies, cou=
pled with=20
careful appraisal of the resulting evidence. The course introduced par=
ticipants=20
to current quantitative as well as qualitative evaluation techniques f=
or impact=20
evaluation and gave them an insight into the critical understanding of=
 the roles=20
they can play in the design and assessment of public policy and develo=
pment=20
interventions. The group enthusiastically tackled the difficulties of =
learning=20
STATA,NVIVO and the intricacies of evaluation research designs and eco=
nometric=20
techniques, all bolstered by the support of the experienced teaching=20
team.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN></B><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Who=20
Should Attend?</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>This=20
course is targeted at researchers, project staff, managers, developmen=
t=20
practitioners, policy makers in government, NGOs and development organ=
izations=20
who want to determine the impact of their interventions.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN></B><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>No=20
of Days</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>10=20
Days</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN></B><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
Objectives</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Conduct=20
a rigorous impact evaluation of a project</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Learn=20
and practice econometric techniques for impact evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Carry=20
out impact data analysis using Propensity Matching and Difference-in=20
-Difference</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Understand=20
IE designs: randomized, quasi and non-experimental</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Learn=20
about evaluation problem: Attribution, selection and placement=20
biases</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Learn=20
about theories and practices of impact evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Conduct=20
sampling and power calculation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l10 le=
vel1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Report=20
and disseminate impact evaluation findings</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN></B><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
Outline</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Overview=20
of M&amp;E Fundamentals for Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l4 lev=
el1 lfo2; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Results=20
Framework</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l4 lev=
el1 lfo2; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>M&amp;E=20
Project Indicators</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l4 lev=
el1 lfo2; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Logical=20
Framework</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l4 lev=
el1 lfo2; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Performance=20
Evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l2 lev=
el1 lfo3; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Defining=20
impact evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l2 lev=
el1 lfo3; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Deciding=20
whether to evaluate</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l2 lev=
el1 lfo3; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Attribution=20
in impact evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l2 lev=
el1 lfo3; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Contribution=20
vs attribution</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Determining=20
points of Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l5 lev=
el1 lfo4; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of evaluation questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l5 lev=
el1 lfo4; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Theories=20
of Change</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l5 lev=
el1 lfo4; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
results chain</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l5 lev=
el1 lfo4; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Evaluation=20
hypothesis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l5 lev=
el1 lfo4; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impact=20
evaluation indicators</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Counterfactuals=20
in Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l3 lev=
el1 lfo5; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Causal=20
reference</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l3 lev=
el1 lfo5; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Comparison=20
groups and counterfactuals</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l3 lev=
el1 lfo5; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Estimating=20
counterfactual in impact evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l3 lev=
el1 lfo5; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impact=20
Evaluation when a Comparison and Baseline Data are not available</SPAN=
><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impact=20
Evaluation Research Designs</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el1 lfo6; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Experimental=20
Design</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 60.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el2 lfo6; tab-stops: list 72.0pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Courier New"; mso-bidi-font-size: 11.5pt'><SPA=
N=20
style=3D"mso-list: Ignore">o<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Randomized=20
Control Trials</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el1 lfo6; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Quasi=20
experimental designs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 60.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el2 lfo6; tab-stops: list 72.0pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Courier New"; mso-bidi-font-size: 11.5pt'><SPA=
N=20
style=3D"mso-list: Ignore">o<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Regression=20
Discontinuity</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 60.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el2 lfo6; tab-stops: list 72.0pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Courier New"; mso-bidi-font-size: 11.5pt'><SPA=
N=20
style=3D"mso-list: Ignore">o<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Difference-in-Diff=
erence</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 60.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el2 lfo6; tab-stops: list 72.0pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Courier New"; mso-bidi-font-size: 11.5pt'><SPA=
N=20
style=3D"mso-list: Ignore">o<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Matching</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l0 lev=
el1 lfo6; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Non-experimental=20
designs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Sampling=20
in Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l11 le=
vel1 lfo7; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Sampling=20
techniques in Impact Evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l11 le=
vel1 lfo7; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Sample=20
size calculation,</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l11 le=
vel1 lfo7; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Sampling=20
weight</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l11 le=
vel1 lfo7; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Statistical=20
power</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l11 le=
vel1 lfo7; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Constructing=20
valid comparison groups</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Quantitative=20
Data Analysis for Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Randomized=20
Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Setting=20
the counterfactual</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Statistical=20
Design of Randomization</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impacts=20
of Program Placement</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impacts=20
of Program Participation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Capturing=20
Both Program Placement and Participation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l7 lev=
el1 lfo8; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Measuring=20
Spillover Effects</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Propensity=20
Score Matching Technique (PSM)</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to PSM</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Application=20
of PSM in Impact Evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Constructing=20
propensity scores</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Matching=20
Analysis (Nearest-Neighbour, Stratification, Radius, Kernel )</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Common=20
support</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l6 lev=
el1 lfo9; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Doubly=20
Robust Estimation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Difference=20
in Difference Method</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>What=20
is DID?</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Application=20
of DID in Impact Evaluation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Estimating=20
DID estimator: Single DID, DID with covariates, Quantile DID</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>DID=20
for Cross-Sectional Data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Balancing=20
Tests</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l9 lev=
el1 lfo10; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Diff-in-Diff=20
with Propensity Score Matching</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Qualitative=20
Approaches in Impact Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l1 lev=
el1 lfo11; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Most=20
Significant Change</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l1 lev=
el1 lfo11; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Outcome=20
Mapping</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l1 lev=
el1 lfo11; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Outcome=20
Harvesting</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l1 lev=
el1 lfo11; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Appreciative=20
Inquiry</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Producing=20
and Disseminating Impact Evaluation findings</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l8 lev=
el1 lfo12; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impact=20
Evaluation Plan</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l8 lev=
el1 lfo12; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Impact=20
Evaluation Reports: Baseline report, Impact Evaluation Reports</SPAN><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
16.9pt; TEXT-INDENT: -18pt; mso-margin-top-alt: auto; mso-list: l8 lev=
el1 lfo12; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-font-si=
ze: 11.5pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Case=20
studies</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN></B><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>General=20
Notes</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>All=20
our courses can be Tailor-made to participants' needs<o:p></o:p></SPAN=
></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>The=20
participant must be conversant in English<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Presentations=20
are well-guided, practical exercises, web-based tutorials, and group w=
ork. Our=20
facilitators are experts with more than 10 years of=20
experience.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Upon=20
completion of training the participant will be issued with a Foscore d=
evelopment=20
center certificate (FDC-K)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Training=20
will be done at the Foscore development center (FDC-K) centers. We als=
o offer=20
inhouse and online training on the client schedule<o:p></o:p></SPAN></=
P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Course=20
duration is flexible and the contents can be modified to fit any numbe=
r of=20
days.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>The=20
course fee for onsite training includes facilitation training material=
s, 2=20
coffee breaks, a buffet lunch, and a Certificate of successful complet=
ion of=20
Training. Participants will be responsible for their own travel expens=
es and=20
arrangements, airport transfers, visa application dinners, health/acci=
dent=20
insurance, and other personal expenses.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Accommodation,=20
pickup, freight booking, and Visa processing arrangement, are done on =
request,=20
at discounted prices.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Tablet=20
and Laptops are provided to participants on request as an add-on cost =
to the=20
training fee.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>One-year&nbsp;free=20
Consultation and Coaching provided after the course.<o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Register=20
as a group of more than two and enjoy a discount of (10% to=20
50%)<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Payment=20
should be done before commence of the training or as agreed by the par=
ties, to=20
the FOSCORE DEVELOPMENT CENTER account, so as to enable us to prepare =
better for=20
you.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt 24.75pt; LINE-HEIGHT: =
normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>For=20
any inquiries reach us at&nbsp;<A target=3D_blank><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none">training@fdc-k.o=
rg</SPAN></A>&nbsp;or=20
+254712260031<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 7.5pt 24.75pt; LINE-HEIGHT=
: normal; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: #666666; mso-f=
areast-font-family: "Times New Roman"; mso-bidi-font-family: "Times Ne=
w Roman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-fam=
ily: "Times New Roman"'>Website:<A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dhp1qy6R=
yuCnm0ZC03eiSpqM_ADWnSIWjB_oY_CWaZ5I93Meg_Jjx-RcLmpqek0OY4Zw9amJvNcYGT=
c6vUWTsnOrtRoRE5Whzd0J9GlM0_S1Yjv9kKhyLeHr-WhQFyrPnSzEVx5R4Lg-kOdwQv1t=
Xurs1" target=3D_blank><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
color=3D#0000ff>www.fdc-k.org</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 7.5pt 0cm; mso-line-height-alt: 12.0pt; mso-outline-l=
evel: 2"><SPAN=20
style=3D'FONT-SIZE: 22.5pt; FONT-FAMILY: "Segoe UI",sans-serif; COLOR:=
 #cb2940; mso-fareast-font-family: "Times New Roman"'>Other=20
Upcoming Workshops Kenya, Rwanda, Tanzania, Ethiopia and=20
Dubai<o:p></o:p></SPAN></P>
<P>
<TABLE class=3DMsoNormalTable=20
style=3D"BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 10=
11.75pt; BACKGROUND: white; BORDER-COLLAPSE: collapse; BORDER-BOTTOM: =
medium none; BORDER-LEFT: medium none; mso-yfti-tbllook: 1184; mso-bor=
der-alt: solid #DDDDDD 1.5pt"=20
cellSpacing=3D0 cellPadding=3D0 border=3D1>
  <THEAD>
  <TR style=3D"mso-yfti-irow: 0; mso-yfti-firstrow: yes">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1.5pt solid; BORDER-RIGHT: #dddddd 1.=
5pt solid; BACKGROUND: #4eb04f; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM=
: 0.75pt; PADDING-TOP: 0.75pt; PADDING-LEFT: 0.75pt; BORDER-LEFT: #ddd=
ddd 1.5pt solid; PADDING-RIGHT: 0.75pt"></TD></TR></THEAD>
  <TBODY>
  <TR style=3D"mso-yfti-irow: 1">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>1<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Community Based Risk Reduction Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dy=
EtlT3WPHM8xVrR9hmCxpioo1IT9VNzNXNUh9FCwHNiNuaNLSbUC0St2bEbtNSckkZz7GtX=
8REp75lPlY0GcIJT0hvoPftctaGrTBrK8um0aXnuZfYYvOWDQB0m6gV8lBBU46q2WAe-5r=
qsAWryxJdVm7zGuif7XHiSkF7FmUle4r5zzL02DGQMO_gIAY7S8SrnM28DsJamwtemZKFh=
TvCsDqibZL5goVFOUaWcwEG6S0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Community Based Risk Reduction=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 2">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>2<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"GIS for Natural Resource Management Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dg=
hcYw58fH6uM_Luc32ztStF2waTUEFQdx2XvjYFQNKicm27IDCzZ5Y_P-nNUoc-doEO1uB_=
ku7gxbH95pE9xcEsGOf0aQDDSCWHdBS0ynGlyenLVAiPLWzhrWPaZvuLtwGVPKWf8MMmyN=
2jJZ8RxvcS9vGmfKebP-OEppsqkgwRn9EK0DNkLv-ljk8HTnkOLvKNbLekzbjyZHS_vJb5=
5ZOU1"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>GIS for Natural Resource Management=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 3">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>3<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Supervisory Management Skills Course Workshop"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dq=
j1LyCI_ygsvnmH5QaAO6DWRUnvRrxnSWW4A0Ibkq3qb302fCfk4yzRxGpv7x9AUkOrCrfI=
ERrMbB5I5zetIjVJ-6Zs5Ir6WMmyr6aeQM8bwCHVK9Zk5GfRrpK_etjYswSMV2rKHAFYZV=
HaAyX4hy0ipqO_DbvtXti-2P0QQXIksWqIpsFRZrIGR1xg675XfPa4uMIgpeQFfhy91Al_=
lG-J_PAWCavUiLBwboFgg0x0LOnSrZeRLu02K2LK_3iYYHw2"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Supervisory Management Skills Course=20
      Workshop</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 4">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>4<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Credit Control and Debt Management Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dn=
Cf_fCmC21ViZGsIxm63GIJ9shUMz415wZkJy1wCEh-4O2hFieN9sxl0YbrmrR0VCZs7a2m=
R-P_uZjRCaOHyntf4ZLvIhYYA_P0aDkIw4fcB1l5Vxa1NEadVW1NOLFgXsOViLzZt-AGbv=
A70iE2eVqEcCjR2FPQekgqhx9bpIZsfoc4tyeTbltpXA5v8eyIh5bFQ2kszgTRHygFhrFU=
vdWUuy12lOcJkEsZERTZTmmpt0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Credit Control and Debt Management=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 5">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>5<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Public Sector Procurement Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Ds=
u_LqJav5jhAl6ezhIxQxqWGL4AhmroiLhKF7pqTtrNxx3Tqy85RZFXvoiZY8GR964H3sTW=
tODmvwPeJIs7TdYUTQ-mRbvItF-3juP8dukdhfSXp_ud_CTZ00J-6hI-NA7Lifmjt8QLVn=
7jmZu3fCaSsZUfP5BxDz9gSse2dnFylanxUVirQm4fhNkirkUGgS5IM3phLlBhYJdm1IA3=
eFETn6khMINoD4IIiCjoKAt7i0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Public Sector Procurement=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 6">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>6<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Research Design, ODK Mobile Data Collection, GIS Mappin=
g, Data Analysis using NVIVO and SPSS Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dx=
e7y-q_jK_AzTy4_fAwu_LY8--wvDSpNVfysu84Yzh_IaW-gGKgCdiwesRzqgVw_YzgPLaV=
ehQcfpQtwGVS-7eNBIZdJuZxyNR75J-cjvSA51j4wqmTfqqqAmIN70G3pSEon5jBPy3-x7=
OAS9KVG9i-5mV4UGtYetlscbCUPNShvROZ1NKbURtlAklptywkKWh7oJbZn-CPZM7cHl5H=
NwsCsLQzo-dyarkDhqftc9yeZmDv_gt62i-HjeMUECT4d6NDKvWc7mhA6jt9g748T2RhXq=
O85SZxpU8vz7AE-i7rfuSmhrdpJ5qUudSRKnfm8pQ2"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Research Design, ODK Mobile Data Collection, GIS=
 Mapping,=20
      Data Analysis using NVIVO and SPSS=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 7">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>7<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Entrepreneurship and Innovation Course "=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DP=
-3vYVKFZg5T4Etitm7bTB2_JwuR9Kg_Xo3krRGWaagCAL1MkyxvBaNb4SbswFL2J_xk1ic=
LcDJD9GKkvprBQdSjekVfyzFjGhBV0xyCwffP9efjdiwnIpFButn3jSpuFfzNwZQD9Dp_o=
0EHYPfklorJj-rkOUb2qtEQ38ijHNo90lzZmJEWhzxyjRwRR6LWWClBlNIcp9ddlq0G8oa=
k7xbCEloJ7vLjyn41SNxcQTnv0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Entrepreneurship and Innovation=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 8">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>8<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Mobile Application Development Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3Dg=
i8inGhcVt-HQO9e4TWj3-pdC-ldtpn_auXt_CNfg7RbAjwgAPzNGtYOp5xcEu4HFfkgXsW=
5Zm1wmoE4PwsbC1LF-187GveDhc7slzHmMUBFRARbwbZ9IlK9wy48Ug65pWkZ9KT-JyTvp=
KDBMql3B-8qzgdoCiPW284iLqd0itptqFUF_PCfo8Gb4X8l3hjXDSfZLqpoqJNcL8re0Cg=
6ksvfRbrL97IuVpqeJm3m-AFN0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Mobile Application Development=20
      Course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 9">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-left-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>9<o:p></o:p>=
</SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt; PADDING-LE=
FT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGROUND-COLOR: t=
ransparent; mso-border-top-alt: solid #DDDDDD .75pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"Project Proposal and Report Writing Skill course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3D6=
RokP7WtnJ-7_MhBmq1z1CVTNjKdISEx0BESATv_KrwnZ3H2WkDSOx97XGxH2iWwOUt20_B=
nHKbhqCQbqXaAwdbGTRchTnvjqR337jgScrYL5DNVKaYTVy0jTtCNu7w8dgr6Dnr1aeYaP=
2ch_8SYWruwzrYAn2zACxPxh2c_bnRfWS-R-XqCC47iDwXELBat8BdLqQjxbloCA-Ecaxk=
G18tzmwvdLiCr9NiZCj1Uhi0YqnCsAxYHM3m__MkHbQCu3g2"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Project Proposal and Report Writing Skill=20
      course</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-right-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR>
  <TR style=3D"mso-yfti-irow: 10; mso-yfti-lastrow: yes">
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #dddddd 1.5pt solid; PADDING-RIGHT: =
6pt; BACKGROUND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD =
.75pt; mso-border-left-alt: solid #DDDDDD 1.5pt; mso-border-bottom-alt=
: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'>10<o:p></o:p=
></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #f0f0f0; BOR=
DER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADDING-TOP: 6pt=
; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 6pt; BACKGRO=
UND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD .75pt; mso-b=
order-bottom-alt: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT:=
 normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
COLOR: black; mso-fareast-font-family: "Times New Roman"'><A=20
      title=3D"    Gender based Violence, Gender Analysis and Developm=
ent and Gender Mainstreaming,  Analysis and Planning Gender in Humanit=
arian Action Course"=20
      href=3D"http://email.foscoredevelopment.org/tracking/click?d=3D2=
JLoTD-8CaiwHwjlCseSQgouCPSImniapbgGa2MHtz8bgRGl0tVAVf_HQc3KdPXsIqU2tdE=
KYH7ernL0zTZqtvDsEGUPACHsuG9JAtRf0CVaIQdzSnWozVTuiUh1bA0m5tTSvjrpy8S7m=
EYOsM8BFKgjzg5VH3m65lYrBP7otdKLdc6-6Qif-QDT-mgh7tFkeS-gT8YXfuxGzd5XGkW=
Dbpq-q7EfNeu02oLWTH2K9RMyXJKOmw1sKwB_w3e5Gldtk9c5E4hDD-Q0bBiXqMDdOgE3z=
25PRFiUIHx-I9HONxA3k10QExYlgLVqu5hJtFtYQBOdzNGOlwPqpol1rsDC_ZjNaMvMZTy=
i9Aa2BUvUv4of0"=20
      target=3D_blank><SPAN=20
      style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
      color=3D#0000ff>Gender based Violence, Gender Analysis and Devel=
opment and=20
      Gender Mainstreaming, Analysis and=20
      P</FONT></SPAN></A><o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #dddddd 1pt solid; BORDER-RIGHT: #dddddd 1.5p=
t solid; BORDER-BOTTOM: #dddddd 1.5pt solid; PADDING-BOTTOM: 6pt; PADD=
ING-TOP: 6pt; PADDING-LEFT: 6pt; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: =
6pt; BACKGROUND-COLOR: transparent; mso-border-top-alt: solid #DDDDDD =
.75pt; mso-border-right-alt: solid #DDDDDD 1.5pt; mso-border-bottom-al=
t: solid #DDDDDD 1.5pt"=20
    vAlign=3Dtop></TD></TR></TBODY></TABLE></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 250%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; LINE-HEIGHT: 250%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DOXBO_qy=
lBuc0ep6YN3ftcWCUDQTpKU7o1FRhLYGbWk1qd0kmYZypwsITiu0-VmlS_M8Q8oKTKeUMr=
9k0vZRwDR__Wo48dIEJYog3JyNWOvCdtfwVIKArzlbG9YqWcmwVc6L84RS9PHJxWpjAMdx=
52B81"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Contact=20
Us</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 250%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; LINE-HEIGHT: 250%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DonnMgZr=
G2lzEYMT-KggctNGY7Sp0mjHuz8tTmB3CrhsjBylNlsA7YS59tt1qvJmeFan3_si3VU9eL=
1eQPZ5Yl7637CpPR4xF73uLy2lTcQVGWMhL48vFZ6C9d7ZDhs9U_zUiOEeoH4-tYGLLXLk=
yZvg1"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Course=20
Schedule</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 250%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; LINE-HEIGHT: 250%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DnL2O3Cv=
7wz_EvWeaEkei-LxP_pNB6S6ww2mgeo0wrqP6ZlhmvbHyPbqo3tMranuO6AtJvf2PQO95R=
DP71ymu7rpSAW7QXo_czDfG6QrrFK_SRHPMCP22ZxidO9BpQ8bSqaBmR72WQGhd1qnhDKG=
vx8k1"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Virtual=20
Training</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 250%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; LINE-HEIGHT: 250%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3D_EgHlkP=
ZpoPdR21feKfQmd1YT_EgQH8vfxz0KvUxrPSfju09VwlVEPM-s7YGw-OCkIY4bAT5-GNEh=
rJJWagz457CYhjJ9GGhRiE2ynun1n0r4h6P7NpxWvqCTlLYL0HcdjVfjdZxRGOwVPMMYN5=
E4V01"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT=20
color=3D#0000ff>Consultancy</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 250%">=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
#666666; LINE-HEIGHT: 250%; mso-fareast-font-family: "Times New Roman"=
; mso-bidi-font-family: "Times New Roman"'><A=20
href=3D"http://email.foscoredevelopment.org/tracking/click?d=3DrAfWXIR=
XqQXXlrD4wou_RlJISJ5wCigJhtEhmiH2ltNG9BP2R3nl4tFZyR1u-HA6Zx0jmUEGSqabM=
cKt0F2PxJGDAbURUNpG_3xOxGkf9V8zLrHvqr4K-ykDSWk_l53qKeCdkuzZASQQw6UxL5A=
IKeDV7zPxktneFLc2MoqXhDePiVOg9T28XKhd-C-5yrT1kw2"><SPAN=20
style=3D"TEXT-DECORATION: none; text-underline: none"><FONT color=3D#0=
000ff>Download=20
PDF</FONT></SPAN></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 8pt"><o:p><FONT=20
face=3DCalibri>&nbsp;</FONT></o:p></P>
<P>&nbsp;</P></BODY></HTML>

<img src=3D"http://email.foscoredevelopment.org/tracking/open?msgid=3D=
mTeKG4N2A7JWBsP054A_3w2&c=3D1559414682878703408" style=3D"width:1px;he=
ight:1px" alt=3D"" /><div style=3D"text-align:center; background-color=
:#fff;padding-top:10px;padding-bottom:10px;font-size:8pt;font-family:s=
ans-serif;"><a href=3D"http://email.foscoredevelopment.org/tracking/un=
subscribe?d=3DowedlQOZb4HERRPxy-glMpat4SK-ko9qPw4IIGFOz5zXtIdkIJKayW2N=
l7eFuHknZKdSVd29DaOtz7U0R6lhydy0v9i-KtT3904acViU-8gh0" style=3D"text-a=
lign:center;text-decoration:none;color:#666;">UNSUBSCRIBE</a></div>
--=-eZCfCVbQ1QKYCZW/PeMYSzrxglE29MF223WKzQ==--
