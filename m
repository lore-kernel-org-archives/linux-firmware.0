Return-Path: <SRS0=2m5L=7H=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD4DC6FD1D
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Mar 2023 03:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65695C4339B; Wed, 15 Mar 2023 03:20:20 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABA8CC433EF
	for <linux-firmware@kernel.org>; Wed, 15 Mar 2023 03:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABA8CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 491b8560c2e011ed945fc101203acc17-20230315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=xLATHWO0ZwafIK005NaHL+2DzXaKUarXIz4X7OVpYHc=;
	b=MKZsQzrX0rXiGJAl7QcRgvWimnDJuoflTSaRgeTDDppm8AgCg5SXSs9RKRfTFCEcp/F5WJVVIlBAkCuyRMuCrz4y+5EWWgkHHUHUEJnR9FTIK8thm6kLUT18xIivgQ3NWVc4rrUb6C5HSIMK6VPs+kTiH6SdWYWfSjGnQiwvTSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:df338f4a-04dc-477a-819b-817f44f13900,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:ecf9d4f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 491b8560c2e011ed945fc101203acc17-20230315
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2023157015; Wed, 15 Mar 2023 11:20:07 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 15 Mar 2023 11:20:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 15 Mar 2023 11:20:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ic5mCM4jLd901K3x3gCdy3LwQ33em3Iip0NeGOZu4ISERKQNGZUNGK61MWz/wkUowhG/TCxWKyqjPbVS7dCA+xGSXe2HCwjUUHnI94K0wvtPtxE68B4HOaemX4TMFeKHRO9F6AFTg9JCAOxmsAR8pmRnv0Phw0os9nm3iL1/3O1CohuzYiqcnTpFNmqVQZbeWZ/ACg1hsZA1hilfdsRfxeoKpDSQMb8QlJrpKmN7AqlTzfQOq1+jAucZbVjO+SYPUnmn8L+GwoRxkCFQI9Sh95+HIUEu2VdTxisQfoF5pweqwk7n+Wnla0zaLyOlYSPKx99kACK3E/L6ysmbeRDH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLATHWO0ZwafIK005NaHL+2DzXaKUarXIz4X7OVpYHc=;
 b=aEq1gHnENuu2uqPTAymKF/iV0yu0iFiPoTkjWksbedp/4c18z5zX+jgCr1dRsvaz3w2rUvnzsfgb4NWzr7hxZsOL6vjcgHP4Lc2v2aESQDcbQkFUHO3adt5s8kGvFfNRWwL1o0OxAuXBPWKPAQf47o96eiU6ChpvxtndN7WE/ug2XW/opvpUnmrBpDHknFLUrgps+C1QoieSsEVv3WXJQrKrlUSenYxFnUoEdhtogdxkPf/euqPFuQOim/NcD0qpWvKhakUhKvTeXaNk8q5iUI4XgW4gaCECr90WWeJHuNXMN9z45I/FmFMz4KPV+C86FiL2OaVtxefKzF/1W/dcFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLATHWO0ZwafIK005NaHL+2DzXaKUarXIz4X7OVpYHc=;
 b=XOwjpbhP8slBOz6SOe8z/yZfs2zFYsWokl6CE+kuOP8VGFjnTYwqxlgKZ742jukG4xeflqR7SuZrqp+CM1WCQCx/27R3r0Zx5riZnaf51aeV01N+d78/s5UV4CAKiLG9z8FAQ0xKXHkYReADUP7FsCeHGWYd9atMKQkhPZXuBUI=
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com (2603:1096:100:53::15)
 by TYZPR03MB6671.apcprd03.prod.outlook.com (2603:1096:400:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 03:20:04 +0000
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::dc74:62fb:a3ab:b10]) by SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::dc74:62fb:a3ab:b10%4]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 03:20:04 +0000
From: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: pull request: update mediatek mt8192/mt8195 SCP firmware
Thread-Topic: pull request: update mediatek mt8192/mt8195 SCP firmware
Thread-Index: AQHZVu0Is6nxWP/zkkOM175yFnZXVg==
Date: Wed, 15 Mar 2023 03:20:03 +0000
Message-ID: <a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4204:EE_|TYZPR03MB6671:EE_
x-ms-office365-filtering-correlation-id: c2c772e1-c3bd-48eb-c987-08db25042b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1cABbcTx9BNJ0uoqgS6jK2wu+V+GvQNwWxhawSKWLWk3p3yi9lV7EWnAivlxdtTbao/tzuqKL/K4s+/RaMGzi+d5Kk7CBIqMCCN9+IpwXuJpDGKb/zKrfzwpJUMVJgm4QwX5pZlugeWmvivguFMKoPeIlvcu3bNCpRllvZ7+x/lnloi4AifOp0l0CGldFaILH2pJj1lwh1ej55TfAME2zbHs/IbpaAykmI1bCXBd8sypBk7YpPO4+k1Qq7CUk7I8V6lvsafodSWBX80TkhNGhg4bRqsdr5ELd++2uv0tKUPRkLYV/8cxpPwp+aGgqJ85F46KCYwbsRVOQcnxH+6lv2Z9wwoH5SQUYgImMy1OjRpD624MR0o3MjosPEByb8uWphJkhNiaMvRcPQS2mcnHZawZf79zcdz6KfneI23rdqB34r2rx1csuZLp8kOGsZhuZeZ4iWGEDNehnPbwVlQQbbk6x0MunNDl2iOmWE9bzfSHYt1DUuGgq/hqk/67OVQlgBSe7Zqe2JFcqyR3oRmkJRz5/cT+1Hkr6oJml3gLZcLFLYLFmedKP6JoewtpnhALwH6+MGy+H7KcYx/nby3UeOPv5zcdXSi12zxMQDLvA6qwgKuiKKru7UVQwFpAK5NsAXdYJNNqFq8hrvbiSiPbb4waYZEUVXsX9QIjvAV8xKm2O2/V/6U7ZDw/ZBF/Tq1S04j80kU+Wg7bQrpzbMmO/ZxKj8i9kbuDDw2OIv2I1o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4204.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199018)(316002)(85182001)(36756003)(38100700002)(86362001)(186003)(122000001)(83380400001)(107886003)(26005)(2616005)(6512007)(6506007)(38070700005)(71200400001)(5660300002)(6486002)(478600001)(966005)(8936002)(41300700001)(66556008)(66446008)(91956017)(66476007)(2906002)(6916009)(64756008)(8676002)(4326008)(15650500001)(76116006)(66946007)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R01DbUtjTUMwOXhNWlNyYTVheGoyVERuTUkvMVJlcXQ2T1lWL2lxT0c4SGFZ?=
 =?utf-8?B?YmhUcDBnNDlGLzg3bjdRSUNweDRIZWNQK1BCSFppTFRRR216c3M2MnF3L1VU?=
 =?utf-8?B?cWFkNWF0T2ZXOG90dnh4N1V5RXJVMDVyMkNreUk2OThPYkw3Uy9reW5ZSE96?=
 =?utf-8?B?Mm1EekhvZ29WUWRBSVh3TGpWNXZlZTJJYTd2bFhIQS92YjZkb1U5MkQwcDNO?=
 =?utf-8?B?RVRrWVZReFN6WFc1UUFVZFFtSTZJaTNpMmNCK0E0TlhobmswQUpvZGFXaVd1?=
 =?utf-8?B?cS9UaUhvZUFQMGVmSUhBMjVUY3lDN041RWVxSHBFeTQrdGRSVnpVNnFKUC9G?=
 =?utf-8?B?QTZRT3BZbWVNU3A4L1JTK0hwdnYrMWxGQnN1bWZmZXlzaTRvcVh5dkpQQ3Fs?=
 =?utf-8?B?N0JKczNPb2MzM3h1OStkVERIcFBNQXp2bW5oSTQ4TUFzOTdvU3l2eWpUZWtq?=
 =?utf-8?B?T0JLSkhHeVkvWXNGMDFvLzNJVEtBajkvVTEybDVCeHpwMHU4aU92cldmelky?=
 =?utf-8?B?aEViQnBKYjNLRGI0MWVBcHY0S3RJNUtvUnorZHY5TFg0Sk8xcElMVkY0dTUy?=
 =?utf-8?B?dE5KOTd1RVprU0FiR1o4OTFnQm15QmZoWFRUSXlCazlIK01KVVZaajdaUXV5?=
 =?utf-8?B?U3hUZUZBK2ZnbUp0MUhIVG84SndIS0drL3o5cG1yR0NrZC9mTnlMR2hIR29D?=
 =?utf-8?B?dTZTVElyRklQMVArQkFVb2hUR1FieG83bXVjeHpncVRRd3NXTThDblROc1Ix?=
 =?utf-8?B?OFZGZFVUeVBTYUZhNUppNTNwRzVhQVVTQkRpa0MvMzdRQVNuVlNTSU11Nzdu?=
 =?utf-8?B?Y3RVZDh6bzVnTVZiWDlRM25uSWRMOTlZdkxaMjcxTW5oVnIxSHdNT2JVM1Ay?=
 =?utf-8?B?aERKZ1hSaDNXOVBCdW81c2hweW1sMklka29tVWNLWHBCZVh6M1JVV2Z2U2lE?=
 =?utf-8?B?eEdtdmg4Vyt6SjV5MFdWdTRXeEd2RHN4QmhUNnpyZmtKZnZjTm5JTVZwSnBK?=
 =?utf-8?B?UFZHdDBvbU9OVm9Qc0hQOFBhZ3lGT1Q1akQwanJ2dERFd1g4YUM5NVdhVzd6?=
 =?utf-8?B?cDJsR2lXRUdoL1NuTHExU2djemV6T1lSZUlDL3FlRmtKSUR6MkxGa1lwK1NR?=
 =?utf-8?B?OFNkMlR6TXZCU0Z0ZWFQUVYvNjIyemdKcnpQRkNTY0xUcEhFRjZYYSt6ZTFo?=
 =?utf-8?B?eXJuMHlZSHJxRkxkdm9HTHVNMXdQdjUxSzdIam5sakdFZWZqaytJb1RyNnZk?=
 =?utf-8?B?eCtyQ2pNQzllbHJmZlkxTkhldjVNQVpHTzM0Q2NBUVBMbHlkYnRGeTNDRFJ6?=
 =?utf-8?B?SEo3Z1paK082a1JqTzhORG9BcmIrWlJaTGYzMkJxVEZvalAzTVN4bDdsYU15?=
 =?utf-8?B?VS9vRlRrc2ZUL3ZkR2xNOHExV2xXVUVKZWNMQ25CMXhjRVZJZFlKelo3c2pi?=
 =?utf-8?B?VDlZTVo5K25KOURuWTRiV1FCNG1DMjZnT2Q5UjJSdjVZWlV0UUNIaUN0ZlYv?=
 =?utf-8?B?QitTRThDNi9JN1kzL2xpYW5NbFRweGpMcFFPWS9HMTdZUDN3Qml4N3k2NGlD?=
 =?utf-8?B?UXMwcUZ3cDQ2NDRwTXJFcW5MaERTU0UrbVJXVWwybUJOWW1ZM2xEU2ZyVXl0?=
 =?utf-8?B?WHBjU2JiTlVudkJuRmpiV3o4cnozRnR1b1NQYjJwRDNvaGZ6WnE3SHFhUHJ3?=
 =?utf-8?B?MjZuRGJaOW9QNGwva0l6TUNqKzhHeEhFSnVHMGdWY21qYmhNdzZuOVlPSUFK?=
 =?utf-8?B?clF5WUE2NzlrTmpkV1hnQ09jYm1Ha21HOXM3WC94cXhnRGlvZysvVWlqQ0dN?=
 =?utf-8?B?WVV4bzZRaGx2ZDUrcnphNzk1M1YremYrVE5hOGtRZ0R4MTl4ekRadlhSVExD?=
 =?utf-8?B?MTlYK2dJM0Jrd2FsVTliVDQvcjhIYlhzRXNMcUVKM2tMcVQ4RDRlYjh0eDFz?=
 =?utf-8?B?WnN6aDBsZ0tDZGN3WitHODRqa0R5U1Bqc0I1UjNUTDAyNVdNRFhyb0RjMmd1?=
 =?utf-8?B?S0N4UklKWlVoVTF1L1NtS2E5RnZscCtRK05wdlF2alNmemk3QWt5Vm91TW9S?=
 =?utf-8?B?RVFVVXl3ZFYzUmZ0ZWJSMzB4SzVmdGZHc1VYSXpEcnVackJ1VWF5bW54UzQ5?=
 =?utf-8?B?akFHK0R2b045TDlCV0swRkVMdUxvaUozWkEzeUFTQ2lFc3dESmphb0dIcDVm?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07632E5483764741A218470DC9375739@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4204.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c772e1-c3bd-48eb-c987-08db25042b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 03:20:03.8679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMHjLgj7gufJAl7iftTH8RYhXJAomV5Bj0T1Jif8uzb2EkD2m/bKtlalkZanmYqYv0onxOMTScPjBi8V3sxCGGMHCo63S2JE0UVtXiZyV2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6671

