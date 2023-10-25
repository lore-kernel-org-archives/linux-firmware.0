Return-Path: <SRS0=xzLE=GH=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F5C25B71
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Oct 2023 04:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52EE3C433C9; Wed, 25 Oct 2023 04:29:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFB5EC433C7;
	Wed, 25 Oct 2023 04:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFB5EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698208150; x=1729744150;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fni/4q6r1q9trwoAKXJUHO16h1gmMQH9DDKIddHddss=;
  b=HWB7RooBlY8+aocptbV9tfQxqQpmDQ1QcH/+LLCc39Ry0WXD//BcVkiZ
   vhSbsaGf7rAG9AhBy1l1PxmCZGHTx3Q3lDAj46V0t8Bgu3xlqKhOSpukJ
   fW0d87S382NmUq+/MosSwXX9UxCllEby2VklJVBl9uJ5n+1VdLrb2nK8W
   NwKAqJvAllyA7WIJRO5CIQSOrD7wOqNMoj37NBURRdR24j4Pc3KQQ1YEi
   StuRTPYbB6SJnKtvYiw7nNQ1mFFnmU++FQj63YNg4Ph8HoL8CNgyyznyo
   WTO0L2Z7VeSNWKwrucxgtZYlZHBZFZmvG/us1SjlD6lkF85Qt83YkJuMT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366581633"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="366581633"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 21:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708572252"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="708572252"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2023 21:29:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 21:29:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 21:29:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 21:29:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ2/8Fa9gDhF3EgFdmlcgtrvB7iOyWivsv+/J7+d7Gxa+u5RxMh5f3YIO56QW+aX0vxIlmdR4ThyHRJlgVvSIp+IGrGT6QYw7Lf1qc82ibrf1i+qqNPWLJ2mJ7iEHjjEIWFziuJA3V5LFQQOznBZsVT6zK/j17mobiJnyKYnxShgqmODzXZmJ5GX6VBp4lI6l1WXZWC9G4QkZB5GAzwstGpBq+U3p9sCpLniuWbJofot4gshOplFD5XtyZR7BHjZc1IHcYTIuKvQRNsidulqxJLKr9sK039pjiDDTC/7dAI7SkwOrlBQbvdGSyY8BbhxfK1/FB4YOr4s7dY2/sm2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fni/4q6r1q9trwoAKXJUHO16h1gmMQH9DDKIddHddss=;
 b=A+ql9Y9yzx0/bvEPowG77H89zL+Yr8e87yGs9j6VFa5GtAql7TpIOf5DGhEmu/r397jzkfTtxEM0nctEeE16CPPhrfDaL2Gt8xu6ZK6wUL/VCzw+FtNi9+8uEh85HLGZwjpTi3Y43vvZ36TOiZw5rN4Et/bZCDZcr2/P2sSdGYq3WqrUC7w+RhiywHnH2tsKv4cAfWJpBQ5YsRPDBxeI0qgGkBqjIS8od/NrpgwhqWKBv8kLZs+eIKleFp+hpjlnD6Hr/PSCTs087DH+dpOmwBQLr83YcEYZFzklU2+9NruvqvlrHkH4ZPBzlnqqfRTO53volSWPEeO2/U324KPGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 04:29:04 +0000
Received: from PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b2ae:35da:9f43:ee59]) by PH0PR11MB7585.namprd11.prod.outlook.com
 ([fe80::b2ae:35da:9f43:ee59%4]) with mapi id 15.20.6907.030; Wed, 25 Oct 2023
 04:29:04 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Srivatsa,
 Ravishankar" <ravishankar.srivatsa@intel.com>
Subject: RE: [PATCH 2/2] Intel BT: Update firmware file for Intel Bluetooth
 AX211
Thread-Topic: [PATCH 2/2] Intel BT: Update firmware file for Intel Bluetooth
 AX211
Thread-Index: AQHaAZV9OygaDfvlOUW6cRR+iZCfYbBRAegAgAjwjIA=
Date: Wed, 25 Oct 2023 04:29:04 +0000
Message-ID: <PH0PR11MB7585DCC79134F9F9335DF061F5DEA@PH0PR11MB7585.namprd11.prod.outlook.com>
References: <20231018074559.445468-1-kiran.k@intel.com>
 <20231018074559.445468-2-kiran.k@intel.com>
 <CA+5PVA5uijGVV3f27UL1Yt92fcWHEvZ-3kdALFsWO1ZwX-ix6g@mail.gmail.com>
