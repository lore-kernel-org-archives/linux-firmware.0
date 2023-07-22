Return-Path: <SRS0=LUVH=DI=mediatek.com=yunfei.dong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC978EB64DA
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Jul 2023 08:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4BD3C433C9; Sat, 22 Jul 2023 08:28:28 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2357CC433C7
	for <linux-firmware@kernel.org>; Sat, 22 Jul 2023 08:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2357CC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b24b5166286911eeb20a276fd37b9834-20230722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=IzW0fCkFAg77arwWA5CoL242r/Thv66yVJoCar0W7BU=;
	b=SlzE0mU+3TUqzrWzpFgrh9TE2r2alI7Fvs7RKu60GnOz5ve6JWwxom6m6NAgacGkGF9N77IG39eEB9s3kLD5yK5lFwXNuo8WQymv/Yfx7zqWkmve8y7T6Feu+5fOvpwiEXhU4AcsGbqOQRhoSUMAhzY8dUaus0B1qnj2LweXQZg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:5478753d-d844-43be-bcdd-584702c9ad21,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-4
X-CID-META: VersionHash:176cd25,CLOUDID:dd5ce987-44fb-401c-8de7-6a5572f1f5d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:0,Content:0,EDM:-3,IP:nil,URL
	:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DK
	R:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b24b5166286911eeb20a276fd37b9834-20230722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 72450725; Sat, 22 Jul 2023 16:28:12 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jul 2023 16:28:11 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jul 2023 16:28:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKiib65D8SBh6GIlfLoD2O3Dw5MUWjap/x9PNUdVv7dNmX8xY/uiaCkZx30ATDGZmvhgw4h+0uFmarm6ejTzuDPjC5lbA5Wbk9gyvo2IOBiy1mR/8h6wUvXdrm9fNqDhR6DeD0oexEhKTgY1PxBb8T39CjodeTHWgz+i6iIGZfN7mHhy08smWrlttJumoqNMqmEezLtdqWSGahzHym/BHiInPaZVYLI9XN4qElUcl0jzEc0jBwbEGHaFCg+wG7ujG2mTSyL7OXsyEFSA5TQ3hmWECveGlImJ5eHqpDJvSQlN1aym9M9WjLtM6FudemVAncnvWc4+RgYKdA9QN88Vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzW0fCkFAg77arwWA5CoL242r/Thv66yVJoCar0W7BU=;
 b=LybOz1gW9MGkE/U6Mb9n00K2VE6GG8nZKsHiMn6KLPVjxg9ozrdM7Gcri1jBE3p4oDzEerKp1Ri+HMRV1v9ReyJ66eDSzoAuKViivqsFGWPS2IKwINd4un8mAMkhl9n5f+4RrccYZSPpzBoSqjxx1cw6FU1vwZSs4T3bGsV0EBsqaNwQfMahCxBskyxHuHQBWeEY8LbmJs4pxB+Qht/e82KVsoNYMV1i6kuQp1y2ehPO0fQ5TjSmY45YXkKkpwJpsm2UwcYU8qQgRarJoKTJCFBXCbt+H+jnbuCMU6EG1okkRg+IEYNg4XIPYfsqsdrQsJdkbfVzT6dQEkqS7+8zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzW0fCkFAg77arwWA5CoL242r/Thv66yVJoCar0W7BU=;
 b=dl+yLYkdrzVeFDtc6Kqq4tRfsxHxUHVMwUH4CRJaEsBs5MPNUXRFGmZdMiIAJsvXW6Ao+idfcZfT5n9JglYVAeKitgdUypSEJmofpgvhoKcNlHrTeBS+oKSF/QIcwVUb6JylxDI67epph9pwmEVFZlX/fUOikeeECrJBKIzzj/Y=
