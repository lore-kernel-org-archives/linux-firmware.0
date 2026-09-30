Return-Path: <SRS0=Cnvp=HW=intel.com=lixu.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37395CA5FB1
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Sep 2026 02:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A6CF1F000FF; Wed, 30 Sep 2026 02:34:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790735641;
	b=Asf2jJzUsv3SjAVBblITnWbZScHRAroMoV3ajURYO/A+UlxnuNuAM+toZF2OhWwih09u
	 X/yRbBV296FE+Jql4PE0pnzxH3orqj7dfe4IoT0rl6WyRZzVZfDvjv2NyUXHFv0UrnGHC
	 IvJ1SFRh+7RdtPNyF41qrtzGGrARJPRpzGq9t8gO1uqR5vsayw9l8t5hvqdCdPkEbdKMW
	 w6cQyWnxjd8hXpWEAsZ4QzoD053jnQpn0NZU+r9y0LoLLPnf0we95AGCg/b5u4uW5A/3t
	 ov+yyJ/aopJrkhJM269zdYMaN7M03a+zt6cNi9hIt4s6lAAR114KBtw+JAGBaXlBTPA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790735641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:List-Id:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Lh0wJRE0eGOEOJyMbPVQp7KWhMmSV5qdz/1pasFA9aE=;
	b=CVJfo6G4eI/nj4JwKQ/87vYusAV5udcp0vkPe/5rzI3tTanwuHduIbHxYT37GnMSqktV
	 Cr9qlsbk4qtBAJpvAkTM8bIdNbx9qibW++qtuB8FwJ4Mk9DVK1YJoCTiy/fb7vdTB7L2z
	 aYyPW9W2jbLqE353u20BiwYQaEuUaOYL1qtkBGExuOA+Zo/pQnuBDDHxqpcf1pD/lqiYf
	 JmZS8gm2z+QG3LO1+hg5lAjH0TQKx7cjXOxLYYI/v8MyqKmOc8RzUzZmjgzdKCguFQczo
	 37nieg7iY76orxLQaqE7v+CPc8SMpYM1MiClJQrRI+jqkD+LdWKI5/wGxuJoBNS0jZA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VH15nAcY;
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A075C1F00899
	for <linux-firmware@kernel.org>; Wed, 30 Sep 2026 02:34:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VH15nAcY
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A075C1F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790735640; x=1822271640;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=kX8Yzsqw9XKRS6ONV4x+qICb1dyAW4/kHdpwvPO7KSg=;
  b=VH15nAcYxYiwjFFrZEK7RWfiL5mN+Og2jMKzF02cVBsKf5YTSjvb896D
   QSZnmgcfDkJd7gwbWEQMrumgpbVPdV0RDHZuMtjzRJo2hRaiXOxr9Kd6p
   oOf4r2+7cBz14iLWhArukvsaqEVkeLOWvQaNnagWolrAhNZpOfSdx7Ka4
   O4cvcyiRyC1axr0lVu1gp2IeMZS1MU264wPNX+YgYDyxL+k6macA1UA1s
   afNotcjo+XT3Jvm8wBXKuw5S6KKoa+6+O7WlsK+jhfEwqj6Cev1/ypxy8
   f84IPBXDEkhaXpsCnXXMHThIYKtcG7JHrUo/TzYCblRVEe7Bd94BLS8mB
   Q==;
