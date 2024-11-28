Return-Path: <SRS0=Mr/M=SX=intel.com=golan.ben.ami@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1EDD70DE7
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Nov 2024 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2C1BC4CED3; Thu, 28 Nov 2024 17:21:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74E7FC4CECE;
	Thu, 28 Nov 2024 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74E7FC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732814460; x=1764350460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=C1YGuaV2g1VFWnyOR9mNw/omlqicdFWSrfpXq3IRwZw=;
  b=n1JMg9RV5mL+e5LH8+T758cwS02/5a829Sd3S07bdBo9ldg4WSB/3Umd
   fOEmQO7TranirsRE1pO4vhn080YcJPGLGp8ScadxOb8cflfDU9jBWsoKm
   CcOzlqTY1Rhm03yRWMZc9U5Ww5QVLCsl7c47aBvHFTe9InUrOYUm+Ysxp
   szfi1mx30sCEP0LW/Urrf7eDyRxrvQMCwjabzhDCd64eYDeFzMB7b0ZYJ
   3Of6YOfRrlGx5cdUaei2oEvSwG+/BjYlAtf34gM3d8JysqPnGQ3fX1EeQ
   74XixWGFK7aD8oK6tRfbdc4Bzp9k7WZDyyC6/HIIuZTPxVnelsLNxXmsH
   w==;
X-CSE-ConnectionGUID: Ku7R5h82SDCdsZAs4yQKaQ==
X-CSE-MsgGUID: 2at0gMxIRFCBL0xlzSOAOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="50456005"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208,217";a="50456005"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:20:59 -0800
X-CSE-ConnectionGUID: CbeYytlLRZm9VWs9+BxWyg==
X-CSE-MsgGUID: PNuvsFvQQf6kNKCYPQZmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208,217";a="97264883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2024 09:20:59 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 09:20:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 09:20:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 09:20:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPCDVsAUD5JWV0DH9oJNL2z+ldo1q7EDw0qs1bzIxGWeg39kSPAUGMz+mWqEjg1ml8EN4Tzqg8uf9xDZIN7bSxScoExxUkbGPDE/+Ts8p8CLuZf3vfC4IPLF3ZstfjxF4CYQzAMUh2D3miCpur8AL6lPU23j9s8Aex25q14dxAVp51Z5uOcqth3X6HvV5lLiDPdw6YOPtjA49UGBsJneCW30qHnZnWXejRuBsraeI5Z12sdzAhFZIxdBXF0M2nG7ztaGtTIW4TzPbLsPV5y7d9fYVRe/gwwbc1cjRSU285Ec45PS32V4urY2Fx93sBB1c4hsSxhtvx6WkFj1knyEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dHT0MxS1ZWe+GbNOPM+kmGk5ofKD2mHIRAPQf0xYyE=;
 b=kQK34C/CRw9DqFkWvzXwS6akSKIXiFLnV9+FKkNOLs1CEc0O806B+B5U1KSuwbBLcW2qyXTGTTQM05WIa3XjQhWvBSuPK7yqemiRhSnCGvUK96e0n52rKB/6Wm4QAsPo+JTFqNELsC7Zk+iAKtX4jo+9mmzsACO/VvAs3CVS86qKL0Is8uyjzOZjMzvm23/3g5PyR0stKLqSew/1nQImlNdAZhbC/L0p6V6QmVcAaKBorW0sSQo3Z4bbou46Fc8EdKY99uwB79N0GbiSuMZMTtSTBt0JTl56YR/jDjK9JCVAOtmdTWi/Ma4AbC0G52DdnalY5uyZprEJNcHviLjw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 28 Nov
 2024 17:20:51 +0000
