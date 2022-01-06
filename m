Return-Path: <SRS0=A/6Y=RW=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F292BC433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jan 2022 18:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF8D9C36AEF; Thu,  6 Jan 2022 18:58:23 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE8F4C36AE3;
	Thu,  6 Jan 2022 18:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE8F4C36AE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kspjIhbJzJs/zK4aGzvNmkZNm13frmRiV94PDVFsPIiyzrzWnyz/2SvOoxVLjwKITSs/KjI1TXxt4106FHpBs8c2Vl3Fjbp0E5d9ERF2kayHnC0xQP27j8WNU9uyCTsfG1NqPvZQfk56jdg/H8jCnKjmzsJmBssoNL5pa53rzVc3lX8JrsOVv+WNT5auZxKrXJqPuZdajyG/dov8SUDcKuBiQepAgWyaA65jVe9BJi12ai6NqeFggHUaWdfbEOJmaar/NGuXRyW2VD2nVKOJOc5+AoNutF4ycK9w6szHfdFM6TZba1W5jb62mOSmExiTu3rBbXI3nYdllxT4amh5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr0AniWxeyxTqfOAT/8N0CeW8EcDXNmxsqJQdeYbXU4=;
 b=WlIKo6+nFN//FIrDL896IeiNys6MbAoOCxcZav7GAtMOHl5MKOR0AkpHy9tUiMby8Dl0QR8Mg/tOaqwM2H7j98ucNYCuYcuApqaywZioHSpSpuGLx++3O6uIVg67OOzHU3hG1lgKL57xh3Y60iaC74isFOYvc6IKfplU53fF9WtX/Pv5Pq1iQ9ckl/bU8frwsp7dv8L1c1jRuie9uvP1UyaMycKQhEOCOFeamOYb2Lpnght45BsBhxlTyRCzzd1RF7MD69r22HNAUlR8/Rzyt4ba/NMpcjesrFBiyRa/ItfIBjMFPVwtzkekXt5hEE8CKoGSB0lg/URj0A73Wb7Opg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr0AniWxeyxTqfOAT/8N0CeW8EcDXNmxsqJQdeYbXU4=;
 b=py3NhGKQVl6AGC0J5Hn2hglzA/JwtUOrZez4tl7lonUUYTHi8s54zP6meEusDMTyPvfov48XBBlvlP3fpu4oejY691tUqlbW/DkBDKIAHSq6i9TsLQuIk3kHa7ZIPbvW9CYALxqQ6iVB1CfDL0WKt2fJ3st7LMTSGp47EkySGeg=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 18:58:21 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%4]) with mapi id 15.20.4867.010; Thu, 6 Jan 2022
 18:58:20 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Gong, Richard"
	<Richard.Gong@amd.com>, Linux Firmware <linux-firmware@kernel.org>
Subject: RE: amdgpu firmware update for yellow carp
Thread-Topic: amdgpu firmware update for yellow carp
Thread-Index: AdgDDW8rx0GmgcXLSkSuEpvYb+o/1gAICV+AAABcPAA=
Date: Thu, 6 Jan 2022 18:58:20 +0000
Message-ID:
 <BL1PR12MB5157C455DE07067BF8A8F258E24C9@BL1PR12MB5157.namprd12.prod.outlook.com>
References:
 <BL1PR12MB5157CC3F63E96C7A9171ABC3E24C9@BL1PR12MB5157.namprd12.prod.outlook.com>
 <CA+5PVA6idg=AQrCsHNNyhyjYoLhNXn=bhS680=ahDrWW0CFC3A@mail.gmail.com>