X-CSE-ConnectionGUID: AhG1dpoQSiin31ljSR7OFg==
X-CSE-MsgGUID: 3ns3lfi1TZGd8jYV6TQkNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101990736"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101990736"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 19:34:00 -0700
X-CSE-ConnectionGUID: JZKERXEHRs6IdhouJFb3QQ==
X-CSE-MsgGUID: RtfvrtwrQ8O0eMoFttEijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273330397"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 19:33:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 19:33:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 19:33:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 19:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aqakev2T1yE5/a+FMlQj+g11rvbuXIP/tZSAl88oo4omVfvAAcMt6dGU8yF7gVTqRhMUQY4ZKybAhQ2l0bhjdD8k59ZPY4FEmoe2vzgmkF2fNJ283vmdgKdIkdAMNSAgjieNE4mIwWKV61f86quJC65TKMGKurX9k6F/rNxvhuWmWeSQ045zMOyEFEn3qCCrEuDdsPry6Hw6wN5LMcCrq4b7W8CtA58/Ma4Yxn+NlZ5bTL43n84ZAOhmJdLh5x5jD1B0MvFkFh2iqHbinhW5DPUzrNLCKQrt4n6ttIpTYF2WalPhIwwh3xLs+YDT3W78iRQ9DsmB3+7r1UNiZlzXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh0wJRE0eGOEOJyMbPVQp7KWhMmSV5qdz/1pasFA9aE=;
 b=gjT0To6R9XxkqZd4mhsk3EBEspExHUsN51CejplSI8+7zdcz6CYn0fU+XhJK8S+9fV2Il6sKNO/UIJx1pTFCNp0FEaHe1eqJGREKGnLOgYup1+qmB88GlZny/+B7xiF8pg8uFybBtzZpaJEV1pXqeLJBR4tZkEfEjc6SHQsGN30U901NJhx/NYAGTu4O7GWzPeIiwr+1NvISEg6Ksti1RdVmSJSn6p9lj7LV0ACY/iTbuJt4LVijNXtkrA7BqUvSaqrWA6zlMDATfnZR/caa0MBRleqlQG9hbsCezN5NA9VOcPNcjQOXtbO5Y2qPTF5vfCnNqytjawjcBO/G30rROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 02:33:51 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae%6]) with mapi id 15.21.0451.014; Wed, 30 Sep 2026
 02:33:51 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "superm1@gmail.com"
	<superm1@gmail.com>, "jwboyer@redhat.com" <jwboyer@redhat.com>, "Wang,
 Selina" <selina.wang@intel.com>, "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: [GIT PULL] linux-firmware: Add ISH firmware files for Intel Nova Lake
 platforms
Thread-Topic: [GIT PULL] linux-firmware: Add ISH firmware files for Intel Nova
 Lake platforms