Received: from CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73]) by CY8PR11MB6865.namprd11.prod.outlook.com
 ([fe80::3918:9807:8667:3b73%4]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 17:20:51 +0000
From: "Ben Ami, Golan" <golan.ben.ami@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Chen, Kuan-chen"
	<kuan-chen.chen@intel.com>, "Damary, Guy" <guy.damary@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "kyle@infradead.org" <kyle@infradead.org>, "jwboyer@kernel.org"
	<jwboyer@kernel.org>, "Hutchings, Ben" <ben@decadent.org.uk>, "Yang,
 You-Sheng" <vicamo.yang@canonical.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "Berg, Johannes" <johannes.berg@intel.com>
Subject: Re: pull request: iwlwifi firmware updates 2024-11-28
Thread-Topic: pull request: iwlwifi firmware updates 2024-11-28
Thread-Index: AdtBuJ2/zdktIz4YTNCRHOTbBLrKUQAATPDW
Date: Thu, 28 Nov 2024 17:20:51 +0000
Message-ID: <CY8PR11MB686573E13DDFBDD039779E1BA8292@CY8PR11MB6865.namprd11.prod.outlook.com>
References: <MW5PR11MB5810EC530D4AEAABD72BEF6FA3292@MW5PR11MB5810.namprd11.prod.outlook.com>
In-Reply-To: <MW5PR11MB5810EC530D4AEAABD72BEF6FA3292@MW5PR11MB5810.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-Mentions: kuan-chen.chen@intel.com,guy.damary@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6865:EE_|SJ0PR11MB6670:EE_
x-ms-office365-filtering-correlation-id: 77ad9fcf-41c3-4067-8230-08dd0fd101e3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XOeJmO7BKiFcdIQiNwgXgWlisOLeXt4g3Ir0Scpnkh3XdspxXWcOQAErOsXs?=
 =?us-ascii?Q?Ir479Dr4pBBrVqdZNIPxZWZpMpcXh7Ns1/1wM0JraZ8k5BWa+y+r8wv5yOx6?=
 =?us-ascii?Q?NrwmWtH/40yaIZbQVX3D+1MWUWocsWPObLO1+4yyziKBrnXAqzjIUUBv1ReQ?=
 =?us-ascii?Q?cPlzO9FiAxgUBD+2PYR9hbz5P1HaW0EYQ4ZKupmMFPsUpNlWP4wQs8etI2tx?=
 =?us-ascii?Q?GNnfonLncnzDUyJoCKM9namqEx0jzijuD2m/On3vvKRNoq56N7Kyyo1XGmFn?=
 =?us-ascii?Q?vlYtmE04fWjF1zdvOuulhSWPiZYpBHEW8QhqPhk2+DFzzMCSi0zRT4Yjwfkh?=
 =?us-ascii?Q?eyyBWl2AJK6sryzMW9qzVmqNKA+bUFBSPU1E4HQCg783Tld8fpjNWCHKa0AJ?=
 =?us-ascii?Q?DuIlIANppLu2K6BjhXApuLcXa2ScULWErB9/nW4jlytpwywQuF9YO0pccCNw?=
 =?us-ascii?Q?YGp2VZ+6cXqurY+yAB+QfqcsO5VUzZhy88iOR0XublvFWEW/p0/O8PXvVPvx?=
 =?us-ascii?Q?5k9yUf479tRn3LW+PCSWTLJBzYhbBeWMoZwP+yistTdfRxAL+YcHtLe1UGJf?=
 =?us-ascii?Q?26Z+X819y6iQAYxuZV2XV4Z1nq3qVDXioK4dRBpGmplMCx9q/GiH65JuYWxT?=
 =?us-ascii?Q?B47wuAz3Go6ZHSCppn0GnuHyCKFNQfG8ihP8nXaVXkY+/GPK5mHqTnAtqe6F?=
 =?us-ascii?Q?8rdQpYvwn13zqB8xuYCPUNKhDIL2praWPmudgn+Ff4GCrzn6b65HCmbiQB7Y?=
 =?us-ascii?Q?h9anDpsrV6vP+j1h+ZxDNcQSw7RxxkhO8KxbkZd2VQinmv+6oCaPV1Vna9qK?=
 =?us-ascii?Q?cfZPAgheY4tWxeKPMy4HYdqNDZQDEdKtK7xWgpJEDy0JKryp+ccI/EWdzklc?=
 =?us-ascii?Q?JUMAZLce3eWZ5yZU9iOsa3ode3kSiM/ATkMqjprg7Vioqv2tu1SEts8uw942?=
 =?us-ascii?Q?+8pAs7xH+I7WT3hT9h+bKKHr+dQYslbBTbLoCWiqCBjarIzhuOgrRAnO7qCC?=
 =?us-ascii?Q?CW51XA/PNwJIMKueEw9W0s3uZUbBqPajeIVw/jZiYitOciNHI8vndhcygLwF?=
 =?us-ascii?Q?omTU3I8t+iJj6QM0gdvq7CjHY5nvkfEiHuHgUPO4/L7zpPRwle01hC3VJO1x?=
 =?us-ascii?Q?3hNRdbdSqOBQlnPkMnLkGCPsQVq//evlQbLlX+GUgSXeSTK4zkWefzm25Orl?=
 =?us-ascii?Q?SnO3JcrPOIavRF35ewSoSdYqCWObVrtsjddd68z70fLmciJnd17r4/nzs6WM?=
 =?us-ascii?Q?KdXH4/ln3IXy+1qXE67tcd1/kaEfy2wFGqCS8lQDVi/zdZB3YqObhuLscUZm?=
 =?us-ascii?Q?pyfzCOm4+uc0tfDHX1GRNuvQgOvNUGcWc7PwVPlDh66PQ7ZQ/ciQ5+TKGYw5?=
 =?us-ascii?Q?fPameX0RJ1vYHOzxYFJuk0QXiutvkfIxx+O86QHKOv0CCkaZsw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB6865.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c3o2+Tgtaz3rnbj9qn/ZmU+dcDDs4vl9ma7nkgnguCTmuJEjcIa2Fo90j279?=
 =?us-ascii?Q?rX/K8go6v+xcR+aJ7hU1A85u8PlzBm9rLblo+eCCxsKPRE3iUu+t1QUs1/ua?=
 =?us-ascii?Q?jAaRADgJZcNlYvBlNqkRJHG563NwhoQnCF8zzalxX7orCOQpy+zKXZTEIUEO?=
 =?us-ascii?Q?kcKya7ggk/L+89sr6c9aTGGTxLPQwOEsrjw/q/5ZR6Gj/F9Cqq9aiHVoZg9H?=
 =?us-ascii?Q?IgnaH/dz3QheylAb9oeZwdBu/DOGNwry6nB29NpdT1A6to1/v+4JTFKJt7jX?=
 =?us-ascii?Q?K7+usnj8XVjUJm05I8aeKFocvA9wSC08htrj/pf0Np2PSVD2QTwKrkvPR/fR?=
 =?us-ascii?Q?5BPDugGqmwJA2N1bwPvvYvZOFviBUBEZwzGmEh1iQuslWkl3cT5j4QW575lg?=
 =?us-ascii?Q?3RiaQS7coHih1A+BWzLB5i8fN06aN7g0q40MdDa3FjrxnEr8NbVJ2twvjAVJ?=
 =?us-ascii?Q?9Te9VA5jCFlSlRqToxTNaDq5PmykkQ/yX4b/nK5N2vIW++oTy8nwh8XRUSpM?=
 =?us-ascii?Q?7Mkt5k3QhRubXx0riwdV+fELE90FVSNXtE+yr1aM82vz7m6lTx9rHIjU03hw?=
 =?us-ascii?Q?WfurwYMe1s5NaREs3Y6TC2SyUfnmqWdZc6r/wkoqIPectR9yik6esXeBBYui?=
 =?us-ascii?Q?45G8yDmnc0gDjdWgRKAbmkYGQgTK/MG/H2A2s8iD2I9Em0tnWqDy2zqDkosM?=
 =?us-ascii?Q?loKnXGzNskeeu7VkoXDbGu1USA36t+KAdE20jCa/5fn89v7oikEYwJqSAnhg?=
 =?us-ascii?Q?u2/afIsg7NPY1B2HgME1nEuCv39QRYnYs9GOF+K6AroCw6Kvv//2ufcd8S1F?=
 =?us-ascii?Q?ppSlosfzOsVlmNkNzTrG/Lk9+51x46JMauh9BP8MmJsCLJ7GWL/DHAWgZ+QT?=
 =?us-ascii?Q?uSalU8Td4DNAiDmCZtFUz+pFcSPIPxYl0K/BP+ykMXS0gE5MMV065Ag3HSXU?=
 =?us-ascii?Q?tc086uYQfcRLkibyZ3q3rsIVtMHFqM9zM+9WJugzkd3ft2xt++/aPTU01hJY?=
 =?us-ascii?Q?Jd5zW/3Xi37JKqSgoMhRI7laYk609wfMAaV2L09L87UhJqI4mO/IfvQGf58P?=
 =?us-ascii?Q?FKnqGMp1AcRnQfDpR+/VKMvXs18pKv29/lmRpr3ku4YGAY3AISmIKnWdL1iz?=
 =?us-ascii?Q?MPMPLjanHDnXILw+A4KejqTzZ9DKwPELL4MNZya4UAdTIaTzzFEvlVCbRfVU?=
 =?us-ascii?Q?/OB/Rx2gZT/BcvRdrWgr6f/0mnpubsPILqpbEA9DtQ056b2a9bg82i2JIw/l?=
 =?us-ascii?Q?bSdosZRw7MWRChrTMb/Yj0pDntC3S2Thftnb1ylz0FbXIpvfu9MWkdAz+4VT?=
 =?us-ascii?Q?S797RzEtze9YqmFIuMTM7qKDyoYdJLBtxPmAdsz8MzjAwJbeFNeu8lGzYV3T?=
 =?us-ascii?Q?7glg89qac5C3UwXYgxv5zqYe5Ai9rbrrltvzaRV3c180rctemdy6poxZA1DU?=
 =?us-ascii?Q?aN0AuVKgA5B+XnnqTAi2jfcEunFNVxQTG6kdST319eYN774BwflMKn9dsllL?=
 =?us-ascii?Q?OOtc+xDOnnWrPR7DTGfg5SdzEB3oam5qGyw7KkbP1odNfJxesfGspUoq+hKO?=
 =?us-ascii?Q?fE0O8IC+d9ZJbL2S/ZqxBjERnkXiuq0nUz52uvgyCTmkQIrAJVM5d9sGPSOC?=
 =?us-ascii?Q?DV4pMfBYNRDayv3jSfhoqVLc5XguTTTa5uJbR2PBIOJ8Fofu/qm8POOMAQ4r?=
 =?us-ascii?Q?hkzKHA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CY8PR11MB686573E13DDFBDD039779E1BA8292CY8PR11MB6865namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ad9fcf-41c3-4067-8230-08dd0fd101e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 17:20:51.0196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJqhJv+a46Ex3OswvidCfouzz6ys3tlZI1PehBCI0d1iJQJ2qoUlGt54w4Ld6U3QzAvnmwPnLBzwOP/CfPBRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
X-OriginatorOrg: intel.com

--_000_CY8PR11MB686573E13DDFBDD039779E1BA8292CY8PR11MB6865namp_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

@Chen, Kuan-chen<mailto:kuan-chen.chen@intel.com>
@Damary, Guy<mailto:guy.damary@intel.com>

Thanks,
Golan
________________________________
From: Korenblit, Miriam Rachel <miriam.rachel.korenblit@intel.com>
Sent: Thursday, November 28, 2024 7:12:38 PM
To: linux-firmware@kernel.org <linux-firmware@kernel.org>
Cc: kyle@infradead.org <kyle@infradead.org>; jwboyer@kernel.org <jwboyer@ke=
rnel.org>; Hutchings, Ben <ben@decadent.org.uk>; Ben Ami, Golan <golan.ben.=
ami@intel.com>; Yang, You-Sheng <vicamo.yang@canonical.com>; linux-firmware=
@kernel.org <linux-firmware@kernel.org>; Berg, Johannes <johannes.berg@inte=
l.com>
Subject: pull request: iwlwifi firmware updates 2024-11-28


Hi,



This contains some new firmwares for Bz-gf device.



Please pull or let me know if there are any issues.



--

Thanks,

Miri



The following changes since commit 7c3031c18ab851792c49f594a4d43200d55a7943:



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
---------------------------------------------------------------------
A member of the Intel Corporation group of companies

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_CY8PR11MB686573E13DDFBDD039779E1BA8292CY8PR11MB6865namp_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
</head>
<body>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr"><a rel=3D"noreferrer noopener" id=3D"OWAAM342160" href=3D"=
mailto:kuan-chen.chen@intel.com">@Chen, Kuan-chen</a></div>
<div dir=3D"ltr"><a rel=3D"noreferrer noopener" id=3D"OWAAM538213" href=3D"=
mailto:guy.damary@intel.com">@Damary, Guy</a></div>
</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
<div dir=3D"ltr">
<div dir=3D"ltr">Thanks,</div>
<div dir=3D"ltr">Golan</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Korenblit, Miriam Rac=
hel &lt;miriam.rachel.korenblit@intel.com&gt;<br>
<b>Sent:</b> Thursday, November 28, 2024 7:12:38 PM<br>
<b>To:</b> linux-firmware@kernel.org &lt;linux-firmware@kernel.org&gt;<br>
<b>Cc:</b> kyle@infradead.org &lt;kyle@infradead.org&gt;; jwboyer@kernel.or=
g &lt;jwboyer@kernel.org&gt;; Hutchings, Ben &lt;ben@decadent.org.uk&gt;; B=
en Ami, Golan &lt;golan.ben.ami@intel.com&gt;; Yang, You-Sheng &lt;vicamo.y=
ang@canonical.com&gt;; linux-firmware@kernel.org &lt;linux-firmware@kernel.=
org&gt;;
 Berg, Johannes &lt;johannes.berg@intel.com&gt;<br>
<b>Subject:</b> pull request: iwlwifi firmware updates 2024-11-28</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Aptos}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#467886;
	text-decoration:underline}
