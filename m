Return-Path: <SRS0=T4PB=W5=amd.com=Veerabadhran.Gopalakrishnan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DEDC433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Jun 2022 14:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B882AC34114; Wed, 22 Jun 2022 14:29:56 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC1D4C36AE2;
	Wed, 22 Jun 2022 14:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC1D4C36AE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEyXYhULfE6FJ91kNi/qH4aemFq29Pdy0Im20cP9/IJX4tL0b2YRg1I1RI8i4gCjUJgbdXYBJq9UDQaZGdCGSSOYAR67z8stk426E6cX4QuaqWolK9iNjaw4tJiyaIyo/LC/G1R6IrTpcS0fJovRl/sTldGLe2UaZ1Z5oRgnMNOCeqsvTyMDeW8n7USL5V0sjCM600M4/YhCrEo0ikEo9YJ+hCUE5SeY5eE5Y5HcjW0a+5AJ2N/dX+o/OJhDfIhipD4pdKZWd0RPga94OfHXv7Ji43rCwsj6aOs472Kw34CvlgpOPczBzsIk6/SqbkQFeVO8k6adDyNZvEUvawTMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1cNgq70kwAVoZRsch9C/6Xd0YjMD9roiohplRnhuQ8=;
 b=Jq+uMxi6a7ssfA1LswrW6W9mnfbzuia8C8mAPmnp+oKZjqrRIGa+LpHOyENr9dYtbhtLNKxU2A6lJcBwJfPrNnPtMDGAaM95iTSrP9U7EBEX1MbzbDoiOXmp4relZGr/m9znNawJEl8bhC/ph6D+9J0epN/houVSc/FQQ9HWxvGWIiA+flFc2fgzxzT2VDMCponInqHAWzgdZMkqefdmJz1gSVfkqfFGufUbSAtZK5pjFqCst0VARgJSciZLmpc02q2RcAvXseRpRMsRu4XzCp8/i6FoJz/X3RUzKVnykGyptirF68s8dr9WupiZ5PEPmhg3Bj4qPE9EtdZTPCJ2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1cNgq70kwAVoZRsch9C/6Xd0YjMD9roiohplRnhuQ8=;
 b=nB4RHWE22q7kEvsl+uyzMa3CSftXAYNXhnG8Q4P8p+pwJnWbSImF+LphsD4VCS88vEMLjxnANlb6iP/7jPAG5B2IO7xY6SqrCU//SnxJI49eLPnXTeF6hW9MtZA1bK8OCGhjZHKJYOF0XmVQI5ulrMGMmDGXEIADXleyX9m8bsM=
Received: from BYAPR12MB2693.namprd12.prod.outlook.com (2603:10b6:a03:6a::33)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 22 Jun
 2022 14:29:53 +0000
