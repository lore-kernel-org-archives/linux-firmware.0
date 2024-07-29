Return-Path: <SRS0=vq5B=O5=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4D9C3DA61
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jul 2024 15:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B9BCC4AF0A; Mon, 29 Jul 2024 15:33:59 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E495C32786;
	Mon, 29 Jul 2024 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E495C32786
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N18gJyaN8xb3ymP8HFJv3iH1+tR8h5e1ZPzDOq9gJeQJ1iLLm6/5yxcld1qRpM8wfR4jboRl/XWsR89QJhQLOCjHXh2iGMAnVSxDOsfiReA7Zgi8Jgi/3XGIknApb1hGPeDFnajBXHTGIVdL7e+RuCxzLvbyLw4anAWwEIgReDHi13iRi0fDX4Ju6X0zmUjzyBMDzl6jo5DR60vLM+pZ2tInIVYL0A+hOmsifeMsyxMSXM8umsHzWbF2zomws+NkiWzSnmySsWoM/wLmgfbtVQVU4buAWDracjXw/TzKLNbKPvb6ZonVSEwky7ZeIaM8e5B6LndZojq1CghudjD3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5LsjvEbchI/6+wiKSGghzRhJl8aSsBitV9M5R6wH/A=;
 b=piZ/VbC0QlvT3rw2C31ojXt4QCpvXDI/TqboGUH/MeO4E3fe/biLJ2q8jdmFSbEMsz0E7ZjTo5Ct9rXM5tgKHPPUgsvWEA6N7+4xkrF8Lqt6zguc3XxjvjkJG0YYpoGdAH1TNxLpCVESzKkqOkAjgaG8ZoAFiFfJe3gekLUYQ/lfvO542W7jEF7GHK5oSqTlUrcVU5E8BWTF7qXVplXRIZ+Gcch1fLVywAMlM3IeH8FEUqOL66rtDY6aZ3feOodL0XSPTaYhDvolA/0nDL3i34hS1ev4ev3o/fkkPLqYGzpom8dtoF0ZMnhKt+Tkq2qe226l3mPJeKovOPoyGdOo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5LsjvEbchI/6+wiKSGghzRhJl8aSsBitV9M5R6wH/A=;
 b=kAXOH6Sd/slsrlUBszvx1aePfBoHkDyiFzogO8bw9I1rZdSV9ki5nIcWyApK4Rv2eZB4kGobboCRoh9NoeqWwnKcvjbgLYVrwjshgOK8UiyhrddmZYKuld/InlJs/WSWPdIDHKlOVNbq3Ubfo6tjrjU5kjb8maSORmqybwcjbwM=
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 15:33:55 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 15:33:55 +0000
From: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
	"Sharma, Deepak" <Deepak.Sharma@amd.com>, "Chan, Benjamin (Koon Pan)"
	<Benjamin.Chan@amd.com>, "Li, King" <King.Li@amd.com>
Subject: RE: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Topic: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Index: AQHa31BeYaBabrRnI0uJx8bd3hID+rIN2fiQ
Date: Mon, 29 Jul 2024 15:33:55 +0000
Message-ID:
 <CY5PR12MB6429C30B38DCAE83D330C96EFEB72@CY5PR12MB6429.namprd12.prod.outlook.com>
References: <20240725213856.115428-1-pratap.nirujogi@amd.com>
 <CA+5PVA7YT5-DT_ogTk8V=at0yE2SemCwW-t2pz=m1DSYMJ5Wtw@mail.gmail.com>
In-Reply-To:
 <CA+5PVA7YT5-DT_ogTk8V=at0yE2SemCwW-t2pz=m1DSYMJ5Wtw@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=399c68e8-e074-495d-a980-14b1dad7cb74;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-29T15:30:53Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6429:EE_|SN7PR12MB8028:EE_
