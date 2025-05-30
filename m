Return-Path: <SRS0=RJfD=YO=intel.com=bingbu.cao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DF4C54FB3
	for <linux-firmware@archiver.kernel.org>; Fri, 30 May 2025 02:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C9D4C4CEE7; Fri, 30 May 2025 02:20:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52E4AC4CEEA
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 02:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52E4AC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748571609; x=1780107609;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DUgM8/523TIDNOu4ssy8fyn7H7Ds1ACv03s3t+kvU3Y=;
  b=eGLHZoFdkDGmvj4dFi/hnAFlbwsSMCgVSePd8cUURM6k4QN3gdO/hfFg
   0IBL6RFKdlv/w0qwfRJCs+KgAE7+skWFAbQ+wJ62aRw1Gv6iHk7YuNort
   ImQvDNxSLKFzvITTHROnusNC6fW4cFTXIj40Nc1spfXqna23+pIoxQn4M
   PILHn19v6sKCQek+0CjpidPCYmReQ2XJO7YBMS/kAtZWXo6/q6bG9w86t
   89R3NrfweFAyZSirTbInrUjmLNSRCZyLYwWe9Wq383GQ1RGxg+EExxi7k
   BsMWQWas2UhaNpFQ/PxyWn+ePP6AOOCwU7pY2DodVqqC+8WBN1ZDezfxh
   g==;
X-CSE-ConnectionGUID: XWYsaX8LQVyDwX7bdUd30w==
X-CSE-MsgGUID: O9CZhD2DQU+hOwcKDO9MgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61322083"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="61322083"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 19:20:08 -0700
X-CSE-ConnectionGUID: AevZh6rWTnS08RrEyuvQVg==
X-CSE-MsgGUID: E6MPZa+dSiiDbOQnxbRuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="148606117"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 19:20:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 19:20:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 19:20:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.50)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 19:20:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWFxhYH2rN5fVGissXnYaNSDjPNtR+a1hFaOBZup4zG3GbzJ4/FyOsyJGN5s/r7NRu+n7f6XhYrbLCHZUBuXmUq9qyItdwe7NmsDnHoGhcVYOze/3waHoiIrNU8RDZ4Ds+Cn1Akrh9HilQKq0165/gUi7mmuIqWsGAccgMnAmlocxusppQxtIc0DYx6WnHst80PS9rvmLPYsLqBpobpU+nyxTfWHmX5zSC16O9iUMpew/xr2sdWvSKuyX7SrySk4G4WmuXM8pWRrJl+hawY8d17kF63LyQgkf7qPI7d/+pnbqtIZPzmySXszCwOLC3Yux5kB/087fIFtPeAnrHAabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwH0ksfZAPwTqI/Sf2KOc3VDABllpUxgx1bdBKkAzZ0=;
 b=aGLHXP2tBrOzRvRB8jAbQj/6AZJZqA9YI+nGnlkEANcxbY5b4iQ2Vf04Gr1FlJsHwA6W+KDvZqXqT6bPjiJ2eJhv0bez7SP2tuJwTjMoBVmBlkURnKCXWfi/g4ocOJGKIgMkwW+C3vxmDDuYB1A3r6ZjENdrMXWNU3zo3QLLg/oSFvKl2nFPcRllVCI9X2H1VFZsEDB1p9VM7867mU4ido3XWGTxqeyNNiJ89mOYB9/mFyf2k+Vj6aoOmZiEp6F1XI1fENwIkSIXKTYpInspw7D8poOd5Qp6WdcJYiEevCiS4PImc9wMTuG5lQhmGMr9nMyyDKIKjYbwrKQ89OhqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 02:20:05 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%7]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 02:20:05 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"stanislaw.gruszka@linux.intel.com" <stanislaw.gruszka@linux.intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: RE: [PATCH] Intel IPU7: Add firmware binary files
Thread-Topic: [PATCH] Intel IPU7: Add firmware binary files
Thread-Index: AQHb0JQTMCr+cU0DlUaz2GmM8484vLPqb/YA
Date: Fri, 30 May 2025 02:20:05 +0000
Message-ID: <DM8PR11MB56538C893A8C9C60AEE30A469961A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20250529041531.3037707-1-bingbu.cao@intel.com>
 <aDhRErmxVKpv0QKq@kekkonen.localdomain>
