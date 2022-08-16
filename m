Return-Path: <SRS0=XedY=YU=fdc-k.ngo=outreach@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97C2C19F2C
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Aug 2022 05:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC472C433D6; Tue, 16 Aug 2022 05:40:16 +0000 (UTC)
Received: from f119.mxout.mta4.net (f119.mxout.mta4.net [96.45.68.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AA00C433C1
	for <linux-firmware@kernel.org>; Tue, 16 Aug 2022 05:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AA00C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fdc-k.ngo
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fdc-k.ngo
DKIM-Signature: v=1; a=rsa-sha256; d=fdc-k.ngo; s=api; c=relaxed/simple;
	t=1660628407; h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
	bh=JYDhKqX5LAAQMti4iGU48GjKBw8h81IA6U7UD3X8MH0=;
	b=g29jKStMVWuzgo1zkzjJgZwfTQ2bl1WXCZ1+CXlqiL/tfRSSgnn69T6AFc1tXf1M6wyiwC4lckk
	cL5B/IHhwwRDOKu6yFg2bqTl2XmcDg924GwyE33QzR4OOVKibeJ6NuFxjVgqRTRp9/eRFfiIc9QQM
	28LeWEwY/y4n2uWlEec=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
	c=relaxed/simple; t=1660628407;
	h=from:date:subject:reply-to:to:list-unsubscribe;
	bh=JYDhKqX5LAAQMti4iGU48GjKBw8h81IA6U7UD3X8MH0=;
	b=MWoxlkgfUxC0vMJW/PEPqDcNK/QXnjymltVP0PAC5WaBDUlsAw7rnlU6teao/S86YPmyi+bPjk+
	KyLwsMwT6v80JQ+tXdTIgEHUy017+JOaEM9GDSk7FLjxTdfgBHpjLcSPiGCoDBokZo6wA668IPUde
	LlA04wBosGyNv2GAgkk=
From: "outreach@fdc-k.ngo" <outreach@fdc-k.ngo>
Date: Tue, 16 Aug 2022 05:40:07 +0000
Subject: RE: Invitation to Project Monitoring and Evaluation with Data
 Management and Analysis workshop Sep 2022 Mombasa Kenya
Message-Id: <4uhmqsn63fwh.fJI5GHqGxvnM6-mQM25Ksw2@email.fdc-k.ngo>
Reply-To: outreach@fdc-k.ngo
Sender: outreach@fdc-k.ngo
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
List-Unsubscribe: 
 =?us-ascii?q?=3Cmailto=3Aunsubscribe+fJI5GHqGxvnM6-mQM25Ksw2=40bounces=2Eelasticem?=
 =?us-ascii?q?ail=2Enet=3Fsubject=3Dunsubscribe=3E=2C?=
 =?us-ascii?q?_=3Chttp=3A=2F=2Femail=2Efdc-k=2Engo=2Ftracking=2Funsubscribe=3Fmsgid=3DfJI5GHqGxv?=
 =?us-ascii?q?nM6-mQM25Ksw2&c=3D1559414682878703408=3E?=
X-Msg-EID: fJI5GHqGxvnM6-mQM25Ksw2
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=-eZCfAkj8qwLkNuCGfMcCP2TM4ykwgNU223WKzQ=="

--=-eZCfAkj8qwLkNuCGfMcCP2TM4ykwgNU223WKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9jbGljaz9kPWctS0Vsc1UxMjlS
ajR4RF9LTC1ZZEhHU2E1MnNja0FCQWtLd3ZFalFMdkFzSlk0ZklxdDNmbkp3eU5KTS0xQ3I5
VzhEN1VqZ0VVTGRSVEFJWkQzRk9wdTJxNWNaY3RtRW95NzZ1VTR2MHRQaC1IMXc0TlFrX08t
VkZBZHl4R25Bc2dpaS1CZHJyLVB4UG5US09sOGRfcl9BWHBtUXphTWRSczhmemxpemdWeDRY
Z001bWdTc0hYS0YxVnpPNk52aUdhVS1Db0EzZ19lNE0tbTNNSDVxdU5icjIycHJDUFJ5b20y
SnRrS1MwSzRMaXV6czdWQk9BRXliZkNxTlZaZDA1SXplUGtHcW1OM1hESEI0VnZHRldiSkJ0
VUpZN0RIZVpLcTVqdUh0Znl4RTA+DQpQcm9qZWN0IA0KTW9uaXRvcmluZyBhbmQgRXZhbHVh
dGlvbiB3aXRoIERhdGEgTWFuYWdlbWVudCBhbmQgQW5hbHlzaXMgd29ya3Nob3BzDQojQ291
cnNlIERhdGVEdXJhdGlvbkxvY2F0aW9uQ291cnNlIGZlZTpSZWdpc3RyYXRpb24xODEyLzA5
LzIwMjLCoFRvwqAyMy8wOS8yMDIyMTAgDQogICAgICBEYXlzTW9tYmFzYSwgDQogICAgICBL
ZW55YVVTRCANCiAgICAgIDIsNTAwDQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2lu
Zy9jbGljaz9kPThJaE9aOC1yV2w1Q0ltLW1uWjg5TDNsUHR3dDJMVlo0WWtyWjV3bzY5NHd4
RmxPOGg1elhkc2VjM1RKaHpUYXpHclNrZy01TzBkeU1HTVpiUHlaNmRuSHRKMHdwQ2QyVTha
OWhNQzJFbng3SklfenFjbjdDWmlJc3lidFlyRDVOY1lnaWJBblk3MkpMWEgxbEw4c3o1cEFf
Ync0RWlfcW5fbHRlUnI5YXlHLW1PMzIyY0w5Y0F1Y2VBU2ZjemxxNG9rVm1DNVRSR295MzVq
ZDdpMlM2MkhZdl9hWXctZmFKWEJlSGFUaXJqcDBRanYtbVM1Snc3S2JFaW8yN2ZjR21XaU5w
M1l2ODdLeTVKTGRObnVqdHBhNUNrRDkzWTJVR09VWUVxVTg1N0ZybkJwRXpuQWZSSVBGbkhX
eFN1dDBPRVEyPg0KUmVnaXN0ZXIgDQogICAgICBBcyBJbmRpdmlkdWFsDQo8aHR0cDovL2Vt
YWlsLmZkYy1rLm5nby90cmFja2luZy9jbGljaz9kPUthVWRBS0VwY0NiR2tweV82Wmo2c3BB
MkFqWElEWE1mWlJlcWlQZGc1cVU1V2pXMEN0ai1LeVJRQ0hBS3RjRFQ3bVR1UGpuUk5rWHBB
dnNIVG9kbURLSm9PQVNfS01EckRlOXpzLTNEc0JpTVROTHNMbHJ1QTRzbnhxUi1NbDhhOUdG
bkNXVElobmdlcEhlQ2FDWnhSYmpMdXNJSmhCZFdpR1JfQ3U1Ukw4cjZ4T2xHVVBrMjlHU3Rt
MV82NE9IbDJNTlhpektYNGppQ1FfZk5MWE1EYURibUpMLTVsU19WMlRzSFgzNkpEckd0VlVT
c0RValIxTUh4SDBvWUxBX3NjV29VdXdUQzRobHE3QU5aVm96SU9LV1BlTFFIZ1BqZEV5WWRk
WldpbTcwcEhTbEJjWGgxSzYzNWRsNExQb2huU3cyPg0KUmVnaXN0ZXIgDQogICAgICBGb3Ig
T25saW5lIFRyYWluaW5nDQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9jbGlj
az9kPTRNb2dDZGJJVUxCT3JtTmpza3F1OWdESTJsSV9lT0VoR0ZCem9NSElVbDZGNjdyWWFx
bHpyVjdiUlBOai1UaGN4UktBc0MxRndCbnZrRlJTS0JmZHNXbVZ4MUlXQWZtN1JpTUhPUG95
TmVUNGw2VnhPMjNHRVRzYlFpZjNuLUFTVXBzejVjVGlIQ04xelNZcW04MXJaLVNsM1MyVS1n
Vkw4d0hXazB6YzcybEZ5bXhDaG51WVJYUi1RQWo4QTlWcTh0QndZcnpBV2pxRVYzclJta2xI
azh6OTVkdFhSTE9QSExMaDZCZUVTeG9GdG1EZjVrTTF6b0dldGtCd05STXNXNmJ0YWJVV013
SlNTWnd4ZkRFdXVrenhPOG15d01QLUJPeUZ5emVSdERTZDJ6a200LXcwZTVSSTl1eUEyUFJY
YncyPg0KUmVnaXN0ZXIgDQogICAgICBBcyBBIEdyb3VwDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQrCoMKgwqAgDQpSZWFjaCANCm91dCB0byB1cyB0cmFpbmluZ0BmZGMtay5vcmcgb3IgY2Fs
bCArMjU0NzEyMjYwMDMxDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vZW1haWwu
ZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9bDZ6ZkZQLWhja2ItUmx2UWRnRGRoem0xN2xW
N0xFZ3BfWVNIY0ctSS1BYnNnN0h4ejhxbTN3d2wwT0I4d29qRXJZNXI4X0F5YlFLZGZ4VjFx
QXhua3ZoUjF6RW9NNE5Fc0NNamJERl8tTFpzUkpLdWQwMTZiX3c2cExpNnM3RlV4Rzc1b3Rh
bDlPWDZ5TzRyTUpkdGpEUTE+DQpXaGF0c0FwcCANCm91ciBjb25zdWx0YW50IA0Kb3IgDQo8
aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9jbGljaz9kPW9ubk1nWnJHMmx6RVlN
VC1LZ2djdExKb3NhbmR0dWd2dDFSNGg1TlVxTy1Za3d4MTZ1VzVScC1BSk5ubV9LamJlbmpS
bkZKWDBvYUt4UkRBRktZd20tc001RWZSTGNITkhWejhsOHp3QW5XWk8tOWUyMkxyUC1IUnJ6
WTYtV3VhM2psUWtZS3o1WENqTjlqQWJSYWtXRUkxPg0KRmlsbCANCmZvcm0gaGVyZQ0KwrfC
oMKgwqDCoMKgwqDCoMKgIA0KDQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9j
bGljaz9kPW5MMk8zQ3Y3d3pfRXZXZWFFa2VpLUlLRFREYkEyTFFhSFp1eUoteHBXY1NlWkhF
eHBVTHNEZWlDYnFUdHViN0pNSGdleVZJWU5WVEVRWW1OYlpMc0J6a0RWLVluWnR2OS1Xd09I
Zko1cDl1Sk9Ta3dMbkFQV3dnOFcwVE5qeThNNVVTZThsQzVaMkZQbUZKdEhrQnFUa28xPg0K
T25saW5lIFRyYWluaW5nIENvdXJzZQ0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KDQo8aHR0cDov
L2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9jbGljaz9kPW9ubk1nWnJHMmx6RVlNVC1LZ2dj
dE5HWTdTcDBtakh1ejh0VG1CM0NyaHVpTmhPa2Q2MjZSVjFBOWxfa29ic2V2dGQzRTZYWi1t
RmVobnpaX3hGbmZtblRmYzNhRHdIcHdVUDV1bGR1cGNkakxId2RaUkdBLTRSd2FMc2ZGbGhw
dlR2NXU4NVMzN1UtcFJrcUd2NktZTmMxPg0KUHJvZmVzc2lvbmFsIFNob3J0IFRyYWluaW5n
IA0KQ291cnNlcw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KDQo8aHR0cDovL2VtYWlsLmZkYy1r
Lm5nby90cmFja2luZy9jbGljaz9kPVRHYzZTUE5hNndzZjBhMjB0djZpVmM3eXRUVHFMUFBK
UkZqalVyaC1OR3FNem51eC1OQWI5TDFacU9wUnI4OEJaZmtCOGxmM3h3RlI4NzZzbHdTYU8y
dzVuZ0pTTG5JaVNtT2xLaFJoU0lzQTdON1RzVXhrdHExTDZYcl9tNGtXMlB0V3ZPTUNERWNK
SFY3dE9mSXF3TnlmeDRBLWNNSEVIQkp5M2ZMX1VMbU1pUV9Vc0hYNk1fTy1ZbXE4WG1HblN3
Mj4NCkRvd25sb2FkIA0Kb3VyIEFkbWlzc2lvbiBmb3JtDQrCt8KgwqDCoMKgwqDCoMKgwqAg
DQoNCjxodHRwOi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9d19WZkZMaXlI
UWxZX0doV2lLRDItVGhsakVpaW1zWVQ5Y0hVMkdLWkZoZjhwZU1DMnNiMGJHalB0Nm1PeDFW
SlBjT2FtTXY1SS1HUEY0NU5DZTFwRzR5dXl6LUJySTNmUThrTjdneHdyUmlBSXl1NVlsOUdE
VkRsNjNmU0hzNEx4UGExcG95dV9WYjg2anVhcVpEQWtCclhpbVhSZHlvQkZvNjFydzdHTTJU
UkFCRXJjRTJQNlp0dG96dUFRdTl0Q3cyPg0KRG93bmxvYWQgDQpwcmUtdHJhaW5pbmcgZm9y
bSB0byBmaWxsIGFuZCBzaGFyZSB3aXRoIHVzDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxo
dHRwOi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9SWdjX21rOS1ZRjFYaS1z
S21Mem9FVFBzcEI2RVp5RTlIckhhV1JLSjRITVhSSTlNZnpibFRIRTFORGNHT2xfXzltMkpq
eHJrOTIzYmR2X0ZpTV9uanRDc0dMNkFGNEZ1eDZLMDRHajNZYVJFNnpjaENoTzBqandQblll
NTdvbzJsLWY3eURqdFE2bnRQeUlpNzJ0bjJVNURjSG1UOVhwNndFM0JORDMwRE9uQzA+DQpE
b3dubG9hZCANCm91ciBDYWxlbmRlciAyMDIyDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQpGT1ND
T1JFIA0KREVWRUxPUE1FTlQgQ0VOVEVSIA0KPGh0dHA6Ly9lbWFpbC5mZGMtay5uZ28vdHJh
Y2tpbmcvY2xpY2s/ZD15aWNfbnhEb0xBV0stUEFubTduUEkyZy1VVllmOHhBWUgwcTJ1eFh3
TGc4MzlJenV2TmpheXNVcWxLQ19wZU5ZeFVtM0hzc2NobzB6QXJhS3JCanBHSWpPT1hJNTAy
U1N6Z25TcF9RM0ZjNnRGM1dDMW1CSUtlZzZxMlR2OThkam5DQUpNcjl2M1N1OVFTV3NEclA2
SGxHZEo5RXFiaXl5dzMwSHFVeTJvZmlqaHJSQUZXZERyWXRWTmRlenFuVzE3QTI+DQp3d3cu
ZmRjLWsub3JnDQoNCkFib3V0IHRoZSANCmNvdXJzZQ0KVGhpcyBpcyBhIA0KY29tcHJlaGVu
c2l2ZSAxMCBkYXlzIE0mRSBjb3Vyc2UgdGhhdCBjb3ZlcnMgdGhlIHByaW5jaXBsZXMgYW5k
IHByYWN0aWNlcyANCmZvciByZXN1bHRzIGJhc2VkIG1vbml0b3JpbmcgYW5kIGV2YWx1YXRp
b24gZm9yIHRoZSBlbnRpcmUgcHJvamVjdCBsaWZlIGN5Y2xlLiANClRoaXMgY291cnNlIGVx
dWlwcyBwYXJ0aWNpcGFudHMgd2l0aCBza2lsbHMgaW4gc2V0dGluZyB1cCBhbmQgaW1wbGVt
ZW50aW5nIA0KcmVzdWx0cyBiYXNlZCBtb25pdG9yaW5nIGFuZCBldmFsdWF0aW9uIHN5c3Rl
bXMgaW5jbHVkaW5nIE0mRSBkYXRhIA0KbWFuYWdlbWVudCwgYW5hbHlzaXMgYW5kIHJlcG9y
dGluZy4gVGhlIHBhcnRpY2lwYW50cyB3aWxsIGJlbmVmaXQgZnJvbSB0aGUgDQpsYXRlc3Qg
TSZFIHRoaW5raW5nIGFuZCBwcmFjdGljZXMgaW5jbHVkaW5nIHRoZSByZXN1bHRzIGFuZCBw
YXJ0aWNpcGF0b3J5IA0KYXBwcm9hY2hlcy4gVGhpcyBjb3Vyc2UgaXMgZGVzaWduZWQgdG8g
ZW5hYmxlIHRoZSBwYXJ0aWNpcGFudHMgYmVjb21lIGV4cGVydHMgaW4gDQptb25pdG9yaW5n
IGFuZCBldmFsdWF0aW5nIHRoZWlyIGRldmVsb3BtZW50IHByb2plY3RzLiBUaGUgY291cnNl
IGNvdmVycyBhbGwgdGhlIA0Ka2V5IGVsZW1lbnRzIG9mIGEgcm9idXN0IE0mRSBzeXN0ZW0g
Y291cGxlZCB3aXRoIGEgcHJhY3RpY2FsIHByb2plY3QgdG8gDQppbGx1c3RyYXRlIHRoZSBN
JkUgY29uY2VwdHMuwqANClRhcmdldCANClBhcnRpY2lwYW50cw0KVGhpcyBjb3Vyc2UgaXMg
DQpkZXNpZ25lZCBmb3IgcmVzZWFyY2hlcnMsIHByb2plY3Qgc3RhZmYsIGRldmVsb3BtZW50
IHByYWN0aXRpb25lcnMsIG1hbmFnZXJzIGFuZCANCmRlY2lzaW9uIG1ha2VycyB3aG8gYXJl
IHJlc3BvbnNpYmxlIGZvciBwcm9qZWN0LCBwcm9ncmFtIG9yIG9yZ2FuaXphdGlvbi1sZXZl
bCANCk0mRS4gVGhlIGNvdXJzZSBhaW1zIHRvIGVuaGFuY2UgdGhlIHNraWxscyBvZiBwcm9m
ZXNzaW9uYWxzIHdobyBuZWVkIHRvIA0KcmVzZWFyY2gsIHN1cGVydmlzZSwgbWFuYWdlLCBw
bGFuLCBpbXBsZW1lbnQsIG1vbml0b3IgYW5kIGV2YWx1YXRlIGRldmVsb3BtZW50IA0KcHJv
amVjdHMuDQpDb3Vyc2UgDQpkdXJhdGlvbg0KMTAgDQpkYXlzDQpDb3Vyc2UgDQpvYmplY3Rp
dmVzDQpEZXZlbG9wIA0KICBwcm9qZWN0IHJlc3VsdHMgbGV2ZWxzDQpEZXNpZ24gYSANCiAg
cHJvamVjdCB1c2luZyBsb2dpY2FsIGZyYW1ld29yaw0KRGV2ZWxvcCANCiAgaW5kaWNhdG9y
cyBhbmQgdGFyZ2V0cyBmb3IgZWFjaCByZXN1bHQgbGV2ZWwNClRyYWNrIA0KICBwZXJmb3Jt
YW5jZSBpbmRpY2F0b3JzIG92ZXIgdGhlIGxpZmUgb2YgdGhlIHByb2plY3QNCkV2YWx1YXRp
b24gYSANCiAgcHJvamVjdCBhZ2FpbnN0IHRoZSBzZXQgcmVzdWx0cw0KRGV2ZWxvcCBhbmQg
DQogIGltcGxlbWVudCBNJkUgc3lzdGVtcw0KRGV2ZWxvcCBhIA0KICBjb21wcmVoZW5zaXZl
IG1vbml0b3JpbmcgYW5kIGV2YWx1YXRpb24gcGxhbg0KVXNlIGRhdGEgDQogIGFuYWx5c2lz
IHNvZnR3YXJlIChTdGF0YS9TUFNTL1IpDQpDb2xsZWN0IGRhdGEgDQogIHVzaW5nIG1vYmls
ZSBkYXRhIGNvbGxlY3Rpb24gdG9vbHMNCkNhcnJ5b3V0IA0KICBpbXBhY3QgZXZhbHVhdGlv
bg0KVXNlIEdJUyB0byANCiAgYW5hbHl6ZSBhbmQgc2hhcmUgcHJvamVjdCBkYXRhDQpDb3Vy
c2UgDQpPdXRsaW5lDQpJbnRyb2R1Y3Rpb24gdG8gDQpSZXN1bHRzIEJhc2VkIFByb2plY3Qg
TWFuYWdlbWVudA0KRnVuZGFtZW50YWxzIA0KICBvZiBSZXN1bHRzIEJhc2VkIE1hbmFnZW1l
bnQNCldoeSBpcyBSQk0gDQogIGltcG9ydGFudD8NClJlc3VsdHMgYmFzZWQgDQogIG1hbmFn
ZW1lbnQgdnMgdHJhZGl0aW9uYWwgcHJvamVjdHMgbWFuYWdlbWVudA0KUkJNIExpZmVjeWNs
ZSANCiAgKHNldmVuIHBoYXNlcykNCkFyZWFzIG9mIA0KICBmb2N1cyBvZiBSQk0NCkZ1bmRh
bWVudGFscyANCm9mIE1vbml0b3JpbmcgYW5kIEV2YWx1YXRpb24NCkRlZmluaXRpb24gb2Yg
DQogIE1vbml0b3JpbmcgYW5kIEV2YWx1YXRpb24NCldoeSANCiAgTW9uaXRvcmluZyBhbmQg
RXZhbHVhdGlvbiBpcyBpbXBvcnRhbnQNCktleSANCiAgcHJpbmNpcGxlcyBhbmQgY29uY2Vw
dHMgaW4gTSZFDQpNJkUgaW4gDQogIHByb2plY3QgbGlmZWN5Y2xlDQpQYXJ0aWNpcGF0b3J5
IA0KICBNJkUNClByb2plY3QgDQpBbmFseXNpcw0KU2l0dWF0aW9uIA0KICBBbmFseXNpcw0K
TmVlZHMgDQogIEFzc2Vzc21lbnQNClN0cmF0ZWd5IA0KICBBbmFseXNpcw0KRGVzaWduIA0K
b2YgUmVzdWx0cyBpbiBNb25pdG9yaW5nIGFuZCBFdmFsdWF0aW9uDQpSZXN1bHRzIGNoYWlu
IA0KICBhcHByb2FjaGVzOiBJbXBhY3QsIG91dGNvbWVzLCBvdXRwdXRzIGFuZCBhY3Rpdml0
aWVzDQpSZXN1bHRzIA0KICBmcmFtZXdvcmsNCk0mRSANCiAgY2F1c2FsIHBhdGh3YXkNClBy
aW5jaXBsZXMgb2YgDQogIHBsYW5uaW5nLCBtb25pdG9yaW5nIGFuZCBldmFsdWF0aW5nIGZv
ciByZXN1bHRzDQpNJkUgDQpJbmRpY2F0b3JzDQpJbmRpY2F0b3JzIA0KICBkZWZpbml0aW9u
DQpJbmRpY2F0b3IgDQogIG1ldHJpY3MNCkxpbmtpbmcgDQogIGluZGljYXRvcnMgdG8gcmVz
dWx0cw0KSW5kaWNhdG9yIA0KICBtYXRyaXgNClRyYWNraW5nIG9mIA0KICBpbmRpY2F0b3Jz
DQpMb2dpY2FsIA0KRnJhbWV3b3JrIEFwcHJvYWNoDQpMRkEg4oCTIA0KICBBbmFseXNpcyBh
bmQgUGxhbm5pbmcgcGhhc2UNCkRlc2lnbiBvZiANCiAgbG9nZnJhbWUNClJpc2sgcmF0aW5n
IA0KICBpbiBsb2dmcmFtZQ0KSG9yaXpvbnRhbCANCiAgYW5kIHZlcnRpY2FsIGxvZ2ljIGlu
IGxvZ2ZyYW1lDQpVc2luZyANCiAgbG9nZnJhbWUgdG8gY3JlYXRlIHNjaGVkdWxlczogQWN0
aXZpdHkgYW5kIEJ1ZGdldCBzY2hlZHVsZXMNClVzaW5nIA0KICBsb2dmcmFtZSBhcyBhIHBy
b2plY3QgbWFuYWdlbWVudCB0b29sDQpUaGVvcnkgDQpvZiBDaGFuZ2UNCk92ZXJ2aWV3IG9m
IA0KICB0aGVvcnkgb2YgY2hhbmdlDQpEZXZlbG9waW5nIA0KICB0aGVvcnkgb2YgY2hhbmdl
DQpUaGVvcnkgb2YgDQogIENoYW5nZSB2cyBMb2cgRnJhbWUNCkNhc2Ugc3R1ZHk6IA0KICBU
aGVvcnkgb2YgY2hhbmdlDQpNJkUgDQpTeXN0ZW1zDQpXaGF0IGlzIGFuIA0KICBNJkUgU3lz
dGVtPw0KRWxlbWVudHMgb2YgDQogIE0mRSBTeXN0ZW0NClN0ZXBzIGZvciANCiAgZGV2ZWxv
cGluZyBSZXN1bHRzIGJhc2VkIE0mRSBTeXN0ZW0NCk0mRSANClBsYW5uaW5nDQpJbXBvcnRh
bmNlIG9mIA0KICBhbiBNJkUgUGxhbg0KRG9jdW1lbnRpbmcgDQogIE0mRSBTeXN0ZW0gaW4g
dGhlIE0mRSBQbGFuDQpDb21wb25lbnRzIG9mIA0KICBhbiBNJkUgUGxhbi1Nb25pdG9yaW5n
LCBFdmFsdWF0aW9uLCBEYXRhIG1hbmFnZW1lbnQsIFJlcG9ydGluZw0KVXNpbmcgTSZFIA0K
ICBQbGFuIHRvIGltcGxlbWVudCBNJkUgaW4gYSBQcm9qZWN0DQpNJkUgcGxhbiANCiAgdnMg
UGVyZm9ybWFuY2UgTWFuYWdlbWVudCBQbGFuIChQTVApDQpCYXNlIA0KU3VydmV5IGluIFJl
c3VsdHMgYmFzZWQgTSZFDQpJbXBvcnRhbmNlIG9mIA0KICBiYXNlbGluZSBzdHVkaWVzDQpQ
cm9jZXNzIG9mIA0KICBjb25kdWN0aW5nIGJhc2VsaW5lIHN0dWRpZXMNCkJhc2VsaW5lIA0K
ICBzdHVkeSB2cyBldmFsdWF0aW9uDQpQcm9qZWN0IA0KUGVyZm9ybWFuY2UgRXZhbHVhdGlv
bg0KUHJvY2VzcyBhbmQgDQogIHByb2dyZXNzIGV2YWx1YXRpb25zDQpFdmFsdWF0aW9uIA0K
ICByZXNlYXJjaCBkZXNpZ24NCkV2YWx1YXRpb24gDQogIHF1ZXN0aW9ucw0KRXZhbHVhdGlv
biANCiAgcmVwb3J0IERpc3NlbWluYXRpb24NCk0mRSANCkRhdGEgTWFuYWdlbWVudA0KRGlm
ZmVyZW50IA0KICBzb3VyY2VzIG9mIE0mRSBkYXRhDQpRdWFsaXRhdGl2ZSANCiAgZGF0YSBj
b2xsZWN0aW9uIG1ldGhvZHMNClF1YW50aXRhdGl2ZSANCiAgZGF0YSBjb2xsZWN0aW9uIG1l
dGhvZHMNClBhcnRpY2lwYXRvcnkgDQogIG1ldGhvZHMgb2YgZGF0YSBjb2xsZWN0aW9uDQpE
YXRhIFF1YWxpdHkgDQogIEFzc2Vzc21lbnQNCk0mRSANClJlc3VsdHMgVXNlIGFuZCBEaXNz
ZW1pbmF0aW9uDQpTdGFrZWhvbGRlcuKAmXMgDQogIGluZm9ybWF0aW9uIG5lZWRzDQpVc2Ug
b2YgDQogIE0mRSByZXN1bHRzIHRvIGltcHJvdmUgYW5kIHN0cmVuZ3RoZW4gcHJvamVjdHMN
ClVzZSBvZiANCiAgTSZFIExlc3NvbnMgbGVhcm50IGFuZCBCZXN0IFByYWN0aWNlcw0KT3Jn
YW5pemF0aW9uIA0KICBrbm93bGVkZ2UgY2hhbXBpb25zDQpNJkUgDQogIHJlcG9ydGluZyBm
b3JtYXQNCk0mRSANCiAgcmVzdWx0cyBjb21tdW5pY2F0aW9uIHN0cmF0ZWdpZXMNCkdlbmRl
ciANClBlcnNwZWN0aXZlIGluIE0mRQ0KSW1wb3J0YW5jZSBvZiANCiAgZ2VuZGVyIGluIE0m
RQ0KSW50ZWdyYXRpbmcgDQogIGdlbmRlciBpbnRvIHByb2dyYW0gbG9naWMNClNldHRpbmcg
DQogIGdlbmRlciBzZW5zaXRpdmUgaW5kaWNhdG9ycw0KQ29sbGVjdGluZyANCiAgZ2VuZGVy
IGRpc2FnZ3JlZ2F0ZWQgZGF0YQ0KQW5hbHl6aW5nIA0KICBNJkUgZGF0YSBmcm9tIGEgZ2Vu
ZGVyIHBlcnNwZWN0aXZlDQpBcHByYWlzYWwgb2YgDQogIHByb2plY3RzIGZyb20gYSBnZW5k
ZXIgcGVyc3BlY3RpdmUNCkRhdGEgDQpDb2xsZWN0aW9uIFRvb2xzIGFuZCBUZWNobmlxdWVz
DQpTb3VyY2VzIG9mIA0KICBNJkUgZGF0YSDigJNwcmltYXJ5IGFuZCBzZWNvbmRhcnkNClNh
bXBsaW5nIA0KICBkdXJpbmcgZGF0YSBjb2xsZWN0aW9uDQpRdWFsaXRhdGl2ZSANCiAgZGF0
YSBjb2xsZWN0aW9uIG1ldGhvZHMNClF1YW50aXRhdGl2ZSANCiAgZGF0YSBjb2xsZWN0aW9u
IG1ldGhvZHMNClBhcnRpY2lwYXRvcnkgDQogIGRhdGEgY29sbGVjdGlvbiBtZXRob2RzDQpJ
bnRyb2R1Y3Rpb24gDQogIHRvIGRhdGEgdHJpYW5ndWxhdGlvbg0KRGF0YSANClF1YWxpdHkN
CldoYXQgaXMgZGF0YSANCiAgcXVhbGl0eT8NCldoeSBkYXRhIA0KICBxdWFsaXR5Pw0KRGF0
YSBxdWFsaXR5IA0KICBzdGFuZGFyZHMNCkRhdGEgZmxvdyBhbmQgDQogIGRhdGEgcXVhbGl0
eQ0KRGF0YSBRdWFsaXR5IA0KICBBc3Nlc3NtZW50cw0KTSZFIA0KICBzeXN0ZW0gZGVzaWdu
IGZvciBkYXRhIHF1YWxpdHkNCklDVCANCmluIE1vbml0b3JpbmcgYW5kIEV2YWx1YXRpb24N
Ck1vYmlsZSBiYXNlZCANCiAgZGF0YSBjb2xsZWN0aW9uIHVzaW5nIE9ESw0KRGF0YSANCiAg
dmlzdWFsaXphdGlvbiAtIGluZm8gZ3JhcGhpY3MgYW5kIGRhc2hib2FyZHMNClVzZSBvZiBJ
Q1QgDQogIHRvb2xzIGZvciBSZWFsLXRpbWUgbW9uaXRvcmluZyBhbmQgZXZhbHVhdGlvbg0K
UXVhbGl0YXRpdmUgDQpEYXRhIEFuYWx5c2lzDQpQcmluY2lwbGVzIG9mIA0KICBxdWFsaXRh
dGl2ZSBkYXRhIGFuYWx5c2lzDQpEYXRhIA0KICBwcmVwYXJhdGlvbiBmb3IgcXVhbGl0YXRp
dmUgYW5hbHlzaXMNCkxpbmtpbmcgYW5kIA0KICBpbnRlZ3JhdGluZyBtdWx0aXBsZSBkYXRh
IHNldHMgaW4gZGlmZmVyZW50IGZvcm1zDQpUaGVtYXRpYyANCiAgYW5hbHlzaXMgZm9yIHF1
YWxpdGF0aXZlIGRhdGENCkNvbnRlbnQgDQogIGFuYWx5c2lzIGZvciBxdWFsaXRhdGl2ZSBk
YXRhDQpNYW5pcHVsYXRpb24gDQogIGFuZCBhbmFseXNpcyBvZiBkYXRhIHVzaW5nIE5WaXZv
DQpRdWFudGl0YXRpdmUgDQpEYXRhIEFuYWx5c2lzIOKAkyAoVXNpbmcgU1BTUy9TdGF0YSkN
CkludHJvZHVjdGlvbiANCiAgdG8gc3RhdGlzdGljYWwgY29uY2VwdHMNCkNyZWF0aW5nIA0K
ICB2YXJpYWJsZXMgYW5kIGRhdGEgZW50cnkNCkRhdGEgDQogIHJlY29uc3RydWN0aW9uDQpW
YXJpYWJsZXMgDQogIG1hbmlwdWxhdGlvbg0KRGVzY3JpcHRpdmUgDQogIHN0YXRpc3RpY3MN
ClVuZGVyc3RhbmRpbmcgDQogIGRhdGEgd2VpZ2h0aW5nDQpJbmZlcmVudGlhbCANCiAgc3Rh
dGlzdGljczogaHlwb3RoZXNpcyB0ZXN0aW5nLCBULXRlc3QsIEFOT1ZBLCByZWdyZXNzaW9u
IA0KYW5hbHlzaXMNCkltcGFjdCANCkFzc2Vzc21lbnQNCkludHJvZHVjdGlvbiANCiAgdG8g
aW1wYWN0IGV2YWx1YXRpb24NCkF0dHJpYnV0aW9uIA0KICBpbiBpbXBhY3QgZXZhbHVhdGlv
bg0KRXN0aW1hdGlvbiBvZiANCiAgY291bnRlcmZhY3R1YWwNCkltcGFjdCANCiAgZXZhbHVh
dGlvbiBtZXRob2RzOiBEb3VibGUgZGlmZmVyZW5jZSwgUHJvcGVuc2l0eSBzY29yZSANCm1h
dGNoaW5nDQpHSVMgDQppbiBNJkUNCkludHJvZHVjdGlvbiANCiAgdG8gR0lTIGluIE0mRQ0K
R0lTIGFuYWx5c2lzIA0KICBhbmQgbWFwcGluZyB0ZWNobmlxdWVzDQpEYXRhIA0KICBwcmVw
YXJhdGlvbiBmb3IgZ2Vvc3BhdGlhbCBhbmFseXNpcw0KR2Vvc3BhdGlhbCANCiAgYW5hbHlz
aXMgdXNpbmcgR0lTIHNvZnR3YXJlIChRR0lTKQ0KR2VuZXJhbCANCk5vdGVzDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoEFsbCANCm91ciBjb3Vyc2VzIGNhbiBiZSBUYWlsb3ItbWFkZSB0byBw
YXJ0aWNpcGFudHMnIG5lZWRzDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCnBhcnRpY2lw
YW50IG11c3QgYmUgY29udmVyc2FudCBpbiBFbmdsaXNoDQrCt8KgwqDCoMKgwqDCoMKgwqDC
oFByZXNlbnRhdGlvbnMgDQphcmUgd2VsbC1ndWlkZWQsIHByYWN0aWNhbCBleGVyY2lzZXMs
IHdlYi1iYXNlZCB0dXRvcmlhbHMsIGFuZCBncm91cCB3b3JrLiBPdXIgDQpmYWNpbGl0YXRv
cnMgYXJlIGV4cGVydHMgd2l0aCBtb3JlIHRoYW4gMTAgeWVhcnMgb2YgZXhwZXJpZW5jZS4N
CsK3wqDCoMKgwqDCoMKgwqDCoMKgVXBvbiANCmNvbXBsZXRpb24gb2YgdHJhaW5pbmcgdGhl
IHBhcnRpY2lwYW50IHdpbGwgYmUgaXNzdWVkIHdpdGggYSBGb3Njb3JlIGRldmVsb3BtZW50
IA0KY2VudGVyIGNlcnRpZmljYXRlIChGREMtSykNCsK3wqDCoMKgwqDCoMKgwqDCoMKgVHJh
aW5pbmcgDQp3aWxsIGJlIGRvbmUgYXQgdGhlIEZvc2NvcmUgZGV2ZWxvcG1lbnQgY2VudGVy
IChGREMtSykgY2VudGVycy4gV2UgYWxzbyBvZmZlciANCmluaG91c2UgYW5kIG9ubGluZSB0
cmFpbmluZyBvbiB0aGUgY2xpZW50IHNjaGVkdWxlDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENv
dXJzZSANCmR1cmF0aW9uIGlzIGZsZXhpYmxlIGFuZCB0aGUgY29udGVudHMgY2FuIGJlIG1v
ZGlmaWVkIHRvIGZpdCBhbnkgbnVtYmVyIG9mIA0KZGF5cy4NCsK3wqDCoMKgwqDCoMKgwqDC
oMKgVGhlIA0KY291cnNlIGZlZSBmb3Igb25zaXRlIHRyYWluaW5nIGluY2x1ZGVzIGZhY2ls
aXRhdGlvbiB0cmFpbmluZyBtYXRlcmlhbHMsIDIgDQpjb2ZmZWUgYnJlYWtzLCBhIGJ1ZmZl
dCBsdW5jaCwgYW5kIGEgQ2VydGlmaWNhdGUgb2Ygc3VjY2Vzc2Z1bCBjb21wbGV0aW9uIG9m
IA0KVHJhaW5pbmcuIFBhcnRpY2lwYW50cyB3aWxsIGJlIHJlc3BvbnNpYmxlIGZvciB0aGVp
ciBvd24gdHJhdmVsIGV4cGVuc2VzIGFuZCANCmFycmFuZ2VtZW50cywgYWlycG9ydCB0cmFu
c2ZlcnMsIHZpc2EgYXBwbGljYXRpb24gZGlubmVycywgaGVhbHRoL2FjY2lkZW50IA0KaW5z
dXJhbmNlLCBhbmQgb3RoZXIgcGVyc29uYWwgZXhwZW5zZXMuDQrCt8KgwqDCoMKgwqDCoMKg
wqDCoEFjY29tbW9kYXRpb24sIA0KcGlja3VwLCBmcmVpZ2h0IGJvb2tpbmcsIGFuZCBWaXNh
IHByb2Nlc3NpbmcgYXJyYW5nZW1lbnQsIGFyZSBkb25lIG9uIHJlcXVlc3QsIA0KYXQgZGlz
Y291bnRlZCBwcmljZXMuDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRhYmxldCANCmFuZCBMYXB0
b3BzIGFyZSBwcm92aWRlZCB0byBwYXJ0aWNpcGFudHMgb24gcmVxdWVzdCBhcyBhbiBhZGQt
b24gY29zdCB0byB0aGUgDQp0cmFpbmluZyBmZWUuDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE9u
ZS15ZWFywqBmcmVlIA0KQ29uc3VsdGF0aW9uIGFuZCBDb2FjaGluZyBwcm92aWRlZCBhZnRl
ciB0aGUgY291cnNlLg0KwrfCoMKgwqDCoMKgwqDCoMKgwqBSZWdpc3RlciANCmFzIGEgZ3Jv
dXAgb2YgbW9yZSB0aGFuIHR3byBhbmQgZW5qb3kgYSBkaXNjb3VudCBvZiAoMTAlIHRvIDUw
JSkNCsK3wqDCoMKgwqDCoMKgwqDCoMKgUGF5bWVudCANCnNob3VsZCBiZSBkb25lIGJlZm9y
ZSBjb21tZW5jZSBvZiB0aGUgdHJhaW5pbmcgb3IgYXMgYWdyZWVkIGJ5IHRoZSBwYXJ0aWVz
LCB0byANCnRoZSBGT1NDT1JFIERFVkVMT1BNRU5UIENFTlRFUiBhY2NvdW50LCBzbyBhcyB0
byBlbmFibGUgdXMgdG8gcHJlcGFyZSBiZXR0ZXIgZm9yIA0KeW91Lg0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBGb3IgDQphbnkgaW5xdWlyaWVzIHJlYWNoIHVzIGF0wqB0cmFpbmluZ0BmZGMt
ay5vcmfCoG9yIA0KKzI1NDcxMjI2MDAzMQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgV2Vi
c2l0ZToNCjxodHRwOi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9OWk4Tkgw
WXh1Z1Q3N3EyRnJJVzE1UmpSUWViTUJVeXF5VDZXX2llSDl3NFhYWHFBN0NBLUZUTnNqc1k4
MU5GSG9MWDBGUHhmRTBIaW1OQXNxQk04NGFjQmtzaFQyMFRESjhqdTJRYm1VUTYwRC1LeXBN
ZEp5VlllaG9SQVNFV2V5QTI+DQp3d3cuZmRjLWsub3JnDQrCoA0KSW5kaWNhdGl2ZSANCkJ1
ZGdldA0KVGhlIA0KcmVnaXN0cmF0aW9uIGNvc3QgaXMgaW5kaWNhdGVkIGluIGV2ZXJ5IGNv
dXJzZSBmb3Igb25saW5lIGFuZCBvbnNpdGUgdHJhaW5pbmdzIA0KZmluZCB0aGUgZ3JvdXAg
cmF0ZSBkaXNjb3VudCBiZWxvdzogDQoNCkdyb3VwIA0KICAgICAgU2l6ZQ0KRGlzY291bnQg
DQogICAgICBSYXRlIGZvciBHcm91cA0KMi03DQoyMCUNCjgtMjENCjI1JQ0KMjItMzENCjMw
JQ0KMzItNDENCjM1JQ0KNDItNTENCjQwJQ0KNTI+IA0KICAgICAgQWJvdmUNCjUwJQ0KT3Ro
ZXIgDQpJbXBvcnRhbnQgTGlua3MNCsK3wqDCoMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly9l
bWFpbC5mZGMtay5uZ28vdHJhY2tpbmcvY2xpY2s/ZD1LTGxqV1VPelZwZnhPYlVhSV8xdkNW
cFQzYnhweGhCVDhhcXhOTm9FbUdxbGVBbC1saUw5TlJHZDgwZWprZXBieTctOVN2VUN4ZVRL
cFZuenZRN2FhRURSQVBWS01xZVlXTER4WjkzV3hkbGJhRlNyVDNtTndPYTZZa05XdnpQNEVY
TlBvYzVLbEF5ZHB0aWp3MU4zY0ZHQjVvZTFybXZza1o5SGo1bXFFbGFRMD4NCkh1bWFuaXRh
cmlhbiANCmFuZCBTb2NpYWwgRGV2ZWxvcG1lbnQgcHJvZmVzc2lvbmFsIHNob3J0IGNvdXJz
ZXMNCsK3wqDCoMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly9lbWFpbC5mZGMtay5uZ28vdHJh
Y2tpbmcvY2xpY2s/ZD1paU9pN1RuTnF2aXg2RzNpTEVjeE1tY2RTSFYzcFNpTHpYM24yV21w
cWNzQ1JMRkZDdDRYNE1kbmotMjhuYXNNUEMtVkNRQnAxaG4yYnEwYmRvN1RDQ2RVRkNGclh1
ZXltOHNJM0U3bk5qM3VYVFJneldNeTBDNFAzZ0Y2Y2hTV0tQOURqOEtlSEZCOGc0bzRfSkpQ
VGRfZEc1dnJtclZKVnhQZEdjRHQ5cENDMD4NCk1vbml0b3JpbmcgDQphbmQgRXZhbHVhdGlv
biBwcm9mZXNzaW9uYWwgc2hvcnQgY291cnNlcw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KDQo8
aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy9jbGljaz9kPTVLTWxfd29aSTNLeDYz
eTFXUEE1c2MzeE9CQ1gwNHB1LUZ2aGxYYzBzRW0zdzJUZ185M1c0dXdNMlRYRUJtYm9LU2xG
SjBBSWFaLURnOXV6eEwzc0V6V3BwU055cUVXNHlDUTVkZTdSVFhYYkE2Yktvai1MU3JXN1dV
NTE2S1VRNFU4NkxHTC1HWFgwUVVLaXI1RGZlNDFHOTRVa2UyV3F6NDBDQWllaFBKc0EwPg0K
UmVzZWFyY2ggDQphbmQgRGF0YSBBbmFseXNpcyBwcm9mZXNzaW9uYWwgc2hvcnQgY291cnNl
cw0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KDQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFj
a2luZy9jbGljaz9kPW56MDlsR0UtWlVHeVQ1RHFZYWhHSTFoSU80WXdUUmxtaXliNy1qQlpF
U2FRXzJDcFB1ZlFDM2p0cG9wdmJVenZZX0llRXpOY0JneWxxUGE5Vno2U2hGTnVFSS1tdjVw
d2xlcUJFeHAzRk5QM213SThNUkEwbnpMVHNYOWVqWmJ5X0JyaVJaTGlJakNCU19qTkpoandx
RUszVU9YM2RQNWtyWWQ5XzdEQW5LUmowPg0KSW5mb3JtYXRpb24gDQpUZWNobm9sb2d5IHBy
b2Zlc3Npb25hbCBzaG9ydCBjb3Vyc2VzDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRw
Oi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9bEpBd0hxNEZ0dHpneHFvQkhF
Mk9qZWFXVUdremwtc1NwV2ZIZk9qcnFHT3VJUmM5a0JsaGVvSThfZG9FZGtKelp4TnZNQWlL
Q3VkVWJmYzNfRThySWYxa3NxLWVKN0FaS1pQbHZ2b3dFWUozOVFXNXVPQ2RkUE5ndHRQbTNJ
d2YtT3JGS2Y4SUYwazhacGpPb2E0N1phaVA0ZEJCejlIcGtya1ZBQlQtSUlqRTA+DQpBZ3Jp
Y3VsdHVyZSANCnByb2Zlc3Npb25hbCBzaG9ydCBjb3Vyc2VzDQrCt8KgwqDCoMKgwqDCoMKg
wqAgDQoNCjxodHRwOi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9Mmo0WXFS
cnlyMTlpby1Vcm41ZzFWT1E1LVVva3FqTU1vaEUwQktiZzJWcWp3d0ZvYldORTBrdnBBb3Js
c01acm1aRUx4WWRGaFYyREZuLW1jWDR1QW85WFN5M2R1ci1yNG5zVnlJYTcwRTVOZG5obGhi
eU04cEF3RkR6RFVTSWl0aUJLVUhTWVdwdXN1dk4yeE9rdTJFczE+DQpHSVMgDQomIFJlbW90
ZSBTZW5zaW5nIHByb2Zlc3Npb25hbCBzaG9ydCBjb3Vyc2VzDQrCt8KgwqDCoMKgwqDCoMKg
wqAgDQoNCjxodHRwOi8vZW1haWwuZmRjLWsubmdvL3RyYWNraW5nL2NsaWNrP2Q9VnpJNzNJ
bDdPNERnOFVRVlpjR0lyZmRyVHpXVGZKd0V6RWlwWDFZTGVKYzhTS2JmNmxjNGQ1SHVmWWZo
TzJLZDQxM1lOSEVXb3pvWThuN3RoUDZsb19qN2RkS1U5SWpGb09nRWlwcV81MERpNVJ5MEtw
d3VjaHRsX2NrTEhfY3pMQ0hGd0o1YVZ4Smw2S3lqZzZWSXFyU0RoTzY2ZW1IdWdid1BNcy1u
am5YVDA+DQpCdXNpbmVzcyANCmFuZCBHb3Zlcm5hbmNlIHByb2Zlc3Npb25hbCBzaG9ydCBj
b3Vyc2VzDQrCt8KgwqDCoMKgwqDCoMKgwqAgDQoNCjxodHRwOi8vZW1haWwuZmRjLWsubmdv
L3RyYWNraW5nL2NsaWNrP2Q9bkwyTzNDdjd3el9FdldlYUVrZWktSUtEVERiQTJMUWFIWnV5
Si14cFdjU2VaSEV4cFVMc0RlaUNicVR0dWI3SnMxekxVTDVOWDByWG1XWEc2QkNwZGxYLWlE
OVpYUWM0N2RWeGM2OUNfZy1GSEdCclFwOHJyR1FZQ3pYTDNNY3V5RFpVUnM1b2d6dU5SWXc0
V09tRExsQTE+DQpPbmxpbmUgDQpUcmFpbmluZyBDb3Vyc2UNCsK3wqDCoMKgwqDCoMKgwqDC
oCANCg0KPGh0dHA6Ly9lbWFpbC5mZGMtay5uZ28vdHJhY2tpbmcvY2xpY2s/ZD1vbm5NZ1py
RzJsekVZTVQtS2dnY3ROR1k3U3AwbWpIdXo4dFRtQjNDcmh2VGVhMjEwNFUybUx2TXJ6eG1Y
YXMyekVEVTNzUXZ5NWNfcVZXVnBvVG0yX3laMHA4T1lobWVjblFZcjBQbW1RTHVnOVdQRkRm
WnllNkptenZtMTZSYldVZDVlNjg5VjBsVWl4eTRYbVJxZlY4MT4NClByb2Zlc3Npb25hbCAN
ClNob3J0IFRyYWluaW5nIENvdXJzZXMNCsK3wqDCoMKgwqDCoMKgwqDCoCANClJlYWNoIA0K
b3V0IHRvIHVzIHRyYWluaW5nQGZkYy1rLm9yZyBvciBjYWxsICsyNTQ3MTIyNjAwMzENCsK3
wqDCoMKgwqDCoMKgwqDCoCANCg0KPGh0dHA6Ly9lbWFpbC5mZGMtay5uZ28vdHJhY2tpbmcv
Y2xpY2s/ZD1sNnpmRlAtaGNrYi1SbHZRZGdEZGh6bTE3bFY3TEVncF9ZU0hjRy1JLUFiTkVQ
dXVTdkRiTlJwUGFXenloeGRLck9ya3RIaGV0ZGxmekV0ZDJPU1hiLUNKdDJOeG1UOFpOZzZP
dDhickh3MXYyRzVJc1lfc3h0eEppWGdOQ3pNSC1obm5TM2t6ZFVfSUprSXRBM2ZfZmxjMT4N
CldoYXRzQXBwIA0Kb3VyIGNvbnN1bHRhbnQgDQpvciANCjxodHRwOi8vZW1haWwuZmRjLWsu
bmdvL3RyYWNraW5nL2NsaWNrP2Q9b25uTWdackcybHpFWU1ULUtnZ2N0TEpvc2FuZHR1Z3Z0
MVI0aDVOVXFPOUdpRzhCRXllandDMXVkVTRqS0hlYk9BSmF1MmpBeXRaYVJLYmZ4QWZ0Mm05
OHhmZFQwUmhNTHd0a2dMMTk4UzlNUnM1cXZPVmQ4cTA4SUZ2b1g2QW9UTUNQcGhTUFN1RXMz
cFpsazVmYVVpdzE+DQpGaWxsIA0KZm9ybSBoZXJlDQrCoA0KS2luZCANClJlZ2FyZHMNCkph
Y2tzb24gDQpNdW5lbmUNClRyYWluaW5nIA0KTWFuYWdlciANCkZvc2NvcmUgDQpEZXZlbG9w
bWVudCBDZW50ZXIgd3d3LmZkYy1rLm9yZw0KRW1haWw6IA0KamFja3NvbkBmZGMtay5vcmcN
Ck1vYmlsZSANClBlcnNvbmFsOiArMjU0NzI5MjYyMzAzDQpUZWwgDQpGb3Njb3JlOiArMjU0
NzEyMjYwMDMxDQoNCsKgDQo8aHR0cDovL2VtYWlsLmZkYy1rLm5nby90cmFja2luZy91bnN1
YnNjcmliZT9kPXZFVjYxSEhtd0dIVTdkd0JHaGZORFBjSmxVSk5lVDJSeHFZa2k3RWE5Rlpl
aVhtaFFKcDZCMFRpV25DWHcyb0cwcWRzSHFaNDNxSXhxY0FaRGtCN1FHeHVhUkRMS09GdW40
em8xamdKR3Z4UzA+DQpVTlNVQlNDUklCRQ==

--=-eZCfAkj8qwLkNuCGfMcCP2TM4ykwgNU223WKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<H3 class=3Dtext-center=20
style=3D'FONT-SIZE: 24px; FONT-FAMILY: "Segoe UI", Arial, sans-serif; =
WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEI=
GHT: 900; COLOR: rgb(68,68,68); FONT-STYLE: normal; TEXT-ALIGN: center=
; ORPHANS: 2; WIDOWS: 2; MARGIN: 10px 0px 20px; LETTER-SPACING: normal=
; LINE-HEIGHT: 1.1em; TEXT-INDENT: 0px; font-variant-ligatures: normal=
; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial'><A=20
href=3D"http://email.fdc-k.ngo/tracking/click?d=3Dg-KElsU129Rj4xD_KL-Y=
dHGSa52sckABAkKwvEjQLvAsJY4fIqt3fnJwyNJM-1Cr9W8D7UjgEULdRTAIZD3FOpu2q5=
cZctmEoy76uU4v0tPh-H1w4NQk_O-VFAdyxGnAsgii-Bdrr-PxPnTKOl8d_r_AXpmQzaMd=
Rs8fzlizgVx4XgM5mgSsHXKF1VzO6NviGaU-CoA3g_e4M-m3MH5quNbr22prCPRyom2Jtk=
KS0K4Liuzs7VBOAEybfCqNVZd05IzePkGqmN3XDHB4VvGFWbJBtUJY7DHeZKq5juHtfyxE=
0">Project=20
Monitoring and Evaluation with Data Management and Analysis workshops<=
/A></H3>
<P class=3Dtext-center=20
style=3D'FONT-SIZE: 24px; FONT-FAMILY: "Segoe UI", Arial, sans-serif; =
WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEI=
GHT: 900; COLOR: rgb(68,68,68); FONT-STYLE: normal; TEXT-ALIGN: center=
; ORPHANS: 2; WIDOWS: 2; MARGIN: 10px 0px 20px; LETTER-SPACING: normal=
; LINE-HEIGHT: 1.1em; TEXT-INDENT: 0px; font-variant-ligatures: normal=
; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial'>
<TABLE class=3Dtable=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 20px; MAX-WIDTH: 100%; FONT-F=
AMILY: Verdana, sans-serif; WIDTH: 1136px; WHITE-SPACE: normal; WORD-S=
PACING: 0px; BORDER-COLLAPSE: collapse; TEXT-TRANSFORM: none; FONT-WEI=
GHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: normal; BORDER-SPACING: 0px; =
ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(2=
55,255,255); font-variant-ligatures: normal; font-variant-caps: normal=
; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial">
  <TBODY style=3D"FONT-SIZE: 14px">
  <THEAD>
  <TR>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 48px; VERTICAL-ALIGN: bottom; BOR=
DER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALIG=
N: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PAD=
DING-RIGHT: 8px"><STRONG=20
      style=3D"FONT-WEIGHT: bolder">#</STRONG></TH>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 182px; VERTICAL-ALIGN: bottom; BO=
RDER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALI=
GN: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PA=
DDING-RIGHT: 8px"><STRONG=20
      style=3D"FONT-WEIGHT: bolder">Course Date</STRONG></TH>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 90px; VERTICAL-ALIGN: bottom; BOR=
DER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALIG=
N: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PAD=
DING-RIGHT: 8px"><STRONG=20
      style=3D"FONT-WEIGHT: bolder">Duration</STRONG></TH>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 123px; VERTICAL-ALIGN: bottom; BO=
RDER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALI=
GN: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PA=
DDING-RIGHT: 8px"><STRONG=20
      style=3D"FONT-WEIGHT: bolder">Location</STRONG></TH>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 118px; VERTICAL-ALIGN: bottom; BO=
RDER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALI=
GN: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PA=
DDING-RIGHT: 8px"><STRONG=20
      style=3D"FONT-WEIGHT: bolder">Course fee:</STRONG></TH>
    <TH=20
    style=3D"BORDER-TOP: 0px; WIDTH: 572px; VERTICAL-ALIGN: bottom; BO=
RDER-BOTTOM: rgb(221,221,221) 2px solid; PADDING-BOTTOM: 8px; TEXT-ALI=
GN: left; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEIGHT: 1.4285; PA=
DDING-RIGHT: 8px"=20
    colSpan=3D3><STRONG=20
  style=3D"FONT-WEIGHT: bolder">Registration</STRONG></TH></TR></THEAD=
>
  <TBODY style=3D"FONT-SIZE: 14px">
  <TR>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px">18</TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px">12/09/2022<SPAN>&nbsp;</SPAN><SPAN=20
      style=3D"FONT-WEIGHT: bold">To</SPAN><SPAN>&nbsp;</SPAN>23/09/20=
22</TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px">10=20
      Days</TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px">Mombasa,=20
      Kenya</TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px">USD=20
      2,500</TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px"><A=20
      style=3D"TEXT-DECORATION: none; COLOR: ; BACKGROUND-COLOR: trans=
parent; transition: all 0.2s ease-in-out 0s"=20
      href=3D"http://email.fdc-k.ngo/tracking/click?d=3D8IhOZ8-rWl5CIm=
-mnZ89L3lPtwt2LVZ4YkrZ5wo694wxFlO8h5zXdsec3TJhzTazGrSkg-5O0dyMGMZbPyZ6=
dnHtJ0wpCd2U8Z9hMC2Enx7JI_zqcn7CZiIsybtYrD5NcYgibAnY72JLXH1lL8sz5pA_bw=
4Ei_qn_lteRr9ayG-mO322cL9cAuceASfczlq4okVmC5TRGoy35jd7i2S62HYv_aYw-faJ=
XBeHaTirjp0Qjv-mS5Jw7KbEio27fcGmWiNp3Yv87Ky5JLdNnujtpa5CkD93Y2UGOUYEqU=
857FrnBpEznAfRIPFnHWxSut0OEQ2"><BUTTON=20
      class=3D"btn btn-primary btn-xs"=20
      style=3D"FONT-SIZE: 12px; OVERFLOW: visible; CURSOR: pointer; TE=
XT-DECORATION: none; BORDER-TOP: rgb(53,126,189) 1px solid; FONT-FAMIL=
Y: inherit; BORDER-RIGHT: rgb(53,126,189) 1px solid; VERTICAL-ALIGN: m=
iddle; BACKGROUND-IMAGE: none; WHITE-SPACE: nowrap; BORDER-BOTTOM: rgb=
(53,126,189) 1px solid; POSITION: relative; TEXT-TRANSFORM: capitalize=
; COLOR: rgb(255,255,255); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 1px;=
 TEXT-ALIGN: center; PADDING-TOP: 1px; OUTLINE-STYLE: none; PADDING-LE=
FT: 5px; BORDER-LEFT: rgb(53,126,189) 1px solid; MARGIN: 0px; DISPLAY:=
 inline-block; LETTER-SPACING: 1px; OUTLINE-COLOR: invert; LINE-HEIGHT=
: 1.5; PADDING-RIGHT: 5px; BACKGROUND-COLOR: rgb(66,139,202); font-str=
etch: inherit; appearance: button; touch-action: manipulation; user-se=
lect: none; border-radius: 3px; text-shadow: rgba(255, 255, 255, 0.3) =
0px 0px 1px">Register=20
      As Individual</BUTTON></A></TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px"><A=20
      style=3D"TEXT-DECORATION: none; COLOR: ; BACKGROUND-COLOR: trans=
parent; transition: all 0.2s ease-in-out 0s"=20
      href=3D"http://email.fdc-k.ngo/tracking/click?d=3DKaUdAKEpcCbGkp=
y_6Zj6spA2AjXIDXMfZReqiPdg5qU5WjW0Ctj-KyRQCHAKtcDT7mTuPjnRNkXpAvsHTodm=
DKJoOAS_KMDrDe9zs-3DsBiMTNLsLlruA4snxqR-Ml8a9GFnCWTIhngepHeCaCZxRbjLus=
IJhBdWiGR_Cu5RL8r6xOlGUPk29GStm1_64OHl2MNXizKX4jiCQ_fNLXMDaDbmJL-5lS_V=
2TsHX36JDrGtVUSsDUjR1MHxH0oYLA_scWoUuwTC4hlq7ANZVozIOKWPeLQHgPjdEyYddZ=
Wim70pHSlBcXh1K635dl4LPohnSw2"><BUTTON=20
      class=3D"btn btn-primary btn-xs"=20
      style=3D"FONT-SIZE: 12px; OVERFLOW: visible; CURSOR: pointer; TE=
XT-DECORATION: none; BORDER-TOP: rgb(53,126,189) 1px solid; FONT-FAMIL=
Y: inherit; BORDER-RIGHT: rgb(53,126,189) 1px solid; VERTICAL-ALIGN: m=
iddle; BACKGROUND-IMAGE: none; WHITE-SPACE: nowrap; BORDER-BOTTOM: rgb=
(53,126,189) 1px solid; POSITION: relative; TEXT-TRANSFORM: capitalize=
; COLOR: rgb(255,255,255); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 1px;=
 TEXT-ALIGN: center; PADDING-TOP: 1px; OUTLINE-STYLE: none; PADDING-LE=
FT: 5px; BORDER-LEFT: rgb(53,126,189) 1px solid; MARGIN: 0px; DISPLAY:=
 inline-block; LETTER-SPACING: 1px; OUTLINE-COLOR: invert; LINE-HEIGHT=
: 1.5; PADDING-RIGHT: 5px; BACKGROUND-COLOR: rgb(66,139,202); font-str=
etch: inherit; appearance: button; touch-action: manipulation; user-se=
lect: none; border-radius: 3px; text-shadow: rgba(255, 255, 255, 0.3) =
0px 0px 1px">Register=20
      For Online Training</BUTTON></A></TD>
    <TD=20
    style=3D"BORDER-TOP: rgb(221,221,221) 1px solid; VERTICAL-ALIGN: t=
op; PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; LINE-HEI=
GHT: 1.4285; PADDING-RIGHT: 8px"><A=20
      style=3D"TEXT-DECORATION: none; COLOR: rgb(42,100,150); OUTLINE-=
WIDTH: 0px; OUTLINE-STYLE: none; OUTLINE-COLOR: invert; BACKGROUND-COL=
OR: transparent; transition: all 0.2s ease-in-out 0s"=20
      href=3D"http://email.fdc-k.ngo/tracking/click?d=3D4MogCdbIULBOrm=
Njskqu9gDI2lI_eOEhGFBzoMHIUl6F67rYaqlzrV7bRPNj-ThcxRKAsC1FwBnvkFRSKBfd=
sWmVx1IWAfm7RiMHOPoyNeT4l6VxO23GETsbQif3n-ASUpsz5cTiHCN1zSYqm81rZ-Sl3S=
2U-gVL8wHWk0zc72lFymxChnuYRXR-QAj8A9Vq8tBwYrzAWjqEV3rRmklHk8z95dtXRLOP=
HLLh6BeESxoFtmDf5kM1zoGetkBwNRMsW6btabUWMwJSSZwxfDEuukzxO8mywMP-BOyFyz=
eRtDSd2zkm4-w0e5RI9uyA2PRXbw2"><BUTTON=20
      class=3D"btn btn-primary btn-xs"=20
      style=3D"FONT-SIZE: 12px; OVERFLOW: visible; CURSOR: pointer; TE=
XT-DECORATION: none; BORDER-TOP: rgb(40,94,142) 1px solid; FONT-FAMILY=
: inherit; BORDER-RIGHT: rgb(40,94,142) 1px solid; VERTICAL-ALIGN: mid=
dle; BACKGROUND-IMAGE: none; WHITE-SPACE: nowrap; BORDER-BOTTOM: rgb(4=
0,94,142) 1px solid; POSITION: relative; TEXT-TRANSFORM: capitalize; C=
OLOR: rgb(255,255,255); OUTLINE-WIDTH: medium; PADDING-BOTTOM: 1px; TE=
XT-ALIGN: center; PADDING-TOP: 1px; OUTLINE-STYLE: none; PADDING-LEFT:=
 5px; BORDER-LEFT: rgb(40,94,142) 1px solid; MARGIN: 0px; DISPLAY: inl=
ine-block; LETTER-SPACING: 1px; OUTLINE-COLOR: invert; LINE-HEIGHT: 1.=
5; PADDING-RIGHT: 5px; BACKGROUND-COLOR: rgb(48,113,169); font-stretch=
: inherit; appearance: button; touch-action: manipulation; user-select=
: none; border-radius: 3px; text-shadow: rgba(255, 255, 255, 0.3) 0px =
0px 1px">Register=20
      As A Group</BUTTON></A></TD></TR>
  <TR></TR></TBODY></TABLE></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&nbsp;&nbsp;&nbsp;=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Reach=20
out to us training@fdc-k.org or call +254712260031<?xml:namespace pref=
ix =3D "o"=20
ns =3D "urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN><=
/P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?=
d=3Dl6zfFP-hckb-RlvQdgDdhzm17lV7LEgp_YSHcG-I-Absg7Hxz8qm3wwl0OB8wojErY=
5r8_AybQKdfxV1qAxnkvhR1zEoM4NEsCMjbDF_-LZsRJKud016b_w6pLi6s7FUxG75otal=
9OX6yO4rMJdtjDQ1"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>WhatsApp=20
our consultant</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>=20
or </SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DonnMgZr=
G2lzEYMT-KggctLJosandtugvt1R4h5NUqO-Ykwx16uW5Rp-AJNnm_KjbenjRnFJX0oaKx=
RDAFKYwm-sM5EfRLcHNHVz8l8zwAnWZO-9e22LrP-HRrzY6-Wua3jlQkYKz5XCjN9jAbRa=
kWEI1"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Fill=20
form here</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: 0cm 0.4pt 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt; mso-list: l0 level2 lfo2; tab-stops: list 72.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: #0563c1; LINE-HE=
IGHT: 150%; mso-fareast-font-family: Symbol; mso-bidi-font-family: Sym=
bol; mso-bidi-font-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?=
d=3DnL2O3Cv7wz_EvWeaEkei-IKDTDbA2LQaHZuyJ-xpWcSeZHExpULsDeiCbqTtub7JMH=
geyVIYNVTEQYmNbZLsBzkDV-YnZtv9-WwOHfJ5p9uJOSkwLnAPWwg8W0TNjy8M5USe8lC5=
Z2FPmFJtHkBqTko1"><SPAN=20
style=3D"COLOR: #0563c1">Online Training Course</SPAN></A><SPAN=20
style=3D"COLOR: #0563c1"><o:p></o:p></SPAN></P>
<P class=3DMsoListParagraph=20
style=3D"MARGIN: 0cm 0.4pt 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt; mso-list: l0 level2 lfo2; tab-stops: list 72.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?=
d=3DonnMgZrG2lzEYMT-KggctNGY7Sp0mjHuz8tTmB3CrhuiNhOkd626RV1A9l_kobsevt=
d3E6XZ-mFehnzZ_xFnfmnTfc3aDwHpwUP5uldupcdjLHwdZRGA-4RwaLsfFlhpvTv5u85S=
37U-pRkqGv6KYNc1"><U><SPAN=20
style=3D"COLOR: blue">Professional Short Training=20
Courses</SPAN></U></A><o:p></o:p></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://email.fdc-k.ngo/tracking/click?d=3DTGc6SPNa6wsf0a20tv6i=
Vc7ytTTqLPPJRFjjUrh-NGqMznux-NAb9L1ZqOpRr88BZfkB8lf3xwFR876slwSaO2w5ng=
JSLnIiSmOlKhRhSIsA7N7TsUxktq1L6Xr_m4kW2PtWvOMCDEcJHV7tOfIqwNyfx4A-cMHE=
HBJy3fL_ULmMiQ_UsHX6M_O-Ymq8XmGnSw2"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Download=20
our Admission form</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://email.fdc-k.ngo/tracking/click?d=3Dw_VfFLiyHQlY_GhWiKD2=
-ThljEiimsYT9cHU2GKZFhf8peMC2sb0bGjPt6mOx1VJPcOamMv5I-GPF45NCe1pG4yuyz=
-BrI3fQ8kN7gxwrRiAIyu5Yl9GDVDl63fSHs4LxPa1poyu_Vb86juaqZDAkBrXimXRdyoB=
Fo61rw7GM2TRABErcE2P6ZttozuAQu9tCw2"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Download=20
pre-training form to fill and share with us</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><A=20
href=3D"http://email.fdc-k.ngo/tracking/click?d=3DIgc_mk9-YF1Xi-sKmLzo=
ETPspB6EZyE9HrHaWRKJ4HMXRI9MfzblTHE1NDcGOl__9m2Jjxrk923bdv_FiM_njtCsGL=
6AF4Fux6K04Gj3YaRE6zchChO0jjwPnYe57oo2l-f7yDjtQ6ntPyIi72tn2U5DcHmT9Xp6=
wE3BND30DOnC0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Download=20
our Calender 2022</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 72pt; LINE-HEIGHT: 150%; TEXT-INDENT: -18=
pt; mso-list: l1 level1 lfo1; tab-stops: list 36.0pt"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 150%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol; mso-bidi-fo=
nt-size: 12.0pt"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>FOSCORE=20
DEVELOPMENT CENTER </SPAN><A=20
 href=3D"http://email.fdc-k.ngo/tracking/click?d=3Dyic_nxDoLAWK-PAnm7n=
PI2g-UVYf8xAYH0q2uxXwLg839IzuvNjaysUqlKC_peNYxUm3Hsscho0zAraKrBjpGIjOO=
XI502SSzgnSp_Q3Fc6tF3WC1mBIKeg6q2Tv98djnCAJMr9v3Su9QSWsDrP6HlGdJ9Eqbiy=
yw30HqUy2ofijhrRAFWdDrYtVNdezqnW17A2" ><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>www.fdc-k.org=
</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Abo=
ut the=20
course</SPAN></STRONG></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Thi=
s is a=20
comprehensive 10 days M&amp;E course that covers the principles and pr=
actices=20
for results based monitoring and evaluation for the entire project lif=
e cycle.=20
This course equips participants with skills in setting up and implemen=
ting=20
results based monitoring and evaluation systems including M&amp;E data=
=20
management, analysis and reporting. The participants will benefit from=
 the=20
latest M&amp;E thinking and practices including the results and partic=
ipatory=20
approaches. This course is designed to enable the participants become =
experts in=20
monitoring and evaluating their development projects. The course cover=
s all the=20
key elements of a robust M&amp;E system coupled with a practical proje=
ct to=20
illustrate the M&amp;E concepts.&nbsp;</SPAN></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Tar=
get=20
Participants</SPAN></STRONG></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Thi=
s course is=20
designed for researchers, project staff, development practitioners, ma=
nagers and=20
decision makers who are responsible for project, program or organizati=
on-level=20
M&amp;E. The course aims to enhance the skills of professionals who ne=
ed to=20
research, supervise, manage, plan, implement, monitor and evaluate dev=
elopment=20
projects.</SPAN></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 20px; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT=
: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -web=
kit-text-stroke-width: 0px; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Cou=
rse=20
duration</SPAN></STRONG></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 20px; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT=
: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -web=
kit-text-stroke-width: 0px; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>10=20
days</SPAN></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Cou=
rse=20
objectives</SPAN></STRONG></P></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
evelop=20
  project results levels</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
esign a=20
  project using logical framework</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
evelop=20
  indicators and targets for each result level</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>T=
rack=20
  performance indicators over the life of the project</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
valuation a=20
  project against the set results</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
evelop and=20
  implement M&amp;E systems</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
evelop a=20
  comprehensive monitoring and evaluation plan</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
se data=20
  analysis software (Stata/SPSS/R)</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
ollect data=20
  using mobile data collection tools</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
arryout=20
  impact evaluation</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
se GIS to=20
  analyze and share project data</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 20px; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: =
0px; font-variant-ligatures: normal; font-variant-caps: normal; -webki=
t-text-stroke-width: 0px; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Course=20
Outline</SPAN></STRONG></P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Int=
roduction to=20
Results Based Project Management</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>F=
undamentals=20
  of Results Based Management</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>W=
hy is RBM=20
  important?</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>R=
esults based=20
  management vs traditional projects management</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>R=
BM Lifecycle=20
  (seven phases)</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>A=
reas of=20
  focus of RBM</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Fundamentals=20
of Monitoring and Evaluation</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
efinition of=20
  Monitoring and Evaluation</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>W=
hy=20
  Monitoring and Evaluation is important</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>K=
ey=20
  principles and concepts in M&amp;E</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E in=20
  project lifecycle</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
articipatory=20
  M&amp;E</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Project=20
Analysis</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
ituation=20
  Analysis</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>N=
eeds=20
  Assessment</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
trategy=20
  Analysis</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Design=20
of Results in Monitoring and Evaluation</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>R=
esults chain=20
  approaches: Impact, outcomes, outputs and activities</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>R=
esults=20
  framework</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E=20
  causal pathway</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
rinciples of=20
  planning, monitoring and evaluating for results</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; TEXT-ALIGN: justify; ORPHANS: 2=
; WIDOWS: 2; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT:=
 22px; TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-=
caps: normal; -webkit-text-stroke-width: 0px; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: ini=
tial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>M&amp;E=20
Indicators</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN-BOTTOM: 0pt; TEXT-ALIGN: justify; LINE-HEIGHT: norma=
l"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ndicators=20
  definition</SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN-BOTTOM: 0pt; TEXT-ALIGN: justify; LINE-HEIGHT: norma=
l"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ndicator=20
  metrics</SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN-BOTTOM: 0pt; TEXT-ALIGN: justify; LINE-HEIGHT: norma=
l"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>L=
inking=20
  indicators to results</SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN-BOTTOM: 0pt; TEXT-ALIGN: justify; LINE-HEIGHT: norma=
l"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ndicator=20
  matrix</SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN-BOTTOM: 0pt; TEXT-ALIGN: justify; LINE-HEIGHT: norma=
l"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>T=
racking of=20
  indicators</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Logical=20
Framework Approach</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>L=
FA &#8211;=20
  Analysis and Planning phase</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
esign of=20
  logframe</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>R=
isk rating=20
  in logframe</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>H=
orizontal=20
  and vertical logic in logframe</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
sing=20
  logframe to create schedules: Activity and Budget schedules</SPAN></=
LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
sing=20
  logframe as a project management tool</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Theory=20
of Change</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>O=
verview of=20
  theory of change</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
eveloping=20
  theory of change</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>T=
heory of=20
  Change vs Log Frame</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
ase study:=20
  Theory of change</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>M&amp;E=20
Systems</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>W=
hat is an=20
  M&amp;E System?</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
lements of=20
  M&amp;E System</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
teps for=20
  developing Results based M&amp;E System</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>M&amp;E=20
Planning</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
mportance of=20
  an M&amp;E Plan</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ocumenting=20
  M&amp;E System in the M&amp;E Plan</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
omponents of=20
  an M&amp;E Plan-Monitoring, Evaluation, Data management, Reporting</=
SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
sing M&amp;E=20
  Plan to implement M&amp;E in a Project</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E plan=20
  vs Performance Management Plan (PMP)</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Base=20
Survey in Results based M&amp;E</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
mportance of=20
  baseline studies</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
rocess of=20
  conducting baseline studies</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>B=
aseline=20
  study vs evaluation</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Project=20
Performance Evaluation</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
rocess and=20
  progress evaluations</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
valuation=20
  research design</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
valuation=20
  questions</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
valuation=20
  report Dissemination</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>M&amp;E=20
Data Management</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ifferent=20
  sources of M&amp;E data</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Q=
ualitative=20
  data collection methods</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Q=
uantitative=20
  data collection methods</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
articipatory=20
  methods of data collection</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata Quality=20
  Assessment</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>M&amp;E=20
Results Use and Dissemination</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
takeholder&rsquo;s=20
  information needs</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
se of=20
  M&amp;E results to improve and strengthen projects</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
se of=20
  M&amp;E Lessons learnt and Best Practices</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>O=
rganization=20
  knowledge champions</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E=20
  reporting format</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E=20
  results communication strategies</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Gender=20
Perspective in M&amp;E</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
mportance of=20
  gender in M&amp;E</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ntegrating=20
  gender into program logic</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
etting=20
  gender sensitive indicators</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
ollecting=20
  gender disaggregated data</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>A=
nalyzing=20
  M&amp;E data from a gender perspective</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>A=
ppraisal of=20
  projects from a gender perspective</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Data=20
Collection Tools and Techniques</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
ources of=20
  M&amp;E data &#8211;primary and secondary</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>S=
ampling=20
  during data collection</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Q=
ualitative=20
  data collection methods</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Q=
uantitative=20
  data collection methods</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
articipatory=20
  data collection methods</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ntroduction=20
  to data triangulation</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 20px; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: =
0px; font-variant-ligatures: normal; font-variant-caps: normal; -webki=
t-text-stroke-width: 0px; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Data=20
Quality</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>W=
hat is data=20
  quality?</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>W=
hy data=20
  quality?</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata quality=20
  standards</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata flow and=20
  data quality</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata Quality=20
  Assessments</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
&amp;E=20
  system design for data quality</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 20px; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: =
0px; font-variant-ligatures: normal; font-variant-caps: normal; -webki=
t-text-stroke-width: 0px; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>ICT=20
in Monitoring and Evaluation</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
obile based=20
  data collection using ODK</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata=20
  visualization - info graphics and dashboards</SPAN></LI>
  <LI class=3DMsoNormal style=3D"LINE-HEIGHT: normal"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
se of ICT=20
  tools for Real-time monitoring and evaluation</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Qualitative=20
Data Analysis</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>P=
rinciples of=20
  qualitative data analysis</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata=20
  preparation for qualitative analysis</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>L=
inking and=20
  integrating multiple data sets in different forms</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>T=
hematic=20
  analysis for qualitative data</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
ontent=20
  analysis for qualitative data</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>M=
anipulation=20
  and analysis of data using NVivo</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Quantitative=20
Data Analysis &#8211; (Using SPSS/Stata)</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ntroduction=20
  to statistical concepts</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>C=
reating=20
  variables and data entry</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata=20
  reconstruction</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>V=
ariables=20
  manipulation</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
escriptive=20
  statistics</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>U=
nderstanding=20
  data weighting</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
nferential=20
  statistics: hypothesis testing, T-test, ANOVA, regression=20
analysis</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>Impact=20
Assessment</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ntroduction=20
  to impact evaluation</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>A=
ttribution=20
  in impact evaluation</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>E=
stimation of=20
  counterfactual</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
mpact=20
  evaluation methods: Double difference, Propensity score=20
matching</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: 22px; TEXT-INDENT: 0=
px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit=
-text-stroke-width: 0px; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"; LIN=
E-HEIGHT: 24px'>GIS=20
in M&amp;E</SPAN></STRONG></P>
<UL=20
style=3D"FONT-SIZE: 15px; MARGIN-BOTTOM: 10px; FONT-FAMILY: Verdana, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0in; TE=
XT-TRANSFORM: none; FONT-WEIGHT: 300; COLOR: rgb(0,0,0); FONT-STYLE: n=
ormal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-INDENT: 0px=
; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial"=20
type=3Ddisc>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>I=
ntroduction=20
  to GIS in M&amp;E</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>G=
IS analysis=20
  and mapping techniques</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>D=
ata=20
  preparation for geospatial analysis</SPAN></LI>
  <LI class=3DMsoNormal style=3D"MARGIN-BOTTOM: 0pt; LINE-HEIGHT: norm=
al"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>G=
eospatial=20
  analysis using GIS software (QGIS)</SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial"><STRONG=20
style=3D"FONT-WEIGHT: bolder"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman", "serif"'>Gen=
eral=20
Notes</SPAN></STRONG></P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>All=20
our courses can be Tailor-made to participants' needs</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>The=20
participant must be conversant in English</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Presentations=20
are well-guided, practical exercises, web-based tutorials, and group w=
ork. Our=20
facilitators are experts with more than 10 years of experience.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Upon=20
completion of training the participant will be issued with a Foscore d=
evelopment=20
center certificate (FDC-K)</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Training=20
will be done at the Foscore development center (FDC-K) centers. We als=
o offer=20
inhouse and online training on the client schedule</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Course=20
duration is flexible and the contents can be modified to fit any numbe=
r of=20
days.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>The=20
course fee for onsite training includes facilitation training material=
s, 2=20
coffee breaks, a buffet lunch, and a Certificate of successful complet=
ion of=20
Training. Participants will be responsible for their own travel expens=
es and=20
arrangements, airport transfers, visa application dinners, health/acci=
dent=20
insurance, and other personal expenses.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Accommodation,=20
pickup, freight booking, and Visa processing arrangement, are done on =
request,=20
at discounted prices.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Tablet=20
and Laptops are provided to participants on request as an add-on cost =
to the=20
training fee.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>One-year&nbsp;free=20
Consultation and Coaching provided after the course.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Register=20
as a group of more than two and enjoy a discount of (10% to 50%)</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Payment=20
should be done before commence of the training or as agreed by the par=
ties, to=20
the FOSCORE DEVELOPMENT CENTER account, so as to enable us to prepare =
better for=20
you.</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>For=20
any inquiries reach us at&nbsp;<A=20
style=3D"TEXT-DECORATION: none; COLOR: ; BACKGROUND-COLOR: transparent=
; transition: all 0.2s ease-in-out 0s"=20
rel=3D"noopener noreferrer" target=3D_blank>training@fdc-k.org</A>&nbs=
p;or=20
+254712260031</P>
<P class=3DMsoNormal=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: normal; TEXT-INDENT:=
 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial">&nbsp;</P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial"><SPAN=20
style=3D"FONT-FAMILY: Symbol">&middot;<SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman"; LINE-HEIGHT: =
normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-stretch: normal'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN></SPAN>Website:<A=20
style=3D"TEXT-DECORATION: none; COLOR: ; BACKGROUND-COLOR: transparent=
; transition: all 0.2s ease-in-out 0s"=20
href=3D"http://email.fdc-k.ngo/tracking/click?d=3D9i8NH0YxugT77q2FrIW1=
5RjRQebMBUyqyT6W_ieH9w4XXXqA7CA-FTNsjsY81NFHoLX0FPxfE0HimNAsqBM84acBks=
hT20TDJ8ju2QbmUQ60D-KypMdJyVYehoRASEWeyA2" rel=3D"noopener noreferrer"=
=20
target=3D_blank>www.fdc-k.org</A></P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial">&nbsp;</P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto; mso-outline-level: 2"><A=20
name=3D_Toc435439311></A><A name=3D_Toc107386100><SPAN=20
style=3D"mso-bookmark: _Toc435439311"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Indicative=20
Budget</SPAN></B></SPAN></A><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 1.95pt 0.4pt 10pt 0.5pt; LINE-HEIGHT: 150%"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Cambria'>The=20
registration cost is indicated in every course for online and onsite t=
rainings=20
find the group rate discount below: <o:p></o:p></SPAN></P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial">
<TABLE class=3DMsoNormalTable=20
style=3D"BORDER-TOP: medium none; BORDER-RIGHT: medium none; WIDTH: 10=
0%; BORDER-COLLAPSE: collapse; BORDER-BOTTOM: medium none; BORDER-LEFT=
: medium none; MARGIN: auto auto auto 36pt; mso-border-alt: solid wind=
owtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.=
4pt"=20
cellSpacing=3D0 cellPadding=3D0 width=3D"100%" border=3D1>
  <TBODY>
  <TR style=3D"HEIGHT: 6.35pt; mso-yfti-irow: 0; mso-yfti-firstrow: ye=
s">
    <TD=20
    style=3D"BORDER-TOP: windowtext 1pt solid; HEIGHT: 6.35pt; BORDER-=
RIGHT: windowtext 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext =
1pt solid; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt;=
 BORDER-LEFT: windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-C=
OLOR: transparent; mso-border-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><B=20
      style=3D"mso-bidi-font-weight: normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Group=20
      Size<o:p></o:p></SPAN></B></P></TD>
    <TD=20
    style=3D"BORDER-TOP: windowtext 1pt solid; HEIGHT: 6.35pt; BORDER-=
RIGHT: windowtext 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext =
1pt solid; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt;=
 BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpa=
rent; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: soli=
d windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><B=20
      style=3D"mso-bidi-font-weight: normal"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Discoun=
t=20
      Rate for Group<o:p></o:p></SPAN></B></P></TD></TR>
  <TR style=3D"HEIGHT: 7.25pt; mso-yfti-irow: 1">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 7.25pt; BORDER-RIGHT: window=
text 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PA=
DDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT:=
 windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpa=
rent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid=
 windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>2-7<o:p=
></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 7.25pt; BORDER-RIGHT: window=
text 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PA=
DDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT:=
 #f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bor=
der-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext =
.5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>20%<o:p=
></o:p></SPAN></P></TD></TR>
  <TR style=3D"HEIGHT: 7.25pt; mso-yfti-irow: 2">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 7.25pt; BORDER-RIGHT: window=
text 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PA=
DDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT:=
 windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpa=
rent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid=
 windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>8-21<o:=
p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 7.25pt; BORDER-RIGHT: window=
text 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PA=
DDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT:=
 #f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bor=
der-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext =
.5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>25%<o:p=
></o:p></SPAN></P></TD></TR>
  <TR style=3D"HEIGHT: 3.6pt; mso-yfti-irow: 3">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpar=
ent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid =
windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>22-31<o=
:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
#f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bord=
er-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .=
5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>30%<o:p=
></o:p></SPAN></P></TD></TR>
  <TR style=3D"HEIGHT: 3.6pt; mso-yfti-irow: 4">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpar=
ent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid =
windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>32-41<o=
:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
#f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bord=
er-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .=
5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>35%<o:p=
></o:p></SPAN></P></TD></TR>
  <TR style=3D"HEIGHT: 3.6pt; mso-yfti-irow: 5">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpar=
ent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid =
windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>42-51<o=
:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
#f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bord=
er-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .=
5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>40%<o:p=
></o:p></SPAN></P></TD></TR>
  <TR style=3D"HEIGHT: 3.6pt; mso-yfti-irow: 6; mso-yfti-lastrow: yes"=
>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 32.94%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
windowtext 1pt solid; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transpar=
ent; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid =
windowtext .5pt"=20
    vAlign=3Dtop width=3D"32%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>52&gt;=20
      Above<o:p></o:p></SPAN></P></TD>
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; HEIGHT: 3.6pt; BORDER-RIGHT: windowt=
ext 1pt solid; WIDTH: 67.06%; BORDER-BOTTOM: windowtext 1pt solid; PAD=
DING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDING-LEFT: 5.4pt; BORDER-LEFT: =
#f0f0f0; PADDING-RIGHT: 5.4pt; BACKGROUND-COLOR: transparent; mso-bord=
er-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .=
5pt; mso-border-top-alt: solid windowtext .5pt"=20
    vAlign=3Dtop width=3D"67%">
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0.4pt 0.65pt 0.5pt; LINE-HEIGHT: 150%"><SPA=
N=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>50%<o:p=
></o:p></SPAN></P></TD></TR></TBODY></TABLE></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 150%; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto; mso-outline-level: 2"><A=20
name=3D_Toc107386101><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Other=20
Important Links</SPAN></B></A><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></B></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DKLljWUOzVp=
fxObUaI_1vCVpT3bxpxhBT8aqxNNoEmGqleAl-liL9NRGd80ejkepby7-9SvUCxeTKpVnz=
vQ7aaEDRAPVKMqeYWLDxZ93WxdlbaFSrT3mNwOa6YkNWvzP4EXNPoc5KlAydptijw1N3cF=
GB5oe1rmvskZ9Hj5mqElaQ0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Humanitarian=20
and Social Development professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DiiOi7TnNqv=
ix6G3iLEcxMmcdSHV3pSiLzX3n2WmpqcsCRLFFCt4X4Mdnj-28nasMPC-VCQBp1hn2bq0b=
do7TCCdUFCFrXueym8sI3E7nNj3uXTRgzWMy0C4P3gF6chSWKP9Dj8KeHFB8g4o4_JJPTd=
_dG5vrmrVJVxPdGcDt9pCC0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Monitoring=20
and Evaluation professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3D5KMl_woZI3=
Kx63y1WPA5sc3xOBCX04pu-FvhlXc0sEm3w2Tg_93W4uwM2TXEBmboKSlFJ0AIaZ-Dg9uz=
xL3sEzWppSNyqEW4yCQ5de7RTXXbA6bKoj-LSrW7WU516KUQ4U86LGL-GXX0QUKir5Dfe4=
1G94Uke2Wqz40CAiehPJsA0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Research=20
and Data Analysis professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3Dnz09lGE-ZU=
GyT5DqYahGI1hIO4YwTRlmiyb7-jBZESaQ_2CpPufQC3jtpopvbUzvY_IeEzNcBgylqPa9=
Vz6ShFNuEI-mv5pwleqBExp3FNP3mwI8MRA0nzLTsX9ejZby_BriRZLiIjCBS_jNJhjwqE=
K3UOX3dP5krYd9_7DAnKRj0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Information=20
Technology professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DlJAwHq4Ftt=
zgxqoBHE2OjeaWUGkzl-sSpWfHfOjrqGOuIRc9kBlheoI8_doEdkJzZxNvMAiKCudUbfc3=
_E8rIf1ksq-eJ7AZKZPlvvowEYJ39QW5uOCddPNgttPm3Iwf-OrFKf8IF0k8ZpjOoa47Za=
iP4dBBz9HpkrkVABT-IIjE0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Agriculture=20
professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3D2j4YqRryr1=
9io-Urn5g1VOQ5-UokqjMMohE0BKbg2VqjwwFobWNE0kvpAorlsMZrmZELxYdFhV2DFn-m=
cX4uAo9XSy3dur-r4nsVyIa70E5NdnhlhbyM8pAwFDzDUSIitiBKUHSYWpusuvN2xOku2E=
s1"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>GIS=20
&amp; Remote Sensing professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DVzI73Il7O4=
Dg8UQVZcGIrfdrTzWTfJwEzEipX1YLeJc8SKbf6lc4d5HufYfhO2Kd413YNHEWozoY8n7t=
hP6lo_j7ddKU9IjFoOgEipq_50Di5Ry0Kpwuchtl_ckLH_czLCHFwJ5aVxJl6Kyjg6VIqr=
SDhO66emHugbwPMs-njnXT0"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Business=20
and Governance professional short courses</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DnL2O3Cv7wz=
_EvWeaEkei-IKDTDbA2LQaHZuyJ-xpWcSeZHExpULsDeiCbqTtub7Js1zLUL5NX0rXmWXG=
6BCpdlX-iD9ZXQc47dVxc69C_g-FHGBrQp8rrGQYCzXL3McuyDZURs5ogzuNRYw4WOmDLl=
A1"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Online=20
Training Course</SPAN></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></=
SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN></U><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DonnMgZ=
rG2lzEYMT-KggctNGY7Sp0mjHuz8tTmB3CrhvTea2104U2mLvMrzxmXas2zEDU3sQvy5c_=
qVWVpoTm2_yZ0p8OYhmecnQYr0PmmQLug9WPFDfZye6Jmzvm16RbWUd5e689V0lUixy4Xm=
RqfV81"><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 blue; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>=
Professional=20
Short Training Courses</SPAN></U></A><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 blue; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>=
<o:p></o:p></SPAN></U></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Reach=20
out to us training@fdc-k.org or call +254712260031<o:p></o:p></SPAN></=
P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0.4pt 0.65pt 36pt; LINE-HEIGHT: 150%; TEXT-INDENT=
: -18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: Symbol'>&middot;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3Dl6zfFP-hck=
b-RlvQdgDdhzm17lV7LEgp_YSHcG-I-AbNEPuuSvDbNRpPaWzyhxdKrOrktHhetdlfzEtd=
2OSXb-CJt2NxmT8ZNg6Ot8brHw1v2G5IsY_sxtxJiXgNCzMH-hnnS3kzdU_IJkItA3f_fl=
c1"><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>WhatsApp=20
our consultant</SPAN></U></A><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>=20
or </SPAN><A href=3D"http://email.fdc-k.ngo/tracking/click?d=3DonnMgZr=
G2lzEYMT-KggctLJosandtugvt1R4h5NUqO9GiG8BEyejwC1udU4jKHebOAJau2jAytZaR=
KbfxAft2m98xfdT0RhMLwtkgL198S9MRs5qvOVd8q08IFvoX6AoTMCPphSPSuEs3pZlk5f=
aUiw1"><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'>Fill=20
form here</SPAN></U></A><U><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'><o:p></o:p></SPAN></U></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</=
o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Kind=20
Regards<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Jackson=20
Munene<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Training=20
Manager <o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%; mso-fareast-font-family: "Times New Roman"'>Foscore=20
Development Center www.fdc-k.org<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"BACKGROUND: white; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 150%"><S=
PAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%'>Email:=20
<A>jackson@fdc-k.org<SPAN=20
style=3D'mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN=
></A></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0.4pt 0.65pt 0cm; LINE-HEIGH=
T: 150%"><SPAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%'>Mobile=20
Personal: +254729262303<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0.4pt 0.65pt 0cm; LINE-HEIGH=
T: 150%"><SPAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 150%'>Tel=20
Foscore: +254712260031</SPAN><U><SPAN=20
style=3D'FONT-SIZE: 14pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #0563c1; LINE-HEIGHT: 150%; mso-fareast-font-family: "Times New Roman=
"'><o:p></o:p></SPAN></U></P>
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial">
<P class=3DMsoListParagraph=20
style=3D"FONT-SIZE: 15px; FONT-FAMILY: Verdana, sans-serif; WHITE-SPAC=
E: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 300; =
COLOR: rgb(0,0,0); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; MARGIN: =
0cm 0cm 0pt 36pt; LETTER-SPACING: normal; TEXT-INDENT: -18pt; font-var=
iant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke=
-width: 0px; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial">&nbsp;</P></P></BODY></HTML=
>

<img src=3D"http://email.fdc-k.ngo/tracking/open?msgid=3DfJI5GHqGxvnM6=
-mQM25Ksw2&c=3D1559414682878703408" style=3D"width:1px;height:1px" alt=
=3D"" /><div style=3D"text-align:center; background-color:#fff;padding=
-top:10px;padding-bottom:10px;font-size:8pt;font-family:sans-serif;"><=
a href=3D"http://email.fdc-k.ngo/tracking/unsubscribe?d=3DvEV61HHmwGHU=
7dwBGhfNDPcJlUJNeT2RxqYki7Ea9FZeiXmhQJp6B0TiWnCXw2oG0qdsHqZ43qIxqcAZDk=
B7QGxuaRDLKOFun4zo1jgJGvxS0" style=3D"text-align:center;text-decoratio=
n:none;color:#666;">UNSUBSCRIBE</a></div>
--=-eZCfAkj8qwLkNuCGfMcCP2TM4ykwgNU223WKzQ==--
