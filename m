Return-Path: <SRS0=iedI=SY=intel.com=kuan-chen.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA862D70E03
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Nov 2024 01:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61E41C4CED2; Fri, 29 Nov 2024 01:28:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E230C4CECE;
	Fri, 29 Nov 2024 01:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E230C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732843709; x=1764379709;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=JPDmZG+u038mOY9+Ja/Y8x/NweclpmXO50RYr2Dd/gk=;
  b=GNDum9FT7eLKpwqN8HV0PAgUiZEIF7eCkTlyzAK5JkUmbJkT1SwW/pGz
   Bpyp4ZU/V7GzU3dkBb1KQ1kWK5kc7mMWPTJ+f/i/VbG8tRj2PAG/KOW8/
   AXdzcx1o4DW66bQujuk8atoeZq56mUdoUKEdgiwMMiV7c9raaOmxK8vI4
   E+GjVMqjnyV+IuohtVTTsgFQd+magcW5Ib/NKMU3NS5BddcPAxEc8sWwg
   bmWYl8WsgzMNgsXpRpj9u0EATsmncFO9czoNTFb6BPswqlve7+we7tF3Z
   AWKF9YJjh5VBMMKTdH5lSmSLIdSl1FPEcSyWuVSYJpD4sxPA3RHNBMXZV
   w==;
X-CSE-ConnectionGUID: 0hSIylnUR2uOF9kbEip9Dw==
X-CSE-MsgGUID: qj2bmhT/SqqR+MDpAioazg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33133027"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208,217";a="33133027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 17:28:29 -0800
X-CSE-ConnectionGUID: TkoUrIUlQjORKwaKGuk8jw==
X-CSE-MsgGUID: brGp3bY3TG+Em5Qs4WXBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208,217";a="92819310"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2024 17:28:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 17:28:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 17:28:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 17:28:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqzJS3Ty0K9Sp9wGNCeXTFQ77Z3ioqunODbz9vvr1wNe+DOdON6+j9TDUuTk6cQI9xrVeeIKvrd0SXw3+QfoAf4NfkjnKlKtjczX2V0CSEaZLSUgEUZmjtfwg3FMSvWIzYOXnrdO/Z23RSSE64AoycUEeFApUHf72lty4tOZQClUN3m78GdCqD3VEE0HvVBv2mCtfvLkzBXqUwNWgWPxNlXrtTIJsur36jhhqsI0+3Qyjg1FRVblU8JX7zUKHeanQR3BELzN4q1a29MPORmOX3EZ+8KHz3FqB7B4TQPQZDEQmRODJRwfKQIYyYBlMvjT8tEXhx0XMyw0qXunfXCtyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkmzYkSWMkmygezehz+qpTsjOJbiY7wKLXg5hoq7eKY=;
 b=v7IDvgBSfya+14NaLxDk6pa2Bt7SY/mKdq0n6umK36X54r7EgF+iO3/E03gbt/4Aw/oga+Q3c21ziB73kY3vLQtcHmOi1JcT1KOs7ssByfWeAS+HjGqn3WKzuj3th/dnRdYMb9Xr6+4m/xy/mdVnqAMJJ33KeiI3SSPe5NRym6382iVp6fgIwPUotSf/WgRDwFG1YQIk0PrOYNAL8J6/ytcYsXcc90lWVeKdm2W/EsCn6AJ0SUADWaVejFp/xCEMm0Na9HnShZZTuwyIcUmb9SaszogNLsoLFCQuE2OCX6gBbOewMZzsyEfLefPb0H/iXqRk1X8makxp1iK0szX8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 01:28:21 +0000
