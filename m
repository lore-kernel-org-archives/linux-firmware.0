Return-Path: <SRS0=f1mG=IA=intel.com=miriam.rachel.korenblit@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD949C35274
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Dec 2023 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A220DC433CA; Thu, 21 Dec 2023 12:18:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE3B9C433C7;
	Thu, 21 Dec 2023 12:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE3B9C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703161101; x=1734697101;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=7YV4RcmvTKFZP7fXGcyhMSZqTzVtIS2HZCRbfP294T4=;
  b=hSJzLfWJ72iRE8Z9WeOBZQFEGr707dqc6u1oHns6ZSnDX1FrJjigrWBI
   qH4YaXhvSX+p9ehFU+dDLcaT8uGTUA1iKafVS0gM2e4ahTvfDArjWV0wM
   7noe1QdnK7iC3yNhQnYYddufjiYFs7clstiCazP0dx0EU1njz3RWYOV0/
   iEQ7bbip7Le04hmke+lE1jyk07IPJ/MiBq9v3zTzB9nkzolIo3cUl6aOT
   D7UqpmmVVUdQBT92So94eRZE6qljhehhYXiYx2KpwoBz2kU+AGP5VgaX5
   5MsKGSzvmIN5ixJHrb04FQOeNM/ecpwUV9Sf3MEwj89140XEpcKdk5u/s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9438460"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208,217";a="9438460"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 04:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="867291758"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208,217";a="867291758"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Dec 2023 04:18:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 04:18:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 04:18:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 04:18:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 04:18:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLmHwjwM7PZfAJ+ab47aUzBn2MmwFUBxYiTRurpNv+B/QpOJ9NSGfAeQKD0Zs+VF2bF/e895gYoosWbUSvE2dc9NSArX28VxLJaKzctO0qshAM2V9xBdRUjB1f3H5V9jDyIV64+wZ/354DYTECOfRET+6/qYtGpFx7W5g0RR5Tgg4ta00BnuItAopLkUyw4r6yOSh6gKJ1wXTUQn2yOEdZd4Y+kjGULEFearnjTe/4dr1LRKa13XGfeBnow5UGPmW7iutODoW5/Q3pWGUhzliJfUHgFQBlZ++uThwjoMAOBFQodleWsfLXcqk/BREjkeKau9+mriZJOIZD1SZChvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrnmkkBZKlduRv33CGIgk8j19GLyQ9P7I31pQOY/854=;
 b=MTl6GGAfTlP27z6BytuHwt9iSWHhzH40NqSB23qOSvWxYBs1ZYsZB5a0BjN16tpR2sR48OAsXoZ56knKWk8ORnPGGE9Rycrram1M1V2gMO+WLpkyAYQ+TJJgcLsC1+9ZHycM3reqONHvxGomXaisuF5FB+X8U/g7FsOZfaEKwhyLIyAbhZpX/Jgb4MN0A4TA0yn5fR/zBgBT10XG5YyOc/fqsZUgg8/7dl+pgvMB2eETp2MqivSJkcz3WdgJug+0jlXsV8Ic4nr1mtiQHtlHg563KikSPT8YR6cLsuMwqfZfTMAiJSS7VeD5fYXt6g+PcCDuTZ62j2ZgTp8WDHBC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 12:18:16 +0000
Received: from MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::94c7:eefa:414b:4757]) by MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::94c7:eefa:414b:4757%6]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 12:18:15 +0000
From: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "kyle@infradead.org" <kyle@infradead.org>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, "Yang,
 You-Sheng" <vicamo.yang@canonical.com>, "Ben Ami, Golan"
	<golan.ben.ami@intel.com>, "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Subject: pull request: iwlwifi firmware updates 2023-12-21