x-ms-office365-filtering-correlation-id: af2580eb-8807-41ee-0345-08dcafe3db72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y2N4a2pWb2hyOFQ0N05RR3p1UFhEK1ZTbGVKOHpaT3VUZ2NQMlhKaE9mbVl0?=
 =?utf-8?B?bmh6OGxERzhWazFFd1FkRzY0WGpwUGVBcnZ2NHZ0RGhBUllJYWZvYXpoMENY?=
 =?utf-8?B?UDRxcHpUSjJ4eVczSWV0TTVmMG85RFZsandIL0U1bWxCMm1qdHhPTmVxNTV3?=
 =?utf-8?B?c2JLbXFoTGh1ZkQwV0FFY3VkWkwvbDZWNEx2N2FZSVBjT216dW5UUnY2WHcy?=
 =?utf-8?B?cTlZdDBZa3A0bjYyVlRBODAwL1RhOVQ1NTM2d215UjZiZG9SVk9rSXhrMTFI?=
 =?utf-8?B?K3Iyc3Z3czN2WWJOVlRnWTFPc2hWZUxzeEU2REVMRGV2MHdUK2RzcVlLeXY4?=
 =?utf-8?B?VFFsZm0xMlhwOGxaWDBjdlBCb1UyUnpZaTZaSkMxOWljRnZFWHJQMFhWbUd5?=
 =?utf-8?B?dFVOVFc0clJLQjBWcmxCcHFsd2Jvd0c4K2tKRTY3VmRUbXhVMEdER29mWCt1?=
 =?utf-8?B?QXZPNEU3cGZrRVo2MnZjVkJzdGpSRnlzOTc2S3lET1hGbUFpTThpampTWjdF?=
 =?utf-8?B?UzdtMEh3TEQ3QVR2U3YxRGZrN1pUeVhNL2RXRmJtMDhFeHBsMmdIV3M5ZUkv?=
 =?utf-8?B?MkJlMGJDeUx3cnJ3ZnplNkR1ayt2RDRtMUVBa2NNWE04WS85akJ6UlprU3NB?=
 =?utf-8?B?RktGR0tSM0tMb2lhSFNhTGlEQXQveUlwSUU4NGhqb3R4REwwdEIzb0dSL2F4?=
 =?utf-8?B?UDVZODhiZ3YxSVpFNTl5cm9RQ0RsdVpLQndBZjhTQnJRUWI5TS9QVGdFcUpM?=
 =?utf-8?B?UWRkV1ljYmNlcWRxbmsyakdBS2hiblZLbENVK3dtckdvS0U1SmRaRWlvN1gv?=
 =?utf-8?B?emhwNzhybWdFZE9DL3dNcnpMYXVzdU0rNFowZmdPSk1tbFpla2xNakFBdldo?=
 =?utf-8?B?OFp2aU1mM2xTVGZKd2ZDaUpQckVHUEU0T0dzK3NTMnc1VUhDb2dZNXBEdVlF?=
 =?utf-8?B?UWpqQUxtTXp6MExDR2t6K3NkVTlkSWs4V2dsRlpFMXNhTkw2R3lpcEJWN1gy?=
 =?utf-8?B?VWJIRk16MlJnNW9NaThWbUpOTTZ2WFBLbUt5NjVndGg4ZXRTRCtITUFObDhS?=
 =?utf-8?B?d2pUWXM2OUdrMmVCVU1jN0NmNXBvYXdHejV5NGkxV3pLNXBZU290VGZ3TXlP?=
 =?utf-8?B?bEFQcXlDNVNRTUo2blBsSFRoUXNRWk1MUnptQW9HZWxVNVdBSTJIV2Y3ZzFn?=
 =?utf-8?B?UVRGUS9hUHpmL0FJMHM5ckt0azc4SDRZeWUrTUpFZlJyRUt4Y3FEclRkemV3?=
 =?utf-8?B?TU9NUUlDSnVJVjQ2eCt4aEFSb0xUbm1QY2loa2VZTTMwN2U0dXhQWjd4Vk84?=
 =?utf-8?B?QUllVDcvV2N2K2xDckE3bnBwY1lrdzQwa0o1VlNxeUNGclNmZ29HWnZvZG5v?=
 =?utf-8?B?OENnS0NvaHYrcVh0VG5VUlVyR1V1d0JhcTZ5b21GamEwc0x1Q1BhNlRMNmR0?=
 =?utf-8?B?NEM5R0dIM2l3Q3pDOFRJOUJYcll0WmpzVUY5cEh2ODNlVGZIekoyUEZVRVFF?=
 =?utf-8?B?V3JEU0Rla0loU0xKSTkyVFFOVVZzOEJqSU5obURXY3lKWk12MjBkdytNejla?=
 =?utf-8?B?a3N3aXBaVmJoajBhUUlZcFZycm1KOXlIMWFTR3NnbExLUzA2d0dQRy9WV01w?=
 =?utf-8?B?citER25TSHlUTUhOQWI2clEybi95dy9JcE1xSjRycmZBVnhzVS82azM0VnNo?=
 =?utf-8?B?Z1FoN0ZFUGtVMmZIZEc5cGd3OEFTWFZwUVpyK2w3aXhhZENTMER4SFRFUDhp?=
 =?utf-8?B?MXNvdVdUVm5rM2NwdEJSR3JZVFN0RWJMSkVBaWUxVk5VSjdJUjY0V2Qzb1Jt?=
 =?utf-8?Q?PGLa2fUcB1lBbzzcBWvLFWOrEYekKV6dBmfDQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0FJVXpkbXhvc1laL2FqbjkrbjRNU29DelpucXhXTXQ0alVvMlBQQ1VJcXdQ?=
 =?utf-8?B?Uk5FY1pTbDlOTzBQbCtwbHh5WjVSMTNSVHo2TmFDYzF3UUpsM3RSK0Y3NHdY?=
 =?utf-8?B?R0xDbmdNSElKemM4a0p6NlR2MnZwT1VzQnJJNU4rL0FVYUFlUFltRUNmb0ph?=
 =?utf-8?B?QWM3em03eXhBbWo2cGIwQVc4NzVEYzBIMm1wVGJMa0tSaExrRFJPVVFERVFB?=
 =?utf-8?B?N1owYlVxZFZZTUtSSVQ2aDRraFEyQ0dQR001VmdKRjlIQ0FGZ085QU9yeW1l?=
 =?utf-8?B?QkVPL2pycEtYaEg5c1Q5SDczU3pCRWUvVVF6dmdXTnB3TXBJcHFXbXprYzd1?=
 =?utf-8?B?dlozNGpIbEV4amJib2laWkZydVkvK1JzaTUyZHpjczFtbWhZRzFYd1NuNElx?=
 =?utf-8?B?UktTbTdPMi9wc2NFUW5wSjNOOUJJdUV5WFpSZlczQU5ENnhwSjMvTHBBU3RZ?=
 =?utf-8?B?RzR0UWRscU45SzlVdHh1ZzJqUVZpekJhQ2xPN0J0aElYRkZkNVpaZE5OQjlI?=
 =?utf-8?B?RDc2MVZkZTB6VlVMK1ZiWjY4T3BjckgzWlRvc0FtSEdlL3VacFlDRFQwWjM1?=
 =?utf-8?B?b25OTFlHcElZY3NGMS9BNU1UaEtodzlWaVNxN1lLVVVhZDVweGk1U042QU5N?=
 =?utf-8?B?MFpFanZXWTlMWVBqYlhsdjlhOGhNOUhmdGxWWHNRbTZVdzhYcjdvREs2Yy9Z?=
 =?utf-8?B?M1RlMEIrUXhwZ2lpWTlYQWdublZnYjV6SVQ3T2EzdHRlWi9SWjBVNEtJWEtJ?=
 =?utf-8?B?NTV1ejdWUE5QYVBXeFhBVnFvNlFXcnBPWldydmJvUnlCSEpzaUsxTWFoRmFa?=
 =?utf-8?B?dWZ2VGtOZm01Um1aaVg0aHFXbEVhNFc4SHRySXlOQWQwR1JpVVFhUWxMa0NM?=
 =?utf-8?B?NHI5enVNRFYzK0J4UG5zanpIZlhNZUVCMVJ2U3RYOWNnSGxRTnIxUGpWVlRw?=
 =?utf-8?B?NkxKSFdGdWlkbnpVbnNVb3FLbHd3RkhZc0hVcTc2bExocW1jSUpyTjlMbkp1?=
 =?utf-8?B?NGJOOTEzSnBlbWpwVTZIQTRoT1Q1V0NjT1dvSkxUbFhEYzc1dTFockdRN0Yx?=
 =?utf-8?B?SHlzdUtqZ1hRMEdUeFpiSllCMy95TzdoaStXbW5tR09Ia1dMVVMrUmhsMVhz?=
 =?utf-8?B?VUpDTjVXUTAzaktkSUNiZWppU0J1UjBNdXhYK0VEMkdRcFVuak9ZbEdTNHN2?=
 =?utf-8?B?NTdTNTRXTGZIQmgySmp5QWlhZDZXNFdadWp5anpSRXNSTFlDd01NditGK2pw?=
 =?utf-8?B?a0xtNklzbGMyWTYyaGpzbTJsRkh2ZnVBYTl3VnBCb0h1VTdrMEU0T1YrQ0cy?=
 =?utf-8?B?eUxOUlhtU0o2cDI0T05CSWovRUhQanNtL3FDQTA2dkhPMEZjelZoMlo2QU9n?=
 =?utf-8?B?bVhBWTlidlBkQjl0YStNMllrQmdPN0FVd0lMV2JUc0VRc0pvS2YzOG1oSTJn?=
 =?utf-8?B?NG9vbTJZWEErL2ZNRm9BUXB6aEtuVjRQOTVTWm4wVHphMzRCNGNGTjNoUmJa?=
 =?utf-8?B?OHdhaGVsWjhxQTg0dEZNRGdUUWFobXhOK1dZSHIxNFprblY2dnhhbXRvTDFB?=
 =?utf-8?B?czVYSDRBZ2FJNTRxNFRwYmxpejlIaEp6SFRMckhnQjJ5a1c2Zkp0RDRJcTFj?=
 =?utf-8?B?VER5djVxSTQ3UUcrSnJ3R1BMd0xkNW93YmFRc1UzQ2dvZEFYczQ5SG9BY2xC?=
 =?utf-8?B?TGVSc3RKbjBVbHpUMjdjK0ozOTR6STZFejg1T3hWdHFsWklhV2tSODJ5V3pr?=
 =?utf-8?B?cXlSd1VVMGV4VllCYmdlYWcwdnFKQ2RpUDFpaVdkd0U1b3ZzQTZZWkVlMGNZ?=
 =?utf-8?B?V0d2a0pjOHFSZkluN2hWNW9BSXcrbzhEUWZCUGxpL1FHZXpPQXZGZTBkcWZp?=
 =?utf-8?B?aWN3MFhzcXpQQy82ODZHOG9xQ2VOQ3YwWTZoVnE0aURMbUVQVVl5elYzdlNu?=
 =?utf-8?B?MkVmSXhzKzZ1ZWZxbUYreG5Ka2JxNEo3NGszb3BaZGV6WEZnR0tGZCtXcndw?=
 =?utf-8?B?UkpILzVRWXRDQjFEVzlDOWdIYnRzQ1h0M2VORzJFaTZiL3FuTkw4NlhQdGtu?=
 =?utf-8?B?MHh3NjFlSnhQNEt2SE5NOThCY3diS1FhTU01OFUzam5KUTJBYzJiTkhLNGs4?=
 =?utf-8?Q?22lg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2580eb-8807-41ee-0345-08dcafe3db72
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 15:33:55.3865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVzqZ318TAZGFFnn4BA7asSQwitZBUL7oDAIwigpDbBSwOL4ucDhx9Zm/bnfTToe5qTEzTR0eYPLZYWudYMarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhhbmtzIEpvc2guIEkgcmVzb2x2ZWQgdGhlIG1lcmdlIGNvbmZsaWN0cyBhbmQgc2VudCB2
MSBQUiBmb3IgcmV2aWV3LCBjYW4geW91IHBsZWFzZSBjaGVjay4gU29ycnkgaXQgdG9vayBzb21l
IHRpbWUgdG8gdW5kZXJzdGFuZCB0aGUgYnJhbmNoZXMgYW5kIHJlc29sdmUgdGhlIGNvbmZsaWN0
cy4NCg0KVGhhbmtzLA0KUHJhdGFwDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBKb3NoIEJveWVyIDxqd2JveWVyQGtlcm5lbC5vcmc+DQpTZW50OiBGcmlkYXksIEp1bHkgMjYs
IDIwMjQgNzozOSBBTQ0KVG86IE5pcnVqb2dpLCBQcmF0YXAgPFByYXRhcC5OaXJ1am9naUBhbWQu
Y29tPg0KQ2M6IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8
QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGlt
b25jaWVsbG9AYW1kLmNvbT47IFNpcXVlaXJhLCBSb2RyaWdvIDxSb2RyaWdvLlNpcXVlaXJhQGFt
ZC5jb20+OyBTaGFybWEsIERlZXBhayA8RGVlcGFrLlNoYXJtYUBhbWQuY29tPjsgQ2hhbiwgQmVu
amFtaW4gKEtvb24gUGFuKSA8QmVuamFtaW4uQ2hhbkBhbWQuY29tPjsgTGksIEtpbmcgPEtpbmcu
TGlAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBwdWxsIHJlcXVlc3Q6IGFtZGdwdTogVXBkYXRlIElT
UCBGVyBmb3IgaXNwIHY0LjEuMQ0KDQpDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBm
cm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBh
dHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQoNCg0KT24gVGh1LCBK
dWwgMjUsIDIwMjQgYXQgNTozOeKAr1BNIFByYXRhcCBOaXJ1am9naSA8cHJhdGFwLm5pcnVqb2dp
QGFtZC5jb20+IHdyb3RlOg0KPg0KPiAgIGFtZGdwdTogVXBkYXRlIElTUCBGVyBmb3IgaXNwIHY0
LjEuMSAoMjAyNC0wNy0yNCAxNzozMzoxNyAtMDQwMCkNCj4NCj4gYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+DQo+ICAgZ2l0QGdpdGxhYi5mcmVlZGVza3RvcC5vcmc6
ZHJtL2Zpcm13YXJlLmdpdCBhbWQtaXNwLXN0YWdpbmcNCg0KSSBkb24ndCBoYXZlIGEgZnJlZWRl
c2t0b3AgZ2l0IGFjY291bnQsIHNvIHRoaXMgZG9lc24ndCB3b3JrLiAgSSBmb3VuZCB0aGUgaHR0
cHMgZXF1aXZhbGVudCwgYnV0IHRoZXJlIGFyZSBtZXJnZSBjb25mbGljdHMuDQoNCltqd2JveWVy
QHZhZGVyIGxpbnV4LWZpcm13YXJlXSQgZ2l0IGZldGNoIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vZmlybXdhcmUuZ2l0IGFtZC1pc3Atc3RhZ2luZw0KcmVtb3RlOiBFbnVtZXJh
dGluZyBvYmplY3RzOiAxNywgZG9uZS4NCnJlbW90ZTogQ291bnRpbmcgb2JqZWN0czogMTAwJSAo
MTcvMTcpLCBkb25lLg0KcmVtb3RlOiBDb21wcmVzc2luZyBvYmplY3RzOiAxMDAlICgxMy8xMyks
IGRvbmUuDQpyZW1vdGU6IFRvdGFsIDE0IChkZWx0YSA5KSwgcmV1c2VkIDIgKGRlbHRhIDEpLCBw
YWNrLXJldXNlZCAwIChmcm9tIDApIFVucGFja2luZyBvYmplY3RzOiAxMDAlICgxNC8xNCksIDMu
MTUgTWlCIHwgOC41MiBNaUIvcywgZG9uZS4NCkZyb20gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9maXJtd2FyZQ0KICogYnJhbmNoICAgICAgICAgICAgICBhbWQtaXNwLXN0YWdp
bmcgLT4gRkVUQ0hfSEVBRA0KW2p3Ym95ZXJAdmFkZXIgbGludXgtZmlybXdhcmVdJCBnaXQgbWVy
Z2UgLS1uby1ncGctc2lnbiAtLXNpZ25vZmYgRkVUQ0hfSEVBRCBBdXRvLW1lcmdpbmcgV0hFTkNF
IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29uZmxpY3QgaW4gV0hFTkNFDQp3YXJuaW5nOiBD
YW5ub3QgbWVyZ2UgYmluYXJ5IGZpbGVzOiBhbWRncHUvaXNwXzRfMV8xLmJpbiAoSEVBRCB2cy4N
CjIzMWJjMTMxNmRhNjA4ZTk1Y2VjOTE5ZmJiYWJmN2M1ODdiOTNiNDcpDQpBdXRvLW1lcmdpbmcg
YW1kZ3B1L2lzcF80XzFfMS5iaW4NCkNPTkZMSUNUIChhZGQvYWRkKTogTWVyZ2UgY29uZmxpY3Qg
aW4gYW1kZ3B1L2lzcF80XzFfMS5iaW4gQXV0b21hdGljIG1lcmdlIGZhaWxlZDsgZml4IGNvbmZs
aWN0cyBhbmQgdGhlbiBjb21taXQgdGhlIHJlc3VsdC4NCltqd2JveWVyQHZhZGVyIGxpbnV4LWZp
cm13YXJlXSQNCg0KDQpUaGUgbGFzdCBjb21taXQgZnJvbSB5b3UgaGVyZSB3YXM6DQoNCltqd2Jv
eWVyQHZhZGVyIGxpbnV4LWZpcm13YXJlXSQgZ2l0IGxvZyBhbWRncHUvaXNwXzRfMV8xLmJpbiBj
b21taXQgMzNhOTUwODI4Yzg3NjQ2YzgyYjZiNzE1ZWQ5NzBiYjM5OWFmYTFiNA0KQXV0aG9yOiBQ
cmF0YXAgTmlydWpvZ2kgPHByYXRhcC5uaXJ1am9naUBhbWQuY29tPg0KRGF0ZTogICBXZWQgSnVu
IDI2IDExOjM2OjQ4IDIwMjQgLTA0MDANCg0KICAgIGFtZGdwdTogVXBkYXRlIElTUCBGVyBmb3Ig
aXNwIHY0LjEuMQ0KDQogICAgRnJvbSBpbnRlcm5hbCBnaXQgY29tbWl0Og0KICAgIGVkNzAwZDFj
OTI5YThkNjRmZTU2OWU5MDFiYWRhOTU2NjhlMjFiYzMNCg0KICAgIFNpZ25lZC1vZmYtYnk6IFBy
YXRhcCBOaXJ1am9naSA8cHJhdGFwLm5pcnVqb2dpQGFtZC5jb20+DQoNCmpvc2gNCg0KPg0KPiBm
b3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMjMxYmMxMzE2ZGE2MDhlOTVjZWM5MTlmYmJh
YmY3YzU4N2I5M2I0NzoNCj4NCj4gICBhbWRncHU6IFVwZGF0ZSBJU1AgRlcgZm9yIGlzcCB2NC4x
LjEgKDIwMjQtMDctMjQgMTc6MzM6MTcgLTA0MDApDQo+DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