In-Reply-To: <aDhRErmxVKpv0QKq@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|PH0PR11MB5126:EE_
x-ms-office365-filtering-correlation-id: d9524db8-ab41-4b4a-d749-08dd9f207df9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rO/3oAgR7AgmgRn6IiI7rdMbhxGLtR6BIwBP52iXIOywgMScstvhwZIX7kB2?=
 =?us-ascii?Q?lxCoAbCXcjvstU6lCxZ+A3CU5cfmjXgpkeaR3ridSc+H9iipXH1vfdptbOF1?=
 =?us-ascii?Q?DJgqHDA54fVQsZ4E2t9r9s0JfnrphPg2owXiO52MX8Y3D0Tb7BV0QVrdAxrh?=
 =?us-ascii?Q?5m7A5ubY+Ulw5dtxhB3m/CF8RiUghQ/ziUamQ8Ma8+DOs5PBITCiJA5aTP0n?=
 =?us-ascii?Q?eu5Vu5/YZypKJRwyTvfJrwBdZIZAtFD+HSK15Tfj3L3tqore/QnY9pHkY12g?=
 =?us-ascii?Q?BJRGb6Ty+9kvD+BR1MUcTei8zZQA4xVdxIoem0Dl4XFPjGcybtSojP8o6dfn?=
 =?us-ascii?Q?b1DWolvcm6y+QfL7JGNBv+40Kq5XoAD0DPWdK+OwJ3p3LhOpghJiCYJTPKl2?=
 =?us-ascii?Q?WDFqRL3oZU9MggnLqzhShFpRYr07IBMo2685wUKkkJxBcnYzEV4F9ygUQ217?=
 =?us-ascii?Q?Bc9kZsKDpVLHDcRwNx5GYzpyCo4Iqg+gHKHLyIIZJmjsZGy5CTTkwBs0qpWZ?=
 =?us-ascii?Q?z9uVFB43Wu7iMHBVAIIzXLWlEL1L7hJQALC+cSN5kJ5rDZc5+sNdP4bJkLss?=
 =?us-ascii?Q?oTAhLgYxLDBde5VlPuviU1lT8UWLfsiKdZRGmnTmT7bGinEU3uGpk6u+jJ7q?=
 =?us-ascii?Q?cdAApHqfqYBvzjGMJU0rWJkJOPmQkhopXS8lYwVssnparWizW/9hdWPHqDn8?=
 =?us-ascii?Q?CZ3Q7dMdKZq3vMxzNMFEQ9LRf92zBPioJj9BVvZ+7JMpKnhjZ5an+YZhpl11?=
 =?us-ascii?Q?7Pc7fMiolutTP0/K44/xVAFdOARHWiPjPkxPsukkDz7eg08x44UREItqo0u4?=
 =?us-ascii?Q?H7TOqAL0IpVaPidgJ+JZp6H+VD5JHBnu6gwByez/8lLWtMF33RsYzgqLnOE5?=
 =?us-ascii?Q?JKt5T8ueoHjZKDU4QdPev2wDdZyhcbqjXN/vqk8XaSZNxAbkVKBI4SSXVKQi?=
 =?us-ascii?Q?aJV1L4WN3mSuyRbnla+VajO5wGK4lXZKAqd5BqLj8aMLmW1CegAnKN+1/itr?=
 =?us-ascii?Q?+lVofcwTzl6rZqezpnEe9CNGuiJsiifYttQjIc5TBy3AdCnwvtzOimIqj7Xx?=
 =?us-ascii?Q?M39hYdWdqSLNubYFPP9ONirOEVQdXz2L7qf/R0ip0QMhqBWG6KDh1LETz4/6?=
 =?us-ascii?Q?MK+YA03oMkaNxWiAIsN4u+5CeNqlmISniZv9HsPUK896KK3nRl4NqJcfLV1E?=
 =?us-ascii?Q?TyPM/MUEkCULYOcdNi6usv/fXAgUmDJ2Ge7VwSWomfBUdO/5R3C5VWGhOUJJ?=
 =?us-ascii?Q?sTC65xH8dB6d2YirQZSeyOhc8Ftbof+xu/qvK0Zpz+05DfYvaHWmmz988pPG?=
 =?us-ascii?Q?oVIwxAipN9Muj2qhka8SeFzd4G4xujlAKyw48fG6XBB/VQqTAHbCzeZfzdMT?=
 =?us-ascii?Q?ZQPQhTLHQuGuesyH/k1EFKBSwlTE4hjW9VIvpjRWgwt6gnH8HjIrqKmC0tjJ?=
 =?us-ascii?Q?my48f0/PUZJZnu3M2Ne6C+ycLFu8NnKP0bIJUp4Hc3xRcgQ+fkwdYpPF+E0p?=
 =?us-ascii?Q?ZAtUL7Lr00uT/GM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kQOTpwed00T1Mpet4P/MAwULyemUSB+hd/gngJ9djhZxAFBELuIO34buzjKd?=
 =?us-ascii?Q?rFQeco0/EM3hupA41wIXfaN02oPgeNFoasi6t2rFssBiNWPzR3XWj+6j6XDa?=
 =?us-ascii?Q?2hjn7yyL4kLho8opuAQxOicL9eC9AutNEkwpI+jbffqtSK2PphX61A/GMBJz?=
 =?us-ascii?Q?t5rDW3JqegHqRGIrn2nwelaOp4gfwcs6auVK7nKbltr5lJEBXfb+jUoP+fbV?=
 =?us-ascii?Q?3TTbDxVIVXDljAtw2+E2HXffhoeHI2hFNQoFR8xp8esnt5DuvB9leuFMQoF6?=
 =?us-ascii?Q?QA8X7MVCwIIBL1Q4bHDbXhwRuzrbmq2bK6iQPOWrh5AhIuio+nZnGnciJj9o?=
 =?us-ascii?Q?CjuYsz/neS2iZ9OQ0dUOvYMLT4j7hLxCfcV4Rj/unSyTuyvSfwV4Ni/1L6/a?=
 =?us-ascii?Q?j0xi4fBLnRlDgZlrxUePXnD35Zf3A29Mt/gx7GXQiM1vJibkbVRNzXDzs88/?=
 =?us-ascii?Q?+fytA7ouFcOCuctfsrCfxSDWSWNU3OzrIXl+ZvtqNrb56GzX6c2vdfSvGAiZ?=
 =?us-ascii?Q?YMILBUTEw3Xwx7bb/bSohawG4rmCkK9jS/MrTQRiCDr0oedqtaJKsFXGro2e?=
 =?us-ascii?Q?CNMSo4t2nmubqUv4xddB1s80rnfLksY/SOHOLwv9ef3Oh2ujSNAgXkAy6Xj4?=
 =?us-ascii?Q?bIIgYB+VwjWAfd9DqM7lrobj0Lvt4ioFEcZIoe+yDy8IBtqxdW7AAuwd3w+N?=
 =?us-ascii?Q?W7f21DklNVa2ju5rvkMZIZeIU8jP8PxjvvAox6dwqDEGTIKJamWkTlm45Tw9?=
 =?us-ascii?Q?ZEuYiCrtGm80jakpfFTg5QYIn6Ma3Tb+RIY5nMJrXBvUr/GhLUBz5t4NNtSB?=
 =?us-ascii?Q?9VD0zMDchgKddO1djIoJSI2P/m2jOfR1Pr69IdEZ9d0PJBQ6P6Et1v2TaYcp?=
 =?us-ascii?Q?KIVoI00dAExl6H9SUbK3JEo6MZoAk3wvEcvtd7FvCWhqTZ2KxUBODmGEtZ1P?=
 =?us-ascii?Q?K9YPJ1drCThvt2J3kDzad3/PTSk+PIhXD9VHkgjbkt8ltr3fIlZLCchn8Nus?=
 =?us-ascii?Q?dJHFE7PRB+6T++eJvZsaBD67ug1x4BfKo5bLtKn691uYy7ZoCHZQemZAKYu6?=
 =?us-ascii?Q?S6mgytLxf5UnHpQm/hvs2WNw+STO2uY0mnC+UWopJUR6aEc58NMZ2YHFPcLW?=
 =?us-ascii?Q?1GIkt5H2vmLEGfUpdR8AQpEVAg9wmw3AEW6yO743I8cm5mmx84WbgZDFmsdP?=
 =?us-ascii?Q?/yR+3c6YknIfHfV0qP7/ASWYBAXjA0SByUbhQZmolQ0baSwNZwMb+0TxmlJR?=
 =?us-ascii?Q?q0i1dqBEkl+MrzrzjonvzyPEqdwNp2aezrGjhPWhCqDd+nWTjS5yW1W/FQy9?=
 =?us-ascii?Q?4BS+hxl3TLmPlHtRCQCDOdktcZcSaNV/C+gf7PtR2T26DpqblVRUA7W6y10h?=
 =?us-ascii?Q?2BhB70QJqhWt4eLqpYMezd/8xu0xw//XzwgqWxo0+MlbJxHFXCmcZFZSovoB?=
 =?us-ascii?Q?TO3E5Sjndo2eaZJa5zy7AYha3cyJKArajD725GIHIHbszKUwXuXDL1+wAL35?=
 =?us-ascii?Q?CNW9a4XBtMX/rs49sEPZZbtvojLFpBScZeoEx7uWBxAqyW5/iBoTC/rPiAbE?=
 =?us-ascii?Q?QG7TiQRpxmlmdT1/mIzwKwr3AOGIrbcx1LRphnS5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9524db8-ab41-4b4a-d749-08dd9f207df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 02:20:05.7604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DY/rUGTWSX2bHl/kQuurk+BZDrQ4OEQtbaZzyJlCiHTq/p9JCpuY2OOCTQgZjhGXYqKdwQv0fcDj+b36bz6U+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: intel.com