Received: from BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::4943:1651:a347:134]) by BYAPR12MB2693.namprd12.prod.outlook.com
 ([fe80::4943:1651:a347:134%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:29:53 +0000
From: "Gopalakrishnan, Veerabadhran (Veera)"
	<Veerabadhran.Gopalakrishnan@amd.com>
To: Josh Boyer <jwboyer@kernel.org>, Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>, "Liu, Leo" <Leo.Liu@amd.com>
Subject: RE: Update amdgpu VCN firmware for yellow carp
Thread-Topic: Update amdgpu VCN firmware for yellow carp
Thread-Index: AQHYhY37n7Cn43MHSEm+x9YYU7+7pq1bOogAgABC/hA=
Date: Wed, 22 Jun 2022 14:29:53 +0000
Message-ID:
 <BYAPR12MB269311385C72BE0CA5B2BE01FAB29@BYAPR12MB2693.namprd12.prod.outlook.com>
References:
 <CADnq5_NaLJ4GcPFNKmOSLnwMTcmwXg_xRPfLxsojnn2R0GoGSA@mail.gmail.com>
 <CA+5PVA50Gi5e9OCA_k2A5Ri8N_Qp0eH1jP9v4f9Ag2DCSqE+GA@mail.gmail.com>
In-Reply-To:
 <CA+5PVA50Gi5e9OCA_k2A5Ri8N_Qp0eH1jP9v4f9Ag2DCSqE+GA@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-22T14:29:50Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=e6d16c6c-3716-48cc-8374-6a29893072ff;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-06-22T14:29:50Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid:
 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid:
 c69f4c09-8fb9-4efa-9bc6-881f05325f72
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22544fa1-4386-4889-d9f4-08da545bac11
x-ms-traffictypediagnostic: MW4PR12MB5626:EE_
x-microsoft-antispam-prvs:
 <MW4PR12MB562624F63C1C8A3C4464918EFAB29@MW4PR12MB5626.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uZE3nZ+Bfo5y+4mF0GTqVxgUAR8MldLVQk5xFFA7EpQliUre5ArRiBm0YEEWppVA7sH8+/uUO47W2GttpdD/Kwf1JS+Hv93a7RYaPZXJXq+ua5uBBtnlR3S0c1Bx3rRdSCat6U5dxheRvBPhYwJmjFq+PnN/LQlXaVQogvJjuuQoG5uZ7vUaaehGlVWptbnT7bSJ59O5LAxf38HO5Ba/pjj9b4+VB9+JH15qQpD3yVB1EDZrRxYhCijbyHftKJ2SByaKWYRAzgDZf+hxY57NJjOFnZ0e06cm2N+ZeTbtei+64IbEbpWVsbCzEK9kEFDlMUEpXNwDmEouARgdRAvW+dmwVu24BdqbXg2IgjbksnDZv8i0G76dF9iZeZhGHtlK3ewMQmSJeKnNSMeC/FOf1t8J+O+wyqKoP1wizaEvJHFVGu1+SQ45Q0L7nhSdn/bqMJjcjIXqhKAPNz4DTMK8aS1bW0qeMspk5Hu22C8fp/ZJOZjMJh91B9O8k2s2kqL8To/X/q4dIBTjsVRYN+o0KWa0mgS92DoUHo7JgwuXWYs3O3TaVdHexB8wssa0a6TAB6cIUszDfmlfQYM53TlcvA+gDJYYKlJtfH2VfMPkVG1aeDaLs7eZBQRrOrpnQLWYIrggO76De16cCSnJfoks9qBqc9X4zJQ4PBDqtFuz/trvxUVgXJm9pnkjnIg0dn0GzKaE7NfB16LhbfNV4igS4kK+VOhfBcgNuJYcSnL770N8VT+rBwrSro97hrXMnDXzHoCsmP6uliuRKDHef3mwrw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2693.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(66446008)(9686003)(4326008)(5660300002)(316002)(38070700005)(6506007)(478600001)(2906002)(110136005)(66946007)(7696005)(54906003)(8676002)(38100700002)(26005)(76116006)(71200400001)(64756008)(8936002)(41300700001)(33656002)(53546011)(15650500001)(4744005)(66476007)(186003)(86362001)(66556008)(83380400001)(52536014)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUUvVzQrODFlTFNvbjhuNUdDYm9rVXhLc05CbHhxS3VGdmF6bnV0bjB2WjJX?=
 =?utf-8?B?d3RwSk9tRERYblE2MjJoeUZMbkIwU05aWXFoYW5VWDFXeERkdkVlaDFzZmlq?=
 =?utf-8?B?NHVUNUFkK01IMHZod2tWVFI4UzkxV0E1ZHVXUlhYYm8rNi9vbzB0VmdpSmp2?=
 =?utf-8?B?VGdrY0JESlpjQks4SDUxdmdkNEViNC80bi9Scm1UYkk0bzlITjZSU3NmQ2NH?=
 =?utf-8?B?N0RHWUVmL0hiWDRsL0pZUzBvRmVrMG9UdGdNdGZIT20yOFE5ZGRsY1BMOGxQ?=
 =?utf-8?B?MVcrblNXT1pBOGhEYnBReHZYbXcxYWxzZE1wS3A1RFpNMWlRRDJpM3dGWHVn?=
 =?utf-8?B?NDF1L3pJNlMzNlZ3b2VLeEpsbmJ0R3RCYWg5NXVqeGNuM3hqUmF0VWhwQWpS?=
 =?utf-8?B?ejJxbUg3ZXh3OVc5VER4OWcrZUVOVmpzbWh4Y3hXMU9QdUJaSUhOSWxjTldN?=
 =?utf-8?B?RmZYeDVqQjFpSUlzNGN0aXNqZkxGMFc2aHFrSTF6UXZVVHVoUzIzaTI3czNB?=
 =?utf-8?B?WWEwT1JiS3R3Si9wTjRQT25ncndOc2dLVldCdDRxbDAwd01pcVozdTVvL2dr?=
 =?utf-8?B?WDZRVmcrdlYrdjZHOCt1VDZHWmJpcVJTYm5CdStCWlhjUUEzNjE4bUVUNnlM?=
 =?utf-8?B?dmtJdnNGUFpuYWlUWlF6ZVRrb01pb093YkYwTUVyNzRlVXpPMTNBdXRrWVgv?=
 =?utf-8?B?OWo1TXRVK3lvT2k0MEhRTTQ2cCt5TmR6OGU0eHlqYTY5a2tweW5Zc0RWL21G?=
 =?utf-8?B?U1R1N0VSZktpS1c0NG5jQkhWeGpZdW85VmJCZnpydk9ZR092VS81cjNzdnA4?=
 =?utf-8?B?T2JJZSs2UWpYc3BVUkRRbG93OGlkaTNnNk5Tei9UTmlqOFVlbmRiSTlrR2Iy?=
 =?utf-8?B?N0gzOXdtUUd0VjVXcjFaZmtFMk9pNnFSaHdITkhOT2N5Njg2ZGlsLzVmcGpN?=
 =?utf-8?B?ay84cTQzNkQxcWJMaFdWeW9uWEI0ZzVkT0ZlT1c4WThmUVhLeGR1S2w5RXBa?=
 =?utf-8?B?UDQwMXhjZjN6aWVDZ0tESmc1MC9FVEZkcS9WTWtJWEpBc3lvTVBtbDlrc2Zw?=
 =?utf-8?B?NHBBZXlEUkJFVFY3UnY2d3pLVXZLWXVFSEFCMTY4cjNzYmJrWjdjeG04QVFW?=
 =?utf-8?B?NlZMTHNkanFGbDE1Z0I4dSttaFFQaEtOS2s0TXNhN2VQc3JQbVNlSmxkZ294?=
 =?utf-8?B?dnU1RG5yZHVuOXdEd2lmaUJtczhIT1Y3UU45bDM0N2x5ZFNqY29sNlcvNWpI?=
 =?utf-8?B?WXIva2Q1OFdNWWh6M1ZydDdlM0ZZVzBmN0ZObVF5cnMwUUpuTXRJWjB6SE1E?=
 =?utf-8?B?OWhob0Y4SmE0Rm51cSswOEIycmc0cGhyd3NzVENNSnBBTmFocHR6L3lJd2t3?=
 =?utf-8?B?WXFQcHRzUk5tWlMrZXEvRlNJWUcxb1FlYjNYVkVETFNoV29qRmtSZFZxTDRY?=
 =?utf-8?B?Nm40TUhqOUVOa29lWE5aWTl2OGFEOS9UMldGWjZ5eU1mMW40bFVNQUdpTWVX?=
 =?utf-8?B?OHdkRDBiV09uODYwWXNmY2FKSUp0N2tHTTB3ZngrZnFqUjExRkVCVW9TQk9p?=
 =?utf-8?B?NCsxUzVpRjc0aWl1dE9lMmhBVUNuWHFBQ1g1cWZ0WEdUalJIbnVwNkdpQnFQ?=
 =?utf-8?B?SVQvNHovQ3hSZGYzUkpNK1kvcXp0dG9meUxRNW5sK2pHN2NiOGhrdTVjcFdv?=
 =?utf-8?B?bkxvSDNnQWpRNlVwZUp2ZWN1VUxkajdlM0JXRFhqYk9XYzlMTHpmb2tnVFQr?=
 =?utf-8?B?cCszT3BhWFhjQXFhdFFEcUNmMGgraUNYWW04WWVBWmJjVnhIYzlXdWFuRm1S?=
 =?utf-8?B?SllpRXR6OVJkd2JudUlzanoxeVN2VG9USVZPdk52T0lJR1poNzNhcEh1ZVpD?=
 =?utf-8?B?em9pWCttR3MxdW5IWU1ja0ZvTW05UjZMcTVsOXMxM2tncitGRmdIRk50MEFE?=
 =?utf-8?B?RnQyc3E4c05DSTl5VUw0M29aM3EwdFNrVE5zUjVsQVRKM0Q2eFJKS3ZWQzRG?=
 =?utf-8?B?VVcxWUQ1OHd5U081OGs2Z044NFZCSWtmRGc5RnppZllyS1BmckpLMmd4N2I0?=
 =?utf-8?B?YWxQenV0WllERVRsVkRtcnlVVEpFK2FLSXBWTXBNSGhuU05lQWx0ZjBaeUVh?=
 =?utf-8?B?MGVmS2syamdldzVhalFGWDNhY2VINU9EZDRNOGRXVlVNanFnOVdCRVlKUEpQ?=
 =?utf-8?B?cVoyOGl4S1R3T1dObE5lS0ZrZ1lEYkpyUDBMRzVDWDFlK3Q4bWFyMnNrckVi?=
 =?utf-8?B?Z3RRYktmTGdVWGI2bFBYUUF1VWljV0tackRZU0Y3Zi92Wk9qRVFlSVNZVE8w?=
 =?utf-8?B?aTFjZlgyVlNOcXhwQlRGaGdwa1p5Q0pkaUp6NVV1NHUxVjBSME8rZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2693.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22544fa1-4386-4889-d9f4-08da545bac11
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 14:29:53.1642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1CbfUqhLAL14I7p42Vny4ZRVmH7SZ3gmspDkEsjCTaDp7GxJyBeuYWNT3yNGvOzNSEJLymPo8LIvam2/LUX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rIHlvdSBKb3NoICYgQWxl
eC4NCg0KVGhhbmtzICYgUmVnYXJkcywNClZlZXJhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBKb3NoIEJveWVyIDxqd2JveWVyQGtlcm5lbC5vcmc+IA0KU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDIyLCAyMDIyIDM6NTkgUE0NClRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVy
QGdtYWlsLmNvbT4NCkNjOiBMaW51eCBGaXJtd2FyZSA8bGludXgtZmlybXdhcmVAa2VybmVsLm9y
Zz47IEdvcGFsYWtyaXNobmFuLCBWZWVyYWJhZGhyYW4gKFZlZXJhKSA8VmVlcmFiYWRocmFuLkdv
cGFsYWtyaXNobmFuQGFtZC5jb20+OyBMaXUsIExlbyA8TGVvLkxpdUBhbWQuY29tPg0KU3ViamVj
dDogUmU6IFVwZGF0ZSBhbWRncHUgVkNOIGZpcm13YXJlIGZvciB5ZWxsb3cgY2FycA0KDQpPbiBU
dWUsIEp1biAyMSwgMjAyMiBhdCAxMjo0MyBQTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdt
YWlsLmNvbT4gd3JvdGU6DQo+DQo+IFVwZGF0ZWQgVkNOIGZpcm13YXJlLiAgUGxlYXNlIGFwcGx5
IQ0KDQpBcHBsaWVkIGFuZCBwdXNoZWQgb3V0Lg0KDQpqb3No
