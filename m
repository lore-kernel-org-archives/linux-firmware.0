Return-Path: <SRS0=omt3=WF=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513D1C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 07:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C06FC4CEE9; Tue, 18 Mar 2025 07:08:49 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10A34C4CEDD;
	Tue, 18 Mar 2025 07:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10A34C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRt4cd4FlWqwsQv1JuUMWgCyjoWuzItbPLu7U1g43Hu4cGwWXLTvOLygiA42zyZmQC6jq199lcXgscJ7L0snmvcmjm3gIP8kU+Gui4I+oadUPZJmgBtR/AG1ebRA5/l9p2304Nq9uQEKC5T7nSLvO7g91hP0iIlhffK/Z3sXZOnP+66ty3v3rni5tTleJhpCuMhUzdUJ/jchaQ7OGWNAwdPOPqLASxgyWt3lnPTtRI826EBPomEn/+Ixh37MDJNPEw3maGSoRoDIsH4npxkBZRbEUFC3WN3DDZIUepbA6rb/wW8nC6p0hl+bKdehsBrdwlRhQgvqh8yFk30oKyYB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgl5fI6yAVuepVi766AKklQ5YtVIOJ8aCeWuaDjDeBc=;
 b=SgOULcnhBLynL0+g1uI7B7pn6F7Lok5E/yJsfOBCJKEQnzXzTkfUEBsdIB926Ao2u+8Vi/NBVFkT6YU3Iswqu5uLIm2xj4yN+T3aUvA0eiYfXQm3Wf8k9lahYNfaZakLgKawfhOZJ3UEM2lIRS045C0nk26q6vBq+rPaDBxuyx9B5Yi0v3pYXgmegCfjCekltaO6YBKXBliIwIsGTCofpxory7S/+t3Dx9ztGmzHjDzZ4nE7l3atF9gP3iSgFIruap3s8iZqQs3d+NOHmOdZqX+hrnF6iqZTjLlIpimamaTKCX99ARgFoqkaL1y2PVyhgfb1+krHtSyDGU60ceyB/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgl5fI6yAVuepVi766AKklQ5YtVIOJ8aCeWuaDjDeBc=;
 b=OAFyg4GY0brtyFVPuhNma+WEoBqgukJRyjmH9IYAA9KlEAGU5GZxwTGO9sS8Aq3v3kKAHibgoH1DGvf75FYF1Sjbw6jmhyYOZCwIgIF3/4xBzIfPwIcxSZcMkZQTKcpezba8RrtfT/mMKNQ0vfJnzgK1+a5WhVDCYHOIOYyasXUU0z7lZAON0JGClCldGoDtMx4g87IQZ9JpVyiZIKpiTvLqIOQFpZdW3WqVmhN6NPYHorkYcX2NiY1xNtH4xExd4/dMkTt9LyrocbKwuaVPuXKBOhF8BRAaZkD+wEylQ8e257sN+8JnbGMteOEAO+w5KZPn5WJL9XO3Ari1eUsB3w==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 18 Mar
 2025 07:08:43 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:08:43 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "maxim.cournoyer@gmail.com" <maxim.cournoyer@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "superm1@gmail.com" <superm1@gmail.com>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Topic: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel
 is installed
Thread-Index: AQHbl3E/LZPz6mXuKkmA9mfPHiaatbN4cv6HgAAHSYA=
Date: Tue, 18 Mar 2025 07:08:43 +0000
Message-ID: <f5beca4503c46772ad65a8485757f0c700b0192b.camel@nvidia.com>
References: <20250317191606.64181-1-ttabi@nvidia.com>
	 <20250317191606.64181-2-ttabi@nvidia.com> <87h63qyh4l.fsf@gmail.com>