Thread-Topic: pull request: iwlwifi firmware updates 2023-12-21
Thread-Index: Ado0B0eHrr8gG+S1Rma41KCFvYEDqg==
Date: Thu, 21 Dec 2023 12:18:15 +0000
Message-ID: <MW5PR11MB58102B83E0F8E4B2612EC96FA395A@MW5PR11MB5810.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5810:EE_|BL1PR11MB5979:EE_
x-ms-office365-filtering-correlation-id: e376ef1f-b305-4085-cec7-08dc021ee8b6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ahOUakFUUeDoEaqSX9w6q4yV4OS6kOaKky7yMoPhb7iMlD3NR/ZAQNmsgNc0jTYjvGOw41FWHShgUtA8PnQOkfS3KdCp1ypAOOyvn+BlLapP0I/yQdrDj3D0X+a6blOKzUK5DbSLkgIgz3FiSOb10Tj9zIsv4M4myoA9gIGtX4P81in0LGDOJ/Iju1rYo7SiwanD1unZPuakph6ZEa5lleNz9ESDvoT1eL49TjUbXyb2TAHkzulCTmbVXHhvx+spBxWzVtsytejWZ6IRE9wgdFlCzFQE0hYKVFBG/GRDDXJTbCOJKfvdCyjU3v26fZYP4Dij8BsuydzeZdI4lF3j+IRtJGUj7c3Sw3Sh4hQ5v7Xb3MIjua8dBtl+DbZkJRnQ6QKKk7MPWfoTjyOK78gxa4Hag1b46mA0KB47isVEf+8AXZXZ4eSqWTPqLA++Kb2gg0SPAX8LrrXjTOI8NsSQjZ3ou+OFNvXJ2c7lnFmEZIckK1FCs6CXAUzKU9iOx9rXgulyrSAVVeFpSl/QzRDC7yoXIv94wXL99sIO/lboSOqefVW5hp4mjIB+v5x9w/n36cssUEs4xBWs7hkLcpQZvhlkZMe0eTMUu/iqSdVyBwo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(82960400001)(122000001)(38100700002)(7696005)(166002)(6506007)(41300700001)(33656002)(86362001)(26005)(38070700009)(83380400001)(4001150100001)(15650500001)(107886003)(4744005)(5660300002)(2906002)(9326002)(8936002)(8676002)(316002)(6916009)(66446008)(66946007)(54906003)(66476007)(66556008)(76116006)(64756008)(4326008)(478600001)(966005)(52536014)(55016003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HEpirk+3Boj53J83hP1sh3R35Iou2Rrh63RKxyJ1sUK5w+E3g06VbUw30DM1?=
 =?us-ascii?Q?J2y8l7GVpHU0g033Yy+zUhP15qLsMBv1xuz8MBThGPIqv9ZNrt01iZ58qmA3?=
 =?us-ascii?Q?97Ai95RNyxrWgSwxYyhPF1DDfzGDqdxjbVz0yHxae7/XsJ+3A7ivcmxCw8Yg?=
 =?us-ascii?Q?OqQ3Uo2zBKxEivZXP3EVY6G7e6U2C2wnbGg1UvO7WStWOque8DBx5rsS7Xf5?=
 =?us-ascii?Q?k/N7mLmkemUuu2YRPDfkYBc767qyyDEELlmo2xd7sqQ5UvXhbrK1DJL8TmYg?=
 =?us-ascii?Q?mgodkh+3K54uwKLyQPO/bIGpdh/Y6NR6KM5S1D7B+01vcCcB+mfG2AywJtMv?=
 =?us-ascii?Q?Qumsxh69Z8sxNZsDtDmLUjpJSO6R/PVf8g5g7lU5XyDfe9hrBTen0AfvGsug?=
 =?us-ascii?Q?e7FqxRfZEW0RxhZfe/YxrAnk2pZSdegoMFX6byrcy/4fWemMf7faTVZ7NCtG?=
 =?us-ascii?Q?7MMfIwH1XBq46A93+DiThkTrf0NqhoLgE3W4iPW9SySYj8Awu57T0ijUz7lf?=
 =?us-ascii?Q?q0JJQ7HsopLHtg/McMasDwTbbtq3r0Scm6qzYpDjQJEHp6j6v6elJHcegGSf?=
 =?us-ascii?Q?z3Zstx7Gznjby2isq9oyNh4NgSSNv3bu4q9M27cIs7UzOciT36vcTn3AGfm1?=
 =?us-ascii?Q?c1UthWadaag1c6Hfr+SQi4zRC7J0CvyW//D3LNOoqvIYsELqth7EiuDmLOJX?=
 =?us-ascii?Q?gSc0Qi/tuv8+D5RnwP1b8K3RvGFzI4PkV5+In/Os+pXMycy9TLJrhgjGyXPU?=
 =?us-ascii?Q?3YjBQwmTX52idekLFBsXXnOGR2X/Y+PWD6rtDUBcYyFR+NJCTbPsEJCVN+8Z?=
 =?us-ascii?Q?L5HQ/p8kWOstB61H8b3t3HxRR5SNkLqGAnbuYAJaKhg9VCFmUMcDE411OIVC?=
 =?us-ascii?Q?dRwCSoh8SoWwQ2tklx+2Zr5n9o8H4OEbaAZ5k43t2wdS7JIGuwtzm2X51O76?=
 =?us-ascii?Q?ClyTEqhXdDAxp3IS1AWaTnv9kcL1wC7SyYhjCqAkUbnnGtFTNL4P+iH8gsEO?=
 =?us-ascii?Q?9Sz233NShbLMyPBdM5GEZe6AOY7xJhIqAKtvT2+ajaph34Mn8XlhAsjYW4Mk?=
 =?us-ascii?Q?FQRb7vuvbeKBFaKKH8wXOzT+6R3eX3FbGhZsrRMUy3doTzCYikTu9JDDJ/Fp?=
 =?us-ascii?Q?w5U3CHrTdODq8f0lXuqJZ3KmNgYNsI2NGG9GN5kvqys5YOzITOpenYVHjPH5?=
 =?us-ascii?Q?pNA4RvgJb9rFI3QODlpCqDQtFAhPtyvsCJWfC5R2cHXlWUQUoU2K01P/nmKL?=
 =?us-ascii?Q?o9Gfqdvglz4E3Va0bQ/oXrFiojNvkqZyVAOxfQms/z3KsJgNbVDmMfKv2xxG?=
 =?us-ascii?Q?8EIOBxcd4ezV/vW/als8mkxxw8E8varA62H66e/Xsj7EHzGdSevn/JqezP6D?=
 =?us-ascii?Q?dSZ0v6jRfgJOCKEes3EnhZXYja0qHwt+XMH/kPf/hJk2KDn7OhIHg0FFabwh?=
 =?us-ascii?Q?gDH5VRUrGmUqsE27beh8I/933qFZDkYKGfWHr9rQbfNgIfu4uXEu8ZYgVHbT?=
 =?us-ascii?Q?8P+5qdmgs1vt/AvAgtNorAdYXaIs4GnHbrGFOvCnZCP0OOwLZ4TylEXsgELU?=
 =?us-ascii?Q?ay1RIHvlXOLG0EJM7ucPCrhrnHBzdV+bFkFVhGQbHqJGs8So2dGIyHDEkZO9?=
 =?us-ascii?Q?rLr/MCWg6F/TSVXyGbXgCjg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW5PR11MB58102B83E0F8E4B2612EC96FA395AMW5PR11MB5810namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e376ef1f-b305-4085-cec7-08dc021ee8b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2023 12:18:15.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LETeTUgx0TqbJCWCHD1ptfafKiaL4L/yG7lPCAPADDZzlesPQ2QFUBl2Xu571Uqw3ObnGGjJhzjCSI0JiNOD/toUi6T5oVbBw6mBFvkvV7m3fW1AVIo3QkyQnKE9SaOi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
X-OriginatorOrg: intel.com

--_000_MW5PR11MB58102B83E0F8E4B2612EC96FA395AMW5PR11MB5810namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This contains an updated firmware for gl device.

Please pull or let me know if there are any issues.

--
Thanks,
Miri

The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa19693=
:

  Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +00=
00)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git=
 tags/iwlwifi-fw-2023-12-21