Received: from PH0PR11MB5079.namprd11.prod.outlook.com
 ([fe80::d8b2:ef6f:22e5:4a08]) by PH0PR11MB5079.namprd11.prod.outlook.com
 ([fe80::d8b2:ef6f:22e5:4a08%5]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 01:28:21 +0000
From: "Chen, Kuan-chen" <kuan-chen.chen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Ben Ami, Golan" <golan.ben.ami@intel.com>, "Korenblit, Miriam Rachel"
	<miriam.rachel.korenblit@intel.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "Damary, Guy" <guy.damary@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "kyle@infradead.org" <kyle@infradead.org>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, "Yang,
 You-Sheng" <vicamo.yang@canonical.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "Berg, Johannes" <johannes.berg@intel.com>,
	"Chan, Hil-Yee" <walter.chan@intel.com>
Subject: RE: pull request: iwlwifi firmware updates 2024-11-28
Thread-Topic: pull request: iwlwifi firmware updates 2024-11-28
Thread-Index: AdtBuJ2/zdktIz4YTNCRHOTbBLrKUQAATPDWABEBPwA=
Date: Fri, 29 Nov 2024 01:28:21 +0000
Message-ID: <PH0PR11MB5079EC5B12BB9134D9981E87DD2A2@PH0PR11MB5079.namprd11.prod.outlook.com>
References: <MW5PR11MB5810EC530D4AEAABD72BEF6FA3292@MW5PR11MB5810.namprd11.prod.outlook.com>
 <CY8PR11MB686573E13DDFBDD039779E1BA8292@CY8PR11MB6865.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB686573E13DDFBDD039779E1BA8292@CY8PR11MB6865.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5079:EE_|CO1PR11MB4772:EE_
x-ms-office365-filtering-correlation-id: 7beea730-124b-4ee0-58c0-08dd10151cac
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?J+b8A3WQH8bci9mQvhSzkSU1Dcn0IwRHHOfvoXx8k9PcY7RwbYcY/bK9SR6I?=
 =?us-ascii?Q?r2zRyQEBPYbWY6mv0goyldOG6BPx++phm0sLwHppTNek2JYl9+tnbQayi6nT?=
 =?us-ascii?Q?K55gZsyd8+EzqgLFj3G+MEoT04i3ie1YR4SAcUobhoJt92EjHUghvBU8hfcm?=
 =?us-ascii?Q?Dmw3rZeo5+0K/sCO1EhOytsH0gEvL0nNmBdPw+FCbc5XRc0QVF8wWvyy5qI6?=
 =?us-ascii?Q?TLNNu8kLMeykFSqJXQ6Du5r+SYGhFPhZ/sXsR34NwBp8Idot4tsC0S4XvUVr?=
 =?us-ascii?Q?yXq8h0d0y4NyPqtKRQxn3esukfjE07QI5KaxYIB16jC9ygZxH54ah3+GgDX8?=
 =?us-ascii?Q?3pfAso7bU9qWVYhwnoaDOHV/RTA7bEsatlKM5gaZiMz6yO1tVIJyQZERo2HR?=
 =?us-ascii?Q?AOVrTDxU2G40hGPxVhrYBTZx6tPo/GlFT86Hnf8JglARF5jM+cDjukWHLN1P?=
 =?us-ascii?Q?QJL0qApjr3p3YkjDyoCo/0ANYs5roGEq45AzTSeZkervtlGOR6UpeugViLtl?=
 =?us-ascii?Q?Z6AgmWMNGWYYjWsn24hI0Wi86Ppe0ifYs6YahOYeAT7icxCH9GHtPPtwud2M?=
 =?us-ascii?Q?JQ7U+mdXuc1ZZFhTVkGW2mPZieBsvYx65vW3DndV9W85I0rLsqyQRJH/mSy4?=
 =?us-ascii?Q?uDrGkrYLt6vcwhq0zRAh25xoM+EJe1nL33iMiIIExul438ASg3/FxYMoyVmj?=
 =?us-ascii?Q?ProCsgk29iHKnVrbdp5uIjCG/TBUd+ubXfm4tu23KLmIr3XcOW17cVBg1UlE?=
 =?us-ascii?Q?Ob0Sve5MiegeZD2wg/Gyi7Ah3PyOkEF9SdemDSUYXtXkEeGHA+RQYcrXlwlv?=
 =?us-ascii?Q?bUowz2STdxW601aXsmdNUCRh2voNhn87BZcNXDtzsdLu4bmEmtMsqBWyfJqD?=
 =?us-ascii?Q?vcDggLVCQjhnzNRwmhVxKabu30LiE38B1L2brVfAhO6qfVb1l8LmgZPwb1ql?=
 =?us-ascii?Q?pyI3C32h9BBk2w2tGF3y8/9f9KuyUmH895YUqL22BVZ5P9zG+uInEBCfZ0UK?=
 =?us-ascii?Q?gMSYNnzDQQidFK2Eoz+gkcYO8m/0u7ByqkefAQ9JxPB+Sm7Mky0i6pvyaXqm?=
 =?us-ascii?Q?QuYxQ2JWBbXojFxdbiG/1/7hhxCVWsfloWsuPYShP96OaU8gX/3EKVElmk98?=
 =?us-ascii?Q?D26L7GYGybF8W+9EgtsJpKtWbxfE+wOrVFJtxNk7qXG+ae0iKzr5ELYsShZh?=
 =?us-ascii?Q?hCUxyXQ1mmgqUANL1vYEkxLeI34CdYg+Zhn0HBTdft3r4g/Gne0Hp1TJ9OFv?=
 =?us-ascii?Q?DL7IbJtjUzuRzN/CDCIG/mktkQSxe4RM2cEKhbrGjqeSOmllGrT4wTCgrSst?=
 =?us-ascii?Q?MzDs5xHNbj9rm5xwgkz35JNnAU731a68pyKx/n831SsD0jJXyE8BOiQEMwMX?=
 =?us-ascii?Q?/ywglc4CEdZgHQ8WFy9fUCuqMYkGsPRThMaInjSRtcnVDZkygg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5079.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l8bSuP/4PrVnuXCFATXJSnKYmllN0GdaWzv3ODHVA5iIakYe26v17uZXd/Oo?=
 =?us-ascii?Q?914o5wb5A8ohbiUeUocDNtGNsHBE3dhUvJKZhfSE0CKtPvaC7K75NnhKacrJ?=
 =?us-ascii?Q?+TJib18cITj6tNwtYeKbwoB6R4AK5nF9zlE8VQ6bCGBATiHips7nj0A4VgrS?=
 =?us-ascii?Q?FunABW54plN0oggfhOUR5+LcYFxabkfsExbbVgGoBPoOi3Vm6f2jZdeY6z0L?=
 =?us-ascii?Q?VeCz5K7zb8LGFubobRgqQzfwrJTgChw15s+7IeS5zWSeFN9J/g4IoyHE1aXX?=
 =?us-ascii?Q?x8KEP61Pr37Zyqmsj7faGcA6eqD5ddn660vdc/3yUUg6UGaJ5GXcMxO9FLDS?=
 =?us-ascii?Q?95sYrXIKg2Ua8toD01CI5zOTUFGa7muxvMwuLqNnVoLLgzaatofquagSHhrZ?=
 =?us-ascii?Q?11cuJ/0o8ohQKnYk29LcoeQy3Isl7BsxLJfSeaDfUAY2RQdlO7vxf10sLQGh?=
 =?us-ascii?Q?raC1GVdNABFQ/Wz8S1fdLVQEn1ozmGkxe+yOgP6s6qeyeAR5UozPyGLk3Hgb?=
 =?us-ascii?Q?Nq1CxLoiYK08nRZDsXV8cbEHsMF4H0n9ZUZBLn+PuGrV0P0zTZcOuviSFxKl?=
 =?us-ascii?Q?+AwCRW2nG7/mGYvlweQEJ5fB/wj7ljFnHDplNRhXb27kdOSW6IQ4q6yvhSAK?=
 =?us-ascii?Q?fbQQNX6QNRokBVcKOYkDjCm271AsJfO7kNtBTDOhCf/kqttJCitfhN1XQeU3?=
 =?us-ascii?Q?fMIh9GrVSX+a5DrnAbs8eKIphfPeuHZe1k8jbeGrbFxs1d+gyoQWvllVqUJp?=
 =?us-ascii?Q?re6Jo/Zm4cbNOC/m/au0MaNRJbi0EGXKtsX0NE3qdmsoEwDsi9PJ9pHQWGrv?=
 =?us-ascii?Q?x2EwIY0wGe8lRaOHshsbaJS8sUp3wISwdknOQl1qkRISOqfdNqFFhiYJKsGf?=
 =?us-ascii?Q?171Vhhtn9iJR0pYuI5z4U8YeE+Di5bAdfLUMA+QPVUYy/HRfcbo6JLkclY0M?=
 =?us-ascii?Q?EUOpcAvVTXZsjs18NFoKIyTQTb6YyluK2aekmE8rDGJaXYNXG1S9Z5K9RVTB?=
 =?us-ascii?Q?6bnOecdPfU3CIzKi7o0xHATgIWDZiiUQujUAQfK7rrv7j2vj0DgwVfSLCxgi?=
 =?us-ascii?Q?9hS3K/eYNaTsNxoiHspVfR8af6N4BNB+TL+jh9S3IywRoCpk5BRAgyGT0NdW?=
 =?us-ascii?Q?JpJUqRWbJ+7dv9B46jO0IAQyUbiF8imoEABeXtfJki74NSJmB7Pz+Bd4wJM+?=
 =?us-ascii?Q?1dC/6+o1DSQUauEmlxIMPRa9cDbDrvMbYvEhmOHOe7/CdIRkCN1koapaqiNn?=
 =?us-ascii?Q?PECgwJ4Ajw3hI1kgoMmuUli23B7Rrk6D566NUzDGBP14/lk4hEMP8koixSS0?=
 =?us-ascii?Q?JkBGLJyS2N8oUB33ovTOGUlYtmbyINX12biWOYlMQkaosLnloerAlhH4L7D9?=
 =?us-ascii?Q?ruYN2won0emm2WnS0JvCc4/zlO8FFuGMHkn/znwSeSgN11QjNSHYZIUhPCUu?=
 =?us-ascii?Q?D2BucM+atM0uXT9uT44/cskrqjMmGvkMzIWhRRG3bQNpAqIaDhgdEY1yZ3Be?=
 =?us-ascii?Q?E8eURp/AjTBkpY47hxMvL54HiffiVK3KbErwYwopOO2ZCKNZ9IPrW7ZK1CN6?=
 =?us-ascii?Q?dLGW8oEjKe7z7hAIPkwYKVA+OwQgvUjpyaA+VMhiWlBam3VOxngW81YkOoNC?=
 =?us-ascii?Q?ZA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5079EC5B12BB9134D9981E87DD2A2PH0PR11MB5079namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5079.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beea730-124b-4ee0-58c0-08dd10151cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:28:21.7585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O97S8exC/tKgodvdus+5vfykkUJIwDvhn8gHDa8XhOWqWS8dw0hJeiBPV9c97coiRm0Dvql9H7vTCyJ7SqjEFQ+FjKXfclBI3/P7oSHeqOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-OriginatorOrg: intel.com

--_000_PH0PR11MB5079EC5B12BB9134D9981E87DD2A2PH0PR11MB5079namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Golan and Team,
Thanks for the support. Will share with customers.

Best regards,
KC
From: Ben Ami, Golan <golan.ben.ami@intel.com>
Sent: Friday, November 29, 2024 1:21 AM
To: Korenblit, Miriam Rachel <miriam.rachel.korenblit@intel.com>; linux-fir=
mware@kernel.org; Chen, Kuan-chen <kuan-chen.chen@intel.com>; Damary, Guy <=
guy.damary@intel.com>
Cc: kyle@infradead.org; jwboyer@kernel.org; Hutchings, Ben <ben@decadent.or=
g.uk>; Yang, You-Sheng <vicamo.yang@canonical.com>; linux-firmware@kernel.o=
rg; Berg, Johannes <johannes.berg@intel.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-11-28

@Chen, Kuan-chen<mailto:kuan-chen.chen@intel.com>
@Damary, Guy<mailto:guy.damary@intel.com>

Thanks,
Golan
________________________________
From: Korenblit, Miriam Rachel <miriam.rachel.korenblit@intel.com<mailto:mi=
riam.rachel.korenblit@intel.com>>
Sent: Thursday, November 28, 2024 7:12:38 PM
To: linux-firmware@kernel.org<mailto:linux-firmware@kernel.org> <linux-firm=
ware@kernel.org<mailto:linux-firmware@kernel.org>>
Cc: kyle@infradead.org<mailto:kyle@infradead.org> <kyle@infradead.org<mailt=
o:kyle@infradead.org>>; jwboyer@kernel.org<mailto:jwboyer@kernel.org> <jwbo=
yer@kernel.org<mailto:jwboyer@kernel.org>>; Hutchings, Ben <ben@decadent.or=
g.uk<mailto:ben@decadent.org.uk>>; Ben Ami, Golan <golan.ben.ami@intel.com<=
mailto:golan.ben.ami@intel.com>>; Yang, You-Sheng <vicamo.yang@canonical.co=
m<mailto:vicamo.yang@canonical.com>>; linux-firmware@kernel.org<mailto:linu=
x-firmware@kernel.org> <linux-firmware@kernel.org<mailto:linux-firmware@ker=
nel.org>>; Berg, Johannes <johannes.berg@intel.com<mailto:johannes.berg@int=
el.com>>
Subject: pull request: iwlwifi firmware updates 2024-11-28


Hi,



This contains some new firmwares for Bz-gf device.



Please pull or let me know if there are any issues.



--

Thanks,

Miri



The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943=
:



  Merge branch 'robot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19 +00=
00)