In-Reply-To: <87h63qyh4l.fsf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: aab6424c-3d2b-4bac-a6e2-08dd65ebb827
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGV1U3dFM1J3KzkvUVFlQmFIVXA4RWpVOUZPNG9MclpxcktidkJ1ZDR6QjFU?=
 =?utf-8?B?dzhvWi9oOGNNbzdGUnN0WllJRTRZczE4Nms4QSs0UHlucERaQVJKK0d3LzJT?=
 =?utf-8?B?eWRqQkVpM2VJWFVuRXcrdGgwZUk4VkhJZzB6ck93dnVVeVY5ZXpYZUJDYXBB?=
 =?utf-8?B?S0R4SXRSRE01ck9qRUsrdUtkdFMrUGhJb1pPT00rSzlIN2NMSkFFeGVncktu?=
 =?utf-8?B?VWwrTkM2Mk11T0orclhEbXJOUk96dHM2YWtEajBuQ1diYXU2UzUydlNocFhL?=
 =?utf-8?B?eUVnUHdPcml3MlIrY2ZNMUVsZEtDNGM4aVhuakc4M0tsRzNsL2tjQjVLWUti?=
 =?utf-8?B?NjloV1NFMlRacHJPd1Vabm9tNGpWTXpGSUtCUzlkNytkUkVXUjlBdkdWbzA0?=
 =?utf-8?B?Q0pFbmtPTUdITFdycE1idnBUaCs1S3FTaDBIK3pYSnVTVTFuNE5JQ3lvTmhi?=
 =?utf-8?B?aGdYSjMydG5obDBiK0kxZmZwUlpkUWYvQmdycE9kenI2anlCR0s0eXhaUGww?=
 =?utf-8?B?NExrNXJsemx0Y0xMUmhLZTVGUWdQKzRrVVR0UXpXVnlpZFhxMjIvZkhwT1hz?=
 =?utf-8?B?VWpPTE91amZYK3ZEcG1oOVFUNE9VbmcyQkdtcDAwalJLditBUWc5TkhHQkF3?=
 =?utf-8?B?eml1NnYxTUtCZVFWdlo5TUZybG9tTFVxTGZqcGdOY1lJQ2R6djY1SDZyQVRy?=
 =?utf-8?B?dEczTTlMWnkvNW5iNHBvMHV6elRzV1JmcDloK2pyUVhIMzhZbytSU0wvRVRi?=
 =?utf-8?B?TWRFMVFhNUlrT0JGT3d0aTRxemhuN3o4NVg1YUhvWHAwSUhtUjJwREFTUTFn?=
 =?utf-8?B?Q0hpTTA3S2k5Q1ZhK2plYzBsSVRTMDhnV3Z6R2Qzb0cvNWl5czZKRERLVm1X?=
 =?utf-8?B?QW9DelVNK05GcTNrazVqQ29ENDF6cnpTK3NBQ0pDZW5aenlQWE00aFkyVFJk?=
 =?utf-8?B?SU9SYzZ2bWI4VnBldVZjZVh0YnJNMFhKaENheDdhVSs0T216MUM1SSt1eWU4?=
 =?utf-8?B?ZTFiczYrL21vczdxNm5HWEhxenhmczNRM3gxcXk1Yy90QVJqMWdGdmRZREg3?=
 =?utf-8?B?eFNSYy9JcTlpN2pseDBHUGJtZGxLM2ZEcGxObmRXc1ZRcnpBRWpkWHdML3dH?=
 =?utf-8?B?NFMwa2JCMHRkcldJYVVhLzhHRkRkNm51anpzcXZFUEtMQ2piUktPQ0YweDZJ?=
 =?utf-8?B?NjNBY1JZN2hsT2E2L2dZZjRoT1ptVU02YnhBTkFITkhxU0pGdTBIVWgzYk0y?=
 =?utf-8?B?dzVHNXZxencrRFNEL0M5bWNOS1grQUVENytLMkg4NkdFbjVPRlVHSHJwZk81?=
 =?utf-8?B?TXR5V1NoWGpzOXllViszYitSbFRzSzlSR3lIZ0doMlVVK1dVQ3lBNDNOLzZB?=
 =?utf-8?B?Y3pKTndJZmRNREFyakZRS1BIMjhRZFRXa2NtNnhQdjRNamhBNXRZd2ZLWnQv?=
 =?utf-8?B?enA1TjJRZVlabjN1aVlmR3hqbFhPZ1lMbU55ZE55SjVhRnNqbElLTXYrTDh6?=
 =?utf-8?B?SGRic0dtWGpDL01sUGk5NG1SZzlpbzhjUkZnckJpTUEvK0NuTy96QisrdDc1?=
 =?utf-8?B?MUhrM1NZK3NtR3I4bExMQjl2NXR6OVlpczBFNThUZ3NPazdYRUNGeGJwQ2ty?=
 =?utf-8?B?L2Y1TWpKRytGeVpFNEkxclZhbXZVdXFpNHZiVkFqNitpb3NvVVk3bFlEVG9T?=
 =?utf-8?B?NEJKa3hZdVA1VnNRaEYvT3pSR2NTeCtFUVllQ1UyMFJqMkZzVEhwWml6bldS?=
 =?utf-8?B?TlY2WEo2OTRhTmJSTGJvU3FyK09vclFZN1p3OEcwTHQralI4Mmdib2psNGFS?=
 =?utf-8?B?bFhJc0lLdTVXbEw5RllyeHVBME1QNEZSbjY4Z0xrYytLQmUvOE16ZkRLUUZ3?=
 =?utf-8?B?L0l2Z1FLdFJ1NDA1Rm1SZG5DYTY2cmtwRFdNMUNESGhrSFo4Q2dMaTJmYkEw?=
 =?utf-8?Q?pVRd2x6VdLLE/GbqAfVr/7tcU5+UAIDU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDk3b0RYTno4Rkc1KzQrbXRpQzJTUTJQTVdDa0w1b29SMTN0TiszMi8zbGFT?=
 =?utf-8?B?REFzc0d2VUl6aC80QWYrb0xVNm4rekM3QW11OWV4dTNJZzZWQ2svS2JvcStP?=
 =?utf-8?B?WWEyNFJ2S1dVZG9FeERUL1UvSDBSc0JWNDBEWUt1SjFTczgwZTB6TkxRRm5G?=
 =?utf-8?B?R3lDMmRPY2hxQlR2M0QyeUs2ZW1jbG9ma0dnaGpqZ1VhRG1BU01wcFFaRWpP?=
 =?utf-8?B?bEpVbGlUL3ViK04zclJ0dFk5YnZPajlYVTNzWUVwa3lpWUlVYkhwWG81N1N5?=
 =?utf-8?B?SE9tc0Z0U0ZrZy9oZHlBdjllK0RDTjc4VFNTMzBTMDdudTRBWUpQSm9mZk84?=
 =?utf-8?B?NlcyUFlCTDJwNGV5OXJzUHhhbU5md0tFeC9ad0JtMGZ1dVJPUkVYbVI5V3ZE?=
 =?utf-8?B?SzRNa0M0N056K0w4V1FMalh1Y3Rxci9vN3pCU1lONkFpOXdPeStLY3ROVFU2?=
 =?utf-8?B?V2xMNzdJUlpuUnc1T0JLbXc2ck9zeDlMVm1lSTFRYjhSNFBrdTN5WFFnekQ1?=
 =?utf-8?B?RFNYam1DZFZRZjdaaGt4WnQyakNCNGtUM04wdWlXZVUzMk0yL1A2Y1Z1dnZM?=
 =?utf-8?B?eVpqekFNMTdVcEdzdUtHaXphTng3MWZMdkdLVHp2MHhlUmc3dXZ3bEF0REhy?=
 =?utf-8?B?M1k4YnBVZlhzUDBPdEVEcEpDcGRGNDUyMG9NQVFWdDZveGp4U3l6T29jU0h2?=
 =?utf-8?B?NjIrWTJLOGtFdjQ5RGxCdTdFZXhoeDlyNGNKUG9zb3I0MzhwYXYzM29lNGtJ?=
 =?utf-8?B?R0xyN0dZVmdWbEc5TFRhS3FSYm10RndQTUNnSS9IMUtUYkVqSEoxcVFtNVhl?=
 =?utf-8?B?MTJadnhXRTBtczd4V3d6amNrdlhsZGhnaGw2eFM3LzVpRlZJcmtaS20xdlY0?=
 =?utf-8?B?WDY2ekgyMHZLNllPTUg3bWgyZnV5b0x6b1hKQjJ5VDE1bFIvMXVKRVBiblVv?=
 =?utf-8?B?YzFNdUpLckVmSjNBUGNZOWg0TTl2SG91V1VndUZMQkRHakV5RDMyWGxQMmd3?=
 =?utf-8?B?ZGVzQlJ5TythSGtueEl3YkNQd2N1RTRXMUczN2lNV2RYeUVnRm5mT3M5TmVs?=
 =?utf-8?B?ZTgzM2NqV1RmRGlKZ2x3cHZKU2YrUmZrVmhIbDVtenZva0h4RWZERGZ3bEZj?=
 =?utf-8?B?WVNDcE1yTGpnNHBnUy85NUNVcWxKSGVBYlhyc002UXVJdlZkeEFhTW5RNnor?=
 =?utf-8?B?MUtnMmZKaXBTNWZ2QmFraXNHS05GRStMZnlFVS9SeTFSdytjdW1WQkJoN05Q?=
 =?utf-8?B?WHNLUzB6OWkwRnhNMlJURFVTelE3VkgvOUxVZFJvNjRNNEdmSmx3Y1dRdHFJ?=
 =?utf-8?B?dmFjUHR3UnA2enRDK20zME42ajJmMjZBNTNtL1UrNjR2NnFWUmdyTUtHRWta?=
 =?utf-8?B?OVVGcTZKRkNpUHEzQUJPd24zdnFtZmxwdEFCN1lLNzJtYWlJS09rVDJ0YXdq?=
 =?utf-8?B?NkM0eHRManJvcm5Ydm1kajFZbkZGZlE1SmdKaVFqNlplL0Vxa2RGZm96aGxX?=
 =?utf-8?B?ZEpHTWFZRlRkU0hMT013WXJ0LzE0dHFzY05YZlRMSU1KdDVPUThHUzZVY2NL?=
 =?utf-8?B?bUVhL3h4TGNoSWNPMC9nc2Z2Y0dPM2tCTzJiVFN1QU05T2cvUXpkbW9kZzhX?=
 =?utf-8?B?dlZJdEFiNGVEOG1UaG1IZFU1MzFncjdDeHlPOEEyRlkxN0VGM01uWXpjMVIv?=
 =?utf-8?B?N0tWbXl3MFFIODRGcHlXdzdsZFdOVk9nYXRoNlRXdExCbGdJWmoxa0d2dlNN?=
 =?utf-8?B?ZUJtMmlTTjhNdjYra0k0WGpHQ1BibEFld2gvQzBvQURpL210ZWJESURRb3hZ?=
 =?utf-8?B?Y3dsMlZmNEhzcGZaN204d0d5YS82T0x4ZUk3bkU5TjB3R0NoT2VjSUpLMk92?=
 =?utf-8?B?dVE3Mnd0cVd1V2lYM3Y3M2licExoVHh3bTF2TmkyUlBTakxiWkZzQ29qYTFa?=
 =?utf-8?B?cFl4dGxubmpzOHNqZ3Q4RHQ0cHFKOHVGdDhlVU5NMDIwVlBiTFR2R2EwOFJF?=
 =?utf-8?B?Myt2cXNoTXVWcU1kOWF4NGFXUnFERkNsUG1Md3lvZm53RzNHcEczZ0ptRHM3?=
 =?utf-8?B?K2FqRWk4N2tqamc2WUlKQ29IY1ErKzNzN2xqd2VsZEZDSEU2OEpzRG4zeUFE?=
 =?utf-8?B?LzRObmttNjFZeERGSHF4dFJpbWFFRk1YeHhES3VmV1VBV1FwU1FUa0JCUGZ4?=
 =?utf-8?Q?gDLmIbP0P4WN/rsZPCqZFvcTkDRfM4mJuYNdRDwuNzRE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C085BAB5A66D64EBFF16A29C0726E6F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab6424c-3d2b-4bac-a6e2-08dd65ebb827
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:08:43.7638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kqz+V4cEw0x0KEvmeYY6/ExcGHyudbw+BdbdP7fDNdHYh+HPnG8pFERffsmcdMdBERXS1Le8bl1Y+RbZKtO7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669