Thread-Index: Ad1QhBTe/xQnWzmLRt2EpMvrZVsDdw==
Date: Wed, 30 Sep 2026 02:33:50 +0000
Message-ID: <SJ0PR11MB56137AB133671D9BADFAD177938B2@SJ0PR11MB5613.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|CY8PR11MB7797:EE_
x-ms-office365-filtering-correlation-id: 7f4a1b0f-f98c-48f7-7d71-08df1e9b437a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|11063799006|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|18002099003;
x-microsoft-antispam-message-info: e6ktOjCMZujCr4HukQkfDmN7ivzDrhb0ZtAP80d7/vSOHAhO+gNNHfjn74Cqmn4ARjjk+fLL3JxwwIP4C8HxsfZlcV/FlMcqkCD7a7b9ZZLaziL25sxAExz/16XeL3kuB6T9AbabOYW/XNM8opVpk/gVI0eGCfkcp2rMGZ0QYdck3344M3Mawhje7Ml4iWztQBKDNLoy5561YazevZZBq6XbMSMFSj9A0SzI3RtWNspRkVTXsAkNuHRQmifrhQ+i0OaMAvnaNjKe76NqkcZIrkS3b2297u/LMMa1URQDBAPrviOwcZ8CgvmTsCB03mYpwPhlm20sqoVklO53wRkrUuVJLKWDhsTj3Dlsezq3aD/tzsgRgqJUlOauxYk1CqFyXfb2bB3rxvKs5k+RrVibWKhy+PqVaX+j/UP8Y/dSYI7dqNmFOWti6BXw8q6v033hTvJt3suDIRxkRb+cmESw9JmjOvGqssCnOjCEOd6jAZwv0RGzLv6+6SczdU2ZdV3YafPWTgfGBQNuqXmzKNi2q3nczZE/t8xwnLmkyoK2n+8MrCh4j1V8kv5z7TZojBgeg2ViQ+9J/keeRm6mQDa93olWWxE0OFaw4UeXkCeQFSJA555K2rD9zE3Hp48KKVE7YSLQSXVh6DcaCJr4N1S8MmBMi9WbwFaksA+B6BP3aV5IE/e6FQpFWj9RvjGflEls6Y0LpjpDqYCvzvs0FOZaNRK/n8SKMDz+EFpFaan/EMU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(11063799006)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T13OVd631ClO1+GjeJCT+M16J3RzLAbWCujrACnVnvXPcbMlJ2MeWFh1KMNT?=
 =?us-ascii?Q?K5r+HHaNP/mG9Aj4sHULpBi675subry9GG4Lxy70hw0EblR9g8X7mtKL1JPu?=
 =?us-ascii?Q?B8RNiLfdyy1R6Ye1p5hFxfZHJ/vfATnwivlmnpwPoX4v5IPWpIEMJBqJlVT1?=
 =?us-ascii?Q?qCaYsAFGoMobbCHcbGz/tqsEenaT5FJpLCGcrkfDsUmazvMac4akxUXePkTG?=
 =?us-ascii?Q?kzL/mOOaMhLCCKDS5mjHfLwojZLmaXtFFQZ5EavQquqiYRp5y4ogmtAoHMxF?=
 =?us-ascii?Q?l8XT8YX6efiUxbS+oDknFHjV2K5iDZEdAdqAUoyZehn0x6/KUBvQuJyREx9S?=
 =?us-ascii?Q?HSdNhbTrUOzIJ5yRT6J2lEBWT5+5uBULK1ew5uI5+PQNx2XcjiRwlPwcsW3D?=
 =?us-ascii?Q?h3QLLsGDgR9rvZCh12mpbDwhWtd3GnJlGnCYWNWaJeGASw1JrOvW0rD6S1Fg?=
 =?us-ascii?Q?NLejW8s8nAEcrzEOO+IvW/4cMZ5D2K7tJx17i4RG9BQwvjLgACZ1XMf2CAKR?=
 =?us-ascii?Q?boPQUHX3bFTjA5ahCo1LWfKwa680lKNl6SxYFB+WZnvLRRbwIXhuV7I4U2Ht?=
 =?us-ascii?Q?bAQh4Ega6QMLQdmHXnYn7VHcJPARx5Tr25ILfAl++g+XEZRB0H3F7oH3SIoB?=
 =?us-ascii?Q?FanFM04u8Sx7RFtOhwFI81YuEVmlfz0JC2QV5NkyebgZ2XXLUddJE0w/k5qG?=
 =?us-ascii?Q?h/27OFfWYCiqm8aYPxo0ZFInKURAn+B/ejwSm8eG4YP3FV5z2OAj4AFvQWxr?=
 =?us-ascii?Q?j2N5ZWnlGhfD6j0qlUE5jqNzhiVTg7STh+OxbHpYfHRV6Qyb7c4664skZ8vC?=
 =?us-ascii?Q?HgtscFzD7lpvpRk5CT07ZNGdkPJ1IOdX/SIWL1yVYKA9m0FNitcv8+fJAl2A?=
 =?us-ascii?Q?9XlVhtt4hInfKZr37xAtEk3LG5vr5m4LRSarWZiZ2DMhjetOf67agnMRXWO6?=
 =?us-ascii?Q?q3qH4TEsMebimvCBLh5VPDVmVZvENs1pT//qiZXSmF7hiyFaBfIFO5ex/j46?=
 =?us-ascii?Q?b+iiYuq68l5/6x26kKqMZ87cv91EmZsudl1IFld2fRfLANij9kQiKDbTcXEH?=
 =?us-ascii?Q?gqz6VJwhTiQko8+02wAG2yfk8Gfk0yzOMjvOlsuG6Z5FE9NQX1tL/NWc+qIt?=
 =?us-ascii?Q?Tg4P1rPaxkiFit7+Vjlrnd9ggnmyiDv3TEIcGdZ1T8UMynDP5WZvIGrNcKhS?=
 =?us-ascii?Q?oB3o+d9rMdv8aMk1Q7931Q9Fv0Gw9hC9FNQYb+yIRjEanKDO3mglPm6WyENN?=
 =?us-ascii?Q?8G5OS0639EG0lOeZsnjyg3mRd9s5E4pbfJ5Z1b40p8fTTDh2x+CGLYpV7ZPQ?=
 =?us-ascii?Q?+oBewbcsLGa0K2PDiKhLp4tLBR2T6VuHHGNbxlvXfstZYi/ZbbyRsr6tBo4J?=
 =?us-ascii?Q?X+/6vK+SkDspIdxGT4mTTdI/pwGVF8MPEMl924RTmqTYmwCOBLUgD2WrzQlx?=
 =?us-ascii?Q?somDgn8wl8btPua43Dif2jToqZPgrFCYHMhdStrVWzjbFfZsB1aULC3t3dwE?=
 =?us-ascii?Q?IFPfdGKsYkPWqAzwbpbDNWcIXl/7t8WZGQpt7JNy/kA/KcKA7bn0vnhJQ5cn?=
 =?us-ascii?Q?MrCDeMdd3hyLC0tB86FnI/C5dQUdX0GocHPlg4hJM/heRRV867NIdpbNS2MK?=
 =?us-ascii?Q?+OOFkz8vjz0ZqwVy3gK056X3idI/XEdFYg8K/aUvZ30BrKS9p0tlXz3E0tId?=
 =?us-ascii?Q?qandl1v0T3abvgIK1N6EFLSAcXRRv4Q+XwO1FWk77Fgvta0c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kRs9qmBGAgv9YMZgLdCUpOqygMGAYeW2thToG1XbErCB1CMsyHTgHNAGH/Sigs+iQ53f/m7kovzXHHRnCwQbjafI3S5weichGEidYFjzHPwRo2ay/HoAsRJqTTgQiumYeaHwtTjfYurHC20Q7jEAFKXi38jvCMfZQQTzNuwAijN4c+M04xdHfnKKBCVa00/tbsT9w+n78qZeiYHla5N6ZFjJm84gVQHPopFoHDSiEEsRRTwGiXuqah9c3AmzgbXmpGVmDluB8ACTo8PAW4Thw7dTRLvibbfRLGKjhXChzDwbN4QNWUDhep8keOlWmSXuz/XzG885/Tt03ildf3XWVw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4a1b0f-f98c-48f7-7d71-08df1e9b437a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 02:33:51.0694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ln0VMqRvrCYZ17b3+ae5zVSqdoIe4VvYJU5solFlZfCQbwNij2CX7Zm4jNKjiR7ecp8p7SOuyz9gxSKE25TtHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