are available in the Git repository at:



  http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git=
 tags/iwlwifi-fw-2024-11-28



for you to fetch changes up to 42b01d49689c754438c7b9c32aadfa722da98429:



  iwlwifi: add Bz-gf FW for core89-91 release (2024-11-28 19:08:21 +0200)



----------------------------------------------------------------

core89 bz-gf



----------------------------------------------------------------

Miri Korenblit (1):

      iwlwifi: add Bz-gf FW for core89-91 release



 WHENCE                       |   3 +++

 iwlwifi-bz-b0-gf-a0-92.ucode | Bin 0 -> 1757392 bytes

 iwlwifi-bz-b0-gf-a0.pnvm     | Bin 55192 -> 55192 bytes

 3 files changed, 3 insertions(+)

 create mode 100644 iwlwifi-bz-b0-gf-a0-92.ucode

--_000_PH0PR11MB5079EC5B12BB9134D9981E87DD2A2PH0PR11MB5079namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle24
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<body lang=3D"ZH-TW" link=3D"#467886" vlink=3D"purple" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Golan and Team,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks for the support. Will sh=
are with customers.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">KC<o:p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Ben Ami, Golan &lt;golan.ben.ami@intel.com&gt;
<br>
<b>Sent:</b> Friday, November 29, 2024 1:21 AM<br>
<b>To:</b> Korenblit, Miriam Rachel &lt;miriam.rachel.korenblit@intel.com&g=
t;; linux-firmware@kernel.org; Chen, Kuan-chen &lt;kuan-chen.chen@intel.com=
&gt;; Damary, Guy &lt;guy.damary@intel.com&gt;<br>
<b>Cc:</b> kyle@infradead.org; jwboyer@kernel.org; Hutchings, Ben &lt;ben@d=
ecadent.org.uk&gt;; Yang, You-Sheng &lt;vicamo.yang@canonical.com&gt;; linu=
x-firmware@kernel.org; Berg, Johannes &lt;johannes.berg@intel.com&gt;<br>
<b>Subject:</b> Re: pull request: iwlwifi firmware updates 2024-11-28<o:p><=
/o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a id=3D"OWAAM342160" href=3D"m=
ailto:kuan-chen.chen@intel.com"><span style=3D"font-family:&quot;Aptos&quot=
;,sans-serif;text-decoration:none">@Chen, Kuan-chen</span></a><o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a id=3D"OWAAM538213" href=3D"m=
ailto:guy.damary@intel.com"><span style=3D"font-family:&quot;Aptos&quot;,sa=
ns-serif;text-decoration:none">@Damary, Guy</span></a><o:p></o:p></span></p=
>
</div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Golan<o:p></o:p></span></p>
</div>
</div>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US">
<hr size=3D"2" width=3D"98%" align=3D"center">
</span></div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif;color:black">From:</span></b><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif;color:black"> Korenblit, Miriam Rachel &lt;<a href=3D"mailto:miri=
am.rachel.korenblit@intel.com">miriam.rachel.korenblit@intel.com</a>&gt;<br=
>
<b>Sent:</b> Thursday, November 28, 2024 7:12:38 PM<br>
<b>To:</b> <a href=3D"mailto:linux-firmware@kernel.org">linux-firmware@kern=
el.org</a> &lt;<a href=3D"mailto:linux-firmware@kernel.org">linux-firmware@=
kernel.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:kyle@infradead.org">kyle@infradead.org</a> &lt=
;<a href=3D"mailto:kyle@infradead.org">kyle@infradead.org</a>&gt;;
<a href=3D"mailto:jwboyer@kernel.org">jwboyer@kernel.org</a> &lt;<a href=3D=
"mailto:jwboyer@kernel.org">jwboyer@kernel.org</a>&gt;; Hutchings, Ben &lt;=
<a href=3D"mailto:ben@decadent.org.uk">ben@decadent.org.uk</a>&gt;; Ben Ami=
, Golan &lt;<a href=3D"mailto:golan.ben.ami@intel.com">golan.ben.ami@intel.=
com</a>&gt;;
 Yang, You-Sheng &lt;<a href=3D"mailto:vicamo.yang@canonical.com">vicamo.ya=
