Return-Path: <SRS0=jcYn=BR=intel.com=lixu.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E030FB5E8B
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Mar 2026 01:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13379C19425; Tue, 17 Mar 2026 01:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D51DDC19421
	for <linux-firmware@kernel.org>; Tue, 17 Mar 2026 01:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D51DDC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773711031; x=1805247031;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=AKzrBEbqXums8WvfpprjCkrDkuPo22G9iNqzT0R9g2E=;
  b=WV3SEf+33+mQBFfSD201zfJCqbJbzJCm8hZW/1JeoeBY1vCyzzCAzx7C
   w+f5XIm7WPbydCZELcjN199NYYNw1plltGRbrlHWXMpbz6C9LIBiPYSLu
   FG769FsszRissPGHNFi2YLhUGmyUEqoCjSKRx8jMUKYt2L6n3+ad0tqDd
   WocDQI2QsA+R3v4lphw0qvknQ7MRYbG2QbfPrVsFI03cTzqu2FMwHvTyH
   A4+tvYsrk1bdQ92+mrbKZJ6KNT6sTc0UjgcEKzA03LUPY5iiXP+9aHGVR
   Dximm0A/5mOPHA2FYN3uemJViAKlY3i/8/BIplCFeJh8U9ngltnQtV3pa
   g==;
X-CSE-ConnectionGUID: 7MVBGP2wRWCdzanlPB2fDg==
X-CSE-MsgGUID: +nq8qAo/TGaoKpdn+XFrTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92308658"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92308658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 18:30:30 -0700
X-CSE-ConnectionGUID: oJGOLKJeSnKkuvRhzux4ig==
X-CSE-MsgGUID: /E4p7Qx0SXWj0vg6U/Wo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="227077340"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 18:30:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 18:30:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 18:30:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 18:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJGVMMup/H5CPytnYFUyHtgdcebNQ4hSslhV6+/YPrVqja4hiqYYD99cIKFhRG74oN3tw9+Rqw9WhXmEp/Y+MwNajWFS3wTTCVG5DtnoWLu5wHmhWdJXp+hFxQsXfL1vphDVxI6VGE3QkhljRol0yxm4UsWVIljvbFovCn8gLeimyVP12Zye0WZumggxVwfG0aF7B2g9pVXi5i2l/j2+ni1S/xNdgFZoB8tjK1lZy4IHG7P2WuONIvrrBRqP+YuHFp/kr7v80Gwe6PSv0KfmSiUx3NNzCmoVv2LobD0JfVmR4Q+bA/vmZuyTwIw4tMmbL3wGFxWGgLNWi/IFxU9k3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZpa9uLX/KKWSL+zhKpEFTJbG0eSA7063YUvZAlXuzQ=;
 b=DTqgEy6f6U2ATSbnyeVddeHwqkhWVnb8mFK1t4b9rh8FFtRbrFwH2F593QcMH3O1Xh8x1Xpzn9bOltMRm2TyrfTZD1nKDYsXIAk4GNFDKG+q5d9Xw01X8hUrfwtp0qZnDXN/Gjh+l47sU53geUIUVyDlCYeMtaJFZQ6fRD9c7GphmwFcAG/9c3kSWZb/U8leMhGR/Pz6DBYi+bp9CKH3FUj/yemcwe13vuS3Wf3TMrxHO/72fCbvrr7GRLnLoB7LnXhsOeXDW7iJT59OlW+m4YWs10H7wo1jhuNFLFjiS/HRF9r2PCpzna59AcxmdeACSUxB420cpKbeuRKdPyYmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 01:30:24 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::a7ca:db6b:7913:d6ae%6]) with mapi id 15.20.9723.010; Tue, 17 Mar 2026
 01:30:24 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "superm1@gmail.com"
	<superm1@gmail.com>, "jwboyer@redhat.com" <jwboyer@redhat.com>, "Wang,
 Selina" <selina.wang@intel.com>, "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: [GIT PULL] linux-firmware: Add ISH firmware file for Intel Wildcat
 Lake platform
Thread-Topic: [GIT PULL] linux-firmware: Add ISH firmware file for Intel
 Wildcat Lake platform