SGkgLA0KDQpUaGlzIGlzIGEgY29tcGFuaW9uIHVwZGF0ZSBmb3IgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjMwMzE0MDcyNTU3LjI5NjY5LTEteXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29t
Ly4NCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBpc3N1ZSwgdGhhbmsgeW91
Lg0KDQotLQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGM3NjFkYmU4MDRm
OTAzY2MyZGY4MWYyNTFkMzY3Y2NhMjg1ZWNhMDY6DQoNCiAgTWVyZ2UgdGFnICdpd2x3aWZpLWZ3
LTIwMjMtMDMtMTMnIG9mIGh0dHA6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvaXdsd2lmaS9saW51eC1maXJtd2FyZSAoMjAyMy0wMy0xMyAwOToyMDo0NyAtMDQwMCkN
Cg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9n
aXRodWIuY29tL3RpbmdoYW4tc2hlbi9saW51eF9md19zY3AgbXRrLTIwMjMwMzE1DQoNCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkMDk5N2ZmNjVjYjFlZGQwYTBkNmQ5NmM5OTg2MThh
OTEyMTMyYzEyOg0KDQogIG1lZGlhdGVrOiBVcGRhdGUgbXQ4MTkyL210ODE5NSBTQ1AgZmlybXdh
cmUgdG8gc3VwcG9ydCBNTTIxIGFuZCBNVDIxICgyMDIzLTAzLTE1IDEwOjU1OjAwICswODAwKQ0K
DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQpUaW5naGFuIFNoZW4gKDEpOg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0ZSBtdDgx
OTIvbXQ4MTk1IFNDUCBmaXJtd2FyZSB0byBzdXBwb3J0IE1NMjEgYW5kIE1UMjENCg0KIFdIRU5D
RSAgICAgICAgICAgICAgICAgIHwgICA0ICsrLS0NCiBtZWRpYXRlay9tdDgxOTIvc2NwLmltZyB8
IEJpbiAzMjgwOTYgLT4gMzA5MTY0IGJ5dGVzDQogbWVkaWF0ZWsvbXQ4MTk1L3NjcC5pbWcgfCBC
aW4gNDI5OTIwIC0+IDU4NzgyOCBieXRlcw0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KDQotLSANCkJlc3QgcmVnYXJkcywNClRpbmdIYW4NCg==