Sakari,

How to submit a pull request, 'git request-pull' ?

------------------------------------------------------------------------
BRs, =20
Bingbu Cao

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Thursday, May 29, 2025 8:21 PM
>To: Cao, Bingbu <bingbu.cao@intel.com>
>Cc: linux-firmware@kernel.org; stanislaw.gruszka@linux.intel.com; Yao,
>Hao <hao.yao@intel.com>
>Subject: Re: [PATCH] Intel IPU7: Add firmware binary files
>
>Hi Bingbu,
>
>Thanks for the patch.
>
>On Thu, May 29, 2025 at 12:15:31PM +0800, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Add firmware binary files for Intel IPU7, they are for two
>different
>> variants of IPU7.
>
>Please see README.md on how to submit firmware files to linux-
>firmware. One option is a pull request.
>
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  WHENCE                   |  11 +++++++++++
>>  intel/ipu/ipu7_fw.bin    | Bin 0 -> 266240 bytes
>>  intel/ipu/ipu7ptl_fw.bin | Bin 0 -> 266240 bytes
>>  ipu7ptl_fw.bin           | Bin 0 -> 266240 bytes
>
>Why is this file located here?
>
>>  4 files changed, 11 insertions(+)
>>  create mode 100644 intel/ipu/ipu7_fw.bin  create mode 100644
>> intel/ipu/ipu7ptl_fw.bin  create mode 100644 ipu7ptl_fw.bin
>>
>> diff --git a/WHENCE b/WHENCE
>> index d17b2c41174d..d699bc6a9917 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -1287,6 +1287,17 @@ Licence: Redistributable. See LICENSE.ivsc
>for
>> details
>>
>>
>> -------------------------------------------------------------------
>---
>> ----
>>
>> +Driver: intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7)
>driver
>> +
>> +File: intel/ipu/ipu7_fw.bin
>> +Version: master_release_
>
>I think you're missing the release number here.
>
>> +
>> +File: intel/ipu/ipu7ptl_fw.bin
>> +Version: master_release_20250515_1232
>> +
>> +Licence: Redistributable. See LICENSE.intel for details
>> +
>> +------------------------------------------------------------------
>---
>> +-----
>>  Driver: mei-vsc-hw - Intel Visual Sensing Controller
>>
>>  File: intel/vsc/ivsc_fw.bin
>
>--
>Regards,
>
>Sakari Ailus