for you to fetch changes up to 318c64abfb33c4211b002f5e5b4ff25cd19f712b:

  iwlwifi: update gl FW for core80-165 release (2023-12-21 14:04:36 +0200)

----------------------------------------------------------------
update gl FW for core80-165 release

----------------------------------------------------------------
Miri Korenblit (1):
      iwlwifi: update gl FW for core80-165 release

WHENCE                       |   2 +-
iwlwifi-gl-c0-fm-c0-83.ucode | Bin 1799504 -> 1797996 bytes
iwlwifi-gl-c0-fm-c0.pnvm     | Bin 226668 -> 246228 bytes
3 files changed, 1 insertion(+), 1 deletion(-)


--_000_MW5PR11MB58102B83E0F8E4B2612EC96FA395AMW5PR11MB5810namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This contains an updated firmware for gl device. <o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please pull or let me know if there are any issues.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Miri<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit c156e6be6d4a0a229=
0e7059bc74fb0612aa19693:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Merge branch 'robot/pr-0-1702625169' into 'ma=
in' (2023-12-15 12:16:57 +0000)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/iwlwifi/linux-firmware.git">
http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git</=
a> tags/iwlwifi-fw-2023-12-21<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 318c64abfb33c4211b002=
f5e5b4ff25cd19f712b:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; iwlwifi: update gl FW for core80-165 release =
(2023-12-21 14:04:36 +0200)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">update gl FW for core80-165 release<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Miri Korenblit (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iwlwifi: update gl FW=
 for core80-165 release<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<o:p></o:p></p>
<p class=3D"MsoNormal">iwlwifi-gl-c0-fm-c0-83.ucode | Bin 1799504 -&gt; 179=
7996 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">iwlwifi-gl-c0-fm-c0.pnvm&nbsp;&nbsp;&nbsp;&nbsp; | B=
in 226668 -&gt; 246228 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">3 files changed, 1 insertion(+), 1 deletion(-)<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW5PR11MB58102B83E0F8E4B2612EC96FA395AMW5PR11MB5810namp_--