ng@canonical.com</a>&gt;;
<a href=3D"mailto:linux-firmware@kernel.org">linux-firmware@kernel.org</a> =
&lt;<a href=3D"mailto:linux-firmware@kernel.org">linux-firmware@kernel.org<=
/a>&gt;; Berg, Johannes &lt;<a href=3D"mailto:johannes.berg@intel.com">joha=
nnes.berg@intel.com</a>&gt;<br>
<b>Subject:</b> pull request: iwlwifi firmware updates 2024-11-28</span><sp=
an lang=3D"EN-US">
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">Hi,<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">This contains some new firmwares for Bz-gf device.<=
o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Please pull or let me know if there are any issues.=
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">--<o:p></o:p></p>
<p class=3D"xmsonormal">Thanks,<o:p></o:p></p>
<p class=3D"xmsonormal">Miri<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">The following changes since commit 7c3031c18ab85179=
2c49f594a4d43200d55a7943:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;Merge branch 'robot/pr-0-1732634796' in=
to 'main' (2024-11-26 16:12:19 +0000)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">are available in the Git repository at:&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;<a href=3D"http://git.kernel.org/pub/sc=
m/linux/kernel/git/iwlwifi/linux-firmware.git">http://git.kernel.org/pub/sc=
m/linux/kernel/git/iwlwifi/linux-firmware.git</a> tags/iwlwifi-fw-2024-11-2=
8<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">for you to fetch changes up to 42b01d49689c754438c7=
b9c32aadfa722da98429:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;iwlwifi: add Bz-gf FW for core89-91 rel=
ease (2024-11-28 19:08:21 +0200)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">---------------------------------------------------=
-------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">core89 bz-gf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">---------------------------------------------------=
-------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">Miri Korenblit (1):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;iwlwifi: add Bz=
-gf FW for core89-91 release&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;iwlwifi-bz-b0-gf-a0-92.ucode | Bin 0 -&gt; 17=
57392 bytes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;iwlwifi-bz-b0-gf-a0.pnvm&nbsp;&nbsp;&nbsp;&nb=
sp; | Bin 55192 -&gt; 55192 bytes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;3 files changed, 3 insertions(+)&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;create mode 100644 iwlwifi-bz-b0-gf-a0-92.uco=
de&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_PH0PR11MB5079EC5B12BB9134D9981E87DD2A2PH0PR11MB5079namp_--