Received: from TY2PR03MB4157.apcprd03.prod.outlook.com (2603:1096:404:af::20)
 by JH0PR03MB8115.apcprd03.prod.outlook.com (2603:1096:990:35::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Sat, 22 Jul
 2023 08:28:08 +0000
Received: from TY2PR03MB4157.apcprd03.prod.outlook.com
 ([fe80::eb06:302f:7416:660]) by TY2PR03MB4157.apcprd03.prod.outlook.com
 ([fe80::eb06:302f:7416:660%3]) with mapi id 15.20.6609.024; Sat, 22 Jul 2023
 08:28:07 +0000
From: =?gb2312?B?WXVuZmVpIERvbmcgKLat1Ma3ySk=?= <Yunfei.Dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?gb2312?B?TWluZ2ppYSBaaGFuZyAo1cXD97zRKQ==?= <Mingjia.Zhang@mediatek.com>
Subject: [PATCH] pull request: Update mt8195 SCP firmware to support 10bit
 mode
Thread-Topic: [PATCH] pull request: Update mt8195 SCP firmware to support
 10bit mode
Thread-Index: Adm8dlDUWHb6htpxS2K3TyySKosaCg==
Date: Sat, 22 Jul 2023 08:28:06 +0000
Message-ID: <TY2PR03MB41573133CF759BFD9D6C25BE8F3CA@TY2PR03MB4157.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR03MB4157:EE_|JH0PR03MB8115:EE_
x-ms-office365-filtering-correlation-id: f85bf866-168f-4a26-7d39-08db8a8d931e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z5bt7+IxjMHpAmKWzq1sKu+EHxoLPicgKuTQoNrxv2zj0Fk11Ni9lhMbeBobR5bGxsDJE9S0+y+6Ik8FCqsb77lYi42Mm3eNPO6etegyBK7lNRJejxmXw/0sH/ihAFZDqA0Qt3jFVjoEQLcE0K9gLl9xf+MoTcsXPn4p3Z1cCs0ZMCv/eXkGAdhNHrVSTrRNm+EjnBC3fsEAhdr5je3dlxR0+h8yGsST4dpiQWO4/MJLRYzFu0itPM1PL5wFFaSJfiS46SIs0SZGIM/xGLE5WSdJxtaxd0luWsJ3H5h0ymaLbOGi7BbtqIOdaed64oTWGEBtJEhpdljn7lHqceO78sEFX7syjWGd8IVZPvq9iu0742mJY5INvDatlB7LDMoPGNKAD0R8qHcMaw8eM3AEFgZbLACy/fr0cqwhWYUGZnuSng4lfGWPk1bE4UzQHzXws3ozfcmuBOzBXJL8VjBLixgPopZd6e9/+2w8s88Eoy+o3iVT5Tct8qMgDeKLoArVVkoVRiUtoKPdA7GAZtJKQqYUpCuY7KsCUOQ/fY1kDBnIMBM0BbRb9gJ/VhcO97fgRrtkoMgCopwAitfhMK34FhE/1xKy3zNPLRf0BuL7MUvG6dYFsdBym9GzRyHXOhrc8CE2FWwQEdH/7Y4GuizCEQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB4157.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(186003)(107886003)(26005)(966005)(9686003)(83380400001)(6506007)(76116006)(66556008)(66476007)(66946007)(4744005)(316002)(66446008)(41300700001)(6916009)(64756008)(52536014)(5660300002)(4326008)(2906002)(15650500001)(8676002)(8936002)(478600001)(71200400001)(7696005)(54906003)(38100700002)(55016003)(85182001)(166002)(122000001)(38070700005)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZVVqc0NuVFlldU5tQzdwS2NnNm1OblJnRFEyeHJWd1cyWmd3d3dMYUVGK2ow?=
 =?gb2312?B?Wm85QVRqYmUvNDNIOU1pZXdhMGd1L2p4RkwzWGkvNUhyZGcxd3FEdWszRTBt?=
 =?gb2312?B?U3VhZGdnekVMUXR0Z3N4akxhdmZWK1d4U2J0NmZYYjVMQjBLRzUrcmdwOTNX?=
 =?gb2312?B?OVpwdkZZbUlEOXc4cWp0T3E5WTBxSUJIY05Jdk56WVVQUWpqa09IbmY3VTJk?=
 =?gb2312?B?RTM2TFZaNFVuZ0xrNmRDbXhmV3FVdURlMGIzZVJZbVJGa2I4QWZCSHJ4Q0l4?=
 =?gb2312?B?QzFZUDhITFRqS0RxSnpyVmNmZ245eDk0RHlxOVIrbndBa1dVZVM4Sm83SkZ0?=
 =?gb2312?B?VUNlNHRVZHFueDdhQWQ0aWJMeUJPS3d6a1d3ZWh4S1phdDVLOEZVbXhHREVx?=
 =?gb2312?B?Sm82T3pMYWdZSnV6ZjlMYUhxYkVaZFZtMVNYY1hVZEFMb1dLdGQzYnlVdlVU?=
 =?gb2312?B?QjYva0dXRGNSa0szWU52ZFViblFtTVBDMkROYkdJWE1CdUZiU0Ywa0VodStS?=
 =?gb2312?B?Z0liSko4UDdSblN6WVNoMWhoYUsyZ3A3azBtWmYvN3lVVWd0WCtURkZnNjNu?=
 =?gb2312?B?NU41MkRIUjBxY21qTENUTWJkSlQ5cnJUbWc2VnlEQlVzR1l3bnRwOEMvb3Vy?=
 =?gb2312?B?NSs3M01uWFV0NmJJZXVZZlNBcC9nV1hWSzB3bEx3amdGVk1JdldPTHZmM05r?=
 =?gb2312?B?UmdiZjFCUXF5dE5DQzBPWWtCdkRkdG1Nclc4Y0hyMUs1b2g2K0VoQzR4UVM3?=
 =?gb2312?B?NzVub21BQXNmTCtKOFBvUVYxOGtYdm5OQkpjWVdHVGYzZ3NLbDZjRUpDWFU3?=
 =?gb2312?B?KzF2VTBURjRLTXp6T3Q2dDBxMWR0bHlMdDUwZmoxQk5Xdzl4dElLb1FvU1NL?=
 =?gb2312?B?YS9jVkJpdXJYbWhhdjdsSlF6YW91aC8rd25LcEdjczZTZ2V1c1pCRUtjS2Y5?=
 =?gb2312?B?MkszUXpIeFQrcUk0d0JJcWtiY1l3ckZHSVlRL0drUmZIT3ovdDVUR2ZGcDEy?=
 =?gb2312?B?MnQxYWVBUzNqKzRKTDIwSDBiZ3gzQnk2U0lhMFFJNDFhQm9xS1hiNWdLc2JF?=
 =?gb2312?B?cElIU3BadkEzNW05TDhRalRSTGJEbXRBZFluL2Ntenl5NDk0TXZrMHhsakxF?=
 =?gb2312?B?ZCtlNFlPNlBmTGwyNERQSWFUL3IyUkF0VkQwS05DdGhtZEdaeUcxOTVkV296?=
 =?gb2312?B?UldBLzl1cXcybEJzMlgwWEM1YjZlYWpBL21GbmM0OVlPemhnVFZRNFBKdys3?=
 =?gb2312?B?Q2dHUDNoSFJBcy9KWFFLN3NGWTYzNmpkWlJzcmJmZVFBQ0lzbDJwL0hla1hP?=
 =?gb2312?B?TCtnTXZkU1hMSGNMWm1sU1hRMmxqRVBOZ05YenVnV0RKK2xRYlZjQnlacUt3?=
 =?gb2312?B?Njhka0w1MFAyOWlsSjdycVRhcy90aTVjaXNxSHVOekdXQUNBSEgvRlppUHI1?=
 =?gb2312?B?VWc5eUViVlNKT0hPVTQxV1V1ZU5xZ2ZqRStRYXBNTG4yL2RLNG9sT1p5amR4?=
 =?gb2312?B?VFNMZXlhN0hxblhFUUlWN0wyY2xqejd5bDYybUxHTUVCNkc0bXFzU00rYmRs?=
 =?gb2312?B?L0R6akpjKzhoWHlYQktHbTlackxJY2d3bDFZbjFFMGhCZ1lsUmlkRGcvZWpB?=
 =?gb2312?B?UTRCUWduWHduTFl0ZUJJWEx0bjg2cFFXbGkvQkRUWmdqWkgrSWtHLytITG1X?=
 =?gb2312?B?cXYrN2VNOFZaNU5WMGtjcWVnemxEUFZiZnlUY0RJdURsTzJFL01VQ3MyMmlk?=
 =?gb2312?B?ZG9KQTgwV1JZeHVacVdhdjJKRGtnMU1GbUdhd1hRNUUvbGVTM0w4b1VGb1VC?=
 =?gb2312?B?dzUweXdWbng3S2dncFVhVXYvN2NoYnc0WFpXaXJIaHZWdkFiaFV6VUhrN2M2?=
 =?gb2312?B?ZnRQUDF0QWtPUFhISW5CS2s4emtvZ01PNVc0dHVkcHUxZmRtelFEYzlZeGlt?=
 =?gb2312?B?WjdPblVkemJzbzRtdnpSNW94Z3FZYmVWZGMzYTFvSXBlZlNPUE5NYitpai9B?=
 =?gb2312?B?U09Bcjh2M3BkK1R6SmVxOEpiV05TVHAwclYrTXJEb1VYOG1RaGd3emRkdnJY?=
 =?gb2312?B?bG94Wlh0UjcyQ2ZBcmVXbkhTNGtPS0x0NjNybkNoSS9IZE8rYzZtc28waVlj?=
 =?gb2312?Q?6MQRQ6vXDPfBjSUk+Grt3GWmg?=
Content-Type: multipart/alternative;
	boundary="_000_TY2PR03MB41573133CF759BFD9D6C25BE8F3CATY2PR03MB4157apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB4157.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85bf866-168f-4a26-7d39-08db8a8d931e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2023 08:28:06.5727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8c2mFGRJbSr17FZlvqzv2viiwLZU3fuRUeDS2ahDEYcvx6h5jbzzQfBV8S3oT45dOxrLYTESvmxBbuBUqYkQ4za6SBhukvV7C6OevACloOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8115

--_000_TY2PR03MB41573133CF759BFD9D6C25BE8F3CATY2PR03MB4157apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCg0KDQpUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydCBtZWRpYXRlayAxMGJpdCBoYXJkd2Fy
ZSBkZWNvZGVyLg0KDQoNCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSBpc3N1
ZSwgdGhhbmsgeW91Lg0KDQoNCg0KLS0tDQoNCg0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0IGQzZjY2MDY0Y2Y0M2JkNzMzOGE3OTE3NGJkMGZmNjBjNGVjYmRmNmQ6DQoNCg0K
DQogIFBhcnRpYWxseSByZXZlcnQgImFtZGdwdTogRE1DVUIgdXBkYXRlcyBmb3IgRENOIDMuMS40
IGFuZCAzLjEuNSIgKDIwMjMtMDctMDcgMTU6MjQ6MzIgLTA0MDApDQoNCg0KDQphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KDQoNCiAgaHR0cHM6Ly9naXRodWIuY29t
L3l1bmZlaS1tdGsvbGludXhfZndfMTBiaXQgdjIuMC4yMTk2MQ0KDQoNCg0KZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIGY0MWQ4OTBhYzllMzU0MGNhZjU5Y2JkYTM0YmU1MGE2ZWJlZjMx
ZjM6DQoNCg0KDQogIG1lZGlhdGVrOiBVcGRhdGUgbXQ4MTk1IFNDUCBmaXJtd2FyZSB0byBzdXBw
b3J0IDEwYml0IG1vZGUgKDIwMjMtMDctMjIgMTY6MDc6MzAgKzA4MDApDQoNCg0KDQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQoNCll1bmZlaSBEb25nICgxKToNCg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0ZSBtdDgxOTUgU0NQ
IGZpcm13YXJlIHRvIHN1cHBvcnQgMTBiaXQgbW9kZQ0KDQoNCg0KV0hFTkNFICAgICAgICAgICAg
ICAgICAgfCAgIDIgKy0NCg0KbWVkaWF0ZWsvbXQ4MTk1L3NjcC5pbWcgfCBCaW4gNjM5NzAwIC0+
IDYzNTQ5MiBieXRlcw0KDQoyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQoNCg0KDQotLS0NCg0KDQoNCkJlc3QgUmVnYXJkcywNCg0KWXVuZmVpIERvbmcNCg0K

--_000_TY2PR03MB41573133CF759BFD9D6C25BE8F3CATY2PR03MB4157apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=B4=BF=CE=C4=B1=BE =D7=D6=B7=FB";
	margin:0cm;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.a
	{mso-style-name:"=B4=BF=CE=C4=B1=BE =D7=D6=B7=FB";
	mso-style-priority:99;
	mso-style-link:=B4=BF=CE=C4=B1=BE;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">This is used to support medi=
atek 10bit hardware decoder.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Please let me know if there =
is any issue, thank you.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">The following changes since =
commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf6d:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp; Partially revert &quo=
t;amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5&quot; (2023-07-07 15:24:32 =
-0400)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">are available in the Git rep=
ository at:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp; <a href=3D"https://gi=
thub.com/yunfei-mtk/linux_fw_10bit">
https://github.com/yunfei-mtk/linux_fw_10bit</a> v2.0.21961<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">for you to fetch changes up =
to f41d890ac9e3540caf59cbda34be50a6ebef31f3:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp; mediatek: Update mt81=
95 SCP firmware to support 10bit mode (2023-07-22 16:07:30 +0800)<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">----------------------------=
------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Yunfei Dong (1):<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; mediatek: Update mt8195 SCP firmware to support 10bit mode<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">WHENCE&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp;&nbsp; 2 +-<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">mediatek/mt8195/scp.img | Bi=
n 639700 -&gt; 635492 bytes<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">2 files changed, 1 insertion=
(+), 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Best Regards,<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Yunfei Dong<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR03MB41573133CF759BFD9D6C25BE8F3CATY2PR03MB4157apcp_--