T24gVHVlLCAyMDI1LTAzLTE4IGF0IDE1OjQyICswOTAwLCBNYXhpbSBDb3Vybm95ZXIgd3JvdGU6
DQo+IEkganVzdCByZWNoZWNrZWQ7IEkgZG9uJ3QgdGhpbmsgdGhpcyBjdXJyZW50bHkgd29yaywg
aXQnZCByZXF1aXJlDQo+IGNvbXBsaWNhdGluZyB0aGUgc2NyaXB0IHRvIGFjY29tbW9kYXRlIHRo
aXMgbGVzcyBmZWF0dXJlZnVsIHBhcmFsbGVsDQo+IHZhcmlhbnQsIHdoaWNoIGlzIHdoeSBJIGhh
ZCBvcHRlZCB0byB1c2UgR05VIFBhcmFsbGVsIGluIHRoZSBmaXJzdCBwbGFjZQ0KPiA6LSkuDQoN
Ckxpa2UgSSBzYWlkIGluIG15IG90aGVyIHJlcGx5LCBJIHRoaW5rIHlvdSBtaXN1bmRlcnN0b29k
IHRoZSBwb2ludCBvZiBteQ0KcGF0Y2guICBtb3JldXRpbHMnIHBhcmFsbGVsIGlzIHN0aWxsIG5v
dCBzdXBwb3J0ZWQuICBJJ20gbm90IHRyeWluZyB0byBtYWtlIGl0DQp3b3JrLiAgQWxsIG15IHBh
dGNoIGRvZXMgaXMgbWFrZSB0aGUgZnVuY3Rpb24gcnVuIG1vcmUgY2xlYW5seS4gIFRoYXQncyB3
aHkgSQ0Kc2FpZCAiZmFpbCBncmFjZWZ1bGx5Ii4NCg0K