Thread-Index: Ady1rWLGCeRfiNcHTKWwSaz1KM/40Q==
Date: Tue, 17 Mar 2026 01:30:23 +0000
Message-ID: <SJ0PR11MB56137ED0F14537457946FE499341A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|CH0PR11MB8236:EE_
x-ms-office365-filtering-correlation-id: 7518a76d-eccc-44e2-3a6f-08de83c4c31e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info: Q7qkkp2b++jNatCGE1A4189dEPhuiXpOTbp0t0kEjrlwLuN5OfF5/1WtcFOgXdFvDPYEGrjDBhdHWRsZGSMSEJUMJY/XHHbYyr+nOSZvY5sEpJGO8fyDNDLTgpSK0ISM6qeCi9eH/jUwrvBaschpIfHjdCexQnkHgR4eOXvK2seLCulT6fTF6vtNSGOBZgALUoWv5vTYR4O5zMYxkafthTkxDmhO7d5Gsj3O7jJLHBhZgYEPIjuvCbTbfpm/zFvBvFCG5zq3HFaf5APHwatQTF9gDrRITyDD4l8lrjY7IzaD4Ds16HJHGPEWwByC3LupMJLL4srE+xW1Zm/WQY9AD48nDBiPolpZXWw+cQHoJ0qRPipb8E/WjeqJDwuTevu3/KwKufCK0mJ7btq8seZZxyQPijKo+FcA4TgdXpz+1Z44h8Y1b7duPDaJ7wk3iWCvR7WDhghKy+Z9MBmqi/os3kbEZNi/HrPda4k3Ht0Gk1EQoh+wnR+7cBnWY4op0TtZKHOYCldH3QWM3w2dJa1WS7kbJTx/DdmQeo9VuxydOWtHUNVcXQ/1t4THMz8axmKBxxtjr7oci/Bm6kaQNHpnygkbkqV8deeQC0E6BKKXN7XxOYluUytzoghtjbBLlHm+iwnhOuGoOpBsE8VyBjHo0A36GUjY9HPUyn8Vuqkn+Y8xZfQ/WlKjoQMIywSK7OueTgtPKnCglsPTiFHm+ZFNR+qX859bZjL7PmjdMbigFyuMxRVfdEdSIkJUOx4lhRpVvQPP+MatOF2uSm7gk4l7sG8H7f/va69riWkJpN7/mG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0wmy9hmC3ezlFztRnjfoT3xImfK6AnddKYlrXTuPgTWOgvhUQVPzuTjmp4e7?=
 =?us-ascii?Q?rPZxnBWwvs5NDJRbvsnLFZdyN3K7w9I0ZTkZkN6RFkTtyRHlStBkE5j9VGp3?=
 =?us-ascii?Q?PnAZlq2LhwvB15+6KWA323ciykQNGiZ4sIp3V/oNxszETb7HXHfnBoxorxFD?=
 =?us-ascii?Q?9uh9jVIJqNAuniNu6vyOisiRDpJaqJLjaHjnMe//AUM0TUZhrkWH4aQ7T4Y5?=
 =?us-ascii?Q?ioy3QCKQExTanEutW2Y1shFzu/TphijcbcWIUWMmcNHgEx+hDAcadn7fyuX1?=
 =?us-ascii?Q?V77tQALjuGdJcRzaSFutQqJZEb4wpom0poBP8QY639oK9QBKf8m7i764GMWO?=
 =?us-ascii?Q?U2bL7WtzP8Uf98Iis/E8a+Ben78z+bwMgp69lktZ2cHhwkXoH2UDWHR6Lb2s?=
 =?us-ascii?Q?CwJGcIvBELX5fZOA4SIoqo7kPPS16wr/la2Mcn1egYSq+yM9yP2iMixIzgDD?=
 =?us-ascii?Q?+wUfS8lejhtQ/SMfljHFFzBFp3Wmih6CDz4mRrbqzGCCzvXWcr2BoAdiX2NB?=
 =?us-ascii?Q?d5V4U/YvvUV+jfsUEYC212swWCA1td5OEMvqfTy6Ksav9f4LQyA4FSC5Ma7w?=
 =?us-ascii?Q?AgS2SExqj4PEfVNCcOlZT3L46rBGW91tEopYw32yzcxCYlNI8GbPFUiQyhvL?=
 =?us-ascii?Q?AYe9RFh/KM+G2Rt7EBSBfHJetmBXXT3B+VYw8h0hMCJDA29AAUxaRTxOVWcx?=
 =?us-ascii?Q?q/4CP4pgcDRwjTR+TWDNugClwS+c/F2gwMsQJTJjpzhZq+RiLT/dL0lAR/dA?=
 =?us-ascii?Q?kijHweWRhSfg4wVpjZzQ6KEQ7dn1EImFnjzNXXrviOnh6vPrrJ7hvThjeRqJ?=
 =?us-ascii?Q?4noeTyB3BEW5px2u7B9CQOaLRmvFBjU/7Pmmw42Ma7djvyySUxloXo6x90Ek?=
 =?us-ascii?Q?WTuB7DWg25O9nyzLb+nl3mjgHHWQM8hjgkWGvnB8hifWEUXtdRe1G7kXtp/y?=
 =?us-ascii?Q?W8QhJHg+kfAnOWESIRJIJ3I/MzDzDpaIaar9A2wAjKMhtpXFhUvWf36+eE1G?=
 =?us-ascii?Q?xFV0nsqeCSP4bceOrmu0wvzufIdXD6G20O50BKexXLayick1hCIrvKhiVKDs?=
 =?us-ascii?Q?uXqRI8xFbTEgYrr9HfthKPPAchr/ECOIJITNd4qLn3Av5ccOWHOFL2gj83R8?=
 =?us-ascii?Q?w/N6hCTM7LKRUHziWT/V1vZ5hmVEtYiwZECLYEeakWoujS/0WCJft4ox620D?=
 =?us-ascii?Q?yJCktEktLv2OpKzWHs7pAZAlUgsL1i2LUI4rWaBMZIaMKc24XMapErRIMahV?=
 =?us-ascii?Q?ED55Pe7crdB/M6bE8DKTL6xmauW2F9QYaSgecVUDbLlmNspWVMPOxkByQvjQ?=
 =?us-ascii?Q?Vqy7e58LEVKA3XPdTL+wwI2ukE9Ts02uLOXoRVk/KChQIOCFZyivSZlsO9Ho?=
 =?us-ascii?Q?iUPxwj5DwHycwJKnPSCyxnZ4B6g9h7Me7ISbHt0+Y1ry9n6yyHriC+PllkLI?=
 =?us-ascii?Q?U/GoHpMuvO6GfQ6FTyJL1XDO2p+V9Vvjgn+v/ENNTSG+M4oHm3HVr5eGimQZ?=
 =?us-ascii?Q?v1oWAfcihpK2OsCcTrgmQ/44PnnZO0tQojEyBZhye56caDx9QQ+pi8zK0esK?=
 =?us-ascii?Q?siTLcT9kH2Wo1k0lv6G8PEVMSTum5nFNowi70ZzDXSCtjl2/sDtB7/lRTjwN?=
 =?us-ascii?Q?c5vGJoyUf8APVC56Xt5SaRELLmFk/Ftr+WpiFTPZhMlbSC/dOg+uaQwCj0XE?=
 =?us-ascii?Q?ZZz4h3Vp441KQE4Xaa+JFi/f/dzaWvHuhd4RsFzNdR7ac1A0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vD9fxbDCkRaLkLIwOkEx+RtQx5fLWSN6ICWve0kwqKQiO1oPklKh8wltZXqM86UaeSEz7riMF0PH/yFH7gEoHfkMyfZWkxLFOnXZAJ3kVQQnqC+PU9qCs6KbbqyUnYiGGi+7rWByG1Fo0DTjMEFW7sU/RhKl6JPXEG7eHv8Ykud9COUZI/Lbq7IQ25o/SZwipLLIcSd1M99JSbSS8jEe7gxFqMe6+rTsMp7TqQNwEWAtFai68lsaD15yJIEwCJDYCzYRsiAFmxg2dm0IfHlr2xZBdgvD9qFN5xf8QwWK19bsKhpX26H2mHTrZhjAzzhZiZR8A1faym22KxwB6r8rrQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7518a76d-eccc-44e2-3a6f-08de83c4c31e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 01:30:24.2978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L1z4u1J9na7x4oEMMVhQuQAoJ+bJ2fSbCqR5HDZ2gbhef9Sl7YTE9jS7G3wsswYluo9kzcgucgp3Y4XFuv9mSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
