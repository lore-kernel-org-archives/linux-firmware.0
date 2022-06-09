Return-Path: <SRS0=Hc6s=WQ=intel.com=gregory.greenman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3362C43334
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jun 2022 13:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A16E1C3411B; Thu,  9 Jun 2022 13:14:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 965C8C34114;
	Thu,  9 Jun 2022 13:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 965C8C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654780438; x=1686316438;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=eunjfsu8SWHCcKgwLA+CRHB7iEs5WPL2LdcdaaGRky8=;
  b=WxRzdLCrRd41NDZjjraWnJVdkoHh/Wo+mOelKnImuRdP8tsj5Ow/ohpz
   acomJHM11ClGFDKdYIuPpq4yLuESIuimGC+L8bYgFGVUqJBAQUP28ydDv
   0iOupe7xn/0ofCdnnej7+YISsHinqNlxXfZt9OnsKCExtuh8F3syRzcz7
   mnd6M2RvJ+ZfBm27tTuHNiEyf7oegdY3OwUUwAZky7fa0o7QIeUo9UtAi
   EX0G89zVmV7AVkmkT0Gko0JYpFPCqYiJDdQ9DlvI3PS4A6wdTw6Obs5w0
   UG6gQFJ5g0JeFxijP8IfExFmujvPUN9wFNHnhub9BNMQvV19FO0p+y9hB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363602969"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363602969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 06:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="555914483"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2022 06:13:57 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 06:13:57 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 06:13:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 06:13:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 06:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lv27xcJ794gcHeUmS5jkB1eM+VURLgVBXPA8icKXVVq+TfxnoBDme2ATccw3nZFObJ1YHvTlxBQFmxpt0FA4uhxV0f7j8oQ9oDZavIxf/U5vwccJ1RvbsFdf+IV2a4RL20zMB3mr+2tzq/3dQKxiQYPk6OsMGdJ1MVg07XaLbs7Zu3cwvvh5fO+SoDpUrtJuKf9c3jBFw9TXchk6XOQ3ajnjJkLvaBG5o8jXILrur5jwDDXxj2W/0+lE5V7zu9hvds2M+uQWmJc2g94rEyPJdDh5ogCDHB6P/PPWjAyPDlSyk+bZSIVdLYlxTvwW/aHIc3wntUWis6H8O3Rh6FqoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eunjfsu8SWHCcKgwLA+CRHB7iEs5WPL2LdcdaaGRky8=;
 b=HZXs9+CcWU+HJPQnkiRE5koV4Yv+ONrStmFwd8HmZoxjsjzGX3z/AiQkziS7m3hA1vWvJagzlNFCpp6QRumhvDIzLxzxCEQk1Yy2wXvtANKUMoZri5EyDKsTVx7LJUdGbL4TuN1ifv5NJpD+ne1sBcxfQ/Raf91rQYaBMP0D372lNArbQ8P8D+bBrg2YVZBJoa/KmepwDm0dmNvQPpLpuEJfdlXUpns8qVuTcmo73rgG2ksU5HOXDk4AyNxjzOxHS9JvhQeFKqWLLu5WUU1nAPEmmtdWvvyxf7oO4lsyWNHpyh+FRE/roNQBWlOzgJGzUUADJi8lQtFXlDMIYM/TcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 by CY4PR11MB1639.namprd11.prod.outlook.com (2603:10b6:910:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Thu, 9 Jun
 2022 13:13:49 +0000
Received: from MN0PR11MB5987.namprd11.prod.outlook.com
 ([fe80::e5b2:f15a:9bbd:1ca7]) by MN0PR11MB5987.namprd11.prod.outlook.com
 ([fe80::e5b2:f15a:9bbd:1ca7%7]) with mapi id 15.20.5314.012; Thu, 9 Jun 2022
 13:13:49 +0000
From: "Greenman, Gregory" <gregory.greenman@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Hutchings, Ben" <ben@decadent.org.uk>, "kyle@infradead.org"
	<kyle@infradead.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>,
	"jwboyer@kernel.org" <jwboyer@kernel.org>, "Coelho, Luciano"
	<luciano.coelho@intel.com>, "Yang, You-Sheng" <vicamo.yang@canonical.com>
Subject: pull request: iwlwifi firmware updates iwlwifi-fw-2022-06-09
Thread-Topic: pull request: iwlwifi firmware updates iwlwifi-fw-2022-06-09
Thread-Index: AQHYfALB0kmimN5RO06UIxQC2JQTKg==
Date: Thu, 9 Jun 2022 13:13:49 +0000
Message-ID: <9ec532a3e9c5b67bcb00e64c0cbe9b371e9509cc.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c164872f-6e1d-4914-3d9f-08da4a19e44c
x-ms-traffictypediagnostic: CY4PR11MB1639:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB163951EAA6CFA0209A4734428BA79@CY4PR11MB1639.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aaBj1wStQZOByRfvYeojYh5SP/4pncGv2j5DOdTH1CXOwz2H/RVsEE2NpcHuOqrUvxGK/b1hH4wTcG7gOPYpotaCD1nm+L23TobHGLNJtYRG3b9jFLQ9rV5N7jAUDEWgZej8ZD2B9crQd4zEISSHjpHeqqD+X9UKWnc/0bVhZFELvlaKJXQ8MsnJW0bOhl961n1MB/KG2HDEUcAEP/wlHtmFeT2jIg6RjLbDxlVdbjJKCz4EdW/DvLNmPMZPruFUoar607DWO1nREI5Iz7IW/7IxOL5rUyyHTlXp6ukLW4lSzLwFNW1SY6uvKeSNCaSGMisZkRFR0mg+PXEt+PLZ09xnXaPVEA6w9oC79pfyDQW5BFRhvZcTW0qZqHa1Ka+LMznFnl7/4Zs89A0/qEPVh5Tk3zTNG52zESazswG40RLcI2mboCHAHrv4SHM9XvzYnm1HNnbKHclLxGXlViwsoYNg+HhbDBFHIlOm7ssIZylDADPuoy6Iofi0yVHseQNt48wej8sNYz0NUHDL2BEZ8PDapXOfAWtoo3PCBbsXA6SgOYT8vQecHWAwMxz81VEPpPo0W4p0ORap3iSVpQva5skVE+qeZMBx63XTEB+Cg4p9pINXLLZ6e7sOOanO+JpqR/8ZT7xcKsg9b7z9OqnyWeIsi0gSCrpfZewLkYsl8V1qsLrE4rcnwwkPpua3CrCqz/6rUIl/+nRKwm+3Cf1rQxEni1UNXRNIB90XedITAFTrwQjcM3L6LTpwQJ7pfJaln6vxvNdLht649HykrWt4o3kGpcQsMai/Gb3/0Muib0U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5987.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(91956017)(6916009)(54906003)(64756008)(76116006)(66446008)(66556008)(26005)(38100700002)(86362001)(82960400001)(38070700005)(2906002)(122000001)(8936002)(508600001)(5660300002)(15650500001)(6486002)(966005)(19627235002)(316002)(186003)(66476007)(71200400001)(36756003)(4326008)(66946007)(83380400001)(6506007)(2616005)(6512007)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0ZvQ0ZGdDV2WTk1b0M5ZlIzL3hla2F4UXI3RnR6Wk1TYmNEdDlNZStBeXVZ?=
 =?utf-8?B?dVp2Rnlqbk5zendDK0RzMERKZjRjVjN4eGc0bDZwZFpPNEJ0Rzc3WmtoLzA4?=
 =?utf-8?B?UUdrYk1PazI5R1RSU3JWMzFxejFTaTl2ZWhIc3c3K0JtQ0p0Q3BsNVpZcmUr?=
 =?utf-8?B?RW9FeVBoOUpzeEF4MU1kak5Gd1NYV281eUd0RnVQNElyZ0FYVlJxQ0QzcjV4?=
 =?utf-8?B?YXV2NmVKMlJoSzg0eW9MTWYxVFBNVnpETWVSR3J5RVJMTXo2eDZtNElFc09C?=
 =?utf-8?B?bi9LM1FjbWNTTnNML3hIL1RpZGZCcEl4WHlWMkpkZHJ5NDlwbkdEbjMvb0VK?=
 =?utf-8?B?eWpqTmpWa3RBZ2syWTZhb20wLzByTnZvM3F2L3ZGZm9hSUxrdHIvOThYUmli?=
 =?utf-8?B?cmNSVzc0czlyNEwzYUMvaDRvcnZIUmUxcVZ4S2lGZEdHQ2JUbkc4aVp6ZXMv?=
 =?utf-8?B?SzZVdzlacWtRa054ek8zTy9rb2lKejFnSnV6TVpNM3o3WGovdyttUUVWRHdU?=
 =?utf-8?B?UitSLytKYStYVEpqaXJ2UlhVRjdhSEx2T2plenR4WWRoUzNOSkFLeDRTbi9a?=
 =?utf-8?B?YXd6eFN3QTlXYW5xa3h4dFhMNVBIdUlyODhsaHZYaXQwa1JaeFlabVp0U3Bh?=
 =?utf-8?B?MDk5ZVNybFVoYk0vMWZCdzBQdUdoaDFXclg5WDROUE54VWszaVg3UW9ueitR?=
 =?utf-8?B?NHROYTJvN0V0YW15MjVYakJQTThHRVdEeDFiTFJsZmxtcDRvc3lDWE9iTXBw?=
 =?utf-8?B?NjhpbVJmT1NmcGh0b0tYZDBMeXdKRldxbHYvNlN3UlIrdUVFN05HeWxOdGlK?=
 =?utf-8?B?ZExZdW55N1pPVmFtZHBERGs3RjFLanJxY2tIcGcramFsVmZSSy9ZY20vMUY4?=
 =?utf-8?B?a1lGQm1Dc2dVYnN0Z2s5UFdKT3VVSjNMZVAwRkVNOUdBQi8vaUZGWStqYW1D?=
 =?utf-8?B?SVpoQ2M3Nm9pZExpWHRNaTNXcmxscWdQVEcxbWpzUVI0OWdmV3A3ak9KS1R1?=
 =?utf-8?B?UkdtVy9QWjF3QjJ5Sjg0aFY3VXlDY1oyQVVhQzdOUU1LU3MzMWk4SUJjaHVG?=
 =?utf-8?B?RUZOaVl0SVJBN2hrcUZkVW5FN3hWakowME9GOHE1akJVQnBHd2IvNml0TmFM?=
 =?utf-8?B?OVcva3hocXdhdnJiS0xzbzJPdzNpb1NDN0ZhSk9mTnNkUjhYd2E4R0E1RUsv?=
 =?utf-8?B?VFBUWmJwdm5zd1FJM1BiakFZdTlMcEhQcTIrZHhoZlE4a3JXYWFsN3c3QTNi?=
 =?utf-8?B?alRjYUZRK3J1cnViZERhZmNLUGdvUUtWeDBoSXA4ZXVRRHovMFg2SjFjd0Nn?=
 =?utf-8?B?NDZxZmNzQ2xseU1VQzhoV0l6aEpxRTBNbWVDSkdGbDhZbUxkWTJCVUVBWFBq?=
 =?utf-8?B?UFVyZjd5ZEhza255bTBzVXNaMUI0aDZLdGZScnUzTXk0Rmc0aE9KK2oraDN1?=
 =?utf-8?B?WkQ5UDUydmpJbXRjbDZ6ZGx2SWVtNXlDcE85Z3RqNVdEUDloVlhsUHptamlx?=
 =?utf-8?B?Q3RGZ1hMODMzeFcxaGYxa0RvSUlORmt0SityaWJXMzg4SWZzd2JOaHlyU250?=
 =?utf-8?B?NEZ3MUtPaTRMdmFGYmFCTmoxUmRlV256b0lHQWlEV2p0clovazlDT0NVeUFG?=
 =?utf-8?B?dzIwcHFvYVRadjhXNWdYTVNIUU5JUXNsZGlJdHh2R3BCUXp1Uk9JSnFwUXJo?=
 =?utf-8?B?dmNjcjFWdmFpZzYwR21NZXZ2WGZCby9iYWZISXVWNFhlT1dUbnFOUEdGT1k0?=
 =?utf-8?B?dUovaUtvOW9wQWZOcGdHV2RES3pidVl0c3I0dWhzWHlBYkw3THU0K0JiYkpy?=
 =?utf-8?B?emlnUkNmcTJPVWNhSXd3S2l0RjhDZmRzWCs0WlczdzJidkxwTDgrSHVMT0hK?=
 =?utf-8?B?K2xMWFBOc0JiT3B0OWlVNmh1emRmNzRUeHdWVTlodU10TnZSeGd5bFptTDhW?=
 =?utf-8?B?cTF6REZuZHBuVXFtWUx0dkhmdUFONFNWSGZUdjRoTXVJMFlHZDRBZm1QUUtl?=
 =?utf-8?B?OUNaYnJ2S3RmSTVHUGJsR3ZTS0lPME9kS2ZlZWhWU1lCVFd2L3VjTXNUYXJD?=
 =?utf-8?B?NnB5QWxrMVh0a2c5V1pSVDlUaCt0ekpBaUpXcnZCT1RpaGRhdkVSVGMyWlBF?=
 =?utf-8?B?RC9PdmJwSnN3V0lSbm51NUpHam5xazNrQ0hrUExCMFE5MHBJY2gzYTVoNysw?=
 =?utf-8?B?S2tzdHJ3SnREVW0zZkpqMHZxTFo0NFNkOTJ0c3J1MkZSVWwxWStONGpQRFIw?=
 =?utf-8?B?anNCSGJFQXNDM2dYZGZFeHVmOXpsbFAwcktNM29paUhSdWpEM3lQVWFqQ0x1?=
 =?utf-8?B?Z09Ob2M1cUV3QzNacDh3akpUZFdMTGVkLzhGWkwrMDEzNU9JN0ZZNVRuSERH?=
 =?utf-8?Q?JYlUkRp0g5vSXsZyzbEyZrauZ6vdmHhwGZQff?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <474633BD2CAA054F8FA0E16EA91A457F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c164872f-6e1d-4914-3d9f-08da4a19e44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 13:13:49.0717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPjWlTfCCpnZho7L7kwOzFt69w1C7XPplffcTdMsGnly0G2T5Muw6c485qhP4p1Kyco2q2eHltvJ4fLri40tGqlI67ks6LNTh4dbhoT9i/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1639
X-OriginatorOrg: intel.com

SGksDQoNCkknbSB0aGUgbmV3IG1haW50YWluZXIgb2YgaXdsd2lmaSBkcml2ZXIsIGFkZGluZyBM
dWNhIGluIGNjIGZvciBteSBmaXJzdA0KcHVsbCByZXF1ZXN0LiANCg0KVGhpcyBjb250YWlucyBz
b21lIG5ldyBhbmQgdXBkYXRlZCBmaXJtd2FyZXMgZm9yIGFsbCBvdXIgY3VycmVudGx5DQptYWlu
dGFpbmVkIEZXIGJpbmFyaWVzLg0KDQpQbGVhc2UgcHVsbCBvciBsZXQgbWUga25vdyBpZiB0aGVy
ZSBhcmUgYW55IGlzc3Vlcy4NCg0KLS0NClRoYW5rcywNCkdyZWdvcnkNCg0KVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwMmM2OTg2M2M4ODVkYjk2M2Y4YzAxMjFiNTMzZjI4MTZl
ZjViZTNiOg0KDQogIHJ0bF9idDogVXBkYXRlIFJUTDg4NTJBIEJUIFVTQiBmaXJtd2FyZSB0byAw
eERGQjhfMDYzNCAoMjAyMi0wNi0wNyAwODozMjozOSAtMDQwMCkNCg0KYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQogDQpodHRwOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2l3bHdpZmkvbGludXgtZmlybXdhcmUuZ2l0IHRhZ3MvaXdsd2lm
aS1mdy0yMDIyLTA2LTA5DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5OWNiNGIw
OTViNzY3OTU5NmVkOWZiZjE1Nzg1NjhkZjE4Mzc3ODY2Og0KDQogIGl3bHdpZmk6IGFkZCBuZXcg
RldzIGZyb20gY29yZTcwLTg3IHJlbGVhc2UgKDIwMjItMDYtMDkgMTA6MTk6MzIgKzAzMDApDQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NClVwZGF0ZSBhbmQgYWRkIGl3bHdpZmkgZmlybXdhcmUgYmluYXJpZXMgZm9yIHJl
bGVhc2UgQ29yZTcwLTg3DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkdyZWdvcnkgR3JlZW5tYW4gKDIpOg0KICAgICAg
aXdsd2lmaTogdXBkYXRlIDkwMDAtZmFtaWx5IGZpcm13YXJlcyB0byBjb3JlNzAtODcNCiAgICAg
IGl3bHdpZmk6IGFkZCBuZXcgRldzIGZyb20gY29yZTcwLTg3IHJlbGVhc2UNCg0KIFdIRU5DRSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0MA0KKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQ0KIGl3bHdpZmktOTAwMC1wdS1iMC1qZi1iMC00Ni51Y29kZSB8IEJp
biAxNTIwMjA4IC0+IDE1MTg3ODggYnl0ZXMNCiBpd2x3aWZpLTkyNjAtdGgtYjAtamYtYjAtNDYu
dWNvZGUgfCBCaW4gMTQ5MTA1NiAtPiAxNDg5NTQ4IGJ5dGVzDQogaXdsd2lmaS1RdS1iMC1oci1i
MC03My51Y29kZSAgICAgIHwgQmluIDAgLT4gMTM2OTg0MCBieXRlcw0KIGl3bHdpZmktUXUtYjAt
amYtYjAtNzMudWNvZGUgICAgICB8IEJpbiAwIC0+IDEyOTAwODQgYnl0ZXMNCiBpd2x3aWZpLVF1
LWMwLWhyLWIwLTczLnVjb2RlICAgICAgfCBCaW4gMCAtPiAxMzY5ODU2IGJ5dGVzDQogaXdsd2lm
aS1RdS1jMC1qZi1iMC03My51Y29kZSAgICAgIHwgQmluIDAgLT4gMTI5MDEwMCBieXRlcw0KIGl3
bHdpZmktUXVaLWEwLWhyLWIwLTczLnVjb2RlICAgICB8IEJpbiAwIC0+IDEzNjk5NzYgYnl0ZXMN
CiBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03My51Y29kZSAgICAgfCBCaW4gMCAtPiAxMjkwMjIwIGJ5
dGVzDQogaXdsd2lmaS1jYy1hMC03My51Y29kZSAgICAgICAgICAgIHwgQmluIDAgLT4gMTMzMzI5
NiBieXRlcw0KIGl3bHdpZmktc28tYTAtZ2YtYTAtNzMudWNvZGUgICAgICB8IEJpbiAwIC0+IDE1
NjM2OTIgYnl0ZXMNCiBpd2x3aWZpLXNvLWEwLWdmLWEwLnBudm0gICAgICAgICAgfCBCaW4gNDE4
MDggLT4gNDE4MDggYnl0ZXMNCiBpd2x3aWZpLXNvLWEwLWdmNC1hMC03My51Y29kZSAgICAgfCBC
aW4gMCAtPiAxNTg3ODAwIGJ5dGVzDQogaXdsd2lmaS1zby1hMC1nZjQtYTAucG52bSAgICAgICAg
IHwgQmluIDI4MDY0IC0+IDI4MDY0IGJ5dGVzDQogaXdsd2lmaS1zby1hMC1oci1iMC03My51Y29k
ZSAgICAgIHwgQmluIDAgLT4gMTQ2NTIwOCBieXRlcw0KIGl3bHdpZmktc28tYTAtamYtYjAtNzMu
dWNvZGUgICAgICB8IEJpbiAwIC0+IDE0MDkzMzYgYnl0ZXMNCiBpd2x3aWZpLXR5LWEwLWdmLWEw
LTczLnVjb2RlICAgICAgfCBCaW4gMCAtPiAxNTAyOTAwIGJ5dGVzDQogaXdsd2lmaS10eS1hMC1n
Zi1hMC5wbnZtICAgICAgICAgIHwgQmluIDQxNTg4IC0+IDQxNTg4IGJ5dGVzDQogMTggZmlsZXMg
Y2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgaXdsd2lmaS1RdS1iMC1oci1iMC03My51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
d2x3aWZpLVF1LWIwLWpmLWIwLTczLnVjb2RlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGl3bHdpZmkt
UXUtYzAtaHItYjAtNzMudWNvZGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaXdsd2lmaS1RdS1jMC1q
Zi1iMC03My51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpd2x3aWZpLVF1Wi1hMC1oci1iMC03
My51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpd2x3aWZpLVF1Wi1hMC1qZi1iMC03My51Y29k
ZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpd2x3aWZpLWNjLWEwLTczLnVjb2RlDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGl3bHdpZmktc28tYTAtZ2YtYTAtNzMudWNvZGUNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaXdsd2lmaS1zby1hMC1nZjQtYTAtNzMudWNvZGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQgaXds
d2lmaS1zby1hMC1oci1iMC03My51Y29kZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBpd2x3aWZpLXNv
LWEwLWpmLWIwLTczLnVjb2RlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGl3bHdpZmktdHktYTAtZ2Yt
YTAtNzMudWNvZGUNCg0K