span.x_EmailStyle17
	{font-family:"Aptos",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:11.0pt}
@page WordSection1
	{margin:72.0pt 72.0pt 72.0pt 72.0pt}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"en-IL" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:b=
reak-word">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">Hi,</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">This contains some new firmwa=
res for Bz-gf device.</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">Please pull or let me know if=
 there are any issues.</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">--</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">Thanks,</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">Miri</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">The following changes since c=
ommit 7c3031c18ab851792c49f594a4d43200d55a7943:&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;Merge branch 'rob=
ot/pr-0-1732634796' into 'main' (2024-11-26 16:12:19 +0000)&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">are available in the Git repo=
sitory at:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;<a href=3D"http:/=
/git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git">http:/=
/git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git</a> tag=
s/iwlwifi-fw-2024-11-28</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">for you to fetch changes up t=
o 42b01d49689c754438c7b9c32aadfa722da98429:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;iwlwifi: add Bz-g=
f FW for core89-91 release (2024-11-28 19:08:21 +0200)&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">-----------------------------=
-----------------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">core89 bz-gf&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">-----------------------------=
-----------------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">Miri Korenblit (1):&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;iwlwifi: add Bz-gf FW for core89-91 release&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;WHENCE&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +++&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;iwlwifi-bz-b0-gf-a0-92.=
ucode | Bin 0 -&gt; 1757392 bytes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;iwlwifi-bz-b0-gf-a0.pnv=
m&nbsp;&nbsp;&nbsp;&nbsp; | Bin 55192 -&gt; 55192 bytes&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;3 files changed, 3 inse=
rtions(+)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
<p class=3D"x_MsoNormal"><span lang=3D"en-IL">&nbsp;create mode 100644 iwlw=
ifi-bz-b0-gf-a0-92.ucode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></p>
</div>
</div>
<p>---------------------------------------------------------------------<br>
A member of the Intel Corporation group of companies</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_CY8PR11MB686573E13DDFBDD039779E1BA8292CY8PR11MB6865namp_--