X-OriginatorOrg: intel.com

Hi linux-firmware maintainers,

About a week ago, I sent a git binary diff patch for `linux-firmware: Add I=
SH firmware file for Intel Wildcat Lake platform`,
but I haven't received any confirmation and suspect the email delivery may =
have failed.
To ensure the submission reaches you, I'm resending this contribution as a =
git pull request.
I apologize for the duplicate submission and any inconvenience this may cau=
se.

Thanks,
Lixu

The following changes since commit 57303edc4101c1003ec45e91652f281ebd2f41b2=
:

  Merge branch 'robot/patch-1-1773363694' into 'main' (2026-03-13 06:29:11 =
+0000)

are available in the Git repository at:

  https://github.com/lixuzha/linux-firmware.git intel-ish-wcl

for you to fetch changes up to f71ae94fbda284707cfa3dd9f10c2e4d8a745ec6:

  linux-firmware: Add ISH firmware file for Intel Wildcat Lake platform (20=
26-03-17 08:55:35 +0800)

----------------------------------------------------------------
Zhang Lixu (1):
      linux-firmware: Add ISH firmware file for Intel Wildcat Lake platform

 WHENCE                |   2 ++
 intel/ish/ish_wcl.bin | Bin 0 -> 920064 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 intel/ish/ish_wcl.bin