X-OriginatorOrg: intel.com

Hi linux-firmware maintainers,

Please pull the following firmware update for Intel ISH Nova Lake-H/S platf=
orms.

This adds:
- intel/ish/ish_nvlh.bin, version 5.8.2.7822
- intel/ish/ish_nvls.bin, version 5.8.3.7819

Thanks,
Lixu

The following changes since commit 27bac57ed81494fe6d23f8e2995dbf7d83cd110e=
:

  Merge branch 'robot/pr-0-1790664884' into 'main' (2026-09-29 13:58:23 +00=
00)

are available in the Git repository at:

  https://github.com/lixuzha/linux-firmware.git intel-ish-nvl

for you to fetch changes up to 01d600e69036bc0e61d66001ddcf2d828a4d6392:

  linux-firmware: Add ISH firmware files for Intel Nova Lake-H/S platforms =
(2026-09-30 10:18:01 +0800)

----------------------------------------------------------------
Zhang Lixu (1):
      linux-firmware: Add ISH firmware files for Intel Nova Lake-H/S platfo=
rms

 WHENCE                 |   4 ++++
 intel/ish/ish_nvlh.bin | Bin 0 -> 1265664 bytes
 intel/ish/ish_nvls.bin | Bin 0 -> 1261568 bytes
 3 files changed, 4 insertions(+)
 create mode 100644 intel/ish/ish_nvlh.bin
 create mode 100644 intel/ish/ish_nvls.bin