In-Reply-To:
 <CA+5PVA6idg=AQrCsHNNyhyjYoLhNXn=bhS680=ahDrWW0CFC3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-06T18:57:03Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5375cb79-5d8c-4fda-9957-4eb514454c76;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-01-06T18:58:18Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid:
 91d658e6-4360-4b0e-bfda-fbbfbd8b7552
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7a6bb35-8499-4e16-fc8f-08d9d1468204
x-ms-traffictypediagnostic: BL1PR12MB5142:EE_
x-microsoft-antispam-prvs:
 <BL1PR12MB514236C893A7991C35B65A82E24C9@BL1PR12MB5142.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 siuulO2+m4cS9Eyy279ZoQw2NRLZRDkpZovydkSkvEziwjvAPz/02lTEQGTyht+TUrdqjQ+75OqfbiW7/nRvL5La3Lbw1AJA87t86IRswX6M4bIbz4CPP+UO/KqbkL1Fizaw51KxQ4B7aoA0r5IvCihSLKeBI+a9YGXgITNBNKQjK8wWcdflmhgHZ1DzUofH4J9XAJ6t85Z/xTfCAe78WW6MLaf1XpWG+o1N8OCWEviZBCxCBsFt8PrP15iEMTsxoUu7OF/qf8TsVUT3FrdJCy1Qgq7lD4yaxf8t2/OeBH8U6lihTqtIx1gsr+mbQKBI17Uzbul5XmihV0p+TKiJKOrVXMiPYI4owY/xjon21hhJjsVfR6BjHg05uvrRMv028aha/H1NnDH3K8sfL/wCpG2ue9qe06w2FUfz/oG9JQeSs4yV9nvCbJk7umBy73qs0Jx7pNo5loFZ/pIonrsQN/alYFD4kzwGqWrpvkAUYf/9yycEEfY1OiC8Pn7jgqUvhBoI8BcoWPAXdUuJKeTJhYg9ueu4EIAkuo+shOcsV5vqcJ6WQ1W1Lc74nFPRiTXgsYybTQTCTxyvrk2oQXrAunITs16Y0k3DIXItgz9lVU1ND8ZXGihfgiLxbv51LewhpPN0ZxfnsZnihRFgFVm1qDa0uhmT6a9Rw/uj3Vv/9SfJpC3NRfE8itB9KNtqupCxazb9ZvTOFVXQtB8kM56PEQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(8936002)(52536014)(186003)(4326008)(8676002)(316002)(6506007)(6916009)(53546011)(508600001)(38070700005)(4744005)(2906002)(122000001)(5660300002)(450100002)(86362001)(38100700002)(15650500001)(66946007)(71200400001)(66476007)(66556008)(66446008)(7696005)(83380400001)(54906003)(55016003)(33656002)(64756008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFFKLzlrSHJ0L0xsME45cXI5VXpUTzZqOFR2dGFQczRqOUxnNFBBWjBwQW9Y?=
 =?utf-8?B?UXQvVG9wVUpHOGxLMDVMY2RiSmdMaU5jNEVYWU1lVlBNaG1SU09VZFdpaEht?=
 =?utf-8?B?V1lsalZqSkFnT2xhenVzL3NSSm5iRE94TVEzSUJVNjBKUEpXUWxBWlk4c21l?=
 =?utf-8?B?bGEzNmlIQWF0TTVrdmppRjhQT2tDWGVYSWtKV3hSZk1HdDVyTE1xaXRxVWhX?=
 =?utf-8?B?S3NsSnh1cXNQczczeU5FU0c1MzgzdHdJbXVvQTZCTXQ1LzNtZHVQbWtpdit1?=
 =?utf-8?B?R0hBVVZZV2t6WVl0N2pHemVjenlDL2dKUGlFZTIxRjNTYjFwYWNZVkxpUldK?=
 =?utf-8?B?cS93MzNjV2ZDTSsyK1hzYzFTVi9HaHV5L2VMU3pnZ0FOcWIyRUg4bWpYNDhB?=
 =?utf-8?B?UjhXODB3N0YxZkI3dGtPUXlFaFp2SUhmdElTNEt0WTA4TGcxRUwyVjNiWjRP?=
 =?utf-8?B?WDBCQjErZWk0b0FwZ0R3TGs0SDE4MDVmSFJEL0lFZmtlTnhiQXNYYTFHQjBJ?=
 =?utf-8?B?MnJHTG5hL3RKaEdHMUk1ZDBub3dZVFNOZUZvSDRvR3VXQzJkWDdLYkRac2Z6?=
 =?utf-8?B?aW9uUmM1UzI1U0RBazE1Vnk3VlZOY01mQjFLb203UTVZMDNnbGlnZVdzZmYw?=
 =?utf-8?B?ZGdVZFVQNS9aejNOQVBNSWRweGFuN2tXdnhkWmFsbjlZa2xmMCtWeFZhWkhN?=
 =?utf-8?B?MmN2WDlQYitNS3dTSGx4WnVPdDFYdmVNS3dmQUVIWTZEL2lCdmdhRWJiSGM5?=
 =?utf-8?B?V2llY2VqazQxWHBpU2dnbXlVc1g5eUZhRDN4aTFFRE5NbnprL0NPbGxWTEZG?=
 =?utf-8?B?cEl2ZlEzb29ieXNmbFJmekdTNFFBQ3dzZ3NRdis2VXB6NjVRbGltaE5XM1RX?=
 =?utf-8?B?RlBjOEZub0wvb1NSQWRFY3poMDR3V054SnY4MUVQWko4UGljM0d6bkN4SDBT?=
 =?utf-8?B?UUhBTiszd3ljeEV1cGxOczQ5RzAxMllyMDk1TDQ3d2NEc1hGMUFQbzhyZXhq?=
 =?utf-8?B?bjNLYnRyT3BKdEVPV3ZMR3R6Y3d6YnJlUGtqSHRGamR6T2lnVU5hTk1TajNT?=
 =?utf-8?B?MWtVTU9RZXJBTDVJTUFjRUxwRnVyekJHZ1pJdzRtM2dTU21FcHZxNVYyWjdH?=
 =?utf-8?B?MzNkTGpEbWNPOHUwUnY0K2w5dlJocDN0QjZQT0lpQ3VyTENZL0NDeTQyc0tx?=
 =?utf-8?B?NDQ0Y0pmbE1zb1J0bFBDTUsvQnlsSlhtOVUyUGRHNFAzRmtHaEFhcmpVai9O?=
 =?utf-8?B?UnNnOGpYdWswRUtZMmFJSzIxdzRwakdYU0R6eGNpUkNPQXUyRkFPZjJucmky?=
 =?utf-8?B?VUc5YzFvL1RjTGIvRjNuM1J1UnFJSEk4WXY4R3I5WmlrVkFkYkhMaU5jeU84?=
 =?utf-8?B?NUFDZ25iRU9iOEhIUXZMa3F6aG9rUmlEVGVKM3YyVUFBT2FIWThqc1A3RExp?=
 =?utf-8?B?SXhUNVpHWnNMSGwzTHBzVUtEVFJRSXo1V0c4Z0t0UG91WmduRm94RGhRMTQw?=
 =?utf-8?B?OUFTdzZmNHk0aDdlOFUzb3pTWHF6NS9FY1krMFJtbytFVFhFSVREZWsvVVhO?=
 =?utf-8?B?NVdCbExuV0x2aXBLRmNhZG5KbHJOVk5qVkZTVlBJZ29xQzIvYkxIRU5lNUJv?=
 =?utf-8?B?eXJnb3gzdGlnZ0V0eGVJQ0x2eHhpL002bnRDQlY5MzlJeG5lYVFNd3VMZmta?=
 =?utf-8?B?RDRDTEpYcDZQRGgvY2dMNHNROHBjdG5FQTYxbk1XSmhhNGhic1p6ZUxqd2lx?=
 =?utf-8?B?UFdBcGtiL0Myc1VkUHdlTVBFOGhIY2lVSHZMVVF3RjdYYitJaEU4ZzVXRzcx?=
 =?utf-8?B?RTh5SUpkb2tQV1ZIYW5ONFl0d3hZOGttS2cwOUJIbjRnTWo0YVlvTFFqWlhZ?=
 =?utf-8?B?dHJmMWpuYUVzVjVYUUNacXJWaDRXMnVpNFFBdmtRNzFTY1R6Q09Va0V1MzA2?=
 =?utf-8?B?Y2tTVHJ1TytJR2M2VHlwUWxhNkxiZUFma2NBSXdOTG8vWUlCdU9iUUxPTmZH?=
 =?utf-8?B?ZTBZdGJVbjE5eTZjTFhmaWJEM09mMnFlMk5NWnczc0RWVU96aEZMQ0Rtcktu?=
 =?utf-8?B?VkR2amFTRUZmYjR2V1hGa2RtMGV4VzJESUNaQW50eEIvNUlTM3k4aXFXblRY?=
 =?utf-8?B?R3l6YmMxdTRGcVgxVTNMRkw4NVFpWGF1SjdhM3oxQUNKTVFMRXRKOGhWYkdQ?=
 =?utf-8?B?UUJhekF1WjF2NE56SHFlT214bC92SDZERUFXa3VZazFObkxxTk5NZ3dlTk4w?=
 =?utf-8?Q?5yVtikiemCa2i/aoj+RRPs9hPJeVICesELO7ACSs/4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a6bb35-8499-4e16-fc8f-08d9d1468204
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 18:58:20.7822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnQhtBCnrCAEER6vUVZq8BPI+oqXU5lY0yITL2cqrQ7iN668+X2Ow5JREGk+XvA2iFCl4WyPU8AIVC83qBf4og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIEJv
eWVyIDxqd2JveWVyQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDYsIDIw
MjIgMTI6NDYNCj4gVG86IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1k
LmNvbT4NCj4gQ2M6IEpvc2ggQm95ZXIgPGp3Ym95ZXJAa2VybmVsLm9yZz47IERldWNoZXIsIEFs
ZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEdvbmcsIFJpY2hhcmQgPFJp
Y2hhcmQuR29uZ0BhbWQuY29tPjsNCj4gTGludXggRmlybXdhcmUgPGxpbnV4LWZpcm13YXJlQGtl
cm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBhbWRncHUgZmlybXdhcmUgdXBkYXRlIGZvciB5ZWxs
b3cgY2FycA0KPiANCj4gQXBwbGllZCBhbmQgcHVzaGVkIG91dC4NCj4gDQo+IEluIHRoZSBmdXR1
cmUsIGNhbiB5b3UgcGxlYXNlIENDIGxpbnV4LWZpcm13YXJlPyAgVGhhdCB3YXkgd2UgaGF2ZSBh
DQo+IHB1YmxpYyByZWNvcmQgYW5kIHRoZSBwYXRjaGVzIGFyZW4ndCBsb3N0IGlmIG15IG1haWwg
c2V0dXAgZGllcyBvcg0KPiBzb21ldGhpbmcgOikNCg0KVGhhbmsgeW91IHZlcnkgbXVjaC4gIElu
IGdlbmVyYWwgQWxleCB3aWxsIGNvbnRpbnVlIGRvaW5nIHRoZSB1cGxvYWRzIG9mIHRoZXNlDQpi
dXQgaGUgaXMgdW5hdmFpbGFibGUgY3VycmVudGx5IGFuZCB3ZSB3YW50ZWQgdG8gZ2V0IHRoaXMg
b25lIG91dCBzb29uZXIuDQoNCldpbGwgZG8gaW4gdGhlIGZ1dHVyZSBmb3IgYW55IHRoYXQgSSBz
ZW5kIHVwLg0KDQo+IA0KPiBqb3NoDQo+IA0KPiBPbiBUaHUsIEphbiA2LCAyMDIyIGF0IDk6NTkg
QU0gTGltb25jaWVsbG8sIE1hcmlvDQo+IDxNYXJpby5MaW1vbmNpZWxsb0BhbWQuY29tPiB3cm90
ZToNCj4gPg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4NCj4gPg0K
PiA+IFVwZGF0ZWQgYW1kZ3B1IGZpcm13YXJlIGZvciB5ZWxsb3cgY2FycC4gIENhbiB5b3UgcGxl
YXNlIGFkZCB0byBMaW51eC0NCj4gZmlybXdhcmUuZ2l0Pw0KPiA+DQo+ID4NCj4gPg0KPiA+IFRo
YW5rcywNCg==