In-Reply-To: <CA+5PVA5uijGVV3f27UL1Yt92fcWHEvZ-3kdALFsWO1ZwX-ix6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB7585:EE_|SJ2PR11MB7503:EE_
x-ms-office365-filtering-correlation-id: 7663faf3-120d-4bbd-10c2-08dbd512ebcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwuq7vTvCVGBQg1Ugheu7hXU7YI2GPNvem7fuYZt6gtrW6Z61ABbKkwikyeMYxPwVXPnkdbyiH8S0+7YWnz7RM1tNxY1c7FlUgDRYZfD80hJt7roSXBhaYPlSVk6NkGB4dZovFdtMXSF6wwpPicYjiSLQXe3PRKBP9Vl8KoEALnkhvipD58hmcg/FyMkPv8wD6MamoWs+r7RIZOUwS7hHQ6IQYY9s6BfxSlIEC4h0NUIgXOcwy4Fsk1w/pgIoXZnLro6JT+oL8o069Ydp1bb+sQXfQaZ0B7ZFizcXIf6tz8T1NYibJiHZPayT0/zuspBbIZefgPouaKsEiAGfmiro9k7iduIUNHbTjd2dxWWSkDHw3b1xS94na7icTeZQBdRK/L1AYqZEIrgevdMPub86fQlNkCu+qvuSfHqCwNBZTUnMzuIhEVxmcnSxiRPrUtvMn54BzQv+8nh7rTraMwC/XE+NhiWK30zVpVdZYT9oJ+dtXjdP897UxGBtyYScgpnxe8j4hcJe/OaalXnK6VqugCXwVNLQMKKyPUVaeYtMCkAtBR1YIhFw5KeZ8kgTzDjgsGlbGgdD91RyiGvuAzKzJDPUfazKQfGlIPXpzCzB+rDvb4uOXeHfW9fXlatAfbf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7585.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(55016003)(83380400001)(71200400001)(19627235002)(5660300002)(15650500001)(64756008)(66556008)(76116006)(41300700001)(86362001)(66946007)(66476007)(478600001)(6916009)(9686003)(6506007)(7696005)(54906003)(450100002)(66446008)(316002)(33656002)(2906002)(4326008)(52536014)(122000001)(38100700002)(8936002)(8676002)(53546011)(107886003)(26005)(82960400001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cU5HUHFia2lXTkRWM2d6djdRT092azNlRU5JWXNuUXZUY2M0VjBTWlhPOU1u?=
 =?utf-8?B?Snd4RlQ0ZDRoRlhVSy9Jdm4xVU8xa082RHo0Tlh6cGVGa1BSLzhSWjlzRjhZ?=
 =?utf-8?B?Y1FPWFV6MWVLZUlHYnRjb1JlWFdMdHJXK2JnZkYvRTlOc1RQdVNkWW54Nmxi?=
 =?utf-8?B?L1JrQk0xeGRxbitnMytGVWpJNjEzK001MGNhcWE3emRGay9uUTVFdkpGaVJG?=
 =?utf-8?B?ZXdJUW9jV0pUbmladHNyY0VCMkpSdEZlN0YzSUkwcjVVWnI5cXQveVZMMTU5?=
 =?utf-8?B?RktPS1I3ZjlZQ0U3dzJtWGs4WmIxQ2ZPYW40ZzBvQi9Dc2NkSVJxSkZTTXNp?=
 =?utf-8?B?RmR4UnB6ZVN0VEFEZXo1endiM1FlcFBBRDJ2Wi9XeG84RHYvSHZIK1VLTUtF?=
 =?utf-8?B?TWZRVDRuS0Npaks2c24vOWRnUk0reTlYbzFaU080V0k4d0lZYnZQUVAzYjhv?=
 =?utf-8?B?enQ5aE0xWk1Ibm91YzdPeU9CRDFnVUdkTEwxNDUwWGlSdjYyNFpFMFlTK0F5?=
 =?utf-8?B?YVVrekc1YUhRYSs5MjJDanFCWW1sVWtqVnQ5U3l1blRSRmNLMXk5dUlEc0Ra?=
 =?utf-8?B?NzIrQ3dJM0R6L1cyc1piTUJGdUhDVEtmOVMvSmhlMTFrTEJOZ29EV2NBK1Nt?=
 =?utf-8?B?RjFtZGNNMWVucEEwVFcvVUVNcUR4ZVJsMTZqbzRvaXY0YkxBS2l5UmNGaDV6?=
 =?utf-8?B?aGZVbWxyWEhOcm1lR0JtMjJaNSt4VVI4UzQwb3h2K1EvWElkTWNRS1U1L0Ru?=
 =?utf-8?B?N0VuU0RidGJVZmQyVlVsajVtMXIzSlI5RU92VTBrT3hJZTcvbmJoekVKNjBQ?=
 =?utf-8?B?YWF1WUZVUVV6cUwybVBuUmkvemwrc3ZxRVd5T3QycGIwbUtRSnBhaHhkdDlx?=
 =?utf-8?B?ZjhGOEFObVg0anpySXh0OHNpK011OEIvY3VYZGNUVmFHelZCUFo5OW5ielFG?=
 =?utf-8?B?SzZ2ZGFaMmlPQStSZWVhU0xGbXpLTnFEcERSalhwN2FhYURZR1pXVTVNd3hn?=
 =?utf-8?B?Y0ZMNnhQMDBBek5JajQ5RTJBZzZocXNOV3VhTjRzNHV5OHBGL0ZKYUlnNDlj?=
 =?utf-8?B?TTcrb2x3bkVTTlViaFZZZnJaV0RxeFhaL2FucjR5NU4wZWFXYUxOK1JqQUNC?=
 =?utf-8?B?K3haMVdTN0lZS3lHZzF2N0crNWhKalQ2aEpXZ0VObVpOTTdqcitWdDdzNUJw?=
 =?utf-8?B?OEo4VDJPcWx2U1NLT3BBTEY5RExUTzU4NXozNFZCSFRWN3FPNXdUMWJORHNH?=
 =?utf-8?B?SUNrVm9EQ2RjVWNSUVFSUHEwQVptWS9FcmZSeGprQUg1ZjYvZEhDaUs2cTQ0?=
 =?utf-8?B?OFl2OS9ySXcrYW1YTUdReWtUNGlZMklNd0VVSk9LK1d4aDg4T2FHbmJ5SThS?=
 =?utf-8?B?c1JJQUJtalRRVjZoKzYwTEpnTnFMZllrNXQwR2lkVzh5M3c1bmYwdVk0aFVa?=
 =?utf-8?B?VHJrdHRKRnNacy9MN3NFMWpUN3RKL1lJMU5qWnZxNUVCN2p2Rys4OTJ5VGdB?=
 =?utf-8?B?ODlvU3FFeEVaVzdzL3owak9FL2Y3Qm5TUEtIRnJiaTJSUjNHNlZsMXoyNjVw?=
 =?utf-8?B?QUYrQ0dnSVRTc0tvdjRheHhEblJvdHEwK2Fpc3p1ejU0MmptL2JTRmJDVTB2?=
 =?utf-8?B?L1ZjbmhNZDlwQUJlRmcyZjlKaXRKWHJQQVNlczk0bE5RUUFWQmhkd0hMSlI3?=
 =?utf-8?B?VGNjRGJnSjJuWDQvS3JrTkt1OVR1eDM4Smp2MFVPZVgrbEkybWxLU0p1L3p4?=
 =?utf-8?B?S2NFQnRxcWF6RHB1dklXdDh0djQ0UzIydW9yUWhIa2syYVJPN0U3ZC9wamdH?=
 =?utf-8?B?YWE1VDZRMlJ0bGllTmMwTGFxTEhCMVE3d0ZKeW9ObXpQdVdhd0FGWjFVdG56?=
 =?utf-8?B?bTRDc1ZSSzJVWnNxZEt3SDJEcXlGTmFHMFcvbFZaeWw0c1k0ZlFoSmh3SXN2?=
 =?utf-8?B?bkVydzU5TmMzOStIVVI1bzlFNUZ2TmlyMjh0MTZXaWxuejlSVHJHMldFeFpM?=
 =?utf-8?B?WjVvaVVnUGpSSW9PbkdIMGpnUjZZZ3pNM0t2NS9aZWxxa0Z5bjlDTFQveDR4?=
 =?utf-8?B?NXNFS0JSVi9hbWFMbUxOc1FNVWYrQjRGTlh1V3hCTzgxL0JOYkdENVYzbGRV?=
 =?utf-8?Q?xkXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7585.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7663faf3-120d-4bbd-10c2-08dbd512ebcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 04:29:04.4716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iy2+PjMwe7jEGFbcjxgu2TQGymaPmeu/omXUDgZnB+vP0+jG1vCRHf5P/Q3nc76rYjdY8fy9Sdo+SnMECIUtHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
X-OriginatorOrg: intel.com

SGkgSm9zaCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb3NoIEJv
eWVyIDxqd2JveWVyQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE5LCAy
MDIzIDU6MjEgUE0NCj4gVG86IEssIEtpcmFuIDxraXJhbi5rQGludGVsLmNvbT4NCj4gQ2M6IGxp
bnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7IFNyaXZhdHNhLCBSYXZpc2hhbmthcg0KPiA8cmF2aXNo
YW5rYXIuc3JpdmF0c2FAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gSW50
ZWwgQlQ6IFVwZGF0ZSBmaXJtd2FyZSBmaWxlIGZvciBJbnRlbCBCbHVldG9vdGgNCj4gQVgyMTEN
Cj4gDQo+IE9uIFdlZCwgT2N0IDE4LCAyMDIzIGF0IDM6MzTigK9BTSBLaXJhbiBLIDxraXJhbi5r
QGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGZpcm13
YXJlIGZpbGUgZm9yIEludGVsIEJsdWV0b290aCBBWDIxMSB3aGljaA0KPiA+IGlzIGtub3duIGFz
IEludGVsIEdhcmZpZWxkIFBlYWsyLg0KPiA+DQo+ID4gRlcgQnVpbGQ6IFJFTDU4MjINCj4gPiBG
U0VROiAzLjg4DQo+ID4gUmVsZWFzZSBWZXJzaW9uOiAyMy4wLjAuMTANCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEtpcmFuIEsgPGtpcmFuLmtAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBXSEVO
Q0UgICAgICAgICAgICAgICAgICB8ICAgOSArKysrKy0tLS0NCj4gPiAgaW50ZWwvaWJ0LTAxODAt
MDA0MS5kZGMgfCBCaW4gMCAtPiA5IGJ5dGVzDQo+ID4gIGludGVsL2lidC0wMTgwLTAwNDEuc2Zp
IHwgQmluIDAgLT4gODI3OTU2IGJ5dGVzDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW50ZWwvaWJ0
LTAxODAtMDA0MS5kZGMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGludGVsL2lidC0wMTgwLTAw
NDEuc2ZpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvV0hFTkNFIGIvV0hFTkNFDQo+ID4gaW5kZXgg
M2I3YjA5MDFkNTJlLi5iYmRkMzVhZWIwNDMgMTAwNjQ0DQo+ID4gLS0tIGEvV0hFTkNFDQo+ID4g
KysrIGIvV0hFTkNFDQo+ID4gQEAgLTM4MDUsMTAgKzM4MDUsNiBAQCBGaWxlOmludGVsL2lidC0x
MDQwLTAwNDEuc2ZpDQo+ID4gIFZlcnNpb246IEJUX1NvbGFyRl9HZlAyX1JFTDcwOTc2DQo+ID4g
IEZpbGU6aW50ZWwvaWJ0LTEwNDAtMDA0MS5kZGMNCj4gPiAgVmVyc2lvbjogQlRfU29sYXJGX0dm
UDJfUkVMNzA5NzYNCj4gPiAtRmlsZTppbnRlbC9pYnQtMDA4MC0wMDQxLnNmaQ0KPiA+IC1WZXJz
aW9uOiBCVF9NYWduZXRhcl9SRUw4ODkzOA0KPiA+IC1GaWxlOmludGVsL2lidC0wMDgwLTAwNDEu
ZGRjDQo+ID4gLVZlcnNpb246IEJUX01hZ25ldGFyX1JFTDg4OTM4DQo+IA0KPiBZb3UgcmVtb3Zl
ZCB0aGVzZSBmcm9tIFdIRU5DRSBidXQgZGlkbid0IHJlbW92ZSB0aGUgYWN0dWFsIGZpbGVzLg0K
PiBUaGlzIGNhdXNlcyBjaGVja193aGVuY2UgdG8gZmFpbDoNCj4gDQo+IFtqd2JveWVyQHZhZGVy
IGxpbnV4LWZpcm13YXJlXSQgLi9jaGVja193aGVuY2UucHkNCj4gRTogaW50ZWwvaWJ0LTAwODAt
MDA0MS5kZGMgbm90IGxpc3RlZCBpbiBXSEVOQ0UNCj4gRTogaW50ZWwvaWJ0LTAwODAtMDA0MS5z
Zmkgbm90IGxpc3RlZCBpbiBXSEVOQ0UNCj4gDQo+IFBsZWFzZSBmaXggdGhpcyB1cCBhbmQgcmVz
dWJtaXQgdGhlIHNlcmllcy4NCj4gDQpBY2suIEkgd2lsbCBmaXggdGhpcyBpc3N1ZSBhbmQgcmUg
c3VibWl0LiBUaGFua3MuDQoNCg0KPiBqb3NoDQoNClRoYW5rcywNCktpcmFuDQoNCg==
