Return-Path: <SRS0=Sfxd=WQ=intel.com=luciano.coelho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83ECC43334
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jun 2022 13:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EBD1C3411B; Thu,  9 Jun 2022 13:34:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9095BC34114;
	Thu,  9 Jun 2022 13:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9095BC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654781676; x=1686317676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nwbuCEhFKZ2PbHzoIzZcYwTezFYs8chdPkFDJ4/cDho=;
  b=L90Yad/DCjZ9baoVK2+xyHHvl2jt1x5ClsaqvVQEEcODTq/ATPXWEkok
   JM08EmeeUgX8sTnBU+yidhYi6USGSU/0wDO4D0D82khx2cP9ZQNX97lVf
   j2pWaUZ49ehUEUeH64S096rWkiRf0A0LxYEAVZknScQAO9QRkYPpXdW0P
   pEq7G4CU327txMWKllPGdvri9DuxkyQkKWCN23X2/UEtYS6N3gDqO/sEC
   1keQHpo99tv/AijLRyhEdxXbvALbLzuuomH+lNRakf5tn/a77MRFtSF+1
   mnj0HCgH4ozO+AIvRRLZlLzT+JApaAc2bZImgZxRE2TkDx98lQgjpP9ax
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="341358745"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="341358745"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 06:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="671314354"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2022 06:34:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 06:34:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 06:34:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 9 Jun 2022 06:34:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 9 Jun 2022 06:34:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8CHMVo42R/gD2+wDxlB6mcxIC3l9nNAxkEaIffvCQjBV6oRnBqoHSTBO/Ua/FOdEBDB958joAcm0gUt3lE1mfAGcw7Rt5LEKRByTEuxxkm6uYkLWkVrhT6hY9gpszGn9xuBIJF7S/cPMJBTMIOzX0GGsyi1PEUOox8RfRNOQCNDBy4y0AZAiSMGyBNMNb/qjVA3OeOVNllNYzG7WWN/UYTHTVzTvQbYeDGk2aj+9JjYlyEbAyYtTqH/HLt2WRDao+ki4ngw5Po/gFzCicyeWlDn+pngp2Zog6s71qEhJxojuZ1TXZOFi2fTH+gvBb/Zde/wyX89VQyvaY1twxZaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwbuCEhFKZ2PbHzoIzZcYwTezFYs8chdPkFDJ4/cDho=;
 b=J3A0N7a8TdeQxN6cQ1/AVmex/KPoc6CVFSTVqLTgojorziXo9fhdjCtCtLVgzwGqGUZuY7P7tDq4Nh0vjnzNTXUeT0bvPKlbo4FZ+HUhkBw3TUzQbUr/jRvTYRvcHQINPVTJ4z1DG/QO/PDLOFWE3x4urrE1SOEPenRlPOGqQMZiLl98InScA7ALG3J/POHWiyLq0VwQA1xf4s4900nW0klGPB34uXmrmOZDg2I5hCJ4GNqKW8R150PP3aLEVjWZUtep/vbeUw9o1y9pWNGoom9vVjZGhfycuHg/0dMm9YkTSBy/OGcLJ9KxUwiFts9b9ve6LqLjeqPHEOr+fgn5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3207.namprd11.prod.outlook.com (2603:10b6:a03:7c::14)
 by BN6PR11MB3971.namprd11.prod.outlook.com (2603:10b6:405:7d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Thu, 9 Jun
 2022 13:34:26 +0000
Received: from BYAPR11MB3207.namprd11.prod.outlook.com
 ([fe80::550a:827a:a73b:174a]) by BYAPR11MB3207.namprd11.prod.outlook.com
 ([fe80::550a:827a:a73b:174a%3]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 13:34:26 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Greenman, Gregory" <gregory.greenman@intel.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Hutchings, Ben" <ben@decadent.org.uk>, "kyle@infradead.org"
	<kyle@infradead.org>, "Ben Ami, Golan" <golan.ben.ami@intel.com>,
	"jwboyer@kernel.org" <jwboyer@kernel.org>, "Yang, You-Sheng"
	<vicamo.yang@canonical.com>
Subject: Re: pull request: iwlwifi firmware updates iwlwifi-fw-2022-06-09
Thread-Topic: pull request: iwlwifi firmware updates iwlwifi-fw-2022-06-09
Thread-Index: AQHYfALB0kmimN5RO06UIxQC2JQTKq1HEz+A
Date: Thu, 9 Jun 2022 13:34:26 +0000
Message-ID: <e165a3f1405cf6d2881b66d4b9f4753eacb80427.camel@intel.com>
References: <9ec532a3e9c5b67bcb00e64c0cbe9b371e9509cc.camel@intel.com>
In-Reply-To: <9ec532a3e9c5b67bcb00e64c0cbe9b371e9509cc.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d917947-b121-401d-21d3-08da4a1cc5f8
x-ms-traffictypediagnostic: BN6PR11MB3971:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN6PR11MB39711D66C442F26B1C02C86B90A79@BN6PR11MB3971.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eQdPC3obXAq8jsqsejpgx4sOE8ODsO9CTGtvBnN/gwc/nkIqvCxZTjj4ep8U2KE00WRK+XGRNdBcUxH+bzmX+se9X9euXmDZWRkxyxo/WATA3lZyI9r5qViDyAvw0V3TkTA74X4ABTYZI3xBO/ZKdyHUyEef3JlYLG3GPSwvX2Y0a7qn2EY84pW8oyMIdd0VmsL24J+BE4Eibj1QT0mf+UY9HgUQ/L+NvwhSJylaIqz24ov0BqL7lQ51MYypwdyJSe2g1NjeeSguMAyoECl0dRrq7Ctt6/Gl6vZlnN/cb/W5UYSaiIWohmL0oemTsI0N2wJcLROIPtT6CfW6DkQB5+NXEX6UQAmMSG4fyd0Z+VN7VP/ZZV3hI/IYy+goT19oVkom7uGeNI9fFfjuMtrG3uYaAJqe4c/BA7mgiIw2gFSbLNtNDcYrgcnYGAKfEjQ6AwB5SgBP1gxvM9/bF+AIoSXx3M4uu1PneH67jHdF3MBabaFfunZ/JBIIF020TTAFdQvx8MT//4e9DNSSWh2QHVD8RhvklPpETomm1S9cnwdpllFxlOCMuCi/mOUINcNZhZwsKzhLzN1nQj20Cakrk4SnS3ZTPS5B43QlVpsjh27l3yQAaBDJLlB+LqLpnhMM8Ox8zNyfjeOUw5JR9QOwTBQ/LHhI+p0GeIzyCI9JBzisZV/15+ZP9qnry1KTwwse
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3207.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(54906003)(76116006)(64756008)(122000001)(66446008)(66556008)(110136005)(82960400001)(36756003)(91956017)(83380400001)(4326008)(8676002)(66946007)(2616005)(316002)(186003)(6506007)(6512007)(71200400001)(2906002)(38070700005)(86362001)(26005)(5660300002)(8936002)(558084003)(38100700002)(6486002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm9XYUJHb3ZCZW1kSWx6QWpxdHRhOXQ2b3gwNktjaWRLVDdDY21UVHp0aWxi?=
 =?utf-8?B?RWtQck5xUitMdnlxR3hXSWtKd0doNjB3bk94bFlpVnFhMjdaQWxBOVBlcTVo?=
 =?utf-8?B?WmVXSkFUZkJsWWUxa2Fvd2hBTXRRODF0cVVTaUtFR2NENGlqNGNjNUVBazRM?=
 =?utf-8?B?TWRnbmw3YmdNaHNLTVdXeUxxSzdpdzYzVzlTS0RhdklhNW9sUWZtQ20wWjBi?=
 =?utf-8?B?NFBwY2VQcFRYQllFS1ZsTURTd3ErSmRzUkxXNlFQeERTUlVpTkhQOExIVTNm?=
 =?utf-8?B?VVNzcXBmYzZ3TDVVMkhCbHdhUWg1RFdNOU0rZHZjZzB2T0VkcE1aWmhJZVkz?=
 =?utf-8?B?UDQ2L1dIeFVCNDBOSTdSVVJmYzEzc2FRcWFEWHkxUVNycmt4UGZacEpvaTNC?=
 =?utf-8?B?MmlIcHZod0tjL29UV0Z6eEJXNmMvQmlvWXlESmxrNnZWR3VZVlMvMUFDNzFZ?=
 =?utf-8?B?bFdtc01ralZIOXNsTm51VlRNcFlTbXE3bjlWY1VaK0lkcU1IMDRzT3h6QUEv?=
 =?utf-8?B?MW5SVXptQ0dmcTFwZGNrMHNFMEFjYWR2TTVJOUcraGFSaTk2TjIrMUZRR1Fv?=
 =?utf-8?B?c3VhaDlLZlZMdGFJVWhzRWYrRlZoSjBOSVhlaCtEUmtBNHV3S3M2T2xQOWQ0?=
 =?utf-8?B?eUZjQlVUbUxLNlRLdmQyak1XaEhsbmx6VzNkN2tLUFQrWk5icUx3b2Zkak1n?=
 =?utf-8?B?RUI1UFNXVThKVDBGS3dkQkR3c1hESzIwRElQNWdDL3dvTEdPRFZZa1g2MEFt?=
 =?utf-8?B?SmdhTTBicXdXbW9FSUdBWDdORlBHcERZVUl5THRnZ1pubGZMaG4ya1RYMzV4?=
 =?utf-8?B?MUNIVnJWNG5RcEtzcDRaU2ZVRmlqK3AvUDJ3M2xoa3dvU2Y4cU5mQUd4M3dh?=
 =?utf-8?B?dHRDUjBEdnBGVDgxd0pycHhpYUpZMC95R0c5UG5XcCtUMlNjWWxGUFppb2VU?=
 =?utf-8?B?ejVBVmZKcnpUcVZ3L1JkaDVxdkxZTVI1cEtIOGJZcnNIam5ZMWFrRGpBeEdV?=
 =?utf-8?B?cFFvQjhGMkREbGh1ekc5RzlFbTBlMmg4TGJBSVlIS1ZmRU1lYTBGcUt5UHla?=
 =?utf-8?B?K3JTK0Y2bGNLRlFWVWdzT1k5QmtaMVpKTCtNenlueXBPNVcySW84QzBHUkd1?=
 =?utf-8?B?cm8zY0tBakh5dUErTVZNY3VLM3ZOQW9Jbjc5QWgyQnB0djZGalFKTStjQUYr?=
 =?utf-8?B?b0ZtR01mZlVwWXhZVFdTM1ovMTZXOGVUYkNnSDQ2c1dhVUlHY0hETU9rSEF6?=
 =?utf-8?B?Nkt3TmRsQmpRVW9BbEFLbVhZNHloclhERjlTbURWaHlzcEU2cE55LzFSYVM5?=
 =?utf-8?B?Vy9kNnk1WnFBNmlkM0E5ZVlVMGZjaytBakQ5SEIvcjBlcklPb2xSQ3UvVTFN?=
 =?utf-8?B?NXhKN2tMNG9nRnU3UnAxOFZVaU05M21ia2xUVmhPTi9hWG41TkNpRFA4OS82?=
 =?utf-8?B?djNVRkFab0lJMSsrL2MwWm5NazZISHVlRG5LTjhkaHEwY1NGb1Iwdy85L0NC?=
 =?utf-8?B?alVjUFhYU0o0RHZBbGhMbmpHMFZ1NE8zcm1RdFA0S1cwcTVOQi9qNUVicUFM?=
 =?utf-8?B?M1FBblZuV1MvWTdaalY3NDBaWmkvcDB4SW8vYnZsaWhUeDA5ZlRueGdsaU1x?=
 =?utf-8?B?OFp2cWMvRThQaWpseGx6MkJpZitvem0xb3lRbTliRzJJbksvTmpHb1hSRTJn?=
 =?utf-8?B?cXpEeCtmaHlHNHpLZHp3NW50YURvK2NiMCsrTkpwWGorSjYrQ0paYk0yVmpT?=
 =?utf-8?B?RFNCTWtRbnFRdGpaL2hOTWhUU05DeUtvK1dLeFBLZ1hiTUR2SnE5VEUvcE50?=
 =?utf-8?B?QXJyaXZ6NFVnRkp0aWtoNnpQT1MvczlMSjdWbW5TeHdRUWx2RjVnSElnWTZz?=
 =?utf-8?B?NCszNXYyeWVnMHYxSkE1K29DV3RKQk1zWXNxcWo3akRGVkV4YVpjQTBNMmxQ?=
 =?utf-8?B?VkNudEJVM095OEFTak5NbDROTGpnRVVpdzBKVlZuQjRXbkloL2dQZFJRMkM0?=
 =?utf-8?B?cHFwdGYwdUFqV0gzMERoRlNlL2FqNGFFdnFHQ1lTSVpOeTNvTVVtT3ZOVlJK?=
 =?utf-8?B?MGV1MUs5NFdyUmVPNGJkcXdkYVFNT3p6dHp1M2xwM1NoOE9qMktaSVZ2VHpu?=
 =?utf-8?B?d3k5K2VLQ3NIRFBQeDZxM1A5TDNlM3BzS2xqdDF0alU5cDFKUFh6T1hzcXlw?=
 =?utf-8?B?UmNxaUFRNHNyamhlTldJMWdoQWFjSmZKWllxZEl4ZW1DazBFTFM5Mm1rVDdK?=
 =?utf-8?B?WS9BcVYrN0dCRnVneXVmdW9jSVdEWWM5L2U0aVVyNy9RU2JnTTZnMzFhbDlm?=
 =?utf-8?B?RnVjRWxzdnVVbFFLY2FKZHVUVkZ0OGpCbGEweENQMlBPczEvRHJKUGQvbGpJ?=
 =?utf-8?Q?bdZJ0iBqmbbQxPfs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1F52C1D89E0614EB2A5F25D84B5E88B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d917947-b121-401d-21d3-08da4a1cc5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 13:34:26.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jd1SCbS2/5qkZAKXR16m471WPKXjjJ1kKTwZ6WhqJFW+Fb85CJi5hL2yq2LWGPFMm+m5v/sohmguEujll1iFd8i65QbIdyz39B0mI/krGoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3971
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDIyLTA2LTA5IGF0IDEzOjEzICswMDAwLCBHcmVlbm1hbiwgR3JlZ29yeSB3cm90
ZToNCj4gSGksDQo+IA0KPiBJJ20gdGhlIG5ldyBtYWludGFpbmVyIG9mIGl3bHdpZmkgZHJpdmVy
LCBhZGRpbmcgTHVjYSBpbiBjYyBmb3IgbXkgZmlyc3QNCj4gcHVsbCByZXF1ZXN0LiANCg0KQWNr
ZWQtYnk6IEx1Y2EgQ29lbGhvIDxsdWNpYW5vLmNvZWxob0BpbnRlbC5jb20+DQoNCi0tDQpDaGVl
cnMsDQpMdWNhLg0K
